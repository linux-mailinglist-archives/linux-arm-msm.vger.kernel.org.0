Return-Path: <linux-arm-msm+bounces-106954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN+LNBzsAWpHmQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:47:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EB12C51086B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C406300D4CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A5E3FE640;
	Mon, 11 May 2026 14:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b520J/ms";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cHsZ8EYU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D753FE34B
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 14:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510437; cv=none; b=g6Cq0TPNleSQZF8+6w0pg58xFsp/AyQTunCBBewVFAQ99Q25LJHF4qI4yfCzz3kyTjShA/afeJL6NXfkfkrLIGrvbD9o1W+PxMIrDerKGS8ZpuGXoyTA/bcR59byWMS4xq+mCDAZb1BYckgR09jW9sNdouGhU7MdPY2DxcgVfIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510437; c=relaxed/simple;
	bh=JFB7JC2tVqIvLepWGTYj7+r8PPtD5vD/Hp89OUL7d8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j+sme0ciYAmn9XqKPwKqOe5YwnxDoq6h9uOZy//zmPSWtjUY9UvUVijtlHXwlGH0BCtsTDc+Us9LcMe3EvF0Q+YLoSP7b9xLw2zXHoSrXiYttS5XGF+Z2PN9x9zPkB7QyedgxZiD+bKVoTVXW59gObElfvYgw0xZUjS5CtyiY4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b520J/ms; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cHsZ8EYU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BD29Qh3332700
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 14:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CKH4pqHO7nbXG8yzTHWH0x
	Bt1rF/NDK+c6CZIGwQrUw=; b=b520J/msy5qlRglrR8tKuJZ3BkOhRkysrDU5of
	YGFVtPKWYR2VfE7DIEMwqWKxiUwa4ygvESuPEXb/Q45ou/zYR/s/DuaH+pp994oi
	sX47APYor2ynffTcgWN+O/60CoyT5i4Uq/Ai3mqb8BgokgZQK5Bp07wqIGeWv/3v
	Peu01wmcEVHuNu1tyuDg39c2RCUH0sf5z1JRJfrHlU+zQ0GB87U0eU3gzJBcaqKm
	kyBA/p2YfKCYSiih/hmrw83YHDszh6QiCNTfnD6tlzwUmUKZWUrIB3+HQIdOKPCV
	OSTa7JyJDzSQhnqVbj7fNgH6yzMqxsvSj6MAbCh6R/oX7jUQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ajgsmru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 14:40:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba603a7d2cso48061315ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 07:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778510434; x=1779115234; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CKH4pqHO7nbXG8yzTHWH0xBt1rF/NDK+c6CZIGwQrUw=;
        b=cHsZ8EYUsPu2rXAaHoFDDmBECaXv1V+n9M3SXQfzO5HNSP3G6PKsRarvE/FdGufcY+
         U2U3W4lhrKOZSiuwbEgZydFsrJ1I8GB15aPfVPwkAN+m2gmk8iygKr4b/IpfY0eGvCbW
         OqojgU7ISU4zY5oK0kF5O5hm1g2t9pxS6WvDqMC5nODuOX3G9aJP16WVW2ttDX7k53BH
         FXWIWdT3GKz7AxYQgJTifTQXTR/tCdXC7c2Apzzq3z0qldo13FODr3byaMEY8JQyPTD5
         A088Vo87xAat90MyTw9+Un40/YVPYLc2rHVXUYIeqaBO3FuyearDYs4I8MvN4GCuf2Ky
         0Hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510434; x=1779115234;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKH4pqHO7nbXG8yzTHWH0xBt1rF/NDK+c6CZIGwQrUw=;
        b=n8IOWL/ZscCJc+ubmh9C2wp6vlrZ0oH2qkzk8Aclkezvkb8buLKGlwPMaN5Spl0bOH
         HTFiZOHNq+toXbYJTvCKdYzV5/290Je1PtAqqqGa2dNwNMuLw5uH08nWZgiMJS+mE/vw
         EZBOxJHENIB8nwfxUtGJEOnEGFjLdqbAJV90hvgJ5yyAVfgD5hKLmIXA99mKHyCaXB0k
         Z0xeevHpnCb1Jh+Sde3TEm4ADuV5Q9lk4HUff1/QFk/kGfB2HdeU9yGY5AYZO83KdIhJ
         Ep/c/dm7iGzB+1YhBq3a3/XS3lLnjirBNWqvPoiEo6gFLO2Q6kC7bf2GFmeCsdwn8imP
         SNvw==
X-Gm-Message-State: AOJu0YwiuRLhwOBpXGDE5rvy+a9xJL1adLNdY9BHdFIpbgjJ+fqqfjLk
	FqQqif2c9j3maNNxEwB4my3z4HBmeeRxQ+EFWrtDYdNYEkesD5B99NVrPYpcbHCK5VCouwQGRmx
	PdhVKz/smabqNboWWfc4esvUCbx8KHGhPUk2S0uiTsWtBvj64WLz3Jq7WZgtpsou2A5mDdU0Dmp
	DN
