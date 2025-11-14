Return-Path: <linux-arm-msm+bounces-81880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DC6C5D9CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 15:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D40284E96B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 14:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C6C32571F;
	Fri, 14 Nov 2025 14:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1G6oICf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIzvKqno"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8713254A7
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130399; cv=none; b=cuOdlTyoGrsrZxz1zZFtxtJv4P0qBLDsHoLJJlTmeTnAjDzRT3aKlxA7FWFeptbLEXp3L2MY2qc5PxmEl9QKZiu5ec1yrxOzp9wA//JEA6J4nnA5bjWvS5AVxAIYe/7BTTRBHfDjfK5uYchyCo0AiGmSMV2ACyTcyI97uw0w0Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130399; c=relaxed/simple;
	bh=S2ZKGH+cUmIMgjRKNMZzHWSVPOa+CpoOHjCQNNz4Ctw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mLTOqvar2ooKcSzWjYVJRr9B037j+Q4eeSWwypPSoK4LasvQARj/39ze2XmfAee3TElyYsCETA7/TicqnsGvEthPj92p4HokB1OQg0c9bREeHQVI+3t5OIKU11vS3E/eexqsjXcxrEh/DaO89vDgPKpNtBrRQus6Xxd64v8sszY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F1G6oICf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIzvKqno; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8GEJ51615602
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kpz0T1BtBZTq/unUhKaDeyfGkp7eC3qvwU10X/7O0C4=; b=F1G6oICf9R7etJDc
	qzB4xoNt6ifFDqcCuTHAYPnE2IehvNOrF8OGpNAFvkyZouQatra5WZ8GhnAiM2tR
	Rph1Nz1fGAIif9/PNR/eFPtrDoSQhp7FXvO8++w0S9MpHyk8efx7hVlDhZL1MmwB
	NcOP1Uqvl07rHt+dlxBAfXOZp35dSvcgd6d1F7oGh3ZIJhtYMbB7B9fuplELHGAd
	Kan41oCIfMcdwaTZS597Uokrcc4PVsrkn81+6MLYR63vURQAkJR8seQXw2FJUHwF
	qeDM/rHP26NxrszfQT6yKGoRPMDXnT7M9Zsq9s1b3ZGJBfw4whgsZXR1uz1WS/fT
	ZKaYnA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9h2dwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ecf9548410so53987801cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 06:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763130396; x=1763735196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpz0T1BtBZTq/unUhKaDeyfGkp7eC3qvwU10X/7O0C4=;
        b=CIzvKqno1iMvLQ7dpm4pWwaetIf5QTVGSMx9ekik+szy/hVcLs4V1VaU2/7PyyLAtx
         tYfyEkDdB6ugZvV/RA9FNnQ0x/vSPbNoYWtrpUUSgHS6O1dJCTpIRHOv6zwLgA6rr25k
         aUFELnkMjaRoaROE1SSKzHwy6bTw8eDoC+xhaPk+97uBtsu3LqGZDDIbMLS8tC4YSiyO
         wlANl4axu3hRB9qAl+lSBJ77111QMdftLGTa5Pdb2zEdu3OLRZtunSbbIs9EBBS53TFH
         h4i+UJR17hYu+x2aicpbwDH/mj1DCb9iu6m0lJgbDggHIkE5yhVEmRHRp9TxNBvU/vd8
         8w6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130396; x=1763735196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kpz0T1BtBZTq/unUhKaDeyfGkp7eC3qvwU10X/7O0C4=;
        b=Wd0vM4flpMdmBEOJEIx9OI496TTyRsUFJw3vEo9n9uV0e7Vf74K3GazaOze/dnrOtJ
         pg5kyq1O53TAone0K4XI4GS14GIcathtjTVswn85iX84X4rO++JJGttl4hoFk0iM5Nya
         au4asvc7oO+xKSwblkpagZTcOakR+5DHgobnKTdyd//wlYyEy7awm9s6InEr/hYhMdZO
         TVnK7Ssm+/KksSCPViYR12izA8S5lfhM4ALxIqUR5k2PiQltj3wUsWT604VS9Rgxa0RB
         NrkH0cbVYGPhPuZo7U33SAfcBnQxwbHoAiLocWskbajCsDjhi8u+2vKHZsPe+vbjsufr
         YBFg==
