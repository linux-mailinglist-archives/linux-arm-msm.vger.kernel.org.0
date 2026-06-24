Return-Path: <linux-arm-msm+bounces-114280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rlAcDYN6O2oRYggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 08:34:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A66F6BBCAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 08:34:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=G0JTXwUE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a0lriqzW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114280-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114280-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3392307E19C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 06:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D02388390;
	Wed, 24 Jun 2026 06:34:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FE23890F7
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 06:34:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782282855; cv=none; b=CvekZ2UrRpDU2w5aT0q2RR0PG8Lezryo9dVsaj11yc1hhU9B+sO1cZmcA/ADNv0LEgO9G0wkqACiAh0203s+M6aKZSTV9ZPzMOgVfpe4asFAE88exB8uKdUDW7GSaVqjYfOJm6i1pA76GDbG/TpKgqQy9Zel+R6/Sodzps1v6k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782282855; c=relaxed/simple;
	bh=ECfYm4OBroVPGppyAC14goy1FmHUOLrCUxHGSjL7B9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NdoLhysj7uSRfCQs66Vpe0vUeZFyKMVWGaBJQuYuLTtO+99ue8e/um/ZUtgMEVf55aarM1GOUrAxaUpMusrt4jVNukBAC4vdSg78UmGvabA7D1N0hIcf88e53EjEVcj48/h/xBTfxZWUfHpzVipK/ixf2wZK1CQ+/gOQCsUBNF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0JTXwUE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a0lriqzW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5tpBE1971921
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 06:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OTP+0T9y0sz1+pGHHr/b7x
	JoUAUXe2832Zv3s8NI/yY=; b=G0JTXwUEAdY4GufzKoj3739ghFf43Ms6GqsrtY
	3CwsFPWiHlM/iFLYWb+qPfnmuqsNqVBzDqyD86om+F9Xs8pkLAnNoaeoqWBZsEQg
	+20veF4524eJvKgORpI87bCR0yPEiC6y9BE4rM0HeSqVdxgVNQ9UjBCswzTlmtHK
	bV2c+TQ6CgrfUAABHZ2akOaZ5bWr5nCWWKIRz57hfhhTp2szPbJHYvywCtDFGhyp
	+bOJdnyFlMqXDtVI7yO3dzWl4Hgdh/01Kmkx/V528ghM85WhOipo8t/wig8zNLWe
	VGPS6yP7lT2Wy0s/wBAsp1sW63dSR6mRbMtpHsKbfdOtynZw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f00ev9rcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 06:34:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf55c3f44aso12161745ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 23:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782282851; x=1782887651; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OTP+0T9y0sz1+pGHHr/b7xJoUAUXe2832Zv3s8NI/yY=;
        b=a0lriqzWtE7w/0BPZzhfxylPtpR6vOhjvLCawCL8igaIwtZHFvE1orZUN3pIKdzKMb
         ybc3Pr2DzTzZy2rPzGUKdV8/4l3tk3/MFyB+Jm9IaevjEQEUYtQT3Ef1omqk84wLc3ce
         LIR5SXvcDkd0letrmTgBspyLRrCiX1sNyoYIJ96BNPjxPc2XD5528/+DopLzvCyHIcE4
         TZNU0LbYXsKbPe7WLoTkPCZElPGjM0Pa6UZwcdRK/LopiMq4E7h8ZpPt33YpJDI6REfd
         zq89wQAbRBaUTQIPUhLHTFqFB/47ztYrU/wnsSYAwfc27U4fXnOwzp5PDpH9k67CVXFb
         hWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782282851; x=1782887651;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTP+0T9y0sz1+pGHHr/b7xJoUAUXe2832Zv3s8NI/yY=;
        b=UM7y9+nKXpCc4wchrzcuIAhqDShUYLRgBCtQKnc62togIRAQH0YMa/l2Kf4bhEvX1Q
         QF+kDKo5oeji8R47C+IZ1+jFZQ8cv5hCyss7D/YTQqkfzIivxafT0U4sjQEZfBEtdkBh
         Afw/naSrwBxU7uCpQ1G791Pb5pIAd0thhmCqGDCC5Abl5+73Y2kjL5psuHEf6tRhVzyt
         7Ivn1AI2K1qM2ParFQZ0xdXQQ7G/eYgX6bHLwWLqM6CiEVbWBGCHDzZlU+1/Nb/IQRKf
         CLwS0Hj5OA7vaZBh9GISOxh+nP9sU/p7pxBc+zdzY0k8HMROx3H0PAYH6BEcrVPCQXRc
         zomA==
X-Forwarded-Encrypted: i=1; AHgh+Rr59kfocl8zO5aqZNzmWyolbBwLDT9R09FeUSXbnU3OpkusKPD7j09th+B5TRK8LOo931KpklWVf15fEOt6@vger.kernel.org
X-Gm-Message-State: AOJu0YwZIip69a0K0spYsthT5psG5Icy/5Eefc0/sJ455xePeGxaqyXf
	s9v2UwO65zGJKgSThqm960C4YFRZ8Ajhz1UPx/3TmNAxQ6pE6hFLVRM8UR3/d+bbi15L4EEMgtk
	ALw32SpZk6rF60qj90dNWS/ZQdBlhrWLp5VNEARfSnkcN1vHJNrMUKqQa0gcgsKEujDZCN3qgRc
	pYWn8=
