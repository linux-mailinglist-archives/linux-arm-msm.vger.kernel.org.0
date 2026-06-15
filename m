Return-Path: <linux-arm-msm+bounces-113149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ErOAL2TML2qLGgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:56:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCF8685347
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:56:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aqdE4nP+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UqJ4O9EP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113149-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113149-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E019301E999
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 09:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8043DB655;
	Mon, 15 Jun 2026 09:56:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267963DB325
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:56:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517395; cv=none; b=T+I/wXDjfPQyfp+nOwh0xmVEKdcoKSMzLg31B671MrtwaJ7xBbqRbMCnG6LvbzOUF55Ij2v7abkD9h+lbC5sXqoq5ppghMJsh0phsiOxkLuNgmZgpIW1VniLNXurXdFTyLyarT18Hk/cEgaYmWhkKESypoGgUmo5+lCPau/emkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517395; c=relaxed/simple;
	bh=Ao1e+0tZyZu1bvnvdgxqH4FbrPUDA+TCNJkjlZ61SFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HrykLtSzOY5TwNL5wLPdPUeFwcdgEVhPZJILC28kfOdd6u6veSozL5GNNE28hZvGyl747ZtiEihbMc4q6uZkrMxbhix2eNLdFljwKvTrPm9Lvxfyhlaf8yfaBl0jcEoRDMHU59lihzgcWGUUiefS+Jdpt5X7vjX01wlomQWU2lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aqdE4nP+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UqJ4O9EP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F9Trwt4161349
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9cmNRQTJCMSzHPTRP5qMJhNPRDkvbUhMzAgHeE8nbLk=; b=aqdE4nP+lCo2PquQ
	URPEaj/oHQ5rKstMbsLUfzuKxL0CsEjA4F2eEC6iiW+pMLmzvNAkjJs+iJpV+5VY
	Ztk9xudT8ms/V8X8UJmPKTo8pzalUbfT8kCuwFShDoFFpQPIW2AlXyn8TTTpn9b6
	JtupX9mrkf7LeshubvvSoRLnfX5U76izzZtstdLLKRz23eWVG5xHaak8E0VPcicW
	/if8SPX0zwxHCIBKq4nAk6X9E3XsCvjT5fV97uWod7FkJz6CKvFDefIk4Cyo5T86
	vhkvRoDUQs1cgwPxopC1yOM2ttm6KLSNtfLdiCeh3sP++uReXn156u4Ct+aaRKbO
	NwNUoA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetf037r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:56:32 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137e49e896aso2918570c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 02:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781517392; x=1782122192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9cmNRQTJCMSzHPTRP5qMJhNPRDkvbUhMzAgHeE8nbLk=;
        b=UqJ4O9EPZizYeUNYr/dFAldneNTTlZPEdcnyv/WGNuSA5bJBGJ++v4brIwzXE5c9AD
         J+q9vgDDJGcE8ssb6zCcUau98eCCO+9pTyr1LloJb1k+/54e7rJ/6yQZP0F+6SblYnaP
         zgt1SEB4Shf1OjPM6Ij8NhPy2zko5Gpexm+3ljhNBI8RV7XbqmMWu/lDAZkm3cWbkeeL
         lNpFps8kZ/EQoe2WsyVaaTOcq1iBsF1hj6ydXH2GKw8iFgtmZ4dwoDoU6zON9Hw/5vaK
         uJExK1ieiH+DBC6vruCQbqMJFV1FvHpdqy2nTnYpMsgGBVNYu0v0t6RnWLHQk5J5b57D
         v/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781517392; x=1782122192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9cmNRQTJCMSzHPTRP5qMJhNPRDkvbUhMzAgHeE8nbLk=;
        b=alE0AlEsd2jUacLqU0WHuWlyhABWxN25jN2/TZ1LyBmsX3KWJs/iBVaHln3ZEJHLdW
         Wn6LN8N/+YRdWIZKDNf2KqdDrH2LvZF5v/MoB5RMBl7sZrqNK9DOICOEw4mU7IN1DUWk
         PpuAVYdLGQcr37JCskGxK/udBU6Sjb/gzScyRYqiRYqIl5GCIQbXiLA5lsg021iY9+nI
         17cEk1IsefHr5SvgMMF6W9e5+6xOA5RnlYh8zJxV+9HRuMgw0Q811v53uVqfiArR9HNG
         MKRWwoY1ExkQbsixsm+nsQtWM0MVMKneTAGgVLd8d1ndf5+vzhO+2h2hOvlj3HUXAwOR
         c3BQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1qDEGq3ghoi6K9h4lhJK3tkZ9hce5GE+i518X2gn27zV3AfKf42/+fXFZhJlDD/JiPFaovQwq/DSclFdO@vger.kernel.org
