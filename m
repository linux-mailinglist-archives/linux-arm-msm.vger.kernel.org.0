Return-Path: <linux-arm-msm+bounces-118589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6kmtE+CyU2p1dwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 17:29:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 441767452F5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 17:29:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="A1Pj/Xto";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f2xTVFNj;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118589-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118589-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9D608300461A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C6333F8CA;
	Sun, 12 Jul 2026 15:29:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287A53403E8
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 15:29:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870146; cv=none; b=qxBZboDpLbIVxNf5wl/+4WW0F21DQGAxZkU5xlPN4M9Q+UF0SZ7wtt/b+9Y8Zzt9iIIyI1IlLvhjig2fiEURzVDaZdFgQ3MiF7ixVyTL2JzRNVwcILinFD64wuI+F3sDE69W8sbsm8apAtNiKSCNPcmnDqJwTjIBKyLKJJ4oHtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870146; c=relaxed/simple;
	bh=oVC5UqW8EITu6nRZcu5QBdQbzKRKDsRDWUWaypx17T0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yt49r34ornzMUL8eOVwQRvG8VsD6+M8+ASglhNPN0l/5FnklDHkD2faydJdD0EXFfHHbbCVZ16BauzHf28kto3zyF0BQuo+FWyxGDimFFzBG9qdvfJAdpyiqLMAWxQSmU3gwqK+M4yb8KLU1AAH3nd1JNVybCBoF8tiTKVg1Nec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A1Pj/Xto; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2xTVFNj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZjPc2731885
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 15:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rn7fwHxfFOX/isdk4ukXYQLob0WedKotBlCuMDd7Tzw=; b=A1Pj/XtoFM7XxHP9
	wyM2bF4ZGi5BIEC7PnO/hKbzUNB7jhk34it6ZLZnh8c5ABfIPZ040/liTxz82J9S
	b3cAStN8IImP4IDURDGv2yqvdEItX+9k1FY7acfxuliGVzF8LEqIddZTqFtnecTg
	I/5USWhrG91HSX2QIgEgVHit9phDX0mwiGosn7JOeIYcu6HMpLG+tBzkPF/OaWMP
	1bV6OTLGWt/HSuAAgiRFwnO8ajoH40yL1sXTVZVabFHXSq4VX+R8pcJlBDXvOF/6
	+iEhCMoxSpMRY7+bpw1JArN4EWwmkaJRouLdpne3/k+gSx58PhPIjWV0Z4MDdEVY
	ia52gw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr2xt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 15:29:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38869800848so3963550a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 08:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783870144; x=1784474944; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rn7fwHxfFOX/isdk4ukXYQLob0WedKotBlCuMDd7Tzw=;
        b=f2xTVFNj9u48A3Xc45H9TbQYdNqNN2gY0nWyfYJa73RYUdOxTBdymJ99shKaW9TYgY
         O+GTbJFmb1mstuUjtX1fXPZ1yTcU1Tzb/eYzBZ5UEwqinvFGdH7WDrXhbACLKariRbpQ
         sdwKq/UaRSU8ZYw5H/IMVa7hs64ezoMEQvmdJDo6b5GnvjD6+DXBA0QQeNZutvyG2CGJ
         pOKc30dcFUVcw8c6RUxfUs65HBQ2cgWxuSG/e+J7yjqhBfafY2Iugq4BkTUqy2nxvzHz
         NWvVayvhMru10d26PgkdyVolpPVLItBH7s5OUguR88mVa68Se7hkJuuRO6l1kOvLPy2u
         92Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783870144; x=1784474944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rn7fwHxfFOX/isdk4ukXYQLob0WedKotBlCuMDd7Tzw=;
        b=M4FP5WAAR1kBQ0+Y48ur6hT7IXqOmjzw+r5177B9P3d5eW/qlf5MLEVJXJsWPMBcz6
         JVp/Q7s0krazdjFTROy6TL1uGXCicbTEZdKuDvPF1Wcpx9vpN4rN/dBfGldRFLqOu//V
         p8+gU7+c4a63pgnMYnVsJ8YUlgtUsys765/Rzt6CWRPKmMc6dLc9eVZRGEAS2Sd0oEsq
         fxL2s5yKRjN5kSKS5eiMgvHLgg2w1Xj1dlubsKkBqb2V45PSTl4jP8RU1BNRO4udZ+dM
         yAXpt6OgB7liyjWhTte9eKZ+Tnir560J+U8NJSFPc2AfNMRctDsDPQV0bLdMcMJpnY61
         sn/Q==
