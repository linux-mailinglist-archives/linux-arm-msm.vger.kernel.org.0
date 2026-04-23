Return-Path: <linux-arm-msm+bounces-104181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGsuJAlz6WmkZwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 03:16:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F8744C173
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 03:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3CB593007A49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 01:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C99337110;
	Thu, 23 Apr 2026 01:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSdneA9P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="czk/Mlhe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF11329C40
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 01:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776907004; cv=none; b=h3r/7FO+OYsK5HzmRi4cV7Nytiilsf/0nQbdGnqkVMz4/MHj0UJrYikRoVSVz4v1OWJoeca5DFH8VP/ftp8mIlcSNZJxL71YGZ3ZJb6h+/IdE7LOLL2M6P4t2AMwDIXzK/xK0QtoyeQ+gMF36cHJK0cKRu9CCfftKp2SyDTlWxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776907004; c=relaxed/simple;
	bh=DxOf+L6yiotlxOV6augFzgLDWPsdWfK9kuJES/ulFPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JVffdNbeafgn67WPiuBQRQ7QjFL26p+28k+vqbxPzmQ63tjTqdaKFZbxQa5W3ubAZDfldeTUF9/CR+vaWqJMkFqmrKO7HlyHQE3+iLEcRYlgzA3xsHisPY9G2jU9yn382vWiyzjWaDPBVo0jDxNRwSxiYYpZ3uEt7fN9TvhHzdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSdneA9P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=czk/Mlhe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFfKGi2956099
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 01:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=doS0fD4+OOQ9XqikyXcImBcj
	iIDXJMyeF1hsrvrQhrA=; b=YSdneA9P2bF/vTwIYiXmrPaBd9+RRK17sb7+CVcA
	Gw9E3FF6HI01Tr5qwPOZ1/XbL8ne+F7VuA0wcShkO+pfeQD5VD11Op7nogFl3u1I
	H22vCBzNnJiexi2nfWfRhK+zoOLylh0QHHE0N7SL2TVQSgwRf3I6GXoQ/8oerUzN
	J/h4Yj3DB6uAreZHEs02zkKKzMJyQ1uVyWsUtLGjrz6dcmKqOod/7sSgnyTXAqjW
	ayS8aK53nidzOKiuuMePQ8TGrbqN8iTD47mjQxc4RL713UQrRE1NPU3U+1S6sP2a
	eDRBL1JJJ/Y1Y28NUZ0z+Ozazn4y3/5iNkbWmwP/njcoag==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q1pt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 01:16:41 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c66fdd4aeso9236378c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776907000; x=1777511800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=doS0fD4+OOQ9XqikyXcImBcjiIDXJMyeF1hsrvrQhrA=;
        b=czk/MlheuqK9du0/NAKhS+67a5sOXCh9Z39RTkYXMyBAypZE02zqjwGTENaMrzJf6p
         RnXKFg2QeOuFfU2j2/8AUi3M3EGmAuzE19jy0LLiXfuU3g81yrac/UHq2Df/xibXl575
         Z28a4cAjKjM8UHECwwK1/bjc0r+lgcaI1o3n8sMpPFjZPAry3uExTWgZPc5teHtFZwwM
         u1tj51SyMSpVIkqNSvNprEYKuIySsku9CxLwxnpww2n1SolOkXMdasOa+jQBX1rYo2Sw
         yF35R9pRP8Q0LUA4NZld7fvRve+Q8j150IDWZk6bua1+B+zry2MIZQNsNINCiP+yKwqg
         I2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776907000; x=1777511800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=doS0fD4+OOQ9XqikyXcImBcjiIDXJMyeF1hsrvrQhrA=;
        b=kzb5uIIn1TfXOsRodjcn52GJkms0PKzlLsFRp8gMGjpRSVyJoURKnCMsf7W5esK07o
         PFdXzrW4e85bbATkfq0bVnNqpFFqseeVuFYyB+yvhptMWLEQqyzJnyM2HWXste4GztaB
         P2Bdm3zak1YnB2L6SoEPuH2Cen8+38ZJgda8LoruOM4c0i6ZqvS71Y07FbBbzM/AKUQ2
         WXL0cpo63AS6OVLlqrL/onD4wVm4qhyorNaHh7HCh8OqpONn6qWCEiP/NzBb+ETMylJz
         +mfotG9MUJkVL3jn7X3mLP43C1Qp2aJGUaJWrnXdmMSbhoejJ8WFOd46y47sh5FDvKvS
         csRQ==
