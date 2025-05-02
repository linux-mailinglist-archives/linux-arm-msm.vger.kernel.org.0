Return-Path: <linux-arm-msm+bounces-56592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F9AAA7C34
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 00:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37C1B4A6993
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 22:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471EC207DFD;
	Fri,  2 May 2025 22:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bQ8JLnKN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E268632B
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 22:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746225337; cv=none; b=EkiTpMeUL55EhlPTZWJCkuPvMOj9dYGszCnZaZDpF9C9uc3CFGWj/RDw0tzjxaVkc6iEZB1UNVH+2H+V3qnkj6lQjD6ld9VdYK2hCgG16LukdWcb0KcnzWKr+k/WAR5ZODLzyfApcmYpeDvIcbzdsmcym03dn+PUaJZwUNMhA/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746225337; c=relaxed/simple;
	bh=HIvoANCYobIgEBaeF1o0L3N8Y/liT74RM47L1xXFkN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOe6IgzAMiHYKQKoVTpr/15JSgcVIf57AG9QfCmjs3DGX2ki1R7Kn4X0YfdqHH7SBTvkBxkmA6cJdrUZ7KLt7YHRF7aiX0MAf4R8LoS/1dajHGb06Ji0Nvia3fkBL69+cBR2rV+BN2IoG99g/CLwxCUkkLsqqtnPINvnlfm9Ta4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bQ8JLnKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAqU1022455
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 22:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SuCVsDN6g4TFy2W7M3iJ3Plk
	T8Xwqrsi5URWt0X1wqI=; b=bQ8JLnKNZEpvENFCL6angT79ippzHBQMcphYQ1va
	DY3KUzWc1BJbIMfVp1kqy4SdhEe/n+z5BS8DffimnnB+uGh5QIMsztMXGbz/d7H+
	P2TeZn23s6KCyTl0ExHijlsMe12COcBNSRH3BDygToDHUc7RT8VhLlp8sWrLB2wz
	0ZiCX15HoG1l+igrrqS36JLkcIqlB2IvnPIFN3RyTD/Zblhvr+hQmDvz6sMPFHZI
	+l0i2oUzLgp3xnHLzM1QBWWMtXIUwRRK0CjzkOFQwKUu/4NgF1y3x7AEfWQ1NVhs
	AyzgJ8bouC+Y1D8TA2GrU+BvvCzKoMzp0Nj2buVE9SIkuw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u4hjuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 22:35:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476900d10caso62145751cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 15:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746225327; x=1746830127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuCVsDN6g4TFy2W7M3iJ3PlkT8Xwqrsi5URWt0X1wqI=;
        b=woi5m9KTBhY0V1sFmSLkB84oHSGHdbxKBq324Ma6QKJcQd/dXC2/beUOvV1S/7yjsF
         wkhsqWaZuQWtw8DQ8SSabiZ62gyV+LBxIh7rnGrrv+QnFvocLeIUP8u74gR8ZOIRcYhH
         dDh6T7xNA7gx82JqbstPJnyTJhZbEnKAAg/vT5buQqFNC/9/Lqse53WtNoJUNIMv5vBf
         qBqrlcozfv6voJxZNbOFTBPIrigxVfSzUFtsWmZ39eVRLMdfKHnnSPIe+vFORSkG6kAb
         9t/fgX2qAgYTR5em+0lIlJl1Sy+cOUdPY2SaugJX7QqTiMBc82aRQ7RFmaONvpQHvFhk
         62Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUiSt23P9XK5P6Ftm7bzL9GaLxaYVZwcyiWNuS6CWYbohvNVquDEHQDwBMkiSV88jLb/M/b0CL0WLgOWMoD@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc0+3iAK/bHfKtjtgOD7sfr+BGAeSXS8kl9MANA88zSbfup3BC
	VB0n2IZB1sutCcDOgtLNyoG5XTmL7OR5fRqQQ0KH3LvvbUKVQ98CpgOBQi/DFpQ2kUCfyrXih2F
	tpM7Yj9JBXE71Ny1SX/LLSlb9X4/8srH0fen4QFspLGg66mI2xepGb7Gm6+nHfrp0y6wD/2sQTz
	4=
