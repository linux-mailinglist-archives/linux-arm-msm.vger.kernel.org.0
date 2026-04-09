Return-Path: <linux-arm-msm+bounces-102382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EDZOLEE12mPKggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 03:45:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E13A43C54F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 03:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 82C6F300C34E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 01:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1D22D77E9;
	Thu,  9 Apr 2026 01:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtO130Oe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApXf3/nB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F8A32692B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 01:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775699116; cv=none; b=tpad/fzRzsd/YE4A3ZtvwqyP+ddzF3nsNOswT4py75Flxb+IgA/6tExtsb7NJWcWXu9NEK1+xje7Zv4xTGk5iQrA5aRoxmSRTVOs6oKvJsyc5aSIGIOC/xNRCyaOWwp96Tw16dfColRQoh8tf6H+3R65XENEENqW+bj5CzxlSvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775699116; c=relaxed/simple;
	bh=iLshe6sNjmNrDY38840s3TN4k+QR9N42OuTH32+9BIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QyPZ4i0xvndJejBX8SmyDrmUHQNMinTPxvUs0rlsuON4fzu3RtYRuclCk58TyY7Tb8AY5xepBY9yAcIC73EViilQLX8tDvYDUNAxHwXm+IYbNHcA7ovMWZzUxnBAI106BNpHIbNnpj2Ue1i6Q0q+1WsA42DF/P6UWsQtYhAphkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtO130Oe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApXf3/nB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638NcNcb3781253
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 01:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2iM4VNkJFbaIkqyIYDFACCUE
	9r6jVKLavzSuHziEoRI=; b=YtO130Oekkm/I8neifMI7f2XwxeiUjVEAutfZxS6
	xeLXJim8lcje3+PV9OoEO0m212jQ8ABaJ8gE2LEDd8CM2qa9PwZFvPSKMafIzTc9
	JBP29Da4NZ0qUpwu1Tdxfa+1W0M+pUpgaMi/9/S2xu8oWZfsxmFZWuAnVz6i2hzo
	nt8sxsIE5h1XR8NVyB+w752fV5FAfZlvp18RkWrVVTB6hDVDXWI8Z6c83oazDf5G
	IDXYkTNTGyMsgzUtpMLIdppto7CGa+MyaYJlOhXmKIC0zOavqGHlad2R+0GsTsJg
	ORAIJhjA+vCxuLuxwN3jjUOl/OCWQLrJxPwVRQGk4p/xuQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt6y9vsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:45:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d9d52ad9aso10959491cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 18:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775699113; x=1776303913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2iM4VNkJFbaIkqyIYDFACCUE9r6jVKLavzSuHziEoRI=;
        b=ApXf3/nB0pstfU9wf96dgVKnymh6XEfzdbvHp9XPABuCGSGueeecUKNdLetpSADURl
         SwHgFzGO5lFiwet11DD+1NPaLx0CYDVrfPybOkuvNdzV5ei9N0ZU1NgIWHXqkIggEF8+
         gO3SubPw2K1CX+J0yb1w57l0a+rMLMtsP6K/LnVsW4vxwRq0BzGSdtOfpKDd+JHZjAJd
         tuNGE+WX/3CkTQq+sIK/gIMK4rTWD0IdZSbbfwmRYrZ77mtjTu73bdhljsYu0lR/wqKR
         xu9GP4tCykSO1+vDCzM8Utjw1zK5meemmlI/1wU5WMz0XEhW3fMVhVZ6SNCDaJBqXzqd
         hA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775699113; x=1776303913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2iM4VNkJFbaIkqyIYDFACCUE9r6jVKLavzSuHziEoRI=;
        b=S6Ll5ljA/rG4EFA/btLh4NOlbJj6BsUpYLVHsKLbD6j1HraB2p8OB9JT0TSmWe3ydF
         WJSJGBFFLfL+jQJmxl1DHLSMGo97gCZtXWqjSPAOgk7PioZtwdrQYgpey9sVE3sgH5Tb
         o3q0ZDLA9GGAQtE59+aUCrIm9zr+U5/Pi+FIEmDYEc5ugg7/BHbdtQ/aXNxP8YRM+GdD
         xL+PwsXJasLuIL0YwsSDTOzy19KtrE8xGMgM4nbshfaE42awipcS3iviNqGlLSh3XGHn
         5wX87nvaYhNb8fDu5D97d+1hnDCqufV867Y6x/4X89hmOBDfcNBLlg7REmAL9br/jyX0
         qeew==
X-Forwarded-Encrypted: i=1; AJvYcCU0YvaeEMIn4OQF6h8vuWE/6RsDKBWGhJeSPjVzIqoXzANNgPx6JPs+GOrcEsHOsAp6ZiyuDGieuXUvyvlP@vger.kernel.org
X-Gm-Message-State: AOJu0YxFAF2BhuXSEdoXJpTnB9SWWusZIdfzPY3mMGcKNZh3OXOWFPoE
	qs6PCaeoqXlLDpVxEyIEZWch/xnuHK8gXiw/puSPKoRnI47TGsaLTZLHl4owlsbXrSH2dURSvnT
	fMuhflSyNYozflv2Mn62yAjmDBr+cT6zJVs+nPzL6KLfoIySSprwlw6VAwSSFK1dcWa+x
