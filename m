Return-Path: <linux-arm-msm+bounces-106762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOTsHKKL/mlasgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 03:19:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1954FD3D1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 03:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5604F3017260
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2026 01:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448DF247291;
	Sat,  9 May 2026 01:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L/NuR0Uf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RMCxCkkT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AFD1A9FBC
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 May 2026 01:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778289560; cv=none; b=XKGE3POdwNTR/ZaAtnTcFjdy5TG+DuW6QjNyYhgI21+TlnkBJ+fWPCavrT4mUupmLzzf3ovK2o7zINOUn6Cc6fAiElwY4gbAtO+64xBI2ZGu2PgDt0H8bk5hLeUVarzavY5wGNCJuumYo9HksUFDXP6tMX30K1clb9d3YaX+APg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778289560; c=relaxed/simple;
	bh=akDT+lYONcbq4fIHNXiYeOOokqqF1TABlkQo5wHmVvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FdbE6w8a632Xtdq0Mtuz+Tm9+IMGr4/BLPK499qT2tUuffspLNDoQ3CwoDXLfFAJwXxPs1+Ria60ZxvjWwe0op/kC87K7pn7wj862+DpERtNbDvpJsME+9j3Ul1nAxRjQjdgRVIu/ukwzWYvoR0Q+sQzvg9VGa608h0K8+ZlqXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L/NuR0Uf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RMCxCkkT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6490JwkR1768168
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 May 2026 01:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6CBYMEKKTRjFBCxhabXLvqdNhN84ux2TWjRDod/XXIQ=; b=L/NuR0UfsTpy473e
	mAveDI6EKxjmjbtZuaXprazRlbgBrvz/5j5arv9uRawLTF5kSWSzOo6SXuuB50bT
	lNGPlrHs4PoHvuksBjwNsLsRcJUKwSEd4mtP/hNIemwk7V9G6ABPDYM5hqqRNTmf
	/OoBi6aL+p1P9iGbFmr8LJ8pn8fWEcTMmRwySDXfEKqkTwmnR8Jb0mQCgeSU7DZV
	qQWuc+O4vsQ3paK/LEkKBOZblEsSSlLX4XbrFfsUhwq+ISENWluwmSDvyJiHvvAy
	EHZupNChhLpZHf29TghBTpaJ6wwDcNHzUssdxAU8EXx1UM2GSyFYwj8gaKmEsW/l
	KWKlIA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1t9q03a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 May 2026 01:19:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b81ff82e3cso2014037eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 18:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778289557; x=1778894357; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6CBYMEKKTRjFBCxhabXLvqdNhN84ux2TWjRDod/XXIQ=;
        b=RMCxCkkT3L7FEPRWmUhymlQ1Y7914etXW83vhGXwiYHcK/p4evSLa+0uwZBwBmo9TK
         zlieESMHaB0nIULgBaYdV5bEx/1gt6r/053sxPf7gok/qEwGQj73TDvnvx5tD7KglhpV
         iaR87TB9H71/XleBQunt6cfXOULvcC91ZHNqdFoxJx3f+YFAnHGYs/+fE/a/NUhPnZzD
         +20Gx8tj9ix1MPKZND6Y0nNNqa3pqliuy+mPIFKGkhR5S575HTXU1lSGhqZePCCPFgW9
         6fByGpYErAPP7N3nyeI60DDOsxuJYjZcTAdZrmo5zPOEZvT0SyCqye8SQ0PdY9+z1W9g
         Ik9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778289557; x=1778894357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CBYMEKKTRjFBCxhabXLvqdNhN84ux2TWjRDod/XXIQ=;
        b=Ya+cL3vb3obouCMqPDLqAzVF3Gza7sitKGJRLRoAL3FvNH6c5H2agMNn8USxDLOAcW
         6ShKX7whAAfIcX6QgoBu9XNmi0tHkEQIOHgdtOBpmAsc8jnWRm0J1wV13LfzinQS9n/n
         ixfqdj6WWp6eBK4emcpWhdaBZD4R5b2y0WSgqBftrdFc/Cwg7Jz/hw6Za5ZzaXfkvl9b
         N8SYkRTpDnmawQQxak5mPW6NtAl4l/HbTdtTKbI2HT8H3BIAQoBppaRinnEm0XgXN+rr
         qIURVJ4OIuNoKDusgaapG8XPR+4hyqR0k/lIYtO476C3zAsaMjI3fuKftm5Gvx9iYHPj
         6ocA==
