Return-Path: <linux-arm-msm+bounces-115023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qPdDBa1hQmqe5wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:14:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7A06D9ECE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:14:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=W7MgTE8u;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LW4KezON;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115023-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115023-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74A2D301585E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E057E3BB4A;
	Mon, 29 Jun 2026 12:13:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BBB15A86D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:13:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735186; cv=none; b=GD1i7tRpNuSUFEiq4WVNgE50l/rJQRFNOI0WwDJo7pwbXC9vNkyO0J8Yx9Tp5Ezm0Eo1e8mU2dvlJ3MoAzfyoc88hBSTmukwa4mw/NIcYPra75eaNSsg/LFJTgVHxt328/+CH9j7TknXOsbnLED5SHPL3uHKp0AHoLh+jQ4k++8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735186; c=relaxed/simple;
	bh=WREysdBr691NZfx11yc49SQ+tj5mZqJ3+6r+Kpjn4pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CUO9vTeLOSPTXpP8NKwrGcSgMAHC0qlnjOrRQ+jK1kzrJnq4GOSXdHKjQIuX6B8F4JkBwtQwcZ3lGbN8yR8GdjO6uyQJgD+Pz6uCupKbOJLOfsH/qTB2xtAS/Ybe2shBPS+m1sYyqhctnsSHgOaln5cySYcwT3Fmt1zhuo0YCtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W7MgTE8u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LW4KezON; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATEe32579129
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/uaS7qRJI8R12UYCfO8jKUbFRKEmIwJPtmalvvKLMs=; b=W7MgTE8u6rNvamdW
	A9Q6ZjZIW70nDHvbbioqMu3kMg1Nd10w9gs4n4B38V5qeEwDbf8QoMD80rkx4BoA
	AaZS7Etc6HiGsWRLDRRe7G+hUKvLSytJdLC6GQy5RQP10xZLJ3/BLsEkzAtS91vz
	VTlwNc/XB26b8uYyNUPoaMO3maM6DbU+0JH/h50kUuL2Di58n+pfTTSej8XqXWqe
	sBUhSfSG3pHQWCv0c4XkCS+ftNA/K6fUrRTpSSVYDq7TdGglarzwPB+IPWoT27qh
	FI1u0Zv0+B+OhBhCk2RYfoG4vXwEIwof4zwRXLfU/mP2gb2xecp4cHbZC+gv3Cq9
	P86IcQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7h8bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:13:04 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9692160501cso81582241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782735184; x=1783339984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/uaS7qRJI8R12UYCfO8jKUbFRKEmIwJPtmalvvKLMs=;
        b=LW4KezONwNMugla0YiMlrGzfjFFzK/KPGGBNgLKCQ2GoBAeiUjp+nug2LX2UIS7NI6
         RlAx+2T6OSihHQR/XAhor8ircBZdbt/xcGpknzm9Lm+aNDWdX8z9Vru5X9r/bYlwwnH/
         TsHbO79QZvNEIGlkxVB08fwy3YGWwh3COGSK/KqUG5j7mHAZUyGdWEKvYdHmdlDae7iX
         MfL6aR4C+j4gQGqXZqIaO1UzljISt7++pTWDDF0vm5od3SqsSyAuXW5p1WWDg3jWRjsU
         aFLvZ+dZ7x3zzz4UnTdRhZqokj9FVgOt0LkIgaMgc0gI741ZucQyM7m+cHvBmAcAdd6z
         BUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735184; x=1783339984;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/uaS7qRJI8R12UYCfO8jKUbFRKEmIwJPtmalvvKLMs=;
        b=CUMJiu6tHteU8gV7ft6pRvfuWmjWi4lItbjhvNxpt645Vrv2XjSYX8gx1veTQYEe2l
         mm2uFP2a9iLjiPkyVUxMhtup9Gc3JMBi5qPtlXCSootXkH5PQp1CFjpQBufryhCMZu9h
         JtWAoH/+PsO6U+Xg9N3AS11C9cJ6cCwQ2r8NVFBLtIZurC1YTVHp5/mZUDDus5xKmPVn
         yS2/lo+CaaMVLJtJqFN9wRrMNENWnGVPFjQUQ3gQKKYIDhMJDMgi/cYRSDTCwx/o3RIo
         rPv5ki964pn0MV5Ml6oi7aDEiaS/6m01pNgKksrIfpt0BWNNoQNgTkjYRQ7cmeMb8kok
         2ByQ==
