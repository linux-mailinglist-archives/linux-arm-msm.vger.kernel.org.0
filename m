Return-Path: <linux-arm-msm+bounces-118163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QKZtLiSRUGqc1gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:28:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 484FD737AF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:28:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="VomS/aEH";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WwjudaKj;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118163-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118163-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 628C03013462
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 06:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08DC23B14C8;
	Fri, 10 Jul 2026 06:28:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B54371D07
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:28:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783664927; cv=none; b=qY3MH7bnJOXLeOpVFGooWfTG9TCydiCJZ+K+eqKWgr4LuFSd0rNwWoRcmBPMIIx25rWcqjAiKwdJUV9/aEQ0NV9HP1pM7gJFMnQ6uBCy5ejj+aAOjnT+uNbNidc7tRsxk042Sgb+FOtVvFJw27hLhP8GO13V9+71vx6yo4vjH2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783664927; c=relaxed/simple;
	bh=cnTWo1OBd71XYK+ry0dua9p6tI5aZnGavquzA1upFs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQwJJJClpMSG0aJnaXNn2FCODWayJJoa02IxtwGnbajv452fntNmSavW7tPus4ho3rHABowet+Mnm6KoNOv1e0MuKRMVS21+POq/ktyXxjlY2Fp4fr7E/CSVsP35Q1U33AquhSZnTuzzNcNp7MzrBPehpm2zsWZi+LKNUfB1TV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VomS/aEH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WwjudaKj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3nCdD3752746
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vCK4xb7+t9eA0fURCfui0sEci53MP/2bb0fASDaMvY0=; b=VomS/aEHPk14x5IZ
	dh7gEEphIyjdk936h3lgbJZRoOzHRvzyxi1+t3iIAoX3ZwiJ/QDsOeoIo7R6qpF8
	9kft49ZJffk6OC4wrCZizJWz0+1AIJmimOK4eF4pbwyaEMQe4nBlv/fvNJvG7+tM
	Azd3Ecao2vK+r+w26QyIqixge8qQpqrHhjkdOeHrSqxkpLgeLBFfUOtq+z1hwl9b
	oNDVolvX4P07WpvEJVD2AL1TgzMOWsA+xq6YPkZyKV9JpQPmoJHL+siulNapoay/
	BGBdtMonp5ATHsGDrp92PLPTrtRfx53E2L4WdOlfnXaBC2u3B9kEX45f2F9i5Q2d
	W3maCQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvjbaqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:28:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89956023dbso851167a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 23:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783664923; x=1784269723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCK4xb7+t9eA0fURCfui0sEci53MP/2bb0fASDaMvY0=;
        b=WwjudaKj9r9qz9INLa3+m3PWlwb/Fgi2I4vG8pF8ahLoYxR5ps/BMu6/f6t51Fu5TV
         61ul6z+yHwdGaKTGn/jLeWNEiVRXwrUXYCfNT+Glo6i4ppeJHZbmCBD4wuuA5hEGDUq5
         HgeiYwjrQFrJ3pn/yVqbFpJX2TAHH0mJcfUZw/JykZ41uKnCwrTP5IxJg3hEwdld9YjS
         oI+yZTV614KvRnY0HzkAQZ3+qUE4HPAxZhzc7O3FJiCZUblxk67REwxW7Y0ep/YpBGXO
         1Qbpv+7Vit6uy16QiC2zPwPwM8piFTc1haIYbsSt50LiII+9MxI1RrHESlUHCaxH7wUf
         KfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783664923; x=1784269723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vCK4xb7+t9eA0fURCfui0sEci53MP/2bb0fASDaMvY0=;
        b=Y3sxDKvvWj3CankSbNKDkHMe+fNPm+c/GnRu7hMsgR61hYnzi4Xh1E5gDP0Fn6g9sU
         tbWDokK3EATmnNIN3hzkXVYzMzR8JxQKZOj5w6cLCyX6bpOMLifGFk9ZQOfWVqzg9ivK
         LqtOMt67yorgMrAfh9QT7crkKphYBlSk0+66/flM4B3lHJY6+DiXpDRa84kdCaLhoh1c
         6y9DJUp/mQo/nDorkzri+tQReRPPc5pHMbDL6Gjo7yp0PN3uYxAxw5XTmYDLTYTp5kYc
         yRwPLqJ1sF2Pt8qxWN55Rse8JsDzNH91l7AGUGzNgQKlnDEULpEHBEMU2E4CeA2f+gKn
         eQXQ==
X-Gm-Message-State: AOJu0YyZ01y9Eb2GRJzq02HfpkTzE0S4KybcPTCub7WcUGop0EJZGp1i
	gSjlw5n9nJ+tTJzqmIoBcQTcw35wICdnRn0BG1bL5zb3L8KSzBKcti1FSZY/M6yFyx1pJggh3HS
	cryG2Gaokx+7ugJhEKkkaFgGIPHBRcO4QcwDS+I7bSb/rur6zQ2US28TWAoIh6IIo+7UR
