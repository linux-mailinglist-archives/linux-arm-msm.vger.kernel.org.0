Return-Path: <linux-arm-msm+bounces-32757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A84C2989E25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 11:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E35D286F04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 09:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 421FE188587;
	Mon, 30 Sep 2024 09:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oILVf8zs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AF417C7C4;
	Mon, 30 Sep 2024 09:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727688420; cv=none; b=rUBVAW/GWDLGt/JgL/0yILKolfJwAoWN/4D0VMurndXw3jQNcSpVT1INWlNAB8JCNoNxlOO+AOuxT79L3mBfdV2ougctorsL8NcrtqcoINXRzthye3KhKFmFWLTyJH1G/xbXsRyZ2uVfDufvi52M0xmg/8RTQtiqGlAgQAQXdWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727688420; c=relaxed/simple;
	bh=utsQQphS3IjSdBu0mkYu6MlkLg+KTNSdoaUtAA2R+8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bBUd1/FarQYZuy2QZDlUwL9KWX1UKAqrCWwJ0yFe+Bk1XNdLHdEDasGOSHnaI8QW5/XpjvQQk8XfIpCsjVlVbL3esmbLOdfRe2aR1VvCNN9IyOIhmjjr69+5Ef/IsRh6zYQ5u34WYgNdxc0WMIHnt+lFyFzw4WWUEaXzDdRiztY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oILVf8zs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48TMtmBv018290;
	Mon, 30 Sep 2024 09:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7IqKqpVPKDj9DGIFdBa/FUygEBdydUOZuN74IoXbI8M=; b=oILVf8zso2ovoLYw
	uYwNh+65dBQd9U9Slc4PPAYZ4B8eCTS6aVUFN9QDunmkbDeSw8WXmLUVpnoSvqes
	iP1K2c34/EzWgKgIUA7PVEcBrEaWkA63jbJMhixHTohmOpOOOypMwEwYiBYJoZay
	mUwQf9DrXfDeDcxSY0q4t5vKLOuwUH9qsBJKV6xoAiONWGGZK6ervOYCSUgnaox/
	dowYih3+K6l9/w8lmOUjx/rxwS53mQAKna5Ohaxy26Ag07kDgxQEKArAKRJ5ytxf
	Q8tWteuVABYZqcs0lPLz8r50+O5CQDnzPimAl2FAtvjdMRTUd3mQjpNzwdF6ty47
	FI0WPw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x8t6mav9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 09:26:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48U9QiIR016278
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 09:26:44 GMT
Received: from [10.218.44.178] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Sep
 2024 02:26:40 -0700
Message-ID: <88ff98ca-c40e-4d78-8f75-e1c35b84612f@quicinc.com>
Date: Mon, 30 Sep 2024 14:56:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2] firmware: qcom: scm: fix a NULL-pointer
 dereference
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Andrew
 Halaney" <ahalaney@redhat.com>,
        Elliot Berman <quic_eberman@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Thorsten
 Leemhuis" <linux@leemhuis.info>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Rudraksha Gupta <guptarud@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephan Gerhold
	<stephan.gerhold@linaro.org>
References: <20240930083328.17904-1-brgl@bgdev.pl>
Content-Language: en-US
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
In-Reply-To: <20240930083328.17904-1-brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: F28ScLqzRunzLE22TN8KSLEr4gdyU7us
X-Proofpoint-ORIG-GUID: F28ScLqzRunzLE22TN8KSLEr4gdyU7us
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409300067



On 9/30/2024 2:03 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Some SCM calls can be invoked with __scm being NULL (the driver may not
> have been and will not be probed as there's no SCM entry in device-tree).
> Make sure we don't dereference a NULL pointer.
> 
> Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM allocator")
> Reported-by: Rudraksha Gupta <guptarud@gmail.com>
> Closes: https://lore.kernel.org/lkml/692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com/
> Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Kuldeep Singh <quic_kuldsing@quicinc.com>

> ---
> I dropped patch 2/2 and am resending this separately rebased on top of
> v6.12-rc1.
> 
>  drivers/firmware/qcom/qcom_scm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 10986cb11ec0..8bac4915c211 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -216,7 +216,7 @@ static DEFINE_SPINLOCK(scm_query_lock);
>  
>  struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void)
>  {
> -	return __scm->mempool;
> +	return __scm ? __scm->mempool : NULL;
>  }
>  
>  static enum qcom_scm_convention __get_convention(void)

-- 
Regards
Kuldeep

