Return-Path: <linux-arm-msm+bounces-113200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G5pOGuANMGpTMgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:36:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0386873BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:36:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IIIKCZUO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RP68iyYT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113200-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113200-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5410302B09B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690653F5BCE;
	Mon, 15 Jun 2026 14:33:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB5E3F412C
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:33:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534006; cv=none; b=M3A2+U0o4YSr3JfCqUS6E/xPtY/dLpU/8BKnnhlCzmyXYsakvzazZwQX3XRK0t2TV6LzQLhODxEcZi4UV6C3vAATRco7CnfzTrwPtQYlK3e1HETowl+x7U9alSPTsQaymTkKzWmaAMuqjT1KL4dFCka1dVPILcMnEPS66ihznqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534006; c=relaxed/simple;
	bh=MA2HC+nJuMiryx7fCp6ddzKKGYKPWzCZYFTJWhzzEMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sz6/hvRAucEoLRzua3t+QH+UhnolHkylSC7YDYCNPbsGxp+vABUbKSjS6DSJSArZH7n5VZiLy3dAECDB6yp10HAwFl7Mm59J5Z9iyHUzxSG8mOx3pKXN84hQj3mFWLAS6c90jagLrzMm3p4v1p06A4E1ElkeCSbK9AKd68bhDb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IIIKCZUO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RP68iyYT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCZhUR2713452
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dv9ZEji4B7BwWDkbahrAwa3+NSTzy2uFpYlUp/k2i20=; b=IIIKCZUOuSR0VYK4
	Gf+utiApakgUA5qcs85b3UpmsFTr/tBUAWA3O7meipFTIwDiq6ITlxTtNoh2Tfbd
	7Q2DXAP2QniCBWFpuB+SzVc6SmBzW9Pdg7/cxMmmvZKpEub0XzGMJjaCrxz69hDG
	f6JYf1qwBrCU65y1PqWr1NrBl1fjbg/QbR8pvUj118NSpsEUX4XdFTVCKwxO7FAW
	oN05kJfvdOPreHVl+hczdCnXgpWQzx7CtOrnhb9j8yZonCOf6Nw4DiNc14sVwEGf
	r08gEkBzLrGkIqYcKBCyWJMO4Wq7wmRzyRoRmlwoRpNOxIV1okqdza3d7Ef9uuJs
	8reKBw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete981b0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:33:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-917fd2bafdbso56509585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781534003; x=1782138803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dv9ZEji4B7BwWDkbahrAwa3+NSTzy2uFpYlUp/k2i20=;
        b=RP68iyYTHYd6iWNw6ZsuB0SyQrWhW9GlLIJakGQOgD+5gdqd0hv0zwwdwyDp59YRkZ
         TgPN5lvh6nxKhHqlaBA4wd7/0wgXG2xPF6h920J8hnFJcWr1uCi9ta61nOlUv38nFCxj
         WTA6t9jxIjWbhf9fkLrXoz8mOKK1OJYrCII4GfcOPDdbQyJPOpiSYG9KEYsuEnMflIqt
         maM+Zlci1dVF1K7fPWVd+Ku8Mx19qCpqwJZAJfmymOS5ppu9NqiaVXrDxuxkSWlWG/De
         BT0Ai7zhal+hHTX2q+uGBKOfme95wzgWFv8WKBn2D2IXE5jNcJJApuEBDnKKOKw4xtLC
         FW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534003; x=1782138803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dv9ZEji4B7BwWDkbahrAwa3+NSTzy2uFpYlUp/k2i20=;
        b=FypY7YAjJwjxvNBc+ziOJ0QkMRU6AoYqlirsAhsY6i2OC93xuqJxc5RLRk6U+Cr7gm
         l1fZGPGfo/PFTDll1eHGm+N7EtjPrXf46yhajA6VK/IonldUoNDdPtKw0BYpYfRvkPd4
         73QeHib1E2JA/4AR7JFfLDAh9mBwOpP6LvEDhWaYNLnOqwDelj5p0ksfezUe5ufVlpw8
         ondEyZx7ZVaf1k7DAs74fXe0xkeTLI+jRBpxUgw4FUd1D16WOuPdK9ENyge+FyGSeESv
         XvIsrQT4c5sHDXMBXhx+QkI05LI3NLbm1QNkJYrALkC0vW00jBSSC1pkAgwTl9LiBhA7
         dzWg==
X-Forwarded-Encrypted: i=1; AFNElJ8V832Qa2lDxi6c0VZLu1THwO7/8y/chhOpKyT35r+PU+G4ENh04DW6+eKNJ74bIHsdO1pFsWklGEemeaSu@vger.kernel.org
X-Gm-Message-State: AOJu0YxhHN9OFIbQZ3LKZe/4JEP7vlzXUMRe5WqH315D9dyf20QqmnrU
	/mpno9NEJ1TOKfk7P/ZrFfFCaB216QbeclhDJpI6Hr72cMq6qwYK0+zASTkPVp48Nk1+9oy3C16
	6XbIqcm5YQ45sIHS/MqYHpz3hJ8lMrW9Bcu79ZSfjC79MorNQLIaqfY2+Ym/21Yvo/VGH
