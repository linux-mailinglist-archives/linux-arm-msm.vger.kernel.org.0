Return-Path: <linux-arm-msm+bounces-112124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8gnTLJLqJ2qL4wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:27:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 157A565EE1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:27:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lU5JAjXN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="BMrU/pi4";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112124-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112124-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C667307D7D6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 10:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB543F076D;
	Tue,  9 Jun 2026 10:23:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D41E3F20EE
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 10:23:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000604; cv=none; b=qAvjGU4wmruJZbyDaMmlVWM7WiLqjK/BMP5fVASaWL4R1XIcXYiyVjFG5SxRQ0ksdMuRIle0Ev2WwYo//qkx0SA4EsFQjOSVGSm6zqrQF2Sy1FuloekzC0uAi3Zfw1hOCY8wtOxaxdn20oRjiq0sz/fwL1n1tBco/9RxAC0Ib4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000604; c=relaxed/simple;
	bh=QJT8DDYNM9+tXaQYnEtfZjV54zYFg9aRhXLBf3w5u+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QZLnW/2t1+3388Ux4Mb+B0y8plLJnGaV8D/oD22WG3Iu7p4tNZ3+sTVgFDDtIusOYle+Zruc51EXw/4yA+UmKbNN67FLQCLSJjP4kgOTCECvThDdS50ZAG3xuixFdzI8TRtoyUcfqVOsV0YBZOleDivXmKhx2HgwaLkPzKxwM9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lU5JAjXN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BMrU/pi4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xY3J2320446
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 10:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMkSNONUnm2KHs8hF/QzNax1t2KsrzGvrxMSvAbRTlo=; b=lU5JAjXN7tzqZFdH
	oQ/Fx2PtL2lysTlRsVCS6GZLXdza5QZNba5SpBiel4RkMVW5dEJeheTQNMwn85Hn
	868AXxwJxOG5adRM+PFe0qapjGS5dEqIHqTQ3xO0veKoCKg3pzFifsvOWMutHHJY
	xtgK6Pcdsc9Pi1HE+jXTcsIXxkZ55a703VqI8OuuSZtxX4/jjjV5RBoMeKF0ysjr
	d+LC5SHpXxjVh+9fZqPud/yObUHgu1KPcAUYGQkQCHUZ0H0LymftEULt5i3osxJt
	ljanmoac/p28fJxdqUnAvg4J+ySkSbqbxcBnnQ239buxchBsns5dWsF1ue9+HWcA
	lVzpBw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeearq2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 10:23:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf32259e0eso71724495ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000602; x=1781605402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMkSNONUnm2KHs8hF/QzNax1t2KsrzGvrxMSvAbRTlo=;
        b=BMrU/pi4oFskVnRHfEWJviCtRc1YNBm9brTkCspkA/HQ/E2xX3fe5Lu6Mo0CFCzft1
         adrvgpEpabHH7fnLaVTAryswwg0fv0vnpI+TGmq5eLbE9s8bgJ3bbuf62e/Y13PLPpaG
         R1KQ5/bP9HY/3jxmnfxitmmCn+gkwApp6celfDzIRL9rXiEaLIPIAcexsS81SSzlHoZP
         1t31i7mV3XQGHrIst+IT4FeNasLNNs2Op7tKwnYdbMLru9upzCs5cPW0cMBwuuFBEcQK
         2w36LLrko+1Q9w76NtE1LjQQAUxizH+AL8K885MLOPi4l1htOyDJ1A8dez6BQQNHI0aB
         Pslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000602; x=1781605402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yMkSNONUnm2KHs8hF/QzNax1t2KsrzGvrxMSvAbRTlo=;
        b=gPJEhbHHala2A4MbIbqlD/dGk1TOML2+N4m9Y/vR891olkIOzyADJaYYutxqtmSEnP
         VV2OwX9eh+cuTkJSvad9du8/tn68PZkYl2jC0+vfv48Hw0mAqhxUJHrd1rmmLZYfZKhw
         2Z0EZoKJmGa3DtunW9vJvIulJiK2W4TZm5zUYAOz2YC9xZFGtloQON1TcSESWU6z5l/a
         cXoobNNZcWWmnbhSeM8gVgAz8TY93/IjA5k28B5rgHb+ncovLrMjhzwAYDKaLIgRBuDJ
         4jGC0YM+OgbrWHAdNAgCrUtm+DTwU7WmmvIVQhr8fwwE13N/DIC/zNnc948qh/wjGufs
         DoVw==
X-Gm-Message-State: AOJu0YzqLWJ9JAA+rSNTiSVhx3L3B5jT0A80iV4y1c7t2ix9ytwXMsfJ
	tlcTZfX9tW5l0TAxnYJyb5y3d2BERPbrQJqQTUzjdZTvvMSmKbNoL3+BCWIkPhp5Ca7Vszwgkhe
	YuvOi2z3nCA9sJnu09WQkLCaLIWwJxBNzztrMvP2nhPyYw0k/ne9kXnlgQfxbtk6M5Khr
