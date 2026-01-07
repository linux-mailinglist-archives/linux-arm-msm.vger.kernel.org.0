Return-Path: <linux-arm-msm+bounces-87813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32551CFC8DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 09:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 967683068BD0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 08:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEBC292B44;
	Wed,  7 Jan 2026 08:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LR/cx1/g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V0Px4qEY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BCC285C8C
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 08:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767773784; cv=none; b=tWT+O8OA/9rNd7nPOEJwzMsNFUob/h6u9MpFq3GR8FR8hZHXESHywHIoHJxyT7DBH6+6qb/y/Me1adLsQ+PG8woO9t2mNGXlzgGVFGINZNBdZZ3KCUDLXVLLE/pU0D0Xq0uw94z9b1s9owhh8HRAjwlmEIFDS0BuE1igb7KsROY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767773784; c=relaxed/simple;
	bh=b7llptmEDM1luO25/hrBZesC6P53tyMBBRiePAFHdsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rV2k1MRUJkHSJ6UqCzq7+1XPcElxKVuTXW7Nu+qZeYO8d01gSQzI1aAgs2uf/jKG0hC6lkUQON4PdruPvUYzmgAa5jqCho49HMorT9ReY47dUxr7ir4MU0FNkI+x7N93HVLbJO791JQRFd6TW8D1mrxihoA0Oq79GNzGOafgedY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LR/cx1/g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V0Px4qEY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6072nLqC731459
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 08:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yBB2cmx9lnK1XlQC3aSe2Jwt
	16yLObyrRqpkJZ/2ddE=; b=LR/cx1/gvwPOxL+YejIBsjQdZ5fGh8Rc8g+gWJRP
	2idfmcVoG6tvuyNsbY4O3kV7FHwd0ModGGhnGTfUUA911Dbt6AUotxcj3WMDQvIZ
	Jp5j/1NOpneX9sPFOOxWkCYDdINnQbTo7m9O5dDCuGmp6j4WbhrArhnHinmqznXd
	gUNVQ3vwk09lVhrMmv/Zan4Byt1V4Lj9UwSvIH6X5EI3bcmDq3/6hvX7NOY+piZ2
	q7uY2FiKBf9IvgzYJh2DO72xT7GzRnKEaOw1wpI0K+N9JiopDqD2bCC4Qg+y0SaW
	jofwXJgS0CN4jeeZqsPERDqcAJ2Y4f2BGmBxd9MG942fVg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66mjgs8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 08:16:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1d7ac8339so77113191cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 00:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767773782; x=1768378582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yBB2cmx9lnK1XlQC3aSe2Jwt16yLObyrRqpkJZ/2ddE=;
        b=V0Px4qEYEnaNCxlzZaMNjjlQeH2zBz5wqR/J8fc6WZCLgnZ250GS43rczKda0vRKVd
         rEossb7CmczdPahyE9IVueO9IO15/DReNWAGF6CHeneRWCgGOElhZLUuqNvfU3fYYB9q
         bZhgNw9iCN37CjiTIB4bR8Oa1GAzTqXwy2f7yM5j6lmUZZIggSbVEmiHKU11p654QOje
         CpKgfBcOf7zEZALdlCqhrMT6zCgNId0VhWR7gaLKe/oQt7yWZOo9ucQBVREomEEtm1sd
         wDbTip2YUCJZrIrsEGkowsQZzBwt0U9pLg0Z5kNIKO2cZpgtPubb0iVCoF9FQfus8AnO
         p2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773782; x=1768378582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBB2cmx9lnK1XlQC3aSe2Jwt16yLObyrRqpkJZ/2ddE=;
        b=A0V4neN1oTZBsuNqsz6GSuBpwsekV92TEh1KHunGqBytv91ZSnHZ8Wk8I13PBIOrn8
         ji2FcTQLaeASh+DzYDRPwgd41OssVLZozoK1fsHGuwUzM13y+yPvjx7CBmUnBgb5XaV0
         Qp/slGuppWQ88R19p2qiysyg2ThSLxBmvbBFzsgVBri+q+Y1aodK9eiGTz22SVLJnFom
         8EsDpeU50oK8OLBXZiT00TXO5VBfvNpB/V7cGFaTyt/Dcxyy12IOmgxPYhZv6eVfMavp
         hfywWtt4Msclw2uS2yOnzHYp/hr5vPH4M/BciYfznTL50Ubb+jwsdzmgoAmRp4hxTqeM
         /w3A==
