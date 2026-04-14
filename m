Return-Path: <linux-arm-msm+bounces-103021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD5uM+S33WnGiAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 05:43:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D413F5504
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 05:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E569300E3AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 03:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E9030B529;
	Tue, 14 Apr 2026 03:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="as6qMz2S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RC9AyHkZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA80C883F
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776138107; cv=none; b=IjxnCMoO/FIzH5B6VaX9gPkpKJvwsZAtSaHiVNzayrFnoKSk6qqqHk4fTGCzpLxHFxyauQUxhdi8bQ56XIgI0yaVsIdrpnJPw7cTpytZOOq1H38VN5cPUqSGbqDp6lquPxYFgW/3hMQ0XOxT+yr2GLp0a2TIRcXIEnA5NGLOmGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776138107; c=relaxed/simple;
	bh=Vrwsn0Qynugf+3jZEDc29x0q/HrfW395D70BhgcJIv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JiQCo3R+oUcktKh6o5puclkCZzevaoRt8aEg0iUZAuGEG2TkmUwQc1VGiWgxyqRkPr10uIV2usU5EzWT3S4MnqPwn+mEGgxaKyQWGGsdfKhPv27jXE/huuogHsmMXg1uT7Hx1+C9P+all9hWn3cSvoAkDmuQwMGQQIdhKMApLYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=as6qMz2S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RC9AyHkZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCj3P2387051
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/N1Ui71tI64FxlggBSULn1X9I+bgN0VJv4GfXg0nGc=; b=as6qMz2SrxsX2XXU
	KCvPXySPoiWbHpWcC+4ycXnOIw1tbgDHRM80pzF6e/Z7mvkhzAA7011/1Lkyrf86
	g4qfBwPrmpdN+p2v6DRitSQDGz4kh3afzreacNjk4egosIoJcMvcloOCm00H+4tv
	kO5XUxf1mAIKgxvYaGE35OpvuXMYET1FJ8cKgUBn19kQrczIiYGA0+a26Eg65Oul
	Rsy5UHsoTFZZ17zZfiTHre7Lvhh8y/a7QOqGcyjzBSvuncmeROH/k4FJ4EHcRQIZ
	EmoL6z53rQxS88Xf6gJ8JnZAZCwMQOq3PxP3jGVHZ0Z/SOrXU+CHhYaQVN1s6E+2
	USVpEA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w0v6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:41:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d9278587bso4972302a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 20:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776138104; x=1776742904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i/N1Ui71tI64FxlggBSULn1X9I+bgN0VJv4GfXg0nGc=;
        b=RC9AyHkZc4Ur3cJxgJpYWHRifBSh8hl8W2OdTfZUy5hwAzPIw87AOUZmlRADbu543g
         IWxpBu9R/zppKaCv9QRMp9qEqhv/oCOcpNoASrJOpXPBbq3Ab++ib3hWADb7i50KpiRq
         WIk8THgEXv6MXGTyr437qOAnkVdE4wB2PTgEhxkwLrpnrokEf6oAF+gUVNLJs7CwXbif
         bZ3r5zT0uT6XgdS2w0w+sR7JIzCvb/SgThp9/lzfQvulRfX/6Y6TBoiQxPh9/+6vWwbU
         1y0w7QFsXkf0meI7HEc6ZKyAc6Dh0WnSvsEDSFPT5B4SzNi9mqkEqIOMDnttGvYYLZz+
         9RGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776138104; x=1776742904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/N1Ui71tI64FxlggBSULn1X9I+bgN0VJv4GfXg0nGc=;
        b=IPBdRfbfT/hoaFrVIsAeme4KOHP9HMiks8KBpT5k0HfGhJ/l+wLTnjXAQT8Y8hsx2P
         qJTPPI1xwlKU0FavbQMonJl1E8De3sbsXBfD6ZLZMG5m9tLNZzWMnfoSRp36hVlUtQ+0
         UUSrbJSjG3HBcQOMMvGd4rgRZW+6Ajt9bV9rNg1bERAjfnPDlcMjMVWN5Lbfx42j5Wb8
         26XyxsdoxH9FFwOVrtLim3d1LcYBGCr1ONuMFjdleQn0JsIjQ9wO+y+N9nScpxmHDK/5
         x8hWjXP+hYcPGOfAsQqW5iWOxDXGvyqp9nqLIhm4GGoNmNxzCssuL7gLFBDT+f/azrUc
         /uMg==
