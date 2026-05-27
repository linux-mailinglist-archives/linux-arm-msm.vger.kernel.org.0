Return-Path: <linux-arm-msm+bounces-109965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oN5FDl2+FmrOqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:50:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB3B5E21FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95A583119F8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690433ECBE2;
	Wed, 27 May 2026 09:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PwImZobC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jIXQnKKW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CFF3EE1D4
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875072; cv=none; b=cHXn3eVcmpkDLa91OA0incjkS1sIVCfhh+cmbz4d28MC8VKThdRyjxSOzKHPDPKU4OR4GjQl/iVSHaj1B0CFpbuuHxwmDcEKzFb4qzgyiG4PCSJxaA8aw+E9xbdbR7RGpHlYZplspQAJj5zdaZM8RFVIJ/awrUfY9kvL8Jld44I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875072; c=relaxed/simple;
	bh=ziuI+6zAz6kb8Z/tBoWKEY++m8psxFjDv1dhkKmoUw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Phes68peywDuA4jeFLnSGOkxsrruZ9kf7fRU2nLzbhxus70vKKWQ71F/39qHNMVE/1jQPbZbWCAxlfgfoFT+CtukyiOXFwfnNJBOFCXN2Xn6KPHcHIYh86gvXsYNlPbLivHp2axaOlOSyndF9S6zAUcMQtUHSczakDeWOOMHZCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PwImZobC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jIXQnKKW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mYne1176693
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rTbyMw4P3z/
	TCsHI/LBdeGe5xHH9ZiqP3nDpkTkTCs8=; b=PwImZobCuCeDhZMAWWGFGtIGyMt
	4v89Kp3fGada2y5h8qJ1q2QbNKNPOTPLj6z9sb50V6wuIxUMQpHQyMIvXCum6HqU
	KxjPel7U1y+HKwxM4uzj3AZIGv1wuTwFEb37uta+GjuGFCQHVKN8WEWa0NQIx6vw
	WCEEPPlJsloMjQLUMZBO0m1f3qArgTDd3BqL6tci5nSDdid0UImtH3cqtmg/oI6+
	o6kSQCr1yToHcAMcBxHROPo9rf7h4SpyQqHYd9AVcGsum2xLrxCAQacgAmQXg8Jh
	Pl+MkS7J1za+nAlrWYX8afpnZP8HHVbxAPOT7ucOupUmL4x+a48kYBzygHg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edndnhwkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4530a90fdso61068735ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875067; x=1780479867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTbyMw4P3z/TCsHI/LBdeGe5xHH9ZiqP3nDpkTkTCs8=;
        b=jIXQnKKWmGUOQnPieG1JOMncQGk6WyoiaerzdvqAlfqfCEaGJgiXJCdOGZYl9UMPOl
         b4tL/MDz7NoP/ZSwTSkzIrXFVlKtoUOb6WL6jwoZ7FtH6ea5UqGNPkCiTNbVstHKqPV2
         bYscsscvJSBTGmP+tHdD1BmBeFcb6P2kEBiKoLse9le6y5iheNz1nRigZd5gZYhiEVdZ
         NqF7xdm5DMw5K3lVqmtK5c73niSDi1gFFHC2C5ciErn3X7t5UE/VBX7EuVXSBJzd0eVD
         pyLMTt4zZUF6puWYRKB0Zwg9z3100NIAdbtDa945XAKcVzsDvvjzGjGSnygTieylkvDn
         411w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875067; x=1780479867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rTbyMw4P3z/TCsHI/LBdeGe5xHH9ZiqP3nDpkTkTCs8=;
        b=PhNjwWETv2NyrxCm3PROZawYODWlHig0BI37ZOjXIpGto7B1IH5AuCrK5yBe4J+fB+
         mqRtfJ3Iw2TOTA+F9wJeEFC//Irho+bWlYHY/4yJqc27yg5a/99OW5c6HKT7fLYb7do6
         +j9H9S75oTbsrez8ovy4C24rp3zpDGxXMy+Xa9SdC7DombuEHFFdD39/n/shAnKQB9IB
         xqjopc4AEMbJrGT64T77YGoqfY2+/nX7y5qlTikjobFm0f3qCDnd1wk4xjjY6bMD7Vcm
         EtjuNapqzcRbyJo7mfvrCoT4Dq6Fr6eF+QjGWz+WyW7JRcFUxfb0U5rxOD+/lR1XfNVj
         EgiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rZ986wP32LmHWo6S9fxHhsWsjuTNPKSKBI/gI/CAMpELBhaMZsZLWVJ34PRdXJPEngLdwOhn7CcO8Lm94@vger.kernel.org
