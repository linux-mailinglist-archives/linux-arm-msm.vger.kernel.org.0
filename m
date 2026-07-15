Return-Path: <linux-arm-msm+bounces-119138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eoZtIFUHV2q3EQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 06:06:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B04175A67C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 06:06:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="MBX2aI/E";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a54PjQ4h;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119138-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119138-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5254D302E147
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 04:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9F53A9619;
	Wed, 15 Jul 2026 04:06:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA3B39CCFD
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 04:06:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784088402; cv=none; b=ZrQ+lfnSE6LqVXMcOs2LqQyqno7hhOAGEKcWogoFgNMLEDfM7XyFf5K6b4rb0nR7T9Rw30WAFh+ZBFK02KQsu6mnjEVM6fSD5mFMkPFk250aZt1Y2i9x3XfUDi/ZVkMhQiI5Mygn37Qtm1BNryHNfGPJ6ijBgZiIdzRHAVQrDsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784088402; c=relaxed/simple;
	bh=0EFshVqSrc8f7OStgTf8hZCJkjVP5CzhGdQcqZKvRV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qLs/FbeK9DmE7H/A0ZU82VUnmE22osuj0is9i6YMrb6TR+x90tsk2+eHIRQXkPbuDGawu4qi+ebhxjrwFIGokQgmMaaWaIo6s4VlQZ68ecAG7GV+GmG5/Pzmp3ttkhYZNSt1kYVnfl/7G2YfFge3ECA32/XW5luVXwJgomtgRp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MBX2aI/E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a54PjQ4h; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lJo22680218
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 04:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aq8pKEu+zdq3GBZfc94BkwVIZ1D/MyJMoeF2wETynLU=; b=MBX2aI/E267mc+Ri
	Ae2koslafqgvNgkufljnooxJZ/mYOzcNmTBJ1O/GCjLaXODOL5WMxsAmoeNgAgIE
	T7+FdX/FegTXjic/uied/NqaF7LWQDNJfU6Z6YMNMCltGUy1bNIjc9L6kPkMFrFZ
	0PTkWf1iKlUWhR/crNap7gH52HnFbIWZGWp+fcWYv42fyODmgAh32aswrBpNIXkz
	K2UbaBp2xUTQxdDOqPMJCL225uzX9oFNVb+WcMj/cf21/x0P58UnoF+IjHZrgMk/
	iF3LCwyM27PRzeKEwuDkKgt46NW5UhMR4Thwe607JpSy0awSC/QxOrSjpiQOmvsp
	AcvVnw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnutvqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 04:06:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso11974531a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 21:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784088400; x=1784693200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aq8pKEu+zdq3GBZfc94BkwVIZ1D/MyJMoeF2wETynLU=;
        b=a54PjQ4hEiifZKcyzbcfUxMaJk0fhjxGb2YxWBgMVXCCctkmflJ2BuxxsJMAxWw/L4
         Zgu7WRXGhEYtW0sxsvDh27Gr/9ay1X15kL3i+kA6iysurGGcL7aSHt5JVpX9uelUYPZo
         b5XaVx8kK7YLIBNErNTLvliIqj7Tp3Tgy0K9XC7EWxjuARjvLVBKX9sBgjzZ+TShnXiy
         X7RNeozb0rXuDZEtzvlpEn7MPStBVkFceNLQdGWOvZ4hqqmVPUlmFzJTjI3Fey6XgFOg
         tLeSJKUIAcEDFkwv3C74Ha6rxX1dueFsAV/V/pR+z1b+fzwbo4pLhCsqWVsr0VPB+5HD
         Px6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784088400; x=1784693200;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aq8pKEu+zdq3GBZfc94BkwVIZ1D/MyJMoeF2wETynLU=;
        b=Ivh8ikR4LykRY1RKgJEM1K19stXa+sWRnXFt73p/BQiXi4XZUlSYNbey+J2UhjjPhS
         hoDTHS12cvyOy/QIiZN+KIliLhQ7gUfj1mqe/I1KYqw28wyBkeX0pGV5svlY7FNHw9c9
         4v96LPQAOZE2Bwzj2IXb2NORj7+HjKq7TJnBW1ZhNJhvf+i/TTsUpZr/6YT/jsQIPnTz
         wsYXeTfUNiPWCanw03qpmgpnBejJWd4VUADbNg/wSw7HwumbZNV1L0H99ioEe8QziGVF
         pwa62gLQzX63A80IbLzOJes5/4ScgQDUpd5xLyJN9cXlxOH/4f+kX1B/cxJsfI1zey5f
         vaOg==
X-Forwarded-Encrypted: i=1; AHgh+RoyqEVTRl7Lc9oUsXcMWzADAIKdgNxhw3sVpGJ9ANHW2Eq7VBMrX5eVnKoZ8vPRBSxEg2IGnWUBQoPFMK3y@vger.kernel.org
X-Gm-Message-State: AOJu0YxaugFpBrAON+6gGaJrEVhfBkzCqR/DqNHWZ4ULZKbja1nszzfu
	cr+4E94OP5/bx6vPi1eGLnOJwNsQpcvHdSGY82uJP88EbyJLeqS6C1Ec4mNz6fMo4WGZVTPyPXY
	ML0r0IgspQXqozNmYsF5rXFjzCq+26TmvGwidTV14WkjIBrRXYwUzeKDD+8Chfid9qyIx
