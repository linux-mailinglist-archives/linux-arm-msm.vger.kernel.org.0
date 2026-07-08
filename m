Return-Path: <linux-arm-msm+bounces-117536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FNtyNxP+TWpaBQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:36:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F21F722B2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:36:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=d1BJxneH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G3QBshCs;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117536-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117536-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8DA3301F6E2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 07:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0383F8246;
	Wed,  8 Jul 2026 07:35:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020C53EF673
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 07:35:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496144; cv=none; b=rtJve9BlOmCcyRb2g8NxF3Rf7/1fwLFGI2OHnXxcoGuatkNGkEuXJryQ8ObhdCBiOzSVutvqb9KsZ1CQ83E3to/wR4DtMhSPsMmIwJu516ntLXHW4lsdqixVqFfATsBieNi28VW19yLsjzX3RvuxIqg8ADehmGB1s+avop0vctg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496144; c=relaxed/simple;
	bh=b5ZTxjwdijmuADzULPIvDGzxFk7ODUmj1Xb0RRNjP+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hH7GV4NSLpuAu47YnWDF+aquOoyyzLRc4EmR5jlI6L7D61PA725wucsNz8ykRH3BLETi/9OBHUrwzAXdaUsB8w0pH6bD5I/DxV7hyyAS4KQRl5SxhXKaMbQjfiKOa0crSHnd7IOUOED5JFAXPnJK3zqtbBhhNytE2i1qZVjhPts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1BJxneH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3QBshCs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842ard1667872
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 07:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3nrZBDGQDmY+CQjESpuWaDP7VmOJKMsPPsfgvpK8nTM=; b=d1BJxneH8nuJ5u20
	HuzLWDQqdekws2WZG82OdLcnm4tKzco5B+Zz3fkfgeU8AETXA4zft8PLCS+OLvZo
	Z8uDEFVgc2m3Mwlz27ofzeY3u+xO8lbKTVaZORjje5sXT+NnYXeO8WeRoV+6PKcZ
	8rueLzNyWWQYsarMKBOUwSmP4Jhh2RHAW4VEs1pv0XmgkszWahJM1kStWONu9SrN
	Bfneww2ra2HpWDh8+0DqHkstAxRq+L0K1ByYBnJulVRYI0UcEBTBrJPZTqNh2XkC
	z201L4GHoovT94Uc0SOtJ8804WfnaihpDJk/tdIu2TBd/Txdf9e4rR0oSXHV/E31
	eQUB8w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5u9nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:35:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8482fd61e83so681498b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 00:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783496128; x=1784100928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3nrZBDGQDmY+CQjESpuWaDP7VmOJKMsPPsfgvpK8nTM=;
        b=G3QBshCs0/wFXpEQut9D6Iw6HGqiprLA9YqpyiGwLsBvOlPny4+2H3YPyKpjhgmMGp
         kDS8ygLsnYxfegUHyz1g13Wz/QPNb005A0oPr5v4Z6bLIUddJw7Y6To90/lgucejw5/X
         VQxoujztrhkUtLfFREc4KGXx0wK9m9qvUtDDKeUupkIxwacQvujTWnoIRk7BwX7orHfF
         uf9YjSUgQABZuXoLWZ04HafNSmjiuhtbvdyvZZJlcAjM3b7XKAK7MpSULK4AUhc0R1sr
         zzGtZz8aDUMmT5agrdQJ4qRO41CGBWYwqBOfuyLqO+XPVBVCSCr1DoBaOiODCAxmegtN
         2Qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783496128; x=1784100928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nrZBDGQDmY+CQjESpuWaDP7VmOJKMsPPsfgvpK8nTM=;
        b=GD+jBPbnwH9OEBndULtMc2R2rmG92xs9nrB7Z9fXVkHDKAWaz8Wpj2jGUAQ5FQ+BMm
         V9TR0OhdwI1cS+H5BxWRgE/ndUwrrxnJt2b8kFcdRJaEkkOBmyPW6ow4Sg8jb4N9ooQQ
         k4GLRwv7IiIVg7tro8Cz2CH6J7LaCFy+IXNMFGRCEweV+Cw5l22YFHB5S0PxYJvDmpua
         94qmrgzArcqPakB+aUXvb0u4QO1vfSIbt81UUzl5tnwS3nDu+MCfuok45E+h0PBtMb/W
         q+JEkiIe3LyTO7B6I54CorZA3t5AEsOYJE2yZgY7wbx8l9zhhFztVKeann3+kfXDNF2j
         K50A==
