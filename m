Return-Path: <linux-arm-msm+bounces-104604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FfMCkUF72ng3wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:42:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA4F46DBB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3ACC30160D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 06:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A82A371043;
	Mon, 27 Apr 2026 06:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WwzjYaFC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A0fmDSJQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD103793BA
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271736; cv=none; b=r28mTcyCH41KPxPOXCs3hCILRpg19f4Q3ZE6L1+acAD26iy6IkecPLpXBTwLPUbjccCq4ViQuPGIA7WFFYV1/ZMNi4/FJ4+0AJ+i64GYfc1XcIq+osRvQl0U4yrhjkX/sT0fKRj0mbr0dYrzKpYZffSNPt35BgTbGfFxFElmN2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271736; c=relaxed/simple;
	bh=Fg3wV9TgWVv5u8ucAiklna4tkeUeVZmRlfG6VfBXnx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S0MYcJFADwJc4f0Doz23Cz6nFSLoCQWnk0BbNjlL8PQxZa/COILs0CAw4Oc1E5vee3Jx36QEw44XuZTdfegBGZy28RQPq0Xr8UK2tRwtnmjLeokZPzPuFf08PZ2mYxYuhG7fATb9IrAGV66+3JUYGReQSrRLOtcosld6mdwrJO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WwzjYaFC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A0fmDSJQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QG2n9K4145503
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ez9CbcraMCzys8o937ycjyhc+fwq8fh4i95qoRSypAE=; b=WwzjYaFCRip1tRTg
	zN8/s0TL7eLSRezkSp622eWr+EkuPXLaqG7SX9v18AbWbZwZPgUGJcMtPBIN/ti/
	Xe/T8kSag8yJ9w7klvnhPHWOHz1ktNAvvHBWmXpRfJZV5dtKQpv6slrRpdIwUE2k
	bAFgVsGxqSlXb7pfpFYpj66rUSqhMWmMrvquqfYfptiH2KeO/4YPrsGnF5roIOPr
	LbRJc6AHqvhCcxbBWiFt1A1AuGtRG5WIetfjATim7kRetc4XsATqiJS39JdudwNr
	JsZHx1t6d7A3typDhSOmf9Sa1ALjNNURvF0SB4rRcDGz5f+h7PrK8LI+4g+A+fTW
	SG+R1Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpcdmp83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:35:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b02af4345fso42732326d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 23:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777271731; x=1777876531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ez9CbcraMCzys8o937ycjyhc+fwq8fh4i95qoRSypAE=;
        b=A0fmDSJQr9CtJ/8abEX2ECsF2Wl8TpaGTMBn+o3zNBggTnuf0592jSykR1Yc9CWRAx
         WLSYkD3Lo6h6A6OitjSKXq2atHVoACpGeYfoR0KoE0kUwuAWsaH/HSLpe+phJcTlYqU5
         88KwxJHAuM6zu1oxBRn3Pk0PQkylRPRyRmw+TJihj0T/fFcFtGcy9niZzum0PkrBO1ik
         9tRKSC1EDS1BhAD3oRGtEhoCiDoOsqy3iidWSs2i9SaraBWsrQZx3KJ5TbtumwL6QdNt
         47OyK2bv/i8Sjv4P87vxIj517pjjKeCNt4QXrzWfs9Ij9PqALImOQa7mfHJNN3I4YRQf
         IC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271731; x=1777876531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ez9CbcraMCzys8o937ycjyhc+fwq8fh4i95qoRSypAE=;
        b=QL7LtGTVvOfEe9iD2ClyHRJPjrX6Bu6UpESGwBGpcViqRr7ohnB85vmC6RAu8Vp1Rr
         RGh9ZoLfY91+AuGPJ2uYrMHgWVZJgH66QnLFD4DD2MI+zsbqHPtAscSJAmG+Qb9lSIE5
         /XdE2QN0eJ6JCXlPFZ3fX9KoyXgNnl+kC8vj6Msg0OpCQIFdZxS5wEzEKU6GHzRSFkyI
         qWwfI37EMdDjO3vuZsqKTjSRLsJScBsygOK0ZaKv/nc7jxFEwFGBemcwDoj+MahXR8Jq
         RAXpIclKoP11A2U/+4zt5NAgsq/Nn1MbGdLR+jt14K8pfBFlPYy0QuyRNrLPjYns7yAk
         qgCQ==
