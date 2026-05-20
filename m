Return-Path: <linux-arm-msm+bounces-108738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFh7ED+oDWpr1AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:25:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFC258D953
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DBFB301828C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7FE3DCDB4;
	Wed, 20 May 2026 12:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ngsrVX75";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ai32asCf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988953D9053
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779279750; cv=none; b=evvBNpUp7mVJ+cw1SL4jpDUz+6QHdMHyIXcj9r4K3I74L+/iCH5l7RVA0a1wSIpB5+SlshQNkPI7ViOtFVXKNnSrFR20f1Y8njS5lsiVo7YY/fPr8CYRCV1y7X2OZQyrXh63rAz2RArbIr711z9uymFjbImf9wm4sEXqMbFwWhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779279750; c=relaxed/simple;
	bh=4ILdF662z2u6x2IY2rjqWvc/s2+Zi9YDhI++XcZArq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MEyh3djh13wDpA8oL1cDceAludvytScGNMO11zTYwUHUQ6PlReTzpuSY+EhJTebKEn/yJp22L1M7Xvm7AHAV7FjMCdviHLVlybwL1Ytp1oK0TP1FRVIfRgZH5cvtRDT0ShgicX/y1z48VsBRhUN5rjkLn6eMD0TPbMyftyvDEtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ngsrVX75; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ai32asCf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6wYTe1237947
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=k1f28/6KDyN2fSvJNAc29VeIyWKxYNJaMtC
	E1CrdHJo=; b=ngsrVX75KKlPefKTNPr/cXO6wNNGOfVEP5eM40bSh1toILoUhE4
	pzxaIARg6YxixmxUBMNTM7ItgEiTaWqIWAkBhO+e7uQ80ajBiLfah+lgNiqeTPHo
	+HjUftsKGlUQsaTdxO8eLb8VOO6wzsFkHeyOaiuXbdTtk25cCSsdUK1gs/WrzNod
	6s9rwM4hysfaRHRAs8eG/pWk9tL33JIF0W8K14BFsIZnd0OoDf4xRsKZzblnThlb
	PE6KfDAGs+kkbRk8HeIF+3gceTVB586Vqm8vEjyfAI34sQC2pm6p+W2dhOUGaUVV
	fOA+w1rwmWcwsw1Ky3WZEKM4HQSOGuwgQzA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3svrjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:22:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-368ac44b26dso3998933a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 05:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779279747; x=1779884547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k1f28/6KDyN2fSvJNAc29VeIyWKxYNJaMtCE1CrdHJo=;
        b=ai32asCfzNZRQ/caE79CGP1JtuZMEeZvuwqy+PdBZwQxCWzz5NPdbjWcf8phRX/ySg
         A6hnl+wk42ZAOsqRXL4m+ttbeDIpcRgXrmiMHefj+Sg57RUA1pJ1suzSA4cQQRahKiQ4
         EPiabCpTk8govdtwFARcPkYKiwX5A9hok8vjzKrvxLvTybpFwiiMKrqlmEL1oiPa8ZMl
         0B943KYc7pLSzdEn4pMVO9ORAh74BLPh5bmCc6drrCeI32b32DAJFc9IHrE+jDiGJV0v
         KZmZTJrfpQyjsK4qLEkOREg9PoTNEl9CI10DQkhGb4Q+B4rn3mweZPmP7Gqc5+mx765u
         B8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779279747; x=1779884547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1f28/6KDyN2fSvJNAc29VeIyWKxYNJaMtCE1CrdHJo=;
        b=mCqEoGeLmG4y8cz+LSWNzlV4W4sP7S8yO8BGAJmHAbksEF8Ysr5T7Yp8oZY0hW9lrf
         1gxz6BXSkuptxNtEhGYx+OlrHqeQzf3sGvsqmm1thOOPYdXt+JCAYybnM7peU7coT/eu
         IyOJIBafBCiIT9hLWqn0FEb2frqF2ZfcV/umt/ux4QXJ0iGXb2RAyDOYK6MNuCfNLlfT
         R4x4XQ4W0ardkLdMmVHSjFyX2ma+ATt7vzMssDXNkfX/P6NXBW/yzHQKe4Elm02lK1H+
         NyuAo2YK96BNzWik/wTDoVGX5dqMgIY0KAWnnqaf5WI5CCPEX+wH9WeUc8Ey9yBW9UFG
         RxkA==
