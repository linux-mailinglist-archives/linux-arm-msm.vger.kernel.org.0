Return-Path: <linux-arm-msm+bounces-100625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPmbDuxWyWkuxgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:44:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F953531BD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72B7F3043F98
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 16:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094A538425B;
	Sun, 29 Mar 2026 16:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GXDPCQ4V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C18238759A
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774802137; cv=pass; b=unoXu4/uXTQEi1hbAeH1gVstzsOzI/Py2z/Yoxx/jYps3jOHCjqTHjrUL9PqiucIZXlscHhNQKOU6BuR5a/X2HaBo2QU4yhUdPczs/f5QYmHCONtF9t1Ew/jUtj00l4p4seU8pzEGGaxgEbo3njngp3e7Sj//my9G5+/gY9svcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774802137; c=relaxed/simple;
	bh=AwmOeeu/JmzLDdakR0wt2q4m4lXBk3xF7fPnNLSdra0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gCV36vdnX7DnX9ONWWvUB4NbpKbAsZe5Vxg1jfVqJx2chryd9Trwav7gE2v5XYTJLBQRh3bZtmI4yuEqilQKDK8k14hrduwVcuG15Fkt9qocXB/KpuC+ycXrknyik4gVOwxshy8ITLEfmWkJ2cY8Ajdp8TKakIuQ50G3y+hvdhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GXDPCQ4V; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48374014a77so43608175e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 09:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774802135; cv=none;
        d=google.com; s=arc-20240605;
        b=YFV6ioKcDebGiw8pdOCiAQvciOh58enJgt+eoWMekMGe4ZAoCdVl9QJqX9xSK7pro+
         JBXKIF55uIr+Db8BHjrRRswYsGjhOE/NctktVzoQsEC6vOsbmD5+9oej3jO/11aIKtnD
         B50akjtTN23Rx0Rsi1DBPd8407x1sWctP/aLVFZkOhhQmyAVmsIHLNou7hzMm3JZXmXT
         00kKYrXPna+8AunUGjNJ1B4NFVYZzDBPgfdiuK482IGWyDBPmGgi8PlODM2YWzd2lOX/
         A1RUjIvEhT/kdOMPEWawGSlQB6ujj3Ytvy1PIVNpw3rlbUpXskRC7EBIcybm/YtGyx1g
         aohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=da25ravMGgwQwjA1hIuy9pgwIwzh3H66SkKFoW/X5Zk=;
        fh=vD7TC6g4UfXlhFF+FWouL6X/ZgrUcqzp/KsmBjqt9vE=;
        b=E+a/c613y/Yi11kbivnSHEgh5QtEHGxSbkQ1UzdPBE/SHfm6Sg7Xy9G70phQyNJT2s
         /HqcIWgZmNqvM16NClWcrpAeG8uoOM4gxYlUrtlnmk9Pu8oYJjEBZeVIqepIeTX+OJDi
         uYwr8/Vh55k3/yRb5xCYIX4nUDVFTJW6RfY2Tch5nm5+v8mWS6Nw4mk6NwlYwA20qWwU
         v4NM5lrpKsJpfMl2ZY8OI+w/LGwZGHGLgB7gqMGgiipY9nzUDrnqmEqFDHpviGP1d7Gu
         qKglQcaRJcCOkEElaCIhziQiiHLMt+GQJ9hpgK/j1hnJjBA5OTJI4sx6i+JuBSpvUGA7
         ubpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774802135; x=1775406935; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=da25ravMGgwQwjA1hIuy9pgwIwzh3H66SkKFoW/X5Zk=;
        b=GXDPCQ4VeAxTmcjBmtigfBmt2kmR1VRXQGT7HGZL55iblM0JwMqeYN096xNz1WlgDm
         sLBZ4GqEGeNhRNQQeZnpqmuiDreI3kcV8/RdSDrvuKFftFDeGVen6dxYc2hDTh7q+dxD
         f0a2YHA1FzNbw+81vh1ViM/uw/E/nLih82sKEBcCKK4qCCVJF2KqX+l6FP6oqlRf62EE
         Pdrr6XxnxC/vd7NF91VcsWDEbodoWiw8T0cxvNux2LLASCt37AhNyX8i/aEkMgy2FGMo
         xCvGyMdZ1l6Lqx8VBH9E9591OUI9RSWY3ylgCYpw9YwSodjY6qN/6aUNoHn9/qS36Xpw
         ZWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774802135; x=1775406935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=da25ravMGgwQwjA1hIuy9pgwIwzh3H66SkKFoW/X5Zk=;
        b=svzrBgII3RY88var8C8PQFBZ1r5/uJ9EGDxAkGcYW0qMsbpC+LdohBYIMV3lOA8iCT
         +iXhkny9Rtj1kpHJJK+KP4lYdauNa5Fi1IFghqwu3vQg2orcqXHxzW3MSTfePaGknHjX
         qeLhhtXoQRcvkVji8KUzd7kwOJaSXdyIHOClMo+X6Dk09+7k97FnSFeJzMSghm26aKiM
         U91ptpi961oyNIQU4vfTRwqAcL6mnd961tzixXGveNteJ05bJXosKXArYiP3ax7CrxBv
         Hcyqm4R4Xiy5Z0NSxvV9jqc4Fo3aZ6UiIVKrUDKv1YacSU9FJrUu/3/5gQmc0OV4RDDl
         yhuA==