X-Gm-Message-State: AOJu0YxgXQC65fUhPPlYujOUCP+wsTAgc26PlJ7vk9RyzXVu8f2F8sax
	IRByO2r/hg+JWUYQfBMOed4TR+jdpBdjAhPfZW8JR2JRoudFg7MsgdVcCxpdzRqXn8ViZZRtqlz
	bnFz09wrlK/7UO43Os03QtItFmqjrHAiQFENrELgV2KQlOZbBneVxNKqVKHIDwlxKQZKA
X-Gm-Gg: ASbGnctaOrGroIuXJXalUv6pltWFjW1ZxtxU6MCQhY5z1JlHNW4OzsMoew2xTHlfzig
	CZ+C1od5hNOqTiS1KQ0Qd+nD9FZ64UeB0PXaPKDK2gcfxhK7zr1ZhUNyzJcM8BSuPSuO9CIf9du
	dRQ+lInDQELmlMuLxdcDqPM8z8Rizf6fuF+nFG9Md08bGuSt1SE5oVd8j72HzIiQXIzfNhpaCxe
	DNfYQpwgNDLCuJ9U8CiJgeyPhLkyWKSgLJqwmtoEGlQ1LLZGepywPW66g8r5TqxeGXzRteIEyAA
	mcZ6fEETqb9v3rlOnFhIQGFnFrPDXEp2igI1ABhKugQjYGpeTcT4Ahq3vuCuElNSii6lgpm5Lyd
	SBB3xhnP7EfLf+oxD0BfQV2GL/VO3/Hckl+0fDkOeEi0rtabCzo1sKdApi5JvJVafDFvjH2nimt
	M+yYoyMDei7CVB
X-Received: by 2002:ac8:5844:0:b0:4b5:ea1f:77ec with SMTP id d75a77b69052e-4edf1f4b087mr43272791cf.0.1763130396556;
        Fri, 14 Nov 2025 06:26:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHc1fFvTd3StWO42NTuZKKYem/traozFFvdrNGkyOZ3EfhLQasWqywNOo+OH3TvkuUZYjw+3A==
X-Received: by 2002:ac8:5844:0:b0:4b5:ea1f:77ec with SMTP id d75a77b69052e-4edf1f4b087mr43272321cf.0.1763130396056;
        Fri, 14 Nov 2025 06:26:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:26:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: drop dpu_hw_dsc_destroy() prototype
Date: Fri, 14 Nov 2025 16:26:29 +0200
Message-ID: <176312947284.1737000.13215688004444717499.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027-dpu-drop-dsc-destroy-v1-1-968128de4bf6@oss.qualcomm.com>
References: <20251027-dpu-drop-dsc-destroy-v1-1-968128de4bf6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fUH7xaUtf5hATE_-M2HQXun0OKZ7cbJZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX/Memt4kdf+0z
 BG6bceimfkm5T8OQq/2jzQoB5oLzquqbo4ZibZKyEvNdaSf6Y6/JAXw/XSWq+y2zOjt3BoH9caM
 RFroSGoi/LvfBUWzW7yY2ojy5AoBBvMJhqNsafouNbx2aHC1y+WfdgQcROi/R2kFuBhpmkHkkYx
 W8Ihpflb6n/Qsde/kr/606Sz31JSwhTj8L6ElExufl5IQATXYPJjDUxHZo3tUV1+2nEa5sGabQn
 pjg3sUULYngvSoT+CAIXZbyNgOm6vOLnihx/6Vv1FFPIVJ9q9V856BetZqNhF0M7ouBPoDATEhq
 r33H8C/YbOH8DIUvPxnTN7l8gDZsxoeS/Sa7Om1aNR47AqMo67eT+U9VE93LO9bssuqCvj0SZd/
 CiYMXhlKvVHeU9rwQLrP7cSSLdy5jw==
X-Proofpoint-GUID: fUH7xaUtf5hATE_-M2HQXun0OKZ7cbJZ
X-Authority-Analysis: v=2.4 cv=V+1wEOni c=1 sm=1 tr=0 ts=69173c1d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=cUxZTqMetSfSej92E3UA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140116

On Mon, 27 Oct 2025 15:35:17 +0200, Dmitry Baryshkov wrote:
> The commit a106ed98af68 ("drm/msm/dpu: use devres-managed allocation for
> HW blocks") dropped all dpu_hw_foo_destroy() functions, but the
> prototype for dpu_hw_dsc_destroy() was omitted. Drop it now to clean up
> the header.
> 
> 

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: drop dpu_hw_dsc_destroy() prototype
      https://gitlab.freedesktop.org/lumag/msm/-/commit/34ac2bdebf44

Best regards,
-- 
With best wishes
Dmitry



