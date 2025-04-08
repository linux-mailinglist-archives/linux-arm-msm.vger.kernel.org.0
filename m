Return-Path: <linux-arm-msm+bounces-53515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB83A80334
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 13:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D8517AC62A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 11:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4388C2690C0;
	Tue,  8 Apr 2025 11:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AZqDagPC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F8F268FEF
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 11:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113071; cv=none; b=R/o66SFX0ETKBR1UuIOAOHzrEDloNPUu71JXKuwVZAa1rPiB//9OqRl/PAomtxB1yLCfTModPLGdvsxq3tZb7KwNlIns9kUGQLHjlK2sGR/A5k87xpwk4QLQjAnsCMCxUK33t6G+CatelaHHDKt22TSHFJc06nw8PF7aHczypoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113071; c=relaxed/simple;
	bh=WrOT0fWauBjGgMOhnAMlyy7tZenwL+/tQlGQFVKiLIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNEqNLdsf8N5zIq5H+81gRP80sobYzVSbbLK/LLK5b1+zc1YilzFOT1ysKLnUQqoVyC3sxgBTOPDmjhPiX7Na4yTYCN60mht/kuno4OMADf3XMPHYIzzc0c5AOD1P49hmd+d3J0vzguvhceJ9Z/U5gFWBhkrMDz/odbkxMtXNfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AZqDagPC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BTsmP001053
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Apr 2025 11:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IrjwLjYpiapL2b4NcQF3cUbc
	sBqpPx7YBP0rGh6mfWo=; b=AZqDagPCYqZnHbZxphYPaTvDUdzj//OxPJQF3MG6
	mYlop+sdD5AG/ebEqB+Xw4Ra8O2OP+DOHDdNZqZWBoN8cS9gm5P8nPodCJYsxRlc
	3zfq/v/qCqGwUjv7AkPRyYiJFEAI4o1jzG6nb80NYblysP1Ibr8cVRT7PnY/l62S
	dpLcjReSj2tolCOXRLw7ug8wCruv1zQq0cHNy14YKbFxRbGDaehHuGBqnMaxwpsE
	hdoPUH31p7k8wT99Fe336jhcdrpkHu6RrZYd+a9lE4PMeVrl7rcn1U2Kmsrvn4N5
	1hTnkI/HtLouIic4tWrocBXPz26dHNDYJqcDSvAt/pzZzg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbe7nuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 11:51:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e913e1cf4aso151871806d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 04:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744113067; x=1744717867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrjwLjYpiapL2b4NcQF3cUbcsBqpPx7YBP0rGh6mfWo=;
        b=BnS5QyZNPfmbIe3uOkR0dVR8JmRsGtqrxhVgt7Gfltm7I5hkQ6A7Zp86J11IYaY1Lp
         sSRoTphFVnEk86eXiwoaN35Sj1D880vmBBH44ixVCIUTSnsiN/tvSosMwkqboP6C0Hdh
         LbZXJuharGnP0gCONQ3APAYeMuv/sHyUGp3+2kaiWBLaqa3LFrK7hQe4Lo09KHSZnFMD
         PiykP3xXC2lnAjJADFhRdYiTfmVCtCVGPowwulfMmj8thLsYsu69pO/w5XpFHAoTXhzm
         nx5R6tIEQsF/cqmYsjhmHQtY5Os5+M7Z8R65Dmwg0Lb3DNqkOYjr0Ew9Y8GANpI1RTnC
         N0cg==
X-Forwarded-Encrypted: i=1; AJvYcCXREDa3nveeNxr5/NQgX4+bzfdxYc/IUILEZZeFQkZDWSBT89GeKnmoz1X0Cz2/KHg0mbm1recGvspXswUg@vger.kernel.org
X-Gm-Message-State: AOJu0YwQf4tQOP1D7tGjBrzfXDGzkXLcbG9Ly4Q9Vl0M8XBkKrR9pIjL
	AKlwBwVKbkZNoIGJVujTK0Fte+aYDIDHUSlXuFM4/Ut0NfF7jHPZmHHzOxunbjGPvHja1K8LbUw
	h5U8y6amlQkWw4/k/B2d7D8TMrFjET4NtmBnJyGwTbFLi53/+bKxhHs5nMV+Kah2j
