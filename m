Return-Path: <linux-arm-msm+bounces-118588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FKoILBqzU2qFdwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 17:30:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DBF74531B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 17:30:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kKSXnsFD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eSIwHuv0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118588-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118588-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DF6B303CEAC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C36E3403E5;
	Sun, 12 Jul 2026 15:29:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4363403E8
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 15:29:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870142; cv=none; b=CSyJz319PRRnYVR4I7bmCnhwFQj1N7zsFsnfXAeJG1B4PhZz2T2FOgOZYY8hkPLLh9+ZA10b7ovHA2h2I5GeDf9Ss13RWtqSIOM+nn2YT1O9kdxT0NU2JTgbhfNMXPNpXjbe3UGLeEvqULAoRL0jy84KdALrRrV3u0V8/J/W/yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870142; c=relaxed/simple;
	bh=vndsUeRg4LFLcX149F4anKCLh9nHIAwuVq42HyJm6zU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5/d+8ITmFrd2pNcfoRkX9yGaqlkMS3qZLh7TPWe/rOlpWLYiiTEROzbB4vsJRGSUV2lxGwUjX6jlwf+AjRkvvM4Ruto9LkyOn7Q3FSOEVLYHvHr7bzxwBQY3p7/SZ6IuUM1zt6z8QGigoFnOWl7glSfBiYqwwxE0EFW59md2JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKSXnsFD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eSIwHuv0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZbL62649011
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 15:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wtn8qmkEProTeRWQ3sXxWz0hSrss8hVGxBGi5v6Q/jk=; b=kKSXnsFDtObkYdm+
	u6R+eevvx5u76k83II0GHLKEVWrgbKCAfjRcJdNl2n4oNaUBb5rkip562ZptkkxP
	rb6jSQ/EMUBZmxifFVSfWj96Zf6/5r8ddDmE0f1CWtUEs6e40UBWZPJx4MNhJ9SP
	Tiei5J1fqNRFgn8U7265+HLNEbpAMuWU+X/tagl4k+bV603Rz3bSmagVUhEeBk+2
	GFjTOlN4RqMBl1YTo5qnaT6Z10Hi4gpv4FQZDazjl1NYyP0Wm64gvVV0TJGAwdSa
	kZ538emDMtAlXZ9bQ/Qp4a38yyEB3QJC7CbdYJLTJo6UDiGJj54onchKR6snONo/
	uXxGtA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe9131xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 15:28:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so3625258a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 08:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783870139; x=1784474939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wtn8qmkEProTeRWQ3sXxWz0hSrss8hVGxBGi5v6Q/jk=;
        b=eSIwHuv0gpaaW0EkacrgDp2p6m3dz2FW8/jOUNv4piefiFTqz6Y9LQ3IvA8+FGCgth
         88Jy9QkDqNHPMNFrL19PB7ymLpMVYRRR9RvnE92+10GEKJqkQZ64emnIZYacNLtDM02F
         xf7B0Lu4Df2I7u3fkB6o7/bAsJDUsNZB/bbc7S/I/3PJGz9opB/alDKj9Zmjs/ewRZrD
         tUS+Qu0selkgVcv+W1xmvBihSI92Hc06/ZE5jXKVf38QM4bNSs7Dm4msn9ayQY105g0B
         +H1G0TYjWYme20DHWlfTvolFyxS/Lm1Oup3MhyHLse47MZrygg/99cWcd1WmydSCJLDx
         7/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783870139; x=1784474939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wtn8qmkEProTeRWQ3sXxWz0hSrss8hVGxBGi5v6Q/jk=;
        b=HlHQy32F08dJQMsI22ac0ugseprilbSv8nmDSJRR1O+05kt5tyVJ5z1j84w9ENI7sU
         3DibeiShCQCWAwiAo89Y5cQju+w60uf0baN33SZurh5pUCPelM9JnxEBM09LqV1US0nM
         1Ze57XsJiiVsKtFTtbag9hQSKpu6cZQuBcIDxbfQ2dGLGKeYfdwJQXWIJVBCtFtx5nJA
         H8Rnwz3Vj2BBYggEZAcOkZdSJ6CU3Wo+aDShw6V4y7QEmp2z75SKwIYXOJDqlrEU92iz
         Pkv3UR6pWFeUHqyYt0hkoMx0PHPAvEMW/hengyTDwScQPvz/STbWYpLWaz0DSzgHlYFV
         LVQQ==
X-Gm-Message-State: AOJu0YwM+x5nQbuLfNjGhA8g+ThIiI0mE+4QbDwcVoyZDFqNq8LoLfkh
	Y1mFBnftHpvzuE9uXiWmXpRKSxyrxFiPPsAVnroVHZ11Kpf8N808eej8veVfSHnDWkbqKe36PVm
	UpPiEBjfdYu54vPiWm0ta4XAbZ1zVk/GUdIBlSsdKgAhDTRn79dsxqh0OVwkpH9NHpnjw
