Return-Path: <linux-arm-msm+bounces-117185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yaBRAhO6TGoaowEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:34:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E760719275
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:34:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dJCvceik;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="BxYjG/qX";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117185-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117185-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0013F305FF13
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 08:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB6831E847;
	Tue,  7 Jul 2026 08:32:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734053254AF
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 08:32:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413142; cv=none; b=GXFtf1ELal8MWfePWHOTWtkLYYcClS1VfUALWdRTEDYfw/1K1IYu336x3+za7e83e7wMmaE2TybkGQVDtcqnNky/SUano7S004AT/HBacQuwuGkimuv/PYq4ttPU52UnwvxZNN+EdvokJZtKqYTIA3adv2DaPxS6DemkH0S1OS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413142; c=relaxed/simple;
	bh=GxJ0wg/aa764RWmNYEzMSR7JW+lkVrfxCQi2pkNhbEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=G7o+Dhb0l8v8lnF+D7/ZYvi4k+U82kQyYT4RTTF6rargKW0DBud+ew2FCDbjG96QfhSjD0lzU0Oe2TaQrxy+CSj00lrm5+EAFUx14N1kyDOiOOBIc4nfmXEd+SFge74WxUeLPAGGD2UsFgbhZXI/3FY6/1btDy/5IDiCmiVnT+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dJCvceik; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BxYjG/qX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678EE2p3203460
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 08:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VouvbjaFsGUNSHVW3vymOiR/LkD//UOCZ6vwO722dTs=; b=dJCvceikkcklwupq
	yysajrwCw09QkMYAqfjPwPvmTjESX+6o61GsWcqW8LEwsmGVzSEjNozALmEDeKGp
	BgWncEG9+iT/xQ4Ye8HxJZ8kQ+kUTHQ4G0MKMahzGBIbz5Vb1J7AyOPVa1mccrVn
	XAJWalclwj0SDYoF8SIJVWQDF6MaEg/vUNU9hyjQ1WOvhsjtuoSpqMq9RG4/wlwD
	DmvjesWOgdL8Ua6sPR66vBukvcLAVSm1kWLFuPHMnj6jYnD7wMRocP81afcOF45C
	ysGLCYlDeHzWQclA3x0BUQEEtevCYS0PB+ydh+wqg6yQkz5E8ukchd4HJqNKAF9y
	/oce+g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a8gas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 08:32:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-380ddac2b02so6061826a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 01:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783413138; x=1784017938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VouvbjaFsGUNSHVW3vymOiR/LkD//UOCZ6vwO722dTs=;
        b=BxYjG/qXr1AJeGC3H6JdyevnOhh/z1L91XxApkJiLVmgp5e8j8WiwiPSPvlRpk9vUI
         rLHxKBEPKkZ2oaRoNCubKLgVo+Pw5SwOlFNK8xST93LTYpPMZvlKAnqiWDr6qR5Gr2vO
         5Z6Liiwu23JcGeXJIxLhAZj894aJlqZZo/SvJfb8kQZ46ILrotCjA73BwFncHXD0Ircg
         ck/T/82IiRE5hTsrp7KJgOxnwebS3UgNJfqd1My/tU7mbe/ALs+D6D6xlRke7yex5SJH
         wqDx6y07YwvFpynunUrBJ3Qj9gGaNxlqkdOCU45TI9mk08a97T1Hpvz0JZm5ABeJlaUk
         OiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413138; x=1784017938;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VouvbjaFsGUNSHVW3vymOiR/LkD//UOCZ6vwO722dTs=;
        b=kyX1LPvH12/vm7ixEMIge5LW3o/qIgDnYDo6GKi67qWtQQjtHGTk7MKrNDXhse7xd8
         UTUJsQVLWi3h66k/xGzStiplq3shrpHkCbxd/ZbMPH1KHhD0W3TLJcUdFU8fcZVaJX1o
         zGrp4B79CApC4rNi0Pc+giFiIWcIp4uLyzl7+5GKQoocXqCnpzBI80m3lYroz+Y2ILwm
         z2GR8MiPU9kIUUlki2A8nUhRl4pjPyYfOlD7u+p6ZySwiwvhewhytSDyrIastZIhDJWD
         mQHF9xdagtkI69NNlDog2THazrdqAHctXiKWQgWtbHRbEqllIXfGhS01URCsk+mdKYx9
         CaOg==
