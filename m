Return-Path: <linux-arm-msm+bounces-95317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INj5JocvqGlPpQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:11:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B134200207
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AAB33077CDC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9FF92DB78E;
	Wed,  4 Mar 2026 13:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRS2d3QH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ThArjhzf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC81234D396
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629651; cv=none; b=d5Lcg3x0OnaJJF9Yoj2wl4vzopgJvrD9nOZt8ot7gURiJdHj3kBY+8dzr4r/B3dS6dTmEa2yZocuPN8BNyJIWdinDYuEYLpsF7eWxiT0+01MUFvN06H/32jCu0s939mqZEz+b+8er+V4uKaT1zFmnnkWtXcZTE/2zqlPe7vQhpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629651; c=relaxed/simple;
	bh=m1EN4YpUgSj9UMxMClhVmL8iu5GkBIX3+L8UCDt7O0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZaYC3nDERHT/cKPUSOownDWUtlMLLWMvzDMuVYtbBjPe7tpBA3jevFGd+r0c9Xe4zAwN5ynBgReHXwIrPH889kaU2Wma1/OzcmvmBRLcRi8JliSul10sQMzclnAzYVkWCb7aEsKvEDSN6lCWhezpD1jcIuzyKvJ40f9EUiQ19c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SRS2d3QH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ThArjhzf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245T9eJ2277038
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 13:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pD/LO1GMq2Q
	S6g4Vc43eIA8IGXtM080UQe3gAPGBgKI=; b=SRS2d3QHWKCYpI/DSKEgEL29y/v
	UI7glZ5dUH4m5k8Q2PI7+3Byb27B1ORkOEOn/zOwe2S/qzaa4jy/6KcGkhGnN+Qy
	MEJUxvkv8FqpL71HyGeuaXAsXGFPLoWhGXGtzYbUNO1JeNWWhar++qb2jvJpukbK
	D49dl9L1l4bv9Xv+1XUY09InttwqEsY1vq91dQW8VapqaxxDLAKIcf+n1PMi0R/X
	VPJff03CUP1T8Y0QTp7wtytxNShcbVTkNMHjFYclnS/CMu1cIDN5VIgy46SqJ2BJ
	JaAyWXlVb4BApfjwz7WKgOsuhpEl2Ia5QxRh6XT8XrMa2DbSe8QTnheOEag==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4msw6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 13:07:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb42f56c4aso4544371985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 05:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629647; x=1773234447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pD/LO1GMq2QS6g4Vc43eIA8IGXtM080UQe3gAPGBgKI=;
        b=ThArjhzfd4CrmUnkByQaz3cUtd+SfYBNVtpF0kKtBz4p8x7a+bKjvTPFJfVqXFyDkV
         5ZJ60iVgh7w3uQlvTT0t1hqgiqHIy1I5CGtEocLIEv3SCNyXp3LQx+6NVs0fgFaBe9SR
         Cw7974X1T5B09dG+RrZXuujvjKdmdioxskRCZmniMn0uXdMy+zA+z4tNeahPrMWVzepC
         sBSw+wmcSgX0SDyo/E3zJhXF1UJ4U2mh6OgSrkmQAUb9csjQQDSizjYPLv8rEvsCFeZ1
         BjlbziOlFwe7wwj2ta13xs82NT9+c6c6mUGBdW9s+EGdHDNDmp5QPyJatJeu8M4bZ1UI
         Iv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629647; x=1773234447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pD/LO1GMq2QS6g4Vc43eIA8IGXtM080UQe3gAPGBgKI=;
        b=G5nFEZttDmYb/58VS2rT+Enlp9isInDUMvj7J02sgZY5W8cN7eR7VqcYZ1ay9DfbO9
         cQecpzCeQyrF3XkQ6lS5JfrlGaV6pXxahtve7BnmuOacAXTGO/+o8AG2qbsGCooRC2bK
         ryhWnUFOl9Jyg7C6+v6XrMrlJKaQqSErixzQ8BcsuzbEMPwNltBfGOjz1M9fyp6QUe2T
         w8wBbzwZvpsqhZxpJtvnMTz6dXzZJHDYlYX5kKYQrtlysoSbXUpJ4bTUpbDIKBR8lxCz
         33ZvDDEbIQkcGtRl08ldSrC6VGhZpMfHTiFEmZ+ywDLqQ00nymvvonRbTZwyA/q8rytV
         Inng==
