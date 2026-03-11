Return-Path: <linux-arm-msm+bounces-96847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFSyLsjhsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:30:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B36DD25B9DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0516430693D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A481379EC6;
	Wed, 11 Mar 2026 03:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUr9vGEx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBzs+/ID"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C35E37A4B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199457; cv=none; b=Ky6qzkDzSF2+E+OquKHdOP0j1+f/E+EWdscD/MhbAW4TLJ9vcoiPSnWqFUI8Fk04PGem4dK1ATTx1EncgrExftInZo3P3f2MTqMhTUop/cHyXhCBFB+JmM+Qtp155T80YUxdTtsVUqr30a+dHuTedf4uf9QbiNo1i+xftGj/Lx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199457; c=relaxed/simple;
	bh=+PboiHqalsz8Ki46I7DJHtRHTDwCOdkyCS8EhQsYshk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdDRHnq6RhFOaeSglQTusxMoGKFGuYcZ9E//d/qsB/Ci19iHFaDjqL3WBuI5eSloJhtQ5+hj/A0Ugd0La72kLOFZ+JL/Bv8bCK/rXdyIYS1ihgUt5tE/Q51h1Yy2u5KkaF879otnsx8gVV9+opDn+Fpi/ZBHfMLrTUL9QXQZp7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUr9vGEx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBzs+/ID; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3NEKQ2179278
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dqu96+mpnolQbnyrbCx3Z83re/trQ4GAJ/gmtSn1wGg=; b=jUr9vGExhD1NCkZy
	ngLjE0pcNcvEc81iOZ+7OlB8bzHpSQatHErQDnLEEnFNhe7JRHZVgmHQN4Toif0R
	sRFm8qlJwHlmjoKiZtjlLLRrdW/CmwETYNYbU2jAjk0XmGIFfhFR+S9yV/rdx/Cf
	koWYOI9LluW7vdfixVUzyQ2GRD/SdO6CKrZI0zYsA2tsIXdzKKBxb5+CMfOV4PBX
	/nNrfUtn98jsOLGTZAqbV7d3Kk1sk2a2cFoYgUs12oNxYDBOZIcI1Q7/vmKcIOFC
	YvVpRPCgUd+XwRUCsA3vYuEWITDSRz6x3z0zPH7FHchCTcgH1c6HFOjgNjoR3O9w
	mC6sGA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqvsspe6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:12 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffc6cb5980so7079769137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199452; x=1773804252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dqu96+mpnolQbnyrbCx3Z83re/trQ4GAJ/gmtSn1wGg=;
        b=LBzs+/IDQbQ2Ru/8f/IQx2hvnYHtfL28LOCJlgaAUdG8X41n3yN0YGCkLU4A3u2XI7
         p/QQbaB/sI2wdKjJzr9brVqOfud+A7LPKduQqNc12JidEfBOAdDlDUGhpinKsAtxlRDS
         d0QiqDzN+AJLIphX2JF9PFtZbEggA08w6Ex6Y7KNZOjqzzfWJxJQPQkNGexjEK7z/d/7
         q0nt5edQpF+LcC3MfTjIwXQMlgXriWTAtt69091o2YhK5hSXdCkFyhNykTJvasU17g91
         M1KWS/3DJ2rJp/UGCzFy3UFJ0wVd390ILZ1Uss/jpS/qnc/5a6ohzNTW06YGvpKZkDhW
         HR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199452; x=1773804252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dqu96+mpnolQbnyrbCx3Z83re/trQ4GAJ/gmtSn1wGg=;
        b=PCHVoXw0VlFNPCQ8UWsM2gNClwedpiCuIP0uidYdE4rmyWGw61ukoT2sWWpoDl+r4q
         v4cXRHfmtyhkUNVhq5bxh5zoqQHYP5DJzCOCtBhTWGoCABkIVutDHIs7uPQtg6UEArmV
         sY/4tC5h1RibszxoBbV5eE9mEu8U5Gv4KUDrWBJ5C5rpiRgnboU5cLlL54l3AEUjEIPy
         NixQhAe5jcuruGYqx1ZwhYwk1hr0FD5gTeucecyilJahaWzz5EL6AjQ09fYvwpy1JSNL
         apgQnerheCOzpBR+OCb5QDX0053aAiFyXJJAJ/hFmvC+gJ3NOXDo5IejYvir+CMC3LyV
         sRUQ==
X-Gm-Message-State: AOJu0YzbFb7RTaHyK5yOfgGbgKk1orIPyMlEb/5WrsBLCq5qoi60Q2Kz
	Vc9wrpwWLhBC/ZwM/EQ0L6g/OiWrCPOcI+Esg+wsySO4ZUsCIQcLRPb5ArLu3YlMfzBtYHblHXf
	M2EqFyIySvqFzBQmrt/WyVtbuOPmlKZxc47iBvtJcIue4JOuW6asaGBUaf+y/Bira0lTk
