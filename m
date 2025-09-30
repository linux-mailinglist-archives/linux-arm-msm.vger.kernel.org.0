Return-Path: <linux-arm-msm+bounces-75623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C58BAE6C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 21:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6C66164ED0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 19:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020FA23C4F9;
	Tue, 30 Sep 2025 19:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPwEgfA1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8799313A3F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759259938; cv=none; b=rDqQQJoGEV0cxb9LRonA5Vm7vnlBf44rZpEgLeR9HaOLxcJZNTOthkJxiPmWCYLbWYGWYIgL+b11iV0xh79qsOT3PflwocuyhP/rC/rKGpFjy9d+D7Rykn+80aLOlNymVsGJD0wVI/819bIsjFYhYK1HZwzS+qsc8froo8swcxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759259938; c=relaxed/simple;
	bh=izfbnzlzSyjBSv5vKdO4GxMyF9X2UW2sAFXPpyZQvlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1vlO1gyaoiQGxC3dHP5sOx7VlfQUK1LwW4my0Aa5b1soLGaunKecxtr1PSXHhfcrHRk1g8Q1MXXhtd4ptrzo9OmxXeOGaQL4FmcZZ8m5PlwIhVWYChIek+McXRB28XaqeGV2opL3kmcgEqlPAkH+htbWGPGu18TGsdx+ZW09Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPwEgfA1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBCE2I016877
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b3HSSCY3BzeouIYSvqAMslq5
	J0hpPQL6K38VBvDOEEg=; b=BPwEgfA1B2X2gh/SfacmCPKY53mRKPlvNRRKVmhL
	lNVluS/yzDR6ofN8nWm1y/qVGKeD9g8LUfcBj0l0azpeqqmOAbw+QvSNrtJn3uI4
	hUHqOr6Nd+SukLUatW2P+R4bhRmh/HsBVtkvF/sTyuQCm4l8toHx1LL6PLTMzZVf
	1WWuaq+P604dPZcupkl+ixqchTEooXN92CEbkJqXBKT0GkkWCZvG2rvESl+yVSpw
	hOUZ88ExiH0L9vdu0bK2xgcdZlqwd7SwAy7d0FG/G9bwp1z0kv5BQNlk65waM0Vl
	Fw2T9oBF6ciPrwvsEwwsg9tp0zSBevTKbhMHYE7/K2ThvQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hhx4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:18:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de36c623f6so117979371cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 12:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759259935; x=1759864735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3HSSCY3BzeouIYSvqAMslq5J0hpPQL6K38VBvDOEEg=;
        b=DEhc4BYSyJd0M/M5ZjPXS6M1n//+o3DNMUVl6INlOTGrfYzQHwctRnrmK/KLHKuXEX
         g+xmSGJE8Vt2nXs/n6+Mq7XyhCBye9L9JybUhj2zfe1Qr75IICo0u/sOAuY3HsnDdBOV
         qzaWO9pvtGxB8tfW1rgsXPk6gvs0xp+ZFtzHBX8S3CqYgT+uTaImgXITH+Z6+TWUXV+6
         psIglzc0Ay8xwK5lOdNogTxjY+sF4o/YfK0y1faZ/4+XMl3GOIRl55OlHvx03guRwAej
         YIdFhecdqu7OF0AAkXZqPOFr/jP2eqWpbYdrvQKNm5hshEk31gjUatkOHrvjdCaPEupc
         e8Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUEfhT5oAsWXZXspiMItLT6S8rpHGBzVO06m1Eh9jGuQxuponFccAS4YmQQHElWlKYiG+yKi28pubXBoeEi@vger.kernel.org
X-Gm-Message-State: AOJu0YxcvgHHrD9Kuafxf1yAgBguBb/tk12nNY4mBEqndzRfetBgjsIg
	RMj9K1XnfPDb25VBTOEV7LpmC4N7r4Hc1Z4nl4nOW/QWF1/bZXt5RXNc8H09luqdynoRsvp/qyU
	1X462l1REHbMlhMhLlonR8dX8ydgkCd7bjIJbAwGK0TbUFvCFxCMZ+TWbUhc2yzOKebwz
