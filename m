Return-Path: <linux-arm-msm+bounces-44823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 378EDA0AB54
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2025 18:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF8E93A67C9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2025 17:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E0D1B87E9;
	Sun, 12 Jan 2025 17:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C+JtWPgy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96A6322E;
	Sun, 12 Jan 2025 17:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736704136; cv=none; b=J5yJ3aiWRlRlcauqs4TNG5CUuCrc2XyrgxPfYJTiyPLLO95m+nr7q3Jd65ZhqR4k8KUsD1a/8YNEaZVrX6m75dHQA8BmwzkPJX4YKZNeP995m50Ls7bxCLyGaPPOiTkR4at8GkZ20X/kV1Qrnv1KPACpeVQLKM24+tUwwRRMh3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736704136; c=relaxed/simple;
	bh=r4kR21UGLDQuk4FtXxiZ74IIyOTc5qe1jrZhsj74Aw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Zw0XXoz30ORLYw3HcGe/ws/ISOLKBXfVpv+qipwO79UX95N4ix12N6cFkX515dSePUHIKoEwTtymV7K55pxW9dQNcjU4rkkTTxaSYMMjAkcehLhs0nNnE0QIP8Wne0YHb4Lj2JoNqonTYhqDfLBEf0cChUxncmCDyYvX7J1//TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C+JtWPgy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50C8pbZr019574;
	Sun, 12 Jan 2025 17:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/lScFyZXIQYunYhaA/38nCBDBO+G4itV3Ti7Q4+S3ts=; b=C+JtWPgy4GDU/5B0
	4SEjwHYzM5jEj7gKfVS6JRXBnCnyGDL1Qg/zow/FK/8wmRjcm5RVNBMs9z8rItNg
	tdhocDDmyGE49hnJyJZaPTckKiyLe7YwAgBV1jaHgcwFujKX4j7fDk7lFsnMAUWQ
	0YPyLoGbFCW/XKweVlSyXvcRqNqHGqi6nvNsw0ZEpL+iC8dBo2g+5vRhXIu9oRwN
	mIkumqHyHxGC6+xy0XZHkM/pPbRieUXbIuKvlJVJhNvwwSbu4Scb/QTEVKaVzxmv
	ERFsPmcqqcf1h62+uUrTWfyZXwKN9tZA5mzHlULB7jf4Nqt0UX3i3XuiwYjvPi6i
	3bivVA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443hm22cfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jan 2025 17:48:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50CHmae8006900
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jan 2025 17:48:36 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 12 Jan
 2025 09:48:35 -0800
Message-ID: <9bf72460-48d0-e83f-9ef5-bb6bbd95828e@quicinc.com>
Date: Sun, 12 Jan 2025 10:48:35 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom,mmcc: support LVDS PLL input
 for apq8064
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
CC: Rob Clark <robdclark@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241224-apq8064-fix-mmcc-v1-0-c95d2e2bf143@linaro.org>
 <20241224-apq8064-fix-mmcc-v1-1-c95d2e2bf143@linaro.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241224-apq8064-fix-mmcc-v1-1-c95d2e2bf143@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Qx_oX95oMr4HNlnOgdghm4IYzh4qMFC5
X-Proofpoint-ORIG-GUID: Qx_oX95oMr4HNlnOgdghm4IYzh4qMFC5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 mlxlogscore=832 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501120158

On 12/24/2024 3:12 AM, Dmitry Baryshkov wrote:
> APQ8064 / MSM8960 have separate LVDS PLL driving the LVDS / LCDC clock.
> Add corresponding input to clock controller bindings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

