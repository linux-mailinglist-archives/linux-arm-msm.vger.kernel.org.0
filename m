Return-Path: <linux-arm-msm+bounces-109258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKUpO2U0EGqqUwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:48:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A025B26FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B4513003831
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFDA3B841F;
	Fri, 22 May 2026 10:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KmPkDZ7Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CXXL17op"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221DB1A0BE0
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446880; cv=none; b=A2O65jd3Xkn4EH2y/9iUJc9UwyoDH1AbRq7YCofuMvzQYMcYWsRJ/nJi4oeA7jR8h3l+rRfaVymUlTftY0LNl20x6pAZ/c0PPTMMIBzHy4G/dAu8Z8ADp1GMLDy/eS41rQqe/ajuWQjEZaCsdL+QPJHru1uAZdUD0jCEVxsGtiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446880; c=relaxed/simple;
	bh=NVgFKQxsnzNhNQOuc+bA77K7RYAApwOOdmSv3B5Z/xE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rmRGLZnnNOxGlIu9J5LFT8mTXPuAmemT/udbCDAnwZl8N+LadfPCBokFf05K8vGfOhv5f0tTWh4IZz4IAsUb4U20LNi6u6fZUZ6800kBqfe5bL4hU6JGjMFQOajuE5gm5ZRc2EyA1GSVoP8adu2+mMQhJeLsRBlTZl6yI5H+o3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KmPkDZ7Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXXL17op; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9EFhM3005145
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C5LPZXuE8GtSpjowrcTTt/AMJnsUFfiUN8IDJ0W9Gu4=; b=KmPkDZ7YhXmxGwHO
	G9ZYRJBI2glybS8lrr2wjVqhOLYF4wPPT0tgw0uj9vwtNBXFjGRzA85UA6+hurtV
	WOCzMFFTCGCHKYPQFep7GESuyetYQwbeB86/XghhEpXVgbwLCriNzeq5dd8thjMo
	R1V50neYHnIqwB+gnAT4JQ+lLuhd4SDZ63Z8wFlYQLPBdHuAGGuDDWA2g15MGq/r
	ZVJLhzXUvg2B1kHqJjKUfjW4b+Id5H7dIGpE9GyTO69Ooj07AKFkqX0YqU/z6B4E
	SXKW6VLF2UfTc1L+pwTZloItCb0FZCHpQP4igOAX8HpTBIEnUwpowqUz5UXMIgam
	+WXb+A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrt9map-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:47:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50faec938fcso17677091cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 03:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779446877; x=1780051677; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C5LPZXuE8GtSpjowrcTTt/AMJnsUFfiUN8IDJ0W9Gu4=;
        b=CXXL17opzm3an4zDc/pIsRK2ypukoMUvYn9KSLzEwUr5scc06gwhUDSaku7ioCC9m6
         CP78/fYXHYNJs/zouKr4Jvt4zxMYhgRz+y4lse0suAdr3hc6clyAwj/msa9Lr+UsJ0ei
         B8cUPMsKwPj1YaijkVyqBGIePLu7CCViUF7jusM3ueNDF/K+e+0L8oZpEUA+PtbgnvY0
         xSVmTFG+U0Qy9mV4mo743esnzcWDJxkiFstuSQ/V0iA+9Hg1YaCaCEBgRWgmzjpT5YMQ
         oi5tsN6XJF/ABjgSKzTAyMGgOot9M/nPp1PuEwIGV2ofcYsicTQVh9lPy5apGY8RKQWZ
         Dfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779446877; x=1780051677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5LPZXuE8GtSpjowrcTTt/AMJnsUFfiUN8IDJ0W9Gu4=;
        b=Qs6app0mh04CpKRu1W7wmtRmkz0IiH+8xPh+tPE77BsXGArXfmvOr4J+rwGtukxGFH
         RvzZdCBxlZ4zIoXTzRleax0va7fBwDGeI5J00o3OOobYArYXQ0TLiy41hfDf/NoiaD//
         Nz6t7EVMiIOkhZXL22w5+uI05qME51jsN48gSbwNx2XgsStxzAGI45zrHsINkLzfUdnM
         02xkOsntEX0F5ZzhNnf/yTmfjFA0LW0NXd4dsRiGkJ9F+SKcIOhx89aTfJSyo7Q+kfoh
         qzOKAkTmPKy4pFKGQRxTosqepqZKm2INkBZ+3DRHNijKja73ipvtMNQK1jLy6TVFuJjy
         4vOg==
