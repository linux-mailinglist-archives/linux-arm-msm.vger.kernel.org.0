Return-Path: <linux-arm-msm+bounces-112204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fvecBoEiKGo/+gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:26:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E40660FFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:26:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JZyB82S2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cMz6uajl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112204-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112204-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64FFB301AA51
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050983403F7;
	Tue,  9 Jun 2026 14:16:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB9A33D6F8
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 14:16:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014578; cv=none; b=qHlNytxN2QPN4Vv4ix8sRpJrECCczsDyjNoqHivZR+lftwt9Rw7JYQl2mX7EthZ54NiiXfdcucF2LCu77oXFjvu60jx56ma/cp26SKft1fAEB6Qx7Su/SQ9JeUFLh6P5RLSgCPjziol+/TV9VG42hqfbPcGsDEh5gjCMeMSgzOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014578; c=relaxed/simple;
	bh=5NAzrmk0t3lFiQOkyaweZdbL5CP++nCXPQytojjnAlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LYeapvemAmkjI7frffYRjPzwWAaHfwI5cZEViBPmir9Ufp6nHlxp4c1VLu0H674Zi+W1hzEm7MLlkU0a8l2x99CG45xHrqft1vZcJXaWllGlQ3LIKl0ZHtoxQ8LHMw2aFzRSL0ZOIivEsmQ6zylWHMuI8YS+u8NHHnJhuSncf4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JZyB82S2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cMz6uajl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClVOU2286847
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 14:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZtOi0P9k/7UK6+Jnm1HM9XkoMXP0zRVjIqr
	t1SxzwWw=; b=JZyB82S2qfYyBgAh1VAEvZlrJ6ay+KmSoSdXWHzQAVz+Dx27srs
	uRssyOVenjV9UXsPn9K4qt3xmzXgwKzFk2rLxBfNLKypqlinvmQ5dpcQ0TTqU2r/
	5omwnudHHX0OcThcCOg2A1Le//jrUzkSvZLOZQMRxQxp0hHYjaCt12fg044tvYYB
	Zvzv35NYKOEtivRrPNdVuMW8X5tUKYw+XLlQ+19tGeRSIQT3sfECi6SlvPGyod0V
	naKaTPHi68wXzlzKV2Ar604maAtl0+3tYaBlJxUQLQymqhingrBA211vcghagkye
	rgrwENvPSaoykIOEbyc3gh5hkrzf7vAt8zw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jsbq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 14:16:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304df51ff3eso5382952eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781014576; x=1781619376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtOi0P9k/7UK6+Jnm1HM9XkoMXP0zRVjIqrt1SxzwWw=;
        b=cMz6uajlo81vLzbg4QqJBpFKpaMmCXIJ2klaoest0sxi0ROKgeZC95CunMJ4Sdncq7
         4MYUQWrV2jBBjwH29YWrJVcwKbMcA4gObkhkXiZXNkkwJKB9KV2Z5mAZYBhHsMb4/PBp
         +37i+Y+hr/cglcJsQZTJUDvGvfxfrb1fz1suTZsROUYlyMzOERTOjgLo3fquMowjnt+2
         GI6l0DOSIshviUloC/patP+Gp8c9UU/ZuyaYy8N8VtPdrP4BpCndFkxGHynXTps/q62X
         Z0mSujri5R4/WBo2g9l/kMIxoUqEpYFSeSDz3eDSMhnBZGgv/QIDXQ6DzExcH0qiu6dq
         mSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014576; x=1781619376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtOi0P9k/7UK6+Jnm1HM9XkoMXP0zRVjIqrt1SxzwWw=;
        b=b/m8ivpV9pBhsl7HaN2IvXVWnlMcAQJInvQsVebaAWXcdXtNQ+vacCSfKfvlu5KWra
         JVgK81vKBbUpB38DUcth3VEVek/OgGnxMPIshbbVt7jxnU1EbzHnQfEiDmmxVgo6WLSx
         4yeTc4vNDHo5Q+5aytAi4Z47BfLo3m0sGpsW1cvNi/iWmSOWg6gE3uXADtUn9jBGbQav
         iZxhLfZLEUmcnCP4zC0jA/qBdPcOMzUn4J6WhULq2TuMZLrEn/jDE9vEVrjLptSEeBqr
         goRzCG4x3RMr/+OKI5LbI6WIMdEtTk0ZpqeaQhuudQNC4vh1cfKiUkBagv7rcvuzq376
         Mn+A==
