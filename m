Return-Path: <linux-arm-msm+bounces-52645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16504A7329C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 13:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 145A37A181A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 12:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC90838FA6;
	Thu, 27 Mar 2025 12:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gAOtRGf5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C17E2F2A
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 12:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743079918; cv=none; b=Us55XfqSAnyVGfX9kTkLhOkoEW63uW/g94kYYECWgCHkMxUqSolnqyr15r/q4JyJzBVmNBE32wINzXnLMSu5q4UKXME06571yL/sVzllU/tbiOxInfQQvtZVRpGixPqmBrlYwkOqyw1KpOQN7+js1PCfRYY5x8dc21sTHwmTR1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743079918; c=relaxed/simple;
	bh=pRLWHIKpxAtnCsh/nWytTFegaJTWyktX21VnT7GCvIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lD/tc0rKbSdnBSGRJMFriFeXIZGOhYi7EC4hfxfQ750ovySQ27ezqZcvM6L8/HLwgSfNKEPiIFNjlf0F3yPDM/gFnhWW2GxUaizyDmzdvFHIYXb7tL/ZRxSx59oBbcJzcy7tCr6yoU7FnSjHUudFBbcnTPMM53SKuW0EyEErsWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gAOtRGf5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jFec010180
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 12:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZBCOV1uS/N7q5vX7EpjTo/9T
	Wfdmz7+2VNj9q/T3SCs=; b=gAOtRGf5Nzmo64jBZiIHDDs3YAc/W3YAzO5z9R/h
	XNhqWje1P/Hs+azhIs2c6Na1UYsaAWm5ovfGaZa1zaqp0VrWMy4+/IWTVNqiLPON
	6mfk74eUNZdx3Ki1YKlvzjuuYfBDm4sVTTHBkvJqhCnBVISB1tULL8rfmQvIZGOW
	JdMLLyL1WYC/FBKGUOs55Biu1tpnK9JBwYlfjDzJPIBR+RTJBOTnJZYIGz7dHadX
	khKxpY8vxhrm+8sXk1BE4DjB090m3rgMHyAO0JY35t2HfxMtU0Hgbp9R0nf7D8rZ
	qpl8C+aiTIMCRvW/IkSxOGLg2HADmj6Ohzj2NVqd/DFR5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmcygmqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 12:51:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c3c8f8ab79so142646185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 05:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079915; x=1743684715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBCOV1uS/N7q5vX7EpjTo/9TWfdmz7+2VNj9q/T3SCs=;
        b=Kii5TZfCPA4+RBFgMxVBLYuYNGl5dc7juXLojP/CjZ2ZoiOwN3DL63RuTKKh1qTorI
         QwNl+yz9FfbHKDJSndDHwlCg2CDvnoOY+rIP5KOFixMe4wwkGxTmodJCE+Zf8uNBXXir
         4Eg29ex4ZL2lCXN7kfP9K26vJVMKvDqdi6SXXi4Mq/zZBo5bZ09exKtJoVcdNHxknSJI
         08JfgKBTdUvX+T/kQjgrL0jbAMMqsKiw1c8dTLwm33ugaFP2RjUVVY9Sx4jby1awkTH4
         DMg0ijeLfn5r0DAxSqLmmzLiTNCbEiF2p5V40OrAKayzyFmNEP/PYa5/qg2aNMa6G0/a
         RCmw==
X-Forwarded-Encrypted: i=1; AJvYcCX7OpRvJVJMgoZDwqFToy1oT/9+0IBQXVLrl5OKkRRP6KXuT+G39JGfucApIyHvKA5Uh7x3DRtsuVYy3GR0@vger.kernel.org
X-Gm-Message-State: AOJu0YzqcHw4aydATrMJPIohMe67DQ04b2hwpBMBbtq755BzbzmRdE+U
	vOx+GiLsB0EV+NEYDak1kOigO9LIxUa63DzjiRJK/rfZDLPUEKykH3/KZWJxCoBFT4TMqMduHcV
	/wBdfuKSNDdEbAbJeVnuTZk8ELrQ8TPMAC9iRR7cR1/3j7xpz0bgg7WwBnLEIADew
X-Gm-Gg: ASbGncvuRhrzEIU+rp1up+yo6XSAHVNJgIIaxk0FS6KY1qY4O9UvLZYEHpvuvOd3eTd
	UaFgPv+7dmHTlUdUGfgYeERLnkmZONl8W730cNPdFbnDs5UAy8JH/ollDLKOI/frtZuYsHxhZhK
	CcrWvr4m2XsVai7x+JfhVPjqV5FGhARplJUjPJ/lcZxF1C+ij1kAYjeD4JWAjsZU4f0cjiZuu5E
	MTLPHrrBPYWPDzpKRoc1kDwMC2JAYNgazgOZOmvYNuJXZ5cacYxZydrFzRZv1EpssSGbgefuxqo
	vQn8kud39H/wtgo0lYkYNM48k6eF8+/yeqvOGE0dSXs5DKzQisNcuEavDYBqx41Kk6c1lY9uTjp
	GDnA=
X-Received: by 2002:a05:620a:3721:b0:7c0:c3ea:6982 with SMTP id af79cd13be357-7c5ed9f1e39mr435497385a.14.1743079915412;
        Thu, 27 Mar 2025 05:51:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuF29Y3nfHrrwUHt/LBXhkbdI4Z2Cs7fMFZYNi77Mai7aCOVA5UqjiL7PGwH+dL5lO9sti4g==
X-Received: by 2002:a05:620a:3721:b0:7c0:c3ea:6982 with SMTP id af79cd13be357-7c5ed9f1e39mr435492985a.14.1743079914922;
        Thu, 27 Mar 2025 05:51:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647b468sm2073129e87.59.2025.03.27.05.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:51:53 -0700 (PDT)
Date: Thu, 27 Mar 2025 14:51:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 07/18] clk: qcom: videocc-sm8450: Move PLL & clk
 configuration to really probe
Message-ID: <bqhjxv5rrho2os5tswhl5pjn3s7gbdsuebnadptfaiml2dgnt2@aac5t7c4zvfc>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-7-895fafd62627@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-7-895fafd62627@quicinc.com>
X-Authority-Analysis: v=2.4 cv=EZ3IQOmC c=1 sm=1 tr=0 ts=67e549ec cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=CXQnK64LRHhqnx0rWp8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kL9HKYyams4J0FWOmXooOiGffrrp-m0-
X-Proofpoint-GUID: kL9HKYyams4J0FWOmXooOiGffrrp-m0-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270088

On Thu, Mar 27, 2025 at 03:22:27PM +0530, Jagadeesh Kona wrote:
> Video PLLs on SM8450/SM8475 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management, PLL
> configuration and enable critical clocks to qcom_cc_really_probe() which
> ensures all required power domains are in enabled state before configuring
> the PLLs or enabling the clocks.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/videocc-sm8450.c | 54 +++++++++++++++------------------------
>  1 file changed, 21 insertions(+), 33 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