X-Gm-Gg: ASbGncs5+mjO09JklvtNw3Cm+wZGO7NAf76ANKJ1EhrjuNb/YFjwk7rjLk6UJHZ2/F/
	G35AOonLPaa8kVEgbE60p4eMJvwknCcCxX6SQApl+tByErGeGw+3JTO8GMekG59psSa7fKLTlyY
	WiPKauz9iXmoH6rhf0KwSc1YTktHetHqm5yXkN9TNBppnaNHgvzszqSLj5AAQOQcgnFxEDaeohI
	Tb7tV/rnY0ZI1wHG1ExOvbAZjEFXMSV8CrlJ8lKLa+5QJK/Nyn7C1Wpko855cKSV7By5Jjt8noc
	0WQLEPMECvW6LwZyXGnkB3rqbC4luUwGvDuE8YEl95ZrT9Eswtk4fdOc2HB9AbZz8kP+sDR65YU
	=
X-Received: by 2002:a05:622a:5516:b0:47a:fb28:8ef0 with SMTP id d75a77b69052e-48c31a23f65mr71764281cf.29.1746225326965;
        Fri, 02 May 2025 15:35:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCBMAjKkyCR6eC9CmEoV6+y+5w+kEc9kjQxO9VMh2wrtzgWX679IWlyC5ahNpaQha1KzNuUw==
X-Received: by 2002:a05:622a:5516:b0:47a:fb28:8ef0 with SMTP id d75a77b69052e-48c31a23f65mr71763981cf.29.1746225326656;
        Fri, 02 May 2025 15:35:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202901770csm4948771fa.37.2025.05.02.15.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:35:25 -0700 (PDT)
Date: Sat, 3 May 2025 01:35:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v2 3/4] clk: qcom: camcc-sc8180x: Add SC8180X camera
 clock controller driver
Message-ID: <xyvuctx5w2cr6pi2ddjd5m5xqnirloflwkewpg2bcfn2neipe3@mzkis6iklj7o>
References: <20250430-sc8180x-camcc-support-v2-0-6bbb514f467c@quicinc.com>
 <20250430-sc8180x-camcc-support-v2-3-6bbb514f467c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-sc8180x-camcc-support-v2-3-6bbb514f467c@quicinc.com>
X-Proofpoint-ORIG-GUID: t9qcO6obFFXtMl-dlEUXZgV6ExrLlvLK
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=681548b6 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=XyGygVz_FukL3ZPvZxcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NSBTYWx0ZWRfX6ImpeCsKWL7/ hIV6UH9qA71maiN5q8rQbwS0quXiL3KbqWrZ3x66oJnqCDxjm8f2L/IcB49WAbVb2IYntL8Y81h i9u8O6OP9ctHv9hm2Byu33jXve4hPW5VAI+UosfG8gwNIrp5e93jGP/HMeZREQGmaiUYyFns1z7
 4jKQ0x+MFSNfqnQEeiR3RGq8h57LaHUDR8E3q0jjSDs61YkaJTWNiL8rPXcN3UmWQIl39tYs7gE y/P+0o/zfaELgiGBuZ64/8ZMtc2uFmg4m9rCOvqjnW4Ca1S15KtYgJeZryRGHW9F6oiLB6HMBXS nucDRL38lkn5b3mCsPpEsy7i7C5d2oR3k5fVTySUxO+NyLzOWo4vb0zAJNKBF4JWP8456MDMe44
 4yrMvjve86d0z8NX7Yd3SfqhAQx7ty0dsO92u1LH1pVyRkwymUYvEXOhnJIQ+vv1NiDa8kkJ
X-Proofpoint-GUID: t9qcO6obFFXtMl-dlEUXZgV6ExrLlvLK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=826 malwarescore=0
 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020185

On Wed, Apr 30, 2025 at 04:08:57PM +0530, Satya Priya Kakitapalli wrote:
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on SC8180X platform.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---

Would it make sense to merge this driver with the camcc-sm8150.c? It
seems that the blocks are pretty similar.

>  drivers/clk/qcom/Kconfig         |   10 +
>  drivers/clk/qcom/Makefile        |    1 +
>  drivers/clk/qcom/camcc-sc8180x.c | 2897 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2908 insertions(+)
> 

-- 
With best wishes
Dmitry

