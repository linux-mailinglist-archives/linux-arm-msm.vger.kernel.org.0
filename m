Return-Path: <linux-arm-msm+bounces-70123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2341B2F4C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FFD616F78A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 09:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A942DEA75;
	Thu, 21 Aug 2025 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Olv3mpHm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE962D3ED2
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755770346; cv=none; b=PeqIwK5yzSskZTX3cX/N/Qfwz6SzQKhIeMZYKe1WaPMR7QESyguSBiTwhgAgBafjfAExiAHvpwz3z2w9kjcLbD1eCVEs1yNDE86HQVaHtWTZ2LXprNbF26cAaK1C1ceySXTeoVAHpTw/LJ7NfvGnU7AXpkMJ2Xn5cGhvMKV3NS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755770346; c=relaxed/simple;
	bh=l/NtW7cb578qaTBDBvJ9NTzgh/dMB9sTnHrrP8fSiPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnhWWg1ovB+8KO+GSR3g3m/UCEGaVcgF8iAD2HH6OOWfFHPSiAvNzL9X+/zwIZH2dIZTCQWNl3RNZWwlqnp+ISM2JkjlA/qmPw0wZdSa80e7vWbMR8xRkWNVYLcPNZ3Ty1vbOPa8RlujFzqsS0s/JJHXNWFPpEH9HfQUJXY7MQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Olv3mpHm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b86Y015133
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 09:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FXI/5DT/xtHLK1kpectqnLhs
	A6LswuB1tPQGIZ/4VWo=; b=Olv3mpHmutfPHl8XlYtnzDTAF89dQW4YttwrDlZZ
	yQSOeJ5l3SFRS97WeBNbHFLw0Swk+Gwfhq7+72YsypR7b6K343IVAzfbzui077gt
	rEO4tcZwGd0RRLNsgYI18yUWsTc1AzQLLdm/+P7vPXXYI/fJgO2AYYumNYb9u2D2
	jwIP44CSHhAAETjrjgPAj7Q9wvw7qrn446Hm5fmcUAArqVUqQkQz8B6hM4gi8pQA
	GpWrSyxXvlHpAEMDVLtdmIkQnaurg3x2Fxdd98+EtfCTf4J59dWswTWiYml/Vep8
	P1mufBaz4vRAvctFqD+pnyiZW+sviS+CD/JwTK7Vs/76TA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52cn0qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 09:59:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b10ab0062aso18836021cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 02:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755770343; x=1756375143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXI/5DT/xtHLK1kpectqnLhsA6LswuB1tPQGIZ/4VWo=;
        b=CfFU0j4pDWsiO0c54EOjABiHKc2H444+oCgrLD4zZJdk3f7AxyUadZCF9Rpn7NKH9R
         mv58BoHRG1FZQvSnQ7HbnujNFGDASgsKlGj/5ccyNAL9F793WZrJ+RBMHJSvv4cT6VVl
         /+y6TAJ0zTAQOiSRcmqj7So1pmPFPVHwKXNueOoMGbx0R4qMpOgzpoqIi0W9BG0yaERx
         /AEBiXaAJeIwhmsCCIajOPX4ItXiXcVwuNi6EJuKynqdt8+qflgD4i+sZav2gUrW6h8J
         mE6iT/WQ4DqkT9z/Cm3uyvTTiu4nz3DFOsnbGACB0hubdsExvEijdkc6THknvfqUjmZd
         8ubg==
X-Forwarded-Encrypted: i=1; AJvYcCUMky8XAK7r/ThNNF89XIxe0fBt7ijVuTfh0g10vB51JcAMq5QPLHCb4MpLQs6Mr4DZv7MGWgTaLegAEqrJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqbo5+S+3GIAbTZl3jopjEdnxxY1Ai6Nqv+nk33ChyrSHB8fqP
	I/j4LCYTn7wRkpEyw8iR8MprzJc5fqGOHGpNeE047PUxpzANz9Wl3x0cUpsQmHBC7Xn7dvYee6S
	wDtbplwXrIOLhf4vkuEpgnPdfchRrielDKEhryezUKqfCQMv/P1rhhGeeQ6nGutMPQZXy
