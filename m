Return-Path: <linux-arm-msm+bounces-96849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKNHCgLisGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:31:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B37FA25BA0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4D6C321D390
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FF137D130;
	Wed, 11 Mar 2026 03:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ntjZcPHD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FWjMhjzA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938D937A4B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199463; cv=none; b=k1DHRSkn1nwkavWkoUD9tx2FidAbOMM+a+GK8N0hkarbgtbhC6zJ9+gBX5jhUZ48lgbUw92Krbo/kgB/yp0E8QxuGHBePothMwAjcYTqBieBPx4BcG31xMqojYxhjWslyzTANWDmSYPcpJKpbyhtRoQIkgvDBXkXslmYIuh/LDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199463; c=relaxed/simple;
	bh=Q5MIUHiSxbGVEdUF7Mbz0DMJwk2qxjWolhKQbh9xwlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pfmnUub+dUafuPXkWwdlr45x/IsppzFQ0Z4DOpJSFpgGTc/A1a71OdWA0Z0HVfhnbcaZC44EvwlumVB8Rok1K3jqu/V/owySk6+cLN5WxVRvHIu84xczyPTTXlZWpObgTdDTjHuyl4tRhV5XrRB9tqVODsavo135QejPo6U0LbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ntjZcPHD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FWjMhjzA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIn5Af3759633
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+xGen/0FzexLqmKExWBIL2m3ElpzS8KM21Ro0B4OQGs=; b=ntjZcPHDBjyiH+Ti
	3uT19/VXp70spwnBT/rNi8s6cvm2nhF0TSxH2KAr+gklhZN3gE4umhP/9HR7ZGpL
	kf7JqN9yyx4KfkXpBxIYKJ4UidiOEyeyPwg/I/ySANzp6uxlyApuTXB/SDJlRSs0
	g1Mj+jzwUAsgQ2qN/ia8er70JDuFPuZbNikEPmy/9oVhyb+maBgEly8aQt+JZiyH
	1kNroUnXpXNeO2iEZp8hrorHWLv9/5X5al5K00DFtRzZm1qmsZ8oQUeWwojfW9KG
	giqL8xchnC9Ca3auh9iEXM2JheDnXHO32L5QrROntl/n+qPjwojU1bFwI7WixFet
	XICqXg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8uk0hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5fc74c6634aso124432020137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199458; x=1773804258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xGen/0FzexLqmKExWBIL2m3ElpzS8KM21Ro0B4OQGs=;
        b=FWjMhjzAXshuHg6MUO6lp/YDwGwuSLaeXQ8Nc70aGP53BzZAEGA8MpoR8ciawwXaMV
         NVD0hkFnX1A2gcBUy6GGLl1ZyWXizn28ElzgQt6ZrlPAV+H4nYDtR7QuryobzxHDJk+S
         UHjrE4baxnEb1OqofgJRlRnr7gIiasM1eYTGrxCukZBmoS9PPcA1frR8gi5X6nidnR3f
         Q+Drkg1cFXIysEFh59D8KaZLnnPOMjnZcF2OPDLAJQmLmYOw73ch5gqLRw6CnGliPl/w
         NbXQ0k2FtS3UjTDM6IwPo+I4C9HiQyhjHstH9lMijtdz87FXXjozYeJIsZzwkktOeFZs
         ZvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199458; x=1773804258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+xGen/0FzexLqmKExWBIL2m3ElpzS8KM21Ro0B4OQGs=;
        b=uf7p5KAS30qvDNd6A/UYg9r1j01brYIqSXEVvqAtk7C7BtooS27ZzoAhfOEA+4t72Y
         wKx8SQ9B7W6BbGmK10hbUPVTfH5zVNX5YqoDlPpO82MA/d+OeeNGYNRwPSqaZPET6rJd
         QGyVe+XzkWyjJzxxiMraNjH9obuTtN+CcyXDql/PK/O5Ah/snHcu9Bp5qlQcuXFrBFnb
         WSqLhXbheDev/8A3AXSvEnfWLqR28hiojnsm+tccVHZ0R71la1oqodGDafqo60pRLodQ
         VtYe1GZcRtEfULMwHnpYA9sl59KLZrgZkxaP6BUH+F7qUk7GMj1lsXEuQpLlVdHLjBy4
         TYeg==
