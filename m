Return-Path: <linux-arm-msm+bounces-117128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8r3IH9uSTGrAmQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:47:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0779C71791A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:47:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bUWnDpcs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TzWnmxqm;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117128-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117128-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 407E3306E739
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 05:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A0C3845D9;
	Tue,  7 Jul 2026 05:40:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7786385D75
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 05:40:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783402817; cv=none; b=Y7W4z19H466fD43FOgeGXvG3UC7coB3PQTiNnY2mCBiEGFV9zJFdlIfARtUJPj9E6Pn6WD2+8Zq++dZtV2n3hRDrXO+9UxVP7r3bzQ+xyWWf6PCTr2vgK4VZgM3TjiYWa1CP38tWMLpSVpn2ajHlgLO4nTH6r69mZhiLTFmkeIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783402817; c=relaxed/simple;
	bh=n+m+WGrSXjSisXtKmhqmlHLjEHZOILl3o8Bjfpc/hiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IKfoYCm4RHYPbRTyNDoGDluTpLw5Z51JvQUBSDfyNuLD9AotxSkV4DQEKnupzGvRzsbeW4HKAIq7FTD6ntGosyQyGIaUQb32BByQZYwirzB3a0LwBqlsZ5eh23pmh5Am6nXyRU3WUvEF1ZNZ/5b3Aa5iiuerfvPgwuI993Wr3ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUWnDpcs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzWnmxqm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66749Ijg2658346
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 05:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhP3fYK+aJLFo/yxK3ki9QBFiA0G/X1T4yRKAQjIIXE=; b=bUWnDpcswnxLNApa
	PUSIJ7I1FGtbNZhqlAs2QI+vROlMS5snVpQ52eKy/wtSvQOvIUic0pYpVtsjGmCj
	R0rGUSH6ngVvaijeQ931c3DYSA9kMdNdcLh0dLsML3HNoDj7C7kSI9GVVg5NwKDh
	GE90lNml0nzKvt27GjXxJpZiqMWJQNLsbbAowIRC4M36pe5Fz45XmPfPfEV2dMpd
	WmbYEuRMoojuaefDYaxwHgTjB3NtCnGV8Ng/RjBjvocPA9QrSQhIKV7JE5jDYLje
	H9OWqQaDOiQf6OCzG7ieLTRZ//hvdryWjpJ3WNZ4rBM/MRV9OgjqQ5mzDi1BFWUz
	aAtEtw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r48gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:40:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37d4eede8ccso3322446a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 22:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783402815; x=1784007615; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hhP3fYK+aJLFo/yxK3ki9QBFiA0G/X1T4yRKAQjIIXE=;
        b=TzWnmxqmf0s7vZBas+VC78+aAC5asIcVzGPqPKvEPV58MqoxWXNBd/WXoIJjXcd//T
         dJm8QCNbd6CGby6ezIU2qN41TwT9Z8W+DncMM2ipdnd1PjXxnohwnLySx8xyGurKDoSU
         k9JhkmDx7feNY7rVaaOWU6toQGpZxWpJ3xCZAIHzNxx2D8iZl/QN3hCtlof+4ic2eI3u
         ximSXrUMB76EeqyyZJY7HLHnoa4Ntd3G/fjiqW3UEg9le2KEVsyGd69hNaG0XOXma+CJ
         oUJ+Sn6tL+3Zyf4OWTuwmMGSZHyoADVGDWDC9FP5F5EhdILs3vL+XOihKnKV0AHkv41S
         giBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783402815; x=1784007615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhP3fYK+aJLFo/yxK3ki9QBFiA0G/X1T4yRKAQjIIXE=;
        b=rniN0u/PR/11xdlfB632JUccJ4LFeEFy8Z6BKQOuL9SBgwyFO/BlcRLyI9eSUwY+/P
         N8blLvqx3oOTsL4fbsviIWs1snF5ItjyEXXICJFZDBwIlFCOmySk9GZk5uwSuBF2S/PR
         bKKr1YTEPOZS8h9L+sYZdb5lSKokFybk++IXBL66tsrfATPNSrL3lj16g4kUSpgwuNvx
         2ea2QoKKU6jri58OVd65XtMg9OHr6dGdqxssxJO4JXG7v0j2U8/TfC87ewQoKcYKAVIA
         B7QHGsbC1kcBfZbtNhr30l2vnNpvpKt3KhcLEwcoF6erxp1RQEw4Q1/GdhR/nGc3SO/+
         RsPQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGpLn2GnMIFenHGYd83uBjaMPICtD+3svGRKjBIh66TO5jYiQt2Dc3RmvDqUBx3G3EsF9Pw9Dm+maz1Zk5@vger.kernel.org
X-Gm-Message-State: AOJu0YzY0AEa8haJpkrFBQMg8Pc37tWXilTTt0P177hYMbSepDqp4Ozj
	4X2nb4mTE3D0VSk/BB2F7uuaOUSmZPNJq4GFKa3I/izdpuSrtireZyQcJwhS7PhZQjOMjNvp12l
	slUG9784uCFQjyoAc48ZrgghWgyh5DpHam5mE/7m7SXnort3EOeR73xoW8z2NEdcb+rSu
