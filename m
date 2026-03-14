Return-Path: <linux-arm-msm+bounces-97682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPW/LVvvtGm/uQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 06:17:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3071428BC28
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 06:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C18430C6ECF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 05:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A53934EF0B;
	Sat, 14 Mar 2026 05:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHXIKG+I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IVY2E1oI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149B83502BC
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773465281; cv=none; b=Fabmo6UJednZ6PIBWDEE6XCs1U1nMlZss1gBhasR3XFgXB7tF5WBvd2sZUlUk94Qgv1/bqPsG+Ai2OsCO334JYWjH4XIqPJev6zjM/4WN03Tai8EW/FqG1+NpmKH6ppptjmkUBu3Znj+Yk94Xtur0ddJ0n0Rj/eYy6zZAVmsabg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773465281; c=relaxed/simple;
	bh=DWX06++S1noNpMkJbYE7clEUuQrPSpwU/kayUNW1qRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jJ7/fRaa5UH6UDT/uYb+9Vls242iU2XfaG791rSYdmEJ1tuON27AeTDd3vGarjytZoA+50Df3KA1Wr4Ov6NGai+pevB9nT6Pi4V7wNbD3allTe5euQlAmqVhk1ot3v/XLBfJf1DXPR9CJ2HIS54nNTYMgF4AV3zrn4tl10IGxPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHXIKG+I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IVY2E1oI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E4e2li4129553
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i0uq0SR6mwb
	bqC++gFl8h/nAq2mYNPEsdoUtMq3rJyM=; b=HHXIKG+IiE/lNxCNcGudSlwpH0q
	9HZRVJYn4mhEz58WvSBpE1yKxZM61kwu61EFYDDNP7MjLr9W8jB9QLlx8HP6ma7J
	0x963Nl9gWzQr4nUO5HvpEzpYbZFmYMIi7BZFlS1XFsk4JavwtMe1Dn4/iXO1JC0
	V5ZIpm+Fw9p+XoGepMjRzFFmknBvJ4Xj+pfnryIQn9zeYZYFbIGl682HXGGO82xf
	iQVQRnDwMWSU0zmtkx/3iAstYTSdOxfVwNjOtgaFeJWdCdaWO90ZS+eDy+erNGF6
	0ILn2ZMuqD+slFVFwssMCm5rVu9ND/R77TYuLPuLn9pggCBhiM8kwEMAGIg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udg1t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:14:37 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12721cd1a2aso21521259c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 22:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773465277; x=1774070077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0uq0SR6mwbbqC++gFl8h/nAq2mYNPEsdoUtMq3rJyM=;
        b=IVY2E1oI3mfgqiieDAa461eaKRd6hjWM2Db89M8o1J0ikQUFshak3ao2oOapt5UlvA
         kEOsBDhD3LUgGP1qGppOHgSSzeNlb8wfzzMBTigkT9HPXMcDkaRuj4unr9QMrytIPxuR
         AQe4gIq3czo++FyzN0HCZXx5OziENHnDkhCbVkDl3wuwhljmRTRuKx5jlB+UCdXFnFBi
         YyuCbpod21prtfUPjm4q+UYfIqBDlZmfGinJ6aCAJcP6vs5lyR+JNVRv41iv6Z/Av8lZ
         jrloSJFUscLojfMClIyiEcqt68tFo99hssvUtgVDlOJq80ftV3YdJqV56aIrsk9eCKyZ
         Rb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773465277; x=1774070077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i0uq0SR6mwbbqC++gFl8h/nAq2mYNPEsdoUtMq3rJyM=;
        b=Zb/TAzwhNFP/r1pE/tvQhjjnuESoIhG2OwUXaoxMWmynidgxbwGre2kdnQvTS0c9y9
         spyRTQVoO89OtwDnh83UnymHJLk3W6a0zplRAwwA0MO2LMndFHtf6+5K5Zl+d0eaqZ+l
         7NmIN86aFgV3825NkwyV0NbiDMlLV01MqP8JGoTPi0hSVCpU5xf4i3CHHJTCgbGsxHXC
         YDIG30wjR2dqS5t/Bs6LbfNZxI6uMNbfu4cGh2xW05u2y1+pLxWBSEyrpap1Rn019o6X
         jcDm8VtBYFXgMIDMbM7gXMVDBOMVumm1Zm020x5OK9WIrPygPKSowvN8qR+UBbStuXeu
         Av1g==
