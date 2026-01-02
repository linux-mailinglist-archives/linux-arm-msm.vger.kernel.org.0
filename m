Return-Path: <linux-arm-msm+bounces-87220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1082CCEE60A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 12:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DC543027CF5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 11:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B0E30C613;
	Fri,  2 Jan 2026 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jLwdbu4X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jiYPr+Yv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E086F30CDB6
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 11:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767353657; cv=none; b=TDWBh66kqofwFjxAQFUjjVQhTE6IgcVC0tNhBSnX8QkjQBHqi/Z7g4Xw5XNvcHXZmD1VZ6xt/bpTMknmMxaY58cUpkph1dslcFx2kvGgO5AsOVHtM8OXIwTL7h9TJgbjWSH1sTQbwb6sJeT4p3NT/89ZrJlNRLbfuC1RD+Q4KLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767353657; c=relaxed/simple;
	bh=ZnEfqd8WYbsRBu49JAdPAIcdkTOS76iHfcTHMMFPn+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iYsqNjJL/f+BZAswlshFYw4s6GJ2KHixvradPGlNXwEVX6nQdd3kB+LoFiq3F+cxmAE6mp2TFR6MFSxkOHZAJ7NK3GrUsGfljrHEv/X5G7nFVDkky9Wkq+DYteP4YXU+RCBU7FR0Gji+3JYDFI6puHan/qnoFIfAPBV9CI+vANs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jLwdbu4X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jiYPr+Yv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W1gg1002036
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 11:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZnEfqd8WYbsRBu49JAdPAIcdkTOS76iHfcTHMMFPn+A=; b=jLwdbu4XBf/DqdhX
	MC0l8u6aUv5G31D+rD2hTJ7zLAYHhc5b7FsR2H/pNvqeTx92CL6soO/gybkf8Cel
	CpiSANtcuw7gzTvJ6Rh3WxFOWY5S9xE8jZITPpndfXwyzU+3tLN4JZ67f+y2rAF4
	Yk7Mz+B8N3OMRmCpIhAyNjzB9p6wLoZtst07jlBdTjoKC6oFNqd+qQsjaMbeBr31
	LnHQUyiamRDwQDJRndAyBHV1clqPz9lhxCSIIvtDfvvQ5cq1k9kGJnbH0o/91aLp
	aTRNdTHZYHLJzm+y9JPP8X8cVa7RqomRanoWwsyLTGZw9tLm3VtfIZyzfpmzoP6k
	RKriLw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd2bb3uf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 11:34:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f34c24e2cbso41056711cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 03:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767353653; x=1767958453; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZnEfqd8WYbsRBu49JAdPAIcdkTOS76iHfcTHMMFPn+A=;
        b=jiYPr+Yv81w9pb6ZVS8XNosZewAlofqvPaJ6mHusM3hRWkt3VJFL1B8lelZ+8P3kDY
         eHXOr42dMs61TvONDYjh8gc0F3nQaXepx7kAQv5Twsq+g5A6oLKc/k/1qp8kj+YkSDtt
         3Q/lh9qqUDMwxlQ5X452GD+jRxFnryIu4fphoNQ4AAGAuAlik/XHpFkeWatMq1Zjmbft
         e6LWfNDWlqWI1IrcPjSsa9vpCePmKKUwBzxIJd9GsyRtFMMuDVzCq2rTTJ58ucftjg86
         hbZJtixQWMDSVPAM4KuDTO0OZ3zgVt/lxejuyTYvrixBozBIg2gzK3YodMk+4aKTgZP4
         oaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767353653; x=1767958453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnEfqd8WYbsRBu49JAdPAIcdkTOS76iHfcTHMMFPn+A=;
        b=DtvPj6HkW7t4ZH2UfdHtOS5Rw2Otj73mkmkIe7tdkqK9/EwbjdhVRzOzifLUjEHyEx
         +nUCZ7MUrBPwaPqOgS6/xo9tVVjpN0+rTTDTKXlq3pl7A8R39cL06F64rNo8tzIgRc4b
         EirdpebSvrXMygBG7LB4SiFNtVkAT9uMSHyUjN7FLRAmH5ZEPmG4dMTeZ1uK2uQZWlxt
         xMSlsWm43AYRESIb8Cz17ronJrii0OYzQsLX1L53OUrQFCNBOAkzdJseD+7GETmDPOAv
         KVLpoxL3FxpJ6ckUWHQJ+HzSkUV6SFGAS/hgZ7n0FBUfay5u1rtAHIsqKuJAlmZKfd54
         BlbQ==
