Return-Path: <linux-arm-msm+bounces-77008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DCCBD3025
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 14:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BE1F94ED26C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A187127144E;
	Mon, 13 Oct 2025 12:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Irwo3ki0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28082267714
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 12:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358962; cv=none; b=c/uwldpSWjjJMc2h4FTUben01VZsv99xyj3H9KAN8/SMyhQ40ZUkHZ1uc8alyeZzPeTM+UsGInGlycr/WAXzrjl9aIY2HED/GY6AQj76MwGooPeYBfXa8YMJdu0/ycYWMAZ3bI2a4/hx4iA0SFPtNZFy9BROumf1iWpQMIzDp54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358962; c=relaxed/simple;
	bh=E/YPQj9r4NZkVyM3wMp0upmXvE62DobvCrhkiCXXkJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7x1DvZr8oOjmHI2O+eRIhDDsHh/ObUXVUcYV11sS9sE9OjR1c7h4sup3ACQidJJB1vBgjAxPxBCLEKxVyzvpU9HgjLvj5Cfxz1lvEmOB4pHkXblnd3OO3bklK25onKJxi3L79QfkxjoSqN4NeMCfw+/XAUSM+hG/smFcmxiLqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Irwo3ki0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DATOaQ028596
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 12:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u8goP0px9a8ckKVRo5TU8/0r
	Gkad5U2lG1RKmUfiwgc=; b=Irwo3ki04+biq4RjeyRHjKxUmrs71JT5Nx4DUy+W
	7s6k94p4fH23o1Ua75eMkZ6so8DtxU5JYsso5BwqxPsVsZTasIPZ6fhJIDYeEWmg
	5q2qmvKgBp3+6pGwLSmGii43JqDalJxDZzt8H7GQ9XbXvOdT+QBsqT5yKxHPqkx1
	9e2VySl9KeHULiWcBfXiwxR4KwU+LnnmglW5c1r319HSfqiwN2spJxjNnim9lGNq
	QCRPrIg3piZ5KqsEtNwF9CcnI+yogY/5PTO1RrxUlcgNbmWCx5MfGp29KvJ/C44U
	rIdSB9y2NHkNhJqZ34hpRvSxCUhcZGVWSSg9msKGNwvgIA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0mgrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 12:36:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8635d475556so1091443485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 05:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760358959; x=1760963759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8goP0px9a8ckKVRo5TU8/0rGkad5U2lG1RKmUfiwgc=;
        b=PFRm3SxETRKsEr2sp6M+mHoXsb2l44EBnYpHM9idvgxO0Kzoq0IjFy4i5HDx6/jAKk
         EBUghOByrajeoj0J918BAwFucU2ghaVvLXXgYlUNbaL+ILQNCxCHbcHmzT2NSc5f9Bvn
         EFUqlZPOmq1tfQVPTbLi34F6Gj3JB8mYzrUq+QU+OxMre4oQper7f5bQ9ucW6HAeNGW7
         Vyn/XMgeY6kB3uCtAeHZiBa1l7b6ddljJZCCnnXUDZdmgd1imkFdpdQEIsKwf83Y4Kgu
         l9+KR6nc9AyWojr7uYrx2jBVk52zBM5jipzZhBa+EXmOslmSsMbtLQKrPRme87KKrT6q
         RIhA==
X-Forwarded-Encrypted: i=1; AJvYcCW89Eaput2m6sPKMKb/m5AG0MU9jG0XOp3VKwZaG/NoOCvd6oRcRHa9f8M/YdNqnt/mopetFS2Wv9OYhXYu@vger.kernel.org
X-Gm-Message-State: AOJu0YyqUF1AMoq5XI9bwB2VT2W6CftCL7mHSw6VANt5MUSEVkKzGzlB
	jOxSZyuNIEwTAl+BwroIDZydqdW2usNPi6HsWKnLnuc9hbnRzrf54+tQcjKxXC2CNJcVrgjviS9
	rkFXdbkUy891PsaQ6XDXUMMdyzcszubJ82wuNA+3I1oVv+s+21TdFiBNisXoqvPNYaQvM
