Return-Path: <linux-arm-msm+bounces-86528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F20CDBD00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:34:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 620DE300EE75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85484331A71;
	Wed, 24 Dec 2025 09:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ts8Njcwp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NSwLIqs+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14832327BF7
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766568870; cv=none; b=f0ZucrlWqFREku6WI5rQ7buKnjRAND7NSx8L2wwzLSxr5xTHpX6M80HD1xJ5+pYLZ/iImcZLBwvSz3xRQqRovvQNTzYpb3wesTBn36nO4FXHHsE047xM1zuv57bMb+In99pI6Wb8BvNkEI0grO8rUQDVQxup2RL9UrE6UJaKGbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766568870; c=relaxed/simple;
	bh=3Ha7AV5C6i/BfD6mrWqio7tXgIGx31Sv15gscJnTsxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NxJKcGd+bsqxetGIgRtVtVw3iViy7KYsIprgsLhWQNAYrszQ974JkDVBW0dmRDSn/z8X55YyI+CKxUuNaqUMA63FKGmlYE8YU66f5KOAhSX9mmSIqWqDhHvj8xcqYOTbNGT/5y0UCMvtc/tHermSqeHDU/jvQBiS4UcRJlmLx6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ts8Njcwp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NSwLIqs+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO17S291597726
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/SnWq9XOzIHUZAmkZSJassAH
	7o+pijJsRIjIiW+sELE=; b=Ts8NjcwpsC2BzbTnWObAC9s419uUtCzW1288pzg7
	QLSmaw1gfpy6ZLpRLZ8Nnt0IyVrBjxC+F02lR9Zcr7279/wYLK2XvSmHH0r/tbqc
	0lMCaRcfGDusKdE6LjWYSZDayZszfeMgnLQB55Nq3ZDOJT0ZSxALDQFTPsgRfV0q
	7qFa070FT8oGRpavmWZNJYSHi3TGO29ToEgtaSiWC3G7IeN5vmXlrjGoauFgAAf4
	VsF8Ms5+BzFgz+lC04y3EPiB7Of8BaVWq2zxlB59ThPtuA317TK44CtPgsvGH6Dy
	1yirsGscLBDyoUGvrW6qDgP55/I+aiTllq/rGxaAbtcAbQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683h6aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:34:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a2cff375bso124113926d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766568867; x=1767173667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/SnWq9XOzIHUZAmkZSJassAH7o+pijJsRIjIiW+sELE=;
        b=NSwLIqs+BvPqIzon+MFeWdCex0d8pEjKSbJBLfBEZXNcjGdEiC0PYvevGbJGb0tUKb
         wlmBTBPMIhGIeCWu9NRfWfTqmBmm9ld+KcUS9fA+QAUXNTGBk+tTciVfPj3sRp805IoL
         R36uFxhZB6m/4VJ6I6+7mJ3Pi4JD58RzruoisBbgBjtVSQjRDqY1o+UG8cS/ShVmyjqb
         BBcKWAmoEcBAsjol/R2VHPxW5ZjJ5gRHw85uAO5dOMhiWULAFRS2RFuXjRaWiSwWXEJA
         1Qwczf2W1huTYxeWRjQkiKdrY1PkySf7qok98xyxVww66b7KvhTzMx0gGyplEGYueFKA
         X/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766568867; x=1767173667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SnWq9XOzIHUZAmkZSJassAH7o+pijJsRIjIiW+sELE=;
        b=WwuuMJJBEU9jL/A7/t52TXFu44B+6kXjrB2u8JqjrIqMafJ5uP5LQzS/4bM+QXf1Hp
         63CAOqr2heSFFw20U8CbNQXxo1d1IRNpTF09nrFsCkIC33dhVTTWPvsgql5c0Q5mbIpd
         v1SitobzMC1WeQ7+yWtXzM5HUqVv2pCULY7LZMllBQXm/1IYL3VV9at9EyXVZvtBpMl3
         2KhyicJENaarxfb9Ki7AX1UD/OIrMwFKh/p3X+QSX0624zIDq5zdZwrWiuDKXNjPh5ni
         GwlnBV8RgjfyeTM/HbS1s5upJVwGJ1009lWN+FYlvniabv+LLZ7HmaMAwtOsHkYyGlCu
         6J7g==
X-Forwarded-Encrypted: i=1; AJvYcCXFy1SnNjRO7Rsh2a67sOCPKkPB92pF5rQLpNiMbhYnRWlk6pZ6emiYHqpy+qFjF17ieZZwMBL606fVhl1q@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/kMGfytlFxqYDveBkGqLR7zMVg1qGEXnO0ByciOwoK6u9mAiA
	AXPO/FSWKZ2X7+2eLD1bwvubITf2tewGLaJnBJMhrYbXPX0so+OzSntSdO/uL3Eyjuaj5azaBo/
	FnWBsk3+UxuLJU9SDp0e85ja++nh0Cw0P2/XOMoR7lEUjWdnmBfBpf6IgmflfeNklx5rN
