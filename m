Return-Path: <linux-arm-msm+bounces-92747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMshK5jTjmlFFQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 08:32:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D8E133973
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 08:32:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97A99303C602
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 07:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A6D26FD93;
	Fri, 13 Feb 2026 07:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVLB5vHx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O2Yn+5Ll"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CCC2F3C18
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 07:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770967916; cv=none; b=JOz5/QwgUrP959H8Gklm8OdSFzRTU8iG2Q3fktKFsVpzO9O5D10My7C5NrAHbVpN+73QG1PWMG7MEc6YKHpt27BIi71Bf4QtZhkvfD6MFZQnsXA3EZNP6qsmBEDraD/aq54P7Cw4+gPH38RgkUV+4MH4mh1P8qVsWdHtExADkoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770967916; c=relaxed/simple;
	bh=MMBXeitiZuY878Tcd7dZwXtn6YzjgtXAK6zo5LiGnbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TTbDQwTVXuPg6Fg2HGmqaZTcWyA/wVOtk4asXa9FWpwSzyHacxy3xMOxa4DdnRevHzt9kMWwAQb/lwr2l8WzI5X/lzRq4K8VUvSmdhdUim9m8jBv1mjfDPF9ujLfKCZOu57ZBIbqaa1qR5X4KSvmfYdaz/iO0mL3nABdscoEmhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVLB5vHx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O2Yn+5Ll; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D2v25v2093464
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 07:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XeRLOEGF763fWVcc6AlQsZ4UUThF/GMTjGHcT0L0/c0=; b=YVLB5vHxhW9WZ096
	U446gyAfYof9GZJ5X+DsjDkfUFrGbTeWU3yXqlaw4N+qCUoYhf3KnYwhrOl8U5bF
	pUAC6P36o4v8lk28n4sjsvkWAtcl2NmhwIrCDktifsmmvPjAbHEmZQpCx/xItgqB
	JeTFt6hfN2TCptNFjkAE/P/WuFf5XdBXB89WPwU9/9Axsi4ORhXxCDXGqs05AA14
	zKuwx0ojKxLCSQy8skbgCS2CsgWha/d0OYXGlh/GDB0ggh+7t6Mm/MnQkp9UDcgE
	rrTxdVO1MBTUjfSuhbTW7XnskEDKpMSkDnlaDsspvwc9uLs55tx9ygYhYnrO4DmU
	VM4N0Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9k6y2muy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 07:31:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c882774f0dso250062685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 23:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770967912; x=1771572712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeRLOEGF763fWVcc6AlQsZ4UUThF/GMTjGHcT0L0/c0=;
        b=O2Yn+5Ll6hfapVFWW5OFfZ+n9HpWsb8Ro4l6HN0hU9OeBaWqCM/P/tzjjG2hMpZfrP
         uj4F7kermGYbk69kxVSm7S77Tqxw1+bxpUZ7cOb36a+LNSyEwKniozTjGCEJKTShGiPf
         BffSzU+CD8FvN9olvvn4qYFXjDkdMKg/bv7xa097wwrl882MQeQZBncBfu0/vNom+cPQ
         ZTIuaGnf4ZcRLyT6n067ZJWxID0OR7Mh8vmNsTBocSnB5e8JlTeQRSGXH0/1CGEBXYLz
         GTg7DHdmW9gwQeSlgpzLM5Fjzxgum+mJyOb70A/x4k0vyd0hmJHgJGpsTR/0OkyT5MfJ
         9M/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770967912; x=1771572712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XeRLOEGF763fWVcc6AlQsZ4UUThF/GMTjGHcT0L0/c0=;
        b=D22eWDKhF1ZXi+qwf5hJERkZfkjPKAOi+XEw+2BD/g+t1xvlR63CZHnutjswfsG54H
         gwZKpQRuFidVYM0B5S5ykZ27mX7QAClEOow4fiiOW1K/qw3WGSPjE+pIS+aLwM/YYPhp
         WPJ+cymUy+NBA/QsgbS2a1ae3RNeh8Fskn2z1D71l00VNwHSGyNUbFLbvopaJmVb4lc0
         E1Hl7S1rG+7exNdvCuo7OHOVZHTHLv/s7Iiet8LFQR2+JTEEnynCsxSANQVP5oFhiHCE
         CtilQxjk9L43NicTI77vTyWrHkTdmx3JHaa2RXYmJdFrlHG2XnL6ZzlwIpeqXR5Tnh1I
         mUow==
