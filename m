Return-Path: <linux-arm-msm+bounces-26588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8217A9350B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 18:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06E7C28199B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 16:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5571B86D0;
	Thu, 18 Jul 2024 16:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VrXLBXA9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9616013A3F6
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 16:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721320178; cv=none; b=Tx65h9WX01ket7pL2ElbOQkf762uKQvpu4SlQ6uw5fWNkTBTLIYpq33J+hxsUNb4wcH5Sq0xM8wJgrB4U2W3yYWd4ju210HYa8K/vt7HO6TMt2RjeiY738aV6IarYbOi8YgZLyYpay6LWWb3RWuBRPol7yoJ6rSOAft65wuyPZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721320178; c=relaxed/simple;
	bh=mA50JFZTEqREQIgnqkMRA2kb3z7HJwSh0XdDWMZpF+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QgjaQYHO/fryqfJVM9GaCyRnDW2HX6kY5HBfzYaX9iFn+3lGgHjZMVjNFsBTfFDxtlrQ4rJRk6e04Z2xz/IyASdp4tpFOd2RCf1raYnm2o2FlsLRoOENT5GF8NGglqvfC6rFQvov9waNmjOnVBCVxdhTUHN3uoDL673Vcf/xQSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VrXLBXA9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IFOg0i007385;
	Thu, 18 Jul 2024 16:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZsFT9q1953BFq4q7BxZ0hiEZ4/92M7nw0gwi2JXtEPc=; b=VrXLBXA9aaCaQ3vs
	dxOLCJf807XnaYn8QZ80q4YTMmKpGbDRgRcDRg+tZCi1jZu7G/r4XtToTbgOX1gZ
	noU5DXY1+igvzQUl9KB0oeyPoG9FLoUx1rtLRnXd5L6URLXhlBOiv0do0TpBC8gu
	mPwPeWtYs9jtaUe2sFsKYRzJp61JPIFj0fTvNWXvEv6mede7MIVvtnRl23G+5TQx
	k7B1v57jo/yS2z6x8rgMVOZofIIvN/6HXzHkiclvGTP9y4QZzc0RjDOAJkJ7Oky/
	eJTL9PWxdU8mkq1RQmQRIub2fwEfhARhxMENTgVXodStXB3YF44epmJfv2BhqCdl
	G72Hhw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfxdxrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 16:29:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46IGTX2F003528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 16:29:33 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Jul
 2024 09:29:33 -0700
Message-ID: <687ba571-b2ab-0205-fa12-e766e72dfb73@quicinc.com>
Date: Thu, 18 Jul 2024 10:29:32 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 6/6] bus: mhi: change IRQ_HANDLED to IRQ_NONE in
 mhi_irq_handler
Content-Language: en-US
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        <manivannan.sadhasivam@linaro.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
 <20240718061344.575653-7-quic_gokulsri@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240718061344.575653-7-quic_gokulsri@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 86C3QqBYEZbjsTbb6FiwkBkY_fqFY5QN
X-Proofpoint-GUID: 86C3QqBYEZbjsTbb6FiwkBkY_fqFY5QN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_11,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=400 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 mlxscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407180106

On 7/18/2024 12:13 AM, Gokul Sriram Palanisamy wrote:
> From: Karthick Shanmugham <quic_kartshan@quicinc.com>
> 
> When mhi_irq_handler is a shared interrupt handler. It is the shared
> interrupt handlers responsibility to identify its own interrupt and exit
> quickly if it is not. If there is no pending event in the event ring
> handled, exit the interrupt context returning IRQ_NONE denoting the
> interrupt either doesn't belong to this event ring or not handled.

How was this found?

