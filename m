Return-Path: <linux-arm-msm+bounces-35520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3C49ABD9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 07:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E05A11C21291
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 05:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6057713B7A1;
	Wed, 23 Oct 2024 05:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KLYqmYHL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D97139ACC;
	Wed, 23 Oct 2024 05:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729660037; cv=none; b=ZQf2fCDTW2/6mBI2/0dmNCENTgmKhBKx/DRpQcmqpStM+jkELsZoubS+TvQ3RVM1Dr25a99JDO69kPWSH2d5/YljnaeVn1tLtXNz2FJ0LK4lM3Yrkflr27jaJ7ds3/jSVn2zbOAgWJoUfklasAUmwCaBZFotdo/+UR7cfUOEcXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729660037; c=relaxed/simple;
	bh=N6MxOPXvN52A4SK9gugDg/T6rNauUkgKclmm9CuZaDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=R8G51sq393nk4iNd+sGZrdVBEd5LFPXfdj+YZOA0IJbDPx1d93XJIwzPUDTz6oM05GDIkqWD8YxJiQb9jvLf0PzolbwZzrTciNG42T/JuUqj7fNIQNLchivke2+V3EVhZjlyMkpo18L1srms00CXUW9Y1oSBq+UeaGht0ZSny5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KLYqmYHL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLf5Cd019749;
	Wed, 23 Oct 2024 05:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s2d81+GccxoEkMZskmmKrL4R7qnewBTmtKDHTfqxm1I=; b=KLYqmYHL1MbiPlh1
	djAAuki0kNLH3ARDnUMXsNbR1wMZ42oHoXIRkKqW0TfdzVAONFCOJYo3T9O+fgvn
	tfCjkGuLk3b504qJ7gyjA+QpileKrw3K2NJsLw8qifmOnjn17EDSji8i67bILqX2
	YW+KaGFM7HVFwcKkBLahlwZ5lBfbuWTjVfyJ8sNfNquZmZA/7JNgQ0iBXTLf3M1S
	+KQW1pZ3myO9ACkbPUsHnd8o1Nv+TKmXvFBsP5RL36MeeHKQIkiS5JG6FrL9LEHE
	A2qECuism6jYVKyDcIWa4nW//E6pQfDk8sSQu16LBrkfV25ptZ58JyhqVoAwLV9Z
	Ag3KHg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em668vr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 05:06:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49N56u24025278
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 05:06:56 GMT
Received: from [10.110.103.186] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 22:06:55 -0700
Message-ID: <64cc6a55-fa3f-42c3-b6b2-cd0da18cdeeb@quicinc.com>
Date: Tue, 22 Oct 2024 22:06:55 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 07/10] net: qrtr: allow socket endpoint binding
To: Denis Kenzior <denkenz@gmail.com>, <netdev@vger.kernel.org>
CC: Marcel Holtmann <marcel@holtmann.org>, Andy Gross <agross@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241018181842.1368394-1-denkenz@gmail.com>
 <20241018181842.1368394-8-denkenz@gmail.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20241018181842.1368394-8-denkenz@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QWirRFbA7YNojLn2Bx1r280c1iUmF81T
X-Proofpoint-GUID: QWirRFbA7YNojLn2Bx1r280c1iUmF81T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 mlxscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230028



On 10/18/2024 11:18 AM, Denis Kenzior wrote:
> Introduce the ability to bind a QIPCRTR family socket to a specific
> endpoint.  When a socket is bound, only messages from the bound
> endpoint can be received, and any messages sent from the socket are
> by default directed to the bound endpoint.  Clients can bind a socket
> by using the setsockopt system call with the QRTR_BIND_ENDPOINT option
> set to the desired endpoint binding.
> 
> A previously set binding can be reset by setting QRTR_BIND_ENDPOINT
> option to zero.  This behavior matches that of SO_BINDTOIFINDEX.
> 
> This functionality is useful for clients that need to communicate
> with a specific device (i.e. endpoint), such as a PCIe-based 5G modem,
> and are not interested in messages from other endpoints / nodes.
> 
> Signed-off-by: Denis Kenzior <denkenz@gmail.com>
> Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
> Reviewed-by: Andy Gross <agross@kernel.org>
> ---
>   include/uapi/linux/qrtr.h |  1 +
>   net/qrtr/af_qrtr.c        | 54 ++++++++++++++++++++++++++++-----------
>   2 files changed, 40 insertions(+), 15 deletions(-)
> 
...
> @@ -1313,6 +1331,9 @@ static int qrtr_setsockopt(struct socket *sock, int level, int optname,
>   	case QRTR_REPORT_ENDPOINT:
>   		assign_bit(QRTR_F_REPORT_ENDPOINT, &ipc->flags, val);
>   		break;
> +	case QRTR_BIND_ENDPOINT:
> +		ipc->bound_endpoint = val;
> +		break;
>   	default:
>   		rc = -ENOPROTOOPT;
>   	}
> @@ -1346,6 +1367,9 @@ static int qrtr_getsockopt(struct socket *sock, int level, int optname,
>   	case QRTR_REPORT_ENDPOINT:
>   		val = test_bit(QRTR_F_REPORT_ENDPOINT, &ipc->flags);
>   		break;
> +	case QRTR_BIND_ENDPOINT:
> +		val = ipc->bound_endpoint;
> +		break;

In the case where an endpoint goes away and a client has bound their 
socket to an endpoint, would there be any notification to unbind the socket?

Is the expectation that the client would get notified through ECONNRESET 
on the next sendmsg() or receive the BYE/DEL_CLIENT/DEL_SERVER control 
message.

On that cleanup, I guess the client would either re-bind the socket back 
to 0 or wait for the mhi sysfs to come back and get the new endpoint id?

>   	default:
>   		rc = -ENOPROTOOPT;
>   	}

