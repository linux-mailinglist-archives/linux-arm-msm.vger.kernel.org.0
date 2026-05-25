Return-Path: <linux-arm-msm+bounces-109589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAAvCDQLFGr6JAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:41:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1B05C7E9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F3F63058066
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3363E1CF5;
	Mon, 25 May 2026 08:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bKYYpZlL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gDtZUEgE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174EA3E3DA7
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698229; cv=none; b=MkHzvHvuMv3GDGkDwYTpwPLDumqVpmruF2lx57+3sQrDpbXp68MkeRZTKUYWo10XDtQ/MvA5Nqk56jqnBLkM2izPDga/QmsM1vM+hjainBvWHfg3O8OSqRxr2QclVhhefL+GQ/RapENituNVvy/L0XfDB1I8+/56jn+aLI0xJa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698229; c=relaxed/simple;
	bh=/2eXHDTqS2VCauXTBQM8CGZ30KB9ijpuxtDmw3wQuNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPudZZG1omwLRQWUGIP/1G31yHsvuTKH/S7aZ3Sgt6NojCGeSKKNc31w6amahNgGcOtnPn0cFT75Hu+raXI7JPe4s6uFjxqNVWDSft1Ey4b6yhavOL2iZ/YiU7L9hv2BkFhtP1ohSWtc4ADH/unJn6UqI74nig8mtTs4Ns8sWy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bKYYpZlL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gDtZUEgE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P3rFas3856157
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Fwx9ZLlt3548Y6WCHHCbQYxT
	TMoRGEnYiWYKbuoAZjU=; b=bKYYpZlLnVrZLl0MX9CRuSQ42aQNJyT1VlAR9H8m
	at0pQpZPZ3KoGk3SC33MKSZF+hjpvT2OSPsrS4gdKAPKGtMKctd3yZucc6V/SDkq
	g2sYkRqs5eEZoGRxNwcUwdfZ7D4lJakdkdeoALSABk5w7hAoIQ5hzY1/yrGGAQWz
	u/vXx4mcERtKPyU8Kt8bVA4u5lZXGKklWTElrpxeMvd+VuDvmxuL1pGqdU6FCmjq
	AVP2hH5+LwK3uXm08cpt7TxDdvJFVr7gH8aPNDtdBW0FQxk5bv01sbbjeDzamofd
	lyxdF6QwekNIZZ4PKHnbw/iiazFi29/MzFUB6EcXxLwQpA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3txntqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:37:06 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-63230863010so13761949137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 01:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779698226; x=1780303026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fwx9ZLlt3548Y6WCHHCbQYxTTMoRGEnYiWYKbuoAZjU=;
        b=gDtZUEgEET+kgM2g7Qv9XRUYAugP4g2CamXRGs2jcdE3f38PFI5Ulkxij1amJtFzK2
         qNsdcdmN9xj4VXC3zKMed82Fct4ZtvZnOWIMmFMtUYFQR8xoLefNbaBQg9JSPkb0bGns
         rB6df+fznxOiA9sGjuy540uvVZ+tuEQ3kz2joy0AwMZHiwmeYpMGObpL0Oz9l8ypAbjT
         8wYgolzJUhLSDGBPej3q1jd7y5OB6TeVtmaxBskwK9yAdWDZ54wVLPdIxeU1DKoEHczK
         AzN+5mqQyoGtYG/Van7FPiWROjItSCyFkCB+UjUQNUBP3XlmmfiHRKN3IYzalv0KsMGP
         4UfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779698226; x=1780303026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fwx9ZLlt3548Y6WCHHCbQYxTTMoRGEnYiWYKbuoAZjU=;
        b=jgF5Ua3/+K0WJASqUGgTnVA/zHTwfMM3bbC7VLADB/oqEEJHYW/A0He6NGE11VCF4c
         S+owKbRn1t+eIoe17jtACZHFlQ9x5/wRsL5fjxHWEnCqe/ExDiBiN1ty/df9qHzqMk/N
         ELuwMkIHqoUigNuZzuarBT5FHN+fQPGTwS+6buDPROcF3J+/TUC6zDmetnwUuej9MKug
         /+V0hu8LT5ptYbbbB5Hlwb3uggXdN2J9YgJF1kC2D8ndG+LjB0iCQ0HvQ4NpXdtOlCF+
         nEX2zdOdEdL0tZQLYftANmncCmgcOr/iqsV0pre0PNPxxJPNCeS0oSw3wLtoQ8EGOy89
         t1xg==
X-Forwarded-Encrypted: i=1; AFNElJ8r8tEapc6Sjh/uuh9zVHiKsuF/JIZPWiPRlZxyH0kePl5AsBUzsUaMkWw7p5PcTtQF9RUDVxzV1bDp7NKN@vger.kernel.org
X-Gm-Message-State: AOJu0YwIQ0tBgXspB1yld/R3IvYA93qA03fZPa9SnAGDIyQd3AcWT2u5
	fPjDQ+biY0x1jciBKT2+BGfBUaNbB1ejC9LSZoDKCI8AACpC6+IV59rzAQWyKzW0DOaueFe4X0s
	RCSx+ZuchrSXmRdU06Q3gxwy1Xy6Hhi5ElYywydDuitx1CVaC/mAkXAwZTtDljapgjXCX