X-Forwarded-Encrypted: i=1; AFNElJ8IAx9wbzHX0Sp0zVA0G8nY7GivH5SwRQ4v31KEqwxfewwQC52+jwLEMQjHA6X7KSQT8cLFohvuMkdXDlwg@vger.kernel.org
X-Gm-Message-State: AOJu0YzG7m2LhueTEeJx6El1R8udku3tcBftyc97yVnjM7g2it/1/DC3
	16VKTBOLgfGtg6xJX12yFrUA1q28rjYnetZIeRejQnoXwk5SPKZNIlcqa40cwudvURwyxGEByCF
	1oxLLqTcdZDMWJ1oP5H/HAGp8AypziakDhGJrSj/5FdXiR5t9RHd5Me1wyzK+AyrJ3tAd
X-Gm-Gg: Acq92OGcka/OeqFOSkJ3mGulzME30ydVST48Uev85fjxDeDi6iJJSEN4kQIh2DQHV7e
	6yQw7aaPBQduQ8X/UsMd0tUEh+JDlrr5vhDlBd8MNG9CNr4bN6/RV3aJrmNaLB+1DDmQuvP3nwy
	5Yl+/+cVPCYKz10deN0hGM0BO7eqx+SQgBWqSZmHlRRuVOj0cqVv/KMK9uVo6IHEHE9fLQnGSh9
	xOtyNKhWTjVvBZi+JnYTV2Pv752cK4XFGprT8PJyn3b4DusmymrCdOCx0qysvkhZgqh6qkaqx1w
	RIdK9/w2nBblgcvZIAkLnBRBl3+QQgwefUrzFNtza73Nbu/Doz7VjfJTTkpHcud0jm5BMW3ttWt
	0G9rOUwq6Ja2enN7JhMilIfTjIQZlLzgp8cF4BPK4MHdY6A==
X-Received: by 2002:a05:622a:a903:b0:509:e68:22cb with SMTP id d75a77b69052e-516d439424amr22762831cf.5.1779446877006;
        Fri, 22 May 2026 03:47:57 -0700 (PDT)
X-Received: by 2002:a05:622a:a903:b0:509:e68:22cb with SMTP id d75a77b69052e-516d439424amr22762681cf.5.1779446876627;
        Fri, 22 May 2026 03:47:56 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9b6d269sm537400a12.3.2026.05.22.03.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 03:47:55 -0700 (PDT)
Message-ID: <6bad01bc-3329-4a8c-a812-a6d058e15efa@oss.qualcomm.com>
Date: Fri, 22 May 2026 12:47:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: arduino-monza: add WLAN enable and
 rfkill GPIO
To: Qian Zhang <qian.zhang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com>
 <920223a6-4e4a-4ebc-8a1c-c37d0923a470@oss.qualcomm.com>
 <a79100cd-0e33-4eb6-9452-c4458ea40bc0@oss.qualcomm.com>
 <b71f7653-78bb-49eb-b4c4-3fa8bca3e705@oss.qualcomm.com>
 <CALC2J1PqdKGozWX-WapCZSkjGZcM_JjOX29HQ8r7ghKyaBXj_A@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALC2J1PqdKGozWX-WapCZSkjGZcM_JjOX29HQ8r7ghKyaBXj_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a10345e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Lzbw_nNmeTPLO_IXETgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwNyBTYWx0ZWRfX7A4dB2RKwrkl
 I8hlPdIn7f+VZfPuR2PDlo4VwIhYhBIiRrF/Tphe+SQkyy9n/CDC9h8lHL/ivWPGIebhjXfT204
 cucgz5vuwzasvC8YzPRjFSyM8C5qwzRaPhpvIZh4JyGDnQ73xZPKISGsWmXkhsL698m1/gjXMYp
 JskwfBtCRrQOOpAVDuCapvDbyTSnGYopq0Ic0nddaH0NjzS+Vyq1cC892Ohr6a2pZsXPT7fTbGS
 BGFghTSLks2PI7PqcR4/cTWEtBeu5DV0jlawSgx0UU3Dhd7oXXCNd9DlHE1zkRjdIgoqnzLY9I+
 bOq6PpT4Zz83Kc4xgcCi5sq+xoHqyW7WnaaYNcaltdGSxyHFfNWWbfySDmZVIi6XyIBIKgap2jK
 7ioQoZsC5mG524uLkd19LPOBt532RnEn9Wt76qnPkT+PMy8GP5iKiFXYLirjgFJ75A/uM1OGrla
 Ewwru8ihZXpSJrcRzvA==
