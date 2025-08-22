Return-Path: <linux-arm-msm+bounces-70363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC00B315AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3FFC5E6572
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5C52F6170;
	Fri, 22 Aug 2025 10:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcBeHyNV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2622F6167
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859498; cv=none; b=Sm43ShPNDMHrSHpKqkSteQ8a9Lnaxdyzaiw0gXfPGHlv8xyZciRSjOdGCBeThkwQtsi4qeJGUnDqC/XkGdVsFLcoe1cm/LlYl88TH2kJleSRbL6FDrcmgJ2ViPYkv109YpCliOTeGrPAlt8g5YEdkAX7pJKHUkv0LjP2SuiT6l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859498; c=relaxed/simple;
	bh=nZzxwP0Hsc/IHFw0nzElyMgbg4+rGKdGGWqpw1ppQ1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLJFP/lOJyejWkrtFYZwk3EnDQG8wMO5hb3tr5/fv+mZrlOWUIAAYz2t+XDhTzz2zJhZASs/C4iz/uYkHDmX7PIXGDZ/1ZgnyymqqUlg+TqJv01TL0xY6pQxSbL889V17oauKrE7C2UhzZFpdcnKp7rb/fz8AbNIGftHGYImpAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcBeHyNV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UWuc028822
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lmNVcTpjAV1nhzeL+nalxePs
	oWj2xjWiKsXUFteXNCk=; b=kcBeHyNVZtnpUysuyO1LTNgQmKScZLn99Igiu8qn
	ICjD4Qy0TDygzQTam50Ri3yLKCwR8EvPipichxtWq3gnoAawHYV1HlgCgG0RTVUh
	LrZoaHULq+ToG0CcWcBztdhBdf0iqFcNTvvdPAZ4r/8cSgy3W0ADPzkLvz4UvaJ+
	4mYtyPrREea6Xh9ECT7+V1DBgBzQEsjCfP3qs7FTbjOBiWPAvND6daEIY+CJ0Ab6
	HEgL8kyOTu1AxT4WywlJ6e77IY1ZtXpYf4k8fX+0U62Tv0PqUeRSeMyquB1xF82e
	AIQWMakQcWup336WiBbwFoVg9T3+9gkOv+uymKAI96FxaA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52crwqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:44:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109ab2cbaso45449961cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755859495; x=1756464295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmNVcTpjAV1nhzeL+nalxePsoWj2xjWiKsXUFteXNCk=;
        b=tpZnxGL/Lgf9PFDXLFcYqYwQA5Q7ESSAjE7ir8CVp1YjV32kQnh8AUlErhV00H+ly1
         m9TszT7t5eB3SyGa6c0JQh+zyRKa7v4Hv++0kum5f3t0D/E5m9LpDMmvrwDGMFLmdHTs
         YbrCWIo7+rMeAuubhZWWDp3Rih3/paR0/zRPdTZFs1CWokkEAWgv17c+nit3/qyg292p
         NYtrTEQRuq5GhDW5fQkhH4VhlfQXW5PQ0zzlpes6MEWIYQMsoTWvheV6jtnw4xYSAvqK
         cWYuvwKhc9cArvsiBmWH+6PID9q0ViFcEqBunkoqmQaKOMyBGKAwWegllE5iGphwePON
         t+Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXgIU9NAXdZqznZb1RVLcmHjvXwOQ1R6LCKaCCW2gXGpZOn7f5tNNkqFPaTJqgbL2+8FkFKus7nWgEIjpUb@vger.kernel.org
X-Gm-Message-State: AOJu0YyvXUcvA9QCtlYJokIickGNhPLGlQyKwRQjPpcBJHc6jZ3SpinD
	48xrEtnLicdaSnEvjlKIWOmAS8M7jY6u5q64WHUDV8a5RoBBQ7cZXIdLAeOgssSKfZNugcrq7wx
	r9/MrNhQ4I3cnlBm6G2zUmVM6qDJqc5uXby0/MktbxZftPJIgoP33Aye0KAzj/XwiQ4hhryNSWo
	13
