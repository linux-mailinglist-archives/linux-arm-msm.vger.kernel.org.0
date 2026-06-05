Return-Path: <linux-arm-msm+bounces-111303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 493YIW0oImohTQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 03:37:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8253644743
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 03:37:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A3xPGA2j;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MXoipIBI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111303-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111303-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FA6F3197D28
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 01:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30EB3A7F5F;
	Fri,  5 Jun 2026 01:17:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E01730FF30
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 01:17:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780622253; cv=none; b=jY/fDqj4rMwLF6KRjegIyhYC34gqsPkX8j0UmJn0aFFiKRy22NV8lHDN59XIKbKezyLGpJJuV8RD1tXgn4g7eWCOCxHpRPpvKMGsswpLPDb/6ImYneM2Fm7/1Qa/GwGoqsg875JS/nH3hxXWt7icZi/n89dh6+wYHawnWtRmApM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780622253; c=relaxed/simple;
	bh=FoTL2eK6Xjm2tOtBLk83ox/ORpi+04NDmEvp/2RHE4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YCyCLlCll7MV31DdcOirjlnMDXQXK5KCTiSWdU4FdKyiA3U1g2QQUVqIA+GBEmSyWupjpyZK6JfFPHZxHC+mG11b1SIuwCUqER2CrEPsvNZfgdu9v+FFzDZLKPihQa29WI3CcKWSFPMKGD+ISsVYo278ROqQ5WB+qSbLySpaf1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3xPGA2j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXoipIBI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654HOJ4M944530
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 01:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	230bGQ92X8rqHZh77BzSKjoSqIWkALpxCZRvN5mt1fE=; b=A3xPGA2jn6rXtOLO
	vGC5NxQlWf+yCtsh3OMLKSG5KksP9at1mijZM5x6dUL6DoMoPEe49s6JxmB0zXIO
	0mUbj1S8ygnkrheDIFMHgt9558+F0VRIHrnZBNJiMNo/ox27tXg+WPXwHUbKsEOJ
	nTtiTerEbsys8jlO4tHXH68MMMQF9OEwYi+//WxX+7p3jzmzE9Pv6oNjIAZmhjkJ
	M4jtNQxmRrKYvVC5PTXp1tePlmR41nagezt8X6u5FKZzTxmEEo/+pvlnDDNvjCA0
	7w3r5Ubw9zyWURwHWqtBZswW2QvYjjy/GIR4HSa8ean9brqGL2lhoVzSrnEdEaQQ
	+bRT6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek8d53h0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 01:17:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf2bc4371bso17281225ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 18:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780622245; x=1781227045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=230bGQ92X8rqHZh77BzSKjoSqIWkALpxCZRvN5mt1fE=;
        b=MXoipIBIQInp7UR93HQwIka5BcPiEAvm8Y0uIbacE348gvr6bYidEt3fvxOALO5bEm
         32f0Nzz4d7OtD1Q8rSEa/FMrjaeYnRt1ukFahW9nKDntK8CpdzwKApJYwHxDAx1VK7WC
         FVqrZuywZ885+j/KG0BUEFEzyN88aalc54YnXIxDydZm4yRYTpYZXBK8Cv2fxMdZvwzS
         Do/82C5gpEriFIxSKnvtvIyorl195a4Kgqxdy6M6j4c+ME1nyKPiFeLBKdks+IrdXfYK
         4QfqzWZxOhC1/5gY1oVpaWYhW4mCVwafSpSci+EMkREWCDPrUc8lDHM/EwN7FKwZepWt
         DGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780622245; x=1781227045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=230bGQ92X8rqHZh77BzSKjoSqIWkALpxCZRvN5mt1fE=;
        b=oGUGjs95zikZWf+J29oYql7l6RPIDVE5oVS44Dab2cqrkLDMuMvSoGM2r9ha0xADQZ
         mDwPPcRNXkX/u5v9mgv91VO49BZ0qnyw8UYl7khjQqzS/h5ufrTapWduynDdVhipTd6A
         LQ1NvQAzFrfuYdlAFHDiJG5WH0oFRbxKGHYmJAXVCK0nOZVMh6xP6uqcRNhFEi5289rG
         h/FclRbA1sH1aiEmgEAY59JoGhdT4Sd6iHbUwtm8DA6+hUC5R0UkyEAB03J/e63xjkuH
         C4ZhB9ytGOw02IZOrPiz9pcvKwCHjz+1twPLReGHrszdk+v99QcY7yvvFsqMO5TO/5Nd
         wnBg==