X-Forwarded-Encrypted: i=1; AFNElJ8+GsiaDSt3dmYdKic9iOfDw8jq1+nmfOCKRq/ptNCqn6MPODhj99a/mGX4mfoHxgmawGDrSv4mB1rA3XoD@vger.kernel.org
X-Gm-Message-State: AOJu0YyEAR8osjlNyG/opGK9IxYHHTnmTVNDnRFysKJ6lgOqjR3A4Glk
	DiIIeiDuda5hbrBe4NC4snvm0IcqH/H9PzeRlKBEIp+D0SlRBXlQEBga/einMEbTw1gCuBZWtjW
	ImQNuR+GxYHkZO0S1lPO36MXx/JRa+yo3DWfqq/KcVA+2gEz3p80pCKSa/HYxv5xjzpun
X-Gm-Gg: AeBDievievtotf8E+LFD7Z6uKzW2lWdGjXUmTLkMgEwueoKDfB+DoTRKWGqarOau+wW
	pTuQmHHJms4F7zfDI7h+IjH4DkDoOd0Xlc+qyuFJy3gi3Nj4NmJQZC9Ze/AhULt8u+1doJCl5qE
	oy/85206VMr4StcalPKjDJML+kekphgkzx5L0MnTrfTjWG2IzSa0EptrzR1WjBxBhdbvh6XcEtG
	yzLIvmDsXm/LRy7+xJYCjplIQ1vEfJCwsDgthdTLDQzIdCql3TBParjXAUmCLdXA0+JvqGRYQ0b
	INM/HOO7C1I7fSKEz9MJB7j56oYbTwJi5IH9g5xQNRlN4RhZ1YYgZijgom3m0I3MczPT8PlEVo+
	pirl4FIAmRm3IN5qSC5KDC4BqIpNA/NaYmCa4syib8pXsTkbMYW0/YZx8gzEByLj13JcSEcQ7K6
	AdNUyIucQOix5S+/g=
X-Received: by 2002:a17:90b:3f0b:b0:35f:c22d:bddc with SMTP id 98e67ed59e1d1-35fc22dbfd7mr2462596a91.0.1776138104286;
        Mon, 13 Apr 2026 20:41:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3f0b:b0:35f:c22d:bddc with SMTP id 98e67ed59e1d1-35fc22dbfd7mr2462577a91.0.1776138103784;
        Mon, 13 Apr 2026 20:41:43 -0700 (PDT)
Received: from [10.133.33.94] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f25d32sm135577435ad.57.2026.04.13.20.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 20:41:43 -0700 (PDT)
Message-ID: <846cf4bb-43da-4d2a-a128-bdaf1371e19b@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:41:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] remoteproc: core: Attach rproc asynchronously in
 rproc_add() path
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
 <20260409-rproc-attach-issue-v1-1-088a1c348e7a@oss.qualcomm.com>
 <adkI8Si4ejf6T73T@linaro.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <adkI8Si4ejf6T73T@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3JYU9Rpj8CvIPQa9IJHI7-lFyLpbODS3
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69ddb779 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sqA1CSfs5v188lrnezMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAzMiBTYWx0ZWRfX2wNuDzhXF0f0
 Pye7L0bgFIO5ezwn65XEu1AMnNfpjQBQyfxn8TsAGdgN5UybOuGwdfKHCmX0vBz2RdkcXNzRtaO
 sdM5yfhP+DsqqSfn9+pABzDnbTrAEFGa3kKVS6P0qAiVmc3v1Rx8EEz/gQtDoIDxlzQ2IOB+D3W
 Fy9bWjauVKNlKYDn0EdwJBy6JnkZuamEJMWmda40z9MoCGrCtEeXfn6XFzOYm/KZL6bz/bzIcNr
 kFlXGEzxSyZUpt3BHf2LpY7inAqpnV939GyNOykaL3KbWT/PkM9uL5SXUx++1gG58dAl0tiY7PP
 WXs+Kg8n/7TuzlOcf+g03m65ORtY2onmSd36XlxXdaBf5lFDTcHL2rBqrxtAxGtYkNImTXNFMQd
 v6Y5BxkACweXd1YkZEZxeXFaJFZeFawX2WA/5q40COrZmJGjmB0XOPGjzwui62yFGVBNyWxI6pu
 yMfTNPv4l/rRb4ae5ug==
