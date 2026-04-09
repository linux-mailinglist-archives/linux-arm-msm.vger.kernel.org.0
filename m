Return-Path: <linux-arm-msm+bounces-102555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJqhOKQS2GmxXAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:57:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7263CFA91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E05FD307BC8B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 20:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287E333B6E1;
	Thu,  9 Apr 2026 20:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="erglGhfy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eh5GlN6o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D120C33F59F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 20:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767940; cv=none; b=oy5gdY//Iy4M+K2SL6snOmlC3nX0npaxQ2YD2LBbNT1RY+YA60wQLSLoMShG3yVn3/dsDIsk5kxyu759OVfRPC4TgFyyA+QT6LiEhlqBtmVNlJEhoN8xnBmpkA4+CtWGVnQNtYvpe7bcDRb+tQyWBd79bSp86OUE3byMD6k5g2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767940; c=relaxed/simple;
	bh=Xdl4SEPIG1bTe8bbKcDft3BVAeSV/iIOez/utcM7wRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bfzt2kZ0bqna5J8X5l1QbouBNWjuqOv8mTaOA33GTVpv0opjz0YKXl86h0BKDYW+7O6QjaKlluE+ymQTFHVOE+yWHGlZZDH6LmvJGQd7IdTIGvDG1KDrJZI55VKefh9JVYi+GsPcOuEzvZdODoffvDaWqOHzybXR2ENPMochyqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=erglGhfy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eh5GlN6o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639HRaQV3352647
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 20:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4YgjMxSPty1CRZ5O2vYOSJef2/ASxr164jwUcV48qCQ=; b=erglGhfyWNLs2xhs
	hqwT5Y0E58DH/3rzJnDP8Mb0HJYivfLS9OHlovYOb7XIpm0WPCGO1USuxhcnKLEr
	G3s2Dnt8gpIc+OFwenIsc3J+ZHs22ECsu0M9KGnxzZdlGkkzKa9iYR0xcC2l7ae3
	ZyMsno5XuK0Y3TRIhiVZAZlSASFSycf3QA0TNOOVrvafXAujeq8CTwlIk8rxeR7S
	NIdc+SoU0HHpJYUHfmdE97nMzCmXjEnm40+f+D780Di0pyU36k7fSB1VcvmgC26U
	M5OI8OubEVUfqFIexP+PCh2S2k25C47qvoH2yXvd4NFpeGL8koDnHNwzggv4zkOl
	/ruLiw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1qsvc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 20:52:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso1841665eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 13:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775767937; x=1776372737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4YgjMxSPty1CRZ5O2vYOSJef2/ASxr164jwUcV48qCQ=;
        b=eh5GlN6oZP8z2sAahq4cC8G/a9cvTCAWZJ+sxoJuLWWxF4NEHNGFjZhMdetlRM3I74
         +2SjkH7wORPZHVGmuGm5kzCAot5uKnXImM20HJS4Y7cVHpQb7yIHE7glo3U0ONzIi91c
         Gmw+Uzwn4ZQFRHwcKna5koMvG6p886ptDJrjsla6nwi8161jwVXCM90MOt77Bd36G1+Z
         Sq/2f45iMkrc5x0EMrUWsH+3C1y4jl0TpUuBenb33s3c74OGd8c0dSxE1Wr17cMT62QW
         9ato0WwHTJcb/iKsIlEb5gwbU3MQkiDlbwy+RL+gt1i2uKnGBREANhz1THUz1CiFYsgt
         7Gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767937; x=1776372737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4YgjMxSPty1CRZ5O2vYOSJef2/ASxr164jwUcV48qCQ=;
        b=JY7Pq2B49EcGIHQb+A4zXGKRgm7x1ofM7Yu6gKwrGftuc0Cl9wFEY0lZ0ppmjByXg/
         dzlOnY/wzL3/Pl7MWlAslYpxUwL7wvFY4Ngwt/90nbzuBfyxOsLb9e9PI1GkehJa5I18
         z+ZKdmO74q9rTm9OemlygwCF1PYByuVPG7Gvtc73ehsrCUkGwxJY2YJ+XdC6MljSqRHY
         yTk2KkyEyYNvrG7O+UOX47eda4LY1WfSxjCUkef1Grvj3SgputFqBb4Eao3Bcw/n0QxL
         grIBG1T1PV45hdqeynttUI4ID6/ZjEc4LMWYG6dFoRUQkUR5YZQZztIyaLmfzXwNKXmr
         C8Wg==
X-Forwarded-Encrypted: i=1; AJvYcCW4bNjSosZNT9z/EvIlpoa9153L5Byg/AA6RBhkYUmDIPJ6gIAIogc2a2pjV7xS2ZSas8TyiWGeNCe8MmIn@vger.kernel.org
X-Gm-Message-State: AOJu0YztyBxGC7IMztLgTWDdh0iMASvHftdmiq8QN7pp8DoKwW+nFF1P
	cbfnRsV81eDtQRgpGbqCCw4dN64vvdzmKzl4c14TuqtHae1yUT6ckNvJN9jJELXtbSqejq0lnms
	KoqMCU6Z3ZFUS/aAs4DNNi7LIOwgz2Uzd8kw1g5ZTtvYe9lyAPl68sJ+MGqYvo1CZSoHn
