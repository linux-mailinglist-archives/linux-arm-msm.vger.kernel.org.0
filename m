Return-Path: <linux-arm-msm+bounces-91308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEv/Dm2kfGmMOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:30:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A398BA8BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BF823034E01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DD737AA97;
	Fri, 30 Jan 2026 12:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LfCKsPzC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J04UghwF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEDB3793A6
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769776201; cv=none; b=qTPtUbN2AUEewX2pxvBiLywOQZ4mGafO8rwitLbtuUtiCocBTtz/t9QGetOqBwUlHIr5V/SuSMsN61CkZUTZ5ZQi4U98lFWgFapiNm2sfI7hc0tlcpuC37UHiaMPK7IQqopyv0ekBSLiGIxu3YJXMxAQ9auTHzLpWcWVPHP39Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769776201; c=relaxed/simple;
	bh=TzNQnYbdPnSCMLy5F9EuDRB4TkgihP8rJO/RviGG3Vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oBSNmFmlSumQCuyfXhV6epA/zWbPMCJtss32mVGyFMYGItQJ6znro/Hnl889G/i94jaHQSzWBNztlWdv6SuLJ17YQ7iiqoqPZAwLU9fNQvoBleAgOTrivGE8nptt9PyhoBufKTk3jqMkHjKP5IDMSbUDMxNKz/c+GPFsni4nWxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LfCKsPzC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J04UghwF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UCSCmK555440
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rDo+PFuobgROx9OchFR1DZDZSYnIiQl9a/hbFREcvcQ=; b=LfCKsPzCEq07Pd4g
	PqG4nwYualWPwQMzRn2TVDSQknIlnXRXnREEejhgp7FNYr0A2iSvClPXjERqiXGe
	UbY8I7xpcROlHdrNhLrzEHOikRaAxRP3XkreIEBk4/KD2P5dxCwhDow8ztLr1eCU
	+6zwPQrmIOvOulbb0SXJ+Axjk6KlexmkHhZuFB0Z02JIlLAFu+/A3ejRfvY7u7Aq
	CdGZ9jd3t9LJDAlPFmJtBTytTWox/uCgtg5Xu9dJb/mtjeS5by4y5Xvg4SmWPocG
	UF8Bx5+++PUW85669nu39rg0aNRZwO8QuMLQAGo6oOgzax5SXmeF8l0G129dtJrU
	kRHCRQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0p59h94u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:29:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34ac814f308so3199830a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769776196; x=1770380996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rDo+PFuobgROx9OchFR1DZDZSYnIiQl9a/hbFREcvcQ=;
        b=J04UghwFNu0rEaXX+JHh9Q5pSB3aNG9i0FE7zE62rUQFMIyCD7o2zNWmL9xpTzy6pq
         bHD7s1DRHttkIH7zJNdjpENuP5GB6lZEa2kr1PoWRtKQbYUepC2y9H5gmjByK0cnIXns
         eeHRwJZLpbP2/75VkxBPOZ48DVuO11DE74jcLmOZ4SamR8YM3GxuqRkdMCDSKkl0pD91
         u5kbvlpNtqOC2uGdEMEncXiRbawe/qABgOBQHe2jaCiaxZr4EhxIdazbNu1RjhiWhhTl
         nLXX5axflSYz69mGSYDUAv6hhvUrn1JH/lQ6vJtzva6lCSTmUqh1V5zQfC6dzOjeEGPc
         8K/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769776196; x=1770380996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDo+PFuobgROx9OchFR1DZDZSYnIiQl9a/hbFREcvcQ=;
        b=sLsK3fWsAMiBEqPYHPos7SnI3OtGFNQh+SP/l24Y2DEG2GsSDJKq86d8+HYKK0SlyB
         hMRWPUr4vV9PMY4odDKCCw5d8tUjhJatAJyBte2zaap7AiBIR303reEfSUHVMa5ZxxLC
         r4PnH2aS6V0shJx5qeLYegxSsfCEk4Pa4crqH2d8aTZkrNXYYCxfA0OMsFWcrQ7g2V+s
         X1AqgMRfFchc+8W2pL3y4L8EgcPKzIJDnz7EFv35wt4LH117GPXqocnY/YWAy5Rg8BM+
         aFrxS2my6pOLyw1IY4ejBp3fcShLNLkWGhzIBRa+Of2GmWHGzp8pEmO3KsiUzcn6d58H
         N0lA==
X-Forwarded-Encrypted: i=1; AJvYcCW0wz/PPFV6vVDluLLA14RA4BXO0CtMH86m7Wu5M0WGJo/4HFZmhaERLw5Urj3sMc+gSEzZkYg3RHS3brjA@vger.kernel.org
X-Gm-Message-State: AOJu0YxbchbcGAAamD7PHiCHmsF8Tev63gB1i8q7VKfhkTvaZvF5q7OZ
	FKwrAACuR3Atw6dYVm6t8W+vYGVmrHS03oAEnXr+GlzBYqAnTAaOwG8ehUpOneG0+PI6Rp3McMh
	tkRNUfv5JSNbVmRnZeH3PkzV57YMNya1HZI4yho/LeYVlk/k0nx4/zfHvLfm4TGsio/vG
