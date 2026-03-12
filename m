Return-Path: <linux-arm-msm+bounces-97243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Fp4GbXBsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:37:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D9E272B92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7B1130F575A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFFC3CEBA7;
	Thu, 12 Mar 2026 13:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SFuEJoZk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hgCZopyV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300733C9429
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322214; cv=none; b=c7PA8P3r+I0aAETv5YAmatUwrVToqbgCBlQh/3To9CEQQWPaGa0PXIAOtjPGuvj+XZ3S6yGlbtcmDyo9Dczip5pZjWQkxikOutn2JFoQRECMknycXRVDxm+Lsv/gogV44MaKw45vmH6RMy6Fb40fZh2D2himqMlPsfqGlrBGn+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322214; c=relaxed/simple;
	bh=KD/5YpHJHM0f6NYFyEdCILO6HpJWSM4YvU3pMSgxMM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m3RRUhWCYq510r2ML0ONLkUElkIj3qkm/vChoLAHy+SNDrCX88U/RX1+B1oph2OixcOWQINT9RdKDee2pQn+Za7QzTAQULAw55XaoSL/cSxLgQkqTK9v+V0nwlim7Bk0MWt9WQewkJFUMhjojCBrapiOyDMIdhvtiLTCcFC0B9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SFuEJoZk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hgCZopyV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CA9vLZ263534
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kFSRcCt8po2OuKoAWsGSR2ULXOVtIcBGFxgqU7X+u+o=; b=SFuEJoZkPifOqLUh
	TOLXT6Mw0f82G4qAf58MFms2INup0bIPdOE5eR1gt1bMM1b+W42hVQkRkUXvlVGN
	pbTlQOzsUQy1In7UEvLcu88iALi0cq4GvBdyVnZU+jRFG1/azDPyd1ALEwJFP8ye
	gSz3GRipachh2jrKCvclRbdjt9y0sCrjhzpKTfwAs/HzZqvknjhiabPzOAY1oUhI
	1UqMpdZkFpAFdpsyenGyZR7arBsse/89FYEYmjkmEMH1jd4Vn3VSAZt7WiZgqIU5
	zcwqWknv9hKXuOYRtQezBx4gc5JSL2CJbmp4CeVBYzOrQbDVwiJsez78W9BXsULs
	2TDgew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4yj68k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd77502295so644672485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322211; x=1773927011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kFSRcCt8po2OuKoAWsGSR2ULXOVtIcBGFxgqU7X+u+o=;
        b=hgCZopyVz86vrHFGFM92brCc79aMe/Jl/AdTpH6uEBhDVNaVzj7EsQ7P3XqjaPVvQn
         vt3zRZFtPrNEm0HMHO8jDKLuF3eOAoa0wQP++YlPv30aNxBgWnY8ViP6zkDuBzUOrtfn
         Jfgt2cJv1WUQwziPgKTssl6qhoWCMsx6HBuXDi7nmTgYNkbGBA9gho3p3z3g8DRM/S/9
         IZdjoUdlRZjmVXjpDJ0KCxqkR6DXsAh+rY7v5Khjg0gmVhaGMjXynorLmjnJfYRBoZwn
         w2s7llP3fX+SIbaBXlJzCFpjnyhp/ChzIzzVRlx3Ylg5GQUMYwfUQPlEDeWTauEh5/OQ
         zG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322211; x=1773927011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kFSRcCt8po2OuKoAWsGSR2ULXOVtIcBGFxgqU7X+u+o=;
        b=YUGevc0tec82o+zBqY5KikCdbs2nfOZJDqmWyDdPeKQxtPBKUi51ggTslD78I7nabe
         pqqdKjDfubGZ4O5iQ7xIAd3quydPyIKvu5UGIbTe6h8lLeZb224Lown6mGHtDfGsKb75
         cmB/MG/WnUfDJVGeN9rT8LdNAPp2wkBcNa4ET9mQ7lYVG/6IGFfTLj0q2PO5jMgQb98I
         6JINtGt7vzK6w9R4JQt6pEtaCN1bAowxtyg7Wgw4EWTAgXqUpaluwvdmMwj0nXBf5S2c
         bdD5WXavo6S1h3VWchxLBpgLZxv8O0V0cO42FqqOsfaJQtl0ZePBaA6PI085MBgCWMrS
         gTmw==
