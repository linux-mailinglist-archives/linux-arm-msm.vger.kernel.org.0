Return-Path: <linux-arm-msm+bounces-94494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H5LBvrLoWniwQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:53:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA151BB0B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B9E9302D51A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81297347FEC;
	Fri, 27 Feb 2026 16:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Htr0BPJy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FNtJMaPQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4163446B5
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 16:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772210958; cv=none; b=E8o0lX6t7xW5xpdS02wuAwsnCKNygkDghsMsKXl6MRlcpPLUGZdGu3JTmSuner3rpRpmh3GHUHZRNy43Pf0AI6L+S1g6HFzXLSjm14d82tVLARpbNQBwETD6/gU+ryTj41MbGkMVnBwfnAuxHeBwosWhiq3EEjByorOunNMo9m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772210958; c=relaxed/simple;
	bh=qS+jq1JrvcU5hElzUv5cMkCRMKosDacHXQdATwP+kLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I1pk8mXcDVjgqHctBPFZcWxafnPuXIPHDZLBazjwnp0pbfnhsy2NfRLCsniUaNW69pImRZjjEk1RNxdgBwkjcObddEIL2FW/NfjmrP/vmLVjzxETkfisSjImYxsNj5vGZSx+ejqO+kLHTQG2mjEO4BjYUkcSx4XeDkuKYXqOZdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Htr0BPJy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FNtJMaPQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RGj21X031897
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 16:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GF8gzs0Y2ObftuKtilXKIdvF2o6qLBxvxxDd8LVJ5J8=; b=Htr0BPJyfQzNZWnH
	KGwS/K4b90TqkpIVkjY0WQe6wv7osT/++zLDbJdsOlQu1wgmilzT7eDC5LNmjtBu
	IlenPEPLjuXuquEQTglM37TkAYLMnDs4mKZWEg8xDM4bioZKTH3GWGBSwnOg7YyT
	7w/lZ2t6yKpOev3+azKx/xeNjxEfSRHZmAxuUaJlcYXapHUVVbO4FoOs3OAW0APm
	mUdv8HKkeat8x4wHvfBDsRCDcApnTWrd1OWtuU6Q3zZ/7d9JCyteLxHjzql7M7e2
	hL5NP0g0Wal1Areu0rTQ9JeiMT0iYJfEBo18krSVBCKFe7r8wdIqrsoOAVXh+Wkx
	/OmJjg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cka2xh1bp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 16:49:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3978cdb2so209188585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 08:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772210955; x=1772815755; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GF8gzs0Y2ObftuKtilXKIdvF2o6qLBxvxxDd8LVJ5J8=;
        b=FNtJMaPQATrG8s1+k8Hlzu5HQKY71NYgozN7S6ONOztynrk8wDh7V1GplrxpL6txiE
         C8wx4T32ER7AE6imyL+OyBoD5Hq5Anw8Q02n6j+qQqNSFekut1UjuLShjSzociUA19MN
         NOWsVx+bECAiwZNEq2z3cy4Jkst8khFRIN0W9JI8KMhT6qT5JRFtec8RaqCXrzPHUIRz
         g0QGANQcqcRYfHooRx4ta5GyShsHjqcTG96katc/aoQxCwkxBLBTlkwj+oK08qiBhCZ5
         6zEF7MI1NSY+9Nk0SZ/QfPcvlTOf4N+gUZu9kgS8PnyWJlwcZQ7ezwjNF3vKJ7Nhsk0o
         myWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772210955; x=1772815755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GF8gzs0Y2ObftuKtilXKIdvF2o6qLBxvxxDd8LVJ5J8=;
        b=gx/0zn6arauVbA+lZ68tAYgO6fo6dOnHVRLve3i+Jwx+V/aaq3c9NpNkWaxFdx/ek3
         KZy3Xh3xVGpWiX8AI1y03toscLfFE3v2+UKP8n+EZSGTlfxVLJawtSZsPVM78HudxQVQ
         iHAIuthsoRtX1VUiFxPu25sht/X8291o1ptprd7/zAcGFxa4oPPFQgC54jNCkaRUKLkP
         gN43FNeynCeeWL1+M9TAXJq6bZVsae01tqGQayAWYBL1Q8P94jTcS8jor8lAMu6muXy2
         CB7IxRFTZLWynawvA5JUuIVwyzd1JmUGlngFY98vam4mi4kxLMkLEOhf66bTGKKn7w8i
         YAxA==
