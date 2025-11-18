Return-Path: <linux-arm-msm+bounces-82353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCA1C6A2EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 16:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 3770C2BF1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E8C357719;
	Tue, 18 Nov 2025 15:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKE829W1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HYKdSbYy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47FD2773F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763478144; cv=none; b=GZpVvhmnI8ydiIPoAedrhaRR86hTiRjf/e/ZVKnHNdeBCWu/finmv3z0zVtAGgQtNM7uCHpG1dO6yYSSL3rmPO+EO5ufG+zf2CucfvffNseDOZwJ8dpGR/iSKQmmL//vJDC0rToO/zp2urSsfP7tY+vBhXaMOuDsi9luS+xytCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763478144; c=relaxed/simple;
	bh=F2EcUzzrDBVg2CoYfVhrewmpZHJ4gD8b2jnpX9KGKDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LJ6sG17eiXewCnOd/pDBbr/LoKv66TdycJq61AaAs1M8d35u0Hc2LpA79koqOKBlat8mKrP0UIH48DwSeb7i/L8Tq+2z9Fa3y/FMi4OA7bHPRuO4KUlGChZP30o6TUZSGxhT9Zj+GhmtV1ZdN0IM96uMcSgFy+QkKNb4WOSFjw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKE829W1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HYKdSbYy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIE7IaV384224
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O39BO97h+YAW1CZjvfTaDx7JV63porAO60M0mUkmq8w=; b=KKE829W1Y6JeQ1hE
	6xAvwFZ1iTDMnDmxzrDOIR6oDAbDyqPaKGkfzXiYlkNR7lCWC4h+MuS2Ibk8zt4q
	zTws5iyM8zOkcRzVeTvPlgmjUrcZYchoX95OG7OjpITyVQ51Mea8JZABSgg6GMdG
	ZL5g4Pkls/S+6uj51TYqtfHttuxjfKv6mAC6hrj7gCpqO3iIqt7CxpO4ANGKDj9h
	b+K0Wff6uGUTvbb4nVq5TPZvNMKNDa1WpNMtyDY3e2lAy+uyIMXsKefgz0i0m2PZ
	rTNNNwfB4Ykjl9RVyggEc8kronyjF6r6lEat94ozyysMEZTL2MlY9kiAH9vCJ7RX
	tKQ3pg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8juc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:02:21 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5dfa4d7ed54so655705137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763478141; x=1764082941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O39BO97h+YAW1CZjvfTaDx7JV63porAO60M0mUkmq8w=;
        b=HYKdSbYy19P+mvMtZVDajWUzFtOMLX1Ce0tXR95Hd6JYfdEtUfRkxlpLI4Au1nxxfC
         KJ8Pak4j+mQ5X3ElshU9SdY7aoLWkthbz7EO8alR179vifKOtqzUXx7ZeLRTLrq3bPkA
         iZJJH6JdFGZ0a1qiNPaT8+L6g4ZDMBB+2PllisjGxxjIIanSLI8Sgei7D4Roffgm9SVf
         5ZgbCpRTImsvtkRExaXFkw/1BiQNC90yGrAN9Yy3/EtxOpQ+d1l0/LPhNpbWbw+XPsiu
         DRBb1w0YEAmNplFDLVD4uYm3jk5WGQuU2C9w3LoYozEMmHDwCUW6jamUOypko12KvgEH
         Wg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478141; x=1764082941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O39BO97h+YAW1CZjvfTaDx7JV63porAO60M0mUkmq8w=;
        b=XUpvfwNgr+QHJtOtQtOPeU9oGCpAOJK/VXQLtgKNz+kI8+VgOkxviMla2jex760y1U
         GLVj0Yy1wYYsdI8X+xooEr8oXbGMs1JV3wob7Ld32Rp45EaMmg4kJvzibZSR/2ep6+4B
         hlDeVh9E5QCcSV5Cgnu/V/VLqk7YcD/jO074KuS8A8SwchJy5y13IzWSGEXpr4REk8GD
         V2HTmPHolKkzDS1HcDi5nQsTL6BmGRDWzM+wEPeqeyqD4z1wgrRYRtjdpNazQAd2g/ih
         Hb1DXa4RoGMiJN9LHsFImdEsyk6yhcKEXRFM1D2GHdyulLwD+r8wUWro4EGMhbzmh8ec
         OmGA==
