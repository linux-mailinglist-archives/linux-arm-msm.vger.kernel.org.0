Return-Path: <linux-arm-msm+bounces-103643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNMjHM2O5Wk7lgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:26:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FA14263FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A472300B3CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 02:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87256377EDF;
	Mon, 20 Apr 2026 02:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j0e7vhOv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fyIxfvUh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4010437646A
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776651979; cv=none; b=SGdwcTtj2mwGvtEk0doIZlTXIQCd/aqXb0lpGZ+bd9nLUOA7GgaKxQDLLN4TCjm+SuB4LX+Snn9mItxxpWRMonWoV4EhgatNZAewWFXlucuPDWnFr18xICija11pA0qbqC7/LwAHnKjD50DBO6BUmNi02wXRSa8h0mg/HiIHTzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776651979; c=relaxed/simple;
	bh=R35Ineh/EC4uwu7p6KSiIzAUo9XtyA7cPMcUR+dcTIs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V3z1gSFlkr/2/pzM56GipceZKJYd/bVrgc8+uukvsHEUnobV10+lF147ExE4rfp9LTgaqCPXJ33zJMPgcZcRZDfEqZdsTEDVMRMVwiij+i0FwO7QgTDksNrPycrFevVOj4yz7Ztdu8kd23zZtfJ1CMaqNcKyiy9qri+bSj8VpUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0e7vhOv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fyIxfvUh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JNcH7u2396241
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6Q9J74je6kR/aQO6XzDjTn
	3A3Q9gcKFGltrlMWhx89I=; b=j0e7vhOvrvf7jYmxJJWRObU0PdiG7b0s6MvN79
	smsF2i226NFNyd/27/JJrPiSWlQjyy9Y2dmlnIF13V5RMLfVQfaw/Hf7GjSQQeY8
	CgBpwyhIH85biimJkrA0iTZ04asuCWsK1swRr8gcUsS7DT8c4BP4jNDPYZPhh6cZ
	jjxry5EZJt608bRoj3y85QH8WpPB4qThBaNXCwIf37JxJRRVg5fjTCTzLIa7t6yu
	PuzPoTIwU4OL5I+shoJnY6a/sXbvPugHwmNCtrLy2MGg3g5oeUe0esLuDG0SGgIt
	xN9YwoUOAhmoSooSYz9WG/DeKyHOdNde6eXrSO4xipnuknSQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm21ukn97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:26:17 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c8de02a4dso1603118c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 19:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776651976; x=1777256776; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Q9J74je6kR/aQO6XzDjTn3A3Q9gcKFGltrlMWhx89I=;
        b=fyIxfvUh39qf3A+VoFBgaZsnk+tEZhnzO1JXylarpY0rTpAELVSgnu/CA9W9pGIJhw
         J2ODp7Tx/0Vg6wV9pY3WfhrLYCAeiF4CLTUO87z9Zqdpdg5/ufLX2Pe6MTAg/mXiatVG
         c1vDl2nU3p04fF6JJszIkK+BbrhazRugL8AeJycO65QaQSlgnzGE3a5bBOqE5KKrejRF
         2yjUwbCDvyD6/fS62uGy7cz4vdipxG0HccvGu4MImmvNegneUfoP6+fa+pvueQ40Li9O
         N0ursYm9Ig6OFErh3Kbrxce2gKtoSh9Kg/UciSrdSkaRkQkjy9rqa9I1S7o4B93n8Nv9
         l8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776651976; x=1777256776;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Q9J74je6kR/aQO6XzDjTn3A3Q9gcKFGltrlMWhx89I=;
        b=G4/hqnwQbWQFveMQahvVs811GBmChj20aWRTXxMNfMQDXHh1nbXtT+srimTygod5q4
         YU4PHeMZHcDsrwyity0yYiPtm3AEGQr04cQ++3RMFHvYejkjXAcBZRX5/98kCjTvD47l
         D3eqnoqfM2dMhX1hqXwlOrL13CwJ8q9sH9WWsVKByYXZIZggG//TcU893DkJTKpUeJ1T
         WhY5CxW5ZZjLMcl6WGFAxZeZy/xl0rtSUIHScY2pqi/vfctU2TmBgG4/OHCb8+boQgRM
         3I5nSEw6vmLK6W/6W4/IJrIlD0faJsp7GtnyhIRIJ7N7D9v7HN0Td6YhlYZTDKvuK/+Z
         rvXA==
X-Forwarded-Encrypted: i=1; AFNElJ987ZXIiCdRPAkYJ5JyyxWagqhMyd39FL+x6bkO7DT9Q0Bn7nCLMwkV5T4/+cvmGDxBw3WurhSSfrTXKqR2@vger.kernel.org
X-Gm-Message-State: AOJu0YyhncVVD7DJ4qRAyv7rDqrd4pSJL4ARwGgv9uzSEkqE+GLYghdd
	X1LClRYRr/o4fWZysLd8ad9Loa0UAIoKyRmdieQpGZZTbUBSTzQP6ds4snjIMN54DjZ5E6NVzlv
	TBoJj990IEIhVrkZTqtg2vRtXQdy++9TI/tdjzvCCxG7Hn14ksoj8v3UqQ39orW09LMH+
