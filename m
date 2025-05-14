Return-Path: <linux-arm-msm+bounces-58007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEC9AB77DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBA081608A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F9A296726;
	Wed, 14 May 2025 21:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQ6Qlifw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD263296704
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257835; cv=none; b=lNzvmQVasOLBSzILZNd1Pml//5HHeU63liPbeVEuQ4/64ai3rpYqgreSYqu9UCHgi5ZaXSeHWbcdjHvUkMR3t7iVXJrHIkgILzCTp13mHfCpe++ZebpL29ZfdhGRsZqOKcStdIlnGPUjuXGhSibg9dWaci49ihWIAB4UjcdKX3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257835; c=relaxed/simple;
	bh=7pH57kK3Xt/csRgr21H64G5Du+sG79Jaz8WQJncHCHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nb8ClxKL20WdK5iigip3MPjMYS+dMusjPTxv7owvjthIMimqM5RnjHOXrhd445sWre1yPHTNvlmNnCjfjeA1CFE/fl9JdGbtEM0sMc5BfcaK2FcYZZGEuI6OAgGe7986DhAgW3Yl/pEm8yPnzZBNJIFmWcPTud7pNaJpsnyT6fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQ6Qlifw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKWJc2012652
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cCO7ZLjC2zRcvoyTH09XsMKd
	bgJeYbUHpzeM6fhi2xU=; b=cQ6QlifwB7yASKlwLhMCDOgZR7Qj/m7rHDy1/bow
	VaMRzQI+S6TmdXBq2zbqYR8zeLGjXzuhi0BLKyVjmSPGEZD6NYIaPJ5p5KKVXUp9
	KI+LeNyDJEEUQszQIAsWr8XZbsVAQoW9HO13SvnGskTsQXBejl47IlAeNfPCXual
	c7UApFHgxmyk2znVHYxYVc4PSErYZ9ymct+T1EMAW+JrHuFivwUiTPKM2EPmkDrK
	HhSwg4TnfRsgvvLWQat0NC1LY2u8jP6GzheA+tG4Ke6cVe2BPhksIQ0ILlCCvk7B
	asp5M+ax+/+0lGhOkziLSWpEvWJXEA+V4KNks4hcwtk5wA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcym66c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:23:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e2a31f75so54747885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 14:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257831; x=1747862631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCO7ZLjC2zRcvoyTH09XsMKdbgJeYbUHpzeM6fhi2xU=;
        b=DzWimf+oK5lRjET9238saPpl7m7/RTljtClxBHQIuBc5EIUKnZD1x6roG1i/skRjpX
         wM7UBGXpkCOQIDDgtk5YCv/Mr4FB9LfTRJw/ktbAnUnCl52D6w6DMbYUeCLDp1MAEP2s
         aYcR+/NDWeahDYiKEyt23dm0UIJwb3axOfOnLPp/GwYdqBXTZhZqcquwzRjhZMvv3LgG
         8Ggc5BkTHeo5TfpYFnG5mmvu/6Kb9dzLtghSWiTE1FvyGRQJH6ACuniQYCusSZmLHBJF
         UGIZxKsGbycg31x/6lrl7T7te+lHtL3/TWjEtPFqnQrGaTL6sf0d2baxtwPk0OyppXuu
         e5aA==
X-Forwarded-Encrypted: i=1; AJvYcCUgpW5DzJuCR40Yv+uFG5pkjF/wTTnVn5SRSgife5XG1z3R0/+EZQ2ewcwA25idnRKrZtneMgbrPznycGAl@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjku6YHuahRC72bXgYrQKGX+CTpN7eUWUW0I40o8tRVLpKActN
	B430P5P01EenoN2l0faprJcSpZD3jspIlpFkxRrM4kj31cqq/DdsyqHAqTlZCEgOlKeUrTSjACt
	FFYFDgpU5V32+2cT7XfEoR/9GEmTQBz7vjt2+Pz4RObtQHyW7kp/g1Zod7XWACxmm