X-Gm-Message-State: AOJu0Yw4f/I7h+KJ9Jn1un/Qt4wWc9ZZJSLd+7uSS2BCLjIiDpCK9Phc
	Nk8HHVaDF8FgU6orOouehFIfzHn00DMk6lQsA4lEIrDnIj6ckgLoAxwg/IjFNVUazCp9i1NV90E
	PahjG8bPmOfgSANscwEQoodkX1mRUAB7PdfWNnGEflPF5QbgaQ1SQESzf2vdcMyzVa5hR
X-Gm-Gg: ATEYQzyJl02/+sdIu4g7hsggpXhunsR1GdJUR/UNTlkM35Smn51D7CZ89jWFc0WL6Hq
	rdrRJLXFe2ymP7ZJvmyObn2MNv69eL1i/jI45YdwTDXTH9RiWp3OV0fgGXZX2BaiDos99mp+mqw
	tguGsEIhh3i36A+us3oxA93akdfx3PLLNhvLsMWaOMG51VioVckj/IFDTb9+24ZK5QTsJ1vhY8H
	z8oFK3eP4Sm2xcMcue7gZZ9Bt5YeTyhmpDAU29oxpBoGqElQsIf8/ShTyC9gyFEJkLMjqVrXa4j
	24fAXZCp2s5bYlKfRrqc07I0m5lcWf4XioLYwnXrNotqrIqpToTvePA7oNq6pM+pcff4GyeEy0w
	Qq8Mg+8A/8mcp6ZUluqAoxQRNsVSj2QdcItn+f+xpL7qfhrack8ASLe16tOoB0Pfp03cmkKIb/E
	Pj2rswYFCNbzJ1567iVxyXR7FzgPdm6gLz4jQ=
X-Received: by 2002:a05:620a:bc5:b0:8cd:9365:f277 with SMTP id af79cd13be357-8cda1ac4ed9mr823287385a.62.1773322210567;
        Thu, 12 Mar 2026 06:30:10 -0700 (PDT)
X-Received: by 2002:a05:620a:bc5:b0:8cd:9365:f277 with SMTP id af79cd13be357-8cda1ac4ed9mr823276085a.62.1773322209969;
        Thu, 12 Mar 2026 06:30:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:30:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:44 +0200