X-Gm-Gg: Acq92OHRzU0H/bxKxqr5MaTBCHbcVFfiVX1m6rZzzPIiTZ65zGNrGr1euKIsNnK7z6X
	VMtq/CitW7Kp2DZpqUPQlbomzCQrB98Zj/5Nnck2woSspb9p9QtdlP3JWqkfsg+zOiqRLMbrFTU
	tcWL2dbH/0pu7gwAI0ib5imLCLvH7+8cioyNJ6E1k7z7n7IIw39bH7M0gfc2RwRR2pI4DlevmoV
	FoHsigYZNnX0szeF2bxv/b3omZUsdpsGqdfKRmYHs96NeyWtIdMafx6Iu+RfYeYlOE+8r5xNjts
	Vs1e2L2mdr4pslWg56lXumOisCX5C9Y2ohW7gRl9QLRDDx/gHWKuqYWaHd4rErx2Nfzj2Ejrf//
	fz3TocQ/1ZulELuBYfh4WokBoopkxlM3O3xhN4TEUICQZre+x0D+3wEcJBSfEcfUv0txSfl2uHp
	Qu2LuyHqhtSDVtIUsnjIhU2oOlCC2tdx5hYPY=
X-Received: by 2002:a05:6102:510b:b0:62f:3e1d:a55a with SMTP id ada2fe7eead31-67c798f21fdmr6526911137.2.1779698226433;
        Mon, 25 May 2026 01:37:06 -0700 (PDT)
X-Received: by 2002:a05:6102:510b:b0:62f:3e1d:a55a with SMTP id ada2fe7eead31-67c798f21fdmr6526899137.2.1779698226077;
        Mon, 25 May 2026 01:37:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf9957sm2497662e87.81.2026.05.25.01.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:37:05 -0700 (PDT)
Date: Mon, 25 May 2026 11:37:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: misc: qcom,fastrpc: Add Maili FastRPC
 compatible
Message-ID: <meuxtcs3quchupl6gf4vtjiosmoig7zs2tc2vr2xthetem5hll@l4op77zr2srj>
References: <20260525-fastrpc-v1-1-ae9add881952@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-fastrpc-v1-1-ae9add881952@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4NyBTYWx0ZWRfX0tw+P1P/zMsc
 rxRy8nmu28n4upRqaLeD6+aHW2RmK+xP26FRh7SXn6f/llejWJ7Xc7W9NZ/+TF8eRqwK65sQUvk
 C9AS8Y9HGmOfXGFVoxZExJncT2XUzz4mkx1ImBy0cJwGYcy71wYl8J4FIfRY5Q6bmf2to/MaKvF
 vM5f25uaBEj7PI9BoVkgU3LNEeVsV+RlOt79a/LyKycsmS1ldIPpsY6hHsLCaBQIZvHcAv7OcRQ
 FWnOYQCGXcRSwJDClXB08tL5tQPLvweZDA/djF8s0X6ze42CZIVezTVWXTyWJ8FF6qoaWHMHUll
 BiuMevsuAq0vCa0Iop+WE1n3axRMqc6kC8kfWmDYULbWc4hd8+Euce2zrZPiR0vaD0oSJo5m1xB
 ZrZ/qHdcZXsT15NawSDu5DYz9dGNgqlsH1CQrYKJSLhm3O21iRN7QGom4fEKpOtdU2ncgBpjDe4
 X6PafjrIuKtaB5TBCkA==
X-Proofpoint-GUID: tC6FM4ghzgzEeyYQy3A9zd0qaP-CONFT
X-Proofpoint-ORIG-GUID: tC6FM4ghzgzEeyYQy3A9zd0qaP-CONFT
X-Authority-Analysis: v=2.4 cv=MetcfZ/f c=1 sm=1 tr=0 ts=6a140a33 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=XtIZyzpYV7b62ySdhoYA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250087
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109589-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D1B05C7E9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 02:21:17PM +0800, Yijie Yang wrote:
> Document compatible string for the FastRPC interface on the Qualcomm Maili
> SoC, which is compatible with the Qualcomm Kaanapali FastRPC and can
> fallback to Kaanapali.

Can I assume that it has the same bus width as Kaanapali?

> 
> Assisted-by: Claude:claude-opus-4-6

Claude assisting to write a one-liner patch? It's becoming ridiculous.

> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> index 2876fdd7c6e6..afe52296bf1d 100644
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -26,6 +26,7 @@ properties:
>            - enum:
>                - qcom,glymur-fastrpc
>                - qcom,hawi-fastrpc
> +              - qcom,maili-fastrpc
>            - const: qcom,kaanapali-fastrpc
>  
>    label:
> 
> ---
> base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
> change-id: 20260512-fastrpc-9f3b691f8e2d
> 
> Best regards,
> --  
> Yijie Yang <yijie.yang@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

