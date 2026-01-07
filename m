Return-Path: <linux-arm-msm+bounces-87863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2B4CFD6EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10F3F3022806
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B75328B68;
	Wed,  7 Jan 2026 11:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZOLRGdb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/EZpGTY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB8932861D
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 11:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785916; cv=none; b=o6TGJ7BWtXbZqxuexAh1Mgp5uWp0Tne4vjGMYSkzBufpeUTTnWovva9KoRstPv13bkbYwFVQvnkv1KVhOIKlp5+clDDJL0Dleic9gjlTUVFYh1oJV61dAqqscjbm+T0XviqCn3MtgfcwIa0XF3yQDx0Moi+MVfnL6oJyPHswcJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785916; c=relaxed/simple;
	bh=4zB7b0UM3QAE303z2aGV2y+diJT3NVYpuvJUbKRl2Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRrdcDqXso0zrZPNwFcLoeqha2zkZQZtWVU3cJb8aOF+q6z2WsudcJcj8DGWLlR5hFsHuprJS8aazUIq1UZzsadovK2GJ5Lbm8+MPp9nWH2VkF/++zhrJSKRv5wc2wTK1ExAys4QGbprx73phkfgcRbjKlyCUuUEuX+OmszAAgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZOLRGdb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/EZpGTY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6078dpVr2577888
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 11:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cTH/4ZeodwA/Q+RzWHaBeEgt
	NJJIoFwg96ta/DUybCQ=; b=OZOLRGdbF+iM/6nGiViEWp6GUVmJ1jbNqw8BDRKy
	GVRMBFHZbDKcdByXYp9f1Y2L25UOk6U1YXqXadHLdz/z6ORpu9vLR8zZhBkwKGv0
	4mf88z583y1k7VTLxclG4zVIwN5BUB7tSbEziwxi5nFlnVmX310ppbpU9wK2POSi
	FtahubmmKFvcRx9S1MBjShx+9W2JSed33cU1hsKMs47z3+lNhBE7GGcWrqGheKN4
	PKKtVkDbi3ovCo9yDiUukmkP1wbwDW4HA2wnDkfd5sm4jZXr7o+jUqbWSRs3zC07
	7cesJYcAew9cWh60c+O4JnZEsS7p/3MqLFuEyNNFXy3rDA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhm658jbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 11:38:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed69f9ce96so66336931cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 03:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767785910; x=1768390710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cTH/4ZeodwA/Q+RzWHaBeEgtNJJIoFwg96ta/DUybCQ=;
        b=d/EZpGTYQA1AXciiIDf0+Pt+VkUi0wpoXS9+RpPtC/rYW1lGQHELMMtAdRg3kv7Wqg
         IaaDFuR1Wndw9BwyyBcaFgcYAHuIO0Lo2KIIN9Z+Sv3oMuJTTYmGPwvQio/xncMsHdq/
         745arw+L6A1kGIKIr9+hwRvDarT7lX2qhWECsDTja1DCKERxVzn7YBbDiNmFlzbksFlG
         MYr+1ge5iU14LmcE7ri4rYhdoqti/Rh1KsUIyQFAEGj/1FPhbaGu7tRrH6rFfqKdwR9w
         hVhhB8XXd0Usn3BGliBU3qa/URKZEsHDtnJtQF6l1ElTNRNGzHeLUY9AGe2Y42004xSz
         /49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767785910; x=1768390710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTH/4ZeodwA/Q+RzWHaBeEgtNJJIoFwg96ta/DUybCQ=;
        b=nQl+rpN3WXIsABQL/Wp27/dCLheanYL4EcaXGz4StimY+HFA5+v/scVGjqnk8Vicub
         ssbtJ28vLxfBuMStxlBpYh3e+/J5KIMsUOtBlSN2Dmc99101Wgy/tF6naT8XlowoP0RM
         RBpjuaNl9zV0r2drWcPJqI+5AMb0xonebtxnoT2wYcnbfjhDPih1AEiM1Qamvd1V2OxS
         uXaQU123BLon4vvndAomtyGFQvHHB6pl67iQ9SMDHjJbsiDgtoD7Bv2p+BtQ2Nff0rim
         0UqDniseoWpp/u+3DooAm9N3Ze7wSzgmc174V95Uz3hRAo53lVNmkPXdYwxCfAb53twd
         FzoA==
