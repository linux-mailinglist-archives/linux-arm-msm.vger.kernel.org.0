Return-Path: <linux-arm-msm+bounces-80569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E273C3A3AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 11:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A36F518C4C07
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 10:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFCA428640B;
	Thu,  6 Nov 2025 10:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Swp4aVch";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X3Rx4NCt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADA51D63F3
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762424151; cv=none; b=JDZI2r6BveCaZgWzSCKmWi0dmKPaPK0scZMeTiQJbiM5Slh77BRuKfPskeDTVT/AXYUsDw2yaK7Lput4VhjjMjUKF7EoC1j/pSHmgFjokCkvZxoprrFMFcyovE4/Nq/fnn4YX26CwXmZrviDZMupiB38ShouLDs5u7X39l3Pbcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762424151; c=relaxed/simple;
	bh=sW/06KO7x9YVvqvYyRC11xa8mKgzDgn0IN+/JBGDhEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O35ivxnkWwfaxNqV1u+W/B7GA2nFaIT1O2JJAHS6MvA7IZE753bWcrld9GB4cZCcPC5QR9TyA0FkEuwQWrBEeiWgbA0LQrN+tUAMQz0h5bMZ84wUTgjU8/OrlSyIaYc6yjqwNFrMOmvQ0mnpUuoqmkPMLBp1EwY/ZeWylPvDeXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Swp4aVch; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X3Rx4NCt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A68jkhQ3383553
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 10:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sW/06KO7x9YVvqvYyRC11xa8mKgzDgn0IN+/JBGDhEI=; b=Swp4aVchSAtCKZsq
	0OOqPrZHUDKTQk2eTYaFN/WH7JkW9lYasmvbUY1CDozJiFOcjoQAvnJcMn8gJXQT
	0AICSy1Nd85iKKp8JMgCkcGbHRdLAWXvhLQtJOjglE/ghgKSu82X2chqnPTXnyuU
	65ZAirVp9PvKl47k8zkG7/S/wnrvsgtAO0ttHnLoWP26UukOaEw6/o7dcPiElAIE
	W8+WmeQ44s7ikm0TDlU+RzA33XPEfpqnXIke0MdtNGiOX6xJ0e9v3Xh+1XW4+33k
	XnCaZ/vYq3guQ6eUfspB6mAMDJ/F1xST4uyxoQ3xVDlG1NSmTuhMUNZua2kBssqQ
	/eHNrA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8reur8b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 10:15:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed83a05863so1948051cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 02:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762424148; x=1763028948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sW/06KO7x9YVvqvYyRC11xa8mKgzDgn0IN+/JBGDhEI=;
        b=X3Rx4NCtQ2Zy4qeXyZ2apSNpJq4dS+cDJzmAh0Vxjaeia1C0l2Vg2fkR4j4LBvRMYd
         ABYLcqbiVormWo/Y09Kwy8MmWKqIkjRYZSzEUZ+Ju+zBT18RfYLyD80XaKXH3nBRTUto
         TcYHx1Zt02VdZOvHuqINX3UqxTnCyem2Rhw44Aayp1NE1VCnYYMDMJiHDfJUHMDcdWV3
         xMi9GcUReWiS/owVORC05eJeMPxc0QLLa7j239VU709dooaIAinfnj0YLj1gG8vTA2In
         rDWzRrYL8KH+dfjHv7677YTIdTtjfLt48O2+brKo9xum0akcAxZ30KO4Jh2EjU93hj78
         dgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762424148; x=1763028948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sW/06KO7x9YVvqvYyRC11xa8mKgzDgn0IN+/JBGDhEI=;
        b=tLH+dcrHyVx2UIFsqnSiSA92g3vfa7nIA6zTiiCtPlmH9fAPJbLq3/PiSp/G55PSiS
         kY5m7IafOkMUs1tp492++T/UCw3wITEuDOQzvcz7sGNWWC936tBRT6l0ahT5wAtqmCiR
         p6Fu33KZj3p2QT8YKIQEbsrWEWd7t5hFQke8MQrHtxsj8fTzDg/6BK58IlvFEdWuwPxp
         qIkkDBkZITNtIAitigNZBVP57oPO35dwWhDgAlliRRrd89PjgZHVFwHNGKr6WPtfdJe3
         LgS2qWsT4cMDqcHmJ9pIkCfpOjwNZywsviEfRI8bA/BGrna6zer0xIXvhHkO/XIuZA8a
         yo1g==
