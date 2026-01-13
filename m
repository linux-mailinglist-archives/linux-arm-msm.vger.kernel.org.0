Return-Path: <linux-arm-msm+bounces-88701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3B2D1763E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F18D302D3B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2DA3806BD;
	Tue, 13 Jan 2026 08:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jGbyjE/n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kc5YUaMR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5443806B2
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294354; cv=none; b=B6Ol2AHjRS0lXRVkNdly1mXkEfZuICGvc4pBe2KIv8WjvYinbyKp950kpQdbXSgTCRi7DlCqQhHmFRIfVmwGjEhzdg/wDdS6S/wbxcyPKdN3qB0xihEkX3qrvANxbCxv3yYbNR4L/4FmbFHRDLcARiZR4ZrYCAy9xPc9U1nAeLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294354; c=relaxed/simple;
	bh=MYVpvlzSOVjOCvsPeYESexAjv7dAT3KEzdLpa0xc2IA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o1e9dVua29kbnvdE0Wm5cOTnUdC+yFM3wQ4jIXLYd7pAESKWe7TcCcrHRGlKYiAtAXiBQF0WcBrdp1xzBVSc8umlL7NQH6ZLsiEP32Gd6xmqsD2HVrrvq/kf0r4pX9HiKIL+biar3AVOQAzHaI0PICgUsWeAXQhTAG1irA6t1j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGbyjE/n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kc5YUaMR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7wcYW3300067
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	akSlLBvxW6+m4cNwEhhn8aCcDRvgKbnoX5vi2x8CPOs=; b=jGbyjE/nyE4cMI+G
	8+ZcKc3q19HIGMt7pNWhzN8Z1wILioluZDk4+YrzgFlf6byeJ/iz5OTfDB+frLmZ
	SE7fh4JC3Iw7wSXpIPahyy+5V9wzkKi39CWTPQMLZ9BalLDGt9w3qPdmN9MzmN3K
	70bp/cI5Q3Pm5hmQx/3ZPzC3JIYFbpcHLRy4il6ae0owMWNcjkD4ZoyEeHUS4SEN
	485FBV0jeGMQ9uaVcyxQiWGKRRMrnBEtnhSGVAiDevehBHPo4l/94rhPMT1pdqUG
	V4xuYBqqTeqU8hdT4YluvXJviJaiD/ns7gmJIARPdOrVxUT0/7sF8ur1sISgHEgP
	IAVkcA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jma2n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:52:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2ea2b51cfso166414985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 00:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768294351; x=1768899151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=akSlLBvxW6+m4cNwEhhn8aCcDRvgKbnoX5vi2x8CPOs=;
        b=kc5YUaMRuPM0+Xg1hYPyX/v6L4jCHcl0N0lg0/HcTvH9f9Qc+Bc3sjBHFqPa9lwtCZ
         elZIpZt25jyVLT/TV9UixFiw97IXYxsWUsRHpZYI/TKo9S6qz4PFHM2TQVF6Q6GfHM5Q
         LrwwrY0b0O/NohJb6jfUqcZuUVONgaw1KK0YWq//9SVCk3JFm9W3tLI5GhY+dxXbAowf
         +xjc+HulVjaz8cs7o9Bvl0oHDq1lVDTfTJwrDRGrYkC1rUmkT2tC9b6cnbbowgw4axbo
         xfz3O+5lfZxFqOq+M0GJE21PvuGOQXsoE3RJXQxHplx28yKi0Pdg3SY4VXU5+g2oQI6G
         0srg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768294351; x=1768899151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akSlLBvxW6+m4cNwEhhn8aCcDRvgKbnoX5vi2x8CPOs=;
        b=d02luAg9fK3zzG86MbA+d1Z2SegnfYLWpmCRhVBkacqlLpf9Z4LbS3RPoxcXZ0ptf+
         2wudyOLvkYggCMzbWd7dEspHDGkM/Fba1sTdSgzNeVe55Vx96Cd697CMy7LZzQXo7TwY
         GC2gG3d94SzmDX/n+DVjBO+hNsqrjYbbBT6TDNs7HUjeM3Xb+krAxiDWojClhibKzkEw
         WD32IhG2EBsM8aJFx4GLaYbc6H0i4neks07Dqn17eAZS5iU4LQMTuKeW/qNUGd46C0qa
         TMnnl1ovAX5qyXdO/nLXwlbU2Cohf2VUOTln6eZFWMeI6tp3fW1uubfOM7tF9zGYy34X
         mMNQ==