X-Gm-Message-State: AOJu0YzXodGAWne2yXdxGuDkLxJC/Cb6pOMCig1pZBL1prt5++BwrmaN
	PWKmwnChJ//dL6jyfeDj1p8bleeXCq98Pegtmj4Y23M5qATo7rP68fHh1Zn8yyIA1v9QyL+j+8R
	jbhqI3k53YvRyRXhwGDS6/BEJsadmwuW0z84avnj3r44TllPAFU5C6aYLIUmdnooAdUPK
X-Gm-Gg: Acq92OHySOxCL0pjFkMu9BvvOwRSQa+SYpKeO2tHUNTJHIod9c2m8zejlrVPgXiTlBU
	SJx5kUzE9k1npLkka6Nr56bXMupNMfuou5K8MCq3rQ3Xebk3dfF7LnSqt0dv94AqD/chDCsmyCj
	N9eVCZMdNb7VIj/QghydnTXptHvWt0kUdLDihtlUziLOleQVzBa3qgyGhSeIgoqZ7zELVWvF8Hg
	5e6zfaBOEivQ5bYELKzJ6xAxOXksTHfrJF36VyPOF2A9TrClbKo0CsM5ef33l1Eb8kQ6PdPT2DF
	Lc+tw9cSHZ8e70KkUseumCNM/Ar6bI735TZ032vQRVb7Vn4a8BtaHjqW/GT9w8ZhvGF9duTz4Gv
	Cm4fuonemCYnfzXFSmU2NycnFnk5Bx0zAx5/VGuSmhu6+QOGfVYvB8A==
X-Received: by 2002:a05:7022:6095:b0:138:5049:cb88 with SMTP id a92af1059eb24-1385049ccc0mr4361547c88.8.1781517391994;
        Mon, 15 Jun 2026 02:56:31 -0700 (PDT)
X-Received: by 2002:a05:7022:6095:b0:138:5049:cb88 with SMTP id a92af1059eb24-1385049ccc0mr4361539c88.8.1781517391360;
        Mon, 15 Jun 2026 02:56:31 -0700 (PDT)
