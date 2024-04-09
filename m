Return-Path: <linux-arm-msm+bounces-16988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FE089E60C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 01:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F0B81F212DD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 23:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328B112F381;
	Tue,  9 Apr 2024 23:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NWf/Wyj6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E63A158D95
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 23:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712704936; cv=none; b=P21p8tMxSacTsG9vBX9g8hLbZEjdtPLo1gEbCEMCwxUidzjPdYREVyDphEL2bks+kylWtEu3XyXHO8CX9aBDtucL8jClWLofeHgwjjRp1STHARNrT6GwzS3dDOs9D9ha269R6MB/E4umhhW9ACnnRUmY9jheJJqhFd0dPysOqe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712704936; c=relaxed/simple;
	bh=Re4G1GF3fjlkpmTm+kYesphxkwi85KA7BqM8RaFBR/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oYSsVrARPbz60N0I55iZaiopk4QVB/O975KJdvBWwRGSPb9yISt9X+i1GgP6R8NOgcoz2x1wxR96kjSummKEvuSHmJEVkZcxfaw3bJB944a1hzEQamN37egy94de2RCot2Q0rrQZxUE1zgb/0lBjQmOLum/0qKOoKjXMFWCy9KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NWf/Wyj6; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516dbc36918so4613046e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 16:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712704932; x=1713309732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=taZtZx2v/uEPzjBiDzLANi54z5W5ewmNadAw0vDJzoQ=;
        b=NWf/Wyj6IvJ7595EN11xa4XUplml/nPAR05q4wVb5lVSkg67IdIWJAV/BSPMFWibr9
         ojfFbOnHe7xfBgz3d3IfD+Rg+EzDL8vgeHQC0YiR28yXmfXUYEGP+lZacMoekTQAsLyz
         ue4ZOW9GDFO9L0Xh+vxwmmMOXjCCL1OYN+UZWCEANt8gjcI4Dm7Lq2+mgx+lqPtXIiZR
         Y8fVR2Fep6Lb9WD1K989yxzQcvX4cN+dOoWxFgpQbaoygz7DhKu6D9oRhMbUR6VTp9IE
         GKVZ+qkNW1JmdkE1f6FRaKqSQPCh0vDxKuiL1I2UcQFMsg3VFC2n7xXRV++Aey5Or10g
         aO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712704932; x=1713309732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=taZtZx2v/uEPzjBiDzLANi54z5W5ewmNadAw0vDJzoQ=;
        b=gF4dW5O2Shl0dToQZ0GSJSMJR4QkVKkEpZ/tecrw5aXBxkch3rEvoXpepEOhtmRZ72
         6gAQAj/cf6Xi3x4kx74br7rNKHT1N0qfVTKoQzL++oiunsWvW2UeXo13Q3EugCJjVj2S
         RCpI5sjx/s3fEvkVjHU2oq4j6x7AUJT24mPJDllqj0XIVcCQN2XwvtsCduS33rLCK5Q1
         S4B4ofhIzrmay6H27RCF36YeLhqadTU6NgFYrKwoT453jPS0ml9GLXzqxu/9lR8iVqRt
         tMsMsX73ICY3A21GLrinRTguMhp1fr+74eZShSHfaxfBVW9VYw356TNHN0HQZStFYb0d
         VhIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp3NdtABOsl30wUqE0ZrmJnG4TnRu4XoEktmDfy5/WxKMWoVQkYm5fFE2DOFlo/RGIwayn6ti8MRJutAl3Dg/FFBhO2F7dMwL0mcVy+w==
X-Gm-Message-State: AOJu0Yz/AM6rdHHSm7H/PJ5y4NlHzfLrxo5UUeFsnV9F5YZ1TtkEhVwf
	hqNDb69GuV76pKGZMOfQoMK+5PgUZUSlJfqqlGVNURpAiq9cwIF1heXA+9exMVs=
X-Google-Smtp-Source: AGHT+IGDsyMmbvB7ikxRRA7hqgtPpk9INEQsUpAKhHVr1rkRG8/DjO0MmW+6Ax7V8MWrnrsfvyveHg==
X-Received: by 2002:a05:6512:2824:b0:516:b07b:47b2 with SMTP id cf36-20020a056512282400b00516b07b47b2mr616872lfb.44.1712704932125;
        Tue, 09 Apr 2024 16:22:12 -0700 (PDT)
Received: from [172.30.204.177] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id b20-20020a0565120b9400b00515cb1aed86sm963689lfv.160.2024.04.09.16.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 16:22:11 -0700 (PDT)
Message-ID: <95db05f3-756e-4236-82fa-72a643838493@linaro.org>
Date: Wed, 10 Apr 2024 01:22:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: build INTERCONNECT_QCOM_SM6115 as
 module
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240409-enable-sm6115-icc-v1-1-bf894fb5a585@linaro.org>
 <a1aa0f4a-868c-4386-ba6a-9962f827bb2b@linaro.org>
 <CAA8EJpoinJ999jYsEhBqoV=J0fB+0_odO_EEXveQdjB3+GfJkg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpoinJ999jYsEhBqoV=J0fB+0_odO_EEXveQdjB3+GfJkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/10/24 00:12, Dmitry Baryshkov wrote:
> On Tue, 9 Apr 2024 at 23:02, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>> On 4/9/24 20:27, Dmitry Baryshkov wrote:
>>> Enable CONFIG_INTERCONNECT_QCOM_SM6115 as module to enable the
>>> interconnect driver for the SoC used on Qualcomm Robotics RB2 board.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> =y for console?
> 
> I think with pinctrl being set to m it won't reach the console anyway.
> And earlycon should work w/o ICC driver if I'm not mistaken.
> 
> Several other Qualcomm platforms also have interconnects built as
> modules in defconfig. I really suppose that we should move all such
> drivers to =m and force using initrd. But this sounds like a topic for
> plumbers.

TBF I'm not a fan of anything interconnect-adjacent being =m, as by
design it's supposed to load early and must be present

Konrad

