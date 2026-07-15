Return-Path: <linux-arm-msm+bounces-119170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rwnTHkg3V2rsHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:31:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C39E975B716
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:31:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=flWivHx6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UhpPPZG7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119170-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119170-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 942A4300A389
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E06F3C3C11;
	Wed, 15 Jul 2026 07:31:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471213C3C08
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:31:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784100677; cv=none; b=CJN6FOOsSBuswqHnxLsO6i/FcYW1vxPLubhPbJJouv03QFy7S0LYQ7HL1pjGhYvyXY7mR8VYpRK0tyU3csEmlcBiE9IpMDlsnZHHyTJfvhKHRktHbIz1WmRsMEb1/FNDIG8fxaHoYPVAmtNynu4Tz8TWlbR6OnMtrGFIuphV8Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784100677; c=relaxed/simple;
	bh=h8Ayfh15p/outZyG3S/PIYqcrbov9ckVFA754vJaIHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kvhbkbr79pl031p1/rH+0MwhHHKzgdZdakqeiIR2Yrv1IIMnuOfuPkP4w5YVPoVbx3mT+e4t8FJnXDmVqK22JL55DiZo7c9yTkmevGyyW+08USG5Wd7XuRSds3xc7aMcZXg39uog8Twl52V55XpdsQP3SzS4XuOF0JO7Jh4DNrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=flWivHx6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UhpPPZG7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lI1w2621208
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eVZ9ZigYCDlcDM/PZqVHEcpbio13v2AmIbxFezgYnAc=; b=flWivHx6DSNcEF4l
	3+WFGI5my90RIuFOWmXAH/VxAWTSY25H5DEk9L8jww59k0gz5NqgLobeUCCoRnPL
	hkVQWT2o39jdqbcaCjhudF01tzfSHGN+5+Fbp085SMJBeA5O9X5/il0/a6UU+JfF
	tFudpmaESNF+xHLhdbmvcYn7CS7pDJQJjpTGmwNQWk3N1aIbzWTvTKUYSBTPAs3q
	5p462r957NYRZbi7tD/hlVGkw/zqcastK20VjPhAxYz+1eWdIBQl1FaET4C08WPo
	5hVkFCG/XSgBf7Hhg8dVTiIG4IZsvjXhrSWwMu7ZFbJqrgjdtNA8gwVI40dshMNR
	/KwPAg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vh58d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:31:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e566bae1bso94929185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 00:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784100671; x=1784705471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVZ9ZigYCDlcDM/PZqVHEcpbio13v2AmIbxFezgYnAc=;
        b=UhpPPZG7Z9ZraniwaIRdU9Er0GrxvJLt25PFd+pJ3yN+R37aJRjU3y9RcFI8xzkVFs
         zEQUrghf0TL8SszpiMu613yk8HPL0iRW14rPPokoeQfQ6yZ/BHObJbbOtvGyf5rHnGgF
         eVMz+9IzSZHdf/8PO8WtXNjHBfts1kW6kApZ4EefXTG6mF/FlxunIK+pJJDyuCjtmBEP
         rWKtgNE0n/wpAYyNdngpcbmv5b/4PV7KnqQ0lqUfL0tQuV+YinpjKbYI/xxW3XjEWEmI
         YUqWtBNSLl9o8Xih4p0zLtMvXM8LtBI9ySHdImIqSCbEiQwR/2rngSVnQHAcRODIJmZX
         XuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784100671; x=1784705471;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVZ9ZigYCDlcDM/PZqVHEcpbio13v2AmIbxFezgYnAc=;
        b=qXQDWAJJaNB026jPXgtbFjBC6EYJC6aKYNianQYdd0H9VmT5nR5MsZscDUhrVuO2ch
         yaARX/Fb0QZ7m9egChoodW+iJ17JhZmedxAk+205jc+ZIjV28vBWpO5LrCvJ2h5/GP4k
         6Xtop1mF9PMLLkEk4I7+fZiW9pynR2S7BHLnerU0n7wT6VEO6l0bngZj/OtWgZFQ/jc4
         mc9cerRps6R77i5+QhIa8sRQgVNoKP6O0uJqVdWTrzXeM8NsLFPNzkeJg8n4/3bmIPLt
         d4nNqHODyfE0YnRGlwbnc9ingvd4laYKYKUsx/AfdWoMxMD5qZA6NCsI33PKnv5zwIZY
         VSMA==
X-Forwarded-Encrypted: i=1; AHgh+Roy3p3cDrzx/vn0ltz/KwN04yNkc0Iw7wUoRVyM8HU3ngQsY+sY36tMk9T7+2i3nON/JsU4FyMAfMqrT4Ah@vger.kernel.org
X-Gm-Message-State: AOJu0YxGEyEI/OQjJPx7b+x2epNbVWuBhm436xqFy/QceWREQg6XBBJp
	DTKYJtP9da94tXiMdigI+dYfXnHb90ydEFgQ8m2Pj1Hs3VAezcXesuMqo06vW8CZeUKS9smrNC4
	qO9KnpYbIVelL6cg57Pvkl5I4tow52OTkITQoLDCQm2y60r/0gPB9ujc4suu5VRhcVu3z
