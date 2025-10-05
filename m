Return-Path: <linux-arm-msm+bounces-75991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C77BBCD45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 00:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 841783B520C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Oct 2025 22:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A69A23D7E6;
	Sun,  5 Oct 2025 22:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cj9zs/cY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8407322068B
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Oct 2025 22:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759702902; cv=none; b=AooOHQI35sTYLPmCytW9qiy4bTWrllG3j7ICtwrtP0DJBTKGoXbVE5Tp4+vll2Uxyfg2/FhFcrPS+Vube22pSdPN0y3R/phoH9ZD5JgTjhbOoeKPF7n4wovzYFilNBhX5M4SYQugmgxn9FGhrAwGpLl0+EkYtgi5FtKR52G1biM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759702902; c=relaxed/simple;
	bh=nf2JZo8S4O5Si3dpHQAuIbO0dLHifWUIEtNkyGSfUzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMRxOs7rIrDNvowRdldb2ofY+Mx3ec48SjB6bDHsjCRcIzPwjebUmyBVvvtJestl+skHv1eHWcRr7vHcYG18rftMGiphrH6HadYRmzS/HxbQHyc9nugI9LMXYQnwzqap75ALLvD9nNHdyXfuqRKAgfxazsYonp3Qch63m4KTWzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cj9zs/cY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595M2O3f000944
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Oct 2025 22:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wseIUBNjEAWHGdAYXjs/JQy7
	HUCRZAe0kBxl/0omv5Y=; b=cj9zs/cYLK1gz6TDRlg+MsgJLNn8q83AaJ+PILqT
	Yb+dWa4LSjAZmbHqzY9OGip0i4n4tW+BnhO4baAso8VEu317OIAsr5hjIpdno67g
	MfIM21jJQioxuzk6NKkle3CU9o0CahTLwqHPjKPH4V1u/H/xqWQyJmTfIMWSSApO
	FUiLVMEDgykVUAdDDutMpYubVpAxuJhB9TvQnSWzgxcTkpD4AJCSYpUflie3Rb6E
	tGvyfa4wfuF1ldtQusdP4pfKmbti9iBs/yeuNY7eiSId2WkqRuree+L/L4kXDdF0
	1GJzRgt3XC0mjP7mW13XMTfMPug310DIpYo62OWDvgVRyQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn2tav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Oct 2025 22:21:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e1f265b8b5so96588141cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Oct 2025 15:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759702899; x=1760307699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wseIUBNjEAWHGdAYXjs/JQy7HUCRZAe0kBxl/0omv5Y=;
        b=vyW2ZkFYcyJM3cLxY7fhx1p24Os7ety+7BQYeg3aJlYHQFmKSPEx5xMFgaj1VKFcEI
         +LOQYZvhXx1bqrdTBHqnR7Z1ysxB/O++qiYRLDaed9+noeVmZWzeKlxRkcbNKN3I8vIY
         6dm/KmYHWwae4nRGUXuOoPK/Y88Ts4zU7YIERT7b5NhW8XqRQhbJDRJ7xQwxIpftugrY
         4Udxu2catUIaSgsh01M1OICdIRk2ePF9XP7ULSR5lCw8Ipe6+/JgNfUBjOXIQlk0t+sL
         bmVdHDqZfLtUDCGS+Zg6BKZHPzWKWWslJ0b3Z2YNuJ8eTQlxvECM+bOlE38APpYb1NC0
         VPvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfXOR8E5neSigrUIFuqtbM3OWIfdX6753coGZuFaLFO4+yQOZ0c2ZvYB8ngtX5B/BwY/1KGSQ5FJDreEeF@vger.kernel.org
X-Gm-Message-State: AOJu0YzOs0Y1xXCWBqsHd3L0tHA77TB928EreT0PetNf4dYxzYJMDy+E
	hAbzy8OpeZi7uu545ANWjMAs9TVyYGGPs9PdWMcnJB8euiwuzubm1m5N6uT9lthLbjrgpOTgy7K
	jOVPIOayD4qBrIFKdwhrpsj/kvel6ZeH0wT+e8A8qYCXlgJ6YqcYv/YMyHSQBFMkGm+oPxekjt3
	fx