X-Gm-Message-State: AOJu0YwiGWluSof/14y0ayv8ptMHSmm+DGm6DNjmiGFD82bE3MpdpR7X
	6VsRzIhoWSxUWKGGItb87qxeuk49bw5d3O80wzwyo/o2uaeeWmSKRPrWwPHIBEOyk2Y0VEQxyPN
	jaBtF0sOvEyA7hXweXMddbYm4wXMsXkAEF2oSd3MWIs/mpEh4dY6J9zPR3t1c8N2ulADV
X-Gm-Gg: AeBDieshW+UKqbjd/oIF4y4w5mBC/050z4WFdP5QuKCN7WO5qW8IZasNtHsNbOApxVG
	tJZtX1l+HeCiTKlP47FmaFNWO0tdqDFzOND9TuIxPl5avQovRCTthjJTIGKyZY/hyR8fEY9uFBP
	Loopb2LoKiKiYlvoMZpK6bUnpZ6qtTxH+sN4gqPZ+yFT3PL3IUErcsMMcFoPE1QU4HL1VlMbBdJ
	UvcX54a5tcufo85BiZbJKE5qkPpjyfFnv2848aohI8eUf+NdnMA2E2dJMn1OxREYG6KuvoLPSG/
	AxOysf/tHZZvdjL1NyepOmrtOthEXRyy17S6eykHzi21NBwa8Nw4Mz3AKErLot9dXf3bYRWaAmp
	9xJEpzwIEkSOEur2/gv7+1v0zySEcudVF8us1/u0krjYYFuGoHg8MJF27StY6ETSbiZWo96RxAu
	x7NBiQr39eJ8KsT3fXow==
X-Received: by 2002:a05:6214:590b:b0:8ac:ae56:b493 with SMTP id 6a1803df08f44-8b02810c139mr671021166d6.40.1777271731526;
        Sun, 26 Apr 2026 23:35:31 -0700 (PDT)
X-Received: by 2002:a05:6214:590b:b0:8ac:ae56:b493 with SMTP id 6a1803df08f44-8b02810c139mr671020746d6.40.1777271731106;
        Sun, 26 Apr 2026 23:35:31 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac7d4e6sm251899256d6.20.2026.04.26.23.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:35:30 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:35:19 +0800
Subject: [PATCH v5 1/5] phy: qcom: edp: Unify generic DP/eDP swing and
 pre-emphasis tables
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-edp_phy-v5-1-3bb876824475@oss.qualcomm.com>
References: <20260427-edp_phy-v5-0-3bb876824475@oss.qualcomm.com>
In-Reply-To: <20260427-edp_phy-v5-0-3bb876824475@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777271722; l=3980;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=Fg3wV9TgWVv5u8ucAiklna4tkeUeVZmRlfG6VfBXnx0=;
 b=4aMB9c2y017pyM3zsrCgCqjBhc1orRHRVrwWiqxA37pUc948TsHRbjMOqG1C7yMsCh4o26TzM
 MfCtVKXCKkTAUpWwguOnqtLoJGVZFLncfP+Tvml+g+cT2B9gwiB6hGA
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfX26yqpFrow8eo
 7gq6GGjzcRx9NRtdjW9yTrHkW2d8063yuq8qPN/DanN9RpjCkcgo0H08ch/OIIx/VfVuHTNbNee
 +EkHdm6eEgRRzoSkSLZWPCVrmblVCpLz23C20DaoqoENfsmlxpUDMZgvPRvMK5R6GWOTG2xC6UQ
 VAHpzaCVECEUDjkp7Yp0roTMO4lPsZl7RwY4vcH/DLp/ODNGhbFvV+efUSri0npRKrCmd/UPIUC
 5PPWeMkNVlyec1eFJ2eKz4FOije/4vs5wBO6CKB30jsi/0AWMw8TXMPuEdBigVL+2iec4oJ6frN
 +w7dRNT+CFBzrDeNrdbEzyQnuGivX/jhjLhabTrYmjjt50uSNV7Bc7+7s+kEwTRU188HOJx2UdJ
 R2EyKuiHMJtHGe+hsqTeJwBbj5np4YfI3udKrLzu97n/i8p/2JpfZgpqRNS/wQegqD89Ki9dOjE
 hoaRwND4skMY79ALfqg==
X-Authority-Analysis: v=2.4 cv=N5IZ0W9B c=1 sm=1 tr=0 ts=69ef03b4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_hJh01-1qFuxGScrDK8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: UYpyp1HojjPaBoHvrGxTv2tRckqz2UMw
X-Proofpoint-GUID: UYpyp1HojjPaBoHvrGxTv2tRckqz2UMw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270068
X-Rspamd-Queue-Id: 8CA4F46DBB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104604-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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


