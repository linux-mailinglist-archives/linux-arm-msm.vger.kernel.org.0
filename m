Return-Path: <linux-arm-msm+bounces-87862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB5ACFD6DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 821D53015950
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0373B328B72;
	Wed,  7 Jan 2026 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cN0gxQdo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqxYbHVe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA51328B4B
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 11:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785895; cv=none; b=MWSUVsUpYWuFXndvXfNYaRfh+RVsODL+4aT9GpLbl7Dzz8c/0OTQ8TWlCdpvpDNH4lGn+E8N2o3/MhoUZ9uWTBmSe9y1jATu/53PaTTUJzRZN5kBQnNY6a+me6vcEee8jSulyuhZmjuCdwvyjnv59iYq894nAS3BkyO1zFcmSuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785895; c=relaxed/simple;
	bh=cx+7EBQM1YTPVpHqKevtowrYOtDFBVJ1EtQHm1epcKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oku5homARas/t84rgUEnqSGp9BVMawAq/Vw+Yk7a3MoTveoJniMUMg7ahAFdnyvIlPx/H6nJli4rS//7TUnqJNlmfEHgSmcjL6gV0bE7UjVSzE5MS90cguriaOO12pSd94b85hRGj/PiIps+FaQHliJvnFpuza0ymX4M1EDeC+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cN0gxQdo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqxYbHVe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607BKD3q1643003
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 11:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hHrWLmSLNK/AuxYZ0Fr323Tc
	qsIbmfwjvkMStothfTU=; b=cN0gxQdoBXNRBUGFuqRgxaRlBzprukYD5lYhDHbh
	pJCKSwz40xcwrwqkily6uh/EgL6nWBzkttz7gDMRrpeKgjtrl+kIctX4StnKM5Qr
	xE7dqdZXJKpjyP4HNVph54Kvu/feROYEF/2Gp8YsWe60Fx7NzqIOrJnAwe3iGOj/
	K6Q4znLDh1EU8UfdcpxuptPmjlECc5h7m1dhVk+lIbXNBpm3iJZggY+dBSocYQEY
	G5MRM6bFnP8DkR7MTRaidB986Sgmu3O2uHLlrX7hriaJIqu9v8U1HOeWAEMtpJfN
	EoDaq/XTcuPiHUOhd77u1VX3SsZoX99igl7TWD3kNc6pvw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhgsfh89t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 11:38:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ffb4222a4eso20629661cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 03:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767785891; x=1768390691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hHrWLmSLNK/AuxYZ0Fr323TcqsIbmfwjvkMStothfTU=;
        b=fqxYbHVeRy75PAvfbrzso7pYOQEDk+PsGMH3aHXnG1ONTnLBFhe7AZyiuK24Qg9FXo
         4Hx9rzwwDn6nvnNCzuC/Ob7FwI8rE6bw54cuucoomkOcejZlnXjdE1VMMd4BRhG0+jcR
         nC9UGKVXHBDY6Fcn/ngBbjBKVatvuQ5jTR7oHX1AtpIqUkmRPX8jSj1VUUAbWRExQAqp
         2V98jG75CBtWlrCHK+SbPwpGTeVO2mIo5XGEgyC9W+lCWqMGyWhG8aIFfD3cYvJ7f/zl
         cKOjX7ACj0z/59lKcmrpWwiitZJ8E0zuta5vZJXzccnLVo5mx714MDoPmTKHbmPEVT6u
         5aNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767785891; x=1768390691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHrWLmSLNK/AuxYZ0Fr323TcqsIbmfwjvkMStothfTU=;
        b=fyb/k/pFMdUzgk/TvE9bTbmu3SKDn5n/LlwXTDJgebwWpCWB4x7Em2gMYLl/YNIV9w
         TgIks5+nl1qvPNlPVnTZD1JwRuNWV0CJOx0Xl+WvbM5DRj34TNTIWTq5tTIoz3dP2C2Q
         5QUHuazgd6xrM5bUh0XmOdKQjZqZ1TJ8neUAxdAoNqK8jy1fNC4WmuH9MXcA14+YGto1
         bis1s4of9PBn9TEgNPhszyXiqrK8dvR43DN5/EJY4O2JZ8uifwyiVTSagN7jdskFE9Qc
         oadoaqZYgrfdixOr/pmjZ7X8nPkjWMFbMXbPtwnNh55W2lq7JIkge5aSNUloyIKuo3d6
         YziA==
