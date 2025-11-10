Return-Path: <linux-arm-msm+bounces-81008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF88C46A8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 13:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3A041894FFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 12:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0515330EF86;
	Mon, 10 Nov 2025 12:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QxerOKUe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gVnX/ANM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3C130F55C
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 12:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762778355; cv=none; b=VY+289NeNtw5W8JTFArTvZYWxkbICR3jkby7a2KzulElYZaqiLt3/lKW20qPOCkf0Jp4pCqqcXpPWlOO7BVMe3JSanFxLvUYkQmVtSiQGU2qj2dOTbwvAx5w4gdH4I3VICRit/Pe6aRPWhWabpys5iiiMmpZBapaZuFqSdbmcd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762778355; c=relaxed/simple;
	bh=gFT+3Amm33MdGkcRdM74CB/X6g8NjdXUxYSkJHwrXKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYVbkVueBQPFDTbwrZnYBRQmSHb4VWwDMK0H2bvGIXl7quxLBXul5n8LfBWpGjvkEcJ5viRr5j4Y0mh/4tPX9c2etA9zHmXBLlLbeaw9q6V+et+hyZwxf25HuFw4PGp9Pd7LLgO29wFXiuX33uiYJUgQt+r+e1kld996tmY8GRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QxerOKUe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gVnX/ANM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AACGOuR2407319
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 12:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mu3glRqdWt9AjEDpzM9mxwbY
	vCJas7wdjM+G13lxLSI=; b=QxerOKUeZjj15a4crxY+DH4S8zzP3rWz/sO8sLwf
	sOCc0DMNDrPBJjio7zt0ZHZf0R15FgV3XeQanp+u8q6+vGmG53vze3ihn6PUiRmf
	s+pw6NrPstpg1NofLK/d18PaehVchBr3NaD3GJRQk68MOU/bobVe93QEWhzJKuej
	8UzyYtMBa3CbBczNocVTSi7OAaInx5B9wy/lsXdCI6/wVApM8oVkbQ4WukHGS1Dt
	jfarP1Ya8E6//EULG0O6O2p24ycwNdGg1vMSEfKW9x67ojiYCSHxUGdPwklM72Xu
	sgTUwKJdZ2GPBYH4ox/pCAnp5tDNpDOuy6909Qw8zdrxMw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abatd9490-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 12:39:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edaf9e48ecso44962531cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 04:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762778352; x=1763383152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mu3glRqdWt9AjEDpzM9mxwbYvCJas7wdjM+G13lxLSI=;
        b=gVnX/ANMniM9mqxpJ72ah+wuJEZGOLCMJSFnkIGI5bC6eC1i2PYzPipJEq21OwoxhE
         UgBHFU8ZEDj/5lehZytkE87VroxMWNMEX+R8fm07Lg4PMn3vnyIGbuyXc/pGlAuK+B6G
         YrQ5ltWOAL2h/NeT2UdqA/eF2Tc3IzsM5Xfn6YbTj0zbfdhBzo6R2CJpV/XDYmj3kT90
         xA+o4fdM/GWbriy+eSDxecFp94cgo06Qf3eMsdrpD+yL22G54JGFEd11jFGYyl4unkfK
         FEpBHH7VvJnY1+eKVLntCz9HBxT4p9JBblP8W6yCsWGy2aT3dbn8OlPgXUbe7xvGmi1w
         z53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762778352; x=1763383152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mu3glRqdWt9AjEDpzM9mxwbYvCJas7wdjM+G13lxLSI=;
        b=jFmrD/en5NAZcdzzH0AYjMfY/bpH5l7MoKCfZQLl5QN3xzeJQqr9s+rusJQ+VYVlxA
         i9olg8qZSkG0CNQcC9LSMFHyWstCvbm2EOCKxCyXaAvSD9xPj9gsjpBmV9Ejn9KLZUIp
         EEiCQ9RVAtxE8/Fydk+x3zCg/PCkWzTbPj4Uc2sA66u81MkVlQlS9jCmtH/VPdXL0kOi
         hiddvQelvj1Pz52FtaHmEZm2Xs3A+mn4HgiSYNnCg/cg2Afzf2pstMA9AYBzrdXfEHMl
         RMhY+yrcXCz55bxOwxsZiwuPaYfKJ4AGIWFvW0fhPAMnP+E4j3tXxBHoygC+IMKBzYsK
         KDdg==
X-Forwarded-Encrypted: i=1; AJvYcCV6mBDsgW7M4JmfFMEFdNJQUoPI3QUmotpG0yWFzXI+QveydfxxcRB8b7xIqvoSykpbWX/uqmh2J7Lj58LZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyXakj5l8/3OyjmKmzinxxBI5z53Gt86LCTC9LeAMbkfRroLKmV
	Knn7YvRD4RxI1BEFXqxgAADV4Tcbly3Q2v/jDzm9swcgR2Bpr/2XcxtKxlpZuzzsZOH65r+bAhb
	eLUkYYU4uT6pvOD1dDPpUb4afUmov3uv/RnFo8D13aoRD8u9LhJkVEmEGDRsLYB2qgrEC
