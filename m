Return-Path: <linux-arm-msm+bounces-117557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 940WMmMXTmr0CwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 11:24:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE3B723ACC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 11:24:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Xtj4ssB1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OsC4dkol;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117557-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117557-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F2DFB3001CDA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 09:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92BAD409138;
	Wed,  8 Jul 2026 09:17:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEEA40913A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 09:17:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502254; cv=none; b=UIifiSzU2fq1BYko3TNXKNnKS2Ks52oydhradNt9umgeSf4FUzSw8JwpgPd/q9+w7ongbbjUa4DKID2wkM4Wccmm7ihtWGvZNrenZQP6RczZAccC9tzHb4E+2QxgeOXkIGDfsRIIjYG3a3GjWrEIwZmjDnjAdNpAdC3tbMW7x2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502254; c=relaxed/simple;
	bh=3RFR/Gguc/98HvS0WeNGRxHWF//aqmOcqKEB6aoQYIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tTkWGSVP0agKMfEx+pGIO35eDd+qRA62+8m/KdKQ3ynLYPvNr316Eue1FTkfKx7oZ4YClAJgfvmMs0IZgYqhPRuZCMLo1VriC9PMgWr68Rl+lMfd33r9nlLCZvf/8H0cWc5/m1Y0vJyIUV8D7z/Uu7H2EgWPkIKGuhnCMnbOWts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xtj4ssB1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OsC4dkol; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66888rh32204639
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 09:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79kuVe6jehvLCKmHClhipj8oSIDs3F6t6TTlRvIhYNM=; b=Xtj4ssB1PjEjBSEu
	vK6O6DSO73pkEclDNXg02v1q/9crzf5058NGOsirO1ZqQEP83xTUnUmKQatLbhCL
	Qii/W4puh6QVn1DNpu1YCuGgtK78WsrYogVFWIurKT398n4Ui6tFIeDwW0MbDxjx
	3ya6al49KIBpk0jgWDV3pvzFPGdCeMqfSUEbdQAqIQ6ME87fzP0hQOXWTPP/ybDD
	64GwqLiewbQNpNzeWl4VOGEsgN0srOcC+aZEUwZnY6aR5BW/ADOFmqLCAWvO1lES
	GNl7DwLdbuhQc6vXgQu8AF4J1nPg9IGPTlUe6o0J/U5ZgBKkpup33cGAS5RCddHV
	vRON/A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv0k9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 09:17:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89956023dbso688045a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 02:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783502251; x=1784107051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79kuVe6jehvLCKmHClhipj8oSIDs3F6t6TTlRvIhYNM=;
        b=OsC4dkolOUuexQDo0QvawrEMQDCAzvBn0nfNap2NWHTmRTN78i7baY4QcXxUXjhXCV
         utxgF4ixIYEh3IxY0XRsItXFj50s0sjKnHyL6wiHPLJ4xX/8A3E2o5w5qq8kMAgiS7Lf
         FWzm7aX2tIzThJZOGYLWOFSem0KdjF5G7Ml0t7hYLBUwCmrFHNNwGorTF42OmPpVbrmC
         hBFIfa2COIVZM8rv2Uqf9n8BLeXGFy6wBIx/Z1ihQe1OAF7zxp+q+rjDfnWwT3n6mS7J
         wcf9Qm2hB0CSvCGPDOBVa/+JuPPPhKOQ2FoMEhjoLteWYvSP8Rf6darKWMUNTVt9off1
         IXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783502251; x=1784107051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79kuVe6jehvLCKmHClhipj8oSIDs3F6t6TTlRvIhYNM=;
        b=DFff78cSJXmDtN0w7nNsm09Ie/4McDTXq9CefwGjOHmEgGGriN8GPw+4rJqqLOLbCO
         Nn9sw2IVmeWh2za3PS+RWwQ/J73KMp8jsQwivVk+iZHPLPGQs4Apl01lROls2tfpbH6a
         k2i3pnGPKbW4yHVfdLdyeN8gmgc+QRCbf/yc8TwECkKCywG2/W9xKRRxjjIh/mIFk4kb
         8VPEOdIfK6snW0nCQ7wIDSMcZn6B6GycUFYGl3yAlut3LNsBV8Et5xGc/YgNz70bv1ra
         PNmYWBkyMbkMmydj5rwl7z0Ln/O21j3ydPwPgqtYkZVeY+ph4GzVrAdq9b2Zt63SpowO
         AxVQ==