X-Gm-Gg: Acq92OH9U7oFomYjILHbTTmyyZRqKCBuqiME+ooxVlRdXmJMlC8muGdLeDacOKdNoo2
	Kyti6JJIoyuxR+LxQ2uV6T1wwiWhDifBG8MtEafnRIrIq1pA6iCD1ts06fy0X/IwEgWI5QHGRNw
	foAQ1Mb7oqdWq+RKdCx2PKv49yez0qGaK7e6jx84rA6Zd/4tk8SwJRxL4ND22jNPwgln4TTAPUL
	NbvGSvk6qP/MQ0sPKpWKsRWCrXnrHQu15W4e9GbCkrTSK0bU+DinAiNzn8iVoNN6krfJ0ovmLTf
	bQtHyMIqS5MQxr60Vy/8FOo99k69aw00r4VIFZF1JoHxploLdpkv0FFtvIHdmUjq6TQhmbiByK9
	LU+tnSx1lsI3a7qdM8dDpNJJp8bmUSVQR7IUNVHNXWGifnRcnvK24ZBNw9iRHtFX07Oq7CxmXOD
	qLSARprpvU2CWVaIjpw2q8NXL/jX5FbDOm74hbNPZQCvraVrv5Gx3H8D2d
X-Received: by 2002:a17:902:8492:b0:2b4:68c9:302a with SMTP id d9443c01a7336-2babd4a48dcmr116656215ad.17.1778510433704;
        Mon, 11 May 2026 07:40:33 -0700 (PDT)
X-Received: by 2002:a17:902:8492:b0:2b4:68c9:302a with SMTP id d9443c01a7336-2babd4a48dcmr116655865ad.17.1778510433189;
        Mon, 11 May 2026 07:40:33 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35eb3sm107928495ad.41.2026.05.11.07.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:40:32 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 11 May 2026 20:10:23 +0530
Subject: [PATCH v2] dt-bindings: watchdog: qcom-wdt: Document IPQ9650
 watchdog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-ipq9650_wdt_binding-v2-1-dca22892d3d3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFbqAWoC/32NTQqDMBhEryJZN5IETGpXvYeImD/9Sk00Udsi3
 r3R7rsZeDAzb0PRBDAR3bINBbNCBO8SsEuGVN+6zmDQiREjjJOCUgzjVPKCNC89NxKcBtdhwm3
 JJddXYhVKyzEYC+/ztap/HBf5MGo+ro5GD3H24XNqV3r0/htWiinWTIjSiIJLK+4+xnxa2qfyw
 5CnQPW+71+42xQHzwAAAA==
X-Change-ID: 20260511-ipq9650_wdt_binding-06f96b6d80fc
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778510428; l=1233;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=JFB7JC2tVqIvLepWGTYj7+r8PPtD5vD/Hp89OUL7d8U=;
 b=hht1YkGSLtojsMv/3xTmaizOwbThS8DBBSya0UxtUX1XaR5ZMyREBH1czdCueHIa+OG5heENy
 d19L9M0eSfPCZUZcw3g5Yp5XXjrqzKEibLBrQDZxIRfQoV5ok+tKfsr
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=GfgnWwXL c=1 sm=1 tr=0 ts=6a01ea63 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=w4RUFeMe5Se8zSgF3B8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 1uC74xXd6gq7SWtoY1WSYf7bWQ5azVkM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE2MiBTYWx0ZWRfXx9B1IFV7RZXL
 0vhLsuJURntr3USOQN/XW4P5RGd4J8jo9NdzR4tDoqYtcyFty+lKhp+HzicI50GDeo7iP4lONmr
 V9bYtoDuhOsIwKBixk92j1N5BxZ7mE+QHU0Hge3WQk3PeO2sqr/GxoVBVL1qXcYstU8Sh+iiISs
 N/nL+Zldb5MZsCzanvUSBv387Mz91YcA6z0QHL3tbGRBB/BfZRzCQFtIj+GwbRMNyfsMuEL0Elx
 r4YCsQU/4/4BKhSakAaOhgd2xvuLrUoLFESTbbB7lcc07jVkQJvwjOx0kCUrpWdGyx1YMIIC76Q
 OlAAgAMnV0ZsMxrXQJSZ412dwm57uuGjXShaTKIRfPJNnq9VH/Rtl8BxuCsnqFGKMNYeU92R0Yr
 kYfTLpJkomN8gsnp4cst+wA/L9oUicDGTd4dvc9ji153ZR6fR0xSGcZXVzimF6xGxAfZ1hj085c
 0ZAX8jxmwxknijQ/AMQ==
X-Proofpoint-ORIG-GUID: 1uC74xXd6gq7SWtoY1WSYf7bWQ5azVkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110162
X-Rspamd-Queue-Id: EB12C51086B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,msgid.link:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106954-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the watchdog device found on the Qualcomm IPQ9650 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Fixed the commit message title
- Link to v1: https://patch.msgid.link/20260511-ipq9650_wdt_binding-v1-1-d2779e756bf7@oss.qualcomm.com
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 9f861045b71e..54b2378525c0 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,apss-wdt-ipq5332
               - qcom,apss-wdt-ipq5424
               - qcom,apss-wdt-ipq9574
+              - qcom,apss-wdt-ipq9650
               - qcom,apss-wdt-kaanapali
               - qcom,apss-wdt-msm8226
               - qcom,apss-wdt-msm8974

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-ipq9650_wdt_binding-06f96b6d80fc

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


