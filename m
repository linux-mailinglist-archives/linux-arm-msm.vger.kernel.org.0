Return-Path: <linux-arm-msm+bounces-108910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DFVNuOEDmrq/AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 06:06:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 857D959EAA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 06:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3F3393019555
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 04:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485E83815D8;
	Thu, 21 May 2026 04:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nsFG77XR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yb6kEje+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB10368D72
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 04:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779336406; cv=none; b=j+5k+HEAeaC2T3lYCT1oTrCAjQgZoMhY/yuWPvITHbWRo6NwvKu3CKcr/MirWiGcO1+Jm5dFbuMzz/IcW8zgfL3S2V4tVwgwUtbQoruX8sjUczEjGb9La/LbiWI3+YCnAJovOnMsgHMh5DmXegJSLiy2YQneHH33NCHtJuIz/OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779336406; c=relaxed/simple;
	bh=Gh8ajVND+41v1/vo95zmAawm27Gq9MJj3ORvRqW1j4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uz9llKlf3SILnIk4LG8GnCt1XWBkafZ8K2CfHA4BRVmZ/puVaB5Ch2GLczW0h0gDqQXMqI1iqHE05En4xa3OKL3W7n56GjW8DtpHOu1DyDa0V+3EMSjMn+IugKG3KwPieN3whCf7+HW0fM30Tc0Q0NkWI5ErRaXAoj1+aNE0hmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nsFG77XR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yb6kEje+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L2T03A3815926
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 04:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mXPHU0FSRkb8TWkVq85RVfc/tLbj+oz0zmwBY3S5Ci0=; b=nsFG77XRomQZ5EVO
	3eaminfuvOUUAo1/jTAdjwaY9cyGse1+haGYj5D1vncUdyyniiYUiTZqfPORktG4
	u7PMwA2MrBsDQxyoTGO8jkWI2nBLBN3pAYg8cP7ejmW7uFDT8mMiOXGDBo4FHa8Y
	DWsI3yxG96s6IMO24my4r1IC+eU3cLS5VGYEABWGLjZyLtpjIRPYWWD334G80bI6
	oOpABhIxCU/7b4otY41p8DGmhJK8+s6U85jaIfmTle8UZ9U1Ap4MsJHqmIcIbxKg
	dOMAvZrsWFv1bY27EmSC1+r9MPR7y2bMI0cLT6R3oAZCotXfsZTdKZEnsy+Q99mU
	YkbzFA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa0a2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 04:06:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc7f9b2213so42255675ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 21:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779336403; x=1779941203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mXPHU0FSRkb8TWkVq85RVfc/tLbj+oz0zmwBY3S5Ci0=;
        b=Yb6kEje+E1CcpAFmIY5ZdZoF9PqckdSDg9B7Zth4sarSXqRpdNcwZCOyiY5e8UNYig
         QL8mwqVDWYQ5JzbpWHkDCtNOL6KQ4PzzQ7twFiGosMZUS+29kL7LYTrEhAKPcwxOsskE
         z3wLjnCwQ3RwDahibxSehQxua7fNcN7klupjUVk2NL/zIDH4zhTLq5SWS2LgljV2tyZ4
         Xkv9qQEVWugmCEJYmBmml2wBL18H6iaRg0+72O273OH2/qs4Ka+uNOo4rTxzAh4bb1J4
         KWL/coF1PV7i/1NYgbGm21S7aoeL+/N+gIr1OwzXEl5a6vwJ6Zdx7NWVEda0L+t22ICB
         hd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779336403; x=1779941203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXPHU0FSRkb8TWkVq85RVfc/tLbj+oz0zmwBY3S5Ci0=;
        b=AIM1Sj2Q//VGqVprp0VSZLlA1JfUmclG3Bbg406l8oAMneloM0enRgIfGwQdETG+3x
         /BpuUzbc9nUtK+MquNmsTzQe0uq3ZPuYPpGv0rvENjijVZsuMJFn3I4ktZHJaVxlqyd8
         IJAnI6qjiCBNkzpwh+E+v2WIOHffccPKPvOFeMD7Vk4p2f/7iV5popWJ8sweHte6ba19
         k41iqHwu13+Fim+RVzlzdy5sVeTbCN1vMSKSZ1zOuNe01ZDRUnD3OUf+2YBFn6+3MOwN
         pFLJgnpy8A7H00kiUWlFhFEBHdFkUNdE7jjFiLq3lkmFqjFuGdY6hmqxCSxPAUvaRCk8
         y8nw==
X-Forwarded-Encrypted: i=1; AFNElJ8DqAfD1Vnzh+E1SUpuEHUGcLQC0Y3Q0l9tfiu3HOs3JxPL0yELb0Yp2BDYD/97RQafYyi7w45CQMaA2ix/@vger.kernel.org
X-Gm-Message-State: AOJu0YyN6xmMzRgZxKcwiw8AlwfRNystdIGnw0bIk+8TDsYaBI9LHE0I
	eHQVxnouamiJBHgIoTJ72fbVNn+kZJifu7fcaCmxBeyA4fuT7OVS8YqKo33ayGEq9/+SggBYpzm
	/XZ71NltQKRm4n2q1rHUGJ0TwXLZgJrW9zQaIVi7j78hv4JfkHdLzRcang66kA/V/uez7shnae9
	SC
