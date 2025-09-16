Return-Path: <linux-arm-msm+bounces-73690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCE7B5947F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2090B7A53B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE682C178D;
	Tue, 16 Sep 2025 10:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iyu5PinM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1922C0F66
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758020367; cv=none; b=smFHP2aJV7Hp3p2GWt7uRraPIYTJKh4RNCHUdCEiYW7fx54AlhZ+Anzg4M2HLWtvNIwalA+POE0+BVNsdhWm3MnBIRLo84P2b4F/fyMA97MCY+7xqS2Nz3+RyPxFgSNnlcVNMqexVd9tYeYcpz1IH57YmliE9CfYytuGhSFymxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758020367; c=relaxed/simple;
	bh=3dM7vJjkg5Mx5e5iRX613YlVuqKV1/6CMF1mfmG8ByA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mjb4Kwh8XAJTUioAc1NSY7+EygPeN6/suRx5G2FTHzfEwemWewcPhpGTQ6KgUODYClAx2oN14TXKNYlLjL4E8eOK3FmnlLXwZFaDqSouigyBQXFGqqu0f2UNBRD7aCt+UgClN1kriRqfS+0yA2YPAbUlqMIDTSzGdl3h4/RVPpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iyu5PinM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAf8gS021231
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mFiDkj+L3cwYNIifGEmZEYEZ
	JXhnfzx+t8PT08ZFf5U=; b=iyu5PinMriJk0GeFWONK3k72LxXT9dlRpzDlwyID
	4isrTtlsPWxGcINhGfRg2Gz5klPHcUspF3zgrVQ+seHHm0GDEZbC3vFJAlvWN1W7
	J9KZCeD8idbZDwUHjhannikKtAwrG4llLAVfqxzB1vfwixDftMI+ZtJQiHpQ4QiD
	vHkr0TDI/RcA2d40hH0TN3wDURsxw6x0VSyS9ieY2/L75xobUQ7HFngo9mMaOdit
	hv6c0eRkZA67mzRSBZQVbHCoSgiDq1QDbtnHZjhaa6JU5Jp3TObH8SJSkVPB08ir
	56dC+5seyG2nJwTCZcx+QaWjJ2DZuxXjJPFFCr5GokZ8uA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yma8k58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:59:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b345aff439so136928261cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 03:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758020364; x=1758625164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFiDkj+L3cwYNIifGEmZEYEZJXhnfzx+t8PT08ZFf5U=;
        b=evX3y0O9Uq86969kRDuTF3EI4TAkO2rvgtgyUxMVs9z08ezkZ0qSc6BJowXr3554Vs
         PZspide9WV9njNVt6IPpt4F4zmclq0GG9gA79Ocr/LWY0GEjKvwPC3Mi1vci2aD22EHJ
         Nddm62Zl4V46OR+eBgDuv3xk3sLhk5dz/SIY9oRgIM0XGFICZ5T9qRa8dpIi8DnAHmNj
         cRdYLr+nXB5WOoR8sFnhZPwa7IRWsUHKcADzbvdqOE4MywjORn1irGWBupAbXoLPinKY
         z2Ia6b5l0eAZZkN7ju3tWEKlh68IwUmfY/PcpS3sAwxOEnx2/WTCDtX2yizyOq/Kwvy5
         QYVw==
X-Forwarded-Encrypted: i=1; AJvYcCU2ryaQstgBMAUfUq8VZeCj/dCjPNTfz0kKWJsdDSmH+/1cOzFjgmIDlGBb1g7M5WgLKLMUTupkcrT7lXcg@vger.kernel.org
X-Gm-Message-State: AOJu0YzxJg7DroTShAJ6xf0vVQDofWAjo08x6Ar0Xi/rN0Tr6HlUicSq
	j19NsP2j2HSkJkazWd0rgDoBNiP/GKFH2RzdmjNIdzqxpEdFw9TCx57isVEqYLaWFB+KGJaB+Y8
	PEAI336/BJHnKhvb9hQl3tq4BtlT3aNhUYwTM+xnN0E+LzlqZZpaoA1JNbZrGq5kghtKH
