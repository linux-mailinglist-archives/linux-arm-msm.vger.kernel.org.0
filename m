Return-Path: <linux-arm-msm+bounces-103435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OiPCP7s4Gk4ngAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 16:06:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8DB40F5AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 16:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EDF6310DA0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA453D565F;
	Thu, 16 Apr 2026 14:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K88paQfM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aHrI5x0m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966EE38AC76
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 14:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776348174; cv=none; b=eT3NodliRxIehFEXjFEz1xi0FIYoqMgGTu7oyUUyAjNvmf0weHr7K+uWRpHG1O9415p2OaTB7091Mwae2scdHJP7KvhyvmajH6Zv0cobzthDiIKFZdqfBPIfp8KTG2kDutuUFfR0F9h5q7SwIrEHHsN7vksFt9EVy1uW5rzdFQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776348174; c=relaxed/simple;
	bh=qjRdv1T42sIsZ52Prw/LobikbnuRFbe8j88C1bwa3Wc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D6NDcV7BYlg985q0ai0HdxVVk4wMqz9gXNm1ki7zXZ2TUEvEusctNtn3W/QqxXDuPbEzoWz51zmsXbLSzOY/JHkLFTmMslTw+d180FG2ua528mkynHuuonOTE9yJsEV4BPdx3WhgPsD5AZkE/A5ihn3ekjawlex3fKzTGTSacac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K88paQfM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aHrI5x0m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8GJb0862379
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 14:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lK4ABVEsh6vQVo/gXF6kYceIrK1uJbLooD8HSUD9HiY=; b=K88paQfMfy9cAtk2
	kzMbi/YdkaDrgPNwIPQdzDhZWgqOjhYwuwfNHKEgk33d09bMdZl4Jn1gEWXtCIWN
	xM7vM0Nxi3aycorwa1zAfmTBHGb2SgsewN/TnguvOvzP1WUe3qWTz5cTqu2FUcL8
	1TO5E1xZwik8YQNb4VcmGuK8Ln88CXRyyhhuEamnc3wtzBZwgIJ0rHIR8DhH+r0C
	fQBMA0qd4i3yNWUtAprWcS94JZS0gdGZDwZSMpnobI0RNIGa6c1fcYSQNmo0DJJl
	HiFPwVrpWTmUb5C6NaxcFEqCepv4ygg6L6mSIfdXRuAM810/1x0ng1rRs2s4ojF+
	0mwn9Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djd0ec5jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 14:02:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f543bae3cso413961b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 07:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776348172; x=1776952972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lK4ABVEsh6vQVo/gXF6kYceIrK1uJbLooD8HSUD9HiY=;
        b=aHrI5x0mXosil8ChXkeS4sa/GxfRmAjl4+gvs4Gnr1ZKae9StN0pPLxxGBYnwI9Xab
         WqiZJ54PL7q+2CogHqZ6dFRpJfPkvNV1PRUlGq6NEiAcVbjGfey/TVlr4DYiZd9SVBBa
         A7UBamYsy3UdZHhxMNq6VXds6QQmrej64NmW5ZK0x/ywzXKNl05hll4s2/+zfZpznyqZ
         OmzilPZGcCb1JxrsLbR49O2Cbyc8lVl8n/aErV5J8gI4SnSSL6VbDic97/ig0RDutd3g
         IBzKGw7UMkY9dDqeBtVLXZnlpqojTbxoXYr6lITNldCqCln/lrkOso0oLCwY/kpK4aUB
         tjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776348172; x=1776952972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lK4ABVEsh6vQVo/gXF6kYceIrK1uJbLooD8HSUD9HiY=;
        b=qoNYjd7ZFH36r3lVbm/4cwG+ORG3BwDPykEt2/2Yw0rAxUwjyWNg52UMUu7WrNB0S8
         eoryFm0/W+F6hPb9GLKM4ld668A655ZVqqAG1ieJXCXVhr0N/AYVODvfTbgbJkr2GkUp
         O7+Vqmg50+h1qcmKHxUB+ScpI5ibUFTgw1/ifAdYNwRwncinZlVm8hNdmpS0oOjPCkzv
         Aqip7Mm04py92zJwApeWWmu8zJrXFW/UTWaeJzWOqv6xHjWM5WYpwW/B1I9eiNlrN/yL
         eDR853y+JeMFcIu56sNcETzSNPMOxVA/RezhxnZgnfq/t+I7eggUmnd2PlaNAH8cpX+w
         Fdjg==
X-Forwarded-Encrypted: i=1; AFNElJ8jahB7cAloFaq5hipyf3MPkmwX75nj6Gxlr6QHOt5B+UrfWR7kOCImZ8AjjzHFCutVBVNUnnRuFcOsYw8j@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ0r7EzN+Z3SC3clMYMgJ0JSC7kzNSlHuytgD/h8EgWwjW87R6
	Mq9W4FFXcKoYAg/33vepNWcvi8etoLkOL2svbJrRNje4uJlSKyB8ROAD/E4oJS2RQF7jb2OF6vl
	50yCsvgrfVO8qFCDF7nwIVpkFOEK7vfiiQltufilYxbXXP2EJ33vvksUT1sjcQfwDMO/R