X-Gm-Message-State: AOJu0Yz0m3+7qsC5kPNx6EYBfzo0zzavzuEj56loWwYZPKhwKv6r2/cb
	J56yAqBD5k+tactoZfkYEs7NEXdBfeULAA4l2eCI6IpJWZfHIJiFGhNTXTzobOsRkFbunFMHkSO
	F+TXOzh9UwE41HxrgsDx5vsKG3NFCgH005G0yxCaA4C9sYbRkq/ar5DRfvxlG6Lvmk0ag
X-Gm-Gg: AZuq6aJ6XaKZS29tIBC2gzqGBDDljmvEwqLz7h6ll80GlWXxXpPIbBTSoOYlAPrC5nF
	olqlhCodTLdZGLLEv0O4yOdLH7bMkYJ2GfhQwLJune84ShAesF7h4TzUrLIVW9dgYSDpF/3MHBm
	PFrG2eDITO2r0ZLUI2joNZK20qUA8/m4N6cM8ERhcL1hLcVdsapWGa9HKintEQIFVVzhjLXNuwM
	dm2CmcD6+GRZXPHhFK6BFBvFU7mHhmIqnEAArEp5m66kvajC0ilae83rBqcxYJnCl3CNuWr9CCf
	l4ITGfnx7mW8FctgHZxjzQRfgf5y0nJj4sQrFgJBzumjEtSTxP4Y6oEN964SQZlFltOCbQ0lt1f
	l83gT0MwkFEUw0r9HpAhTi2Z7X8DFrS+uRLiuBNuXXZUiZVcEYYpyiMI5Prau1Xj3DocvlTdg8Z
	mQGMuDkEk=
X-Received: by 2002:a05:620a:4809:b0:8c7:1b3c:8e8 with SMTP id af79cd13be357-8cb423c1ecamr101123085a.40.1770967912310;
        Thu, 12 Feb 2026 23:31:52 -0800 (PST)
X-Received: by 2002:a05:620a:4809:b0:8c7:1b3c:8e8 with SMTP id af79cd13be357-8cb423c1ecamr101121885a.40.1770967911743;
        Thu, 12 Feb 2026 23:31:51 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0bda6fsm541156485a.9.2026.02.12.23.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 23:31:51 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 15:31:42 +0800
Subject: [PATCH v2 1/2] phy: qcom: edp: Add eDP/DP mode switch support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260213-edp_phy-v2-1-43c40976435e@oss.qualcomm.com>
References: <20260213-edp_phy-v2-0-43c40976435e@oss.qualcomm.com>
In-Reply-To: <20260213-edp_phy-v2-0-43c40976435e@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770967906; l=8385;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=MMBXeitiZuY878Tcd7dZwXtn6YzjgtXAK6zo5LiGnbg=;
 b=qbTjOlraNg+3CjGW1D9kjHriy/TcD7Anng0ItMYgX6qqV0xIbxb5F3a2e6GNUYzm0SCuunh5p
 2dLRHweALrtBjiKlr3EOrE2pU0+suCf7t8lvH8vk9aVzxNyNIezgtN3
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=NsTcssdJ c=1 sm=1 tr=0 ts=698ed369 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fAMMRUVWeN1gI5VMqOgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA1NyBTYWx0ZWRfXzzRuReU+Kmwt
 EqBP3lZcf7/rll5JmA3Xcqh3cM0CQXgNLAKu+FrwaVCGw6T0b3/hRihS+WKPE8Kn8loM4sCfRoK
 +Lwsevg21fX/hE6D9AmKMc4j4CB0VxQHJj++vBV5+ouUBBFeDqKTBVXWi/rJyRApGxnRyijfIx0
 ozOBT+oUZ5iqvAfv5SBGLYcLm7xo5oQqlt2oyREozJMSF0SeYnaGGTwH3sYSDlZ7IWUqh2epMeq
 VoilY652ovycWfqJuVfcEUf2FQyRUSIhYId03/zmDS7VeidXwJLLGo6dGNVBiffhqRH1aPt2G7S
 Zrb+a/kToy2QyiqEknId6/exbaAMPrneXEijAciiYOBi8Cqy/I9z9G8PbEk8FlIW2SQsdAhS//t
 3tOj0K1y1vg1e14dLyOGeXa69aVcc0bYJCbuYOH2ud5TTzKGBfjImHlYtgVektYI8pmskA0fchz
 OQvCHtFSCBEj1ZtPjTA==