X-Gm-Gg: AfdE7cmscgWp51hVUDCuWMbJTKTeoHEZmHTQbGtA2+uaKmMfQvx7/+Quuf71PxOCHAI
	j+ByrZDvmFLx1e6uZG1CENmNGsIEZXvhFi4q8vW+7Apgj2M7LgKTFs+f6/GHt0TFx2BZN/Kxpl1
	d3zBs+0ILjFnKu5Ty602rJQirfuR17eKXkM09sNFJoHOUPKXgTCdrLxIZsD6vhJkAQUjIXE7/im
	NJBQhOdREf+4Z9HvsCKJZahVfHyGjEW5L3K0C9jIrtbqwvqyT88XKARJFjktLZNhQobQd/Guar/
	IDIqTBqHkLfC29H7VfLF2STciDy5uVC0TF2KwOIbI+KwLY5Ce+dcOaFoSdMZPG7fRp5Qwka3rLb
	3MsSILnnoBwbqeSuWCzBDX7UlzxAVOf/cI3RIiPnW83ax3IRUb5de/ZqqW+2eK4o/IR6E5kq2YQ
	==
X-Received: by 2002:a17:902:f691:b0:2bf:2398:6009 with SMTP id d9443c01a7336-2c7c3ece1a7mr56041475ad.14.1782282851490;
        Tue, 23 Jun 2026 23:34:11 -0700 (PDT)
X-Received: by 2002:a17:902:f691:b0:2bf:2398:6009 with SMTP id d9443c01a7336-2c7c3ece1a7mr56041255ad.14.1782282851018;
        Tue, 23 Jun 2026 23:34:11 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f86d0sm118225895ad.40.2026.06.23.23.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 23:34:10 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 14:33:47 +0800
Subject: [PATCH] arm64: dts: qcom: kaanapali: fix traceNoC probe issue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-fix-tracenoc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEt6O2oC/x2MQQqDQAwAvyI5N6BhWWy/Ujxsd6PNZVcSLYL49
 waPAzNzgrEKG7y6E5R/YtKqw/DoIH9TXRilOAP1FPtIAWc5cNOUubaMq7aPG2Y7Y46BniXRWOY
 Anq/K7t7r93RdfwnuuMdqAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782282847; l=1132;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ECfYm4OBroVPGppyAC14goy1FmHUOLrCUxHGSjL7B9U=;
 b=1Zn8k3q4T63+C0hDEhEV0fqbQxINcGFwKWcnILGx+P2hYOFU6a6RcjsMuCn72elMC4DIjuhb1
 xQ/NtQhPVG2ChLGq2Ymze8YSutN30px2+wA2SSuFK1kdRPFuvlNqv/x
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA1MiBTYWx0ZWRfXz/c4eiHwz7Yb
 aXPCcjT5qG34peLrSz5cSUBjX3aolg0M2tl0awOjLiTQ3ZoG4hVu2cd7T91aIRofedIQcQXcu9B
 h94xeIoaCBeTTV0CnUoIwFy0Kc1Am3M=
X-Authority-Analysis: v=2.4 cv=JbaMa0KV c=1 sm=1 tr=0 ts=6a3b7a64 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3HRjqqACalWvbh3tpegA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA1MiBTYWx0ZWRfXxmo2L9qBWlEB
 C7PnOA1FQVMkJhSymt4KyEskhNeMVLzi54qOeOggjdkVmOL3JjPxpJL1IKTjTRa07g5BIpaPtGa
 5Es8mkmfpC7sl5XTqhsFRBG2BRZ/a22e8pSarYvXR6Umfcq/rO6xXyTmEUpLL2upTNQkKvYG5TW
 XLvGjADuGomWfwuMxgDmFWC1BAo5EUv/1uf1QVaPzrK/jdnZkONO/Mkkri3NShzmLwTRnFWXuyI
 9TWFHragePspAQPDWpsvdKfsaR9Ox6rLQzFLgjdkhQIQmJYLIX5ZI95qva2Y8d2aNH+1AAyplLu
 2/cwrTYptXnSikJ2z0PTZcXZhfEpqFWgaoroeVvf8Mt2JDc5JzsUd4phR8x3RzrotjoVWLndH7L
 IPj1KYN6GXIaZxw4K5V+ei1a+nWF6Q==
X-Proofpoint-ORIG-GUID: vbJNgiuM0jhDUSahkidWSYvi8hcsnvaI
X-Proofpoint-GUID: vbJNgiuM0jhDUSahkidWSYvi8hcsnvaI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240052
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114280-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A66F6BBCAD

Fix probing of the traceNoC device by switching from the AMBA bus to
the platform itnoc driver.

Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..84561b5faf81 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5003,12 +5003,12 @@ tpdm_pcie_rscc_out: endpoint {
 			};
 		};
 
-		tn@111b8000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+		itnoc@111b8000 {
+			compatible = "qcom,coresight-itnoc";
 			reg = <0x0 0x111b8000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;
-			clock-names = "apb_pclk";
+			clock-names = "apb";
 
 			in-ports {
 				#address-cells = <1>;

---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260624-fix-tracenoc-probe-issue-c6429da28df4

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


