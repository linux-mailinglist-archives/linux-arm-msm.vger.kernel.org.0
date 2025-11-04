Return-Path: <linux-arm-msm+bounces-80290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DB0C30FAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 13:29:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B142634C46C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 12:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5400B2EBDFA;
	Tue,  4 Nov 2025 12:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NyeRX1+d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SsUFykUt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A022EB5CD
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 12:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762259355; cv=none; b=k5TsuLPUSwnFCvp9pknYxw+KrPYxunEbQbvZkifA2BZWUk0TK9DKr04FJBqneVjHbjGbMjY0FL08D6tjdTjv17+Uj6MjBK8bCp1LH50YttOn0pNVjqxfTEk53UAbKTv+W4GxSF+5yDL7VSryKOHl3z6lY0vXHIDLUxbMyGrHoe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762259355; c=relaxed/simple;
	bh=QBblT/dcw33cmxcjkpKgkXx90k/BCpzqUmz4XX5QMmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FryGxn6DM1iO1jEWBy7INa7XxxCKXYO9/Bf4KRo6a0nSmfUE/lk/zHfuoWOep3y8ZGJhpO977wQSCriRljhavINklvhCz3wv9oIDX35Bwxoquo1NM3VmTl/F6OA5Vrl6vtQCKExg52z4u0hPpxFN42QbjXY9ZDo7LWqOE/d1RrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NyeRX1+d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SsUFykUt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A49dYXm1659030
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 12:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jp+/EPItfX0Kl/yCkw+LiAmlIKMEk+RTTt5cVqxOpoE=; b=NyeRX1+dSm7O0fss
	UmyAbcSKh9oQKb4g80FkRNB0vq0Prq0hN/U9QNM3ITBhytroP2OFqll2ULPK1c2N
	d4rca2OKvWzjsbegCx2lW8I9Qthelw28GixwKA/l8m9o2AwoMNaIXW5wJscka1zR
	D0LDsVpYG12VoiuoNNetPxUCG45ogzGbh9QjrIFtp4qrX+qA0MgLyw3uti5jEXlV
	uEdc07VriT+jNufhAAaPZJTDU9dkLCI0024i/EJnzkpXQRzugoJIv38tiKt1p47s
	EKNIzCWxzNcY//n4/3HDkpVsqcl9a/vvRWiKkH2Zds0LRG7CRY+LhBEbkwi+4XqC
	t0W9hw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7f250dm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 12:29:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6a906c52so391231cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 04:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762259352; x=1762864152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jp+/EPItfX0Kl/yCkw+LiAmlIKMEk+RTTt5cVqxOpoE=;
        b=SsUFykUtIqF12stJqA+p0pYSpAgeExTJ2DGx1DCcnCoG6uD5jlv+BY7nGRsQ0S3SZ5
         1HYgjWt1dE8YhqRsYViB3LhoD9EcPlPSuDLiEvnRPaMHjvQVbM9cIVTJQdlwkv43a/SR
         BxpuIYkJEDg/G71U2UVCFllzNQ0bH9UKOGCEtN8UPdgeFjF4J/KQ/BxYstaTcyCRwnV+
         n4zQ3Fyxpv6mQBV+jD7jbRNglgaFU0OAW+owODaahd2ts9W1yD4Fy3bJwSiEY8p3r3N9
         BjEqiyKL0Odc5H2mj1P3R33OM223yKwxsr0fw/P8jp+whXc0ASbSf8jbhYoRnvPlzL8Z
         VtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762259352; x=1762864152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jp+/EPItfX0Kl/yCkw+LiAmlIKMEk+RTTt5cVqxOpoE=;
        b=d5546GNO2OX5TBOppfAbr+z0FgIYTNMZUO0GJWHigzNJk1rgErWIVL8IhhM+xkmpYq
         MKsHRzqk3FnuiTzwKOE8MBD+uk6A7IeM5w8AZ0p5TIAQGuk7IO45cQ7L1fJCnHsQKCfl
         nV/mbMuo66WxjYlJkDhkD8lJic0KfzXD+T1UrD5JQP0TT3d/312n8BixfHnOpa4u9Nyh
         eTC+SiL8G/jlClzaNn3w5DnxBBOa1L/tC9t9us9ndiN0m5LGwnkOfD4iEJysieO7O9eO
         2kst8cUgW0hHphw5z1sPVWr2Xrt+dA48dyIIObCgWtN4Xb8vim3Di5L1RIJaLtRs50Cw
         1pFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs0es+G0tZDl+mrsWLFUIem5ZOEpah3jwVzyjh8bluwVTR+HLKF6YyKaJ//4naZAoSZukPzv8B/Mj9mZzb@vger.kernel.org
