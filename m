Return-Path: <linux-arm-msm+bounces-110125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBvjIptIGGr2iQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:52:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6CB5F3130
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30B2230D68B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 13:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2813CF977;
	Thu, 28 May 2026 13:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2vsfwyE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O19iVE3W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F377F3EEAE1
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975890; cv=none; b=sYfU8puUU6wWqcxZERui7Oq+mfYPhvF6NOw/zqLCx3T6nAmaedtLLEfPQiRp/6+ffl0DoOFjrIIkzB1p+wz5devNkBez9nfWnqrJY5e8W+g0uOTWFS7uSGNmvq9QPSRiEpKN4VEaVX0Ud2M7mYP1BxDqAlG2jhKGqUu34B2OUos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975890; c=relaxed/simple;
	bh=Sy13wBJI+iwNOmJjVB58t+ogoFGFmXoUWkZJnA0Sagw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpNHMU++JB0t7+qQyjTP/ukueNx2UkuAAbM7wG5PP1eNe7q2nko/2/+X6iDDXg4tUWAFfcZZlN/MwXJr320j2j+UE3B4vOSRLDLcQQOKxX5gYM5Jd6KgHve/Ulcg75L2oeNlat/5claqfK/MCfblkGIq0qsNOgzXRHVKI+70GzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2vsfwyE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O19iVE3W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vxqY4031712
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5lRMaClYbA5HtXQ6LSesoJBK
	usUYgwxDIQ+oX8XsvsY=; b=b2vsfwyEiH6+ctQ+pgljyNh/FaRzxaT+XG/cDcVC
	httP0uSeY+G0EQ8BD083G01rvAYlfcf3FZ5RZDNz5NR7gvZbAcUzEBvelXi96B+f
	dsbPxWfgcyFCuCSTZmz/BiPodR2HZih/zL4vUPMadwhIgEn7ELMjbS+oc1FIaBIu
	VGFWaYsjUOGO+C2ISqoDWQcecQypkaWXk5LuihRHp3sxqfd4jURwFcPXBNJdEI4/
	pY8aBamXEtX6DHqK0dGfnvPSibB0QuAqZSUeJT85Fdaau+E1RC7M6JrBFRqQV13F
	DVFugxxayL6ZPPmIruludn7MsgVmz58XDp7MeT7EBsASug==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y4twt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:44:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516cadacf92so107575281cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 06:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779975887; x=1780580687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5lRMaClYbA5HtXQ6LSesoJBKusUYgwxDIQ+oX8XsvsY=;
        b=O19iVE3WP/ItHU9t+bHrYRaE4Qz3yes0zTTbewA9YodWLDyjXYMPVUTHIG3vhHq2mj
         0sgJveaT1CFIznmbOdJqIv5yGYSxztSiIdYJQbZ63VU8jPdyfyCm2k7og1xE0fm4hFB5
         NjvKV4yZEwIqa2YMaLZNDcQDDoJBTlUjkNdpcf33Zw9lRKYwmnAZMWkEJCM39uHPi7AH
         pboZtcfHR/rE44HChQh5hBOsrRYtq13v2rOMwGDuGypwC1Mz5TGLUMjk5u9rj3qMTA0C
         6oiEjxu2KFCYLI8r0omtWG4qPjsn/YzV5tSMks9OlmNonv/DUGINhUB23rENt0Je6qk3
         6Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975887; x=1780580687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lRMaClYbA5HtXQ6LSesoJBKusUYgwxDIQ+oX8XsvsY=;
        b=ezBXWsZ3dE0h/xKH4expR7CFNxyo8BOgc0+Y2HntsvT8q/RMLxyx4A4ow3BMgPysvV
         VzVI2Opn/xiv89qnnuy1gXQLLENC0i8iK30DQ8kRwQLkP0AnDo7ESQSGiYGHP+t6owoQ
         zeF3VMkPxxoNYQFu3k0pyjpqt+YPagRn2pGL7fMEjWY+nd1iN0xFQkTwgOiHDoEvMSHy
         +zxcAntNKvE4rg5yNwq8nPQoI1iUwhvEXSlBcpZxQuDRYKfEt65aypF065RWWMeKsHvj
         1h9Rl9l0XlDhBmPZ5FyeliE3S8DNWOTaIq6kdU0psEJOJYa49VUzVW5oTymzPfZi/HkS
         DDRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Z5GYBAdAHS5uxqts0NaNr3LAIbG9smIcrAtOwqpmXx/4VZy3AElwO9sptHRDWteFMBeHhR/LoVUGp0g/O@vger.kernel.org
