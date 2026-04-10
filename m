Return-Path: <linux-arm-msm+bounces-102709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMNzDyQt2Wl+nAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 19:02:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D84AA3DAD89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 19:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FE32300DE25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 17:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D73E3E275B;
	Fri, 10 Apr 2026 17:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMoDkyl7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jcD129/d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AE13E275F
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 17:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775840518; cv=none; b=s9LCkrUguU2AlFvw1cQNSb3wy3vUkOIiLIDDps2aMUIPrvmgYAxg2kFu/J8lXgNr2GLlx/2iNRBrb67KxMSgL2uXWjNlCwwaBrqosZx0Ep1kdOx8yNnjzXhZFFQm6zfilexarIwMjSNHDYBTo3rUMgnajtYYHX2syuoQz0X+sq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775840518; c=relaxed/simple;
	bh=IGU6r6RgBHcOJQZIwjsV4tXNZc2Qsf/ggmtS5M8HXFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gdS5SAfKD+JtctdnnbYo/J8ldBAjLuYRrKrFSHh5XOnQ0MkCbMtPNNKaqYy/wLCwKpF+HUXTrtharERhTvyq8yj02hj0hA5bgZPGUm2S+HtDT8dHDIc4vCIeN0li12udR65N0bTW5ow+Trty0wzzNA2y0xfRtgFF2IXV7tfEyGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMoDkyl7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jcD129/d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ABD9Sa4147281
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 17:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bp/JyCTFtYQweJXfZZHfGdsxTk73Q69WkzJJd9yJDo8=; b=TMoDkyl7oeUMHSz1
	h4wbFV4nYnVGhfvzDmN4xUy6d0XMg8QC98zam32doQLoGBKcgqhlDgl2GGhxsAwD
	Xhtc0/Lxf0xf6G53bITxUHvJYoRwyAT/NjGQgPi1RxMVFBjKMVaNySXEOU4Ary16
	whCWw85DgOcGC39X74/lnJBWIlOuxiq7kLenyia2XyhsogfphGqWMJkkdL2HR9LM
	3s1mbFDwoIFjzh9Bv2CfVchktonmZinmvNQUZR+7aRBnXciYJvggaocDtWc0Wal1
	hNq2TtTgsEfTfLzAkagGORu7vD/v2zFFu3XEY6O2CxDzdXL0k7aaRg5EZknl4it0
	Ct6dIg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudgj6um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 17:01:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so2532109eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775840514; x=1776445314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bp/JyCTFtYQweJXfZZHfGdsxTk73Q69WkzJJd9yJDo8=;
        b=jcD129/dMu+EGn/hFwZk2cj4XNsEn89RpSVuNJrh7R2ro0HGPJqfRjOQCBV4W8nCQB
         AFtSzhXc10sNH9yhGPazMkFDGVOyOO1M78TdAdcBszUP2dj7F7HjYOaqj81fwPKOKCTZ
         mB5hzUlZYbP82hf418tx3rLGp3JfP7kKFpCmkcrGyVIuVczzbyO4FF0aqqPhZGgpw1bA
         +ursltFo8+2zozF8RuIyBpLpbd4pWSyH9Icf39T9v+Kfm8Eoov/1Kw5aYesF3rcqQgTv
         U9Wk2+36e8yDFtbU+xYnLP6y8xtXzyT5N7vFA3ks8NVAZyM9c+AWkOzfWnrw1FlgdtMh
         WszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775840514; x=1776445314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bp/JyCTFtYQweJXfZZHfGdsxTk73Q69WkzJJd9yJDo8=;
        b=LEgtIgr0Fn1DIPj6OSRw8c+j3ss+1dh0UsqzMy0lxk0R1CvcShIgVeaa4vThiKC3/k
         Eu4Z8mlcBY2SfIc2Eg/KxWHq8WypLt1XJOam8m/0xA017mNJNTVLCE3NUskdy1dG8NtF
         l4xhxn28xKrE8t8eIX2+EgQK+2AL8qfBCVOBAD2jPqrSeJCepkAyspaNCEBQiT9SRR6d
         vfGCiQZ3Nf9NZ8Js0ypakGiTnZNFdM9LqnPDSNuwnzyGazDceY9K2NHPc7/hxRRktpW0
         r8fVpEtSerkVp34poW6X9tCB3BvAoGc7msazcWH56Tc0Og+LI+I7UYkLT1j43dtuoaYj
         tF9w==