X-Gm-Gg: AeBDieszSCSw+rf/jRPyqIz3NdD2yRJX770XQvpyE88e9VQuCE/At5jgw8zueoeAani
	CNRLnXxytEgrlrvX78e2B8SlQ83Fid2mYEXBEaYNq+FK//TTIq9goSgtDm9/lhXDA+PKVUIieJI
	BPBJWSE27Qq8wASGPNr1bL8U0w3SivuyKLCdlo5tlqsbSvU28V/ZsAxsxbtlerc6Uiv1uRaB15L
	1DgTMNX9AvIxCJEHjrz+H5yqAh2LYLtc+b2Ia6MAql/+I4Gdv/M2XI19//JGcFxiPpZbNGjBWxU
	DrQIF1pDKTKw5Y7+8v7PHZMI+rS4vsRYTgZP1yZ4++NqwHy3Dn/xOjfdbmj0aXPNKfQF+3jzlp2
	+ZDkY/yoxWDUPgPkFBbEJTgK/Z9NL9KpUK6FefHdghNtMzZh3fOlBUZ57DYm6kHWtadGFZ22/yd
	0v3WlnoAf1Yuf4chk6jFIAT7m9M/jjOU3LWjU=
X-Received: by 2002:a05:622a:60f:b0:50d:8c24:20f2 with SMTP id d75a77b69052e-50d8c2427bcmr225557411cf.30.1775699113623;
        Wed, 08 Apr 2026 18:45:13 -0700 (PDT)
X-Received: by 2002:a05:622a:60f:b0:50d:8c24:20f2 with SMTP id d75a77b69052e-50d8c2427bcmr225557091cf.30.1775699113178;
        Wed, 08 Apr 2026 18:45:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd30d6sm5088108e87.70.2026.04.08.18.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 18:45:10 -0700 (PDT)
Date: Thu, 9 Apr 2026 04:45:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joe Sandom <jsandom@axon.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: sm8550: add PCIe port labels
Message-ID: <5bfv4l26qmpnqqa2zinrxkaktyofnbtotylvcmkl4xcess5pct@vsyzqz42ycwi>
References: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
 <20260407-rb5gen2-dts-v2-2-d0c7f447ee73@axon.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-rb5gen2-dts-v2-2-d0c7f447ee73@axon.com>
X-Proofpoint-ORIG-GUID: DNZixr1wRJeMxyv7gV6f-ZRxJBF6LyHb
X-Proofpoint-GUID: DNZixr1wRJeMxyv7gV6f-ZRxJBF6LyHb
X-Authority-Analysis: v=2.4 cv=R9sz39RX c=1 sm=1 tr=0 ts=69d704aa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=h77gEMGJAAAA:8
 a=EUspDBNiAAAA:8 a=HULZ7YFajt4KeWS4dekA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAxMyBTYWx0ZWRfX+lA1fKN/0hLp
 6yjdRM9bjKQk5cWofnY2jiDajzxVFPC7NMVvhVJOFTHlRM9L1BUZ0pqGbAuMcMs9rPjDgECwXHG
 xRvCYaw+agdhClomQ+/7zc/Tk8J7usm3FcW0MaJKP8qN+Xzn/bXqYPMBhnMLNa1U0h4qvWTyPNF
 OzUx/tb1O1Nj26prCCqnzkLYIDDUuB9iwXXJJBMj+yjpmJlH11ko2c2eyPU1uvaiQmjev2brew7
 Jec7iDGe5EmkoSlAvzORDOA58I91ZYSsdOguin6b3S7wRdhSR8XyVBBq4IFc0N6LNDU4EVS70nY
 lHyHbMdrs0BMZm7R4cLVANfTk+jpDXIXhsMMxTtaPBQ86cbcgy4OzJxOKz1NJXTzpzAK9jBhKj6
 lPd1tx4SOudBYwLKl6baPErBjfWCD3Fm83Yuez9pf3ixKAS+c1lkEcalZlYj+tY/HdCA1yZTLaK
 4KauhRIlsz49kAVjxow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090013
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102382-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,axon.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E13A43C54F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 04:46:45PM +0100, Joe Sandom wrote:
> Add labels to the root port nodes (pcie0_port0, pcie1_port0) to
> allow board DTS files to reference them for adding endpoint devices
> to each pcie root port.
> 
> Update the pcieport0 reference to pcie0_port0 in sm8550-hdk.dts and
> sm8550-qrd.dts to match the label rename in sm8550.dtsi.
> 
> Signed-off-by: Joe Sandom <jsandom@axon.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 2 +-
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 2 +-
>  arch/arm64/boot/dts/qcom/sm8550.dtsi    | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