X-Forwarded-Encrypted: i=1; AHgh+RoBN2ljsBLaPnNNdZRWL5S5QppKrRwjgURxC8nQY79S0jZw6fTgvij6VcwpzA0c/BORozkiJyWsiXuQgZ5W@vger.kernel.org
X-Gm-Message-State: AOJu0YxKVfuCw5NS/02D+cgidg/IgVb/rTqHeQlYaXcDcGFnnT2RL+eE
	sKMjqQPZZD6EvpUCROt79QQV3zXC6uR/RTVKhDWBsbMj3YeQmiFJR0ZSYU7BrUPNBq9Eg7064Ge
	qcfZXTRhl8HFkceZWBnkHMExnRdguzmrTEEc+gMd1Hp1b06Pfv1TBzd0zvcqGKuznIxj3
X-Gm-Gg: AfdE7cn24MQfgQP2VGXxyWeTWrxCQLQgy54f0r7HSvuJ3NJzuXOXXtb41MSavVgoixB
	k7fRvQb78o/MKBYoL3ZjzF0zxbRQZ9IqUGiCBtcrTuVLp9zkSfk0eLd0tWutYrkfwTsgau9jwOx
	DmsVGhi7yrIK9cJy3CkqiC2XRRr3zq6Md+39xJUv6HBvNSMgPxqp1NPTyrT9nccY7iz3NdGnCnE
	XrhP1aFp/rMwSZ91fkdHk8IZ1z40lL6k9SWV+MoKc/4D05MjSoAaphg6QXXUYKdL8OsvjaKxjXQ
	EqImt95IW+VAvESXYqTAfx3XoXgMy6nLZ/zjcOuJ8e1KG152A5z7++gwSkclBMr3yEWnGIlRaUG
	wJLNz91y/YUM3uXty6pHzuGuajfXOURtvIrKxa9lE9WeOinVkbJ9VU41kyz672QSwZw4MM5vsDf
	JxsSWULQ==
X-Received: by 2002:a17:90a:e704:b0:381:e73:3c2e with SMTP id 98e67ed59e1d1-38758a364e3mr4428499a91.24.1783413136955;
        Tue, 07 Jul 2026 01:32:16 -0700 (PDT)
X-Received: by 2002:a17:90a:e704:b0:381:e73:3c2e with SMTP id 98e67ed59e1d1-38758a364e3mr4428451a91.24.1783413136394;
        Tue, 07 Jul 2026 01:32:16 -0700 (PDT)
Received: from [10.133.33.178] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d3a65609sm683410a91.14.2026.07.07.01.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:32:15 -0700 (PDT)
Message-ID: <2467f7a8-d7c7-41be-aae9-04a5dcadd15c@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 16:32:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20260707061733.495-1-jianping.li@oss.qualcomm.com>
 <1e7d0b9f-380b-41a2-8aba-7ab25c6a8680@oss.qualcomm.com>
Content-Language: en-US
From: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: arnd@arndb.de, Greg KH <gregkh@linuxfoundation.org>, abelvesa@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
In-Reply-To: <1e7d0b9f-380b-41a2-8aba-7ab25c6a8680@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OY0VBYwVTwqwmP5Roszx6ELU7Qy6MdaY
X-Proofpoint-ORIG-GUID: OY0VBYwVTwqwmP5Roszx6ELU7Qy6MdaY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4MSBTYWx0ZWRfX0D4JXbbbkdPn
 7+2e0QeT4sMz3H6QzD9X0kPp0crYwodpfQI8razcwfeGmP2IbJpBC3jcNetQVKIHdCsR/KiqAFY
 QZy85sTR7cZkhHwcQ5n/NgR2DRDiRdo=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4cb993 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Yk0qE0SaCswAtkPT5K8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4MSBTYWx0ZWRfX3vfcY1NM8KAu
 lAbKlbSDDnsc++ff0W9TvYvdBj+ChmZW5vLbwtelBCV/gUip74tBFeF4eF1bkQ1kXR6ICusX+oO
 g0fatRFR0v1eQJcvdiJq3qkVKpUsQGQ7zoa4xO9xSCM2q5rLAb5RR1yu03Ffnxz4aTE8o2/yS4y
 EkjYjRNI7ZlzWzRyyviKdQhCP6CoQm2gTMnvqSUloDeASDdDyHQm+zpQS4S2Jx9HXXNkGqwsPbh
 7gcRFAB5FIH970U79g0fpYKu4VfxhmFNXPlhPjT6lgxc52Mdq2XCLXQstKaClF/FwhEhcswQOm5
 fnUq+hmfVWXR1zR74AJLheSkCvgzz+a/3kmh5rHge+d5yFGxU6D3b3+HyfV42FYtlT6Gk22tg+k
 aQS9QV6VDzybyDcTJ4wSCIxBxdQ/9Z/cXmi0J0YMtKDsjsJzsMj+R5KqgILMIZwPhvBNdVQh3cQ
 boPMUd4Wcl6aWmPD9RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117185-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:srini@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E760719275


