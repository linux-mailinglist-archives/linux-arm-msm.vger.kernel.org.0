Return-Path: <linux-arm-msm+bounces-91887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOHBIBJkhGkK2wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:34:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81406F0D78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9760430414DE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 09:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03995392803;
	Thu,  5 Feb 2026 09:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pWC84+fZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DUP7vmII"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD603921FA
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 09:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770283269; cv=none; b=ccpnyY4AOjQ+tIvfSFTOaduiDk9Dh8m2fRKUoZqZ1lYCPk+1+eem2q2dRTLZI3cf793uSI+ZjCwxu118onCkrA5cRct0w4/aHDjtv8pCYlmy7jTSYrH2UvdpfLe3NUZs71t8dT26PtfP0YPlX31A92xHKBIO6gJzvjXMdG++3LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770283269; c=relaxed/simple;
	bh=KR1lfA9py9VcnA7CnaicBd9b1jx1HH4FleZGlA3kwl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S0BuuEsIFYE6Bato2igzUj7kkUZYDYMG+PlTcmwnxrhIR1eiLOoJaXFp8wYom8qmlCscK98l9vwIHSQoSkcLD1xCXwS6/5JnnxrWvfOKOOB2O1phb2jtwjhd9oV7E3riKImMt63gRNzkVMf/hyIvsSKgwoZJDuTo0cmKwdIwgPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pWC84+fZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUP7vmII; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153drgx2103207
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 09:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g3Dgz+3YUHjLoZot0YgIGQm2oT7n6h0PpInYZRGVXIo=; b=pWC84+fZqd0lbnHm
	MlxXXK3vyQUxJh2+9giGlhyiFdtqub/TlAmYW4kWT07wf7DtBYG4/+HIwAZVtVNo
	EWhvANUYDSOLHFnyYggyE4BNDBkdZYmL7DBm2Fa5+diJtDjvBAxyRMQSfoKCniGv
	Zjb6N71NuRpYCLWQwUUnMlr4+RpJ937WFGvKiHPueuGWGC6ahCugFoAkiUX6PKQn
	kSXTe83nvvuT2xX9dytm6wgsmCqtPD+S0u8rj4e+/u3yuQVSFZShd7YrvLTmXyNH
	KfdHYgJArqSKBN3u57ch9Go+sELQO6t6WJp1az16m8Nv3+UWqIP40FYqqTI385gX
	s3cqpA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c44xjkrbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:21:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-894766748f9so47236986d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 01:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770283268; x=1770888068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g3Dgz+3YUHjLoZot0YgIGQm2oT7n6h0PpInYZRGVXIo=;
        b=DUP7vmIIqKAihRRk0Kux62phnik0S8sdPoZgKb3Upp/TEmuC105uVcQAyAt3GX48HT
         mNa0/HMZRLKLwdOEq1tpHgoTlFzs7aAB5nppliUJ+SqH4YhbjAb18Xh16AgXG+RE7F5p
         U+j4r0fPBGf5DwO2LDTI4V3XcUW9TWnHZ0kZK/Meaf92zB559QxApTe7XKlF08hJiaTX
         JPJTuTf1/+Q8IcJecQS82FWKax6R61fAZIgMGLa/OBn5y4oKJiIDo+aeAD0kMXhz3Naw
         WgMP7SWE+D9JAhYZSNLAfnp/AOjt1htLEKF/JF0widz6J6Gi/26d/I0CAjYadDrz81O3
         iU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770283268; x=1770888068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g3Dgz+3YUHjLoZot0YgIGQm2oT7n6h0PpInYZRGVXIo=;
        b=eZMkqPIvxAGFA32nKNVDc24J1DpJd779oL0DnaLTHcPFfuoBCJPjyhmIq5mVGKBLCV
         428nkn6xmhygKh5HuCt1IfGBaRu6ItqrwbfLX702lv7Sw5iyVtam1/4zevAZoH1ayW6L
         sH3cHba25SpCvw7K1RwKmnKsfO/ZL4M3UsT37+zq4TaT5BADA/Kbq+H6ky71EpVnQOrw
         SoSuulS7PR4kAYHVZ+nJZRCsTwf9auBUiSWnV/XJHESEn0Qt6NylCknPaUv0pRie8fh/
         zwxzMyxI62SDG61/+nEV4kEOOzJttcOsntFEvXq04zZtssBLFSmOetsT2Jyv0iJqDNof
         wuCQ==