X-Proofpoint-GUID: 3JYU9Rpj8CvIPQa9IJHI7-lFyLpbODS3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140032
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103021-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 32D413F5504
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/10/2026 10:28 PM, Stephan Gerhold wrote:
> +Cc Bartosz, Dmitry
> 
> On Thu, Apr 09, 2026 at 01:46:21AM -0700, Jingyi Wang wrote:
>> For rproc with state RPROC_DETACHED and auto_boot enabled, the attach
>> callback will be called in the rproc_add()->rproc_trigger_auto_boot()->
>> rproc_boot() path, the failure in this path will cause the rproc_add()
>> fail and the resource release, which will cause issue like rproc recovery
>> or falling back to firmware load fail. Add attach_work for rproc and call
>> it asynchronously in rproc_add() path like what rproc_start() do.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   drivers/remoteproc/remoteproc_core.c | 20 ++++++++++++--------
>>   include/linux/remoteproc.h           |  1 +
>>   2 files changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index b087ed21858a..f02db1113fae 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1673,18 +1673,21 @@ static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
>>   	release_firmware(fw);
>>   }
>>   
>> +static void rproc_attach_work(struct work_struct *work)
>> +{
>> +	struct rproc *rproc = container_of(work, struct rproc, attach_work);
>> +
>> +	rproc_boot(rproc);
>> +}
>> +
>>   static int rproc_trigger_auto_boot(struct rproc *rproc)
>>   {
>>   	int ret;
>>   
>> -	/*
>> -	 * Since the remote processor is in a detached state, it has already
>> -	 * been booted by another entity.  As such there is no point in waiting
>> -	 * for a firmware image to be loaded, we can simply initiate the process
>> -	 * of attaching to it immediately.
>> -	 */
>> -	if (rproc->state == RPROC_DETACHED)
>> -		return rproc_boot(rproc);
>> +	if (rproc->state == RPROC_DETACHED) {
>> +		schedule_work(&rproc->attach_work);
>> +		return 0;
>> +	}
> 
> I think the change itself is reasonable to make "auto-attach" behavior
> consistent with "auto-boot". The commit message is a bit misleading
> though:
> 
>   - You're really doing two separate functional changes here:
> 
>     (1) Ignore the return value of rproc_boot() during auto-boot attach,
>         to keep the remoteproc registered and available in sysfs even if
>         attaching fails.
>     (2) Run the rproc_boot() in the background using schedule_work().
>         [To improve boot performance? To work around some locking issues?]
> 
>   - The actual issue you are seeing sounds like a use-after-free in the
>     remoteproc core error cleanup path. I think this one is still
>     present, we should really have a call to
>     cancel_work_sync(&rproc->crash_handler) as Dmitry wrote in the
>     previous discussion [1].
> 
> Thanks,
> Stephan
> 
> [1]: https://lore.kernel.org/all/ce24a2sgg4b6wymoxwgl2ve6np2nxn2wuxfqxfpmvqqrpvgouf@xihd6ziqwu4m/

Hi Stephan,

Exactly as you say, what this change do is allowing rproc_attach return false.
It should be okay to keep this change and describe it more clear in commit msg
in next version?

And the use-after-free issue is what we want to resolve in the patch2
in this series, I think cancel_work_sync() is a reasonable change
but it cannot resolve this issue as the worker could be executing when
we call this(and this is what it behaves when I did local test) and
the use-after-free issue still exists. Shall we send a separate patch
for this cancel_work_sync?

Thanks,
Jingyi





