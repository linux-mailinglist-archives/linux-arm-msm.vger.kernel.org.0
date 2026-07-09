Return-Path: <linux-arm-msm+bounces-117896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wwkSA6NYT2qHewIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:15:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5719372E222
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:15:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=J+0mZEup;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NiM7jroE;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117896-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117896-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE99330A3D29
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B273E92A9;
	Thu,  9 Jul 2026 08:09:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14969394798
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:09:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584567; cv=none; b=A+RLL9Ez0GBTKfvtNmzSF8kQjOCVfpXni1w9nIjuRM01DsgFxlbA63MovelIOLUswXJuyYyEBnXZ9J4yuRsJrBPM740uJPbm7GZFg1zAVy6Ui2nhgpTEO1RK0WWSaJ0Bl2ymIAVsNMl9T1WWxJ8BboqzKH4XM2v0fHoIkroEIMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584567; c=relaxed/simple;
	bh=YCz2i7HwOXuH/Ngaa7PJAWboiH4pWSvy3jQXqqM/+Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RZC9LE40u76ODhzh8p3YR/fks6fpUiHujoVmDWI8Kj+h/VvNpAcFdnm6RhsP7D8ydvhW+72z0oYPLmhJfLc1tqLmwGY1LtFQzAU+CdAkOrGlLkIuWl9VnqvflZFEeTLrdt/JcOA+vqHLoJ5oJZ5kiqb32hOK56RZOEdI1sUSmBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+0mZEup; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NiM7jroE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960H5s887963
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bwH7TEQlYr2fO36fLAxFhmf1TpHfpILk5AK
	Jrwbpr6I=; b=J+0mZEupU3z22OOwNgmvdCIi5SAZrTqFTlOxi5FomnjUyqFpYvY
	mYRmxJZonv3rKF/xbDIPKXf1CmBeVrR4KhXyvPSp+6bxPgYfj8UeWZOsePjEbcek
	4Ttp7amPvi2QPMlvLbXDskKNegcXlbG9rj0VUZLkjHPwf6lNQ08zfw9VbImUAhe3
	1MLAfZbEJlaiCakkwovYGmO0l3+tlGieJBML2lVM0x5r030rhRXTdHJWcYwwR4C8
	J5lW5GZnjfTkb6VIyclnSrMCbLtEg09yFr4PtgLTtEHZP7jMT+Ch2TIIGVpkHml4
	59+UjDRjUlkWOSVdGh6AU/Ax8Lnzou6mQzg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq33fg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:09:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845317fa7e6so2695191b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783584563; x=1784189363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bwH7TEQlYr2fO36fLAxFhmf1TpHfpILk5AKJrwbpr6I=;
        b=NiM7jroEL5LZLzod45A9oosHr0Sfflfc4jyQW+HsR9PVz/miXOeMpZX/mX9xqzHXtD
         JAd/JENX+favBGXYYIb25h4gnKzBUqc02uUgfgMB/P6BANyOYrFDqmNPWqFDe2EpCmmh
         2kkPMwHNUJ1DUx0nLHJv5VdfGTYD6MJ7zPzZssy9AXP1at8vSTEaRfgSY/zKsZZPbRM+
         Bb5Rv7vwpNuAnF2jUAYUD0kDBQkmMP2cV0gNQ07a5ZiLSJcVWHfysNnBio2rEHxl3lyw
         yOm/2edzDvp3u74nehGpyILxaMA5w4iYvcdULTKks8meZ1vz7T/EBMTPelhVS7feu1eC
         86JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584563; x=1784189363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bwH7TEQlYr2fO36fLAxFhmf1TpHfpILk5AKJrwbpr6I=;
        b=NBkcygMOrALCTZZWnaoeNr3Vqqp6XvQuVIskeW5gTTY9hw3B9U0Spf7OAyyAcbfRaK
         qPsbREZqhvBUjg1qSXDP9KMPNuehnxCtP3C+oE5PRj5zEbidVkw2ht6W3vhVWUu5h29N
         Ls/4FA+uDM3P154C45lB/c+qz1oHxchISArsiZANZ/kfYYw4COWh9BN5Vqfl6vCHUA1e
         CQKxP/wp4n0kW5ZDA6t0Um67PWAdCb7aQhTNdhE1zRoXrDx5GE0Peju6KukbhKUOI7s2
         23Tyyp8jZHuJ1QdhkMcpfLpl92fn1L57z6p6mXU25QoXV1qb8521/EFHCyEhZ4t7Tfx+
         lxcw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4S/ycHsyFe0Szl1ViMKH3kXwlReXyfmnt641z3X7fHv/sVzIIqE90rLpvk9eO+sN5XcFR+5577UdoemnH@vger.kernel.org