X-Gm-Message-State: AOJu0YxjV0kkV8i35qf5WBpjDYupcyQPZoIWSQAnkRZ2Ezjd1s2AjbUU
	7sJUtBiEV74gK6TyvSkyqL5eUuo52tTV60KntpQtFWNhFXnLCSa5HSY7I96ZZl+Yr55Tl3p2JSR
	4qmiM8tVSrm92npzUoDe8Oket+G+SWnS0KXIO2MznmswbwVAnc8HXf+f1PlW5DIrIROgx
X-Gm-Gg: AfdE7cnlBoxTtAVoQWzv1GdSeQm9LVdrK+gS9kLXZQmcgKXoiziVo+KOP069COG8+Rt
	F8/+0KkxNVPWbkFhiNn9PgY0dKdidLISm6912lL3djhiB3T0Wns2XhdEzY7ccKKgU56c+dfs0cL
	J70ybZz8WER0hPPAkUjxUnHBXw3nGGyy+WsQqpjoOPB0R4Z/gCdwNi7TaMvub9ca8OPorx7sn1e
	ETdNoNmcTGk5B72URjoUTlfEmzfaY4CjVsrY32hIUAfzifJlD+OFEmUHDT+fLxvYIrdYzpe16sJ
	iC8k+M/OeFr1sXmLb7wI3Th0/H8MvKbXEbU7soTh/0i2RkCyHjmUcx5HnQ2iW2qI4tbejt1jk7S
	gdjhQEh3ehhMQ3K2fM/qIDnRJnmGOWkgW8xJ9XyYSQRWf
X-Received: by 2002:a05:6a00:244a:b0:847:9ce5:d293 with SMTP id d2e1a72fcca58-8484301f0a4mr1601363b3a.24.1783496128145;
        Wed, 08 Jul 2026 00:35:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:244a:b0:847:9ce5:d293 with SMTP id d2e1a72fcca58-8484301f0a4mr1601339b3a.24.1783496127648;
        Wed, 08 Jul 2026 00:35:27 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d44d48sm6644002b3a.39.2026.07.08.00.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 00:35:27 -0700 (PDT)
Message-ID: <74520b45-b3d1-475a-8929-b965ce760d5a@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 13:05:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] i2c: qcom-geni: use cancel command before abort on
 transfer timeout
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
References: <20260708-fix_cancel_sequence_on_failure_for_i2c-v1-0-dd8f841f36a2@oss.qualcomm.com>
 <20260708-fix_cancel_sequence_on_failure_for_i2c-v1-1-dd8f841f36a2@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260708-fix_cancel_sequence_on_failure_for_i2c-v1-1-dd8f841f36a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LMOIM97owSY7VXTnSVqJJLQAUlHIhVAz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA3MSBTYWx0ZWRfX4phteGhBpTQw
 BAED6EhOoLxHe3G0wM/4x75aKvjRlfMTVdbCRVZJen6fCasxSJwEDydP0leq3H6jenK+2VtVGcC
 4Wjs7ab9t1UoQ/n5ggi+lZgvXMhh3Eg=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4dfdc1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6kLu1IwUGHXDgf738pMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: LMOIM97owSY7VXTnSVqJJLQAUlHIhVAz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA3MSBTYWx0ZWRfX+LX2sgYMHDZd
 /s7PVCQGbc+emsWg+tg2w6e/P5iYVfO6uHqKV08tlLiuloHKtXtL52kfHt/l03kpyShyO/KfmQv
 xVEHGSEkybqXuH5dmKemBEv2Lcpuh6u2aICD+85FJpOp0wRuzpgaMIYi0DKMQd7qtq+xelPcQ80
 Ah2du3mdKgzfrSjcjYa7fHN7ryKT0+Q05yCy3gyenBPsj8xstcWQu7H7QTJ96e0sdUiTskcciss
 2AdiCuldmqsmfiWdSRL2uRqo/g8ry56Zqhcp9kWnyiJtXeLHqqbCevImK1zAUDpDAhFlH7KEK4K
 ZjOtDCInFSqhopd9AgQdCbfafZXGTErQQo+eJS7M5W1Y11hWvHJo4fooQVguS9MPUpfado8YHIj
 aL7jYA0ibx7H/5XKtIoo/uYxIWYFepPt0Kq22xpOpZg2/AsFcEnUP6gX0gIRzGpKj6/TKm4s0tH
 S+5kdW/rbEHONgag8HQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117536-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F21F722B2B