X-Forwarded-Encrypted: i=1; AJvYcCW+6xKwdY0fztfwsq2OsomtxaQCxykEeW8AUULCOWEF/f4heaMgc7QRRMuL/5UWvzmwyNM5u+UQXdOggpto@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyf5ikJq0NZOLwlzLbqGjW8SAmhZ6FNDXNkhY35oycYmRKp0+8
	mWahShltlHb9XkplfSInVMS1dXmKo0DpZo0BUXUIbUSzjTl+OFXE/zvChR7ZmgwOsgaKKnGcV2+
	4P7a622iUmjJDNY/UQM8x2jtFaj1m7ORq3ss6S+bIPDbukrWJpbwfsTrKhjaCbMZXEUWB
X-Gm-Gg: AY/fxX66eduJX4pnNosYjvuR9qGhNqDs31WiG3/X9rH9DYesdBRpAGIm83c6hZ2uO4r
	8P9IqmVV3V8Hlu7Zl+zGBzkGnPMSHIdHHuUObHy8qdGTEOPPbRQmZZvpAWm9YVligEIS7XgsZ1Y
	04HWN+06JHEg6BhuUD3AF4fYLdpBDjs2ULC+Nn9bhb+oW/m+JQxoxPBxmEIBfoxmsChJC4kFi5+
	3G5xJBwUIB6gBEC9RbBuh5ylTOyp5hLK0wyY3GdkBNC2J3TYztLrLC2GoKtM9iFK9+7OJp6ic58
	bwtsN7DS+lCAIOlC6zwqx7TJBgU0ICJRd4I0RoPgc6XaSWpt2aKXx/yp3TNMdDKXJWUxEXk6lAy
	JHp9rkg9aM13q7mBqoxy6wcSlfoEczL/ITl9IqzDkET1W5dkZQainyjcv9br1qA/pGc+xRHHj5a
	BNcfk7DwWjffnb7KtoeNpbmlU=
X-Received: by 2002:ac8:6f07:0:b0:4ed:2ec5:acbf with SMTP id d75a77b69052e-4ffb48a85c7mr24563571cf.24.1767785890967;
        Wed, 07 Jan 2026 03:38:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHssrBbLsPN63EAqbkxOs6z7YlYy0fo56gNVYCJ+4TuA8iD6IDnXJH7V/amJMkJBpE+nIYMmw==
X-Received: by 2002:ac8:6f07:0:b0:4ed:2ec5:acbf with SMTP id d75a77b69052e-4ffb48a85c7mr24563251cf.24.1767785890529;
        Wed, 07 Jan 2026 03:38:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b715ebf53sm343531e87.76.2026.01.07.03.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:38:09 -0800 (PST)
Date: Wed, 7 Jan 2026 13:38:08 +0200
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
Subject: Re: [PATCH v3 03/11] clk: qcom: clk-alpha-pll: Add support for
 controlling Rivian PLL
Message-ID: <jffkujjicjljsyqfzu4hotjetlfcextw4vmmagjxya22tshol7@buvtkrkmttos>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-3-8e10adc236a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-3-8e10adc236a8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MiBTYWx0ZWRfX+1yvAhCNgktb
 JbxZQ6nlPhYJqjoSulGX2yuVWUWslOmfFH20qp0mSbNw52m/5KkNJsvy5iBClwGCtQX5Ki9lgbr
 QnEk8O2zxtNKbrvVwl8vum50w48xw/6QhYeQx0trgHTX2U0CtVVNUCdXkHZS8W/xlYTr7op9YRp
 0zTy2VHoqHyIER0f+ZfoGnnbNcfJfje4ej4CDKlhz1FLdyoCzNbJl3g1CuGNi8p6dWeMkA/06ZS
 VxkAREf7S/pML6xaE0ziYO/HHKZrDpZYqND6FnrVEwqoEtM4olxawaaochqUXlJYd19d2wdlfJH
 +m29futJia4zh9kZXXD1AJ9kVOJOtrTCPIo0CoFtLcK431lc57/jteH54aWTV4ze7s95mYSjVRG
 3MM1DgdmNugxsMNOS3ZelH/fnkG7RK2lR3HsZbBsqMPP/lOfhZHy/TUiGhL09sYisqjOQ2OtCtC
 oXgX1mSbg87grNelHJA==
X-Proofpoint-GUID: vKPoWfLuuKszrKW6hCQJZ1myt1Y88ajk
X-Proofpoint-ORIG-GUID: vKPoWfLuuKszrKW6hCQJZ1myt1Y88ajk
X-Authority-Analysis: v=2.4 cv=Abi83nXG c=1 sm=1 tr=0 ts=695e45a3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Rar_LHnIVK7gKg-YXgkA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070092

On Wed, Jan 07, 2026 at 03:13:06PM +0530, Taniya Das wrote:
> Add clock ops for Rivian ELU and EKO_T PLLs, add the register offsets
> for the Rivian ELU PLL. Since ELU and EKO_T shared the same offsets and
> PLL ops, reuse the Rivian EKO_T enum.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 14 ++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  4 ++++
>  2 files changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

