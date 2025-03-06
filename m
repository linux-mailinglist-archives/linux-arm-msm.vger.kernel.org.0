Return-Path: <linux-arm-msm+bounces-50565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DA1A55542
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 19:43:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE0B8170BD1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 18:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C9826B2DC;
	Thu,  6 Mar 2025 18:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="enp7ht4/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309FA1DE4EC;
	Thu,  6 Mar 2025 18:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741286594; cv=none; b=TKCg9f8Rctopf8yAlJQwXP2Pd7WLPGL8AjuSwS+iwDixfuCa2LzX8CP1CaUVmBoVUckv8AuCRKKOzW78wY0+JQJRr5B0NPGmN+4BKnt5qoDGQy4NCJAN1Of4tILqjDP5FzIUq86hnFUs5913qtDwX4tydlIMksSDyoNGxmqlFPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741286594; c=relaxed/simple;
	bh=8u3g4qhlhmGcpQX8oUr+Wua/DSwAXQ7vx/Xf2RA4gGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MtQc5URF0rgdEj1c0pW0iDpo7IarNz36vUrSrtvwJ2nBivrYQdCDBDKjQ11RSLIkw5LmEdWkCBBfvTSEAcbeoB2pV8iaOsIWCdTI5/vN4emVsbkmka5lkYL9JsspR4vsCPTeJk1xzKK+IGzXR29EMl1t6EOrp0q4e7lvZQCGLSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=enp7ht4/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526I3YTH003700;
	Thu, 6 Mar 2025 18:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a/LvnEahUYfSdhh0pwTHbUHALq88KUUr4zEnlp8K8Ko=; b=enp7ht4/F4Hs9kOK
	tVlRQPm/TwhoG/hxEXzop6+jGLeHGSUUBoXop9nS+jS7vf9VYm1XjqKEw3KIFi09
	+l4c/q0JFWD6tJ33+PHL2i9q9H6UIcaJaRlDAFi7lC36qeGgd2WcD1iKbNEOVUBE
	fPtQjdQupHW5zFsjexp0g51AcydTYrkCzgoo0K18T0WjNJ6GDFN2m7pmwYSbgTp+
	rNNOK2GhHT7X9bIf6qhOUo6E7hJXj90oqULHYAKL7y4ccWIg0w6U9p3pIxeyzfUy
	z20DwJdAgVaGLm9FufJSaHEYUSZQnOkN1QMJZ00YhnFq19ihJxGbSn7FfwoXDccl
	mkIG7A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 456wrjbbge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 18:43:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526IhAg2000442
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 18:43:10 GMT
Received: from [10.232.155.112] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 10:43:08 -0800
Message-ID: <b8c87185-7f07-4aa5-83c9-c64b55205077@quicinc.com>
Date: Thu, 6 Mar 2025 18:43:06 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Fix race between unprepare and queue_buf
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, <quic_carlv@quicinc.com>,
        <quic_thanson@quicinc.com>, <manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo
	<quic_jhugo@quicinc.com>
References: <20250306172913.856982-1-jeff.hugo@oss.qualcomm.com>
Content-Language: en-US
From: Youssef Samir <quic_yabdulra@quicinc.com>
In-Reply-To: <20250306172913.856982-1-jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TwtQ_xYsT7XEWZPMVbOFYBM1TvdDvWNi
X-Authority-Analysis: v=2.4 cv=FYDNxI+6 c=1 sm=1 tr=0 ts=67c9ecbe cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=tgv4VYhMNV6V4iQjg4oA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TwtQ_xYsT7XEWZPMVbOFYBM1TvdDvWNi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_06,2025-03-06_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxlogscore=831 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060142



On 3/6/2025 5:29 PM, Jeff Hugo wrote:
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

Reviewed-by: Youssef Samir <quic_yabdulra@quicinc.com>

