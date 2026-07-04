Return-Path: <linux-arm-msm+bounces-116453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SP73D4B9SGp9qwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 05:26:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C92706879
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 05:26:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=izniWUTa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=R46eMMim;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116453-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116453-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA995302A0DE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 03:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2470832B9B5;
	Sat,  4 Jul 2026 03:26:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAF924E4AF
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 03:26:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783135611; cv=none; b=VOhEVYF+mz5ZQFTL8remMa8uNNmK47D9n8OW2hH1trgcTezPimOzktA7m0cvgVqkAQcJby2/GpnmAckpNQlQvJsAf6kdNJ1CkmG4xfmLn2xzeJ6SQJIEIc77oT7oJsCH054qhYnhIph5MFJTwRbm5V3dIWGcP5dFdd4PmXccr/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783135611; c=relaxed/simple;
	bh=Z52KdIIrlV0P/pNLWwB1lBDK89sE2xDmZuVC79UC0Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5d1SFrpNz5VAJPxijBdMNu5IwwxgL7avaG1zicAWz/fuH0P0YeAZHLix3bi91wliwVsLSsfS9dfOiq0WPejjCwUic3aNnL5P+Zjqb93bB5JcW/CnQ0i5j5h4i90fiYQwS7/DL6+CHH3ZlHl7MhH6ZdJHvFNSnUjDkMbwrz1ZOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izniWUTa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R46eMMim; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6642phkv1811368
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 03:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5ZzlMleCvK6/EpDoM9z20FLc
	dYB9f6a97RZUW39bIrs=; b=izniWUTaoQL3GAF91vbowfU7qUnLcI6UVV4R0try
	pSuEtS/kEy7GgOOj1MNyEXHJF1c0fJeVeEtoQYqpL4+OmzPYR6pFmUlP5raipd9o
	gFr8iLAGw49LRJJ62scOJERBeFlOuzKU6/BxEE3X7y6PA4BFNKMqorQDag0EHqXd
	UZO79Sge79rxCh+Sd52Soq8mTnL0xFBoR5WKLl7LKE4skOfyeSciE5k3M616c1pd
	ldAIf1Gsvz4uQpuE7TATxq0UJv8fu78RCw8eZHWfc5oI672kd/a/XeiapZO04oV4
	AoCLrhzY5XzmpS3WST87CPv1DNYOURaUD66mm+Jxgs0mFQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvg223-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 03:26:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38001e788d6so1457142a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 20:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783135607; x=1783740407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZzlMleCvK6/EpDoM9z20FLcdYB9f6a97RZUW39bIrs=;
        b=R46eMMimnRsDsNRsj+SXoBNCCDMHcfGHKisB31lhM51+Yp3zOuzmyZWwxh/4mMBcdi
         t354Bfmd9BQdtGL+UQ+aVI+PpS9Ed8nWav/JpBf2Es9BEHanxLELoTAJWxMB598rquES
         mH/PgkVj3X9a35Lubt/SaklnDRHPOkZ5QOQ5irD/NFkzRSr/GXhYCRXfF835oD5n4Zab
         OUplVtGK2rsnug6POdsW2BfqUsoTJ+29bwzSF31PJ0FbQ1PKYlKGd5VO36izpiKnzfhD
         Doh0nn44IvJK0z3giKvtz0HQFkzF4sUiI680CtuKEBdkaklWz9y+RD/F6I+5S/dLNYgi
         EiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783135607; x=1783740407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZzlMleCvK6/EpDoM9z20FLcdYB9f6a97RZUW39bIrs=;
        b=mbW9iWX6k5i6PsxFq4KZXEh83ZvxY8CQqFemRJc9ztTHbX6093mg5nS4czh+bEYTyF
         PB4fKskgHwwvHl4Lj6psWnL1WGCHLhbGJYFnT+7Xm71N3gJGXAme9Yzrmq5dKWM9XzeG
         QmqvrpbLDnR7cGi9k7eCEv+5esTJwDWBK9dsX/SD4ISbhydnKztPc6Jl/96ETBR9zO2m
         s7JdlxNYZAsGrDaJH5Cr3JVkSmnpZNKiXFVjttJl7fEiDYh/VSjlpblicJl7G+ZIop+A
         Cp7+aP2kN3Ygmr+qTbBjByEG2xPeD2Xcc5amBBmnSIAurADuh7qxsQzXgwdTPLNTyGyk
         Zz6g==
X-Forwarded-Encrypted: i=1; AHgh+Rrm7TXkZb3eAtQhCIGEDAj69ybbhq/pbLRqXjQFIZE4XuDwLFFf/P9KaYKaaVR8fx6BWDEqYLZibWdkHAsv@vger.kernel.org
X-Gm-Message-State: AOJu0YyRWJaOnZEyhMrqQkbldZtH037RvvRe+KQ7gH/TeOp6TVdmrsVm
	EZHhekPnd2IysXat9oRzcZS75K2fd/BOZmiPpp3G5g5uAZE1Efbj9MPYDDzrGXIpyKVEznMR421
	TbOWqsdKJ4i5YjKCkkte+NJqNLqZWLaCmwxaJW5P1EoOhNeUEetN2Ty965k8pNw0IGzMD
