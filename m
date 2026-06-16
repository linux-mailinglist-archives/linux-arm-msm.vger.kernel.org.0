Return-Path: <linux-arm-msm+bounces-113465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GrM/A/yuMWpnpAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:15:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BAD6951FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:15:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="PHz/vI3A";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XUz6zj4y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113465-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113465-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D8D031F4C0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 20:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECA3386C0C;
	Tue, 16 Jun 2026 20:14:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C1038756E
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:14:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640896; cv=none; b=QHAqNlyEIqThsVVrXoMoVfRfJhhyeOUnhIVJD9R5MICFkOWrTvD6QGwX5lvMZyoUJqdNtKVxKY+X3f7mTcaWvmmZFBZvIIwbCpAHcZFBd541mDmEwvBqv2zcGyxVeVXowL7T2UNWyNjq2duR2xU8nRqzv5I3WeS2bG8xaWH6ZDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640896; c=relaxed/simple;
	bh=AB0A7wWMtyFMDgrbKuPIcQTTW9qV8HUFhEw5Y4NCP1k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gjrWSAipqgASH8Ify6X7aKLYAAGpzNiAe5CA4S+40AXhdjXVvaciLU/wnbM6sDMUcQpgOQFPJjfNbzOQlF1dJeBnbviaGZ2mIjlKA3L98a9CKMuETFLK5LckfPpyI/dh/wUmTxP6EcO8peOeJOzN5y9i5lblHTYxCtzLzGaSGFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHz/vI3A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XUz6zj4y; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GISWrV4021081
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yOEstz8lb3k
	BSWr0k6Ei7wUb8Svlbcj7uj884ATXKog=; b=PHz/vI3AE8TtfhRA9sErjzfEwZC
	JUuShrJkvHaCEBb3dl4PXBv47d5X9AFBRWf22TgRSlKu2VjwmHCzjaE79Z3bfhPi
	sf4G1I0FGckurdUdK6Y5jvtST6zOw0GW89EKuI68dX8AB0vQ0FPeXYULIs45Je/K
	XKoKojvmu9Y9beNGFf31ii6BEF8SDFOln/XM4CgjWusqIw3XImujXN2bvjbSOUUs
	4JEimuKgqWRZqZDlPGYpvxpQwzkIuhr2vjIJYQc8UBj0W59pQwdecslVUdnHa6HA
	PQmbcjSrVYosRF8k52HvrkqA4+cOpTkdHOETXu8InREskT6ntjI7rLjpejA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu253kh3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:14:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0532a6588so47084115ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640893; x=1782245693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOEstz8lb3kBSWr0k6Ei7wUb8Svlbcj7uj884ATXKog=;
        b=XUz6zj4ympZ8ONszWmgMkUvTGf8/aHguzZ5RkvQv6V+QvS4/vm6vIamXIJf1cZIWxy
         e9RakavTGaKy/yoSksNQkBMT3ssw9LR73ffz7+Xljiuo+xH+AqTMNDcgSwYY+98tSeyr
         8LQO2qYFTqxwDbgKFQ7PABpuyrsv0v5v45AF99YLkcbojBqAagi61lr2iiD7L2K79UTP
         3Sou6bWYoC8BVZUYBMqwVOBRmXp/Ag1Ya0pmiKyLasIPxia8l9fazdNS5nzPDhu/HIV2
         tI5sca1nkftObTnokTNv23IDKVaZdR/Y3J5a9/bxjqWqUwUskr6nbJaGizzLo91IFBZH
         At5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640893; x=1782245693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yOEstz8lb3kBSWr0k6Ei7wUb8Svlbcj7uj884ATXKog=;
        b=Y8Iq0Hf3x3m+4atH02wtict1gmMEfdZzi4Uc7ZBoUYfr9KbgpUEeeKnpQk6T0aPjHF
         m3IHdMaQ4G+p3P3SbC9QcqH/ZM1b2k9Bf50e9WOHexBa7RGOBMdHBMQsJIZtegUxtVCI
         ML52OtmCCYa43/DOI7fHiuxN93tXBefwovEo1zktElBJ3EO/j1RS9jfVXqZr2TDpDbkk
         wkkVl2HtgqGC+l+zvAV3WQuGy4f/TBR5sXVHDhCZmqce99UuqtszdgCNZhjyBXy7Kyl9
         5vqf1ixXd/wo6KkPyAg+KnhHtwkaQuxSSK/RpERBPaVEQ+DM7OMuqU7VtXwIWQpuLwZC
         3oRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ymwZ3xJtlol9YdbSqc2Hpn3t5Zsy0qJexmlcp8W8lczsPlVPo+mZuLJyB0hIzAjhRhOG5RlxNzGt9DSMp@vger.kernel.org
