Return-Path: <linux-arm-msm+bounces-113824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZyusH9ABNWq6lwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 10:46:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E4C6A4B16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 10:46:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=g60Te3VQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q6HoYynS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113824-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113824-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7930300A7EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 08:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CBBE3603D7;
	Fri, 19 Jun 2026 08:43:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF5A3546FA
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 08:43:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781858619; cv=none; b=o4mIrdRIi6oi9EoGAOApdr0ua7mxSvStptRnSCXSWjQhnGLSecbCvKGFJbWxhflenHHx/XEhO8Uc2rSxzzUpi9+cTvWLEXiMJYDdoN5sX28+T8B65CuZ7o2L0VyYny9ORfdR/cgYum9yZdlo6r7a7WQXoTs8QqvwDaNTSQbhL+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781858619; c=relaxed/simple;
	bh=bc31Yr5ghRJg0f90YIfKarYrpbtyGTI2c0LzMXhtT/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=llPpz9XFVoV7Tekgyq8Sp++6b7BesOYH0QCPsyfmFPKgUJGLZjJoHIswwQjshS+BlVgaSz5hOe1ew8w3nfGUa2hTzSjFA6hnKOqP+6R9U68hHCx4RF+0MSqE+kDSHmCWgkFhMDhh3cFB09k/deK2WVLb1iwhHT9W7239pqA3g10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g60Te3VQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q6HoYynS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7PpHR006979
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 08:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Km4wby96Y6EXgbIfd/nWraW8VyrR6b3sietG3sRGZdw=; b=g60Te3VQVRD+d3SI
	eAg2m9qf8KMNl4XoscJ2nFhZ65TWJYcplYvixYInSKPiw7PMQV1pOiURi7/V9f0T
	beu6n7qHbl8oFqYO5PxG5WCHQpVbm+NctmRK1Weg0OUDGso5XJ8IeV+oefYi+X/4
	3GgYp1FlMzFr07r97Dh0Dlcf7vaVZavuPa98/FJ3U05JjFCri2Yt+KGOxniVo+Hb
	j1ifMUlmhob6KW/BzjxserpzFLUeOLEpKK393VOzDACYzva6wHosPtpitLz60Gep
	LrHPxyJIvAmtZ2/95j05LXJAbt1mcN0lXDx9l7UYvsAzExEBSUCYAhVMAxN2xAls
	ktzwxw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm20k8vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 08:43:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c69f08f527so18238205ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 01:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781858616; x=1782463416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Km4wby96Y6EXgbIfd/nWraW8VyrR6b3sietG3sRGZdw=;
        b=Q6HoYynSfFYAuuxdwGNdohuoMvFE73cLjrimW9I+CJ0elGmwjG2+9n3HXmIZaTs7Zj
         cEU+pUWBru6XDQn4MtnzH9uWUmFr/DcRBSEGWsvc3XVryA7MGpnwuO4NvwqwszyBrMau
         X3boyZFBISLP+Q2frplavbaweruRg1PeChQKI/bEGRbHT1pqoPhopkRNmMNcbACsiH9A
         rf+VWU1PK83pvyeD6ZaXEwMXfqldadsfY4JvAKlKqOzhaoihuN99GWtrDOrfHkHGaBdS
         zppVOigpPDG7Ea2TkzojT8ExGG4qSGSX3CL46HT7e1kf2c6+0sdNGlsds8JiIKwAzCEw
         sh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781858616; x=1782463416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Km4wby96Y6EXgbIfd/nWraW8VyrR6b3sietG3sRGZdw=;
        b=qOMshryng7XtSnKNs1lweyEj0JondQP5RukoGtfC+u4Dp7IStJEzFWSU0oR/jkf1Mm
         /1l/U3XduwobCKCV0QM4kHuwaLhfguCaC4O0upapJWOcRA1vFElBbl8/WJeHmZgrH9NH
         PrVJYE7IxqIylggiV9Wm94c1YU6ctILfVtmHftwQis+pd/3Wg0vr98rBXzafUZYxbvI7
         RFtFzJqFbQimvGyeEOLsFtGSENPnh8FP6WrRUUVVYlPaHFfe/cqPB2pLZZjw5szZ96dO
         RKe+hST6wBEiaGv7J8/n5VJoJ+mlFaERlO9f+/CUCaPVbqavcSQUxceY1l0gxykUfyAB
         fOBg==
X-Forwarded-Encrypted: i=1; AFNElJ/vG5pR6I1BFf27YkAXI4IQo3LRxGTpit0bth6L8NNWHWLeV8zpyJJCFTtSEMTbwzI6PYqJ+7WXvCOMv/k5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxikea3IX/7gsk9u/UlJlXCoVWcqXy8Waim+DMYFvAkgJxi8H74
	vFvh+aDGMXiCBPwMvRHif1NE6APAgPXnBm7LRuEybObaihbhSMbDdy5D0SX4PzgKScBPwuOyhAq
	PlDjKukq5pPmZqEZmC9m77KxSmNIsL9pnS//RH0r7NIo9YuBSanfws89Xxudf3NlSCUGz
