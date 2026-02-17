Return-Path: <linux-arm-msm+bounces-93064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IfjI2QelGk1AAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:53:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0041495E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F3303013A42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E522DA74C;
	Tue, 17 Feb 2026 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFfxX7aj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AjzOvw4T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B6D2DA759
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314761; cv=none; b=ZlOUIZUjsbMez/14L6a+iMjT9ev4Wf311WLEgy7B5wwzmBFsiqCaF3zQXL+rSOnm8g2BXe62PNcYVs9/HvK7tbJumkp6iusEz5M1cjfy1bwZzNyziSYE+ri3T3VnSRWxpTiusOpHH/fiocPtngEWj459twcHShxRrZKAP3RbWzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314761; c=relaxed/simple;
	bh=QVTybmkdt7ET3baJ/2CwGUw6pY0Jc7HwG1B/0cUaPQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X/ABw1dfrtAmDD22jnP/c5ZeLMXyWobjXXEmXutLQtAX44Hnz3nNmsUZ1eNE/qTxUb2YfRg7wYbzkq32CdQLjFfQsml06ZklXNSmjIMfisxXTPasR1TB3y6qURPjl94550/w475HS3kuvdfC7vtoFl7jef1UdDPuXaeRQZNNTJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mFfxX7aj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AjzOvw4T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GIGxRO2804570
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v2Wg2VwBlodi0lED0h/KpQ0d9RtRO+Iy3lC8si0JyDc=; b=mFfxX7ajYL7sq/Uv
	HNIzADUV5wK11ET5MQhLYMkEJGvNxhXo8xbKisYoOQXRQferoEkfucvIHzGn+j47
	s8opl6/lXURIuxFXZJpolXLV9tsG5Ijrc9A4IwaY3Npl31eHWEvL138Xr27L7XzQ
	JuEB5zkhMg7ToQJse0FvOUAsIRjtwQefDiYa7s9oDdtrMJsKqkLQnYj2mr4ktL/v
	mN/tfSoqnDThZlqeJ+Of/EEGsqYHWjmfJbZ9F2cRV7upD7VGsrx66V2SDYePgz8F
	rRZgejw+cXV9o4J+D9ntdGYf7ANP5lP/MtBemEaj6gjod+UUtIQCtJE7sT6Z1P8m
	5CFW6A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxujmyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:52:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb42f56c4aso2641849285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 23:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771314758; x=1771919558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v2Wg2VwBlodi0lED0h/KpQ0d9RtRO+Iy3lC8si0JyDc=;
        b=AjzOvw4T1Lqr6PQ0I98xsVUEhqHod5TPSGwHIgySw+yZSEIDCINM5mXtRMqJUmER7R
         h/HZvqRNV3/HKu3eX5KSNf4VPgNTjCSkOqLli4OY8zLFW5RhvARlCgbHVAuerPpGzvyi
         YIb9fF+KSNuJ4fe9r8SVhD4BIpyeUNLZRjo+Tshul9XxAjg+FJsJL/EE62AYXz9fEIxh
         VwOnRhmpGKhxvItUOG7+h+ljtvUA1DV91xT4AqumVaSJe47d790nHxSmb7sFy+hjBeSI
         mmCaHc/qtyt+8j/i+euEnqJQaExAQsuiL6rb3wUbwHXIpszPaHLHIlecQiRBFFmKZaoe
         eYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771314758; x=1771919558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v2Wg2VwBlodi0lED0h/KpQ0d9RtRO+Iy3lC8si0JyDc=;
        b=k7LXAKaoqN7ZnETIKmMFhn/HJU63rPRsTARJL63uw5BB/PvgK5Ayn9V/X1thl5E9tM
         KQgTj39SP2lVx0TYa63Ky8n4hEmhXMEcLJtoJQCLmrea50uN9zWuq6qCAIb8IJcoeJDd
         vX81urkIRBnfawJJB/davz8gewpvbTCXkipKgBiNuOjvPTDHOWiO+abni7TOas8KHAod
         Zzc9yWQIKFJCI2P7yuX5Y0F1/s2fg7REH/1e4/4OpYGOQPUNmaCMporV9UjadMuzNhZu
         EzCplopSd42ygjDa/omOzxrc+JyaKbR1S9kxZZr/499hg43hw+qyBIKTg0o3xvYOkUK/
         WIcw==
X-Gm-Message-State: AOJu0YyXKkIYjW+i+AW06rVkvPMakTJiD5rzjcSqF1YfQNoKflnJxIhf
	9WLyTPH5lYokbq2EDqK9K4Xqc82x2U15wb/KLP68AjRfez/uxscZN62dzrS7vgUrRdcfoBYzATO
	+6AdQsuRmq4nqarvCOgbX23BEtdqidEajUei9oA+BWg8qdVxwEeAqwVlJSM1FzTlTPn7rh3R1xc
	zB
