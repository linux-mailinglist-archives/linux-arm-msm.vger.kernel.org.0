Return-Path: <linux-arm-msm+bounces-110447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oE5JOw7OG2prGQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 07:58:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C9F614A0F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 07:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CA1D3066AB6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 05:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349FF3093C6;
	Sun, 31 May 2026 05:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kLnXbKzl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OVoM6Kx/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E241F32470A
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 05:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780206949; cv=none; b=cCMc9hnDyBhERTIcr4AcqklK3eXvej5XCvSsAdBfyoc9qVzatQsvPjnpE/LShxft/UMWVL2KxMrXIom2USgf5jOuKiYNd/pHmSdJen12gzb5b3FpDA7fHP6qHraA/JQe3IxDwQ+Gp4haARyXjw/8Aigpk4NiW5IapRIORlp54V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780206949; c=relaxed/simple;
	bh=GAAkIIXQjYZWxC6zM1mlm9QigG1B8h92fJVsYMtHq4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=noUTgwFJgQoOaUDi6L1XsaTps/O5E8YfY1k68AIV2uMDiQQKPCEMSavZXcIyTRpvM4XMqkOXwmbGs06xALig/bIileMI6eZtYxoV4a9beG32YduUKA32JbRlmp7v00JJT7OmIlP20jT/NPND49h7MHu7yY5rQBin5wkA6Serh0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kLnXbKzl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OVoM6Kx/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64V1RobN3903749
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 05:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FXD5gNIRtvmr4+Do3wK68iROsdsaJkUKKy74Ap4MRV8=; b=kLnXbKzlwyN7Ykqc
	yrh4wD6vfzhwZqdC9Ea9+0Ez6f3XZar9CRdsMyD6oh4Ol79sSt0fqu/Kew7hELJM
	WEg9tYwThhSK/3QlEKfTpzfHFEd9Wacg94nNZZ2NhrOjmeDd1yC2EUAQGt4bmK78
	n1wM12IgNzIi8BA8uer46L/W+Chg+u3vd4U8nzKilhDEs9asiQ4Bt4vmq/PfXVdy
	g1QP4g//GarbqiTKMuSTQpeR8ZTMjRYzNAWoqZMwhs5AHCQa19rpgVowbKosjIz+
	C5SpTnYsmcSkN6qOHNObDEyoHTcAVUtW+SNfLiccwQe87Rny6LlF+0LsZepOihTN
	nPToMg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efqfxtxbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 05:55:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0bf6904a6so6725835ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 22:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780206946; x=1780811746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXD5gNIRtvmr4+Do3wK68iROsdsaJkUKKy74Ap4MRV8=;
        b=OVoM6Kx/7QyN+S0TEos07JyMHPSG7ZDiyQaKD+ECnBZb6fKqJAuX9snM+/bllztx2y
         DyTtp+7Qnhc+p6HkqSZv2vYo+dHHAjnKqd658g6KYSZ0PBT58Hz8Iw+pBsl+7cY73ng0
         17Ec2P6G59bcZ//UCZ51G4fk6oubj8Wflq9pC1jjNoOsXmflZJLHt/7Ka4UiAH6Bp7Rx
         wSW3AIA9ZmV8DWEvi2Q3XxxuIf59m7z7uOJsWRwkCes2xjeutWNDETqCHx421kOXjcoG
         kRB00udvEIhWAsher4MXXMcKcOICXLtMYhw9+u/BPamrpAGMquQdg+Pecu+DEJg1ksTV
         K58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780206946; x=1780811746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FXD5gNIRtvmr4+Do3wK68iROsdsaJkUKKy74Ap4MRV8=;
        b=BVnYebWrhax29bzw/AA8CV64zF4pXy+Pac4Rwca4jwS4l5uVmw22GNBYCv2lN2ZeZ1
         rRJ6Q4Fokf+e43co0HpTXKOPYphhuJ9whD0nKfA1guUw0t1H2cj5U5ImwRIabcSGVmyM
         hRCgtxULiWkZSMHWbRcUnYyMGSAfpYn61L2HCwQcTLbjYFq8kWmbYHvd+jkMu1HWYSMR
         bV4LpYi/TcZd2kENYtI9q0Ti+XGfAEBSPAc+Nz+we2TH72+7Z98AkkdFlCCTuD7PG/FD
         dKoOcXmp1LlzmB+TWByoXtdLqzFIa6f0ii5te+cymPx2SdNfuyqgNfyTn9jMwbxplm0P
         8lXA==
X-Forwarded-Encrypted: i=1; AFNElJ8paSoW+fa8rb22Ei/AHpB/rgrYuHSMLsQ4P0RnzpGgJ1ceyLgaKs/Rdw8lHBhgy9NM9Ct9JydQz/F8wI7u@vger.kernel.org
X-Gm-Message-State: AOJu0YzCc/yEcK4yssZrbgTjt22LvUt7MhDGAQKLIKaL+ah2QILEySPx
	+zxT4qWsSD7Cm5Ki3SgRN+tyZXUV+Fe7cXV4JZfvQ97nJ7d1gosFsoncA8WR8ujFHTWVbE/J1QK
	7CWCPXmcX27HE1f3DeA70HuHkn+7YbTmvYaHFRVOvgvrrwqPvbMqoNQ4s5JlInm2ePUgkGik5pU
	jN
