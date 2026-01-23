Return-Path: <linux-arm-msm+bounces-90351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJ+eFcB5c2kfwAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 14:38:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCCD765C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 14:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2307F30304A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 13:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC654329E74;
	Fri, 23 Jan 2026 13:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7bI1iKq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E60XTxzZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE44E325715
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 13:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769175454; cv=none; b=nrFvzP4xi/GFpY+k/JpF9K9wyhaoVDk2luzzIrZ+R7kjaLxXVXarNwzFuEPgNf6x33L1A8uIkKoaZF6hh0MD8g9F9spUeHw28QNNvk7Z7BW8A6MwykgRnll1eYbd08iiwNhy5QYEMhay6uyhyg8SIUfF3Mi09CbUGF+7B0myt7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769175454; c=relaxed/simple;
	bh=yhcGLCigZE7f/4FUvh0izts2qOHT0DNNuVEZ2zLmxww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j9FJGqfR1OeYqd2SwapBiu7cyN7iIzKwes4AQz3ckfRHRtG6+8jNlpfe3S0yGgYcR80To8ltdrMkxY18knu/ghJ1Ky8N+e0NzDJ14RDWVadLdCGOw7ltc10smbExXmi/I8hHi9gkurJjm7nOEg4NVJDFMphYRt7ohUlBJ0uWqno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7bI1iKq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E60XTxzZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NAa5gW3126249
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 13:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xtzCy9Hs9UwVWYmbHE6oZqpNLD3DxD/3o2mH0a/n8YI=; b=U7bI1iKqcD3AuSLd
	vbYlXwbdoysXsqqf/CUfdiZrDVUHmPqBicZBU0shN1f9N+UalqEvFuU9sSMrjQnv
	R10f9PWHF9CLxcuzZBzggMChc7vTDWXNfTDoVCyK5GdHTENMr5iZqOzHbF4Pc8fc
	Vn7zA0TmP9vq1xpueyzPgqPi/uxHa9dJ7H6wFhENs/bZXmYeUZidokulKupWH57J
	L2H0STZJrOi+ccfgxjZfkaUjVfjAESRKv4jnyuuoWSJpvsCInnd7+l0xvZq0eziz
	jYPuZ6rJuhlqnmhkGTzuAjTk3qDuXFHh75Yi/22/uRgNJWgTOZs4LsFfvhOF6jQv
	kThUIA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buthdubbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 13:37:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52dcf85b2so768920585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 05:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769175451; x=1769780251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtzCy9Hs9UwVWYmbHE6oZqpNLD3DxD/3o2mH0a/n8YI=;
        b=E60XTxzZQd/CGALx4dODaZxm2JH9JJgY6F5mdkHs0USvCanEEiYCYLPQ/q6TZQiERz
         Rd0V/5Bl9HuR9nHbvvHqVM7wY/H2KkcR/cnIAOZosNQWH15Pbf+VWXDJgmnSBpMqFXde
         K8ewj8jQ69SRSKmfj47yOa2XqWrFIyAzIChtRdmJvpOPrA3n3GYCTq1P2SSs22syVqxj
         LgftgOc2hbNTjy/PhCEO1jhKqzHagT64qnUP9nuxb2UUD8tBguvq2H9aBNT4SlTx2tXg
         ipXaS0HSmxvdGzsdaLgkyyyFhpG+l/ZggPXMO/U7RHNqUAF9ovsAYuOmoyiYvbZaq8Qf
         sgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175451; x=1769780251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xtzCy9Hs9UwVWYmbHE6oZqpNLD3DxD/3o2mH0a/n8YI=;
        b=MszQz6Ied24EZK6SyfkPwyHQdnx47DP77bOiM4Vk++XaKGJBce+xkdoSDuY5ZyfWuL
         vUe9s5uWZQpro2vzMw+OYbSmjOpeLsGzYbz/vvzIMzD+wRMhpww4i79Sc0wwfU7Izvj5
         X765W5LWhQwgsDHsqBWMS846h+Dn/pbuNZMuQFwd566rcZvyRFgmxNJdAo10FZkgBrdn
         9lgWxG8YSGy6zjGYN1p1YMeyPjBEs3P3yM0M84bvZ7oQQXEUIempoTCkdoyVCEBBguTu
         S8Hh+YvW52Yt0wYAtYhajvZnQ2lEvrBZcOKRf3WoT4svVeiMXeWeW8pIKbIyYZ5EH+vV
         /61Q==
X-Gm-Message-State: AOJu0YxIOPBUZZV68vsa69kqA6rByLvAOIVWYLc1aRDm3kwh08LrsOGM
	wV6GF4od0ELvoG6f4cC9sgCH6l9BzUdx7bGv2Er4LKR1aD/6FIUBHvg/TbzzEeWdDk2o6NR9IQ3
	sQrZ0MTLcq38Gh4hjY5YnEyFdVZIa9uCXzyaF5SRWdvJf6tLdJuYy/sSiyd9S6/5q98hn
X-Gm-Gg: AZuq6aJ1lXicyef3lbKo8ruCzDhzHp0WNObm6u03Hpco9HhvqHUtTufcpcSDqaSB5n4
	vAvsLV1mT9DwrQ8yPpIu/kBQACm9UHxrGKvDUa9gE8oaCSlaOov+U6ThhHtnSwpyvR7+Ts5Du0+
	ROoGSiSJLV4OHhkIodLxGSSCZ/2opTzpyBZ0NS9BUkAzrtCYA/bPbGl8tveYcb6j7iaorSP1uoK
	0yXbo+V4CmX8kylKQpPqcRwCgweJVxSZumx+xt9bYaF2w9FNW33SMg4/SoJGRL2vU13uJ+kfWcd
	mPwLC3me2yu8YZD0LNCCuLMeYkftjmzDZV0fq0lJxeRtS3iv9dSgSxGI2hsAgdDXYmqAvKR7u2U
	8unFtOWsxDyPnNxE1Zw==
