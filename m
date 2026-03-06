Return-Path: <linux-arm-msm+bounces-95895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A5MNYUFq2nDZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:49:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D826225728
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E5D53041518
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D780241C0BF;
	Fri,  6 Mar 2026 16:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDBxg8JD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXmojc+l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D1442F55D
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815671; cv=none; b=MzYtuo6Z+RM5Z/UhXQqy426P1TudPTyyZR0HA5Zc3nNbcEhM4Nzsf+1mc9do3PhRA3I2csHCTI0A2rGg0/bR1eqOkaE2dRNgXgPlt+BmYR4uhWhcCRl8qeZC1KkYybzEI+h7vBX8MbktgigSiDdV9q25uTVvaLGUjG3h6Xfy76M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815671; c=relaxed/simple;
	bh=I5lnRHVGhO47eC0F1oaZyDm7ZkFRRSTBKLhGEMk45GY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JHooU8fkKlHa9sj3PACyFP4eksiewYThOFUGtbHevNsQbk+VsG9DuUL6CmjyLg2NF3WCytsRTB3XqCB1v6J34gdaWPjMECuU3thPtUu8lTNqea7GGLPbyc15lILSsxXmT7RB0e4vs7pHFcyz5ZTXtTXEL3/W50+n36kGrlH1bVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDBxg8JD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXmojc+l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FrQ6H2008935
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8B2fY2szI51s2UktTG+lS/Bhx/xmTLE0O8Z2hjeZB3M=; b=PDBxg8JDCSiA3WVR
	enTPdP5d9XO9pAernapCAeIqryYtByS7W/S+OP3dCE1qp4zXuBhbtyPoKJ31jMSi
	rhliyrfKI93sRZ2kQ8+eYSzqrOUwJUmP9kb53KgcIVprxyvTA5NiF0/CoJ2tW9Bh
	Fc518ERGOumHD4cXKFr6QsASPvKhGn60bMs9LsdpvuUSIfw1ngNZoMlQ0PC4Y0oj
	77cv3ifn7WEigftJpvm6MovP91psx4/bJG6NaZ3/U48toTmWp3k3LqU3hK7ptlWR
	yD7hyVVtbLKySjvddKqwUB5JgEUS/2z6TFFiJFbL51KKrVm8jjNTCA5vSKnSDO4+
	AFRUrg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ahcm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4a241582so4744405385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815665; x=1773420465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8B2fY2szI51s2UktTG+lS/Bhx/xmTLE0O8Z2hjeZB3M=;
        b=MXmojc+lDpJo1lofXZV9qxB4Y344SH7n3y/z8ztkOjyknHr/K5DBEhRJhAjf8goqnJ
         sSlI3n9FfC0+bkqj71/f6ymYmhW8CzubkYhwOdiD4asM+GvAG6Cw40YMMMvgE+WJuVsl
         rS0TAHJNoGqvNVma4+NAU3ukjnzSJVL8b4q5snDLhW5Pa6rpxfqcUqELJVoJRk5C8Gxz
         ie19o9MCXeZV7saSQE04yaySGfi35uyXQnKoENetG+5m4OabESuGcMQ+8woQixfIUSgu
         AZSAsPc4DhxM0hcw2hB9ifaB3o/E5lS8VDejKalXEykO5qD6pnhhNT/dHUbIzKQg5dNx
         NOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815665; x=1773420465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8B2fY2szI51s2UktTG+lS/Bhx/xmTLE0O8Z2hjeZB3M=;
        b=atxQ5YoaCNi1Z3t9vUjKy9Ok2tpJn0a9E0osXDD7ekyeXUisyHnDKEUlifR4bFcp/c
         bnFWjU6ho6r0F/feIRr2EAo5a5BoSsuOhN1qmZoK6MJSFqqpDhoDwZWV+ONzd0ZdAIA5
         EJuHBEe7JVU7UYCSw8TXnIKXc3pMtBSWfu+7bll2OmXZXxNweqfA9UgkBqPZCW8LAVNO
         uo5QF6TFNY7qfREeulBZkEyJAgQF3X1a3f2lh1S4vi7GkDp/aiunRc2/6zokc91Sz1zK
         zGDF/x3DhnRDwTsCHMhegWMuhbSnbii4bjlJUvCSUFapAm0dd/21VUxFEoS4UYA5R1l4
         GeFA==
