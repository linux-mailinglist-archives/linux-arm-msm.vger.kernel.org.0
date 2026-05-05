Return-Path: <linux-arm-msm+bounces-105983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Fb+QDJ78+WleFwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 16:20:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D424CF419
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 16:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A566300AC3F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 14:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CBD2F0661;
	Tue,  5 May 2026 14:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="Br9qflOo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11EC44BC93
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 14:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990810; cv=pass; b=tT207WMSUvWKPQn9OZESKLYy++hHmBJE40fPJ7rsMohLNkBhMSDN8XJugz3A1Sznc6VSPvEr1NQUtamf91EX4Y5C14S/agWpAkiWVsFBhFuZVm1F9vBSeWTXC3HWe4+lLjEqq3o4adMUTW35V1x3ZMEhmw2nCMQk6LDJiTAHolk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990810; c=relaxed/simple;
	bh=ChyoarYNml6Xd8oWHPc66ogwgww3Zb1C5cukHDM5eVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gEyZSV15rrT1lJLzmg1GYzav1ty0mKblnpbgoecg+E2KA+uaG1GKdPBh0g3J5w55Ed5bet8ctI2gQTAw63YDREMqgvCsTc7UGSexAcrYNrfj+RNe6+sJGzGG53lJ1CLSfZtcK7fQCi3MRgIMhSZrJ7YDoGUurlBMR7E+xj/YCSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=Br9qflOo; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a87782588cso2670964e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 07:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777990807; cv=none;
        d=google.com; s=arc-20240605;
        b=bSQiE5gJSF5hisUCcZB1xOIsTsEeFvoE1dnlesDYtXk+mpWzShCFHqbW08YO9szIvp
         OsbeqR+dXWL4hF+e/XF+Gj+R4fxZ/hYAENdYqPEoD1PegZR4lbFGa4NS9PNJrNMuPHKU
         LJwVIKRLGs5oJVTJxdodwTWDV2c6Vj2vTSblTnvntECaVgKJJlMn/8xxPZ6OSNEktfZI
         zuE707XnU2WwvHPU6Cicfk9BGvyV8Op4yCyVVdTUjeOLIpJufGfLC0t8akO9OC1M9+gb
         lEMMAcTLhIR4M6JpvvgCCXwKH1JV7bwX/N/XEob4RipC69DtzCy354lz717eZrBYc41r
         DIsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vh8m0B9MgA5fRoS19D8lLgMin3oijQepyIo3JhQlmkA=;
        fh=Ldn7rsrtD5ewPtwkkNaqHfJQPaOecQgsTQK4AffEv64=;
        b=UUcDAbNYiCfz6tEAnaRU+ayxDm15J3Z05QLJ+K2o/ySzrqXX7BQysM3EAO3IeUKSLT
         NYPgjr+EAMmhVNwYjcBtCO6Sh897lhOcsOyiVFFWGy/Wo0+gkVFcKferHsP85ftcQR/j
         LNlLN8pRPIpS51xll7nzaKW8nPov7jNEUui7yNqK3++h8qKh6wGYtA8KO+WINRSvkqLe
         z4cLrNWwHxBI6hJQFnPxVaWzY4ghwpCyVEEosyQvZf7aAvFJ/CiJhBIfp0TstCKl2PXz
         WZWj/KIyZM3ho2ivR6ZeDXJ+ehLBg9HRCIHZy+07vxNMN6u7QdvZXptNowuP7+1rl7oD
         ZBIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1777990807; x=1778595607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh8m0B9MgA5fRoS19D8lLgMin3oijQepyIo3JhQlmkA=;
        b=Br9qflOoswHibnoOG+TnewUu0+IGSfTQC0EWEOAr8EVus+VrhvJhME7QhOto7zfn3F
         kweQ7aa2LqyaKEzQiH0hLHDTy3GX0R2Eh+5qZuuRDQogCUHDwLRH/jS4d6N6ImAeypOS
         xAmJ21HuIxxtEsTDnQvNaNIBFExD9wlVGgAlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777990807; x=1778595607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vh8m0B9MgA5fRoS19D8lLgMin3oijQepyIo3JhQlmkA=;
        b=FUUyaEw7ug3EnF89ugYjI1nUyZ8vGecqNU7DT4x6WQm6FoiljnqYcieE3SGCyTYWj4
         sZ1tH/L8morQ2uq5zuDr4wyryfMAYzVUeAyHRDXnu4nD3YBSA6qtescouheZY5vKncv1
         Mszcok6i93j/gz6aMFByEQublA95dm1fDdHKxF7l1VwCBpaI5ZfmU23s/RCDJSRm5dqX
         XV9tWXVjlaRZ0vxXdi9pcqAR9NvnlbPbfkFlm+iEJztZey3Yfnv3zvzjfrtZsm7O6xuB
         Q681PVNo0TdenkXvt/BFoEN9aN4QHVtpd6wvyLXioLorzRX42JWUgs1xEXK6b2odGXlg
         nPVA==
