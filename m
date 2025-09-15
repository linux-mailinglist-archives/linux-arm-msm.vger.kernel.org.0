Return-Path: <linux-arm-msm+bounces-73468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0902BB56D77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 02:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B31713A45BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 00:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45F41C4609;
	Mon, 15 Sep 2025 00:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQ6UhnJi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F32917A303
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757896712; cv=none; b=JOumOTj1VIraGcXUfWMBJJmhr5qSS0km0Mv3YCxGKRdW6KOfnAB7mClCXmvWkLuuhG72L75xOqkSv4E1Zy7fGEIBCGRuqM5HpjF9YDWp9bKE942Gbyiyu5WEzY+uxRnHEi6Rn3trxUonFhY2fyIqpmJcrww2opk+PJjQnV9BOHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757896712; c=relaxed/simple;
	bh=U/cNiTmHlLaMm2KtjrkNqdxZrSZOaMAPP2sa3K/q9DM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdD2JhxPmLeX7/URsmfL+6rthcTqe+AgNvDct229qJSXaLhWPT9mE0V6tNHfxsW0Ktr4gdTW/wT3iu9EGPt4ghr+3of+H6EQ77ZRinagHazS+ny0pKQ0yfno4CrTSdA6yYi2Vr9/8Dpu/GZkoh9m6ZpViC45qQMkJndkgL1LggE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQ6UhnJi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EKZlxw031237
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k4LfGJHir9f3W96IA90YnXWX
	+lavGprpupIft02ZL/4=; b=PQ6UhnJiSzt0sh+EeJrrvlfFKq5yC2d2mV25lWCJ
	fp8QY3Gl9PUjY58ZkyY2m4CStAzz1KurOtmoHKkxM7LZ6Egq3xvnGWf/RPpgoA/p
	PEQfZRrqFrlTnVvrbt5OJ0YPZ+RA0wS0REOh/1CWUArmza6G93x8nSMIbDWPl2zI
	yGCVlHLemZ/ixmlU6DLnGU7FlR4uBCaATORCq88BUOa/KO5BA/NGxhsajx93K6/L
	hY+FntVvvd1hLSLyF67LwPUzv/X6d9flP/jTqcHCzLax8OqXYlO3PwFKTN0ZmP19
	nCeX5fGxB4IpyxebwoW+k/U58kmpQSK8OiZLGjVLNZx3fg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yjv3318-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:38:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5d5cc0f25so76309051cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 17:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757896709; x=1758501509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4LfGJHir9f3W96IA90YnXWX+lavGprpupIft02ZL/4=;
        b=bNDASZSThI9lhvcGxwTwfC6OIuA93V9VQ2srixFnG9qIFVf3EfCuteMoPjfb2sG+kB
         8B5qXCxCepz+Hd6cEW6HgvzBScancxfQAPLHRjv9Wh/LwoHfQ/0ZNIJ3IHSBN/kOmLot
         V7YrvlzbGl9NN8hGHBvVoKjcScbQf8TY1V5fj4iB+FUaHgiqIsP+4CYbJ0W2vEiC+jpD
         eiLQni1QmItdHwi7x6+ISU3ClZZmOiSiyDzhAuY2MUkq4izXwHmHKu2rBpe5s0DQn32e
         AFGIZmpjwDuZmHalHMXbKkwAS3itSmsIptzMPuQL1FDLg5f2ra9ZPHjLt1Sbl6uNwIDT
         EqPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnrUEsjMII94tK/ykxqquiXUpIHR1puqCaGemq21yhhX10xaKyXvvtCNoM9qX5D604rCUJpgj+YsXyxoxC@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ8WJv81qYC/DLPfJkl77ul/ljA3u+Syfo8n0zr/9pwFDPFugK
	iCMTUKq6CGezirlPlZkGm1znTIqoW6oVKiVjPKe6ENtIzizXDbfQbC+GBQyiSdVS5p1s5OtyEK1
	0Nybh/DcCWI5eHk3pmGzifNlPKytBfwYMl8c+j5amafWACekoshlzRwGvarMGNtlRqSqW
