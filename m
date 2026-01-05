Return-Path: <linux-arm-msm+bounces-87533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FEACF51D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 18:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E153631066D9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 17:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17858309DA5;
	Mon,  5 Jan 2026 17:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EE0CTSfh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F7NyXOIF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBF429D29F
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 17:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767635522; cv=none; b=ou3VqC7RYRbBW9259emLdzZSK9Ba4sXCMXfEytQWM/zP2zsO7AZUWPozY8NLsOkkZN59ibrX8/2FExvGUH632hpQ2G1MfDnP3fvFE+H619MSPumP6HvnBurtxz7TWr6Fr5qSn8o2CUg+z3BQd0v9JpUfbzQ/L9dLEzANiarZ1ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767635522; c=relaxed/simple;
	bh=mcG8x5F9Z1C1LIjWET1GizE2C1cKQKGLqxcoxMn7Jnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GwFU5jkXTYG0I1KW4OAIIJeyyXVfM2ueTEas22zXQer0SAq9tcWfv4bDUmL6/gFlLyI8WbXOw9fAqeXSic6SJoUXZlvd7sOIk97hiL5rlkh00daKiDyM6gyy0/sUv7wB+kJTQ3s/kHtEJPDKovtz0eIkVa4UJ8GT6n6L/tWA0fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EE0CTSfh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F7NyXOIF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605BnQ1j3520978
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 17:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8N3PkKIKLlmnCJHDX+aR4HEaByyeSZJwUWPWA75UhVg=; b=EE0CTSfhGbu9rBVy
	uuchbKDKBTfVUFOxPKSr24x+ir0RjxvsmEWq3SnlKzvlYGvu4TbetXWhXQ+Gazda
	v/wmawa+K6Dh3PusjCmDYTYWgg1boX3/6sTu7piOwIAJk1sUfFf1SbQfCEDCSr7Y
	dpTKAJJ7H4QdqzmFJyh0m6sPK/hCX2JYqS8AcmLX0ejvLQuOaFVLBxO/R9Ihe+Px
	+yCbEfe7JvUeBPeE9tE9wej5hKgn81jDoZnCm8lCh3LvGeKiuud4saLltX71UDWQ
	Su/eW0+jLU1O7YIWTCMVtTOpg7JXTuEHv9kpqedF6/RaAsi4rhkurIzd3T6Snz/U
	q31Q+w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg6uua57q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 17:51:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b8b79cbd76so771610b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 09:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767635518; x=1768240318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8N3PkKIKLlmnCJHDX+aR4HEaByyeSZJwUWPWA75UhVg=;
        b=F7NyXOIF4mRTOH07HgMA6JBuN3oK1+oPj56VWtXDtW7FwmazNto3NR5c7m5WykZMNF
         /VYLioOyOlag4ojT4JrS407cSPB+hce0b6UKtnb8WD0cdQKTWNZgiBEKD5Ijd1Vq+F4x
         quU9nS861t9jSGf/sB1MaNlMMz42cQCZ+i2ew5mMBXI44+MGRV82ESx3zSe2wjRsiEHi
         WrBM8Cye1WnjA21HJpsIT7s8TWR7g7bsdp/dfr92X2A2X3ip/pxhNWv7ScEfUIAqcANv
         xjoobPrQF1t1ontdK/2x+NsYFCw3VkraXawShZOaOleV7sURU4CmZex+lxSaJy91CVmF
         djpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767635518; x=1768240318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8N3PkKIKLlmnCJHDX+aR4HEaByyeSZJwUWPWA75UhVg=;
        b=OcWrxF7sId5JZqTa71iVnbIfeMKFaL2+n+UpV+5YEslAJOtvUZcVJ25mJA/c4gERci
         z6lEe6W6A92jBr4vZaAh/TiSI2LRZqpsPR2H6MA7s2KfW0v7mRkLnhBUjaC8TavfnnYP
         jPvFm8kbTaRUhAdM5pXmTQrjK53gZd6gwdcx1jK/ZI9wCus3FBuYk2trvb7bl9tK+hLJ
         fAO2s7zhsAZvYfsEmL5WudJsCtgsbYEZfyhIApmnkFlwxKznaodk93dNL9ZWSKbuJdCK
         YTqrBXM1b3gSRFKgyzGPqrzlqyCujIl4PF8L//SLQGi1UB4hp35VU1wDoYfsYsTa8ofi
         dBbQ==
X-Gm-Message-State: AOJu0YzgX9heZYEEIoDfBhPh60ccvsvoUl7TpBJP0FnE0tgNgyOuL3kH
	NQyzFX8muALQfyfx5TLP+/MiASQjOQ6pMR10kKIjekxVNk4Gj7DJRmSpjy3WvmOcO+ZN+4FuYsb
	iqLo2tvDVxXp765aPmrrWxbLo9I+js85ErUITQ2D7u/IkQiuGbdlo0/BZSwfeMjoVWk2y