X-Gm-Gg: AfdE7cmnzBWck8MvOPMVkdHOxTVBkj0fDTYLDeIosvG/kY8jFhiNn7PSIo4fU6hl0rN
	5ZWkled6ly9iFiGRYyiIV0Wy3jikcgTN3IFdrRuRFrLeQoQaiDyFXAHfBpyHaVrgCQEJ2/dZXU9
	x+4RJsD4V/uPjwspny+JtkcUFMrrePDBx6mp4J7nCpS0Vbz1SdeO51E8tS0kXJDzaSoWzoe73Kn
	xfX/PwFNhJtJP80nRwCuNzYZgfqMT5H3l+b3TCqM18aDxNNtvk1wv/m5CWlyUwSiyBM4ShmVuLG
	p0lKIsBk1s3teqsygASKrsFSNynu322QOGnQtv7ZEr3Fnl9aQCPBjeBzWrToDbsAUCjD5Ct0GYX
	a4a1tM2fSa9W3avPkl2wgJ15CxcV53+EJPrM=
X-Received: by 2002:ac8:5d4e:0:b0:51c:1744:edf0 with SMTP id d75a77b69052e-51cbf289286mr135432311cf.9.1784100670972;
        Wed, 15 Jul 2026 00:31:10 -0700 (PDT)
X-Received: by 2002:ac8:5d4e:0:b0:51c:1744:edf0 with SMTP id d75a77b69052e-51cbf289286mr135432081cf.9.1784100670440;
        Wed, 15 Jul 2026 00:31:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15fc29937esm790840866b.22.2026.07.15.00.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 00:31:09 -0700 (PDT)
Message-ID: <d6cbf1c1-9af5-4c06-abd0-0617dcce0bf8@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:31:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] i2c: qcom-geni: Add dynamic transfer timeout based on
 transfer length and frequency
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260710161056.1799019-1-aniket.randive@oss.qualcomm.com>
 <e53ea721-bcd1-4d8f-9b7a-ea6ec3003f71@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e53ea721-bcd1-4d8f-9b7a-ea6ec3003f71@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a57373f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=lLXzRi4vikbFFa1iuNgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: i_fn7-Q875s3hvZEmM77yt-U4vI43jFs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3MSBTYWx0ZWRfX/vvpiRKeT6yt
 AkmqHjjTLPwGpErUfQaqO0IOCbFXzVtYrrHMBSMExjaugMKrCtsR2tymfH1B8bmhSSD1JUvqr4i
 RDkqwmJP2JKmmtE7s0wgmbGPoIN55UW7NY+qyeQwlU4M7XlNLUu/Ewq6vskRYGGQoidSK8yYle9
 gpWn6EUgyl8ZiqHGANdpDMvEcPawl+xt5pb/loxRBPBiG43BgijHFoT/3mM0UStW5pakg80XLFo
 buI343BCLk8OTn2+qCvuMOMEc3ZbMFLO4e2Bmev8BSe4PST3eTM/i7kZPNQtEvFzagpgeFMCfCH
 a2csS2lsSQ76fuycWKdXlLZiYsleCSHfRXoabPuGvJyyDN9hM8hOWFm8yI2NUlFkEtZVLNcIC3u
 HjwfPJExg+M6J6i6sAwb/8k9BHSdybqiEbYuFKVYcMY2rL6vDP+bboV1WrVn1IhFanVpgvRfnxa
 gYdP09BTGgBtEVX2BbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3MSBTYWx0ZWRfX/HZ+cjtpF7JD
 zXp06gxQI2YqshcSMnUiCwz0KmWp+eIyqlAT2j7U1OIbqbqMISbjRVglhldf9fP+g72DQhwwwlK
 6+A24lQEPxrB119hno5XXHvI4d5CiQs=
X-Proofpoint-GUID: i_fn7-Q875s3hvZEmM77yt-U4vI43jFs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119170-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C39E975B716

On 7/15/26 6:06 AM, Mukesh Savaliya wrote:
> Hi Aniket, Thanks for addressing previous comments.
> 
> On 7/10/2026 9:40 PM, Aniket Randive wrote:
>> The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
>> regardless of message length or bus frequency, causing unnecessary
>> delays on error paths.
>>
>> Compute the timeout dynamically from message length and bus frequency
>> with a 10x safety margin over the theoretical wire time. Add a 300ms
>> floor to budget for I2C clock stretching, where a slave may hold SCL
>> low indefinitely during internal processing. This detects real hangs
> not only internal processing but it may go bad holding SCL low indefinitely.
>> 3x faster than the old 1s static timeout.
> Meaning, in such case/scenario, don't need to wait till fixes timeout.
> I guess, 3x faster is relative to the 1 sec, but for larger data and slower frequency it may not be 3x. Hence, correct it accordingly.
>>
>> For GPI multi-descriptor transfers, use the maximum message length across
>> all queued messages as the per-completion timeout.
>>
>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---

[...]

>> +/* 300ms floor: budget for clock stretching; slave may hold SCL low indefinitely */
> Already explained in commit log, can remove second part.

This is very much non-obvious, please keep it 

Konrad