X-Gm-Message-State: AOJu0YynqZh0o2E6gBxciEaCsWL2C8uBtmpby9hgTdnRk/xAKetEO++7
	mhedbNLc3RdmpEcWY/hO2Vc3q0uZC+5UJY/XZU35FVNkuppbTVetiWe6/sm7mkTIEMHdDBAKnST
	wDhk5rT7DAogi17yFE9rd4Mt3pGw6VuQQUewhwTKX7vQuKn4D6sYCXkdhvy3T5yEMZbF3
X-Gm-Gg: AfdE7clexx/9V7DeDpF8PZIlJhf7EvGt1SFaSIs5yZItkNSCEuaKuKC3jzsYCcoeFCK
	lObrIq8Kgf3lrdEDFDPm1834uTl17XSn/G8rPlFM2IGL/MrfD1v4E2d4LRk9yz7ZGNz4nDfuvu4
	K8Je3sdBcKKcR3ZqV7revvLBha3L9aagiVBPrPwb8L1hwtam47V54YWg/GztM17qfk1zx3I5CkW
	1rlcGSmyPn35NigAJfBw1uPBRCFDG4o0gc7xKLkWZefus5+z/aeX83SO+BZuHn5bKltmF4gWD3B
	ql9JE4BwetQ/f3gZ93GzLwwMDk8mO4eAxSIoxAWvtbv+MAa7VVhkbqxenr/Cb9FBgZjxaWQqC+L
	nH30THAyXQnI65F2KOFtdSbOXo37pX+7zGWA1xu99+w==
X-Received: by 2002:a05:6a21:e8a:b0:3bf:bfd0:2a11 with SMTP id adf61e73a8af0-3c0bcbc03c5mr2112888637.43.1783502251227;
        Wed, 08 Jul 2026 02:17:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:e8a:b0:3bf:bfd0:2a11 with SMTP id adf61e73a8af0-3c0bcbc03c5mr2112824637.43.1783502250372;
        Wed, 08 Jul 2026 02:17:30 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162a49sm2070246a12.15.2026.07.08.02.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 02:17:30 -0700 (PDT)
Message-ID: <9eb94d85-5074-4d2f-91a7-b3d39bd2bc4d@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 14:47:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] i2c: qcom-geni: use cancel command before abort on
 transfer timeout
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
References: <20260708-fix_cancel_sequence_on_failure_for_i2c-v1-0-dd8f841f36a2@oss.qualcomm.com>
 <20260708-fix_cancel_sequence_on_failure_for_i2c-v1-1-dd8f841f36a2@oss.qualcomm.com>
 <74520b45-b3d1-475a-8929-b965ce760d5a@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <74520b45-b3d1-475a-8929-b965ce760d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e15ab cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qSuGSYE2gW_qi9-8UbQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA4OCBTYWx0ZWRfX0jqb6icmYwkV
 YLtezn1NLRI+6ZLUOxXgY0NkKj3x293KMGgGDM6D5d4KPvCChZdXk3RJG5Fwf5g1s40ETqjYBQ1
 CNRnqZ5miTaSXMx12I8+ez2RUiZ496Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA4OCBTYWx0ZWRfX+STJe0alNovB
 IKZXQihr3RfsVcA9FlVd9ketjxvMlK3LAv1V17mopoBywVYrI+xGANs98zVX6SgA/13NBStyPBe
 RhTMfg+bAUcstHEUeGCPtPQR9RuVUYEJ1TOPE3oU6BjG1RHhibKl3LawWgcf3DohhdRLpWzJd5W
 vnDnkryp3xsCsFy3F+VlUlIsI49FMhtugRk91zQhRQCmf5lqh2dUk1R9ZkyRk/9NYa24DolVVkm
 HQjukcQJ7HSJYWrbcNoFyTmEgY97CTgkZcmCYX3vClBy3yw6wyo9gW2FgQaBBRv0cijl9c6DqdF
 Q0i1gVdWvsCkRyvQMtoW6Pt19oAyjdF+ck+R1NwhCggiuHB5ykn9ReojMv9IP7ldk0DwhRrmA4T
 7G4OG7A/q8aQuRTGmKEhggzsDPetq6VIHwvETmi0V3HPdGYWXlAjDc3E1N8/AjJ/JJgohVJKni+
 oubrdlFPhLob3I5opww==
X-Proofpoint-ORIG-GUID: DGncwjDD7We_nLI35sUHMwdNVX_aSoIv
X-Proofpoint-GUID: DGncwjDD7We_nLI35sUHMwdNVX_aSoIv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117557-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFE3B723ACC

Hi Mukesh,

Thank you for review.

On 08-07-2026 13:05, Mukesh Savaliya wrote:
>
>
> On 7/8/2026 11:45 AM, Praveen Talari wrote:
>> The GENI I2C driver currently invokes geni_se_abort_m_cmd() directly 
>> when
>> a transfer times out. However, the GENI hardware command cancellation
>> flow requires a cancel command to be issued first. An abort should only
>> be used as a fallback when the cancel operation itself fails to 
>> complete.
>>
>> Introduce a dedicated cancel_done completion that is signalled on
> Typo :signalled
>
> "signaled when M_CMD_CANCEL_EN is received" With this , rest looks good.

