Return-Path: <linux-arm-msm+bounces-86423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FE2CDA736
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 21:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C3913002FEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBC434B413;
	Tue, 23 Dec 2025 20:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNtS0qw9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gbaQrhCy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EE12DBF78
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766520986; cv=none; b=aVXC4tUCfi6vcn08hyPJelHORkwRHAXc9d6cWZUtej1N5PQe70kB1mxf7iJbvdppNoeGIH06/U0xRtawjWZ+VHi/KwnM0Aqyc6DIknKz+h+lvyH83fqRBrEmqsy66OEhgki65xjcaYQj1WVGlV4NDJEcozWdkaJ5XB4XkUD1yTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766520986; c=relaxed/simple;
	bh=bwvFWy0d/zJxjZnixmg7+ZG1rxxiZjDsn68fhnDRl6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYryl1RhmImfff9wYVzo3JCodqQHxvIZ8g/UrFQzTccpYAnjJqMWX8DGG+DP4MQ2FtajjkdALY/S4nJboeACN+pm+d1nk5PXjYCwLDf2zeP5NOdtRZpVAlVYg91hvD7p+nfi2bOJxUuU3Nre8IQQqg5T4EyxaLWh/FUa+fYtXLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNtS0qw9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gbaQrhCy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNEN8L1913432
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9ECGpupRfaLiqIYIdw7qviZp
	4NwEym2EMqQh7VcytA8=; b=NNtS0qw9k6wsMjff7yFf/M7E1nc7YQZiCBgnfIq0
	H9w3nf5XPRyv1l1/5M8yyf2ujQXSC828Iu4OsvpwHkcOXTxijvh7OGFVlPv5R4ZS
	IdgsRvGQjcHEvLWrNVdxbC0KVaLr6n4XTPNjVTJKdH49F2YT6ac+tn7jzdL5Tdt1
	nXfejP+wslBCgCSfPkyhDu5lc59j131xPEnQdwiDjZz4tBi1M3+QclZ+zEUrrmYk
	ktKuZH9zuX8Z7c5T3fahtE75o7989bajAm2HzhJmPfC45WObrQP+m93SvoGJJJ1J
	CY/NlpmZCnAiDnC+f0UyQzWOsVumcZx/mkJwYqT3l44s6A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2h2ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:16:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso63856961cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766520983; x=1767125783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ECGpupRfaLiqIYIdw7qviZp4NwEym2EMqQh7VcytA8=;
        b=gbaQrhCy6GV5YrqTQ/x+CXejfJaCM3ZsuB5U0YT+A4Hd4R4cF5n1JVZ5TV16GmfP43
         qVOjt+tSkmjWjB/pGVYjciM3lCGiHOH4kxyZLTy7TcE8n2iXsS8lGPKONPHa6cvm0T1Q
         llnvE61OLPX60Lz1T5141tGt0w24tuFfh99bMNqxAV4J6TJoFk2nYlmc+bLl5ia1/Mgc
         JtrmIicLqB2pA8RCJlf8ZL1AIGsS4qG9WwkEIIaIJTW47/YlpU3VMn/8gdC1HnKKHV4K
         oHmR5MFeP6tZm9G5oJTMDyMHva/zD2VWzaDpBVRO1qhraSXcMYkAblADjTcoJeavp1nf
         Bu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766520983; x=1767125783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ECGpupRfaLiqIYIdw7qviZp4NwEym2EMqQh7VcytA8=;
        b=GlJVrff5Looi1+bV5FpB+EoAAo7qIi7PfS2jxFIEBlB1cTgEQlPpxSKblDwRz0Ep3y
         VVrzksxDMfgV9WNAcL3KGEOPC04GqxgRIoC6QxA/waJcq6/Vb+eclOMNKCVZ1+8NXY92
         aIxyMQyfL/HjawKLQ/cHoQPamB9apjibUahprm5KoogntB24KLs8Dh/7G9LNKsa1zUmS
         8QsGIS3wJLPl5wbVb9Vmev5BJ7625vM++B7HMjQn34XnyVQ7VFBg723xv9kYHHMLWXpH
         Ynk0Qk7oIpXtpXIQHelUnBD4Ve/emL4cgE8SRiPQ4+Yt6ua163LTBs5b7tkzmf6qXSq5
         FCAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs0UIzlvigGCCCEySxD/4hxecO3khHqcyXde4j580bqDvaEcPqYGyERAU7E7uOjA4C8kLVEphVxs5HAlMP@vger.kernel.org
