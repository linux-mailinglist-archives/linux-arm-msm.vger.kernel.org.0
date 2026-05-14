Return-Path: <linux-arm-msm+bounces-107556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDExL4KgBWo1ZAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:14:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A655403DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56AE930C9437
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 10:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317E4253359;
	Thu, 14 May 2026 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CS4ZwiSw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ABrkq/AB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EE9386572
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753397; cv=none; b=iYn1GrAQv48j1XU8W/HKUZod6lHOpUvncBXS+GUaLkkeIPs1F0A8GH8q1eRM+MCOJdLshC1MXplOMpYmydqiPMjB4n/RBc3pXNI3NlCAW+HFOWoWbyd1Zy2YsgEX6a3HwWzA8q0+FGMUFnKQNjJrSvLGJNPcb66MUM3WA6eXACs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753397; c=relaxed/simple;
	bh=gq8aOZkBsiDMRGuZvW0oMU+XJc6ElAnhG4Gvvrsxc/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oKlsFqaAQ4mzcBpz56QmHo0MhC2BqCDEBVAkrRj99t2Vp0KEUdZYBnPAfqE7MCL1D/T0QleJZYCEHd4e50IFwK6eDW05gf7+HBCNPaB1+9mgaJM2juJlNX57SlYjnEQ7rbHtXF3cSxfFlnNQIq30ofU1mLhIM7N1pVjrmEEI3uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CS4ZwiSw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ABrkq/AB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9kmRo638847
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2I1g4g3NXHj7asmn8red4VpcwcClen11uThd0ZWvSoo=; b=CS4ZwiSw1zMaWqIm
	7In14uybYiHzrwtZTcivLMmHYFSnz3moN7VoAusQ3YE/2ktdl9Rw+yb2RPIpCH8q
	lfWT7i+1hWEjX7uz6IJ9F40apVvCFdJGEW+RPFjShKRvIOALHpCZK3AHl0cT1QQh
	ki1xDb4i6p/xhWXfdhbmq9zW33h/M8o5seY9/55O3T2a9GzyUk0XjOOJ0AKqRbUO
	UJb0O5ZoX/TozbKiXu7VaDBnpsBeI1sVaSFKYcQvuxaYg76W8d3HRHmwwJQhH0Bc
	njSLvlLzLZDoXo7QeFiuaqS4ZH1PsONXWcZlwWBeWFTap6zVEq6bE+mE4dzznHUH
	GIqVEQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjkdg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:09:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c82751074c8so6586416a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778753393; x=1779358193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2I1g4g3NXHj7asmn8red4VpcwcClen11uThd0ZWvSoo=;
        b=ABrkq/AB0qPG+n1qxaDs2VDZEsTzu8UVpHPFs/o9xKAQ6eOqe5kuvs57mxtuci2Nff
         8ROj1hi/yE1Y51E1g/Ah5iR47neL5BP6dvP2pGUwI95YJHFYNDRM+citLg6Fxh7A+kb5
         B6VVb1NxkZO9PiTIRDuftMeNwULRHlXqHKTI0McdIWg8ATCqtsNvuyAGC5vSd2S/1ifp
         E18/Y4VewlIO4euoAAaHCDNZH7YNBjGk0A8t5G+JPWo0EPaLhT2GTi67ZOZjfQRwjGTA
         syK1qTu1OzhCld0Vh7UVC3k7EvdXbT36qCUo5bxhyG1NBmJg28yr2K0hyN2Vnwy2yylU
         m4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753393; x=1779358193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2I1g4g3NXHj7asmn8red4VpcwcClen11uThd0ZWvSoo=;
        b=RSPd3rMtAOdUNoamH05UQiQd5OBXa6m0JoDuUiKy9psBpR7qDfbKjxZjwwGMChZNIT
         agGIbdvZAkf6PIa7VJJgf0P5uufiwEnO4TBazJ+di979B04q6zmHSP/557B1SkVquisM
         hYo2W4xV5UWsMyV6o8FJwq4Sh/z7p56f6wQzkxTY6O16oVax0ysopuNxoX/x+tu3gRIE
         RnAoo3nnQpq9IiqkTq4krjFiAAfVZUuaQUQ+gVCu6e4oDL5nbU4sGALN+yNIMmw3IV63
         NF3P7kV8LClB1Fq02DXSnAhSHF+gAyScCJTgkT/GsHa23Yf9aHqNIVIPjHsAnuFr98ja
         TmQA==
X-Forwarded-Encrypted: i=1; AFNElJ8n9ICWn5KguAswxwv8eoQ7w8QVE+7NfIhaKIpHXKxa1tRnmO8N7EQMWWpcO92xDU0XF6hMqKghj1l4Dssn@vger.kernel.org
X-Gm-Message-State: AOJu0YwapG3z4BrftCksEafuuQjCAnR0Mtn4T0nSFCRy8lLAL1eCI+pH
	BqbxkuNVwK9tBECwTnuwCfCfzk5+HYCchZ234+fIB6xgvJD0AiXyjY9bv0kHSghnceKCX859ZlH
	GPqCLt5x4ac0u/LSl775lsPZ6EgdvHJ5hN5IOF2dzb1w2sXY/V7v2Fl3lVJRG79igwlXY
