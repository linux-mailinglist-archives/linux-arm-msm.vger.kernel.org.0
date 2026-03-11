Return-Path: <linux-arm-msm+bounces-96848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAUlH8nhsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:30:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C3C25B9E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 270F23275DA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939D537B3EF;
	Wed, 11 Mar 2026 03:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPaKyUHK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H5WfBg3l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6B1379EE6
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199459; cv=none; b=RSWse93SBTmWpBFplQbDiB2TQgp3olWd9UVuYg/A21Kx3TmsuRjs9/fOGyLyJ84JTWsxXhQQsIRthfPYOxdv/qZD6U0RRe5AtVkcYXa21DjDUIkKSygzzDnasxF5vYfO2AbW5jlgHyBWVtGvfJe5ATSOnf7Gs2yz/KXKqqu9ZfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199459; c=relaxed/simple;
	bh=v7QXktkShy+wyahjFgEkbZoSxJ/5hj9cJD9SDRJzeIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dTiDG/fxKexRybHpB7q0sKwyC94SZxdXUj5xO0w8Wu+dik3QlN/K9DVT/fYFFThJZXeFz9MMzF6MYFnb2P3KauD9AZ0uuNd3kMvPS+1vp6NR15oQZZ++Bt98XLM9qQQ6fGmTQVjT7GQ4czIXmjMUJ1vbpOdUMLDh7jrOtdD3St4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPaKyUHK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H5WfBg3l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AJQonu3892945
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qJ6Ex/AAn1uIE82cXCit/bkBSE8pPV30Id+vTgVPV2k=; b=EPaKyUHKdbnZr9DO
	Jl+rPoRSMo/b/1qj7cKSv98+8FErd1knh6+Nfmc9qp7QF4NN6NVFj2o8Izz1nr4q
	2xu8IvyFckXkcKg47ygB0sZh3Dfqex21jhlDz0q8JkHJ6/VHnVl68ryNb1XEuWcb
	n2KoWHLhI0/QjvAbqoH8lQt4sSG5jDiT6FVlAbNFU2NDhzu/lBlAKGMbj1iZOUcC
	ucZXNEsEHLUdP4sEFC6U/mAquiNVpErK2rC7eJpnUokJr3sVcSX5hOvzx/BAr2Tj
	mKPBZf+qAvVxST4LOtuKocPM0kP+QLNvI8XJVlULO4oLdZ0a1vRZONmYpoCguSOs
	fZ29Tg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmytwpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:14 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9483e4a8662so19160983241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199454; x=1773804254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJ6Ex/AAn1uIE82cXCit/bkBSE8pPV30Id+vTgVPV2k=;
        b=H5WfBg3lH5dwZXFUZHGaTFgJSeubIrY0EZ0weWwIeGngQfh1PSSJHkS0LjVnhC2jTn
         I3WHzmtP1WukpEl5yZ5ruEabIGFM6jE1d4l2sgYFbd/8byRAHBCrmIKvBrzILxENSDhz
         DmfpUM99LDHGsCt0t3fKJnz1ej86TKr8oMiyUiTf2E2MaeFhIfbJZL9E12UqbZBJ9EQC
         hPSdpMsRiLhWzNalMelqHbNIcCqPwK+fH7q3YgIq4VezWAeBfTlSeX+nL5io9ZVaAdAT
         S9IVfDqkp5pNBCivlMxGTVaeUNfTSfff911rNo1Zwn2ZWN9MLY1acn3tCnXSW+xvD22O
         PymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199454; x=1773804254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qJ6Ex/AAn1uIE82cXCit/bkBSE8pPV30Id+vTgVPV2k=;
        b=h1EftRqrAPKLDN5ght0buXMvGunGo+2L81x2YBnIRWG0Ksj9MyXYP6SfDMgGJ+vsjz
         tRL5fSG//D8bW3Sl2bBcGOMwn63UYdIrsytjr9fuI4bvhqYM3ExNvi+rejvrHz+oVKuM
         QVV09JvChn9DIAlU2SKM7ZjY4klP5TXPghY+t0Z30UFArz8GYngeu6GR4ZjgzBtbhIal
         3OoN7g0A+hCtTzmxOwYvjfxn74d1cajh6f9/K//3seVFVqkXxjKU6tyFkzYpIYneEK/N
         iRblJrrJHeOX+omVhvBZtmpwdSMeHBbaMDvdBzVaY42dQkUux4LwxP/GhXzgugDgSbQx
         C7VA==