X-Gm-Gg: Acq92OExFDwQh37/6+iuUh2L6w8Zch8UebeEznkHszlodCsdDRC49JeKoIlmMWoHeQq
	RPdeEltDrGx3F0Qp/efzq1MYoIe3Irpq3Kz6RMBZoZw6pUbaTB7RkbC9GLGGZ9lYMwgLaL8OQFS
	0V1MXisddYoRoq3DcpRJa+EIc0auAo5HaGGjCBjxBeDBpqjEExhLCFe4jJVT7Pezuee31cbP7Ru
	xc9hLG1atb81rc7ACY1rOsLGgmjkrD6BJ4YRqT7QHgs687X0aU4MZDfdVXIUCEkI6xX0a0PdS4F
	RzrxzFNOHIwURPjzx1916EgeWP8XR6Xi4xYUercDUlmReUkY7l/E587r3sCyj36MopgBC0Gc7Fd
	+fosEyuLTiAsjxDkORijFIWqHiXDOJ8r8ioR/wUA/vv905DYfHbg=
X-Received: by 2002:a17:903:a90:b0:2bd:ef15:9fce with SMTP id d9443c01a7336-2bea3345f6bmr11166955ad.20.1779336403382;
        Wed, 20 May 2026 21:06:43 -0700 (PDT)
X-Received: by 2002:a17:903:a90:b0:2bd:ef15:9fce with SMTP id d9443c01a7336-2bea3345f6bmr11166445ad.20.1779336402878;
        Wed, 20 May 2026 21:06:42 -0700 (PDT)
Received: from [10.206.108.31] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d125159sm224568425ad.76.2026.05.20.21.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 21:06:42 -0700 (PDT)
Message-ID: <40f5320d-4b58-4e99-b7b1-d52d09c04127@oss.qualcomm.com>
Date: Thu, 21 May 2026 09:36:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20260520065047.3415790-1-ekansh.gupta@oss.qualcomm.com>
 <20260520065047.3415790-5-ekansh.gupta@oss.qualcomm.com>
 <jtqfnly2ma56gbdstyk7exk4lhw5nild57uyokkkgrtnnqqscv@xik2phrs4v6t>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <jtqfnly2ma56gbdstyk7exk4lhw5nild57uyokkkgrtnnqqscv@xik2phrs4v6t>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAzNSBTYWx0ZWRfX1JgdoizvgM9e
 g/oP2YOa/VdRA8OTA4C3ZoqZt0cMCz1W9W/+fP+fbi0zBzRGOTNODUzw/GjLOn33mYiY3DN7qxu
 OeiIyYd6KmptFjRSsnUrIpG9mJl9YJrb4NvPo3pulp8cFaW6BFL1SEWibsHzL0V+qneRHL0dYHb
 J/du8RtjaEQdikxkuB/ywWiSigWTmTEEEbctOZOS7hs8+liKmXnhId3XYzzB+cL5pPeyoBH/OPc
 dcK/NJ6GOGqzRxc/2tLqTCzEy2CLNFBb/VaYXg9CKMOndAcGwqlxmcq5xyjGILc2hHWb8sCkJG/
 0QIK6sNbXhR73DskCka4oosIxd1FeMH6WTn5IFBj4VyylRUZ3fy5a5Zw9ejtcWCJ0q/Cyt9r9Qp
 e/APs7JFxF2tVahWLSPrpfxBH0Ru4kOq5P5CUi9ZQ7gvNJpQ+Dxih2HvHX1AAVZhu3/tWtw976g
 jW7kPMsugRJBEkg5vXw==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0e84d4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=G4waM6_Fef8mLlXZwtoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: dfN-HxqfdTx58LrgCr-uPZVxexzt2j14
X-Proofpoint-GUID: dfN-HxqfdTx58LrgCr-uPZVxexzt2j14
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210035
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108910-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 857D959EAA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20-05-2026 19:06, Dmitry Baryshkov wrote:
> On Wed, May 20, 2026 at 12:20:47PM +0530, Ekansh Gupta wrote:
>> For any remote call to DSP, after sending an invocation message,
>> fastRPC driver waits for glink response and during this time the
>> CPU can go into low power modes. This adds latency to overall fastrpc
>> call as CPU wakeup and scheduling latencies are included. Add polling
>> mode support with which fastRPC driver will poll continuously on a
>> memory after sending a message to remote subsystem which will eliminate
>> CPU wakeup and scheduling latencies and reduce fastRPC overhead. In case
>> poll timeout happens, the call will fallback to normal RPC mode.  Poll
>> mode can be enabled by user by using FASTRPC_IOCTL_SET_OPTION ioctl
>> request with FASTRPC_POLL_MODE request id.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c      | 167 ++++++++++++++++++++++++++++++++++--
>>  include/uapi/misc/fastrpc.h |  29 +++++++
>>  2 files changed, 189 insertions(+), 7 deletions(-)
>>
>> @@ -1813,6 +1907,35 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>>  	return 0;
>>  }
>>  
>> +static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
>> +{
>> +	struct fastrpc_ioctl_set_option opt = {0};
>> +	int i;
>> +
>> +	if (!fl->cctx->poll_mode_supported)
>> +		return -EOPNOTSUPP;
> 
> This is being handled too early. What if the user passes any other
> option?
okay, right. I was handling this with only poll mode as an option, I'll
move this after request_id check.>
>> +
>> +	if (copy_from_user(&opt, argp, sizeof(opt)))
>> +		return -EFAULT;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
>> +		if (opt.reserved[i] != 0)
>> +			return -EINVAL;
>> +	}
>> +
>> +	if (opt.request_id != FASTRPC_POLL_MODE)
>> +		return -EINVAL;
>> +
>> +	if (opt.value == FASTRPC_POLL_MODE_ENABLE)
>> +		fl->poll_mode = true;
>> +	else if (opt.value == FASTRPC_POLL_MODE_DISABLE)
>> +		fl->poll_mode = false;
>> +	else
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
> 


