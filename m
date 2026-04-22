Return-Path: <linux-arm-msm+bounces-104017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKiOCHJk6GnXJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 08:02:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EF14423B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 08:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 100BA300D562
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 06:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F36F2DF138;
	Wed, 22 Apr 2026 06:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="badEfmsv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FASVSOe3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99D62D321B
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776837738; cv=none; b=CsgvelpbjtTVj/g3bW9g9qzK9epUocZPb8MIOvxQlR4eZj79EDm8TKfAxwXrN+lupIdME3TUZHcFTqO925+Sx9cQGNCkpoktVSJWq0Ru5Yb/x7fJzJoW6xr6a8y9BG+Rm8Syy7DbC/595urJd5VxL7SS1WgSb/2wQpMS39JY14k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776837738; c=relaxed/simple;
	bh=ZvT7qgSFLpdex2Ylpf+73VTMqkc/s9oyjE//rNwO4D8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SUzWMzNhtVrOdLjZTPpteB1W86RfwtWNX/o70zexzsGiQ7T+BaddgG2socqwDpsji5/jlCFq5/I5Dmas9EK3+ciwvIrLahaRhagFukhtqdGUVfoof4rEun82ZaYpl8M0B7eZ/ivHjmlF/u3a3StW8ZYzg1EE/tt5mDq25WaSnIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=badEfmsv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FASVSOe3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5NOx53083216
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RxeiI/RoaA52ZR6lVCrFiiEopN9Vii0pOak1OkFKITQ=; b=badEfmsvpHpAJQhp
	ICQAMznRv3FpEPu7vDNpZKWYMhUfOWLWMpJdwbmrHqh6XojE9S6h0Do+pX+1GIPX
	KHnQWW+OoWqkPT+Df/TI8YHO+K7HDK8zYKmEbswvJGwPCqH4bPGktLjW4rcMl2u0
	1YMnSTCN7DDzxgeZYNccwtAdfPUdiqZjEBnqtIxxmRnMIuWTFT6l0g89uW/TsNau
	cJVZcGhUd4jLvwbonMzoB9ffliFmF6i6YiOF8InTqAvISsevz6Chwkf5VMNvrkp8
	Vp0DES3lntiZe50A6oLeqDZ8vAj8gQp+PJ6oUnPHfOPJF+YxW5H6jjvtDaBqDkkb
	hVMzjQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenmhxnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:02:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eb55e55362so594114585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 23:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776837735; x=1777442535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxeiI/RoaA52ZR6lVCrFiiEopN9Vii0pOak1OkFKITQ=;
        b=FASVSOe3kpEoHrAFSkRBLoSHt5Rf9Euf+wtQgPsczQK9u2C8wtAVdUyl6tgGnCwN+t
         CIVGFpDNnY/IoPNHCOCs1tybDXf4cHwCOqoAfDOtRL12L6U/vwRonkXO5LJU+cpNgcgP
         K6IRx5batAp0wyhoo8u8sNqnjt9oQF2mnkpWk9tP+nrDJV2DIwWE2OZmEV46SHcafR0t
         Sz0eKrQMCWPSr4YZ38vSj+vQdqyW+2ANMdZywygmnVtExRubSraVBNjAWcDIL7hzsBY0
         L02A16xFzK1SYW1bkQHDtgacRKRKKv8L4AChP21Ui5m7cd7yIAebNABMCSECNm0zNLEI
         7TuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776837735; x=1777442535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RxeiI/RoaA52ZR6lVCrFiiEopN9Vii0pOak1OkFKITQ=;
        b=FXKSwv/KSmFn95GxyhXhz6mCJ8go+QO1AzVmq+lLJ91EC5sk/79VuqX5TI/cVNUMII
         zGzW1dkxHMUjsOAM12Aowl/NexsvgnLeedor+8yjOQ9rMokfMrvcIIyfIPXUrMeDTOZI
         OclKrm7/bimEZrXiQr+XFjFKtSMwES24I3d0SBbI0TQRDU7fd9WLez1UbeFTiKUrSzQq
         Rgn4xxr4alMkDTftp21s+5yOzxCoyCahHRm0Z48hH+/4S/GU12HxPi7nStsWRadjoHT2
         d76TIDCipp2w6UOUPpCcxYM58rzTP9Os3MlfpvYVOM0uIQycZwx8P/HSurg5AEyI4a3g
         RxpA==
X-Gm-Message-State: AOJu0Yz6CdOo2UZkB2beDBZD/z3k+H0DlwSCuYBSxRdXYm5dH+qIJ8ur
	MR/hBaOYyWYeaQkSkMmNqG4mJpDRmI6zToLddAfh29bDaiDwfAYbWC9j4t5YbPFjoiCB0cIIIRs
	4OlSZ1Sh/gkJ2jzbjOoNDnsGpPi+yBuOxiWCa8yXg9svh3LvpufXqlZwnnTXJkfYmg0ps