X-Gm-Message-State: AOJu0YzfnulXkySFnsfsk/mApVaLXKME2TYVSybZYGbUJrXNWCUGnNYQ
	3fDX7M5ZqudOgMwE5naQ7rnjrGJMsaxfg9juDAW2drCCfupZ2EaoYC/HxN2fzqQpzYLGDZaLnXb
	k+S6lkAKoPBVVF1yxAd7coKGM9EbLL4eOqb16Yjr8ssmaad8/j1a2oa+TggUfcS7vJ4CB
X-Gm-Gg: ATEYQzxmW4OFoa5ZuSVUSH065PFbUt2lG+bpOcUWzabxNPO8/E6WYenqtcPwCu90yo+
	/+X8VdITA73HTJkGuqGexN4WJ3QhX/8ZmCFu4CPKntmCtjPZgh9oLLRKbLEXV+TvhNT0jDdauMA
	09Gy2vaNo0PFPXLJHkdkryWpPgwPX39B+MTE+XS0Dq2tAynaUAf6cQqQ8xj91ciJY+uWXlsDkYl
	gGXELiNYwp/lWN+R7qxqpJ4O8ygHoFPapw1kEiZcyJpamPjcE9Hg+YnqtrcSWC0nH0aUUBBVayj
	e3sJkRimMuAgaVxOA8LFKrKxaLOacwNo3ncYVDwwh/aCyw1axdCFgR5SN3rb6DaoHApr0S27Iir
	ThjpExJ6PIMJhkWkCr8RUyW3cZ3yEy4Bf+fGkgdwTe/AzADt72gaD0PfNzQaC/ontbUm3dBAS+g
	WJp0qrZQxqZvA0BV8lP6zxwV0flosv2LHUiDE=
X-Received: by 2002:a05:6102:3ec5:b0:5ff:be25:8937 with SMTP id ada2fe7eead31-601def8ba4emr391975137.31.1773199453588;
        Tue, 10 Mar 2026 20:24:13 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec5:b0:5ff:be25:8937 with SMTP id ada2fe7eead31-601def8ba4emr391960137.31.1773199453127;
        Tue, 10 Mar 2026 20:24:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:24:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:23:16 +0200
Subject: [PATCH v2 22/25] soc: qcom: ubwc: drop macrotile_mode from the
 database
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-22-69f718f2a1c9@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5167;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=v7QXktkShy+wyahjFgEkbZoSxJ/5hj9cJD9SDRJzeIA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAgj2HgISlUPrvCjaoYzcTVT6py7o6pRHVXU
 feV1EFJ8IyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgIAAKCRCLPIo+Aiko
 1btsB/0USJGa3Ry2R3a+LIu314rqekDLweSXtIqgNDzlrUYrbQwg6E4GFCCStdBj+3P/Msz+nSu
 BzWhP+1FFMXni3U8QZRAw4tTbieehjDHu3PlhUYbKLhvug58fIjAA6glH+qoadvZDRU4kQ3M1vU
 JR/97libKY/j1rRPkQFSq10LBK0Wm/x//0IlAhIW2lrR7S+snqkLC0bClCcUYKt8S5msGvT4Ajy
 VOS2bOcu0/yL2/fhPvCvBhB1g48LT8x0L5HFL5SDKr9WcBnP9JVjKSL1WAa3kAzoYBMT6b3rw3T
 tSkRhUxS9qwsxpn4B6rahz6V17F5QBRQOuTA59ot5n/vEKZi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b0e05e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=lOjMx_-Oxa8n0LcNG1gA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: UBn7sbqsuUoxKMeYNxooolGOhUrk7yaA
