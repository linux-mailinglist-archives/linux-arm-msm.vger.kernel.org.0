Return-Path: <linux-arm-msm+bounces-108878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJdnF2cJDmru5gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 21:20:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B5F598249
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 21:20:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B006E302E1E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0BD34028B;
	Wed, 20 May 2026 19:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fb9j2PHy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SA0gqKsU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE2631F9B8
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 19:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779304802; cv=none; b=Tu6cwneJLH0kKB8PuLfM8ugDBItFXuFb6Wv2rUly+meRjbU6QLpp4xbhdNjjYjCXwfcYllpnbytqrDv3FAgk4Y7rsTJGBAFRIujhJFpEjjUga/iwonslgPagRPhIuTt+W2kSlcczhyUgsvIqL4mWfZJKGfxr2XsVLpw247t+KKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779304802; c=relaxed/simple;
	bh=4FHLC0bnTekkNLgy7lcHxQjfjLT0Wq3vJixLptjPBrs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EpiTtb7JdeZcZiObisSEx/iMxEOMZFd/T1Ve4SismfWk+wSUwHFSKaWvU0NByRl6wYXhIEvIVPzhrYyftAzt5h2lnT71d0Ubc9ooGQMHHyS9ydKDn3EweNF3vPu2PkCM0XB3UUsNDumk4zu93ar1y4oOtexTcU/f+lNyKLDCgPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fb9j2PHy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SA0gqKsU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCeEHT317159
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 19:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=r6YMtjaiaTXIMz4lJ/l5IAROT3th/iPkVaB
	nZpAvcRQ=; b=Fb9j2PHyxuz+kO1pmc0J+OPZFbjx3x1Cdr/aoSGyENZdfgfeAc/
	dZ9LP4cowWVdjrWO5fqawN7uEaHib+Mg8VdrxfZqDNZnrT3pplt4UTenOAPoVy80
	bIIy3z+GnDtwEM60KpzpUAq5fZK9KQkHucWe6KTOjpq6AwKa5/jNDaSkbAlvENGx
	mevRuwtKAB89cbv3hPIyAO10BkIUwHtUO4bud9Tg3cAV4R11ENsoGKKpo+fC3Zle
	1McViLAx8jvtCA21e3bIpmnLSfXRjVY8XCN5QnE07/ymctIPdN2kv3e4hjKo/9Lt
	nwWt3OwsSIxtnQO/hLDrMpDK+uT0fmJC3yA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9d5qspeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 19:19:59 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-63136f3c5d6so9564324137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779304799; x=1779909599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r6YMtjaiaTXIMz4lJ/l5IAROT3th/iPkVaBnZpAvcRQ=;
        b=SA0gqKsU1Lg3NFJHdJc/0u1xpm0mAlAZgcYHDy3HIXOJXS0oZcrjH9AnYMR3WnRNbR
         lmli/hkvCVKSwDaFHCSwlibuSAhuujsN9aOZ5sYdxHdUkrJ3TucUVE+K7C+6Tcqw3/RZ
         rCJL7oLkKq4F7/5bnsh2v62V0WPyF6L08VpyPKTOZb2SJ8vn46JPC0HQAzrmWUGaF/8c
         DxvrzEQxSa7xg1+xk5TMehni0BGXHlrfz06g5QKtcFoIOynuxPS45jxMd+e0Yi1Trmqn
         sBii5yTYe6hYoR1SNyGUiIOVmPRPkZQCx+Vm2snIuqzu9Wpto6it6rVxMMlnM/BfZkWX
         5iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779304799; x=1779909599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6YMtjaiaTXIMz4lJ/l5IAROT3th/iPkVaBnZpAvcRQ=;
        b=Cs+t3Z0TasbOLPGUXE3ZNsjSh0+u2a+aUG3pl44LCnG8uLV4Ey+lLDDnXaj5uLb6DG
         tn9kQxfDSCq+5O5LB+9vAsnIDfnUOQKW+oRLMWBnNQ2tDhsUwwtFqm55ltZbUC/Rqobk
         C2ENL2p7zvbRBnxgpfFow59GdQ7bg+IdqfPkry2zGxqdPADPCNOEwxHGBcBIjEaLx1ma
         Wp9epwuPTfF7p50hrmY4A6R1TquY2ErnKJp06fCyA1dNoa62DG6BbaZymPKj8QKq0mPi
         ixFeebG0ZKJ6Ojj4//l2Bihp247nvkFG50FscGMPfAO4Bo8eOGVRjxn5gHVjr8qI9Ikp
         dGZg==