X-Gm-Message-State: AOJu0YzSqvOoPhyars8JZ2BpxUYInOSS0C5tVj6Wwj8IUyljxJUykl/m
	8c+sukpGCsTN4HKgyxO/qQJvtNv24yRVsBQMd9otllPLXqomGi01wz0G0nhtv9RrE+t33qZl5h/
	V2ke/V8Ozy/tv0voky2S755qPYhsoi3qRRyQ1GhrigIjDKOTDo94QUFz/+tElX2/W7i0G
X-Gm-Gg: ASbGncvRWSRcMDbwRzxWC5lX/JHvM4il8IkxzMg0owMp2Y3XMbKOs2KMCv+zq8jZ/NX
	neSPs9qgEKJ8FflC1vrxxCf0Vy/gwLCQFQgXCU8XvdXNA2hsGGjN9NZFP+KiezLLLSi10NrbiEQ
	8f91oF2LgYTbMaVc5COHlHR0+ch4LRbdmwvF6JJm02k/Zf+2oIEL8356aEnQDl7kJFpaMHDUY+D
	4UPBzu6eTJ9g55cBRMr+EPt6LRc8psUZptIoiRxOS/AH/UFJK9yenmk1XJGZYdwREAgAwRzZDmw
	V9UJH2xoelV1fmplew8NuHdUTFRQPlkTnCO4YYFi15rloHqBRl5ltRK4OU2yBVCZhFfhMCJcaDD
	Jbe06BlS70tKbLTW7Z9kW4H2DsYPwOD0FoeLQaKNMcR+PbeYuCofnnHLdnyIrxAnqu5Y=
X-Received: by 2002:a05:6102:5e93:b0:5df:c33d:6e58 with SMTP id ada2fe7eead31-5e19376ffefmr480459137.0.1763478139053;
        Tue, 18 Nov 2025 07:02:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFahTTAn3km/Fv5c/lUYnZ8T99gA+8u4/AuP+6hbWLY3U4FqYlr7wW98wKjJPM+2+UvB5MCkw==
X-Received: by 2002:a05:6102:5e93:b0:5df:c33d:6e58 with SMTP id ada2fe7eead31-5e19376ffefmr480419137.0.1763478138628;
        Tue, 18 Nov 2025 07:02:18 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81296sm1392855466b.6.2025.11.18.07.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 07:02:17 -0800 (PST)
Message-ID: <9611094b-dd2e-4f4b-b1a1-4ba8817d0524@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:02:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm845-oneplus: Don't mark ts
 supply boot-on
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251118-dts-oneplus-regulators-v2-0-3e67cea1e4e7@ixit.cz>
 <20251118-dts-oneplus-regulators-v2-1-3e67cea1e4e7@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-dts-oneplus-regulators-v2-1-3e67cea1e4e7@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xvl51hMXSkKM3wRMwObUQ7QrzxSigmyW
X-Proofpoint-ORIG-GUID: xvl51hMXSkKM3wRMwObUQ7QrzxSigmyW
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691c8a7d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=BiXyI_okxTJ3JasmUDMA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEyMSBTYWx0ZWRfX2D/rDw8sNTne
 JDV5anE28uN4vLI1EGdhNYhdfXC/Gde2u8t4nQItHbUAAdoTikWXjz8CzQWgYaN0OSK4flyHAGh
 c0uDMLlIgxZY4m7y9hiZ0ePU/MqBx6f1QLWMasHixCuG/kiPXmFjuKYWqFJ1KelNDSu+IotbCXO
 GQX4ZYp9F/mWOJVhHrq7RGOsxG9UbNSsOZpYiE7JS3O7gyLSTEu3ZSd/3h3UvrJJg7UFbc0946A
 r7LVbS9QzBxE7nGqwa/eIvWkcChCBny/VavCr+o1Hf61+WRIVnSJpxrUyZJXcfUpr8+v1yniPoJ
 UpTvM8NI3l6Z8uWJbMFS4X/xn6vdWbEQ3UuEEVst+iJWcv4w47LxFv+Yns4Ke1oOZvhwEwijEgY
 QUHrljtP3GGOWjrfO+4sOWYdM/YRwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180121

On 11/18/25 3:52 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> The touchscreen isn't enabled by bootloader and doesn't need to be
> enabled at boot, only when the driver probes, thus remove the
> regulator-boot-on property.
> 
> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

