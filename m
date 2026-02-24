Return-Path: <linux-arm-msm+bounces-93929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM7bBO1dnWmxOgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 09:14:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2E118377F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 09:14:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DFBD30D2D7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E6033EB13;
	Tue, 24 Feb 2026 08:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0dmDTi/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e4j7AlC7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A2B36604B
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 08:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771920619; cv=none; b=jqkMdpivSlmxj2ya5BSi9yleNMuA19QLAExE3my9baAW5qYwgNUZtT77qYuzl8uE5hAayqZ/vTvl9+S59fW0J58T1g+9AYYHnTESmapUyaVxPJ+j5SzLDU+N27AHlIllMNm6GexD4y+8JuOho4sBDuJQ52w3EpB/LmTRHoMAgdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771920619; c=relaxed/simple;
	bh=qYVi6UpYDZWUvVX7mise+3Gu9ph4AYcoIwRD+5oqduA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGXuHTRu3BUOA1aV6Gk+bSmMbuayMNI18iFB7Mdo0yyXaYSI/TNjl8Vc8SckgMpMmJO2v3xkaXrwh/RnLzBMaP4JrGQN0lmjx9h0z79xD6/QrqVlj+JngPpCrBy34f9Z7eF0PrFmkt6dtU6O8sJK19plYM9kC0kDcgWnqd5Oz5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0dmDTi/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e4j7AlC7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4MNLD2014770
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 08:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=akfh5azzDqif5zPoRlnXnETK
	o7tY79FJ80obZSfZowQ=; b=X0dmDTi/TNbDzp4nARzZPDAuuCjz8TyVX0z0seLV
	uhjXfCA5vyRUp2dtvsOOefB3930ilLHDEGeLe1aplBPgjpEybTa05jhuQqxF/s9f
	7KT86wn/e3l+0uucl90XQQNQd5WmksPlZlJPaxWklnxIm0iE6ymcTEDtmE5OBoqO
	/IYyz3uTB/SprJjuVb3V+k8atv8WzVBQlifyJ0wNQWA7BFx9MGxwXZlzqUSnI4F0
	visi726tKWRH8XczoShtcNYIPf0K3SrjvMeatU06yOhGRqaSRqlyBVyGHQ8JMhZ/
	lmGJUvQ0XXecOy6YtCUguNTd5h5rOpYHGuYrhEmWmJqkPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgr69juwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 08:10:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ca3ef536ddso5760868485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 00:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771920616; x=1772525416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=akfh5azzDqif5zPoRlnXnETKo7tY79FJ80obZSfZowQ=;
        b=e4j7AlC7q8KMEIK44jRQTlNeIxivWlAnZ1mqg9QykNPcBkU3ZG4DTZHxYrC1L5i5e1
         uDyiA7WURk11c8LpxzEvOxEfG6GNg3LZhGBMeGKj0dcJRtXSMkdMXu5xy8R8c+0/1aws
         mnM67Xi0o5SWaqSXtiyL8LLdPuKmrZyHiMbQ6VKs3M4qrMV2WvSPUnXBkGqhO4nSkofm
         OSdFUz7YwfFBxXhpUl0jcyuoIH7Uolqzx0wd9phx4E4h9HNAe9t+d5h7BjFluhPoClnT
         EeRY1FxQ3nQACsPEtbC/DYkg86VeLqgOHDvbxCSAUvXTgtoWlBEby+4lZNeEZZCLpLCg
         Z9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771920616; x=1772525416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=akfh5azzDqif5zPoRlnXnETKo7tY79FJ80obZSfZowQ=;
        b=MWj8+i1toQva043AM9jO8/G68C4PvpJbYHpZcUvbX5UHxbo+yf7gNiLjnq4YWBqfFW
         2Aui+yI5X6EXJW7BltjcORvf5+8gCh55Hfvrnd0+1i6Ya/PLO0Q/Q4gV2otmGHXkKLN6
         H92DGq/PAANPacKspwg7osd5AinTxOJ/BgftmmJo3ONmq48SaKKZQ8/al8pn9WJZR1Aw
         asMc4NFbNTsH0Tv5DSaGfPjVKa83D1cRgy0VFKm9EhKHdwrTIza5Z0zDu7aTQSyMlrZS
         2wmqra5p90xo3FuXKCUVJ5dPphDXXuW7p7ex3u2y5/eDib+EIV3FJYEyDI8Yp7uhD8dW
         r1tA==
X-Forwarded-Encrypted: i=1; AJvYcCVZP8QRPHcZoFTGAC54OYpeFS6jz7OZb4amspn8PbZrm3ux9xrZXW6pkj+VQXmtDxpUAm5fc5sC/D8mRZae@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8UZ5N90hui/bKXIvHjMhdc40NBHDGHHZf66seGNbxrt8AdeZa
	LD+2vswGKIkCHKH9GFHwz9A1xDIoKi7n2MK3856lCp5fUjAeBW1ZpIWHAtHqFOPPE7GG4MyePUL
	n3mdilwSBe6fWJktePBgy321APhEXXtIum27cboE97pjbL6pRukIW3cRHHDTbHlUTVuFt
