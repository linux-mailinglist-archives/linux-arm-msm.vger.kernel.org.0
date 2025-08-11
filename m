Return-Path: <linux-arm-msm+bounces-68361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A527CB207DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 13:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD9413BFB16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 11:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F642D29C7;
	Mon, 11 Aug 2025 11:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7u9EUKJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93132D3727
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754911644; cv=none; b=F+bB34xLnKPNTqKdpL6J2YsTUUc79h3pNwnUMRDPHbKbF+48azpJ+7ziC+32Ae6JUsbYBMEzwbH14D5qGuKJX3VgycH+jq9C3K+Ejo1AXH+Y2nxfyVk8GmLfdVYDUnLON8B8VX6nKM3i21fKf2yG8ZxCrMQw8gQ1G1tNfQ2Emcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754911644; c=relaxed/simple;
	bh=sNmlSmfYdwXOQBv0vavVqJDC1VXG+HeHq0jxT4H3q1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T9JFVO08hEJ6yfMH3zPAKgqDRcnKDztYqSQMJryjpj49fZzgZPXMhdeYCMUNJGe1K/QWTGd5ndYzvuIL4EHJQEO+EvAMBiQUsBlkMN5Ior6lKZWhMCgdkjws/PmhhsGxxoUxtPINGTm4yMkgekDA01VNZ/j5kl0M6XWIdicZTQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7u9EUKJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dAOw029203
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXqAgcvzQUdwo9xEC5/EH2pfW8vHuMbHVvogbxJ9Lj4=; b=H7u9EUKJwtYhg/sN
	aChKtQBcmW1gHZ8YY7jeKtOsVpXIZOeENSn32QgfNjnOsV+nj8R2Jm6uleJcYt5K
	/jXQxIxszap0mQZObpyO0bn09Vxon9SZjyl5swci6+9NycbM6RhepiJSBztuXMVY
	zQmeAgmw2yu9MraVMg8aVynIQ9AdDFRmcQbEfkIpiY1EesOlIe2k4Npc+4o+Cf8F
	tP4xUS0reB0VQfo+r9dsPCTUL6vnSHBZdXActXtoijk5kmOtnsDEXoOm3r4j/MWk
	yGMNGye6M5+UK3T3jyI4jy9ImEn6z/ekIIC8KqO4lpY30ME4QbwY+/NsItU/sA1D
	I8mxHA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmc4pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:27:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af23fa7c0cso12516201cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 04:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911641; x=1755516441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXqAgcvzQUdwo9xEC5/EH2pfW8vHuMbHVvogbxJ9Lj4=;
        b=nVT6t37tnXrr5qbErg3TtUtYmmEOirWcSINmVT9lIYR/xtVuqvYMCkenwC85kbCS+b
         DfpgrwtJ5mpb48tFCnPhzuheITOiewSdYSZAffnu82r6SlYFgZfKOv7a+2FRH2j/pf39
         nCCJEyvdTmnYgYZ6roPVyBYmLU9Y4kHmtFF91Ov0UHAGZyzULIQTK+rUn8imwFcOjAg3
         /mqT/EMDR+phvYNN0hl/spvvgUsU+6cK2Ys+HcErfVVQoc6KgpHpDPfXFj8hG9iiEpLi
         FpTE7lmvEvfzPdFxKndMIjuIkji2h6KGKzDNMd+t3LUpDrrR8lrAdOMRC+aZXFuVeerM
         gUVg==
X-Forwarded-Encrypted: i=1; AJvYcCVYvkgpM398wdXSb/p8Ij47XMWejqZDF94fuFX3YLMD6t++m7pZJg3eVmGfJAcBN/rHYSVOIyoSVHjKOtst@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe5uGv8fkeIJmccKe2DGoRm+oc6ZVvezH39Bo/o/ti/y5TfCOM
	xCAu0gOJccbvTWLqDMCBcxAhG/PGdw2nTN1ZUySxRtMz9L/7HE/eacICrVIaOBuKxiHwKeYNDTx
	EE++dtx/+GvD0KYvPJ9RIyMfuYmNMcYfT+9glQEPS5OVOHPLq+8fJtKIlpDmJC8beVNtR
X-Gm-Gg: ASbGncv5HcXwOCMLD1QTga/UQtN47T6duQs0RRKR6/E7fmNw1aXt6mCGF81znz5G0sP
	BdHX+G2xMGHQsSEZElsHYK4lNdl4seBCWRBcU6+EZBInUBtgQyNKYZKDMV/S7ZgI6+QKUd2QLWc
	tIABsdj0SBrxlQyCrJJtRyXyFYC5QUChUCwIecOFZ6VMO4T2umq9hvcsSfhoVelztXj4YBGaAnP
	G7MaqZEYyOYtOmKtaC1n2JWMjT4PiEomxLbPT2kGFrkPQFwKKe4+itfJ1Xd0JYkhhyooSyIO9XX
	mR3KsZwYnPIy1Cc9lDwGeq7x4NSyHUyGvBZtyOTdIfCJUQNjKc8/QZ1GIYMv/JweKwZ77SetIX1
	Y2+Ac7hcpGY3pFXr0DQ==
X-Received: by 2002:ac8:7f83:0:b0:4b0:af21:80b2 with SMTP id d75a77b69052e-4b0c16c4306mr56044961cf.0.1754911640501;
        Mon, 11 Aug 2025 04:27:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB82t9+WSwhTTLvNNNhL8Jg4BkUYV42aaK9LLPylVt42U1QY8YH8fULVeSO7VZVHjKz4kfTQ==
X-Received: by 2002:ac8:7f83:0:b0:4b0:af21:80b2 with SMTP id d75a77b69052e-4b0c16c4306mr56044781cf.0.1754911640094;
        Mon, 11 Aug 2025 04:27:20 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af919e96050sm1997444166b.0.2025.08.11.04.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:27:19 -0700 (PDT)
Message-ID: <c7be65ca-58ed-4a57-9294-8022927a15ca@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 13:27:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sdm632-fairphone-fp3: Add camera
 fixed regulators
To: Luca Weiss <luca@lucaweiss.eu>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-6-e83f104cabfc@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-msm8953-cci-v1-6-e83f104cabfc@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX5GEw6/epdXTt
 d+7EmvMlnG/KPBkcf/YrU+JC7L1AwdDOaZCI4rbsZVug7Afykkc8cmbscoGFmvCfsq4lhzt330H
 CjEb8A+mqTrd8kVxZcy49ewdCv/RvXN9bSo/s9nNpKzgW7tj+sMOhHs2/3EDVpWXP+O1oo4iWaK
 oqfxFp0yCLP5ePNppAFLhO3WxHbJcz3befHFsYy/kbn9MmteAQJLnHchwx5HhHyiRCcsNEDzLfb
 f8zzmYLmRSHYOHtwX95jZAxaxqsMmLsISjery6HKzAp9prtNlKdtK32W8WSBQJvFOQPaFH0hpnN
 BSP4fI44BEKcE89CQogSGY/1wP8ZkmGlp6ERvopwGdvSyrva7PeAeR60BLW0t7aEkTD3OkLvciy
 US1EAsx1
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=6899d39a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=M0Bv5317UiM6gxb-jmQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: MEF_FXWY0a0Lro3owDiHf2JRLshn_rRN
X-Proofpoint-ORIG-GUID: MEF_FXWY0a0Lro3owDiHf2JRLshn_rRN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

On 8/10/25 5:37 PM, Luca Weiss wrote:
> Add the definitions for a few fixed regulators found on the Fairphone 3.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