X-Proofpoint-GUID: v3Cqnuk2rLAh81SWOaDSviq4kOvqDHv2
X-Proofpoint-ORIG-GUID: v3Cqnuk2rLAh81SWOaDSviq4kOvqDHv2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130057
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92747-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 27D8E133973
X-Rspamd-Action: no action

The eDP PHY supports both eDP&DP modes, each requires a different table.
The current driver doesn't fully support every combo PHY mode and use
either the eDP or DP table when enable the platform. In addition, some
platforms mismatch between the mode and the table where DP mode uses
the eDP table or eDP mode use the DP table.

Clean up and correct the tables for currently supported platforms based on
the HPG specification.

Here lists the tables can be reused across current platforms.
DP mode：
	-sa8775p/sc7280/sc8280xp/x1e80100
	-glymur
eDP mode(low vdiff):
	-glymur/sa8775p/sc8280xp/x1e80100
	-sc7280

Cc: stable@vger.kernel.org
Fixes: f199223cb490 ("phy: qcom: Introduce new eDP PHY driver")
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 90 ++++++++++++++++++++++---------------
 1 file changed, 53 insertions(+), 37 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 13feab99feec..ff14de41cb1c 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -87,7 +87,8 @@ struct qcom_edp_phy_cfg {
 	bool is_edp;
 	const u8 *aux_cfg;
 	const u8 *vco_div_cfg;
-	const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
+	const struct qcom_edp_swing_pre_emph_cfg *dp_swing_pre_emph_cfg;
+	const struct qcom_edp_swing_pre_emph_cfg *edp_swing_pre_emph_cfg;
 	const struct phy_ver_ops *ver_ops;
 };
 
