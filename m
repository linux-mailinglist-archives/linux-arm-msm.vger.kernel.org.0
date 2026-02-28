Return-Path: <linux-arm-msm+bounces-94587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APuoH7bfomkV7gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 13:29:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0AF1C2F49
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 13:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E70A30C5B51
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 12:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4790143CEF3;
	Sat, 28 Feb 2026 12:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZVgy9CeB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jULV5FHQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C13343D4F3
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 12:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772281756; cv=none; b=sjahWFNyT0OgWUuKXjHhC3fR5r+PIYp13bpDciJXbmo8jas7StOwd3OHcIB8yttXsjbaBeppWY0H6eRci+6l/EjXxVxSqdrP25CVpQNQx5dMbbG3p+lFZ863RWD4lUjAbxzK5eljSvk8bMvF+cXvHfZHW+DF57buyFlt8xsXwAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772281756; c=relaxed/simple;
	bh=x5iNPEjp2xSfvtFN3vU0//rgfEfwzETin/raI4qUzpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cQOmkgR8fJ153YrCdqzduQ/HMYN0xfMPqAWHZ+ENe4Vo9RnA8XV+5twAFnoXt9v2mNlecMlxjvsZZHQnOD9dzuvuUXXxirW8RBemi0h6Mx3cy5IFF9GepU/Qkfu1b8k29ecreQRBsIZ7tCUW+2z6NGoYov5yQEHYjwIqZL6CtvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZVgy9CeB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jULV5FHQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S906wF2088026
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 12:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L3yR5iUqKqIbBW/cVn6LYmd7ztArAmls5m8vnMq/PpM=; b=ZVgy9CeBKeJnd1v6
	HyqTBozzHMAWcXPp07KY5zY2+FMLCKJ5ZycprniiVkHuLq8CtsoNiFcGoCRIQwzT
	Ld7sbHlzPxy2GHdg3SvzOaR8o28ZB7iCFRckkBmHEeSknxol6nGYNmha/IrnUdSj
	bxNQUOY71S8hm2B2QegdkG8X6hFYADy2Cxfzt1jCzrN8cITKkf75bybm0GftNwZO
	qGovjW10lVsDL9Rrzm3Bmk6/P5J/x7POgVaSr+EXBn3MCGxFpdDTaVjAZ/acydok
	VZr6pnykHkCZmdSv4jwyj/lF7ytxxtiJYtRwGKxwmI66wj2AFL3M4icCwq755Aaa
	oGSZcA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgrrw9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 12:29:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae04f5897cso28155075ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 04:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772281753; x=1772886553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L3yR5iUqKqIbBW/cVn6LYmd7ztArAmls5m8vnMq/PpM=;
        b=jULV5FHQb3tcNLPQci0fHSY3vF4Ro+0V+YKL2jFYnZqdM/7k0fstFBtGEhJ6v309KJ
         buAR5ydsjq4HdpOiNSgGmZ8WYpoChKmB7SMphsLJAFLQmMQWRf4irbQpE+hp5GS+WayS
         1yIgfLypY9NxjAnUClOEJC6GS3tEKp2YPb0555NOgEGMF0EKZqVfPJf1KloCN0L64UbU
         WbO6iipNARbdLPZx/yIPDneB8BD9X2Mm2dc5wDJP7J0QcraUGE7m4axVVTVV2HmSZK68
         +IHs22iA7OcTYAdjDItElyZH/GKkzCmzZkO8cx7rmFJHZDPAq4BUvhKCZK1p61f1sPBi
         qUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772281753; x=1772886553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L3yR5iUqKqIbBW/cVn6LYmd7ztArAmls5m8vnMq/PpM=;
        b=OafiCWDwMEGtOEzriH8pebkgnol63TmPibV0W1UMv5Plgted1ipH41h8GX4CrakVk5
         CoSgCjL5QLxYkwAOZsop1Axzl0pdOq0VnK6/CEldN0f2rtDBbBDfgPXNs6KN+2rUcvhR
         WbKyTtxl0981MTU858Y+Vjnkto/ZICLq3QYQPQ/gKdD3IIueQXg4Qls9MW6fr9sWuGvO
         wfY4buGQxWjfcqN37SPSOAE5yiEw5fkuEEmI87DOkomcBaswqGCmy8sO9xmkKMOCRGmv
         CCP7GuHwR99W17+NjbSYllYFEnLYyGhIahM0ElIXPjWYNxOxgTHOsnAjP6wb0gESxYOb
         9WzA==
X-Gm-Message-State: AOJu0YxM8tmp9DTQCSrvh+yAxa1LXXxIi4PFpgNsyQmbVsY7FXIae2R0
	rpv0KdISBFbM8tFhiNlCMZXFomeFuOk6vD9DSlxAw6yruKBpqtSij+45ozUsJA7CKKlvTi8eeY/
	sPdQUcjuAIOsMCwwojQVi/9MiQxJ9FGY3WSkDhvQH/h1lonjf5zIntkZFNL8ukmk2rjpx