X-Gm-Gg: AeBDiet4QOYDGbXX/l+AHnKwZD2MQO/n1d4NoHL43wxy52vr6F/XG+fweMPUBTwCC2u
	EdkbBNx7Gtkd/azJBPaA8tVu0WOoLUS5PLXcEsKFQVtzOeVlgbIC7FupgaRbpzhDcaUa7Jkd1FR
	o0BvDgbfnMH9wRs438gDS2a7cpgf1bdh23Zf2L/7mFd91vTe1wvdS+r5OzJ0Vh42YvFCov0YWqT
	q0CJW+dCFC0SYeocBPK6NXUKp0DKm5gvZSY3wxEUYReodZAJkt/12xjg5PsT9Wb+L4adfU+t3wu
	9fr8qGc3UMCzstodII/4OecmQatJDS9P9m7m30UkJzSeCEOEyosD6auM6HifAbK95RvKOKOhtW2
	PSNSpBqyRPw3rUGZgvFUKRmMyuGrVynMyocpnX6Kq+Bqsbdrq2lQRYwk3JVTp/O17ItMkRej0aU
	k=
X-Received: by 2002:a05:693c:3117:b0:2d3:dff7:13ba with SMTP id 5a478bee46e88-2d5871afaa7mr376393eec.5.1775767937023;
        Thu, 09 Apr 2026 13:52:17 -0700 (PDT)
X-Received: by 2002:a05:693c:3117:b0:2d3:dff7:13ba with SMTP id 5a478bee46e88-2d5871afaa7mr376348eec.5.1775767935665;
        Thu, 09 Apr 2026 13:52:15 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5632a64easm1452705eec.31.2026.04.09.13.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 13:52:15 -0700 (PDT)
Message-ID: <2eda7d10-e4a9-4ca7-ae73-bf9c0ca8fa33@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 14:52:13 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] bus: mhi: Centralize firmware image table
 selection at probe time
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-4-47ad79308762@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-4-47ad79308762@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5MiBTYWx0ZWRfX16g91V4TD/Lc
 gL5YoOt3tDlY26KJif1dUqT/vbp8FFI5M+q/o8ZgACBfU/ZR2f9R+WPCObBhj0Dbv5Mv0O9Y2Vv
 5qjScxzjuYEzPcRmay0jLn16hzk5o2r4ZVl+4BTANqv2xymWy8b52F4Gvx9LdUWFRdkn609QnyN
 rCk6nYwHjzvrEl3xu0Z//z3NVBXYScw8Q5P05KrIC7fa4s2p13nfhq4YcEAFFucrcfAVIwGtIEm
 SR7tgs8TvGJlC3f5qwBBoAjp9ovfjL2svptKFmt/+V7R3RzmvkqY0DqGFBstHqSw8f8yg8B3gi6
 3y8/TpHYX/YkLGcFO6sjur9Wl6b9SUZZeZolq6X+1RivpcgTavsoIzIviNZDpXWX4P4N4w4DgsM
 2Cj2GfmN+kOD3TX4q897iqLtljSVIZUOgZI4fiuRgV5xoFLc/ZWiuw/ey0DHlDsYkhnJJ56b/RI
 U9UoQPdep3tjZM96TUg==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d81181 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=AsT2qU_2Mam4ECEOgGwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: QV-IIzkVfi6gU7k3tuNLXwS6T9LmcSXE
X-Proofpoint-ORIG-GUID: QV-IIzkVfi6gU7k3tuNLXwS6T9LmcSXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090192
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
	TAGGED_FROM(0.00)[bounces-102555-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A7263CFA91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/2026 12:31 AM, Kishore Batta wrote:
> The Sahara driver currently selects firmware image tables using
> scattered, device specific conditionals in the probe path, making the
> logic harder to  follow and extend.

"to follow" (remove extra space)

> Refactor firmware image table selection into a single, explicit probe-time
> mechanism by introducing a variant table that captures device matching,
> firmware image tables, firmware folder names, and streaming behavior in
> one place.
> 
> This centralizes device specific decisions, simplifies the probe logic,
> and avoids ad-hoc conditionals while preserving the existing behavior for
> all supported AIC devices.

It would probably be useful to mention this is in preparation for adding 
QDU100 support, otherwise this reads like it is just change for the sake 
of change.

> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/sahara/sahara.c | 66 ++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 58 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
> index e3499977e7c6b53bc624a8eb00d0636f2ea63307..8f1c0d72066c0cf80c09d78bfc51df2e482133b9 100644
> --- a/drivers/bus/mhi/sahara/sahara.c
> +++ b/drivers/bus/mhi/sahara/sahara.c
> @@ -180,6 +180,16 @@ struct sahara_context {
>   	u32				read_data_length;
>   	bool				is_mem_dump_mode;
>   	bool				non_streaming;
> +	const char			*fw_folder;
> +};
> +
> +struct sahara_variant {
> +	const char *match;
> +	bool match_is_chan;

This is dead code, add it later on when it gets used.

> +	const char * const *image_table;
> +	size_t table_size;
> +	const char *fw_folder;

This is dead code, add it later on when it gets used.

> +	bool non_streaming;

Please run pahole on this structure. With the interleaving of types for 
every other member, I'm expecting there would be quite a bit of compiler 
added padding.



