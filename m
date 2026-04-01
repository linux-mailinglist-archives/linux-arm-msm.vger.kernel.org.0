Return-Path: <linux-arm-msm+bounces-101331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHJtHd8EzWnhZQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:43:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 159C0379A95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 135EB3088988
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FD93F880F;
	Wed,  1 Apr 2026 11:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y+2YfixB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A71A74ug"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC01A3E3DAF
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 11:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043390; cv=none; b=V6oIPZ52CqWu+s/ngrqUl8B59EH2VxsQoEPVJ2192E8ke/oL8Dlh1OiALTaeAJ2+lLCNyunA+IelI+81sQhlC9NLUUpo33wnXW1atAX3Enp4m4smyFU9cvjhIJQRuQ2t9QquY/xYztMlOPnxvKTtQ4VZV2Fcb088vqjqay8J9p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043390; c=relaxed/simple;
	bh=2qyilwUvmoPpBOyPOp3LPtXbOnhxrUvDkemZNQx/Tvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVWzIlqb1FJGY1em+81UTgN9XN9h2Hi2CBtuHn0xXWX7EYe67xfRXNKvGYpGPJFxGLWBVkPfrdRfJi8/w/DwP2LHVsiXqW2/EJfi1Z40pPoqmMUkO2Utg9QkSznG69SRIX2/YAY8K9wJ2aB6amj3OfFNh7j6boK7KUs3Mudvmv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y+2YfixB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A71A74ug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317sQuP719334
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 11:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HCYO1QFh3Q+hgTi19uYl6mUr
	jFcin1yJshF944ZFjqY=; b=Y+2YfixBtoVWKwgqzHIw2AYatOsMBnJx2PuXnPrC
	bUvM5bTwpnlRKJCPC4Us/jUQp+M22RR6g+K/iGX5gqAYV7lIxexN5AYtHwyCUep4
	oLrfi4AlJyY7W7kg6oXozvqHi3vTdVsiXaiObgfGpkZ3T20/nCVd0VwPT0bvLRUW
	tJcu1FBTWg1yk/5wNcxw0uUghjCLtS+40gBXzHcITFPhECkpcWlDyv8YsJ3z+3Ud
	bje8Sflm1ll01i/qS6pZkcY+lPpLyg76654zAVk+Boz0s2MGuR9iTwGhaF8kRdWY
	LX7cLs7awyEraj/rUk0ztYlvxFWYwBN8x8iQsln6cDwr6A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kcsurft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 11:36:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50911c94db1so163078341cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 04:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775043387; x=1775648187; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HCYO1QFh3Q+hgTi19uYl6mUrjFcin1yJshF944ZFjqY=;
        b=A71A74uglhtB6nxpWikP+/fdAN5p72t2mWxh9S8BkO5DAz/z5NPked3gS4XiwAB8Bq
         WnzbUIZ8Jv2urdNa6as+DkyTAaGzrXzKtk2jcfZQsoQw2Xf4S1kkiSfJfwHaaB/ZoUkn
         DFYGu8KtqAzpwsWqq35vKxN2olzQXmbxSA811UhQBeVOejnG/1BIGJnoTLaAq0bdKeYa
         N7Pzi3LUg7RCilfkVF9Z4x1vV7cgLnjqvxnDwavv6H/gJBRh1Z6Jvii5QPgHd4YrAn/T
         zVOnT/GeYxeUZwHr18Dzza7zoTXkvOoqvA136LTBFRcMRB8Rs/xKzO2eneJJJMACDLxJ
         SQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775043387; x=1775648187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCYO1QFh3Q+hgTi19uYl6mUrjFcin1yJshF944ZFjqY=;
        b=dI0qH6PXhnA47M7r+hzYPKIK75GRHPHkeeMLHtiG1rf902bchEx3so+B+f+A1+AuhE
         Y++307KipiwadqCaXqDXYfiXwG9djowlAw1vmnlgv7tWuCU57c1U2qB/Zw8BBIDQ8gA2
         BbSXWLXlDupk5EozDjYTHL4/Ar1V/mOY8Ije1Whq7oKSzerMTiAIMYOTK/OTj0/QBLzF
         49oIv+74GZryqh6DYrI4pw/atOVLvINVvq6IDbpJTWtEQ7iNxtW8zTyqPuuXQei9XJbA
         o3TDBr0gURtfhYgBPBUcWwo/GaJgSSoMR5lhrKM8u15d6kCLjyTNshkwPteIYf29KO72
         I17Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHD7aCVtXNNHSLBuOEkZNp5tjybAAVk1PeH2yF4cVWTVbpd+HGsH9rwkG9ulE/5cakFYI6Bo3BNyljXX6s@vger.kernel.org