X-Forwarded-Encrypted: i=1; AHgh+RomGn+6aY2J2mxFIRHIF0Cs/gR5DU6/M8jdugXkKlxiTnEVLdzdKNwf7vKjFI+CCXfgDPHsz3ZDYcQiNKoY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx11Cf6qh/qYZakf6n4zW1rkUGisyzPToxGQ/3fEqVRMadD0Cp6
	iTLS37lp+ZVbH4gdQ45L8qhpDQ6tzPfCFAMJ5eYHnchoFBBBKeE1QkxbWW6j80lvVK+sGKWOIyq
	8zq3DBcSSVbtuoeENOP1qrRS181xmhMgUeJmpj+UoeTTymz9b1Jqo9XqncVJcaUxKBz+sg7HUDG
	HO
X-Gm-Gg: AfdE7ckR6Ep7A2gPKZCt1Mk1uzED9jSfFUp8lS7kFEkqaw0CADApRgViakNSv5y7KwT
	gA/WQvBVmW+3AtSLuGUXtmfVW+zsAI3Zh7ce4fZw9mjxAk5bIhCjMPRRb0kg2eY8+uYXVzkBeD3
	C8xpfcUkzS3qgpcvCxY/atDv+g1wta6kJVA1bAR/OC7YwlwbDKmrwvSy0aDrGaTNqG2FcLSDCDH
	5zYwByNIc/yyo9WUKYlbYcgtDJRWCsBBAftiHDw3s+LuQ43cuEeukmymwSp2fCCBphnGwze/hyb
	3bUZH4TrZZLA/ooINCrUeaSpKVcjbGbS3hepFqJZTpIHL3aR5b9tC91Vxt4qwjc0+MGC0JEsd98
	O3zZSut/qtdYcfFUygb58mDMrvJI+uQcnwvE=
X-Received: by 2002:a05:6123:5c8:20b0:5bd:9565:2e8a with SMTP id 71dfb90a1353d-5bd95653060mr664840e0c.1.1782735183621;
        Mon, 29 Jun 2026 05:13:03 -0700 (PDT)
X-Received: by 2002:a05:6123:5c8:20b0:5bd:9565:2e8a with SMTP id 71dfb90a1353d-5bd95653060mr664826e0c.1.1782735183128;
        Mon, 29 Jun 2026 05:13:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3ac461csm6870601a12.6.2026.06.29.05.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 05:13:02 -0700 (PDT)
Message-ID: <0d4fa333-df22-42b9-b9c2-ccb43ac4fac3@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 14:13:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] regulator: qcom-rpmh: Add off-on-delay support
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Saikiran <bjsaikiran@gmail.com>, broonie@kernel.org,
        monish.chunara@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        lgirdwood@gmail.com, andersson@kernel.org, konrad.dybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
 <06a264d0-6a14-4b71-b783-82b771f04411@oss.qualcomm.com>
 <oa3okt7mdhoqmrebwim5yswarbcacbmhpwfvqbhtv6ib3cwrwi@ddox6mw3uhmy>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <oa3okt7mdhoqmrebwim5yswarbcacbmhpwfvqbhtv6ib3cwrwi@ddox6mw3uhmy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMCBTYWx0ZWRfXzd96RkMIbhaH
 fi0XEsB0XAQ+GadC9dD4j6ESNmT0tKLqJ0yGR2RPNSuMGQQoOj83G5WjoIU4RLv/zNrwOO9VcWf
 trEf/ypUwIwHmKvOnqpWQR8/Rn6kqGE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMCBTYWx0ZWRfX3EXb7sDT3tbH
 O7fEONGKQ9DvsZljix8g0JFLqKTLvOETdGzN16+cDDmXLbhTXVpsUYLds5Ecdxn4Ic5073cCBwD
 hSH5YwZfgjmcFBZofqp+LgSwNx7tlf43yQEgHBTfltyJOaKtpc5b33FCccLUmL074ohhxpRC7Ob
 SsX3nVhNUZJPq7vW/cxLidvHI3ODBjp1kLAiGha9wmbUmwqXD6Cc6i6gI8wLJhG7v+3MmLIRwgW
 /aAZzGI7jasTPWhLz0Yrge3QOiwzjY1WiCS4bTK06A2e17q/FP0W25uGTo4bD+7/D1t0UaTkhNQ
 EGz0394y5D04RBPXQ5Y/oQOGDXNd8MU1sWSgrbtZ89o1A5aVlnLflA/rmVxhV1Enq8TZEaRJ4Hk
 Cg3Zm2YhqjZ0x0IC/RF/yp9ibjgYiSuTbUdZrCYBr63PgiddIBui4HWFZ3iC4s9Uapmoaksv8eW
 OeTnRMW3T7YD3T90Rxw==
X-Proofpoint-ORIG-GUID: 5Wc0yz55qnfVDI9rlBp9lKgaq1N2IS_3
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a426150 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pryAGsrBFMLCAmXlw1UA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: 5Wc0yz55qnfVDI9rlBp9lKgaq1N2IS_3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115023-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:kamal.wadhwa@oss.qualcomm.com,m:bjsaikiran@gmail.com,m:broonie@kernel.org,m:monish.chunara@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:nitin.rawat@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:lgirdwood@gmail.com,m:andersson@kernel.org,m:konrad.dybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C7A06D9ECE

