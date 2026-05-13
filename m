Return-Path: <linux-arm-msm+bounces-107396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGqFEKmzBGo9NQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:23:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C26537F38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99D4A315C513
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178A0349CDA;
	Wed, 13 May 2026 16:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ub9SG6+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a1qFldf2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAECC38D3F7
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 16:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691144; cv=none; b=PB7hAxpQjc8syx4v8ijN6tNtRgnwa098/cryNybpkbbL2OjtXCMOLyhAgS9hda8x4Dugsqr4Elr9n+aP+D2waRCv7KAPiELIgDREQRY2duBPZy9mO2F39H0cEEa5IvraTK2PNg9tJbuA+BtHNwtHnlkevQX2eH/3v4wdDg3nLfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691144; c=relaxed/simple;
	bh=qOKgjEVuqIbEtUVcQNUPmBWk/ToVLd8iHPeTuwLwbE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1kZDqQEwmLF9FrqLmDIiqeL+ctlH64tFLKv5BaGfgsJZX/xlmVjq7e4VG6I46HY0DjcyYjFIyLViT8Ic5cXfdf5z2gXFu0P4Oq0MJE/gg9ay3yEwebQhNTVVWEQKH4jfLHhk4IOdM3JGqL2bBSFimT6HhBGLxq7fV6YDgNXk5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ub9SG6+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a1qFldf2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEf9l52888500
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 16:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PQDKVHkpUsfpWP0216KpWZo/
	ckkZQvWAnsqZGCHLh74=; b=Ub9SG6+JgDbR98bvDLUhCV9iBCiaZ2TMHpDiSraS
	Kxee6/wCy2LOyFoS5fSuP/f6AN4+VlmVakSq+jruUriTHDoh8SSpyCvy+CwFiXpx
	kPO1H5Nl1vrZ22MN5zAsz3+ke1ipSWJSxSxmEzxK3didYf/fpqFQmF5Af5Vl/z2k
	i23RfLj2pmfIJnh9C8TS70J/VzJsi6ncVhIKLPjfyjVDmhe3okXnA5EEv3DXAHfZ
	i1J3q8RIFywnRTVNiLLvs108RhgG8wuOJ2IzBrhA26nc29JtS4G6OfteEprEiUz8
	hYGXeEKA7Rgqm7bkFCuiuZi8I8dieqvYDx/HrzTFRimuOg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4ghx6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 16:52:22 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6343b1bcbe8so2678894137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778691141; x=1779295941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PQDKVHkpUsfpWP0216KpWZo/ckkZQvWAnsqZGCHLh74=;
        b=a1qFldf2MtzdsCgHLBK/433Kol91d3D65ncGP/v4/KynLHKYNzxHpI8S9sZJSXKcm3
         Dc4AMMOPVj5yZFDbOQxj9uNRl6e0LW3KaJnzQmDlr8cELi1SG0QfK/SDDADI+X0DYb+o
         1MhJpaC2SXPkZ+rzRn0Ixmcno2eKVTMrrZ7YrZBJVaEni8F9/ohMh3xGW/omy5IlgoLT
         3bNeuPAGq+UE2D+69yrPZhX93smUelX8qH9ctN+GbDWQEt16OS6uWg3NDsMCYwIZnqAu
         slSd4SKn2t0zW1Bfepxaz7aBX6r7mknInspSOEDur/ew1cSLtsyPXeJbVqNBSrOwUMgF
         qBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778691141; x=1779295941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQDKVHkpUsfpWP0216KpWZo/ckkZQvWAnsqZGCHLh74=;
        b=E7UDJ7fQKHxbEGxEKSojk1LUViSqI4pRmbKB4+L6C4ku/LmKyAptU02RiEJj7P8OOp
         gN33DhPy2cEC0+Sol/X7tddSsb4hJjpYlielLaW6sG8aYWG+Hqgchs158XkDhR2ASdM7
         5rJ4g4S6bTepSAnvxIhQKHfe6jBrU6iWe1cLn5lF4oeU4oHyslAdbKkWlaXsNBDR1lqN
         76QoEkpjtsFmFQbyci0AI93FprEcWj+TszJsdDk7fSjrQXSdsSZYnu4E46wFSlqKbHLN
         1XXVQeTmuqUUn2P4nNQuaE+bloQWwmC9YvWEaGGtSBMnPXRXLyRPHqakVR2JLxfRMVeB
         v4IQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IOo7HkMJmHcqjCtFsU7TTbVn4JGACj8du7vV0QEmsg76XNIrou9WOBO3HfX/OYxv1tdZpeEYlcn6/bcXO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9D0GTlfs9ho3p8zgs8S2QRiqRfSjkFFuJMszH+l6V5rQuDbMK
	oFNVrOhJL0CgIuIxm0SX4CDS/I48ImLqnQG2wTP7z64AxJ5DW0D7WFHFijQYSxPCIXKgCW9S1Lr
	sZZmw30w8YzQIJQknP7dXFvMZGds40aHHcQssRABt553Xh3mCH8uSnQT0afyPxSUIxtMw
