Return-Path: <linux-arm-msm+bounces-52651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 269B7A733C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 15:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A63FA1889109
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 13:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADE82163B9;
	Thu, 27 Mar 2025 13:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jyrjzt/x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44B2215F4B
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 13:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743083933; cv=none; b=XCk8+0pPStV+e+CTLhaFs6LNQDvh9joKbhXnNyKq4Y8YwysRqepjUPoeukOaqhMZP4ST5/v9t6M0Y9NsAY21qNNFbfpcmlcvIxrP98SkPAeptR576K74ivpj0c4+7diuspm1RTki0UL5Ae9tN4xzyctEY/90q2WX7Nkuvwsdy8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743083933; c=relaxed/simple;
	bh=zZiGOhVsgo/Y8EMEI2gwr4ISypxZ3iuXl19VhRr6+uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXChznO3AewZ3QZd5SZZhdzlO4n+1cZOOB6IKaekkJqjFWLv+3SQFKLBfmsu7UozQ7Vxu6dOs1mRGD0zoQWabuR2xzQlRC+mZYn47pXcP2cINNC51QQOoxE7ifyUuzFi89XcojIhkX4t0ytSe58PfAs9F4pgbNpiD2RRxCyXAkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jyrjzt/x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jG5n005283
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 13:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jUsS+APZl4HXQqjDNLYfXk2b
	oc7MlLDwBMJMBiQ/pEk=; b=jyrjzt/x242mAzHdQTIPnNwuYd6S4Kbnrju6P8/S
	/MszTp803hDu+T8HYikCMl1uVxxtadF5pdl/GUze/J6Cf774d7cNlKSlUMLSNrUR
	4wfb1QkoWvJKK8ss4xtc52aajfhufePWdLrYfJr2XoqZZU2VRpcoM3d0VhMHxgJc
	28kghsnKw0bqgJ9vxmg7gz+piwdmmbb11l1y8y12x42daEY3wuQu3MFNTLA4Zs+f
	Smj/wCjswdRnv6pWX76fYn0udATGS1IVCAUIX0p8UaEPqqAgzEFV3anFZsW7AZfc
	hUtBaTrKCwjkY7uir4eeJNKtS9PZFWCZTKTBe0DaE4DqUQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ktenfj66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 13:58:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54e7922a1so212085085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 06:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743083929; x=1743688729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUsS+APZl4HXQqjDNLYfXk2boc7MlLDwBMJMBiQ/pEk=;
        b=eaZr3enE781kjkjpGNZRCbWOyIqjhlVnPY1iH67Hj9rj96P85m+7MksnQaBUD4Oeaq
         qxBpfrjZGBxl+z3OwmrSG7CBzzvdu05ozED6qF/K1jB7VO/eU5x2r3RNj+bsNVTEUu6C
         DJx7Xmu1zXOxTxDlJBeyJx/wP2dc4jRif5dXyiLKk6Bxd/P0mpTsJUZzAdGGR5uZqlRQ
         5iyoFNo9lh1cvYFBrfRS5rvUvWZ3VluFt2pIuZNYeF1eq8zZtdAXXho4as1Y3PbfGOAK
         9huYcvv2KP9DjaPHq9LD3VSGalGobI5TFde4RrTqtaiqLVqTEEstWCd8qXEqxSNPw1QV
         ldnw==
X-Forwarded-Encrypted: i=1; AJvYcCWVbh1edz+wfEv6C+6crXRKTKYMZXQemFFNuCfDrnoeUTV70fGy001Pph6QpfgusoaPsbO+kUsGl1Q66zTy@vger.kernel.org
X-Gm-Message-State: AOJu0YwANfRnEOoG1lq5YUt0WhfyGy6RSnKpIyyaNGGbWItiVboIii6n
	AfdlWyK457ifYruqfeGcFo5aVBU28BtgdMtHjgpbkLM4bSIiaGT1+jI7+t3imm3W6EYtDnThupl
	aUibFf5HIm4ILVsjL5Wgbr4UEwt4LEK+np+drERzat7ie/acTPxyRSERbb6qWeFYM
X-Gm-Gg: ASbGnct2nWavwhdcdnmxJkJeGBhvHvKwzOzCahtJrg7zFq46B6hS1uUrQnJVbXCxgg2
	YMP2kNWUoSNhw+ptXcVPIK9T34mpUZ8WRx8hSKXYPMR/ByGWt9jttEiAnhTVcpLws+3rTVMnaYl
	z61rN4XJ+WhaavscQ2hgDERsja7vhJuYWaTWjo8jp7DmU0JSgPBHMem7Oc7HSctvuzs8g6u4uRW
	sq3TPK/6d411Br0QQQPdrJ4veYig9EXxrBjIaysygE1J+QAwyUtD/81Uf4eqsW+MMg54Pxl19dX
	Vp9Kvh8s+S0n2ZQYSgEQY5vmEcWF/xIOH0PCqNVX6S/UdkSCCHGhud/p7NhtXIjwktcImcsZd1/
	vWG0=
X-Received: by 2002:a05:620a:4442:b0:7c5:50dd:5079 with SMTP id af79cd13be357-7c5ed9dccedmr582327885a.1.1743083928600;
        Thu, 27 Mar 2025 06:58:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT8vttqg2dbrcKW3Ur6j7+NLaTuSX/cQ8WiySVBMXjPbeM0ZUMslCQHR9/CmfciW4/NDZtSA==
X-Received: by 2002:a05:620a:4442:b0:7c5:50dd:5079 with SMTP id af79cd13be357-7c5ed9dccedmr582322685a.1.1743083928119;
        Thu, 27 Mar 2025 06:58:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d910e86sm24755411fa.102.2025.03.27.06.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 06:58:47 -0700 (PDT)
Date: Thu, 27 Mar 2025 15:58:45 +0200
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
Subject: Re: [PATCH v3 09/18] clk: qcom: camcc-sm8450: Move PLL & clk
 configuration to really probe
Message-ID: <txyqymfjfgo2gcuzkmamoi4vppg6e4zp3vxozeeehw3uw7d2fc@27t3ymulyndl>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-9-895fafd62627@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-9-895fafd62627@quicinc.com>
X-Authority-Analysis: v=2.4 cv=TuvmhCXh c=1 sm=1 tr=0 ts=67e55999 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=WExNFyCIVdiA-8HnxWkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WPbpq3JgK8tN9W3Xwgb1Pe2zw2UiyV50
X-Proofpoint-ORIG-GUID: WPbpq3JgK8tN9W3Xwgb1Pe2zw2UiyV50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270096

On Thu, Mar 27, 2025 at 03:22:29PM +0530, Jagadeesh Kona wrote:
> Camera PLLs on SM8450/SM8475 require both MMCX and MXC rails to be
> kept ON to configure the PLLs properly. Hence move runtime power
> management, PLL configuration and enable critical clocks to
> qcom_cc_really_probe() which ensures all required power domains are in
> enabled state before configuring the PLLs or enabling the clocks.
> 
> This change also removes the modelling for cam_cc_gdsc_clk and keeps it
> always ON from probe since using CLK_IS_CRITICAL will prevent the clock
> controller associated power domains from collapsing due to clock framework
> invoking clk_pm_runtime_get() during prepare.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/camcc-sm8450.c | 85 +++++++++++++++++++----------------------
>  1 file changed, 40 insertions(+), 45 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

