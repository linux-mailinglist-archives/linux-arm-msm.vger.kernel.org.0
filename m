Return-Path: <linux-arm-msm+bounces-31772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D095497880C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 20:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54144B243D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 18:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E6012C474;
	Fri, 13 Sep 2024 18:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CSNyPW/G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3BE3032A;
	Fri, 13 Sep 2024 18:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726252905; cv=none; b=n5+aQQenC+G8z7XjZCD/bVL5EaIRVVjXL5P6YBWFefzo9kKwBIENsaROoz1g4GgrOGelk4z4dP3ERhOxv6FiRiUfyB7ES8V7FHSxLTQWYZY8g8dRg9TcNQ8VisxPky5MycGq+8Hm8GyeObq4e+2faP2iTnYULzoz/V98nrfPIB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726252905; c=relaxed/simple;
	bh=KohZci8r6YWV6Ti4ccLAbC6MZZ1Fefy0rZ5gjzolUPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Qg+Pog+d/suIignFV8FOuqNqv7v2kkpblErR9hJPo7Q+2CTFx+QhRySQIkMPYRbrDU9nFMfkYHHY9MFiEmOyq2KQC0hbYx4pr6QmRWz1WmJN4hz6NdC98CmaCg7WmrdPYFUI1lW/pd9wvxCXDEUl+xcvswmkHDwp8Kk9RvivPqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CSNyPW/G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DAfpiI020726;
	Fri, 13 Sep 2024 18:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZEVNF9dSN+vN0EJTplXCukYfQiGo25sEr/M9t0yVdvI=; b=CSNyPW/GqQVFaxuG
	/JKscaUYBPnjZ30KQq2L6mYZQpt77jSBUaPK2ZvZypjKbhQD6ov3EpfonUdW3JzG
	tF9V/Lk88FGkB8F9DTi6atbazUkQTz4Ph9/pU8XUcvQTvHRjdqEsvE1BkZ27GUZn
	HR9Jb6vKz2MbZbWbxVeuhMDAKKzx5A6JYUQWij7O3zwJeJLLx2tYT6Jzh71U2uyV
	jCYiao2/9ruclG7yc1P8EojM6WdDmiryVLEB4lvwDBV4ntmTIy26fn3k3oRJxTHW
	KimSVhLde+XHEKpXuEW6bnH89pGnihex+uvR88LAOHnzooN5vMkP2mUfOCFlmVWR
	XocHwg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6phmwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 18:41:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48DIfaX6029862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 18:41:36 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Sep
 2024 11:41:35 -0700
Message-ID: <5e4fe550-6a8b-dfd8-93b0-f06bbd447ccd@quicinc.com>
Date: Fri, 13 Sep 2024 12:41:34 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/1] accel/qaic: Change to use DEFINE_SHOW_ATTRIBUTE macro
Content-Language: en-US
To: Longlong Xia <xialonglong@kylinos.cn>
CC: <quic_carlv@quicinc.com>, <ogabbay@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240819095816.447096-1-xialonglong@kylinos.cn>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240819095816.447096-1-xialonglong@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ks7u_gFjhuj98buQ24FRQwEmvZ7G7eRl
X-Proofpoint-GUID: ks7u_gFjhuj98buQ24FRQwEmvZ7G7eRl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=554 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130133

On 8/19/2024 3:58 AM, Longlong Xia wrote:
> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
> No functional change.
> 
> Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>

Pushed to drm-misc-next

-Jeff

