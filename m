Return-Path: <linux-arm-msm+bounces-105665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNhHLFZW+GnTtAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:18:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9A44BA12B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBC0F329D240
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 08:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE50731B114;
	Mon,  4 May 2026 08:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHh/7H15";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hX2otSeR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430A031F993
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 08:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882370; cv=none; b=hiKcSRES+OeR66+YSTjgAR06uvqSl/wIXs9DFQqzAYNkuh7rNm2cXzbG160wPsA6OnBn7Ay7DtKtTz+b4mPgq85wawZb4ZfO7O93dHaNNX9ujru2FmEB8VjFlDarOIosAu/VfQJtV9RZ71tapDwb4BGvPxVyw08R295mpi0XrbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882370; c=relaxed/simple;
	bh=A5+FYYphLU3xHwcoQzFjmd7AyAyvzhTYoD8is267iTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cBFPhIfoGxyTikm6arNUncbAe8312bDuhK9j7HNHF0TwK6khtajKPrNMbqCpu8M8c8fZnpFIAhMLy+FFisfq1iT+ncSyWM8CdEwbb9tnffoi76RG+YLlZgZAgNn4IAH8RPvfG3y3uCFeT+cIJKRfnMLgfghCUZYOtWZu+VpuUrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHh/7H15; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hX2otSeR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DSZO2201193
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 08:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9IDQeLjerqRCd1Zv3/i+0JBwPw+fQuDZpL3
	Iq/FTkHI=; b=YHh/7H15uj7hXTmDl1nEZp1NGzc39MfwaIOq8bzWDWUnYArruUD
	p/+zR7ZdKx6io8E22UzIgMSZZ1ugRMvcnoiPCrXpat05YGaGKpRRfZNe0b+L6np0
	KtgTxsfJW5vpOEArUJqJQsd4I25FCUeqYWGG5wJGCpGG7FoWz6I7LkDP7NM17Tfk
	IZ1GVwRmVYxH2EDqhCVVQtMge4ACL2vRW9PzQHDDQZ7s1F7dfN7P55NdA8s5c0zR
	dBtqfXcKo2/w5HLQUahFl5PuaYdW8oGLWerAgm0HO8xkeoElKAPhisxnpf51lJbr
	C0ytOPOXPuZlYCjRn8VgtHotmlTAtItdVbA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwxk1aq0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 08:12:48 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1306c2f7037so267992c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 01:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777882367; x=1778487167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9IDQeLjerqRCd1Zv3/i+0JBwPw+fQuDZpL3Iq/FTkHI=;
        b=hX2otSeRg20z/bfC2QUkVvykY1k2DpqYYsiDld2mSVag6qbpHkDHf2gKLLqYoOX4tw
         BVnc6jzuUPLHSA5B/lmw33KAQKdftc11qdXyNUjRbeJ1xd71Dx+zaP5QGcUd0HQ4kqNz
         odFNhwzw3OPQl01T7pUtGtVjFmmrXs48LTnu1FRnx6Qm7PU0O0zrHfXz/FHuYPSlPgsD
         xb5hNf5LAbEnUVJ6MAdduqSlnZ2P33UCFDhmHVZG5oHX1TROx7gUCeRv2iGnzjlyuEMt
         uYTuz3ClZIbWtc1DHlya6bL3hnz4pPQUXJ8sZDi7bubWXb8ixZH+hL67kdSJ6DQ0fRk/
         3a+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882367; x=1778487167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IDQeLjerqRCd1Zv3/i+0JBwPw+fQuDZpL3Iq/FTkHI=;
        b=qDqZybkr2PLeUf0GNNNzeK0ZjnHotzUSA0DPQ5Kitq+Pt9T5B7P5pnzfovMSzK7KNz
         WKDlHfdBVqyvmt7lNdjcvx8oBvUdTEs6TmrEkS7vdoMwo53/F3RONmuSvqxjFis+3F/7
         6Pm2htqSAFJCu0fTNjRxTAYYWk6KrvHwu6KESdHI0Y/mz/8MHBpsCjMeKkvhau8uut2i
         lH7a7qEBGl2vDQTW5I185M9WeG6V/Knbq5JfYO79ofobjh025+jBpvyCapgZFDODHPOW
         ReSM55OEEEfMZf3USshk7ueqSL+ZETOpLhwbCrjx6yPYs1vrRhU+mqR/UWbdGG1DFErT
         bXQw==