X-Gm-Gg: AY/fxX6QiViZGX2U9IvpwqVy2QB+swJQgeLuP+iGoRJr6m2jmafZ4m0LDRwvxGEysMD
	1JFGoWKtsbGJAcV8P1mDlng8dfh+rDIQD0gK+Q8Pz2B7CPVVO/64YrFEWkQWrr3KT0tSoDoyIDP
	LtOEM3tJc3FkO8gM1NpbXh7VatBXWso1lpWl2zQewQTLi/rB2W50FUpbZnUXo2aLYxaRuv1fvlA
	yHhMYRTtP/H3lXTOwDwDhJa/YP4ygatsOkpSA/W8y0GP68f3vNeFC8VurQnvxTqcjW6+wcHa0kI
	7Ie1Mw0iOPs7E1rvTVU9QRHjc2oYqoskpXkuGJcoRiV0hGdDThEo1k/H+NK4zCjXqnxilZbI13k
	t/xpB6F4y7L2vOLH9fRSpIwkt/3xg0MCemAf4iDWMZotCLcoEbEuxj4TIZFEo7g4rFVEUQnn410
	vdjT4CZe0aIq319hLIt41FuTo=
X-Received: by 2002:a05:6214:5889:b0:888:6f63:a7d2 with SMTP id 6a1803df08f44-88d8166a014mr252442416d6.4.1766568867313;
        Wed, 24 Dec 2025 01:34:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmq3/TVmcrZVVPnx0Tj74HOKXwCdoUjVjfqsEz8rjYMcgrAyyXW+c6m6ZOm3yGi2Qmc9dPig==
X-Received: by 2002:a05:6214:5889:b0:888:6f63:a7d2 with SMTP id 6a1803df08f44-88d8166a014mr252442246d6.4.1766568866916;
        Wed, 24 Dec 2025 01:34:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38122680689sm39599141fa.44.2025.12.24.01.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:34:26 -0800 (PST)
Date: Wed, 24 Dec 2025 11:34:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: fastrpc: set ADSP on secure
 domain
Message-ID: <dg6xdvvdlp4dhlhsdykus4a3cwc4g6pkhy4gijiepb66g5s3fk@2l25tq7ihxth>
References: <20251224085709.741-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224085709.741-1-jianping.li@oss.qualcomm.com>
X-Proofpoint-GUID: 8jvqYjkmmXrzy_VYZ7hMmaDp28DAkso3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MSBTYWx0ZWRfX1oU+5ebWC6MK
 8sDGAFZ4H4pw1avKvO9EIYt77AJIP4RESsLosgHtaQmbtQl3vy7Hf0XhuHmnAwhLttyQnxkAtYb
 2xq5dI1iWrIHeXrEa5KM9oZL+DXo9+YsEV8V6Ia8v8BetFUjdjKDz2322vGTYW6gbv+kAuXuHvZ
 BeOzbPrarv/XSfxu3vZ6f7iO5Co+KKiYJ65cYPrcH3HtZ2nu6UK1xXoLKkcbMY8LFq1EdX2dzL3
 ibKDr1EsDQmehSP3PYQWqD1n1PLiofR2vkz0lRP6FZlQYQzhu/Dfg6v7Mu5WShIsU7vWr/CVEKU
 2OEGRn9p7w6medBa/sMrl4oK7PybzgKZVNB1EudCK5YW0ovo644W0ss3mi0FUlYMFrJ2/tGp2IJ
 F8ubQIpBAyMQdG4G3TNzytOKt68TeQnIM/SGQ0fyfLLNxjV5hS6C0zzr+0RdjcEhsjKjmr8DJTC
 QdHBGARGoiLCIaiC6zQ==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694bb3a4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dASFcsfJc0BIP6KCgYEA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 8jvqYjkmmXrzy_VYZ7hMmaDp28DAkso3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240081

On Wed, Dec 24, 2025 at 04:57:09PM +0800, Jianping Li wrote:
> On Hamoa platforms, ADSP FastRPC should be instantiated as a secure
> domain. The presence of `qcom,non-secure-domain` under the ADSP fastrpc
> node causes the kernel to expose a non-secure device node, which is not
> desired for Hamoa.

Why? You made some claims, but provided no explanation for them.

> 
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index a17900eacb20..da62c5741350 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -4193,7 +4193,6 @@ fastrpc {
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> -					qcom,non-secure-domain;
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

