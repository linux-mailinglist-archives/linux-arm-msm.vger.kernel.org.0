Return-Path: <linux-arm-msm+bounces-37632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FC59C5D53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 17:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7CB6B42D0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 15:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC5A200121;
	Tue, 12 Nov 2024 15:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="r880ZjN1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC852003B4
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 15:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424785; cv=none; b=bF/AsQU/Bup7EDs/qB2Dh/rerpXR5iYDrDwqq/DgjsZTUlr4SUEOwW2L4oonfl6lDlaXO0flT98DMfDKv2zEvFtO6IwgqKH60SjYi0IsJQKg2NNuY37VN1c7KZerZ0PpBWopXCmAbj0tKMzZsK3M75vxqbbN6eqJ5RkFLE1bmhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424785; c=relaxed/simple;
	bh=VcST2DUlRpkwQVHrrTYbdpK9dzUETeVrbngBLMBL+yk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=lGoZl4K93YjcoRfdH2vSDuBbngxCYxggoV8QH85o++n+FdFsxqwajk53fwCThb54xhDAL7DQMkWFBC+pFzAUC8j0ow/VVqiGU6qjkSCz/ixf1j1Xyk1PSs9xV/8j+LuXnUEF59kW1ee5N1xNqYgpS0saHSWoDtQn7+/lIM2vPKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=r880ZjN1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d533b5412so3972010f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 07:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1731424781; x=1732029581; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVQ8k1+GJHVS0OPZNtSMzBKEyDSg8j47tQMzgymLCow=;
        b=r880ZjN1vVgsjG4doC37tDg7m8yT/362tcO+drf3LMAGtU+W4Zw4XuLTPqe+30iT8y
         rkprgGMXMhjVJqm+ifrMmo3W1fHcC26cDmk048ZUCUthCAKZilzuFiVd+jFCMPZqa5d4
         opPATqnd1NVq/OdFOtUKn4nNcg4nqc4DoOJtG0EoJZ21uXhCVf9OqGJG/NPZw4oZoz3W
         qyTvPDnZHXhbHsU3gZxrLpnOGidJvErwnURij7oQW6xFfzYpxm60wu79Hvmm9jzBW7wj
         QSGmrw+rrebi5zrA+7GWhsp8RtE2GPVHhTGvA/178oqI9tjPFv+98cuUGbAd0j+6tt6V
         HwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731424781; x=1732029581;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MVQ8k1+GJHVS0OPZNtSMzBKEyDSg8j47tQMzgymLCow=;
        b=AhGl4iuSmSDTZK94pVz4LPYwzilK5j/w/iHya88twtsziGzYURLN/4Nz237Q3iKMp+
         Lp+9tmWxwiJXQ1GslaNEtjs186vKaoTgIFauVDRTozFE8tpvllhEKzG/eNZe9s508U/T
         EUwRtzGutsRv1LxHd2icNYTyL4owwfDwH6PGOdhmwCRRHFComp4rdUdMlmiWgeAro5JN
         iEY+LB4ldC7vbsvU4nqToPUQmyMgZvDOwg6ZYffO69TsGo8A8mlTIot9QvEih+SLMuYp
         wrez5SnGusL3OE42uS2A4C2VNxWtKuQ4mw2wwhc8f22saBopcLtYzfN/bwxlwxa40jw1
         Qn7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbSy6SgJ3OnFDbEAyNM3vTU2nO1mHcfvrH5xPs7od5gxYSCH3ezyaDa9uYQQSY7F4AveiB1qXZCU6vTcHv@vger.kernel.org
X-Gm-Message-State: AOJu0YwUvw0vuFsXJfXjGB84h7B/H8JjUcmqfFsBw6ABzowJe6vIKlGp
	0QmhKVL9DvxK/TC3kOIvkh/+8R+ZcwJU9l0qZXda5rUQhu3WpMaHI0pI9X9Cr0U=
