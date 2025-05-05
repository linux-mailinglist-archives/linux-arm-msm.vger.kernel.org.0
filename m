Return-Path: <linux-arm-msm+bounces-56808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E30FAA95CE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 16:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5059D17A526
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 14:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5D725CC42;
	Mon,  5 May 2025 14:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UR96SL6e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB4D25A646
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 14:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746455189; cv=none; b=L/HX6iPq0e4f8DHl6j2KtAhMhYhWq+ehugwwTzfnfu2WMJcf8PheG3lAgu9sV7luNamjfTggEdrsur2BJhD7IQJeRWYSz32okvTx0tT12mlugXIrv99tmHxp1ie1GnbE9DtwKL/f5po+I19yVyuA8hWVtvTscJ7xt+3TymRvX2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746455189; c=relaxed/simple;
	bh=QJs5+k/qrBs5cgN7eO/MR/BelasA36UFUZz1dEKH+bU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/Bq4qpCD+aUVvzF+u5fxB5QwORkBbiaMGm5CVf24J7LpxOL71u+H9YAvzn1y2g+qQe4Q9k/e9xRMvZeI4GgpzjeLOgzURUURAg/pFz2AUq3gRX9WYcrpybUQKSFMPv7vJx/+1+BXwNnxZ02GePLuelKVBYUQKzw9l4DZTy+CkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UR96SL6e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545Bqlin019329
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 14:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUuUX8bIcyPlPuoPDbT04z3jokr92aiRh0rQ0I5EFxU=; b=UR96SL6e5gPFzkXA
	odKlmcPqeKK41JVxUf82jk//dsmtkYSa5HknVSNgzHAOjwsMkfXcZLC87mqYYI7b
	fKFwJhpAWdHtpEWLgBXi+6uSOYndtTRgIvYSR/MNzvDmUYhC6EZkhWjchi4GXnul
	azXI2GoGYe8SpUEE3e1T8tuCeZahsR/vzglHnO+TcoJxQpax8BPjaQUkCO07zZsQ
	OQ3cdGKI1orl3EqwA+Mw9+a4nR+ZQhZ0vpspTeWdR5+CGl444OKWsaZQQS7LVpNS
	FRGFUJft8cqpRT2YQrGA1iDA9E2hGvBVjhPxJ3yJ4F+wp9kICXpUQJ1tsKyT3OuX
	0XSOIw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc5cafn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 14:26:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5cd0f8961so996023485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 07:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746455185; x=1747059985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUuUX8bIcyPlPuoPDbT04z3jokr92aiRh0rQ0I5EFxU=;
        b=n8/iO35lVmKZpUuInP1hHlYNRVXmlas6341NQQMsUmbb7um06Zq48SUB65K2uN5Iw/
         OQQYcUPhQabIIC/DIb4EeE1k7M/dgzmthsEFj7MwAx0I7YtpTYgnSewovevuoEMm8zS8
         u3Q3Wk7cAXLIvNI/xoW8kr3e0qyLubfRq4yzUVDKXVJDfWITQ/JlqawY3RM26CerFJ3Z
         46c2zIGCOrtR75T/DEJZSmkEwP3FoGVASx37BH07ocl+ZDRzNOTgYp3J2UdcMAaSnjH2
         qMnxj+vlJo03LEqqtTSed3WWMQ/D6tIMqnDRRZ4W3i4ZwVNB6QTSZzp6ruG0ED8J0iVU
         6agw==
X-Gm-Message-State: AOJu0YxLfuzWTYNEHcQ/N1QtRaf8T8hMclZgVqr6iq13hKiEjWrDmX0j
	fW6J2Dk+nzcOd/+2wKEDmu01V3fn4xD6OtmbQm8XIfRhPEhyim3skjjUsTy2LvDFJdWn52MJ0fy
	pdKz3X4D30QX3Kcm3EMpIp8/jObN0NQ1fAA6jELGSivlh+uFmVoeaebA6pogfYJ9JtaIG4w6N8Y
	w=