X-Proofpoint-GUID: ogxxvSv5ec4HGFGayifEgYgrjERkg1uM
X-Proofpoint-ORIG-GUID: ogxxvSv5ec4HGFGayifEgYgrjERkg1uM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-109258-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 93A025B26FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 4:58 AM, Qian Zhang wrote:
> You're right that GPIO 56 (wlan_en) is consumed by pwrseq-qcom-wcn
> through the wcn6855-pmu node — apologies for the confusion in my
> earlier reply.
> Let me explain the hardware on this board, because it
> differs slightly from the typical WCN6855 reference design and is the
> source of a problem we're now stuck on.

The wording, structure and magic characters within your reply make
me think you're using a LLM to respond to me. I will not entertain
this conversation further if that's the case.

> Hardware
> 
> The WLAN module fitted on Monaco-Monza is not a bare WCN6855 — it
> contains an additional, module-internal PMU (PMCA6850) that gates
> power to the WCN6855 die. So the signal chain is:
> 
> SoC TLMM gpio56 (wlan_en) ──► PMCA6850 EN ──► WCN6855 rails ──► PCIe link up
> 
> wlan_en is therefore the enable pin of PMCA6850, not of the
> WCN6855 itself. From the host's point of view, asserting wlan_en
> brings the module out of reset; the WCN6855 only becomes visible on
> PCIe after PMCA6850 has finished its own ramp-up.

The powerseq driver for WCN PMUs exists precisely to handle this setup.

> Initially we reused the qcom,wcn6855-pmu compatible so that
> pwrseq-qcom-wcn would drive wlan_en for us. But we hit a
> resource-allocation issue this hardware behavior creates.
> 
> The problem
> 
> Because PMCA6850's enable is driven by pwrseq (which runs after the
> PCI host bridge has scanned the bus), WCN6855 only appears on the bus
>  ~10 s after PCIe enumeration has already finished, with no resources
> reserved for it.
> 
> Topology — WCN6855 sits behind a Pericom PI7C9X2G304 switch alongside
>   a TI USB controller:
> 
> pcie0 RC ── 00:00.0 ── 01:00.0 (switch UP)
>                        ├── 02:01.0 (DN) ── 03:00.0  WCN6855  (BAR0 = 2
> MB, appears late)
>                        └── 02:02.0 (DN) ── 04:00.0  TUSB7340 (BAR0 =
> 64K, BAR2 = 8K, present at boot)
> 
> dmesg (kernel 6.8.0-1071-qcom):
> [    5.545559] qcom-pcie 1c00000.pci: PCIe Gen.2 x1 link up
> [    5.882178] pci 0000:00:00.0: bridge window [mem
> 0x40400000-0x404fffff]: assigned
> [    5.912197] pci 0000:02:01.0: PCI bridge to [bus 03]
> [    5.917368] pci 0000:04:00.0: BAR 0 [mem 0x40400000-0x4040ffff
> 64bit]: assigned
> [    5.924919] pci 0000:04:00.0: BAR 2 [mem 0x40410000-0x40411fff
> 64bit]: assigned
> [   16.476921] pci 0000:03:00.0: [17cb:1103] type 00 class 0x028000
> PCIe Endpoint
> [   16.477176] pci 0000:03:00.0: BAR 0 [mem 0x00000000-0x001fffff 64bit]
> [   16.516689] pcieport 0000:02:01.0: bridge window [mem size
> 0x00200000]: can't assign; no space
> [   16.516704] pcieport 0000:02:01.0: bridge window [mem size
> 0x00200000]: failed to assign
> [   16.516713] pci 0000:03:00.0: BAR 0 [mem size 0x00200000 64bit]:
> can't assign; no space
> [   16.516720] pci 0000:03:00.0: BAR 0 [mem size 0x00200000 64bit]:
> failed to assign
> [   18.093137] ath11k_pci 0000:03:00.0: Adding to iommu group 24
> [   18.101694] ath11k_pci 0000:03:00.0: BAR 0 [??? 0x00000000 flags
> 0x20000000]: can't assign; bogus alignment
> [   18.101724] ath11k_pci 0000:03:00.0: failed to assign pci resource: -22
> [   18.108613] ath11k_pci 0000:03:00.0: failed to claim device: -22
> [   18.115481] ath11k_pci: probe of 0000:03:00.0 failed with error -22
> 
> At the initial scan the PCI core sizes the root-port window to 1 MB
> based only on the TI USB endpoint that is currently visible, and
> gives the 02:01.0 downstream port no MMIO window at all. When
> WCN6855 appears later it requires a 2 MB BAR0 and there is nowhere
> to put it.

This is a separate issue that needs fixing. I see Mani is already
part of the thread, maybe he can take a peek

Konrad