X-Gm-Gg: AfdE7cms4Fsj61YSl9THhpi+7ySLoVXCAMilFLv/dkbhjqBGa4YJGZHWEwF7OKyp8RU
	OFd0shQqCOpYmediGb02x55LgwKvV9wx2RK4R/MBVcaIaxFMLYzaRtnEr/dlkjx/rM40sGYCerp
	uVQpEXHnc9EsM3dOGrN1nHNPaA65fKq+9L20VSQ3IhblLcv0ck/sP0umwHdRYlPUQUCXurCfXuD
	KQbNlJENiFLAMdJOEBYJsullkasDuvskdQ95MVqEXbwj15lr5IfI+yhLPA/g6aHNv3MsSaR+YGk
	Fs+U66PcmmXCSd1kjUV+rVajxZJBLlIx50gHfVd0DoKbYJRuRLnX5qYmWcYQuiEHzTcZjYMUe+2
	L21/6PVtzsLv0yvpAqaUI/yigJDUskNMNW4yRqLsx/oE=
X-Received: by 2002:a17:902:e947:b0:2c0:e7bb:9081 with SMTP id d9443c01a7336-2c71904bfdfmr30535725ad.33.1781858616324;
        Fri, 19 Jun 2026 01:43:36 -0700 (PDT)
X-Received: by 2002:a17:902:e947:b0:2c0:e7bb:9081 with SMTP id d9443c01a7336-2c71904bfdfmr30535395ad.33.1781858615850;
        Fri, 19 Jun 2026 01:43:35 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c72089c377sm15930615ad.15.2026.06.19.01.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 01:43:35 -0700 (PDT)
Message-ID: <53b1fa61-9692-42fd-a295-98bbeacbcd9a@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 14:13:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Shikra: Add DT support for ice, rng and qce
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>, Eric Biggers <ebiggers@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
References: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA3OSBTYWx0ZWRfX6CrmZpRO0i3d
 zWbMc09nyDOkbsNdtG8Re+efXzuW1ob8oiLAyOQ6LHVQGh/AcB00QX0ZBdMGH68m4zfAnso74AZ
 V5j1qjB6k4sv45YnGSSnkegRzfNnYwOV+cJVyCBWTIIjqUG44QUqkRlEQTpXU8TU1f3IIXlHwgw
 pxuUSbY0zF/0GHmEgKv/yZPyzdhBt7lJuyseSlnb4E//aZgWV9ACW18wMCFnx7PqsIVQGNh6Sx7
 jUEKQrwI78djzIGI3nqTGLVJJAYpc2G8AoaIiyqhMuZQk0dnE5VWI2YPReaB+36Yhm6w8GFZ8d2
 pmejLhGrNHadqUCjgIci+6PHa7WSXPYAFz36gYCN0MXk5F2GoehoJdLJ9FHEy8nxNsIoHKJCkWJ
 lNq19+sYYUkzrVJ5kSBnvDUTsJjU8WINbhhsNij67nlgQAHLC1FBHrl50+g0IkKu9ryBGD20HNk
 ZvGl/vvQNOvFa3EWeHg==
X-Authority-Analysis: v=2.4 cv=GKw41ONK c=1 sm=1 tr=0 ts=6a350139 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DP-1hcgwhx0q92eQ_pIA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA3OSBTYWx0ZWRfX6ejyOclOtPR2
 4Zr7wtACXE6H7I9lKX+s0g/p8A9N6N6y6rQQEogddyKqygXLMAG+efibjVYFXjDhg3UePcR43Ew
 RAC4ckhlTgYLA3DgRy7D9HjGbCMxz3c=
X-Proofpoint-GUID: xt0Fg7uD_pvirsWVbOBW68MyAtuSw_nr
X-Proofpoint-ORIG-GUID: xt0Fg7uD_pvirsWVbOBW68MyAtuSw_nr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113824-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:vkoul@kernel.org,m:thara.gopinath@gmail.com,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:ebiggers@kernel.org,m:harshal.dev@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34E4C6A4B16

On 21-05-2026 18:47, Kuldeep Singh wrote:
> This patchseries attempt to enable sdhc-ice, rng and qce on shikra
> platform similar to other platforms.
> 
> Previously, the 3 dt-bindigs/DT changes were sent as individual series
> and with feedback received, clubbed them together as all belong to same
> crypto subsystem.
> 
> Here's link to old patchsets.
> QCE: https://lore.kernel.org/lkml/20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com/

Hi Eric,

As selftests issues for QCE are now fixed[1], so shikra series should be
good to proceed? as your concerns[2] are now addressed.
I am waiting for merge window to end and will send next rev post that.

[1]
https://lore.kernel.org/linux-arm-msm/20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com/
[2] https://lore.kernel.org/lkml/20260522024912.GC5937@quark/

-- 
Regards
Kuldeep