X-Forwarded-Encrypted: i=1; AJvYcCWRWJ9evEFJWs/YoMrKkx+z5m/wBFvjCBxs6LK6FOD04C2CV21Qxcs4MUSqre+XsRaIAz/7WwO6ENBTyF5+@vger.kernel.org
X-Gm-Message-State: AOJu0YzwTLcWpGHHW8WMwrx7wS80qy1V0x/6XHdaSb/xtrXH12L5AhPn
	BosChywyFuozYOpGppCQCGYErXP4M2GR/OKN1xo1nCo9AkBLanLZIgZTcpIcodBt3x+KEyGTvm8
	uHJ9thmvijjjPWstSm/V+KRmZSuZe8X52qWeWpXgzPVnhtoU1sU6CP2hkr9E+eZW5UlAn
X-Gm-Gg: ATEYQzx29/byEDoQdRVd2ovwdkvuMJLFj7VDWwW9qrOceZrMpDXcAlJ7UstvIJPmID0
	xhg5Qe4cwhonCCqN08lpEZ09qNnNPqX83n/g/8EwTgW0M3r/qg55wysJjUiyE5dgC+O1qGwExAA
	FikID+E0Iyy77ZGVBsjohGOXsQ8Me1rhn2qHMh5SNBZXR+0slOC6+9wzyGkld8SpX9y+xtL4/ye
	HLR3krygkOhC73VXhWYreNJwIIybZYX2GQv+bnZSM2PUl/1doD3+veLukq83vEPKoympfchL2RI
	r8+/XAguOJ6et+NJ/E9eXPycmLIiQckGgNgwhSSu66S51F8Kl9CoQvidJET9XujNBnC1onxtODL
	D1S10hFp/wM6Id3uCgBQLNsyhImR7NrLwdueA7gwoz51pTdkK/lExDc6nAFOA1JBqjMVVpjpk7n
	2TkU+Lhg==
X-Received: by 2002:a05:7301:1f0e:b0:2ba:6458:b325 with SMTP id 5a478bee46e88-2bea5585cb6mr2948000eec.23.1773465277235;
        Fri, 13 Mar 2026 22:14:37 -0700 (PDT)
X-Received: by 2002:a05:7301:1f0e:b0:2ba:6458:b325 with SMTP id 5a478bee46e88-2bea5585cb6mr2947979eec.23.1773465276646;
        Fri, 13 Mar 2026 22:14:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c098cbd4dasm1784045eec.0.2026.03.13.22.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 22:14:36 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 5/6] phy: qcom-qmp: Drop unused register headers
Date: Sat, 14 Mar 2026 13:13:24 +0800
Message-ID: <20260314051325.198137-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
References: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b4eebe cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=zYeDregsQ1GP4i_2LSEA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: ukSJPTbJRhT2FCgxn1TscJnDmGoHPwV2
X-Proofpoint-ORIG-GUID: ukSJPTbJRhT2FCgxn1TscJnDmGoHPwV2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAzOCBTYWx0ZWRfX63IRUb8htDJe
 B/Mpov4oULiFVkvjQWceKfuEqZH6Hu2jzE3h6gRHEIaNavZ3K9eaXs3nG6mfUmjuhyqARE8k7LT
 stSjbN++SS86Y/CpBVa1zNrgnbA1gEQgd9oHCcnuDizfIO8hx736TStMXVfTrAMDoVw+jbcejfv
 ZIimYY/iQ05SIr78OPthO7XQhhuVcGNEhMeeB23+WzXfKG+x5CpUNaI/VSIR5zTc79BpJR2j+YL
 T5rXhtA2TCP0M7UKjw++9hZb0T46dr8PbRhReQ5PRxY10wXz9G3hJJHtJ2r4yznTAHbzJKcgzID
 3cMrYUR2gWHBstfLV4iz1SAnEppuG0FQjBkrptTES7LTos8E6pd7DyzQUHwi+T4TjjL6RJ4qTzf
 JafKmnOW+FKA97naBrgObCGOkSesMSbtvRTAnkAbgNU5rPXzbh1hKGgAEQzcVSWNAoK/KoY4sun
 4bt7vrXfyzGuatWWc0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140038
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-97682-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3071428BC28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