X-Gm-Message-State: AOJu0YzOgQlRPBvt1KqLIPd4b5OItFLLeAJXjuRS1qKthADOf4pVo3C9
	agDzax86HYhDWpUCuM1RSALBV+JRDaFMXFBKF2RergTJfPJ0c7hbhcb1fr9/qs2IlL7ABsqnj9M
	lmjrjHHIg0OzawvlYb0Ftb3jTWi9v+dOyUTgBNR0rP8CQ8twTwXygAUeyLeW6dZGr62BX
X-Gm-Gg: Acq92OFLwl0i9LkyNyfase20QTQEYoD3tGmDeOvqU0sJMpD6BOXCceGEwbJ0qxVDt4p
	Se4a0LJad1CBIlF4Ix8QQ/CqFY+65Xmm2E/avkSjBsMgdFylmXK5LiX5Kr0jtTJrQxz4TqYnelI
	ife5QhL7byIDxnUyJLsDY6BsLmjU2G3ucf2dglpsTJiDm/f2LpjY7bddlHIrUYNRSTmfGsMB5FN
	YtfcSKhjJOd7UbbDkD6RE1VDGL7htd3gikPK+ut2CBi4txi0r1/uXiAV0hmtlTsUHMSiqOLlM1d
	0iZ/576mk5Z5MRiBfPQ+MYLiVJKU+DhyRsj8UeY2Aw/xcDixBHLjjUqifIfD/vYVflU2d0OssCP
	WFN5PmFGZVLlEHL+Kylgddykq/OTeUFQajJrPQ6CGr4L3R9Qq
X-Received: by 2002:a17:90b:1dc9:b0:369:e4d4:79c6 with SMTP id 98e67ed59e1d1-369e4d47b5emr9699306a91.20.1779279746793;
        Wed, 20 May 2026 05:22:26 -0700 (PDT)
X-Received: by 2002:a17:90b:1dc9:b0:369:e4d4:79c6 with SMTP id 98e67ed59e1d1-369e4d47b5emr9699257a91.20.1779279746209;
        Wed, 20 May 2026 05:22:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695126f9eesm21888793a91.5.2026.05.20.05.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:22:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: interconnect: qcom-bwmon: Add Hawi llcc-bwmon compatible
Date: Wed, 20 May 2026 17:52:19 +0530
Message-ID: <20260520122219.2372694-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vQV-op1Oqrp47ahoLQWQB6ghi0qUn6o2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMCBTYWx0ZWRfXy4Ayn+plT9sz
 V78AtrzHCWYk5tUyu02RSy+6pC89qQK88EpCTgBQBakK2dcOn8gt9F4o8BJ1BzRqLgqrrk4ZNeQ
 iC8LpkCcgHuhONpEDEwAJLrQmY+/w/KurvTg2fVjn25FiJ1P6FwCQW2Hr05yJvnJRipHlQ1mhKK
 Si1mSB+xUT6iww0nKn/BFtgi9Wtp8+fngMwtCRcAqAVaAcPaG19lgopnxBP7FoJ8EU8gpQEgQMD
 58q3/AluT+cW4n9Y6IDMxdJYBs1K0pduHlJnbRVU+csynVWPGd9l1aM6WFUwFl4/c/abKNKPyLL
 G4B7qbFeqvbGKkE3kdYQwk1VB1jsDv9qtLyJr+HhLPcc68Lt6dfwviSDC6crm2VFqg83m+FgrzN
 Kz+TzDYdoaYprZKOAS6Q3/OHT3/7nFgPUuSykwHVOu2FcTZ3LmIR3T03gLmcWOgqoLUT6yK9wE0
 2eqojUnS+/o7MwZCQ1A==
X-Proofpoint-ORIG-GUID: vQV-op1Oqrp47ahoLQWQB6ghi0qUn6o2
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0da783 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=QoF2PQS7ko8hjqv0A8kA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200120
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108738-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AAFC258D953
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document BWMONv5 instance present on Hawi SoC for monitoring bandwidth
LLCC to DDR.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index 82b1d94d3010..ff64225e8281 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -46,6 +46,7 @@ properties:
           - const: qcom,sdm845-bwmon    # BWMON v4, unified register space
       - items:
           - enum:
+              - qcom,hawi-llcc-bwmon
               - qcom,qcs615-llcc-bwmon
               - qcom,qcs8300-llcc-bwmon
               - qcom,sa8775p-llcc-bwmon
-- 
2.53.0