X-Forwarded-Encrypted: i=1; AJvYcCUJP6GBRjrRGWVD2hVm0fS1j54L1hvwTJXgdSPr+PV8hqwdKkCEq2+uMRskFPUc+Itn+QjYnF0/hIKE8xg7@vger.kernel.org
X-Gm-Message-State: AOJu0YyxzAUYXFxuhz8ux8jC/Alk0YMG8DcXOyQkXKu+kA6WN5XuzTwB
	gnjFxVxHdfpx4LXxGgJRrumK0aRnT11qqYjt0JPpjwkRrWMHd0bFBA6yehsqdB66U0YbESi5kUK
	hbZnC/jPy2m4oHoCZuT5+SJuLKCoLuXW3Z9pK8FETJXFxkjn4NbN4Hu14TFAifxw0sfFi
X-Gm-Gg: AY/fxX7IJcfV9BGn3PPC5S5HquALngOkwa7Lv3opfVhpQYRYsj4cdfNrzUyTYrvBTNA
	zv2AKKPgdQ/p3LbgwiTwAoC8Pvypd1y4CipiS3c0e7abdL1uQjKaUcLjKj00XSeKJRd17s2S8QY
	hIblT+r//lumf4UZjffFB5Dk/3NniSvX65qphaCk5y0AbXlBXBP0orU2azplSgex/G9Z89YbYry
	0Ppt+LQaOqw5MXdxowNhunz5htMm3NGDhPEwY9dPFfxKv4Jx4+d1PwIosclmxcmdHi2LBfss0FC
	y7Gg59TsIjfzYLkMK6qnXq6JuBOr1b4zo5T39m1D3xZnWz/ls4qqa6k1uVRSaV6mywyPp1Ns5gn
	JRjQCHwhI0gHg5FcDOQQ1OlrG6rjGheJjOtuwOlAKjJooL2cr+wXQYp2VFxScGJB/dpeXSyhnmP
	f0yLN8f/5JEmEVZSOpFY5yxVs=
X-Received: by 2002:a05:622a:20e:b0:4f4:e15e:528f with SMTP id d75a77b69052e-4ffb49c7d3emr28885891cf.62.1767785910459;
        Wed, 07 Jan 2026 03:38:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfaBxfXO0EARRWs+zjZ9c7H9zOXqTKVd04HB62R5Cos9qRCEQe2HmgxwEezgO5LrfADT4Gyg==
X-Received: by 2002:a05:622a:20e:b0:4f4:e15e:528f with SMTP id d75a77b69052e-4ffb49c7d3emr28885451cf.62.1767785910039;
        Wed, 07 Jan 2026 03:38:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65b89842sm1242653e87.0.2026.01.07.03.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:38:29 -0800 (PST)
Date: Wed, 7 Jan 2026 13:38:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 02/11] clk: qcom: clk-alpha-pll: Add support for
 controlling Pongo EKO_T PLL
Message-ID: <7lbw6rrrsxitcldgahf2wwqklzy3nvcmem7aylsw5yvbsbom2b@lgel7iicehrf>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-2-8e10adc236a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-2-8e10adc236a8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XpL3+FF9 c=1 sm=1 tr=0 ts=695e45b7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Rar_LHnIVK7gKg-YXgkA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 4uJUNK_GaUr8c_4TPIdbIlwlJxFT450B
X-Proofpoint-GUID: 4uJUNK_GaUr8c_4TPIdbIlwlJxFT450B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MiBTYWx0ZWRfX+ZGwGiC/iuC1
 FS+I5L/CbE6cEoKgmoX5GcAdZylMtcicVpnfTv8qAwiJ1lu5LuyAyttAXNGFkOAbs0IIIca3yH2
 +ru8M8ds3fRDYOWZFbTycXXn6iix1lQ9B6gcVWCO50LfTa8Ylx2OK38zv2QI48e7juJQEXUKRZy
 yoyn/Y+ZfaSAgTXh6DMFm35RJoqVD0fVYledfj+vKj/wIbmycKDAEQiL6J4xm0+euK4sQG1bxOd
 d/1/GUI9QxS5OSSp3rLsrAy/0NzymzDW9Bql5wi8PGegaP38VYC57mB9OI7oVqIT+BaNBYQP8kV
 DEuCpxN8MEOCuvsvSzeTeYAKi6a8jeayFufCheDmq7TlPrQOCa6bTiV2wEXSGIbOx2SjdZoceGz
 rkpOJovkvRKw4Z+E/OeIxZsweg4QStL2PHsxTxi5PYXnlnIjb+el9u13X79q0weCXcVfIIoaAlE
 3k+E2h0AvpcD79Fa/FA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070092

On Wed, Jan 07, 2026 at 03:13:05PM +0530, Taniya Das wrote:
> Add clock ops for Pongo EKO_T PLL, add the pll ops for supporting

Nit: PLL

> the PLL.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

