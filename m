Return-Path: <linux-arm-msm+bounces-38620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 117EC9D4828
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 08:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 970BCB2159C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 07:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75EF61A76C4;
	Thu, 21 Nov 2024 07:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X516MI4R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2107F230986;
	Thu, 21 Nov 2024 07:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732173712; cv=none; b=rFyfIaHYFdBxF+yGNQrgg1O++L7+ihdSDhKMburNJPhdd8HG2chNOdrr8r1se1KmwHFAlu4PMZhkRcEoQVUliMLIeAV5ViTSvsqZNE1HoYArKKbkx5V+io6rmwIyiNAlbqa2y/al/AMTItykLRU0upElIibnmq4D7nsfMiHnhZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732173712; c=relaxed/simple;
	bh=pkKmEjGXFCbY89x8i0mw3RQnH+VKGzj9t1bJnyLFEHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CUzMmxMXu0Ov/EeOfJnAHr3beCs23wBuAmmrTYwmjcqTsV/xv0wpUrUIuMx+3qCpw+TkMltfZBIrzf5FayzeMS8/RSmaRenL+j+aiRMzA1CdsQ4YWuNb6Ao0vAIuYO/a7YbOZFvmX1lwLGfiIeCMqpSew352mKD6j6lgSKwDjEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X516MI4R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKLAvUE029738;
	Thu, 21 Nov 2024 07:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pkKmEjGXFCbY89x8i0mw3RQnH+VKGzj9t1bJnyLFEHE=; b=X516MI4RxNdEEOb1
	fHl1mutsgpOzUlvSd/wr+CIiVPd0S2T83+ZzetEahMx6kghxyZWyse25eTeFAkvn
	Xbxto0OTIxrLvmx/xIYtppG5FCjoUF3fN3jePhL5U/+Lqmdsw1GgCSjbMIcIjH3X
	S4bVNxaS2V7101+Vnwflj62uDx+DVOn/e6OFFVAXSEBxkzW/gGyZn+T32lJYGH8w
	0A3jffkmOTh9iZBicWSrG0lE/OaWUU3NafdXmyN/SbeQeSQpjV6NJoD0d6rFjiaQ
	Jy2mn2jFgkO3M9+sn3P1Do4nOGlyv7QR8Arj8FmLsKrRlBuSI/4pDT0+rXM1D3Nt
	ajVZCA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431952bjwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 07:21:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL7LemR008152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 07:21:40 GMT
Received: from [10.64.68.102] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 23:21:29 -0800
Message-ID: <294220b6-8359-4fe6-90d9-e52c363e6cfc@quicinc.com>
Date: Thu, 21 Nov 2024 15:21:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] phy: qcom: qmp: Add phy register and clk setting for
 QCS615 PCIe
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <robh+dt@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <bhelgaas@google.com>,
        <kw@linux.com>, <lpieralisi@kernel.org>, <quic_qianyu@quicinc.com>,
        <conor+dt@kernel.org>, <neil.armstrong@linaro.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <quic_shashim@quicinc.com>, <quic_kaushalk@quicinc.com>,
        <quic_tdas@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        "Krishna
 chaitanya chundru" <quic_krichai@quicinc.com>
References: <20241118082619.177201-1-quic_ziyuzhan@quicinc.com>
 <20241118082619.177201-3-quic_ziyuzhan@quicinc.com>
 <2rygkimclano4hcgf5vaz7eyuhcqdal5ybnh5eyci3ig2b5jcl@sq5ygemgdhwr>
Content-Language: en-US
From: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
In-Reply-To: <2rygkimclano4hcgf5vaz7eyuhcqdal5ybnh5eyci3ig2b5jcl@sq5ygemgdhwr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7n6VYEW1fwh8VjoS7PwYauQARe3DEPm4
X-Proofpoint-GUID: 7n6VYEW1fwh8VjoS7PwYauQARe3DEPm4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 spamscore=0 malwarescore=0
 mlxlogscore=601 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210056

Will modified in v2

On 11/18/2024 7:15 PM, Dmitry Baryshkov wrote:
> lowercase the hex. LGTM otherwise.

