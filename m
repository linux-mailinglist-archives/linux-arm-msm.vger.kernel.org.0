Return-Path: <linux-arm-msm+bounces-44216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2777A04C7D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 23:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE4C01667C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 22:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D14C1DE895;
	Tue,  7 Jan 2025 22:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wFoHTiGV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC2F190664
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 22:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736289386; cv=none; b=RzQ3F1p+hDItGuouHDr9chK3Y3aj819xpxwY30cbGI4pjfnaIPS1xU/uPVREwoCei8zl98DA1EM/i8DqdRUeq4d9aeZSggxj3wzwQZX9+QQc8SjpTb1i+tSVhs0GVDk3Pkp1Fbu4i29M9yRZ6aByV+XSgyKpNCMM8KCsLBTpfV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736289386; c=relaxed/simple;
	bh=lOGBi/dp0P/iXOekSeQaqINO0H2TAMk7HjUz1XdtwTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SiVbRkiD/YdrwsR9o18KdoPF3vgvl1AAD7P/FOFDoTsq5r5VdgNJHagz+v8d/0zdeEXw9jiMsXqlHfDv9+PwqDQmAzAYDyjedKmq0U2PZOc6s/c+JrkMnqKHcq6O/t06HilCZzXZ6LF4HA7BlEzcuCA2TwURofJJO5GW9nhn8lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wFoHTiGV; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so15994544e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 14:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736289382; x=1736894182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vMISyp8hjXFa2TqyuFC9YGrFh0SxgMd4glaeVKBHUSo=;
        b=wFoHTiGVj1032UVSbfPVOEdd5zSaeSp2Tzohd2TF/W+zZX+ra5rm7ftmSJyIjoCUIz
         6uvNtbnEncQJ6ZtQUxpZOqk/IrGg3TXOH9NAjqzh64ppcFbrdq8cQGpLFK1+AfyS5QTa
         xo4hBqxUZAVjlIzgaOgGdIjcuUdTlc4xh3mMtTV7NTpudu08GtJ1UFydUhSlFevZTzo3
         3AJ2QjGE4Fdd1nPpvv88jRAJppCOSd48s6KAa6Zqwn17PgLco/texi9To9aNTNRn9M3+
         UpLctht60AC742gP+i/k5fZ+IxNpm5dDiiQg7i2aGjCtsAeNyKvi3wGXPY/orDRvyMok
         uhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736289382; x=1736894182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMISyp8hjXFa2TqyuFC9YGrFh0SxgMd4glaeVKBHUSo=;
        b=WYLMP/t3trwZIKdlCxI6rwGa/XQ4YcWfG5ikoLvicUFjzcxDUAOBozx66J9mkiDr7g
         prWF4/EwTA2+YN4f/IUDVC1EsOfDu8K+RL0jUhkaL2fZ4HtgM7R0pYV3T139wVNT24vs
         Y6KzhGOzbsqoVJr6NaTUBcz/3+jpfzB27W4vXlOMODkdA3mOHWxRfxmd2X91DgkPjAy+
         yNrDipxJG4AV6zpBr+FElOld3krHSlwAytxLT0sskPIjzWZk09PYSFHJ3mEWmQUUAXyO
         oqoIFF1LGKrxSu/MV0sWplAXdjHpo8Lb5GXRBrUYwTJATLZmQ0laUCTwouNwa8f88f3m
         o1yg==
X-Forwarded-Encrypted: i=1; AJvYcCXquWLAWogYfYfSGR3MrUBzebaJ9qWAPN/4o8eM7SGh30xRys/VMB2Q/QX6Kwn4m/cg1W5hmIr2K3eWlKJw@vger.kernel.org
X-Gm-Message-State: AOJu0YxcIjZKTyzhKOtXTafGO3O5Js1cubp2zc3yPLU3h8KKSzx/Y7yh
	ft5DjBUwzdc8VNzpmkT1NCm10IittMaizijyQd9GhV7B2Gs3osKzsAAFBDMUtkc=
X-Gm-Gg: ASbGnctduKV3t4cUVTHG81fUakwFCsM9aiAR/WDjGR8iD60bPK1qv6NcOVl5Q/H2dCk
	a1EnilX2MUYeZHA89i8OConRJ46jOxqRpHcJwvrll9biTlIFl4Uj3Th1W/dwVfj+ieLiEZncV9O
	6tqFxIiBYZNvKivhLXbPJjTsHwVYqER2BwR5OplkqukCW63Sd9Iw4aixZeyo2QBD+6X6A/oERDc
	kYUe21zmbrcCUMwqCjso2XFCJ6Jg883fGupPYsmpcw8IbMMZTpWJN6ogUx1t2sQkcBnpZ7CsWcO
	kvgYtovMOCZ33hGLNqc601Xv1gZ+y7jQt7wM
X-Google-Smtp-Source: AGHT+IGl8271bjARGx+9WnI8XCLW5vsddlIYolMsA//DxW2vDKnbu+pgC7EKJfmOJ60v2ZvZiNOvQg==
X-Received: by 2002:a05:6512:3b90:b0:542:214c:533 with SMTP id 2adb3069b0e04-54284559eefmr143332e87.30.1736289380867;
        Tue, 07 Jan 2025 14:36:20 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832c26sm5339629e87.279.2025.01.07.14.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 14:36:19 -0800 (PST)
