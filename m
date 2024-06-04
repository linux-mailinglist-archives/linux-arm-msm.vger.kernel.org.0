Return-Path: <linux-arm-msm+bounces-21684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 982698FBFB4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 01:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 553B828A278
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 23:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E540F14D43E;
	Tue,  4 Jun 2024 23:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SwPFvpoN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9E414D28B;
	Tue,  4 Jun 2024 23:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717542858; cv=none; b=D6JmmMSAxDgYikPKQ6IdJBOMxaapn91BuORfXuHR8gBfo9EnJSeorFQShwVEIAIkuFpCH9fZ/JFVNO+ggXJhttjaqqGXwcD1Zg5XUTE4zytrVwILGsUvqACesqzZJGWzgTlyXVp7TEdw11Vw04x5kKLI0UxkulrjiYvpFoiyo+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717542858; c=relaxed/simple;
	bh=y1mTtAlH2HuLUf25v/LySlH6akxKBu02tXMnW6gHWHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ntFaOJdBvUm8ieW9FGC8poeW5/3drXwzcJXJhnJDNGrawr1b0xeDO7XzmXn+aY+ZqCYNuMJo359hmDKyPP5ejgQDztBdxxO4RM3lCYez+Yhqqua+1nVHSBnRV7GyjlRsoUCZ5iPuOKDD1OrP+W2SPd5k4aZOqOunuTU5tqGK5sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SwPFvpoN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 454LD832000945;
	Tue, 4 Jun 2024 23:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y1mTtAlH2HuLUf25v/LySlH6akxKBu02tXMnW6gHWHk=; b=SwPFvpoNZE7dHwJc
	ir+h/O60rTin1bD+0PHOMpC9/sUgAnNqvY9cQW4X000flKMiH3YDT9DyymYl0DwB
	09clSjTJOetJWuB4GY3TNMPBnqVZc9+XVezXZwir6gj5oOAz8Kd9iXGxTP1zWGh3
	dZYgkS+NFueMl8QBhbmR9g34NjdOZDx9my8PcMJMwxsF7pmHPBjo0yMhB3LjMRRe
	7dFgx0Y3SKesHvvZB+PD5XfYgX82JwtF4qeqQpySF/c+yagt/YWd2cNJIVzNYXo6
	L4nQtMmve4rbOmQtknGF5iMArAVUhjcC9oGIoOH22E0HZxAGVSfUdmfE5OpEiUJq
	xwvB6w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjan2g5yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 23:13:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 454NDuo6025285
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 23:13:56 GMT
Received: from [10.48.241.109] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 16:13:55 -0700
Message-ID: <40e65895-fc87-4754-ab5c-29d7c95b6d17@quicinc.com>
Date: Tue, 4 Jun 2024 16:13:54 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 03/38] xhci: sideband: add initial api to register a
 sideband entity
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, <srinivas.kandagatla@linaro.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
        <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
References: <20240524001043.10141-1-quic_wcheng@quicinc.com>
 <20240524001043.10141-4-quic_wcheng@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240524001043.10141-4-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vwSx6Pp3ZiBFJUsFcI3mthVu9lAH8gPT
X-Proofpoint-ORIG-GUID: vwSx6Pp3ZiBFJUsFcI3mthVu9lAH8gPT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 clxscore=1011 mlxscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040188

On 5/23/2024 5:10 PM, Wesley Cheng wrote:
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
[...]
> +EXPORT_SYMBOL_GPL(xhci_sideband_unregister);
> +MODULE_LICENSE("GPL");

Please add missing MODULE_DESCRIPTION()


