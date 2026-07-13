Return-Path: <linux-arm-msm+bounces-118710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tn7sFMywVGo+pgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:33:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC51749581
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:32:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L6A68yAE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="KtRDkBD/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118710-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118710-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C651D301874E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EDE43E1D15;
	Mon, 13 Jul 2026 09:32:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508F33E0C50
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:32:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783935173; cv=none; b=s2d/0xeszQQn+Ba8g8OfhlHGscfBCLVnPPuzjTPGFBk/v1mIqCsG356jNfFPWFGkyWBP7G63eVsnj26xKeCBqrwEY8oJUjqKWdOf63sIlrmXsZ5bC0nZ00AY/HfGNy0Be49ws5prphvh8+kyVDM/1YaqCrma/DYGqw1hlPjEVXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783935173; c=relaxed/simple;
	bh=AjxkvIb6V5Pdicpp5GVvYOxfo4QZxwGgvJjkCpdDa9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dg6vQ95pPQaCUkGA/bzZx4CcuaeAXivC3KlaeYUo690m3oYkUiic8GynQxGoy6gyyTbHbsN6UY2ptkEGSGbRKV59/+GAnJPWDG9AERmeCWLiosOzUUglXShCkVw6zvS8qtH+LfzHrk48DY8BQ45/kbDteWArNfn7xLgZ/U1P5+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6A68yAE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtRDkBD/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nu6A568062
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=o/JP7kV5x+wObsGf+L8F0Qi1bG2iO6rzs3e
	co8f1bVg=; b=L6A68yAE9/hE0Yai7d+ysTDY2z9kADomlCdLquLd21b6xTorifa
	ddfZbuhfdYvXuClVl9kPxIv7IPlfxX2sYZVcABoxsMS65GIAtxNyp87AQH7J85Fu
	mmTujDMOwVgi3rNl5Ww6KmTqwp4TI+8DB/xFotFqdxfNfWQFIfZ6GvCMR3N/B7l9
	BQSJiII9RTWz7rIzsx+NI4x6Of4Y02URmI1PRWtAihDg76xCqLniNrP1QTGUEgRC
	aQaJ5z/6ldaVWauUV43lLa4VTHptzOT8lhJ73Grws7XgsIHRJexJzOerUk/mXv2C
	NA37a5gutwlsYsPPH7eTI4YoDPYjgLpagsg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe915egm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:32:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84857446424so6038667b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 02:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783935170; x=1784539970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o/JP7kV5x+wObsGf+L8F0Qi1bG2iO6rzs3eco8f1bVg=;
        b=KtRDkBD/g7kUuCK7V9RlfQtKu8+QrGBMqKqt2xUOFUA8vyP5hTgLHoTe9PiJ81C/Rj
         o9cxDJ64914SfhXdK3L1Y3q4cYHKI+GQs1XBgVf0QmUSaA31K++GPV/0zcL49f4RY/U4
         tjD6L9RQkzbSc+ANx7cjSBUh5kdlvD7hlQMbJTgTajofeQnEbSLYxfTl89xB46xgakiN
         mlGgzM9MtIX343Yq++OdDTKwlciW9SfOU1HIl2NInaIpigi7X90qkSwycvaLbXzo7egN
         NX037rfwAvYQa4rhDp4kLunPeJ5rAKONtZsIXmdPygm8F62tRezrn9McDIh55Eu8d73F
         n/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783935170; x=1784539970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/JP7kV5x+wObsGf+L8F0Qi1bG2iO6rzs3eco8f1bVg=;
        b=Oq34lv4eG0LguW+1XpahxruXUKSZFlxqBBMU5qCgVqDQvNazGU3s1FEU2HKd4U5hgX
         3dgnx9Jl9Yf9MUx2/H3QBfdXd/OZKAZ8E3glY31Pnmx6PIU59SxXELyIu8Tm2oRSHOqV
         G4JsRIcseZnvSejEEgCiR5lEZtN/ssgM7dpsrDzFAqpeeJrPUyJQk88Jh0l+H8Ro5UJB
         1tcKrPU5glhuQ2Qwgek7+2tgkIDKx24RjEoZXE5wK9oCTADhBgSmTu/8Y8uLMrpaRYb7
         OqOeCrI68B0l39ZYpZN3BQ1enOzmkeCyXpIOHOOHdiQSXaXhAQA0j2t0pIuNpan+W/F/
         ZyHA==
