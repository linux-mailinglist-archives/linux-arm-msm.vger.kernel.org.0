Return-Path: <linux-arm-msm+bounces-59204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9895AC2140
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 12:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CDAD7AE0C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F070227E89;
	Fri, 23 May 2025 10:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HY+I5ncq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA92189919
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747996839; cv=none; b=nGeNcvccv+5CRF1A8iNCwT+nFLwVwpAj+Ov0fTfTKhbqgQROvmFh7lsNa9v+BTfdl5TPB4hO2bcJDwlJS0HxHzFoDMeZBZmFSbeD++tylUeBC8qlveweb9/v4BTJHGy/QMpOIbwiyu94girIpVWFuBAY8O1wc8L+W5nGLSiJRSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747996839; c=relaxed/simple;
	bh=eKIzRl8whYmJWRgMfRk9qQKPfGu9eKHJcVMsUR4mLj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5oGrkZi3Yc9oIhgi4pyhSwDAOOy4pL3ApXwEGMRl1BM7jv8bABxL1/7l631A9CCSpqt7OnQ7L3Q3Yutwypm+E72XS2h0IIqVi5kNMQ9HQB2J66g7VJ/SiUqC+t5JpxNNQJMsTtfOCtZkSXh0eZVPz9HJm+r66qaS32UzsHSCDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HY+I5ncq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N4gvVC020574
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0aghzPgQSrTSjyV0pCADhW62
	t6nUijabrAzu/vTK8Jo=; b=HY+I5ncqvifCWHefGImMTgEXCKpLjrdjN6Tqhhp/
	ZRuVeihl9y7GTPswJDChcclA8ZSfDMt73COkpgH7H5n8HMRARLpfyBjkeMK9N0iJ
	ijSdDU0W8bhD5M0kOL/S3bjaReK2MeLiWBSQURINerCrUcpn9wD7mo+7Ubp9WHH5
	2D5+Li+JjLyvvfDsNAx5vThtu5kI2gmPDltfhEkUWJSJ7KSB1ra6Nm0TuASgMwqH
	y/k4hosLmEMDwhZZIPj6tZQfcLn2GSe/uZeRuvwr2jBjyTlGBrra4x/BU+ZS1E1c
	m1xqoY3pkmfspe6PcAb2PlTtwcXrpkxLSQ8dYtGstyE42A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb82s6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:40:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8cc1c047dso92273496d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 03:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747996836; x=1748601636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aghzPgQSrTSjyV0pCADhW62t6nUijabrAzu/vTK8Jo=;
        b=wrLxCDexoKx8cF9VfcpDSJejoEjFAcj3qv4Ox9loTdqDqKVmNoaIOb0TsKN18WJgCN
         A7G24xY/vt1l1i+ifP7zGnSuCMyc1NytosTaQADV30VIiR0vhyy9nyLmqO/9ozeB2bYL
         /77l1+aV5ZKQvgHWcWHjpTxUgFxyBwXWKYJjTUT74ynggdk9tarzdfNFCqs7fpzGVTe8
         8I4r8oOAY0nvBx5+8ZGKNH0B4o9zyPqcXT5Re/Fask5RLvly0WFpvxLAjAmx3AVRz4hN
         MVNBJ87vMpPXddbcnwAKRS4RbdzaMfk7zEFzodn93bm5xpg+bCWENt23DK9QkGti1nqc
         7Nww==
X-Forwarded-Encrypted: i=1; AJvYcCUEIpw3gPBPMNEYPNMc28WCvR/tD6oZFS68OFIFO4KAn72Bz4DKx0VSzBfQgH4RGHQibhlOyawHWW6PlFlt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5ifFvEVqN3sew5Jt/Whp+MEC2teM9VbTEO6h2W/VZ0lwtqO+x
	4V5CxVrd86CtIj+Pkm9Yy0jQ0qJBsA7HFzTHwhK8QV+wCKA5IaPDItEWGldg5B7ImUZoccdxgAt
	qubWsi3MvzT63+czc0yvury8lCw7fxxk1gsFMsewz6DDm+jXWgGhdkd/4iClo+2eHfsNC