X-Forwarded-Encrypted: i=1; AFNElJ+0n7Ds1O4+hng+OJ6hXNxk9WEGTpiQjCmLPQRaqzKuyCEa7rcD0Ze90HicErYCICWihUkLoHMnoP1sE3eu@vger.kernel.org
X-Gm-Message-State: AOJu0YzpPxvgXECteA54riZ61rAutMBrvdTi2EHcMU8fmNVcbQcQUr6N
	eEoUp0/CLwAsKUxsiELc4n6RvIAMGfgbaZfIBbRJjKR/J3bhjMP9g7PpOOAYRSGRVc71V/fHeOw
	tqXyLPLvp1jpThXIQnoJDtXn6JOwxq/8a07iZfoad/gBd8nfk9wkAdD5YOoZRjlL8yxkwoVnVcl
	V+
X-Gm-Gg: Acq92OEM3ij98/wbmtl0aDtElRxK0IwFikSl2MTs2J6GzADbvDMMMAbde/UBnx5EDEg
	98uG+ey1nRPrM2bBQWnjuUx2RYi6HSZXPy3HFZkutYc5y00RiWwQKL7qYzuIxm46gbxkfNYKrgT
	BQMKd1aKSr7bFjpYbE7qvf6Ff20AD6EtpramcCv/2i+U4F5IwmkiwhsC9TvkDuV5ucakQRueh67
	tF4/5o1J8sAj+OLRGNrLpmHgfcs30W8dJIms/DETxk3+yx/R0CYNkiWHPqBhTdqvzfaGR7MD5jr
	xDvGmzuP2J7Yr5N/oneKzcymE2ifIwN1ZND53gdnMs233fqVinw/ICoSkcIXkXY3IKtH96l1ryH
	q8gYRM29/P+sLVDnmWe3xMWHjTXo+X5Cu+iHS5Uoxz5XXLKPY
X-Received: by 2002:a05:7300:fb87:b0:304:e587:5063 with SMTP id 5a478bee46e88-3077af54770mr12339009eec.12.1781014576014;
        Tue, 09 Jun 2026 07:16:16 -0700 (PDT)
X-Received: by 2002:a05:7300:fb87:b0:304:e587:5063 with SMTP id 5a478bee46e88-3077af54770mr12338969eec.12.1781014575460;
        Tue, 09 Jun 2026 07:16:15 -0700 (PDT)
Received: from quoll ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm62623359f8f.20.2026.06.09.07.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:16:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
Date: Tue,  9 Jun 2026 16:16:09 +0200
Message-ID: <20260609141608.354186-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3193; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=5NAzrmk0t3lFiQOkyaweZdbL5CP++nCXPQytojjnAlQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKCAo0VUQRqE1Y2yyqjafHZUkvelh2+v3VGC5M
 dkDD2RIy3uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaiggKAAKCRDBN2bmhouD
 1/r0D/41cQyNYYHJom7eKQXugAGrxIBt9zlWZ1KZtP2QHvQ+SIxM/4l4xl11DYwoGs0OjXcx+75
 8YaJ+HhV+u3ytdwSY6udjnROZFUCHtAZmXUonrgU4NRpoNR/IfG9ZzlZTGmoRAm9OhVejQ2rUwC
 NMt+LK/9HN+Q4KruyySCrdLPIr/kk2mTX+9bRrK3K3grLoXJM0sV3xJW+katebt/S6EHetejaRy
 Ye3s7EJuy9lQjZbDAruUml3WWmo5Q9k3nPdeXYzqs+5Pwj70oTw3w0IMcCkukb4NK03WeaGnVqv
 28x0SJp1gxGIIoWxAj+PWs4qABhvgjN5L8/+5SPzDW7XGTeAZSbZfuoBTQdzoUw0gNmIPpbP6h6
 d5OGcT4dxME33zZbku1LrU/cZFF93Y0xLvHO7NBYv1Hxg0uVhKbYUQwS4Vck9w0HJl6fbtY7GzV
 DXGYEr39spgs1LKpxGgcesXPhNZU6zHu1QHYkCGI+SZMMZube5L/V56NTgaDupspWLqkodRnNTX
 pEvMScWDvrWArRFkmmLFv+Ry4sJLDD6oQ08mKmlYYcERTdMx982ZVLobX0o7cmwH/1H1bwkZsUR
 hYhlschWw91Bv4Kvq/Pv4BNTzNLyS7IQ1fYI3ABrlGiRdv1tfCZxvNBXUOpBdTbH7qLRTAzatG5 8SJ6vBlCMlCwArg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: e3QgfemPPdzbqW1H_bl3tpqPD_t0-qS8
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a282030 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6vJ1rGMNMJ1YGqXfLoAA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzNiBTYWx0ZWRfXzE6sRJRHuW0q
 l31eyiDmT7OKlJCoKn+/0kebv9nSLUVngWmQ27ks6znF3huKCMurWTsnASBooW9PAaHEk2hTzEW
 1mfDrfL4QQS3sc4KO7kYKFl7gV9zyyYd/0dap5tUsYZ0eqIaJ6Aujuo/XN6yLPHOJc0Yqb+yT36
 oNXW4TIyx9Io/GqPTxWYKu3Si3CT8STVSKPElYDXtSTXl3n7tzyGKIGo85aeblesh2Gk0bA3igR
 f/DXhIXlFrheZJkBw+8zS1ND0mdHJ53SDR296ZgP5LnhYlPzcBq1Rfjjc61juoK/TKuPOSb9GOY
 kMHo1bKc3tyApe88FgOl1RigzI27v1dhLOvY6VPQRMmZCyi58inEeFtG+esB9NISKd2eto4ZSAe
 28F0GKptfOySDSVN2IK58RVpSjS9M63WHXNufmrda12u2VMeKX/kXKIUx+boz5fwo/cvoefFPch
 bsrCqS1jU1TYpf8GbpQ==