X-Gm-Message-State: AOJu0YwV3g5MidHc9kdW7RgvekFhCipp0ITXD/ESoklFf1CugJN/ZpcY
	RA5nT5FCHAM1zD2EwwDGN87ukYHsQlPy/ALFZeeEE21nDcLxmAhswWB39kcpj6e/F1cG1VjCtHB
	USo51unFhO86IpJ13MYpKUx8T87DjxdGTqEpZuut6hLBbQmZoHtMPNOU9RQlqydT/u3ob
X-Gm-Gg: AfdE7ckuICblHnW6ZIcO9xSxx4SOfHueEH2wS/vPaX3x6wLl+mG7crwOwl7+Rz1HBbQ
	6X8Ut+K3R8CcVwYFxRtwl9vqyL/NuFyVLnbiXvBqiVfcdkXULby0cOeDnpfjf82m9e6fR/oJiCH
	GtFBTSUaC7Ouxc60VDJ80sulhRwu8CMt3WHKKfHUF8Z+OCcifD94/oJZHhbpJqUh0/iEFGz2iKB
	Ytt0zHphAzqPlvPCYCros4lB3bX7X2Ujl9ZuqZEW456wyHEEFU2+vp4VzNxP1EVkCG0vLDs2+hy
	YjFLVe2a3nrN6GWz419k4+3psIKMxmSmhb78Gz/L/BNGN+hdlkLRAVQHToeXzwCdtjHi8XNH2Z7
	QUbz+WNo+V/nV0pasbkz6+3L7PEiAeX93g8jkTrE+/dc=
X-Received: by 2002:a05:6a00:808a:b0:845:c662:2be with SMTP id d2e1a72fcca58-84842fec9e3mr5364783b3a.42.1783584563043;
        Thu, 09 Jul 2026 01:09:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:808a:b0:845:c662:2be with SMTP id d2e1a72fcca58-84842fec9e3mr5364758b3a.42.1783584562566;
        Thu, 09 Jul 2026 01:09:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7a96fsm8177239b3a.46.2026.07.09.01.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:09:22 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: mailbox: qcom-ipcc: Document Nord IPCC
Date: Thu,  9 Jul 2026 16:08:48 +0800
Message-ID: <20260709080848.4070338-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4be1I6wEcV-QWyMQmJjrXKsgm5-sLcqx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3NiBTYWx0ZWRfX5ZGxAe+bdyNE
 RQoNU8Y2KTWRua3X0MWhinrlWUwXRcZKdGVfmjNBtpPkQUzyBSDtBL5HioiBHT5mtNfzVbncphf
 NsdERhyX+MCwoYzXllrLRQfQFMOJVNBkQVETdU+zMMls4rSo+2twhGdd4vL5WAWJFu3/ZCtXsv3
 OHrOEiYVECb8gv0+NOhbKJSTDLU3XzIAHyECyTY7pVzyR0ea1Sy+1QX8FiBn8ozXFVlfjtq1q2j
 JH4lVa4J/Z6N/eAfVx4CocxkuGUNep0f6i5HcHohfF3UO7Y9Q1hU6yVFXZEMQvwM00w9CTEr85K
 EnvchKpDj37D16uxtYqnbHkoyNbmX5CLYQktm+gBQG0JH0x7hVMGD8hZNcMjMdvlmzkKOX8Z6MT
 nd1WLLziJUUNSOZthggCzpUvqvZBu9a/C+sSOybjIE6dRvM2+zElv54PiIxtVI6FNAzjdkchw+Q
 rCMJxpCm7rVQ+xYMVig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3NiBTYWx0ZWRfX12p1UEhyC5CB
 QjAKXThUI7hhegZS0HMdAElkec6nTZ9x27l1VTHkTlVlB4M+a3WIMUvHQtXJ1rEaSEg4XYsC4l0
 NwtqBMWj3tepH3W1Qg6FtXhIw9S+5EA=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f5734 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=x3N0ClUllxI611mQ78UA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 4be1I6wEcV-QWyMQmJjrXKsgm5-sLcqx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117896-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jassisinghbrar@gmail.com,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:deepti.jaggi@oss.qualcomm.com,m:shengchao.guo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5719372E222

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document Inter-Processor Communication Controller on Qualcomm Nord SoC.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
- Drop qcom,ipcc fallback from commit log
- Link to v1: https://lore.kernel.org/all/20260420040141.1247612-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index 3839e1f5f904..a378fe8c7148 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,kaanapali-ipcc
           - qcom,maili-ipcc
           - qcom,milos-ipcc
+          - qcom,nord-ipcc
           - qcom,qcs8300-ipcc
           - qcom,qdu1000-ipcc
           - qcom,sa8255p-ipcc
-- 
2.43.0


