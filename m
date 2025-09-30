Return-Path: <linux-arm-msm+bounces-75620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93809BAE69A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 21:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E8BD3B316F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 19:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCF2285C90;
	Tue, 30 Sep 2025 19:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lN1CLLIy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1078D1E766E
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759259652; cv=none; b=J/2anUtmWImeuvK/3RemsP+mFM87o1UaBzS6zrbVEnuZ4kzL5nUt62IfEdY5KNslfASxpMinMpXohJ9JGXphBvPsJjrQnqPTbUlCt6wlP3XrEKd9Ic9k0Q4wbBqDVrkCk/v/4jEBtavgm5SNvhNFaQCcjKyOxf9ulsjGD5I1Gkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759259652; c=relaxed/simple;
	bh=PawSnYt8WmMj8SZdGcAwqC+TWH/Zc85+nywQIoFiozQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdrAHubzZfWikts1foEIjskpLRpueZ+8Na+Yronr4LwLPT6wFAGnOdeUBZuK17fx5G6gaXxLb2aq5Keo/HRNDo2PtylOf+3yrZxqQUMdZcPE6dzUcNSNNqrA7fl7lrTsx+ECaq0RfHF9YQsXCGhZoTbuCISwR2RtdiAsDrHGKyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lN1CLLIy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBvwL9010703
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=goYALe8rxnHCGdz+Re2W+Iqv
	KOXN11Rt4Lm5Gbd0TUY=; b=lN1CLLIyEBzJH2h//vLM/tnqcyL/ZTqyB8jJGtz+
	nKuSzGK8gPGsen3+t8npQOsros3KwkhLFekmnHgCT94weutkC3wlwz8Rn5zucHFK
	tvALcGzJ/YeuVG+8J5C6j7KttZb8iDMf06eW766+vFsSno5mL7z2cfOCCSrRK8gX
	uba+ufvKMHQbvb6elYfGG5vnRijU+GLrdzhuzKh1qmZf7ueCGTwNpBjR12UI0h9U
	Le9jNSfn2tInM6VTQ8o8w8vUenQwzfH8CW1dGOXIHSHiANiK6NDqBzmpgmTzl5IU
	lOu2lfdFfVFfQPlhJAC0gS3AJt1lXxJ7Jn9b/iFM/RsNfA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e5mctj2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:14:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4dec9293c62so100144461cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 12:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759259649; x=1759864449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goYALe8rxnHCGdz+Re2W+IqvKOXN11Rt4Lm5Gbd0TUY=;
        b=HR9V2Upe1o9h273PHoiqnDZP7H3GkcHb9m5BzPiiTrlH0KzGuxxfS7+8ohmRfKXyaW
         LvFGHeXTzL65rlFnOoPCF/PgsUyx13BzD4Atjp6JUbHrDFwjJf/qBaop2m1EdzQF6FOG
         Nzq6AsdKRgysnrEcPXm0xiU5tQcQsF8cG2Bs/yuH1Z+QQzTE6C5DinUABuA11EdUxmyx
         tpr3kD4f/lndlxhNWucGjawpnchG9wq4+4bpAtNbOY9U5/DSryD73DQAGhNINCu5wDor
         XaSH6bSUG1NtxKTpGusrhtmFG75vausYjT5WppZz5HkIBUPJeFssg5wR8s+UGJcx2MWP
         pK0A==
X-Forwarded-Encrypted: i=1; AJvYcCXnm0JeuOyXTlORI4OGzjAICCD9+E+0Bch0+fBJksdXnVuYCYJsKlRF0blb/ghi2DSnt4o2JUPQ/dC0kc9m@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/kg9cFexnCAcoIQF0eX/QNSHVms9oq+NrTqX0GOptjY02kazJ
	Hu/k+ELi3Zk9fIW58FUfj+H83fzcwV1FXPp4+ISXWifQMyTRtINt8blKJLVZhGl56EcC45Ymusq
	IsfgGvLFyWx/tdOs5AW3oT/iIxdiQuaLf6ftWMPAlOKa3TD1KXtIkgYmULirPsxe3gxr5
