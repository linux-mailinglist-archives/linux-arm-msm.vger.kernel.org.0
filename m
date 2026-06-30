Return-Path: <linux-arm-msm+bounces-115384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oSYiHNKmQ2o9eQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:21:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9436C6E386B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:21:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GnritBkM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RZzorpN8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115384-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115384-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8B9D30A44E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7933EFFCD;
	Tue, 30 Jun 2026 11:17:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD4B3FD139
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:16:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818220; cv=none; b=LhQuxwbSiTBTqThrBuptMeZpjeTPPSKpDUIVJi1GGWVgHLHizA1khnP6IbVi/0k+Ha1D6rK9UZLfILS7zhYD3IS4birQykJQ0QRu0wASthZ6LDWDcrT+ZjX5VXgcGRUuj2sRVTHRwmakK4PUwGb9LyMdnBRf3WGnHxFWLAd7+KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818220; c=relaxed/simple;
	bh=OwoxQFMmClVp/FKnrr986wU7zxRGgnUkDUDrvAla+tA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FAOFvmeE3Ux/VzD9kVdlZ3gZ5MRvG4Nay90TriAQjwj260ZFtmoCVIh9bS7lyXK9XlxVz6mni1S4bY+7wvEB+YG2aE4sVImsoyc/5yM0PksofoZ68O/PfjHRzr3h8EAll/lsH281bMLGAdkSTAy0fRm7W6m2pe4wOyW6RlOyqrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GnritBkM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZzorpN8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mnsE1542037
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YdXz9hXxswV0OTamUlM5tpOj2E+z/eG6vCXO9g5umPA=; b=GnritBkMMjF25Sog
	oGHudo5jn6aCGkjjEQhuhcvdJ9EYUFShicyiT+7vBTyKY1ITR1PGCK2avYzJPiys
	TzAR0pOTUG1uTpD4fdC0cFGCymuivBn1uEJZAzjUee9fD/F48eQCczSiEWXzP6ZH
	kNKscBEJeOKV0L1HI2AaCXERflaRRotlVEx3KJ1XgnglzY4E9ye3FZv6ze0uDAds
	twPeRMJYiESW5h54l51PEcwephVCqMEblCLOZyvxQtA3c8A+XGXOScyi/rjvjh9O
	rS8sBqtRaaBC2U8IbiWICLp3koRG9wObz9IvOA9QGeNJULpufqImlSwKptAYc01N
	AbHyfA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44v4j4n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:16:57 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-13980b6561dso13407807c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 04:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782818217; x=1783423017; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YdXz9hXxswV0OTamUlM5tpOj2E+z/eG6vCXO9g5umPA=;
        b=RZzorpN8cemwFBJymzSbr1UiaJC/D/awM81DFPVakXFGHd8beoiZAkUt1P4IaYbSM/
         o/3pqFyf/iIrIQfvKM+YSzBVIlrBR6TTi+1SnzQDZMcFEOATe9sTx6zczO0QggF0QGRS
         oU6D3eHCZR/7d/BjePSxnqZ4YlAecXxDZlDYITq1YdX6T8N04JUEuIlRvmI2UMqO9N2d
         yk92Pz4thfhqYQkf9FDwMuz7qDH+nCNVsgNs4QaTQqJOA3V8fW7jTL4khFX6Fd18YyKX
         3m+D0Hzg06QO9AfY5E1J3Zpf7KFrT9rTDnzVrcvqqa1lZnvo/RhyQ5VSYrDqK/DyNRMz
         ueRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782818217; x=1783423017;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YdXz9hXxswV0OTamUlM5tpOj2E+z/eG6vCXO9g5umPA=;
        b=UPH2rSueVJvFIIoqvCmW5f6wYmpXH9PSi7yP+hskmxbIa+JyK+BeeNBXRV8Y3i2+36
         SRdLTCvCNBESROyHb5/nwqzPxGZO2hoBwUcwgOrXrRF6YS5xumv1QOIZzL+GyEhgdNoG
         THv1UuKaMaNEmU3u7K4PVnMaEhIAici808PwtpjuwieZKXWWDWqEMPh/Sr8WNz5npb+S
         lpxNus2oDl29WXAS+ggDOpr9xr3nZXF9cZd8NOVYHs3NHETy2tWagFTMZdYf4p1SSm7Y
         Kfy+rR5P/XrFGrTIlkZtJBoI04c1zHtaOe6PZnFFN7mMOtS8A98Hjcw7no0gGHNGyHHE
         JMbA==
X-Forwarded-Encrypted: i=1; AFNElJ8W4k4mJKOnSeKKx1pYNxRAvhXUflScDdPI60fzzRstWOGKRoQC1i82qaBnoKl3Lwi2PmJjvPHbM/WT4wPu@vger.kernel.org
X-Gm-Message-State: AOJu0YyTTKGr49kUDE19M7+0fwlPEeSO4YzF4mHCrPzwEoxTL+VjhBpU
	4j7Gca6GRtD0d/hfkWss2bBUVHC1VPWM3tu5FijeqeO6BmuoZs8xXR+Q9ipZcWKzoqRWAw3+iuv
	qqiLD4xd06EvVs02Y+DHKOyLd2ldTTHHVLc/zDlq+EwVa4KZ2bVs/niHlZG0ttmoRaA3P