@@ -116,17 +117,17 @@ struct qcom_edp {
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
@@ -150,6 +151,20 @@ static const struct qcom_edp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg = {
 	.pre_emphasis_hbr3_hbr2 = &dp_pre_emp_hbr2_hbr3,
 };
 
+static const u8 dp_pre_emp_hbr_rbr_v8[4][4] = {
+	{ 0x00, 0x0e, 0x15, 0x1a },
+	{ 0x00, 0x0e, 0x15, 0xff },
+	{ 0x00, 0x0e, 0xff, 0xff },
+	{ 0x00, 0xff, 0xff, 0xff }
+};
+
+static const struct qcom_edp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg_v8 = {
+	.swing_hbr_rbr = &dp_swing_hbr_rbr,
+	.swing_hbr3_hbr2 = &dp_swing_hbr2_hbr3,
+	.pre_emphasis_hbr_rbr = &dp_pre_emp_hbr_rbr_v8,
+	.pre_emphasis_hbr3_hbr2 = &dp_pre_emp_hbr2_hbr3,
+};
+
 static const u8 edp_swing_hbr_rbr[4][4] = {
 	{ 0x07, 0x0f, 0x16, 0x1f },
 	{ 0x0d, 0x16, 0x1e, 0xff },
@@ -158,7 +173,7 @@ static const u8 edp_swing_hbr_rbr[4][4] = {
 };
 
 static const u8 edp_pre_emp_hbr_rbr[4][4] = {
-	{ 0x05, 0x12, 0x17, 0x1d },
+	{ 0x05, 0x11, 0x17, 0x1d },
 	{ 0x05, 0x11, 0x18, 0xff },
 	{ 0x06, 0x11, 0xff, 0xff },
 	{ 0x00, 0xff, 0xff, 0xff }
@@ -172,10 +187,10 @@ static const u8 edp_swing_hbr2_hbr3[4][4] = {
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
@@ -193,25 +208,25 @@ static const u8 edp_phy_vco_div_cfg_v4[4] = {
 	0x01, 0x01, 0x02, 0x00,
 };
 
-static const u8 edp_pre_emp_hbr_rbr_v5[4][4] = {
-	{ 0x05, 0x11, 0x17, 0x1d },
-	{ 0x05, 0x11, 0x18, 0xff },
-	{ 0x06, 0x11, 0xff, 0xff },
-	{ 0x00, 0xff, 0xff, 0xff }
+static const u8 edp_swing_hbr2_hbr3_v3[4][4] = {
+	{ 0x06, 0x11, 0x16, 0x1b },
+	{ 0x0b, 0x19, 0x1f, 0xff },
+	{ 0x18, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff }
 };
 
-static const u8 edp_pre_emp_hbr2_hbr3_v5[4][4] = {
+static const u8 edp_pre_emp_hbr2_hbr3_v3[4][4] = {
 	{ 0x0c, 0x15, 0x19, 0x1e },
-	{ 0x0b, 0x15, 0x19, 0xff },
-	{ 0x0e, 0x14, 0xff, 0xff },
+	{ 0x09, 0x14, 0x19, 0xff },
+	{ 0x0f, 0x14, 0xff, 0xff },
 	{ 0x0d, 0xff, 0xff, 0xff }
 };
 
-static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v5 = {
+static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v3 = {
 	.swing_hbr_rbr = &edp_swing_hbr_rbr,
-	.swing_hbr3_hbr2 = &edp_swing_hbr2_hbr3,
-	.pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr_v5,
-	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3_v5,
+	.swing_hbr3_hbr2 = &edp_swing_hbr2_hbr3_v3,
+	.pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr,
+	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3_v3,
 };
 
 static const u8 edp_phy_aux_cfg_v5[DP_AUX_CFG_SIZE] = {
@@ -262,12 +277,7 @@ static int qcom_edp_phy_init(struct phy *phy)
 	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
 	       edp->edp + DP_PHY_PD_CTL);
 
-	/*
-	 * TODO: Re-work the conditions around setting the cfg8 value
-	 * when more information becomes available about why this is
-	 * even needed.
-	 */
-	if (edp->cfg->swing_pre_emph_cfg && !edp->is_edp)
+	if (!edp->is_edp)
 		aux_cfg[8] = 0xb7;
 
 	writel(0xfc, edp->edp + DP_PHY_MODE);
@@ -291,7 +301,7 @@ static int qcom_edp_phy_init(struct phy *phy)
 
 static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configure_opts_dp *dp_opts)
 {
-	const struct qcom_edp_swing_pre_emph_cfg *cfg = edp->cfg->swing_pre_emph_cfg;
+	const struct qcom_edp_swing_pre_emph_cfg *cfg;
 	unsigned int v_level = 0;
 	unsigned int p_level = 0;
 	u8 ldo_config;
@@ -299,11 +309,10 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
 	u8 emph;
 	int i;
 
-	if (!cfg)
-		return 0;
-
 	if (edp->is_edp)
-		cfg = &edp_phy_swing_pre_emph_cfg;
+		cfg = edp->cfg->edp_swing_pre_emph_cfg;
+	else
+		cfg = edp->cfg->dp_swing_pre_emph_cfg;
 
 	for (i = 0; i < dp_opts->lanes; i++) {
 		v_level = max(v_level, dp_opts->voltage[i]);
@@ -564,20 +573,24 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
 	.is_edp = false,
 	.aux_cfg = edp_phy_aux_cfg_v5,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
-	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 
 static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v4,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v3,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 
 static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v4,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
-	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 
@@ -585,7 +598,8 @@ static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
 	.is_edp = true,
 	.aux_cfg = edp_phy_aux_cfg_v4,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
-	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 
@@ -765,7 +779,8 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
 static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v4,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
-	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v6,
 };
 
@@ -944,7 +959,8 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
 static struct qcom_edp_phy_cfg glymur_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v8,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v8,
-	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v8,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v8,
 };
 

-- 
2.43.0