X-Gm-Gg: Acq92OHuiUCDGd6QpvuyfXAXbJaQTTVfZHS+ydhb6BvWAhNTgvJQE7cSMa2gexa93Re
	gQGOk5D5TCt0sugEa8TA9LMT0U3uPf9K9jPDFdp68mHWhyIZYg73l8f0MbksFA9bG4L4P7VL6X3
	xCE9GtDD+mgULhp6o1S62AEe2MLWU3vZbMAuOCZozUCGTT6pnfEnsHcSbwdLrfsoTsye/qLlu89
	hWrsP+RB/+LZqj/fptH2fWfn80Zeglo2Gt9Rxr9JUvh//sIgFZMTqNZG4IqmxLYV82xV2AvEaF5
	ub+yuujm4l7s72Z1qARSarl4AfdnqHWJVh5Q0yEIj8ak5ZrrJ7WAkpCGtPkA0TEeu4YND6vmhTK
	8tedr2Mb5rkLCJ1E6w/FmxQTzEYfGlVWy3LL6Jv5K986IshXx8fKE5C0gqGDW5VWnng==
X-Received: by 2002:a17:903:2f05:b0:2bd:c925:3a16 with SMTP id d9443c01a7336-2bf367b1670mr72469445ad.2.1780206945815;
        Sat, 30 May 2026 22:55:45 -0700 (PDT)
X-Received: by 2002:a17:903:2f05:b0:2bd:c925:3a16 with SMTP id d9443c01a7336-2bf367b1670mr72469165ad.2.1780206945385;
        Sat, 30 May 2026 22:55:45 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm67124375ad.4.2026.05.30.22.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 22:55:45 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 31 May 2026 11:20:38 +0530
Subject: [PATCH v3 4/7] media: qcom: iris: Remove dead assignment in
 iris_hfi_gen2_set_tier()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-iris-code-improvement-v3-4-4c699c3dd719@oss.qualcomm.com>
References: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
In-Reply-To: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780206921; l=1375;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=aqhs4jaqkXidlgjr5SFVJnDOR/verJ9BG22AWDOERv8=;
 b=fBrM22ZPdY7kkmJhmuG30GdvcjhBdE1aNrF8V8DZcDUn5/mV/L0n3klpalCLskDNABeLyMmaq
 j3SlJUD5JI+AI2Chvgb2tcNg297mCrmG95ZGw3yXBwMxBkKgO/QesQp
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: DMUFviJxEglfaj_zTwembvOcMFTeHGSW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDA2MiBTYWx0ZWRfX1/cqtuHAGrTl
 oP0fStf3CuksE7WeE3FvbrR7sxlcBmFJmT0fBGQmEcdhc8DRssAGRmEdH82Hc9/WrDMf/U55zs4
 8sLKSQJxpcxSbJpl2w5JnQYcj+5w4+Fg8kAm7DWl6nS4kL1dsW8RBqHO0Sr6Jyytr7Bx83wPVCI
 PBMvm++gSKqrVunqB7f6v0QjpmsIk0hfPyxZghl9a+w8UY1tIy1XnJUXv7IxoT5Mn5FfjzdIMfw
 itFyW6rOjJvinKAvKpRXNEONBAnKiIzMgBbYvYiLk1AzcsByHO2HLW6JY3N4FN4VHOl5mxDnegz
 BErAaiWdu36LE/A3c+ASuzdIBSjmu40BMiQUkjKq3SKfkT7p9vivb2zCUIilcsS8dH1SHefPi2r
 NWILhNlHeCqVtzWzHOwi+xf5m8pS2TUSbB1OjR8IkUfy+Xqum1qLGkbuc+SenYV0c+QfwlvFqWw
 7nNdcsEwbxnHi7cJKTw==
X-Proofpoint-GUID: DMUFviJxEglfaj_zTwembvOcMFTeHGSW
X-Authority-Analysis: v=2.4 cv=Zq/d7d7G c=1 sm=1 tr=0 ts=6a1bcd62 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7A-KeLSbcoVXy4yL1OsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310062
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110447-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53C9F614A0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Fold the ternary initialiser directly into the variable declaration,
removing the dead store that was immediately overwritten.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index c90b22a75bc5..fe67ad0ffb4f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -536,10 +536,9 @@ static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
 {
 	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 tier = inst->fw_caps[TIER].value;
+	u32 tier_cap = (inst->codec == V4L2_PIX_FMT_AV1) ? TIER_AV1 : TIER;
+	u32 tier = inst->fw_caps[tier_cap].value;
 
-	tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
-							inst->fw_caps[TIER].value;
 	inst_hfi_gen2->src_subcr_params.tier = tier;
 
 	return iris_hfi_gen2_session_set_property(inst,

-- 
2.34.1