Subject: [PATCH v3 23/27] soc: qcom: ubwc: drop ubwc_bank_spread
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-23-b7e8f800176a@oss.qualcomm.com>
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5290;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KD/5YpHJHM0f6NYFyEdCILO6HpJWSM4YvU3pMSgxMM8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+42s6zRoRzNX4/u4arcGCvSNjTR7yJXr8II
 POClR06pQuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/uAAKCRCLPIo+Aiko
 1XXuCACuVSv7Z14BzcGM57AF9mCB9V1GFPY8kEaGQzqdoc4CJV5YQomnGKDlR5SmoEuD17Pv197
 w91pe2dD5CfVOeZ6/IDi20kfpAeEhbLVH8cZkLjar7IarFkkX4lWOrAg4hU5t3Yl8qtFmJNP09L
 QpVe424LpKLScJPJjzzbxhqCa4eN4YCp1O2n5IP8bw42XVTRxlDJEcVj27HHiY8FSutxpC4O8v8
 kq83k6OepvT4fYWxm7/c+hcD/2bFL/URosgaI6RiZF51nZLk3PcV9Pw+O8FWSgBzs0kR1iccM0o
 uaU8DsN/HbOPKnYvgJdkHKn1kA5hq7P/OkxHRmFh8ybHi0Q+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX8bbsjBUZcFGb
 Mp4rf4Y1sGp2DJfZiY+I/0Ddy4/ru/6DUG/Ov1uVovPJmukS3FEXF9FzrWbty13ur+HcsGrC/KM
 s9m1P2zEuSDqDPqjdnVVgGWePik8uqWaMHbZlMc5i515IlrZnz5AyqPYKAuXitTl7l1O9kuuOGC
 JNHuyYYsxR+/L4J4qoWk1FLw5nPHC1PdOd5871iQdZx3rDf4Wsl8KyemijwSRf2/HUMaHRiyRG2
 Nnu6UZJLBm2PHmcDh4IW4rorP4VTr0NhpNczwt5iEi1qeiW4c/D2PLyuUkwiEUheU+LA14+xgnu
 2vlou+RD06nVQw9JyU4yIhYY3Sq5hkaFF2CW7FptOkrBQiwMyTC1T8Gf6c5F3hCpg7xItE6aysa
 ZUcFf0YEoSdG6RBxjjnv5mjclQSFW+TZXZyXpzrUbOqZOFBOVwUdvse8YB26vzgjhiz4+RliaOn
 J1wcFBtSxI+eiyFHjpw==
X-Proofpoint-ORIG-GUID: hWJY2JE8LdxfSmJR7E71hGBQaT_9RO1J
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b2bfe4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=j0qWcOM9GDCbVNQ44DEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: hWJY2JE8LdxfSmJR7E71hGBQaT_9RO1J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97243-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5D9E272B92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

According to the documentation, UBWC bank spreading should be enabled
for all targets. It's just not all targets have separate bit to control
it. Drop the bit from the database and make the helper always return
true. If we need to change it later, the helper can be adjusted
according to the programming guides.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 13 -------------
 include/linux/soc/qcom/ubwc.h  |  3 +--
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index c5c7fcb4d013..070bf97e134e 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -20,7 +20,6 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 };
@@ -49,7 +48,6 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
 static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 13,
 	.macrotile_mode = true,
 };
@@ -58,7 +56,6 @@ static const struct qcom_ubwc_cfg_data sar2130p_data = {
 	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 13,
 	.macrotile_mode = true,
 };
@@ -67,7 +64,6 @@ static const struct qcom_ubwc_cfg_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 14,
 };
 
@@ -75,7 +71,6 @@ static const struct qcom_ubwc_cfg_data sc7280_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 14,
 	.macrotile_mode = true,
 };
@@ -92,7 +87,6 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 };
@@ -116,7 +110,6 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
 			UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 14,
 };
 
@@ -139,7 +132,6 @@ static const struct qcom_ubwc_cfg_data sm6350_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 14,
 };
 
@@ -161,7 +153,6 @@ static const struct qcom_ubwc_cfg_data sm8250_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
@@ -171,7 +162,6 @@ static const struct qcom_ubwc_cfg_data sm8350_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
@@ -181,7 +171,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
@@ -190,7 +179,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_enc_version = UBWC_5_0,
 	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
@@ -199,7 +187,6 @@ static const struct qcom_ubwc_cfg_data sm8750_data = {
 static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_enc_version = UBWC_5_0,
 	.ubwc_swizzle = 0,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index c3f9efae5db8..254721f5ea3c 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -33,7 +33,6 @@ struct qcom_ubwc_cfg_data {
 	 * DDR bank.  This should ideally use DRAM type detection.
 	 */
 	int highest_bank_bit;
-	bool ubwc_bank_spread;
 
 	/**
 	 * @macrotile_mode: Macrotile Mode
@@ -85,7 +84,7 @@ static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg
 
 static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)
 {
-	return cfg->ubwc_bank_spread;
+	return true;
 }
 
 static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3


