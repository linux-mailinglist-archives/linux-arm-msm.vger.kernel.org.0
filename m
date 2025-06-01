Return-Path: <linux-arm-msm+bounces-59966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBE0AC9E01
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jun 2025 09:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAC213B3336
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jun 2025 07:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D24A7260A;
	Sun,  1 Jun 2025 07:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JmKgqgix"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BB62DCBF4
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Jun 2025 07:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748763522; cv=none; b=DY5GLhdD0dF87fRFxal8WIfbO0kF/AeL1AX7uMnWeeokPAlfxw2mXsmQ5hNeBlk671faeD3i/OUGUW93U+oKzWFhUlLJjSNUlMqsU/o8yu60ynBfobPDgS1qGJXd1+iRmvkUNiFjriCN2fAndaTtKsS2+31Sbvg9KxSbH6ZMIrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748763522; c=relaxed/simple;
	bh=32O4/0F+zhtDfGoBLdogCW2cDiXYfp7xwglVUlmWo2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=It/cVj+PqDOhHozixf5kBKRD6SRqetTp/f53252I5lmOlae5qeT00ukNV2F0NsJ0pIpEdlSRN2m48qM2VkVXLybPbFSHCz6f0GGnACi0wVh3MM3WU+Y50Y0JGRI2mgkK0viOX3PdOf/tEmPK5m1TWVO3yW43+CALrDthLKfyYv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JmKgqgix; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5515rQjk006267
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Jun 2025 07:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=37SzpObJv2BUN0EHNjcl8wWG
	ZlSzPm0ZSKZ16R5wQ0c=; b=JmKgqgix9ewyUwVVBew7jkodY25b7kHj2CGoMLsz
	xzlh54lA5wM1Lgt9PRQPcwwz6Vzk7aOz5tIJEACrdxFuG9Ap3d10kBd0IzdTk3S+
	XfTeFyKBF/AHm2VjjXVf0XJDiYhCJNDM3F12Wz6Q7V/XHMAWq6lmExSnIAWzJ5rh
	hcUFfL48W1/ivPrnPb1TM6vBSjGNwMzySe0DMyRMvUUdX+3qq1G4Sofla1RaIMD3
	+JVB3bYh/NHe9lEbHTKHO0vrapKLc8mNbCoyt7UqMDt0fWZRekOTJxPdtWtNwwYE
	rLYYnexQzj8ptopx6ohDlC1yqtK7S6++5148t9dSDAbqkA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkw21af-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jun 2025 07:38:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c95e424b62so694093585a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jun 2025 00:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748763517; x=1749368317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37SzpObJv2BUN0EHNjcl8wWGZlSzPm0ZSKZ16R5wQ0c=;
        b=MFBQ8Pyx0rESoWHW0bSW9CkWmssX2sI5FtQ3s9pAwzmYMet8mmnYfHFacLoBk6vBD2
         WSURBStgRT65h/l5KPEUW/nK3T946k/gOPj1CNZx2PcN3kz6BEVJ5M76yk6taFXLkrNM
         z9AGJwFcvF2WeqXO/Pj8AC/g5YfA7V0PDR5jtIDMOQA0QPKxSNwIilMdqDOzu27tYpTh
         O7pA4k31H7pQA3kGImL8a+2wlmhTtu6mQeh1LSrHPkr+XcQLJDWUZv93pIvMOCB4+QUC
         zkxb5aMcDNOjBtXhU0OSLHCQsUOVBGHEHfGBebZ1JKfVs3qWgyqq7CXG+QEiu3Ikp+bM
         Ehog==
X-Forwarded-Encrypted: i=1; AJvYcCXo05CTuWP9Gr/ZS7HgtXiYZM4URpmJglk4Q49dRTGk9Rv8BPCVLA8rHQSXRDH7453RCcBYiRMmAxIqeKhD@vger.kernel.org
X-Gm-Message-State: AOJu0YxpjynAgy5EvKyEXZULJ36Xau//luveAoo7mbsHde0tRTGd5VXQ
	LehgcnUrp+188tbMJWwb3y2xKTkxNhcyCJ/nEwyD5kOI13CVRkZuySvcaMdoJeMQ+xWZ8v1ec5p
	4SaEDvOARsgZv5sXcjJ43fJb5mfkwcJGDP9BnwRdOSOBF/P8cKH0c7gOMVR76AtVg5Ipf
X-Gm-Gg: ASbGncuDwjSl0SLFO0el501XHS66RbrEGGcWO8UAjZkEVgas868qMffEQMSCRWjY4XM
	Uq74vhVIa5FKIG/b65sXBUnsZ77METoY0kheScPrmVDt9gqRyxS2hKuW1VwL32NF8VVdoWy/KjV
	F0FGVO0yoOhp/lmv7nv7IAlsrw0oYkqFI9/+hb3kLqrCzU00+LLwpE1s9kxDu03dQKBSCNH+Kkx
	X+G4sSbtj0iKX5cmcjUqrDXKVgFy8ZajUsk6c1GgKgeGzFew/dooXjqcABycbNurgohJfuRX/l1
	hy2q/T3SS5rq/dgev+b6MBRKBstGCjoLq39H3hdyEtuXqV1OkIbAhWrM+pklQvE6h2TN43FryLc
	=