On 7/7/2026 3:01 PM, Ekansh Gupta wrote:
> On 07-07-2026 11:47, Jianping Li wrote:
>> Allocating and freeing Audio PD memory from userspace is unsafe because
>> the kernel cannot reliably determine when the DSP has finished using the
>> memory. Userspace may free buffers while they are still in use by the DSP,
>> and remote free requests cannot be safely trusted.
>>
>> Additionally, the current implementation allows userspace to repeatedly
>> grow the Audio PD heap, but does not support shrinking it. This can lead
>> to unbounded memory usage over time, effectively causing a memory leak.
>>
>> Fix this by allocating the entire Audio PD reserved-memory region during
>> rpmsg probe and tying its lifetime to the rpmsg channel. This removes
>> userspace-controlled alloc/free and ensures that memory is reclaimed only
>> when the DSP process is torn down.
>>
>> Add explicit validation for remote_heap presence and size before sending
>> the memory to DSP, and fail early if the reserved-memory region is
>> missing or incomplete.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
> Changes in vN and lore link to v(N-1) series would help here.>
> drivers/misc/fastrpc.c | 119 +++++++++++++++++++++++------------------

Will add changelog and lore link in next version.

>>   1 file changed, 66 insertions(+), 53 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index d86e79134c68..1ec37e6c68a2 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -276,6 +276,8 @@ struct fastrpc_channel_ctx {
>>   	struct kref refcount;
>>   	/* Flag if dsp attributes are cached */
>>   	bool valid_attributes;
>> +	/* Flag if audio PD init mem was allocated */
>> +	bool audio_init_mem;
>>   	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>>   	struct fastrpc_device *secure_fdevice;
>>   	struct fastrpc_device *fdevice;
>> @@ -1344,15 +1346,24 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	struct fastrpc_init_create_static init;
>>   	struct fastrpc_invoke_args *args;
>>   	struct fastrpc_phy_page pages[1];
>> +	struct fastrpc_channel_ctx *cctx = fl->cctx;
>>   	char *name;
>>   	int err;
>> -	bool scm_done = false;
>>   	struct {
>>   		int client_id;
>>   		u32 namelen;
>>   		u32 pageslen;
>>   	} inbuf;
>>   	u32 sc;
>> +	unsigned long flags;
>> +
>> +	if (!cctx->remote_heap || !cctx->remote_heap->dma_addr ||
>> +	    !cctx->remote_heap->size) {
>> +		err = -ENOMEM;
>> +		dev_err(fl->sctx->dev,
>> +			"remote heap memory region is not added\n");
>> +		return err;
>> +	}
>>   
>>   	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
>>   	if (!args)
>> @@ -1376,31 +1387,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	inbuf.client_id = fl->client_id;
>>   	inbuf.namelen = init.namelen;
>>   	inbuf.pageslen = 0;
>> -	if (!fl->cctx->remote_heap) {
>> -		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>> -						&fl->cctx->remote_heap);
>> -		if (err)
>> -			goto err_name;
>> -
>> -		/* Map if we have any heap VMIDs associated with this ADSP Static Process. */
>> -		if (fl->cctx->vmcount) {
>> -			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
>> -
>> -			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>> -							(u64)fl->cctx->remote_heap->size,
>> -							&src_perms,
>> -							fl->cctx->vmperms, fl->cctx->vmcount);
>> -			if (err) {
>> -				dev_err(fl->sctx->dev,
>> -					"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
>> -					&fl->cctx->remote_heap->dma_addr,
>> -					fl->cctx->remote_heap->size, err);
>> -				goto err_map;
>> -			}
>> -			scm_done = true;
>> -			inbuf.pageslen = 1;
>> -		}
>> -	}
>>   
>>   	fl->pd = USER_PD;
>>   
>> @@ -1412,8 +1398,24 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	args[1].length = inbuf.namelen;
>>   	args[1].fd = -1;
>>   
>> -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
>> -	pages[0].size = fl->cctx->remote_heap->size;
>> +	/*
>> +	 * Audio PD is a static PD and retains the remote heap
>> +	 * information across daemon restarts. Therefore only
>> +	 * the first attach should provide heap information to
>> +	 * DSP. Subsequent attaches reuse the previously
>> +	 * initialized memory pool.
>> +	 */
>> +	spin_lock_irqsave(&cctx->lock, flags);
>> +	if (!cctx->audio_init_mem) {
>> +		pages[0].addr = cctx->remote_heap->dma_addr;
>> +		pages[0].size = cctx->remote_heap->size;
>> +		cctx->audio_init_mem = true;
>> +		inbuf.pageslen = 1;
>> +	} else {
>> +		pages[0].addr = 0;
>> +		pages[0].size = 0;
>> +	}
>> +	spin_unlock_irqrestore(&cctx->lock, flags);
>>   
>>   	args[2].ptr = (u64)(uintptr_t) pages;
>>   	args[2].length = sizeof(*pages);
>> @@ -1431,27 +1433,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   
>>   	return 0;
>>   err_invoke:
>> -	if (fl->cctx->vmcount && scm_done) {
>> -		u64 src_perms = 0;
>> -		struct qcom_scm_vmperm dst_perms;
>> -		u32 i;
>> -
>> -		for (i = 0; i < fl->cctx->vmcount; i++)
>> -			src_perms |= BIT(fl->cctx->vmperms[i].vmid);
>> -
>> -		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>> -		dst_perms.perm = QCOM_SCM_PERM_RWX;
>> -		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>> -						(u64)fl->cctx->remote_heap->size,
>> -						&src_perms, &dst_perms, 1);
>> -		if (err)
>> -			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr %pad size 0x%llx err %d\n",
>> -				&fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
>> -	}
>> -err_map:
>> -	fastrpc_buf_free(fl->cctx->remote_heap);
>> -	fl->cctx->remote_heap = NULL;
>> -err_name:
>> +	cctx->audio_init_mem = false;
>>   	kfree(name);
>>   err:
>>   	kfree(args);
>> @@ -2418,12 +2400,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   		}
>>   	}
>>   
>> -	if (domain_id == SDSP_DOMAIN_ID) {
>> +	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>>   		struct resource res;
>>   		u64 src_perms;
>>   
>>   		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
>>   		if (!err) {
>> +			if (domain_id == ADSP_DOMAIN_ID) {
>> +				data->remote_heap =
>> +					kzalloc_obj(*data->remote_heap, GFP_KERNEL);
> drop GFP_KERNEL from kzalloc_obj()> +				if (!data->remote_heap) {

ACK,I'll drop GFP_KERNEL.

>> +					err = -ENOMEM;
>> +					goto err_free_data;
>> +				}
>> +
>> +				data->remote_heap->dma_addr = res.start;
>> +				data->remote_heap->size = resource_size(&res);
>> +			}
>>   			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>>   
>>   			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
>> @@ -2431,7 +2424,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   			if (err)
>>   				goto err_free_data;
>>   		}
>> -
>>   	}
>>   
>>   	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>> @@ -2490,6 +2482,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   		misc_deregister(&data->secure_fdevice->miscdev);
>>   
>>   err_free_data:
>> +	kfree(data->remote_heap);
>>   	kfree(data);
>>   	return err;
>>   }
>> @@ -2512,6 +2505,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>   	struct fastrpc_buf *buf, *b;
>>   	struct fastrpc_user *user;
>>   	unsigned long flags;
>> +	int err;
>>   
>>   	/* No invocations past this point */
>>   	spin_lock_irqsave(&cctx->lock, flags);
>> @@ -2529,8 +2523,27 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>   	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>>   		list_del(&buf->node);
>>   
>> -	if (cctx->remote_heap)
>> -		fastrpc_buf_free(cctx->remote_heap);
>> +	if (cctx->remote_heap && cctx->vmcount) {
>> +		u64 src_perms = 0;
>> +		struct qcom_scm_vmperm dst_perms;
>> +
>> +		for (u32 i = 0; i < cctx->vmcount; i++)
> for the iterator use top-of-block declaration style for consistency> +		
> src_perms |= BIT(cctx->vmperms[i].vmid);

Will fix.

>> +
>> +		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>> +		dst_perms.perm = QCOM_SCM_PERM_RWX;
>> +
>> +		err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
>> +					  cctx->remote_heap->size, &src_perms,
>> +					  &dst_perms, 1);
>> +		if (err)
>> +			dev_err(&rpdev->dev,
>> +				"Failed to assign memory back to HLOS: dma_addr %pad size %#llx err %d\n",
>> +				&cctx->remote_heap->dma_addr, cctx->remote_heap->size, err);
>> +	}
>> +
>> +	kfree(cctx->remote_heap);
>> +	cctx->remote_heap = NULL;
>>   
>>   	of_platform_depopulate(&rpdev->dev);
>>   

