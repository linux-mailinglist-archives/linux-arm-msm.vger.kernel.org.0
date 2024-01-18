Return-Path: <linux-arm-msm+bounces-7546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C7B831862
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 12:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0343BB20E55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 11:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EC024A1E;
	Thu, 18 Jan 2024 11:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZefPewbA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDD824A1C
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 11:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705576927; cv=none; b=tHgKNgCJddOVy+xcRRBTsH4bQ3UBumxAbN2rEuq49I52ZygjCfDnuZKsmZqhfmjqW3UQG62lH1np4ii3Uflv8J6Zy9VuJxHtf3y0pGcFZRtJqTSk/zzoUxeiHSntx3uHMLkJW+ofAjRTemrAuYRsnAwa6/8YC8nd25nOsCYL9eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705576927; c=relaxed/simple;
	bh=5Kq05kVGOkmLXHyTEvgQBIj8b1IJAH0NbDqMONI0uYg=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=lm8o76Qzjvn7tJmOSrp9ctzdJ36DnUM7g7PSuIiO+dTS8NA6Cdu9dLjgPJYhUFSCUR5jLsULQimjGQjGXJDFFWy7ve7UEvbbi+SPd5F9YM7GSS9Wk90pxZyVbS5bWqlX8tlJTDi6CyOoK9gYLrqzuxb3WiPUrSiiq42bTuYvvs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZefPewbA; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50e80d14404so548225e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 03:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705576924; x=1706181724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LjB2WWew7Wjmqi/UoNY+676seAwMeZh0uH4YqFEyt84=;
        b=ZefPewbALR/bhmlz+8h9dSMmxgH5svJnkaw0xFn/Px+PDu8OvIuynjVV+fd+wj5267
         CyHe86JntbMYgoEwYvXonfXCD/BDQmq0OgPR140xQwiHCpfmJGwaFBAX6IjnSS+YEPw6
         GbGLu7ZlL0GFbw06A5ExJNKvLJsxNWvUzJA2Xr611SLq2+ihX/G9FvIRfgpM0kPRSdhZ
         seVPK7SR8cQuVZ3KN8AJw4LkitUQJmSzpLSs0YGDXskvMd1cRI6j9fYV9K3Asby3VP+h
         GJvc9Hqq2bwEmf0eRda2qmKwgI3b9P2X3mudmkItld9V+KikM9zP78PzJL4eBu8Lhbbn
         AmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705576924; x=1706181724;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LjB2WWew7Wjmqi/UoNY+676seAwMeZh0uH4YqFEyt84=;
        b=ntDkFOc5hs7BtdXxstjWLqeB+ZWVExFyn+FTfymSwlZMQqM6R/I8pGV2FbUdPNzXPR
         sg0ncGtiDPQROoMurp8OGR46DLOdGJI+wAmXXuMgetIkZT29DnbTrZbusElMgciIEzFA
         qYAHeqFZAYONR+s1xzOoplMjqGQ4b2jhKsOFYKBbmwCoWHL6IQ0LjbWb7udXHLUh8rZd
         4sUdpqUcaOmCRQgch0JmPSjgukdpIe75GaImFtrB6r4eCcz4tXOrT7KpdwCnBM6i1s2d
         z6IHA2BUG/SJ3z03ptZ3XSc3qZ6L91cOGdz68kxaSPwy4urh19r897ov55rpybJT093H
         1hgw==
X-Gm-Message-State: AOJu0YwxUaYboDqbuYtrj/rhE6hkSQGDc54mIkmcINY9rheNWC4xB86W
	jfcm2NSvei0Rrx3VpFw5a8h0K8L47ojd45GANA3mCXFj08eWvLyS+Y8U6Sl9OPI=
X-Google-Smtp-Source: AGHT+IG9+Sl/l0bzXAXtosJaqz9eoR9z2fsYHaQjSq1GBd2O01haO47t4x4MPx/sS+yhfOKlbBeCpA==
X-Received: by 2002:ac2:4e10:0:b0:50e:6a65:fa97 with SMTP id e16-20020ac24e10000000b0050e6a65fa97mr618910lfr.33.1705576923894;
        Thu, 18 Jan 2024 03:22:03 -0800 (PST)
Received: from [172.30.204.173] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k26-20020ac2457a000000b0050f147c0244sm125917lfm.292.2024.01.18.03.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 03:22:03 -0800 (PST)
Message-ID: <1e9a8ed8-dbfa-47da-b7c1-1a0f1c1c3d39@linaro.org>
Date: Thu, 18 Jan 2024 12:22:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: msm8998: declare VLS CLAMP
 register for USB3 PHY
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20240117-usbc-phy-vls-clamp-v2-0-a950c223f10f@linaro.org>
 <20240117-usbc-phy-vls-clamp-v2-4-a950c223f10f@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240117-usbc-phy-vls-clamp-v2-4-a950c223f10f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/17/24 15:04, Dmitry Baryshkov wrote:
> The USB3 PHY on the MSM8998 platform doesn't have built-in
> PCS_MISC_CLAMP_ENABLE register. Instead clamping is handled separately
> via the register in the TCSR space. Declare corresponding register.
> 
> Fixes: 026dad8f5873 ("arm64: dts: qcom: msm8998: Add USB-related nodes")
> Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