X-Gm-Gg: AfdE7ckW4fIaHEsCzaJ3O0I+c2cffCjCoc6h7BEvowjZrnpYc7kn/P/0Kz5vuGZ0AKs
	v5no09mN0amPnqpTug9Am3OesAIZIdYkOkgV9j5LuAEUplIVnhtTuWR1wLv7BZ0STWZSUVtqJpW
	J0f7Ur5zsaGEDT0gbsT2a15JBG5uO+i/f2LOsqHvsgD8hStsgJ2UU2ZqLpOwiYGsJbBXUs/+eWs
	NOeUtUoGKxkhdHGuZmHvNyPs1xtv48/JB6caocSdkwevUme4m3VE2UrMkIpJzogYsg+WG2YtF9A
	fvb9Fgr97EZjWELdZmchNmdO6ltBt3iH35HI23wnf1yoM/IczS6Q0mbZtVSkHLctCM+QJtqL9BI
	ES70vDdD8co6YrRFxvxxCqPX44eQFEMFTbvavxU8oZolv
X-Received: by 2002:a05:6a20:d708:b0:3bf:e761:6285 with SMTP id adf61e73a8af0-3c0bc9e3763mr12485222637.29.1783664923435;
        Thu, 09 Jul 2026 23:28:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:d708:b0:3bf:e761:6285 with SMTP id adf61e73a8af0-3c0bc9e3763mr12485191637.29.1783664922993;
        Thu, 09 Jul 2026 23:28:42 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm18237605eec.26.2026.07.09.23.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 23:28:42 -0700 (PDT)
Message-ID: <974e8000-79f7-4713-9fd1-3398269e0951@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:58:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] i2c: qcom-geni: use dedicated completions for
 abort and reset events
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
References: <20260709-fix_cancel_sequence_on_failure_for_i2c-v2-0-1db178c695bb@oss.qualcomm.com>
 <20260709-fix_cancel_sequence_on_failure_for_i2c-v2-2-1db178c695bb@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260709-fix_cancel_sequence_on_failure_for_i2c-v2-2-1db178c695bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MCBTYWx0ZWRfX8kaeEtI7JccN
 T8CuGncR2FKzaLNzT+ixLvKRjqHUX1wpK+hFLSLPZO8jnNwcJmeSS/5jT/uLS9bNvEbVE5fhMdD
 YlNlLm7Y+UFiSRKqP74me0Ie3s+mWJCH/g1Izkk+nKm3Bgt5uPRKHAjDkKVhCZpy1ZBEitWJy9Q
 eFXG5Oc4A6P926VywjVID56XU3C/9ipbTC6jvHfO8BndMcDWID1RhEXL+JwaJmXldyYI8eRFuO8
 8lzZVazH4PgJSnh7qYhddUOgklls1ghoFKBc5lEz69qCV0OSUlMZ62FaC06YoANS85QcqBcfsik
 8V5kr4/3MLAED42PkL8rRAPXttbiQVRhGyf2i3S5RM2cu+uypuBgF/gL4eUNaySe67vm1w7PzBy
 CV6ePPcu/3H8SAHzJsw2btKmdfeP3qSlobehZsKwZCNypo8k0DOhsr0SlzivO0ipq59QuR4xin7
 KPjvOA/JlXfHO57PPkQ==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a50911c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=yZg5s6-rMQmTt4nTBlcA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: VMFn_YRZK0NGnueahF0XGvznrLHgUnuf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MCBTYWx0ZWRfX6Y4WiWyzm2aA
 iJwNsMybQKAVbPVLHz9+WDpeONDzk/3htr00OKb8hlb+QsaUGi7tf2YDyk/aoPo6XPKZwhsPWs6
 Ga+IDMyoUjCYbz3ht0uWGIVAvzhzeYg=
X-Proofpoint-ORIG-GUID: VMFn_YRZK0NGnueahF0XGvznrLHgUnuf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100060
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
	TAGGED_FROM(0.00)[bounces-118163-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 484FD737AF7



On 7/9/2026 9:50 AM, Praveen Talari wrote:
> The driver uses a common completion event for transfer, abort and DMA
> reset operations.  This allows unrelated completion events to
> prematurely wake abort and reset waiters, leading to incorrect
> synchronization.
> 
> Introduce dedicated completions for abort, TX reset, and RX reset
> operations, and signal them only from their respective interrupt
> events.  This removes the dependency on shared completion state and
> eliminates the abort_done flag-based synchronization.
> 
> Co-developed-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
> Signed-off-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 54 +++++++++++++++++++-------------------
>   1 file changed, 27 insertions(+), 27 deletions(-)
> 
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