X-Proofpoint-ORIG-GUID: UBn7sbqsuUoxKMeYNxooolGOhUrk7yaA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfX44LxdF5nyEi5
 btS8RyzjmUdGsU8Ekg8/DQhrtVd+jT8PGWg85xfOEJ+KIxzKu/CkiNCZPZJL4iaaxIES8vvtZce
 KD9RgCwDj+OD4bTzNNiq1jYGd37rErTCeB/RS37gqjkS7+gpgEUcgcSb15fDXyhs2xa1MsByY+9
 t4P5+6G+t3WEuIlwUNnLnwZdErVFzSmuUmPqSZDHmR0a15wOh6rJbCZYCt2j9OKNODL2IxYAzCu
 5/XQBTCL71sYWgkgbfdQniiWP0KoXibKix9H2Ikf0VQCLGEs8+nfCu/CVGvXUSM159UsuTnD8//
 7on/Q3ugBE3l99FBeCJ03qCr28fgNRuBmsf7tJQ46DsDdSiuM122VuAjqKebgqwH1IqQohDz64W
 qBrcN/62u0+wHYW2h2CzBUVixYKUMjqa17B9meWmIjh4WCTEFVhDXQV0Cr5dWEAU9P6JHF3xpaS
 04qU/+rwtxmX/+ONLzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110026
X-Rspamd-Queue-Id: D3C3C25B9E1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96848-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
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

All the users have been migrated to using qcom_ubwc_macrotile_mode()
instead of reading the raw value from the config structure. Drop the
field from struct qcom_ubwc_cfg_data and replace it with the calculated
value. Split single UBWC_3_0 into UBWC_3_0 (no macrotile mode) and
UBWC_3_1 (with macrotile mode).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 15 ++-------------
 include/linux/soc/qcom/ubwc.h  | 18 ++++++++----------
 2 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 070bf97e134e..51de36f5f40b 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -21,7 +21,6 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data msm8937_data = {
@@ -49,15 +48,13 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 13,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sar2130p_data = {
-	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
+	.ubwc_enc_version = UBWC_3_1,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 13,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sc7180_data = {
@@ -68,11 +65,10 @@ static const struct qcom_ubwc_cfg_data sc7180_data = {
 };
 
 static const struct qcom_ubwc_cfg_data sc7280_data = {
-	.ubwc_enc_version = UBWC_3_0,
+	.ubwc_enc_version = UBWC_3_1,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sc8180x_data = {
@@ -80,7 +76,6 @@ static const struct qcom_ubwc_cfg_data sc8180x_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sc8280xp_data = {
@@ -88,7 +83,6 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sdm670_data = {
@@ -155,7 +149,6 @@ static const struct qcom_ubwc_cfg_data sm8250_data = {
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sm8350_data = {
@@ -164,7 +157,6 @@ static const struct qcom_ubwc_cfg_data sm8350_data = {
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sm8550_data = {
@@ -173,7 +165,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sm8750_data = {
@@ -181,7 +172,6 @@ static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_swizzle = 6,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data glymur_data = {
@@ -189,7 +179,6 @@ static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_swizzle = 0,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 405d83f8d95b..d4a0cfb133fa 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -33,15 +33,6 @@ struct qcom_ubwc_cfg_data {
 	 * DDR bank.  This should ideally use DRAM type detection.
 	 */
 	int highest_bank_bit;
-
-	/**
-	 * @macrotile_mode: Macrotile Mode
-	 *
-	 * Whether to use 4-channel macrotiling mode or the newer
-	 * 8-channel macrotiling mode introduced in UBWC 3.1. 0 is
-	 * 4-channel and 1 is 8-channel.
-	 */
-	bool macrotile_mode;
 };
 
 #define UBWC_1_0 0x10000000
@@ -80,9 +71,16 @@ static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data
 	return cfg->ubwc_enc_version == UBWC_1_0;
 }
 
+/*
+ * @qcom_ubwc_macrotile_mode: whether to use 4-channel or 8-channel macrotiling
+ *
+ * The 8-channel macrotiling mode was introduced in UBWC 3.1.
+ *
+ * Returns: false for the 4-channel and true for 8-channel.
+ */
 static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)
 {
-	return cfg->macrotile_mode;
+	return cfg->ubwc_enc_version >= UBWC_3_1;
 }
 
 static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3