X-Forwarded-Encrypted: i=1; AFNElJ9RDNM7VXvoxINTJCQNTHo30zBjJNAgFLxggsuZR7lapHq5llqKUs1/SVi0XaAL8LJfREdux8LNrSD1Fw6v@vger.kernel.org
X-Gm-Message-State: AOJu0YxcuEAAwwUqzeEf4nxNzMSGKpMw7cjQVzSDYPBqVlTPgEUAwVT5
	u+hlavS32Jh3hujnFsrxfSsytKpZFXs5wgmE8F8hl5S50ZMMLwoWYARuVI6Un6/F95w5K+4KYMg
	mu8omKF+DvoqXBUcf/Fc7pYXtVYsi5BMcvmXii95W4Npd/KagFAKGYaHyp11bZkIepX5g
X-Gm-Gg: AeBDievCIBPOAE4E60c/Z0IGMk2c453u7cSfjORbjtTZAkZnC1WzOBZxs00VtTi/h/4
	AEe8lF3eZD3zGxPwBGJFeeSZ2cO8Vi8hJgL9dZKnTbB+QqYckf0/DYTONTgu77rwAX4TE1j/Tq1
	ZRN6ZBs8B8RZykk7+dBnq8FxUnZsrrnNabXPr+ucWPKEDZjkx/hihI+Kh7YrIY+YIEs3WA6NVpD
	pFGVx+O00iAvns4I63Wcbvfgq5klIaq7wX8NI43WBkj9PTQ3ur8G+9H6YRKgozgPAF/1LvfR4sr
	8UgGJOzbRJ8PkI6cW+wESdSlQkvAcv8Y3nXP649pJ7+eiwr9TUodJqO0RY+hn2oLbabEIQCUV2f
	ekRwc/HWUvn5+5WuRU553awpFTOeGRYza38ppx+SGAXn1yNZnxaGL1A==
X-Received: by 2002:a05:701a:c94e:b0:119:e569:f86d with SMTP id a92af1059eb24-1323ae991aamr4128636c88.10.1778289556623;
        Fri, 08 May 2026 18:19:16 -0700 (PDT)
X-Received: by 2002:a05:701a:c94e:b0:119:e569:f86d with SMTP id a92af1059eb24-1323ae991aamr4128628c88.10.1778289555965;
        Fri, 08 May 2026 18:19:15 -0700 (PDT)
