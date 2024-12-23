Return-Path: <linux-arm-msm+bounces-43112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4256F9FAD1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 11:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 990BD16282C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 10:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BD018BB8E;
	Mon, 23 Dec 2024 10:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PNrGiAlt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8155A848C;
	Mon, 23 Dec 2024 10:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734949828; cv=none; b=VjAgogwPDQ6JR1CMJRxdclWi7Sx7l0gPY/56h+dX29EiL6Ymvh6foTF9Tcc0wCSV/YSHcBbkoMkVGtkwyzNE74fuLNtMvFeuej39ruPVNMCPZJUfz7kbyha7sCvZrhkOfln8RcUuWqzcpUzBpoY7PdC2o8rsL8dD04EloADFSsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734949828; c=relaxed/simple;
	bh=qOX1CJ1nb5KRS6ac/jGp3ooaJcCYp60O2FlznxOa39g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iS2ZEqMI4oDVGM1a+fDXklB6N2NdUTLD40qRArnsjbObPfIQNv02dqQWmfcmyT98i6ATewdSN3uxBaqccbOpBx/je7etv1xnKrehNZg0wWFuTEZSMtX605BIJQ0skwXQ//dsotm+NUJT+TGV6n7y3KjDBn75RyKX4f+pfBQRbco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PNrGiAlt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN9Si5M007922;
	Mon, 23 Dec 2024 10:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jVOjdSbEjB5SPyb/jIw3Vcq/sAgx6qjeQaelRJANPRg=; b=PNrGiAltyu5FGx3D
	Czz8Nkg6n+lnXnc/5xpxZSpV4ZXr6eGuvcmHJpyZ7ZHSiRlj8v13p5kUvoVhz6Yw
	QG/EqWGR6fo1P800LaLuPuIuadg+E5LrlnMPU06cGCO3MTNi9NxmktTrdXIZvI1E
	gwXhSmZ9nZYbTFORRXRLW1KDWTt36jVFI75AvTYG5s7sz2ZgB5iFJ5cSgOBosqkv
	pkQcQ6jpBCBAtobY8hA+937ljyYCslVSaTrQzbjJVAIgVLCAZdCtS7ousFQTCslm
	XIHKZEo/il0q5IvsCNjJ8V4mjpOnLcoX4uknFZLjAeHdgWJ72Q0mSfKxiwzrHYDF
	JhDI0Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43nk1m0unp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 10:30:13 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNAUCZ6018442
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 10:30:12 GMT
Received: from [10.206.105.210] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 02:30:09 -0800
Message-ID: <77018932-14b0-4371-8f80-e2701cbb052c@quicinc.com>
Date: Mon, 23 Dec 2024 16:00:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] misc: fastrpc: Deregister device nodes properly in
 error scenarios
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
        <arnd@arndb.de>, stable <stable@kernel.org>
References: <20241223100101.29844-1-quic_anane@quicinc.com>
 <20241223100101.29844-2-quic_anane@quicinc.com>
 <2024122343-java-exposure-bf50@gregkh>
Content-Language: en-US
From: Anandu Krishnan E <quic_anane@quicinc.com>
In-Reply-To: <2024122343-java-exposure-bf50@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xwwjqyOxUh2Z34SIa6KXgNQx0AxS3SjQ
X-Proofpoint-ORIG-GUID: xwwjqyOxUh2Z34SIa6KXgNQx0AxS3SjQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=483 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230094



On 12/23/2024 3:40 PM, Greg KH wrote:
> On Mon, Dec 23, 2024 at 03:31:00PM +0530, Anandu Krishnan E wrote:
>> During fastrpc_rpmsg_probe, if secure device node registration
>> succeeds but non-secure device node registration fails, the secure
>> device node deregister is not called during error cleanup. Add proper
>> exit paths to ensure proper cleanup in case of error.
>>
>> Fixes: 3abe3ab3cdab ("misc: fastrpc: add secure domain support")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Anandu Krishnan E <quic_anane@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Shouldn't this be a stand-alone patch, not part of a series, if you wish
> to have it included in 6.14-final?
> 
> thanks,
> 
> greg k-h

Sure, I will send this change as a stand-alone patch in the next spin,
so that it can be included in 6.14-final.

Thanks 
Anandu




