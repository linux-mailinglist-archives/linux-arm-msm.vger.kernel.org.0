Return-Path: <linux-arm-msm+bounces-104566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGRsGWOv7mnxwgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:35:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD09246BB07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B54EC300AB29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 00:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342F420CCDC;
	Mon, 27 Apr 2026 00:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7FiF6vT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhxR7xwx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD90C153BE9
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777250143; cv=none; b=SAFxxSRet3dx0uBu1QF6zqUjwoTgjFdyu8hE7wbdG0wyscvYsa8Xb95OwjX87qA2TZjDr7kAqsuekNLOPHMFtpm/3cEOJtx4rXlyYPEzGdlG3gQY8hx8cedb1xPAT+f4SVPNzcx+z3itzHv3X938/pxcpHpYHzRQvRfahcqp9qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777250143; c=relaxed/simple;
	bh=I9vwBEBzF6qvmginwcAWHcSprlfpe1heCUFvS+oN+gI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JgEpuzklgzyuFa6caIfzJbfX7Bcy/d34JdHCMPs0rchxV+gLkjzph8bK5w2vChN1yM+TfK4BpmZNkhN2+KLQUrCDNZCbLXx91O9ChVk0n343fanC7EX3xFTasmfGEYxjKEvpdonzHnzM+Cuq5WWDipQ6Z4dPa/sEGlG7SBZkO4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7FiF6vT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhxR7xwx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QM01Fp1572854
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=66XNoPkC1h0yJ/o5/2RJ/rNRxW3Sr1gZ08o
	mTrVbLmc=; b=c7FiF6vT28Um4NQSBk5urc2/Uv0Laq+QyS+hp/7o7wVkUTWk/ES
	KfVyLZq2J9kSHci4KSMBnxcOC4DRGpIHt5+A7JDTXj7rsBpXK8g4sorc8qmIRN59
	AYQGmFNpRRYEpIimUkanTTozcLOFMHu/RHX4VyoJgpGFbguYrMVl77zUIPuRDMFg
	fgqQgtdCmBewlAtfiMSi/7fLPDU3NLumIND2BkTr+0219M5bjzuCwpKT8enMQzrD
	BCutlqEP0PEW7bE584SbRUORZSDoQhTF05+7tXVXE1WpWRa+TlUG0RRWrzPF/hb+
	Te4sDnhNmZVXp8vl1yNUHOYfOvkaCv0oyQg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnnf3sqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:35:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c16233ee11so13304557eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 17:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777250140; x=1777854940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=66XNoPkC1h0yJ/o5/2RJ/rNRxW3Sr1gZ08omTrVbLmc=;
        b=KhxR7xwxBerJwyhbWJ69qWt8o5SbZEP8bvlTMIee/CdR0GRnfkCNEkPAVkkFbAD0mQ
         dqlbgNW8nFvSd6VEdQz7q80JTPVh2idVoCU866uy7XGNsJfLt11GraXrUBwzgvyP3nQd
         BveY4hTINDoYITWsDrdlQu/DAPSxXUNyfcCCNPhbX74ehY60L7BlxKZqFdyC5tqLfj1L
         LAYdgmVV26u3K/aNMbbE6bBh/+13/f1IHm7G0cvrmKLQ3xVROEup2B/qU1dv6+J9bD8g
         lDRr7GwjaWwyTHMXXy0VfMm0lS/CgN5sH9n9v9cj+hfCqiwBYGOo3vC89z0OUDNvjj8y
         Nrow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777250140; x=1777854940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66XNoPkC1h0yJ/o5/2RJ/rNRxW3Sr1gZ08omTrVbLmc=;
        b=cCG/pt58mLc1brOnVbhxE+7577rC4A5RFYCtf+7Hu/pgU7PBU8hfsOSa6jdX/bC78e
         pdvb3qGpGBLT0wQbL5MGTbgXFLb1U91DtpAGP6k9kV2WILqvUwRAiUE8gJxSzsVBgfgj
         cEaOV686iEwWteIO8MyCzUZs8pcbWFRSOYcM6jJLZr9zwYUE+G0MrIo5ckotdyXGhYs/
         nu5RkekzsLgS5r1bkyWGRr+jSH8qYyEoNiRJe4fwh63UyjA2c7hjo1lJGbgqTTcHokTL
         yGc+cP9SqpTmCyiFqgZ9O+qh1f2h5UCO3Svd/ArZlStYI/EYvodL9vyXs1Sle0k6XXGz
         KXYg==
