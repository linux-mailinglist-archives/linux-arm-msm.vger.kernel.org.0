Return-Path: <linux-arm-msm+bounces-83282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3E2C85C25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 16:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6883534D046
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 15:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D03328611;
	Tue, 25 Nov 2025 15:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDUE/uE+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UrzqJND7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9342F32824D
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 15:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764084319; cv=none; b=Z7tMBWxSgegjtfFMy8tPASVkGg1Se+8WkL9L3+nYP7S0sOsPYS2QmOaZfGbkf3K0v3birSIoRpLRj6MbOBUa+LSoO/GS9Qc2LwTdmbvMA8bq8DOu5Yf8CMQUEX/urM6pKVzXAvbMf3Kh2vKGKWpg0eV0H9Kq7OvIHgCnLqSGxOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764084319; c=relaxed/simple;
	bh=7ayFBJ7Y2AmVW7OVfEwWNzmHgzbLjTCXtOnUFO5KOBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W8hejHpLyokGke0Sxv5uCoRsXqlBrWqJ/aCtaSzIqFnDrRnzb8HxuqSNpCT5CDo4n+vpPFMnRZ/Zln9wO99B4VymrK54XynY/1n6aRuJWZwJ6FslR9ftVV//RFsNVLk46LAfN4iK4skL9QMszhMdqnL9ib/enVeLvpw12TieKDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDUE/uE+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UrzqJND7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APBJ7xj1672533
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 15:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DWiu5ksRlljwbgPGyVazaU
	o5FrHk5DQFqyQwrdgB+ug=; b=EDUE/uE+CNi5snlEZoYAho5XEY2RvIHIVt6gls
	TkygaoSNczaqM7u0Wt3laJatSiN0O+Mx9my0kUS65kzuLgCaggkjjHgq7DpY9j4Z
	SBEGHD2wB6F1V/NjqnYiQ0yVP3GDe08TrgUlY1/AowN6T4QDZjUeC7oFO8L7tyLn
	gzBxMDEadNTGTXkoyQ0rpHVkyiqY7pP1hT+rvj1wgbX+Va96ZIzH+ZQtxVHNiH9c
	Hae8XR3JnDRryqrBXFMdH1qh0HR+WsvAZy3+qZ1WaG9emkO0Bo8NXI+7W+aiO4Um
	LShTuT+EuDtlSx10e/QjjXhUMVcEGuPSDPF40FV2CT4Xt3eQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an5w81v3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 15:25:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34740cc80d5so6055450a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 07:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764084316; x=1764689116; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DWiu5ksRlljwbgPGyVazaUo5FrHk5DQFqyQwrdgB+ug=;
        b=UrzqJND7/dk/1kWlvxStNnau9/VHRkFejQWkAqJ9gIiUzLA5n4Wh+elgSwT9+HZF1V
         8NmibJfq9MNpVcfGTqcbr0twDwUBt5McMPHOo4w8lYOdBOMUIDZd272yZQIW4Imhl69w
         UlkJcpZEqwtzJSzG7lnRzJfwIrPkChg8kae0xUI4cAt61+y7sF/DYTzyHnnFcxXyFxpY
         JM1J3uZqVfdwi8s7szLqC7E2+hYizLMxTmyGGIweDlXjxnjOiDLAze/9LYLdGkRVUzrg
         PlFW5DFiLhkIzdJvZaHmBYVTpg8HqUk3QEuLv7GicEQVo+tHTh61HZbCTjx0zZ0NTnr6
         OSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764084316; x=1764689116;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWiu5ksRlljwbgPGyVazaUo5FrHk5DQFqyQwrdgB+ug=;
        b=qSl0N3u7e+VA+Z3ngpsyyELpTAeHaIXgxHVjy4aJnQY6XA96lr7fY9dzntx0akqkUw
         +8zNHSD2zPH+fnh4GlLoEMuDgk6SA4RzKtFGYVi9AIwYN9qFaRRL/c4mB0yiTB4s1fOw
         vlfmPC5PN8nzz5A6oMcUPnp3Qfun9UTvEBucKIo97fsu6Nhqc0CB5hk16lxNGbGJIPrq
         r3nmtFnLtS7S6LW7sT5Obn1A+XZGviPWlgRsYP8pXLWozCB0Kn66jdlPsNtOTTV3FQvV
         kpLtj6AymcmsGz3IVPirTSR4rmQgiYN8C3QUqR8pFz/Skj4Spfl4uYlbNLl3hPbybdWF
         TCNg==
X-Gm-Message-State: AOJu0YwZxBSe2R+O4Vce+B/tb6DwiLXuyjWPa1FkCQo3hwwWNSVeOe4A
	lHBFbx/Zn2nv0Epadvz4FESsDA99zcYJ2vpR/01rEvu27fsLb63tAraR1J5ScvcjpKBW50N4qsS
	E7/6tX8E++N3mXg80b9ta1VYeQ55WJOAxxb3fh1rKpVli1STzhqPgREU/3SgmzQnIZqD3
X-Gm-Gg: ASbGncsFSF55FHmF9MYdLbDIduTz0xeDljnYlNyaIXYzSDtVqgoK8/9UHJ08tKdpceG
	fnlEXyErzwYxphtMt/08HBm8gyOJT3K2bhYGz81/F82xvZK6ovNKKpPYn8N1bWPC6HNvqx0Xjqa
	rTGDx845qSmjE7NqgKwudiEMXxRDW8tNpdneXyV/F/eTYbOZ8hf1TU37JMfkfaAS+rL9QmjGSFa
	C/eYse63xd/jcLPCTvreghpEfwXzksXfoNpUjh3S5Z6y1pAbET9Fb77VVZ63Vax0LTUwpIE60GC
	UCVmjOhF1KAb9l/jC25fHgk5RsdPiuAGIjuyJFv91JgIuCHFBjWyWs5XAqCU3cK5E8id7pEPpeS
	s4mhfkfePi2Y3yyd/xGLhV7KTYXGXkfQ=
