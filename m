Return-Path: <linux-arm-msm+bounces-59967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1742CAC9E03
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jun 2025 09:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C261316EF85
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jun 2025 07:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1530319E7D1;
	Sun,  1 Jun 2025 07:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STgqg+Ir"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809BB18CC1D
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Jun 2025 07:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748763643; cv=none; b=aV6o5oDhXLaaADubmzJfVKpb9IrG6cj8mTAiN+0ol6KTmfflUqr2p+Qh2c4ofOPnHXymrLAlexnyMOJt9qMfkOnECCbk5b5+st8LZRYUk0p3+zDsEE6uSY+AUEJ6KHw+4cqSlD7RXAJYdB1M66mejeUzokkxygeq9IwYd8njZag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748763643; c=relaxed/simple;
	bh=c2Kd/vHDZi6zUJp8VpV+4TfsPz8Ez6EjXDsGFv3p3AI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHDM8MetTknLLx93hPJk1oPTTy846WNnWl1IDrK2N7rBnsNcoh3t2B+tBSEBSwMhXt60ugFmLG+75bGR/zF7goS3c5FA5318m8xwFu4qxZCRNxXfBehiAy49cHSA3o/rTw9zEobo+K2RV9LpMlgxUZk4ElumYU8md+Cxc4bBrJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STgqg+Ir; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5515UxGU003582
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Jun 2025 07:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2TPRUsm8psQRqZTnF9CJckvC
	EpIYayXZFgazKyBaVgk=; b=STgqg+IrBbkWSSAdkjpXAjHjChm677m62XsDH12/
	0mHjQLKludmBDPmJl8Dg7n9Nf2QbFaxNFh3zVf429pM9Il3/JJffDp3L6FPIrDQc
	2Pglnrdf8aQCciRIijL9SoDoBlWEH8lBBe1ha4ZvV/dkFwVHcALD4+SJiTRcXzwu
	QyY2qF6u1EcRpCdOMGxy7iyDbIIgdyjTIZDtu5gsnSxZ5EUHamZmeRnqsDPnpOQs
	fD3iS78F9ddX1BI0r7FWB9IffDqblZdHm8Pl1c14Xidf2FXyoC9TV7nwSM/F/CiE
	B09hJvEqamsap6PlyP7IZoCuALkOo64cGooyt9LmizVUnw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytm4j095-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jun 2025 07:40:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c92425a8b1so379151285a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jun 2025 00:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748763639; x=1749368439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TPRUsm8psQRqZTnF9CJckvCEpIYayXZFgazKyBaVgk=;
        b=cU01yvXMGcd99mQKO4/0Aj+UNOV8v7ogxMdRZQro84OrH4zD3tkHMYAg4jD0gnzDza
         FWfmaGhcQwg9xeIzAR6k/l0pEQyh+Ge+SlHvgcy9jE2gtgcVw3o/+jKIBLzBgxAW283v
         rBy9pb3MeQObnfCxLfYb/BJ5izmXg60O4GdGWL0nq6S6bsc51QvYlmLYf15JH+0kKUxZ
         PN7j9/i7EuWJs0LIrLhhcztnO4Bt6jxoPqjNuFBH8lBrDImxZvok7dBAZeQR7+sm0K97
         qEMb9bJOpkSRQBmuc2zbFFStsjP8pG3R7gCVeQlKrvRY9MyWHV/8qiCSWqryz8dyJn4z
         ftKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGf8qfl3f1QNOCadSQg+8DfWxSa5+7wkDhG4SRjy3RUlEExKDaSGELsF1nHUULkK+6TaoMWXmLFrj9KA/W@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/686emB+m/0p0KuOjucsKWkchjA5QDge5BTvdIC+2TtbylByj
	SzO0HOxmmhx+AkNE95JsXQAO02XiLNfu2B4NzP9iNukCS2c/01+tBXvmxIYiDwapj/ZWpl/GMD7
	Tssjx6e3nvYumaq4Y/MOttTvRlQQ4zkCXzEKChDq4xuVCk+0pm2WRfa+3qiMhDt9q6EgL