X-Gm-Gg: AfdE7ckkCEJN/OGWbrLX1sLdjAcxQHITYQR6adPhHOx3GaCg4Ku1K8dN8sH59zBzKsA
	p3Uyu/mjYM5sWs6/ODbsYKJ8HX4HHoTVp6ahNdbP3HToMyu7h5YJb/hsUqmI38v/ZzAjpNVQWOf
	tchjjWTIuMHRzsqx08PBA7UH9ZlL4b/3pTP3f+5LFPbMBpwJco2RSusLHCH/plbpnN4YzcrS/0p
	23goOcq10i3nFpmR6toUA4ilytIMThDoVb7QzHKi+nHB1yyvra/KZQla8liNpQ9b9K35OSsoF1I
	bgXVpJkuC4LkU5ScbEgxNiEnp6M7sVIjmX1kqQo07TQDgiXff+MvDo2TAWDX1JwtPA5j37aUFnm
	UeJLf58WQGDBRkJku/GcF6hKs04PHrfMhEehdPoR4nqzQ3wbocGgrYw==
X-Received: by 2002:a17:90b:1802:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-3829f007711mr1968785a91.21.1783135607308;
        Fri, 03 Jul 2026 20:26:47 -0700 (PDT)
X-Received: by 2002:a17:90b:1802:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-3829f007711mr1968751a91.21.1783135606815;
        Fri, 03 Jul 2026 20:26:46 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b816a42sm43793015eec.9.2026.07.03.20.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 20:26:46 -0700 (PDT)
Date: Sat, 4 Jul 2026 11:26:39 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mattijs Korpershoek <mkorpershoek@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        prasad.sodagudi@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v7 1/6] dt-bindings: i2c: Describe SA8255p
Message-ID: <akh9bzlP12sRM4Fw@QCOM-aGQu4IUr3Y>
References: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
 <20260617-enable-i2c-on-sa8255p-v7-1-ad736dbeab57@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-enable-i2c-on-sa8255p-v7-1-ad736dbeab57@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a487d78 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=HYhALLXNZ_QuGUvz3fMA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: CfM8Evb_pfHGOA4vEpfI3W9EWQfEbUY8
X-Proofpoint-GUID: CfM8Evb_pfHGOA4vEpfI3W9EWQfEbUY8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAyOSBTYWx0ZWRfX7BcHEUY3+BSK
 AFOBLkg0+SEXUuRIzxz0HNgs767BA3GlaXq2+bFWrnZ2CKlDd2OQJz+rBd8rzqkKoFUM0ELKaAZ
 gbkj9ngPs2FFGd5tfg+POtvQomrdqis104Jc8aR/Y333rnKu4kyJwwCakfwBDSAkbNrdkYsV2MD
 AYXRNZ9Ovch7ph6puSXv+gSDOfh/dWKgl1r+ooDfNFlzJ+yyPPhlo76zMvTan2OncZKyrCGSVWV
 617o2mFGd6h5ciuPCPf3C0bDg/jEoaF5NWO9/rFVay1iSIUMUl8LNyaPVaQXlMx0PohYeotbz1z
 zDosD0YHKCW22FDWqvCUdrB4ykVBkRRGH3SLUhyjAryNMQWygEQrfC77JRfKTOjdO62T63cCc4j
 mnU7LfNp3o8QlYEMQ6j4CnTjEkkl61JIWZE5QgZAuQ2R3E9TXBrDZn8D/xdEEa1icFTSN/boNhr
 z3kUdp3K0B0nL4v92Ng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAyOSBTYWx0ZWRfX3tVzLjuvGiYr
 Ewksco6b9PYuPeKNKroGt4/iZfJK/wF9dBoQGC6egnY2mJvWIHKUOq09YFQiTjyLpPju7CdRA5o
 fJxXeJQvcqpTqqp6ph6fpwq885epaS4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040029
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116453-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:andersson@kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:mkorpershoek@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:prasad.sodagudi@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:quic_nkela@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A8C92706879

On Wed, Jun 17, 2026 at 10:20:15AM +0530, Praveen Talari wrote:
[...]
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
> new file mode 100644
> index 000000000000..a61e40b5cbc1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/qcom,sa8255p-geni-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SA8255p QUP GENI I2C Controller
> +
> +maintainers:
> +  - Praveen Talari <praveen.talari@oss.qualcomm.com>
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8255p-geni-i2c

The compatible had already been defined by soc/qcom/qcom,sa8255p-geni-se-qup.yaml.
Now we get the same compatible defined by two binding files.

I spot this because I'm running check_dtbs for Nord SA8797P and getting
complaints on "qcom,sa8797p-geni-i2c" compatible  which is already defined
by geni-se-qup yaml. But check_dtbs seems to be running the check against
sa8255p-geni-i2c yaml added by this patch.

Shawn