X-Gm-Message-State: AOJu0Yzahf4GOteDNWF09pnpzn1fBaPpj4YolyJ9/yWJJqiQC5SmknUv
	g84wsh6gEBPQ0AiVVl0mF6V1CuIuViX1Un/6k5YpmQf0Y00zjRA+kYS8bID69vuBu5gLRDslnec
	g5xO7eluZON7DdEVJir2n3LOojMCHIDl6XwwvoD6mUHjYAJrtP9PkkVf0JICdLjJzsSco
X-Gm-Gg: AfdE7cl/QaSeXyAqtyjDeKSZswNi/Vq183Xd8ofDb+Iany/CccddJwLiya1CrvRs8ck
	K7MaJycWiBFIUwcnZ+ZAIdMJjU8WeBQSXe+gsIxP7QaGx32wNvBqRu9WoMfFqomoOQAhKPwtQJ9
	5RokCcKffL07kYGY/GBaPeAlw1EokoV4BBjWfQ4e0kEfT/oF0yZY9ePy9UavNdJix+ucwgvOkoB
	Sd5kQhPeHrW/fqRlAhsAhdwNEn6gSMiatvBFVmjDPZkooMSZpCjP8aMaikgVdn20+1tNwYvQ84x
	214kGikca1qbcfTCY1J4doUbxepaNgqsEdbrRkQ4Eix5+U3+UfQUNix53G11mo9+iJR0g44CqTo
	kQvaugP04s7XLgS5uceXo9Oj7b01L17abMCXUkQ==
X-Received: by 2002:a05:6a00:4b4e:b0:848:2f7a:2e5c with SMTP id d2e1a72fcca58-84889763ab2mr7070310b3a.75.1783935169542;
        Mon, 13 Jul 2026 02:32:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b4e:b0:848:2f7a:2e5c with SMTP id d2e1a72fcca58-84889763ab2mr7070281b3a.75.1783935169034;
        Mon, 13 Jul 2026 02:32:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b5e566sm13856577b3a.3.2026.07.13.02.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:32:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi and Maili MPSS compatible
Date: Mon, 13 Jul 2026 15:02:37 +0530
Message-ID: <20260713093237.691117-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a54b0c3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=BoWwrvf6mM8Tp1CBcy4A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfXw3L4MaPR5c1G
 NIYu5KWhY6tYkMIDnaIV9glE7lkphJdzhULywTiIRPrmw7mK6Bfl/mch/xdNW4FuDSZiWK7ZI9/
 h7A0xpW42MlNoSMbk0XlkKset+5DSLg=
X-Proofpoint-GUID: SYtOVqrZltmN47IrByZPQOMSKcTPE4jO
X-Proofpoint-ORIG-GUID: SYtOVqrZltmN47IrByZPQOMSKcTPE4jO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX06Fh/2wCrbS9
 4LtcO40yPZizq2KeQhxTup7MDg9DlCHGhfI+7Y9bwO9PY9K4KUs70lWQavuT1C80WLLqO0gClvg
 +jF4oPb5DxsE+8/cUUvtdwXKjUg04s5f/z5P+u3p3nRn9nZeayZmwUsrv6g2hMwwgEDCI9vpzW2
 XjKPLMAojo4h8YCis7pgcLxZ0Styn72Uz7tAjRTm8p30ZMKx/hFc8/hKHys8e/C2r5czw/Mawc2
 5vtVIYcmWBsy78gRU7pd5wXrAjAfy1QGLejKEmkHcZJH6bPfeQr00RV3YCFEtmT3KOXn8ds1gNJ
 El82/emtn8TOzrNwW6X74mSKCq0trVVkxBMZrMrhPqMdMzKzj9iTAxrWeqzGcfTKR6SgoG/fTtI
 20PrTHKD1fXNuW1bzLZSbOOjRtuVWQ6B7H/XrXz8OZWN9OcdoR4McCk96as7RStdv0/XC6aqaVQ
 xUotu/QeKL/6rPH87KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118710-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFC51749581

Document compatible string for the MPSS Peripheral Authentication
Service on the Hawi and Maili SoCs. The Hawi and Maili MPSS is
compatible with the SM8650 MPSS (six interrupts, CX and MSS power
domains, memory region).

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index faf7b2890de8..0d9fd1598b5b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -17,6 +17,8 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-mpss-pas
+          - qcom,maili-mpss-pas
           - qcom,sdx75-mpss-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
@@ -196,6 +198,8 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,hawi-mpss-pas
+            - qcom,maili-mpss-pas
             - qcom,sdx75-mpss-pas
             - qcom,sm8650-mpss-pas
     then:
@@ -246,6 +250,8 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,hawi-mpss-pas
+            - qcom,maili-mpss-pas
             - qcom,sdx75-mpss-pas
             - qcom,sm8550-mpss-pas
             - qcom,sm8650-mpss-pas
-- 
2.53.0