X-Gm-Message-State: AOJu0YxOTGAYRCHo1aWOoH0CU8ctx6GoM36Y3XbKAGyT4P+PEWo4slKl
	7+PkAcQQqjA8w2eGnd3wO8Nh70XR3ku5HEdt0vxGH0EiHhazNCYebbd7Qm2YA9pH/5rIvDteeWc
	H9WZPjb+Erpn5L0V6SbIZth/U9Wkm+Ewsen77UINBLEKHWwDVKXVa+ZWNDegkE3xXllCs
X-Gm-Gg: ATEYQzypzCisRo0SKbYi5zNlbHGBw9htBbcF4/GsU9COORz7lNni184m2uxLyX1hVnm
	cCaSwiBPU7PP5mh0Ry/ylhznBjXaf0wmV59BLVmjnWAaIX+imsFsV5EkxaWccZRluxFFXXyWYfc
	4EICAHksnsY8d0zWnHi6jd+2bvlewKdVqC1rVW5PAXLo67idsWOmE7AvHJ+z1Tu6HiYsMfR4XnI
	Z7CqhBeO3zUIQSo3jP4+z1KyKVoN8ck/4Ren2zbW1R60MiT3zLCf/zlOAiMTClN8T6SMu2nkBtd
	P/7qZKYX9P2aw7tY60l0rgrAH++fUmgqDnzWOUFoxX1q+qOMojJ3g2hHsPoTzEcy97xNbynMlc7
	bNuSuKKkyaqklGp9R8F8ZvStJtaVjjGSSpp10x5/NT261/YacgyI/MoxOdYTouYVIeugQd7X4L3
	PRIHZbFEfgIWL2FzkMKA7eRJu45uVntxJuQQ0=
X-Received: by 2002:a05:620a:4588:b0:8c7:7a3:501c with SMTP id af79cd13be357-8cd6d4285famr320359785a.52.1772815665308;
        Fri, 06 Mar 2026 08:47:45 -0800 (PST)
X-Received: by 2002:a05:620a:4588:b0:8c7:7a3:501c with SMTP id af79cd13be357-8cd6d4285famr320355185a.52.1772815664713;
        Fri, 06 Mar 2026 08:47:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:25 +0200
Subject: [PATCH 19/24] soc: qcom: ubwc: drop ubwc_dec_version
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-19-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7985;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=I5lnRHVGhO47eC0F1oaZyDm7ZkFRRSTBKLhGEMk45GY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUP2OplnHHja4BRO4yhK/fj0N6AFxrAN6uGe
 IpWOa6IgaeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDwAKCRCLPIo+Aiko
 1e8+B/9VHHMj3Z1WJ6gHWxG4HrplPXaGNkLWk9J7IRA0MoH+jP5w3tXUEHYfYE/UJuj10kDg9k+
 WOXq50TAQT7uM9FFbba9r+ufgQEtnfEgC5rlskKCNglsQSKewLV1LQT1bOdck2lHLSNn8wCz9FK
 yCRcNHJe/2PqXdT5Md09RiHWOvhWLLzbIy0UdrOy/l5R56Dmc0G2Cog+L9/eL95sDiWDj+ZR6Js
 HBvI18TIlErDhTDE9Kgal48p9fTf0KTEJy2rbg66vTtl/ry9m7b/JLP3CJ9BKPRpW3KgbfFFq7/
 CAKtTaO1vaTWJi8sNyBMM4SlTOQ3HkCU61Y8QYwjsg9Yrwtg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: DqSJmj4oU3SAek3YgolTes3GhfqxG8hg
X-Proofpoint-ORIG-GUID: DqSJmj4oU3SAek3YgolTes3GhfqxG8hg
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69ab0531 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=LGEa-qlQBoucZRe8vqkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX5GEnvrONFk6b
 9fBMI950hKS9hU568TRL7gUVhStCDQph1wFTnZsty0+YH6qwPkSLafSYDEaTWmJr7Lf7CHI7vFh
 OIPXqvJNSWT3DwVDQgrE1QkSLQ+RepQryoYfDzVR/2mNcxT7c10reAf2MkqvFN3eujmPgUijVY3
 1G2+TWJlCrpXxAGXuj1QCb5Tk92WiHAhOQ6prhoYOWKZxqm9bNngFLIShUErGxOL7ZzaiZ4IZZr
 Z2K0GZn7nuvqQHttDdE5DsGhmfHTcoFmivxCvWi3LDmAyu6XGaPUbTt7P0QYn4lJXVSPSAyE/m/
 Hj+20haWqYtSpd5aZ24dNI2lOi0sLEr8D4W92uwtI68x2vdysbTTHs8jy30TuuZr13CMmol0O5F
 TQXfD3B7ZjMD1xb1hwGbkiy1MG0VNjGfehd0KmIvsyDEwK32yhzTyThTLSL+rGST572jSj4CfBq
 QUqFmLFos/TZW1W12IA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: 8D826225728
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95895-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.935];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The ubwc_dec_version field has been inherited from the MDSS driver and
it is equal to the version of the UBWC decoder in the display block
only. Other IP Cores can have different UBWC decoders and so the version
would vary between blocks.