Received: from [192.168.0.5] ([49.204.111.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b8f9889sm9435686c88.3.2026.06.15.02.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 02:56:30 -0700 (PDT)
Message-ID: <688f0529-44ea-4cdf-bb0f-6c42cb3fa07e@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 15:26:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] serial: qcom-geni: trace: Add tracepoint support
 for Qualcomm GENI serial
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, konrad.dybcio@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com
References: <20260526-add-tracepoints-for-qcom-geni-serial-v4-0-e94fbaec0232@oss.qualcomm.com>
 <20260526-add-tracepoints-for-qcom-geni-serial-v4-1-e94fbaec0232@oss.qualcomm.com>
 <20260529101422.18dda2ae@fedora>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <20260529101422.18dda2ae@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=adxRWxot c=1 sm=1 tr=0 ts=6a2fcc51 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=f811rhDWPubbsD7ecTZfYg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=QHbzznkLyNFsLEHLBrIA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: BzmXKZlKagPQM0hQCp0_dVL4Mguh8O8S
X-Proofpoint-ORIG-GUID: BzmXKZlKagPQM0hQCp0_dVL4Mguh8O8S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEwNCBTYWx0ZWRfX05DHAHL+5cXC
 yw4pHpHkE2aczWv2Owl5VOrNialxI2uffk55Zty+pbTWFH2i7B9uZYarj5sPam6Tq9oyX/1AgDL
 KaOelLqn4ja04UfTdGctZFvwuNrXYzI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEwNCBTYWx0ZWRfX/omVEbSytbE0
 mwEucztYDzEvWw4D336ukPhvb8ip57p8oXqVLUgrwDIlf639nm0vy6/HAONqJ4IuaJ/75nNej3U
 CdmT2n58sBl9/Ib7Liy182puFljeYJD/3nWq2wk6JiudWUkQTELBwcHJnoynuBWO/RlTOpIfkMV
 AfJIUNnWI9YW7xnHvzI269JWWFHUuKdzlHVnh4sjhsGwAbj623Xi20hazuEcVq4GC0Q+/o6d8fA
 NMgeep74aHxpEKpo969C7HXaD4tuHI8/ThPXHqOn8aJHRWLjM/4tOI4VSiwQZ2H5lfJwWkC9TCU
 PTVkxym45x4RTWigaOSYlwEcF3cZcQu8K5AzDYj65Ha4MrKV8EE3s6O/UT9KClSFac5U74F047U
 1lBlSf1gjaUAOQtOmFmTQJOcGwDcdHwCWTxncmxTX39R0j6YR2BTv3lpsCkGFDRs8+PCZp35vnm
 BB/Eko38qzKbaqjsMIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113149-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FCF8685347

HI Steven,

On 29-05-2026 19:44, Steven Rostedt wrote:
> On Tue, 26 May 2026 23:07:39 +0530
> Praveen Talari <praveen.talari@oss.qualcomm.com> wrote:
>
>> +DECLARE_EVENT_CLASS(geni_serial_data,
>> +		    TP_PROTO(struct device *dev, const u8 *buf, unsigned int len),
>> +		    TP_ARGS(dev, buf, len),
>> +
>> +		    TP_STRUCT__entry(__string(name, dev_name(dev))
>> +				     __field(unsigned int, len)
>> +				     __dynamic_array(u8, data, len)
>> +		    ),
>> +
>> +		    TP_fast_assign(__assign_str(name);
>> +				   __entry->len = len;
>> +				   memcpy(__get_dynamic_array(data), buf, len);
>> +		    ),
>> +
>> +		    TP_printk("%s: len=%u data=%s",
>> +			      __get_str(name), __entry->len,
>> +			      __print_hex(__get_dynamic_array(data), __entry->len))
>> +);
> No need to save the length of the dynamic array in __entry->len because
> it's already saved in the metadata of the dynamic array that is stored
> on the buffer. Instead you can have:
>
> DECLARE_EVENT_CLASS(geni_serial_data,
> 		    TP_PROTO(struct device *dev, const u8 *buf, unsigned int len),
> 		    TP_ARGS(dev, buf, len),
>
> 		    TP_STRUCT__entry(__string(name, dev_name(dev))
> 				     __dynamic_array(u8, data, len)
> 		    ),
>
> 		    TP_fast_assign(__assign_str(name);
> 				   memcpy(__get_dynamic_array(data), buf, len);
> 		    ),
>
> 		    TP_printk("%s: len=%u data=%s",
> 			      __get_str(name), __entry->len,
> 			      __print_hex(__get_dynamic_array(data),
> 					__get_dynamic_array_len(data)))
> );
>
> That will save you 4 bytes per event on the ring buffer. And a few
> cycles not having to store the redundant information.

This patch has already been accepted and is available in linux-next.


Thanks,
Praveen Talari

>
> -- Steve