X-Forwarded-Encrypted: i=1; AFNElJ+ehaRCI5zOfN2RI8xqT9O+yRZbGA54RhU/orVAJPbVrhuaS+TYE8SvlRut8F2qXtx2+/IsrmyxQ1VOh7sw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4byAdzyvwGzsQAYpkekzatNN8hSCzy7u2gs4pP71UTf0Q8AyQ
	WTJY8DOpDzajSw0c+Lx0VIvKNHKZ54NPE99D5O6O78WymEdSgyCincG2aNoDchiUy0WmjXwSEt9
	nJlp1EHnUp/PYXYq/JbnIOY7ZAHy8AlAGNhktd5N2mQLm+54AK4MF4rjSm4xNEOOTA0oM
X-Gm-Gg: AeBDiesc6Jxj3UaWyBgEnqbWPJTO+7rffDQFwI1XCRmrjS0CvVjVa1uVomj2gEpAS9E
	Vhw5TpdoK40BLrA7/5vV+w4seU64JsUFfob1/ojBjoelmDOljPPHK/Vsqd8uWqRisco++wLHGSm
	RQCRqtWalRSYBnZ2PxK74zoh/h6I16Eq8Ky8qb6r9OGUxPcWSByTjZYairWpZhAgzGSgtwhLnaI
	/czN2gwEGhzccxQ5acm6Y232Y66ocj1bo0rpxGucarb56+qPCTS8Wp4rM2LOADCTz0iypWSddTt
	YikzIDTe31i4xQoIyu0cBxUBsHooZmEkf35XSuidtgLO+r4rjBY6pmWutM1hwNshb5MEkiGc4nm
	lXjgHcLPsmTFxPzXISCCX+wLJASTKC4RUn5TSTlmAMLDWE8uKpDuFlmZmND7sfehgCNprYkGl+v
	rb/Cr24sy4EyPS3WD2
X-Received: by 2002:a05:7022:e25:b0:12b:f881:d8f6 with SMTP id a92af1059eb24-12dfd855517mr3839423c88.29.1777882367058;
        Mon, 04 May 2026 01:12:47 -0700 (PDT)
X-Received: by 2002:a05:7022:e25:b0:12b:f881:d8f6 with SMTP id a92af1059eb24-12dfd855517mr3839417c88.29.1777882366362;
        Mon, 04 May 2026 01:12:46 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8287711sm13321511c88.4.2026.05.04.01.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 01:12:46 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: thermal: qcom-tsens: Document Nord Temperature Sensor
Date: Mon,  4 May 2026 16:12:36 +0800
Message-ID: <20260504081236.825755-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4OCBTYWx0ZWRfX+Jqae9B0uNGz
 VmWu0ii9X+4aekwqQVLagU8MhccAEK+Vw0uNNn0nfs+/wDE/gIURmg1fJGyCXIPgB9rVlOf8x+N
 dJIUOeiwiI3PQ7RrQsxZtm2lrQLdv10USaX0vrW4Lto64pHkWQY6Pk/7wiaXcpKVMiYZCrka9st
 s5AYf7uNr0GNhqzejr4xFJZ9WZrgFATnSYWyxtCCOH951uhTrMvTvx61xzKesFVegd1m62AFWw+
 zoa2BALaQOYQyXVnrfXx4/vJlPHKCDbM2KXeWkUZiHMqUQhy/lyxpy9tj7dJHdElQ4DUeViXmZ+
 vLsTW+xju5PzqSSrnjbo5D8ZLBNGcvc0sNNX1UOC/yQN+sqY5IQXa/q0ivoeGR85RdU4iqJ4S9F
 A0sTXG+Y+lekhYgZaBCqZQqK8UW/9mLhuX7IEWY9XB/SjGndDVlkwor2z9N3/2eLm1jVWosYnyV
 mC9+3WnsDAduhl9y89Q==
X-Proofpoint-GUID: 6BE4B4lErcWKlK4L8c9MiMxIBER2uJj8
X-Authority-Analysis: v=2.4 cv=bb5bluPB c=1 sm=1 tr=0 ts=69f85500 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IYgEcGvnuURNE-kt15cA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: 6BE4B4lErcWKlK4L8c9MiMxIBER2uJj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040088
X-Rspamd-Queue-Id: 0E9A44BA12B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105665-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document Temperature Sensor (TSENS) on Qualcomm Nord SoC.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v3:
 - Improve commit log to drop "compatible with" part
 - Link to v2: https://lore.kernel.org/all/20260427012511.231475-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420065409.1249030-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 7d34ba00e684..e65ebc6f1698 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -58,6 +58,7 @@ properties:
               - qcom,glymur-tsens
               - qcom,kaanapali-tsens
               - qcom,milos-tsens
+              - qcom,nord-tsens
               - qcom,msm8953-tsens
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
-- 
2.43.0


