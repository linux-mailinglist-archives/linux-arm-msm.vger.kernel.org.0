Return-Path: <linux-arm-msm+bounces-31771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D0A978804
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 20:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA7861F25F8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 18:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E6412AAC6;
	Fri, 13 Sep 2024 18:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kve6EHFz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC9312A14C;
	Fri, 13 Sep 2024 18:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726252769; cv=none; b=uK9KJ20oY61nV9tFWOs0fCj28mHvEHgyNPhP04QbLu6kspf6VxmgYp+m76bpWIowA6tO5fmSzpktIrQQC3bWr2OkxfGtoWoNDQs9RQdkQj4e4a5dCYPsIRR6/egY3U6W0CH2L4zZjCPCT5Bn7UPMPQ2jKwyMUfqoEoJdxR3nRfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726252769; c=relaxed/simple;
	bh=q4CYnlN97IWYYheZ0MZdDlhy4HFAtF8pUhO17M0miw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jwykGwXgOSjn+0CU0se5ZZL5w5Vqs0DJ30ltgNXLHVr3PbF1fERdo4EmGMq+aTt1lErBHr3OUjdsfBT5QbnC++d74hH25VniVPhuFf2/SfI9itkn237OIMmSPYe+jJBv87e9aCs5+UpdQAJatcpKujy4Rn606lPAItttsaV/eoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kve6EHFz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DA7EAh004749;
	Fri, 13 Sep 2024 18:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kUvWnbCBXHYB/MLJqLaWRHqP9AGgGgExFg1iPCJEBFw=; b=kve6EHFz2FXlKtNj
	ieflzgIjC+m824ERxlf/XQ1TKZlihYoBRmesLCWmGYl2CnyeoFsVx1lkcozkxHR9
	yOVQdxeihuArzBqDAI84Vn9B0hv1IYXOGXyWBjUeVHop6T1SSbVTeziDNaW6eLfF
	V3BgdpL2KLOSn6tNPs8vVOQAIUBDw2yyUX5LznhZ3OjQB4NrivWm5AeORbptsu/I
	1Xi/us1zlkDMjlSkYByNx6cZ//S2BAb8eyFtjAgDVHIMbCNc+HZGg6AILXh6LN2+
	S80efe7eIois+Ven3ALecjTARSgoASaRq+5UCGjGiQUoJd0GSY97FMhEmN/oB6ur
	IK2Yag==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41kvma59kq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 18:39:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48DIdGcl001251
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 18:39:16 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Sep
 2024 11:39:16 -0700
Message-ID: <33a4f93a-33ea-6739-0595-6c612572a450@quicinc.com>
Date: Fri, 13 Sep 2024 12:39:15 -0600
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
X-Proofpoint-ORIG-GUID: nIQFv_lfYPlhVVv40VWWTlfNyIn9XUEE
X-Proofpoint-GUID: nIQFv_lfYPlhVVv40VWWTlfNyIn9XUEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=546 bulkscore=0 priorityscore=1501 adultscore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409130133

On 8/19/2024 3:58 AM, Longlong Xia wrote:
> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
> No functional change.
> 
> Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