X-Gm-Gg: AZuq6aIu8w6Pf/FnttIDyOJlsn7j8Ysvvr0Ihnic4HFVsN2CUaRSCxbAIrOcnFb//+L
	8EHE7P8+aSsOFGbqE2yqIkWFLZCW0JIP6PFQS78EckxaNBNPNeaoVaE+L3xEQjJ0uw5oNkIn/Ot
	MvQiSNhR272dIj5473dew37MmBUlfVjVP/o/rkaa5J+Tdv12yvoenSheNDs8QYXGG35UV2SfXcq
	+UH3djfPJ/1iiXUKiGPof4Z3Lmuj+dcdHTlzc+f4KSMFaoMOIcEz/65GMS6Vqn3rmpoGFOmk7a6
	mC0KbO5+Io/w3oz0BlUq+vFSkR/rIQZnLbN38lWK8dq8BLH6PdZ5i07WuZPI9Ep2GJjtjR0TQ/E
	i0H7z+NQr7GJ4lRFt0kpUlk6jrKElKQ==
X-Received: by 2002:a05:620a:3187:b0:8c7:995:b961 with SMTP id af79cd13be357-8cb4243d406mr1427106085a.58.1771314758095;
        Mon, 16 Feb 2026 23:52:38 -0800 (PST)
X-Received: by 2002:a05:620a:3187:b0:8c7:995:b961 with SMTP id af79cd13be357-8cb4243d406mr1427103585a.58.1771314757574;
        Mon, 16 Feb 2026 23:52:37 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac9d77sm29860229f8f.33.2026.02.16.23.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:52:36 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 09:52:21 +0200
Subject: [PATCH v4 1/6] dt-bindings: clock: qcom: document the Eliza Global
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-eliza-clocks-v4-1-5d09f28d4251@oss.qualcomm.com>
References: <20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com>
In-Reply-To: <20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=10237;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=vxOdVgdl1Oawmc9RM/XHsJZ9J2wuLHt6IlyUoblJpYQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBplB46wKagruv56/F+eVwd2xlkKFHujTmwEi7Ey
 pVZ3b18MVCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZQeOgAKCRAbX0TJAJUV
 VvScEACC8jnNnyU3E+A1piWuKBF8ERFYcLm+yXPpYC1NEFGHXjgz4cxBvc6indDnIe3ZE+z3EDp
 i+ZanWO9EGe6bN8vJSmqT2CAGFHw2llEaaHqxEbY4upryT2f6bQRk1LBGTNU9AFW0T1A6Y9YVaM
 YKfhB936fjyFYk3DeQJiJ1/4tyLVkLwPu7JDa8Nb/BJL6YSdXkhDGjFFJy7cTdpDkeuy1I/Bwot
 cdTZlxpRS3BiCuvAsLYCyoiByTgi25FOGgTFRoIMq74vgoMlHg0ZGPIpkiXvx2NAZ6DZ6cYLY6p
 yAr4FjCgf1txcvolM/eVueZMTFjGKl+1TS8Tgwg3lDuK0QUXPIySviGbxD1D9PA+A9irIkOVMGq
 yswabamLJdQOIxjS8isr2TnDnQiEQqMC74aErvKL+V9GgrX1c1n0se/DlxIbeeBXCdZ1bq3KZAM
 lKHAPoGrws1Eb3Ml6JnjSbGty/UhjfnPWJk107/qevYnkXkrwCGFuQoTsGtrDQ5NdPk8hWNU174
 kTTMokHeupalerOgUQxwDABkcHDaLMsFnNSfUw4ATl8uRuyj5Exeeg02eBbv55F2Nni4Mu/In7B
 QWg9XlQIoPzlY31c/KNuXWKzLZIhBNaPAuFnhsIxmgzFqEDYang8jSCtVE27i0rMKgIkmlS2AXE
 5yHB2lRTczpJq2Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: C3mDkzXMUK0S_WsDPq1zYvTIIfeCzn4z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2NCBTYWx0ZWRfX5ln/cXnDEljn
 or/QpbyLrg9AvnpZkuj3EG3lkoeEdWMVhxXrDJXfSTysTsfpQK357k7xRHLMUwhCgBJR323GLdt
 X6UIlnaXkopmdgjz3QTaLaGtYEcaF20em2KVQ22kAyrjX3f9zDd3mk4/LH6kqT12WjyXcuqpxpL
 dz05YoH4S4zLQCb9kO8kIZJ27iKiWMsC8Zh2U+hYhXsg4TKOp+p1LhmP1V91L+nFPYTVA2lzMQ3
 en+aIIYtE58ZjzO7er/J6CTZgnpMz7wnaSY+nFJLmyi3puarQ9tG7yBaeE4IvV/tH3ctVgeQwtD
 MLjKZ1/gc9bQ20CHoNenusWxhQFDgglRJ7zUDzq7+ZxZbvCl3MgDCRVbKMaVmAa+rydi4eCnmiZ
 XMg9NCOy/NTrS4LpONM4mh5BTcj7+xJ1J7m0e4zBgDKI/MSXUwHGuAd6rl3DzDM9am0vy5EsbPg
 4q+SQ5SO6LDV2FcPyeQ==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69941e47 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=QqclT2NS3jCD4ft7SfEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: C3mDkzXMUK0S_WsDPq1zYvTIIfeCzn4z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93064-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,fairphone.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0F0041495E2