X-Gm-Gg: AfdE7cnmXnlSy7q/pALq7aJlvxcBpPHCxUzPvJQgksTYz54SznlJD2Tz/YB+P1Z0ubH
	VtlphdlydnPdA+9u0H1l9927/n9+FhYC14yOAOhzK3NYn7XzRuyl7PmDyQGmc11jbmOnyqPEy9A
	QazJGLc3ZOXj2Y5gVnsgwpWj2bHxJWVhI5EMDQmQVw8odZl5CBptv60PalhTZr8jI31EY2RwqPI
	T1UHD8tA74ZaA7vZLwvZcFZvfSpHKPQ6FvHyq0FX1oDtkiwrtm4ICxBYt6j0fTnps2sKI0sLmG+
	8lootPZSZEd9msX1GqdBX+jsyCywP3uxMI/pTGFrVSAmsqADtcVY5Xre3MYiMR/Ce45hY/esAOa
	E5qToWF/0njg3MFU1qYejtUSmCOHTu4D+1CMFIh4+NfnmqQ3JjlURBMNse+xZotI5ePJq3fgjSd
	13KlUc
X-Received: by 2002:a17:90b:510b:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-387e0bb5ba9mr1259370a91.38.1783402814802;
        Mon, 06 Jul 2026 22:40:14 -0700 (PDT)
X-Received: by 2002:a17:90b:510b:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-387e0bb5ba9mr1259321a91.38.1783402814249;
        Mon, 06 Jul 2026 22:40:14 -0700 (PDT)
Received: from ?IPV6:2405:201:c409:b03f:6d0b:bb83:7a67:4093? ([2405:201:c409:b03f:6d0b:bb83:7a67:4093])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d100b413sm451809a91.2.2026.07.06.22.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 22:40:13 -0700 (PDT)
Message-ID: <ab1cce3f-4066-413e-bcdb-13e89a03932d@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:10:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] PCI/pwrctrl: tc9563: Add API to control endpoint
 power and reset
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260630192838.GA223662@bhelgaas>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <20260630192838.GA223662@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfX7POGny5JotLC
 TN7BLvV+OnLLCszWalp4E54Rv6SsaUYb/CTNU30k2eBE+AGG5rgX6XPRGNI6vpGKhXSmQYXoCBd
 3iktazS6I3rMIyW9kyE75VWc10mbMCJlLdMsAt0UXy5OJH9KblH2PJjumbkHAyV+37yQfYCNf0j
 vg7DWrr3UcqdCQs4pDRML4N2o+mMVM0pZJEM7MsvwYtTNrsS7ncAqqk0NGKSJw24MtY840JFfHg
 VoQuFLB8v6j7x0qzXANZgsmRMfjhO8/o+sU7W+gVKdJE6Jh2pAKc/gYuuKc1O3sQhXaEUkzKvMq
 0ljLIF3gOR6m3Rl7W+aAUTziaKAAo83g1wFvk8UkTPB/j86JXiV0BTG5MJVHg8Eda08lqWibvfs
 UzOghLJaBzHnRlqIhYbGXCGlxVVTEj8r7ide0AA273iwTVE1uF59Dh2ULlyBFW9n1Rvy1c5CPJ2
 S3n9OcAb36ExDAnWixA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfXx2KJxY8BuWh6
 o0/gdPS7XLDUrinoKqcC86IV53lIwwDX/RP3seTlm75BIQP/epFi7djBZlsZWfGaIFAeLavzYYY
 mBDFozkRNB4bfWrS4pE1NM6EEzR+pcc=
X-Proofpoint-GUID: 6B6XuZagzURMoMf1DqZfx2EdhjgvbdYM
X-Proofpoint-ORIG-GUID: 6B6XuZagzURMoMf1DqZfx2EdhjgvbdYM
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c913f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=153GEgVumq_bsj_kQ94A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070051
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117128-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0779C71791A


On 7/1/2026 12:58 AM, Bjorn Helgaas wrote:
> On Wed, Jul 01, 2026 at 12:32:48AM +0530, Sushrut Shree Trivedi wrote:
>> Some platform utilise TC9563 GPIOs to enable power and
>> control reset of endpoints.
>>
>> This patch adds support to parse endpoint reset and power enable
>> gpios from each TC9563 port node in the devicetree. To configure
>> these GPIO's during the POWER ON sequence, two new API's are
>> introduced: tc9563_ep_pwr_en() and tc9563_ep_assert_deassert_reset().
> s/Some platform utilise/Some platforms utilise/
> s/This patch adds/Add/
> s/gpios/GPIOs/
>
>    Add tc9563_ep_pwr_en() and tc9563_ep_assert_deassert_reset() to
>    configure these GPIOs during the power-on sequence.
>
> Wrap to fill 75 columns.

ACK'd.

Sushrut