X-Gm-Message-State: AOJu0YyfpBZrQKVSp+OTeq9lE+DUge5Dt9lSigBdprS4BOKflci5j7oL
	ymOC7oREEFBNduwR0Cd+aQMmdTqpLVlWSk8Ug/FSjB7wPSYmTO9dtEWIqcXBfHz6/jvyID/GBSj
	ASQFs0Gay0fLBVUyxv+vlpbdr7xvbiBfKenlaw3DjJwtlEwY1eh2x/BokliBBTSm1lWzC
X-Gm-Gg: Acq92OH4xL5+j02aKEZyI1HuJ9QZci+tQx3TEbmVHRGWVo0W+g4vRIJBTDdb0TzYo2s
	cNQwPbumAetkVTUtGvmxTRYRNhLc+twW7+1iMecwwI8ISKId2/3Ea2EOIkT+7e3xlh26pRwHNbW
	HyL689r875pETNZoDw7I5Y+6wVGZjl9RMHwrFiBQFVeoIrx9g2bUBXPIiSX1Jvakfgw3EYza3qi
	R0sIQuY7rmLaTOsGMLxchs+b+pteIZswZ/0MRPTahqdPePdXIoUrHq/RyUZmlyYQmbNabfgTKpY
	SnCnGyVKhRbXGZv3ob6OSOZu98v177FPO7rJlUWtvLl5+A3ypbu5T1yMmr+J5cJQwTA6ue23lle
	5mwZGuOcdgcp3jTiOCWWe0ryM43JPEyUoLZYW88FcXjL4wJmfA1vLf/pNCKkZbHqTXzb2hMir5Y
	qwtPxVqcEJmELnaD3NZiF6
X-Received: by 2002:a17:903:acf:b0:2c0:a858:8128 with SMTP id d9443c01a7336-2c1ec54c8f2mr4016735ad.1.1780622244793;
        Thu, 04 Jun 2026 18:17:24 -0700 (PDT)
X-Received: by 2002:a17:903:acf:b0:2c0:a858:8128 with SMTP id d9443c01a7336-2c1ec54c8f2mr4016485ad.1.1780622244342;
        Thu, 04 Jun 2026 18:17:24 -0700 (PDT)
Received: from [10.133.33.77] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649ab01sm68952155ad.71.2026.06.04.18.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 18:17:24 -0700 (PDT)
Message-ID: <3896c47d-41c0-4b61-a115-c5d6ea282fa5@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 09:17:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: glink: fix deadlock in endpoint destroy during
 driver detach
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260604-rpmsg-glink-fix-deadlock-destroy-ept-v1-1-b8a54ad1e4fd@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260604-rpmsg-glink-fix-deadlock-destroy-ept-v1-1-b8a54ad1e4fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JPa2Ef1EoIp9sSa9PteNQMoPRUUHcMWv
X-Authority-Analysis: v=2.4 cv=IZG3n2qa c=1 sm=1 tr=0 ts=6a2223a5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xBbfoKGClFlJqF7rv9oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDAxMCBTYWx0ZWRfX1mAS8ollEV4F
 tqATl1gvKOYd2zSOqbtrivhz0p4TSV4D6myRZ0q8ebPRhBjNhepYMoBOuzX0JNhpH6R21IOL4na
 sYkFRcD5nrhp/jY/w5gywfJrWFSBvfhEQG9mJG3OBTv7GiDYDHeV6EqVqU/AO9mI3pJIzMsX4uV
 Vx8d9ELM//1LFTIcZDegNrLtneKcXGH1XCCWYsReU1+z6E+geit0SSFFNYMivkTK3mPXJd+BIoH
 kAr5DVjXA+LIUT6Q0V5CS2TxxXlmlseA1lCMkRjqbmh4yJVhkO8tXIOvxnnjCWY2s+8oWKVoqAn
 eMOiq+z/7gVH/mpekK8fra2YIN48JAFbrLcUsphnDCMfHfHacBzmyQjKdnFTTAZKtV2Rzvu4IN1
 YFfO/Q0DIzETFLAauroFvddtJ4sDZjlDMMh1mSJA6CnhcZP90n4ORhHCYOEMkHoH9TNEy8d4nvs
 f+TN/VtRDcgt/oskK+A==
