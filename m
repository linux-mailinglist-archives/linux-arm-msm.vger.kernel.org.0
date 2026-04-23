Return-Path: <linux-arm-msm+bounces-104317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id l6g3OpAK6mnFsgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 14:03:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C261451AEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 14:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A12930868B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DA2372ED7;
	Thu, 23 Apr 2026 12:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDMbyINx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cQruaUrS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13D13EBF00
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945651; cv=none; b=Q9CGDOWxGIRBkzLdF/ZXxsMaV5TpRFN9SttXSRpqp66qo6N445XM25cwPiNZ+AA2sUILthNUD0Caxl0vg2OIon066JESW85GpLwx1UtdeFH2fEH2ONDZoVmlPxs3vJU+AlSozt7CXRcSRqscASQ3wZntXHx8vuRgOC429DYuMOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945651; c=relaxed/simple;
	bh=YmQXvtkYvIze5TqdErB6gc5at7BcNjGJMakZ7uOJLvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JVSt0zOWcif508/XpnphkVzwkWa46FTiP83tf57unSKHxkz9b5tSXMCrpgZKRlIQ9tU6rTq+UwwVbVOKyyxs1dvzIrC37X3zkT5PlpyELDXo7rTs9131qp7NWd7E0sIwmtn0KpRvG3ErCjnG67YBmEx6DEKH5pu6OHdIxkd3T28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDMbyINx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cQruaUrS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NBwdES009834
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R8N1jbkdytVOL6T6kzcN2pMzXZVTuqMNODxZcTrhm10=; b=UDMbyINxPeKxhxPJ
	8zWcK6eiU9XewZV4cKRGdj5Y2heZwa9MLKo8tx7pPXJjKi7vVRPdNQYNDvOVE4as
	fWnij5yUeW4XMv/u/Buiw4cNI55dWYUiN2wr9Qya4agR1QkmY4NnnNpnMBJ3DWft
	D5QEz6LV+74dRcSFu7giAOWXWE8qx4L98FIzMYmFr+Rtwj4jesJblMF52Zf3IiXx
	i0uB63dunLAFzjU5F3xjBCkx21Tp4teEUqLL6ELzhqpYWWIZyYrbFqgJvFvdkb8Z
	WFmMpdQ4y0/7LQrty9TO0YKM5DTbS89o8Mik0OPklC8AfGksx4qz2sjxZMK1AZMf
	WDK/hA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqk178088-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:00:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4654f9bb6so69230635ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 05:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776945648; x=1777550448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R8N1jbkdytVOL6T6kzcN2pMzXZVTuqMNODxZcTrhm10=;
        b=cQruaUrS2B4DtMhVzJafqgEgAIiRbqm8TUUlQO7U1tHZWzLrToign6FuE45D8KCxlB
         8Jc0LSD7ROu66lbkvBcMFrRJa+jzY6450BlP+HeEHr+w9DCg/18gd1KbcSEJgYRl430c
         38wTeaZcyrnQ70TmsWqXhjB9rfpPmrxX/yYJB2i4OQNaW6WkpvEL66QgrNbalgADOKRf
         oraDtBQ0mbzjZ0R3ZI4qWUuOKFaSVSiwKp7Mx3nT57XqjCgnEsL1NHLNVL6aZ96C3dEt
         MhCtoQEyaxYbd2Bg5gMuOI38NoqSlBbkW3pbus45jUrS/VZ2eqGhQZAu4htnxsMOqa+K
         bZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776945648; x=1777550448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R8N1jbkdytVOL6T6kzcN2pMzXZVTuqMNODxZcTrhm10=;
        b=JuZUGtDwF8sA5UD62pCJVTycigzI88xG0miJznd4SXwxhrq0NyPXJMTs+1wUn10r0S
         vOmXZK4G6IvEewI1OLbGDz3a5j1w0GpNyfoJT/UZshCf0lfeimhLlpGPWSMk5MFIMFjF
         xVsGxpbMndD9X/RxN2AIG3FnEiIPKvfKT755QEcsAyZw8RRe1eOEV6zhX/yjCP6PI/hH
         XV0PC3+Xhupm1wLRpRKv3D+y3VZqVfHk9Ojsa2lmA7kiaTUWKYvU+yONU1Vq6aObndI/
         U69yrtfUhX0QS6eDw3kW4kpaB3Tk22a8e76vwc4SNttje93ywmzP1BspeAV7xgPvn68r
         e1KQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NRM4/+vpyEzcwDCa2kS3js2xpsAzECduhKCeyTjlYjM8UUVicFqlU3HBnL/DzmgwIg4mvVWOMVq4IHNgM@vger.kernel.org
X-Gm-Message-State: AOJu0YzYDBo85D0Y6ESAIQn6bYvBS1AcxJ6UYyfd+YKmi0FrepNefdoz
	Bn6C1gAZ5pCQg5eSNqjYanKzP9pn3EzdtbJKJnJFqASJ1ozU1XKyvUco6+Tz6QaZ4dsqvKvDo8E
	ardFvMi/8ge/YQNbR2oXKOzGRTr6fs/ZPqPTYbwfJ3U/X58HgjUWBFOdL+P2EFUqMDm3N
