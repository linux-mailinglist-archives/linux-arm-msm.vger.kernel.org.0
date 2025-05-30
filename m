Return-Path: <linux-arm-msm+bounces-59931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A69F1AC9696
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 22:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 541294A0572
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 20:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A21E279333;
	Fri, 30 May 2025 20:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bQmNwwLL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F692CCC0
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 20:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748637113; cv=none; b=aZBHMN4dR9PS93URDtS0H/p+1semQ28X5y3ejkqz2G7j1adorhfPInQlJ7PPSu/4rxo0yMPXoVeNvp5sY1hHZNvbdIxliJI1wr6kPC2gXE0L3i8bVGlPp77G0DkJezEALfPYDP9cBRNc+VRmxHFeRKwNk50DEjwH3VHOcx96ZXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748637113; c=relaxed/simple;
	bh=f1fdEMjT+pjjXh4re0AY7O/7xvlUQpzkFh1aeaLDwYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehbHSAZ7i+0TSj0IUa5XwEexWPJ3p9wksaCdRdx7MJJ+1AINzkj+DmhB6YchTNmclF6q/+YzhTboXN7KZWlXGakjJTvTdHHcQTIwMSpHJAb0Gp1cnEcB6LZ6Z29p7PHBrliVxLCVkhJdex0NQT+VeLiUDvn3pMkFOB+pFVbKXCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bQmNwwLL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UJTwUO008028
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 20:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M1p3EQmdtNCgV/iVOld1te3d
	tjXwAqfiklGbl9y+1ps=; b=bQmNwwLLYaTObDfHdgUdzsXfsZAhy0bclYSEKKgj
	wrbjsT1QZug6ViDpeBq4p/aHnoUdNXFiGnWG9Fk7qCu0/CEVh7TrzUN4T4xuNsUU
	NvAQXQ7V2iE57i/UyLYtjMPc2nYy5qAJf3AZqulPC0E8NmpckefI34IaA/Vqz/ai
	aOTkmE34JEJVCtN6ljdQ8ax8MFc71RspCVnAYCdeSS6WbEXtfnsKVUiNxKuF5uiT
	t3X3404gq4UUk6mPQApw8qE/jFnyrINzfnQ83m1pUi9pzGPSDvcqH66aLi8+lYp0
	VOLtXbCMdbei+q1hja/XVB7wnE6YwizLPHXx6FwwS85BHg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992vkmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 20:31:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09f7052bcso289791185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 13:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748637109; x=1749241909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1p3EQmdtNCgV/iVOld1te3dtjXwAqfiklGbl9y+1ps=;
        b=CPHCHIRCBZt6W9VHr/2IzMFNWtkGun/25X1Z/5BzR9+BJ+aDQ3EXFL8HiRxaru6t2L
         07yFdHW+7CFtDPb0wr9Ipp7tPXa/Z2rZrPM4Af0410h231yxbk4U1kOGdffD3ejAubpJ
         w0JWoxltB08P81yharfLy0ZJv96a+A9Vyc4Su3Lq1KIUuf54IqdGpfLWHc/eDAOx89ne
         7Y6mT1SfjTltCcgjJzAgke9vIXkG8miKZdIREvgXqA8a8Vk4D5idIdM3KJOXMTGNqVIZ
         Jua9Nm1BCyLxraovz9ZCUF5DOV9ArnZb6NalpiQPpfPNimR9MOG1G4WLlMAO5tkaboUB
         F0iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBncT6BHY6iwCkJptdX8ymYeJL0F4pfXSawAiA+qnvxe4g00FLkKZl5Lroq61x1VljHInZ+h2AfCRdBGgN@vger.kernel.org
X-Gm-Message-State: AOJu0YzAvw88uaqwvznBdMX5oSLhsgUgHyi/oEcKhJ76thMMim0OkoTC
	1He+lu/sw4U8rRILaPknmAtKWDq3/fgLcqKbwpqSM3+QyqIZ85ykvuTUu/G0rwROzEVQl3hGb6H
	GJl1HCk0MA1j9K6ZEgywrfqQlvPYOs0exnQIlpIYALXz7B5f6GeenPMy336atreFnwUGb