X-Forwarded-Encrypted: i=1; AFNElJ9UxgCnQLBEWax7s4bj2eavYW+hI4lmZWZOoHPMcoNbjffUOG1nWcdp1SjhHuQYc4EMcnhrWjhouYQOMyHt@vger.kernel.org
X-Gm-Message-State: AOJu0YzSMmcvsvg4JNZjhQYUDr5rfrCajWDNBbHVZ+tN5RgtJKGfe9oK
	qi2j9mDJ019uMwH9+WHtVU+kLZ1SiCv6uz38ihkK/1/cuNwY1BGMcn6rkez8SgVfPg2WPfqcMBM
	jTvUSIb4UyQST5Y4Ye1fR/pISBzzO6nPtDy04Cs7lZOiFz2sR26EmD1I7q6rkwfKGWNyT
X-Gm-Gg: AeBDieu7W0P1CD8OlYTxG8eio15ht09oWbbLXTK9lm0Cy0es0KRume75TtyvtyUqlh6
	9dek6ngC+peJs4VphvLQWQnD+NlWlg0Jv9h2XANmUmSgfd6sTKBQSQITnxUV5dsm2qCJ4yyasvK
	VeB5YKP5ttnAlfCabK22HyJyklEjuOFzXApbMKN6FDYRL+mIUFnJAY5IjKkymJg1CJG3ctcWuTR
	J9o2jtmUsMw9462/OQ+yzWKeq1TxhYWswq2KaKXkUceCh+NWe32xOp6pY8/akeQCAqlIjDFVbaw
	xDW4yMGa45QUvyV9khxPb0xxQ/hAchCqNhc7fZlww7Rh0BPmNhDLH7aCekHKSoi5g6QY88l/rZj
	5SPuqmkAhSD/pplLsJXWiW3b2P8ipdn0f56p7aQqp3l1H8BRVL3tQvK5b0V3IUxuR1EZePxoIMP
	us+rwBUVUeQHqPBhtC
X-Received: by 2002:a05:7300:e60d:b0:2be:833c:149d with SMTP id 5a478bee46e88-2e479110f8fmr24716308eec.28.1777250139846;
        Sun, 26 Apr 2026 17:35:39 -0700 (PDT)
X-Received: by 2002:a05:7300:e60d:b0:2be:833c:149d with SMTP id 5a478bee46e88-2e479110f8fmr24716288eec.28.1777250139230;
        Sun, 26 Apr 2026 17:35:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2ce98csm40010879eec.20.2026.04.26.17.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 17:35:38 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add SoC ID for Nord SA8797P
Date: Mon, 27 Apr 2026 08:35:29 +0800
Message-ID: <20260427003531.229671-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jQWbpvCLm_vNmZDJ_kwRLwDreuwZzM2c
X-Authority-Analysis: v=2.4 cv=Y5rIdBeN c=1 sm=1 tr=0 ts=69eeaf5c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lRKjNYthlYtEnXt_nToA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: jQWbpvCLm_vNmZDJ_kwRLwDreuwZzM2c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwNCBTYWx0ZWRfX2yzam1g/+z5H
 P/rIThCcUc1GWysysR4DvDk7MuhZ7db3lQvJ8Cc2nspJdhUwhlkzXIABu2mlhurq2tvvMdHS2zl
 PvdHWFXMVUKdB+XJsou++ZNLiwYRzrPE3NDQGVkyr0KYw8oB2uuxugwWmdqr8BPENfVcKyAJhCL
 UwAHib4EEBxToAEcMQJXXtZVtx57urjs3hYXtK7zmRh+jzck5Kwm5zt6OTTKYqBR1/9maNAYXfx
 z8rfTvBtCWG6kahTWktudJN7kSwOv/BL7eJfMxE+/oeWuERFah1plh7u1yfvBXp26VjZpp3QQAE
 txWt9sEjibsOJDUj+LejHe0Xiu0ku5eXeLYQe1IQgHmgt8spJdvUgl+cM9m/mIP4mf92vOREhCU
 mTjfsumHz1W5XRt/PUhOjy068Z9a/PjPdhvLL6zdtA2UpmMYq7Y+Q91yUA8+fWzWF4j/SfE9vHr
 DVETc2AcHfS5c0IfXqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270004
X-Rspamd-Queue-Id: BD09246BB07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104566-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Nord is a SoC family from Qualcomm designed as the next generation of
Lemans series. SA8797P is the automotive variant of Nord, where the
platform resources such as clocks, regulators, interconnects, etc. are
managed by firmware through SCMI.

This series adds Nord SA8797P SoC ID to dt-bindngs header and socinfo
driver.

The SoC ID of Nord IoT variant will be added separately later.

Changes in v2:
 - Drop the Nord SA8797P introduction from driver patch as binding
   one already has it
 - Change typing style to use "single space" instead of "double space"
 - Link to v1: https://lore.kernel.org/all/20260421040231.1256998-1-shengchao.guo@oss.qualcomm.com/

Deepti Jaggi (2):
  dt-bindings: arm: qcom,ids: Add SoC ID for Nord SA8797P
  soc: qcom: socinfo: Add SoC ID for Nord SA8797P

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)

-- 
2.43.0