X-Gm-Gg: ASbGncvX0tQdbEtRrrWbaq+b7tpDeZjWF9EqSFm1D7Kc4s64R/nAI36brtqRzo7hMV4
	KpX+s+9mS+LdXy73MttRm9pth8gs7gE6ftFwKJwpE2pfscCC+OxSXUjWzwwXoLh5kVrgXkIeJEi
	hqHgdWj111wCL++/2hZB0zR631ML9sgiKtJhbBau1nEw3yz2B0X5i6XImsnv/tTqHhjaYOwpRup
	8bLoWDcLYCoaetc9/j50jgyOo6MRwyhy7GnVaITalUBAz7D9oKFeniluybkeGHMAbWPETDpq84y
	CB5CZbCZj1PILgf3d2f+ADz1WWFkH71G5n7opjpf4tPz3xBCGiW4q9AMfjjXb354hfcA1c2qwo/
	wzkgCOSLGKUv9yCQemPBGjTw8ec9zYTBWsXTSpwodTKgt4VN0iFQU7T5zSCzznNbr8bT1weEvNx
	oB9bC0+4ihyjkq
X-Received: by 2002:ac8:5a49:0:b0:4ec:90fc:59f4 with SMTP id d75a77b69052e-4eda4ecf7a1mr91893651cf.29.1762778352470;
        Mon, 10 Nov 2025 04:39:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHc7FjOtBgPgHxkl2t4dPvZb4lKQroBgN5ujgHUpHoA0lYUguSSs9vhkQDvjQQA7BW9uWg36g==
X-Received: by 2002:ac8:5a49:0:b0:4ec:90fc:59f4 with SMTP id d75a77b69052e-4eda4ecf7a1mr91893141cf.29.1762778351861;
        Mon, 10 Nov 2025 04:39:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a019f21sm3973713e87.37.2025.11.10.04.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 04:39:11 -0800 (PST)
Date: Mon, 10 Nov 2025 14:39:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, stable@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_jiaymao@quicinc.com,
        quic_chezhou@quicinc.com, quic_shuaz@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Enable Bluetooth support
Message-ID: <lr6umprjjsognsrrwaqoberofivx6redodnqwnuqtpp47axhiv@nho74vyw2p4e>
References: <20251110055709.319587-1-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110055709.319587-1-wei.deng@oss.qualcomm.com>
X-Proofpoint-GUID: 9oXPCsAKRrazHlfkWSeYzDTBeLz53n4A
X-Authority-Analysis: v=2.4 cv=eZowvrEH c=1 sm=1 tr=0 ts=6911dcf1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vuKYHiuAbYjNwaP7v-kA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 9oXPCsAKRrazHlfkWSeYzDTBeLz53n4A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDExMCBTYWx0ZWRfX9X7Wdd1aQQYo
 C9nHMG9mk5Dt38oKqyCKU4n25RuTvAS+lFbTNuUKa/tUHHeRPdZg6mc8Wb4IcXYA2yaT7+rAA9a
 szh61Aul7UCLYUYw9odEOdlf8wvPD7MeKt9gInW6DugGhX+q07ZTMHok/I7aQ5QW/l+uPQWIFY8
 sFn4fBEmWWiDpkb1AwSt2oRojWUiUSJj5fwIPlwVPdrmF2QvbYGqjeJ/UpgF3X7QajQ0Cz0u5EC
 Hu9dPO7xVPwBCzd6lwzaDZ5gt6l+6eVmTNezOQK4ILsnikyw9LCuPJQvh4P8N0O8Ni2zqSH0CKe
 S4Fmxjt2ycr1NqQd0sRPvUrElRTZnwvPtWI1EA53ps9nYTN/KRLqa/xBIfOwlSbqg+uwQm18NkP
 XkbA/OaAC4oxNohaavR1DKEmOrPdrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100110

On Mon, Nov 10, 2025 at 11:27:09AM +0530, Wei Deng wrote:
> There's a WCN6855 WiFi/Bluetooth module on an M.2 card. To make
> Bluetooth work, we need to define the necessary device tree nodes,
> including UART configuration and power supplies.
> 
> Since there is no standard M.2 binding in the device tree at present,
> the PMU is described using dedicated PMU nodes to represent the
> internal regulators required by the module.
> 
> The 3.3V supply for the module is assumed to come directly from the

Why do you need to assume anything?

> main board supply, which is 12V. To model this in the device tree, we
> add a fixed 12V regulator node as the DC-IN source and connect it to
> the 3.3V regulator node.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 115 ++++++++++++++++++++++++
>  1 file changed, 115 insertions(+)

Why do you cc stable for this patch?

-- 
With best wishes
Dmitry