X-Google-Smtp-Source: AGHT+IHMf24WTrO4WpyXzvZV8UKgh3y3VTD5Esq4U79Ud4jGOPxTux5xkh61tHoiAx1XCvZY9wi66Q==
X-Received: by 2002:a05:6000:1ac9:b0:374:c640:8596 with SMTP id ffacd0b85a97d-381f186fc60mr14314412f8f.32.1731424781413;
        Tue, 12 Nov 2024 07:19:41 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381fbf416c6sm7330352f8f.54.2024.11.12.07.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 07:19:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Nov 2024 16:19:40 +0100
Message-Id: <D5KAUZHYJHFS.1NXF5SVWYL03G@fairphone.com>
To: "Vedang Nagar" <quic_vnagar@quicinc.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>
Cc: <cros-qcom-dts-watchers@chromium.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: enable venus node
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241004-venus_sc7280-v1-1-4d7d8fd7e95b@quicinc.com>
 <kezh3lmysij56g2tjwwuas5r26ro5i777yxxitsdcjeg7zp67v@oknrdbkzison>
 <78e6ff6b-efe1-496c-a1fb-c9a0a4aba2d2@quicinc.com>
 <CAA8EJpqqZL7xybcbJMsbTQB+ht5-A+ocNs+Sq30j=v1zM3JL9g@mail.gmail.com>
 <fbba794a-ba04-4790-b5e9-b4df3cba35b2@quicinc.com>
In-Reply-To: <fbba794a-ba04-4790-b5e9-b4df3cba35b2@quicinc.com>

Hi Vedang,

On Tue Nov 12, 2024 at 3:39 PM CET, Vedang Nagar wrote:
>
>
> On 11/12/2024 6:43 PM, Dmitry Baryshkov wrote:
> > On Tue, 12 Nov 2024 at 08:17, Vedang Nagar <quic_vnagar@quicinc.com> wr=
ote:
> >>
> >>
> >>
> >> On 10/7/2024 1:20 AM, Dmitry Baryshkov wrote:
> >>> On Fri, Oct 04, 2024 at 04:22:31PM GMT, Vedang Nagar wrote:
> >>>> Enable the venus node on Qualcomm sc7280. It was made disabled
> >>>> earlier to avoid bootup crash, which is fixed now with [1].
> >>>
> >>> NAK, there might be other reasons to keep venus disabled, like the la=
ck
> >>> of the vendor-signed firmware for the particular device.
> >> Can you pls elaborate more on this? Any device with sc7280 SOC can use
> >> venus.mbn which is already present in linux-firmware git.
> >=20
> > Can it though if the device is fused to use vendor keys and to check
> > the trust chain?
> Yes, infact the existing ones are signed and works with trustzone authent=
ication.

No, the venus firmware from linux-firmware does not work on a device
with secure boot on, like the (QCM6490) Fairphone 5 smartphone.

$ rm /lib/firmware/qcom/qcm6490/fairphone5/venus.mbn
$ cp /lib/firmware/qcom/vpu-2.0/venus.mbn.zst /lib/firmware/qcom/qcm6490/fa=
irphone5/venus.mbn.zst

leads to

[   10.848191] qcom-venus aa00000.video-codec: Adding to iommu group 13
[   10.863062] qcom-venus aa00000.video-codec: non legacy binding
[   10.909555] qcom-venus aa00000.video-codec: error -22 initializing firmw=
are qcom/qcm6490/fairphone5/venus.mbn
[   10.910099] qcom-venus aa00000.video-codec: fail to load video firmware
[   10.910849] qcom-venus aa00000.video-codec: probe with driver qcom-venus=
 failed with error -22

It's the same with e.g. adsp firmware, modem firmware, etc.

With secure boot off, yes, the hardware will load any firmware
regardless of the signature.

Regards
Luca

> >=20
> >>
> >> Regards,
> >> Vedang Nagar
> >>>
> >>>>
> >>>> [1]
> >>>> https://lore.kernel.org/linux-media/20231201-sc7280-venus-pas-v3-2-b=
c132dc5fc30@fairphone.com/
> >>>>
> >>>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 --
> >>>>  1 file changed, 2 deletions(-)
> >>>
> >=20
> >=20
> >=20


