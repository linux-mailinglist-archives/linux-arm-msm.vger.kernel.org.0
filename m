Return-Path: <linux-arm-msm+bounces-16595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0724689A50C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 21:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82E3CB218E8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 19:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D551173321;
	Fri,  5 Apr 2024 19:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="flqz2GVi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A08B172BD4;
	Fri,  5 Apr 2024 19:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712345731; cv=none; b=oQXTBv+C0F+3/OIymdcnCv+Z1VJMxBk25S07l1nd7xsJNpWlbNJeCzqWs5A5Y7LBzGsYqquHO/3kouXi1Ed0i3T79sGs6L8fyZCZCGkU3XtxbXP0MWse0QCE8+CgVqc2q2jn4D+i6GnO769F7/w7rWsmB7DxPUUFTRKkVEYryqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712345731; c=relaxed/simple;
	bh=09f9nYlH0dTmL1tMfmWEj0RJmKEFFwRbwjXyDgeVw5I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d78z/VHN59/MQef2zaswgWgtiIaKeydciFoMFLOo6idaL48722eBbQVtJGBtNik60jJjwdpObBa9f4C6R5H6NUkPFnQ5GRMHiCB5hehH3SGFhlqSlvv5Ss7/GNFD4J9Yb7ElppwlpUsYAn/j501ha52hzPbPA5KI4DjbWxKlFXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=flqz2GVi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 435HQgZF022592;
	Fri, 5 Apr 2024 19:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=juHicWnJa6/Y/wprtpJVNqXwWzmN16LcZBHj+anPebI=; b=fl
	qz2GVi/bNWw0rcqfaEG0QANPoBtSsObSQIQEPOFhVUy3ueK7uhr5fWsWNv/H8r+V
	uKBwQhPk2uRrLsghdVXs/hhOA9GxhmBom1xi+WaJjz7dsBSR+YTzvt854NDiOcgY
	eWCa1jszZGITfZpt22JWKDHy8OSk2dZf/ho7YGDbYaDQEqOaO1ZUf8Vsy3I5cCQu
	k3HTO9AloGWFbmOt9BSAjIeUIXyiJBtsjA98t9rv1V66bNHS9ApfYWmC/LOflgDf
	PG6IF3hp1Hh7uD46rJ6tOPu36+R5EVgw3DIf2HLB8r82Q9Mr+O+b1wXkHJi2H8CO
	PuM7v0pUdbDcQU1rl04w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xa1xaarbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 19:35:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435JYgXt012674
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Apr 2024 19:34:42 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 5 Apr 2024 12:34:41 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v3 0/4] arm64: dts: fix several display-related schema warnings
Date: Fri, 5 Apr 2024 12:34:31 -0700
Message-ID: <171234558728.7839.3436209985692525038.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
References: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: k3aFdrWNFz4A9VRgRjcI8qgjXtKz68Uk
X-Proofpoint-ORIG-GUID: k3aFdrWNFz4A9VRgRjcI8qgjXtKz68Uk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_23,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 mlxlogscore=989
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404050139


On Tue, 02 Apr 2024 05:57:14 +0300, Dmitry Baryshkov wrote:
> Fix several warnings produced by the display nodes.
> 
> Please excuse me for the spam for sending v3 soon after v2.
> 
> 

Applied, thanks!

[1/4] dt-bindings: display/msm: sm8150-mdss: add DP node
      https://gitlab.freedesktop.org/drm/msm/-/commit/be1b7acb9291

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