X-Gm-Gg: Acq92OHG57hid09UUHLtGaln08w/yiHWJ5JFabBIofuDIBBd+XR1CpvQZc8qykdaszH
	7o2Lewm5k/8eA8Qdn1rQp6Ie7fg7mMpmFTS95BLZPp8or+LBB8iJK6zNlWitdCY3RsF2DdhPpWF
	sTJvuutTA5fUkav3uI0yXLVIlRePOZZraOHzm3TYwSg7L3eZV4ceMMh75hXdFNJyXZo95w7W4Hy
	cRok64lfEKbJcKKWoMrt7BwQowFJxWXI/rYJ2uiB6AsLE9oyKO/2ER8svLYAjj41hv7og3uIx00
	7pbEFGoApEjhzI5c1Edopt7aMrVzsnyteZiLATVA92tI9TFWuqZqlMQUSZsoRGk/Ce2+mt9I+zp
	wQ+U8jbud830IkUFoVbWbo2Jr0iSB8JM+AgsQRwKzcOOOqMnS2gQ7SU0fe5qssw6wmz6EJ806cK
	m/niu8WM89RmbxG24kE4WzK9g85eaUiLEyuso=
X-Received: by 2002:a05:6102:a51:b0:632:29a5:2b27 with SMTP id ada2fe7eead31-6377239d243mr2364701137.3.1778691141089;
        Wed, 13 May 2026 09:52:21 -0700 (PDT)
X-Received: by 2002:a05:6102:a51:b0:632:29a5:2b27 with SMTP id ada2fe7eead31-6377239d243mr2364665137.3.1778691140453;
        Wed, 13 May 2026 09:52:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b3d0sm4096876e87.80.2026.05.13.09.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:52:19 -0700 (PDT)
Date: Wed, 13 May 2026 19:52:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH 4/8] arm64: dts: qcom: kaanapali: Add qfprom node
Message-ID: <smuahoo5kk23pmy6hl3ydnha4aak3xyalrkg4vydixoq4zrro4@rpb2c2oy7lko>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-4-13e1c07c2050@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-kaana-gpu-dt-v1-4-13e1c07c2050@oss.qualcomm.com>
X-Proofpoint-GUID: ryfst4bW6KEwNgsZsD8u7tmrNFX26q24
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a04ac46 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: ryfst4bW6KEwNgsZsD8u7tmrNFX26q24
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3MCBTYWx0ZWRfX3lEHuKuIDiF9
 z8kavR+7N6DKdRALK9D7AlYfJ0Mguk5EGeJu7DXnJMcx4nMOYNDbXF0YIoj+Zx7GRdhC5ZlX2da
 NXahzjtWAKwxwg9Ia1c4SWaviOoazP1ysLQ9owaVsgaXqSUi9PUAmvI0JuGo9r1F1SKGhaGi10Z
 P7HG0IEnEeN+BWrXJ55D/55kYASVstTpbAfGwfkh9dpMOLBflPlc49VPJa0r2vd5LQLFPSGj1gk
 /z7Qq/tc0dEOga9G+ZVJwiPxfjFroKHHW3lVuuah2AuVAMxHFAm/iGANUFFuRx3aNqFNrMEV1Is
 66glhRyIcZnpNZF70rxipiPhfMsRksJi4T9apYzSZJNP14AiTXZAOn+ilVn+SwJOf4h+D1zQ2jl
 /ZVOr8e/2ZaC6kIvnXmcMq/xo1KQaacREovp4REAWaDqvGyTMDaB5Hlb25AtON0GLOcwZrcxZ6P
 W97DqdUmxvyFyE/gDKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130170
X-Rspamd-Queue-Id: 91C26537F38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107396-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch,poorly.run,lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 03:53:18AM +0530, Akhil P Oommen wrote:
> From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> Add the qfprom node and gpu related subnodes on Kaanapali SoC.

QFPROM, GPU

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

-- 
With best wishes
Dmitry