X-Gm-Gg: AfdE7cnfYvFqI7UDSB1J+UVl3XK+Io0hHPRjC2RvEY7OAdne/nSVuelWoK7wQdpFxMB
	2WwKajhaXl6NA8qUKtiEPxWJKHei7XTOO+Gisbh7rlrnz1zgEXKJ6d1YBnqUMmUWRTDEnbfYiw4
	OnSbwtHJHasaGJ8o20E8Bo1w2HyT0JxkGMJkMusuFlWJHolgANgd6dplSUhMac0xIzFMyUAHfXs
	NdbJqFRLCrs4Lg3ta5YseQlVBbmzR8oZ0BICx/wg5YkL2gUUYTXiVTD1qXazMnsD23wHaYVsc5u
	OjXsZnh0ZscoXJRgkHQzddqAkmqHNq3gKtRjjGDkjHOMz07G6rg+snDFEs+W2iHeFQg5UZnL4g7
	8luCF0txV5Dy91ONlv2fJapk805h44Jdl6cAxS8UXAMltyQ==
X-Received: by 2002:a05:6a21:8cc9:b0:3c0:9c18:d5a6 with SMTP id adf61e73a8af0-3c35729077fmr6943841637.67.1784088399584;
        Tue, 14 Jul 2026 21:06:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:8cc9:b0:3c0:9c18:d5a6 with SMTP id adf61e73a8af0-3c35729077fmr6943801637.67.1784088399121;
        Tue, 14 Jul 2026 21:06:39 -0700 (PDT)
Received: from [10.217.219.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b9a67c217sm27006165c88.8.2026.07.14.21.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 21:06:38 -0700 (PDT)
Message-ID: <e53ea721-bcd1-4d8f-9b7a-ea6ec3003f71@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:36:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] i2c: qcom-geni: Add dynamic transfer timeout based on
 transfer length and frequency
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260710161056.1799019-1-aniket.randive@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260710161056.1799019-1-aniket.randive@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DsmPxlt4XZaM79PDVfNUCjnBGKnsobk5
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a570750 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ENRykshp9vPgoFS4LJQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAzNCBTYWx0ZWRfX/B8f1ODnMCtg
 g3+thSmxuV97KVmWJ1D9IYOGEF7ezww/lkMlbi5Aw50Mye0hnFThHnbRfRBzt+0ytWHy+oyxzc7
 wxrA0fHyJSAVjMfr3UHmAyVRNEOep99AijGd5LR1nvNMr1EW2gQhO5h4BUUybAO3wHiqolsU/dj
 +vh3J4WEkfC0QH+rbXvUTDdLLVP5Sdw8hNKatw15oJk7p2CFrIk6Bk94rU+fhrecSpTN4eQ88eF
 ymsxxf5Qc3Vv9QJ3C/tFWNlhcALT49CfucMWmfYlHKJqzN1Ik7zG9iNtijQD/GvLtHOITpHep6B
 QWtixOP8IpYWAqecZGdttEcRawbUC08rBRX5ZD7pHoJpUEXy1HgrbXyTNT5JbWLVpxZBGTP8sUy
 s9GxtU5/44EbfubaSM+f+FsV4HD4he6ZNtLMam6JJzqb5CFXk5uSuHLqwYODluRSntGQqmNefJq
 2bL4mp6byV1AqTAMXGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAzNCBTYWx0ZWRfXyckL8H60KpuX
 VwgKx0smLOx/KVHjJPt9oRHgDI/0Jp/6mHY1DnPhf+tc+PvSMQUha4orZTv6tTcJXOP+i06O4Nc
 dV7cQIsKGeEBBIQPHQsxHak3MUh01/A=
X-Proofpoint-GUID: DsmPxlt4XZaM79PDVfNUCjnBGKnsobk5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150034
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119138-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:aniket.randive@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B04175A67C

Hi Aniket, Thanks for addressing previous comments.

On 7/10/2026 9:40 PM, Aniket Randive wrote:
> The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
> regardless of message length or bus frequency, causing unnecessary
> delays on error paths.
> 
> Compute the timeout dynamically from message length and bus frequency
> with a 10x safety margin over the theoretical wire time. Add a 300ms
> floor to budget for I2C clock stretching, where a slave may hold SCL
> low indefinitely during internal processing. This detects real hangs
not only internal processing but it may go bad holding SCL low indefinitely.
> 3x faster than the old 1s static timeout.
Meaning, in such case/scenario, don't need to wait till fixes timeout.
I guess, 3x faster is relative to the 1 sec, but for larger data and 
slower frequency it may not be 3x. Hence, correct it accordingly.
> 
> For GPI multi-descriptor transfers, use the maximum message length across
> all queued messages as the per-completion timeout.
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
> 
> Changes in v4:
>   - As per konrad suggestion used mult_frac() for bit_usec to avoid intermediate
Do not keep space before starting, directly start with "- As per....."
>    overflow on 32-bit targets.
>   - Updated the commit message and added a driver comment explaining the
>     rationale for the 0.3-second minimum timeout floor value.
> 
>   drivers/i2c/busses/i2c-qcom-geni.c | 46 +++++++++++++++++++++++-------
>   1 file changed, 36 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 96dbf04138be..c5c3adc8ec77 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -74,9 +74,13 @@ enum geni_i2c_err_code {
>   #define PACKING_BYTES_PW	4
>   
>   #define ABORT_TIMEOUT		HZ
> -#define XFER_TIMEOUT		HZ
>   #define RST_TIMEOUT		HZ
>   
> +/* 9 bits per byte (8 data + 1 ACK), 10x safety margin */
> +#define I2C_TIMEOUT_SAFETY_COEFFICIENT	10
Add a line space to make it look clean
> +/* 300ms floor: budget for clock stretching; slave may hold SCL low indefinitely */
Already explained in commit log, can remove second part.

> +#define I2C_TIMEOUT_MIN_USEC		300000
> +
[...]

