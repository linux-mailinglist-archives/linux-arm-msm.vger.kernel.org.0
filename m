Return-Path: <linux-arm-msm+bounces-117925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2nQRFAZkT2pMfwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:04:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9600872EA78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:04:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AulfuAlm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CAjt51Pp;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117925-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117925-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 323043014508
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 09:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D923FBEC6;
	Thu,  9 Jul 2026 09:02:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BC23FC5CF
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 09:02:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587736; cv=none; b=Kh/bicyF47QSvnjFGhaSQE9hBTs3oDS5Ht5dyDRqhNlFAWmolamDiUcE4UEXug4fOOntfEDYbMlusOUdfS4oA4LO2kxfyobfx8PBxsLTHI9XZ2rkyEON5p9ktyRASiRIWFT7qrjpfI3nxI3/RrR1tlVc0/gEas9p8IOZyy/qrBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587736; c=relaxed/simple;
	bh=wA81xsBNTy6unQfj6IY1O6fqGPGEKdjYscAzKj9ls0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oEB76WQ9Br7qAySiLNRbardkxTNQPnHSRI65FvieDLK6MZPeKlv8Y8ZqA5Lho3aBpMezg03rAx0zn+4wIfBtqseEZOVmJp/hBYGFVOIpw1+EY1IbUP+gU9AeZpxbu/N6q8QkdFaqD/gwkY12zkO+m1lrc6GlzXL1BZxoaDveMs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AulfuAlm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CAjt51Pp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960HKm749792
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 09:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EOoqpkxalQnGgn2rNAM92KHFKF9kGa/rlb46Hia6Qak=; b=AulfuAlmG2nMc/yj
	QmLRWmYJZcbVBduUxmvmp/+QQOfbcw1XNli9D1qps4BTCWRJV+YgY+Z6/tA7Swpl
	YZdtE0exoFj6K8e+VJ1sfaEFl7/M4plsnVAvPX4Yoll8azBclSgTe1K7Zbp9h4Sa
	ztEjjJkSwy0Uxdx7NxiJqgZFvFPeW/49I2iy4ycArnnVmwQN9hGf+9HKy7VHEfaO
	DkdP5XTNJ/SRuEERvwY3TdRWwvKCF3r5aS+CPCbJcE/Y/KztnemFrKM9pALTWyVM
	332VS3PU2dYPIoDjpnFc/bqMpAkS2Ibh/DWKWciZQlb7HhAmpWh9Wr3EKt0iATwE
	MOHVcA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwft9mh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 09:02:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3810960140eso3213118a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 02:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587733; x=1784192533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOoqpkxalQnGgn2rNAM92KHFKF9kGa/rlb46Hia6Qak=;
        b=CAjt51PpFLsFB6/7TjVdjaW1296gHIFXOMOwdlUCl8VoNmE+dcUV8b4+naVEg75zk7
         ZZBuo/C/VD5PpF9iya4+TJEjhYv7YQ9kfUo9HskhP6u12kG3mPDIW7dFFqCqUHlAbh5Y
         LHgEno3ivy9n+ZbfGfzX6SrndDZMz2566+qxfGmV3z2EYG+3sPDD37MmKODH3fg+ulZW
         RlJ8K44lILfRo+5ud7HCn387bqMCPt8k3XXvO2DqGf1VHeYhTFm4xzrYraLtmyzVS4Hm
         ddPq7pqJBtXO7VnolUJxMwuZs3Vx2xWYuc2Sg/TpHUWPcdSC0c95qgQCHVlOviRsewGu
         ++iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587733; x=1784192533;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOoqpkxalQnGgn2rNAM92KHFKF9kGa/rlb46Hia6Qak=;
        b=arOF+uVdDsGLGw4rSYedOUU4aRQe3lHI2Z63T72xRKFCQi1II3KzR20vHPfhyTZvs7
         l8P+3qyLCkIJcujVcTZHBdDQrU2qLeYmfi4VU/s2HndHT+YlIf8HtCE5j5Ef2AoreVXF
         3E1E/wctV2lBSjrUUYsZWFCgz4h0KZ7YuUbDmdd+rhEHcT6OyFU6BtkL1jh0TPkEHNQh
         HZ2mgs7CCoyhlCzcOjeFW0IefIzfywqCBwqf7/iL2/Sw5kg/1Hcqyu18qvOPdw5WUtCX
         VyRhzDQKs3AbeFhjcJo0gfVkDWFNkC8ph/OZe3hQ6DzK1mFkyBZ86EdQzXEcGCy+OIu/
         i4qg==
X-Forwarded-Encrypted: i=1; AHgh+RpUT1PL+vWvEa9eILxS3TfvpPcVozHO+Mh+PeR3un5FyLhQ6pnBjsMd+OVS08r79dMYVkjvgV0CT9sv7tis@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8hUS3tVdjJuBg4UesIypQpaq2FMl0U3gMnmB++q8rdbsND4Bn
	61WOywpVxQmMhcujxxz9i2BqcZfavtnewPF/d1QthGB16Ki6jrlMpiMqIQjYwQMXGTFlOA8ytWy
	NagNIZ8cmvl5Zqv6GwhGotkGx4Jl5+I4snmVg6KQrJdOqYhGD2rGeWU+EAVnTJFK8eL26
