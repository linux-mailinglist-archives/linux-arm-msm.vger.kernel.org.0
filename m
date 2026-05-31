Return-Path: <linux-arm-msm+bounces-110445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YK3uHF7NG2prGQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 07:55:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0366149B4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 07:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D4B13014838
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 05:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8707323417;
	Sun, 31 May 2026 05:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jffAadAE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCdLUOKS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B283093C6
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 05:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780206938; cv=none; b=geeEIL+X/rV39/VyX33CpFvvWGIWylnD0rovwVmxHeg8tQ+IKl5QrjGAn3pPhKuceQf4IZkX6dE1rJyg78QuvApWElNNAVrVQyXDjN7sufXfF9TNoCUcv9LnE3H+oasD+/v7hyopRodZ3zZWGpO8EsTGGb7/bkYTu23IMBUOXzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780206938; c=relaxed/simple;
	bh=bVPxoi85jbZFO9af2Hg2HjePj0L5XNSg5j6catQYaJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DYxwqr1+w9A+DVElOFjSDwpzTScxTP4JelakZRaVcZDkmpl4woz7emOhKMJasVeQ+ezvMmdp5odyabHfDej2c515s72tZ9cL9a8BpNg3JkhoOZCCVY8lTYUJNMzl2FfS1/eEv+fdMDYsNiE9WcRG9zAKXOhn0vvPw+kXZKf0zb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jffAadAE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCdLUOKS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64V0hAW52993869
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 05:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0bP38xOel7Wb7+m5gMySSFSDl94pHOR46F+B0I+Gh0Y=; b=jffAadAEzOpKIi7d
	b9X0gR2i7tkBD8SGtjY6kjv7S2CcFpxdE0fIYM0bEaoHbdClzUTUWKe66wiKWSny
	XJ73AFe+qmtoddOuZeFe3c1EuGu7+uHWUmldYJpESXQ32wZ94vmDIcTz0ehi1sFU
	peVUaGggejxNE04boNZpDZZDET+6Jx5V7rxtUslVdafSxgfXyEcCkCqqZCpoxhg9
	SlsBD/O1jhSL5t3Ky4nGOs3XIma90wia/wEjqUFyJGiXlPP5DXuAjjUCKbHlvxln
	SgATFDd0ve3D0rOJoAt8p+HWsjLhpBTwMcgu+CXjo7yJeQk1fuYlx+LfGZWhM2yj
	38V5cg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr41ax6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 05:55:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso3398815ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 22:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780206936; x=1780811736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bP38xOel7Wb7+m5gMySSFSDl94pHOR46F+B0I+Gh0Y=;
        b=eCdLUOKSJ6Wh6YKqhcVAdTLkpAmy3WMrZb7cRdkvkQtBVsOv3buCMMS2I1+oeiwLgc
         H9YwwIBxONYG9NJuI5664Odv4MrolNt/3dSjDMqcaMUfhxrScFwc64qKrip3Djj2ntId
         j90mESU65BS0/wYoGED5qMiwU4ZPtY6rQsI60XTbrYQxzo8RsseXkzU0k0piLZ187KFz
         v2phfrNDypeWsu3TwqDlUdR6DKTHKoUxOlOvYKWl/bEpbTw8cf994VtwGYIGq3E6bTW1
         poTd5+AJBz9LuRhUHuqLUs7gFFk6NS+oM/mrNsK8KoQ3oq2Jt4xuukzigpovYTsRetnD
         V0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780206936; x=1780811736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0bP38xOel7Wb7+m5gMySSFSDl94pHOR46F+B0I+Gh0Y=;
        b=qP2RODMJkDRR7n5V0M+IJbB/ZNNqqno41JEqenlDNOXFxUC15kzKqirjbIybPlBaeL
         NQl7c3yZy5XeFo8siSf33E3EgioALeTJJ/toGT2QeLURbyepvU+86nK16+aZOX0MtBO+
         WJrj86voNOTuluhhRfz51Y+pGc1z4tnvf4jVUadDnNUh9mlSqvCwYvyKKqLnBeuISVFL
         dhRrPNrTePwq+lBfbEfDFlaIrIDpiQdBHb1cJ6wa91PGO4xWEcGJmUIXTUCoruKlbSOu
         JBVAPLaOMdHp4zLIWtA1L5znO1XyAA3pqjHW1N66tjLmQt9izKxSzilhcCz7ParwchWI
         j08Q==
X-Forwarded-Encrypted: i=1; AFNElJ8VnJ4SIfnEkKCon9Y3gPVtPElh7sp2f/AbzIIATVw8Ckb46ufdiRfVeR9J7rADd1UAxj5uTSzOEvCyGCJv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8NZDs1aRoboboXrIFDzmU3JmZos+TnxJuvTrOkT55LV5PoCFw
	GWqg3gUoBwPm3K8IxlLsQd5pqTOTgUY77+fh7/ibBb9ajyM9uOSNjeNOuBJ0/dDXMeOH6SSwedk
	Xf0ospowMYNALXROjCzjX3U0zSBHg4bWZTTpVTw1Pt2k6fsmudjg5HTNrpMkQs/sRI8tnNov1au
	y/