X-Gm-Gg: ASbGnctLKHOAwKLJSnbb/rkkAA8TZufQd4evO9J/nan3s+kbRl/Y3/2Q1DaX4RqA5cv
	7105tlFpbU7sO1aC2Z8KRBsYoxqWKRZCRkbbUN3GlITbnk5lQwH4kGIk9WsbqCA4Km9vdn8e6Vf
	BeXcOzHvwFH8QU97LKEiazaBu47mL+PJE5ZC3sjeUQcR8RhxPlGb09WXqcRSYpUTASNL1F7Cvvo
	vr2sJ0fC0LKx7wYvRDYLNK6EAEP0m/WG+6l76fBsUUMiUPbzkVdVCvUqdw2bCP69x3+1ERWaKJ1
	Q4pxrA2uk6PBZnn14MQU9+N10jjdhM+TCydsu46KWMENJ5lico/iyeVQIm+V9c6AmUYKjKcHELP
	Id7g=
X-Received: by 2002:a05:620a:4112:b0:7c5:5003:81be with SMTP id af79cd13be357-7c774dff6b2mr2505652985a.43.1744113067457;
        Tue, 08 Apr 2025 04:51:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF52By5kac/rDpLlGHlXOuogfyGJx+/C5ZLmzUghNaX2ahTZuISYrkP/rWOpZVqkkWN8uhxQQ==
X-Received: by 2002:a05:620a:4112:b0:7c5:5003:81be with SMTP id af79cd13be357-7c774dff6b2mr2505648985a.43.1744113067056;
        Tue, 08 Apr 2025 04:51:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab889sm1498254e87.11.2025.04.08.04.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:51:06 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:51:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH RESEND] arm64: dts: qcom: apq8016-sbc-d3-camera: Convert
 to DT overlay
Message-ID: <gbhlmjrkh2mavymxivli6c2wknlwlgt7nv3hch4yixufgmhldg@dp2vrwckqcoj>
References: <20250408-apq8016-sbc-camera-dtso-v1-1-cdf1cd41bda6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-apq8016-sbc-camera-dtso-v1-1-cdf1cd41bda6@linaro.org>
X-Proofpoint-GUID: qkLr6m-6FgiqMq-0wneAvV8FI3fYWgBU
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f50dac cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=j8Cu_9a8AAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=_dBoWylQQCh29UQNcWIA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=A2jcf3dkIZPIRbEE90CI:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: qkLr6m-6FgiqMq-0wneAvV8FI3fYWgBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080084

On Tue, Apr 08, 2025 at 01:38:42PM +0200, Stephan Gerhold wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> Follow the example of the recently added apq8016-sbc-usb-host.dtso and
> convert apq8016-sbc-d3-camera-mezzanine.dts to a DT overlay that can be
> applied on top of the apq8016-sbc.dtb. This makes it more clear that
> this is not a special type of DB410c but just an addon board that can
> be added on top.
> 
> Functionally there should not be any difference since
> apq8016-sbc-d3-camera-mezzanine.dtb is still generated as before
> (but now by applying the overlay on top of apq8016-sbc.dtb).
> 
> Since dtc does not know that there are default #address/size-cells in
> msm8916.dtsi, repeat those in the overlay to avoid dtc warnings because
> it expects the wrong amount of address/size-cells.
> 
> It would be nice to have a generic overlay for the D3 camera mezzanine
> (that can be applied to all 96Boards) but that's much more complicated
> than providing a board-specific DT overlay as intermediate step.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> This patch was already applied by Bjorn on Sun, 28 Jan 2024 11:45:55 -0600
> as commit ea689ec32bf0d885277d3f58450a85df5149c98b [1]. However, unlike the
> first patch in the series, this one never made it into the repository for
> some reason.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/170646395036.64610.14333204830178417809.b4-ty@kernel.org/
> ---
>  arch/arm64/boot/dts/qcom/Makefile                            |  5 +++--
>  ...ra-mezzanine.dts => apq8016-sbc-d3-camera-mezzanine.dtso} | 12 ++++++++++--
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