X-Gm-Gg: ATEYQzzGptAKderMwWGd76/FhdIA+5GghYgmyiDLoB0Kzj3FoeniuX1InbZ3O0Br3Ax
	ueFiOZbYqXKyiJk0rcEjVLaPCVnyX2rb+Y/fXEVldMy5neKxoi2nsj1AMrsXrkNNkFC3X3ATbm/
	v2Z+0EE5KWiKWdYU1IF3u262lT5nxQEtcydwQ28JUQNHDlslsMjV+xsdq/IW0GeNr0x8aE04Qxa
	Soum8MdytpjjyJOyxVxuj6ZDDs4MbjWH1nRdoD3do9s/+U6HCrMetNwPPjVQH2FwChEZYSlY4DN
	X6yhPDL09kYo2zdXq/FRteFQ0cy79K/k64EEqf21zKfPgvwKPCxf+0Y0Y14FDtWSDs7DnQjUVxF
	LZuz8/EdnWwfAKKSK5tL5vMyecaMYrs2jFeeSngWo4SH5bKxsIKOaL4tFA9BuhccUFU3GetPx/O
	Iu25dMPzQM+5dclFdYx2Ld+1vWCss43jUp7E/mWg+2f+nF5wXRqr1mV9bQ
X-Received: by 2002:a17:902:e78f:b0:2a7:aac1:7201 with SMTP id d9443c01a7336-2adf78db373mr119306395ad.3.1772281752656;
        Sat, 28 Feb 2026 04:29:12 -0800 (PST)
X-Received: by 2002:a17:902:e78f:b0:2a7:aac1:7201 with SMTP id d9443c01a7336-2adf78db373mr119306175ad.3.1772281752148;
        Sat, 28 Feb 2026 04:29:12 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4e10csm8130048b3a.1.2026.02.28.04.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 04:29:11 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 17:59:00 +0530
Subject: [PATCH v9 1/5] dt-bindings: sram: describe the IPQ5424 IMEM as
 mmio-sram
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260228-wdt_reset_reason-v9-1-f96d7a4825d3@oss.qualcomm.com>
References: <20260228-wdt_reset_reason-v9-0-f96d7a4825d3@oss.qualcomm.com>
In-Reply-To: <20260228-wdt_reset_reason-v9-0-f96d7a4825d3@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772281742; l=1988;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=x5iNPEjp2xSfvtFN3vU0//rgfEfwzETin/raI4qUzpg=;
 b=yaSkId9fnYE1LOoA8ymQ04aHBKxbJ6oTTxr6lO0f1Q7czUyE4NXEinMUi77Lrhlcnv3aaEqG7
 4zAP8FGUAAsBdyDYKAM0TQ84x0+HT4KjhF/8eb0hNSRRe0yXUpr8OQ7
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDExNSBTYWx0ZWRfX5UDVPOo2z1a+
 beB10333so36d7aoQfaj3InVvBC02Oe+OaSPs7eJrP7GP6S11eiLW5lP+MlpyV/jFQbrrIrdcqO
 v5QkLr7XkaYlPGn8hwT3lipjJVY0HK/x5kTLp378v0d8GqxergGaI+ggHcDoGmIcTOQ+EusmXhg
 6U0FjVpOMwP3jSx0FM6vFic9I/rVlFqiEQ07ZwFXbMD6NfZLQ94impsD506Ysxe1WuB/0TW/89o
 NzthW6GT5DnIP6re85l2nGhbzk/RdU4R5Dvm3Ns0OWpNilJG+i3BMFKWKUWfZ6tEarmbHQWpIzJ
 qpnvb4Vylk/G2L718j/rVVotBgVtvXWIPvP6kroC0uj9jHdtaD10WEOE7mmJCc8zNLgyVGuhWtU
 PVYdeZ3946210yXzONanM0D6UPCcmAielK8DIlQQJGElXVhhkVZE3T3YGZpCxw0Tq3Q9Dxr70Zm
 qHpNTy5FRCVvHfZ8dkQ==
X-Proofpoint-GUID: ZwI8GQZUacWqHqz9NHkt9ijUHYVUzCig
X-Proofpoint-ORIG-GUID: ZwI8GQZUacWqHqz9NHkt9ijUHYVUzCig
X-Authority-Analysis: v=2.4 cv=Zqzg6t7G c=1 sm=1 tr=0 ts=69a2df99 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=e_-3XkEp85WdVaS5J-sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280115
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94587-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC0AF1C2F49
X-Rspamd-Action: no action

IMEM shouldn’t be treated as a syscon or simple-mfd because it’s really
just on‑chip SRAM, not a block of control registers or a device with
multiple hardware functions.

Describing it as generic mmio‑sram keeps the model simple and closer to
what the hardware actually is.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v9:
	* Picked up R-b tag
Changes in v8:
	* Updated the commit with the reasoning to move to mmio-sram
Changes in v7:
	* Added the reference link
Changes in v6:
	* New patch
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 -
 Documentation/devicetree/bindings/sram/sram.yaml      | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 6a627c57ae2fecdbb81cae710f6fb5e48156b1f5..72d35e30c439ccf4901d937f838fe7c7a81f33b1 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -18,7 +18,6 @@ properties:
     items:
       - enum:
           - qcom,apq8064-imem
-          - qcom,ipq5424-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem
diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index c451140962c86f4e8f98437a2830cb2c6a697e63..7bd24305a8c7d98dc6efad81e72dc8d86d8b212b 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -34,6 +34,7 @@ properties:
         - nvidia,tegra186-sysram
         - nvidia,tegra194-sysram
         - nvidia,tegra234-sysram
+        - qcom,ipq5424-imem
         - qcom,kaanapali-imem
         - qcom,rpm-msg-ram
         - rockchip,rk3288-pmu-sram

-- 
2.34.1


