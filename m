Return-Path: <linux-arm-msm+bounces-92726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8E0GG3kBjmm0+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 17:36:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B8412F81D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 17:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20687301C5A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 16:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A425035C18D;
	Thu, 12 Feb 2026 16:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oAythN75";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XaPrlk3j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AA43542C9
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 16:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913920; cv=none; b=kyBYZsHrwaGYgFKjEaT5wKha3OItis0tBfRTo7MHUiaKhBNDqGdSEQnvjsDifRyP5j6gE/LmXwkcVAwpgdnBqd1AGmiQ5XFvfmhnDi1xRU5am7ZBANaPp2l0vr+5WbjjT+gNHhfch5D/8M6Vx9VinrAEEJFWiTNeEiACTGSeBRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913920; c=relaxed/simple;
	bh=lqp1vYIvVtjEJmhwPsIBSliYmjO2mIm2/HQ2+ixpneo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Hch9bjkD85Imh6ZklLvAFxfMce1bxLw+XotlrZmgfyUfyuq8yMz0xclxLQERGa4guxdO3BhFB+DLh6M+6axdHe8w1PUNQ6f0xStM+KuJhKGjF0mC85W46zc4qgP0OOLEq1lN7oHgjliag0Hqr8GAiWLyg680QhbtMitxA3EZ8dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oAythN75; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XaPrlk3j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRxcZ1074872
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 16:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kbe2C/3H5RcHyrBurmPrlUVdtgJk9ApFxvYyiLaMQas=; b=oAythN75n8jcDW5h
	2siQ5LGMMJNE9GCAV80jS1l2Xtq3WN7GA+XpBxO0anQ6Vnr+8gYKPiChs6VIvxvY
	hidNvaEXXDo7Tr4pLw2D/+oq5U0AL4N8o2EwDaaguqUU2cs6n3S8OSrPULXnqV9+
	hAFMaHKlLkZG09Z0t7aoXUjNBU3su9YAlLxKro1Y5GFIRf+emKSZknHkNrn8I12s
	QDbm0zD/bgwz974fDPRBMou+5WzF0C/D3u/5odVc8mdVmTQjmLoXz0EdR1hevJr/
	oAZoT2A289E00YneMtQ8X8Y6wJ39v5xLkd49aGlT3cqURyTGgeE76tGAuP6b1A6a
	6mmWFA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y8nury1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 16:31:57 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-567560838f3so6318e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 08:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770913917; x=1771518717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kbe2C/3H5RcHyrBurmPrlUVdtgJk9ApFxvYyiLaMQas=;
        b=XaPrlk3jj8raNka/uM9x1u+vCdc4FLo5Mh8y5BvfcQOOiix5oh4EsfpleuK5LhYyK3
         sMZ40gK83X734MBBSGCC5iqr+4PLvTe9k4R4N1AfJ5MHpNIMBx6AufEV/qiSpNeAHLJN
         5HODdtcSGeDS8yIqArLlyEoR03xp7YivLsDvMbRgKBfVSTa6OLl6IvKX1Sa2JjtP1caY
         iaOXauWz1XX3r1SUf+qCSWdixIcwlKaT1CxEqtudCXq6ktasEyHlwlmpnRYhgXjS0oWA
         H+/zSGfOTEeUH34UuSiNAbFswekV7l8MfVMOEz9wg4jMcZma/Tlen4mkTd1FCt5Jagm+
         HmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770913917; x=1771518717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kbe2C/3H5RcHyrBurmPrlUVdtgJk9ApFxvYyiLaMQas=;
        b=bcwtSjzXAJGT+taIBdSp2I0n+0x8ppxOmznPFvCctubkNl6mWgwIxDQ7KvjJLLuP/c
         4DeDsOamL0+9Ntw9sDl5grPyK47msR0447aaWGUksmo24mp3W+zeLS9DJ32z/sQfsZ+U
         eEKRG0KAQzKJoHUo94BbL0uM9RXBG6aMy6NGysqjUfykgdFuwK7AK+Hi6ahegPDzaaGu
         S8hFVR15KSH/D1nR0JEvMAWP45rERZEglUxErW8MXSubkSgmXuJTXLvBP58WWx/ScJck
         tZwiIlV3t1u/1WoIfcdzZ5QsRhdbnCyL66WyeuIWr8Aii6rqpMPHNVjuQ4eGM2bewgX+
         l8Mg==