X-Gm-Gg: ASbGncupfh5OUC/tpFSlYLmZ7hkwuvYZWr2y53wYsUNrmx7F2T5st01+zr46wx0siQc
	SxI+jx6MrPlUvNhyKT0KVKwQ1aCkbE5zY5f60tDWOyGtJLFnwbsBshHmchp3eswmFCwMiEkNhut
	pjQ9PeXa52FyPgRyrNl6Me2VHHjCJlzweWQUj5d94rfkEal/2+R9l66Vi+t8d3nrkwAdAWQCo2E
	cZU7v4aw9Fg9uVekRTAjqnXAq3TqwQws1mjfFyzWM0Hjw7FKB0LfHCtNDSnRgc/ppRpNa5U2+ld
	HtCMgyulJjriHmRHBcphAPNwMSIaiJlWIXPvvQTppw1962QSDbhXHVD50vqZm0DGF6pXGiu/tAs
	=
X-Received: by 2002:a05:620a:2496:b0:7ca:ef12:966d with SMTP id af79cd13be357-7d0a2044852mr807322385a.56.1748637109535;
        Fri, 30 May 2025 13:31:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5gxu0bW4BBklACGl0xDtBjzkJyvR+Rkmz3xZNctayUpx8OSvdPIjzBiRcKt4/SIxwXscdrg==
X-Received: by 2002:a05:620a:2496:b0:7ca:ef12:966d with SMTP id af79cd13be357-7d0a2044852mr807317685a.56.1748637109125;
        Fri, 30 May 2025 13:31:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b56359sm7062961fa.52.2025.05.30.13.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 13:31:48 -0700 (PDT)
Date: Fri, 30 May 2025 23:31:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v8 3/3] arm64: dts: qcom: qcs615-ride: enable venus node
 to initialize video codec
Message-ID: <qeuxv2mpnnsieygdwvsb63k4n53tnc6yekiv2wels4jjwwpxf3@wutnfkefi7yj>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <20250530-add-venus-for-qcs615-v8-3-c0092ac616d0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-add-venus-for-qcs615-v8-3-c0092ac616d0@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE4MyBTYWx0ZWRfXzmm4eRpueuSH
 4IBvXjOmEt0uiEA9sty0th+nwH0zYo4ssTqFf8l1doWghA2v+jMLHeM3iHIqvAU0hhQN0OtALrz
 AqfnEhJs3+YaQaPwqgeFUnFqkz0OfKs9gCjxSaIRIObhUhg3Jp9Z314nD96aZIHRrHjWH0PsA7L
 GImDfCWv4RsLS08g3kLJSCEb2SGtG7icgRi6Gkcp8SFjTMadzMiJ/O+ma0fgxoqNXSVIf7FMcVc
 068T5yFKiqM0u0K78GaEv3AXa45Nfvy4BfDnt/GwP67EdBAEGDlHVfTLdlzqsv0o/YC6KBe03hq
 539hWgbVZWOB+3u2sqIIs7hgOb37PZuXfFBUH3UvmmRgIy3/dJ1w7duUxQlZ0oM4mECibYn8fXx
 yshPCWdBrPrDsHT+WPuzGFa/CjDJA7XIDjmWNLZ/QomXgBaKMw3YAtq5hUuuLgT33ycleb0f
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=683a15b6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=QX4gbG5DAAAA:8 a=COk6AnOGAAAA:8 a=8HjAm6W-cWlp_Wl9Tc8A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: SqgQm9Q9PA0N4ufkwUtRXzvzVDixbKlL
X-Proofpoint-ORIG-GUID: SqgQm9Q9PA0N4ufkwUtRXzvzVDixbKlL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300183

On Fri, May 30, 2025 at 09:32:15AM +0530, Renjiang Han wrote:
> Enable the venus node to allow the video codec to start working properly
> by setting its status to "okay".
> 
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index 2b5aa3c66867676bda59ff82b902b6e4974126f8..0686f5c10bdaf7ba3f522e16acd2107d25742dd9 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -338,6 +338,10 @@ &ufs_mem_phy {
>  	status = "okay";
>  };
>  
> +&venus {
> +	status = "okay";

Does QCS615 work with existing qcom/venus-5.4/venus.mbn or does it need
another VPU firmware?

> +};
> +
>  &watchdog {
>  	clocks = <&sleep_clk>;
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

