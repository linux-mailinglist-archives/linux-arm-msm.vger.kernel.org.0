Return-Path: <linux-arm-msm+bounces-104814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SA/9HiG172mFEAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 21:12:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE794791FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 21:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FAB83114319
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1282A3EE1FE;
	Mon, 27 Apr 2026 19:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkXOJC3S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cao7hLRS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37FD3EF0DD
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 19:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316788; cv=none; b=hrD4OFh8w422Ke/3Mt10fzD8ZxsTQ4h7xLfGpyJUxV47/MUPsxYvOV20CUWCo5DknvXvAcTIGRwMU4K5bVYWvIDwCf/bMmCiDbD3VIbehligdgrzJY/lwTY/paMb4kIypxWs8CKIcTWvVMO+BBjsXBVEHjssLdHZQq923ezAYzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316788; c=relaxed/simple;
	bh=QKU4OfXa0TOEBsC5JX3T4fZUwzwDcxMp3Mj/5ntsANk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AfWCLnVpr5lZvw7h1Ql5m2y1c9AmGL6I4mi/TKisVP+3a88oo63UXtL5zBD3rFdWuzDOdSg1WwCLOR1vFvI275NfRhsvhPXesFxGnsNelgjJU6X8HeojUhUZ5nLB9Fo3sy8HPTW5rMLgtB1sAOX6Z6sRBSkpo8Ii38RhRM1AYuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CkXOJC3S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cao7hLRS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RCYMGY428828
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 19:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UFAu3zBWkMxN96L2kkrvsJNpW5eSvMVSmG2
	pqDdD6Vk=; b=CkXOJC3ScnF1b6LvFD42qEMRXarm4bMQiX1VBn3nxTl13qlBk/c
	7gHn5nB/HzOA0ZAk2J6coKiWslajHQRFBN31gNhiLFRUc4a8W+S9nybpBQg/p1TD
	dxjALWh1APriYDwW0kbD8E7vBFBQ6Wfkxv3vtXqCN2zXIfOPo34jCG5OydGLCmY4
	RQXA/9by5lQdoUerMegcna/AYFCiXY0yEvNy6BcTnum61ozqEUhg4Fu6E/77a27d
	cLSDnhDKYMdm4wfUvWvntV+9J9nkmORta4L7VL0b+tMC18afYj2OUL2yNvwKJP+C
	2E0XvIFYbRDPOcSjo/L6fqc1tpZJlBMtKZQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x31gq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 19:06:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35fb6cd0879so9610887a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777316784; x=1777921584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UFAu3zBWkMxN96L2kkrvsJNpW5eSvMVSmG2pqDdD6Vk=;
        b=cao7hLRSFIq9WFBOwOaoGeb2HgL2rMuTcV8m46IBj6FhvdFJQPrQ2s7WOn83l/DKCF
         0dvsgM6GALYCTN2BudKuna4qJnQvwD2ETBt2HUu4o797oCYQPfrZLLeL6yAw3FmkeEMV
         mHsgewTE0iJ2KTzT+LzNgkeSKW0eBaHYIZ+TC2nl8LPWZkI4biVxa+JG5KTDWdAg4Jr4
         vICOtdNVOtzGXluR8gKqpe1YMLYzzKTtjcdPHvxu6Rm4Tox7GLHlz3/LkzdHtoVIgtd/
         +HFPd/oNBVP+vfvwzCZ5W75z86v2CkeU8C4Nf9a61xdfLkzukXsLGwvPckKJlG1wWOCN
         aAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777316784; x=1777921584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFAu3zBWkMxN96L2kkrvsJNpW5eSvMVSmG2pqDdD6Vk=;
        b=WKSMgl4dcKOpsIc52bmKgsl0raz/jkToI2n1nHoKsmFo0SPWgIrGo1H2hEnHBrlPqO
         4lY1vmiHOkxFU8IoBrO4Rc0eXHavPE6xYtu/+BmucoAH5C0+cFYFiIl8jPn73EsGxTJD
         Bz7ts5egbw650aFBoM6HJfAkn9BLgoLFRRplN0OuavboHj7e0ZemYNi9fDQZ0rBeTvOy
         nFluZOhRxgQrjQxLvFGK48G4DYzr9x+FUcBbw9WwSFggA/zGGZsDDmNygYgqlGNmqPRe
         ocRZrBOsFUZ2uX65X4xx/staoU/RasJo68TOlNwmxrAynzsoEtHo517PFtFKauYaPo9u
         KS/w==