X-Forwarded-Encrypted: i=1; AJvYcCU53ZBBHQkQkq9wPIsknZxqxvgrT9CcSyHwjegOHBasUGgSmy6eSvApfuwNBlm2qiRZrwgDSHKvMf5cQ05/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9t+hVK8ZwGuiHtoQfjEGIoUy+tCgmHGfYTXnD2MrtJrmQqGTw
	0ATb7QPfJ+wS6QyXP2fIalFhdjWDh6haEiWqTTHD0/yjH9DNPgv9PyZpr7DkXEPCJrgljav0KHx
	0V/PQXD5jOGw0wfBUvqLvt5x/D3fSvTPjAN3thWw9YYqe+9Xjo1d0/8TD23l51p21mnIW
X-Gm-Gg: AZuq6aJ89vUZLvCW6bqg83JhgN+6dqK3NLTqHIUvQad7oHLUmksa5EixrMdwwK+2NfR
	gqQRgUx5zAfrT0fJK342qMKXWfAIkIIoPAQ4FlWNeb/U/ibar9yNeOyJ0u7OPIZZV1MlAxWjTqw
	mywQPRAPbz94RkGbIFqVYxwS03mVeaTw/Xx+l5MnXtDJ1gcC5kH2UKhbHdaXNJlgIyKVf2iLeG9
	Q/uyc+391h/+nGKmV+TVyWFaGJJfJ+vCcCKfnfd9N6puH8YpCOqOiR5iQKfOUkCTzgO3NUa4Mjz
	xfS65Eg6+bC6VFWcDHnMnQbzwhy8MPSQk/POhwMuCE1lxsBfA+CgLxJu+IRRsDQ0RlgsS5DcCmM
	MEroHYWeg1kP5t/dtIWx5G+v5bqYOnaNlrPcoeG7lq/L1uWkEckU9pzCp85bw6hTxoOIS/6cqpF
	xFqHc=
X-Received: by 2002:a05:6122:12bc:b0:567:4293:8d38 with SMTP id 71dfb90a1353d-56759bad998mr431792e0c.0.1770913917065;
        Thu, 12 Feb 2026 08:31:57 -0800 (PST)
X-Received: by 2002:a05:6122:12bc:b0:567:4293:8d38 with SMTP id 71dfb90a1353d-56759bad998mr431775e0c.0.1770913916604;
        Thu, 12 Feb 2026 08:31:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6e9e98ecsm173956166b.30.2026.02.12.08.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 08:31:56 -0800 (PST)
Message-ID: <45e8cd4b-0b5d-4c5f-8c6a-7be7660f14b1@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 17:31:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: thermal: qcom-tsens: Add Eliza SoC TSENS
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260212161949.120898-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260212161949.120898-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEyNSBTYWx0ZWRfX5tP5rNWyDHJs
 L3JpDApPsLg8RlsY/QaRzxRYaJU/iG2gzjfA//6cVF93SeX3yeYnJbJd2pWcTsMn6LkfwBku9P9
 wT8MqDXGqIIIWoftp049yGDrwWJ2ft54EltkU+7/tGC7mKZ0nyyi7sP+6kJgWWyQUc8FqofY8iO
 BzoGBAExcn+n8nOULKz9heWKMR9V3IggQD9PNjbapP+ChVt3UbTj92aEhxnNTD7gp76R0NMu0/6
 ZEytHEpxO+Vgp0cDAXiKnRCjEDiPiSn7rbpIKS4kb3cgI0uPYoY8Yj4N3++mcPQLGO4nAp1pr5P
 N8p2zwSNKPYOK6Hpj4njiIJwRjsLxefFFHv2p2dUWWGI3go7KM+653c2G78LglPlNmJbaQvb2d5
 iNQgzK/+tvYV1GXN43h39FVynGUpTEjVpYgHWB2GtVmqlN/YUHPOel8tmD/urQJzqW17nr6tlSL
 08HTHHPEVaSblH9vDYQ==
X-Authority-Analysis: v=2.4 cv=VNvQXtPX c=1 sm=1 tr=0 ts=698e007d cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CnfyucVePACUQgo_Z2AA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: mpFPXcqAwPuk-o7qPC9r5BZ1dggJ412O
X-Proofpoint-ORIG-GUID: mpFPXcqAwPuk-o7qPC9r5BZ1dggJ412O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92726-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 89B8412F81D
X-Rspamd-Action: no action

On 2/12/26 5:19 PM, Krzysztof Kozlowski wrote:
> Document the compatible for Qualcomm Eliza SoC TSENS module, fully
> compatible with TSENS v2 generation (e.g. SM8650).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Eliza SoC is being upstreamed and the compatible will be used in DTSI
> posted later/soon.
> 
> Some existing work:
> https://lore.kernel.org/r/20260119095907.172080-4-krzysztof.kozlowski@oss.qualcomm.com/
> https://lore.kernel.org/linux-arm-msm/?q=eliza
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