X-Gm-Gg: AY/fxX4f5liN6SteicczpoA+Y/ovjuJo6XJX5cg0OJ3neCTBy9St24H19wu6geHpR64
	cclSOZpy0D9Sr7OOjbf3/YcMX7tOQeM2t2GZGjmdlFZusLqeBX+aGUgBemwG43mYXMcyhuf8trI
	q5fpwXnKD4PmJ1ys55oUNu1ouaqdZA0ZIKxpCspYc5HGd0DrOAQVQMAY2XmF2ijnLh9gnr0P3Go
	bmmdUi+kTMSnp1SCuJ6vDZFCQQCSQWYdnJ8JyhmmDV17+4k73l3HSt9vbgPgmJK+5jXJUL2m3co
	5cTmAzKBTVNZA8nmKJKTqRuW2fnMfcZrxGtUu35ZhSLy+a53cKi+BPZjwf6DuSGoDBDnYoMLcEe
	KH+5GDascVYKsm0ZiSLhQnb9fTCpz1wHM7JOanQ==
X-Received: by 2002:a05:6a00:2992:b0:7a2:7058:ab89 with SMTP id d2e1a72fcca58-819439e4db7mr770b3a.7.1767635518113;
        Mon, 05 Jan 2026 09:51:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfNuHXhwkvebkTFfEm9eDPo7q7ccR21E5fo90mIc2+aY9d6KmqZcpRLdzvOv4+H1SizmJpCg==
X-Received: by 2002:a05:6a00:2992:b0:7a2:7058:ab89 with SMTP id d2e1a72fcca58-819439e4db7mr749b3a.7.1767635517600;
        Mon, 05 Jan 2026 09:51:57 -0800 (PST)
Received: from [192.168.0.195] ([49.204.24.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-818770cc5fcsm387555b3a.2.2026.01.05.09.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 09:51:57 -0800 (PST)
Message-ID: <1da9e178-c956-4427-bbf9-da5ba0d6bd00@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 23:21:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20251120-b4-sm8750-iris-dts-v3-0-8715442c30d9@kernel.org>
 <20251120-b4-sm8750-iris-dts-v3-1-8715442c30d9@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251120-b4-sm8750-iris-dts-v3-1-8715442c30d9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE1NCBTYWx0ZWRfX3CQnXM1QzeXz
 MxRqzYojH/RdKH4LiKgwABu0OjR9l5OepDBMMKnhB8n10QypKomTKS8rUXBgFr3pOiqsa/pG4XE
 y4cW/XOLb9Mf8ujUDAvy4lNbNoKsyoLeDW9Wucj3Ruj2OBpwo7AbvX4jVWW23EaXiMAwhrmfEJX
 P3ZFF5q8qPzVqe4t5kxm1/ZIyLym1AzRpY5AfL9suCUAa2GcLrP2vjPTe3E5XG7nXLgGaLR2MKa
 gV44tLRo0kEde7+VGoddURMe95+KxH2Sw85QtQTpWEBTE68uQFk2WjWFwyoCcnD6zwfQaJ2z0Vg
 hLxFh7CgpNnLtbV/w899fuxhNddoDfeCqvxHHr9c7ppj7y2U9XtvUiFT1AZAy567JK/gKI+fQYu
 ZVQqRdgHB75UNNYnGXf87g6yCb0vV8ENUtnG+2Aje+1LaE2WzOHCyQF8Q309NAVSz7nMygakVAy
 aeHBrM0EX2CnokXlelw==
X-Authority-Analysis: v=2.4 cv=eZ8wvrEH c=1 sm=1 tr=0 ts=695bfa3f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ODGvV0xkDf0c6Ahx0OzfTA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=S0N0MQetOBR7HoRL5_wA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 2NCEpBnbFRs1Ld6KEP-8Q9FTf1sdRkol
X-Proofpoint-ORIG-GUID: 2NCEpBnbFRs1Ld6KEP-8Q9FTf1sdRkol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050154


On 11/20/2025 11:03 PM, Krzysztof Kozlowski wrote:
> +		videocc: clock-controller@aaf0000 {
> +			compatible = "qcom,sm8750-videocc";
> +			reg = <0x0 0x0aaf0000 0x0 0x10000>;
> +			clocks = <&bi_tcxo_div2>,
> +				 <&gcc GCC_VIDEO_AHB_CLK>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;

The 'required-opps' are mandatory for SM8750 videocc, please add the same.

+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;

https://lore.kernel.org/all/20251126-sm8750-videocc-dt-v1-1-a848fbfb257f@oss.qualcomm.com/

-- 
Thanks,
Taniya Das