As the value is no longer used as is not relevant to other UBWC database
consumers, drop it from the UBWC database.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 22 ----------------------
 include/linux/soc/qcom/ubwc.h  |  2 --
 2 files changed, 24 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index e63daf748e30..c5c7fcb4d013 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -18,7 +18,6 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 
 static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
-	.ubwc_dec_version = UBWC_6_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -28,7 +27,6 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_1_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
 			UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
@@ -37,7 +35,6 @@ static const struct qcom_ubwc_cfg_data msm8937_data = {
 
 static const struct qcom_ubwc_cfg_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_1_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
 			UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
@@ -51,7 +48,6 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
 
 static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 13,
@@ -60,7 +56,6 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
 
 static const struct qcom_ubwc_cfg_data sar2130p_data = {
 	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
-	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -70,7 +65,6 @@ static const struct qcom_ubwc_cfg_data sar2130p_data = {
 
 static const struct qcom_ubwc_cfg_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -79,7 +73,6 @@ static const struct qcom_ubwc_cfg_data sc7180_data = {
 
 static const struct qcom_ubwc_cfg_data sc7280_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -89,7 +82,6 @@ static const struct qcom_ubwc_cfg_data sc7280_data = {
 
 static const struct qcom_ubwc_cfg_data sc8180x_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
@@ -98,7 +90,6 @@ static const struct qcom_ubwc_cfg_data sc8180x_data = {
 
 static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -108,7 +99,6 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 
 static const struct qcom_ubwc_cfg_data sdm670_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
@@ -116,7 +106,6 @@ static const struct qcom_ubwc_cfg_data sdm670_data = {
 
 static const struct qcom_ubwc_cfg_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
@@ -124,7 +113,6 @@ static const struct qcom_ubwc_cfg_data sdm845_data = {
 
 static const struct qcom_ubwc_cfg_data sm6115_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
 			UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
@@ -134,7 +122,6 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
 
 static const struct qcom_ubwc_cfg_data sm6125_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
 			UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
@@ -143,7 +130,6 @@ static const struct qcom_ubwc_cfg_data sm6125_data = {
 
 static const struct qcom_ubwc_cfg_data sm6150_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
@@ -151,7 +137,6 @@ static const struct qcom_ubwc_cfg_data sm6150_data = {
 
 static const struct qcom_ubwc_cfg_data sm6350_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -160,7 +145,6 @@ static const struct qcom_ubwc_cfg_data sm6350_data = {
 
 static const struct qcom_ubwc_cfg_data sm7150_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
@@ -168,7 +152,6 @@ static const struct qcom_ubwc_cfg_data sm7150_data = {
 
 static const struct qcom_ubwc_cfg_data sm8150_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
@@ -176,7 +159,6 @@ static const struct qcom_ubwc_cfg_data sm8150_data = {
 
 static const struct qcom_ubwc_cfg_data sm8250_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -187,7 +169,6 @@ static const struct qcom_ubwc_cfg_data sm8250_data = {
 
 static const struct qcom_ubwc_cfg_data sm8350_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -198,7 +179,6 @@ static const struct qcom_ubwc_cfg_data sm8350_data = {
 
 static const struct qcom_ubwc_cfg_data sm8550_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -209,7 +189,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 
 static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_dec_version = UBWC_5_0,
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
@@ -219,7 +198,6 @@ static const struct qcom_ubwc_cfg_data sm8750_data = {
 
 static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_dec_version = UBWC_5_0,
 	.ubwc_swizzle = 0,
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index ddd7b15d9ff1..c5f049eab07d 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -13,8 +13,6 @@
 
 struct qcom_ubwc_cfg_data {
 	u32 ubwc_enc_version;
-	/* Can be read from MDSS_BASE + 0x58 */
-	u32 ubwc_dec_version;
 
 	/**
 	 * @ubwc_swizzle: Whether to enable level 1, 2 & 3 bank swizzling.

-- 
2.47.3