X-Gm-Gg: ASbGnctNJB40VzTT1AcJUmR7ykn/XDPZx577BAYyhCR6lPAWwhT7oB5D40XyI29U2nQ
	rucjE9CKvx5vaOSXDDrNVOx3DjgEKpnsRy7K1gaZY5HeIX1jHKHNnW37xsARnI/a9z0OQvynEXv
	Lz2xJhQv7FDuvsBGT7WutDCeBns8oGCuoQC1jAkyVAyI3zqnxNR0z+cJkbVMPgoFOtgmnwR9gQs
	cVwfLTr3JrFu4A+PhLeJowpgcjdnpCkilLn65akE2tE8aIun5xxEBX8/ycVfg5jObjdhE44JXQ4
	KRA4EJTx81TayxpTyuVZLzSICS9XKaUQSqYcuew923+24RO78s6Erz0JPLuQtD8x73H0Zr6ZtgE
	OIRo89qiACmwdSLA9RbtDjbnTVi03rvw4Bm+jEEFhF/ORYlzWB+eNiH5CLQ==
X-Received: by 2002:a05:622a:5c99:b0:4d9:f384:769f with SMTP id d75a77b69052e-4e576a453cdmr143092541cf.12.1759702899399;
        Sun, 05 Oct 2025 15:21:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNXUGPhpIT34KBgwecemNjwePmdy8rRffI0B7rY2C77xXUhRnJ64Q5MJFXBA2W2K75wHMmKQ==
X-Received: by 2002:a05:622a:5c99:b0:4d9:f384:769f with SMTP id d75a77b69052e-4e576a453cdmr143092261cf.12.1759702898894;
        Sun, 05 Oct 2025 15:21:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011404a5sm4359025e87.55.2025.10.05.15.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 15:21:37 -0700 (PDT)
Date: Mon, 6 Oct 2025 01:21:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation: dt-bindings: arm: qcom: Add Pixel 3
 and 3 XL
Message-ID: <bq3jeaxksk33ntdk32ojsdyh2d3qkglvgj6segtc3acizlkrhm@fvdsccdbuook>
References: <20251005-pixel-3-v1-0-ab8b85f6133f@ixit.cz>
 <20251005-pixel-3-v1-1-ab8b85f6133f@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251005-pixel-3-v1-1-ab8b85f6133f@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX5/sgZ7hB2MJx
 +KOI+IoWVIeRrZEETnwbkhfLWZFzDLTNf8BPSOhzwt4ng3d6EnE28/hYzsHTQLozDSB4qdcDFpk
 1YIXj6qIzoMw3dHt3iWws1o02jHJTKgNE8FhMblw4smZi6AveA4UyExD1y+WyzOTs7Ckx4mKTmO
 cbixNNHI6AC81L17pFveP2gx8oja7JVD5rYQliWaIA8889DMXrMDa47mCUELkgdqUag2fX8CsxF
 S1VXw9+Lq5io8xmJ+AqbzeEd+Jmft0uDMc6vhRk/t+Nlz7scRutdFDwWoA+uYa/vzRThriz3v8q
 hKUYHY7rJ4tcdLNbGWeD2CoAfq2YjuFRmLS7iVWsdK4iAzHpf38UEpQnLUSjswb1bWXX47hZToR
 8ZXIcSINnLG09tLgeBHEs4vpMD3gYA==
X-Proofpoint-GUID: wT5LSfYSIlRfbNugJimvmUHD73l3vGnH
X-Proofpoint-ORIG-GUID: wT5LSfYSIlRfbNugJimvmUHD73l3vGnH
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e2ef74 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=z_xC24y9C4s5lgGYHN0A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On Sun, Oct 05, 2025 at 03:16:28PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Document the bindings for the Pixel 3 and 3 XL.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index ae43b35565808..2190c5b409748 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -976,9 +976,8 @@ properties:
>  
>        - items:
>            - enum:
> -              - google,cheza
> -              - google,cheza-rev1
> -              - google,cheza-rev2

Why are you removing those?

> +              - google,blueline
> +              - google,crosshatch
>                - lenovo,yoga-c630
>                - lg,judyln
>                - lg,judyp
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry

