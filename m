Return-Path: <linux-arm-msm+bounces-112166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o/KlAj4JKGro7gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:38:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0230B66019E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:38:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="YZFeaw/a";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="ah/X19r5";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112166-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112166-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 104DC3004436
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 12:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94145416D0F;
	Tue,  9 Jun 2026 12:38:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC98416CFF
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 12:38:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781008695; cv=none; b=RaYzBtJCvbH6AKUZFhe6Cl3RvpJN+JYn68stZ7vaMAt/2L6UHYkEzj+lzLloQZ+3om+prNPdPnd8UgBnC2TQ9T0y6N5C8e5BhGX0MP0Dcy7BQAdRGr54FgN7ODOPlfnOaQY9YDX/Zi8KWc9ek7l+DonqQ1GtbqIaG0msnKUxvCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781008695; c=relaxed/simple;
	bh=mRigYsMz/Vz1sevTe6C/YeJI+ZTCaQr7OOMfR1RkZx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C4BqG0MhpqLmL8FpwGbTP24OtqyzYTnw3W7MEMAARI/uey6RwpvOr9fOTyTz1VI20rot5Xoa+XXcT0dbMIcFLwwrU18L+DCe0t4QhM4iRlJhOprqFCzoHtx1gyTrN3jpKot7W7iaziSxra1pCtMh5rHUPq/XQsZ57Y2rJpYxA+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZFeaw/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ah/X19r5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659BnVnW2117479
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 12:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SxPEQW6F7iAG3Vm1VHZntU8xGHPruOwa/hNoZljcUiU=; b=YZFeaw/aOXFI6/Po
	ZJB4LKmVfB3UXxucNHCzwUlUdadVODlnA9gmYzlSIZW704lKc2MnQiqi0zXxJYuG
	a4XkTarBFqPpxYdLoU+wQeeU1djgLp6UIowZvSpew8iOK48O3sITbgmaYAwhiRDx
	U8c1cD8DGrfTT3YzzZGFdj5b+9cib4NdqmGlJwmFMEFor7nj+oH27KvBujkZUWsb
	0EETFvLwS1QBdhN3c9ksibXR7YhqqPDrj4AZuyUc9QqN0kGe1oHrzhUVhhv2wa99
	erYtxRAw6ZS4DSik9FxCHtkWIQjm/VWr6AOhG73EajrRQ8/xZdLjzFHHrHbzO/2/
	Zm9pNQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeesh37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 12:38:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5177b12d7bbso9751241cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 05:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781008693; x=1781613493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SxPEQW6F7iAG3Vm1VHZntU8xGHPruOwa/hNoZljcUiU=;
        b=ah/X19r5Zx+R+LlxG432xjlsZzmzixUphOXANjTrqj5/WWYAdmoEZndN2Yp1exl0ye
         b+LTj2itUXvnZFihkEshIbg5pqB0+rjduyIFdza0D273lEv0iqAqXAfx6x8XvHzeHd7v
         o3mYq/CCz5tUF9RkGIZe1NC8X4HVU1jSGZcNlcWgnN4EQGvWwRgMnkatNmFWT3ilNJbW
         Pigu8bn9k2hjpTo7EIEnRoIBs8NC8VK92UUfFetlputsa+UjU+pxfHNhnTxggy4ucO00
         cjQkIdiMnd0qbhTKihGm1hA32sVwIWZe+luT+jSjN2ZJlCoCgkw1Ezee1yxgisBStzQT
         3s5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781008693; x=1781613493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SxPEQW6F7iAG3Vm1VHZntU8xGHPruOwa/hNoZljcUiU=;
        b=BWbP1K10/gnKNWdXCGBUS031L4Bv/ZzDRHSH4dG6szS2rc14522tzPOf3nqkU6n+Pr
         1p41KLYsrfjmxpK7UyNN4DuHgy9YljEmn5dL2maUMFixNDfLT/pV6hARSybfWHef5ZeX
         eeAiHNEPlIwIrmXkMbIcNf2x5dSm2+ySc2xR5DCP6+oE6X4kAZtYdoqhWB4MoTO9uiOQ
         Lr3tXQ719bLh7njednUDF1Ke0Bwc4sJn85mdYBt7VE8maUHks3WW7Zwp5UcVNI3vQ3DP
         YWfs9mPWMrYsgFXqGd5jVekP1YrMTRvvB0/mTkwLoASWPfVwcIdab0s8kQf0tS27Mq/p
         q9hw==
