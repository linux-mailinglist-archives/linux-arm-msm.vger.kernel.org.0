Return-Path: <linux-arm-msm+bounces-112322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6vwIFoYPKWqZPgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:17:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A926668E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:17:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="noRRZZ/9";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BJZwi0IJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112322-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112322-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 763E4314BAA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A90C30C629;
	Wed, 10 Jun 2026 07:10:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F86382368
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 07:10:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075424; cv=none; b=QZUwpVu94BQVFr3bKUGAGL+d2H3cVlT4hdC2j9P4AXNiXG4371s+uDWAq4XvKe7g+P9gATytPeXo3BdtPK+Id1n4QAtK4yYrWIhxoHUtQrP/xXokIvQ9BQnt63ZdsT+o0vEdU65pxLUiT3e1IdmXHzEjgiXkck6pJEZA929Yhg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075424; c=relaxed/simple;
	bh=CKh0/ez08/oWAd1EC8MVRN8pQSg9MrtVXxPDqpIuVEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ndFH+b28s/GGADVuJ4iarKAaIiKnm1vl0GTHoOlVR188xu/xxG4CKiaj44frLJCnWJ95dRfmQ1YSDLDw/NGiugXp4ZlVn6nVQBtIGOq9lKXchu8pM7ifYVyAWxiy/tByakTzpmq5vpatuJHQ20qHdCMjCu1AeBSfcK/bln4KlA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=noRRZZ/9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJZwi0IJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A5SwEX689070
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 07:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fXb6ece795ot4aiL/c3+Bk
	KfpbmqqD6TahVlw7jD4dY=; b=noRRZZ/9Rh8fEmYLGMx4gnfa1I/PaZbbpy7GHj
	0p0h/esldJwYrRakz4vj8w1ZjnPVWehaO6mkYteuag+CHoWJ3BaNF6Sc3AiKt6WC
	a4sm/NRhEmENhO185kVG1mVbMrHTqnIyyx58hkrSPWSRj23UEQIq5FZTf56VTh12
	tADJQRUFF9fr+bTIWYgE9VVTdFRQwmdLSCU7T/jbwX5MhG/2zOb6vnx3NW/bJsFH
	vmfEUuSNW9FwJrBBCGQskaiaQyU4YGNcBKhnFpmA4BvQpWiTON0XJ3k9Woa7w43m
	pBzMlBIT90Onph3JG22lQ1falz9SoZBF8ueJz7qkugQ246lg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg0bs4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 07:10:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304ea42b025so3678210eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 00:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781075421; x=1781680221; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fXb6ece795ot4aiL/c3+BkKfpbmqqD6TahVlw7jD4dY=;
        b=BJZwi0IJpGhnuTFfU5EnLVav3d9qP/vdR51iEN/652lt3IFfhObwOMdH3c25Vh/2mt
         k6KFwmUt0YiaU3Ie2Cyt9/crNt1nQtCYuhD9fithd0yaoHIgKfurxlWqkwsw+lTjjz9v
         GS4eQnMXYNY7CBLQfmuUD/Iq1UZRlOQ98udqKF9Dw/cwlWgDEPD3NCFqkWzICp1DP2/m
         MS6QX0DvYcWr/M2C7QjUOUYVVntOKiUojD57E+CLBVjON6ifvbG1pFyNZq1Tp0rVo44E
         kwpTriqk24CpzyfqNwyaYHxSlYm4uYp1evSFvpmmWpsUiz6ew2hG3ASefll/Zh9JfwG7
         3QCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781075421; x=1781680221;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXb6ece795ot4aiL/c3+BkKfpbmqqD6TahVlw7jD4dY=;
        b=VKGmK8cwCQZAgCXHCLXF+/U3C/FKEBaT0wZ1EFxw/xB1G//5Z1Iv7AEijak8cxJEKY
         E7T9Mhk3qLW6QkxtczOdiM9zJEYFeZlkC4bqgwG2YxH+qGVokr8rTp90JJbLgHpicXlW
         b085lQYNBlwmNhyF4EJ1/grubHqQBP8m7pHfuqIgsTVrFJEmiNYcibLUb1hasO0hnt2R
         PT9phBZOpPDbem12cAS1IVEAbyMcy9k0oxKMJGzh5OE4I23OQvRUWShc4Zy4cOu5KIjv
         txBC+3Ab4AWNi7z+M2TiScJFHe3esOPH+4jD2AXX/xSRtoCWJCSFM5edAemeKaBD02vY
         HZFg==
X-Gm-Message-State: AOJu0Yw/xThow1NaEJlooS35KjHT/qFl4L6Rm388IxkfPOgjoK+g3can
	fbncBg2GrQc/cTW5R/dHAhvPHY/ne53g6SahYSBWqNliUj5fKF3o2ELTXzD2rsj6OFBRgSXV+zR
	YaDz+pKK880g1KwQ0/kNkUKfIZu+v70dUCcQpDq7y/CelhPEm8a4LYqjlhgYuefBTR0k2
