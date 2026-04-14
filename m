Return-Path: <linux-arm-msm+bounces-103024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2O2IAcW73WmCiQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 06:00:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AE83F563F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 06:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7B9A303EFC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 03:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43036344D81;
	Tue, 14 Apr 2026 03:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVD7alg7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aV34tx0J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AA633F8C5
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776139186; cv=none; b=ok4YrRHG73nP3YsEoZ4kTROdotdhHaCjlibBVeRQfMy81roUFLHFSMMLfDgMcuWplRsxqBRMmQrNI/9owreOEl2WBYl4g/rtjD9c90at77qe9rdKjHxqLT3LfKOi09HHEBMdRAGRdY5HiMpJMj1J6pWXYragGeA7R2Pq1Y8C1rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776139186; c=relaxed/simple;
	bh=QZYwBAG+pTDj217+cj+RjnBxhhvqSjs3QXHm8g/XqpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T6gD0Ca0S0lwOTfBQY9nMcvNwOq2sHg0XPiLH2sOvtlbGkfhG2wvIGfI1m+mI77qk46jbiDZOYYq4eSXpggEeCfg2q2YiLAVa9q/vhby0ejXQtgKySmk7H58AYJKLuh5+ea9j1aS/ZXTd+APFLC7RzviyiBvTGuGN27Vhcss4iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVD7alg7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aV34tx0J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLBV6r2633547
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ugHwuPVgElZC0lXcMV2XcJCHfpDjLtZL1Mn
	qE+P7JYM=; b=dVD7alg72dbfFMCukGFiKJSVBhUR7CVENJ451KiBB01LlnZR3Wy
	8nklKbbnmsstNIhOz6o7rV2ZjMjN2trpJ++XEndST1AtOP5ldqp1T0PAoySbseS3
	NjAPhoHhjVwk3SpFsfvwS2Ih++Sdz6DD92IIos3c0nCvYHyB1EoozMYAuGIDmQDK
	8dp+JD7ZRXhxJ3XlvRd35y4s2sckck5b8OjraaZVYNznoezvjjEoCnVfNFP9gL2k
	VhFQScWCIUaWj8O6cS+l6a5Z6aYr1nXhqdkj+N1Nvwyg+pwZDvJONnthiZrCK2v5
	pCmM7bomYiuwXBJy+U0TaqbdaIjz70Uklkw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86c8wxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:59:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so7219555eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 20:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776139177; x=1776743977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ugHwuPVgElZC0lXcMV2XcJCHfpDjLtZL1MnqE+P7JYM=;
        b=aV34tx0JsdQFAd4jpSFA3Na2lyARkKGtH3mRpomBGNl9VxH/MtoJgSTNyiIaR1logf
         Iw07jdSE7pSNe/7rGx97mKnUTcZkmNp1BB4qFpSzOsOgWaKckyCaQ7cstCipbab6rY/n
         De7zHB3kA7kLMjMVHr8lOYxzUNJmg9jaxW5JL6Q49cpzFKC146dB/6LAKbPYGaroVKx2
         X1eeTD9h6Js1kckqv/satO2i7CpI0smfoqwxx9Szxy30ZnrTsE2nTtWReD9r0Ow8CjPL
         M5pMsXt6JZvmo1e5VMoA/Qs8+ZBlDgxAkdUmhtrM7n0LuM7nsxwzwVxsl/kyA3W3J+q9
         WKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776139177; x=1776743977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugHwuPVgElZC0lXcMV2XcJCHfpDjLtZL1MnqE+P7JYM=;
        b=mGDxLtTpz2VYOf4meWkM0S/wXksUl+xPRfm8gUpu/KOfHii4kOCj2+iBX11TUudP9d
         HcykF9rN8Jmn0grhEGOGOy43xmuYNjT7TlCF/NT7WwgF4b/rGCHOL1lCn7AxdM9cq6W6
         3GTDXygZV9Xx2zkzcwFZVvTeQ4WGz2bFFdz2lXS5jj87DfAsCziafWGdNezX54y1plHy
         GRtwuvzzUqYx/9ahfDkq7lxGRb2srL23oGcGIpQaczJj0ByqhmBI4Qmqr7gPCAiWa7BZ
         R3UrA6tXKJsLll3d/+V69CzgQBid3X2ob4S7oHoeX2Vb8AGKPu6FQxiPMTVgAHXYcA0k
         1G2g==
X-Forwarded-Encrypted: i=1; AFNElJ+q2HBUHQM5xJcpkR3rb4XqTkf3U6z2wWBOYUL/l1EVZ9QZG+fyTubU4kxeObr7LdLXYjs8GfLZRu3GE0pZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxtfaRPK1fgSc/bVBGLoEl8J/U3tZga6FMlqKCDSgv6p8G/L3L9
	jpxLL+oJ5GL7LDJhmXyXqv3iL2YyaVIuvvdRVB9ywZvenrOjD1v7t6hVbT44JRKDJnz97ru9OeC
	HY3Lq0wAbteLlWncqqvqatJ01aY6k6QEfpC7KLF2o21d50lWYLbzTtIlzbUddtS0uWeXw
