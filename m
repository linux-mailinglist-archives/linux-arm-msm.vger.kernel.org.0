Return-Path: <linux-arm-msm+bounces-108674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCY2Lz+IDWpdygUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:09:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4353658B605
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1BB330071DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD1E36CE03;
	Wed, 20 May 2026 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ht+T1g1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8ihqrGz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E546A3C5546
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271514; cv=none; b=rjaRGytlGIUAKyuSg3sVNnnskTOb+qT/aIs72g+xgCo8KLs7lZDofQMlfR/w97ZXpHjNy3HqTPFUXItAKeqXL2FMeq7BtRd65ZhxAncuKD2kiR1NW92DDRmTPKJK0LExkNd8w7gU+Oo9ZvNXqS06fMobf77qEyePGqJtu6CLXAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271514; c=relaxed/simple;
	bh=qWsWC7RByPJUP7uR8BF+7n3gQd26XqYA/bFPZTZZSDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g5Ol4mx30ditPE11FN0VFDQ/LlwERTQtLnEo789HUOVRrjjpQdGpPDWXBCK74UQrtrNg1ILqsU9jzWd0IARUkdlpOc7igYIAh//Ip6CMbHSNUr5vekKMue5kT5shaEx8s3WqqTzIkjIlGNmX0Iqepc9Rg1SMHehpnGYbcAESMuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ht+T1g1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8ihqrGz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nYSR446942
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkTZpNLF8GxjgyScqFNYNgBxkNvufQOs4iQU8+vdxtc=; b=ht+T1g1JJw4cMd5E
	WMFpWuAtvmhdQAc+rt059p4Trnbtp0ebvOzK3R5MSEqBx5D5FWmxFHFJzsJoWRec
	u21oL9lfa4gguVLmHEeUjyWYRHyTMn9mCUOc4cXruAXzjaNbGttvrnIYJavMzstR
	8+3Jsv59IHjNFW+9AR3JgYt69vmeVb0+P0SxouKtI8kYt7BX6w7I0ZDMUizxyCzv
	ciKl3LAfnpdRkYxQTOeVy8fX+aWjw7ORXZ+h3ornRCBShdm9Dv8RuTbyXGXHfsm3
	z4kzDyptfTyKBznKX0XAoX3aXDEVsqy0AlGabstwcDDi64rFEk1m0J5/txE2guyl
	4ZXlQg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrg1xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:05:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9114b077480so105591485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 03:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271511; x=1779876311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LkTZpNLF8GxjgyScqFNYNgBxkNvufQOs4iQU8+vdxtc=;
        b=e8ihqrGz5yOCXMYFSfa3l3/4fhChOuter64fAxWe8yLeZVDtvnWWCa/0X1DLgLl60Y
         HURLAK/Z0De7cSFvKF1xToCF/Tnj5qRTCX3g0HX528tc/YH21+U8YBlPNSIICNYTqnlI
         xjbzxgBntMkCTdgFB0MwF5NuJ8/ED/4MY6ZRH+2W0yNCj45cQBXhieGPoAi7dVHQNtKy
         i4m3ehHqaMEWagkyCcenNYpk3uWQ0s5uyd2SGAxPVJxEvbsh4suQ5IPk+1uBEpfAxnrl
         HR5ZjExZ+sipUQTm99msvgg0KgX3UFm6wFTQEkeIMal/fe/MO89CaN7OMKljfv5Bg+Vp
         WCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271511; x=1779876311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkTZpNLF8GxjgyScqFNYNgBxkNvufQOs4iQU8+vdxtc=;
        b=lQJ1zoUktusGSEHtiKreLcwNzwU7sFyxlz7XxZxqo8NmqGdYLHRmatxexi0LU4AjFk
         WONJpxqOzR3rvg69msioR1n+76+ivW/BRU7PN/0K0Fxxn5TEEGvaNn5CuzTs+0pALAJh
         KErbAg1IdbBnhjkXfzD5ooB0xJa5XUgUviLe3/nClbK8RoXQyJWpZwxOXKZ3+FHM+mcC
         SAdONM5zs8GjpSGnfm35V1R6xOIdfSkwY1gH+/bUktfBHN0KmsHoxA3yO0c3j2gBsfUg
         deAOTqSFnryGOzK+z/FLXUstZqpADuyn+QDJ2z2C/tOWPzlpNRDNdPoZ4aXc6I/TgUSG
         NTbw==
X-Gm-Message-State: AOJu0YySYy+zNAKAdntOHZEW6oT9Lt9Oc8ob3B/t/u8WWmMBcE6hX+6R
	z+l8iERtU5bv12IOt0qXpjiLQm2Mc8ZODAIsC9AH5aL9b0vCvW+yusr31EycMza6wNhSRFq9IEz
	jtixcPSPF8MfTgz3i6DBM90j2glxHZKX6CmXaA+8nkpYTzYTcz5dn0RKpyOgxMyO5eyQr
