Return-Path: <linux-arm-msm+bounces-34854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FA29A350F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 08:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1EAD1F25CD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 06:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4221F17B439;
	Fri, 18 Oct 2024 06:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hR3YEgz9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBB820E30C;
	Fri, 18 Oct 2024 06:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729231419; cv=none; b=YjQr8Fwro8s62kqqNxlk/HW3hB1eoKswlqJPDCxqG+9M4/P4lcTuEvrX+MaXscbm82gS1L7ZFwY3D3ozdp3pja4FXfz8Es+TgFlSuE5IPIzbuDxU2P0KzL2Ayd/yk+24VAw175NqYgEzdQQjhF44GmP8cSzXGFTw29MCk5Qc7po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729231419; c=relaxed/simple;
	bh=jPLG1CftNpWUhv7jxaOGebVKJzL1HmSh7n8XXQVUHjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JRbSlF/4pGd9JggAq4btGO6Bw/Z48uFavaTaha6mF4vACJjEmHY22WfPOcINFqcWTABRlZb7UUvg1c9JlrcNk8fP2vVotB1exA25XI7bn2466DwZn9VtsOQXkpoHMI4h62yMUjIU3OI4dhZOjD9l3cLyugtwT4ZInaJ8pc2Yiik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hR3YEgz9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I5VHB5008326;
	Fri, 18 Oct 2024 06:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KXLpKYN49y4rKL7G0LbS+Vl1+kkbYLJz03m+GIhkGZA=; b=hR3YEgz9Sw7yBxt8
	V6SBWIJCPVneiLo7ZrHj8si8jwE7idiuLHCUX2162ce4+hukEbKodPOOgRV4DgZ0
	v2F1lAzlNkIxaOnve1eE3rqxkzicvqP03broGhaP3D522My0cejJNtGpIT6Ngw5p
	xgUwMSKstIRnfP2XIemBL9vRPSBrryH/gVUG4vjndEjrTA0rPhShCJLgEqKNbuUf
	GX+korqXURFQVl4xxXACHmyE/m04wmrvRXicWo0YJFd/tXJAXoiBI7dqLqcA8Mwo
	LXZYsTyRgk3t5WgJZWu0MrmQTdvhisD/b4Z6CU8egDLRmVmMZX6BPcdX5VIh/+qv
	ckFdmA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b5hssxrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 06:03:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49I63H0Y009481
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 06:03:17 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 23:03:14 -0700
Message-ID: <c57c31bd-401b-4d98-a514-df53fd1775c1@quicinc.com>
Date: Fri, 18 Oct 2024 14:03:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: phy: Add QMP UFS PHY compatible for
 QCS8300
To: Vinod Koul <vkoul@kernel.org>
CC: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <quic_tengfan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Xin Liu <quic_liuxin@quicinc.com>
References: <20240925-qcs8300_ufs_phy_binding-v3-1-c1eb5c393b09@quicinc.com>
 <ZxEp2Aca037br2yt@vaman>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <ZxEp2Aca037br2yt@vaman>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PR67CZ2qxF5FRD1eZQSP6ZeiUL4Pmojb
X-Proofpoint-ORIG-GUID: PR67CZ2qxF5FRD1eZQSP6ZeiUL4Pmojb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=349 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180036



On 10/17/2024 11:14 PM, Vinod Koul wrote:
> On 25-09-24, 15:34, Jingyi Wang wrote:
>> From: Xin Liu <quic_liuxin@quicinc.com>
>>
>> Document the QMP UFS PHY compatible for Qualcomm QCS8300 to support
>> physical layer functionality for UFS found on the SoC. Use fallback to
>> indicate the compatibility of the QMP UFS PHY on the QCS8300 with that
>> on the SA8775P.
> 
> This does not apply on phy/next, can you please rebase
> 
patch rebased, link: https://lore.kernel.org/all/20241018-qcs8300_ufs_phy_binding-v4-1-261c7c5fb8ff@quicinc.com/

Thanks,
Jingyi


