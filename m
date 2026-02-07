Return-Path: <linux-arm-msm+bounces-92106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BLtIa/RhmnORAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 06:46:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EADE21050BA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 06:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C5573018742
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Feb 2026 05:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE4C3019B2;
	Sat,  7 Feb 2026 05:46:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FE530102C
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Feb 2026 05:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770443179; cv=none; b=WvNCE9dWkQiSpRBxE/qw+iegZpV4EqH5v55BZEb3DzjfRJbTLim+YyiWmvtd4wdGRfK19tR+YV1VqW6VFvZgWmW2uK1G1edMDndHtQJ0RPvt30LV1+/H7o5Mc3YzbqyZ9ZAEsU87dsMiz4gfl1nXBRbdKK6hPz+JNjdxjAF4ol0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770443179; c=relaxed/simple;
	bh=YOQlCZHHbbZyJPUzjKktvVxHrWwacE2uT1p/aLLvyc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nuTcZmCFIgCetmB9z9A2J5MHHNQI2iO/VoZ6fMbo8yMv2qs+rUuMI5xE4Z0PqDgeQr64JT99pTf5IvPT0/RDGUzpXmGxVE+U5iEMGhiVuqU6w+Zc9kpAesofoJEGpKK5fPUfMdSDOOaXxHKSeFQCfm+MzT5DYri3LtWVlnYwVEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-794fe16d032so24216667b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 21:46:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770443178; x=1771047978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d8l2EHUnJJX9Xx1XHYB+bf7GBC5MQRG6MKCmKfcP4wg=;
        b=hO1qMV7YHyvRdBi4wVOt/v5yjTwdZjJ+5GiLkZf4hfjY3ZLIr3dS1Ho6H2xadbs8rd
         26PQJv71A/SFYML7KBgEQ4QzRAld+a3G6RoIvf4KDTDAbVioM0w3lU8lQ4yLoacOLjPm
         Xz9797NyLTKGHNODvQpp18LMX3cBjEYbA7MkPk60FBgmxPJxWVyrGRmKbsTbomtDgi6l
         Af287IlgZCkrOvl0iZv3G+w2KTonCwsvVz3BkwPPqS27240cIsQ1SZx3Dghw763ARC1m
         3HceGIG0LSuhnjCHqWWFHEtqQWc8VFX866i2TDrrX0MfFFwLRHTEFYuHPJCxIHTJ4gnL
         hE/A==
X-Forwarded-Encrypted: i=1; AJvYcCXIPu25mJo2YEJXCsOmxb4VHbPn9ssYdijS440de6OMS5tM7r++zT7glDKMIvsNtIZws0pNMG9UM+QgE9hD@vger.kernel.org
X-Gm-Message-State: AOJu0YwpG3sI2bft+1AznBNmIRqHABhaBkq0Q8vbajTL8wqtgeEINdt3
	ynHfL66M9xamkwqSAcAGe8+eklKFgib6CP+Z+fnxrszgz988WK92o8HMTXsFuQ==
X-Gm-Gg: AZuq6aI6FHY9gSDhSAXSWIb6Tfbp13YRU1IJ3Si1SZuIrgalFpVi66Ti/CllIwy88Yp
	y6wWR6Ui9DP/TRFcyiG1VCjvDyAuQVIH9SVjHdHueAJOQl/2B5UTF889tC5GzHqgsJnkZ+EoNjQ
	l6AYU2eyDo3Z1sKmXQck6gVQzX+90/S73HiGTyF9e4MfWvBAu5FpdSF8u8Y2act2MBaAJUaROiY
	/KC/WGqVu/vBiUaefWSMDBECDDKcyW2gMrC61abf/+dLnAMEEkdwRkmgbXwSsVoIGJTif7Scn3F
	sYu4WAsycIzIRQIpk3330iqbPdKx081LozLZfYJT9/dtEzehNeH/HcnMscI0mUqrActzKI+ASck
	SpMoq36+KSPnFHAcsLP5YW/9NzgGv12Z59ywSbZTs9wVzm6tf5yxJBtjHjytHejVw9t3Pkpa8ut
	kCW5MwtawHQvYkbU3ACpT12/LxfzKDCvKNhoZsret7fmR3zLdS3cBI
