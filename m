Return-Path: <linux-arm-msm+bounces-8458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BD583E023
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 18:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14D711F2528E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 17:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6660F200D8;
	Fri, 26 Jan 2024 17:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pn4wFY+/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F7E208C4;
	Fri, 26 Jan 2024 17:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706290252; cv=none; b=tmhc46ES0acgNCtxJSNm8N4eslELTwqMlvDiBIuoRu/afUlQrAli98LuPYIBgFW4/43L3YACI3kny3k/ouw74blqnJX6Nmg0R4zMqKxbtcfAS0d4GI1lxlwRa5/7brxwHenhy+FAi/4tI5Zgyrh5d8kgfUYKWkrVfjCp6lfNgAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706290252; c=relaxed/simple;
	bh=9bLrrY4lrpiMbBAA0TQMibFdWd4L4+WTcg7fJX7LCAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=j0kuyYVygi9qAzKk82G8mfMS+upLLN3C7rc5F/g0+oc38J0c5qTsCJVVqJQ1IpVhV7Gz1RBptV4/Tt2oCvxXlhQG/zlU24Jib5XNTeZdXYvBk33c4DaSbZsvZ6WripT9idXWinqKCS+Z2nN2Frwme0CbozNCN8hY5qa/LZK5HDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pn4wFY+/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40QGnIln027895;
	Fri, 26 Jan 2024 17:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=hkG6MAIjZNQ1Z2obgtzdYW/nxGo77lAQ9byFBqTs2sk=; b=Pn
	4wFY+/rx6xVBEzubUbaz1JeMPkOcd5dlQ2lIJo5UQMUdM6geSA0P3NAU6fQusOsk
	j3CUJGt9KzfW/EyEdDUddMSIKlSaYVc4nXmL/TqZdCNiJp+jSmrF+AvIfOciAbkC
	YkpudP9P0aqc+laeCIqgIwY91wi5ZjRlgxMtRPQBNGalW6BNJ3/RMRej9b3nbKJn
	qGnfoGQnyUsXf4prxLms7JnkbCSMFGBgsHD5u0sAIXQJOkYGnE89qC4F7q2mM4rw
	9GDbFxup/4QZkgFSqwMghGQaCBs+1Ky/xp6PnVw9lQT3PUdvao5ZMOs7vZA/x3Cz
	EpoQ5ctj9jRvxI/Hf2Ww==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv6c8hg4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 17:30:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QHUfVN032634
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 17:30:41 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 09:30:40 -0800
Message-ID: <04b76659-afb3-612c-0eea-ab305089e40d@quicinc.com>
Date: Fri, 26 Jan 2024 10:30:40 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 3/6] phy: qcom: qmp-usbc: handle CLAMP register in a
 correct way
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones
	<lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-phy@lists.infradead.org>
References: <20240117-usbc-phy-vls-clamp-v2-0-a950c223f10f@linaro.org>
 <20240117-usbc-phy-vls-clamp-v2-3-a950c223f10f@linaro.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240117-usbc-phy-vls-clamp-v2-3-a950c223f10f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wBl7lsi-bOrmut31HkRDeXNMyfO53opC
X-Proofpoint-ORIG-GUID: wBl7lsi-bOrmut31HkRDeXNMyfO53opC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=650
 priorityscore=1501 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1011 spamscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401260129

On 1/17/2024 7:04 AM, Dmitry Baryshkov wrote:
> The QMP USB PHYs on msm8998, qcm2290 and some other platforms don't have
> the PCS_MISC_CLAMP_ENABLE register. Instead they need to toggle the
> register in the TCSR space. Make the new phy-qcom-qmp-usbc driver
> correctly handle the clamp register.
> 
> Fixes: a51969fafc82 ("phy: qcom-qmp: Add QMP V3 USB3 PHY support for msm8998")
> Fixes: 8abe5e778b2c ("phy: qcom-qmp: Add QCM2290 USB3 PHY support")
> Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

