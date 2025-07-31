Return-Path: <linux-arm-msm+bounces-67273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E4BB17735
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 22:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEA4D3B2B26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 20:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEC1264628;
	Thu, 31 Jul 2025 20:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fZL82j+C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1751925DB1D
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 20:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753993897; cv=none; b=WLAOvv+d7Bcq0c/sZsewub+2N19LhsjGCaP18KuValsgkHY4jfV4PT52xWMJghrpRVP2p+NqlKRZ64C9hLHYk+e/MMAPbyNt8ZIkA2T+NhZ7BBv9piYwbFVLMoqT/F12hjxV5axwU+UnkOK1CGTPPnlH0QZ17jG337YrTwz79Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753993897; c=relaxed/simple;
	bh=xTvLJuW/ApOSDzwWfLExf2bQhoNe2yXXWNBZO3mi21g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/1JhpzLoVWhVeT7Wa6633GC3Jwngaf6Oh6zjrFjzXj+6Maa/TlqR+vjAyVgfp78R6yFBXDr4qBgdWIMZKmz5nZg/4iZHist8CfGxGC/tGdeEIEIRfyrBZpkLb6giEW+DgbnObdZNgpYKbsAOLfzM3SACzObtdGpxiOeTzu/EFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fZL82j+C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56VDf9T1002492
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 20:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QoS+iD8VaUIgyzaqV2nW/wnh
	QVOn+KPVj5CIZuJUF/A=; b=fZL82j+Ci6kud5KtKv4vtcFoXel+2g4Crv6XPIQQ
	N/jcSiuABaqZxlEt4ogI3mtZKAo0tflGcZW6nb8S0IUHClc6hBafk7MBzpYl7IZ/
	McjEmYuaQ8xG7QcEwii7+KBVPtWPidFn+n0CpufnoAOBhTjOjEisdPmxe/o4FTjT
	RQUyLX4voRfXUmK1CBAha9vUH4alBgnMxML8cm8JS0OJSbJfgew9kRTMb3mQm/kb
	MFRqRrAf9+SFX+1hHUsL9fEbFU5N+UEd8bdFEeERDI/oqm9SPYBFcEaYZvkB8s4a
	U5OM/43kz92D66QO3m9JidUD53JmQ5WrWC9bn69P29/Bhg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm9253-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 20:31:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4aeda8bf2c1so2468841cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 13:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753993894; x=1754598694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoS+iD8VaUIgyzaqV2nW/wnhQVOn+KPVj5CIZuJUF/A=;
        b=e7KBhC0DqjnhUWgxPYqkngKvc9fb558KTQmhfx4uFNIThft2PFt3i+mKOKixYsYz6L
         6ZXlkvBPh2WRFPkzPC2aNE5tA8NxYxVwTbwrTw4P3NMxPA452ZW3Wkstkud+PSbg8Qj9
         RMxNJevmZqzoQsL+ctAFbmzOiCOuhJDZyEuCUbCd0nNNASb94hVTsQ9gDwbnbzRqfnKq
         WDL7Zz0F15rPiG/GuDfsfeOuQjmAxNVPGYNezYR71G8oTsyneQxn86e+Y+p4UVceSRFQ
         ZYQeU8gCqwLbdEMa6ABkmsU3zY5cFlr/v9Wz0r1Pbx5hB+bYV8DSmI4mybEBfwlDxeK9
         VVbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKGK045uLitS7zniQA4/WhMiO7GZBfHQ+pLIa9DetrMXrx4s2ErXhLXcXprczKFetb+oHI8OaMc/cP0THi@vger.kernel.org
X-Gm-Message-State: AOJu0YzwiQ6IodOyzZDz5VNLmQCsQ8H8VkvxagCJ+2qzzcU3XnBQEKyQ
	Doc6Vff+wCP+M4mcqN5mQ8kN9w+Y5OlFS5fAXBVBEElgI0LcJnRVMfsYYhakc0VJPJ8sG6b0Uau
	GZuUnBQMqsigvh04DiBJYUkCz34woDPMY1AIq5LL3Ufd3kUrOCLknM1oYDRBmot5pbhVv