X-Gm-Gg: ASbGncs+ZZZMSFfOJR+bBYp5KCCe0+uKL9n4tuKzvjOo2VmbfYiXQYe3jLiploZqhzI
	T9HQbOnXTwBCgDmrjrJvZpcB43herkZLKGyYpt+dW/c+XAcx12eWthroRYbf3YU3H9LxCrJeO1E
	c49cFwSayqTV/UZ3mYK7fQb5Gn4vKx6kD71mz2TadbFfH5pyvcdh3c36mRbnG4nJeh8W20eRn5M
	RWxB7z8pfuKbfu6rNzI0Y9BVUEFYHs3A/eRYMZvDv2IYEXa+n1Gfz7nmvbDQxP2UxJ9h8k6JWZm
	R739X+rpx34o5P++o3ESN0LOZ89BKpjy+MOOv8IqbtRmFMlJn/NslV65+Jb4yeTL49k7cYzgVi8
	=
X-Received: by 2002:ad4:5742:0:b0:6f8:9b78:1bf6 with SMTP id 6a1803df08f44-6fa93a31ee7mr39675666d6.18.1747996835818;
        Fri, 23 May 2025 03:40:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHU9W4aT9C7+lHR3MtGWUbLc54LW2rcHq757afZeqo5dpPSrVYSZ/EIPiIYLTkFjN3sddIMoQ==
X-Received: by 2002:ad4:5742:0:b0:6f8:9b78:1bf6 with SMTP id 6a1803df08f44-6fa93a31ee7mr39675356d6.18.1747996835432;
        Fri, 23 May 2025 03:40:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7018349sm3792363e87.142.2025.05.23.03.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:40:34 -0700 (PDT)
Date: Fri, 23 May 2025 13:40:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 02/10] arm64: dts: qcom: sdm845: Expand IMEM region
Message-ID: <fjx7p2ab6c3qvwakrpj3zsjnhvjzwbfszvuwp6edf4rlehxdih@ucovc3r4fdfl>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-2-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-2-f7aa94fac1ab@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=683050a5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=PIzHpPEWZZtzk44p-YwA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: KjCBPErlMNuMRr_6uzZm6ywpNaq_0rqM
X-Proofpoint-GUID: KjCBPErlMNuMRr_6uzZm6ywpNaq_0rqM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA5NSBTYWx0ZWRfX9ehLoEI0UtYD
 T9Mapeqjxf8XAkxMT2K9Ut97eGqgDZhkJTtbEb7BU47tR2Rs5TGD2An8bQhE7W9+uEKBRzdqi/D
 ADszluQchnsU3W30orkLqbAN37HCwThUZLFbsylzoGbquRYhgygQAKF2Gdm3xVq2JM0NIppnDQr
 Qb+yEe4EV3yup4H8bGm9KZJwSTS80U1+jxbgrJNd6POcgyMQrAtJVw4rmYy4SIEu6DaswPOi9bv
 9EGGCEPA1UPWvhF0h6HHNnDCIJkdXdro/2+Mbsr/VZUXaRUoRpurr6x/Vovp4LB/rT+7empNKxz
 1wjj3AIu/tFCmhgSr+4qHIRE2KvpW5dtEpxas2C6aJJqeTEtTXiMJmIfG/m/SY/CIkA+YUh+dnQ
 DwWGHd0Oe6jRL3SJM4f6/sQgxcNeuYxkjdAk3jwm+sjOqnAv9QO0bqJeAV4sUcpqwXpBd31+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=575 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230095

On Fri, May 23, 2025 at 01:18:17AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> We need more than what is currently described, expand the region to its
> actual boundaries.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Fixes: 948f6161c6ab ("arm64: dts: qcom: sdm845: Add IMEM and PIL info region")

BTW, are you sure about the address? msm-4.9 agrees with the current
one.

> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 3bc8471c658bda987d6fcff3359d63b367148e89..6ee97cfecc705c317164fbba8df426f6be52e932 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -5081,18 +5081,18 @@ spmi_bus: spmi@c440000 {
>  			#interrupt-cells = <4>;
>  		};
>  
> -		sram@146bf000 {
> +		sram@14680000 {
>  			compatible = "qcom,sdm845-imem", "syscon", "simple-mfd";
> -			reg = <0 0x146bf000 0 0x1000>;
> +			reg = <0 0x14680000 0 0x40000>;
>  
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  
> -			ranges = <0 0 0x146bf000 0x1000>;
> +			ranges = <0 0 0x14680000 0x40000>;
>  
> -			pil-reloc@94c {
> +			pil-reloc@3f94c {
>  				compatible = "qcom,pil-reloc-info";
> -				reg = <0x94c 0xc8>;
> +				reg = <0x3f94c 0xc8>;
>  			};
>  		};
>  
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