X-Gm-Gg: ASbGncui5fgUqH8qctp/g4Zp4i2oRAGkxUBxqxswxRaEVIgXbx1Q+bSqqvbhUBHrIMw
	xzFDBQXI3fFUicbrw3ka1gfMO3o07fkJztp8t+2DElaFZ2NhGhoI+dZ6w3bSdelFYptX7aZgkI5
	kwVHpZDFgAKHiWGs6x28ly0YIpyKSfFDuUt1WwVjz/6JHtKVdgk3rUV3DgLMDhyViT3r8Oop3Yh
	X0EaOGvCDo2fmHxPKuyhOqqleUm/uJhM5GKXrncCgTahrSXfpsAxAODoyE6VPHg0JZmoGV5PXQJ
	Mj0AaUCUjeQ0OmMIRBkC1eGE4VasNp0SoqUrbo/45TxhbBEefcCN0oW+4TESKdFoN1Vb5SEDlCO
	K1+k6qthqHUguBWE97wVNo54B
X-Received: by 2002:a05:620a:4711:b0:7c5:5768:40b9 with SMTP id af79cd13be357-7cae3af02b7mr1068082985a.43.1746455185092;
        Mon, 05 May 2025 07:26:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH96RuYp8rf3yGAy4C3TKAyGKugvGUg3+4xADJwkHYt/kyUMmED6s/qSvsMF10QY2xjxR0J+g==
X-Received: by 2002:a05:620a:4711:b0:7c5:5768:40b9 with SMTP id af79cd13be357-7cae3af02b7mr1068079385a.43.1746455184728;
        Mon, 05 May 2025 07:26:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f17fbsm1726765e87.170.2025.05.05.07.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 07:26:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: Re: (subset) [PATCH v6 00/11] Add DSI display support for SA8775P target
Date: Mon,  5 May 2025 17:26:23 +0300
Message-Id: <174645517266.1455227.14417676448478997955.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
References: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: K_qZ830IEmF5KuYNatHIDXn5on2xiASa
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=6818ca92 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=-3-qUcdfqlWSZcId2SUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: K_qZ830IEmF5KuYNatHIDXn5on2xiASa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzOCBTYWx0ZWRfXxdQLAHuSTe4h
 s3fR60/YcexbOgWzcY9Mo6ALfH74CQJe2m4TAMBbh4II/THf5/JaGWO/kMq9B0qK6zFOb2kY9NJ
 2txTytF03KojDlJHr05i43pl0cxWJ6LZLZUgggupil6okMaxnzNc4yPCLMcZbwHVonhDsKWYbpp
 k7puWWjkc11/26j3WSWfR51d/nEKaBR7acpsSrxOdsQLpxLBHFlsn/nOfOtUxHimTauTUetlJA+
 4Iu15mBTdHIND09dxUnYwd8J6HNtgQrqrKTIOdyLUJWJp2gQ57m+Gv6RrDPYTu0TFoY9nf1Wklx
 hvufHNH+7pAMlCEGzM7bDoDtF7+KroEJoLnix9zOiC0PctvgkYH7PVOHRwEUgaY06ksE+OLuBV7
 HFqpKjQ3pdg2k+5yTiVWQtg3lmg/NcukeQR8xC1hBTv8RjJVHeX+iiNe5DzxMgXQUmdjZaTB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050138


On Mon, 05 May 2025 15:12:39 +0530, Ayushi Makhija wrote:
> This series enables the support for DSI to DP bridge ports
> (labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.
> 
> SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
> The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.
> 

Applied, thanks!

[08/11] drm/bridge: anx7625: enable HPD interrupts
        commit: ca8a78cdceb48ad3b753f836068611265840ef22
[09/11] drm/bridge: anx7625: fix drm_bridge ops flags to support hot-plugging
        commit: 71867e8d88fc7f94c2e47b3cfd676710c120cbe3
[10/11] drm/bridge: anx7625: fix anx7625_sink_detect() to return correct hpd status
        commit: 366ca0bcc953a4a8a9c9ce2133e6843730210049
[11/11] drm/bridge: anx7625: change the gpiod_set_value API
        commit: 50935044e58e563cdcfd556d62f27bc8744dd64e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