X-Forwarded-Encrypted: i=1; AFNElJ9+uZIAAve1e04/nrhgLf5xvCNi1ibYk3qXiZmaawDr9UUs8ba/HQCTc3oB+CW1TgDNv4NFce4UK7ET3OJv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6DxVoqzZLVp7OKRIhAqdgTvxz1eBweMASnT8VR4/RR7j4hZ1Z
	9KFfgOPN0EluP8OzmSWatjq/qGlCI0bhTILScAVcFB3V9EZTXDKE7PRfBH8f9PJAc20GOqUsmik
	YpLDbrv5d8ltbJfIF1wV34GdNwvCTfdECJwoxVTYcVbUPriubrKOBkl84553r1g+/rZe0rpbW04
	qV
X-Gm-Gg: Acq92OGBUby5gC7cfp4ZURDFhewSrgFxC3n1cESKlQOnKJrpgjZn1XzOwDQ4pnOlJtG
	cKbmru6xMCnixKaHYlWLxbLj1fSUEzWxkp3Kzj2BEs7/xoFznbrTgfcIzudK/msnZzOkMEwmm22
	+8C2OifurTMs0xP9xQiXk9OJ7CBYGT1LBruyWMhLnCIo28rJnvO3HcFm6+kc1omc/InRs94PV/V
	Pb1wDXRrYaJs4OxYejSJ85o+oSPiu8CszsFKUBmGAhjxKsrbN/Z9cRznaPlecxS5IpvxBbYuKxZ
	XjrXMZ97V8p5PDmUWtdlnA6icfkN6Mn+DcZpnMaM62LZPl8PfbrU7Z2wat8TFC38edwG5HlncDK
	XFOKrlIllmyk5DybreRzMip46KOFk+ikW1cHp
X-Received: by 2002:a05:6102:854d:10b0:650:94b2:b209 with SMTP id ada2fe7eead31-65094c2070fmr7545566137.4.1779304799295;
        Wed, 20 May 2026 12:19:59 -0700 (PDT)
X-Received: by 2002:a05:6102:854d:10b0:650:94b2:b209 with SMTP id ada2fe7eead31-65094c2070fmr7545549137.4.1779304798919;
        Wed, 20 May 2026 12:19:58 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed2f738sm54567601f8f.16.2026.05.20.12.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 12:19:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org, sashiko-bot@kernel.org
