Return-Path: <linux-arm-msm+bounces-112300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BmgyLnoFKWq+OwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:34:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6F166648B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:34:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RSXfOBAY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QN5tTD3Y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112300-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112300-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0ED46301D69D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 06:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C050374192;
	Wed, 10 Jun 2026 06:29:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3845372B50
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:29:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072971; cv=none; b=ERM2skm+sWuaa7htMLbi+pjhu9vbCYvgU8syyWC6qhmLVzAZf98PPBkVUMlp/EP6S/sOSfdsnSUPm5JcT6o/riRX/VZO/fB0lpLp+rnSjgsW1Y50FmBHV37MVD9xSWELihl4AldWUBLLjBSisrYXu9dBU6iX7K3o0K6VHWC8pOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072971; c=relaxed/simple;
	bh=PL9zmVN8BWp3nl5/LHjxhY8CnaUHqSBGA85pMRKT9tE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m5YPCjQt1+6L8PETuOTkfBRSLswcR7JXlVf/PmUegJ/4Wrui1IC2zxfqqw+S53mI8DIw0H9AsWJSPTVRxYR9mOHFrcBiS9fiJNgWU45DeZItT5Q0COojQLROyU+U6SPc+U0FVSExEg87Jnoy9ToqYic6TDvN9OB+CJLDWuINUQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RSXfOBAY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QN5tTD3Y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2f7Bb323947
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uSzPiF48skHxSUy0gtWGpK
	Uh+MzE6AD343iEXs64/m4=; b=RSXfOBAY27M70ccj4Z3FsgdGsksoUGEqStojOE
	2OV5EbVMtJQ6s8xKj53yPFYVldxGD3oeF+G4o19LAbJ2yeRkCN7C2WBIgoJLB5Sq
	Xcz7SUBM0fgxu2vPDCLQRvMyo8DoENDbEonP5EhvUaf3wZp8UllA2jstBF06Ia80
	vbSI5yGeX6oTzyLdSOJGdpIDmt28wj4gcN9UCnlm1L0FNgaUQS9/vznE+KEW6BaK
	/K4kAerA4fcdov6Wk4SJx83V0gEahCR3Z0wXpAwm7JH8TT9QhaSghHKiduT2FC2D
	pU32EaHRYxjGGEPURZZXm0pn1C34u92BTLIKuhWXudD+U2WA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeawr3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:29:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3074d4102a9so3950933eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 23:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781072968; x=1781677768; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uSzPiF48skHxSUy0gtWGpKUh+MzE6AD343iEXs64/m4=;
        b=QN5tTD3YgL/wOauL2ZTAGBOr8J0AwROjDGGf13CjB48iMyorP+/I6LokyMNsV4MUqe
         pEjDE15wy82HRLShulMMESHTxmYw7Ulvr6PJEjtc37iAaa6vgLyW6UlaRNq25qLIYvd8
         4tS0zIVmFSDSwY2BGwMgJB6Xnxpyp3u4ZeDGpETiei25QxrOHXV7XFdsAMLaIJL7Z2v8
         8zUQPxvLw9oWxbiYoaFlGojR+RKx0u97BRYkR++1jvXBXmeMQeBjgNcl32tKh8YYJIYI
         DHCGpbW22fv+TSj9Hho5V8HkvmZfqi88HhAaCQ2tyB0eeGwKW1EguYh6/y601WcFLHNy
         y+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781072968; x=1781677768;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSzPiF48skHxSUy0gtWGpKUh+MzE6AD343iEXs64/m4=;
        b=RzkVP2YgkK6OOpLmXF700MEGRh+UjeMImD48Qq6Uf7IG2yNUx+jodoii39PhdZMM44
         Rx3hWwI7qL37/FancyqRiDHN0xkDwGEp4An2fKP7b7wNyEkwfpScfXnTaw8rbxGib8QP
         u5QQs32+zWF4pS7/FkEBGH7R9hAt1Cs0u9SMqqfFz13kAqlGlmdUSToVU1nhxZLYr5A5
         OpyDh7H0xsyCE1tnNMesX62FYCu5hi+aHkJ8B445vzFMoJ3jr5kLDEIMIdMOeOY5XgHc
         tyvn3Nlw60p8XpRodfnTsDP8/sLxrg15q+MRbAucjLph3wRWThjLIaDbCpAPgVp2dN2z
         4PEQ==
X-Gm-Message-State: AOJu0Yz2dWC/gCnl0b9TTZ27txRmIDYmBpsT+T6kbnutPGfG10X6kd4I
	jlaRA/5OSX2DBD7O+Sxw/IQNn8XhZoKcBdYS1iMzeDfedaVAaWpf36VUIeleRW57BpZIaWAhnUV
	EQe4Q0phXywfOti85wMQ8rjSeAra4cWjzCC3GqgafwSAT81nY19keE8B7FG05hGhm7KJh