X-Gm-Gg: AfdE7cl/a3Fus9/MtVnWZLga6D9LWGmmlenZMjL/egyE5b3bwR/z9lBEAgePKYRGVza
	MoY8ywdCdf7lEAnIqqGZJQymI/wJWdyTL74njPPAnuksl2dxmvD87LR/LEPY3FVKYJdSfhrJejS
	g446UKSsmQ/ZW2+G/Xt243C8OEs6aT8WptZAyGYAB1mZ5OC280bhDcdYmqsy2F2Apr3DJvWXVWu
	N6GDg1aMEXtFM3g5/bHDNkIxRqllSDNrSmoGYZd+33LA3Pux4AhX/ubObVZverGp91n65nTc/k8
	KTws+wzrS41oxeKCo1hONMLY/4OuDqgHJOr5MYgJ6PRs8TH7+UURynt7k534VR6eAhrBd6zAt8f
	qrloeNTJ9wT6EI92vpqtgRMTW7whVTxarg4ZOGT0DVSDCd/Jr3w/CkA5OviWCvsq2AXdl6b9n0s
	ne
X-Received: by 2002:a17:90a:d2d0:b0:36d:689a:cb27 with SMTP id 98e67ed59e1d1-38941cc7844mr6222187a91.24.1783587732732;
        Thu, 09 Jul 2026 02:02:12 -0700 (PDT)
X-Received: by 2002:a17:90a:d2d0:b0:36d:689a:cb27 with SMTP id 98e67ed59e1d1-38941cc7844mr6222140a91.24.1783587732151;
        Thu, 09 Jul 2026 02:02:12 -0700 (PDT)
Received: from [10.133.33.179] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a57dc53a0sm823440a91.9.2026.07.09.02.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 02:02:10 -0700 (PDT)
Message-ID: <c120ec84-c125-4dec-945a-da12624d82e7@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 17:02:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: coresight-tnoc: Drop
 arm,primecell to bind on platform bus
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
 <20260707-fix-tracenoc-probe-issue-v5-1-bf733ed9ebd0@oss.qualcomm.com>
 <20260709-versed-marvellous-pigeon-22e2ba@quoll>
 <e5876525-4568-43bd-8c91-6dc462b18fa3@oss.qualcomm.com>
 <02baada9-3f87-4e60-a469-44af5ebe1afe@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <02baada9-3f87-4e60-a469-44af5ebe1afe@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4NSBTYWx0ZWRfXxaVw1TznuaK0
 2A/N37dClmilxFBolGUlLVSsYOxU0+5Ek2LhPip0L0cALFOTfUFx4OPadfMstaLoaXu/U7PVKIx
 CR7lucPt7ZtQhgEmSj9Rtj/Ynd6xHGJqvKb153IDRU2WK7Hl8U+0VjxojZGreNsK/esCnE6f+Gc
 D2nwsgU8KDsEoNiC4+7z6eSwR/KD+b1qBcmwVk21vDUVkDAqqueDm6tqqfbBYwI/lrl7nyS41ru
 k2oTmzgdD/j8G6Au+Lge0MWl+uowJKF29VCchxtoQVO2ffqWJEOcUz2mJuZIwh2JLd1gOuo41VX
 6nVOOyz7n8BBFJKql9atSuAz0EjiEhyfQZH2+JtaPq5giPkQD9nV1hhZj+Nmf+02UIfh0sil0Sw
 oXHcVJwAaVq3B3CljAkEp3GxW+/HW539l8QIYb1mQxjObj9Ps2Z11M3mja1Zpw++GsVEcXZegjG
 8qmX3TeIKWXEvt3h4YA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4NSBTYWx0ZWRfX+c3EyIlEj/Tk
 aXs6AuOfUO+PYrGqygEsnCG1R/S4Og592dUQzrhAuP7xzfQqCyaO4KuFXWG6LfBc4XIFsdxgzJw
 2355kFJvVRbvdOtu2wjXcKVJX7IAJFE=
X-Proofpoint-ORIG-GUID: 3uJC2s9_7TTBHqLHn6YLHQohDAKUTdm1
X-Proofpoint-GUID: 3uJC2s9_7TTBHqLHn6YLHQohDAKUTdm1
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f6396 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Zyal9cr7WW2U8Oh0dT0A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117925-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9600872EA78



On 7/9/2026 4:46 PM, Krzysztof Kozlowski wrote:
> On 09/07/2026 10:34, Jie Gan wrote:
>>
>>
>> On 7/9/2026 3:59 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Jul 07, 2026 at 05:08:49PM +0800, Jie Gan wrote:
>>>> The TNOC compatible previously required the two-string AMBA form
>>>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>>>> AMBA bus.
>>>>
>>>> Change the compatible to a single "qcom,coresight-tnoc" string with no
>>>> "arm,primecell" entry, so the device is created on the platform bus and
>>>> bound by the platform driver through its compatible string.
>>>
>>> I asked already: this is not a valid reason. References to Linux
>>> structures are not correct here. If this is your reason, then answer is:
>>> fix drivers, by renaming or doing whatever is necessary to platform bus
>>> to behave like amba bus.
>>
>> The issue is that we are not allowed to introduce a DT property to
>> bypass the AMBA bus validation, which reads the Component ID (CID)
> 
> It is the first time "bypass the AMBU bus validation" appears in this
> patch. You do not see that as a problem?
> 
> Again, third time and the last: describe the actual hardware and the
> actual problem coming from the hardware.

Understood, will focus on describe the hardware and the hardware issue.

Commit message description updated like below:

The Aggregator TraceNoC hardware exposes CID registers, but the 
Component ID value read from those registers is 0 instead of a valid 
AMBA Component ID. As a result, the device cannot be identified by the 
AMBA bus and is not discovered as an AMBA device.

Since the hardware does not provide a valid AMBA identification, 
describe the Aggregator TraceNoC using a dedicated compatible string and 
bind it to the existing platform driver.

Thanks,
Jie

> 
> Best regards,
> Krzysztof