Received: from [192.168.1.6] ([49.204.109.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327821fd00sm5674706c88.8.2026.05.08.18.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 18:19:15 -0700 (PDT)
Message-ID: <2e694c95-83af-4548-b453-19904d24d924@oss.qualcomm.com>
Date: Sat, 9 May 2026 06:49:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] serial: qcom-geni: trace: Add tracepoint support
 for Qualcomm GENI serial
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260506-add-tracepoints-for-qcom-geni-serial-v1-0-544b22612e08@oss.qualcomm.com>
 <20260506-add-tracepoints-for-qcom-geni-serial-v1-1-544b22612e08@oss.qualcomm.com>
 <20260508132543.4f100ae0@gandalf.local.home>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <20260508132543.4f100ae0@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ALAlYNZTWC5b-KAvTXNOQzYhmOArBPgm
X-Proofpoint-ORIG-GUID: ALAlYNZTWC5b-KAvTXNOQzYhmOArBPgm
X-Authority-Analysis: v=2.4 cv=J7yaKgnS c=1 sm=1 tr=0 ts=69fe8b95 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=TOgzk8GLwxQW6KRttr6vHg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_ZtuFXLZ6xHUn8lUtBkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDAxMSBTYWx0ZWRfX6WXUKY7X23aA
 CKv/2657RNstp36r/ySoctgk4G1yhz+f1rWF+qEY/CMZ0Jewxnyw4Sd/a5YggjLAWR94geNOn8E
 2Fvp2ipqn1BbVkBxCP1ecyCTlXve9Tf97NH5YbNuDVKIaiHX8sJSXyljxQQWWluu+oOYXxxApiO
 QTqOW76Hi6Tb4Ebl9Qwx8EdFX/OTwWQ8bIAwZ3Imf5hTxLZgCJpe2gjCa/hJ6qPUclge39tzRxC
 N6DmRoDuagX+sIiEL+gnv5xl4dX9Wk8CkknvMCTNBOFzb1zFNnwdya84BWPM2JFk/AAoiZJk/ve
 +6wr/zGipi05Ji5p/sB+BahKCxlziJ5Hn0b6yPdFql5+i2KB6hhb6ei1jOzvkshNC67ezSEEZz5
 PfMwveeeaw9UpLC9YEBMUxswFKFee/1SPmF4ldwtd13AXE3jATbnQK9q7yIvUhOdTTeNoY9z2EW
 T+/05d96kS06miPnDDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090011
X-Rspamd-Queue-Id: 1E1954FD3D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-106762-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 08-05-2026 22:55, Steven Rostedt wrote:
> On Wed, 06 May 2026 22:54:44 +0530
> Praveen Talari <praveen.talari@oss.qualcomm.com> wrote:
>
>> +TRACE_EVENT(geni_serial_tx_data,
>> +	    TP_PROTO(struct device *dev, const u8 *buf, unsigned int len),
>> +	    TP_ARGS(dev, buf, len),
>> +
>> +	    TP_STRUCT__entry(__string(name, dev_name(dev))
>> +			     __field(unsigned int, len)
>> +			     __dynamic_array(u8, data, len)
>> +	    ),
>> +
>> +	    TP_fast_assign(__assign_str(name);
>> +			   __entry->len = len;
>> +			   memcpy(__get_dynamic_array(data), buf, len);
>> +	    ),
>> +
>> +	    TP_printk("%s: tx_len=%u data=%s",
>> +		      __get_str(name), __entry->len,
>> +		      __print_hex(__get_dynamic_array(data), __entry->len))
>> +);
>> +
>> +TRACE_EVENT(geni_serial_rx_data,
>> +	    TP_PROTO(struct device *dev, const u8 *buf, unsigned int len),
>> +	    TP_ARGS(dev, buf, len),
>> +
>> +	    TP_STRUCT__entry(__string(name, dev_name(dev))
>> +			     __field(unsigned int, len)
>> +			     __dynamic_array(u8, data, len)
>> +	    ),
>> +
>> +	    TP_fast_assign(__assign_str(name);
>> +			   __entry->len = len;
>> +			   memcpy(__get_dynamic_array(data), buf, len);
>> +	    ),
>> +
>> +	    TP_printk("%s: rx_len=%u data=%s",
> Do you really need to say "tx_len" and "rx_len", could it just be "len" and
> have the name of the tracepoint show what it is?
Sure. I will review and update next patch.
>
> Each TRACE_EVENT() is really just a:
>
>    DECLARE_EVENT_CLASS() followed by a DEFINE_EVENT()
>
> underneath.
>
> And each TRACE_EVENT() costs around 5K in size, where most of that is in
> the DECLARE_EVENT_CLASS() portion. Thus, you can save some memory by using
> DECLARE_EVENT_CLASS() and then define the above two events with
> DEFINE_EVENT().

Thank you for suggestion and will update in next patch.

Thanks,

Praveen Talari

>
> -- Steve
>
>
>> +		      __get_str(name), __entry->len,
>> +		      __print_hex(__get_dynamic_array(data), __entry->len))
>> +);
>> +