X-Gm-Gg: ASbGnctYRMAJyxurupaLguOxIsqG0X7j6sm+OywPnB1DEoeZEPfJkjXGdpJa1iuCSfK
	ndD0utH5zcGnzwQ1fP8mzowUXbOQJseg4UFOKo7v02hHA3G2ev0BJz7WyxcbcfXzewCxbWpmTSy
	8KdZCaCqjzuFwsTyl8WSW17elvpHXkdq2wJtFwpc+P8VnmNsOaTOF+OZJ8HQ0GkSqMCULhDVASg
	2rNrtnYjBio6hx1iTSI350Kyfrg/QxGVs7qjrxf0Ui+1jaFBQ76YP79Si4kYmMoB0+/bb99MSnX
	FgcTMac9nuMoRsjLWv7vxY43ZJM6AL1DqadNXJ6T8aEx3dzfCiaPJcro6MTKA/OHG7mf1cOd9SQ
	=
X-Received: by 2002:a05:620a:31a2:b0:7c5:994a:7f62 with SMTP id af79cd13be357-7cd2884730amr684239085a.41.1747257831539;
        Wed, 14 May 2025 14:23:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzrBQbPnoKVl7bHQ0qQGVk2ZFKEoO/D0xKVkhPDkIPzUXUVOhZMKskuU22tP/6q2an1SNjNA==
X-Received: by 2002:a05:620a:31a2:b0:7c5:994a:7f62 with SMTP id af79cd13be357-7cd2884730amr684236985a.41.1747257831256;
        Wed, 14 May 2025 14:23:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fd0esm2387959e87.6.2025.05.14.14.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:23:50 -0700 (PDT)
Date: Thu, 15 May 2025 00:23:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 18/18] arm64: dts: qcom: sm8650: Additionally manage
 MXC power domain in camcc
Message-ID: <mffphqhgr2uugrahumcvb3g5swqxno3gi5b45z5qnrbvzncyrn@arz725xwg463>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-18-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-18-571c63297d01@quicinc.com>
X-Proofpoint-GUID: yN9reQiBA8CqmstCwsBnXMeD-93DRLPf
X-Proofpoint-ORIG-GUID: yN9reQiBA8CqmstCwsBnXMeD-93DRLPf
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=682509e8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=l4YKJxAlfa9iYSc-yQoA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5OCBTYWx0ZWRfX2KjsePM3elS3
 7+I+1yiFoLKT1/M09iCrgGFNKTH23XgVXxTvpOfu5iMnPWV0Q26NoKskMvyNqP8yKOk9+MrsqIT
 kzOJlrv5smmw7vMoDNxty9kcNWZDfylgyJom9x1z8MTB1iIZrVUl2JH62SiZ4/0miGyuUPjfdKl
 QRW0Q8SB1ag1/eDcfNq3tpHKlx1StK/8uiLzKwBdZmPzt87gSQBkDVgc2SdbdRF9Swhn+xVMAid
 YdehTsDwkQcYV9eytoSTDCgO4CpIolPw15k4DQVlBFO3K7uGEDSrjxbNfuXSC3PbRGRe2HrhO+a
 U7YjVL2VuGpqR+CvxHfFm8whoC2p117EaVzBGdG9GBdUDbM6cS8JNH1AqX1k0KykH0tOrLBsS+F
 jBlGAbHEKAnpgI/kiuDJxEX7AlGrAogxTjrIMHHmVcpyPAsFgQM7R2IqjIM8YcdIDdz71zBq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=551 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140198

On Thu, May 15, 2025 at 12:39:03AM +0530, Jagadeesh Kona wrote:
> Camcc requires both MMCX and MXC rails to be powered ON to configure
> the camera PLLs on SM8650 platform. Hence add MXC power domain to
> camcc node on SM8650.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