X-Gm-Message-State: AOJu0YzRpherG8iC76O3vmBDb1fjprAuleAwffCG8qeKTC9BpxWDglks
	PKk1OMTECOfiyoVvdJ5QTX6ZJKQD8R/Pve97HwCyuXCNx004d8M/t1YPsepFPXMSQTFSszMj08C
	UczHXQJKp1MX6ykCPMjEQwDb3gdlYPRzfXmvc52W0/zrVMkjoOWLK0hWf3UNMMcJ1DYqL
X-Gm-Gg: AY/fxX7THoNVfvp30ez0A0mMXdFRqGqUDzYfSlNPDRKc+icc3bTxF2BRYY6ct4DQt2V
	7jdyjaaeglUXV381IQQU65W+8Qtv9h//79ULbrJTj32noEMNm4A5TSufNojJ9tf3LaGYMEoFkfl
	siE6ooFeo/tUOmI0Fp+ht2tOqRVjPi8AbfFVsjWI9aMlhnJmDu7nV0otzt4K+yVp1N+nVVeVq7w
	evs0KbQoBYyKqpnWXvMWp840OIWzXgq3v73Bp3FixiWwLpQ+2Ak339mqP+ZLfDqdHu8ln0EuAxl
	EQu+B+zQwHlOi04x0+JAsTicHDQCE81EqTVxzEd62i3W3kdeKVbUrOpq9T+Y+5IroYMn9p/mKUj
	6iM/RlKzEcCP21VEYGtINm/+424g3/g+sROFNKKCqsDbAL3++lJ22DVwgUzEgmMyoNuc=
X-Received: by 2002:a05:620a:f0f:b0:8a4:8825:bc6c with SMTP id af79cd13be357-8c38938b477mr1976258085a.4.1768294350735;
        Tue, 13 Jan 2026 00:52:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGe3HcVWbu4Z4k8wHtyc1vE5rWOAggNipetl5IuElZ4I9M3hRUy+qBAyoWR8QocyXaFxxBFIg==
X-Received: by 2002:a05:620a:f0f:b0:8a4:8825:bc6c with SMTP id af79cd13be357-8c38938b477mr1976256285a.4.1768294350310;
        Tue, 13 Jan 2026 00:52:30 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d683sm19788252a12.34.2026.01.13.00.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:52:29 -0800 (PST)
Message-ID: <69ddd3c3-e3a9-4dab-9c0a-4d5cb3763a5c@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 09:52:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix msm-id
 and remove board-id
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-1-8e4476897638@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112-xiaomi-willow-v1-1-8e4476897638@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OPbwlpxjggwndHu3FB-vGVjzTjhfcR8A
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=696607cf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=4Ix3DnIw-zF4zot3V68A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: OPbwlpxjggwndHu3FB-vGVjzTjhfcR8A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NCBTYWx0ZWRfXxPhTP3/4fw+8
 7X4uQSasJLLNGkQM5onBjuC/kqEL7oM33NizbuNIP3Avj3L5dzyg1HkXrRlT5+gh2y55OKxGi/i
 VOirjrEM7E9bqwyXi9CXLHoaUr+nCceb5jqRQDO+EY4uCpdWsfPknFBmvLhfkUzJUOxtHYWmPpU
 QCoRdMHLK9dt9cifI8AvXTdEij2aURrH0ql1yxos/385dubAm7nXzyITglAtGpfKp66tsAPlNpv
 NL6mAKeClKRx6selUTvD3fRz4hWROtfZj3k720HIQcp70GCn83qSTa1LC9VapLM1aCGKG4XlzT9
 m8N+aUEsNQQ6w5K8sh7DuafGgB1ZLXu95NlshASeE0K7sLsL3jCxzJDG/x2ksXqc589KqSRzoTB
 /fqasIn7nuWpGcd68f2+Sm/Ps9fwjxgoEflbXKUyS7M0ezGrifmoLMFYjtg49COPbxcPBh1pAgs
 DOOR61WxDm4QDd2eRgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130074

On 1/12/26 9:13 PM, Barnabás Czémán wrote:
> Correct msm-id what should contain the version 0x10000 and remove
> board-id it is not necessary for the bootloader.
> 
> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


