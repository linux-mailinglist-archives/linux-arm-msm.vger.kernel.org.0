Return-Path: <linux-arm-msm+bounces-43892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBADA009C9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 14:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 696191640F7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 13:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636121FA248;
	Fri,  3 Jan 2025 13:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ilRI2H2i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34F01F9F71
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 13:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735910069; cv=none; b=pSLX5BydtsxzFU+5AWWssHf2btiJ8gViTVP/+Y+j4nGbF+PyCbtNMKk1t0JTrjWdJfrzGVCS0+hzcxWfIxBPOqkTEBgAx1OXDiJF7yZf+is8Rc5rfa+VVfWsAqcAvvpYF4u8MXdXa5yWTmc9CFO0L481GlZXBLziU2TY0yNobWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735910069; c=relaxed/simple;
	bh=2skwZes6S2F4o/TX9dsIHLJ7QRN9SNxYlDV4H1y3bXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LXnfglH93CbA1oeBC7N9i+IZqdx36WG+YrlNdfB8oLo+9VfscajR8AuuBen2xzUeRWALVEWP/z3N/Fhh5C3zH7T87OvP8314hVD56nK6h3XSF5uzgP9/fqXN0XOLmO1I8X2nEUqAMhq1sE88ywCqtevLvs9SyNatWehIQ8ZuaOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ilRI2H2i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5036Z2CS011018
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jan 2025 13:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zs4a2hB2iyjshiuXvUroL7xY8a8QZWPTWdCIATDXiu8=; b=ilRI2H2idECs2PmL
	PN7mxrqgB9zaEGXw6A5EdowL11CQOexJZdIRc74ryDWSPooNAycjSgO8VwSvtWQs
	VwliAx0UHvpejLOeW2Nld/J0xwWR1FLJvQulerfmGsf8u8wRz+W/NfnTFWuKwYRs
	u7l439GAHvM0PCaCivOYibmEyzBBSFLbNBEUSfzfLH7SdpxyrGaS01aLLyPH65El
	lWakqyLHICgRpJ0oV3+PiCLteuXV5ObWnbMu+2FB34hkpRzSqadASfPX3rutG+KZ
	3ur0RV788DNcKyLMn9LoD5oFxcFS6vSg3OXH6o7oV8/TSp1/chScOkDILFhziPsU
	XIQ4AA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xardgtv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 13:14:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4679af4d6b7so29349511cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 05:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735910063; x=1736514863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zs4a2hB2iyjshiuXvUroL7xY8a8QZWPTWdCIATDXiu8=;
        b=Gusj/JrjH0FQf3cf9kdGTgXAeTWghOK1wmoyGlzmIhhaVH2n+DrsrfSc1SdnuEBhwk
         gd7gKQl9b8AR2VGfYj71BKuQpMrT5c8W8aBFpMLXL4S3HNxeajh2bugi0uHO701Hf/q5
         +twE5IxGu/uj84ADFjxrauO0UUtX5P8YjXDZ0Y2gFIZsWivr/8z7WQcTYnCkbv0eQHSp
         0jA0zEkP1pS/vL9Z9E3ZDdDwnrkhRbOArb9M5xhAkq4mAhN008je4CT2EQo9Orl8arOM
         6aTtM90XfGO05gMvHYyakf4UyiMN+Z4AeMwPXqDMYTygCU4Klf3A6Jb/8lKbkfdGAD4p
         G0Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWGNT8Tlwhz9H7ZmXrzY3jt+dWmqSSW1b9nqnhi5h94dTpxO0UF8L06r9/HGQjC8XgPHD4pjnL0aStwWczv@vger.kernel.org
X-Gm-Message-State: AOJu0YyNyRa9eKtLWAMVzPjqZ+7RQ1npjGkZSA84MzuYXS5dTn9+WnCi
	z8mmAAfezVM6M8gUjlZkbXc/xI6srnDyM0aLwZKDbrYkyyuMPxaJUwJiAfYTJZIQE7TZwXb9gbC
	zrxwBw+29GLHFAGo0XHfKm3Og34eZcck/6UnvJEGQIqIrYNrJJ0RXvL3/Et6Bi+Yc
X-Gm-Gg: ASbGnctpcQgf5MkBw+Hb7eianayBji7UC3UPbsmo7dzQFS8qLA56Kdd8maA+Hh448dB
	AMYvp1cDOdRVtjt/qhpfW7DIRijl3DPRPTlsm0BebwIvaxabIuYT8V0itfWwXZgihb7pghYRjya
	0O3timsu/8ApM9KoIBiRqg7qRbm9FLrfhdx4pr+DsnkP2kNdkslU9q4w44JXwdcXZLuGFGfoBrS
	3OjAOO8S9jZoscSpo4B2eQlfaPSqIx5DVNQqrIGn2Ks8lPLEt0OUJ03WTDk2+Ps4oJ9Grw4CMbb
	0iusFoTqHWqc4ouTXa4i0+ngJFDrIaMe96A=
X-Received: by 2002:a05:622a:2891:b0:464:9463:7475 with SMTP id d75a77b69052e-46a80758455mr163481241cf.2.1735910063451;
        Fri, 03 Jan 2025 05:14:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtSCiX+k+KsO86q71/HLEx4LrYnqWiPisT04z7RdRIYvR9bGfBVgELyJkqShujMdRnUNYBOQ==
X-Received: by 2002:a05:622a:2891:b0:464:9463:7475 with SMTP id d75a77b69052e-46a80758455mr163481071cf.2.1735910063124;
        Fri, 03 Jan 2025 05:14:23 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe490asm1890162166b.98.2025.01.03.05.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 05:14:22 -0800 (PST)
Message-ID: <dca2e244-873f-4c3f-b7f5-86e6bec3d9fc@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 14:14:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: qcs8300: enable pcie1 for
 qcs8300 soc
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org,
        manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, kw@linux.com,
        bhelgaas@google.com, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, quic_qianyu@quicinc.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
References: <20241220055239.2744024-1-quic_ziyuzhan@quicinc.com>
 <20241220055239.2744024-8-quic_ziyuzhan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220055239.2744024-8-quic_ziyuzhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PABhxBqnFM_iCUFRplDJqmiefMiBJoh6
X-Proofpoint-ORIG-GUID: PABhxBqnFM_iCUFRplDJqmiefMiBJoh6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=562 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501030116

On 20.12.2024 6:52 AM, Ziyue Zhang wrote:
> Add configurations in devicetree for PCIe1, including registers, clocks,
> interrupts and phy setting sequence.
> 
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