X-Gm-Message-State: AOJu0YwAOglS1EsgtOeEGu4Fmjarny4qv+jHVOkJKkYqRO+HtrhJhJSQ
	yEMZKfjm0QWCnf52/IoUbY6Vlm1Nm9BciltX9stB8WJzhVqbPJI8pIOYivNds0fteor8m+YelsP
	CafJcbFi/FefC+poVbXpj+wmkVXlMYOGmxIacvFV+7EIH5jb2YNbmqcxgNbL+Lioc/3fr
X-Gm-Gg: AY/fxX7cGIGtz1xq4LDu86L4SU166YYljPY+kTA5fkDbkOh8KJKD46nzwp4x98cSEcf
	GzR5n0aVxom0YFzM4Dktxs+P6vnIbV/80V5ba7fYNjPC0S2HdBCCjkrAbHleAhS0i008meSI1TD
	SmxF7gM1tlQox3dxC7I10qtmv03IP22o+1bUeBvfVYqAbcDYYyvgLgN00rr6aRzO0UGFFUa0HR2
	RNJqInPCKSLeGxmVS+MwWdB9pTnKc+ZhjCiz9cIcitIt0XHmusHBQ3FW3KnNre598PDM8t3Yjf5
	D6BzUHBHDjFFI5jHsEOsbRHkATDcCUpN9J+zzIqoqyzY04Z5VaOoPhN5vM+EhbrW1k0/xDlOtNS
	nJ7tudyJS8Df1JNhvrwoRZXANS0BbDGT2u6uUlVIh9WpMhhe0wNV6pTYLxzR71PRHNAITvrQfV2
	5YIkaB08t6wWfFu4WZvlO8j6o=
X-Received: by 2002:a05:622a:750b:b0:4f4:d29a:40e7 with SMTP id d75a77b69052e-4f4d29a4257mr72537881cf.74.1766520982632;
        Tue, 23 Dec 2025 12:16:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECdFvKD+ipW92Bxiw1izJumGMy02FzKvHafNctwOeaTbO9ebvYzBzKblpzJ81MiNQlAN1lpQ==
X-Received: by 2002:a05:622a:750b:b0:4f4:d29a:40e7 with SMTP id d75a77b69052e-4f4d29a4257mr72537581cf.74.1766520982243;
        Tue, 23 Dec 2025 12:16:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ea2d8sm4308298e87.45.2025.12.23.12.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:16:21 -0800 (PST)
Date: Tue, 23 Dec 2025 22:16:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Drop SM8750
 ADSP from if-branch
Message-ID: <3pnmjqtxiq7vcgoimgfywuxohujlyhw5zci3vx7wbsswqunawc@2qjpsdrjw3mo>
References: <20251223130533.58468-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223130533.58468-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE2OSBTYWx0ZWRfX1LpcSiYQB6dg
 vAck5Z4hdoorhlYx+DH3QBNnwSPeMs0Sh9GE3MgvXFNzw5m8RhW4ru3MkOvLn9R0Mr1XizYvaBF
 n0JTObm04ZlQ/2z79RiYoTd0b3uuOnC+aOlEr+BxeW6nKwsKy/hM1p9SATTy+GLjnxrqin6ZUwH
 AnAcYHmwhvlXkX43JCSAe98+1rnZUiALeKSn1naDd2c2A3UKGVMsCps9c3Qjmu0s3jNHu29X8VW
 3jVr4jvXvhJQx9Ul5wr006nIpac4Uj7Vz4mKZWgBVNvh6Vs0jljSxGZLinCbB/jf9zJ4y6U5Q6f
 bFW8b+9zvSGFYyC67wYLrs/IrZ8VxM1/iFa7MLy2vYV+BRdcqOk+7Xs1fmIaE7epb0/J79MdMm2
 pTB37TAVIu8fg/jBYxteXPARZNgEzT8eSglU+NXJy/uJLxe25U5AfoUQ/OefKpp0iyqAm70x+/C
 10jG7N5Q4sHUuGNG2rQ==
X-Proofpoint-GUID: G9xuQ1K8DJRNz2BzQY6RLV5BluKcNSDv
X-Proofpoint-ORIG-GUID: G9xuQ1K8DJRNz2BzQY6RLV5BluKcNSDv
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694af897 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_foDIjl0ucieEotE9C8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230169

On Tue, Dec 23, 2025 at 02:05:34PM +0100, Krzysztof Kozlowski wrote:
> The binding for SM8750 ADSP PAS uses SM8550 ADSP as fallback, thus
> "if:then:" block with "contains:" and the fallback does not need to
> mention qcom,sm8750-adsp-pas.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml          | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

