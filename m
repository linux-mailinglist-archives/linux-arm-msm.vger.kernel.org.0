Return-Path: <linux-arm-msm+bounces-101472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oE4PG1QlzmnElAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:14:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1C1385B8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0CD830B1F55
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9693A2556;
	Thu,  2 Apr 2026 08:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o2CJgvEX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GnUwAMFG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5BF3A381A
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 08:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117519; cv=none; b=Ji9x7nU2gXEaFdHFQn2cixVKtMo+BQwYvr9gUxbJw16Y/yu9m8VrjWw6Gu3juM8BPOBZjIW9rhQSy2+KpHiGyMpPQiK/fs6qgXfm7y1vlKnEFoI+8Hw+fRsW1BVHH4UcEnTTIzamYvRGrclkrBKsft8PrE612lr2y7MOw06G5X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117519; c=relaxed/simple;
	bh=Fl/z/x1vRgiwJd1pRAYk5uDKCPsjPZHEyO/+LZ3AuNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=USSj6hxWDYubDQaa2p20BgVzRUJroQNIvERnukwvWKUuLJF83RJL/VIqrDrw0SgWdOjR3fWQasIquMRrfRE6/wAml8LBSG1plncWcxkQdcccIo1gWGrqtLxbcZ/0tdUKOSydkTAPV1ZTakqS6V/b/TzqELP3bsFt4b5WywEts94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o2CJgvEX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GnUwAMFG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63272YIL548150
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 08:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ngH86D4QhHS
	BBEnIjfBcEjvZR9eSdOdxegad2SenX0M=; b=o2CJgvEXFlDAM78P3JlO5bj6CSZ
	JGVyZPVgT0KM8TRI3yramwtPzr/PeboGhBO8Xt+HgJqCL9pNP+TbZYsNNlwH8V1+
	ooPQNWINa0QJiyQqYnSPPI+PWspiEgco8V5W0uP5prAMy9PiESWJcbHTnmlnZnpP
	TbwBeFphZ4qEoNvZOMmvI3gfmTBk8QVoJyT1F6xRZIp1dmhWBTtlJ1cj7DxfBWA7
	cQOJtKImTNA2419MkOckvkcJQ0z1xhgwBq6oAMjvfEJVE3KsYb3PWRJqynHNxnGW
	3CogiXB3haozVtW6AE9ByGTKGXyn04EUrMkcIS3N5UIXTj4SngSbg66kh/A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d94vvkqst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 08:11:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7fc27cf7so170294485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 01:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117504; x=1775722304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngH86D4QhHSBBEnIjfBcEjvZR9eSdOdxegad2SenX0M=;
        b=GnUwAMFG60Deb4W8zk1nOZTQPmtoAPMfjwmboTeniOuCUCB7MhBbn/2z9uPafbRDuM
         mPwbo1/To1qEukqNqa7lhjbygaoM8c9BNyHPSV1uZLQDS2ca4NknNcJlXYqUjuYws89g
         PpoEmXLj8kwgDPQqyL57J1rK8JFuOlJyWU0JSqakM4Oux9nX/3ti2noHZgVRa9BsZEKr
         o55BYgZpwV2khYiNULxM0N2AAY9A+miYPXTZXK7ghcksnGE3eReXB36UyeC9DR85llvv
         ZpSZeHN4ZXwWOnm6P6ecAFtfYrYvvJhEWESTkydHbkZai3l9oGdMJIIkhTUt6GTgtU7x
         LDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117504; x=1775722304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ngH86D4QhHSBBEnIjfBcEjvZR9eSdOdxegad2SenX0M=;
        b=Kql1ofc8H4WhaOcRsHd1cdMLP5hEbnWEDwR/E1RapPgJQzBMBxf3b05IEB2cREJ/7u
         lVxUx72hhRiw8uueeXdkovwFSuaLwyt0Egzl+kjF8thLHVPJGyCXhFH4NBFbkEUXyJbT
         CQD6i726o037N0olV6PRn0purwMpGbkGXT4J0hvrpwX3dXPfazg5FQoHGfhqjiW8sxZN
         BdlZ1r1LwRDp6ehZ6/Z3XIC3XC5GAXiYuDr0syak4QYUCHMK2xrVNmWiTVFW/Aue6FNc
         xgroma0i99PDRCAJPhfuX1x/jnGtrvcJkzck1JPr77+gWls0TlHqYCNLXlLhptGAzYVA
         HRYg==
