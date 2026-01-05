Return-Path: <linux-arm-msm+bounces-87365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 119FBCF1FC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 06:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 45560300161C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 05:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7ED32692F;
	Mon,  5 Jan 2026 05:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNP6SHZx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JCRCiPxU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93224324B2D
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 05:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767590140; cv=none; b=iWkooo1Ftuh05uvPdIZ+CtV05AHepZOkkjMGRNIOIauYMs9bckvwYnk6JIx92PS6kuxqJGqJa5mYTx0LDV+IazsV+j3SJsnB34Uj3WGm2eD9zZnS7t/k/8NKVkwjX4NcRd9pS4DywCySoikpKPNnD1/t02VIUNPOjn6PNrHriUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767590140; c=relaxed/simple;
	bh=ccckinTe4Nd6e+DN+CiKqNsVaXVriV0JcN/wQcWRlKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvkXSZpfXGSh1aJ+OiYZL78flSaqVtC477R2tgLn4KTjrtP+lv624CxiOHeOPdYGRoBX4qbCdPYnvLnQpaX8l2I4jToBygW3wa5C01cEzEA+I88Gbx2Do7Gv1hUEjrYC2Q8zMVyvQdxSHq5k1+fVo1lF1pmPVeASfTR3p/yn6E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNP6SHZx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JCRCiPxU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6052oGFn091437
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 05:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w45yMTKmw3T3FsrBXK+GQLsm1qbLPVg5YDaxvUzAAPQ=; b=cNP6SHZxDAp7CWTg
	13K0Ub9Hwi6XGcb5BnYqF//HQp6S4+Y0Q4wuspF2gJ2xkwXVz6VKZWIV+vo/YRvE
	nBqiD/XO8oQ74NaXVM7eFKRoc8hCx+ZWNiYdW96vcsZxwebYJvNymRrRBf1N4btZ
	ND+VZV8FnRWE3j2Gcm9qqOfMPSqID0YfcTux8+6a2GkrT3LEPVLu+b7pxf+fz3md
	y1ZXUDUyylUOGwaXBARp0+6nTqkC4gbzOm3pPiu5gHZn3zBhRARU/P3BVkqA6pbU
	wVVRGvEUCViw9mEzktqDsna8227Cnx5HefJSJTzClEuUm759xquH+Rokb4sl93vf
	MaBRZw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg4v609x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 05:15:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f1f69eec6so172116165ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jan 2026 21:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767590136; x=1768194936; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w45yMTKmw3T3FsrBXK+GQLsm1qbLPVg5YDaxvUzAAPQ=;
        b=JCRCiPxUNjrn2uVyUSgk0WpTtp1ezWPC4xYADmMR67GXfsEz5IqKcgbSztBeWTbvH2
         i/a90Xqc8MSU0c6shASZkq/rlNG1qmaOJzykIercNA9RT5QJOPxm7gec5wYZ/U6sp/0i
         47ZgPHrF7kZb4oBhaoNxE9tanXB1Fe63o7JegzCXFZ7GyFriApYSLjyBD1adV8nZyF4N
         4xi6S3ogTLaLP/IbG4sF9uBaDh9g5xq4FvMcz8uMaRK6/ruxVYQtnlegKQOgH4M+2L+i
         AidmV0NdfHzfj1iFkbadsyIv/WZ1ZHMgdKJVQPgugOUO48W6dIrF7zjfrKcvP64Wo8NV
         khhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767590136; x=1768194936;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w45yMTKmw3T3FsrBXK+GQLsm1qbLPVg5YDaxvUzAAPQ=;
        b=bw/Uea+NAsuPugPNrv1UBsRu5pId4givfudA9EbvM8Mex4CjiNde4sb9DqMYM45cHE
         VH2lny4j20rqT5V+fmwSNUIx3x+vdzT7QMdc/UqY9sE5jD+n6y2OJqQQFOo7nkyaYFq3
         /uQciGSb806jqxuvGEGaRBNcMxrSZDJvyzUWV9cDzmAXzHfgSldaikjGxGKZzGgYgJDh
         B4AIPun2RKAzDdu/IDlfPeBS1UKrQUdEY0nbM+fh1roaW5B1dypnJc6nZI81WWAKjC/j
         BzrPfvtDizK8tUE2RYUFUjsRnVe4Yl+xMPTHv4elZx0XP991gDOG2N0hoOOAf9C/beWp
         gjWw==
X-Forwarded-Encrypted: i=1; AJvYcCWd6BUetUhP0hnSca6EUlU3dbr1NMUz4gluVEMktLGJXSUsSXec7cvfzvrBM6dwtlLnRl22TUELX1KL5hMG@vger.kernel.org
X-Gm-Message-State: AOJu0YzUPJ6ChlV73AgBDa99Ac/0ZLqQIni9enmwk1NvRtacErcKrJfC
	UW81QvQS/Rbls7i5hjAtF8pubmSNWyQrYFtOAkKEjXjCvliTIOrgOVSebxkGIzcnNu9O6nuSr04
	/fmp2j1ysWsp5DhbxcVqhSSmNgmozTdj6VD+CJSUrmkNgrVHCFh8rjYABZHyuTkAYvIbU