X-Gm-Gg: ASbGncuEB74dIhUgslsB2PQ7fDJIzOR/P0QKcB02KtHAePEwohfa/KWoKMuuuvA0J4p
	HIuGWgpT/w4hXSyeUhgsB1WjWvXq9f3BlQ8Q3KFAEjNEYVYKnZ111pz6CJ5Ug3RXCJaTXbPOfc6
	OzSaVQPTHi2BcIhkz3siV8kuOArI8Hb0zvPLGbZeI01upEQnIJUC7hcuNdmpyme8bhu/jtH4jwe
	XpF3dTzy2PAEPL6xPD+2LORBY2VJ/TmFzptHhiroho5WSgDUelO9c+fmidbGTpcsA2Cwn7bXpAX
	LhBzpAuRgo5v/P46YhKsAvRTw5DiJ2nvVGPbAY8tU3wuUPaREm7s7qYRirN7sLXj6zdvuDLsrh8
	EoNMIahns51Tw9t212hHTRajPKVI5DLf7uNTPbytsNOqipjFRYNuEWaQUtA==
X-Received: by 2002:a05:622a:5a09:b0:4b7:9171:7b10 with SMTP id d75a77b69052e-4e41eef7075mr9963021cf.64.1759259648946;
        Tue, 30 Sep 2025 12:14:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWaNA0ZDNYeL9wcUtcyeSgm1Kjom+qbg+3Fbj0RuE8VjgW7lsTtOWKRJ0PJ7Wa9FP7+7IEvQ==
X-Received: by 2002:a05:622a:5a09:b0:4b7:9171:7b10 with SMTP id d75a77b69052e-4e41eef7075mr9962581cf.64.1759259648498;
        Tue, 30 Sep 2025 12:14:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5879e9b81d7sm2043093e87.128.2025.09.30.12.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:14:07 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:14:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: Fix SM_VIDEOCC_6350 dependencies
Message-ID: <manv5cazdhashfkduondlikqn4ut6q53dhjhyepu34tszrdsfx@bmnjqsrtcf6n>
References: <20250930-clk-qcom-kconfig-fixes-arm-v1-0-15ae1ae9ec9f@kernel.org>
 <20250930-clk-qcom-kconfig-fixes-arm-v1-1-15ae1ae9ec9f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-clk-qcom-kconfig-fixes-arm-v1-1-15ae1ae9ec9f@kernel.org>
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=68dc2c02 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=YvO9g5Z2dZ-zDM10cScA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: K_oJIs77-dCae5pBZtufeIQD6M3c9mzM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwNCBTYWx0ZWRfX1Tj6SUJs0/fB
 BVns98e6+LQemNtpcCG7qYPXj1OlkqSaIXKQvcFTxVIALTUj1lxsAi8UW12sGszSivYuGSc+tAY
 +AEAnZ8G2Qj+l8seW6FS1oKP9CGufHCaOnUNE+wsX9fE2ZOStB5j0wTP72EUOHg0Yw7rRp1iySl
 d2VGMnukj9c/PdK83Dh2+gjColDRy1F/sDvXErB89DXoRuJhDXYYaH9aHMLv51aVKFTwu9+Dk2V
 fF9RXlTtmZbdb8y9D9/2H7mQvH/8A5LIh9lclS6qTvhUDin3vRfMiIHs00NlXcj6RwS/tSaRMg3
 xzWRa/B68FPML6Z8DsvSBnV3wM3NlVY7EUo7tkwWRiCM7MON2TEvP+ILRgAweTUVt9BSV1LPR54
 13ktL1vK/CGEs+c9GUsEwdtEI4jh0g==
X-Proofpoint-GUID: K_oJIs77-dCae5pBZtufeIQD6M3c9mzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270004

On Tue, Sep 30, 2025 at 11:56:08AM -0700, Nathan Chancellor wrote:
> It is possible to select CONFIG_SM_GCC_6350 when targeting ARCH=arm,
> causing a Kconfig warning when selecting CONFIG_SM_GCC_6350 without
> its dependencies, CONFIG_ARM64 or CONFIG_COMPILE_TEST.
> 
>   WARNING: unmet direct dependencies detected for SM_GCC_6350
>     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
>     Selected by [m]:
>     - SM_VIDEOCC_6350 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
> 
> Add the same dependency to clear up the warning.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