X-Received: by 2002:a05:620a:2905:b0:7ce:fc0b:d39d with SMTP id af79cd13be357-7d098762644mr2116927585a.6.1748763517374;
        Sun, 01 Jun 2025 00:38:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkEw9tJvV3e2JkfLgTHh/B0SigBZSQ3+0EwCWmfBTY+NmPYsvevOwA+4J9ZxZSpp9/KrAkSw==
X-Received: by 2002:a05:620a:2905:b0:7ce:fc0b:d39d with SMTP id af79cd13be357-7d098762644mr2116925985a.6.1748763517034;
        Sun, 01 Jun 2025 00:38:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337910f44sm1214247e87.115.2025.06.01.00.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 00:38:35 -0700 (PDT)
Date: Sun, 1 Jun 2025 10:38:34 +0300
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
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sdm845: Fix Venus OPP entries
Message-ID: <3xoxpgysxhy7coubc74vgdfyi36o22eaofw76ta7o5v5gmp4e4@3agijh2wapbr>
References: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
 <20250531-topic-venus_opp_arm64-v1-5-54c6c417839f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531-topic-venus_opp_arm64-v1-5-54c6c417839f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lrzodMwrpJY2qZRmh8AIiOApxEvHm8It
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAxMDA2MSBTYWx0ZWRfX1Rrri1PWpsjB
 j2vD/TXmFvEIbOdr7FayTE2hCECKz9zVzz+PVVRXUPC7S4jmlbjGkowBiWKfka5zLXGsLBEZGvD
 MNF4MIMGwu1fSeA2t1xY0xc2Do91gmHstVDlqfX+vQVXmG226rr9j8WGGxT1hFV4AyN4YtJ+uvo
 iRlZQThGO5TxKnYjIg/wSAEAYXb/YqsWEmRs/tLit6r47PdoDwHO1dl/br2yoAcHK4End+ctIiK
 UYTFEC7fRg040/uvOLON4rK5asNzIAJpUH+U+0uNy/lL8ljMS6EWskG18hQgDFHtVladVxHx726
 5FMlO89pPCYdHvJUryu2IWI2svThKZjelmIUsvPknb79++CCrfrfaxF1Q66gFnd5QmBW4E8fNQr
 gEghTj7pGUJV/p6iOT8v0/0CtBRmeDm0WHhpVAJAaXLV+3xcur7JkBKuZijV2rxIxGQUPhKW
X-Authority-Analysis: v=2.4 cv=WI1/XmsR c=1 sm=1 tr=0 ts=683c037e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=SHPHT8z8tTG74PR_iSkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: lrzodMwrpJY2qZRmh8AIiOApxEvHm8It
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-01_03,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 mlxlogscore=891 bulkscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506010061

On Sat, May 31, 2025 at 02:27:23PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Make them aligned with both the Venus and clock drivers. The existing
> ones seem to have been based on data for the non-final SKU.
> 
> Take the liberty to move the opp table subnode to retain alphabetical
> order while at it.
> 
> Fixes: 137154871cf4 ("arm64: dts: qcom: sdm845: Add OPP tables and power-domains for venus")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 3bc8471c658bda987d6fcff3359d63b367148e89..7d22ecb908cd4dd792a36beaee0ede061c5abd0f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -4254,14 +4254,6 @@ venus: video-codec@aa00000 {
>  
>  			status = "disabled";
>  
> -			video-core0 {
> -				compatible = "venus-decoder";
> -			};
> -
> -			video-core1 {
> -				compatible = "venus-encoder";
> -			};
> -
>  			venus_opp_table: opp-table {
>  				compatible = "operating-points-v2";
>  
> @@ -4275,13 +4267,13 @@ opp-200000000 {
>  					required-opps = <&rpmhpd_opp_low_svs>;
>  				};
>  
> -				opp-320000000 {
> -					opp-hz = /bits/ 64 <320000000>;
> +				opp-330000000 {
> +					opp-hz = /bits/ 64 <330000000>;
>  					required-opps = <&rpmhpd_opp_svs>;
>  				};
>  
> -				opp-380000000 {
> -					opp-hz = /bits/ 64 <380000000>;
> +				opp-404000000 {
> +					opp-hz = /bits/ 64 <404000000>;
>  					required-opps = <&rpmhpd_opp_svs_l1>;
>  				};
>  
> @@ -4295,6 +4287,14 @@ opp-533000097 {
>  					required-opps = <&rpmhpd_opp_turbo>;
>  				};
>  			};
> +
> +			video-core0 {
> +				compatible = "venus-decoder";
> +			};
> +
> +			video-core1 {
> +				compatible = "venus-encoder";
> +			};

We don't need these nodes anymore. Please split into two patches: one
fixing the OPP table and another one, removing subnodes.

>  		};
>  
>  		videocc: clock-controller@ab00000 {
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

