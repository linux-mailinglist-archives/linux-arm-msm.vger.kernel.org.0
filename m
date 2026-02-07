Return-Path: <linux-arm-msm+bounces-92107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id z7uAHtzqhmmCRwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 08:33:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C7110521A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 08:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8AB9A3010BA4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Feb 2026 07:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D62B2E6CB3;
	Sat,  7 Feb 2026 07:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iIWLBI/W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ReB1dKBt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB60424A05D
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Feb 2026 07:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770449624; cv=none; b=HFBc9e+6+rR5+fKVUDzYBwjIzlAVPSbfYcr/WXgyJ2iGVk+Feua6yJw/FbRq6qKHHLlnHecAqP7jwRdcs5b3SCoHOhVb3R1Al3MEX817W3lEBFrOyU3AHKv30/YBQN/HK/tvK3lGcOHJzWRm2XfQdZQ1uOjLmmrLIW9JaDKnLHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770449624; c=relaxed/simple;
	bh=L6b7srp2zfdvGfLWrsOwUX96UiMx8N/BzUd2H4tkeYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ii+zEvvvDxU9Pg21OocaP1mYivEYABHLhXd0rvhTWZwYaZVJh3Cwqz6fpk/Xu2BxzfI0eXCuZ6rRx0NZwlEAKwxeEXpDpvvwDoOEg8CuU89pFXm/lezxh9uCibPG/b/oJ6Q5XLTPIfSaoD1kmfVKCMSYQfLAjNO8xvoFYLlqFPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iIWLBI/W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ReB1dKBt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174OX3A411585
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Feb 2026 07:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q/AtsU7lehUZW1o16Af+9C
	YsTOIOZGH9FN97uHMyINg=; b=iIWLBI/Wdt+tpFkfDBOBtetH+eVeONCb7IKmS9
	B2kvkkrW8osNNdG968o4NlUXvb023/0gHxyEvQbpr0T4wQjWoAGs+MxBfEK0cZkW
	N01EZN1JgvX3EsAIOdJcqTOKJ7YPLweIF0AFry6RnaFNF8GKTWz1ucBhHRlIwq6l
	n7KIgY4scIwGYCWMR7fmwcD50OOfZwrqMvK22zIZ62y2o6BmBFOJbwQEdg5EhObu
	fdDVeQmiR+TSQTSb5rBlHLMBb4nnbCwzgY7WxBqG2Ja1sO+dywPQCGaxgSvaVhxT
	s0ByNJrMe+cfNz4aRQjF+ncz2+kaUEj1N3HUZBNhi90QtWHw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xb4r98m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 07:33:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6de0dfaefcso86421a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 23:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770449622; x=1771054422; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/AtsU7lehUZW1o16Af+9CYsTOIOZGH9FN97uHMyINg=;
        b=ReB1dKBtT2BiU5OvY3wMQtL4i7ksDPc2s5cYRhQMaTEeZ5Lx4Ls3bHBOvz+QOmnbxt
         NUCfCtNjnV+VGiDFJ8OzhYyWZmTia4Oy9aTMBKqkfrCFt+wvgsBLqQzYmMyHG1M0dQbJ
         r6OGxKJtCM5s9E71apU3130u9uTM08AYXMo5pkxjjopxxECdq0UEhjoMpYdVfNn51ek3
         8NTPsAahcGvH7ntRkj3PpMe9a1tgxiON6A6fd+oDBrPoF9icT7+symJAIHLaBh5mhf8A
         S45kHJwGVL/QEIOswXdKd+nuRMOCpEp7M7aIgrZ4ApmJD+adEBGqifKClCszpRrpAuVn
         mUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770449622; x=1771054422;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/AtsU7lehUZW1o16Af+9CYsTOIOZGH9FN97uHMyINg=;
        b=R3r9P2WVQCZN4kTbQI6GjZ8NSKUNfEUjO9M8ciVLAu6bOU3p99bxZ5JRNPmR4SLU+d
         HWaLvcWL+4YjzD6CgwbcNCtBPencOwsmzD2M1CCsGGKyKfwrSrBpdy3ov3Cs1z5gmN02
         NWrn/2ZSNcCh9gOUnExJaBTIIb8EUGhtZyIr7BA96ilnKDwsYZaDzd7RTbvFRABXYVhB
         Sw6ZsllGh6N5dNzDPkJTgPx+07+9cVz/VIHuNBIOETCGM4lzEDm810GtxeELn+o58lXx
         sG0IyMvgUkOXZqgPc9zcRoMCyKwO99ThXDBwxvPdA7vGXNZ9MLuIQUoT/cBR2JEndOdo
         ZFDw==
X-Gm-Message-State: AOJu0YwyNsqDQQeU1LcsugGtLuCT46aPqM0+jelcLG201EuX5VsGWfM8
	jnQYZ/a1L8ZRvx9ZVRlNckSFB0huptF5h1LFCpXsLqWmf+0+6rZ9gY2KRPFtL01aQqHOyodxVSq
	RHs+jeK11nI26nD5Mj/bWjtITtQgYUaL25z8k37B55USbLujwuzy8a7BRpdkv/01ooQts