X-Gm-Gg: ASbGnctNmZ5gtSMJDfJNqqOF8Np7Ufu4gqvufWs+k34rQtdGoxzSI0hxEZ4VxllMtEd
	Agsv9g0iBf+sa8rOqPJSUCp4e4lcY/BLHYaEBfmPVLs42yN4c6ZYpfLWYQ6TX1KrbXpr9ir9rvB
	FRBlx01H6AhV9+vJ3xe40qTlOwLa0c+fAFWLvDnj612iy2xny8VeYqrSi3B5frK9cZbfOkKnj9M
	mHgexDhGyRPwH9Ko3GqSgpNEjOqrHmv6giH7TDIDmHvVPLFHDe8KtdstPAcpJdeIUG170w7eF5x
	WB+92DQBuiYj30+TLBdgEj7pW11G62qGNpvwE1dFQDtsc2RWKKC61JNyix9TTiQgNoMquKTh4xa
	Y+tbN2L74dSlsLhzloHI2ynrFU1Il3SnRFXbAOQx6LPy37pBIGCQQmz2NtQ==
X-Received: by 2002:a05:622a:996:b0:4da:155a:76fc with SMTP id d75a77b69052e-4e41c1605a3mr12806241cf.16.1759259935575;
        Tue, 30 Sep 2025 12:18:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU8H+8JzMJ4Cr7XjJBZKwrmv2+lYNhsYSRGh3SqNZlsjTX2qbZYN49I9CHFceXFmguOAZDPA==
X-Received: by 2002:a05:622a:996:b0:4da:155a:76fc with SMTP id d75a77b69052e-4e41c1605a3mr12805841cf.16.1759259935020;
        Tue, 30 Sep 2025 12:18:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb486819dsm34339101fa.5.2025.09.30.12.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:18:53 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:18:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Xilin Wu <sophon@radxa.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 add HDMI nodes
Message-ID: <o6iqlu4wuz3zqzkyqrp6nc3r7bi7uftjzmyjx3yvcglmz5sdfk@kbv6oacs73qr>
References: <20250930-topic-x1e80100-hdmi-v4-0-86a14e8a34ac@linaro.org>
 <20250930-topic-x1e80100-hdmi-v4-3-86a14e8a34ac@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-topic-x1e80100-hdmi-v4-3-86a14e8a34ac@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX7u7+shHOMkcE
 +d0rabzJ2HLxQtHl8tLc0apTFR8fqXR5CF74pUsr9z9oh0c9du+S3TOr/qa0TZ388jJkChR13VT
 haF8UZdDgXeLj0/fDhWTgdM+7L3mCo8oxJ1W2IkvgjIxHaERRvx1x8qmq5azxqAhd8tFheG2gxh
 tkiMaW2YyiBX/etDX4ouvrEA0atc65UtFk4VPmOKjKuXpqnhmmfiD/HietmbOwcQZlIid1Ihqx9
 J+dqk5Td36XFEhQlASvkwHzACdj6JN57E2Gj9l4OVhROC9U/doGoza2VBz3MxFYRb1WdSRkmrYk
 zu9ijk8ONU8NmOtZ8I8HR/PY94N+W2qBA8XejxoZ2c4gB4CNFdkXQaL94koC13ENXBk5IQOyJwF
 ++72ltnbdpQecUYxgIAzJH+X1NQaHg==
X-Proofpoint-GUID: _M6sZhjYyIf5k8eJxyxeYNFO_r6R-Q9g
X-Proofpoint-ORIG-GUID: _M6sZhjYyIf5k8eJxyxeYNFO_r6R-Q9g
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68dc2d20 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mli57nIQh2RWQkMICy8A:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

On Tue, Sep 30, 2025 at 09:39:49AM +0200, Neil Armstrong wrote:
> The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
> connected to the third QMP Combo PHY 4 lanes.
> 
> Add all the data routing, disable mode switching and specify the
> QMP Combo PHY should be in DP-Only mode to route the 4 lanes to
> the underlying DP phy.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 81 ++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