X-Gm-Gg: Acq92OE/2SqdbhM8rcm3HWkRsZShSfPKRhkL9drKWiskXgDVixY9115bfY1Ax+lPt1X
	7/5nLG/TqXBh6XRJQZhTiSBnXbDL+yC9mg14qGCkJNrRlDUL3qxo5ZNMl8LUvl0A/dGGIiWGiA0
	7t9WlCmzGWY8W+NDjlzPth7Mk+VNTvgyhhquQpAcFucM9/eqPkYrz50y10Dg8QLsm/1ZlJamvim
	NyrqPe0mwQD8h5nHR6JDgeBs9B5+Emnk/AQblAZ0vWOXTCTiBNIKdUY9YzGoF7UjHWEBjZKECAJ
	sRWoKtu9F8Csicpv/P1vwdW17VMSSmljAo+NL4sZJO9AOwCOvmLytVj2AJCgVo9m2zXZotou2i4
	nHGcf57Cl9Ke+9JVp6Gln+KT3kuGKAkHo+2qrFHOg9eB4OzNiBaYjfI19FyGSMjpAZ+G3nGVm81
	RN9qg=
X-Received: by 2002:a05:620a:17a3:b0:90d:11b2:80f3 with SMTP id af79cd13be357-911d13317fdmr2209957085a.7.1779271511364;
        Wed, 20 May 2026 03:05:11 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:90d:11b2:80f3 with SMTP id af79cd13be357-911d13317fdmr2209952285a.7.1779271510898;
        Wed, 20 May 2026 03:05:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4eac613sm830956866b.56.2026.05.20.03.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 03:05:10 -0700 (PDT)
Message-ID: <de210bea-ba3c-4be9-aa97-5d04d4d3d9f3@oss.qualcomm.com>
Date: Wed, 20 May 2026 12:05:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcoms-c: Include Eliza, Kaanapali
 and others in SoC names
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
 <20260519-dt-bindings-qcom-soc-naming-v1-1-005d29d261ae@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-dt-bindings-qcom-soc-naming-v1-1-005d29d261ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4zS7KsNtwEVqZhtsUQihe9okFbQl5MgE
X-Proofpoint-ORIG-GUID: 4zS7KsNtwEVqZhtsUQihe9okFbQl5MgE
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0d8757 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=i-IakZOFnYprcQ0soioA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NiBTYWx0ZWRfX90x1ZYtCFehJ
 sCDDGpv8AZeZ2KVq6qv1ATxUZWfwWlDFhr2/VAjEPjxuuXXyhJwhl1kMmoxW+RxXCbjnUYumypi
 VBXPDDjonFnfCSwkYxuqCV/yw+wpPWhEcVtWXzTfdBn/lDOu7W0ej4Qw7QTgJhmdLzicwWaSuU+
 HhGv6E7kq04/gd81DqLYe54gqsTCIL/ZkTWjxOa1OofwN1zXcI/7tOfl8uFgZsHHQHEr+iMNtSv
 lndLJWKS2MAdOIe189A4r8Rr1wuTLqvGL8qqTfoILUoMsPPuVAGfhnzBMLsU79qlRtjrKRp/69w
 Wvx0DjIP6Eebq1cGirXwvPM0ZOwg4ehP6qkQ6Aq3/wRXzHqTmAiNHySUzX5x6czwmMeVMheXk/s
 MtvZprLnEctaAA+sUp2iGjX7GVsQLsTPoka+tMMUWxcLLW9qdNlMXODGQ+tGf5AYX/RF83aCmsj
 BLIfMoZqqRiZZDGH19w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200096
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108674-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4353658B605
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 10:03 PM, Krzysztof Kozlowski wrote:
> Grow the schema checking for proper SoC compatible naming style with
> recently upstreamed new Qualcomm SoCs: Eliza, Kaanapali, Hawi, Mahua and
> Shikra.
> 
> Since switching from model numbers to codenames, this list with explicit
> codenames will have to grow and list them all in order for the schema to
> work.  It feels like a churn, but the compatible naming is still mess,
> for example, the schema pci/qcom,pcie-x1e80100.yaml with a legacy naming
> vendor,IP-SoC (qcom,pcie-x1e80100) received a new compatible with new
> style (qcom,glymur-pcie).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> index 27261039d56f..b5f3a750cce8 100644
> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> @@ -25,7 +25,7 @@ select:
>      compatible:
>        oneOf:
>          - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
> -        - pattern: "^qcom,.*(glymur|milos).*$"
> +        - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|milos|shikra).*$"

+nord

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