X-Forwarded-Encrypted: i=1; AFNElJ9B6qh1CdYM2258gLTcJTy40ZzDIibdeAzEhRgxZ3y1sFXKaU0jsN93y0aCDN1qIlwzVX8sZ6gRKuqkR2xe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9JzgPibAbWz+DbowBrh3WvcqmzoU8UtqLdhyoxKaeUPDpcNvm
	5IKdmksvfwCRG1UNGIwSDHzWZLTUPzgKtuZdsDptNiqVILBmk2rWWKc1UWxjbXlQt8/X4qo5cEv
	9jKxT17Wq9LUVsbOg+N1QRzDCxKN28+m9NBd0qkf7IBZGrPCLZBgPKwTAI6GiPWCMVW+B
X-Gm-Gg: AeBDievljajPatO1t5AOPeWWbuX5OwzK3U7QjqDqwr7MtHzsse6l6OZ6ECSqbarMuig
	G2+6XRL/rjOCiV2vcxa4ph2JgOkeFE/m3jAnuo9JIc5kua1fbLJCk+BwE1V1+JDBtbWUZSl1fY4
	Gt9i1MiQNqQyALsc7V6zVqX//KfaxYldad/FmpcOygp1Sqw8yiO4A0nHwluUX8T5G2YV7yu6hkG
	M1JRdXmuw8W3JcONmERuG2iBFafIq+MSw9E3NmmCd8gdugjYULra7YGHB8BVDlLLa59Guhtligf
	LHWYjGjrJPV4at5nzme91qk7no3BF25DjVHNTAiS6Z+7R2i2pk4MkwdiTRq9fyyk4va7dYW/aUp
	iNe5p/aAynLELwIL4UXDybb1eR2Ve7QRlmW4SNJ5xnIBu4vPRqsCBfGTtiqlj4fUKy5w1VTtPd0
	g=
X-Received: by 2002:a05:7022:793:b0:12c:8cd7:d438 with SMTP id a92af1059eb24-12c8cd7dd7cmr7691460c88.9.1776907000141;
        Wed, 22 Apr 2026 18:16:40 -0700 (PDT)
X-Received: by 2002:a05:7022:793:b0:12c:8cd7:d438 with SMTP id a92af1059eb24-12c8cd7dd7cmr7691432c88.9.1776906999499;
        Wed, 22 Apr 2026 18:16:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c749c422csm26381425c88.3.2026.04.22.18.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 18:16:39 -0700 (PDT)
Date: Thu, 23 Apr 2026 09:16:33 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: crypto: qcom,prng: Document TRNG on Nord SoC
Message-ID: <aely8W3Tve-fhMzz@QCOM-aGQu4IUr3Y>
References: <20260420025732.1240525-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420025732.1240525-1-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69e972f9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=R-84wXamayB7cy0xVmkA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: XqwB4URCZOvP9uq2caIOilERJ3bMABqK
X-Proofpoint-ORIG-GUID: XqwB4URCZOvP9uq2caIOilERJ3bMABqK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDAwOSBTYWx0ZWRfX97jKxc+yucuz
 SpAJVIXUqlbBMmFwvIdCdSn1zZK93tOgbd8/u6sl1/4Ch3OBBvMywkKDfq9kqA10fk0EYKQJ1pg
 KAlnCob4ujkspNEOGU4Tj4L8aIprNtMyKwj70Lj8bzZ2hB4wuD/yytosOqiC4jxayMuz68KOqM7
 NCnOsegs3ITMdjFabaaEWQrfbLFw1Wrk25ZPvNBWKMxIcZ/41nYVsnDTslcu37AyIOsjyFGWo4I
 5DrtWHwj6xBjurZSP6qzLf7bVgBye9NgPcUrTY2+69HvZoJ/Ks7AVqIiK3BqWTcNSm3wLH6Mxde
 +cf/tqeFXpQJyS04KhWetG+QzBlce5iznAUixHec/MUZkfZozE1ZoPHrb+4TwSZQdbIz1d1XyuE
 wqFGkS7NVa4FYn/FJtmKqghNw+8SQqvxaGlMIjC0ccMJdx2TeNiDfcV/k+uPQq3cOHEKaQnRecV
 QQNlYARDtEmeO6I1KmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230009
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104181-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D6F8744C173
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 10:57:32AM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Add compatible for True Random Number Generator of Nord SoC with
> a fallback on qcom,trng.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Sorry for missing my SoB.  Will update.

Shawn

> ---
>  Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
> index 41402599e9ab..1362a8b748a7 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
> @@ -22,6 +22,7 @@ properties:
>                - qcom,ipq9574-trng
>                - qcom,kaanapali-trng
>                - qcom,milos-trng
> +              - qcom,nord-trng
>                - qcom,qcs615-trng
>                - qcom,qcs8300-trng
>                - qcom,sa8255p-trng
> -- 
> 2.43.0
> 
> 