Sure. Will update in next patch.

Thanks,

Praveen Talari

>> M_CMD_CANCEL_EN. The timeout recovery path waits for cancel completion
>> and escalates to geni_i2c_abort_xfer() only if the cancel command does
>> not complete within the expected time.
>>
>> Co-developed-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
>> Signed-off-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>
>>   drivers/i2c/busses/i2c-qcom-geni.c | 30 ++++++++++++++++++++++++++++--
>>   1 file changed, 28 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 96dbf04138be..15403edb355a 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -74,6 +74,7 @@ enum geni_i2c_err_code {
>>   #define PACKING_BYTES_PW    4
>>     #define ABORT_TIMEOUT        HZ
>> +#define CANCEL_TIMEOUT        HZ
>>   #define XFER_TIMEOUT        HZ
>>   #define RST_TIMEOUT        HZ
>>   @@ -112,6 +113,7 @@ struct geni_i2c_dev {
>>       int err;
>>       struct i2c_adapter adap;
>>       struct completion done;
>> +    struct completion cancel_done;
>>       struct i2c_msg *cur;
>>       int cur_wr;
>>       int cur_rd;
>> @@ -361,6 +363,8 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
>>           dm_tx_st & TX_DMA_DONE || dm_tx_st & TX_RESET_DONE ||
>>           dm_rx_st & RX_DMA_DONE || dm_rx_st & RX_RESET_DONE)
>>           complete(&gi2c->done);
>> +    if (m_stat & M_CMD_CANCEL_EN)
>> +        complete(&gi2c->cancel_done);
>>         spin_unlock(&gi2c->lock);
>>   @@ -387,6 +391,27 @@ static void geni_i2c_abort_xfer(struct 
>> geni_i2c_dev *gi2c)
>>           dev_err(gi2c->se.dev, "Timeout abort_m_cmd\n");
>>   }
>>   +static void geni_i2c_cancel_xfer(struct geni_i2c_dev *gi2c)
>> +{
>> +    unsigned long time_left = msecs_to_jiffies(CANCEL_TIMEOUT);
>> +    unsigned long flags;
>> +
>> +    reinit_completion(&gi2c->cancel_done);
>> +
>> +    spin_lock_irqsave(&gi2c->lock, flags);
>> +    if (!gi2c->err)
>> +        geni_i2c_err(gi2c, GENI_TIMEOUT);
>> +    gi2c->cur = NULL;
>> +    geni_se_cancel_m_cmd(&gi2c->se);
>> +    spin_unlock_irqrestore(&gi2c->lock, flags);
>> +
>> +    time_left = wait_for_completion_timeout(&gi2c->cancel_done, 
>> time_left);
>> +    if (!time_left) {
>> +        dev_err(gi2c->se.dev, "Timeout cancel_m_cmd\n");
>> +        geni_i2c_abort_xfer(gi2c);
>> +    }
>> +}
>> +
>>   static void geni_i2c_rx_fsm_rst(struct geni_i2c_dev *gi2c)
>>   {
>>       u32 val;
>> @@ -473,7 +498,7 @@ static int geni_i2c_rx_one_msg(struct 
>> geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>       cur = gi2c->cur;
>>       time_left = wait_for_completion_timeout(&gi2c->done, 
>> XFER_TIMEOUT);
>>       if (!time_left)
>> -        geni_i2c_abort_xfer(gi2c);
>> +        geni_i2c_cancel_xfer(gi2c);
>>         geni_i2c_rx_msg_cleanup(gi2c, cur);
>>   @@ -515,7 +540,7 @@ static int geni_i2c_tx_one_msg(struct 
>> geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>       cur = gi2c->cur;
>>       time_left = wait_for_completion_timeout(&gi2c->done, 
>> XFER_TIMEOUT);
>>       if (!time_left)
>> -        geni_i2c_abort_xfer(gi2c);
>> +        geni_i2c_cancel_xfer(gi2c);
>>         geni_i2c_tx_msg_cleanup(gi2c, cur);
>>   @@ -1107,6 +1132,7 @@ static int geni_i2c_probe(struct 
>> platform_device *pdev)
>>         gi2c->adap.algo = &geni_i2c_algo;
>>       init_completion(&gi2c->done);
>> +    init_completion(&gi2c->cancel_done);
>>       spin_lock_init(&gi2c->lock);
>>       platform_set_drvdata(pdev, gi2c);
>>
>