X-Gm-Gg: AeBDiev11sbR1nbmhxzJyRoiKdAhsc8WZWQxbX+fKsQLGCWZXrCyEd/CsJAyv5q8YxI
	GyhtRSaoW4UA3wTEAtMMZh8/J7R2RCw7uofl6nbmk1UjLrLYIL7UzmZXGn3g6dINMgYyS+xxEjs
	yf5L5Ing90DNoa9xPwKM+J5o2fQuuaM64P9mNSlcQTSK2up4+zhvfy1s+rCfZwTV5CM9TXsR87g
	AQuAkuTtyQRmCjIug7mNTcKFZlMqKBp1fciMcLQR7lRK9U3nRcbjJxVouehQRMfR2uwpTsZPZme
	pHW/vfxLPoiH04wzP21Uwk5XEgnSH7dLrSU0MgT1vEPUxe3A4CGej1BQABJFMJ2aUagNih8M11b
	oJrsK85GlvAO0nB+JU2EAJkaFjUtNVu8NS7a1iC3ncCKsSkzfsuWBrnQ21E+WXM5j3EOrt4olco
	mndU1dKKg+U11GDY9exg==
X-Received: by 2002:a05:620a:7113:b0:8d6:2958:ec1e with SMTP id af79cd13be357-8e792962a01mr2883073585a.58.1776837734723;
        Tue, 21 Apr 2026 23:02:14 -0700 (PDT)
X-Received: by 2002:a05:620a:7113:b0:8d6:2958:ec1e with SMTP id af79cd13be357-8e792962a01mr2883070385a.58.1776837734282;
        Tue, 21 Apr 2026 23:02:14 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ef12122800sm237379985a.18.2026.04.21.23.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 23:02:13 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:01:51 +0800
Subject: [PATCH v4 1/5] phy: qcom: edp: Unify generic DP/eDP swing and
 pre-emphasis tables
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260422-edp_phy-v4-1-c38bef2d027b@oss.qualcomm.com>
References: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
In-Reply-To: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776837726; l=3913;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=ZvT7qgSFLpdex2Ylpf+73VTMqkc/s9oyjE//rNwO4D8=;
 b=gmbKCn9+ZdWurqtMj/95xmyfSF3k0EhnlaeEItcktX7otzcmwJAqLGkk5szavKagMO9Q0Kq9k
 fDdOFSiOC2lBtRwaMk6qCTwzBLqw6pi17aLJm8Go1fAY2RYMJPBz5Pd
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: x27NuvswE88mis-wJeNV6rT6jD9_d89I
X-Proofpoint-ORIG-GUID: x27NuvswE88mis-wJeNV6rT6jD9_d89I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA1NiBTYWx0ZWRfX0WLKTx5ou+nN
 rMRLDjbNghokebDTARUG4/SDFxBejyRsSwmQfHPJKNpJ8Tbc1PuJjqIlZsdz5HZMp4PyR9LPYjA
 fT/Kc8xtPpYzKYqvUGAQO3Vit8vbVXg8tS4UvjBl33bLdRAli2p+vYT24jHE5lg5pGZmzXKxawC
 Dhi7eHQokX6Wlk/7OQfwAs2vHQjixmFoeTuyNeQDeLJDZOJArU4ruUoQEj7w0vP7+Tc8qzb1BZc
 Cgvq5Fwq+BOTmN0n3BgdpaPEirtsrt60R2XJEGvuTHZ0j+OYmnJd6ezsI5wCZeglz+/vnyRG6Yw
 JYmljcCTOW+0aVRAcKAnhEtZdnlEGgMsDDN3F+rG5PS7G3SaKPZC3LfBPVgUcvrSNASGhDgIMrJ
 TxuzBIgZgNIkCngK/HtC46rbfKxSvHPwOSX4q7oyun0aozwisAZY8OIySqybhLdc77DV5Zctawe
 jqhiEnK1GQL/PaK6KqA==
X-Authority-Analysis: v=2.4 cv=Xd65Co55 c=1 sm=1 tr=0 ts=69e86467 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_hJh01-1qFuxGScrDK8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220056
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104017-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 23EF14423B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The current eDP and DP swing/pre-emphasis tables do not match the HPG
requirements for the supported platforms, correct the table accordingly.

The generic tables which can be shared as follows:

DP mode：
	-sa8775p/sc7280/sc8280xp/x1e80100
	-glymur
	-sc8180x
eDP mode(low vdiff):
	-glymur/sa8775p/sc8280xp/x1e80100
	-sc7280
	-sc8180x

The proper tables for SC8180X and SC7280 will be added in a later patch,
since they need separate table.

Cc: stable@vger.kernel.org
Fixes: f199223cb490 ("phy: qcom: Introduce new eDP PHY driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 41 +++++++++----------------------------
 1 file changed, 10 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 7372de05a0b8..2af3fd63832f 100644
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
 
@@ -945,7 +924,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
 static struct qcom_edp_phy_cfg glymur_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v8,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v8,
-	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
+	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v8,
 };
 

-- 
2.43.0