X-Gm-Message-State: AOJu0YwaIIvn4ndQqB+F201E14yg2LxAR3MFZ7zSY9x6fpybf+TGKj07
	DpSV/HoNljr3Bl0rxp82tXLlVgwkXXL7G0AZNT58TS5/qklGGNBFiQXnLCa4YpRduv6YSxphDg4
	zm7Le3UE4dQNfPRsaqKLPh9qOdkvMdugHlT2/o5eb2Fxs3eVdngNd5Li69BoDth4ZJFqd
X-Gm-Gg: ATEYQzz2ZgFbppZwL3eAt4a/EmeFlLRZpRKzcnNNjtCrfLDtpXyC78sIhQTbkrOhffX
	Ek24+3iw1mEmiuZh104Vbm6kxJoFoHLgLPPk4j5v1qtO3ihC2pisbF5fzUg1/HM+6d1mffL9OzC
	SjHyiu8NE2uZBpFPy0qPPRuw0MFe6NmXLTCLL23RvLYjtlgQVnx1EpQz5zQn0mOMwTnvhRPrzct
	gTfOa0/18+/9dtoP4+NqfP8zp5xHkiehf9PZ5+jyaaVxDm66PPEHSVqPKTd8qgOWe4Cove79sHI
	fb0qg1Mo0OMVjgfIAkmNO8Ke9OmZYzEt89CQ+y1wL1K1Y+xvj4bYBlxmnL5nbnU8r/dTga0r3o8
	VIpUFnT4IF2vCoLWgsXhRxt5YBfdHv4B6A1DuhKRH2XeaPJtUWB6QFC/SnRRri/xiMgO5Nk61gq
	0WcY1Ueos5RSrioAE7lb1egdEGUX8UlgiOwoM=
X-Received: by 2002:a05:622a:1648:b0:50b:2d05:368 with SMTP id d75a77b69052e-50d3bd09620mr42887731cf.42.1775043387291;
        Wed, 01 Apr 2026 04:36:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1648:b0:50b:2d05:368 with SMTP id d75a77b69052e-50d3bd09620mr42887211cf.42.1775043386739;
        Wed, 01 Apr 2026 04:36:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c419b631sm416944e87.52.2026.04.01.04.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:36:25 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:36:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac support
Message-ID: <7baeajhlqv6ujiqzmknjw3h6qr4mdw6qdywhaczm3c42pzjiue@nsgcbd4jsba5>
References: <20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com>
 <20260401-monaco-evk-ac-sku-v2-1-27b5f702cfba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-monaco-evk-ac-sku-v2-1-27b5f702cfba@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwNiBTYWx0ZWRfXzMyoPrKp7PbV
 /0V9XgeNDd2lc8qXgT94rQdWvU7+GJPxDfZWjXYH+WyEJfIhUumEEN4XkEsubyUrJlLEhUV6u9G
 2UuWCC0fTVbKOsCuuEYJPvaoXYDWPHh7SjuFDTayMbeBA+bHbomF11ZyVjhkRMvYYldH6EbHntg
 Bvj6iW1DFS7n5krq8C8RLxBr+G/1FSnhc24A2sH8vE8lnj8ZJrljTOTGq1N3qxVCeVq/tFJPv0I
 aH3H3+gJRXeBEw2idbP4lJYe0CAjPjJkNvt/7RAgy9kHPEXlHBN1BJ9VHUL4CBtrE3An4LskPs0
 PjSiQY3wvt7RRiKKZZgTXBb+md2zG561dkX9kcyC9KvyYy0cygHKEe4aTmIpNlhFPVjtxMkuIdH
 tb+kXl3MKSYG2Ofd8z4yhZotdFYC7dCMmP1UlIDwN//cuvrJx8LufPJAJMKUG0K0F90lHwVSOxq
 tVlzpLpVNkdTlNxkFGA==
X-Authority-Analysis: v=2.4 cv=KNlXzVFo c=1 sm=1 tr=0 ts=69cd033b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=BfzaMqt4ej4OykdqmcMA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: G_z2R_6SMnQvejgBl9F6uF76Qs7qq72T
X-Proofpoint-GUID: G_z2R_6SMnQvejgBl9F6uF76Qs7qq72T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010106
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101331-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 159C0379A95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 12:14:42AM +0530, Umang Chheda wrote:
> Introduce bindings for the monaco-evk-ac IoT board, which is
> based on the monaco-ac (QCS8300-AC) SoC variant.

If it is a different SoC SKU, should it be reflected in the SoC compat
strings?

> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index ca880c105f3b..c76365a89687 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -918,6 +918,7 @@ properties:
>            - enum:
>                - arduino,monza
>                - qcom,monaco-evk
> +              - qcom,monaco-evk-ac
>                - qcom,qcs8300-ride
>            - const: qcom,qcs8300
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