Date: Wed, 8 Jan 2025 00:36:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vedang Nagar <quic_vnagar@quicinc.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: enable venus node
Message-ID: <vzafzur7ci4klp6cup5jpbhw2adjtgew2dlcogucganmpvsqmz@axdhktuypzlg>
References: <20241004-venus_sc7280-v1-1-4d7d8fd7e95b@quicinc.com>
 <kezh3lmysij56g2tjwwuas5r26ro5i777yxxitsdcjeg7zp67v@oknrdbkzison>
 <78e6ff6b-efe1-496c-a1fb-c9a0a4aba2d2@quicinc.com>
 <CAA8EJpqqZL7xybcbJMsbTQB+ht5-A+ocNs+Sq30j=v1zM3JL9g@mail.gmail.com>
 <fbba794a-ba04-4790-b5e9-b4df3cba35b2@quicinc.com>
 <D5KAUZHYJHFS.1NXF5SVWYL03G@fairphone.com>
 <39206687-6fb3-434f-b2ba-a028cf6f8ed3@quicinc.com>
 <D5KW7A8BZG6K.2L7FEV6SWRZ2D@fairphone.com>
 <26b3aee7-5729-447b-983a-cfa5951595ba@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26b3aee7-5729-447b-983a-cfa5951595ba@quicinc.com>

On Tue, Jan 07, 2025 at 09:41:56AM +0530, Vedang Nagar wrote:
> Hi Luca,
> 
> On 11/13/2024 1:33 PM, Luca Weiss wrote:
> > Hi Vedang,
> > 
> > On Wed Nov 13, 2024 at 8:01 AM CET, Vedang Nagar wrote:
> >> Hi Luca,
> >> On 11/12/2024 8:49 PM, Luca Weiss wrote:
> >>> Hi Vedang,
> >>>
> >>> On Tue Nov 12, 2024 at 3:39 PM CET, Vedang Nagar wrote:
> >>>>
> >>>>
> >>>> On 11/12/2024 6:43 PM, Dmitry Baryshkov wrote:
> >>>>> On Tue, 12 Nov 2024 at 08:17, Vedang Nagar <quic_vnagar@quicinc.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 10/7/2024 1:20 AM, Dmitry Baryshkov wrote:
> >>>>>>> On Fri, Oct 04, 2024 at 04:22:31PM GMT, Vedang Nagar wrote:
> >>>>>>>> Enable the venus node on Qualcomm sc7280. It was made disabled
> >>>>>>>> earlier to avoid bootup crash, which is fixed now with [1].
> >>>>>>>
> >>>>>>> NAK, there might be other reasons to keep venus disabled, like the lack
> >>>>>>> of the vendor-signed firmware for the particular device.
> >>>>>> Can you pls elaborate more on this? Any device with sc7280 SOC can use
> >>>>>> venus.mbn which is already present in linux-firmware git.
> >>>>>
> >>>>> Can it though if the device is fused to use vendor keys and to check
> >>>>> the trust chain?
> >>>> Yes, infact the existing ones are signed and works with trustzone authentication.
> >>>
> >>> No, the venus firmware from linux-firmware does not work on a device
> >>> with secure boot on, like the (QCM6490) Fairphone 5 smartphone.
> >> Are you saying even after applying this [1] you are seeing the same ?
> >>
> >> [1]
> >> https://patchwork.kernel.org/project/linux-media/patch/20231201-sc7280-venus-pas-v3-2-bc132dc5fc30@fairphone.com/
> > 
> > That patch has been in mainline since v6.9 and my tree is newer, so yes.
> > 
> > See e.g. Qualcomm doc KBA-161204232438 for some details.
> > 
> > Regards
> > Luca
> > 
> >>>
> >>> $ rm /lib/firmware/qcom/qcm6490/fairphone5/venus.mbn
> >>> $ cp /lib/firmware/qcom/vpu-2.0/venus.mbn.zst /lib/firmware/qcom/qcm6490/fairphone5/venus.mbn.zst
> >>>
> >>> leads to
> >>>
> >>> [   10.848191] qcom-venus aa00000.video-codec: Adding to iommu group 13
> >>> [   10.863062] qcom-venus aa00000.video-codec: non legacy binding
> >>> [   10.909555] qcom-venus aa00000.video-codec: error -22 initializing firmware qcom/qcm6490/fairphone5/venus.mbn
> >>> [   10.910099] qcom-venus aa00000.video-codec: fail to load video firmware
> >>> [   10.910849] qcom-venus aa00000.video-codec: probe with driver qcom-venus failed with error -22
> >>>
> We have seen similar issue with older firmware present in
> linux-firmware git due to a bug in singing of the firmware image.
> 
> This issue seems to be resolved with below change:
> aeede7afb7a186b62f9e1f959c33fd5f2dea0f7a: qcom: update venus firmware file for SC7280
> 
> Can you pls give a try with latest firmware if you still see the same issue?
> We tried internally and do not see any such failure now.


Have you been trying it on the FP5 (or any other vendor-fused device) or
on the RB3gen2, fused to accept any CA key?

> 
> Regards,
> Vedang Nagar
> 
> >>> It's the same with e.g. adsp firmware, modem firmware, etc.
> >>>
> >>> With secure boot off, yes, the hardware will load any firmware
> >>> regardless of the signature.
> >>>
> >>> Regards
> >>> Luca
> >>>
> >>>>>
> >>>>>>
> >>>>>> Regards,
> >>>>>> Vedang Nagar
> >>>>>>>
> >>>>>>>>
> >>>>>>>> [1]
> >>>>>>>> https://lore.kernel.org/linux-media/20231201-sc7280-venus-pas-v3-2-bc132dc5fc30@fairphone.com/
> >>>>>>>>
> >>>>>>>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> >>>>>>>> ---
> >>>>>>>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 --
> >>>>>>>>  1 file changed, 2 deletions(-)
> >>>>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>
> 

-- 
With best wishes
Dmitry