X-Gm-Message-State: AOJu0YzYpDC4aA6JokDx2H8kzZZoFFEOGIEKIGr2pQa71zhCgzXJvtHv
	a8vlf/6R0Cd1N1rF3gwsepLi/ftglqaSxz7am+0Oyi5oLr+cElL2HNvCLSbSTQA1hoLAhbUwYmV
	iCAZOctyTfR0D0SkEimUFfJG+xToyT/kTYZFkhIC/oOi6DTWWFzKO4xLitCEg0R/JpQ3n
X-Gm-Gg: AZuq6aKEndtM9laEIdC6lIkSgHprFfRteK9Mn0qwIAkOoMIkTd3iWiTD1csXZ4bno4c
	G7QjF2OI6OOC8IpOPWmC+yPn09sH3goXb1CIvAalGVowo9nhjfIRfrq/5XxJO9UsCsxudm9RJtL
	gGiCsiMeeQAxnZRhIYr0zrEILZD+h6HqSR6vmal/9AYna4K8VOt3niIkB2YxHMNuh63+HYmJ2sN
	nhqUrvGJPsLf/af7n23of6Cyh1o/m5vQbPn0wZNlWZEneP956hfLgepf4POnAYkNovr1UU6boLy
	P+abwufFkYkBhSuVDJ1oUvFcadVEBBhTSioMgMAgj3R3fnNqlCT+SQAJhojcFutfYllx0XdHgkq
	sqtw5vWpO74zveTJjGtZEDyPT0FrWvvDZsfKWrcr8CxRWmH6x9+BjE13biMx8fx9WcDxPNYw=
X-Received: by 2002:ad4:4ea3:0:b0:894:7fd1:923a with SMTP id 6a1803df08f44-8952214215dmr80679816d6.24.1770283267825;
        Thu, 05 Feb 2026 01:21:07 -0800 (PST)
X-Received: by 2002:ad4:4ea3:0:b0:894:7fd1:923a with SMTP id 6a1803df08f44-8952214215dmr80679616d6.24.1770283267341;
        Thu, 05 Feb 2026 01:21:07 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ca2fd2c3easm353674885a.32.2026.02.05.01.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 01:21:07 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 05 Feb 2026 17:20:53 +0800
Subject: [PATCH 1/3] phy: qcom: edp: Correct and clean up eDP/DP combo PHY
 configuration values
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-edp_phy-v1-1-231882bbf3f1@oss.qualcomm.com>
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
In-Reply-To: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770283262; l=3768;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=KR1lfA9py9VcnA7CnaicBd9b1jx1HH4FleZGlA3kwl8=;
 b=WNBKT8KCEyDOW5YYauXcAxqX7LU+YIBpPQPP4xwdsKxXfW/61jDxhHC6JSXRZ0LEsYdxIsiA0
 +iBDfr02ygKB/eiglRfgrV53L1MQ4T8FFkNxM/29NRbughvNT4x9Nuv
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=DtpbOW/+ c=1 sm=1 tr=0 ts=69846104 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_hJh01-1qFuxGScrDK8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: rfAh3C6YW7F2ptxxNy1qnH8zr-VaqP0i
X-Proofpoint-ORIG-GUID: rfAh3C6YW7F2ptxxNy1qnH8zr-VaqP0i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NyBTYWx0ZWRfX9haAOs1npfdX
 h2CEk7+5oVGk4dsW5BRj4/4JRMRY/ytT5M5M+ORj35Wc4MiR6ESoceQvBRnL3y8QrQq34mGP5+7
 4uTvz60CC/ZzZ58k3YtS2sSvsX8gNM0/jwjeClhWGzynXV9DQH+/GSRibUxARLsjnru6CAbp/9i
 qS8s6+JVI4IM+aW4PAgtfxLpaT3sXydjhzQ8xxW8pLNNXg8/qGg1aul6szTkopJIxfOlJmbPQuP
 ZWdEqvVzG/beRseHs7QZCvQW4CRMXfHL0fDoRgXEUXULUbaIEf88v5o8p8XwMhvzbYLQjnA/Nqc
 qc+P0WvCX1TBhD1Sl7a13vEBK2kFV0L077+lITNzf9otr9wax0dIm9XsFzmwEQpgaX6FcsHvWcT
 R91uvtJkKOzcEdXqkMnANuwpNDeJRwWR+ixcMyUxibScujlDqkC5TAO+I81Ua/7Tke59miy17P3
 V7957FpHLGV0UhdUF+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050067
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91887-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 81406F0D78
X-Rspamd-Action: no action