X-Gm-Message-State: AOJu0YzLUf1piaAYZAB8uopo6Gxzh5bAYEs0NkQJz0lJGzCH2DCl+EKy
	VeVDj/8H27misXGgbdJgHcFlLfE3oOPVM5RzMR2O1M4moIcoxhNokmiEawQfXj9r0kXrGqtdOM6
	qbxwTAlueJD5h2PXbndePyFdV5dqdHI+IJ5X4eUwe3EG012u9xxp6yFlH5qnnHZFNf9u0
X-Gm-Gg: AY/fxX5p8NBBci/JsKsYWnueq91t5rVSSs6z187PuexZjqMKR88EwRNAnYcTeuYay/A
	3egTRt+69KFR4HfTR0m6iopoodn4EYOOWV+0S1XBbS8g9wVo/ccyoMijK/NBUDm0CtnmTXOUIaa
	MGwHghKhIJidGTnY8qRzwkL++nwy+F53BK9N/qZkeqRHoqqbad1x95E99/2IWxuqS4Hi9hjQwL2
	qwAIMieFDfNVxiEfuUZUuQk6J7/snEZ8w/ytB+r7z9bfooFPZvaMkh0eiKfpCrHM3x/atPDrDtb
	tF5TB8JljNlAEfNIUM9KiAtxKDQS92Ed405CChqGZkhILM/67hau3g91HT1IEAefqUGKL9T1Prj
	TTbb9Vd7RQU4bG/EIbasyimhNmXB7rccUmo2cztQScN4bOdGwBp/GJTs8kHkpMXZn5g==
X-Received: by 2002:a05:622a:1922:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4f4b43e3a80mr432106251cf.6.1767353653069;
        Fri, 02 Jan 2026 03:34:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQcpKMZLQyO21S342Q1ST+russHl3QXOoA+e/hjw4x2uXgifbAQtXq3FQdi//CJyR1kaPJsA==
X-Received: by 2002:a05:622a:1922:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4f4b43e3a80mr432106031cf.6.1767353652663;
        Fri, 02 Jan 2026 03:34:12 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab4f0dsm4573315866b.15.2026.01.02.03.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 03:34:12 -0800 (PST)
Message-ID: <a42f963f-a869-4789-a353-e574ba22eca8@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 12:34:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] clk: qcom: gcc: Do not turn off PCIe GDSCs during
 gdsc_disable()
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        manivannan.sadhasivam@oss.qualcomm.com, stable@vger.kernel.org
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FtLBsQVaFTrhaJsaprMJbwoPJn3knF3m
X-Proofpoint-ORIG-GUID: FtLBsQVaFTrhaJsaprMJbwoPJn3knF3m
X-Authority-Analysis: v=2.4 cv=dMKrWeZb c=1 sm=1 tr=0 ts=6957ad35 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=B3EyukNvg1VkyB4u8sgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEwMSBTYWx0ZWRfX1+K8x/8OweuW
 LHe5CQfGegUAeGpe5mum4HOvGYOgBkMSjOVDGsLzg8Q9ItOdKpgEPP5fJ7qrc7AJGDXvdE4PAdu
 Hpp8IYM1b1HVUUp73ZLpT5a5bhw+hHUB9ggeSzjB0GwIiJQRVfSaVjAh+9QcMZrFXSgEWBrWBQC
 6XGBdPLXA0cyD4VoRdaoRUAVaCLY+5CWjOdaAqdU6ILbj/1YWRLJ85xUqfTZmkBYNffh/UfYMJE
 P12Qi0XvlcYWt1Z1r7AvtpI5hFEz2KNWeAEOlvOi4XoqKss+MH7mxCF+DfWqHOlA2vg0Kmjc5U7
 Rnmu+FQ6Zza5UAsAZpMrnlzXGBhUm75wpeOWbXX3aoRR4+AMBSg7o2Y2tC6wySdJCr3tc6tBUQb
 FaSeoiAPNO/sBD7TotXmZToUhB01vh9PPj/Yxx8eHg8bUC1FxEweGzMlwnE1nz9dPIzWi7nVU/J
 FBZGSAH0C+FRgv6MmGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020101

On 1/2/26 10:43 AM, Krishna Chaitanya Chundru wrote:
> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
> can happen during scenarios such as system suspend and breaks the resume
> of PCIe controllers from suspend.

Isn't turning the GDSCs off what we want though? At least during system
suspend?

Konrad