X-Forwarded-Encrypted: i=1; AJvYcCWuMWos5EPMkKDBqNHeGH6uB/nkRJJkQlEksxtK0hEg18kOksfnq9ToDTOcEFLfHbGrBAFzhPCuCtSFM+yp@vger.kernel.org
X-Gm-Message-State: AOJu0YyXGqf8MlNZf7/Tnt9LdobQ54KlLMYL620TgE2uEdyVmQJmeubt
	GQBiUX1h3By0U0HMud6x5lVFIfcqTJ6y6ZG1pgJzEpGrlRk3lw5bUW7lxG0O+w9QIVxpgKBy+Zq
	iWYTSK+GztOLqrSq6/0O9VR0Z5KTQtUYFj0Z+O/ZAHU/Rl4qQgiQ8zujpR0T9gZoMZJgC
X-Gm-Gg: ATEYQzzMhz5+TCnwWEul4cHxy44kBsafKS29jhw5z86dWmJ7kPLGJs4lz0GGZ7FfFEx
	I3w4uTfmwWXtIBGo9T7Fb/gNZjMG/FjlgiPtXH/NB5ILjl4qba1ZEw4RrfJrFOZZmW6u/ugnEyw
	YrBM+BJ7i61wifHCtB8pWuuPEl8XKbXfQGbK/H3fmwPtQtR+0CsoFflGcUAk4jk9dPToU6pJpTj
	oI/o+Wgvu4+YQcUkOjfYN/Nn+kVmYQi5fKy4LUddWGTS2Px/E6WHRnB3QeakNsTU4ss46Nam/Tp
	cdlP2/1ClMc2TiT74HGBezM+llT5VemhXdF5TvHlu9eQOC/z3hWq0zO3+KjHfmAep8MfQlxcQdy
	6kIGGTiFZQQWpuijnBQG/mcSxDGewdAsgQ+Jdn3HVe+rPeRW3cQvK+DY=
X-Received: by 2002:a05:620a:28cd:b0:8c7:1b3f:7d0c with SMTP id af79cd13be357-8cd5aecb2c0mr225099085a.16.1772629647005;
        Wed, 04 Mar 2026 05:07:27 -0800 (PST)
X-Received: by 2002:a05:620a:28cd:b0:8c7:1b3f:7d0c with SMTP id af79cd13be357-8cd5aecb2c0mr225094485a.16.1772629646542;
        Wed, 04 Mar 2026 05:07:26 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188122a6sm49969745e9.12.2026.03.04.05.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:26 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 08/14] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add Senary MI2S port
Date: Wed,  4 Mar 2026 13:07:06 +0000
Message-ID: <20260304130712.222246-9-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XkV-qFipfacos92Jn1Z-LS7UVGGAvU5S
X-Proofpoint-GUID: XkV-qFipfacos92Jn1Z-LS7UVGGAvU5S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNSBTYWx0ZWRfX44H6F1fLf87Q
 xlmp0g3ciDdtrJHP4IBJAl1AZvZoyGMBgv6EOlW1gQqpviMbNcX+GdbEdgB1S3SBTh53JzEV4MT
 SQMULEEnaCTj1jSA1v3xtkEZAglG1w1x8tbIZ/ky/sirHlwIN86zRq/Yzd0bdoUoUOaDhQZeaTx
 r/Op5uf2i7J9q5UNOUa3xsLwvSHpKzeOTxlwSuYb25B5T0UbkLktfIs8aT5H/y73TwOTzjBNXjl
 zrqyE/JnqO5NQbrbo+j5kSmoXbYbnq0qW2d9Pd+z/xqOH1GDuxj7DV5H7rGZVChyJ95ZnoX5PKN
 N6QDW95yWa64ce6rtKeQD4aN66dLoDwZ1IGv57oLndRq9FiVGbJoRmg6v7Jb665ft3rlAPD4JlO
 c3Tr8Kg7BWkwJdhg8LrN3QdQDgSqG0qtIDFB+VLTJEpWK9awb7v14X0XbMVdRB7YcIUoUVZ7F4s
 1Ker+OEFqBmciSVb+Vg==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a82e8f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=S1r85Wze4wKqmHhc2Z8A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040105
X-Rspamd-Queue-Id: 2B134200207
X-Rspamd-Server: lfdr
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95317-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Qualcomm platforms support the Senary MI2S interface for audio playback
and capture. Add a new definitions for the Senary MI2S RX and TX ports,
which are required for boards that utilize the Senary MI2S interface
for audio routing.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index e27a31ece1f2..45850f2d4342 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -150,6 +150,8 @@
 #define LPI_MI2S_TX_3		144
 #define LPI_MI2S_RX_4		145
 #define LPI_MI2S_TX_4		146
+#define SENARY_MI2S_RX		147
+#define SENARY_MI2S_TX		148
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.47.3