X-Gm-Message-State: AOJu0YxlsGMnb5yO7TMSEQcZiiP5PsxUq7/wfBLrfLy+wJwSPLZ7DWKk
	zT9AjZMpSIXTJZgT50SJ72qQsGMUB+QGy1GIzKqLK+FbQ0SYuLlTAipsjpXh8eUwG9K8uLQWGIH
	NnIbBXXm3A2XlvJ27PGaNeoXapcEFP6Sj5cyQ5nNt4meoybJSPFrWz6Bu7NxHFH9ystwf
X-Gm-Gg: Acq92OGk/mnKdNgyLDuQ3nCLHknsvOCSgUnJP1iK7E7ZrdJ0YZRVdkmQE+gdloIkcuA
	Pphew1D4KBRVXHJQCi5anMr0v6EItq9stUo1R9chmrQuy7xuJXgRpIO6W9010I3Dhr0oiI/1gqW
	g2JoMOOr1XfXSDUEdcKl/beQH6X/trFWtdZWxOZNpIcGWbLr2NiIYz51avX5PAJ4bCk9YF6cGRA
	QjM9Zrev+sows+vR7KnorPHMOUBDnbcGiEF80DbgYsGo0HVz9WlUBU4h1NX1TYPfAAdmKuOOSmt
	p4ff5XCDlHfv+ADD/+SoVIgRGQCXVI5Hism6opGf+5ceb8gz6nOZq/4mBR1gzbsBUEzijRmkYf2
	Wjyfm0gHeh3bERThOwLPOCOCNHYFqfayLe0jHPCWhE5GPB4I1p14gzqPZs0IrhbvonBNnkNp5qr
	OmQqRqGG+0ZaAMIvd8A8N2h82LQmq9ZTTvlOR8Hiaauwh9PQ==
X-Received: by 2002:a05:622a:4207:b0:516:c8d8:9a27 with SMTP id d75a77b69052e-516d429354emr407633791cf.8.1779975886920;
        Thu, 28 May 2026 06:44:46 -0700 (PDT)
X-Received: by 2002:a05:622a:4207:b0:516:c8d8:9a27 with SMTP id d75a77b69052e-516d429354emr407633141cf.8.1779975886418;
        Thu, 28 May 2026 06:44:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa46322331sm1923204e87.42.2026.05.28.06.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:44:45 -0700 (PDT)
Date: Thu, 28 May 2026 16:44:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Message-ID: <5nghgd3lt6vyewd3a7l4kahlxiidxdhgtu42tuyb7xeq62ztvu@tvclo336xtpi>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-2-953f246a0fbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-2-953f246a0fbb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzOCBTYWx0ZWRfX50t+cwTejEsc
 zli+5Ut/GLWW457vyKSpuU43EDy14u8beDk1kO74NhfeLChVsg2TkVivatECpb7mJ+Pl5ZeY6ob
 hAWn2JhKUn+fJG8ZUCqoc2JKkJu47jK0t2KVcnMYDT3iNBJIMr6w1m2XSzHQ7UTIoa/yymhKsWN
 05DkctSTh8swqrWrYG/YnVClsI2D4SJxljTX8kZA8yVv/BflOtmpSNnfrkpwjQVTnNMBaIn06pD
 79F1gyUZbQWdX/5dqCmbcXBLXpXUPjhAhrFcIi6fdpYl0Awzkul3JAFgv3l02xTwO6EOW42dQjy
 tJC1NKByGW2QAE34zNYtc3nSBwGTpF/cnWOc4BxxcV2vSZKSjLUJZzwaVpxioj71HLMXT7vLyWS
 yaxkt8pCvO4nUS1i/iLkWJtbWLBYO6jTVkkUXwVQkLsV96sRC+ze3uT9dyIZBGhhs2h9ztRrFkk
 tme15E4U/nUbFtCCZhg==