X-Gm-Gg: Acq92OFwU5bEQiJLyz8AMPtfmI1ripX8hae/fq//qUcF/0slYx5hCVfw/k5eMDx6wOZ
	HtGVlsBTkcZ02aYeMn8PNZiJByHoaTwa03P8MCKi0cNKRHKzZoE0pxVa3wIZ+QDIMlHqtFUM5Pp
	qMG347Wd3OtWMQ5ME5ATvuHYx3r8G6+r6Ij60bSm5PaTyURUK9gHzmwvWgspVnqAiynfFxgeNrL
	5YNiw2vsxrbgoJUXXXGipZmWNaLRQ4N9JvDSmi7t0ms/3A9iZ5tnmuxB+RAqHmZrPrx85n5Yhgb
	nQOc6BCPGgcm2IQ09rRjPEf5TcxVrvhYaaX7fa0FQ3LKRgJPcsPZ6v0OUYGv0s1zxbfA1zuNYjn
	WNQ9XUwKo8W4GwJUbUB9zWxLInDZ7Rc9xfdIr5aGn4+CTHFkNLK+QYKm44bRsSRD6a9eESjALPC
	XzYHtyCJX+
X-Received: by 2002:a05:7300:231a:b0:304:8366:9fb6 with SMTP id 5a478bee46e88-3077ae70f45mr15817123eec.2.1781072967708;
        Tue, 09 Jun 2026 23:29:27 -0700 (PDT)
X-Received: by 2002:a05:7300:231a:b0:304:8366:9fb6 with SMTP id 5a478bee46e88-3077ae70f45mr15817103eec.2.1781072967160;
        Tue, 09 Jun 2026 23:29:27 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcb98aasm23959540eec.12.2026.06.09.23.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:29:26 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 23:29:24 -0700
Subject: [PATCH] dt-bindings: spmi: glymur-spmi-pmic-arb: Add compatible
 for Qualcomm Maili SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-maili-spmi-binding-v1-1-80fc4b6bb80f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEMEKWoC/yXMQQqDMBBG4avIrB1IpYTqVcSFSUb7F00lY0she
 PfGdvkt3sukkiBKXZUpyRuKZyy41BX5+xhnYYRiakxjjTUtryMWsG4r2CEGxJmDEz9Z467tTai
 EW5IJn9+0H/7Wl3uI388THccX7Lg/5XYAAAA=
X-Change-ID: 20260609-maili-spmi-binding-dbecf60b498e
To: linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781072966; l=1220;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=PL9zmVN8BWp3nl5/LHjxhY8CnaUHqSBGA85pMRKT9tE=;
 b=G8H9L9VJpB0S0A/Igoc5N8iIx8H24F9vRhJKlJYF/ozewAxm4adfbUjpflfNJxrj29kVQ24tN
 qVm+lENLFIFDIfQxf6W4DdQV9SVxS0ZpmseWKGz89smCo6LIr2CLyof
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-ORIG-GUID: i3EdDgPAuqfl3DbAmLvo6-9Jruowg8sZ
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a290448 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=w-QGtfMo4T9X6HggfYsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1OSBTYWx0ZWRfX+L3kb+lfkO6G
 LVPNTazsczLmwy/E/yR+acHhnx6VJp2Zz7G3zslVuEDs/mUWwuusQoTQoP5f6C728bxggh06s5o
 VVSqpnxbBb7IKtk16KCu6aQCnkUPFIAP4zFylPbioJPi9puIJACrwh9W3Ftx1PY6nX9P1zp1e/w
 CxACs390ncUuogbQkR4FgswACSPWOkWosWgae+meBZd6AXtYvt1bDnSWUmMHDyX5ZZK7baEBT40
 VtYxLkPv0JqMg5WOU3Ma20jmwq9vnm/5oMS2i+fBbFT3LZQ8vysaQsSIUdJLUwzYBeVQxlyS+JV
 i+gMyqKwLCUS+hUNtQQ9c7AmTRxncAhKLrBkX/89oNLvNPETkEmlH38u57zQWdq7w5orFkZYixK
 9o6pmDA37jOUGBUSyJ3V+Zt7XcuQcnZ5GdRABWQkIbAqzHW3OmmBgN61HiTXafIpKzuih7ztcVX
 U8ogQqM2jkb/2ylOIpw==
X-Proofpoint-GUID: i3EdDgPAuqfl3DbAmLvo6-9Jruowg8sZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112300-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C6F166648B

The PMIC arbiter in the Qualcomm Maili SoC is version v8.5, which
is the same with Hawi and compatible with Glymur. Hence, add a string
for "qcom,maili-spmi-pmic-arb" as a compatible entry for
"qcom,glymur-spmi-pmic-arb".

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
index 1593a1183a36..44c864fd5fc7 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
@@ -27,6 +27,7 @@ properties:
           - enum:
               - qcom,hawi-spmi-pmic-arb
               - qcom,kaanapali-spmi-pmic-arb
+              - qcom,maili-spmi-pmic-arb
           - const: qcom,glymur-spmi-pmic-arb
       - enum:
           - qcom,glymur-spmi-pmic-arb

---
base-commit: 3443eec9c55d128064c83225a9111f1a1a37277a
change-id: 20260609-maili-spmi-binding-dbecf60b498e

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