X-Gm-Gg: ASbGncvW8tXxcWgBCZcLQnqy/tVShTczGgGmEexoryk+ThGfPlH5tYvMZ8cIZRuo266
	Z2jzn7lzIuyGzPxEHX6T8rvAIAGYOjzoGJxq2lNYt6xF0cUyUWA0SQdCH774ngMKrUNlz4mBgVj
	+WoO8jd30lLWljYdZ3aJCMZXwyp1wbNwUSfLlqswFC9NnUsxC8al+P6DmhSWzUEw9RGnYSRjqGV
	64gMPNPySLAhf/bjh5LRI8ZaEzXAP8IzQDDw3fbwmFhiuFdl+QRO4X5UThz79Ob63hptjx0O85M
	bc9EXTI+EkOt0HF3QkyO19ImvEUtx3Udb41enjEKmKqxRy1UygiZRh/r4BnleKbqenbv/MaUKum
	Ce6XCtmawn1f2Z3Tz/bwv1peqWCmlgE2ogikOx8OehFxQ+xkL1UnN
X-Received: by 2002:a05:622a:60f:b0:4b2:9e77:9bb9 with SMTP id d75a77b69052e-4b2aaa811b2mr26567641cf.30.1755859494895;
        Fri, 22 Aug 2025 03:44:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFog8hLxW55shQRKXd7SdZ+Rk5sW9GHijIx83QeSTTgsCWBAkK+lc8RpqkP2N/FwKrhPxPRSw==
X-Received: by 2002:a05:622a:60f:b0:4b2:9e77:9bb9 with SMTP id d75a77b69052e-4b2aaa811b2mr26567391cf.30.1755859494295;
        Fri, 22 Aug 2025 03:44:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a41e0c6sm35472501fa.15.2025.08.22.03.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:44:53 -0700 (PDT)
Date: Fri, 22 Aug 2025 13:44:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shashank Maurya <quic_ssmaurya@quicinc.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: lemans-evk: Enable Display Port
Message-ID: <4pp7emxj7fbc47k54uhsbgmom2ogltgbm4srug4fweu7ejakjs@ggaszwvc4iiz>
References: <20250821-enable-iq9-dp-v3-1-8c3a719e3b9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-enable-iq9-dp-v3-1-8c3a719e3b9a@oss.qualcomm.com>
X-Proofpoint-GUID: ebUKXnVrw9QinGPG9KDGjwyCwEigikqo
X-Proofpoint-ORIG-GUID: ebUKXnVrw9QinGPG9KDGjwyCwEigikqo
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a84a28 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=MzpP2GudIQyLNU4cacwA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX67Dc4Eu9zdMc
 cKYYhVixA1FQhU0A5NQ0AkyYceQkVn/Kqyzo141NaKQvV+iC8ujEjAZQXePTwkJp0vK5W4kDvtA
 aSYei3fQqhFUl2v3hu+ENIZjoSvG4jgOy24aV4ihCS3gHI3otsv8D8eM4KUoEmiymrmayor+1s5
 nYvVEb2KwTKv+0o1I5+YV0fojo8yDVeJXQckAylHdnjeGCJrS8eePaHGXoi/mFUXe2nzIIXC2nz
 EnuVDCS7EwZzv6xeMM61ZKY/bfH4iiz+neo/6mBUgWYULQjbJ0adV2N85IOimbyDXtEtTsAgEdc
 QteUI6J7pCKK5ozJMjWoy9sPKpDX+RNFs/I8VD/EmwxT62g+aYXUw7J1rIpzPpveYfBq30MkaF5
 sTOfZ39CwfRk3OrxsizBcuCtlhcfmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Thu, Aug 21, 2025 at 11:24:28PM +0530, Prahlad Valluru wrote:
> From: Shashank Maurya <quic_ssmaurya@quicinc.com>
> 
> Lemans EVK board has two mini-DP connectors, connected to EDP0
> and EDP1 phys. Other EDP phys are available on expansion
> connectors for the mezzanine boards.
> Enable EDP0 and EDP1 along with their corresponding PHYs.
> 
> Signed-off-by: Shashank Maurya <quic_ssmaurya@quicinc.com>
> Signed-off-by: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
> ---
> Changes in v3:
> - moved pinctrl nodes to soc dtsi.
> - Link to v2: https://lore.kernel.org/r/20250820-enable-iq9-dp-v2-1-973c9ca22474@oss.qualcomm.com
> 
> Changes in v2:
> - added dp-connector nodes for edp0 and edp1.
> - Link to v1: https://lore.kernel.org/r/20250711-enable-iq9-dp-v1-1-6d381e105473@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 70 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi    | 12 ++++++
>  2 files changed, 82 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