X-Forwarded-Encrypted: i=1; AFNElJ9j1J8qyqecU+rruQkIKE6Q4AEKQpZQ0mp0NfWHDlq1QT5o6RboJn2Tsza0+eQ3f+QfWAPRamvD22Uz+2Zb@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn3nA1ofDs/AEMg0vzUlYZD41NwKvMhWU8izRdDrCmslJmPyio
	Uj/Pmn/5CMQSLezY32K0PqeHA4eV6jlCwpvSK49hbgbniXB/rLsV8QDXNS6/6S9KFbyuuZefhUF
	PttiUnQ9z6Hqb/SuicN7IAr2FViPIr4jbd4I7KNmS4Q==
X-Gm-Gg: AeBDieuMe30EkeXSmvpQq33iP+A3grdpZ9/RkFPxzAZpukI/y9vJyGq5N6BPF0Op1ke
	vxZgW/qL1N6OEyqdN9WxV3lZtYqMValaC0z+QtpqIQC7KwFHvJoY1Jn5o+usHvnlbalcyRnIwlK
	eIo0brv/T0L+Ja1QHj2rXWip5R+9WjI76/08Uo4AFAqGX9td4703AUej8rWQHiyCE/CtrvWD27m
	9z/RvMBArvD9pbGYkLR6zEiyKuGril08Cv+4FROqPEAyVPfUaR7f2WDGjSRoB//QhWWXCVCdMd5
	OngLzXJclycu8Y9ZGPnBqKSXuaG39g==
X-Received: by 2002:a05:6512:2301:b0:5a8:750c:2f79 with SMTP id
 2adb3069b0e04-5a8750c311amr3197990e87.3.1777990806894; Tue, 05 May 2026
 07:20:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
 <20260430132140.30369-4-r.mereu.kernel@arduino.cc> <6e46514e-91de-4d1c-8eb0-d1688e0a3821@oss.qualcomm.com>
In-Reply-To: <6e46514e-91de-4d1c-8eb0-d1688e0a3821@oss.qualcomm.com>
From: Riccardo Mereu Linux Kernel <r.mereu.kernel@arduino.cc>
Date: Tue, 5 May 2026 16:19:55 +0200
X-Gm-Features: AVHnY4Ly1akqLwjBLxTf-Z_CJJjy9OcQWTWkDUXFiYZUdxwPPlqgokETeSK1n84
Message-ID: <CAKA1JhZzsB0HH_szK74ii+wVkAzNG=a8B6ceT9mrwbxV1d9=ww@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: imola: add support for media
 carrier board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org, 
	linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net, 
	naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com, 
	chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev, 
	m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com, 
	loic.poulain@oss.qualcomm.com, Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 90D424CF419
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arduino.cc,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[arduino.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105983-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[kernel.org,roeck-us.net,huawei.com,yeah.net,9elements.com,amd.com,analog.com,gmail.com,linux.ibm.com,vger.kernel.org,lists.linux.dev,arduino.cc,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r.mereu.kernel@arduino.cc,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[arduino.cc:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]

On Thu, Apr 30, 2026 at 4:11=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/30/26 3:21 PM, Riccardo Mereu wrote:
> > From: Riccardo Mereu <r.mereu@arduino.cc>
> >
> > Media Carrier is an expansion board for Arduino UNO Q.
> > It adds two CSI connector, one DSI connector, 3 jack connectors for
> > headphones, earphone and lineout and 4 RGB LEDs.
> >
> > Current devicetree overlays support:
> >  - imx219 based cameras (both with 4 lanes and 2 lanes)
> >  - Waveshare 5" and 8" touch A DSI displays.
> >
> > As can be noticed DTBOs are split and no overlay is performed in the
> > Makefile. Overlaying is handled in user-space guiding users to configur=
e
> > the system matching what it is connected to the Media Carrier.
> >
> > Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile             |   8 ++
> >  ...rrier-media-camera-imx219-csi0-2lanes.dtso |  49 +++++++
> >  ...rrier-media-camera-imx219-csi0-4lanes.dtso |  49 +++++++
> >  ...rrier-media-camera-imx219-csi1-2lanes.dtso |  49 +++++++
> >  ...rrier-media-camera-imx219-csi1-4lanes.dtso |  49 +++++++
>
> Are the 2ln DTs actually useful in practice?

Yes, all the cases are covered for the supported camera since
inexperienced users are guided in the configuration of cameras
without the need to perform overlays or write their own DTSO.
This is done via a GUI soon to be released.
That's why I covered all the possible cases for camera connection.

> >  ...10-arduino-imola-carrier-media-common.dtsi |  46 ++++++
> >  ...a-carrier-media-panel-5in_touch_a-dsi.dtso |  80 +++++++++++
> >  ...a-carrier-media-panel-8in_touch_a-dsi.dtso |  80 +++++++++++
>
> The waveshare,dsi-touch-gpio compatible is absent upstream and I
> would imagine it'll take a considerable amount of time for that to
> change, let's focus on the other bits for now

Ok, I was hoping that mentioning dependencies in the cover letter
would suffice. I'll drop panels DTSOs in V2.

Best regards,
Riccardo