X-Gm-Gg: AeBDiet+G1Tzzyspga0HyDZwdyz8ykVv6eZD2qrCJIqMpJtKqM0h92PKl4+0U9Ir2Gn
	f9PBxDvrOoYVDkdY8AnC0foomBOy+3HacXhI1UWwQJXqsbE5KupQa57eUYGhx+tGoK/kojQifwX
	PuJPY/yfBwsuZVk4qYOXOuNlYiXOOBi0A6xp5krJcjwADWj57cW9RYU1BqIWMcdyfk0uWsoua+R
	ReZwLfugKf4EUPJV3JNXSmoNZw4Tm7C5w241b03PFJ1n/rHcgWbi007JU6+IhfoY8RXq650aFD1
	HhwwLYVFMCDZlBaA/Ds+nDHgoHt4Z1OQzWJbLk4vMCdycVv748CiWSi9JdNWxOc2sJTSdmumjGt
	fEqMjfDNh5qs15a0i1TCQ/+Zh8498uMez0QR9cLUTIdjjDvhO+9lfHeLuQcOOUag6i7OFwose/l
	5zgPxM3bAI
X-Received: by 2002:a05:7022:6290:b0:12c:8f92:c6ba with SMTP id a92af1059eb24-12c8f92c9damr417654c88.34.1776651976305;
        Sun, 19 Apr 2026 19:26:16 -0700 (PDT)
X-Received: by 2002:a05:7022:6290:b0:12c:8f92:c6ba with SMTP id a92af1059eb24-12c8f92c9damr417619c88.34.1776651975732;
        Sun, 19 Apr 2026 19:26:15 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm15299023eec.8.2026.04.19.19.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 19:26:15 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH v3 0/2] spmi: pmic-arb: Add spmi-pmic-arb support for
 Qualcomm Hawi SoC
Date: Sun, 19 Apr 2026 19:25:51 -0700
Message-Id: <20260419-hawi-spmi-v3-0-b04ee909cb87@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK+O5WkC/23Oyw6CMBAF0F8hXVsybUcervwP46LAVJrIQ6pVQ
 /h3C4mRqJsmt5l7ZkbmaLDk2C4a2UDeOtu1IahNxMpatyfitgqZSZAJKKl4re+Wu76xXMucTJ4
 i5BpZmO8HMvaxWIdjyLV11254LrSX8+9bwZXiJQdeUYIVSFSwzfedc/Hlps9l1zRxeGZ7KSLI7
 yIUBWVCGFIGf4vzFV58NiOINSACUIbzEwUoIM3+ANM0vQCVTntGIwEAAA==
X-Change-ID: 20260323-hawi-spmi-a29ef97409a4
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776651974; l=1247;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=R35Ineh/EC4uwu7p6KSiIzAUo9XtyA7cPMcUR+dcTIs=;
 b=i3Tqm3t2JoV0GoFWhdY2AWS/iBlj//c7yXcelQNe86fZ+t5iO4hgWUhXxwvPFCZN/lFfAUHAm
 tQNRBlkxI5wBDcXEAhQgPlvwb0sgmEozePu01PkVM8SwjqYprVuPqz2
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAyMSBTYWx0ZWRfX04cFQS2YLdoD
 CypxE/y/gHByIW8vX0S2s+sbnoGu4JjOsl6x6NYrjRQJPXFmY5fAD2bSvIHdg7ABsoH9+/Rq845
 wz+jKGLJ23DgHnPrye/ASTdjGOpJlO6lRULQy/y8cbxH1t13Vp7QObDsdPWXyyr8qwmJwlENCQm
 SWYaiAjHQt55P4V/1kxeTFXAdHGQwCZcF5WZzGQWu/PpJr6UhEtMNPU4dqNT1pR1iGP0cYgeUzj
 aE4YSSgQOy6saeLKe7rzGFTnH+gHOgeVIRycQwtokygyUNKqYlPm+FiG+3mGzop+V48oHcC+di+
 ReOFrEKd7U8dx+YH7TsmCRWcSSALhPxnCncUthFpDaubeoTdXq3TQI928QwU6xuBpPVO22pHb/3
 X2wlZ2SQD8KkGgxwsg0S63uhOhgUnZDdWEpoWs+wCk20eszoWh8cA2lrrqBDNBmabjSLiy4CMf5
 kbEKOoxy5p6SvrxzpFA==
X-Proofpoint-GUID: u1G_oGcrk8TlRB0wpl3OGSYlCNs_Hd9x
X-Proofpoint-ORIG-GUID: u1G_oGcrk8TlRB0wpl3OGSYlCNs_Hd9x
X-Authority-Analysis: v=2.4 cv=WK1PmHsR c=1 sm=1 tr=0 ts=69e58ec9 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=EcyeceKEuQ6cqTFU2J0A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200021
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-103643-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 31FA14263FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatible for Hawi SoC and add pmic-arb v8.5 support.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v3:
- Updated the driver to include a "*check_chnl_status" hook function in
  "pmic_arb_ver_ops," with separate implementations for each version,
  as per Dmitry's feedback.
- Remove the Reviewed-by tag.
- Link to v2: https://patch.msgid.link/20260402-hawi-spmi-v2-0-0bbe811fe3f4@oss.qualcomm.com

Changes in v2:
- Revise patch 1 commit text to highlight the new features of the
  PMIC arbiter in the Hawi SoC, and clarify how it is compatible
  within the Glymur SoC.
- Link to v1: https://patch.msgid.link/20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com

---
Fenglin Wu (2):
      dt-bindings: spmi: glymur-spmi-pmic-arb: Add compatible for Qualcomm Hawi SoC
      spmi: spmi-pmic-arb: add support for PMIC arbiter v8.5

 .../bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml   |   1 +
 drivers/spmi/spmi-pmic-arb.c                       | 142 ++++++++++++++++-----
 2 files changed, 113 insertions(+), 30 deletions(-)
---
base-commit: 840b0dd6b8c169e963f74265f508c54f1fe3c968
change-id: 20260323-hawi-spmi-a29ef97409a4

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