X-Gm-Gg: ASbGncuQ93x6Y4T+huobaiWrnv7mF8Np2a/6h8h7Qf+wM+EAufDhq8BVu9PNSSSLY0c
	5zqaRbaxolpLgMJ2zc4OiANGUcP88I2em8Taid8miWjHNVb6UVaFk5UC/uo4Gl4T7HZpmKrEnmd
	Edx/TlELGFSYM+UWY7hkyAJYJL/hDPqVMbOXnhPIFjodP0I7GfG4e/dFeCs+ACwycy+2HCCodLh
	HhEsKKYTUKtnaEVgoOkXwxsC2bFbEPik144IKEz2bJz84G9DV5h7ZymQGKhI4WWrPYpoB7l8QE2
	aKh1DYcAzVwCCJLKL1k9RF1aqayKfWsc8n2m5zCtlvwJMzLNhqdojpOtsSVCgAyTYfOZfhpla/C
	CHvhinVs9YRVzIYmAWRXdfnKW7akklPAI1RZBmgRXdwSti1DsqIbS
X-Received: by 2002:ac8:5fc4:0:b0:4ab:3b8b:9ef9 with SMTP id d75a77b69052e-4aedbc469cbmr126720201cf.29.1753993893941;
        Thu, 31 Jul 2025 13:31:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjG4KR8sIlrrwmey+SYNZ6lZ4mSTtNpoyvhRvxc6f1Wla9QXCimOwryXTNV23PvNWNId87eg==
X-Received: by 2002:ac8:5fc4:0:b0:4ab:3b8b:9ef9 with SMTP id d75a77b69052e-4aedbc469cbmr126719751cf.29.1753993893446;
        Thu, 31 Jul 2025 13:31:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a81d2sm348386e87.59.2025.07.31.13.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 13:31:32 -0700 (PDT)
Date: Thu, 31 Jul 2025 23:31:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Andy Gross <andy.gross@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 02/24] pmdomain: qcom: rpmhpd: Add MXC to SC8280XP
Message-ID: <vebgxvaxfuohpy2ilwzquupezzg2obaekylk7kaiyroosrelx7@dzd2f6bpgkmi>
References: <20250728-topic-gpucc_power_plumbing-v1-0-09c2480fe3e6@oss.qualcomm.com>
 <20250728-topic-gpucc_power_plumbing-v1-2-09c2480fe3e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728-topic-gpucc_power_plumbing-v1-2-09c2480fe3e6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=688bd2a6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KHzq8nhu3g8-aHLh-moA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDE0NyBTYWx0ZWRfX5j2oDsGdqGFk
 WnYfD3nq/fcMBydkraGn41DP4FJwRvGSlMad7uLe0hviuayz8IxG2f9eOcXlFOrgvU/GMwQGmuN
 HY1G1YzWnH5ztkoXeXCtapg3t54Ir0Krr6ofhXBQULkTnshBd48340mvUkX7cbJN1Nasq0UzFbc
 1geYDc2zCASOKHUDQdc8g4R0VKf4YP1Uga/AwFQ4cODpkzOuVHNKcwcxUBJunwsBxwBahK4wecZ
 to+3mVS4WTuxMltrKMd18LczaeiWwxIj3z+2sbgfFd9C5N5gFnK8496MuwTfhBRLiLMDGG652N1
 Fc+foxQhFIoJo9gnXaC2M0RY32EC74fiuIB1kOHHQ3G/R+sEd1M/7hhRo6kEa91qcBP55XxDLzG
 SOCATATb9XYYPOKUfKj5l8+dZWVJSmDNWg7B1E+lswVsT5AhMvxGJstkvsPwa9zEG5Cf9jtE
X-Proofpoint-ORIG-GUID: _zpME5t3gUM57BhGBnnIZ6_7wvnTzjNM
X-Proofpoint-GUID: _zpME5t3gUM57BhGBnnIZ6_7wvnTzjNM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_04,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=916 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507310147

On Mon, Jul 28, 2025 at 06:16:02PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This was apparently accounted for in dt-bindings, but never made its
> way into the driver.
> 
> Fix it for SC8280XP and its VDD_GFX-less cousin, SA8540P.
> 
> Fixes: f68f1cb3437d ("soc: qcom: rpmhpd: add sc8280xp & sa8540p rpmh power-domains")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

