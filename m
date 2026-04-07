Return-Path: <linux-arm-msm+bounces-102053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AnAI8GL1GmjvAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 06:44:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E8F3A9BD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 06:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4854A304524D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 04:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D21C33B966;
	Tue,  7 Apr 2026 04:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dtEotud9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPZHlcQI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFCE33ADA7
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 04:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775537033; cv=none; b=aSGhMzKiaUi/WNpYy1Ht8S7ZB+1uV4/a6Pi6zwEuk2hokhYM4zuwsGvqa2ZHlfUVFO3JakQfdIosXS0Gzo3GHy0R6FLcTk8VhIpMSmpn9i6m4SvGFvqcIsKT903X+xC6BogZAZtS7xprka/Sk5u2rbor8Ye5o5tHcuuc029lTSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775537033; c=relaxed/simple;
	bh=1YgVKodJDZ8iM/R/e5OEt67Xb1kzFcKpq6G+59ZkhJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sLHYdyflRw92X8S6fT6TU4t6Om1f7gPnuiZUk0IE12qAt3Yhaih85piCylPJbZsXJFB/7yuqcCmknpjfP6BDhpJGnDQOlIG/7P9uC4Msd58B6MPv961Nr5YcdyIbs9N/QMbrV+adNJ9YxEDoqPRRmLT9P99vl/CZiJNIwULHWE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtEotud9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPZHlcQI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQBAV1404170
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 04:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KKUudFy5GoN8EsapexJf1THKoHxcD0tb+86k8TrzqJg=; b=dtEotud9rMRW4Ivm
	B5B2tO8A5mHYERj1MxPFIsmFK2RHjbNY+SYL7PgEARsJ6VAoDUjAGTMWG0wDCNS8
	IlSYi2gmuPp5CWUo9H9wdj81D6zKBylqMla7kAOrd6gSb+snREEtCIs0+Vvc5CSZ
	r/bc9bZgwlcGWvYUAIta+bG+ifQ+mTdykjQaR0hcF80arfvTdsD11+s9Sn93s//H
	9oQceCQyoKFa97LKs5svzMKtdajsqEyxetLaIXF2kKJTuRELxg1SJGt1OyljAfw9
	qfT6L4xLHvp4mKLoCKPn1mPzxawufR6jTyMxc47IBMv7rVYEbRqNTQGdc0Lkepfs
	PYSN3w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr891gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:43:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a6906e35fso4924144b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 21:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775537031; x=1776141831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKUudFy5GoN8EsapexJf1THKoHxcD0tb+86k8TrzqJg=;
        b=fPZHlcQIzTUdT5YUEFPH0GNrb7Ti1ZUevDtVlX5LnQADnCTqNAK1zLhHryYi8hZ8WX
         TDKSoIJRKNoNJ+b+NZrLHAz09iwv15U7jlQlxoh18n6RFM8cZJiM/+//UzbQMZ4RwDek
         PVsQLoR+p5iU3JUyxiHIwYQqp9BYP6l9hZ4v4AYPigzIjkc3wf0/KO/k3Cmpzff+6NFP
         C1AXamHGRkPYSufWE8+npgUYPEXvmnhXs9YhfD6FhB+9fC5BO8s2aH13jkQJ5AnKouuT
         yxyp7Ay4O06OfE8nF2hTNkisB0XAZJvjG1qFYCyzHiOSvsSeZElU3AIenA7kTkeR+1FI
         lm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775537031; x=1776141831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KKUudFy5GoN8EsapexJf1THKoHxcD0tb+86k8TrzqJg=;
        b=oDKHgUsupFMIBUt4vWI9w4g4UreQj+m904LY+PuS064GfUOoL5Cf8sikJTSszJuDK0
         OTK5Y0Q1/HZE251ZQbycwMZw2y31MopH07lNi5Hg22Ok2Djt697Fy17N3owyGQhL/iJm
         Uuuyd4IBlS56k7qIW3ygrlgQS/88Jp92te25IiL8OgF2qbkPDnO+dGG3J3jjUD563AW0
         e7a2D2CV1zbi0xrrc5M8NJzz1W0k2ejRNPy1Wh8Cc2c6ZKECoEUHGsQ74T4L+AvdAQ1j
         3PguKtGpFaNvxZktqx+DY6P/PVb7DzIaoA+6dnzeV0Ox2rh7ZkKwH0g6zOo9yf3SMtVF
         KGdg==
X-Gm-Message-State: AOJu0Yz/YpaHeZCwRsLfTdPAS/wUBbpqR3ULTKS2al5Rqw9DCpr8cXb+
	bHQGc0gl70OMcddYE6Clz8mLGVxvtqBTSUg7sEngWOy57pmWZNyZFM2B8idit9k6pE7NA6DuY5a
	b89E2nt216mP6JPKE7gm2AvpCNxpmeiyRo4LBfG3h1Q+0cPr7+v6luyAFDGU+XZ5Iev3d