X-Gm-Message-State: AOJu0YziTgKuULNnXeJZcdOYhGcEAQQTWi0yk+x3agU6yEHcDpPXCEbg
	zAdhSNT9QqIyeKvEv3CgfuGMmnWQ9AnK0H6mLQtfmeH+XLwzvqM0cXZUZAY102YnEDoT6GWpxYh
	3MP/xqghjaUHmtQUs/H6v/VD78Y+Kg2qjyIkD6Q9/U4uhUMzzqC20q6eu2LEfdlPRaNIz
X-Gm-Gg: AfdE7cknsykFxzY8yKcmJLF4O0XWOPi/BLHhuvS+I5oFEpvSkkSmIj+r+POiDWhs5nq
	XBBsNjlhXIq244U46sJZWS3reLZYI/8eayLiY2eodtGX5p7TtVklm/jo2PdaeZ573c7h4/dWFoH
	RjqjcBRJxab/A8C+LggUqV8NvAUQFhamAb8aQDq5uWhNQx6uE3JUkOj3vNZwoTk9rD9ZGTdI/mx
	NIcLEp1C/u7dPe15eSpCjbQCI8gY9lltIYM3V5qdnn8kC8CmWf5YlFiEr0Ej+4pkYtPuDqwqO2c
	eQHkjPHXVWNVXW32IKTnZ2YRedhhf5r3//FdzKIQSLayh3UoDeKB4hF9ld5sHvnalnRZRwkWbnf
	56C//837QxLKnfnf13Zvwu/0Uzg6s6IlpOyNvTIwwbO8ifH/oAI0iSrKK8TTbnpWpvBMGIZWuwV
	koE4ds
X-Received: by 2002:a17:90b:3d48:b0:380:7d9f:81f1 with SMTP id 98e67ed59e1d1-38dc74c49acmr5752045a91.3.1783870143672;
        Sun, 12 Jul 2026 08:29:03 -0700 (PDT)
X-Received: by 2002:a17:90b:3d48:b0:380:7d9f:81f1 with SMTP id 98e67ed59e1d1-38dc74c49acmr5752030a91.3.1783870143229;
        Sun, 12 Jul 2026 08:29:03 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm41458776eec.24.2026.07.12.08.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:29:02 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 20:58:37 +0530
Subject: [PATCH v6 4/4] phy: qcom: qmp-usbc: Add qmp configuration for
 Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-usb-shikra-phy-v6-v6-4-1b3e51bf1541@oss.qualcomm.com>
References: <20260712-usb-shikra-phy-v6-v6-0-1b3e51bf1541@oss.qualcomm.com>
In-Reply-To: <20260712-usb-shikra-phy-v6-v6-0-1b3e51bf1541@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783870119; l=3641;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=oVC5UqW8EITu6nRZcu5QBdQbzKRKDsRDWUWaypx17T0=;
 b=ozQP1pweyGshCDvd+NcotMZ7kuQNMugzameQ+w6DE040egIGNtWEoFD0v5l+9kJJkxHe02vRj
 +lF10hlDN1nDA/NZtM7rN7iPAArBalmUkgiVo0bCuEx47OXgaedPEDu
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE2NSBTYWx0ZWRfX8rPdVe9NfaDH
 WPvmrDT7uHhu1EWxxirH9hhA4OqoHOmzu47TKnMByj/3I1vov3pw7+Ho9Lies8lxsVrA/6uuoC0
 /mSn7vV+quJC0Sr/HDbibMwfY6TN3Nw=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a53b2c0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=BrUXx0GcgBZ9W2fV7PIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: tPeo3yGl9Afgd_n4TfI5T-_gU3vwdU-l