X-Gm-Gg: ASbGncv/rHioj58XaSRoBdJyeQ5KbK4n04RZXdwIPIZD/9VfMCGpXW1HjeLbqLIbyJv
	G45vaIaiNYhDXzTLF+D8tZmUZ0Qinp8PovByt3M6vxIYrXI7o69I7eq69tgWTAOuLBUH4JOiv6M
	ngOMqekTOfV8jj4GePNzBkSwWPbm9BCPq8jQ+OvcVKyDChHJ6UGPTdg7n+zc2Q7maOSZqdS5GaG
	S6/JFLVboeDRQs+1v2Qt15Hf/MzyKZXRH3/nvXmEb4p035nG8zMPl5Aye6WrS2HgLkaeSHqAiR+
	azmOU57LEEBXdkdq3zeIuFS0OplnCxAuJZwCZG9pA/U/EDU2DvBg7h1RnLSUTrWr2XjS0tdmxMn
	gGJMfjib1o9hY94Eoln0yCcNdOC/oD4cQ0oW3wDRuGACpVkhVS9jy
X-Received: by 2002:a05:622a:5e18:b0:4b7:8cf8:21a1 with SMTP id d75a77b69052e-4b78cf8257dmr88217081cf.82.1758020363405;
        Tue, 16 Sep 2025 03:59:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDj/hhJ5O4jQLZi/UnXUBCLpKD2mcKKa7z5f6/+2XEQQYMmtnF8am0LXMBESmcmRpgg7zgUA==
X-Received: by 2002:a05:622a:5e18:b0:4b7:8cf8:21a1 with SMTP id d75a77b69052e-4b78cf8257dmr88216741cf.82.1758020362518;
        Tue, 16 Sep 2025 03:59:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e663c5005sm4331812e87.149.2025.09.16.03.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:59:21 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:59:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-i2c@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: Re: [PATCH v5 02/10] arm64: dts: qcom: lemans-evk: Enable GPI DMA
 and QUPv3 controllers
Message-ID: <n4p4www37qz4hw75l6z2opeqks4g3u26brceyxi6golam7f5aw@raandspcihi6>
References: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
 <20250916-lemans-evk-bu-v5-2-53d7d206669d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-lemans-evk-bu-v5-2-53d7d206669d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOSBTYWx0ZWRfX3kr8/Rztx7GL
 cjSYJvacfs+v4W3cf2WqkvX6naw+gpRDMFJVDn7VeIFBgdk8WpF7rippqe/JcF0CWpYIa3QRaYE
 90oOqOFjW39LZHsGtuR/01m1J8wdOS+1BOmGJRwxmBR8GbINvVr4D2OK/ftihxstx9RJ05JEkQh
 DL6rt4FmcEcLIfPMx8FgD/V7LphBXFMznttjhEd6qDFzlx/QlpSDqn2n3RBvF1JwrmSJPqKeAWr
 cl7DOe3UkVJutiNf6TS0sYMCSfi2tK/DBeEFN+bBF/dqhAIM/ELOWTFSyKUb0WCAt8zBKWiBvAT
 9FTOPgMYK/sggJTOJ2ECfLDLQttHSI11cbYQcChA/la0NP4bhts62vn8IBK1QLYPG1Q8EOEW5r8
 NY/d64zj
X-Authority-Analysis: v=2.4 cv=cdTSrmDM c=1 sm=1 tr=0 ts=68c9430c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=E-8pkxSmLjkzrIbgvO0A:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: IOflvCMQS1XBIYgp39az5Q_F-_eTqyJu
X-Proofpoint-GUID: IOflvCMQS1XBIYgp39az5Q_F-_eTqyJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130019

On Tue, Sep 16, 2025 at 04:16:50PM +0530, Wasim Nazir wrote:
> From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> 
> Enable GPI DMA controllers (gpi_dma0, gpi_dma1, gpi_dma2) and QUPv3
> interfaces (qupv3_id_0, qupv3_id_2) in the device tree to support
> DMA and peripheral communication on the Lemans EVK platform.
> 
> qupv3_id_0 provides access to I2C/SPI/UART instances 0-5.

Nit: used for foo, bar, baz and slot ZYX.

> qupv3_id_2 provides access to I2C/SPI/UART instances 14-20.

Ditto

> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

-- 
With best wishes
Dmitry