X-Gm-Gg: AZuq6aI2nvsPMruhpXWjb5CCB+NiwxvK/GVRoHPOtM++1+Hp6REdLLlhn9pFQm/c9kP
	k8q+ts/IbiGFkkg61cQjzHJiseGx340Tr8tkWIysgUnrLiBFm3D6qnXkdiV5VgTlM9Kg2/TopQB
	GmpdRm2wKpoTGZ1bAj5fjkbf7oVemWSMRzbBYS6sBPz4nbdI3wE9dvJqrmwdlb+qoDc5kCwEiek
	HZJDLy4njg54lndWay0faoQa5EvRGzmEZBaLHAu3RlUwIOu3WKKQyDynNAlBf+1CorgDIXtpDaj
	naLDPfHBsz0Cgo66VDdik5CAHvtZnQqvN9WY0l9C4H8XEARzq4bva4lcQEGEs7Es8Svim0QPXQz
	gm5Fiq7NOe53RMlYLwyh7YHax3d7IZ3aTQMb7
X-Received: by 2002:a05:620a:4449:b0:89f:5057:974d with SMTP id af79cd13be357-8cb8c9cc32cmr1357404985a.10.1771920616009;
        Tue, 24 Feb 2026 00:10:16 -0800 (PST)
X-Received: by 2002:a05:620a:4449:b0:89f:5057:974d with SMTP id af79cd13be357-8cb8c9cc32cmr1357400085a.10.1771920615132;
        Tue, 24 Feb 2026 00:10:15 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b81f8912sm19461595e9.1.2026.02.24.00.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 00:10:14 -0800 (PST)
Date: Tue, 24 Feb 2026 10:10:12 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interconnect: OSM L3: Add Eliza OSM L3
 compatible
Message-ID: <2dnws4hpakt4oxhbfpcnu5ga45mmx4fjxexou2gaueiqaveeyn@itiyzldq5cxr>
References: <20260223-eliza-bindings-interconnect-epss-l3-v1-1-fa83970d60ae@oss.qualcomm.com>
 <20260224-hilarious-tasteful-narwhal-c492a5@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-hilarious-tasteful-narwhal-c492a5@quoll>
X-Authority-Analysis: v=2.4 cv=O6A0fR9W c=1 sm=1 tr=0 ts=699d5ce9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9fn_TuVGXQWuGc_kkjMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: B-Z1t2a_LW_CBmE-rHj-e_6cltCVMwLU
X-Proofpoint-GUID: B-Z1t2a_LW_CBmE-rHj-e_6cltCVMwLU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA2OCBTYWx0ZWRfX6h3Se7xBWfrv
 RxVpKSrFFIPGTUYBz0W2jzO11622m0dYBT+GGesEs+5i9wyUVcdwt6jadUcCDHB5bgB/qO5FwJY
 /0OrfKIRWX7jbI8cnWzd6Q59TBdOPU5tkpwfNIlDu4N/krYoquZY9Cs2vRFaBvrPdVyhNsfceKJ
 AdzPXbXCPOZ3oduZNpVYurRGTvI9TNABX0oqVbP9ToR7myM7Gj9QPSrDpBfl+bDFznxDzVemU++
 dFOHyC4Lm8Ecl3O8FCJSnGWv6Bzejv1vRbDrLuZ8SFN7L7IagL7sMEqy/A2bqbdRDgXqXy78WPV
 EEtujF20QrrokW+8m85FBqdiGRj62H6LRpiX2mHOqSOKje+6Mr6wAitpFfhPTEWYeS0Cc+Ce9Fa
 HhDBtxp5xqoKCUOCZ0bkNgH0P5CWRJfJWC/GtSS4FJd8Fvz1andX1htY19jO1QYLcGtzjvlJ6KM
 WGGuJvIunvANbGuqOJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93929-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B2E118377F
X-Rspamd-Action: no action

On 26-02-24 08:29:09, Krzysztof Kozlowski wrote:
> On Mon, Feb 23, 2026 at 10:49:04AM +0200, Abel Vesa wrote:
> > Eliza, similarly to SDM845, uses OSM hardware for L3 scaling.
> > Document it.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> > index 4b9b98fbe8f2..6182599eb3c1 100644
> > --- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> > +++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> > @@ -28,6 +28,7 @@ properties:
> >            - const: qcom,osm-l3
> >        - items:
> >            - enum:
> > +              - qcom,eliza-epss-l3
> 
> I see EPSS, not OSM here. This is also list without SDM845, so I don't
> understand explanation in commit msg at all.

So there are two issues here:

1. EPSS bindings are handled by the OSM schema. I believe this is by
design as they basically do the same thing. Interconnect providers for
L3 scaling. So the compatible is in the right schema.

2. The commit message should've said SM8650 instead. Will fix and
respin.