X-Gm-Gg: ASbGncut1zLJX/hHkzEiAPj78itmjw+72lUKo46euV7SHgy5AFgyiCJEhqWg79lPFdC
	Q+maEmd4ix44vJ94egzx8wzGjsADAFNWgke9VBf3DZTTGStAaGlPZt28jvs8YPuWFh7i1eo6+sQ
	gO6H8qGkTJboZec+Epj8m1PXT4lEXzTmeYn8vvIZAzlc9nvADUfu8N/BSayppcW7NeHJn7YA2cC
	gFhtnGkRn5SAZq4RiVqh7PF7Q6oijDt/8011RMzlbSsKPMm5rhPrzi6SO/fnAUtBt98tWjU7Ynf
	tbeFjz7hQYtRjUhVB70laZAyl1rJ2D2y3w7sN7FozDMQ13tP7/Rt9uYNH8BFl90YG2D6f6AB8vI
	=
X-Received: by 2002:a05:620a:2483:b0:7ce:ed0e:423c with SMTP id af79cd13be357-7d098777f3emr2039779185a.9.1748763639305;
        Sun, 01 Jun 2025 00:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGRrw/U4sl8C3LM2p+TsZ0Htgb/XfNRzYHoD1LwhDIj62ogYv83HavYT1ZJeTy3y4R2wbWzQ==
X-Received: by 2002:a05:620a:2483:b0:7ce:ed0e:423c with SMTP id af79cd13be357-7d098777f3emr2039777485a.9.1748763638981;
        Sun, 01 Jun 2025 00:40:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85bd29d7sm10801441fa.99.2025.06.01.00.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 00:40:38 -0700 (PDT)
Date: Sun, 1 Jun 2025 10:40:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sdm630: Add Venus OPP table
Message-ID: <5kn47uzlfihae4pxoglivuyyv2lchunoq72wyps3mqguthwhks@k7obux24cv6d>
References: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
 <20250531-topic-venus_opp_arm64-v1-4-54c6c417839f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531-topic-venus_opp_arm64-v1-4-54c6c417839f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RrDFLDmK c=1 sm=1 tr=0 ts=683c03f8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=bnwqEipTlhqVJVXZ2T8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Mpb3NL6Q4RZyupsEdkjiMKp8TtVoqM8O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAxMDA2MSBTYWx0ZWRfX9XUWYUT0oBK6
 KjrwC9jcXeTl6qBGX5HxHWkX9+neQksfTWgJaJpETN4Xb0fuqks3eVghZo9OMoLsb4Y7pL5Etl1
 FKP6dAdfIfMqcecguyIt6Faok/1oxkZlml3vvC4wES7d9EK6R1AntESQBqa6Qm3SGdZTJbTDB1J
 itMXbCRNyaBX74Vuqbktqd25kS2sLPZJfEiiVjzMbJUmXqS89iX9O6HAjmmxjgoyfUUFi+8geHN
 8yaq69Edw13QFRR/c/GFEoY82T80CBZKFESneruJKk07du27QBwRhMunZN4Hc+Sc+BKIC/beRnN
 yhsfnm/BEOg1TwT2v4Xy6tGU00W+rFOmyfssCZ5ZhyR3EuND31fX4SXrpqHUeyi/zzctsl2tn4y
 gIc30As4EkW+e2fpfzHg/KwLJyACG/FSCi7p0/FHrxAWpGSPXJ+2jHv4pglIcNgnPchYA2/Q
X-Proofpoint-GUID: Mpb3NL6Q4RZyupsEdkjiMKp8TtVoqM8O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-01_03,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 mlxlogscore=807 impostorscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506010061

On Sat, May 31, 2025 at 02:27:22PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Describe the DVFS levels explicitly.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