X-Gm-Gg: AeBDiesOSPjI58UMFdxxmmRgm8Pl/n5ygyS0Id5gOwuQFiBhIjUIfIktUGBuMJTX2aA
	EgIQnpxSXU98lcSAzet7NRK7/r7HGDXaLIgZ+1ZS9YyzdXx1W971+RZmelw9B6LuSxLclUZOODP
	P0SVAUDVN2VzHOlqiG9p68HdwzFWVZ91WwfU9zdQr9mzOI6H4F9/NtIOm+Kz9yhw8ikOINbzfBh
	oHJoHauISdgfczao+3G5LoZ2szl2bFojmBnQ4w0rUE0tgp9dAb6NaKXuj1FdGnrL/jAERrEQSV/
	DiK65yp7vzgJDAtHFBB3/1aqbdYq6NGfOa3zPWAB8SiyyM3IGKBgCALfDBzg7HPjiZCkOHaV526
	FYY0qM5dvvXkOqiKtcOfIrOIP4gbdHYqiSruDErWPVqhjkY2nlSbf1TESh9BeUck=
X-Received: by 2002:a05:6a00:4308:b0:82f:6640:7221 with SMTP id d2e1a72fcca58-82f764f632dmr3315537b3a.22.1776348170757;
        Thu, 16 Apr 2026 07:02:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:4308:b0:82f:6640:7221 with SMTP id d2e1a72fcca58-82f764f632dmr3315466b3a.22.1776348170039;
        Thu, 16 Apr 2026 07:02:50 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.36.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f738b399bsm3451789b3a.8.2026.04.16.07.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 07:02:49 -0700 (PDT)
Message-ID: <0bab12c2-48f3-45a2-a87b-b33b60b5a7df@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 19:32:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        konrad.dybcio@oss.qualcomm.com, andersson@kernel.org
References: <20260415112530.4083240-1-ekansh.gupta@oss.qualcomm.com>
 <20260415112530.4083240-5-ekansh.gupta@oss.qualcomm.com>
 <ymieeagodsfbygq7fsejsqriajmncoubzvor7t3ll6ntomtbeg@l65yihnixwbu>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <ymieeagodsfbygq7fsejsqriajmncoubzvor7t3ll6ntomtbeg@l65yihnixwbu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NjeWSK5Sa8l9UFTAcv9zAsT_LLW6jPJq
X-Proofpoint-ORIG-GUID: NjeWSK5Sa8l9UFTAcv9zAsT_LLW6jPJq
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=69e0ec0c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=XANuBpsXGvULjGEGCPeV4Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pm_eAs2JUF_NPnZ18oEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzNCBTYWx0ZWRfX3lz3O8HMdn1h
 amFKLHX3y2Jn+Ydnodx/cJ32AgFqUr01GTaa9OiY2muYXOxljqTnKOhmO08ASGB1eFeKuf6xcNq
 ZqtoS97Hjmc11WYd6lAgF0YYMeycZ7+YSrOX6SGiEZ5AfzWqeTn56F3V/Yaxdq3ZF8gRs9qhWjm
 W+4EnyD3hOxQsuqIHldUb6+C7gCub9wA8ca4JEPtwr66hIUDncVsWbH1vczDFcKPi0wKLsRLTyf
 JV/Q3oQ2ysqAKtiEanOcI1aqAO+JD9WUAT8jbZMbQwyfwx7YgBWXGhOQuznxdHVThy193frY9Aa
 eV+iy+mWaECVKdmnJwONqLuDAaxgHdUfSVYA1ayEY2jCr36F4ByVGMRW1CebWNKPEnPlZd2IhF2
 u12954A+D8NUoKq/zuJBQe9euDqHvNRcr/pKI++z1X7IpVmv4f30Q6nk8InhRdwhRypelEUbX88
 C+j93GP+EgRR2PiYEBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160134
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103435-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C8DB40F5AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16-04-2026 16:25, Dmitry Baryshkov wrote:
> On Wed, Apr 15, 2026 at 04:55:30PM +0530, Ekansh Gupta wrote:
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
>>  drivers/misc/fastrpc.c      | 137 ++++++++++++++++++++++++++++++++++--
>>  include/uapi/misc/fastrpc.h |  25 +++++++
>>  2 files changed, 155 insertions(+), 7 deletions(-)
>>
>> @@ -1813,6 +1908,30 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>>  	return 0;
>>  }
>>  
>> +static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
>> +{
>> +	struct fastrpc_ioctl_set_option opt = {0};
>> +	int i;
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
>> +	if (opt.value)
>> +		fl->poll_mode = true;
> 
> This will enable poll mode on the platforms where it is not supported,
> later silinently changing back to the normal mode. Please don't surprise
> users and make this call fail if polling mode is not supported.
Ack. Working on adding compatible based checks for supporting platforms
by reading the root compatible string, something like pdmapper[1].

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/soc/qcom/qcom_pd_mapper.c#n643

Thanks,
Ekansh

> 
>> +	else
>> +		fl->poll_mode = false;
>> +
>> +	return 0;
>> +}
>> +
> 