X-Rspamd-Action: no action

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add bindings documentation for the Global Clock Controller on Qualcomm
Eliza SoC. Reuse the Milos bindings schema since the controller resources
are exactly the same, even though the controllers are incompatible between
them.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |   9 +-
 include/dt-bindings/clock/qcom,eliza-gcc.h         | 218 +++++++++++++++++++++
 2 files changed, 225 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
index cf244c155f9a..60f1c8ca2c13 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Global Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-gcc.h
+  See also:
+   - include/dt-bindings/clock/qcom,eliza-gcc.h
+   - include/dt-bindings/clock/qcom,milos-gcc.h
 
 properties:
   compatible:
-    const: qcom,milos-gcc
+    enum:
+      - qcom,eliza-gcc
+      - qcom,milos-gcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,eliza-gcc.h b/include/dt-bindings/clock/qcom,eliza-gcc.h
new file mode 100644
index 000000000000..3e0ff3fb69f6
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gcc.h
@@ -0,0 +1,218 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_ELIZA_H
+
+/* GCC clocks */
+#define GCC_AGGRE_NOC_PCIE_AXI_CLK				0
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				1
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				2
+#define GCC_BOOT_ROM_AHB_CLK					3
+#define GCC_CAM_BIST_MCLK_AHB_CLK				4
+#define GCC_CAMERA_AHB_CLK					5
+#define GCC_CAMERA_HF_AXI_CLK					6
+#define GCC_CAMERA_SF_AXI_CLK					7
+#define GCC_CAMERA_XO_CLK					8
+#define GCC_CFG_NOC_PCIE_ANOC_AHB_CLK				9
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				10
+#define GCC_CNOC_PCIE_SF_AXI_CLK				11
+#define GCC_DDRSS_GPU_AXI_CLK					12
+#define GCC_DDRSS_PCIE_SF_QTB_CLK				13
+#define GCC_DISP_AHB_CLK					14
+#define GCC_DISP_HF_AXI_CLK					15
+#define GCC_GP1_CLK						16
+#define GCC_GP1_CLK_SRC						17
+#define GCC_GP2_CLK						18
+#define GCC_GP2_CLK_SRC						19
+#define GCC_GP3_CLK						20
+#define GCC_GP3_CLK_SRC						21
+#define GCC_GPLL0						22
+#define GCC_GPLL0_OUT_EVEN					23
+#define GCC_GPLL4						24
+#define GCC_GPLL7						25
+#define GCC_GPLL8						26
+#define GCC_GPLL9						27
+#define GCC_GPU_CFG_AHB_CLK					28
+#define GCC_GPU_GEMNOC_GFX_CLK					29
+#define GCC_GPU_GPLL0_CPH_CLK_SRC				30
+#define GCC_GPU_GPLL0_DIV_CPH_CLK_SRC				31
+#define GCC_GPU_SMMU_VOTE_CLK					32
+#define GCC_MMU_TCU_VOTE_CLK					33
+#define GCC_PCIE_0_AUX_CLK					34
+#define GCC_PCIE_0_AUX_CLK_SRC					35
+#define GCC_PCIE_0_CFG_AHB_CLK					36
+#define GCC_PCIE_0_MSTR_AXI_CLK					37
+#define GCC_PCIE_0_PHY_RCHNG_CLK				38
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC				39
+#define GCC_PCIE_0_PIPE_CLK					40
+#define GCC_PCIE_0_PIPE_CLK_SRC					41
+#define GCC_PCIE_0_PIPE_DIV2_CLK				42
+#define GCC_PCIE_0_PIPE_DIV2_CLK_SRC				43
+#define GCC_PCIE_0_SLV_AXI_CLK					44
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				45
+#define GCC_PCIE_1_AUX_CLK					46
+#define GCC_PCIE_1_AUX_CLK_SRC					47
+#define GCC_PCIE_1_CFG_AHB_CLK					48
+#define GCC_PCIE_1_MSTR_AXI_CLK					49
+#define GCC_PCIE_1_PHY_RCHNG_CLK				50
+#define GCC_PCIE_1_PHY_RCHNG_CLK_SRC				51
+#define GCC_PCIE_1_PIPE_CLK					52
+#define GCC_PCIE_1_PIPE_CLK_SRC					53
+#define GCC_PCIE_1_PIPE_DIV2_CLK				54
+#define GCC_PCIE_1_PIPE_DIV2_CLK_SRC				55
+#define GCC_PCIE_1_SLV_AXI_CLK					56
+#define GCC_PCIE_1_SLV_Q2A_AXI_CLK				57
+#define GCC_PCIE_RSCC_CFG_AHB_CLK				58
+#define GCC_PCIE_RSCC_XO_CLK					59
+#define GCC_PDM2_CLK						60
+#define GCC_PDM2_CLK_SRC					61
+#define GCC_PDM_AHB_CLK						62
+#define GCC_PDM_XO4_CLK						63
+#define GCC_QMIP_CAMERA_CMD_AHB_CLK				64
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				65
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				66
+#define GCC_QMIP_GPU_AHB_CLK					67
+#define GCC_QMIP_PCIE_AHB_CLK					68
+#define GCC_QMIP_VIDEO_V_CPU_AHB_CLK				69
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				70
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				71
+#define GCC_QUPV3_WRAP1_CORE_CLK				72
+#define GCC_QUPV3_WRAP1_QSPI_REF_CLK				73
+#define GCC_QUPV3_WRAP1_QSPI_REF_CLK_SRC			74
+#define GCC_QUPV3_WRAP1_S0_CLK					75
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				76
+#define GCC_QUPV3_WRAP1_S1_CLK					77
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				78
+#define GCC_QUPV3_WRAP1_S2_CLK					79
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				80
+#define GCC_QUPV3_WRAP1_S3_CLK					81
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				82
+#define GCC_QUPV3_WRAP1_S4_CLK					83
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				84
+#define GCC_QUPV3_WRAP1_S5_CLK					85
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				86
+#define GCC_QUPV3_WRAP1_S6_CLK					87
+#define GCC_QUPV3_WRAP1_S6_CLK_SRC				88
+#define GCC_QUPV3_WRAP1_S7_CLK					89
+#define GCC_QUPV3_WRAP1_S7_CLK_SRC				90
+#define GCC_QUPV3_WRAP2_CORE_2X_CLK				91
+#define GCC_QUPV3_WRAP2_CORE_CLK				92
+#define GCC_QUPV3_WRAP2_S0_CLK					93
+#define GCC_QUPV3_WRAP2_S0_CLK_SRC				94
+#define GCC_QUPV3_WRAP2_S1_CLK					95
+#define GCC_QUPV3_WRAP2_S1_CLK_SRC				96
+#define GCC_QUPV3_WRAP2_S2_CLK					97
+#define GCC_QUPV3_WRAP2_S2_CLK_SRC				98
+#define GCC_QUPV3_WRAP2_S3_CLK					99
+#define GCC_QUPV3_WRAP2_S3_CLK_SRC				100
+#define GCC_QUPV3_WRAP2_S4_CLK					101
+#define GCC_QUPV3_WRAP2_S4_CLK_SRC				102
+#define GCC_QUPV3_WRAP2_S5_CLK					103
+#define GCC_QUPV3_WRAP2_S5_CLK_SRC				104
+#define GCC_QUPV3_WRAP2_S6_CLK					105
+#define GCC_QUPV3_WRAP2_S6_CLK_SRC				106
+#define GCC_QUPV3_WRAP2_S7_CLK					107
+#define GCC_QUPV3_WRAP2_S7_CLK_SRC				108
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				109
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				110
+#define GCC_QUPV3_WRAP_2_M_AHB_CLK				111
+#define GCC_QUPV3_WRAP_2_S_AHB_CLK				112
+#define GCC_SDCC1_AHB_CLK					113
+#define GCC_SDCC1_APPS_CLK					114
+#define GCC_SDCC1_APPS_CLK_SRC					115
+#define GCC_SDCC1_ICE_CORE_CLK					116
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				117
+#define GCC_SDCC2_AHB_CLK					118
+#define GCC_SDCC2_APPS_CLK					119
+#define GCC_SDCC2_APPS_CLK_SRC					120
+#define GCC_UFS_PHY_AHB_CLK					121
+#define GCC_UFS_PHY_AXI_CLK					122
+#define GCC_UFS_PHY_AXI_CLK_SRC					123
+#define GCC_UFS_PHY_ICE_CORE_CLK				124
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				125
+#define GCC_UFS_PHY_PHY_AUX_CLK					126
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				127
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				128
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC				129
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				130
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC				131
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				132
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC				133
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				134
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				135
+#define GCC_USB30_PRIM_ATB_CLK					136
+#define GCC_USB30_PRIM_MASTER_CLK				137
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				138
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				139
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			140
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		141
+#define GCC_USB30_PRIM_SLEEP_CLK				142
+#define GCC_USB3_PRIM_PHY_AUX_CLK				143
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				144
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				145
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				146
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				147
+#define GCC_VIDEO_AHB_CLK					148
+#define GCC_VIDEO_AXI0_CLK					149
+#define GCC_VIDEO_AXI1_CLK					150
+#define GCC_VIDEO_XO_CLK					151
+
+/* GCC power domains */
+#define GCC_PCIE_0_GDSC						0
+#define GCC_PCIE_0_PHY_GDSC					1
+#define GCC_PCIE_1_GDSC						2
+#define GCC_PCIE_1_PHY_GDSC					3
+#define GCC_UFS_MEM_PHY_GDSC					4
+#define GCC_UFS_PHY_GDSC					5
+#define GCC_USB30_PRIM_GDSC					6
+#define GCC_USB3_PHY_GDSC					7
+
+/* GCC resets */
+#define GCC_CAMERA_BCR						0
+#define GCC_DISPLAY_BCR						1
+#define GCC_GPU_BCR						2
+#define GCC_PCIE_0_BCR						3
+#define GCC_PCIE_0_LINK_DOWN_BCR				4
+#define GCC_PCIE_0_NOCSR_COM_PHY_BCR				5
+#define GCC_PCIE_0_PHY_BCR					6
+#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR			7
+#define GCC_PCIE_1_BCR						8
+#define GCC_PCIE_1_LINK_DOWN_BCR				9
+#define GCC_PCIE_1_NOCSR_COM_PHY_BCR				10
+#define GCC_PCIE_1_PHY_BCR					11
+#define GCC_PCIE_1_PHY_NOCSR_COM_PHY_BCR			12
+#define GCC_PCIE_PHY_BCR					13
+#define GCC_PCIE_PHY_CFG_AHB_BCR				14
+#define GCC_PCIE_PHY_COM_BCR					15
+#define GCC_PCIE_RSCC_BCR					16
+#define GCC_PDM_BCR						17
+#define GCC_QUPV3_WRAPPER_1_BCR					18
+#define GCC_QUPV3_WRAPPER_2_BCR					19
+#define GCC_QUSB2PHY_PRIM_BCR					20
+#define GCC_QUSB2PHY_SEC_BCR					21
+#define GCC_SDCC1_BCR						22
+#define GCC_SDCC2_BCR						23
+#define GCC_UFS_PHY_BCR						24
+#define GCC_USB30_PRIM_BCR					25
+#define GCC_USB3_DP_PHY_PRIM_BCR				26
+#define GCC_USB3_DP_PHY_SEC_BCR					27
+#define GCC_USB3_PHY_PRIM_BCR					28
+#define GCC_USB3_PHY_SEC_BCR					29
+#define GCC_USB3PHY_PHY_PRIM_BCR				30
+#define GCC_USB3PHY_PHY_SEC_BCR					31
+#define GCC_VIDEO_AXI0_CLK_ARES					32
+#define GCC_VIDEO_AXI1_CLK_ARES					33
+#define GCC_VIDEO_BCR						34
+#define GCC_CAMERA_HF_AXI_SLP_STG_ARES				37
+#define GCC_CAMERA_SF_AXI_SLP_STG_ARES				38
+#define GCC_CAMERA_HF_AXI_SEL_SLP_STG_ARES			39
+#define GCC_CAMERA_SF_AXI_SEL_SLP_STG_ARES			40
+#define GCC_CAMERA_HF_CLK_EN_SLP_STG				41
+#define GCC_CAMERA_SF_CLK_EN_SLP_STG				42
+#define GCC_CAMERA_HF_CLK_EN_SEL_SLP_STG			43
+#define GCC_CAMERA_SF_CLK_EN_SEL_SLP_STG			44
+
+#endif

-- 
2.48.1