According to the current HPG settings, most eDP/DP combo PHYs can reuse the
same configuration values.
DP mode：
	-sa8775p/sc7280/sc8280xp/x1e80100
	-glymur
eDP mode(low vdiff):
	-glymur/sa8775p/sc8280xp/x1e80100
	-sc7280
The current driver still keeps multiple versions of these tables and
doesn't fully support every combo PHY mode. This patch removes the
redundant configs and keeps only the sets we actually use, matching the
platforms listed above.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 41 +++++++++----------------------------
 1 file changed, 10 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 13feab99feec..10cbb7d9a8a0 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -116,17 +116,17 @@ struct qcom_edp {
 };
 
 static const u8 dp_swing_hbr_rbr[4][4] = {
-	{ 0x08, 0x0f, 0x16, 0x1f },
+	{ 0x07, 0x0f, 0x16, 0x1f },
 	{ 0x11, 0x1e, 0x1f, 0xff },
 	{ 0x16, 0x1f, 0xff, 0xff },
 	{ 0x1f, 0xff, 0xff, 0xff }
 };
 
 static const u8 dp_pre_emp_hbr_rbr[4][4] = {
-	{ 0x00, 0x0d, 0x14, 0x1a },
+	{ 0x00, 0x0e, 0x15, 0x1a },
 	{ 0x00, 0x0e, 0x15, 0xff },
 	{ 0x00, 0x0e, 0xff, 0xff },
-	{ 0x03, 0xff, 0xff, 0xff }
+	{ 0x04, 0xff, 0xff, 0xff }
 };
 
 static const u8 dp_swing_hbr2_hbr3[4][4] = {
@@ -158,7 +158,7 @@ static const u8 edp_swing_hbr_rbr[4][4] = {
 };
 
 static const u8 edp_pre_emp_hbr_rbr[4][4] = {
-	{ 0x05, 0x12, 0x17, 0x1d },
+	{ 0x05, 0x11, 0x17, 0x1d },
 	{ 0x05, 0x11, 0x18, 0xff },
 	{ 0x06, 0x11, 0xff, 0xff },
 	{ 0x00, 0xff, 0xff, 0xff }
@@ -172,10 +172,10 @@ static const u8 edp_swing_hbr2_hbr3[4][4] = {
 };
 
 static const u8 edp_pre_emp_hbr2_hbr3[4][4] = {
-	{ 0x08, 0x11, 0x17, 0x1b },
-	{ 0x00, 0x0c, 0x13, 0xff },
-	{ 0x05, 0x10, 0xff, 0xff },
-	{ 0x00, 0xff, 0xff, 0xff }
+	{ 0x0c, 0x15, 0x19, 0x1e },
+	{ 0x0b, 0x15, 0x19, 0xff },
+	{ 0x0e, 0x14, 0xff, 0xff },
+	{ 0x0d, 0xff, 0xff, 0xff }
 };
 
 static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
@@ -193,27 +193,6 @@ static const u8 edp_phy_vco_div_cfg_v4[4] = {
 	0x01, 0x01, 0x02, 0x00,
 };
 
-static const u8 edp_pre_emp_hbr_rbr_v5[4][4] = {
-	{ 0x05, 0x11, 0x17, 0x1d },
-	{ 0x05, 0x11, 0x18, 0xff },
-	{ 0x06, 0x11, 0xff, 0xff },
-	{ 0x00, 0xff, 0xff, 0xff }
-};
-
-static const u8 edp_pre_emp_hbr2_hbr3_v5[4][4] = {
-	{ 0x0c, 0x15, 0x19, 0x1e },
-	{ 0x0b, 0x15, 0x19, 0xff },
-	{ 0x0e, 0x14, 0xff, 0xff },
-	{ 0x0d, 0xff, 0xff, 0xff }
-};
-
-static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v5 = {
-	.swing_hbr_rbr = &edp_swing_hbr_rbr,
-	.swing_hbr3_hbr2 = &edp_swing_hbr2_hbr3,
-	.pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr_v5,
-	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3_v5,
-};
-
 static const u8 edp_phy_aux_cfg_v5[DP_AUX_CFG_SIZE] = {
 	0x00, 0x13, 0xa4, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x00,
 };
@@ -564,7 +543,7 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
 	.is_edp = false,
 	.aux_cfg = edp_phy_aux_cfg_v5,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
-	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
+	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 
@@ -944,7 +923,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
 static struct qcom_edp_phy_cfg glymur_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v8,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v8,
-	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
+	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v8,
 };
 

-- 
2.43.0


