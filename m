Return-Path: <linux-arm-msm+bounces-51837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4886DA67EBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 22:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F73F170402
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 21:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E951D1C6FF4;
	Tue, 18 Mar 2025 21:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UaHFsxvm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694BD17A311
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742333606; cv=none; b=LuCHp5Z9j8beSehDTTbZhKi7tL+hZlmjiEXK4Mqn8ypEYohUAs3NolaJHlEMEV91HljdSxhpurPZEEQgugtyWam04jX4hfHPCKjWswDuzxlIAMYidGXqXVfQUgQnviifbYBIMMXjOWqZK3zjw2iB+sQRFHhrHanwwdCscvaaZVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742333606; c=relaxed/simple;
	bh=vOR3/JIk50CJzaeJL4hwEOyiKqMHqzylkUtWfbZ1yyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKoa6LvDnMBxUEBBC9QF7xKMH/SGL5OdK2CXuGW6ljIiEQB1F7ikWEB+/I/BpkRXHZt5JlACG9txuf7wocNlS4dZemtTFOxziXxnPPlLk1k61IJlz35mxCglLqQn1/JSaVHrMiMr3bW0bYkuH+YcVo0MOR0CTL7KvmmATpGJ6j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UaHFsxvm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IHCoql004678
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MmJSW/umKeswEWSeKZBVRJB1
	BIIFkK8mH0qIUqVs1/A=; b=UaHFsxvmPL/PHpkRSn8ti9khjMAfZf2awEx1M2KF
	ZorQrUsEw306tzWWdCQmLPRiGpYUr8p2FqCJwwknVY8Pjb/abbb4F1bhAh5TKhb8
	g2kKcJrgMtI39U+FRq6zpaYjaavLITmnaUsO62wMcBCbU9wlsnfQhCD38TljmP4G
	MPcT8w/J1ENi5Fqxzx3dKFGlmBEnWpWkWB10B5GsrBQWOOLY2yzQ67Ch+O+0unlH
	i0PbaNzveZ7Gzb2TVnO9krCjiZjalTgYTZ5JqAtjxZoCdUASSVRx34vEC0f6XOw1
	p6Im95+3U8rgW/wcMA8vohY1IH7P9hwsUkY/2bArqlpgvg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fd1dgjhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:33:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8feffbe08so163081816d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 14:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742333603; x=1742938403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmJSW/umKeswEWSeKZBVRJB1BIIFkK8mH0qIUqVs1/A=;
        b=LTidWK1b9bYfPelAXK3++TDl/jLBfj4IkDMO4Aqq1V1YY/r5ZkMZXKOqRn+ZHZ2gB2
         mVRhaYUycftA19HeeqNcRnL9mafyTxre90v1dp+aXyD5hLmXYXsss6mY4I63JcRaKVEL
         DTEgzrDO/89/NBMfaFm6uUgnsX2YZoACG/B6sqdmK/rW6be/R7hdBb4XDzj8NMOJoFyw
         0L2q8/TPR++lwPwRaCaDMXNBCWNe86yo/JX4lHBYtIRq4g54ItlLdTkf/k2gP9R+S+WH
         YI1p97aoaaByimbZSzUdD3b3Z5ycskV3kXk4+C2qWz/Eqe8R4qR2fnNTjNAtUX4vTk15
         1x3g==
X-Forwarded-Encrypted: i=1; AJvYcCXk/VqEl3UcFdUw/H+ttkDiTRhv9XWJkmTmZp0krGQK/tY46VZXtMY7mi1dvvCyOWcOGTxGJ9qf9z2RHdEo@vger.kernel.org
X-Gm-Message-State: AOJu0YxDPIfAJAMnYIlmGAugEJBbg5rCYSOPSGKiBBu3r564BPB6ToqH
	C7tAcseqodJHykrbIH87oUSGRMEDGiJzrc0RIifx4ltKJbXYUIRexX7XDy1DPUqCSbPOGR9Gy2O
	8jG98ejIxRMempcUy38/73uYkX1/mcxYDilm2oeOehPjHbk/gH6UFF+JIxBCN7mu2
X-Gm-Gg: ASbGnct/wCn9X3WBCxdGFbcWx7OYp899KDVJ9eSKVnBH0APEHGGCnqITEr2pCY2eGFO
	JijMr6h+ijGh87TbOKCdHl3G/Az1k02WfowGaYBooPYJpe5Cw8a6vYBluEeGpqa3+evkSowKrd3
	IA1hhbbX2vskIJDpLWTRK6/tEtBiCfM6pX8MR7qK5s7UTg7koTl3yRH2FqE1orJTZRZzYzeT31S
	rauR3cZZjqna5cFAOD9GLRC1mlYUPFP7C2T5NXomEBbUxPGrqbrGtkDWRxvRDt68HUPk3EF+jWT
	1BOO2YPDuu1J+SLjqvOi09P8mpDjhkLRd5egQXqQVwYBAVKq2c8tYwcPVts7Gdr1JpY+jSFnh6D
	wLTU=
X-Received: by 2002:ad4:5ba4:0:b0:6e8:f3ec:5406 with SMTP id 6a1803df08f44-6eb293b1d37mr6816246d6.19.1742333603472;
        Tue, 18 Mar 2025 14:33:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhztXksryfX8def6oBiw6VCdyAmlTnjdkgF1TUSXGb/cfOrSpTBlHYDH6pbe2Y+6+JoMCdWQ==
X-Received: by 2002:ad4:5ba4:0:b0:6e8:f3ec:5406 with SMTP id 6a1803df08f44-6eb293b1d37mr6815936d6.19.1742333603183;
        Tue, 18 Mar 2025 14:33:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a7a98sm1766004e87.224.2025.03.18.14.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 14:33:22 -0700 (PDT)
Date: Tue, 18 Mar 2025 23:33:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnaud Vrac <avrac@freebox.fr>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 7/8] arm64: dts: qcom: msm8998-mtp: Add QUSB2PHY VDD
 supply
Message-ID: <f5zjupndrasjpwys4v46hjvd6p3ta3uovsfylmlono3chtf5lf@suigsx2kpnyj>
References: <20250318-topic-more_dt_bindings_fixes-v1-0-cb36882ea9cc@oss.qualcomm.com>
 <20250318-topic-more_dt_bindings_fixes-v1-7-cb36882ea9cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-topic-more_dt_bindings_fixes-v1-7-cb36882ea9cc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Ztcm98OWYABdkPE0cS12ReewhSQYvb8w
X-Proofpoint-GUID: Ztcm98OWYABdkPE0cS12ReewhSQYvb8w
X-Authority-Analysis: v=2.4 cv=T52MT+KQ c=1 sm=1 tr=0 ts=67d9e6a4 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=YPhFelTriHocc5OovjYA:9 a=CjuIK1q_8ugA:10 a=PkAOt9_mmfBkvtOLxIEI:22
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_10,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=812 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180156

On Tue, Mar 18, 2025 at 07:35:20PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Set the supply as required by bindings, to silence the warning:
> 
> 'vdd-supply' is a required property
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8998-mtp.dts | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