X-Received: by 2002:a05:620a:1a07:b0:8b2:e402:20b4 with SMTP id af79cd13be357-8c6e2d7b75emr384200285a.10.1769175450450;
        Fri, 23 Jan 2026 05:37:30 -0800 (PST)
X-Received: by 2002:a05:620a:1a07:b0:8b2:e402:20b4 with SMTP id af79cd13be357-8c6e2d7b75emr384196285a.10.1769175449878;
        Fri, 23 Jan 2026 05:37:29 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e7156dsm6649882f8f.20.2026.01.23.05.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 05:37:28 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 15:37:13 +0200
Subject: [PATCH 1/4] dt-bindings: clock: qcom: document the Eliza Global
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-eliza-clocks-v1-1-664f1931f8c7@oss.qualcomm.com>
References: <20260123-eliza-clocks-v1-0-664f1931f8c7@oss.qualcomm.com>
In-Reply-To: <20260123-eliza-clocks-v1-0-664f1931f8c7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10091;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8Cq+c7/uCqx3gFPvsoFWgEP3PyFX9YW9F1yvkMJhT1Q=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpc3mROXdvBpRZ8R9QR5kFv1/UMx/KUY6/oXaof
 TK43q0c/wSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaXN5kQAKCRAbX0TJAJUV
 VkvpD/4+cD+cEfUHg756G1pZAqI1BM9GXEmnm9/S0NAUmaiVPful+gi2r3ti4iFSzrCveFSYNVo
 DT/UhvHd6pwylpwoTxGYx/vCiNTIG1AushBFESV6cngPQcJSopsNwhlFBuUei54/bEbuRQqvpYO
 +bojtku4SZgtjce6ER/mBvMOfzWlQ8Ij/4phLVrX0ODl1CjiuNc85j9om29R56JsQ8lbuzJY+/t
 I5tEbYTr0DJ8IMDtzhYAqXXPUEQDf9pAPGbeQGZpEruot0V4ScQwJFYTiw18w1D+XdT/KPWxBMN
 Rpd6y2S5Jdi680ttwtO9RLMi0AYo5Nvug21OZscgBfO/8uStpCC6K3UxlBETXDj7rNHHENag02s
 coUqJlOTS+e9riWo02BDRPi4Namsp21oMH9Ca2gWfGj6UJcdsDBzCWFvuMqYnZRURktVra5skLu
 nEst/DreEhUV0y2k3cYebi+MBmRI53ks7R6NwMC265FZZmZTmyJe9i8qOV6pL41CI3vcWtHIcl1
 tGogjd2O/hwHEj1mLrxG9mw0Kl+acGMuStQVE3xCvdp1Dyd3IOYNoVty9DKE85/bwwRQ5lVJGSs
 OSL5to8pjrMsud+M69vFYsuUi5kGzBu9svMAcILVNwU3TqIq/jPc1kcgUVRHX+i2WNWNEq4vtrl
 3ALDDRwO7CseaQg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDExMiBTYWx0ZWRfX4CX6ZN7lE2XZ
 qtmlU6OzxxFOPzwj+40yUzue+TCzgNXJFhHfxUvzSTzvDZpmucUS5/2ZUD/wcJENkpOWDHZSf7X
 lxCL9e0L1WJUOAaqcmUV0RKrRkQxpl5QfPFGnbpapJvEhaloFXzynEkiIJvzGFgYJ6fqJGGBIU8
 WFf6RAtJed9kJJG1UNJZdXI3AyhMb6jfK0FMHu4stCzjNlo0eaH/c1o5VyEpBKDiG18brbUHLQ6
 Ae3ZfTeaHdw6dceZET2Eb2zgBmquBZW0o9nBZOhPewfZWsumypC8cwPipfJFgcWGEXUITAMKcVV
 4K7Bv5+yBeQ6OOtxDtWdOTsg5Rj1MXfOn+K+CvyQ0Hr7WiztogtTa+QveVjatO4MDNm1GIJOxXN
 a6JdYX390Z+M/iQPqx646rTlNxzAQImow2H3lfDIBgW8CmlV/TjIVnDRCvqOAsDNI9m1YfLNLr3
 5qn5Vq/0uyXMMGTe4kw==
X-Proofpoint-ORIG-GUID: OmZ3kcxRjiFe96WopcL9qzsXcTmd3lA9
X-Authority-Analysis: v=2.4 cv=XauEDY55 c=1 sm=1 tr=0 ts=6973799c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=QumFvB_LMSHuJXskJCsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: OmZ3kcxRjiFe96WopcL9qzsXcTmd3lA9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230112
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90351-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ECCCD765C3
X-Rspamd-Action: no action

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add bindings documentation for the Global Clock Controller on Qualcomm
Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |   9 +-
 include/dt-bindings/clock/qcom,eliza-gcc.h         | 218 +++++++++++++++++++++
 2 files changed, 225 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
index cf244c155f9a..539a0a804152 100644
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
+      - qcom,milos-gcc
+      - qcom,eliza-gcc
 
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