X-Forwarded-Encrypted: i=1; AJvYcCVaaVPVqxngOs1VhhMne5kvma0W+tyJRjkO26egW3iwTCEdnnq35zR3703+ZG3VfdxCmEG2GdBeTlcPVw92@vger.kernel.org
X-Gm-Message-State: AOJu0YxZCCxEthibLV9KQxcfBEKwMsdpNQlpmcWi8lsJm+jjj38HGnTk
	94/A6mUgZamiK/7xzv+dwakW1v2z1LssYmTKsPmG7fQwaucAfkFZ9fQYDxDCI1pAdhiKOxjCdLD
	qW50INWVYAtpB9ZylP0c8tK2KmFa6TQ7gkDycQ482QPTXJQgh7A/H5pczqAUHO8Q5BQ9M
X-Gm-Gg: AeBDieuV1VYQSxsj6vBlZ3b9FPbI6FASkxgW48ix0jMvi/uoCMWADPM4odle5WEIM1O
	UANPyPrcs7Eqx1ijre9Ewxn0ywdhbWk1CovV307saPydnlcYF3Og0pCHR9beaShSdGMRxdNzwyr
	tyyeVYp8/tul/EsbcTMVSvs+6fE+8gx9lHWsv3+ZCeXQhGChleWLkdm1XNK6O2JGeh00zP+mpOo
	BA3XF0Masfdvf0fmFa9XJcaq3whnuczCUteEm9DnneFAKqBjIy6Y7VvL7Un/5iUj0c6eJi9ez5y
	bHcfQNbteCNOo+thkE1XJlqVbjlSP4AqBYfNsMHp631RghoRsiGCyN+2EVRHh2yAveLdJiQlM4I
	9MC7stxAfUuKNE5hTaPKTaeoi/yI25h2HVgX9TaCcTtcnIhQor8PghcS4Ymlq31vX7De5Ixk0+W
	E=
X-Received: by 2002:a05:7301:4089:b0:2cc:afce:bc01 with SMTP id 5a478bee46e88-2d589daf1b2mr2340777eec.29.1775840511779;
        Fri, 10 Apr 2026 10:01:51 -0700 (PDT)
X-Received: by 2002:a05:7301:4089:b0:2cc:afce:bc01 with SMTP id 5a478bee46e88-2d589daf1b2mr2340682eec.29.1775840509759;
        Fri, 10 Apr 2026 10:01:49 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55f5c69d5sm5778968eec.3.2026.04.10.10.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 10:01:49 -0700 (PDT)
Message-ID: <b772c81c-3628-45c5-ab11-a0737a94b812@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:01:47 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] accel/qaic: kcalloc + kzalloc to kzalloc
To: Rosen Penev <rosenp@gmail.com>, linux-arm-msm@vger.kernel.org
Cc: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "open list:QUALCOMM CLOUD AI (QAIC) DRIVER"
 <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260401220643.12802-1-rosenp@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260401220643.12802-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KuBw1JUXry-H5gghA1uRYlHTJ71qHi7J
X-Proofpoint-GUID: KuBw1JUXry-H5gghA1uRYlHTJ71qHi7J
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d92d02 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=xkNXEimOluXcSHuVYG0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE1OCBTYWx0ZWRfX5nPnH3USFb0D
 LrycXpJm397+Upbaw6tTei/MRrUPwn66DZKXB5il0PWtsCUnsYQLX2/8BjQN3ivEhY2xQWpzHdT
 SWXpnH8ZRxZcE6w7fB4VWgiZLtqIVWxLOsAr40IdNZD8jRdURWdG6yhviaftpxTJ93i3XZiC+Bq
 iSgu3Fbc/bfYudnrpa0sNlrOu2/ELm101WKVR2s/QnGICcSEM/zxSHa+Ou/Urpbax8Vs3Sd/2nm
 pWDVMmbZq4UJqayl4IEUSWn+KuqNXuANmGv6netS/DsFLy6Mdb/XnlAOnd6VPDLZR6NWcqsqPuM
 rk1Dwb/X0y+jUFEKpPm9YqeCQj0VomzfXYncxDXd7Njoi9dHPATtT9iU9v/WvcP6vZZ5VzC9iDo
 MmVwdV0l2sZJBilVpTZde8GlRulxOopXxDVHHwKXfv3OvbEyooyYcJ/gfowXIZr7vBNDfJzXLwl
 6754GYlTvu3UILdLcNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100158
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102709-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D84AA3DAD89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For future reference, $SUBJECT should have a space between "PATCH" and 
the version. git format-patch will do it correctly for you if you use 
the -v option.