X-Gm-Gg: ASbGnctSd3XXFkPXGgJ026xe8pCiP+bR5cdV5ceIgrlI/bUajgqaUcizad2Zith5Ce5
	M6C32dias+krMZZwzQ8dIP9k7BCDtsa6CmrXUYU2XoQcIT1o+04lij1B2C+GZKxXEQrpcFA2TgE
	CSjFL1XCyXrq9JcUDL5YNq8aY47xFEG3PAMeLF3IjGSr1SRSATUzmynx0C2OEz26uXxQer4rtCB
	tuqzJp9ojX93wsBPPz0Y+47eV0QfSx/oSQVhB10Pcp8nCDhP97uXe7dlVxRbNqmdZxFxZqv1ubB
	V800qg5A9modXapWDd9urxYCRR5H+JvDBWKSNkXxEfcV8JVN2JrwxBJN+7bKcMLhhicFJK+5hFO
	hnlMqJhDclH0wBqJQsP0oB6/ZAE0HCAreY3YlnG6IgBl9X4dSAUN0
X-Received: by 2002:a05:622a:15cd:b0:4b2:9ba2:fc62 with SMTP id d75a77b69052e-4b29ffba308mr16012231cf.79.1755770343020;
        Thu, 21 Aug 2025 02:59:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElIYmr0N0AiGl1wu6IE+VRHpKcfdrAf0kSH18uoQLdDO6TswnURy3mcmPxlB62zWOgBhITRA==
X-Received: by 2002:a05:622a:15cd:b0:4b2:9ba2:fc62 with SMTP id d75a77b69052e-4b29ffba308mr16011971cf.79.1755770342560;
        Thu, 21 Aug 2025 02:59:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef427218sm2947556e87.143.2025.08.21.02.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 02:59:01 -0700 (PDT)
Date: Thu, 21 Aug 2025 12:58:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Fix slimbam num-channels/ees
Message-ID: <n7wtrddc73fn2g3kh3gre33vhr5o6qjajqooczt4h64n64u7bw@tztkbyk2l7dp>
References: <20250821-sdm845-slimbam-channels-v1-1-498f7d46b9ee@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-sdm845-slimbam-channels-v1-1-498f7d46b9ee@linaro.org>
X-Proofpoint-GUID: waUFqj5iY0EGrmwe-zoS7uznvS_1_XQ-
X-Proofpoint-ORIG-GUID: waUFqj5iY0EGrmwe-zoS7uznvS_1_XQ-
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a6ede8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=olf7o6MLa9eKRqKXNWwA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX8XjiAXv7K6yK
 sNz09BMyBULMDO9w9GR0ibWrf0tT4wn4HmW/2yoLQQvBnBm4oSJZMYdJfR0Oe0pAWacx4tldcN9
 U/dqG0HuEqX7QFuLp64NdcACfAKnyG7afRGIyrZMTwn2TMv8RusO3UP2/4a4VbWc5oRVGZlFSbd
 KGLCWdeUaaknzzG6y1Zqg+zRfzwTGbTXorRahpF1YFXagu6j4AptdJDUPO3c8xLODQ1XxFYWNkT
 ZvjibdnW8LF6PR4tIUowBetf90/Lo0uKiqDHFk0YYNGq3kwVEXO+mcc+1aGV1TJVOx6/bDheNjf
 TpG78pMfXqPHA+W2DU/WDhh+EQh71KafPrf8hGV6qhANFoM66glgR4BxeXGLJyqmV1f9kYLsrTg
 LyenUCyA+QL8CkkrhJuPzaAY1cHRWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Thu, Aug 21, 2025 at 10:15:09AM +0200, Stephan Gerhold wrote:
> Reading the hardware registers of the &slimbam on RB3 reveals that the BAM
> supports only 23 pipes (channels) and supports 4 EEs instead of 2. This
> hasn't caused problems so far since nothing is using the extra channels,
> but attempting to use them would lead to crashes.
> 
> The bam_dma driver might warn in the future if the num-channels in the DT
> are wrong, so correct the properties in the DT to avoid future regressions.
> 
> Cc: stable@vger.kernel.org
> Fixes: 27ca1de07dc3 ("arm64: dts: qcom: sdm845: add slimbus nodes")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