X-Forwarded-Encrypted: i=1; AJvYcCUHFk+RIlU/0tjNd9ZoUgQHeKqg63ygODZwP2iNEIRuewT31cp3vauuELaDPw+bMHJ1vfxu6GYlqsaxH9ZL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/SV0eR9JxhdTmFg3LlHRKafWvXSOY0UlPmuwbCifCqH+SZyt9
	7Dv6YHOpkLLaZ1473IGMWoHf91w/cfiB6dMw03Z8ltjY9Qe6gXXht4ThgMGVxV9LvfE9QKj1T2a
	/v49YackjSlmqIcVk6xzMCH5UaaUUf6WP7THviBptNwea6y3vO4eD8o9UKIOb2KG75fXW
X-Gm-Gg: ATEYQzwabXccpelnEZo2TcDxF2mB/634EUvMMMYpnzvf1XI7DBmsIEwkhk0daTLOjSE
	iqs7RZz6al6MxnAXU7y8Ua9f8047pKc3K+QKdHWl+yM3pAULhXCje2iLiQnHJ7eNeCoGKUf81j+
	ZJG+joayJKudrptXnj+aT/wV/nTwmgncMIiFVy3M4mLQ0fvifO/PG/lW5+WMC/pSu4qIBZPCldX
	KlIq23SmL7IKZrAdv+wg+HhZYwE51d45St5tF8PuvLYpC/jfpFHS8aqp0VHVl17SocIhRef+jFY
	QPB5wX9dmN821Qi3Po702K5JpKI/ij0Bud01Dor1wfqTFHleJuPk2txW10AQAXq5OF9kzxpSNCi
	erUTAiXMEbTpimbs7vHu9ffTOtyEWLUK2bazD9oaQJ3xOK5TzObjmLd8=
X-Received: by 2002:a05:620a:2552:b0:8cf:cf7b:7f1b with SMTP id af79cd13be357-8d1b5c19039mr996183685a.52.1775117503632;
        Thu, 02 Apr 2026 01:11:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2552:b0:8cf:cf7b:7f1b with SMTP id af79cd13be357-8d1b5c19039mr996181585a.52.1775117503217;
        Thu, 02 Apr 2026 01:11:43 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v9 10/13] ASoC: qcom: qdapm-lpass-dai: correct the error message
Date: Thu,  2 Apr 2026 08:11:15 +0000
Message-ID: <20260402081118.348071-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfXw8dE8VhJ40nP
 J/0kyy2hUc3RosGqhMtx2NcxteeLaSFHjn4sOhUhdsZ4YiurtxgVYPrUMjgEyUq63Q7SVFi/ZJW
 uchnYJ8+l7VzuR7usQr5F6U8BGn1QYxvVbt37w3xxoW62mRxB1Dm2QEndQK2SOmdamzmHgYJejD
 pLM6Ce1biuE0enFB9i1TlMWzwho6nhWme6GIEn0GlV6ZpUQh7PYGjFA971d/2/5UQhDibfWoCTc
 AN7qIfohZCaj38RPSHQleWCgFv0ctm3PXqsbjMgGzmQj+2jmQTgQCffbO3ch7j0d1UG9IZnirGk
 vcrV+muBpOSF6AMUlymeaQpP2wA0Z/irxmp6Vs4D4de64tXlmadfgixkEgwPCb5WM0yI4CFncaS
 QZMv1d1c8tE9ZX/WcPQb/rN6PBXXx71cMuMLRCO/P0M8Xt36HO7OLUaSHejQHDL6/Aku/1U9ukx
 de2hnQrkI+KVhA3l7vQ==
X-Authority-Analysis: v=2.4 cv=DJSCIiNb c=1 sm=1 tr=0 ts=69ce24c0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=QkacBUY9L2qTTJrEq-kA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: RP8i522WQDbKo-3OyiZmKGLsW55l2cww
X-Proofpoint-GUID: RP8i522WQDbKo-3OyiZmKGLsW55l2cww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020072
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101472-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE1C1385B8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix the error message to reflect the actual graph stop error
instead of graph close error.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index ba64117b8cfe..87f6db12003e 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -150,7 +150,7 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
 		rc = q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
 		if (rc < 0)
-			dev_err(dai->dev, "fail to close APM port (%d)\n", rc);
+			dev_err(dai->dev, "failed to stop APM port (%d)\n", rc);
 	}
 
 	if (dai_data->graph[dai->id]) {
-- 
2.47.3


