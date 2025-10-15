Return-Path: <linux-arm-msm+bounces-77473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BDDBE0975
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 22:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 457CA188ABC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 20:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E289B30C630;
	Wed, 15 Oct 2025 20:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZO1rvamY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B10F30B530
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 20:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760559111; cv=none; b=EpZFBU+N4FbgglbxnotVy6K6WCvPy4qUv1Vd9SJInNLGBTzdjTpWS6x4s3kDpTzqM65DmaKXCMviBhbQqB5F3RDc+Lk7YboOfwSo35ApY4mzERWwyw1DiyxnB/VL2IE54zlTWxFxhlML++W6pvbGN0ovFEB9aB+gyRDEgoMIX/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760559111; c=relaxed/simple;
	bh=I0opz+CeGQaJbyM1X7y67HQeujGm+NLJuBgDD2I95as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AW3+OPOEVaormwvvEcAUi95g9X3gh4umbd8i5UnrrkvujzflSyo4NiEFiPWSORkCl3bs282f39FXRIfUNm62WeN04pqkYalogqLHFir92CseJZplNJw4001Vxp9tiacaDfmJdqSvptcAsyMXurG3tK7h0GS1vd4Dr9ypY7Xnt2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZO1rvamY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FBJZ1E009192
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 20:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=exb6yBmuHXSmt/4SXMu432yt
	OetghtWPekpvezd6Vrw=; b=ZO1rvamYwg18f0WPwn6VX26OO1FtIjCRa47xhdNy
	QpVBKZiN5ouQOmQ1soT062lzccYC1gr0SVWFr/OSgqhp6w+Sf58XuVhNnfuU4k8i
	TctnDxpLyEjSg8XTppPiXNTfcXWau+JLI/s8jGCCyZrR3/L2Jf9/9Fk0Oc2egObW
	Pp9GSHou0wR8r+6t/PSty0qCcG1p7J3UaMSnIf8aWenIrVAGe+8N8B0b3SdDt3iF
	ZyaVoMuQ4oaKnv78vgPOzqRE2jpeQWibf9ZRcACWTrO/Drd1EBrPSE8WVg6QlYbv
	Oaj/ngevdYXKeJPE6XHAQPqcjK4zJ2kPsZkbBxOqNEEQsA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c5qbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 20:11:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-78eb8a9d229so884476d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760559107; x=1761163907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exb6yBmuHXSmt/4SXMu432ytOetghtWPekpvezd6Vrw=;
        b=ZlqIpDc++F5e3g/kY6SYDm4TDK+oIDarlbfLI76U9w0s+dxe1iTgdp8uFXTuYaeWCB
         DcCtzOjvz1UKZvZomOtWjCLiQK5R/aFsFxB1BAd3XzS9AkVLGUmUJFR5zxqGNinbEhkl
         d4bDdHCIHQwm3Suud9HJvwZ2R9fnMYfV+ltnsmS9vTJHRC+dZ6HTffehUwYpznqF7Yjz
         Csn8BuA/FyR7JfK/wcZlSMkDjr4CMHI1uNW6x02UAT1mM81AXDiElbw/KGJrzLGSGkrA
         ij+2uPvNKTp4M/zLQ8JCpyO1remoOzisfkxk1duRoNhAjlEG2OdZMEXmBjXZGAPdKcYX
         8qng==
X-Forwarded-Encrypted: i=1; AJvYcCWTXnKM029mMVj3wrkYo38FAJHSFzD4bH5AdFOgWa0oeAf4XqcYTBSdKdUu8WC2LE+7ZpS7C5uaCfpHnDr2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Z5rkaU/qVsyO1GdjId6apf7bhPh9wjFIsMQN0bYDisdpHFHJ
	V+GzQdIyjxcN5obKxohi84coMhamkry6+Js8fP18lZ+uIM12ddMJk7Tx3sZ3+SBgJxHu5WySBjj
	OsK8+tmWH3UqBa/NGPa055npDhzQSghNG0SUaNqZvWB0mGYJO08gKMyb4nvMqrD0KZjg6EVFNrn
	z2