X-Gm-Gg: AeBDiesjYMOaooYg374S2TvIsJ5ReM+PPB6EdkMJGbLD+CLDmu1P1aKX9W9sqojvUH7
	ESG06Rt6CRmys1NmP1ainZMkO7NzjW05G0ME6wBNdXyh9WpSJTVILwBNe2sGSaetvwcL7YFif8h
	N6Y5kcDUNaPACCk2ee1W7FGrok+4fVPHLj/VbZq1HYKgU4ATDDWtaQpM9xUzs6vQdesjJRa+rjj
	2iQnNxC+3tYWF/RleYQEN4Vidibxf9nWD/jNUfVL7ADnZK2cKBYUNwqc4U8IEQJO7S2DooD/Ta4
	+VvEByBN+dhka2s+w7GGdcRzETpKNsXdEhiMc/n13qP1f34SjSr7o2asLNniS+T5mBCQGduv4Qk
	I4Oe/JGRcQDZA6M478gPTcuB8mdzvbAO/DY2xblrzmcAOnjHsTKE=
X-Received: by 2002:a05:6a00:1ad3:b0:82a:6e4b:5b4d with SMTP id d2e1a72fcca58-82d0035bd98mr14612809b3a.23.1775537030590;
        Mon, 06 Apr 2026 21:43:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ad3:b0:82a:6e4b:5b4d with SMTP id d2e1a72fcca58-82d0035bd98mr14612792b3a.23.1775537030098;
        Mon, 06 Apr 2026 21:43:50 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6ba2fsm16123299b3a.45.2026.04.06.21.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 21:43:49 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 10:13:32 +0530
Subject: [PATCH v3 4/4] regulator: qcom-rpmh: Fix coding style issues
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-read-rpmh-v3-v3-4-34079f92691c@oss.qualcomm.com>
References: <20260407-read-rpmh-v3-v3-0-34079f92691c@oss.qualcomm.com>
In-Reply-To: <20260407-read-rpmh-v3-v3-0-34079f92691c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775537013; l=999;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=1YgVKodJDZ8iM/R/e5OEt67Xb1kzFcKpq6G+59ZkhJQ=;
 b=zYQkm0/ZFNtKYvTtzj2rDfq9YGLzr8ShHzYXqy2QA4Xagy9FMpgrVu9E9dI5gKn/8Eiz5Ndjy
 V8Vv6cY9+KVDOL+vycFqAh+xk1bvf2EKbilCDJyVYiuqI2wTTDmN8D9
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-ORIG-GUID: pI3LHsZ6kedv-wXKQjZvzHYEXMSWQMc2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0MSBTYWx0ZWRfXxf//VPNFmE86
 a58kPf6o+fB6MslU8cHINy4yTipdCW75zlHUjqpewXpxvXYCmcqR75nVFNG+XxozVA2ceQZJ7KI
 YIoOUwNq07MwVUIxILri0zTJCdfyJVM6sfyTbOyEjvWgYfvuYMsHPeFDXV7qHlay64u9AMcp2f2
 q+VEn0CtSHS6FbDsojrpvZq19C5qABDZWEqbtrkTGxhNPq4DnTEi1GQIHxPzQ3FqquUX4ZTWQIy
 PJmacLDv656ge7S93wD1TwO0sF4mlnU2MoVBZ8056Eb6JF0pI1xWZaz6t2YVt4/5Q+VFmoKUXHm
 ubeM0jeLOzlKN76Jb9pibwYA+nYIsY2O4WJaYWFp2gkWsU3kQY5yhs+Nn8UHSug/bjxdCWwYgBy
 GcDdzehEcLIbyK8bdKEq5QY4gIuLpcIaCPCIAYJ5kwMJ+TLtH1zf/4zaJMHc9SvV7XfOIU/6CQn
 TBm7hN3chR92vZb2ydg==
X-Proofpoint-GUID: pI3LHsZ6kedv-wXKQjZvzHYEXMSWQMc2
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d48b87 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=A68ZeqOElA5rGN51AGUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070041
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102053-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,checkpatch.pl:url];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 09E8F3A9BD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix the code style/format issues reported by checkpatch.pl
script.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 8e1c576b718b595bbbff7f5fa76de84d4e90f3bb..23ce4bce89d51a0fa5cb50adf37f38fe54ce5139 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -109,7 +109,7 @@ static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYP
  *				regulator
  * @ops:			Pointer to regulator ops callback structure
  * @voltage_ranges:		The possible ranges of voltages supported by this
- * 				PMIC regulator type
+ *				PMIC regulator type
  * @n_linear_ranges:		Number of entries in voltage_ranges
  * @n_voltages:			The number of unique voltage set points defined
  *				by voltage_ranges

-- 
2.25.1


