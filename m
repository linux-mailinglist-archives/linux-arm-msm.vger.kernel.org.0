Return-Path: <linux-arm-msm+bounces-54718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 016E3A9340A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 09:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A2BC1B62871
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 07:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BA326AA84;
	Fri, 18 Apr 2025 07:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JBcJp/FI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E43171D2
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744963121; cv=none; b=lmCK5ZGzb6NtTWr9o29nkfIgpSPgYsbQhspIu699cEROYt0LmtfwefAQlEo7qrtrh6E9OWDBpCMggGFZHV/cxoM5wj0VEm5XmLSH2b/gWWtgFktA6KjK2W2QVouKfWEJLphFz0B9jE1gcZ3RCtCGSrqpystIZRrVD5+DvGmiLGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744963121; c=relaxed/simple;
	bh=fARSdJJG6kbbQqqgn4KuyPT6X/EGeFSRTnd0k8SilKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ueczttVjcG3qB2uXjRcOPSw+pujDMs/hdRyBq+Q2xmeny4rBWj6L6SPgL/MBygKx8zKNmRWId+UQF7Gr55eiKwwdM1VSytcmcgN6iH99r+WiW7KnTK58xUi98J3wS8va4RRJft0XvTxdbazX5w6dfiPbLefuuS/FIPgG5wOdD/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JBcJp/FI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2HfHe013246
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hfRGkNoGUk9HNvDqbo7+xdRy
	LyO8YJB9kT+PEFuU0jk=; b=JBcJp/FICmSlyfW+EpHC/D3/hScuB2JV7Sf2/gwu
	DCayC7f4pTY918p7lRgiXeJ/U1y4brz9FqHBWL4SK/sCtwQZHGIz86u6eu+fPiWo
	OL+FsredH2SDPKxqHIWY2v7CFkikupjYFBrA19wdxGWwVrmrdxuclgOyxTIOFIMy
	ieLSpDnFqHBQ6xx/AAnZdyGVXYcr1iL4bjzkO0k6VnoBPdD7t/9N0qjoPn02ObJQ
	sxj0hWoytdf94EzYuVUCCmBMDopy2TcIgta/+tCiQGPhKvT+GoT3SPEskQ8AUJVw
	4DcNVA6gp9dwqDVRXTnapMs8M5TNFOPo00RiLruP1dcSBw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rveq4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:58:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e913e1cf4aso39562196d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 00:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744963117; x=1745567917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfRGkNoGUk9HNvDqbo7+xdRyLyO8YJB9kT+PEFuU0jk=;
        b=Suw28XhV0vq8AWocqZ5LwrRT1ovj7CkYcUTps0l4ZS0MWGOT+tppYBia+PfaEC+Hlq
         +ZNKNGkxNqrPR+IcV89HErbZe8oGpMiOlq1s4Q2l65nyltsi5uS2o7eHDp+d0ArLE1M0
         WuHzXF6v5eIPj+Z+X9lEHwe9sQuomVLNtnsfG2E4Tb5Nr0cNdJiuZhWsvjG3N02cRWRE
         /PFspqmAyb4fhqsrBhBpp6/vvQvTQ79VDpBHL+BXzkLvvrpjN0PxQLXwnMtnDFWLykVG
         XBpTNNY03S2vPJ5l8fIcLfBQI66VJa86C8JwHJUvF1kpqKlgP5PRs8tM9KI7q+/Vo/9Q
         JPiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzWXDx+Sf/Svry7OZrvW+ZRpRzE7ABG6vaER6zfGiDW3ZsoISO6DmZDsc0NfT6T36uv8xTuoHQCqTDMrax@vger.kernel.org
X-Gm-Message-State: AOJu0YwfrK0jRJksrcAvQ4z7SnOEjoeWONv/6lpeRUY7SGXEYRYIX1re
	3US6mLy9cdQtzfmTr3WhE43FoJiEMUJ3JKj/Ed0BKZmpFbhBAlRVAZMMyNmNGvvfj7IUWYXiTvy
	/UIllOIrbtOYDPxEnuCT7tESUHp71jYDhyMnDIoi5IJ5SyacWRvAwauaCk9SSXiII
X-Gm-Gg: ASbGncsAcsDzAEDugdVur4hXEG61X5P3Z+3Hkr+dZtEymJZRmtKYpyvBSb3/z4zAC61
	xt97mpTNeaY0DoA0ZVxk1kjNePS/MUilbYog5aHTjkOV3P3rT1TCh68pBcspFVBlZJnu7kS2IYK
	59BTdNJYSX1LhbHWdj8DB6+DRjMfHLy/Y1EEI8xJzHoXIVo5f5juIHNjjdlrZVrXtY76zue0swg
	N6PEDeuqXX8hc5fvzXq1SF6U/MZ7rc0bYspRZ0spEi7lOzH6O6Xc1yNfNWsF5411rRrbLp8CQly
	hrAx6JgX+c7rwMsCtY4HEOea2TeqwOYfbBTUd1jxGKfsY7uRPpehKTmLDEVaPRKJC0jOQu9N1cA
	=
X-Received: by 2002:a05:6214:1d23:b0:6f2:bcbf:101d with SMTP id 6a1803df08f44-6f2c46789dcmr32446526d6.38.1744963117569;
        Fri, 18 Apr 2025 00:58:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVYesd5y2m/S4yt3tHCl2VfUTgzR9qu+MHCZFBeg9JiXQF+3hi0WU41kgPYqtPNEIZRIQLGw==
X-Received: by 2002:a05:6214:1d23:b0:6f2:bcbf:101d with SMTP id 6a1803df08f44-6f2c46789dcmr32446326d6.38.1744963117256;
        Fri, 18 Apr 2025 00:58:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090827009sm1551941fa.82.2025.04.18.00.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 00:58:36 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:58:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ajit Pandey <quic_ajipan@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm4450: Add RPMh power domains
 support
Message-ID: <osuaixsxxzyeahexfw4dd3dkflh23tduihh3bqgb5yfvmeq3uz@366wnaqg35va>
References: <20250417-sm4450_rpmhpd-v1-0-361846750d3a@quicinc.com>
 <20250417-sm4450_rpmhpd-v1-3-361846750d3a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-sm4450_rpmhpd-v1-3-361846750d3a@quicinc.com>
X-Proofpoint-ORIG-GUID: 7jdOWGT76gHQsu4AZn7gnwJjsal9FFPC
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=6802062e cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=xdgr2bMqYQ8o8XjBYhIA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7jdOWGT76gHQsu4AZn7gnwJjsal9FFPC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=708
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180057

On Thu, Apr 17, 2025 at 10:37:41PM +0530, Ajit Pandey wrote:
> Add device node for RPMh power domains on Qualcomm SM4450 platform.
> 
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm4450.dtsi | 68 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