X-Gm-Gg: Acq92OG8r7F1l7sa/QK4eW8t6+/E2WzL70hbLO69W9mchBE9dBD3fSgALpxzkYDudJZ
	5PapX+N86URFPX7kmnKLXLAqqukwD3zc61oq+aLz/n/uu+a/D1nmMiNZNN7Kt/4WhFfDOhi2TZX
	Ts+FBSeurhun6MODiQxp/aZ23FRJ4aN2BGqtb62dKP5g6psfBhE/2fSGqsXaSZNywDsQDeBdm+S
	a1uBh4L1YsBOVsJBxLl19zNnHzPFb4lYjSN/JUOcMst8ApumIDmvyEQpe/s+YOo6oqiZnD/eKnW
	NWHPcFDAO+GjdsjdSDORY0I1WiLBnCD/7vpYypjZVj15d27oRu/rQVIxLtuYBwTrIK8UQ6N7FWQ
	w+RSndT5YNyb4rbyM7SK4GCY14+ZKlR0CEUNfatigNiaL23LlZc8ODTLDbv5PReNnGF/psKbOB6
	Uu4Gcd24rhZpuzxfFKulgc
X-Received: by 2002:a05:6a20:9155:b0:3a1:f82e:b009 with SMTP id adf61e73a8af0-3af80c7c317mr8223412637.18.1778753393332;
        Thu, 14 May 2026 03:09:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:9155:b0:3a1:f82e:b009 with SMTP id adf61e73a8af0-3af80c7c317mr8223387637.18.1778753392871;
        Thu, 14 May 2026 03:09:52 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07b007sm1966450a12.11.2026.05.14.03.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:09:52 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 14 May 2026 18:09:34 +0800
Subject: [PATCH v7 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-enable_iris_on_purwa-v7-2-47aa5b026f1a@oss.qualcomm.com>
References: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
In-Reply-To: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778753378; l=1865;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=gq8aOZkBsiDMRGuZvW0oMU+XJc6ElAnhG4Gvvrsxc/Y=;
 b=4aNTlavU+CQmFQ6AP59YVXJRskb91Vz5ZbBGb6tUVJLE0yySTBb+IWmNBj6z8z1LirkZ9aJxj
 CQ45om64z1PBOL73Evs79UWz9q9Px/bqv+7ftolhMCfNaYRPt3S397B
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: VG0VOnbG72dmcNBNeChOMrvypvkudx2c
X-Proofpoint-ORIG-GUID: VG0VOnbG72dmcNBNeChOMrvypvkudx2c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwMCBTYWx0ZWRfXwM75KCYYI7EF
 TZoAFE11XcaQMgsOpZbjZ/hqY/ntG1JNWa8f4KZuYCF/GODwYTd1JNEgJxSrq072oZar7mhJCMq
 Slue3wXA2icSxoODszFiPugHbuT7ZVdnAxAVzuz1yuhu0K/nFERJZx5QDihbBEsJ9A8uYcUEght
 W2K+M0TA8hCQe3u8LQ9UIHIUEO4DJaTooSz3Q3wd0+6b1QkvyZRRxiyiCBHt/Cj/lbPC8mYhUbA
 4FUG55vkPh6jwQoHN8YHGLluj8O9JO2TB+3/gowGRVSBKr8xW8m72qlRWEi9iboS2O4ko9x8G0f
 RnUFSurJUQCU7H4QJP47LqhK5uLZ/otRfN+Yf699Khq/Y/x0DMlCsMfJ+bXJLI8+7urFBL3h7iF
 dfeieSzyJausQKfRVcE2YCmvjDilOw9IJcR5Jw3ItOC42UNU8B5GlFF1Cls8sX1b8YDDMOBeQOK
 PVOq0EeGszMkxU6dRKw==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a059f72 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=KtZWPW8jcQ_ObEEXPWgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140100
X-Rspamd-Queue-Id: 69A655403DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107556-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
the power on/off sequence.

The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
of the video codec hardware responsible for bitstream-level processing. It
is required to be enabled separately from the core clock to ensure proper
codec operation.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 7bba3b6209c2061dce72facab7c2b58d6b3bb9b9..7d322306c6011c758b77555788d4c0ef4705fc28 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -224,6 +224,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
 {
 	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 }
@@ -292,8 +293,14 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	if (ret && ret != -ENOENT)
 		goto err_disable_hw_clock;
 
+	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_hw_ahb_clock;
+
 	return 0;
 
+err_disable_hw_ahb_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 err_disable_hw_clock:
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 err_disable_power:

-- 
2.43.0