X-Received: by 2002:a17:90b:3b86:b0:340:e521:bc73 with SMTP id 98e67ed59e1d1-34733e2d536mr13523446a91.5.1764084316041;
        Tue, 25 Nov 2025 07:25:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwDIciaM8fT4Sm6dek10YkSXKVgkPJBK4nqwfc7HN2+8feblvYmjydOt+c76wRPvDWkXk5CA==
X-Received: by 2002:a17:90b:3b86:b0:340:e521:bc73 with SMTP id 98e67ed59e1d1-34733e2d536mr13523391a91.5.1764084315261;
        Tue, 25 Nov 2025 07:25:15 -0800 (PST)
Received: from hu-vvalluru-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3475ff34831sm1269949a91.5.2025.11.25.07.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:25:14 -0800 (PST)
From: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 20:55:07 +0530
Subject: [PATCH] drm/msm/dsi/phy_7nm: fix rounding error in recalc_rate
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-msm-dsi-phy-7nm-clk-rate-v1-1-17141806e3a0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFLKJWkC/x3MQQqDMBBA0avIrB0wE4zSq4iLGKc62ETJlGIR7
 97Q5Vv8f4FyFlZ4VBdk/ojKngpMXUFYfVoYZS4Gaqg1hlqMGnFWwWP9YpcihteG2b8ZyXVkvZ1
 c7wKU/Mj8lPO/Hsb7/gFyQsTCagAAAA==
X-Change-ID: 20251125-msm-dsi-phy-7nm-clk-rate-26723a3b686c
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764084311; l=1586;
 i=venkata.valluru@oss.qualcomm.com; s=20251028; h=from:subject:message-id;
 bh=7ayFBJ7Y2AmVW7OVfEwWNzmHgzbLjTCXtOnUFO5KOBI=;
 b=/5iu8JRKBCqZ/1D+J2tdQAk946G2v3s0XzkNHK4VQkGvU75y4mVYbPct6TmJ33S1rfHthCMvO
 InWPd3lKk2eAHpI5svS567TmJzpLLrfTKf/LGjmhXacYOjqNqIV/JRE
X-Developer-Key: i=venkata.valluru@oss.qualcomm.com; a=ed25519;
 pk=KEpJdy7/I8HDmNSf6B83x+sFHUNr+mjMNJ2qe4G/zXI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyOCBTYWx0ZWRfX93K0q1RIDhhT
 Cjdm/m6ju60pDUFdpcgo4HpdzkmXcsDwwnNPHV8M1zESL5Y5HnariHBpRRGD25CkeEq4VrKtN6g
 gAcWKH+kpDmM3bj1DkUmiaTgOtlG4lCcLaddrBuBuRObtHeZNbPtnBQRkTf2sIVrqNieJNt1Rle
 3P8WNxHqtT/swnhp5YIpM6jCNYi2OXToZpq25QcKS/BQlxCJC5YE1UgHTzYpqEhwQQYJgcrFNTf
 I9QDWzEHNmB78u7qylLz3o+I1KRKRN3zPFifkSh6XcVxVAxkh9H13aASie6SlqEEP8Fa2TzJlsy
 lIpoEe9eEx8zioLaTskn9B44iMzepRtEL9EPE2q0xcI0eJci2sILppwSC6v7j9guJZo5YNSQQv7
 ZzLYZr103bjBSX7qIOXB/d1Q4l7p+Q==
X-Authority-Analysis: v=2.4 cv=RvTI7SmK c=1 sm=1 tr=0 ts=6925ca5c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=R1ZPujbRWijfOtoOsmYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: qrCpr6qHxaOV94U1J68l0DfkG7eaY_AP
X-Proofpoint-GUID: qrCpr6qHxaOV94U1J68l0DfkG7eaY_AP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250128

Required vco rate is set by programming decimal and fraction
from 64 bit calculation. This programmed rate is not exactly
matching the requested rate and corresponding recalc_rate is
having rounding error due to this delta.

When setting byte_clk and byte_intf_clk from this pll,
set_rate on byte_intf_clk resulting in dividers getting
reprogrammed, which are already set from byte_clk.
Convert this recalc_rate to KHz and back to Hz to round up
this delta in calculation.

Signed-off-by: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 32f06edd21a9..00f20c5a7c73 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -598,6 +598,12 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	pll_freq += div_u64(tmp64, multiplier);
 
 	vco_rate = pll_freq;
+	/*
+	 * Recalculating the rate from dec and frac doesn't end up the rate
+	 * we originally set. Convert the freq to KHz, round it up and
+	 * convert it back to Hz.
+	 */
+	vco_rate = DIV_ROUND_UP_ULL(vco_rate, 1000) * 1000;
 	pll_7nm->vco_current_rate = vco_rate;
 
 	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",

---
base-commit: 63c971af40365ee706c7e24f6a7900d693518f09
change-id: 20251125-msm-dsi-phy-7nm-clk-rate-26723a3b686c

Best regards,
-- 
Prahlad Valluru <venkata.valluru@oss.qualcomm.com>