X-Gm-Message-State: AOJu0YzyNWpA6mZ+7jHH/MqmQYNtnUJixRyOKgHk0mCCGzPMpNpETAPC
	zX5hgskFdqzrGLPzK0ZUBcTjPrQ4S99N/GUeLcG0QBUXjLql85FhGCQ065+P9k3UdfuvtNCBVQ9
	T1WRaVQUVqJVFzQUnNJAkJbCP7r3BNh1DougVG51bwWD3o93rPjKlp3pef7fyDhawMpht
X-Gm-Gg: ATEYQzzNvsv9wrgLn1+IYEVSkAHWLoK31i7054t8YGTrIjsF89bvfy6Co4zECV/3yAF
	5wPG1DwcpzPl6d4OHiVodIJovF29e899Ox4GRrlhxZJKPJY9XNsUVtBmOE+ujB53YxB3DYmMUCu
	5XqL5foKOtYxCwspdQrgRzB/WJ/XM6EwrdCp0XHp+KFCJkUCs0sVImd7s7lX/G9XKGTS2rEG3VD
	BNrXsD1rKJ+r4+DgfnBqTJtXAlZ440t+/RYYxnyvSkBij5d7tNn+fbouCgta4BJzzfimmhY/Zh/
	Xlu2pR2b7wW7yfzFc0YIIMDkgEBSl0EYJ0rjdyAFUgxzj43TXa4tYh+BGZG8MVNWtQWNo+x+BHO
	aBEmEM8vWYZaTJzJ4H6uTPL7CtQN1QwvO2vSJ6GZ4eUFsXtiSSQXxrXiADquyE0BbwpPDgrqP2k
	tErJ17g9cij4HRr5hFtYhTjg0q0GSBZE2uXio=
X-Received: by 2002:a05:6102:512b:b0:5db:ca9e:b57d with SMTP id ada2fe7eead31-601def4f45emr498313137.19.1773199457535;
        Tue, 10 Mar 2026 20:24:17 -0700 (PDT)
X-Received: by 2002:a05:6102:512b:b0:5db:ca9e:b57d with SMTP id ada2fe7eead31-601def4f45emr498300137.19.1773199457034;
        Tue, 10 Mar 2026 20:24:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:24:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:23:17 +0200
Subject: [PATCH v2 23/25] soc: qcom: ubwc: use fixed values for UBWC
 swizzle for UBWC < 4.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-23-69f718f2a1c9@oss.qualcomm.com>
References: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
In-Reply-To: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5999;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Q5MIUHiSxbGVEdUF7Mbz0DMJwk2qxjWolhKQbh9xwlg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAgU3yCGHPGEzdrmenVuVhAY4o838XvB+HzL
 8v84IHDn+yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgIAAKCRCLPIo+Aiko
 1bKrCACbiQPWPt6lqeYVgOqnd3/PZglPIeRLdzx6AB0vn0PZnSQw9mMeNqMYWLZzy0Nm1egQExu
 938S5fN4Ex8OGTAOrpsCDTIkbvGGK0atWpug5K9y2m1o0AczY1a9z/FEogI4eGaDFxn1UgIbL3Q
 AYm3U4+DNRdSo3KhZ91rqQZIJf0ZmLbZDP1ywAbhBljaB54xVOwj6JXLMOX3qPwZg8lqfAUsjaR
 7vh1Rh/hTQB22D6qtjbCRba9XrGwhEI7oiNnzCDTqnJoxyOTjH7MSHb7yVDnS4DvMo5NZ/wZK4X
 PeJP95+X/0cEJnoEGURHFmyaXrBHS6iSzFt0AQH2VnY8fPQD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: jx6oLNX6mHG5CZHl_chpIikmLxJoQtT-
