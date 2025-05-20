Return-Path: <linux-arm-msm+bounces-58805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D934CABE602
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 23:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DF197A2ECD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 21:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBFB25C81C;
	Tue, 20 May 2025 21:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qau5RWUG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FC72528FD
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 21:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747776431; cv=none; b=eJjdLOKbR05p3WMzV/lBy2r8GnArpFVTc1pCmWr27Qv+derqK7HSmjstQRxkEYSPwOOpK92qNHpxC8DRrDqEbFsyCPR0VeI42cCacbgXZn+vxUVcYPhUvdIXRmsY4IelBBMonQ/WmgwkhU/iQayypCykoPsdz5ivUxww5sMxJ9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747776431; c=relaxed/simple;
	bh=Tlres75UciCPZpHtQqwkcdqZyqlwkclBJ7jmGOa+Q2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=im9VZ6IJg15ea8G95Y3b/Z8L66ZkEQUo1fH4nSFv7dy6PtHKswHO2vMl1mL4u3l+GNegJeGolawwR2rmKywhIWi9w3XBCwF8RSO10mDQhB+IbbmXM8r+/smFoNFQU5w5Oe7lYP7EBpz2LwZZnBDPYf7jV1IXG+zpkU2LNZShQoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qau5RWUG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGdr3E000529
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 21:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tG/XW2Eqw3SoJlBkat+rQXZC
	WBPW6ciZKTyIRU1D/7Y=; b=Qau5RWUGBWsuY1V0sLQ0UJo3+PA/1aZ2EOK1E2TD
	80D/kMZWHeGddDhMa/GJTCC4JLehietYdJlEwMpS1A3RMNZMpR/IiA/l0SBdj5LG
	3m8++4sooJcMdAaHlKlFzkKOsxOeWoojDouaclpuahjiBKlv6FgEkos3wlNvSUsG
	7AgO/jRT3jJzPyG75hUckhKEAxFrk9DpCs8jdiHfJUWmb39am/dcznMSrO9NJ4NA
	TGZ7aVLQrDkuCeugZ2DtV8eMQwjyli6PngXQ4xBekMVFnShanK69Jx3F6UfoFxqr
	zaM/hOErf1arN8t6JcS139mbPOk6jA88DeALHQlkQWwKsQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf18pg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 21:27:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6eeb5e86c5fso63854606d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 14:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747776427; x=1748381227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tG/XW2Eqw3SoJlBkat+rQXZCWBPW6ciZKTyIRU1D/7Y=;
        b=E4gq/pJnujJ8Qi7LEunZ8G0PXeAdysXaACQ6XbOl+WAWEtB9fAGNLtLu9+7akMC1EZ
         HA7+5Ma/5ZBaOItk5Zmop3VIAc2JQ48qUYYWlDPGOC/aKGPFy7gOvmQkKRH0zTk7uOxA
         5iL32NrC90cqXdqyQ/niuannUh6uxYtbS0BHtJknI/0WZm3rv46f7TTgY1GqlUCntVQZ
         RKe7AtIaMCg3yTe7QJmfa2Q8JMR0mJS2rZvqN2SgBC7vY4g2bfiurdTVyAF8PlPRsX+i
         CWpwkqmBzeUjAcZ6UroF3SONRxqANNhhoccFxxrIREySChlqvqJ9gYzoLuMyswIMJYBq
         E2GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBLXLLOvQeWe0qr+7c+EYAZDfw7Y3ShPJJLQm/mkhbu0rzv8JrvIL3fkMqItZY6tjs60qJTKKCYgE/bo8I@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs/G2P990FiZrr8f12HQipNbHquU9pRB6neZLEsCw7jh8jCOCg
	dWi6X8B1mcxcfkezzq+qECGP2XpWMFCv/sS0Qn21PZ61uvWbgGQuQKpn+LI2LsnvK8BgArnAi03
	i+MlkDNsA5acpwPZ5RV1ZUQqVeQM9/adpsfTk99gH7KMiT1Q359TVVeW5zfxp+r9ce9O0