X-Gm-Gg: Acq92OH0/aTMXrq3qdiDdf0nCUHZmnMTJKwAqm0LR/rgHAbcaIikSLXDBy9ZKeyA5kZ
	VjZTZCsndF/SIqnDfc8E0Pt+iXf5mbX77ofye9ARPxMxAs6xB51hBfgj7sbXwqubfJLJc+4jAjd
	WEsqwUvU8mCct80jJ2MK+zZDywguPE0FxacdIxo8jP/6s6aw/U/ek03m7ONg8ObbHzL3eAlbS1p
	Yt6mZdsSNHzSp2fqY1VeN/dkXzuTJD7QnaG3Z2IpKZ6PvkvkEYCJyppCGwumvp2fnLr794jtwfS
	tqEVEtTWmGcyvGww0HNydY5EdHeUl2scua4sRrjp4ULP7+CaD94uaBH9P8qSMb3ppHkdagSyfes
	wjLhLat7BWVWVsMX4EEtR4FMjfz7LLzYxUjlt1aD80F9HYg==
X-Received: by 2002:a05:620a:2714:b0:911:295d:59a1 with SMTP id af79cd13be357-9161bd4df47mr1315441985a.8.1781534003163;
        Mon, 15 Jun 2026 07:33:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2714:b0:911:295d:59a1 with SMTP id af79cd13be357-9161bd4df47mr1315435385a.8.1781534002504;
        Mon, 15 Jun 2026 07:33:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b421bsm2863645e87.73.2026.06.15.07.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 07:33:20 -0700 (PDT)
Message-ID: <68a86037-bba0-4cab-8a1f-b0be78f259db@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:33:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: common: introduce qcom_cc_sync_state()
To: Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Val Packett <val@packett.cool>, Saravana Kannan <saravanak@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
 <xtrvgetj3ybwuceez6mymxw4cwa6sqeycoz2hs2zztozeb4oyb@uuhtzbludmzv>
 <2f6dbc37-7ee5-4cef-b39e-455494fb31fd@packett.cool>
 <ncgma77ckduno5645xf2hcmakmbpwub5d54p4zcrhz5pbq3pij@o257r3t6p5aa>
 <ajALNcLMlTThdilX@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajALNcLMlTThdilX@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a300d34 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=4N5aaHjLVSWDVt9tEy4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: o3JhK7jxizXX64m_TlT32Cs7aYsZ3WFl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE1MiBTYWx0ZWRfX6bNgsZ3oAbpE
 ND2fQDU5Zsjsg3jPTg/20bt9BlYSW8T6Pc5i3Sqg/eU0fBJqUAvkVxkRv5q0LUPTyjYlFR/+INY
 OPi4Zh1rlo9BTIT4k+aE1+ObLbzt4l0=
X-Proofpoint-ORIG-GUID: o3JhK7jxizXX64m_TlT32Cs7aYsZ3WFl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE1MiBTYWx0ZWRfXz4686JEgpEoo
 juMEx1orM8gFDI3ZiMnNwNI0bx6M5f+cLXFR3ogZSyGACPOIJyLP7LLw80q2yc4l7X2psYduAym
 kZ+W86XX3AJPIOCUhRnktcDWiEZoItUsjfFu+83jHNW8N3UqY/EV3lCE1qsPBLzHJXf7yVlNaWI
 O1vCKY1l/ss+DBnPwEExbPpbissnYzUWqawAFMH3s3SryYRCGP/790rtzPOvKDw3oy/tpG6IebE
 iS4X7JeF9iFcn4oQUeTmIfnmYNwVjjhIxpe9Dq1CD4e0InqxjISTPZ/Z0hwVXoL+zVQX05lCcjS
 pzx7WV8Rhh16NUWP4rpWYr0GTLNrN4O69Cnp25mSuaSbi79tqnZSS3oeDJqX9h8PhkqaiJl3xYT
 vlBfMhBqrSU6p3517WPsB38CkCU2JYDPAyr+5AfNqZk1Uz2NFsRxj78ceAuaVNizKLkZqkiKLoc
 nE7WRUoJQlnPFc4HL0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150152
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113200-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:dmitry.baryshkov@oss.qualcomm.com,m:val@packett.cool,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC0386873BD

On 6/15/26 4:24 PM, Brian Masney wrote:
> Hi Dmitry,
> 
> On Sun, Jun 07, 2026 at 01:30:03PM +0300, Dmitry Baryshkov wrote:
>> On Sun, Jun 07, 2026 at 01:43:06AM -0300, Val Packett wrote:
>>>
>>> On 6/6/26 8:15 AM, Dmitry Baryshkov wrote:
>>>> On Wed, Jun 03, 2026 at 10:21:47AM -0400, Brian Masney wrote:
>>>>> Several qcom clk providers currently have a sync_state helper set to
>>>>> icc_sync_state(). With an upcoming change to the clk framework, if
>>>>> sync_state is not defined for the device, then the clk framework sets it
>>>>> to clk_sync_state().
>>>>> [..]
>>>>> @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
>>>>>   }
>>>>>   EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
>>>>> +void qcom_cc_sync_state(struct device *dev)
>>>>> +{
>>>>> +	icc_sync_state(dev);
>>>> Only if desc->icc_hws != 0, otherwise it will mess the interconnect
>>>> internals. You might need to set drvdata to desc.
>>>
>>> Hmm…
>>>
>>> Currently icc_sync_state does not seem to use the dev argument at all.
>>>
>>> How would something get messed up, now or whenever icc_sync_state changes?
>>> o.0
>>
>> Yes :-(
> 
> Sorry about the delayed response since I was out of town all last week.
> Just to be clear, the missing check for 'desc->icc_hws != 0' is a bug that
> existed prior to my change, and I should label it as such with a Fixes
> tag when I post my next version?

Up until this change, having icc_hws > 0 but lacking icc_sync_state
(or the reverse) would be be considered programmer error

Starting with patch 4, this gets assigned unconditionally, so there's
no prior bug to be fixed

Konrad

