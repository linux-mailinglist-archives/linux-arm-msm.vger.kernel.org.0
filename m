Return-Path: <linux-arm-msm+bounces-113811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nBDyFce5NGqVfgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 05:38:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DAA6A3AD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 05:38:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YWpHj3Bu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PBtMyuze;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113811-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113811-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B2C823010DD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 03:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3052632ED34;
	Fri, 19 Jun 2026 03:38:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EB42EBBA4
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 03:38:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781840319; cv=none; b=EMHH8HCMCbcIrsvaFsQRJXhjbXe2e+USMOPBSZ8XoUukUl4XX/NlSHpOAmRlV/R0Jp+yJPzDqKUST9e1AZNvOq2bBiTnjxVs5/Hdx5vdFcUlt0dDjgK3UM5fXjm8NI0muRHo2/vEWONypxUoA4YsMVovSrSQP9jYGOlvmBtqAfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781840319; c=relaxed/simple;
	bh=6I8FyXeCCWe3tQCxApHyEyXz99IduHe0b/S5cxaOHaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSZI1es54qfCF5iDqzbiyUBsCG0pgN+IMwcgX9fo3spR3Y6k1KHapvq/Jugwhd7Mg5fEIssWG8mr3j9hgkjIScXp2gBxyT9JCAe77B9FqQ+FPy6nnXs7aQQtNRXycFSoOWPLHZFziIALdaZ8EWowQjpspNz47ugL+UK24HfBHWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YWpHj3Bu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PBtMyuze; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J2t4ta3081719
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 03:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H8M/0W0fDZglg9470q+DR9bzvfomYGwHSgp+ozjijcw=; b=YWpHj3Buqcpj4cES
	kpEWWZJiuBajn9ZoIBWok2owGqb9idwDV3TPdwBZ5GoUiZ7EhQIYlUEk8iTtiwhG
	ECRfHNR8+H5Pg7BQPUtbw/cRRML96B705FwkWlAgIqX6abXsjzu3GjlvVH0NsFvW
	W83aPZDpJ/osn27idsMq4e+OWjBjTuXGOKHdfedrhE1Px8qfb0URquiRgYgOnPcH
	MtcQl4PkRR+x4rUiBOSPI59xLAfxqtQadbIUfXuc58Yj0p3QP4lhCmwuhRX7qztF
	Wf/gCwCveIqe0Ll8zXuJ1okpldHCyF1hUoSzStKt+wbFzMRyojOrrOuTJ1mmlsVy
	RnuXzg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evdn43y4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 03:38:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8894570b58so857015a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 20:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781840316; x=1782445116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H8M/0W0fDZglg9470q+DR9bzvfomYGwHSgp+ozjijcw=;
        b=PBtMyuzeKg8dICjiy8biDAmnpi/KQEzkQ5f65jefWCIIh/XbQLRmGg2Pi1Gh1bBzG0
         tJiFe7PqXnXUZMxcKipFv5hwF8C8H9NuIrFtFOo+38mJSM1szjfobzagqFKdmEpFec9b
         SIIYmBRuSDkR6A5aJdJDV2ZGgMVcscswEKM/x1NAKOexEHlsoCAW3TRreF3/lpUGk10q
         TsLRh3BwB8QUdJ1y0C6uH05DDNzE0DHGOAxA9IPPxyj7wYAAu/Vj/2vAx+H94WMZLfrw
         DQZRcGhquFDAbMtVZsXY20goKsyrwG/lxA8Vq8sqYBlWt533EMItUF9mu/XkoylPoTmP
         o+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781840316; x=1782445116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8M/0W0fDZglg9470q+DR9bzvfomYGwHSgp+ozjijcw=;
        b=eagEuLITk2pahyjs2U65pYuiCRZz2QVHk1ZVBzkoqbq4ohZGGby7Kc5DO/LS9aP2+T
         AEH8BN6g2h7zOcH6/tGKRfZwYNi1lvPPbtg3N/4fADqtpAWUvMsnpBADbV/rE2niU/nk
         L8us/kAHHNmr+yDcOGR+6Cj1yDRInTiF4JE9fD1UEDKvEKPuRxYaT0sgaaySUfpKI5NV
         Fq6nmNb9F4pJFtprDmDOYaDJAz1BUDGtr/7f1b/nRG2kpt2hfoUBAKC1f8tNPY+0Lsno
         BYBl3KQAlIXY7q93ssKVQvKgfk5Nf7CCqyZYld2aD85DZB8tKm4iUWdBZYEZuOUW3789
         U2+Q==
X-Gm-Message-State: AOJu0YzhL4Q5Wsa7QQorAuz3ArVE8F6NRjjuOO4kytsLaKzsp4ozIV2N
	jrXQwjTLmM3HAv/1QIIn0UiGRPUFFIWyl/KMAS1hgqjmuInG0t6p8p22yiIrO1SR68UvcOyIyzd
	is6fMZe456BLFSDdJCzR3NqncRXPiTVN0gOqKI/PNYlgzZ8f53SmIhuvJITZscQiDqZzz