On 7/8/2026 11:45 AM, Praveen Talari wrote:
> The GENI I2C driver currently invokes geni_se_abort_m_cmd() directly when
> a transfer times out. However, the GENI hardware command cancellation
> flow requires a cancel command to be issued first. An abort should only
> be used as a fallback when the cancel operation itself fails to complete.
> 
> Introduce a dedicated cancel_done completion that is signalled on
Typo :signalled

"signaled when M_CMD_CANCEL_EN is received" With this , rest looks good.
> M_CMD_CANCEL_EN. The timeout recovery path waits for cancel completion
> and escalates to geni_i2c_abort_xfer() only if the cancel command does
> not complete within the expected time.
> 
> Co-developed-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
> Signed-off-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

>   drivers/i2c/busses/i2c-qcom-geni.c | 30 ++++++++++++++++++++++++++++--
>   1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 96dbf04138be..15403edb355a 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -74,6 +74,7 @@ enum geni_i2c_err_code {
>   #define PACKING_BYTES_PW	4
>   
>   #define ABORT_TIMEOUT		HZ
> +#define CANCEL_TIMEOUT		HZ
>   #define XFER_TIMEOUT		HZ
>   #define RST_TIMEOUT		HZ
>   
> @@ -112,6 +113,7 @@ struct geni_i2c_dev {
>   	int err;
>   	struct i2c_adapter adap;
>   	struct completion done;
> +	struct completion cancel_done;
>   	struct i2c_msg *cur;
>   	int cur_wr;
>   	int cur_rd;
> @@ -361,6 +363,8 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
>   	    dm_tx_st & TX_DMA_DONE || dm_tx_st & TX_RESET_DONE ||
>   	    dm_rx_st & RX_DMA_DONE || dm_rx_st & RX_RESET_DONE)
>   		complete(&gi2c->done);
> +	if (m_stat & M_CMD_CANCEL_EN)
> +		complete(&gi2c->cancel_done);
>   
>   	spin_unlock(&gi2c->lock);
>   
> @@ -387,6 +391,27 @@ static void geni_i2c_abort_xfer(struct geni_i2c_dev *gi2c)
>   		dev_err(gi2c->se.dev, "Timeout abort_m_cmd\n");
>   }
>   
> +static void geni_i2c_cancel_xfer(struct geni_i2c_dev *gi2c)
> +{
> +	unsigned long time_left = msecs_to_jiffies(CANCEL_TIMEOUT);
> +	unsigned long flags;
> +
> +	reinit_completion(&gi2c->cancel_done);
> +
> +	spin_lock_irqsave(&gi2c->lock, flags);
> +	if (!gi2c->err)
> +		geni_i2c_err(gi2c, GENI_TIMEOUT);
> +	gi2c->cur = NULL;
> +	geni_se_cancel_m_cmd(&gi2c->se);
> +	spin_unlock_irqrestore(&gi2c->lock, flags);
> +
> +	time_left = wait_for_completion_timeout(&gi2c->cancel_done, time_left);
> +	if (!time_left) {
> +		dev_err(gi2c->se.dev, "Timeout cancel_m_cmd\n");
> +		geni_i2c_abort_xfer(gi2c);
> +	}
> +}
> +
>   static void geni_i2c_rx_fsm_rst(struct geni_i2c_dev *gi2c)
>   {
>   	u32 val;
> @@ -473,7 +498,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>   	cur = gi2c->cur;
>   	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>   	if (!time_left)
> -		geni_i2c_abort_xfer(gi2c);
> +		geni_i2c_cancel_xfer(gi2c);
>   
>   	geni_i2c_rx_msg_cleanup(gi2c, cur);
>   
> @@ -515,7 +540,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>   	cur = gi2c->cur;
>   	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>   	if (!time_left)
> -		geni_i2c_abort_xfer(gi2c);
> +		geni_i2c_cancel_xfer(gi2c);
>   
>   	geni_i2c_tx_msg_cleanup(gi2c, cur);
>   
> @@ -1107,6 +1132,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   
>   	gi2c->adap.algo = &geni_i2c_algo;
>   	init_completion(&gi2c->done);
> +	init_completion(&gi2c->cancel_done);
>   	spin_lock_init(&gi2c->lock);
>   	platform_set_drvdata(pdev, gi2c);
>   
> 


