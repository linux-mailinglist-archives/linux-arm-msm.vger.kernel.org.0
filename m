Return-Path: <linux-arm-msm+bounces-93688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMyiFsJYnGkAEQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:40:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C36D177143
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C702E3030A23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDEC224B05;
	Mon, 23 Feb 2026 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="od0CGeSM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kBFQb0rZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A48229B38
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771854008; cv=none; b=IwiAtrjzttLwPHPfKKSkWiF/GhOJFsZtgfFlm4tGnPBDBojv0Yf3EP9MxEgoK1rhU4mVqOato0drJp0btG32yCCONrNTElbp/EtNrCECQaZCWZTSFc+bEMXkXsJBe6Ou1w0LfLVEh4EtPRPlfseTdoVymm+QnU3RU3Q/7j4FX6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771854008; c=relaxed/simple;
	bh=NLvjBrIJyLSxyZ26rZnJs4lMlffVyOoDRgTSetXhNdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UGKxXMzJFa9KW6k6KHHUcF/whx/tPFcPs6VhTMhmNuCeGKR5bL44D9dLEy7Df+6RIpWFjPEEBfSp1Audr01t0z1nBb/OA5IGG7W6XyCC8ys2gDyXU4vOvQ5Ua+z9MXi8sHEZaGeNlrG41MDfjWbuLYFzzhdeNxWayAFyxCqh8R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=od0CGeSM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kBFQb0rZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N7BUTc670853
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WfO/ZWZoUCF
	0KHQ87UTWouWD01KbGW/9hGjTgn+1ycw=; b=od0CGeSMJUkoGLuPy1VymzMlpqJ
	INxgUZKG1gYtio5hOn2qhDQbYj4o6AeaW0rpuaGdOOzTSwlAvLxGrM9rBcLIFc71
	EIugRselJ4RscgJir3xtc8qiDyNvOHVIs62uLjz3gd4T0NOUfdCPTpsLhkaRhXvq
	nd9fqpNUp87wOv3Vo0FvRQN+gI/xtmWssGA5VazvOQL4crluukwnbq1jId1AOHBf
	xRC60ItOwgy82fliYrb0Hp7hVP8sooj/XmD+0bTXYo1eAEKrkNfexglfwnlxFFKP
	W2M3opPcE3jNFp/pL4eM9YRZBRkTTBRY0DSwTe5HPeAUZLicNwsz/cIdf+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wavwdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb37db8b79so1710363285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 05:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771854006; x=1772458806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfO/ZWZoUCF0KHQ87UTWouWD01KbGW/9hGjTgn+1ycw=;
        b=kBFQb0rZpOkgWTqoolMM+htu/qsdLoqjNSk5DP+BzVv1boy44YKdmmBW+13GlE6Evg
         bMvmOTyLe9BtmPUFjTX0te/fSQ+Gn2JtrwK+TxYsmkXDfMTvytHC9L+P5/9EROZGae1/
         U5NeBRzX0en8IqhJ0w5qgVERPBi2hOjUWRzPlAVenWXVZOAHH/JcztjHGz8vE3bBTxxC
         ZQ1E3HarVpktcmaKqJKEFfh+XpJFv31RkAyNuWXC3uWkkLS26IJNDs1BeVHdHD5zAIWr
         IKkd9piTNhcB0TXh2JjGJSwX4PTwkt5UNmqQX0JbDguXEqKIkU8PXc8Hym6OVj6STivN
         yDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771854006; x=1772458806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WfO/ZWZoUCF0KHQ87UTWouWD01KbGW/9hGjTgn+1ycw=;
        b=fMmHPAkkK6US8Ib8C6w0+WH95LShYGAtysyNWngio0bIa+H2e0T7Y3dYmzx7pbiALl
         zk8pwidisDj4sEkxMi2YY7wE2jH4I/S2N+aKG0JuFG2+0p0oEWMJZ2a171VnaQ8jZotN
         XlhODMs9OE7CEdb4oOL0pcWnKXLK8UlymC4Qw7a4N1SEkxt+M5GDuxbYmidzcxmxwETH
         6czlK3+IAc9HSvJnioyOo/LybVkALDVL2fhEvY10vyaHBKitELBzfaQfXSyEz8XfGB91
         OWlQXYR9sRcAHWESgIcFCjGnD8LzhR+QOGdJksm7kaVTG9BsuHzS9gXA8+imouL0oQ/C
         JmCQ==
X-Gm-Message-State: AOJu0YxX9GVHbX+IIHT5koEVLrKT1Eh5VuJN9hZLfKAikH+S28XgU+rv
	tvMrtraEyMzAJ+s7RCs0wSRs3gUmp4OSip6ou4IehyxrR3ONZbrDQPw1ZK46MUPTMamQ09dr8oD
	0xW9Ps/KkArj3em3XGTdYQmX85mB8BmP/w2P+nikISTnpaYfAT1amnc7lHzMAdpDuVSwx
