Return-Path: <linux-arm-msm+bounces-25480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F129C92A0B3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 13:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DBC71C20D63
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 11:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFE56A8BE;
	Mon,  8 Jul 2024 11:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="xmMrfjRd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D681DA4E
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 11:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720436835; cv=none; b=h1SQM3yWhxs/aLIgj1kmMcx/WwC3ltgtRY7mtpHQ+JTwh1PrdJDgufuDHJl+GMafYxT0DvO3aeV/jSYGcwoS4eT/h/d1fkRmRbf4xvsbdF4h+HnnOLkVD4QRekthUfLkYKluXWwePs7EiWTaIIfr0LHbnCq2HKlBjh8t9aBaCao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720436835; c=relaxed/simple;
	bh=gF/lASwGF1+G1/ozeXT25atc6qo0YaD9PZ3IJyqIV8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CsMEOKFbAgljPsc3KCAZXwFmGagipa9oj4uZmNbKMduAwu7mPFyeN4pOyUN0rRpXMok0LtF2gzxmlMHpQvXiZs4ZXKsy6INyTuRpQZ+yb/CULJrC5Sfo4zT/EsE+Mv+mg7UwG0ph64lFBLB3cnKszEH8RGCcdDCcWlxb2jClo0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=xmMrfjRd; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-367ab50a07aso1856093f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 04:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1720436831; x=1721041631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dcsI0Fp4d0lizbnZrWTDYuNRxhLlQN9hrnJVHrPEMm0=;
        b=xmMrfjRdsofjGgINX0AtnIchHHktBOECv3twZiYoB5hDHYelZ/VKH7KPEME3oGOrrF
         85BbImFJPrlOSgqHRhpKpzztuuwK7GiuU5hMcOzdoafwINsesJX6nM4sPUzAwZCXrtAr
         uxjtCYHN7/xmoxt2fEOR/WxeUhaAukw2wvdKT9qVSBkhW46nh6W04ta+0RifV0HQpVP2
         Zx5UKut9vbLwZh2BnR7xsCSd665T5jt0XsjCruHFIFSyeiKQKIQgsAUOKKv+WOeIyzX7
         uv2/HU/Ugwgzup5+0iImURPjyhUotpYpwVR2Fq8/TQ0Cb9sH7dRLUy1NYwmtXvQ4RXFf
         vtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720436831; x=1721041631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dcsI0Fp4d0lizbnZrWTDYuNRxhLlQN9hrnJVHrPEMm0=;
        b=lw7fIC5K0lc/g/+YksmZytRpLIp0IxTSg1ufKglIKmVnkX/nz5cHKazTIekOaKun8x
         f2J8KEZxsiXAfvyn+LiN1vZJhX+bDyhJCyJm1xF1M6CUw8reo7K5TqKEYzqBpSb6noc2
         36JRy535lE/WB+D7FixXCbs9gmICUDsFrp5yt7mRhxlCPHAcu0PZKq6obLdODaCKfN1k
         STPBi/OYqGEbn6MPJ8ItMb+Y5seo3jawroxRLN97RD9hYxmldBrMx79RYZ4JrDPL+Ea2
         6n5R4R/ekBJri7qNeCGoJkh7gcOsnYLnlN9iWXxauaurulD9l8XGsxP2jcrZzqnWjHjJ
         P46g==
X-Forwarded-Encrypted: i=1; AJvYcCXSk7h16MYTn/aIRHk1pJQ24Ht48R5ALfcXPqk0iDuGComktLKIRRmsvM0FLbZ8pjX4WUkMXNI6ihL4CBzUdxldcmSpBxKWcWaC/KzJ7A==
X-Gm-Message-State: AOJu0YzB1tMkSRPTohjWU1mwRu5lILPpJPxZka9LDfkzN94rOrVEqBQM
	EtWEWg8FyicrFGSche0Bt8a0JmnqG6GxqVOXS4d12hW5cCa9Pr/SN4hKNdSb5lTwrYCD1SKQ3aU
	x
X-Google-Smtp-Source: AGHT+IEKYdET8KfBw3aNCJckmIjDHRgLhPCL/RlwhYnD8BvFqsYWoobXZB0e3p/fZkpFRo2ReXBUAg==
X-Received: by 2002:adf:f548:0:b0:366:ec2c:8648 with SMTP id ffacd0b85a97d-3679dd66b0emr7705422f8f.43.1720436830645;
        Mon, 08 Jul 2024 04:07:10 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679ac6d60dsm10918074f8f.39.2024.07.08.04.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 04:07:10 -0700 (PDT)
Message-ID: <2d21db63-4371-45b4-ab24-9a725c29e09a@freebox.fr>
Date: Mon, 8 Jul 2024 13:07:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: add msm8998 hdmi phy/pll support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240704-hdmi-phy-v2-1-a7f5af202cb5@freebox.fr>
 <5lbtymde3plfiqkvnd2lrjzxhengmsw242uqapnzpvfd5jrm25@x2ik2h6vrdxm>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <5lbtymde3plfiqkvnd2lrjzxhengmsw242uqapnzpvfd5jrm25@x2ik2h6vrdxm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/07/2024 16:34, Dmitry Baryshkov wrote:

> On Thu, Jul 04, 2024 at 06:45:36PM GMT, Marc Gonzalez wrote:
>
>> From: Arnaud Vrac <avrac@freebox.fr>
>>
>> Ported from the downstream driver.
> 
> Please write some sensible commit message.

Here's an attempt at expanding the commit message:

"""
This code adds support for the HDMI PHY block in the MSM8998.
It is a copy & paste of the vendor driver downstream:
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/drivers/clk/msm/mdss/mdss-hdmi-pll-8998.c
"""


>>  drivers/gpu/drm/msm/Makefile                   |   1 +
>>  drivers/gpu/drm/msm/hdmi/hdmi.c                |   1 +
>>  drivers/gpu/drm/msm/hdmi/hdmi.h                |   8 +
>>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c            |   5 +
>>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c       | 789 +++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/registers/display/hdmi.xml |  89 +++
>>  6 files changed, 893 insertions(+)
> 
> - Missing changelog

- Rebase onto v6.10
- Move drivers/gpu/drm/msm/hdmi/hdmi.xml.h to drivers/gpu/drm/msm/registers/display/hdmi.xml
- Add copyright attribution
- Remove all dead/debug/temporary code

> - Missing a pointer to bindings. Ideally bindings should come together with the driver.

"qcom,hdmi-phy-8998" is defined in "HDMI TX support in msm8998" series (Acked by Rob Herring & Vinod Koul)

> I'm not going to check the math, but it looks pretty close to what we
> have for msm8996.

What is the consequence of this?


>> +static const char * const hdmi_phy_8998_reg_names[] = {
>> +	"vdda-pll",
>> +	"vdda-phy",
> 
> Unless you have a strong reason to, please use vcca and vddio here, so
> that we don't have unnecessary conditionals in schema.

The vendor code uses vddio & vcca for msm8996;
vdda-pll & vdda-phy for msm8998.

Which is vcca? Which is vddio?

https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8996-mdss-pll.dtsi
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-mdss-pll.dtsi#L121-172

Regards


