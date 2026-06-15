Return-Path: <linux-arm-msm+bounces-113108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NKNqAsu3L2osFAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:28:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F777684865
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:28:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YLRo3ZIl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CKj7gori;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113108-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113108-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D910300538E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F7E3C4B81;
	Mon, 15 Jun 2026 08:28:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0983C5539
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:28:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512135; cv=none; b=cnBPYN9tAXdSZB6ujymn9EefjvdVPoHfaIJsbqGKyaX3cEklPnjHgeFfDz2RXa4I8lRW0jZlzV4ezyzCxBOtQW8EYTv+8ympDtwpNCzbB9v3srHFoz70HtDX8ogB51GDXs4H4AyPFOhrM/c+0F8x72PEpGUFNJzLpsUeP599YJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512135; c=relaxed/simple;
	bh=57bB5l5OK8n6o1c5OWSoQFZ2wojidl/jLh0MiaeoEfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UJSRlyorVO8/6lgrckiPSk/fYActuVOjef6wad9aD58JxvhU5GOiN3ZeRZQs9lyu5E2DD6T6bA+03vDUD0irDVvLcoWrSFeAIWRid3+axxTfcSM5c3SNP/7MpIMTJZnzqBUcghWy6XTRt5ANw3UhGCf+d3N2USjyUxPkRR8PKMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YLRo3ZIl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKj7gori; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6J8oj3250401
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2DPijjKVJJulhCP3CCPO4S
	e+11jw/WqYtbv3YoQLPXI=; b=YLRo3ZIlcHPvTqQEM3d1U1lfAj5XKIGCsTPuee
	mFce6iD4l7LGNhhnZCuzVcfsBDh+liM3fdAmTpMQLvOlOmA/TMGtO9xfbpE2jAk/
	3zn1QJIj+nZq5k8sAH0cOHC+1BEl3YKvZu5+6iufZr2kfgyOX721vAeVQfhqegPN
	pVHf+iHxgUm9mJ3iR8DqFv+UqcAPWapiUHzVQpxFXtPKv+M3OLMzhKrZhQKf2HNA
	s+SyqkdvunxT/QeGp3jaycecsQqF/ixqWP1Ksg+F4Nvd2dzru2l4/QzxFrw2ymL9
	Eg0hbmb3Ndy2yNLRzZu79MNN2XsFxdx7YACuFtO3C0t/8ApA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryybxaby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:28:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso83882875ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512132; x=1782116932; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2DPijjKVJJulhCP3CCPO4Se+11jw/WqYtbv3YoQLPXI=;
        b=CKj7goriQsUpsyUv+HWjTH2o8ju2rMR37WY72+O1M26X30isAClkuRSzHBfDXAPPia
         n00F7j1RAY4kdMkPtgpEuaXAtNqvM1k0eT9x3Wo4T6XsTRUiOktFe8s9tuxEzlrTPzu1
         VHdOhiCXoi9C2OfJbV8MnGhgDDmJbriK7rOxwrAdj3ro48LjLjcPJM0oAszlrLKTtggY
         u6WFuHpvqacnyAaIxs8uS/f88DWbpgi8kNBloDgiTuSrZ9FEmHZyZvSimZQTPaeTd5/W
         zPBqc0NwweRbeqVMf3eiI/tWU9z3O/92i5uuU5O4LH2SogWTCfr4ja0yjiIyhgEYQ5hv
         tYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512132; x=1782116932;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DPijjKVJJulhCP3CCPO4Se+11jw/WqYtbv3YoQLPXI=;
        b=hWVnW50E1WniTgFcp5k7Q4xPZ8caWot/MYY5Ib/3aA2uk5lx03BquYCuGhuGydsxBs
         q9QGXafFlb7ETwhefc5m17shw3Q6Fz627rZ0bMbzoaanlhWUp94OGP4bwedUXVUTN/v/
         Rd55tD6PU7+Y0pVInvTseKu6Ogb2ycZ3/KV/HsXvRpVmWxoTjMDsc5wAWrn7RJZ6sEUK
         XpqGyQB9C6oTWWWrCAhB8wQXFwm+DT7daStf4YUkP5t19GnFKN6xiIbU9rMgeP85QWx7
         El9tC6ARnA2qW8OI2R6/+Z7VaJN8qhm64FLaO2Q0QN1XQlS96Mv20q9oIeHFSdD4DjiI
         8XSg==
X-Gm-Message-State: AOJu0YyIJHk23x/3XOPSG3pWOdINPnvWrT3XLux79JeSIb7T+79AOPES
	7MST2Gouwt6yLJVmWsLLiPrpG0Xdf8dZRcOHJO/8s9nosEFWM6kmTRjDZwQCapJs/xj1v+NfidN
	zJQYYlQh39HsARQT8qKgJkYzLzeDn01ayTVLntEnERHled1XoXmVOazHUtIS9YXAsA+Rha3KM+7
	og