X-Gm-Gg: AZuq6aKOVfBVNb7sbVmh9koRPxZctYNpcjP9bPwCZ3EYxQTywi+F71t2788FX9u64CL
	fcjKT8o0GRDqwXG6MQjtfbGRTmhxa4dvnVnOwnCyH126Bk6AlTuJ36wzEjYmsIUwdUjzF4rEsLd
	0gkyBpN5OBRXvxu5zOEkBjBZRzuSEypTTMHfR6tI4QBSw9IwtgCwIK6m+wwRTdZRmjPPbzQ4Mwe
	NcxcKaPJUQxzYvE2iiA7WIxVq36lfrUwbQGyDguytLz7pXIBJNzHU4ZWxK3hg2AAHWsz6pUY1As
	c2wHs6jXC/CwMJBGIrWMq3uw1GKKI9NlC9KwVdf7TshnArO9o7g9NVlX4tt+nLnxu7zcLn25v1R
	IkZoJk9iSLnStup5bxRnAVUdAi5A3NjqARtEMag==
X-Received: by 2002:a05:6a21:1805:b0:38d:f97a:6f1 with SMTP id adf61e73a8af0-393acfff543mr5981629637.27.1770449621760;
        Fri, 06 Feb 2026 23:33:41 -0800 (PST)
X-Received: by 2002:a05:6a21:1805:b0:38d:f97a:6f1 with SMTP id adf61e73a8af0-393acfff543mr5981602637.27.1770449621176;
        Fri, 06 Feb 2026 23:33:41 -0800 (PST)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6de0128b6esm766689a12.26.2026.02.06.23.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 23:33:40 -0800 (PST)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Sat, 07 Feb 2026 13:03:30 +0530
Subject: [PATCH] pinctrl: qcom: qcs615: Add missing dual edge GPIO IRQ
 errata flag
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-qcs615_gpio-v1-1-3b3923a3bdb9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMnqhmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwNz3cLkYjND0/j0gsx8XfMkc7NkS5M0M0sjQyWgjoKi1LTMCrBp0bG
 1tQDZuh8qXQAAAA==
X-Change-ID: 20260207-qcs615_gpio-7b76c94f6921
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770449618; l=1117;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=L6b7srp2zfdvGfLWrsOwUX96UiMx8N/BzUd2H4tkeYM=;
 b=QS92xaR+LDhwEr190hWxz43YktBizBunQsRpzRG+0C8MWiLKL3TqbgohfthbWYO1u02tnVmwx
 UGFnerSLjuUCKRnHX+aj0lyGvsI78o4b/Y6K+DFBspPr5YHdar6b6si
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: x64EDDUtTPmFdW070H87q1-HHxCSXend
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA1NyBTYWx0ZWRfX01Uv0XPQqEAZ
 MQThy3jDn1XqyCw0heSE3FUlNTjBEHe4biVjToT3tKZJhXn4QiZ1HWTy1ar207qhJ2T9enqXK7L
 2856yGbmG8wjexH0UlwOwNIbRhvBff2VnAoWfzu5ro5beupZwkT3vyUct5VqsmkXmIe/Zg1sODF
 CjPDFD0qOSLRafen+y59727kiB1dPoktjKHdZe6LD9+0Q8VVAy6U32RVxax+JNuH8/BfU0VqYzq
 Spjt+ZKzIXiPGVnYq+7K3aoRms2SGHmDHAJ6cYjBqjCS91dSTFMtXTSaVx6JqeySnkYIWg/Zi6I
 1fyZ0qcLzUhJHkUySaapYEPg7x5HE3L55AeO6/SBsO3gFFPlKBBumHUnLx9Z4qeUYHmJpMIqzGQ
 zreeriklnL1rnmt4cB22VOSp02GlA0nc+Xajw7JG5LTN+FoFeAfAts3E8r/tKnaIAW0cr3zmccj
 yBlCVADD/pDMZ5lVZ7g==
X-Authority-Analysis: v=2.4 cv=PYLyRyhd c=1 sm=1 tr=0 ts=6986ead7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=TuXGLObN7G-QNExUmHoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: x64EDDUtTPmFdW070H87q1-HHxCSXend
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602070057
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92107-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D9C7110521A
X-Rspamd-Action: no action

Configuring GPIO IRQ as dual edge breaks as the wakeirq_dual_edge_errata is
not set. Add missing wakeirq_dual_edge_errata flag.

Fixes: b698f36a9d40 ("pinctrl: qcom: add the tlmm driver for QCS615 platform")
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs615.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615.c b/drivers/pinctrl/qcom/pinctrl-qcs615.c
index 4dfa820d4e77ce8157a3503ee8ec6e426b54e030..f1c827ddbfbfa59d03ddea560eca36ffa997aa8d 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs615.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs615.c
@@ -1067,6 +1067,7 @@ static const struct msm_pinctrl_soc_data qcs615_tlmm = {
 	.ntiles = ARRAY_SIZE(qcs615_tiles),
 	.wakeirq_map = qcs615_pdc_map,
 	.nwakeirq_map = ARRAY_SIZE(qcs615_pdc_map),
+	.wakeirq_dual_edge_errata = true,
 };
 
 static const struct of_device_id qcs615_tlmm_of_match[] = {

---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260207-qcs615_gpio-7b76c94f6921

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>