X-Received: by 2002:a05:690c:89:b0:786:91ac:e15d with SMTP id 00721157ae682-7952aa8b480mr49594917b3.27.1770443177925;
        Fri, 06 Feb 2026 21:46:17 -0800 (PST)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com. [74.125.224.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7952a013be5sm40806867b3.8.2026.02.06.21.46.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 21:46:16 -0800 (PST)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-649b1ca87ddso2981598d50.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 21:46:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEudPu2VMkR/533ynqFGhsLvL2FulgnvhnflJsKndB2fDcLxNTf6ieU0YRSfLyL+sZrQpYBh+hkWBfl+vj@vger.kernel.org
X-Received: by 2002:a53:d8cb:0:b0:644:702c:3c02 with SMTP id
 956f58d0204a3-649f217a97bmr3572480d50.70.1770443175479; Fri, 06 Feb 2026
 21:46:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6cd569ad19ae8efb5f4244b3aa185754@gmail.com> <eb9c1489-4496-48b3-8709-739cd45c11b0@oss.qualcomm.com>
 <d398cd57-41b8-4646-834e-ff0c0b7ff749@kernel.org> <CAEQ9gE=kH4Np32xZdp+jzaTo9TMjtLVRD+xaimuKWxdag2Whew@mail.gmail.com>
 <b1d791e3-849e-4d76-bda0-816418f98e39@oss.qualcomm.com>
In-Reply-To: <b1d791e3-849e-4d76-bda0-816418f98e39@oss.qualcomm.com>
From: Roger Shimizu <rosh@debian.org>
Date: Fri, 6 Feb 2026 21:46:04 -0800
X-Gmail-Original-Message-ID: <CAEQ9gEkA-Gw=96LJe3vf3S6ada5o-mDqjY9B6NNpSaO8saSfvg@mail.gmail.com>
X-Gm-Features: AZwV_QihtJp0QSpnV28G3pEcBRo5BUt4aTaxPVtga7w2YcS8hqXq7wTYtfmaWv4
Message-ID: <CAEQ9gEkA-Gw=96LJe3vf3S6ada5o-mDqjY9B6NNpSaO8saSfvg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92106-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosh@debian.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.906];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Queue-Id: EADE21050BA
X-Rspamd-Action: no action

On Fri, Feb 6, 2026 at 2:20=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/6/26 10:55 AM, Roger Shimizu wrote:
> > On Fri, Feb 6, 2026 at 1:41=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 04/02/2026 10:20, Konrad Dybcio wrote:
> >>> On 1/31/26 11:31 AM, Roger Shimizu wrote:
> >>>> ---
> >>>
> >>> [...]
> >>>
> >>>> +/ {
> >>>> +    model =3D "Thundercomm AI Mini PC G1 IoT";
> >>>> +    compatible =3D "qcom,sc7280", "qcom,qcm6490";
> >>>
> >>> You need to add a board-specific compatible here, see:
> >>>
> >>> Documentation/devicetree/bindings/arm/qcom.yaml
> >>
> >> The true problem is that this would probably fail validation, so I
> >> suspect this was never tested/checked.
> >
> > Thanks for the review!
> > I did test this device-tree with the board.
> > If you mean some other test, please let me know in detail.
>
> make ... CHECK_DTBS=3D1 qcom/qcs6490-thundercomm-minipc-g1iot.dtb

Thanks for the guide!
I tested above command, it was passed for my v1.
Sure, it also passes after I add the board-specific compatible. (not send y=
et)

> make ... dt_binding_check

Sorry, I never can run this check command. It reports many python syntax er=
ror.
I guess the script has issue, or it needs patch to run on my Debian system.
I'll report the issue to upstream separately.

-Roger