X-Forwarded-Encrypted: i=1; AJvYcCXQG8W0XyDpLYS003RQZm1MiGGKGbsgFOIhtnDeWT/LWC+rMzjv646cbVFC3XOKuGnNjrF3MqznQGga9PQ0@vger.kernel.org
X-Gm-Message-State: AOJu0YzSO9IbK7rZkVHb0F5pooanGDUdm+H+lkI8UUCmOdxYUVAAojI8
	kSGbiO1xP+CzGsmlLhHc2LPQyv5xipG6H+CW0nVStAOmcr7Njd12QXmoA4ML8lrnm1+w0/X3Yyb
	rFBD0eprQ/3rbOyxl7Rh21CMGV3jjtTrmVvxn/Ymb8zQ/8U9K2AVP2VdBJE0ku3304AlT
X-Gm-Gg: AY/fxX7AGAutFHXei1qVO4iEF7zYMnLCq65H2HRYTajWbZwCU8e0S8a5r+P2exNnNCd
	9gXd6JrrjPh6bB9t28WQGvmtLTSpFpsEoBLGAIpZ5W9+KM+YlK9EDoFAgXoYUeNS+YMekQ4fwWx
	tHsXxpb7Xf/bDze9XU0m9saj8Eyri6wGcRmwAGVOUEw4/f+ybB8xuR8qL6SOF/ARD0Tlvbbs0Fh
	0YjSsh0XQ7xVYZsOfxjwkKjfM50sHqUrSGomkZYBIaGQGakmE5Wgyhi4+3CL+B/I70SXVataeu9
	JQEfsPGWiLGrbvZOAmVse2A7etHB1HaxCPaxjTCVv8L8wU1cRfS9+AGleJfgH7fhSTOumcwdzPF
	ssAZa1XDWEtGqtYLfSGn0mvsYpwt6S9jqzWoJb/8JQzxd2iLZ0LqlvMkGCnomkgY/hhchNeECFc
	Cx+VvJeOwyI7WoQNx8SCALqHU=
X-Received: by 2002:a05:622a:209:b0:4f1:b9ec:f6a4 with SMTP id d75a77b69052e-4ffb48f03edmr21060691cf.33.1767773781772;
        Wed, 07 Jan 2026 00:16:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdihUJiADpylFeISDLyhuutWUXSisSGVWPGAH1SHUu+jl7zZy3/SG5e0+6NwqMIu0tpq9bRw==
X-Received: by 2002:a05:622a:209:b0:4f1:b9ec:f6a4 with SMTP id d75a77b69052e-4ffb48f03edmr21060371cf.33.1767773781370;
        Wed, 07 Jan 2026 00:16:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b731aa442sm75691e87.95.2026.01.07.00.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:16:20 -0800 (PST)
Date: Wed, 7 Jan 2026 10:16:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: milos-fairphone-fp6: Enable UFS
Message-ID: <plypx2dvl7hbfokvuoydzdgqhlgy5ch5j3wgsxtrgrjlce72tz@qubblpc6x2jh>
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
 <20260107-milos-ufs-v1-6-6982ab20d0ac@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-milos-ufs-v1-6-6982ab20d0ac@fairphone.com>
X-Proofpoint-GUID: Dh6oFTEu6PsHXqDIxPkNb5WP9pga_FAy
X-Authority-Analysis: v=2.4 cv=PoSergM3 c=1 sm=1 tr=0 ts=695e1656 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=STFXn1ACf7ZPQ-DneOQA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA2NiBTYWx0ZWRfX2NuVqyWoXRzz
 n0RAGDRU3XjLYUssdioY3fyC90TZFnYnKuapngBVTMCY24rogCN7vvRsc7nSQiPFYQPgnCwpzHm
 l39eguWcObrKBNmhQLFxKg5/XxaLPZ9hsU5LT7ORPCvicRAPMF3XnHJt4A1acFEilDJ3Z4+wMh7
 nZft9kW1f5qnjQO6bVMHeaGMDcYU+dYK3WnR4nBmlsSitjpHIDaGJ6QQ8WrGm2ctGZlU+TcRbjH
 pHQJt1Gn7bhpkwVrYv7Ml4xD+Hu+I/iKXe3b4BtaCwv7PeoTq3FNgHVuTBIRX0tqF6zh4ZcoYfI
 fWMeReRs/C1WjkAu+r0v6c6pdUNKDVjnqC1HItA3qudxMz68Sz8pzjSkz+qc5jP6Hl9rk41kzFv
 UJk+fr4XgaPwBiOfpo3V21PlWsUqj9/txukULxe4LgDpqWj4y6+vROAj4MS+d0brBQNY+xfDQ90
 tngiyMWiuBTMOvPLg8A==
X-Proofpoint-ORIG-GUID: Dh6oFTEu6PsHXqDIxPkNb5WP9pga_FAy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070066

On Wed, Jan 07, 2026 at 09:05:56AM +0100, Luca Weiss wrote:
> Configure and enable the nodes for UFS, so that we can access the
> internal storage.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