X-Authority-Analysis: v=2.4 cv=feidDUQF c=1 sm=1 tr=0 ts=6a1846cf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=1tq0Uks3jRvWVWNWfJsA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: kmMFpYJPsZaTzYVuioEJofU_L4lyAsUd
X-Proofpoint-ORIG-GUID: kmMFpYJPsZaTzYVuioEJofU_L4lyAsUd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110125-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA6CB5F3130
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 03:37:03PM +0530, Imran Shaik wrote:
> The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
> but has minor differences with the number of input clocks. Update the
> existing QCM2290 DISPCC bindings using conditional schema so that the
> QCM2290 requirements remain unchanged while accommodating the additional
> clocks required for Shikra.

According to the IPcat, display clock controller also has (unused)
inputs for the DSI1. Please extend the ABI for Agatti, then extend add
Shikra.

> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,qcm2290-dispcc.yaml        | 75 +++++++++++++++++-----
>  1 file changed, 60 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
> index 4a533b45eec2d8e7b866c3436bfe6f80fcd714fb..b24095814d9e67a355321d9013e144f245077322 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
> @@ -17,25 +17,21 @@ description: |
>  
>  properties:
>    compatible:
> -    const: qcom,qcm2290-dispcc
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,shikra-dispcc
> +          - const: qcom,qcm2290-dispcc
> +      - enum:
> +          - qcom,qcm2290-dispcc
>  
>    clocks:
> -    items:
> -      - description: Board XO source
> -      - description: Board active-only XO source
> -      - description: GPLL0 source from GCC
> -      - description: GPLL0 div source from GCC
> -      - description: Byte clock from DSI PHY
> -      - description: Pixel clock from DSI PHY
> +    minItems: 6
> +    maxItems: 9
>  
>    clock-names:
> -    items:
> -      - const: bi_tcxo
> -      - const: bi_tcxo_ao
> -      - const: gcc_disp_gpll0_clk_src
> -      - const: gcc_disp_gpll0_div_clk_src
> -      - const: dsi0_phy_pll_out_byteclk
> -      - const: dsi0_phy_pll_out_dsiclk
> +    minItems: 6
> +    maxItems: 9
>  
>  required:
>    - compatible
> @@ -45,6 +41,55 @@ required:
>  
>  allOf:
>    - $ref: qcom,gcc.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,shikra-dispcc
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Board XO source
> +            - description: Board active-only XO source
> +            - description: GPLL0 source from GCC
> +            - description: GPLL0 div source from GCC
> +            - description: Byte clock from DSI PHY0
> +            - description: Pixel clock from DSI PHY0
> +            - description: Byte clock from DSI PHY1
> +            - description: Pixel clock from DSI PHY1
> +            - description: Board sleep clock
> +
> +        clock-names:
> +          items:
> +            - const: bi_tcxo
> +            - const: bi_tcxo_ao
> +            - const: gcc_disp_gpll0_clk_src
> +            - const: gcc_disp_gpll0_div_clk_src
> +            - const: dsi0_phy_pll_out_byteclk
> +            - const: dsi0_phy_pll_out_dsiclk
> +            - const: dsi1_phy_pll_out_byteclk
> +            - const: dsi1_phy_pll_out_dsiclk
> +            - const: sleep_clk
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Board XO source
> +            - description: Board active-only XO source
> +            - description: GPLL0 source from GCC
> +            - description: GPLL0 div source from GCC
> +            - description: Byte clock from DSI PHY
> +            - description: Pixel clock from DSI PHY
> +
> +        clock-names:
> +          items:
> +            - const: bi_tcxo
> +            - const: bi_tcxo_ao
> +            - const: gcc_disp_gpll0_clk_src
> +            - const: gcc_disp_gpll0_div_clk_src
> +            - const: dsi0_phy_pll_out_byteclk
> +            - const: dsi0_phy_pll_out_dsiclk
>  
>  unevaluatedProperties: false
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