X-Gm-Message-State: AOJu0YwGI0lxkstBBY4X9OxZZUVlGvSHeJQrFKEICPXhRweUIs7xx9AI
	f5LzR6Nd/CKbSL95BMMAE2AZLk8uT+HrNHiIExKrabVqXoMfrA6WBT+M5Hwjp43/qcRu+25Vy2b
	dlogdBsb5OKxn9L/Xjwtw8da3YP0+e+dPg0wx0ccb0f628AyLtcaJ8ASmto4bs6SNEEdY
X-Gm-Gg: ASbGncsBCrF63KaMC9diHvvXB9Ln5qLHZRJJPZByPxthaoId2qDwB3nxVARXCveX8R3
	GOKpKEriIhsLH2crBtuG7IdJDxRUBXXSQVfG+ITYgcKNAxMKorXOeR0FghpOVtuDgtO2se8YxQP
	EGLf1QhQAdBA1B1Vdz3IDt8FxBwOjBdIHFg1cnPvQW48W5b9AndAU5cmfYBBd1jR5ByZrsZJ42V
	fVVbZ3Mc6kABwTXRBMxSnN5wKAgKF9N0nkIQHTqbCioiuzX8UAFOj4z3PgWqxF4fcj9JkHp6yqN
	aBS6jGwRas/S1zgV7sVxCbtdQak20REe87s4aUnti4NJ4RIu6NU2z5BAZn37kQDzLUX2/jUfC4J
	ii54Hf8jLtUAhiEHdZtUMr4Ta1n5Bo2Nos47/EWxEqXw1cVkVt7cgScJ0
X-Received: by 2002:a05:622a:1649:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4ed30f7af4cmr136104921cf.9.1762259351871;
        Tue, 04 Nov 2025 04:29:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdHMSaJt9QzIHQX1ome9OCYQiISPLKujDe7y+SE1yj7dXfiNxPYHd/6dSCipjKiOGu+2MdGQ==
X-Received: by 2002:a05:622a:1649:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4ed30f7af4cmr136104641cf.9.1762259351300;
        Tue, 04 Nov 2025 04:29:11 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723f6e06f8sm211219066b.38.2025.11.04.04.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 04:29:10 -0800 (PST)
Message-ID: <29b32098-39ca-440d-9b51-915157b752b5@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 13:29:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Program correct T_POWER_ON value for L1.2 exit
 timing
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mayank.rana@oss.qualcomm.com,
        quic_vbadigan@quicinc.com
References: <20251104-t_power_on_fux-v1-1-eb5916e47fd7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251104-t_power_on_fux-v1-1-eb5916e47fd7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dNyrWeZb c=1 sm=1 tr=0 ts=6909f198 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0-KxG6J98Nod6oUgsXgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: SyE5mKMVYiZjpft8xssy0-dGLs-cH63W
X-Proofpoint-ORIG-GUID: SyE5mKMVYiZjpft8xssy0-dGLs-cH63W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEwMyBTYWx0ZWRfX5glnvtiyyc1X
 mTyQsFO/ghyLLlX8k6Rut4nagE1w86ERM06vZPu0UTK2dVQVp7tbMijvbxbnfAuF9bC8SVtP1Be
 ZQDWWMkMjWRmPfhBypJJmCw2ueFS8Bq/sAEF5KTk2m85OisHwUGupXkXqu5X/OoOQSkX9uIlsOJ
 KSGLh5kYlfaXIsuVGSBLqoi+cALczwXYPp/355He4jKAHok9jSCFpOI3ytAMrJUvgkaEXZDLX+q
 NBYqys4KLO3JnSmu1U5s9u2i/SRLBbnyKuTkQHe01iIgKR/LIi5o3vUU8PGpUksMtM3fRP5HzdZ
 CkMWQYrdCV+ldP2UoLMajE7rPEjfN8+/vCJ4qgwtx0tMRvOMG+YAer6B0ItdErscDa9+jNVCJ8T
 cLNUlWoP0GY5NrOXvVDP5ngo9fSQXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040103

On 11/4/25 1:12 PM, Krishna Chaitanya Chundru wrote:
> The T_POWER_ON indicates the time (in μs) that a Port requires the port
> on the opposite side of Link to wait in L1.2.Exit after sampling CLKREQ#
> asserted before actively driving the interface. This value is used by
> the ASPM driver to compute the LTR_L1.2_THRESHOLD.
> 
> Currently, the root port exposes a T_POWER_ON value of zero in the L1SS
> capability registers, leading to incorrect LTR_L1.2_THRESHOLD calculations.
> This can result in improper L1.2 exit behavior and can trigger AER's.
> 
> To address this, program the T_POWER_ON value to 80us (scale = 1,
> value = 8) in the PCI_L1SS_CAP register during host initialization. This
> ensures that ASPM can take the root port's T_POWER_ON value into account
> while calculating the LTR_L1.2_THRESHOLD value.

Is 80us a meaningful value, or "just happens to work"?

Konrad