X-Gm-Gg: ASbGncvcYD4RaBS+Pz72F8jMnYmwVu71UpWEschr0zOHz+J4QkeRJQe6YEgLzR5Mv5x
	aS+6A7rU1K3bIW7ey9zzxmJiGVXBRWy6/galO5yCk+PMvf2//BVV32pemnS96e5apEUrXI2iKkR
	JFrlOu20HwZBSpKPQ5GVb1W3q79qKqZqsYTdqyGtJ17fy0uUya7qC4kZNnl9b3TTWee2SpyqFPv
	GidcZFJ6zef3F35JYtUO4FyI1wuApxRQoBp1RC2OQdlXwJfMzjBpm0te12cWhEInWGpJ+HychLn
	Pyiv1GkpbJATAQfQK9pzIujPmhnu9vTOa2FfG2rxTsFTHR4EWz5B+DFCZHBES0je02UC09WKcM6
	xWF2+W4fEWbDq05R5K+uWTajaHuzzSikCFYEqewIjbtKdIuqD62ef
X-Received: by 2002:a05:620a:2983:b0:864:1d18:497e with SMTP id af79cd13be357-88354ac39cbmr3044048785a.23.1760358959082;
        Mon, 13 Oct 2025 05:35:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwoj4faJclOVnlrUN8P7wIZhl4D7mky2VyxsU8g1O5JnX3k9H6mJ7qsn8Lah7rEGjXaxUOBg==
X-Received: by 2002:a05:620a:2983:b0:864:1d18:497e with SMTP id af79cd13be357-88354ac39cbmr3044042185a.23.1760358958586;
        Mon, 13 Oct 2025 05:35:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e4dsm4084850e87.22.2025.10.13.05.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 05:35:57 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:35:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, mani@kernel.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        vkoul@kernel.org, kishon@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: lemans: Add edp reference clock
 for edp phy
Message-ID: <c4bhkhw6xlaqlwhbataveafav6jcsrgnazk72lkgtj3fygwqjc@4bp5w4q5sygh>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
 <20251013104806.6599-4-quic_riteshk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013104806.6599-4-quic_riteshk@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX9sE9ItTrTlMY
 1cEjJ1hI1ap6jt5P8ZU8BWWIJGnA/wEP49lQfenaiCvxAma05tDWsu9+ucKzkw/WHH0ThvdEOta
 vZapmTeZS8yBcOtKiIntfWh7OMNaAAyqKsIPQsGxl2RNKwsF7yEgOLHqLtATB4bsrHcWAVzzWLm
 sHe2FrhldGeq+3mGAUWkX7RUxyu12thexeBPoTKOzXH3GhoaK+UInU8r4aB2rJ7kFtVjLtGrMGV
 jMpzNqzykt3t52qJxKUYElDIk8rwWG3cOyM13zLq25CC9AtecmUI/hIjZiM4bj83r2huhbqOKp/
 1ZB4sDZCH57NA9MNKaUKkt8sKegi8hdNZkmXyMQ4r5C6L9fL9hLtGcic1Z43LIxl2nFZcC6KYjC
 jHvLgs0GUM6gPfe+BZN4aAs9UnGSJg==
X-Proofpoint-GUID: _6fS5wt0GkhiT7Gr4cdIi5-0deM8NJ1F
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ecf230 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=xNGN3EASD54c2UHPMiwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _6fS5wt0GkhiT7Gr4cdIi5-0deM8NJ1F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Mon, Oct 13, 2025 at 04:18:06PM +0530, Ritesh Kumar wrote:
> Add edp reference clock for edp phy on lemans chipset.

eDP, PHY, Fixes:foo bar baz

> 
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index cf685cb186ed..1bcf1edd9382 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -5034,9 +5034,11 @@
>  				      <0x0 0x0aec2000 0x0 0x1c8>;
>  
>  				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> -					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_EDP_REF_CLKREF_EN>;
>  				clock-names = "aux",
> -					      "cfg_ahb";
> +					      "cfg_ahb",
> +					      "ref";
>  
>  				#clock-cells = <1>;
>  				#phy-cells = <0>;
> @@ -5053,9 +5055,11 @@
>  				      <0x0 0x0aec5000 0x0 0x1c8>;
>  
>  				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
> -					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_EDP_REF_CLKREF_EN>;
>  				clock-names = "aux",
> -					      "cfg_ahb";
> +					      "cfg_ahb",
> +					      "ref";
>  
>  				#clock-cells = <1>;
>  				#phy-cells = <0>;
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