Subject: [PATCH] interconnect: qcom: icc-rpmh: Fix resource leak in case of missing QoS clocks
Date: Wed, 20 May 2026 21:19:54 +0200
Message-ID: <20260520191953.190564-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=4FHLC0bnTekkNLgy7lcHxQjfjLT0Wq3vJixLptjPBrs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDglZH+ClU22WgzuRSsjPrkjZHN/yZFiwN1QGr
 5+DofLulIiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCag4JWQAKCRDBN2bmhouD
 1zN4D/9079hBkeNaOJXFm/yX0bDWLgwYhAydjlIymxjEFffVfWSoyzP2SJdEskNsO1t1bM4OTOq
 87+CVtXnVi8Jyqm1h1wP0HyK9CSI4DobGoduG8PI3I+fBt56Svo0Vnq3jFS60VAnE/ElJ0Q5eLt
 ae2BNNGAzaMaA3siuFd2ST1RcGb6r+hvAddJzUPR2/EIhAJOrHH1J4BPwT5JvtpWuvHbisDCIsr
 U1DPZ81gukmBAy/Isp341v3WclToV9nxLOd3ZutOcRgjwsPLyFu1xRwYRbicBdRQNWnfZy4HXNh
 dC2+YSKr4KNUmnhKvQ+ufZE/wLpKuGY+3AktkPajOeM6AKt0MMjZQh3qubBQZISf001uF+dPveh
 wqEIST6DUnK2wXMWrsH0BV6APG6aAF7IEJvCspU4AAGEX7yoBlBFwYTAxxwoDQDjAGsXJ7l7iTU
 vu0qPvc0quFUStmKbkXGk3KYZS/JfWFIVAC+T8FSsPekn32gDYdnqMp7BRNB4YAaG2ySsPmVo8J
 ahLqb7Y2bfm44z7deD/YNbtLmTXlBK39/M776WB0ksCCFa7d2sehiH1wwzyYcHP0J93Apqsq5dg
 qW++udrAaPzOaJqGJOAPCgHJiUPAnv0YaW2vr1obwDBbH+hfw0XumkinNdOlnkcHiGxdu3lf3YY F2LUb3n5fVQPY7g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE4OSBTYWx0ZWRfX3JWbQV2QzdJj
 j7SDEKom3IgLHuCrSF8yWwHAro8HKLA6IYHJSyM4IWp+x+xEu8TQ5+hzl4c0tFD7anCVKzYyPC5
 li/E9rGgilY4SrjqHx8N9SNG+YObu5nyqR0r2YhSgF0Tl3v1CgarOlqMkOizMs3TQ2yEW851X5b
 T/5PnObGTjOVbP1OUMXBDIyQSNIddEkpXyRPjFyefRCs9Iu3C2yUCdRplWHrNfAVB5kpxFNt82j
 LpzanYn0AGK0iXn7glR6Bc53Pv6rTqMfe/7bZGryP9cP77fIIpTCxJp0eXbQXhkuxgGlHbLQQVB
 WQBQFlT0n1zkXJ4wQRgR4mEawSskWChhKTQb+Nk3iWAAxJ0gU3m6y6nmu2bYvfZ6Rz2bQpSruDd
 RSLA5OrPUmRpNG+u8mHlP88f9bhhgpnnCJr6hFWRhQjHBKsST8yzl2zXCJbTREnRJs7gmoCfpny
 3HEJpA/OaV1UTBerhBw==
X-Authority-Analysis: v=2.4 cv=QshuG1yd c=1 sm=1 tr=0 ts=6a0e095f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IQQy_Q3euI4hPQ5xFQ0A:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: UqY2zDCzD_6wLu72BEppNFlYzoplduI3
X-Proofpoint-ORIG-GUID: UqY2zDCzD_6wLu72BEppNFlYzoplduI3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200189
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108878-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 45B5F598249
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Driver defers probe if getting clocks for interconnect providers with
QoS returns -EPROBE_DEFER, but it fails to cleanup in such case leading
to both resource leak and potential use-after-free, since the ICC nodes
are stored in static driver data.

Cc: <stable@vger.kernel.org>
Fixes: 05123e3299dd ("interconnect: qcom: icc-rpmh: probe defer incase of missing QoS clock dependency")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/r/20260520190807.509871F000E9@smtp.kernel.org/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/interconnect/qcom/icc-rpmh.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
index 3b445acefece..56512989d1af 100644
--- a/drivers/interconnect/qcom/icc-rpmh.c
+++ b/drivers/interconnect/qcom/icc-rpmh.c
@@ -324,8 +324,10 @@ int qcom_icc_rpmh_probe(struct platform_device *pdev)
 		}
 
 		qp->num_clks = devm_clk_bulk_get_all(qp->dev, &qp->clks);
-		if (qp->num_clks == -EPROBE_DEFER)
-			return dev_err_probe(dev, qp->num_clks, "Failed to get QoS clocks\n");
+		if (qp->num_clks == -EPROBE_DEFER) {
+			ret = dev_err_probe(dev, qp->num_clks, "Failed to get QoS clocks\n");
+			goto err_remove_nodes;
+		}
 
 		if (qp->num_clks < 0 || (!qp->num_clks && desc->qos_requires_clocks)) {
 			dev_info(dev, "Skipping QoS, failed to get clk: %d\n", qp->num_clks);
-- 
2.53.0