X-Gm-Gg: AZuq6aKYhuaxKOXBXGpkMC9fvoIA8KlrmBJl0LnnGtXqFrMc0imzcnOeD+NBkPSk7jw
	MSDHehwHG496uwhzHx40ZqAsE6hNeNRyu8Me/xcJOICaS/6QyDBThxsP5hy1x910KxRkj6z8TBp
	3+BjPQCu4P0a6AsRzGtUDtskLwF0TVatGwIze5Or/EEQ+3kWIHHK9oH1jS8l5sN5lW9+4o5yW7E
	vuV4tff/utgCxLBE30mvd2Kjo8c4cMe7Y+2Cnt5AX/ppcmwcfQd2RUQlnq7tA+IRrT+/fm4KvGr
	55KgRj8nz4BcqavUE2ma2qJi5ZRD4Hretd2I83ZS+ZDsAgbyfo6f6iCkpqdOMoVYNuFx9VrqHQk
	/njEqxz6LlHYgdxR30QjBumN4H+nsUQUGwrxQzic=
X-Received: by 2002:a17:90b:1fc4:b0:339:ec9c:b275 with SMTP id 98e67ed59e1d1-3543b2dfddbmr3142158a91.6.1769776195690;
        Fri, 30 Jan 2026 04:29:55 -0800 (PST)
X-Received: by 2002:a17:90b:1fc4:b0:339:ec9c:b275 with SMTP id 98e67ed59e1d1-3543b2dfddbmr3142140a91.6.1769776195268;
        Fri, 30 Jan 2026 04:29:55 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f3cc7absm8383430a91.12.2026.01.30.04.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 04:29:54 -0800 (PST)
Message-ID: <3d99e35d-1aef-5e04-55c8-628918e29da4@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 17:59:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/7] media: dt-bindings: Document SC8280XP/SM8350 Venus
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-1-d21861a9ea33@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-1-d21861a9ea33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GBXSb1FM-vCHFkZXMbocRjNS2y9PVBwM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEwMiBTYWx0ZWRfXwqHwAK4YllJT
 BU+2hHiYwWhf79MWiM0uuDc9Fe9WXaHRm3FdUpwfCDzAep8ibJ5s2kjtoHQA40SoYBBRrGc6k91
 9Q5c70/1EqPdnbb/4tAPZU5njByKQrfF0tqoFXW5gBkkBv5pOdItPBR6yIFmKTs6ofVno+/xZsk
 tS6tjiamrQfgj2FHHW6WoGCJBX6OHWCpfSC8ojG5rrk1WUJlQMsMPsZ81anZnEx1d+b7XiB5QkQ
 cAYhkXqm/aUk5fOmSUBWXHIAIod94MJRLvfRfMX1/MXMIVM4vRepqM4dNrGTavHE8k//4ojVBgU
 8bjjpL/63wmKQLZKyyPny0/iTRr98A3dBaazhnUytbdpFN4VEd4b+SjoB/S7SQoXkptpSGY1dfx
 oRETKccoLHx7rY1w1XS6YoPkjWO+diJuEY8WdZ/Ryfwg7QHOpn33unic17xuh0oDafcmcUM+eGC
 e6BautUf+pAfRp1/7NQ==
X-Proofpoint-GUID: GBXSb1FM-vCHFkZXMbocRjNS2y9PVBwM
X-Authority-Analysis: v=2.4 cv=Re+dyltv c=1 sm=1 tr=0 ts=697ca444 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6cH4IgXjao/mkWo6W7aGpA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=OsmC6vrWmRsS_wS6iZcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300102
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91308-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8A398BA8BC
X-Rspamd-Action: no action



On 1/25/2026 9:02 PM, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Both of these SoCs implement an IRIS2 block, with SC8280XP being able
> to clock it a bit higher and  with SM8350 having 4 VPP pipes, while
> SC8280XP having just 2.
> 
> Document Iris2 cores found on these SoCs.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> [ bod: dropped dts video-encoder/video-decoder ]
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> [db: dropped status, dropped extra LLCC interconnect]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sm8350-venus.yaml          | 113 +++++++++++++++++++++
>  1 file changed, 113 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
> new file mode 100644
> index 000000000000..d78bdc08d830
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8350 Venus video encode and decode accelerators

s/Venus/iris

> +
> +maintainers:
> +  - Konrad Dybcio <konradybcio@kernel.org>
> +
> +description: |
> +  The Venus Iris2 IP is a video encode and decode accelerator present
> +  on Qualcomm platforms
> +
> +allOf:
> +  - $ref: qcom,venus-common.yaml#

Pls remove the reference to venus-common.yaml and follow schema of
sm8550-iris.yaml

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc8280xp-venus
> +      - qcom,sm8350-venus
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: core
> +      - const: vcodec0_core
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: core

It should be named as bus not core

> +
> +  power-domains:
> +    maxItems: 3
> +
> +  power-domain-names:
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: mx
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: video-mem
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +  iommus:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - power-domain-names
> +  - iommus
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8350.h>
> +    #include <dt-bindings/clock/qcom,sm8350-videocc.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,sm8350.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    venus: video-codec@aa00000 {
> +        compatible = "qcom,sm8350-venus";
> +        reg = <0x0aa00000 0x100000>;
> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +                 <&videocc VIDEO_CC_MVS0C_CLK>,
> +                 <&videocc VIDEO_CC_MVS0_CLK>;
> +        clock-names = "iface",
> +                      "core",
> +                      "vcodec0_core";
> +
> +        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> +        reset-names = "core";

s/core/bus following the existing YAML

Thanks,
Dikshita

> +
> +        power-domains = <&videocc MVS0C_GDSC>,
> +                        <&videocc MVS0_GDSC>,
> +                        <&rpmhpd SM8350_MX>;
> +        power-domain-names = "venus",
> +                             "vcodec0",
> +                             "mx";
> +
> +        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                         &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                        <&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
> +                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +        interconnect-names = "cpu-cfg",
> +                             "video-mem";
> +
> +        operating-points-v2 = <&venus_opp_table>;
> +        iommus = <&apps_smmu 0x2100 0x400>;
> +        memory-region = <&pil_video_mem>;
> +    };
> 

