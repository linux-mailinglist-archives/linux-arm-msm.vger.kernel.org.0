Return-Path: <linux-arm-msm+bounces-81883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9EEC5D9E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 15:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 27F0635F0F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 14:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2F7328249;
	Fri, 14 Nov 2025 14:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iWo3bcC3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gikibYH0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977BE3271ED
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130406; cv=none; b=TTL824Yrh4NyKCRmpMAKID/EwxD3aEw8DF42IPy9MNlBB9DslIi9OalpfqwKv+YriCJKzWxkB982ylVOG/W/kYLT4JZ2mjHvYnAKkn17KAnsCe9CKUQRRtEApPC+KP9AN6ZSP+/wgagBdhrcflFxWZb0RaKJ0ioBqYTsPKM4YrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130406; c=relaxed/simple;
	bh=Ghlk1+9Y/HKRiORw9Nd3m++JOEqdOLNS1vyv67omBak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TaQueG0DMPh+VQAFnI9V2J6ma6Hzzkx1rDY4Jg9Vzp2kKGKfPQsRKwOOTOceUVn0g0FL/RkUNTjYzLqTcGZlIath9kMFuWWS9Ff0f4Z8VhCRg4Icchmjc9cqc3J59u3qn0OGLNcCuDXVsvagH6gYHuTVFV3XlxpO+ekGndTv11A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iWo3bcC3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gikibYH0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE81EDQ1580219
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oYcCK3JJ+gnZ5HcGe+mpDomdAD2aNje5VtVBHtWbOOk=; b=iWo3bcC3ZNrUWRjX
	2IUWxfT6YurkED+W36NkVM6p5mRMSAlP5pEAUc4g8pgVhLJltP/N87WF9QfsZstO
	W43REzzraefUFLZbK9vT4WOoQlecVwjrm7Fyb+chLFlZBMQe3dCNFjsEChaT0SnT
	oTfozyJgoUtaukqAa+S0YX9cJ8UE50mRomV40pjdcBZhJoB7njYlmeFuU3EsMcpn
	4N44N6BfBTia2UIm16Rqy7f4wAugYovvnrWFFuVGyJs7rNViAKqnFg+JQq+D13r9
	GAHM0q2YRWbtPx8nlvoUnOENP42e4yI5R8wMCztyv1o7f+8f6V1p0q2ej8ESa45p
	dd+YtQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9ftexn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edb366a926so27028851cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 06:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763130403; x=1763735203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYcCK3JJ+gnZ5HcGe+mpDomdAD2aNje5VtVBHtWbOOk=;
        b=gikibYH0sCfrnsCjm56fJOmM7RgjmPQ4MfbP+wlAtQFD1rC2ExxIglfIhIFSn6ywAZ
         JiWGvvdffxbIs4HdLGdKINEjLmKl92wXtIbX5Bt3DwqBhlDVP6TyMSNmflPFw4wDeIVf
         AKQUJc8BswNkairuS9bnaGloLUuBjasp0JgvbRQCLf14yOnMOR7CUn+Itc0wL05qyVjy
         ZK4QVLCHzRpRZ+r6kCF8n2EFV7hbDEI82j0yRcBqBpY2H8A+TMP106bGypXSl/H3cOjX
         jnp47ap8VLd8mkfMTxf9jqioFDvFl59s7ly0+UlvCP+ZQFKGBBYYAfcroRjRbbKMbV+j
         3EUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130403; x=1763735203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oYcCK3JJ+gnZ5HcGe+mpDomdAD2aNje5VtVBHtWbOOk=;
        b=l7hN4yzyiceDO5fQwHg8j4U/wWMUNjdGSdknLl1lYluoSZMp+E9Je/F48qfF49msHy
         GXm6c7i1ixcatFp5eKeoLxEqh6pxnUppfxuOYHeIqlX0Uph62UyHzuJdsngGeFA/s/eI
         h1GaWOQ7VrefTCHPd6F05zvIjwy2Tnt9GD/dEHFQ/tPKSs/mrgoCXA7g0/lCXvJS1xVD
         ciHchBzULLJ8B1W8x83eCjlnz/4akaDTFZ3y731LO5dSycn4CzRL/iq3vqkVSZg460Xu
         sxe5lZawGelfOHBzYnSPDN/zF91f6HF1d4MoEVPMlR98Y6d3CAYpXpXc1RqVbfOySAGC
         NGHA==
X-Forwarded-Encrypted: i=1; AJvYcCW9wxq6vQ2Ecoi4gkeUCkubYI1PSR1ledJmaTn6dinyHQ3TSm56wX9kabf9ucJsrl2Fbipqi3gCfv+XDIJ2@vger.kernel.org
X-Gm-Message-State: AOJu0YwIaUdwy4FXQ3d+JcTf2vemxhzs9tx8U0iGIZKS84whIJ0NlFbf
	rIlP0TzkzEThMZ1FDJGHvRl/pHvWNYA8jaQH7pmRbm5l/QZ//M5fRJTCXjbb4QB/0g59flEGub9
	QTn3/NBvz3WzwCXztDUpLSHoDx9/3ZwA7mLHWg7ufTQvdp10yYdwlJMLZaivHCa7bK5UL
