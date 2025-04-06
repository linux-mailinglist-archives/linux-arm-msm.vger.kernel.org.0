Return-Path: <linux-arm-msm+bounces-53318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F78A7D03C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 22:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1E4A1707A2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 20:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBB31AB52F;
	Sun,  6 Apr 2025 20:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jme3Wz73"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C5519DF48
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Apr 2025 20:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743971192; cv=none; b=VkaZ/qotw2Jifs0cH1stE4bUtURambI16ln+uxr5ykVZjTvKva927R1Qy6d8tPdZwn4/UEFX+uqoLGVsFxia9hxEIj9tOc09W9fuZFZNWUPJ8So8AP+esbJm3Gm4kHNIu7RL72Wf/B1m6ywO8Soeyxkgqk4Sz3oT5h6miCyZtHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743971192; c=relaxed/simple;
	bh=08+tqfAB1Sd57oWzPVazTtvjR2adNb2Tmjo9iIOlBjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teaRn63pzU306Ht92a0D8rgw0DnUZIx3H6t816InikaoIU7s+wawVB6eNqOoq/Xx+AnUDXSMS+UaFsWk5RA/D5YXTGUfknVFiaJVCnxXkaxRRCZIIYMjH2kKsORzyFs2VTEhjkJ7B+CSKaIKOaCEBT3dXb1pRkt/F12MJz6O0DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jme3Wz73; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53693A57021378
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Apr 2025 20:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UjGwNH6c05e2ZJVyDxHhI0Wz
	SpJhkNhQNLiWVKWtit4=; b=jme3Wz73pGBnVPz9xxvf3BndomAwtGrT41KUZrFn
	a/bY0uXX2DhhFLvBbxjV09Xx50nfeSq5YZW1IwlYe5S3nAdnflBvInjMY18BZact
	9iNjktSyC5TeSb9FnGJxv3RrP9nRsRl85+DkAIcjoqOEow0v0La7aO+iNyTLo7eF
	j49cLVexYSYSLTawBzvd4YCTsYYtjsIffF8iHe6ze0tSufkwsVeC6eHyP3l7pTCy
	b49giFZM72EY6krXk1OBSp2Vcao1GU7q+yEpPE2nmI5ZR0t7zV0I/iyCjUbbGMzv
	HkG3goKEvBYXV38HXCLnjJ4SYDxdhFfkDQ0K+kPNZX9EUQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfta9ab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Apr 2025 20:26:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c57f80d258so1273689985a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Apr 2025 13:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971187; x=1744575987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjGwNH6c05e2ZJVyDxHhI0WzSpJhkNhQNLiWVKWtit4=;
        b=RxhzmxA7N5kagbWELq5o5xbqvfGAlj2RCLh1bZJCumoqTVIrD+BN0bwQZhCiaA94/G
         ABtzvSM8f3NkVgyEWiBg5MEFk7HmC9DKVm9EvVThGCYm/ThW+GqkemVdwmUXqZq8n4Bx
         cPvTOH3eoM+pakhSIZ5Xh2zS9DjLSFKksGfoRolhfPIij/2KmxFjpqQhnJdkDPXVNNZT
         6B1V3eYgGfAK2CRVv1MhSPXSTgenZtd57Rkugt4zbIywry2kpIPKw1sT1lZIHmtyLogC
         IPUo1GjMibPHYmb0tjVb8oxFfpyyr9+OSqkgs7hVI99gbZ1uVwFGyiN6VygBcrOLFGl0
         e4wA==
X-Gm-Message-State: AOJu0Yx88hm0bUptDHFNP5mSSfb6MUzHEaNOqCWX4KjoMsaOHHVgUl8m
	80efRQKYQch1wCPyh3CiXCsCnzLrYYjLvyK32CB+Gx/vTJUrJPxdKt5Ni9mYN4F0yeBenX8CYAy
	VVyT76H6P/If7Fbagw7nhtsUJDWNBS8lcBsKHzz3dZALGbkTfk5gq9CxSsDYXB/Rg
X-Gm-Gg: ASbGnctho1RW36gSinGnmYHtMAwu++V4OzjUUuq4mUebAZwt3cjIfFq8tgVqhndmL+O
	xaih14TFp51uVEEG/Ax9iCo0rn4RHW7LfZfnU+oOzvtemVLHpAnTdPfvLRDmdCsoVmmz8dUSj1d
	cstoktuK6fO2dC7R7bZY+9+Gr9DdlDPCzw/91eOXlTNAa4mOqFdqsFrugTX+OiK1pumewz0N2ww
	EBcKi0n1kmcg6FUW7S20SDa55VOK9K0nbjPoLdB3XE7MmCjfaT0nR9nnDO54Y6efXCmyDpKB0TT
	PEXksU4ypAWVcssQ4lrMcfPKD+DuhEl928CIm15HPKY1e1iKzjPMpVQi4WSsdlguq5H1F7LF/em
	4p2E=
X-Received: by 2002:a05:620a:430c:b0:7c5:5cd6:5cea with SMTP id af79cd13be357-7c774d2cb64mr1319173385a.15.1743971187505;
        Sun, 06 Apr 2025 13:26:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOUC8/sge2Zws3JbtbtlXIqzr1w+PRoazsYS05/FRkX06ItoCneX0X4IELGp4ykgdikcb+3w==
X-Received: by 2002:a05:620a:430c:b0:7c5:5cd6:5cea with SMTP id af79cd13be357-7c774d2cb64mr1319170885a.15.1743971187219;
        Sun, 06 Apr 2025 13:26:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671b8csm1078793e87.223.2025.04.06.13.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:26:24 -0700 (PDT)
Date: Sun, 6 Apr 2025 23:26:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: Re: [PATCH v3 08/10] drm/bridge: anx7625: enable HPD interrupts
Message-ID: <srobukvnruqkgwbtfeoc4aiam2zw7j4oe2eyoqd24fn54m7s7v@v4roslimt7gn>
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-9-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404115539.1151201-9-quic_amakhija@quicinc.com>
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f2e374 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=dfltxrk8hYN0BGuGiOAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -0u1NUNfOq6u-lG5rBZjsg-6UX4zRrcS
X-Proofpoint-ORIG-GUID: -0u1NUNfOq6u-lG5rBZjsg-6UX4zRrcS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=635
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504060149

On Fri, Apr 04, 2025 at 05:25:37PM +0530, Ayushi Makhija wrote:
> When device enters the suspend state, it prevents
> HPD interrupts from occurring. To address this,
> add an additional PM runtime vote in hpd_enable().
> This vote is removed in hpd_disable().

Please re-wrap the commit message according to the recommendations. With
that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

-- 
With best wishes
Dmitry