X-Gm-Gg: AfdE7cmZlSvhfY5+b8c0vobCld/IbajKR0mCAYbfxiLiK3kPD2AXfBIIOeGzCArEjkC
	delLeWKadC1DyDLOCGPkmgucri8820sDZFr90qux9Xzra2fdE5ZKyiHiD5WMrY9qhrk2XSdKA29
	YNdOjkf30bXkYEZ3DcyxK6V0dLu6UBVLL0xMEPkKX8TFnvMFgeXioXJlPCynyqCExWo8dm5TA3p
	JvvGoxWLrFajWuTba9x9EJCz+FIOpcnWnnrorixVMnrWGmAJ8bHsHYs7gVnM1BHrc5wWCXQnjVd
	gABC+yT7/O3RtPliwu1bzdgH0s9H9xMQ3y0QlP+BujIFrMM+4WM5HP3P3HfgCGpYZ81pC75Jk1a
	X6GSZ3cHwu5bgJt2KOW+oSniP2RSyqL6GjNnOV471+6qtYW8QaOJYn0Llz0kmpDxW0vldGAdNer
	q6GB6c
X-Received: by 2002:a17:90b:5384:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-38dc777c40cmr6139284a91.34.1783870139000;
        Sun, 12 Jul 2026 08:28:59 -0700 (PDT)
X-Received: by 2002:a17:90b:5384:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-38dc777c40cmr6139253a91.34.1783870138591;
        Sun, 12 Jul 2026 08:28:58 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm41458776eec.24.2026.07.12.08.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:28:58 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 20:58:36 +0530
Subject: [PATCH v6 3/4] phy: qcom-qusb2: Add support for Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-usb-shikra-phy-v6-v6-3-1b3e51bf1541@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783870119; l=1543;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=vndsUeRg4LFLcX149F4anKCLh9nHIAwuVq42HyJm6zU=;
 b=jHE8QHzT6nM/WSa/aeR2TU70HNXWXZZMQfTZ199KDr4Fdirt2KXdhHM6bqaUFFHRR4nIgfaBC
 cBXSG52FqNsAeM1ugNetBk2A5Xzd7X7SJMID/vK8B0f0Iu2z+oVVqz9
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a53b2bb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Pub0nXbp0FV3ozl__XAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE2NSBTYWx0ZWRfX/vZfXCLlQdN0
 jsv7gu0JdiHLCeBtJ4si1CBO3EvmkOvX9Sg3k2OgvdkknMZz4rAi7mix9Z7HZCv/avrn4otq/t6
 tEFZYlabEIP8e/FTHLGjPx8+qj+PBmw=
X-Proofpoint-GUID: OmcyLHWORTJO7xd58CCXxR8DuI7-2VGy
X-Proofpoint-ORIG-GUID: OmcyLHWORTJO7xd58CCXxR8DuI7-2VGy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE2NSBTYWx0ZWRfX3RHaZ8h/3RZK
 ssoGCYtOxIYsBAO751Wy9D66R0yIWgMV421ZvnfgbnkdfGXyZIuGBAFFX+50i9vGZd3x9SuQfY/
 l4TwwS1vyCP3J6wo7TQwmq8Y315wNg9+0GQBYp76QxhpnYByUQSduotHo4IPPOWmVJBz0t4iXUt
 6etts1vAh7n1/T0Jx+DTIBQO/X8bSzdYZLhvqfLb/jVdjVs3XjwMu5FtoQn1JFwXNcmuN9bft7k
 bInphe0QwQXlKAu/bSx0XuCxyMqylTktOtATocbzvUZfHuSDE/J7M3wj9h09H03LV2eZmcPVoVg
 I0A4LUy4ZmqwcHb3AbQNkznTGjUWqPQ898mY/D2zz+UopXEPgfCj0yH2UhWO++0kiIz//EzOw96
 Lag3SQuVqH3RNmjRaJ5ZDF1QgYaZDMh1qZnuBMQKvAD14BV8apCZg9QDlacEWbEg6pJ1oMM+Wsn
 gPg9ZtAPlsoYcIe5RFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120165
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118588-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:xiangxu.yin@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: F2DBF74531B

Add init sequence and phy configuration for Shikra. Since the init
sequence is same as that of QCS615, reuse the existing init table in
Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index b22b3c6adfd3..101c0820023d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -377,6 +377,17 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg = {
 	.mask_core_ready = PLL_LOCKED,
 };
 
+static const struct qusb2_phy_cfg shikra_phy_cfg = {
+	.tbl            = qcs615_init_tbl,
+	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
+	.regs           = msm8996_regs_layout,
+
+	.has_pll_test	= true,
+	.se_clk_scheme_default = true,
+	.disable_ctrl   = CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
+	.mask_core_ready = PLL_LOCKED,
+};
+
 static const struct qusb2_phy_cfg sm6115_phy_cfg = {
 	.tbl		= sm6115_init_tbl,
 	.tbl_num	= ARRAY_SIZE(sm6115_init_tbl),
@@ -953,6 +964,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 	}, {
 		.compatible	= "qcom,sdm660-qusb2-phy",
 		.data		= &sdm660_phy_cfg,
+	}, {
+		.compatible	= "qcom,shikra-qusb2-phy",
+		.data		= &shikra_phy_cfg,
 	}, {
 		.compatible	= "qcom,sm4250-qusb2-phy",
 		.data		= &sm6115_phy_cfg,

-- 
2.34.1