X-Gm-Gg: ASbGncufHB10H+NP63RVN74jHaep2gZKDrI79qsYlSqeI+XWwpYOGOodHj3kjoEjLTB
	0q8lMdFMwPD9RJTgu8YZSZtAZUaeBMVOzvjBQrKDs+LGHK+N6ZasRPdti3oaMcqchjo56fCOifX
	8bvOZqqGwZrold/fG92Ipqxp8CEXCo/8M+hVGG3XXmSo1K+tv7o6byU13JK1M5BsArfr076j9sz
	EYAA9aI+eSFm1MzXhcwm3z7H0K2PfSxirlvVWLUKGv1mbU/1KvohocQUM938DXml5MwHY9qThqq
	Llo6r0yKVTXxO1wP+Wgx5QDyVgOTeRPZLbUfJBt++SjlSM9fd5gXOs3+OMIrqVZHH9g7RmaFcXY
	=
X-Received: by 2002:a05:6214:194c:b0:6e6:5bd5:f3c3 with SMTP id 6a1803df08f44-6f8b096e039mr276434166d6.44.1747776427451;
        Tue, 20 May 2025 14:27:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXQvCXDN9w2FBtdGnI+rkan1fAQ9YM0ciJNl1Yj+gIlZexf465oAOPMwNVhIxArargpBSedw==
X-Received: by 2002:a05:6214:194c:b0:6e6:5bd5:f3c3 with SMTP id 6a1803df08f44-6f8b096e039mr276433866d6.44.1747776427125;
        Tue, 20 May 2025 14:27:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551f8493043sm821758e87.210.2025.05.20.14.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 14:27:06 -0700 (PDT)
Date: Wed, 21 May 2025 00:27:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v6] clk: qcom: dispcc-sm8750: Fix setting rate byte and
 pixel clocks
Message-ID: <ipdt2r25de4zi7zovntb7vopah23on4dr7l2ui3ieevapzdveq@3dtvuhtrdlww>
References: <20250520090741.45820-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520090741.45820-2-krzysztof.kozlowski@linaro.org>
X-Proofpoint-GUID: rfFQKvhnVzFntegBQfiKCw0iFuFMRwTV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE3MyBTYWx0ZWRfXxVvfoFQ2lttN
 nQPvFKQ6y94rMIndjD8ilbikGaA1Eu5G8TMy9UR4/c+bStByfz3vXhy+hia/lutHlGdRPuDUlUh
 ms+8jWEr47gYW/b5UsLHnjaV5HYflym7fAUL2Km36T3/zoyKz1BrXf9JA0VB9I22W5R9YKCGZNa
 xU4kdJu+dMP+pVl21nzIkrUuLeo9SBLtacWF7c2FAfwmmjJ0ix4uqTQArE2GepmTopqyOcgdwrR
 l12CbJUd7M6MWv5o8sfJh/MkR+ra+sM7vuTGiclO09IjG9KK0CWQyJ+cKNnna0DjqRalFPiyEmo
 H1i0wfiLvDFsLHm2p64YA5LnzcW5ETTHMMhJq0q/5mrVV3ACngh7FVSeQAhGtYSfRDzbZi0Y82w
 ckjzXVGSJSSnZBL4mTAHUhPik3ZjBrdvdp61mRzDwR19+CRZNSVh4im6/yymyJYXTcTRq9VH
X-Authority-Analysis: v=2.4 cv=F6JXdrhN c=1 sm=1 tr=0 ts=682cf3ac cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ZhXjtQkuzpVzWrVPaUMA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rfFQKvhnVzFntegBQfiKCw0iFuFMRwTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxlogscore=551 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200173

On Tue, May 20, 2025 at 11:07:42AM +0200, Krzysztof Kozlowski wrote:
> On SM8750 the setting rate of pixel and byte clocks, while the parent
> DSI PHY PLL, fails with:
> 
>   disp_cc_mdss_byte0_clk_src: rcg didn't update its configuration.
> 
> DSI PHY PLL has to be unprepared and its "PLL Power Down" bits in
> CMN_CTRL_0 asserted.
> 
> Mark these clocks with CLK_OPS_PARENT_ENABLE to ensure the parent is
> enabled during rate changes.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: f1080d8dab0f ("clk: qcom: dispcc-sm8750: Add SM8750 Display clock controller")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v6:
> 1. Add CLK_OPS_PARENT_ENABLE also to pclk1, pclk2 and byte1.
> 2. Add Fixes tag and cc-stable
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