X-Gm-Gg: Acq92OHsdS9VyCp5AgMlTe6U6buqkEKvH8J0aCtZNX66iBPgOR1E1lq91ai1XE6ZGtm
	2hz0bavv5IMMxMX9I8q4QHsbGZhhvZRyBSGpk6EBd2w9p59p+EDt+oA86AF8Zt7Pv93qe/i0wNY
	d+aDNYzi4VRwCvi5Lw13yreDNrL4lRuzxPLdtbG7SjVD0ZxcrMoVO8OPO8ELJauAP9s9RKj7AWX
	8zsUA37LWV2mB0/+ldsOoRGd5YIV7Z5zm+E6uE2otxsHK7+GWqdF/Tu0NlkgW+4BA79bCokyZo3
	XVx802w5f0T59qDbc0lBvlGqXBCUprRZxhsx90nhAX8pKRqCJCgUlPHfE3H/1u54QgyZzqZhu/w
	33yXXDzAjAAaFektB8ddl4/BOpoIlwfUJbYq2/WHnpf9eDg4Hj5PCXi81bEjYhh8o3w==
X-Received: by 2002:a17:903:1c6:b0:2be:1c3c:72ba with SMTP id d9443c01a7336-2bf36877582mr69541515ad.32.1780206936349;
        Sat, 30 May 2026 22:55:36 -0700 (PDT)
X-Received: by 2002:a17:903:1c6:b0:2be:1c3c:72ba with SMTP id d9443c01a7336-2bf36877582mr69541295ad.32.1780206935919;
        Sat, 30 May 2026 22:55:35 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm67124375ad.4.2026.05.30.22.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 22:55:35 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 31 May 2026 11:20:36 +0530
Subject: [PATCH v3 2/7] media: qcom: iris: fix state-change debug log
 printing stale value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260531-iris-code-improvement-v3-2-4c699c3dd719@oss.qualcomm.com>
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780206921; l=1345;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Uq29RriGWpbhBmOAxORGoqBD0WkHutgpBJXYyBKyE+o=;
 b=rQ1wFVhrzKpX8UHQdt+tbafWMw7piYPyv23/irop9qOXHIN6lTu8pOwBn9djV1SJY/P3OynUd
 pAI5c0BEm1ECcW/Mq8LOmwDxRzkN/o3mqWum2ZHCXY1SeeMaMltKMjM
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=fOEJG5ae c=1 sm=1 tr=0 ts=6a1bcd59 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=iF4bBz5rOIv4ZkufqEYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6OkwKUdXx0o0R7WIkODWF05PX8kneEtI
X-Proofpoint-GUID: 6OkwKUdXx0o0R7WIkODWF05PX8kneEtI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDA2MiBTYWx0ZWRfX9uBaFWYTdeRY
 UjtgeQEWeNQMM5QlPxp1Oj/V7dg+neRIqJJ5Quw4BthXMucc39gYdDU11CnvdTohL1j+ry05nSp
 I8uDl1bgKfj23q6LftuzR7XN2XSKu59oMR186T8AEVKU85P2J/SsvK4XlMZyFHTtMHECxmUj6+i
 8kj1Q1E/XuzUxt3ex3mIkvvB1peLaVhlrxHlJiaNAM7SXVz9g+Ee7rh1DFcux8Elbk5LI5Uv/DI
 2LCk6M51HE+PfzFjV2u3iE3meUuDBVqDQ2lFKHGcMTDkZoZKAFa4hNmObjmPwY2CC+WUM32C8Ut
 60vNZ5Dr/rtly9eLQ3Y1lrrH8lfzWCoE/etwzTyJ6NurZO253AAz37FsrjESr4O3QZLbsGFuI/C
 5mZkEM6+aZxuRfcNs3ZF410Ck2Pr5Wxg2l00k9aCGJa7Nf0irtoHWvtRIoYLUyRVHorNGUQgTsk
 YX/7dejmTKixtoXSIEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310062
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110445-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E0366149B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The state‑change debug log in iris_inst_change_state() always prints the
same value for the old and new state, rendering it useless for
debugging. This happens because the state is updated before the log is
emitted.

Log the transition before updating the state so the previous value is
preserved, consistent with the existing sub‑state handling.

Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index d14472414750..e991f34916ec 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -60,9 +60,9 @@ int iris_inst_change_state(struct iris_inst *inst,
 		return -EINVAL;
 
 change_state:
-	inst->state = request_state;
 	dev_dbg(inst->core->dev, "state changed from %x to %x\n",
 		inst->state, request_state);
+	inst->state = request_state;
 
 	return 0;
 }

-- 
2.34.1