X-Gm-Message-State: AOJu0Ywkp1CRRhi/bOJxm4Ib1WGMBmVovbP5yZ4ZijGrdInb/hSc19wk
	DDGpp7uMTcPWpf08PGf1Q6denxP6nizWxO8QyoKOwv5Hh8vGAQakzH1VnI+dcx3HkLz4+Pe5Jqc
	0BTZD4cWRq369ZeJsr2+04QXraxNLuOukSv7+njOccD/1cERjWgGPLS7rOqCghqaPJRz4
X-Gm-Gg: ATEYQzx4dWLbKoaeRyDBIKzsvFcYW3hFYIyo+q8dNTVyw75qmD++2BUreKKzw1aVOG+
	kVKBW/lBMc2sKNzBgGmGmR3QRu/Cata9NaxofH3S/5hZLXPVhpfU3fHQ+KM3IvcioGl/w70ZCK5
	EcMEQCxBtKJM+oZ9Ih/6GSqHXnFrc0SFntweJDLpqfAT/PgJBpddVL/nnwf3iUlqbq5DqDdXn+/
	lZlQgw4/ZPLrE8jDSMDVVlzTKmBYiEqBh97tC51cpwmPkDtC71dYAGH6l4grPnSHSbN2LOVlDm8
	WiVKLQgPOXlvuNCIAbh7vHc9W0a2M6m6SkvJDmuptFQ2Eis16rhntgAfGivQFXDHYHXt3c/+ZZX
	I1b9jSr/dk1nGAPvmhKDw/iGVdbXTOsufEYGdW2z25sjadLuKm6zJdmBaM+wuPqyxtsCpNcnqeg
	V/ETc=
X-Received: by 2002:a05:620a:25c7:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8cbc8f5a1aamr328589185a.10.1772210955481;
        Fri, 27 Feb 2026 08:49:15 -0800 (PST)
X-Received: by 2002:a05:620a:25c7:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8cbc8f5a1aamr328583485a.10.1772210954927;
        Fri, 27 Feb 2026 08:49:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec4426sm162355466b.56.2026.02.27.08.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 08:49:14 -0800 (PST)
Message-ID: <6fe3a1a8-46c7-427c-abb5-2e7366a43392@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 17:49:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] media: iris: switch to hardware mode after
 firmware boot
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-2-850043ac3933@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-kaanapali-iris-v2-2-850043ac3933@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BOC+bVQG c=1 sm=1 tr=0 ts=69a1cb0c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=uMIPjMpX8He5E15aO8IA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: mEBDwirN69C-b_-3-EI_ihROqpgY0DaD
X-Proofpoint-ORIG-GUID: mEBDwirN69C-b_-3-EI_ihROqpgY0DaD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE1MCBTYWx0ZWRfX06FjLl7Bv5Ly
 ObKXdleOfln/FuvYUGOA2zyZcFoDyZkbB5kLhdFJjtmLqKq1pjLcxdFuRskykyGXH9FNUyFdiO6
 fcsFgLXi2vxZx/MjG5oiTpC3rw5Eo2RyGF+Qd8JumBzl1LQfRosLUfnhYEpBggFi1LRnm76Ev+0
 BvtUdLp2B229dpMnYM/zhrXeg4b9TL5YbgwHSSEj9HS8sFHVWGfQABkuXMekXaqlSuYTgyFNzmt
 8MU1LNrYzPCj1oqygz33XcHsL43M/ROBKpmqfLjqaOy82fPN3mI22eYh9a2B0lZdpbCfy+Gt3T2
 i89zV+xdf/z0nOW6Bocj4TGkQserjdGNxfSlImXHtEk3OqTynWgfUlOrEFCIbQEXUtePRnz4QDS
 AZ+xzr4C1BarwUWIHye78tq0o9XT6ZvYhSjXAcofQIfXnGDMeZ60qwLHe6+6ibrQz7LCgkYG9AG
 JXw+nCKQUGPOZ0zdGSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270150
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94494-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6BA151BB0B6
X-Rspamd-Action: no action

On 2/27/26 3:11 PM, Vikash Garodia wrote:
> Currently the driver switches the vcodec GDSC to hardware (HW) mode
> before firmware load and boot sequence. GDSC can be powered off, keeping
> in hw mode, thereby the vcodec registers programmed in TrustZone (TZ)
> carry default (reset) values.
> Move the transition to HW mode after firmware load and boot sequence.
> 
> The bug was exposed with driver configuring different stream ids to
> different devices via iommu-map. With registers carrying reset values,
> VPU would not generate desired stream-id, thereby leading to SMMU fault.
> 
> For vpu4, when GDSC is switched to HW mode, there is a need to perform
> the reset operation. Without reset, there are occassional issues of
> register corruption observed. Hence the vpu GDSC switch also involves
> the reset.

Is that a characteristic of the hardware (e.g. also seen downstream), or
is that required with upstream iris only?

Konrad

