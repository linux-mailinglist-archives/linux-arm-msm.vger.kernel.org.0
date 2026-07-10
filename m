Return-Path: <linux-arm-msm+bounces-118213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dvaSChG9UGqA4QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:36:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F99739215
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:36:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bEQZwyc8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F6IO4rya;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118213-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118213-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 577133064A9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA573F1AA6;
	Fri, 10 Jul 2026 09:28:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DBB3E2ABC
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:28:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675685; cv=none; b=k5/6dbszrJu7chvICNeP4Mkmkd/r41/p2EqBK81bmlRrPn5zgId4f8PLOw8GkIYriV5+lKb8Vv62CgwKxWq/N6m4/SGH16Gc6sJGTf20tvdiiRODkhONKBVPxkkULes+qo414EysJBndb2W1y5NAK17kAeEfrtnHpFsGERx+QjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675685; c=relaxed/simple;
	bh=3W9St2a+jKGkGj0S5oGaRQjvJtDzomLECmfwJ3GV3XU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ExGJ/wElnwHPNlWFWpEiEqlaTYonhZdht9+qGcReym5cI2MAcvx3hpqL/nP7o0xeU9MuOnS87ZUsHuhq0aBT7MFZPc7evxH3g9XdSDuQ+wL3W5rwCIvemkktVB+seZXQU2E6xadt2oquqRDUCiT+Okh+1SJsLr9H5rac/H3JsSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bEQZwyc8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6IO4rya; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7eHTq141466
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ea0QguoYL7HAG5QOZUHhNnUFaa6FuT9iaUs3b0VOK4E=; b=bEQZwyc8XDMXAW5T
	oEMWxvv0TPUNE+xjii/lGQs/yn9jua4T4pq8gYMXFaVqqv3cUCllqk9RRr0FtlZs
	FW6ncGBWWy53MmpI7kIlvuWR6NXQUazvB06l2jzszG69JXWFEvdVuY3fgJ6eTA4G
	kdh9ZpYO0R2TKghzi+ltSI7N1ljdtrWw+J8S9jvXkmApG9tpzHh/L7TMc7hPjw1X
	TIAWCIOdl2RbUMUEMI4jHB5vGnw7hkUeKicM/4bxTvqg0FZHIg59pjpn+27e0m0v
	sg+BieWuHrm/sC0Y8Rz+0LwssX/yp8NpboriYdS06O3QH1fTG5W26EU1MIvGL5Zz
	Pz25Zg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf5muhq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:28:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ca37ce4c3so2081311cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783675680; x=1784280480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ea0QguoYL7HAG5QOZUHhNnUFaa6FuT9iaUs3b0VOK4E=;
        b=F6IO4ryaLWtGoxWuuRSr1Khcgk3XEP+a0s/k4WOPCBGahPDcTnjM3XX9dc2FqI8188
         dwZbsp6sP087f8Q3EnEhhl8zrtW/QDMk0i63h4HTRvYi9wbEFy93ujqL2Ld+dsB4lc95
         RPOtFJdu3LwXQWW9gUjAJrE/DgLPXarfkDrWWX83PZjZRkW4R1/5lEhGyTgYff9xpl/+
         V+631fh9W4762qRZtY4y5qRlXBKO9lM/ecwTWhqvqgkfUlJ6SyVUsdEsVh3TZY3nGHHQ
         n15xg2Y1gBVPkd/De2E903IpnQD1fDCammJwTRcO+rfA0Iaeg3RNLGAWHdu9sLpHbkXe
         oIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783675680; x=1784280480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ea0QguoYL7HAG5QOZUHhNnUFaa6FuT9iaUs3b0VOK4E=;
        b=ewJF3Xch5ReBC88qa+Z5EZzSyDe499DuTCVApPfCSaMsZm2lKW4hxftekmMkQpfwjL
         6wIFoUu34yCPASxxOgtUYlBEZj3hyHHmxka12PIINl5yaTwX0i1TxXhiOaN/jn97IXed
         eMOcEITGnylAXLFG1B7DFOBPSNd1q/XYenKkob7PZbhn8Hx18+DTAWW4q/inKhAo8Ewg
         /pqZV9tZq9mPq7UkYfgk4nnlGDciuW//4SHyTn7gC3YKKICP6xn4xFgQ7XfiMJxQ5rWJ
         q6JScrmRVOxgk0kDwnQPAoQK0K0EadEfHraPKtll0oVeiVGt0KxsJ5wUIiCyYdrg7Xlz
         9KeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rok9X0rbBroTPnRXicgELoB4HE9pwtJW3fLtM3x+PvTg2OoVeGFWn+tkSdN68zjQtEgcWR6c2wbvjNfyfcL@vger.kernel.org
X-Gm-Message-State: AOJu0YwyybY6Ue+/VyVjRwxNOPF9D3Irz+wIeF5+C2EFIgcMid3+O2zI
	81KD8DyLbZTED6/Ok18nCu4MpxLG7ZNEY15XpfJN/fhJlxBvmySEIUhzbvVpJH5SvPIqVLb28Lz
	cPT7Yl81CvaGfJcGg9WY5zMyuSc5CyKs4ZFK6+WDiAs6I5QFf0+VZCexngRm45YGBjm3o