X-Gm-Message-State: AOJu0YyH6hvoBvLzRC2uLtxtVvschBV75GV/Zp1ME4cswTyRXfS780Uw
	aRuVbm0N3qCUQ8bjWGWgUlqw6YtnEnLOom47a30VUBe+koHcXf25Oyq//PQuJ+UwhXqGGeaCBFQ
	Gtrs7vqOC0icsK0v1NVx/QysPY3NUnXtKcTpTvV3JdvctY/htyI8gPFzkoTRngZ7c+eYq
X-Gm-Gg: ASbGncueRkgjucWG5HyU7nA2o9AD/uNc/JddV0Za0uQ6onuQkfxoNNeX9YP5C640Vrz
	uIwGjn5atAufPdIUoISW1Q+ONSwiN9YMdEc0x+rUy9CwCLzfUomBdiuzFr9JznS9i4bdzW1A+93
	+1MG/JYq9wqb48CKxM1DYcrkZSgS1eubmIknSMHSHvHtbOS+sY1guX0ekFCKZuV65Cyc+ddOR7Z
	H05fLCWe2At2hLz7y+k95KwHNkvL20y+idpWwJzKT6Vb4qZmiixIIqdXJt5NFxdNAbqqzKLet7y
	Dh7g+pDP8UutVy4cgfTfJGa0MgE09CpEe0mCnc2Hnbg5wJ9GiWusfQSbePZ09j/7gylXUshpD0M
	3nxJRiKtBw+Qv1SYOxvV6kc1z7ZfqrGafMznIOOv2MSfaAzbGziw7Qoaw
X-Received: by 2002:a05:622a:6bcd:b0:4ed:7f85:225c with SMTP id d75a77b69052e-4ed7f85259dmr20669921cf.10.1762424148505;
        Thu, 06 Nov 2025 02:15:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvO7NovlZmVexkCrJ/x1iqSlqkoHta3xpjkhCpmmF9whGLqj96UH50RkqjdDSUCAvBN887/A==
X-Received: by 2002:a05:622a:6bcd:b0:4ed:7f85:225c with SMTP id d75a77b69052e-4ed7f85259dmr20669751cf.10.1762424148021;
        Thu, 06 Nov 2025 02:15:48 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7289682128sm177009466b.50.2025.11.06.02.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 02:15:47 -0800 (PST)
Message-ID: <29ef2def-4073-4a77-8437-41cdfac2fa9d@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 11:15:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: Add backlight support
 for eDP panel
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251106-hamoa_dvt_backlight-v2-1-9f844c8f8110@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251106-hamoa_dvt_backlight-v2-1-9f844c8f8110@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA3OSBTYWx0ZWRfX5ik7gHqiDgPt
 Pz0BWBprv/MfhHhEWrak7KM3edyf5Eumpn98CJMvTINNzbj9SMngTGxVnwSRdk3MCzRmuzLd4Av
 cm7e6NFCgE/7FXS/Ou3vtCyrZ2wFrRF61vE3uWuCF0qhe5WqK96WkUHXuCIZOHlm+lkn9x1SkRW
 ARyFF8+W/AZEr1K6oxH7U8Q6FCpWVjH5j8MfEpjorh2eAhoh/BgEYrt1cw4SuHnqmIVK7GKTBrP
 ZUfbo69I7X3+YY5Uu0dzQLLhdUMh7pryIc2NSOK+mFz7zkV+B0zEhZb+Yzv2HJzY3aOR8Wo8jqB
 77QxdYs2Gn4Eck5tDWsXRCgInkF6y9BoZjtlBO9goG1qC4qMwdLRe2VPvk8KcygCECIemL3AlnA
 ZIVzkcz6CZvP0VWEDHnTNz0g/Xdmhw==
X-Proofpoint-ORIG-GUID: W-rS9UQXAa99siWHMqs9OnrKvyuUqPft
X-Authority-Analysis: v=2.4 cv=RrDI7SmK c=1 sm=1 tr=0 ts=690c7555 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=nQNFA-VO8Zg1hjSIiBcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: W-rS9UQXAa99siWHMqs9OnrKvyuUqPft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060079

On 11/6/25 8:12 AM, Yongxing Mou wrote:
> Previously, the eDP panel backlight was enabled via UEFI. Added backlight
> control node in kernel DTS due to some meta may not enable the backlight.

Adding the hardware description to the DT with the reason that some prior
boot stage might not have taken care of it is not great

How about:

The backlight on the Hamoa IoT EVK is controlled through a PWM signal.
Aligned with other x1e80100-based platforms: the PWM signal is controlled
by PMK8550, and the backlight enable signal is handled by PMC8380.

Describe the backlight device and connect it to the eDP panel to allow
for brightness control

Konrad