X-Gm-Gg: ASbGncs4LStlbCw6yQlpJG1URg0L4fucdnb1KSswMPoRPDVQ+rGCtFaUo3WO1nWVa1s
	fpxYp0m0AQeCZ6K4bo59YMHcRcdU3rYr7djsLDf7bvNDlxzLq8sQuGgCSaR3ITTQDoRbwioQxVJ
	478HHzTs23z4FxCBEtmCWch9bsbtdJIA0ny7bv4nEqyulIZGU3D1puyNS4X5o6J8bwNtjk7kuMV
	onO8yqhW9G92J8dnuXaf0Nzr+u6Y4YNCOiyOSxwx3/FVCYAU8QALmjp1eLAJVMxccKzEZd20yta
	vuXReDYmOSC2vxUsB7IlzNetvT6FOX2isNk25viquOJSlCn/GfH7AOvBmdpwUSyHwRolT1XhQBX
	6sZRtFCHUldxRgc3kQzT/uvoX21kvdKl3cRwe4FCEam/dFjzfyZY1pg+URyR/buQzMnoT00R9YY
	m03Fq/HjBvDXux
X-Received: by 2002:a05:622a:1a9d:b0:4c7:130f:72ef with SMTP id d75a77b69052e-4edf2046387mr46509811cf.9.1763130402985;
        Fri, 14 Nov 2025 06:26:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGP8IG1VHGQkfhssKeM/niBRRbZpJbVXyfQrYpHpEoNStRfxBC0CED9S3kxQ/qIeTZ0If5NAw==
X-Received: by 2002:a05:622a:1a9d:b0:4c7:130f:72ef with SMTP id d75a77b69052e-4edf2046387mr46509291cf.9.1763130402400;
        Fri, 14 Nov 2025 06:26:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:26:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/msm/disp: fix kernel-doc warnings
Date: Fri, 14 Nov 2025 16:26:33 +0200
Message-ID: <176312947283.1737000.10526075040707074259.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251111060353.1972869-1-rdunlap@infradead.org>
References: <20251111060353.1972869-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=69173c23 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=rK8zvM0c_VZnkeQV2f8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: epC9uCP0mE8KDf-A_f27tIn2V_VPK2SE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX3UeZAS5KNxSL
 5+FMjGr45twD16rMv9fglChGW4OpmzssDdSMncoCyUc6XZRMFjMMWN2tIlDKlZ3FZ8A5lLZp8I0
 KVZZoorzXsyLKMYDlSxoeFmEkPdvf3AGpcexs0nGD4URFZWy+aZ0C2b9yh9l82e2liR/Wwb7JAt
 MJy6PQf+o9+YgJNLDReZRAvxtFyl7llYT/AIyctK39mqVQxSSRrENFPsO/niLtB/TTJhPqS24As
 z5znWGdkjyc3hAZPzsxa4kL4s2sJsQ0vTJO6lbpJxd2odhsNBsdQY1Y3WDkcj6Rt+jkzf2bXnXG
 bZh2gDHU3YedWVg55SsJKUmiZd3Eykv0vXk0ammolAKfzgaLduuRBSjFyu0iyakMzYDVZeIVaQx
 1R7EKkBfWKYXAnu2bGNDsWPZAp0nMw==
X-Proofpoint-ORIG-GUID: epC9uCP0mE8KDf-A_f27tIn2V_VPK2SE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140116

On Mon, 10 Nov 2025 22:03:53 -0800, Randy Dunlap wrote:
> Fix all kernel-doc warnings in msm_disp_snapshot.h:
> 
> msm_disp_snapshot.h:53: warning: Function parameter or struct member
>  'blocks' not described in 'msm_disp_state'
> msm_disp_snapshot.h:69: warning: Function parameter or struct member
>  'node' not described in 'msm_disp_state_block'
> msm_disp_snapshot.h:69: warning: Excess struct member 'drm_dev' description
>  in 'msm_disp_state_block'
> msm_disp_snapshot.h:95: warning: No description found for return value
>  of 'msm_disp_snapshot_state_sync'
> msm_disp_snapshot.h:100: warning: bad line:
> msm_disp_snapshot.h:117: warning: bad line:
> msm_disp_snapshot.h:125: warning: bad line:
> msm_disp_snapshot.h:142: warning: Excess function parameter 'name'
>  description in 'msm_disp_snapshot_add_block'
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/disp: fix kernel-doc warnings
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6fd0a29a674a

Best regards,
-- 
With best wishes
Dmitry