X-Gm-Gg: AfdE7cnPQE6QldYo5ghxzBPtz8a3pPdo6FQExwCZcIIu6Mds18l/C50p8yJ/PbMJX3O
	Pt+52EQhn/RO5jl6cWiDJJbJKXXh415wEW6dTLBxKGuSy56BVPm8aVJexPgrMtlymfx/dy0+UUI
	cAaSHh45BUISlwgEL1pLWikPBsrEkURzHMUCLgLSTqv6pnkjMR0JaEONkleRP2T+zFGAG0oECsY
	hijdSpYqt2PfMpe58wcfoCWrANMEDe/WgPyVXnXH4JQiw/UUHUIaIljS91G+c2L7oSP5cj8oawy
	w6IPs3N/hua4LrB35YcWs7VGa1tk+eZ/bfTPgBlAlDomU64ZpQ3SbfFh+K/+i1aDuTOi351bFpI
	k9wjGSCs+Cd7YJA8RRVx91gjc3L+QAC+SiuE=
X-Received: by 2002:ac8:5acd:0:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-51c9684058emr68768661cf.11.1783675679847;
        Fri, 10 Jul 2026 02:27:59 -0700 (PDT)
X-Received: by 2002:ac8:5acd:0:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-51c9684058emr68768501cf.11.1783675679321;
        Fri, 10 Jul 2026 02:27:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15cfac0f76sm402966166b.33.2026.07.10.02.27.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:27:58 -0700 (PDT)
Message-ID: <82326bd4-59f0-45b6-8f06-38896cf9f9bb@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:27:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: qcom-geni: Add dynamic transfer timeout based on
 transfer length and frequency
To: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        andi.shyti@kernel.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260705135739.4038826-1-aniket.randive@oss.qualcomm.com>
 <4f865aaf-a400-4dc6-acaa-80dc22a36af7@oss.qualcomm.com>
 <6b53fa97-0fae-4ba2-a774-ae8df2c2ad4e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6b53fa97-0fae-4ba2-a774-ae8df2c2ad4e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: M0zfijSchWAI_c58B5aj_utXqGuhCmhS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5MSBTYWx0ZWRfX0pe+qA2MVRya
 xsNQLr22R2Wi3Z7ZQCEfjGc6X1ywimpnypag/t2c/jEgrMX/mJfie+OK/+Jxms7L9tvo9/Fjn+L
 MWAzzoH+mslAtEh6P5ojFBsA64NcAWw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5MSBTYWx0ZWRfX38y9+uOT2k2U
 3EctauTkwlKB8GWdQ2UbkyR995/yN109RWj+kDsbmkMSw2c/SXLq+GGWzAZoRSJ4exqmKeAK7rG
 A2OB7jmMioI3Y80WVo4APekZnV6B2mqAUxJ2veGTsdIPPVWRzmdVjqj16ehHjxJEE2uiQF89FBd
 S/g7WYcm6J1Yh3FBFZ0pxuaYr2nB5AwllzJU21xT+vZAVx0vXvQ3M7jlsszJYYBsQsdkw2x/rXG
 TyT+g0t1wkuqrm8VftK1Zrh9+m7yU83pPHTYvnj6iIng+9ZZNM/LRRY5d8ehPiSonagoe2f4o8A
 VVbplirF8nRpx9fox13FpjlWQlSiE696WV8Vf0ibabgDZ3wWcHa8ibSyVgLsjZNtKDult35nRIo
 HOrwCJ/wI8xtYkQ9cYavk0vxgIGsZza8EsvrgOknHb2Lfj2sGP245krAPt0/eJ/nVIcSBhOoHkb
 zrF0t0VgJFYnQymr4qA==
X-Proofpoint-GUID: M0zfijSchWAI_c58B5aj_utXqGuhCmhS
X-Authority-Analysis: v=2.4 cv=N+QZ0W9B c=1 sm=1 tr=0 ts=6a50bb20 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7-yhJlWS37sO_0-qT9EA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118213-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:aniket.randive@oss.qualcomm.com,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76F99739215

On 7/9/26 8:28 AM, Aniket RANDIVE wrote:
> Thanks Konrad for the review.
> 
> Sorry, I missed your comments on the v2 patch and ended up posting v3. I'm happy to post a v4 incorporating your feedback once the discussion concludes.
> 
> On 7/6/2026 5:11 PM, Konrad Dybcio wrote:
>> On 7/5/26 3:57 PM, Aniket Randive wrote:
>>> The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
>>> regardless of message length or bus frequency, causing unnecessary
>>> delays on error paths.
>>>
>>> Compute the timeout dynamically from message length and bus frequency
>>> with a 10x safety margin over the theoretical wire time and a 300ms
>>> floor. For GPI multi-descriptor transfers, use the maximum message
>>> length across all queued messages as the per-completion timeout.
>>
>> What's the reason for a 0.3 s floor?
> 
> The floor accounts for I2C clock stretching. The spec allows slaves to hold SCL low indefinitely during internal processing. A dynamically computed xfer time alone gives no time for that.
> 300ms value covers worst-case stretching while still detecting real hangs 3x faster than the old 1s static timeout.

Please put that in the commit message and possibly in the code as a comment

> 
> Thanks,
> Aniket
> 
>>
>> Why a 10x safety margin specifically?
>>
>> [...]
> 
> The multiplier covers the gap between theoretical xfer time and actual completion time (DMA descriptor setup, interrupt latency, and scheduling jitter on a loaded system)
> Without it, short transfers would have almost no extra time before a spurious timeout.

Likewise

(Should there be a constant safety margin added to account for all
that? Keep in mind this driver will run on a turbofast Glymur and on
a notsofast Agatti so any numbers that depend on the processor's
speed must be reasonable for both)

Konrad

