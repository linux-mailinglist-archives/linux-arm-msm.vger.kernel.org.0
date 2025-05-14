Return-Path: <linux-arm-msm+bounces-58005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40760AB77DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EB839E40B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA49296704;
	Wed, 14 May 2025 21:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLAB6yeN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549B0296707
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257804; cv=none; b=Iy6ej7x5UszECXBRLwFZsttdStAHAwl3snJxIwqywsWJdOdmrtG9JYX6Vpsc3NjH/fsDfUu39hWRGmgy35VzjtCb47kjxKBSVxPDpQx2i03Lxt7byR34bGD2tpuPGGUCH7YnI4PWoJFCyQUqppOMALyZ955/QUBHJzHjmGCTT7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257804; c=relaxed/simple;
	bh=EyFHYmawDsHmKWz0s03ImTnfgsZtZdH/tEJm1DPqlrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYbe2nUOOf52fDvn4hhUU5/Tgm9ylnr/ZXjVvPxUQinoNw+u0qMn5eEFAXtk4Y8cxQ9czAhq52erDIPFDOHLDfyoWHao7VDVTVLs0TZY7ficwbpYRMoYutw01nXjG4rDI+i2Q5mH80wHWiXWijSnnKSJ3cvqzVDZsIyblr0dmjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lLAB6yeN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EHwYx2015921
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mj/Qz1xUZrhHvcNTBOii7qww
	2wIfBNbFUlMQ73vGEn0=; b=lLAB6yeN31GjnivygSuhKjuA7cozJw2fT8ch/M5j
	KprWIGx+InHADt0gskFhP4MKJp6xhi36Dv+6SSquYpnZTVcAIrVbOtRXtdkLLike
	0GvC+KG7OsVNEhJkbownjuuKjUQ5QBjdLpHghcCjEimZDnDUFnPQnN0FHIXhm4sv
	etfIkUB9eYQwo1vwWflE5t0B4Gl9X5C9wD0yAa3h3+gLXVQLWFJPThrQJEaRo/ls
	QQX5+iCqbcdHi8ao1xVulzAfWqTYpd/KyaZLPdKV2wb8HFnvdfRKaoqMz2WNQvQH
	UzsWGK5q0wXcFNh6bbV5T6+SbaEw3aTOcvooVQTSRLmo+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmv76y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:23:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c955be751aso43447085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 14:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257801; x=1747862601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mj/Qz1xUZrhHvcNTBOii7qww2wIfBNbFUlMQ73vGEn0=;
        b=lhkJXJwgmUCNzuCBnUEQ24a04/Wi9y0jFiOqT0iI+YcEFhmzNf/zcmXgpSpwuD6E0W
         IRDCcZ98zqafAT4vMF68ImdmosxBs1wG9clTsR6oCzeyFjeFC332Xwi5Xg/qoQckE0n8
         yFQuyrz/tGbL3v1yuz4gzOiqS8/Ki+izg9RftCyNBxeH61VimGtePxUyv05ajG+dHlCp
         j/STf4qacI5W61Gtk5WYywFadMOXD0cpoZcbTQLeCymnxWTsyfP3XegB8zWhjhHPXkCa
         YQGWDJTmH9z+GJBGdg1Ygrvt0PE9O4LAuMgO9Sv3WLEQhcFYR2s5L5QwXKhpjpfxzF+l
         Brgg==
X-Forwarded-Encrypted: i=1; AJvYcCUyE54Fm0ZvRNRMT4gqUolvuzbTJ/28etGXHttsXVAarh9vBO0ooe8sFRrqHQKJe3F2/cBJuwslOU7ntVdR@vger.kernel.org
X-Gm-Message-State: AOJu0YwrhKFh3RGt5KG7+K7FrFhmbpLuGH7LwGEv/E3UVZDnUx9bJsTX
	IiVeNvKgTHoI/2l3DhivNS9wut4K2sdrb4XHTnnMOdMjBDuiCSCxhxq+i/sLGAS3DGNUJtNRUqG
	dXhMSKKk9eM2drYYyZ5AsLO4sybqMXmQSZ7rym4jl6FqdqAdqLVo+dhTqcTHPa3nn
