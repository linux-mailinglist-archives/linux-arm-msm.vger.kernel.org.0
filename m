Return-Path: <linux-arm-msm+bounces-96224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SO7+KWGsrmntHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:17:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 032B0237BEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4383B307A6D3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 11:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07531396B9C;
	Mon,  9 Mar 2026 11:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R3HOekDF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VkCQzqFy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3C7399013
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 11:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054797; cv=none; b=MwlY5HBVlH5QeIOIdDmJ/qiTn9B6nwJER8dryf1AfLJXN7A6XEc8rUJaSjRBFG7jmOI0HsB3tjr4gy85rBNM1VOMYMWtcRixfykzEzcRUVMAznTy3b9QTQfS7ixsb2aXzZFMvt98T9rxDUGKNdL4rUWVhKZ+tEsQaQab+zGv3gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054797; c=relaxed/simple;
	bh=BdRgGWd4oEtLj76eWcDHQVOoxIh5X+tfa9dViGZtSdY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SmjhUNQQfRWyLUIiQORkrGDWBLxjlIe4bqxFAgKx32cgKvnbVVcjNTabAnr4Ip9p6Wh4thoaxYw9AY02kRuIgkuzumCYRFOz5/5CjsHiR9iYWsXDATncUjwB7oddRHTqVaTCUDMkFZL79SdRBa9V25yGXH1yW67c8mMpFgYaQyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R3HOekDF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VkCQzqFy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298F9kp3013568
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 11:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eQ+fi4cz84X+kwu0n4tPfxWg1Db53dlHnYM
	ir32ibW4=; b=R3HOekDFpEIjuu0FJBqV2HMuwu6QSrSlfUfSw1wNatc1q4A0Upf
	7twztyywgXkAwk8C4DnDtPg2EyUQTLquXuZSkwqTIc/dg2TIkDr0K5wa4GXtozfT
	mWTn5yEXLHDs3y1CRqbREPcyw8ZWqYsJw/QRnW0a4+1deWYRsCBKwZJR1fJOJPaF
	Yriq8Gk4sVVqJukqlLZG2TaaV+bunFVBQ9djQELueqMnagdI3a3+nlRaUG/3HMJ6
	2231ZX9aqK8+t1G+GCye65058csVLCxSgn8QcI0mqVg61g6Nd5UkDkUQDte7lQeV
	w1t1QsvmDcOoERdKC1ZYZlzW2EFSZYE/IqA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxw5ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 11:13:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae4e9577ceso385682895ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 04:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054795; x=1773659595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eQ+fi4cz84X+kwu0n4tPfxWg1Db53dlHnYMir32ibW4=;
        b=VkCQzqFy6fkMtC/V+X9BTQMbF9H1nJFf/JRiVGa24f1rrhpolSH7lE6j0ocqSPZ33L
         34CPI/AX4c7YMRZ2PHoZmZjNB5QPnH3ze9JhwJyiEkUdT/aknjm+DZAjjmzkLRSSAlHP
         08dd9913F5Bghn9dsfGOjkzO59BkCXb4w8SHDjbfHIfOOfFOEOjpAyqagXawo2LFVErS
         RgZAxK7WqPmqGxdncbb83em4KRm+CpGnTuSe/Mgij8u518exTcegmCRm6mPDK5vBKUN2
         mm8FyrZCe+oP22Dv1uK6ruKriVQA3fYVQOlmk628bTEDzee/L2YlzO6ob265oPKYWi0t
         ASUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054795; x=1773659595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQ+fi4cz84X+kwu0n4tPfxWg1Db53dlHnYMir32ibW4=;
        b=cExJVIHw4W3RLm79bLJIbKsoMSJDufDyrnmshdh8NG0ewn3iPo7JmCVSWLsZYaU3yk
         /2dJevvTGHMCxQYiZiHNS80WtsriwJfrJz8HZslm+sEm0vi6aZ7/gbnQXhpG3dqqszo9
         +bcLaHSHldrbyNKJ1y1d4eTWNEkmyA5aJzgAfOB0uMx4rh9z0l63immB7VEgi+6QSb0Z
         0tCTOa8aGE4GAa0kLJE5FbGTD7SzP4WBXX/clup+QfvhBiN7X24LGc3fJgsWXqxvGZy9
         lsIaXchkkz/g963OyQmPAPtV9NSk2S/l0CwhwPpXGyY25Q6iCFaZb7My8qKuGyKUSrtl
         LzYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP3NrQ/9vTNKXw7+iz1csoBdeqVJJ5QyzAavpjS88kkJFPm5C6IXsoNFNeGUOfW86Ji4yV4mh/MBeT2mSW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3SYaotoEPhQ/5wvqoF6a+tegioQSr6IcmSbLsf53jzCn7wuP8
	Wm+IvydhTZkXBEXgzSq9D/u1YhM2BKhx6Vxo31uThbE5Jlr9vKK4O99fPRK7u4w+/70PpMO/mdH
	uT02EznsG+cvmpU0y8wAq+GJy3JfJ9smAy3dLhwWYquXflpR7Ivrpmh2xgEZNwRI3ZvZP