X-Proofpoint-ORIG-GUID: e3QgfemPPdzbqW1H_bl3tpqPD_t0-qS8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090136
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
	TAGGED_FROM(0.00)[bounces-112204-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64E40660FFC

According to user manual / programming guide there is no separate PCIe
phy 3A and 3B, but one 8-lane QMP PCIe Gen5 PHY which consists of two
4-lane blocks.  This is also visible in memory map, where the 0xf00000
is marked as the main block with additional sub blocks for each 4-lane
phys.

Describing the sub phys without the rest is not correct from hardware
description, even if it works.

Link: https://lore.kernel.org/r/20260420-optimistic-unnatural-stingray-80da35@quoll/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Rebase (context)
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  5 ---
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 39 +-----------------------
 2 files changed, 1 insertion(+), 43 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..6e2e06ae6c8a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -451,11 +451,6 @@ &pcie3b {
 	pinctrl-names = "default";
 };
 
-&pcie3b_phy {
-	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
-	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
-};
-
 &pcie3b_port0 {
 	reset-gpios = <&tlmm 155 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 157 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..0ecf1fcd700e 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -770,7 +770,7 @@ gcc: clock-controller@100000 {
 				 <0>,				/* USB 2 Phy PIPEGMUX */
 				 <0>,				/* USB 2 Phy SYS PCIE PIPEGMUX */
 				 <0>,				/* PCIe 3a */
-				 <&pcie3b_phy>,			/* PCIe 3b */
+				 <0>,				/* PCIe 3b */
 				 <&pcie4_phy>,			/* PCIe 4 */
 				 <&pcie5_phy>,			/* PCIe 5 */
 				 <&pcie6_phy>,			/* PCIe 6 */
@@ -3659,49 +3659,12 @@ pcie3b_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
-				phys = <&pcie3b_phy>;
-
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
 			};
 		};
 
-		pcie3b_phy: phy@f10000 {
-			compatible = "qcom,glymur-qmp-gen5x4-pcie-phy";
-			reg = <0x0 0x00f10000 0x0 0x10000>;
-
-			clocks = <&gcc GCC_PCIE_PHY_3B_AUX_CLK>,
-				 <&gcc GCC_PCIE_3B_CFG_AHB_CLK>,
-				 <&tcsr TCSR_PCIE_3_CLKREF_EN>,
-				 <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>,
-				 <&gcc GCC_PCIE_3B_PIPE_CLK>,
-				 <&gcc GCC_PCIE_3B_PIPE_DIV2_CLK>;
-			clock-names = "aux",
-				      "cfg_ahb",
-				      "ref",
-				      "rchng",
-				      "pipe",
-				      "pipediv2";
-
-			resets = <&gcc GCC_PCIE_3B_PHY_BCR>,
-				 <&gcc GCC_PCIE_3B_NOCSR_COM_PHY_BCR>;
-			reset-names = "phy",
-				      "phy_nocsr";
-
-			assigned-clocks = <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>;
-			assigned-clock-rates = <100000000>;
-
-			power-domains = <&gcc GCC_PCIE_3B_PHY_GDSC>;
-
-			#clock-cells = <0>;
-			clock-output-names = "pcie3b_pipe_clk";
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;
-- 
2.53.0