X-Gm-Gg: AY/fxX5AeHWm9Y4TDfOICqMwhgV4HnZF0PKcrWS1/RQ3QLV8VdPIuLLgLdPQlMIHgQI
	FZd7fFhYzJt9CHNngFuSKN3bYzzhnJFzObFyAH577zcNrbgBgTIoPWr7KhHVOp+hTf6X6dkUhxw
	RElHeB/HXWWYNRaOJ9LbagQ72dYd95M8B8XxNHYxcuXrVL3NQBN80sE1Pbk+bdTD8LWqHFvIKDb
	lUoUaDkEu2WpwhvOH4up7osXckei7xoDYS6Ypn1CbcqM9ek4bG1f30hTLZvzl+Y6X7GOKbNqrqY
	t6EpmIqIj/VJeqnSsAonKQFtN26AN7QkXJgUvSYJERJxfEBlxXXFfL0wK5mEatAs+7aSz20XlhV
	3GI+FehO473fBRXLLmwMA3Zlxmg==
X-Received: by 2002:a05:6a20:7d9b:b0:355:1add:c291 with SMTP id adf61e73a8af0-376a75f5bb2mr44560572637.10.1767590136236;
        Sun, 04 Jan 2026 21:15:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfNcaMd2IHGrgg0+WgvXFUrvvd8fIzU+ttGMrRaZKzm0QUfBMuqUCbK1jhV254MgJ2Excv9w==
X-Received: by 2002:a05:6a20:7d9b:b0:355:1add:c291 with SMTP id adf61e73a8af0-376a75f5bb2mr44560548637.10.1767590135763;
        Sun, 04 Jan 2026 21:15:35 -0800 (PST)
Received: from work ([120.56.194.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7cb01a9asm40787234a12.35.2026.01.04.21.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 21:15:35 -0800 (PST)
Date: Mon, 5 Jan 2026 10:45:28 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>, stable@vger.kernel.org
Subject: Re: [PATCH 0/7] clk: qcom: gcc: Do not turn off PCIe GDSCs during
 gdsc_disable()
Message-ID: <mdy2edlneqivwjsi52ildqcnrprbqc57ghtuwtc7mmuru7ajhz@tdo6jts52soh>
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA0NyBTYWx0ZWRfX1YaODSNyBEsJ
 ZL8QLQeju/67+e7AdxkPaAJZjEeuiqGrbURlwT7zs/yjFIiK42SFUjb1b0+sSBxngWG5l0Yq71G
 3o2POosIpZxvcODkvJQvdUcIBKpBKSQdXO/B1BJtLfuvXDCw41yYXj5QsQRdyw2DTjS+zjn8Q+8
 Qnp7EM5t64rcY9UH9jY8S4BbSjCNpFE+Xh0IWvZ7UWYqmBsTcxTf8aHHh2Z5sw+XsMDo7FKlbiz
 AXKLO/59WHFAte3lsxtlgeCm75blv0vIZ15AmdwZlxOkzea5Kk8ecfRl9bItdVLM6IoCCNt22ec
 JKfvb6BkRe4Mz4sjfnMFE2097x5hFfBDrdRZArojACAjlwhsdmLCkiiwS1TRQb5UgiF+UopE+ta
 TDsJ1S9xhXjh8vY8WR3r4WYkruSkgtyOwVi/dzZQy7BGIn13g02pIpY10MD7bv3ZCHJZlg0cswU
 3BWof/2hVTi4GRsW4wg==
X-Proofpoint-ORIG-GUID: Jg1yc_ufOhg3qdtpkRE-ttQVnsulggC-
X-Authority-Analysis: v=2.4 cv=c4ymgB9l c=1 sm=1 tr=0 ts=695b48f9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=3dEILRYKsVIWdVk4w2Qziw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=LkPj_kuH23xJFnsvXP8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Jg1yc_ufOhg3qdtpkRE-ttQVnsulggC-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050047

On Fri, Jan 02, 2026 at 03:13:00PM +0530, Krishna Chaitanya Chundru wrote:
> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
> can happen during scenarios such as system suspend and breaks the resume
> of PCIe controllers from suspend.
> 
> So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
> during gdsc_disable() and allow the hardware to transition the GDSCs to
> retention when the parent domain enters low power state during system
> suspend.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
> Krishna Chaitanya Chundru (7):
>       clk: qcom: gcc-sc7280: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-sa8775p: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-sm8750: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-glymur: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-qcs8300: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-x1e80100: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-kaanapali: Do not turn off PCIe GDSCs during gdsc_disable()
> 
>  drivers/clk/qcom/gcc-glymur.c    | 16 ++++++++--------
>  drivers/clk/qcom/gcc-kaanapali.c |  2 +-
>  drivers/clk/qcom/gcc-qcs8300.c   |  4 ++--
>  drivers/clk/qcom/gcc-sa8775p.c   |  4 ++--
>  drivers/clk/qcom/gcc-sc7280.c    |  2 +-
>  drivers/clk/qcom/gcc-sm8750.c    |  2 +-
>  drivers/clk/qcom/gcc-x1e80100.c  | 16 ++++++++--------
>  7 files changed, 23 insertions(+), 23 deletions(-)
> ---
> base-commit: 98e506ee7d10390b527aeddee7bbeaf667129646
> change-id: 20260102-pci_gdsc_fix-1dcf08223922
> 
> Best regards,
> -- 
> Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

