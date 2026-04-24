Return-Path: <linux-arm-msm+bounces-104430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLnKJh5J62mWKgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:42:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED35F45D453
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6371A307037B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A264E38F92F;
	Fri, 24 Apr 2026 10:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mEHXOQoD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g2CuiLVJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059AA3803FA
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026988; cv=none; b=EJ1yJTh83vl6NnbBYIlo+uiG8ecdiLn5JvwI7CFL6ruYsegodeYhM38X0Ih//Re2sYvsEAEFzfyuI24nGjgfgyP3wMOkErou2GWUmHD4T9c9YG7/ruFZ7nuJ1cvKE10vN/apk/b3o1vju2Qle+kbe6Ipp790rwAofoOw5m5BOWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026988; c=relaxed/simple;
	bh=2pD65EKhTqnzAcbEnGR4VBQsKzDDuQwMXw2PekiqhOs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g3lhczZ68+Op1py1qMEKFHdIosWEdScOBhbDJwwyYTZwsMZOU7dn5vmHjzTNVFYugHjwJNRlbe5FHPOSu/EDJ6kcpugYOGzLtqK8G0BJz8Xm6ldz/nTfvjZkJGdG5kYDKhe+opFZQIpI9emcmEXyG6pqdr5CBVe4oBvqLSbnhGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mEHXOQoD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g2CuiLVJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OAPRjI2972421
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hNqn1IyPpJ+B1Mzxz1Py5l
	HkjehsRiXfRYYRuNWEddo=; b=mEHXOQoDPYKDugqDjcZSrjwxtZqX8H6VJS04aq
	a9I1jbldnk6Uv1e6XUArbbkLa/w35a0oHHq4BtHhUqpzk1MFCv0Q0fGA4ak8Lv25
	EyRbbkSzzG8fxUiJOyX9peKAphi7T1Na95R0y6kSwo68p65GXVYadTVLL6oW4U2/
	LjZmcQnuD5oR1dBSz1DQO2Oc1IndJ7/OwsorLylNpQNlsuFuPORssQbKU6huFHlP
	xAjKYU8kkwEKB8DCXlHZD0g2T4krMkk2hx16aMYhFpoV4v17gUxt0J6iJbOQ005X
	DVYXNGzduSdZjvfSvo00hEg0UhE3Ey8e13KbsMP29Np57rmQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr6rk81gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:36:23 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c726f4055so7261961c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 03:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777026983; x=1777631783; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hNqn1IyPpJ+B1Mzxz1Py5lHkjehsRiXfRYYRuNWEddo=;
        b=g2CuiLVJDZ6kS17Rubd5rZMBMF2VeBUNJdEAJsN+dur0KpaMGCi2BZ2g1n1PN4rpHw
         bbl/3nloBhbIkUC/BZYkdVvX6LOM0caedzU4wSHqc5bppL+R+TvAtyDHS6rJPjpjDI/k
         UTtvZzOjPCejQtkaQ+m9BPLr7kpYK/6e3EoPrYseH6Wq2oS7QhApGxNJcnmtlYEXIuem
         Ilyi0pHvQjL8dbp3+fsh45YMQW6AuoGNeUgd1WvMGDcU0qAAwKTTfYwI8ytAfHByncuG
         JI0wzzld2SpmIt1uBXQYiTfi0MmBW0AlfQIgCtsBOb6WZnI4aSPfjDWVhmONarcPVEJ1
         Hi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026983; x=1777631783;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNqn1IyPpJ+B1Mzxz1Py5lHkjehsRiXfRYYRuNWEddo=;
        b=gdwTAYz4CJkBleiHC0IsGz5rxf/hv299YVvQd0mWJj0mKSUb59xVuKoPmnHKL51/qX
         1Jb4Rf7JXE6rVUMl4+JS/YjN3araoFPrD7rjoiw/TQFBIvxR+ZfZZPPPFP+PqF8bCPkx
         DopPrNqrSnvzefL/Ixejd6QTw2Xec1TNdwQBNLwjuTkv7h96MpYFYHXl4j1McaXJ3VXb
         4KlrLuw+mhYY1RPuO0ZZPYe4Ohfv5+WgPmbZIWPtzTecNKsWP5CI6arVQH8tJi1JuzWW
         qG2PuhSU1ks3G5omCt8thY0TGpIgpRjlpAmTa4RJaJ3Uyd4S224lBNe0Zit/G/0gxT1n
         dJcA==
X-Forwarded-Encrypted: i=1; AFNElJ9+ROLhZuLpvUvt+J5Vta+lww6m3cnerdWCae0Lm/GcvWMcajKVp2AzxG66EBPqo0VaBjtMOrJRXSiR5tJl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4rYuLjJ9tytzpyAN5LYZZTYxnJsIjRLBJeeWO3QhDHLff7Yf5
	E0FrtN6lLTWkluoO497+XTo3u2VvuBYn28NQ3B2o6znRADdym5aMI7uPfy1zNar7mG1yGGHBJcn
	uqj6+6ygfNjPiid5dkKBzKWNYG4BgA4GDoCoc0tww+Y9dGy1mQZzArxQDAdnyEK/jqYCx