None of qcom-qmp drivers uses header qserdes-com or qserdes-txrx-v2.
Drop them.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com.h   | 140 ------------------
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h   |  68 ---------
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   2 -
 3 files changed, 210 deletions(-)
 delete mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h
 delete mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h
deleted file mode 100644
index 7fa5363feeb9..000000000000
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h
+++ /dev/null
@@ -1,140 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2017, The Linux Foundation. All rights reserved.
- */
-
-#ifndef QCOM_PHY_QMP_QSERDES_COM_H_
-#define QCOM_PHY_QMP_QSERDES_COM_H_
-
-/* Only for QMP V2 PHY - QSERDES COM registers */
-#define QSERDES_COM_ATB_SEL1				0x000
-#define QSERDES_COM_ATB_SEL2				0x004
-#define QSERDES_COM_FREQ_UPDATE				0x008
-#define QSERDES_COM_BG_TIMER				0x00c
-#define QSERDES_COM_SSC_EN_CENTER			0x010
-#define QSERDES_COM_SSC_ADJ_PER1			0x014
-#define QSERDES_COM_SSC_ADJ_PER2			0x018
-#define QSERDES_COM_SSC_PER1				0x01c
-#define QSERDES_COM_SSC_PER2				0x020
-#define QSERDES_COM_SSC_STEP_SIZE1			0x024
-#define QSERDES_COM_SSC_STEP_SIZE2			0x028
-#define QSERDES_COM_POST_DIV				0x02c
-#define QSERDES_COM_POST_DIV_MUX			0x030
-#define QSERDES_COM_BIAS_EN_CLKBUFLR_EN			0x034
-#define QSERDES_COM_CLK_ENABLE1				0x038
-#define QSERDES_COM_SYS_CLK_CTRL			0x03c
-#define QSERDES_COM_SYSCLK_BUF_ENABLE			0x040
-#define QSERDES_COM_PLL_EN				0x044
-#define QSERDES_COM_PLL_IVCO				0x048
-#define QSERDES_COM_LOCK_CMP1_MODE0			0x04c
-#define QSERDES_COM_LOCK_CMP2_MODE0			0x050
-#define QSERDES_COM_LOCK_CMP3_MODE0			0x054
-#define QSERDES_COM_LOCK_CMP1_MODE1			0x058
-#define QSERDES_COM_LOCK_CMP2_MODE1			0x05c
-#define QSERDES_COM_LOCK_CMP3_MODE1			0x060
-#define QSERDES_COM_LOCK_CMP1_MODE2			0x064
-#define QSERDES_COM_CMN_RSVD0				0x064
-#define QSERDES_COM_LOCK_CMP2_MODE2			0x068
-#define QSERDES_COM_EP_CLOCK_DETECT_CTRL		0x068
-#define QSERDES_COM_LOCK_CMP3_MODE2			0x06c
-#define QSERDES_COM_SYSCLK_DET_COMP_STATUS		0x06c
-#define QSERDES_COM_BG_TRIM				0x070
-#define QSERDES_COM_CLK_EP_DIV				0x074
-#define QSERDES_COM_CP_CTRL_MODE0			0x078
-#define QSERDES_COM_CP_CTRL_MODE1			0x07c
-#define QSERDES_COM_CP_CTRL_MODE2			0x080
-#define QSERDES_COM_CMN_RSVD1				0x080
-#define QSERDES_COM_PLL_RCTRL_MODE0			0x084
-#define QSERDES_COM_PLL_RCTRL_MODE1			0x088
-#define QSERDES_COM_PLL_RCTRL_MODE2			0x08c
-#define QSERDES_COM_CMN_RSVD2				0x08c
-#define QSERDES_COM_PLL_CCTRL_MODE0			0x090
-#define QSERDES_COM_PLL_CCTRL_MODE1			0x094
-#define QSERDES_COM_PLL_CCTRL_MODE2			0x098
-#define QSERDES_COM_CMN_RSVD3				0x098
-#define QSERDES_COM_PLL_CNTRL				0x09c
-#define QSERDES_COM_PHASE_SEL_CTRL			0x0a0
-#define QSERDES_COM_PHASE_SEL_DC			0x0a4
-#define QSERDES_COM_CORE_CLK_IN_SYNC_SEL		0x0a8
-#define QSERDES_COM_BIAS_EN_CTRL_BY_PSM			0x0a8
-#define QSERDES_COM_SYSCLK_EN_SEL			0x0ac
-#define QSERDES_COM_CML_SYSCLK_SEL			0x0b0
-#define QSERDES_COM_RESETSM_CNTRL			0x0b4
-#define QSERDES_COM_RESETSM_CNTRL2			0x0b8
-#define QSERDES_COM_RESTRIM_CTRL			0x0bc
-#define QSERDES_COM_RESTRIM_CTRL2			0x0c0
-#define QSERDES_COM_RESCODE_DIV_NUM			0x0c4
-#define QSERDES_COM_LOCK_CMP_EN				0x0c8
-#define QSERDES_COM_LOCK_CMP_CFG			0x0cc
-#define QSERDES_COM_DEC_START_MODE0			0x0d0
-#define QSERDES_COM_DEC_START_MODE1			0x0d4
-#define QSERDES_COM_DEC_START_MODE2			0x0d8
-#define QSERDES_COM_VCOCAL_DEADMAN_CTRL			0x0d8
-#define QSERDES_COM_DIV_FRAC_START1_MODE0		0x0dc
-#define QSERDES_COM_DIV_FRAC_START2_MODE0		0x0e0
-#define QSERDES_COM_DIV_FRAC_START3_MODE0		0x0e4
-#define QSERDES_COM_DIV_FRAC_START1_MODE1		0x0e8
-#define QSERDES_COM_DIV_FRAC_START2_MODE1		0x0ec
-#define QSERDES_COM_DIV_FRAC_START3_MODE1		0x0f0
-#define QSERDES_COM_DIV_FRAC_START1_MODE2		0x0f4
-#define QSERDES_COM_VCO_TUNE_MINVAL1			0x0f4
-#define QSERDES_COM_DIV_FRAC_START2_MODE2		0x0f8
-#define QSERDES_COM_VCO_TUNE_MINVAL2			0x0f8
-#define QSERDES_COM_DIV_FRAC_START3_MODE2		0x0fc
-#define QSERDES_COM_CMN_RSVD4				0x0fc
-#define QSERDES_COM_INTEGLOOP_INITVAL			0x100
-#define QSERDES_COM_INTEGLOOP_EN			0x104
-#define QSERDES_COM_INTEGLOOP_GAIN0_MODE0		0x108
-#define QSERDES_COM_INTEGLOOP_GAIN1_MODE0		0x10c
-#define QSERDES_COM_INTEGLOOP_GAIN0_MODE1		0x110
-#define QSERDES_COM_INTEGLOOP_GAIN1_MODE1		0x114
-#define QSERDES_COM_INTEGLOOP_GAIN0_MODE2		0x118
-#define QSERDES_COM_VCO_TUNE_MAXVAL1			0x118
-#define QSERDES_COM_INTEGLOOP_GAIN1_MODE2		0x11c
-#define QSERDES_COM_VCO_TUNE_MAXVAL2			0x11c
-#define QSERDES_COM_RES_TRIM_CONTROL2			0x120
-#define QSERDES_COM_VCO_TUNE_CTRL			0x124
-#define QSERDES_COM_VCO_TUNE_MAP			0x128
-#define QSERDES_COM_VCO_TUNE1_MODE0			0x12c
-#define QSERDES_COM_VCO_TUNE2_MODE0			0x130
-#define QSERDES_COM_VCO_TUNE1_MODE1			0x134
-#define QSERDES_COM_VCO_TUNE2_MODE1			0x138
-#define QSERDES_COM_VCO_TUNE1_MODE2			0x13c
-#define QSERDES_COM_VCO_TUNE_INITVAL1			0x13c
-#define QSERDES_COM_VCO_TUNE2_MODE2			0x140
-#define QSERDES_COM_VCO_TUNE_INITVAL2			0x140
-#define QSERDES_COM_VCO_TUNE_TIMER1			0x144
-#define QSERDES_COM_VCO_TUNE_TIMER2			0x148
-#define QSERDES_COM_SAR					0x14c
-#define QSERDES_COM_SAR_CLK				0x150
-#define QSERDES_COM_SAR_CODE_OUT_STATUS			0x154
-#define QSERDES_COM_SAR_CODE_READY_STATUS		0x158
-#define QSERDES_COM_CMN_STATUS				0x15c
-#define QSERDES_COM_RESET_SM_STATUS			0x160
-#define QSERDES_COM_RESTRIM_CODE_STATUS			0x164
-#define QSERDES_COM_PLLCAL_CODE1_STATUS			0x168
-#define QSERDES_COM_PLLCAL_CODE2_STATUS			0x16c
-#define QSERDES_COM_BG_CTRL				0x170
-#define QSERDES_COM_CLK_SELECT				0x174
-#define QSERDES_COM_HSCLK_SEL				0x178
-#define QSERDES_COM_INTEGLOOP_BINCODE_STATUS		0x17c
-#define QSERDES_COM_PLL_ANALOG				0x180
-#define QSERDES_COM_CORECLK_DIV				0x184
-#define QSERDES_COM_SW_RESET				0x188
-#define QSERDES_COM_CORE_CLK_EN				0x18c
-#define QSERDES_COM_C_READY_STATUS			0x190
-#define QSERDES_COM_CMN_CONFIG				0x194
-#define QSERDES_COM_CMN_RATE_OVERRIDE			0x198
-#define QSERDES_COM_SVS_MODE_CLK_SEL			0x19c
-#define QSERDES_COM_DEBUG_BUS0				0x1a0
-#define QSERDES_COM_DEBUG_BUS1				0x1a4
-#define QSERDES_COM_DEBUG_BUS2				0x1a8
-#define QSERDES_COM_DEBUG_BUS3				0x1ac
-#define QSERDES_COM_DEBUG_BUS_SEL			0x1b0
-#define QSERDES_COM_CMN_MISC1				0x1b4
-#define QSERDES_COM_CMN_MISC2				0x1b8
-#define QSERDES_COM_CORECLK_DIV_MODE1			0x1bc
-#define QSERDES_COM_CORECLK_DIV_MODE2			0x1c0
-#define QSERDES_COM_CMN_RSVD5				0x1c4
-
-#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h
deleted file mode 100644
index 34919720b7bc..000000000000
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h
+++ /dev/null
@@ -1,68 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2017, The Linux Foundation. All rights reserved.
- */
-
-#ifndef QCOM_PHY_QMP_QSERDES_TXRX_V2_H_
-#define QCOM_PHY_QMP_QSERDES_TXRX_V2_H_
-
-/* Only for QMP V2 PHY - TX registers */
-#define QSERDES_V2_TX_BIST_MODE_LANENO			0x000
-#define QSERDES_V2_TX_CLKBUF_ENABLE			0x008
-#define QSERDES_V2_TX_TX_EMP_POST1_LVL			0x00c
-#define QSERDES_V2_TX_TX_DRV_LVL			0x01c
-#define QSERDES_V2_TX_RESET_TSYNC_EN			0x024
-#define QSERDES_V2_TX_PRE_STALL_LDO_BOOST_EN		0x028
-#define QSERDES_V2_TX_TX_BAND				0x02c
-#define QSERDES_V2_TX_SLEW_CNTL				0x030
-#define QSERDES_V2_TX_INTERFACE_SELECT			0x034
-#define QSERDES_V2_TX_RES_CODE_LANE_TX			0x03c
-#define QSERDES_V2_TX_RES_CODE_LANE_RX			0x040
-#define QSERDES_V2_TX_RES_CODE_LANE_OFFSET_TX		0x044
-#define QSERDES_V2_TX_RES_CODE_LANE_OFFSET_RX		0x048
-#define QSERDES_V2_TX_DEBUG_BUS_SEL			0x058
-#define QSERDES_V2_TX_TRANSCEIVER_BIAS_EN		0x05c
-#define QSERDES_V2_TX_HIGHZ_DRVR_EN			0x060
-#define QSERDES_V2_TX_TX_POL_INV			0x064
-#define QSERDES_V2_TX_PARRATE_REC_DETECT_IDLE_EN	0x068
-#define QSERDES_V2_TX_LANE_MODE_1			0x08c
-#define QSERDES_V2_TX_LANE_MODE_2			0x090
-#define QSERDES_V2_TX_LANE_MODE_3			0x094
-#define QSERDES_V2_TX_RCV_DETECT_LVL_2			0x0a4
-#define QSERDES_V2_TX_TRAN_DRVR_EMP_EN			0x0c0
-#define QSERDES_V2_TX_TX_INTERFACE_MODE			0x0c4
-#define QSERDES_V2_TX_VMODE_CTRL1			0x0f0
-
-/* Only for QMP V2 PHY - RX registers */
-#define QSERDES_V2_RX_UCDR_FO_GAIN			0x008
-#define QSERDES_V2_RX_UCDR_SO_GAIN_HALF			0x00c
-#define QSERDES_V2_RX_UCDR_SO_GAIN			0x014
-#define QSERDES_V2_RX_UCDR_SVS_SO_GAIN_HALF		0x024
-#define QSERDES_V2_RX_UCDR_SVS_SO_GAIN_QUARTER		0x028
-#define QSERDES_V2_RX_UCDR_SVS_SO_GAIN			0x02c
-#define QSERDES_V2_RX_UCDR_FASTLOCK_FO_GAIN		0x030
-#define QSERDES_V2_RX_UCDR_SO_SATURATION_AND_ENABLE	0x034
-#define QSERDES_V2_RX_UCDR_FASTLOCK_COUNT_LOW		0x03c
-#define QSERDES_V2_RX_UCDR_FASTLOCK_COUNT_HIGH		0x040
-#define QSERDES_V2_RX_UCDR_PI_CONTROLS			0x044
-#define QSERDES_V2_RX_RX_TERM_BW			0x07c
-#define QSERDES_V2_RX_VGA_CAL_CNTRL1			0x0bc
-#define QSERDES_V2_RX_VGA_CAL_CNTRL2			0x0c0
-#define QSERDES_V2_RX_RX_EQ_GAIN2_LSB			0x0c8
-#define QSERDES_V2_RX_RX_EQ_GAIN2_MSB			0x0cc
-#define QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL1		0x0d0
-#define QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL2		0x0d4
-#define QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL3		0x0d8
-#define QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL4		0x0dc
-#define QSERDES_V2_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1	0x0f8
-#define QSERDES_V2_RX_RX_OFFSET_ADAPTOR_CNTRL2		0x0fc
-#define QSERDES_V2_RX_SIGDET_ENABLES			0x100
-#define QSERDES_V2_RX_SIGDET_CNTRL			0x104
-#define QSERDES_V2_RX_SIGDET_LVL			0x108
-#define QSERDES_V2_RX_SIGDET_DEGLITCH_CNTRL		0x10c
-#define QSERDES_V2_RX_RX_BAND				0x110
-#define QSERDES_V2_RX_RX_INTERFACE_MODE			0x11c
-#define QSERDES_V2_RX_RX_MODE_00			0x164
-#define QSERDES_V2_RX_RX_MODE_01			0x168
-
-#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index a873bdd7bffe..19e91f44e84e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -6,11 +6,9 @@
 #ifndef QCOM_PHY_QMP_H_
 #define QCOM_PHY_QMP_H_
 
-#include "phy-qcom-qmp-qserdes-com.h"
 #include "phy-qcom-qmp-qserdes-txrx.h"
 
 #include "phy-qcom-qmp-qserdes-com-v2.h"
-#include "phy-qcom-qmp-qserdes-txrx-v2.h"
 
 #include "phy-qcom-qmp-qserdes-com-v3.h"
 #include "phy-qcom-qmp-qserdes-txrx-v3.h"
-- 
2.43.0