X-Gm-Message-State: AOJu0YynG8ee2heJJMmlE1/1yI0BrAovrIha0XNBCSkBCBaa0lgBc8sv
	elJxBvXmr/jHVGDLWES1WBVvHpqQKseMr7zoM+Y7pScnfg36znnI4mca5OfzgkYK1v17AWZnCZh
	TbsZvrgJV6gQJfqx65itdhVTP2NN3Tgo78/uafbkPU7JOY/Gm/4RYUsL02VDBJ9CkINH0
X-Gm-Gg: Acq92OFXhPHaYy9rUIeZi9B9f5AkGEWcTdpJ6/Nh5+f2kdJWRMkmtlkMfdZJbwqHDYv
	/a2n4YP2P7Z7N1IXrW5z8wrB/7JVTiV9JY7wYylvc1snmGm6tfwRT6J5HJimYseMvFnWgUpRvGf
	Fm/H1qqIEx5NQzei6wzumnOvHTc4ArdUYSEvy5/y7hJssCf50MaQVbq5EsPeCtUX2d+WHtzTyYX
	CIEZExFOum7iJ9l/G/TA3TkcdT1FYPNRfRLF4Vwi/AbIOplxdCQ19p8EeT+H+wrKofv6sVKVrPw
	YkyuzDPC+HmQthBmqVOQGRnhx2mSiGQLZG/r9Oc2Vhy+A0ZfoUHRpjNspx5j/adRnr+U1q5sfG3
	Arzx0WqICF6HZ29qMOh19AEHppkYPMhnFxD5bQcJb/F0Qawqpgrs0Lz32
X-Received: by 2002:a05:622a:93:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-51795aa8074mr167158891cf.1.1781008692656;
        Tue, 09 Jun 2026 05:38:12 -0700 (PDT)
X-Received: by 2002:a05:622a:93:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-51795aa8074mr167158511cf.1.1781008692089;
        Tue, 09 Jun 2026 05:38:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c85e76sm1053734866b.15.2026.06.09.05.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:38:11 -0700 (PDT)
Message-ID: <034a70bb-43f7-4b94-8a85-dce466081473@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:38:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a280935 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4hBvweVN3K0BpMZFuekA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyMCBTYWx0ZWRfX6aRKRCgMm4Bs
 nzbMkRepe6vjBDfRv4+5lhmTMYR1Z67NA4XZBlMa9b7axxovCgGjQ5NhACF04B3NcrE0tPV+64N
 HwTTuOaVQsEw7oWo1wDu8oazozcWttkhS8MCK0Bhs3PwPnmbdszYxZPf4b3V0N/POqoHvRe5aND
 d/5qsam7ZA+cU2Iyq/z542q+q+lT5hFyQtzV9QN40PfAENOvdSBvwvqKe5pbnW1yxVttEr8u7HD
 ouwl4jppSl5HKHtYOHMl7P5nvp2ecK7zP3PX+2x4R9ZCix7Pr0erMGw050H1cdeo97FVXuXok8U
 /pAi6Ste0G9uqpXaHLxH8U7Ip5aNFYx4lYm1KEIzJKFq6s7dv547XNalITT3kx4zShJ+D2kYTsI
 3g0x9Kv/TJWrfR2IbYmfNGJP4lW/1dFzdr6WJHVE3FWxM9FFd99344ZTD97Xks9g/XuSLdJjgpO
 2SxyIqWg5wLSfzaWAnQ==
X-Proofpoint-ORIG-GUID: RY-JwTicDqnS_l1pSjjbbiJZaR2XWJCU
X-Proofpoint-GUID: RY-JwTicDqnS_l1pSjjbbiJZaR2XWJCU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112166-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,init_data.name:url];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 0230B66019E

On 5/28/26 4:29 AM, Qiang Yu wrote:
> Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> register controls whether refclk is gated through to the PHY side.
> 
> These clkref controls are different from typical GCC branch clocks:
> - only a single enable bit is present, without branch-style config bits
> - regulators must be voted before enable and unvoted after disable
> 
> Model this as a dedicated clk_ref clock type with custom clk_ops instead
> of reusing struct clk_branch semantics.
> 
> Also provide a common registration/probe API so the same clkref model
> can be reused regardless of where clkref_en registers are placed, e.g.
> TCSR on glymur and TLMM on SM8750.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

[...]

> +struct qcom_clk_ref {
> +	struct clk_hw hw;
> +	struct clk_init_data init_data;

We don't need init_data for each one of these, we can construct it in
probe scope:

struct clk_init_data init_data = { };

init_data.name = clk_ref->desc.name;
init_data.parent_data = &qcom_clk_ref_parent_data;
init_data.num_parents = 1;
init_data.ops = &qcom_clk_ref_ops;
clk_ref->hw.init = &init_data;

ret = devm_clk_hw_register(dev, hw);
// not needed past that point, __clk_register zeroes hw->init internally

Konrad