On 6/25/26 12:16 AM, Kamal Wadhwa wrote:
> On Tue, Jun 16, 2026 at 01:48:50PM +0200, Konrad Dybcio wrote:
>> On 5/15/26 1:16 PM, Kamal Wadhwa wrote:
>>> On Wed, Jan 28, 2026 at 12:32:09AM +0530, Saikiran wrote:
>>>> This series adds support for the standard `regulator-off-on-delay-us`
>>>> property to the Qualcomm RPMh regulator driver and updates the
>>>> corresponding Device Tree bindings.
>>>>
>>>> Motivation:
>>>> On the Lenovo Yoga Slim 7x (Snapdragon X Elite), the camera regulators
>>>> (LDO1, LDO3, LDO7) have large bulk capacitors and rely on passive discharge.
>>>> When these regulators are disabled, the voltage decays very slowly. If
>>>> re-enabled too quickly, the sensor experiences a brownout and fails to
>>>> initialize.
>>>>
>>>> Verification:
>>>> I verified that the core `drivers/regulator/of_regulator.c` does not
>>>> currently parse `regulator-off-on-delay-us` in `of_get_regulation_constraints()`.
>>>> Therefore, the driver must parse this property explicitly and populate
>>>> `rdesc->off_on_delay` so the regulator core can enforce the constraint.
>>>>
>>>> Changes in v3:
>>>> - Added Patch 1/2: Update DT bindings to allow `regulator-off-on-delay-us`
>>>>   for `qcom,rpmh-regulator` (Requested by Mark Brown).
>>>> - Updated Patch 2/2: Refined commit message to explicitly mention the
>>>>   passive discharge and bulk capacitor mechanism on the Yoga Slim 7x
>>>>   (Requested by Mark Brown).
>>>>
>>>> Changes in v2:
>>>> - Moved the motivation/context from the cover letter into the commit
>>>>   message of the driver patch.
>>>>
>>>> Saikiran (2):
>>>>   dt-bindings: regulator: qcom,rpmh: Allow regulator-off-on-delay-us
>>>>   regulator: qcom-rpmh: Add support for regulator-off-on-delay-us
>>>
>>> Hi Mark, Bjorn, Konrad and all,
>>>
>>> We have another UFS issue on QCS8300 RB4 EVK, where it seems this patch is
>>> helping.
>>>
>>> Issue is seen 2/10 reboots and it happens in the UFS probe defer path:
>>>
>>> 1. UFS probe takes regulator handle for VCC(vreg_l8a) of UFS host controller.
>>> 2. UFS probe enables the regulator
>>> 3. UFS probe defers (due to some other dependency un-related to regulator)
>>> 4. UFS regulator disabled on probe exit
>>> 5. UFS re-attempts probe and re-enables the regulator
>>> 6. UFS init sequence runs -> UFS NOP OUT command failed (no shell) 
>>>
>>> Issue Log:
>>>
>>> [    6.583836] ufshcd-qcom 1d84000.ufs: ufshcd_verify_dev_init: NOP OUT failed -11
>>> [    6.592780] ufshcd-qcom 1d84000.ufs: ufshcd_async_scan failed: -11
>>>
>>> NOTE
>>> - Issue is not seen in first probe attempt, because UFS regulators are left ON
>>>   from bootloader, which gives enough time between rail turn ON and UFS init
>>>   sequence start.  However in issue case, it seems re-probe is happening too
>>>   fast, which causes init sequence to fail and UFS brownouts (similar to camera
>>>   sensor case)
>>>
>>> - Also, we compared this board with other RBxx EVK boards for UFS rail, it
>>>   seems that this board has more caps on the VCC regulator, as the board is
>>>   designed to have both EMMC and UFS, and we have DT option to pick one of them.
>>>
>>>   So for EMMC those extra caps were added and they are impacting rampup on VCC.
>>>
>>> Since this is not entirely a UFS part issue, but a board design constraint, it
>>> seems better if we handle this in the regulator side itself, as adding it in the
>>> UFS driver may not be acceptable from UFS reviewers.
>>>
>>> Please share your opinion, if this seems to be good reason to accept this patch?
>>
>> Is that board in production already, or is that something that can be fixed?
> 
> yes, it cannot be fixed in HW, as the board is already in production.

Re-reading this thread, RobH's worry here:

https://lore.kernel.org/all/20260129174829.GA1324020-robh@kernel.org/

seems to be misguided - AFAICU this property would be set on each
regulator separately, not globally for all regulators under a given
PMIC - is that right?

In that case, I see no real downside in allowing that, especially given
it would/should be used sparingly and only in cases like you mentioned
where the board has some quirks

Konrad