X-Gm-Gg: AZuq6aK42E/wABR/jLESXu3sHy6kUGgqnstxDaBdeze7A0z0Q7TaSM9ZuvB6y2ChSkk
	3XXxKX69h5XkuBW1pSJjpc0bJeZvqZKDGqWhis4iIax5vWYftcOueYmDPyfPXpb01K9AD9D4d2b
	6nvlug2w8R3as1WPYe3BMMmd/aOvtVUh1b4al9GRDfkD8rVojvzYJeC3gJys+KpCu0RyXWVvxvb
	OvdsJ6DD/iV2SBQOIAGpDCi835a0ftCDyn2DBWuVO2KVanO7/Uzqut/mOLoaZs3S1syeOZqFflT
	+n6RSnGYO22VzWZf9aBhKwzF7DeMGB+hmV5VAI2SgAsu4yfZijydcweTCt4VUOXtmEG377KNuXf
	D7KT08h08UCNMGx81/uhgmBW3uJlNfLjt0EhN5agLE8ZjYGLJOAbSs/c=
X-Received: by 2002:a05:620a:f15:b0:8c5:2d4c:4f0e with SMTP id af79cd13be357-8cb8c9fd576mr1035123885a.25.1771854006100;
        Mon, 23 Feb 2026 05:40:06 -0800 (PST)
X-Received: by 2002:a05:620a:f15:b0:8c5:2d4c:4f0e with SMTP id af79cd13be357-8cb8c9fd576mr1035119285a.25.1771854005575;
        Mon, 23 Feb 2026 05:40:05 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c626sm21323985f8f.28.2026.02.23.05.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:40:05 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kenrel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 1/5] clk: qcom: fix SM6115 lpasscc register offset
Date: Mon, 23 Feb 2026 13:39:46 +0000
Message-ID: <20260223133950.221234-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c58b7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=g3NoBr1hRuMCkkBryE4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX+92JnAedUa0g
 Zysb2Zf9/ijdXJyGOUe/dEK5Lss73zh+2BRpwrQqZiExCkbOT24C+zZNexTQeoQmhJusMcjlvIA
 BUJ15AVmFPK6n9o0tXG1XCNNKY1eQcDZP2U2s5IgFNJHy9/RbStmEjEcJETpQPkj0jGzbcOHHMt
 OvWOyKnFndhxMrzk0RBM2HNHJfCOTAIVQF3cWmttU994B6Rff9A3m5cRJRZqWMMbXZWZVb4M80H
 6W4ObQQvx/b3I4I4wFGyRIzXYkp4OO8jSQdWNFRS5wvs5Awsb41YFBUgWHEAGSIldqaQTSPx6aa
 QgICELl0f/9p+0G1kcveJ7zwCwzmKrKIrX2JyHT29tJ31NEZ/ehFwDr3CtkdKDMILJo4OwnEqOd
 21i7jpX6AtY2fzQGiNB3mQeJwclrXAonwqUvYQs5exmsuXQEJukT6ogruw81kOHx7Fy+jtsfFJq
 8VFst2VlVNH2DgZBkHg==
X-Proofpoint-ORIG-GUID: iY8a0ipcxERULPZAZ-eAysD_-lMdskkT
X-Proofpoint-GUID: iY8a0ipcxERULPZAZ-eAysD_-lMdskkT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93688-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2C36D177143
X-Rspamd-Action: no action

For some reason we ended with incorrect register offset for soundwire tx
controller reset and the regmap register max was also incorrect it was
0x1000 instead of 0x12000 which is full register range for this IP.

This was somehow compenseated in DT reg property which got it working so
far.

Fix this by correcting the actual offset and max registers as per SoC
documentation.

Fixes: b076b995e225 ("clk: qcom: Add SM6115 LPASSCC")
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscc-sm6115.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/lpasscc-sm6115.c b/drivers/clk/qcom/lpasscc-sm6115.c
index ac6d219233b4..47adf4de2cca 100644
--- a/drivers/clk/qcom/lpasscc-sm6115.c
+++ b/drivers/clk/qcom/lpasscc-sm6115.c
@@ -35,7 +35,7 @@ static const struct qcom_cc_desc lpass_audiocc_sm6115_reset_desc = {
 };
 
 static const struct qcom_reset_map lpasscc_sm6115_resets[] = {
-	[LPASS_SWR_TX_CONFIG_CGCR] = { .reg = 0x100, .bit = 1, .udelay = 500 },
+	[LPASS_SWR_TX_CONFIG_CGCR] = { .reg = 0xc100, .bit = 1, .udelay = 500 },
 };
 
 static struct regmap_config lpasscc_sm6115_regmap_config = {
@@ -43,7 +43,7 @@ static struct regmap_config lpasscc_sm6115_regmap_config = {
 	.reg_stride = 4,
 	.val_bits = 32,
 	.name = "lpass-tcsr",
-	.max_register = 0x1000,
+	.max_register = 0x12000,
 };
 
 static const struct qcom_cc_desc lpasscc_sm6115_reset_desc = {
-- 
2.47.3