X-Gm-Message-State: AOJu0Yyh5ov5MtvdZ4Cp1ZpTH6bcnYDK6MiRSzcuW4Sm9luQlVxxOvHI
	KfXuLPAxzSAMdjx6+nTFdmYC8p2nKCs18xggSRNtR/KvAHBtxltaaVQD7JvzQkbg9iUZoMUb8d0
	RMEOatIJt2CP4EyxEHXCWUQ3Rtr8nLmM9ugrNdnIEaMTd5+stAmG6vtd0O43N0WG3YTKK
X-Gm-Gg: AeBDiesmnvHvrKxrhdMewd5fAVODMmzl6V4GNFLbLDW7FOJRhNgMHVgO/v0Top/Gtto
	jRdxTpd23SLK8roVhB7OJ1PhT0p/qUOpottSL2VjpezYisxm1Jp6kHCr3G9QY6nwOlU8TNRbadF
	9OFtDUiwrTSemPd/NTF1a3AV081Ej7DZ1jjCeSmaqrenlq2X5A27E/gCTFwUNyKWlEqdWMgLYGy
	HanSdKU27MQJEfLqVgjPhYpuhq1zYTtiqXMCIUToi0u4iQTWIbRrIBHkiYBALtbCEBePvGT2tfL
	deG+MTvue0ErUwZTqGMGW8a2aNTJfqqiiqcSOWK+1oPqbkXt4G7q+v5xMXEkoYcrFhGj/yNH3fm
	DhYBRzDnt4ApMqdpVFljRK6ItgtdZGIM9nA5Cv4BgdQbrPq1C85P/ro/5/Bg=
X-Received: by 2002:a17:90a:d2c7:b0:35e:3aec:718b with SMTP id 98e67ed59e1d1-36490cb01c4mr291117a91.15.1777316784152;
        Mon, 27 Apr 2026 12:06:24 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c7:b0:35e:3aec:718b with SMTP id 98e67ed59e1d1-36490cb01c4mr291071a91.15.1777316783547;
        Mon, 27 Apr 2026 12:06:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490aa527bsm87306a91.3.2026.04.27.12.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 12:06:23 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi ADSP compatible
Date: Tue, 28 Apr 2026 00:36:13 +0530
Message-ID: <20260427190614.3679937-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIwNCBTYWx0ZWRfX+oaYAhtK4ZMj
 CN2Xoprp0KAkKVXtUbxGDyAk1BDU50J1bPB8+3ZQOBv/EY5/evn50q+vo1TFp8lfgKsHDdaefun
 bO4PIKvVghplK3nlZPHW+XGt60emPozkHcrIfElS764f6Sp6IdFXnAR8jSVf+P2dBXh5TEXNwYW
 VtCV4MVp2Y1pdaDSqq59yvsn9kypWOuOJOt6Kb04PDKfmXhKPDSSrayCXCt4mpHmXmncO4dSeGU
 yfILPOWP0QZzZBomGjCKa1e8Ne40zO5FmKi2nBx8sR34f3TYpIEgtdQRft9V343NmddOjcsYM1j
 L0+AG21k+sqrAVikL8q3UOIW9XptHx8BzUpXFA+tVKIcFeBDaRnhPhgioHW6x/+T4uxa+aqAPLT
 GRdC9TLMIjzZ6bi0WZBDc34KelCcuTtQeoRjuYhPuj71D3oWVzDC4REsTIH2tETk6MTY4fmIarf
 EanDytIPRHNloCAtZxQ==
X-Proofpoint-ORIG-GUID: RnEy6MzsFT9WCzybASrilWpKbbvBjcR0
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69efb3b1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=iOP-JMljhTESenzhlaoA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: RnEy6MzsFT9WCzybASrilWpKbbvBjcR0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270204
X-Rspamd-Queue-Id: 1FE794791FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-104814-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Document compatible string for the ADSP Peripheral Authentication
Service on the Hawi SoC, which is compatible with the Qualcomm SM8550
ADSP PAS and can fallback to SM8550 except for the one additional
interrupt ("shutdown-ack").

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 1e4db0c9fcf9..161e9b55cb3e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -30,6 +30,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-adsp-pas
+              - qcom,hawi-adsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
@@ -104,6 +105,7 @@ allOf:
             enum:
               - qcom,glymur-adsp-pas
               - qcom,glymur-cdsp-pas
+              - qcom,hawi-adsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
-- 
2.53.0