X-Gm-Gg: ATEYQzxe1O773Tuu/HWeBQesDjco1vpoNWNgjGmDUlPxNF2puiwTV42fmUprAU/9pfx
	vZgqKGqkvB4tJNGTgCS8ANgzjAfY9OM1kGa99u0EbZB4g0FrWjjOR4EMsMA7YohE9GskUUK9kYT
	J1hevTbzTm8gdM/z1uUhg3mJ5Zf/MGeIXYcJScT8ooJkCyijjyGrRKg18LOW+iWfu3cLXWXVbMp
	UotLZp5Nx9zFhwxqOMiRG8S6IM+JVj1eDGyLAieHSMvwiqihHMHpYioJS4UagoP83chopYrMbpc
	3IEmVUIZaDXsstYJxtJwDfnm1WDqdsSow7WLMqa7pT1JhXtqMIaRGUEnU3CgSevqVYkZKHREP/Q
	EkX9awmv7htZeAGKkOscKHjBubvYbvmlkbxO2p0GK42LDnBeNWyzaQOudTA==
X-Received: by 2002:a17:903:8ce:b0:2ae:6133:d170 with SMTP id d9443c01a7336-2ae823a18afmr97942945ad.20.1773054794740;
        Mon, 09 Mar 2026 04:13:14 -0700 (PDT)
X-Received: by 2002:a17:903:8ce:b0:2ae:6133:d170 with SMTP id d9443c01a7336-2ae823a18afmr97942695ad.20.1773054794301;
        Mon, 09 Mar 2026 04:13:14 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840c9967sm145405925ad.90.2026.03.09.04.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:13:13 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] ASoC: qcom: qdsp6: Add MI2S clock control
Date: Mon,  9 Mar 2026 16:42:56 +0530
Message-Id: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMyBTYWx0ZWRfXyk8D/KjUofi1
 I+SNJVuBh2ovRFmwoA2cgqXiJ/6wuJ5TRcGED2TGpNJ5cI/vM7Tc1+8aAxM528wFu92CqalI5ZJ
 TBisC+wIIEoK8m1/W3aYGcrJ+cr4mYrdlSkA6MFZklFOlKYZsWMicbqFODIKfB4k/wDBwqVb3V4
 fL1iaDM4omd5wz/Jqo/h95i92KcW6XWLuFa3AnMAE+kuoUER4ekQus6j43iMRxVilL55xbcNgRO
 q4jkIVBRyc9RJJukEQRGTBctyZfvg0TPhHrKWpZAgd5hnQETa/UG35x4iXW1KuXSs99r4gX42SI
 iKEjeWCcHcB5/yMXMhgQ6vq0Abe4WhePD1lDZbhMMWlxwvCWqcb0a+9QBu10a0EGvN39Hf/X1nH
 OsFY1drux1QaSqMPfbVLMGNf6oYL1QxfppwwPRhEEJSppb0Z0ijHEkMdYsqXRTdeHsabqmhNtsJ
 AFrJQGdecFmTiXuNMxw==
X-Proofpoint-ORIG-GUID: _hAm1_WqYTEG0O2lvXH2cxoOf_EVocoG
X-Proofpoint-GUID: _hAm1_WqYTEG0O2lvXH2cxoOf_EVocoG
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69aeab4b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=K1zzXB5ik6AW7qICne8A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090103
X-Rspamd-Queue-Id: 032B0237BEC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96224-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.994];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
Each MI2S port now retrieves its clock handles from the device tree,
allowing per-port clock configuration and proper enable/disable during
startup and shutdown.

Enhances the sc8280xp machine driver to set the boards spacific
configurations, some of the boards like talos using third party
codec's which need's additional MCLK settings for audio to work.

Mohammad Rafi Shaik (4):
  ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
  ASoC: qcom: qdsp6: q6prm: add the missing LPASS MCLK clock IDs
  ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
  ASoC: qcom: sc8280xp: ASoC: qcom: sc8280xp: enhance machine driver for
    board-specific config

 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  41 +++-
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 137 ++++++++++++-
 sound/soc/qcom/qdsp6/q6prm-clocks.c           |   5 +
 sound/soc/qcom/qdsp6/q6prm.h                  |  15 ++
 sound/soc/qcom/sc8280xp.c                     | 180 ++++++++++++++++--
 5 files changed, 357 insertions(+), 21 deletions(-)


base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
-- 
2.34.1