On 4/1/2026 4:06 PM, Rosen Penev wrote:
> Consolidate the two-element allocation into a single allocation using a
> flexible array member. This reduces memory fragmentation and simplifies
> the error path by eliminating the need to check for allocation failure
> between the two allocations.
> 
> Add __counted_by for runtime bounds checking.

This reword addresses my "why" comment on v1.  However I don't see that 
you responded to my question about how this was validated. I don't 
require a v3 of this patch, nor do I really want one. I want you to 
reply to this message and detail what validation you performed on this 
patch.

> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   v2: use macro for number of elements. reword commit message.

Also for future reference, a blank line to separate the change log from 
the patch diff here makes the change log easier to find and read.

>   drivers/accel/qaic/qaic.h     | 4 ++--
>   drivers/accel/qaic/qaic_drv.c | 8 +++-----
>   2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
> index fa7a8155658c..e237020f6aa9 100644
> --- a/drivers/accel/qaic/qaic.h
> +++ b/drivers/accel/qaic/qaic.h
> @@ -152,8 +152,6 @@ struct qaic_device {
>   	struct list_head	cntl_xfer_list;
>   	/* Synchronizes MHI control device transactions and its xfer list */
>   	struct mutex		cntl_mutex;
> -	/* Array of DBC struct of this device */
> -	struct dma_bridge_chan	*dbc;
>   	/* Work queue for tasks related to MHI control device */
>   	struct workqueue_struct	*cntl_wq;
>   	/* Synchronizes all the users of device during cleanup */
> @@ -206,6 +204,8 @@ struct qaic_device {
>   	void			*ssr_mhi_buf;
>   	/* DBC which is under SSR. Sentinel U32_MAX would mean that no SSR in progress */
>   	u32			ssr_dbc;
> +	/* Array of DBC struct of this device */
> +	struct dma_bridge_chan	dbc[] __counted_by(num_dbc);
>   };
> 
>   struct qaic_drm_device {
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index 63fb8c7b4abc..1dda8dfea5a4 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -43,6 +43,7 @@ MODULE_IMPORT_NS("DMA_BUF");
>   #define QAIC_DESC			"Qualcomm Cloud AI Accelerators"
>   #define CNTL_MAJOR			5
>   #define CNTL_MINOR			0
> +#define DBC_NUM				16
> 
>   struct qaic_device_config {
>   	/* Indicates the AIC family the device belongs to */
> @@ -405,15 +406,12 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev,
>   	struct drm_device *drm;
>   	int i, ret;
> 
> -	qdev = devm_kzalloc(dev, sizeof(*qdev), GFP_KERNEL);
> +	qdev = devm_kzalloc(dev, struct_size(qdev, dbc, DBC_NUM), GFP_KERNEL);
>   	if (!qdev)
>   		return NULL;
> 
> +	qdev->num_dbc = DBC_NUM;
>   	qdev->dev_state = QAIC_OFFLINE;
> -	qdev->num_dbc = 16;
> -	qdev->dbc = devm_kcalloc(dev, qdev->num_dbc, sizeof(*qdev->dbc), GFP_KERNEL);
> -	if (!qdev->dbc)
> -		return NULL;
> 
>   	qddev = devm_drm_dev_alloc(&pdev->dev, &qaic_accel_driver, struct qaic_drm_device, drm);
>   	if (IS_ERR(qddev))
> --
> 2.53.0
> 