X-Proofpoint-ORIG-GUID: tPeo3yGl9Afgd_n4TfI5T-_gU3vwdU-l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE2NSBTYWx0ZWRfX9271XOzzCmKC
 gmrkKJ0+C5/PujN7Cd8XapCZjYTZgf4dHs6J29SuMtxyHaqT804WQIkqwBUpWC/OqEiN9V3C6t7
 nEDJRlCmz2pbLYa6CLw2lKXx+r7b6DmYmAIiQnUsZVZ1fEPnUlpasUFW9h+BzgYbHSzbDtWhO69
 /hUXvfTsjamMO1+VhDjjsqgPYQEM2SXa9OlV7/qbKIrFvWJJR0YSMHPswUMx4Ol7ixouYTGikCi
 9MnwoLgxB81hTB3vBDga22DLkvjThFQyHBY87Q009FoFGOEMl7zMwlcTNylLacVWWV4Ko4hPuQA
 qDwkDKUk1pO5jBmypIdJKmAnoElH+j7ilzArd9+7AEmZ3WBddM2SvoT901GpBpIO2AT/NNWC5tu
 SrcgzdFnI4iqG/ykBDFTBXkcG/jH5X5tTQn7wDIfW8kFPH46GUTLtg7zrpAQINp60A5ZuWzamUq
 MtR9AvrLn4tOaYa8JjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120165
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118589-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:xiangxu.yin@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 441767452F5

Add init sequence and phy configuration for the Super Speed port on Shikra
SoC. Also since Shikra uses 3 resets, add support for the third reset and
configure Shikra platform data to use 3 resets.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 53 ++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index ab3055bb5b0c..fa8492b487d7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -512,10 +512,14 @@ static const char * const usb3phy_reset_l[] = {
 	"phy_phy", "phy",
 };
 
-static const char * const usb3dpphy_reset_l[] = {
+static const char * const qcs615_usb3dpphy_reset_l[] = {
 	"phy_phy", "dp_phy",
 };
 
+static const char * const shikra_usb3dpphy_reset_l[] = {
+	"phy_phy", "dp_phy", "phy",
+};
+
 static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {
 	{ .supply = "vdda-phy", .init_load_uA = 68600 },
 	{ .supply = "vdda-pll", .init_load_uA = 14200 },
@@ -680,8 +684,48 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
 	.configure_dp_phy	= qcs615_qmp_configure_dp_phy,
 	.calibrate_dp_phy	= qcs615_qmp_calibrate_dp_phy,
 
-	.reset_list		= usb3dpphy_reset_l,
-	.num_resets		= ARRAY_SIZE(usb3dpphy_reset_l),
+	.reset_list		= qcs615_usb3dpphy_reset_l,
+	.num_resets		= ARRAY_SIZE(qcs615_usb3dpphy_reset_l),
+	.vreg_list		= qmp_phy_qcs615_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
+};
+
+static const struct qmp_phy_cfg shikra_usb3dp_phy_cfg = {
+	.offsets		= &qmp_usbc_usb3dp_offsets_qcs615,
+
+	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
+	.tx_tbl			= qcm2290_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_tx_tbl),
+	.rx_tbl			= qcm2290_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
+	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+
+	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
+
+	.dp_serdes_tbl		= qcs615_dp_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl),
+	.dp_tx_tbl		= qcs615_dp_tx_tbl,
+	.dp_tx_tbl_num		= ARRAY_SIZE(qcs615_dp_tx_tbl),
+
+	.serdes_tbl_rbr		= qcs615_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qcs615_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qcs615_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl_hbr2),
+
+	.swing_tbl		= &qcs615_dp_voltage_swing_hbr2_rbr,
+	.pre_emphasis_tbl	= &qcs615_dp_pre_emphasis_hbr2_rbr,
+
+	.dp_aux_init		= qcs615_qmp_dp_aux_init,
+	.configure_dp_tx	= qcs615_qmp_configure_dp_tx,
+	.configure_dp_phy	= qcs615_qmp_configure_dp_phy,
+	.calibrate_dp_phy	= qcs615_qmp_calibrate_dp_phy,
+
+	.reset_list		= shikra_usb3dpphy_reset_l,
+	.num_resets		= ARRAY_SIZE(shikra_usb3dpphy_reset_l),
 	.vreg_list		= qmp_phy_qcs615_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
 };
@@ -2019,6 +2063,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sdm660-qmp-usb3-phy",
 		.data = &sdm660_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,shikra-qmp-usb3-dp-phy",
+		.data =  &shikra_usb3dp_phy_cfg,
 	}, {
 		.compatible = "qcom,sm6115-qmp-usb3-phy",
 		.data = &qcm2290_usb3phy_cfg,

-- 
2.34.1