X-Gm-Gg: ATEYQzzB3A84ObAVA5cPI/TlKgPi/7WPL72wgf5+lIGvPmHLucf1TsG/UyuAXg9ZW8h
	IGbBVM2vfZo/Mj+rrhpujtMBd6C4ok4Mc69RomeSgo+D7De41/8aksPRnotinDwap4Hl0q8xkN0
	25vqsEo1O/H20zrGAZqPH2E9rD2KdFLycv8S1qQRBRx3yfEVSBtGKldNTukvlZ4Chl7DQoSN3xf
	j3sj62hQG7UJPyZoaRRCxj3rkuAcpDzcAOKwYWGY3u1rgAEwwr3+VqpZnV/shknwhY9HO77vGcD
	H8vMv3WQoHeWqicbYKZ4g6b73Lz0SV3L2GEo6Q7TVhLpp/63jlNa+zf+ZQBStkvptP1a14d3o/A
	n4pulp+qzkYtxW/lxizIoxwMjq5jT5104NFns46TyUWSudyHTlq1RzIoNej4ZFPnK1n87vNHbbe
	2aWG+OXIuSNejuHN1JI8BhTRZJKAJHH20m8Kw=
X-Received: by 2002:a05:6102:3054:b0:600:11e1:2a49 with SMTP id ada2fe7eead31-601deb6fcf3mr375502137.7.1773199452117;
        Tue, 10 Mar 2026 20:24:12 -0700 (PDT)
X-Received: by 2002:a05:6102:3054:b0:600:11e1:2a49 with SMTP id ada2fe7eead31-601deb6fcf3mr375492137.7.1773199451703;
        Tue, 10 Mar 2026 20:24:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:24:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:23:15 +0200
Subject: [PATCH v2 21/25] soc: qcom: ubwc: drop ubwc_bank_spread
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-21-69f718f2a1c9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5290;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+PboiHqalsz8Ki46I7DJHtRHTDwCOdkyCS8EhQsYshk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAgr3F6Gn9p7+6+pWADTaYvdyN4nA918ZGU9
 Xzl+X9VnFqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgIAAKCRCLPIo+Aiko
 1bO2CACq5quSnYP25Dnu/CHxK6BZOMxWDtmUMTmVWccG5Ip8pTlx+oNYBiCiOu9sm2fxx1Sf+iB
 MzyFyNIPUQIQHcHFU1aQ4TW0B71uSdif+O+rR8irJcMSksbb/OhgSx2F4vcWhOACbLXM0EqNjTM
 WrWZxybUcANffXuLdCqcggfV3zF88WNVJi3wcr0xGQtpv6XzaVi6180l6ff4Hd98TZVrwCufx4X
 XdehaTuwx39AuHvFDgau6DYeP32/M2UtQM9KDRLoQIp6z5k90/TNai/s3km0YTWEoERbHEa+bo8
 bJBmJ+1XIeGIPoSLVoPipMFxAA/Qp9kyZpXVLYCfmbRkyjGU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfX2KXs6fuEafC5
 cLX61tl464bsWx92kOG7UVchJRr8y0Joum3ONAy2Z7W55laWnDcd+QgVbG/2cwcU0Tm8YS5ogT3
 hPHVMY51apaI8mKcPFwKAXMYCZ4dHa6TEIY+xj/ws3HoCEM2BCFnyNuBoLVeaK1R8y9M6CTqVwN
 SzxQ3FGRCYfyhhtvFxvy3+uPhwH+FtCxQTqZeTUVrIyqnQMJinirTp1gD5NaHUXaDPieQiwKlkk
 8PehIpUrsOcUvKcowy+m+f8RznXkWOHkuoiyRV55pGrFNNO/mJPcPqoVZO9Clo0dLndz4h1j92k
 f0gm9iyErEmNnLSz4TisjVOPu96DcrX9tWmwkigIwzShLdXvxaf0dj4oEi/Z5heIMbcsg1mzhzU
 dTAmEvb2T9y6xd1+R6QmrL1/2XOEdwJgB1a9KxtKbGmTD+qVOvOqBSnaRKivOQxHtKsDEbnhLOA
 k4EUjHU0zYdDz6DrmpQ==
X-Proofpoint-ORIG-GUID: W_Z6yBFbl9JhclBBGHU9Qxb3W6k4CyZU
X-Authority-Analysis: v=2.4 cv=Lo2fC3dc c=1 sm=1 tr=0 ts=69b0e05c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=j0qWcOM9GDCbVNQ44DEA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: W_Z6yBFbl9JhclBBGHU9Qxb3W6k4CyZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110026
X-Rspamd-Queue-Id: B36DD25B9DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96847-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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
index c5f049eab07d..405d83f8d95b 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -33,7 +33,6 @@ struct qcom_ubwc_cfg_data {
 	 * DDR bank.  This should ideally use DRAM type detection.
 	 */
 	int highest_bank_bit;
-	bool ubwc_bank_spread;
 
 	/**
 	 * @macrotile_mode: Macrotile Mode
@@ -88,7 +87,7 @@ static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg
 
 static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)
 {
-	return cfg->ubwc_bank_spread;
+	return true;
 }
 
 static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3