X-Gm-Gg: ASbGnctBsq3Ent3b7zDB1R5tbJYPOcZPVwscsukYSkxZNsgOzsMZsOZKG2pQMNdjtvb
	+MMGOLz1JVv9r0Ru5deu1m24h9u1VMx274Rb9caq49hL7HzHwnYJ690jJHem0TPkZbG4GOfIhX+
	smmL+9ip/+3FdzHYnf/9p+RP8dW+fdeFz/uQaL0iLMtd30yGQeeQP0PvVqKPQ6zNuYUkQsgos2s
	uaD4tuIghsaL9FJ7E0WasPCwsuEY33iWnd1E1yQp+qHpzjxe8szPGIXvIWOyl4YkkSTWussSIZN
	Rn49lwA+1jiw2VDhGzMmkHcMLY0M8LzWRTgD9NVdaypsF4DaqvU2lPL/eUD59bJBv87g6RKZ0e1
	XnWDc6E/L90uG28RCWZ/VgnCUWJqD2X+xkweOGYDCVhxY34T1N6yf
X-Received: by 2002:a05:622a:1144:b0:4b5:e7d0:20e5 with SMTP id d75a77b69052e-4b77d17c2a7mr127043691cf.68.1757896709205;
        Sun, 14 Sep 2025 17:38:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdxBNz8ovRDoUDh3xlmrvLahFhSQC/BvdkuDLmxuIZWfTBrbIIzOdc39JrTCYrmSYib3fXqA==
X-Received: by 2002:a05:622a:1144:b0:4b5:e7d0:20e5 with SMTP id d75a77b69052e-4b77d17c2a7mr127043491cf.68.1757896708708;
        Sun, 14 Sep 2025 17:38:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b6188sm3270014e87.3.2025.09.14.17.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 17:38:26 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:38:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: konrad.dybcio@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: Fix frame@17c27000 unit address
Message-ID: <wrv2uy5pcgaprpiiiblrlthe3hliin44pew36cnrdzqgxwfv42@avg7aall2bpi>
References: <20250913183018.4017208-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250913183018.4017208-1-alok.a.tiwari@oracle.com>
X-Authority-Analysis: v=2.4 cv=HcoUTjE8 c=1 sm=1 tr=0 ts=68c76006 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=yPCof4ZbAAAA:8 a=ItF4YrUkoz0luqwIuT8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: WGUBV3I7c6EXrNtVXbq1_FfJZkB_T0aE
X-Proofpoint-GUID: WGUBV3I7c6EXrNtVXbq1_FfJZkB_T0aE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxNyBTYWx0ZWRfXwAB0AKar+iw0
 cR1N+t7ueH6fqy5Jr/JB2KpTNGp5T7okZ4nyZg9iazsUb0JvtG9s9eJ6b0FiuNBRJyWi211beJz
 PuKca0iJ+76ravfKr9TQbVfN+kHnFhXe4bNRQ9sILXXtTKIgFr77hl55e+joXfCeBsFZVMmAJe4
 k9HPRveEJignomWOBH0OHPSsuO3yM46xsrJKPWERhwCGrbtVII2u5Rtgd6dfSyLw9XaTbK+KwCb
 bM9A6R+5ZKSEqmOep5Qn66DKF0vmoS65MsAfYndTybigP7z9Y624AwjX1X3imdw18VDntEWply2
 HlwZyqj+jNsPlYe2LmGwfa7l3zyOybB3zDYg97vTsb3VE/aD1j13pGxQGCx6m1zaVtcBwH+Cd1+
 5H0vTnp/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130017

On Sat, Sep 13, 2025 at 11:30:11AM -0700, Alok Tiwari wrote:
> The frame@17c27000 node has a reg property of <0x17c26000 0x1000>.
> According to Devicetree binding rules, the unit address in the node
> name must match the base address in reg property.
> 
> Update the node name to frame@17c26000 to match the reg property and
> align with other frame nodes.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index abf12e10d33f..166326830cdb 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -4416,7 +4416,7 @@ frame@17c25000 {
>  				status = "disabled";
>  			};
>  
> -			frame@17c27000 {
> +			frame@17c26000 {
>  				frame-number = <3>;
>  				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0x17c26000 0x1000>;

Thanks. However in this case the unit address looks correct, please fix
reg property instead.

> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

