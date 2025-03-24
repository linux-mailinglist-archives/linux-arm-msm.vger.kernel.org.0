Return-Path: <linux-arm-msm+bounces-52361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DCEA6DF7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 17:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DB32167CD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 16:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F529263C68;
	Mon, 24 Mar 2025 16:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p2y3ZJRw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77FB2638B2
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 16:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742833311; cv=none; b=Jd6BVCoZGi/tvkhfXLoTdVYFj48qU6UOX2gDVJjnmNkIUtYEfPWg5IDxiEi2BlVsHYrEiDrMrezIn0TFUGucJ/s9GAiC73+Cq5ZDzLxT65PsN0hQpj4Lr4okyHmlnbFqbSKFHQ0aXOggdU3VUy38Kv5PJWADe0Jbz2z548y74TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742833311; c=relaxed/simple;
	bh=G3ch8p16B56/OMBcoTpt+rlRb5rlx2rMrdh8cjqUYTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvbP+LZQ7irVA2fGvvr37KHIBBpCq24E2hw8vJepaRz4sm29WBFkPfZ2jzJprx1gbXGjv8j9QWB5yVY2dzmNKm/tEwRzLCAC6H90cATtkP+JN/xfZdfCyfBa6TPD9nzwN5Ir1Jk8tq6CmezX+UsdPLCyJRromuQVkkN1LJPSulE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p2y3ZJRw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52OCmY6m025357
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 16:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L0t9otsKr/6SRlUjYfCBbvls
	lpbDLOmF4pALHvMgpW0=; b=p2y3ZJRwdWX23ECOlNVeXX/jl+BaY5RAQJXWAsKn
	mFTJxQbqX6NWIpFD3eim276CE4gPVCUfir0AUbCOVsfd8xhQPnnkvUNuWqIc2SV+
	G1A07yWQnKEeXF+lOFBcZT3y8VvcOR6RRzlmdq2smR9vFPXVpiaCNSoeGmDzTP6i
	LFJfiwL0oV2cMkn4Y7AJyV5Qx56a5IAt4tIypw98d1LiX8CC8xjHAoiyEow4X2bh
	Lb1CWazYkSMaHevBi5bF/7GPsqne71+Rvf4IICS3G09gJ1QgahDF9nP/x5JoXzAH
	t/d4fAYQHFlNnPXyJBqQcZmyo92kw5VUUnI9vLOcY1umGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45k7qj8hfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 16:21:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c548e16909so436283385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 09:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742833308; x=1743438108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0t9otsKr/6SRlUjYfCBbvlslpbDLOmF4pALHvMgpW0=;
        b=qrNsXbkczfOj1fq0FhdjWtweYT8F1YrR19I59u9N1OC1SGk8RngPHs39hi7fiUBNpH
         h9lhn/dLLjwN7rliGZq0Hk3742/Go/r0SwP4wXGjVZe6izzpdMutqcT2HFKHYMAjmw6Y
         IGizhkUY9YfpkkYh/TDDF/s8IF7Bi3AuqeiJLLzMLS8jBYkqYruva6KnqW2SMtk8EZ60
         BYJ16h+G+3vAQelaBGcz05bgbk9i9Fxw/1g3VXgeEV1RlvE0xfi0jkcGXU1hxnEyDq8z
         HknrDdSHG1HGa5RmRjgpRuAa13ugwbDVeGg38L55nRAK/BT8S38pYtd7St4vIi7WRt7b
         sHlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7M0PzAcl0K1dAFguSelVCuQcnPoi9UikVhxSEDwnPstYV2V3rdqY8T6iAPrv4UqzJjlNPMDd83AsJADzW@vger.kernel.org
X-Gm-Message-State: AOJu0YwYLw5wLuG4cIfUHLlcBhdR66i+GB1QqufX86n1OQly79kbpXPk
	fqEdIo8AzWu+BPv28w7qzIhWTUSv9kKnfzp7PE4rKpEbFQ+HrTnJ79U8+qWmRyaBMEopepCytOV
	8oEJtC+A3YYpf/fcl1Pnfl4/hppxTSNr0PcMMX4uGDTsHY2mYkgD4JePgZkWmgg+8
X-Gm-Gg: ASbGncuZbJ3bZkn95fubAsN5eh15DUmMJRiGFyhO9Hx92otsVem7ZfjObPC8C/NWBID
	9lL2uljXJwHof3Ndo6j2wrBpIrf27A9BVyBG3ma1WOiHn8wn3kVjWwGNXlpk3CBrifKV6Y7d3Gu
	Q/RdaP+8WIKbTnKveu8jI1NpoWy/QqWNIyeS4vkafx/P5FdnGCOEdsJ9C/3iWn3AzP9ghgcjgFB
	FiZlTfrEepbRy7xQqEsAWs+2JqnaOOCIW/4gJrkCd1ZgJT05plySvTxtCb2S7nvbhcR04vJM5/q
	P5A7TvxQL7cPCeU86Jn/Xfen+UfB8H+6ZfGyxH7ksnm/d6+NYCQZl7JSxtQ9gDt+uMybZVUZVci
	y3us=
X-Received: by 2002:a05:620a:2943:b0:7c5:b909:fde1 with SMTP id af79cd13be357-7c5ba184669mr1763350585a.25.1742833307509;
        Mon, 24 Mar 2025 09:21:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqPuV+DjbubvDGus9CrUSechSUZmqelOcYU26WWWKdtMe4ZBYTMFrpi13dRZOvosPr+OQhKA==
X-Received: by 2002:a05:620a:2943:b0:7c5:b909:fde1 with SMTP id af79cd13be357-7c5ba184669mr1763339585a.25.1742833306260;
        Mon, 24 Mar 2025 09:21:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647b629sm1199719e87.55.2025.03.24.09.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:21:45 -0700 (PDT)
Date: Mon, 24 Mar 2025 18:21:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e001de-devkit: Enable support for
 both Type-A USB ports
Message-ID: <vefncygcuho2ga4aoatuq76er5c7euysndfdsreqrdvpk762tf@b7x6cu2frgbz>
References: <20250324-x1e001de-devkit-dts-enable-usb-a-ports-v1-1-81153b2d1edf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324-x1e001de-devkit-dts-enable-usb-a-ports-v1-1-81153b2d1edf@linaro.org>
X-Proofpoint-ORIG-GUID: VPwr4W-Z8vMJf3A2JjAa0DcpPRM83io9
X-Proofpoint-GUID: VPwr4W-Z8vMJf3A2JjAa0DcpPRM83io9
X-Authority-Analysis: v=2.4 cv=feOty1QF c=1 sm=1 tr=0 ts=67e1869d cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-ogRkZ1lWjz2smMNko0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 mlxlogscore=370 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240118

On Mon, Mar 24, 2025 at 04:08:19PM +0200, Abel Vesa wrote:
> The Qualcomm X Elite Devkit has 2 USB-A ports, both connected to the USB
> multiport controller, each one via a separate NXP PTN3222 eUSB2-to-USB2
> redriver to the eUSB2 PHY for High-Speed support, with a dedicated QMP
> PHY for SuperSpeed support.
> 
> Describe each redriver and then enable each pair of PHYs and the
> USB controller itself, in order to enable support for the 2 USB-A ports.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 86 ++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