X-Forwarded-Encrypted: i=1; AJvYcCW5MSsb2aOYMlRVwMsVkU+xoP+krAFYw10CqTCkvpXfZ7Haimr0r+t17PfRWh0GKozr3hYIvPSJq0+4bx1w@vger.kernel.org
X-Gm-Message-State: AOJu0YxwlZZfEYIPc9oQ900utrylYdGNwydfYUgaTK+6QcCvw1cSIrpr
	KSUABJrj4C93WXnKPa610r1qCH752ene6QuTwtqrT7RQgAAXlIsy65FX8HSNZXzEtpV9BqGh+S6
	3HAZWjhTf5wP+XqElzcygZtQ21/AV+wC9oPzaEegzzQ==
X-Gm-Gg: ATEYQzyMNgf20tfRS+tuKp5q5/NUxtUvq3cAxwN9Lx/hIPGRo5K0WSXyU6SAs02Fg74
	YkiC+i23PPNw3ekoAkPLUu2bswhW9Sxc6pEga+rlJ1bA+cltCviufKXKnC19QUba1FwDoJRcLty
	ZMaIEwcsmqGq1Mi9K29hynhmKzjILb23P5TWVVIm4pXMPh59FG6eR+5NKMhl8h1F/+AYTPySHNf
	zy3CHoyBt+pSRDFp4WFOv9twjZI2oNQPmrtAMwiNatrABQl1jer4jcGsiSWGCPy1JG5WeZ3QKBL
	zQBrvw==
X-Received: by 2002:a5d:5f88:0:b0:43b:4e13:221f with SMTP id
 ffacd0b85a97d-43b9ea1a17bmr16668541f8f.47.1774802134854; Sun, 29 Mar 2026
 09:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329-wip-obbardc-msm8996-blsp2_spi4-v1-1-5d9270235e92@linaro.org>
 <grmuh7b5phy6clv7izgq43yjtfxaulw3h6tqjenux35r5o3qnk@6q7nlgczigdx>
In-Reply-To: <grmuh7b5phy6clv7izgq43yjtfxaulw3h6tqjenux35r5o3qnk@6q7nlgczigdx>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 29 Mar 2026 17:35:23 +0100
X-Gm-Features: AQROBzAZeWhG-rpsGT3BQJVTZRDKnaJwNUJNEuupBI14XsML2XrnShH92O6Pt-c
Message-ID: <CACr-zFDv9mqZMOfHq+LjktA0DUVrTTw7-2oSxmu3U05ss2CQNg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: add blsp2_spi4 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100625-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,75b9000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 82F953531BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

Thanks for the review.

On Sun, 29 Mar 2026 at 17:03, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, Mar 29, 2026 at 02:19:15PM +0100, Christopher Obbard wrote:
> > Add the BLSP2 SPI4 controller node together with its default and sleep
> > pinctrl states.
> >
> > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8996.dtsi | 41 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >
> > @@ -3417,6 +3441,23 @@ blsp2_i2c3: i2c@75b7000 {
> >                       status = "disabled";
> >               };
> >
> > +             blsp2_spi4: spi@75b9000 {
>
> This should be coming after i2c@75b9000 (which needs to be renamed to
> i2c4, btw)

I will move the node in the next revision.
I will also add a separate commit to rename i2c@75b9000 from
blsp2_i2c5 to blsp2_i2c4. I assume the pinctrls also need to be
renamed to i2c4?
Also, do you know of any other nodes which need to be renamed while I am there?


> > +                     compatible = "qcom,spi-qup-v2.2.1";
> > +                     reg = <0x075b9000 0x600>,
> > +                             <0x07584000 0x2b000>;
>
> This wasn't tested against the bindings.

Oops - I will solve this in the next revision.


Cheers!

Chris

