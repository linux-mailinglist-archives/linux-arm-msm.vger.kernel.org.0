Return-Path: <linux-arm-msm+bounces-94186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ln5Lp1Qn2n+ZwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 20:42:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB2F19CD68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 20:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95B38302D9E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 19:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18CC3EF0C5;
	Wed, 25 Feb 2026 19:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DP9qH0mn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PfF+DFOx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF0231327F
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772048535; cv=none; b=Ztig2VRu4SSJfj9FJ340jRy/sbJR1gtVDr/jv3MMKG3Gt4bF8DF9WQ3Nd1ruag3T/WDJl/Abci6hhAktK05Z+HC4rVHx0lxEw9vIcvujRUCEGbc4VeLDA18ufEXo5sdJVu9IvQjHvG3wh8hwNTOdMAIcRCQfYEtKizaldeHmnXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772048535; c=relaxed/simple;
	bh=saDe/AiAE0eebtuVVnq9JKqnzRsprP+VkkCfltzqYlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9CW4MM/aa7hszYhPw9pZwK9XUSicSlc1IgUBaJBNORwFrK2H9qZNffKNTyXq+7OyYyPiF8bWxXgWcTbgVChgDNTfW08P7wg65MTfpVHnp4TSR9kSKRMtevUifla5BM4gAoHWeLbOglc+LBsNL+8lgw9de2OjKyrG9ChfYBe3Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DP9qH0mn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PfF+DFOx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PH2Krd3100885
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uKiJRMm8nRVVx0UgrjMgw0Zj
	aPILLGggnDG0A0EXFAI=; b=DP9qH0mntEKSt685xTJTXokXhhzNWeycFfuhPcnC
	iK+oOKfa13lHhpIVTVwt5nYiv38hlqN5GpRbvMF9aY0PsvYvTwIK9ZSfhAjU612k
	OiHuV6RW5B6UlaMPCSmARAy4POmW67fqioptjedstJjhyhFecL5alwkOQEGj3g+N
	FNqqdowJSv0SoGL2NQBZNWR16fD8wGWLAOWmTzYIC2UQZ16kHBbRuEWIDPwNDXkR
	HQj9dT7omotUpTab8+WWH6RRfKgfixcMkoS6Q2B8BzIG/8GAkbsRITSUDF8iLzmT
	6tF1RnqjjwA5eUubQgCroChaJ7B22eCK+qV90/FVeF+CPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj54p8hxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:42:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3fae6f60so587425685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772048531; x=1772653331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uKiJRMm8nRVVx0UgrjMgw0ZjaPILLGggnDG0A0EXFAI=;
        b=PfF+DFOxuI1IsSFArDItE+c8FFTZkMzdzrfd+bUK3DUWtMn49FlqKmVKnN/4YtAAuD
         nFDmenC2nIYeCw/ba+ZIkx8WacdYfFunNOjJbyM4Zewy/T+QhLPhI88043H2GkZemFC4
         +0MUAJYCZskZ97u3th9IaLnxyFT3EjKIFOocQftZ/4cdYp2DGoABcyyWq4P06h2Hm58R
         z/wWu/cPKQPHmJzR5s+3CARTw/A5oratRFAR6czmbdxAXuXSZeTgu2jIWXFCvKRrznqq
         MO2SbcsYeD8S15+b0tFafDbDTDm42NeSWmhfK3YbsF8cDK+Fpx5hnbsmH5ahrVeHRkEp
         njFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772048531; x=1772653331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKiJRMm8nRVVx0UgrjMgw0ZjaPILLGggnDG0A0EXFAI=;
        b=wJWmeT8I0pth7P2tMtHjXjIxNICkOdlta9N5hXwJey/q7M5/m3bia3OBhZ4ZKEskzB
         zBdtYegAUD9tQHj1snygUqPj2usR38ErNsNFvaHgsGnnWWWGC5+AGTu15//Krps79o3l
         WfzESLVdpnKTJAb/IqVgY1En0F8DFAdVhYLgPhIF/A9IIknL5HEVue/oRSqwXDDHMBe8
         4r3t9yBcwy3DG9uh+wpm+q2ThFa8zidy9yuERIZSyP5+PhyisPCt+sQYPo+j735avHQ8
         ItwUfb/bcTTi/eo9rtxHHPD0ZO7P64CoU/ln/6xtT8sqP/R6yIh/scaVZb4G+g4Peiy8
         YIXg==