X-Gm-Message-State: AOJu0Yy38/P4aLKqDCq6xh4H7+qamF24jx6sIYyKVSY5dpr1ppoeqKVQ
	7wTE+WRRUqyI4h07+jkIRhrZqXDqnVdHgxUXZzEUU+cM5BjWNYAAMEg1cPU2b7rqSFByaIqClrf
	VWd+6B9wq61A1g9FCEQSXHa8mpCVU+A8+rjS1oN5ccZbNjpC4bGlQrdlE3V8uKVXj56xe
X-Gm-Gg: Acq92OEVMkaXnPBKm2KJtfXxyYetgwPjA4GqZrrB3qO5oA0iC0Zec0ASSW6MLo3uZ+H
	CbIlwLhrEm1xsSCCxU526DzAhZ5yhxo3x8oFyoAdOcBIhrVLzCDnSphqqvXg2EDa0hb45BR2FdL
	ZBEV42qTH4vJ6pA+EOoEcXJU6bR8kSRyHDMtkU+TuuRYrR0JlmyjhixNaikU8Q7EQqbzwMbtAg6
	4VATN9gNdC1KHYntTGKAxZYBkHT7KvovFY993h6V+g5DpLtDzXy4U6utNyMlesZzSOp32/VSF3X
	VNp8tSjvzX+4RybDba5i2fSbtuSNytWryzC60hgBA17ymRUVPAhA36ewPce4fUCqesifxwq4SNN
	KXxUayzpw0mj/VT7xdrSwFCm84CG1v3WmpbNuejkAccevPRd/0bcy4WULDd0=
X-Received: by 2002:a17:903:4b48:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2beb05dcb5emr261617335ad.15.1779875066660;
        Wed, 27 May 2026 02:44:26 -0700 (PDT)
X-Received: by 2002:a17:903:4b48:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2beb05dcb5emr261616955ad.15.1779875066181;
        Wed, 27 May 2026 02:44:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 11/24] arm64: dts: qcom: sm8450: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:16 +0530
Message-ID: <20260527094333.2311731-12-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PpSjqQM3 c=1 sm=1 tr=0 ts=6a16bcfb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=aMdznzVkWBi7sdx7J6cA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 5E-iffc83WDqqqOvMbcdlTbaSM4AISw7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX6UZeCxKbj0JW
 ZZhHgA4RyBOCm7g6yE3wBrZpEced7XvNLqOHhHy6eX4d2WRAN1ZvHLlrUZH8knsiZLaRDRlNCeM
 9cy5sZ7U+UmE4uCbQJnc38xYUGpASVql8zmW9K16+rvf/FNynzkM/zFeZg1QgiTh7WztIoUkiJH
 y7OjLJZqXTNi4DG5P25HQ0mkogfZImKysQTVV4JnviINlWAZyTyAZpUm0wEackWwdtb8bsluCBB
 QIXEZIUh2CsarMKt79MnTiaLYCi/L4RwJ+GNnPsrie9+qRqDfXW/kq0S/WL4iHWyi/yzHMl4nQX
 n939lQ6OAmt7FYkwkdC4F7aT3ON6Zn9KdLQirSZ4WzteppSZ8eN8J84LNH1lI8kVbtWCOGf4Kyq
 E7IC/NzygxODqA4jdWefrx3wvvaMk0TErc0PdyVumLC6sbzU3KB8tiuzhK3pTfRUenqu6qNzhiO
 X6lLdh0Aq+dtf01RD+w==
X-Proofpoint-GUID: 5E-iffc83WDqqqOvMbcdlTbaSM4AISw7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109965-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[af00000:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,b220000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AFB3B5E21FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on sm8450 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index e0c37ce3042a..04b15ee62681 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3728,7 +3728,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8450-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
 			qcom,pdc-ranges = <0 480 12>, <14 494 24>, <40 520 54>,
 					  <94 609 31>, <125 63 1>, <126 716 12>;
 			#interrupt-cells = <2>;
-- 
2.53.0