X-Gm-Gg: AeBDiesIUc2iqSqRfpGV5monh5636W7t5qZQaQTBEgM8MYR+Xvfg93B//L6rDcn91ik
	80fLOSMmFN6i1ue2hNm1VU/aLgGixiNUA5sqH5H6B/U4wG1wtUcD2UOxmhMNjtZyGsl+PLtPzjU
	2rjAUOUoh0lcg73QOJ1m3luNIwgHm4OqQ9rhGUn6MzLrPxK5riUs1jURHe7znQIHN8wuxGIdi6p
	V/QKDsKDoxXJo50710ceol/j0edMZjT2bI0QFuudlpPh1V5DsnkZHHyjtY/fQhhBZ4MirpjborY
	WxU9+lfy5XbStRvFfzmsfqlpNoc6g9vNpATrJIP4uRnWuVtZ8jyKDmSIR0CY7+mMcO8za+aPpda
	faHCb1wlzxucfj2wn0/dPhR4LxaHeo/5JI7oD6DE4SBZnAR5nGgB3lrjNOfGUrY16mmPs1I7QAQ
	k7MnipRw==
X-Received: by 2002:a05:7022:23a0:b0:119:e55a:9c04 with SMTP id a92af1059eb24-12c73fa2498mr18020857c88.32.1777026982896;
        Fri, 24 Apr 2026 03:36:22 -0700 (PDT)
X-Received: by 2002:a05:7022:23a0:b0:119:e55a:9c04 with SMTP id a92af1059eb24-12c73fa2498mr18020843c88.32.1777026982278;
        Fri, 24 Apr 2026 03:36:22 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dbe78e12fsm9187846c88.15.2026.04.24.03.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 03:36:21 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: [PATCH v5 0/2] arm64: dts: qcom: add IMEM and PIL regions for
 glymur
Date: Fri, 24 Apr 2026 03:36:12 -0700
Message-Id: <20260424-glymur-imem-v5-0-18ede63cf063@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJxH62kC/yXMTQ5AMBBA4avIrDWpxv9VxIIaNaJIi5DG3RXLb
 /GeA4uG0EIZODB4kKVl9kjCAOTQzAoZdd4guEh5LGKmpkvvhpFGzYqMy4hHCeZFC75YDfZ0fre
 q/m33dkS5vQu47wdODGbSbwAAAA==
X-Change-ID: 20260424-glymur-imem-970c1015e89b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777026981; l=1414;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=2pD65EKhTqnzAcbEnGR4VBQsKzDDuQwMXw2PekiqhOs=;
 b=rrciBuBertBi1DPTT3qM6S3cbxHPKQpzcsfo21XcORiIMiGQTSLvjF35oRJ30StIwuuwSx5sG
 6D3F1VruI24B6IxX8uJ/If7XfCJygv9evHgApE3V53bqEY5Fub3UA9I
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Authority-Analysis: v=2.4 cv=AfWB2XXG c=1 sm=1 tr=0 ts=69eb47a7 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rNtKtUGQz_EyKwJUZIQA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: rNRRHPvBrD58ab7yEQaEjvt8m2vhYci8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDEwMCBTYWx0ZWRfX+ad+hW9GU8Hk
 Z2dg91Rt8je6eci3ZkRyuDV2aPBMmCG69tSmncVP1kxlQAB8iWy3HAYz3f2hnYvrKZF1ILo8bWE
 YEXL9JbJ5GUwTAzL+edBS+4SUH466NzDhfZt79o1y0iaGxGOpD48ms/ki2vstw0uIG+R8mA7LtI
 /+Mbrr75oDuRZFCP4+e1j02l71CNle7MtEElnwefe3XqyRUeuSq06Yqk6lstUNCmu0KyhseopiF
 d7RpCum347+gFEzuDQVXhLaJC9zlwcazPjq5ZF6Ahh5fBxMyZaWEwi4PW/gUrkgWHmoqCW5L4gD
 4vQDxRWG0DTMjYp7xKIOlyCnhQZJsBPxRB+nL3D4me8PB0sTMKvKURKkrE4QJB+eYzSOuDN7qGa
 vYRGti6siwWMVW3Vk6hMCyBimNosM9EzoF1YnDgl3Sx4+9GP6J35xSy8E1xjPKLc/+vuV3AhQ1M
 z4K1KyEkNrUePfDEUNg==
X-Proofpoint-GUID: rNRRHPvBrD58ab7yEQaEjvt8m2vhYci8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240100
X-Rspamd-Queue-Id: ED35F45D453
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104430-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

This series adds dt binding and node for IMEM on glymur.

changes in v5:
- updated reg size to cover the whole imem region instead of only the shared imem
- picked up reviewd-by for the dt node
- Link to v4: https://lore.kernel.org/all/20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com/

changes in v4:
- picked up acked-by for the dt-binding
- added dt node for imem on glymur
- rebased the commits
- link to v3: https://lore.kernel.org/all/20260129071435.2624252-1-ananthu.cv@oss.qualcomm.com/

changes in v3:
- moved dt-binding to sram.yaml for mmio-sram fallback
- link to v2: https://lore.kernel.org/all/20260123101501.2836551-2-ananthu.cv@oss.qualcomm.com/

changes in v2:
- alphabetically sorted the placement of glymur in the list
- link to v1: https://lore.kernel.org/all/20260122093319.2124906-1-ananthu.cv@oss.qualcomm.com/

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
Ananthu C V (2):
      dt-bindings: sram: document glymur as compatible
      arch: arm64: boot: dts: qcom: add IMEM and PIL regions for glymur

 Documentation/devicetree/bindings/sram/sram.yaml |  1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi             | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
---
base-commit: 4c406406070d57dbefeaad149181785330c23f92
change-id: 20260424-glymur-imem-970c1015e89b

Best regards,
--  
Ananthu C V <ananthu.cv@oss.qualcomm.com>