X-Proofpoint-GUID: jx6oLNX6mHG5CZHl_chpIikmLxJoQtT-
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b0e062 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=8a_ODPMxA7UucN5sxwIA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfXysyQqzQhQQ3d
 o5MDgj8qXZtAQdeJHvQysCBwy8oLK6ZBPwH8Bb8DiQb2/N8cHNF3dr2IwAu8xPjXuViwOHzDpup
 dnhpejWLmMTAPaHo3zRm8NPUijQqokQmr885Yff+VNTv9+poxaxlFIygUftTVCaSjjWPzXCjTZX
 CfXCCAmMOExpvupkCa599FakETtL9SJjBc5vDEqUslfLgcNTtUJ8RZkUImwKgehfG/RTs0cuDVX
 c2t2CloIl8yos4hV3JV2MQuV9+5iTtaOQdMpih2lAhExnoGrRvtCZVpg5bgrzxtW07clp9/hKef
 4pAQy2NHqDwkXj9xh1iyQhXk3W1Oe367/JAk1zAKpvmNeNZcClSamw5PDfJpqZMgCx0PVpH/kJn
 QAi+Dcn9mhIc/tYFQr8MYkeEPQZf411pcGqeB6ui0NQEkCArl7fQgIfNzXosDVpklBwoai9AM/n
 HZtSieyF8gmpYNuByJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110026
X-Rspamd-Queue-Id: B37FA25BA0D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96849-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

UBWC devices before 4.0 use standard UBWC swizzle levels. As all the
drivers now use the qcom_ubwc_swizzle() helper, move those values to the
helper, leaving UBWC 4.0+ intact for now.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 34 ----------------------------------
 include/linux/soc/qcom/ubwc.h  | 33 ++++++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 43 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 51de36f5f40b..49edfabb5e18 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -25,17 +25,11 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
-			UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
-			UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 
@@ -52,94 +46,66 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
 
 static const struct qcom_ubwc_cfg_data sar2130p_data = {
 	.ubwc_enc_version = UBWC_3_1,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 13,
 };
 
 static const struct qcom_ubwc_cfg_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sc7280_data = {
 	.ubwc_enc_version = UBWC_3_1,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sc8180x_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sdm670_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 
 static const struct qcom_ubwc_cfg_data sm6115_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
-			UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm6125_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
-			UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm6150_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm6350_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm7150_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm8150_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index d4a0cfb133fa..0cbd20078ada 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -22,9 +22,6 @@ struct qcom_ubwc_cfg_data {
 	 * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
 	 */
 	u32 ubwc_swizzle;
-#define UBWC_SWIZZLE_ENABLE_LVL1	BIT(0)
-#define UBWC_SWIZZLE_ENABLE_LVL2	BIT(1)
-#define UBWC_SWIZZLE_ENABLE_LVL3	BIT(2)
 
 	/**
 	 * @highest_bank_bit: Highest Bank Bit
@@ -55,12 +52,7 @@ static inline const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
 
 static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
 {
-	bool ret = cfg->ubwc_enc_version == UBWC_1_0;
-
-	if (ret && !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL1))
-		pr_err("UBWC config discrepancy - level 1 swizzling disabled on UBWC 1.0\n");
-
-	return ret;
+	return cfg->ubwc_enc_version == UBWC_1_0;
 }
 
 /*
@@ -88,8 +80,31 @@ static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)
 	return true;
 }
 
+#define UBWC_SWIZZLE_ENABLE_LVL1	BIT(0)
+#define UBWC_SWIZZLE_ENABLE_LVL2	BIT(1)
+#define UBWC_SWIZZLE_ENABLE_LVL3	BIT(2)
+
+/**
+ * @qcom_ubwc_swizzle: Whether to enable level 1, 2 & 3 bank swizzling.
+ *
+ * UBWC 1.0 always enables all three levels.
+ * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & 3.
+ * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
+ */
 static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
 {
+	if (cfg->ubwc_enc_version == 0)
+		return 0;
+
+	if (cfg->ubwc_enc_version == UBWC_1_0)
+		return UBWC_SWIZZLE_ENABLE_LVL1 |
+		       UBWC_SWIZZLE_ENABLE_LVL2 |
+		       UBWC_SWIZZLE_ENABLE_LVL3;
+
+	if (cfg->ubwc_enc_version < UBWC_4_0)
+		return UBWC_SWIZZLE_ENABLE_LVL2 |
+		       UBWC_SWIZZLE_ENABLE_LVL3;
+
 	return cfg->ubwc_swizzle;
 }
 

-- 
2.47.3