X-Gm-Gg: ASbGncu87mbL6aDQncmmbvKjc6sX4nJknBp4GtpUvHNoIfPKCN4zJze2L8Ts9RuyAzu
	atGO+fonbPByh0dvq0R6hrfoWOsj7FZsC2KaaX+72smZGB8WZs8mKlSf3I6bV7bI4Ocecq/Pn3W
	ar1cyzqO0PWKoed1dE6fkzLiu7kxSMFzS0Y94VqQzV2TrAU9pHbTSbKvNrG7KOmKS0MqqACbDvF
	+qmg0REiuH+ph5xwkvAh1DWYd+XiekDLhizjjAHTj9eWBBfRrjKL5p7eYu+fXy/XEsJOMYN40LI
	UMGcqFWwOUhv+kHPxZXoXtjRSQpnThagRaoU964eUCpnNjR8T2ydcmGnQilJWoLnjxA/rYcSWd8
	LI4/4xZUVz8gIdExLMobSiZuu7gaGrOmpEQFxP8e8CdFv8uakJLvs
X-Received: by 2002:ac8:5846:0:b0:4c9:281c:c738 with SMTP id d75a77b69052e-4e6ead7e931mr385840811cf.78.1760559106952;
        Wed, 15 Oct 2025 13:11:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFG7Al0sGtJhJb6iB0hBzj/J01P/Wka1A+f1F4J1JuQzoBKoBEfqY/tRt4fwhMeum7s1fBH1g==
X-Received: by 2002:ac8:5846:0:b0:4c9:281c:c738 with SMTP id d75a77b69052e-4e6ead7e931mr385840491cf.78.1760559106494;
        Wed, 15 Oct 2025 13:11:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3764e80f275sm42026941fa.42.2025.10.15.13.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 13:11:45 -0700 (PDT)
Date: Wed, 15 Oct 2025 23:11:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-starqltechn: Fix i2c-gpio
 node name
Message-ID: <4dbjpsl7m6uli4dfne7egxnyejj7i6ob2bxueld4yoaak7poi6@7wi4kx7mpm4z>
References: <20251015-topic-starltechn_i2c_gpio-v1-0-6d303184ee87@oss.qualcomm.com>
 <20251015-topic-starltechn_i2c_gpio-v1-1-6d303184ee87@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-topic-starltechn_i2c_gpio-v1-1-6d303184ee87@oss.qualcomm.com>
X-Proofpoint-GUID: jPWGlzHJ5WRyiUDcQPCQH4Rh8obGJvUV
X-Proofpoint-ORIG-GUID: jPWGlzHJ5WRyiUDcQPCQH4Rh8obGJvUV
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f00004 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=7NL5q4feChWjROO7-XYA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX/5EvJTcqZsG1
 f+EtdYdsbsg69advBTrzs2QgwE6Ln+0E5R+6xZe8JGr2zMHib9BxdJBhGrgOpbiOTIEYVpUy5e2
 92nofj2nsKVO0zk7zylE83MlgIHKMeeEn/oXOkknZEtBMOYab9ICRwYIptEnt35eLJuw3n5+M5B
 bPAIzbzrV4BLoDMWJf8QBToUTQatsV8+KerCfO1MjbQcTTgr3akt0QbU7dVIVsYFcPNZ+uqO1uN
 aBd/NO+bt50BjA2Xht0bMW74eWaMlRqcv2LxPHuUTJfIiTOnPzX/MY/RuTHWx/6f6XnQNkhqweO
 lmFijxbABG39wT4qanWo/5X/JSgiHBxjs0EWI0soyXV6960conE6EZbhwANTMEKNPSe/OdPvj6G
 iyE8Z+OrZt6TPLlF9GelUr9GWlTvcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

On Wed, Oct 15, 2025 at 06:32:16PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Fix the following DT checker warning:
> 
> $nodename:0: 'i2c21' does not match '^i2c(@.+|-[a-z0-9]+)?$'
> 
> Fixes: 3a4600448bef ("arm64: dts: qcom: sdm845-starqltechn: add display PMIC")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