X-Forwarded-Encrypted: i=1; AJvYcCWE+5ndS6CbpBV89ZfJ65ULoYAGqxEHrcp4yOEAzJ7kWR+0XdxNGK+XKD7UjXVvZFJuboY/ru2k5TCM9Vet@vger.kernel.org
X-Gm-Message-State: AOJu0YzEfxFz4OY/Db3K8rZHk6WTRD9CGz+NPgr8d3yqwZR75EjuICoD
	x5IqMbyToEEAO8PajhC9bFQDJCTui9uZkHrrcPZOrRalJ5XajjsFeu5CdcyIHLtBY7KFonq8I+q
	3rs76MZ/Sflq2dUHK2bbQMrFIXFtvAtTCC/CYjamsQ//BedHsLYIw4spnLbcW270JLX1v
X-Gm-Gg: ATEYQzwOjC5Ii8uRGi9g/2YjJ8DUnT7LcwvklCr69zg9GTsJiQcI0dxjfjDicGfxTEB
	OJHHbgUqs1XyBu8g0CCUphCxnl6tz0VccPH+WzP0SRdBrZTzS2J9VgqnH+LxF0bSV/C5MnuRxfR
	u9lDHvDpUPgJIJA0zQwnRX9N8KLmyWiOj3Xg+mJJ6YM8CgeFnOGVECA9KzmcHqRwE1OPwUENn/9
	Hodm4571HtEYl/XmSUnnjun3/CJOnKZNf0QIKiJyFqsVbXqJVKQ1nK15EwSu3l30OQQ8LKDCW0H
	ED3uQ613zoXysV/w7qWYYx7j0pclBaGAvndZDTYoIWiT5gbdBA6j+eXqJaDthHRmxHIrzQILi+s
	DyyVfk3Jl8qaPzKuVfZmrhApXqM+CFW90npF8o6pC9RYQh6zbiIPVxYfuTE7HvgrJxIzjQrdqyr
	LPdgmjCsPbb59o/rAaJoadW8T5Coo5wAcmTlY=
X-Received: by 2002:a05:620a:2988:b0:891:7008:f2e0 with SMTP id af79cd13be357-8cbbf352669mr37081685a.8.1772048531312;
        Wed, 25 Feb 2026 11:42:11 -0800 (PST)
X-Received: by 2002:a05:620a:2988:b0:891:7008:f2e0 with SMTP id af79cd13be357-8cbbf352669mr37078485a.8.1772048530853;
        Wed, 25 Feb 2026 11:42:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a10933ea99sm3616e87.16.2026.02.25.11.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 11:42:08 -0800 (PST)
Date: Wed, 25 Feb 2026 21:42:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,sm8750-mdss: Fix model
 typo
Message-ID: <nivmy3yrxapwwba3lmmfay5ikg7tuyjelxvhhswgsavyfydabm@wkcqc2u2q44c>
References: <20260225173419.125565-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225173419.125565-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE4OCBTYWx0ZWRfX1a2FOyxNT5Pe
 o5E/zfJWQMUqvG+Wc5vWG/yhBmi30I/WZQAtEgG6JQAb5Yf5JG0zir2WFuHCcPPHG/4X6I2ElTM
 by4kVj00QrpMCGc307xPBYyytibbZJFUKTu5H1BxpfXBCmEcz7PQQZF+EzlwICkXvWImaTnGXgw
 B6g8MPF+fRUo9nWwZxTqprogMivy1l6nkpyIH6kHa94HvtINARITPya9ihJTJXMAVGU58oj+06j
 MEOBxms+PvrSYPVjiKq8lohBNgNpEeckEMhoKZx3cHQuyuidCAI+Rt+3kgI6PyT4uTiJ3A+zoCl
 AQNYLWTwvPXyfAVaplQgysmse0jkxecyzmUv8Q/SfHwG+GcsrERnNfNtKRASVD4w/UP3sKJsoL2
 VraM+JOeXdeuBhmWz2As2rKb6ohi3GiNcf0iYwUrgHoF28KVmVcn4SxqblnW/SpLJG45eh76tKl
 8hoWGiXaZjIKIi979ZA==
X-Proofpoint-GUID: DFcBFQFU7vicCSfth-CFKLZupjL19t5V
X-Authority-Analysis: v=2.4 cv=I5Bohdgg c=1 sm=1 tr=0 ts=699f5094 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=WlJJIdEJN-TvAJyvr94A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: DFcBFQFU7vicCSfth-CFKLZupjL19t5V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_03,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250188
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-94186-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9CB2F19CD68
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 06:34:20PM +0100, Krzysztof Kozlowski wrote:
> Fix obvious model typo (SM8650->SM8750) in the description.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
> index d55fda9a523e..a38c2261ef1a 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Krzysztof Kozlowski <krzk@kernel.org>
>  
>  description:
> -  SM8650 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
> +  SM8750 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
>    DPU display controller, DSI and DP interfaces etc.
>  
>  $ref: /schemas/display/msm/mdss-common.yaml#
> -- 

Fixes: 6b93840116df ("dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750")


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