X-Gm-Gg: Acq92OGNK7d1qSEGrS4qCP75LuT6O1cxh02qzJMJEuGbcMHmQeXO586wqOGeO7Jxl08
	cBKu/iRD8Ths8sKlFA7HkA/BtuRVa+DRhEyOTVzQ2voFkSTxOyiVFVGJMWpLffvPifXLACLi9OR
	iJDHWc1u6suTU5h4klzQvxvpqdAyDkPm58LwMSQ6zv83g7RK0AtyE1UtjzWZ85d0OUBjHYczCqo
	XZquOwlb09ULl+jYjsQOQuKBzZkfcrnhoYlfDr5gPKDqQrZFMsW0fYdpvK7cOMLRopcAhVGqT69
	TI/JTfi+57bDECcm4B6ku28zcaI54F9a3I9aA1vYj5TXnWo05xmYWtJigfWIOqIalQzb8Yctv0o
	knoe6RjmYH9qYZY06YzSFq+savZJ6QD7YSzds5hawZzXaAA+m7wfv2wXfTC8vqg01hu29SloL5/
	GLaBnK7Pr7Ggtu2hc=
X-Received: by 2002:a17:903:40ca:b0:2c0:d097:51bb with SMTP id d9443c01a7336-2c4109ed48bmr145622625ad.1.1781512131852;
        Mon, 15 Jun 2026 01:28:51 -0700 (PDT)
X-Received: by 2002:a17:903:40ca:b0:2c0:d097:51bb with SMTP id d9443c01a7336-2c4109ed48bmr145622355ad.1.1781512131469;
        Mon, 15 Jun 2026 01:28:51 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5565sm93853825ad.1.2026.06.15.01.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:28:51 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:28:37 +0800
Subject: [PATCH RESEND] dt-bindings: interrupt-controller: qcom,pdc: Add
 Maili compatible string
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-maili-pdc-v1-1-add21e8eec3e@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512128; l=1087;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=57bB5l5OK8n6o1c5OWSoQFZ2wojidl/jLh0MiaeoEfs=;
 b=Im43CUcZ4qa0YLzPtSN8CUqPz5NL9iuaZiaWPYbQLNh/MbGXn0KUqz0LhmkfL7VyhThyAm4vh
 jQXJeYh8D2JDgFuA5zM90tbqV85Kn0/01EwGVK85ojEitMj53AHY5Ik
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-GUID: 0Tllc-1dCz1GGg3DDpn0UU3STfPT4Cqg
X-Proofpoint-ORIG-GUID: 0Tllc-1dCz1GGg3DDpn0UU3STfPT4Cqg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OCBTYWx0ZWRfXwEucWA1pKb2U
 CKUO9BuPjndyFQUeQGeEsO6ho25lQvRTXg3mIeB1kFFWlHDR6M2/XeCHQQv0M0XA5lQRROQucSz
 r3zQHHR+dsfkn+QFoE4QWOTp3Q5n/ts=
X-Authority-Analysis: v=2.4 cv=JLYLdcKb c=1 sm=1 tr=0 ts=6a2fb7c4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0TWJLbmp6Z9Bekl7B0cA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OCBTYWx0ZWRfX4DkGVz+5AQwy
 VZFs+tbwMAP3RmIRCAC/0gqm2PgBInaaBQhhol2UldbnvWCHMXm2TOu7enGVvcOMt9+EeWRSz2p
 wEvDXmKv7bbonNynAPfv+iI+g3+Mlj+M4kZlfQ7H7oIfV3e3a5eZ4DGzpzcCAi/zt47vSQmqEU7
 lB6z4gtEMCnaQ56zrrAfs2zlIq1X1mb2oORatwHjqWzIVBarUqD/kbfeHQLWT3p6ogvaz8TuPXv
 Pw62eGAiXGTh/Ee/ZWYS8f7d5uVashI2b1YrNlOn3g4RlfcHEEYX2lTGJYBQGmrCSF4izib0+NZ
 0lqNwECt/nPp+8Zck3U+vajBIxKiAEtSTsJ7Rr5EbM+vUeClsGjwPecwKjl7193LlLimTFstsJ/
 q88z8OBNDvwG+b1EKLlP9FI+aeXRxUiLJaR0dfmUi/nA++X7VW3n1APEPirKsnWlq6rq17qdluv
 gAG/7GXeWIVXgJxlOHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113108-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:yijie.yang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F777684865

Register qcom,maili-pdc as a supported compatible string for the
Qualcomm PDC interrupt controller binding.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 07a46c5457a4..8162a49d49a6 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,glymur-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
+          - qcom,maili-pdc
           - qcom,milos-pdc
           - qcom,nord-pdc
           - qcom,qcs615-pdc

---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260427-maili-pdc-71a488a96973

Best regards,
--
Yijie Yang <yijie.yang@oss.qualcomm.com>
-- 
Yijie Yang <yijie.yang@oss.qualcomm.com>