X-Gm-Message-State: AOJu0YwjoOaMiaabf9CTTcjtMNw52HwztgruSJ0NSiUUYhWhjjfBlpS+
	e0+wBR8FmGlxdYZ/c5dK/zV22/zW3nBnDs35lzWqHvraLy3ZdugIZk3MiTATmoCPamLGzBtxI+U
	IQLb2laau6cPrNVE2e2oMeHQGkt5InKrL+wKfDeoiEG6Y0vhv1FyYFAolUhERgLAK3KrV
X-Gm-Gg: Acq92OEaTrPpc/Lg8WZZ9S9zV/C8+gE6Gc6K+XZmcPxWEezU3ex/ITVrgSQH/vDjkyM
	rgFyKVYQNvLhMuEQcrmsS5k+NG+UTOyZDOZaL3wINaYreD9LvAJ/oIdSgsPGpMPsRhd8AVJwIlU
	EeXkVnuMlLXahlzXiD319cekM0f5BjPLb1m5woAEh3sVrzZPXmhYgxftfnaEg1u+hPGYYfv6OSk
	dc6k3IXwIBVO4qBxuuVg4QFWuaMiFen+Mfi/P8cLpKoFJPUR3Bi6bpYCnEKrn5Z5q+QIgLRLdHk
	XX72FuSMXN/P9lYnTQcoL3/2zCBo3vwd1sgce4S8KcHrXjosZfNCz7SlACITCQeO1NERIzyGm5d
	rpMcrfaW4g7dX0K2BlPsZ/3LQb/delwXGrIoqrSDfuSVlYu4p4piZYnBYeg==
X-Received: by 2002:a17:902:fc8d:b0:2c1:150d:6db5 with SMTP id d9443c01a7336-2c6bbf6ef6dmr5691495ad.6.1781640893145;
        Tue, 16 Jun 2026 13:14:53 -0700 (PDT)
X-Received: by 2002:a17:902:fc8d:b0:2c1:150d:6db5 with SMTP id d9443c01a7336-2c6bbf6ef6dmr5691285ad.6.1781640892717;
        Tue, 16 Jun 2026 13:14:52 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:14:52 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/8] ASoC: dt-bindings: qcom,apr: Add modem_apps GLINK channel for shikra
Date: Wed, 17 Jun 2026 01:43:08 +0530
Message-Id: <20260616201315.2565115-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xl0WvuWE14p1KVEGbB9i9lSQycitXKHZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX2D7MjJujSNWY
 EJ+2RMr/KfMIpoDYPbJjuqK9wwBO+kR6h4xD5OeDJf3i0gvuEtSiCALz1Dcn+Fv0J9jzFY4JnV4
 EN7dhCza8sN6o4MgEm+91hcWGefZw5Q=
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a31aebd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=HnBwLnbP2RCvDO8bWWEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX9C4Pz1x3+gfu
 uWfcj6ZqKXcQnpQH4EoPrrRKWtxbVeVEHSVX+B4D875A1GMYZyKU/VdvHNQ9GW4xqgC0/u7mKDa
 JyPAVwfg7GfHH41rVCV9cBGHuQNlLN/2jnaB4q2/RYahE4Wj+ocWG45Ea6lGbBcaWwoGaS+Fwjo
 Lt2gdKZGMu3kNl5+QvmaLqqZE3JK/awrwOhVqFCN0mtrL6tRDIPYdV2soVSN2R/Ev6QU6QmIEKB
 eeRfHXW4ESX/scToBQy82RW/1/XG/jFeTQjCM1R/KKs13F0jQ4R9t1qGxacI60k7bmEZMjs5/JU
 K6jhZh2wBKiYcwcfjKiMuU0L7qlsq0WxmsDDzd6dcWeXqn7mdFtnfM9+KhA3DrB9bZKZqowDzDH
 3jfvsEVOP9XGQCwv+PPwHPaR1gc2Piu1dUAFU7/EMvSiiSZ3VjvIAQIow1MOfYTbOQmgwNGCVTo
 nnxg7oQ/RFxT0YTmi1A==
X-Proofpoint-ORIG-GUID: xl0WvuWE14p1KVEGbB9i9lSQycitXKHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160205
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113465-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1BAD6951FD

Add support for the modem_apps GLINK channel on Shikra, as audio
processing is handled through the modem DSP.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index e51acdcaafaf..01250b556985 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -120,7 +120,9 @@ allOf:
       properties:
         qcom,glink-channels:
           items:
-            - const: adsp_apps
+            - enum:
+                - adsp_apps
+                - modem_apps
         power-domains: false
     else:
       properties:
-- 
2.34.1


