Return-Path: <linux-arm-msm+bounces-48980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5292BA3FF2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 19:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23939424DE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 18:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B356F2512F6;
	Fri, 21 Feb 2025 18:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HpvcA3GX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46218215F43
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 18:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740164372; cv=none; b=aaS+99hq6a6bsebOPX7Ca9S11E+S9AQ8ShiFk0AACTOlCdUSFT71+71lYBM+ox1Pk1isKNFcNeZxozWJ4f3Tfwrf6Q+wOzrKFjenWeimLQDEXk5sXDnzSo5IAQ9Q+YvwjRAa778d+CrFI0rbO1iIUO996VHOhj1wcz/QTR+Zq4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740164372; c=relaxed/simple;
	bh=bouC5Nwy+RlowlXK/60T7WNMCMlxshS9jSXH6cFWoVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PC61dLmuatVeydS/THdxkZTdZuOiw9nQkCL5j//gf4ohWssf46oprvnnuMonvcoRsy2A0jhV9Lsg667nqquGIGilBNjbDf5ZcuHeT+2aRPhkoDwX46HujD9CBznRoLm+Zp8ON0YyXSRbp0QUmehNSNBvmpyGz7ecEyd7oTUWCXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HpvcA3GX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L9DB6s026302
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 18:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bpYhuaG6BS0WUe/aUEKyw24PzywfV0tSN+SL5OU5B18=; b=HpvcA3GXXclkqdjY
	7Yba8FNhybRyClMZBkXj1Y6Za2X1iUByzE0y40tV2Gy1NOojFf6df0h1ec3WZGHt
	LohPp+S4pPBnvxiXxLBM41AovKgBjq35QSlr61XgjTs1QemuXXehIdCmruTMwZna
	z5tlkH4rp1fD0jedbTQH4D76OOhJ/9/tFdWYyL9trnjdu7YAB10+iM7LX7Gk06FC
	521sEDgVktEkFI/RpZ3QyuHpA5ueS2c5SBe/5djSD9D4Wj2DR2lLZ3QeXW7BCEiv
	teI6vpSIQVkK+OiDEZ5GGE7SwxuNesQjoosiILIAPKSiPQWwFZY2909SuhmK0pIb
	UP4SVg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x2r3w5vu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 18:59:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e65d6882a6so2270626d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 10:59:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740164369; x=1740769169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bpYhuaG6BS0WUe/aUEKyw24PzywfV0tSN+SL5OU5B18=;
        b=dc925nLpr+r0n9RYRV8UW2yn7ym5sNYpYXirjcHl/P/dRgPNQGJ/6+qnJi331oVLwb
         qZuOZ6iML5JIA7BQD09CRvatetIzlp8ClOH3DHbsZdztp/5pMFmbGgInUvIjeWuQsEBh
         3dA2Z0GhfdJhNn4s3d1GPuU8jkyIq4htYm0jMmmx4KpZTKa2n4aXaU4atRh0/dntuqOJ
         +NQxLurLAeR/IamYKK13lp7SmNPmFeRzBBoLbN+8PcnWOq1JqOca0tLRiVGTeZya+pSK
         r1lvzN+dVjLNJ7uMDFXbapJPURGGdhk1UQIJFBZDULL8BOB8VASQ9tGko2heuaXst71y
         O46g==
X-Forwarded-Encrypted: i=1; AJvYcCVofN97GypkOQjLOqhUr/eArXwnwOrQR3eUiiubRCpY/8+0ukn4ohqDz7qB7AbK9zhPOrhui11Ex+M2Xy9q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7iUTxOGSpYuDHfeSxe/WrosNB5Gr7aNC6UGnxfhnynd+gDVIf
	ebM8r3PPwp/FrMOGa44pQLSJIpZHthvZIi3gCdSsdeYfAQhBumf0LaAeuBZAB025trVX+zCNhJW
	3uXeqj7Xk6FecFnXQglVUxesXIiPMFZe8fAF6wXZC3mQdxlbJHe18TXb/BZaO5U3M
X-Gm-Gg: ASbGnctlvDaL1t8JKtx1VP7N3YlLppMUI7F8QMdeT5BNb+hti8AS7C9S7c2lZueyEr9
	mPEoeCJD9Zw7/i2oLUHkv/de6qDO/ja1JDx13l4XmhOXcUIpwg8lO7FcB4oelPtr1vBJYLGNVqw
	qFkhlBXHQrdfOWEQxyt8+Xlj1OLCmdEYkEnVTdiCikzKUcMw9KAMQzUc4FukzD7/ZGWd5AtqLJ9
	sw3Km06UmtvP1u2aR+++lY/9d/6e3B/gz58UXze8OcN1f47HI36ggU1AnO4pNy10WxvEurvfzuh
	4UxxSBzR9lNsdupe+9S9kgj3Px2QzU085sF2fGfbUmFsIYlLpIYRE1QEKD91DV3LAMnNOQ==
X-Received: by 2002:ad4:5b8d:0:b0:6e6:60f6:56db with SMTP id 6a1803df08f44-6e6ae96757cmr21396526d6.6.1740164369139;
        Fri, 21 Feb 2025 10:59:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEino11aOry+X9myvSrTFE6WwjQqF5PQC/bw4hFvpDYxqJCcY8oQkdzhaYDT3qBz8d5sIVzIQ==
X-Received: by 2002:ad4:5b8d:0:b0:6e6:60f6:56db with SMTP id 6a1803df08f44-6e6ae96757cmr21396336d6.6.1740164368823;
        Fri, 21 Feb 2025 10:59:28 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbd6b57314sm573078466b.93.2025.02.21.10.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 10:59:28 -0800 (PST)
Message-ID: <3649a87a-59a8-4215-9a2b-b02c25203a25@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 19:59:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: sar2130p: add PCIe EP device
 nodes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250221-sar2130p-pci-v3-0-61a0fdfb75b4@linaro.org>
 <20250221-sar2130p-pci-v3-7-61a0fdfb75b4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250221-sar2130p-pci-v3-7-61a0fdfb75b4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pEX0A09ydBGX1RpCfMDA53lyRscj3PlQ
X-Proofpoint-GUID: pEX0A09ydBGX1RpCfMDA53lyRscj3PlQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_07,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 bulkscore=0 phishscore=0 mlxlogscore=800 suspectscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502210131

On 21.02.2025 4:52 PM, Dmitry Baryshkov wrote:
> On the Qualcomm AR2 Gen1 platform the second PCIe host can be used
> either as an RC or as an EP device. Add device node for the PCIe EP.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