X-Gm-Gg: AeBDiesU/759z7c6VrgUT3MxEpzQw3ypWl3849Ofg+MLdmLZwRfniPnrzF1AIjP78qU
	4+eXy7YQs9jInLsJ7PDi49oOO4vB2v1w1DdY6KNksPlvmHQFXwR0Ccti8QRyo4vhw9Q6oH1Sm2K
	1Jp2uyVEZ4Cg1gdCXQ7jKuDSGATzJe7r78rTPr8oY50FXFeHd1CB96azzyRTMnfXtLFkrAhLYgV
	Q4ZkpyTbMJkqpJTPGM83omxtdjxgmJyj6evavhv/dW5RjYc3vTC2A8EBiwcOoCu3lJlSrjzbpKa
	MHgyT7GRftMd/e5wHIPfva2s4YajP1mpSAEYlaC9otDKDT5Orr7QHzn69UltcS0Z2Afhod1eB1G
	TEtn1gsnbBDfNvEXuYNWOejT1+3VGTLlmZGRfoMGgGnDtN67Ze53je7otR+cf3+MY/uTmww==
X-Received: by 2002:a17:903:b8f:b0:2b2:5857:583e with SMTP id d9443c01a7336-2b5f9fc0641mr279156745ad.31.1776945647173;
        Thu, 23 Apr 2026 05:00:47 -0700 (PDT)
X-Received: by 2002:a17:903:b8f:b0:2b2:5857:583e with SMTP id d9443c01a7336-2b5f9fc0641mr279156065ad.31.1776945646343;
        Thu, 23 Apr 2026 05:00:46 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm194790355ad.36.2026.04.23.05.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:00:45 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 17:30:07 +0530
Subject: [PATCH v2 3/7] media: qcom: iris: Fix bitmask test in
 iris_allow_cmd()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260423-iris-code-improvement-v2-3-9e9cbf00f9c9@oss.qualcomm.com>
References: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
In-Reply-To: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776945627; l=1245;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=YmQXvtkYvIze5TqdErB6gc5at7BcNjGJMakZ7uOJLvU=;
 b=CicWEKM32YbJeZj+8rDmclj4jgAMm2g2Xo00NlYwdv1tBeeNIwPsJ3PubdoF/sp2WdCF/ufXi
 jwKsVsGl7vmDJ2kHFB58jS90/aSacL9BuxKJ7RuYxx2jMDGvSAYPwTB
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: 8G8xPipm6vNludlX9IkSsJI5Ry9nbl1P
X-Authority-Analysis: v=2.4 cv=R98z39RX c=1 sm=1 tr=0 ts=69ea09f0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=cLE5npzMka_F6uTWaO8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExNiBTYWx0ZWRfXybQuZVG46cFM
 lCB4Niy/dYUx2wyYfIZ7nLe09EKDPuaDl5AHLIhUqkFlcwQVA+/kRS1LuMrIMrOOKasdPzNu7CW
 AGjrpjPMTE6BS3V3VH2qWAygIxq0R3DGztpdZV+XV6/Wwym4exeb0S7FPPI6d37gmdbph3nEoR9
 tW1Qniorogh+6tuU6hop0P43Xh+OCPD067W0104mEzMFe6Th2wnF91orxS3lmLLvhNSGpA3hpfH
 Pi1PJV033Eg00kGet91jWzphKdWWc/e9QUknTlsCsGQ8wRZrkV+zF3j+YXGO6GZSsIZpR3xAYnF
 ZCQTDJ/pynz6XdwQMd6jYDG2R+VtZlfqnUPuJa8gg7ZbFqEHvRXdlkX6OqwzMVEICawZATegEG4
 xpit7OzExvU+eGVJH6dv0KDBxtFSgjGN69nkckC4LGidc26l6Sn1Kpp9qm64ETGTIhymi4Eqtk4
 eodTX86xnZPNYaLBsSw==
X-Proofpoint-ORIG-GUID: 8G8xPipm6vNludlX9IkSsJI5Ry9nbl1P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230116
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104317-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MAILSPIKE_FAIL(0.00)[172.105.105.114:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3C261451AEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

iris_allow_cmd() incorrectly checks a sub‑state flag using a logical
equality comparison. Since sub_state is a bitmask, this allows STOP to
pass when IRIS_INST_SUB_DRAIN is set alongside other bits, violating the
intended drain semantics. Fix this by using a proper bitmask test.

Fixes: d09100763bed ("media: iris: add support for drain sequence")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index e991f34916ec6e74f3d2cf98bd61b8b1e12a3ca8..5552725c614ea2e336e254898270302fafa646c3 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -269,7 +269,7 @@ bool iris_allow_cmd(struct iris_inst *inst, u32 cmd)
 				return true;
 	} else if (cmd == V4L2_DEC_CMD_STOP || cmd == V4L2_ENC_CMD_STOP) {
 		if (vb2_is_streaming(src_q))
-			if (inst->sub_state != IRIS_INST_SUB_DRAIN)
+			if (!(inst->sub_state & IRIS_INST_SUB_DRAIN))
 				return true;
 	}
 

-- 
2.34.1