X-Gm-Gg: Acq92OHtYpRlWPbKTyItO1rqtucpZz6LGYmR6f3S2CZrrQ4FuloIHARP+7cyVajK5ng
	MPhxcN6Krv/YN7ixjRIK/wnQpa9k8QwvFK2eXI2jQQqHQaPUEzKxPQVLd0kyFALyZb49kskm60b
	D9rCVxOIC65ay3qCrHLd8E3/oIu6sEouWXE1yUFJvyzFsF/RBRshTbLTZiQnXTZuqlohtTVeZMl
	/O6+h7kjysov/nXkaOIlqud+S0ouqy4jA6P39T4g91F8e5V9FIB6750jZbL9uDnxANyI6lnrVXd
	bQDnXDwSGgiakICsfxoMiny8AYtNdv36UZfH0gcrFzcnwbHzWKrsx+D3kWTYsSmwrf6ROeqasbH
	Wzd5P1U4pbeoK5EjOFAyFtZXdueaaFmrRW+vcptzPjbIU7fJKe/CzgdUPWEM/J6HFdqfZ8qejT+
	2sFQSJ6Yn4
X-Received: by 2002:a05:693c:3116:b0:304:d600:8731 with SMTP id 5a478bee46e88-3078000cf62mr11787774eec.15.1781075421061;
        Wed, 10 Jun 2026 00:10:21 -0700 (PDT)
X-Received: by 2002:a05:693c:3116:b0:304:d600:8731 with SMTP id 5a478bee46e88-3078000cf62mr11787738eec.15.1781075420492;
        Wed, 10 Jun 2026 00:10:20 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30791f6381fsm15947860eec.0.2026.06.10.00.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:10:20 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 00:10:13 -0700
Subject: [PATCH] dt-bindings: soc: qcom: qcom,pmic-glink: Add Maili
 compatible string
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-maili-pmic-glink-v1-1-a6ba02d6deba@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANQNKWoC/yXMQQ6CMBBG4auQWTNJIYrCVQgL2hnxFyikRWNCu
 LtVl9/ivZ2iBmikJtsp6AsRi08o8ozcvfeDMiSZSlNWpioMzz0m8DrD8TDBj2zdSa61XETOllK
 2Br3h/Vu23d/xaR/qtu+HjuMDNVw0NXQAAAA=
X-Change-ID: 20260610-maili-pmic-glink-bc4d89d7dd5b
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781075419; l=1100;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=CKh0/ez08/oWAd1EC8MVRN8pQSg9MrtVXxPDqpIuVEY=;
 b=8nSfpc45ikx9H3S21ihahdwdcZo1rHgnrvi9LmSZ994ebO3Lgqy7vdCOJSjcL+rUDIwAGZSQX
 atDaJaZwRvcB3gWCC0kO9BLriwbwYwQcHzaodeaiGKZVdgjuVpZnZyj
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: 5b1x4OGjlFTsyN9_wjWhT9B9nP5SH0cd
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a290dde cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Xr6ykaAEL7NZcsm-Xc0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA2NiBTYWx0ZWRfX4gR5NkMH3F/m
 0mu3QetHSRM/bd50dqiDk0L7CawPKs1Yv6u7hG65+LW1lvOA2oLD2W6irsI2YoRnHJcnNBShCAw
 h7gT+fut8zDC5KhHb9zk2OXW/ktsrvKoaXmjiKaOilUttLRTEb2QJQ6TGdCCD3gB1zYUDpw9Jw2
 DCzcO7UXkDr5roGxxgfWgvMRG/zFVltmgUCVGgi2DnUa8nOduh7zaFYonZvBVcF3/EPo5HUzBoZ
 Dm/iEhIM0V0yoLwx7xOqEDLCGkDA1uw+z5MPzs6RUTLVoEIs22n4cr0WymKIbUM11gjIXSDbdGZ
 Lv+FSbbCaSNVxVLK6ntvJx0GXORh9I8wob0PDQ+ecuUGrHZ/mY2rJ/zPAVMNZTMnGserMJatK3b
 eIpDRbgGEAw5nrNPGCe/YnxjN2t3kTAoHerN7u+tUWbVYsZmSqiLqIUH6M1k5xgXm1yATGB3e7K
 Hdpnlpk+PcvO0Bhw6zA==
X-Proofpoint-ORIG-GUID: 5b1x4OGjlFTsyN9_wjWhT9B9nP5SH0cd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112322-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4A926668E1

Maili is a mobile platform that is compatible with Hawi and Kaanapali
platform with respect to pmic-glink support. Add Maili compatible string
with Kaanapali as a fallback.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 2db4288a8a54..16ad4f5698fc 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -35,6 +35,7 @@ properties:
       - items:
           - enum:
               - qcom,hawi-pmic-glink
+              - qcom,maili-pmic-glink
           - const: qcom,kaanapali-pmic-glink
           - const: qcom,pmic-glink
       - items:

---
base-commit: 8a4062d204752e0d66a1e7e1a2f8834571a8d40f
change-id: 20260610-maili-pmic-glink-bc4d89d7dd5b

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