X-Gm-Gg: AeBDieuS0BQDzs4AcegDgypRwGTpceq7Hd4KJ1wPeYxzL7ht2tMGJAloGiOjF3vLfX7
	+1WE3q1vzc34jUsrOoM3G1rPJUJbBbG4ADNW8NNyPRix+b0TALxjKo24jj4a6kd+kS8vx3QPDGC
	/O+OaAIa3g8Kw3Pg96tJyKe7ymlnLn9mDoZlHG5wjwKHQfapjTr7VFWW+jopT/fRlNdjAX5aOA8
	WkIFlkBzh3ydipFEfCAfToGmaOUsiP+9CpUXyCqLwQAzEdcv1FQuNtVCxSZ1dKieKn/nZ/bRKWA
	TQjJ7f5vcoJ9PQDtvBy18YKayWR8h0r6kXYuoWBUuDTj+j9K6Mo2OXrrtQ2D57jK3e7u36vOSzO
	zHWjvKGsDg2ufusy7HYUCuWJqHzpgo6PvO5y+RCvOiysyBdXJGtbb0A2aP9ojHFs9Qm4IOgIJvY
	D9cJ65rA==
X-Received: by 2002:a05:7300:2287:b0:2d9:db50:c6a5 with SMTP id 5a478bee46e88-2d9db50cd6amr2384800eec.0.1776139177435;
        Mon, 13 Apr 2026 20:59:37 -0700 (PDT)
X-Received: by 2002:a05:7300:2287:b0:2d9:db50:c6a5 with SMTP id 5a478bee46e88-2d9db50cd6amr2384790eec.0.1776139176878;
        Mon, 13 Apr 2026 20:59:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d80acca4c5sm13949983eec.19.2026.04.13.20.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 20:59:36 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/3] pmdomain: qcom: rpmhpd: Add power domains for Nord SoC
Date: Tue, 14 Apr 2026 11:59:06 +0800
Message-ID: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _uIKJXJvq4ZpLrhXMMRS5lIb9ti5CrgS
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69ddbbaa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=9bb0FoRI36OxSVolPrcA:9
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAzNCBTYWx0ZWRfX8fumvblJB0BW
 ScB/EricSPgUc333ALaMHDuQ+AxBfkiOhcLML7AA7csLGBfAU9t09epOhgL325bALJgIaJA+fDt
 iVgHgOUzh2i4Hb6gwRs0Hsis9wVg1rXp4uawj9EZT+fNU3EQQBMcouubZiBO7D1Kg8CG+EVSgLq
 hDUVQRY4jH30Vrd35Dlm8UXwhSEjbvpWlZZFxPeu4nqVwLeWw+Ljs2pVi4UTgwYY4pin+vxQW47
 tRolhIGU2WTN3JMXSfNG9YIASTeNRLDOX2fgpUUJb+KH64+GsrMamBm6x5EIe2IFKVemc055qoW
 gO9jsz/oEY+TmVwt6dSldE5h5lvLs0NO6lJT5KLMQSMdrzC0RUv8E5P+g+zeWzeTnxIIKqCma3o
 SN24VoafwSJYwso7ixAaSqevI52Vho2DhE8/BKrOLrc7cIcxZLSK4sYrH90JeubJrb1j/YE8/KK
 aNBvuS8wegGCsip/t3g==
X-Proofpoint-GUID: _uIKJXJvq4ZpLrhXMMRS5lIb9ti5CrgS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140034
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103024-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 92AE83F563F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds RPMh power domain support for the Qualcomm Nord SoC.

The Nord SoC introduces two new power domains beyond the existing set: GFX1
for the second GFX subsystem and NSP3 for the fourth NSP subsystem.  Patch 1
is a preparatory cleanup that fixes inconsistent whitespace in the RPMHPD
define block before the new entries are added.  Patches 2-3 add the DT
bindings and driver support for Nord respectively.

Kamal Wadhwa (2):
  dt-bindings: power: qcom,rpmhpd: Add RPMh power domain for Nord SoC
  pmdomain: qcom: rpmhpd: Add power domains for Nord SoC

Shawn Guo (1):
  dt-bindings: power: qcom,rpmhpd: Fix whitespace in RPMHPD defines

 .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 drivers/pmdomain/qcom/rpmhpd.c                | 35 +++++++++++++++++++
 include/dt-bindings/power/qcom,rpmhpd.h       | 18 +++++-----
 3 files changed, 46 insertions(+), 8 deletions(-)

-- 
2.43.0