X-Gm-Gg: AfdE7cmFmI0hDRSfg/3bWwvBHjFYOJa4h3uXu3gl7nMK5yMZhNh9t1kE+Yub9IMnw5v
	2eeB7LQurpBugBt3cJc0sCxwPAVfjBAxZAY15VWBsv7vuE0M0YGZfH5q1SmrOwozKuF5RPe4huL
	KlDr23LKfTOWpRtyz3ZIKB+pf/IDjKpMq01cVXTCwlkudfZiQDI0y8ofieF55idVzczqzsMuqtr
	oaovjP93kL+p0nwEgCweZyrXe1LFpa77xhWzjowxeE2aKlf/LJD1vCjFOprjkKMg7s+dpVllIKR
	k1Xtn7LLR8awTK1ZcJRStHq3SMzmK3bQL+KzvArnM+5Nr84ZMZV4PY8UaZ8CJ+vxmzg0/827/av
	ODpwLbuCAA1PTANUTmHWbPHyyH9Ok9JpbV+G3o49UzYhiwXY/q+ePPJA=
X-Received: by 2002:a05:7022:239d:b0:137:eb21:eafb with SMTP id a92af1059eb24-13b2a1762edmr2044167c88.13.1782818217283;
        Tue, 30 Jun 2026 04:16:57 -0700 (PDT)
X-Received: by 2002:a05:7022:239d:b0:137:eb21:eafb with SMTP id a92af1059eb24-13b2a1762edmr2044152c88.13.1782818216728;
        Tue, 30 Jun 2026 04:16:56 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b309476e9sm968932c88.8.2026.06.30.04.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:16:56 -0700 (PDT)
Message-ID: <1d54d968-abb1-4fda-9faf-fddda7d318c7@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:46:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Enable icc-clk support for Qualcomm IPQ9650
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
 <e9d687f4-0280-469c-8729-cb4ded09dd84@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e9d687f4-0280-469c-8729-cb4ded09dd84@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ekX6AT9sYgUfO1K2PEP7491YVeb4Gf5C
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwMyBTYWx0ZWRfXxOwCc6NLDLWX
 ALCuZN39JpXa5UqQhza5x9BzxmxZDca7Hn7Lv3gVcHV8LEdMp5je9Wfg05IWQ3jFJku3Fq2dywl
 Q+bCpoRof4kEbhIXDHqa4vS8rl8G95w=
X-Authority-Analysis: v=2.4 cv=JI0LdcKb c=1 sm=1 tr=0 ts=6a43a5a9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0RSEAuWrFl8F25onPCMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: ekX6AT9sYgUfO1K2PEP7491YVeb4Gf5C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwMyBTYWx0ZWRfX1MJ9LF8BL3Y2
 grFrYpbFoAA+kRSFCcXqNWaD4yGA5Z3ibpvwqZIBh2F9TCVfeVqCioXacT/5HKMbMIVBYcvf8zk
 /5XPK/qOhvbAHG5UObOIaWleJlAlutAhMpIOExV+sDbB72JxxnnWH2VyQfoUrf5xn1cEK7Lpc55
 hNb9dEq/nCDfNcuBMF1CbfmMrVG/zldrfXbglxLdQZNR8IwdEtUh6kaPDfmixaFvNLn3L/fkDvt
 /+V79reiBvpSwDKuG8S+wD6FnbRlERdCtu/Y5RI7urs1u5F1Ht8myO+JtKMZYuHes/vjkopcfmx
 zs2XclQnMQOXi6WZiNwhAr0dXTvTjyCXPtxmgJCkgFjLmK/WW5eHwBafMWL1nkJRt4oZCw1cakC
 UTG9aDUh5Xnrab1ZrGnnV0wTC+V4ckGYzsKMIrGaZnwTAZnemwcSJrR6/gdD9GfFmH2rjk7E6ba
 7kaDI//7R1BqMaj81oQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300103
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
	TAGGED_FROM(0.00)[bounces-115384-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9436C6E386B


On 6/2/2026 10:38 AM, Kathiravan Thirumoorthy wrote:
>
> On 5/19/2026 2:17 PM, Kathiravan Thirumoorthy wrote:
>> Add the master and slave interconnect IDs for the PCIe and USB
>> peripherals and enable them in the GCC driver for the peripheral
>> enablement.
>>
>> Signed-off-by: Kathiravan Thirumoorthy 
>> <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>> Kathiravan Thirumoorthy (3):
>>        dt-bindings: interconnect: Add Qualcomm IPQ9650 support
>>        clk: qcom: ipq9650: Use icc-clk for enabling NoC related clocks
>>        arm64: dts: qcom: ipq9650: add interconnect-cells to GCC node
>
> Bjorn, Gentle ping... Can this be picked up for v7.2?

Bjorn, Gentle ping... (applies cleanly on next-20260629).