X-Gm-Gg: ASbGncsd9FzKEFcgacM3xfey5U3EjSbAlkZycaJ4vKQwfiWmE30AfFq3k9aEzW8qApr
	z35hAwB6iDOwNSLWgxJhifZAlSuMyxDNe5RdVZwB2a8H6+30dom97ISFpma9EsHI2/RJwDkYqNP
	3DhtxjDWGFJRw1+4xcLwPCDcKVlI63ABKcAxwaOUyWuLjpkgCgNswH7R1MutiPW28VnsERB4ecm
	I7cd10A4xfX4jPGmUzjWq2ILqEF7i5nguF3lpbyuX/+e/x8s5OsDB8sOEOQL3jJ9v/LfT10kwym
	E9DywL8fXI+N2pKchKlSa8jlQRRem5GqhR/5j9GvP4x01gOcbz1E2K4YBI+iEN9yO1bi9UONUgo
	=
X-Received: by 2002:a05:620a:1a0a:b0:7c5:aec7:7ecc with SMTP id af79cd13be357-7cd287e10ccmr787436885a.13.1747257800853;
        Wed, 14 May 2025 14:23:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmG7Ith2nDW7+gN5BCXeJ40qkWZAYm0kLVgIJGyOikn/H+ldKhixf9JhMX4xvT40wy57vdvg==
X-Received: by 2002:a05:620a:1a0a:b0:7c5:aec7:7ecc with SMTP id af79cd13be357-7cd287e10ccmr787433785a.13.1747257800520;
        Wed, 14 May 2025 14:23:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550d8aa7039sm314977e87.43.2025.05.14.14.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:23:19 -0700 (PDT)
Date: Thu, 15 May 2025 00:23:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 16/18] arm64: dts: qcom: sm8450: Additionally manage
 MXC power domain in camcc
Message-ID: <5zbpbn3f5snf5dbsbp3vfbahnjtreoqdalg2n6ddqxfocnjtpw@6khojzihn2mn>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-16-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-16-571c63297d01@quicinc.com>
X-Proofpoint-ORIG-GUID: ra8oeBvmV1hSbe6BddhbHKmcmMyPau1D
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=682509ca cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9_CkSsT5FSWxdIVEpLUA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ra8oeBvmV1hSbe6BddhbHKmcmMyPau1D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5OCBTYWx0ZWRfX850otsxmzpbT
 qPThZj3Z/n53kkUWaV700o7RJq2VZIEbZoDQ2fwDCqLDaXxkTNrcnc0CnQAJ5myZMki06HViDJh
 MEywhB0eB75nmP8PGZtahiSDwRmwXyZ8crHb7WJr/QhueTodYsMi8G3AJUG3asqN2VLLnj9i+Xs
 LXRzJvx4qT1WEkyfQpr/pQvhOZXANC3Xsh07eQXTCG+WBBTrc9gTok/x4BV+jFS3txXMU7AGyKt
 LSAhWVrupyWQncwvyMgvtkjvIBPe5tzMVTIdEetv3hwE09zmoQYEuw4+8AZN/fg6SHyh02z2bJz
 l+vfmtOCey+KOyd4esW5XYtoMFROC6HXu/BNjtfxQaD3Akts5beRfdc7GMC3htijfj1l/exek3h
 6ASsBzKNM82WT6k9WbhmIWMpCcXaLTc/YaZ/QvOrtMs1C6y6ZBJtha6rARZV4FgwG2KZ4wlI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=620 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140198

On Thu, May 15, 2025 at 12:39:01AM +0530, Jagadeesh Kona wrote:
> Camcc requires both MMCX and MXC rails to be powered ON to configure
> the camera PLLs on SM8450 platform. Hence add MXC power domain to
> camcc node on SM8450.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