X-Proofpoint-GUID: JPa2Ef1EoIp9sSa9PteNQMoPRUUHcMWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050010
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111303-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vishnu.santhosh@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:deepak.singh@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8253644743



On 6/4/2026 4:42 PM, Vishnu Santhosh wrote:
> During driver detach, the device core holds the device mutex throughout
> the driver's remove callback chain.  When the rpmsg endpoint is
> destroyed as part of that teardown, the GLINK endpoint destroy
> implementation attempts to unregister the underlying rpmsg device.
> That unregistration calls device_del(), which tries to re-acquire the
> same device mutex already held higher up the stack, causing rmmod to
> hang indefinitely.
> 
> The deadlock manifests with the following call chain:
> 
> [<0>] device_del+0x44/0x414  <- tries to acquire same mutex
> [<0>] device_unregister+0x18/0x34
> [<0>] rpmsg_unregister_device+0x28/0x4c
> [<0>] qcom_glink_remove_rpmsg_device+0x70/0xc0
> [<0>] qcom_glink_destroy_ept+0x58/0xbc
> [<0>] rpmsg_dev_remove+0x50/0x60
> [<0>] device_remove+0x4c/0x80
> [<0>] device_release_driver_internal+0x1cc/0x228  <- acquires device mutex
> [<0>] driver_detach+0x4c/0x98
> [<0>] bus_remove_driver+0x6c/0xbc
> [<0>] driver_unregister+0x30/0x60
> [<0>] unregister_rpmsg_driver+0x10/0x1c
> [<0>] fastrpc_exit+0x28/0x38 [fastrpc]
> [<0>] __arm64_sys_delete_module+0x1b8/0x294
> [<0>] invoke_syscall+0x48/0x10c
> [<0>] el0_svc_common.constprop.0+0xc0/0xe0
> [<0>] do_el0_svc+0x1c/0x28
> [<0>] el0_svc+0x34/0x108
> [<0>] el0t_64_sync_handler+0xa0/0xe4
> [<0>] el0t_64_sync+0x198/0x19c
> 
> The rpmsg device unregistration inside endpoint destroy is redundant.
> In both contexts where endpoint destruction is triggered:
> 
> - Driver detach path: the driver core already tears down the rpmsg
>    device.
> 
> - Channel close path: the rpmsg device is already unregistered before
>    endpoint destruction is reached.
> 
> Remove the redundant unregistration to fix the deadlock.
> 

Fixes: a53e356df548 ("rpmsg: glink: fix rpmsg device leak")

Thanks,
Jie

> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
>   drivers/rpmsg/qcom_glink_native.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 401a4ece0c9777398837d4427746fae0a5003e88..ab7ff3d2f56bf797592fc4227ce5b730bce72226 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1418,9 +1418,6 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
>   	channel->ept.cb = NULL;
>   	spin_unlock_irqrestore(&channel->recv_lock, flags);
>   
> -	/* Decouple the potential rpdev from the channel */
> -	qcom_glink_remove_rpmsg_device(glink, channel);
> -
>   	qcom_glink_send_close_req(glink, channel);
>   }
>   
> 
> ---
> base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
> change-id: 20260416-rpmsg-glink-fix-deadlock-destroy-ept-5cc7aac522a0
> 
> Best regards,


