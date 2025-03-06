Return-Path: <linux-arm-msm+bounces-50563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 239FDA55536
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 19:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 795B9188D157
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 18:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234E525EFBD;
	Thu,  6 Mar 2025 18:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="emw/UhR6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA4425D54C;
	Thu,  6 Mar 2025 18:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741286461; cv=none; b=okD9dY9ZOlGBT18HKnCELkTNLT0teKmsHgY3lG/2T1gEHkt754NMF9VDg27w/syi5Dtt2mRiEglIrsWyrIIncSZ2MrLaKtA0s83MRYlEOtd+Uet/fiu2/NWktf+zgpQCI08MAn8jU6U7aY8QLM37O0Bg1kHC+j1rZWDh7O2kIEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741286461; c=relaxed/simple;
	bh=BYmYtyZKDKj1PeNLDUeWcIxj/0vs7atrEs+3WzHO4PU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EwQsQDwiW+NmjReyeb+sEHPz3HQrVJYHld0jvExRfazlKhaF1w5Y79W9KRlN+RVXv0WyClD4FrxzX4a4a1z/HRBudUrqJeKoQQ01QTnauC4hCL4l1zSKFthIx+Y/us3f79D/xnVflMrAeg8JyYrEQqYXBGt293yjpzIb2K0q0Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=emw/UhR6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526BDTTQ005627;
	Thu, 6 Mar 2025 18:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pHY9Q9zzON7cG1xGHOjLh7yPiVTrOEVhZAMLNpQHpxc=; b=emw/UhR69YdnxtKI
	gbVepZaoJP27WIc05szMrDYpS8ML8xtxz5rEr8c0d8hAaOWRsDqcz7kaDnmqM5Os
	RNRwC/oAqswM2yUp/cxJLsUHtCcdetMthUJXHxuZKo8eCa8HmQVPDVa8bc/FdUj0
	pspv2fDsuOLYWoe3qntmWo9XbDsqEzOJUMJVvAI3BDN0HdaIoZUEm11a2TyutP/G
	ePrCyd9fCJe3BIWW3IM9EsyPj2YsF68m28IUc10Xs3XsKJ573mxojPL/5NhD7bVN
	aL9XmsjvdagUiUGichysAk02AtZkYvIe5V4EXrgNcKws+/1korXrXbJFtaTH9yJR
	ubq/yw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4571sdau1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 18:40:57 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526IeufL021522
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 18:40:56 GMT
Received: from [10.38.240.217] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 10:40:55 -0800
Message-ID: <61e844d3-de13-4359-966c-9e3518b46da5@quicinc.com>
Date: Thu, 6 Mar 2025 13:40:53 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Fix race between unprepare and queue_buf
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, <quic_carlv@quicinc.com>,
        <manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo
	<quic_jhugo@quicinc.com>
References: <20250306172913.856982-1-jeff.hugo@oss.qualcomm.com>
Content-Language: en-US
From: Troy Hanson <quic_thanson@quicinc.com>
In-Reply-To: <20250306172913.856982-1-jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: U4elRwD2zVMDo6quv0o5Y8HZr9G0JrSf
X-Authority-Analysis: v=2.4 cv=W6PCVQWk c=1 sm=1 tr=0 ts=67c9ec39 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=tgv4VYhMNV6V4iQjg4oA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: U4elRwD2zVMDo6quv0o5Y8HZr9G0JrSf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_06,2025-03-06_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 clxscore=1011 impostorscore=0 spamscore=0 malwarescore=0
 mlxlogscore=822 adultscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060142



On 3/6/25 12:29 PM, Jeff Hugo wrote:
> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> A client driver may use mhi_unprepare_from_transfer() to quiesce
> incoming data during the client driver's tear down. The client driver
> might also be processing data at the same time, resulting in a call to
> mhi_queue_buf() which will invoke mhi_gen_tre(). If mhi_gen_tre() runs
> after mhi_unprepare_from_transfer() has torn down the channel, a panic
> will occur due to an invalid dereference leading to a page fault.
> 
> This occurs because mhi_gen_tre() does not verify the channel state
> after locking it. Fix this by having mhi_gen_tre() confirm the channel
> state is valid, or return error to avoid accessing deinitialized data.
> 
> Fixes: b89b6a863dd5 ("bus: mhi: host: Add spinlock to protect WP access when queueing TREs")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Reviewed-by: Troy Hanson <quic_thanson@quicinc.com>