X-Gm-Gg: Acq92OGCvrrWDsRdljKon59f8ppyPCeGnsueLafpQkEoZe+YC+11g4zNJEXa3RD6jPq
	b0jayXMrKCbJrvjfij7JTPRsnIuSq85KaqrAjT4BxsD42zA4KCG1hZRSnqO8dXDHMvcPZtYjIje
	LgWZj6tQrcKlix90R/MgAAWbrn/s/3TD+6DoRbzRus3UNbEr5rDUa34XVqDuasfY6/1ZFsRBLff
	VM1o14MKzEQwYEnOWLp8nKgXI35wUxn5vsyWCKn75e/wtKG7omRxfFYu5xrYmI5KxiuE9+3yHEE
	Ebp9855mDzvVccM524NevcuJIbKBlFn5YQ/s5M2YLUWM3rFdm3Ysc/iB4pOJURflexaSF5/YiA8
	HcI7fQiEg2MBIhHeuriL/KSu7QnhSNBUK3Tb1jpbx5U5lvRXH1kjCHCfOvg6c8g==
X-Received: by 2002:a17:902:ce92:b0:2c0:db23:4a4 with SMTP id d9443c01a7336-2c1e85d210amr216325965ad.36.1781000601659;
        Tue, 09 Jun 2026 03:23:21 -0700 (PDT)
X-Received: by 2002:a17:902:ce92:b0:2c0:db23:4a4 with SMTP id d9443c01a7336-2c1e85d210amr216325535ad.36.1781000601193;
        Tue, 09 Jun 2026 03:23:21 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c2a4a64e22sm14738915ad.61.2026.06.09.03.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:20 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 15:52:56 +0530
Subject: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
In-Reply-To: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781000588; l=1339;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=QJT8DDYNM9+tXaQYnEtfZjV54zYFg9aRhXLBf3w5u+0=;
 b=3h0mZAEUpF/rhebZrXu+hNdRzw8FWH+U67b2o2lspttI2wRaKXiA/eU9w27Mwj57HyPoDSpbc
 VjtQqfyRQuzD+5rXX6IRk0QiC8ta27G/AqOqHViUeWZH/VExq3rRW1D
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-ORIG-GUID: svVgg9pDn7G46rQULj3VmXYelXQ6bFc2
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a27e99a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qfTCltTXssArUCRCFzsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NiBTYWx0ZWRfXxm68gQQzWC26
 Ct283SnksGj96XzJAFqfwmxJoETjSzSd3uqY3/6XFZjitDm1BxK1micySpqHxVq/EOla/FQTvP6
 XCXIKoJ5LBiN9yUvsrPfyY6zbVswREkmSHqDe5h4hRsQG37S/gvXNLJyf6lsDtO4mz+lZ6agY/H
 3JVrpjVqKqQLqjnLvoGOH/x+KHR2dqzrUES6zorQm0oDNyzLg1X5lv67RrbSX9r79P9gb6ERw/t
 ZX4lHzT5VEZnahxtEgPBeqhK5Wt1VXoPufppmUUD+3X04U93G55YsAH8aYqHyCQO5VJJXBv8tAZ
 dNGj+GmXtDH8qHrvrYXvsJTmqondH/eaAdBxlwPn3EhdQx+c8/wOE9eJ/9Ks6l7Qy2pCEhOHsxb
 9smGrB5qRvuV2FsK4gKQyYjKC2iXloFyu5NrhEDsxwsKH1VtAsK2EV314IPEw4HVJwNW0PsYu18
 CyhlgVaomoZ1fZJ2i9w==
X-Proofpoint-GUID: svVgg9pDn7G46rQULj3VmXYelXQ6bFc2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112124-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 157A565EE1D

Document Qualcomm PAS remoteproc thermal mitigation properties used for
QMI-based throttling.

Add:
- #cooling-cells (2 or 3)
- tmd-names (thermal mitigation device names)

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,pas-common.yaml    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 4607b459131b..0d07a0750762 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -79,6 +79,20 @@ properties:
       channels and devices related to the ADSP.
     unevaluatedProperties: false
 
+  '#cooling-cells':
+    description:
+      Number of cooling cells; 2 for min/max cooling state and 3 when
+      selecting a thermal mitigation device index.
+    enum: [2, 3]
+
+  tmd-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      Names of the thermal mitigation devices available in remote processor
+      subsystem.
+    minItems: 1
+    maxItems: 5
+
   glink-edge:
     $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
     description:

-- 
2.34.1