X-Gm-Gg: AfdE7ckYJ4c1+kHf2itluOW0hvHsJAVaZA4ySbULGFStnCQb2xBPcvKXVYc30hf6Cq3
	n80vw/pWKoE3XTvY163IbTAZRI/XEqtx+pDAHTWA2MlyeLXCjzDxDuf2rwo0NA2XgFXDbR0qQTO
	2K81SnzH4MVL8eXvv+3/931aAAXuHZKgXWhiMrScmDfcGO2IzoHVxpDnOq+fD9EWwAtqlK6TbMP
	WodSVgVmO66pnIZP2fYfK/PQP1HFEFoYbBJPCmOfsufnJUGY4nLrXWMLV9/Nw2xsU7U3fruujFV
	rsr4paNtStJQVQVAhfdGpYxi7rKgnz/olCESCgAb5dB2+6ZEWhqNh8VJzYVnsdJPs1gqfyHzFH9
	lW9QhBtn54K8G8/wAgtrg/9br7Zl8QpRvgZUSI1q0dRVl
X-Received: by 2002:a05:6a00:1ac6:b0:842:72af:b3b7 with SMTP id d2e1a72fcca58-845508bbcf2mr1852169b3a.33.1781840316419;
        Thu, 18 Jun 2026 20:38:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ac6:b0:842:72af:b3b7 with SMTP id d2e1a72fcca58-845508bbcf2mr1852144b3a.33.1781840315903;
        Thu, 18 Jun 2026 20:38:35 -0700 (PDT)
Received: from [192.168.29.100] ([49.43.194.141])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455364c24esm697557b3a.12.2026.06.18.20.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 20:38:35 -0700 (PDT)
Message-ID: <264b10a3-26bb-645d-d594-b73f50b91879@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 09:08:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com>
 <20260618-shikra_vpu-v3-1-1a32e26a35a1@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260618-shikra_vpu-v3-1-1a32e26a35a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDAyOSBTYWx0ZWRfX6yIRtrS+TDeA
 V5fdRe2kLFhGXxEsna0zAXiq99fZo8Y65u1ml3ovk3s0gjMr03vybw3pv9DZK1tB9NCGNBz3EiK
 38Q1FbgZhVVzBh7myGVgNIjKqu+9UNrUaB1QvMBDYf/G4k0ysczObCSrjRRhNNCcrHr/wMLHAci
 MKfrhlXwSyzaCTUa1hPkfL7jW3FCVYVDrlo5UXf6vnlBoHPOWNg1YfDIOdkezE1PsuxBfkxsF22
 uV7bsX1m/6YrHQo4vxEhjxpVnfRkwXAmSsZKRGX+AVYMHkubpOUJnTwJEHqjpqFQPDMwvXoTt3E
 Hb3tetZz4CxnfekFm4N9cAx1ZHUaN4gN/qUgcjxTzy5AJd70tY7TAAXdEZ9+0RBPA9xO1bphYaG
 wIgQdCZWCdq8OYbEjIBBnyLbIQpOgUwPP4NI8issodmJRamaB1LcMlB7ezQtLESQHVR+Fp7kTRJ
 8qlO8cyhRqroVnFdCag==
X-Proofpoint-ORIG-GUID: 2-gqaXmFvMXNRuqnO80eikZZH7LR1Yok
X-Authority-Analysis: v=2.4 cv=FN4rAeos c=1 sm=1 tr=0 ts=6a34b9bd cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=LrD0L7TPytbPiIQqxktYyw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gomYnHnAK4kzn5urjScA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 2-gqaXmFvMXNRuqnO80eikZZH7LR1Yok
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDAyOSBTYWx0ZWRfXxaONjwhaK7OM
 KBQ9lLNJwxJbujPyWCq/CjguwGqga7eQzhKv+SzR3FJEhHpmC5AQBCQiJpjTsBzzF4zJuVAjsDK
 ErSZEeiueAp+ZNhenuybEp89NNDxITo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190029
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113811-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46DAA6A3AD7


On 6/18/2026 4:09 PM, Vikash Garodia wrote:
> Document the iris video accelerator used on shikra platforms by adding
> the qcom,shikra-iris compatible.
>
> Although QCM2290 and shikra share the same video hardware and overall
> integration, their SMMU programming differs. QCM2290 exposes separate
> stream IDs for the video hardware and the Xtensa path, requiring two
> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
> equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
> and Xtensa isolation requirements, such SMR masking is not applicable on
> QCM2290 platforms.
> Since shikra uses the same video hardware as QCM2290 and shares the same
> programming model and capabilities, it is added as a fallback compatible
> to qcom,qcm2290-venus, with conditional handling to allow either one or
> two IOMMU entries.
>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,qcm2290-venus.yaml         | 26 ++++++++++++++++------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> index 5977e7d0a71b4fb5681f1c2094439c251366f01f..b27899ebf164229ceff1ca5cda50ee30d875e953 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> @@ -13,14 +13,13 @@ description:
>    The Venus AR50_LITE IP is a video encode and decode accelerator present
>    on Qualcomm platforms.
>  
> -allOf:
> -  - $ref: qcom,venus-common.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
>        - items:
> -          - const: qcom,sm6115-venus
> +          - enum:
> +              - qcom,shikra-venus
> +              - qcom,sm6115-venus
>            - const: qcom,qcm2290-venus
>        - const: qcom,qcm2290-venus
>  
> @@ -45,9 +44,6 @@ properties:
>        - const: vcodec0_core
>        - const: vcodec0_bus
>  
> -  iommus:
> -    maxItems: 2
> -
>    interconnects:
>      maxItems: 2
>  
> @@ -65,6 +61,22 @@ required:
>    - power-domain-names
>    - iommus
>  
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,shikra-venus
> +    then:
> +      properties:
> +        iommus:
> +          maxItems: 1
> +    else:
> +      properties:
> +        iommus:
> +          maxItems: 2
> +
>  unevaluatedProperties: false
>  
>  examples:

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


