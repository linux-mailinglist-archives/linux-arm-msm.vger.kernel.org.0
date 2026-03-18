Return-Path: <linux-arm-msm+bounces-98457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kO4UJnmdummHZgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:41:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 038012BBA96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B50AA301CDBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C4B3D6682;
	Wed, 18 Mar 2026 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RL17oylc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UC9EXpHW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BEE3876BF
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837678; cv=none; b=TK40AKmf+TVGfqq2PGxS/NMRIj13hlxS1B5L6V3YdCcVxso1tiG0apO/DBXNMfHMjXcztyoeAwr97M01FG1FeJX6m4CeLDQEVDrVF9CrQ4FdzuCtWg64EnSIS8/5PqQffb0giYlVmRnEPgkQV2yIFMWXElR7HhyAeLC1yx9aXwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837678; c=relaxed/simple;
	bh=J0IpU+kJNpYYUbOaj9NrQdGZt/mXePvosW2Xp/FdJTs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HI4lE3BAvE6+LfNnN5Yyn/p3EnNeIviH4vnfxrusrovj5x3BZfL6ciZkU/t4ji5753d9yNpeycJ5BA8lhVgMnlOROfSbRWiswseooTOAP5xId60cPKSplXpblZq3UxEbaUGk813XZ5wj5JPNGpob+68pG18Y+XvPPUZImsigUdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RL17oylc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UC9EXpHW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8oMN2084892
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 12:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ln53uIxTEA/
	vaN63HgvG/2g8kfs7RZK/qMkA4dh6exA=; b=RL17oylclaQyvTchOIxTUlWO2NP
	burLA0rIc59HH0ykIqWfOxgJqRrZRbkWKetdcz1iL6DGNALP4Ap+6BF75Ibcecei
	TUQfAcEEidcs1iRcnMgfJMp8gFHdTNanRg+SPwKwjD2I28Psxndqm7jMS0XX5VL3
	//DRe+o01PsZDNLmE4UyZA352mvjKm/DKsuLaQgk+01XUimqDNqyQw+FQS07Olve
	mHWINiQOOVGRDIehcYeitGMJktAszsWnsWyKuGV2yVqYwX7bbwDw/4KwOpcdZWvq
	OnvQyNJ1h83i1e4x9XAR3GiDstnSAEJVHzjJTXNrdz5uYFxDKfYeCAjlXAg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cykqet8h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 12:41:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bda35eab74so407585eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 05:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773837676; x=1774442476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ln53uIxTEA/vaN63HgvG/2g8kfs7RZK/qMkA4dh6exA=;
        b=UC9EXpHWC9LhSLIdKb0+W5uV/WLC1Tm7GCCm5ZlUBe/o4droLimCFKBdmW9AR7KVKy
         Jh+tPrqjt8Khsj8m9YHdPw+23bNbS7AXIJD4iZXPFOBDoD9ZQA2p0Hon3VTlZZXFidBU
         P/e3IH7PiA1fk/NF/7Qhns6YRaeO1r3KsKbXt8tBmbgDZyow3cYyCYEFZ3JvZx0TuD3j
         4SY8MU6Ah5GxpDF5bydVmii7lNFRQ7XwiHO1xGJCudpKH3BzwTjYrd/+E0N3+4Spi2PL
         JVqK4N7wW3DE8oCTbNt0oFZcIkkPa/cnajGWdk9YI4UXerZnChhXXaeMC+YlO+bsOA+Y
         VIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773837676; x=1774442476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ln53uIxTEA/vaN63HgvG/2g8kfs7RZK/qMkA4dh6exA=;
        b=T0NXPO0f2KOz7uHv85DM+b3uNQpEBMEh9dvhEpHDPlmyVtRdWjEk9AmGAnjXpmNNwf
         v0ROu6nzx2qU6AwyDivKgzJ+n4HtdtbMNRy+0Bkzi2OHxqSkvKTkiv8w4FwpAlr5cx7Z
         ZAOmW+NcV8kVcHvVU9B9TEYFSUZXLa/KVYP02hGATDZ2VTTcV4ptB8V6A2k8Inv0lrFI
         CxsjjZNM17ko52DYxrurfD1M0y6FHp+UX72ow45tNJZL/euQnSKZ5ZCeO2P7Qv1GL9Kb
         bAnOtGev2XPp+G8q+WaJDc6PNGg28Z1s2WcN8PX1UWI716D0pZwKQdmrs4/aJaT7QL9K
         aFCg==
X-Gm-Message-State: AOJu0YxtiN903+kPigRN3Xrwojq1ybSmQjbYulQZxbKBvlxcAjTOj9Dt
	mEJadQ/dnIb18wlwjzMNw4IZaedW8rBaGxf7q75K9JbdZSZnmUehL+FDf36QZyEKBQl0c/kgBll
	8f+gfYM03JlbdQ/poKiUfSyoU/9BjfsdfGVyFaTrccR6mvD9Oh9CTRVNOKAILOyQCCNtk
X-Gm-Gg: ATEYQzwgIxp2LYmzLYqoeIVoHG/JGR3xZJDz/4OtJVZ+V6ekaO4Eaek8katYxFozQlH
	UY2TZgZGO5QOKEFZN4ffVljuRVlmao6yS3GCBTIXTS/eIburw9qpRN/amqsqT4KifmzJoRdvHVD
	jQnPesJLvXaWBU8A30yipMzl8avgpoZemizsiwTORFDRmDzLARsqHHPvjjHzG6KaxjVMj8HS8FE
	9IbpDtqd+O+m6nKTI0u9JEm5hzmFBpmsD8uj0EgC1QVHxYmbf+Dm1d+uDEeBKKcsuWBjuO+tWtN
	t+pN/UAwPXLw/3bRV4MfQeMAGmyEn4E0tuFsSsDs9p6/SBqKfbGvucv7ppszD6DbjAStgiztiu7
	uosTes2YVWgiu+jrNerH7sJqdxTxnUoBXeyX3wE0Ndqzsv1S4wUAl5bd223GLFIFtaEOCEn+4Qr
	bYnN6lM9bGgg==
X-Received: by 2002:a05:7300:fd13:b0:2ba:9cc4:aebb with SMTP id 5a478bee46e88-2c0e47efbf2mr1311252eec.10.1773837676134;
        Wed, 18 Mar 2026 05:41:16 -0700 (PDT)
X-Received: by 2002:a05:7300:fd13:b0:2ba:9cc4:aebb with SMTP id 5a478bee46e88-2c0e47efbf2mr1311226eec.10.1773837675379;
        Wed, 18 Mar 2026 05:41:15 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e53b5fa1sm4454521eec.10.2026.03.18.05.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 05:41:15 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        pankaj.patil@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com,
        qiang.yu@oss.qualcomm.com,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Document Mahua SoC and board
Date: Wed, 18 Mar 2026 05:40:58 -0700
Message-Id: <20260318124100.212992-2-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318124100.212992-1-gopikrishna.garmidi@oss.qualcomm.com>
References: <20260318124100.212992-1-gopikrishna.garmidi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEwOCBTYWx0ZWRfX5QCusUWOWWUs
 11zPajD2Eb6N1PwLUiPbW02DdCuceryt3nGkz2Etg6CLYLUK/bNPOT2LMLm5F0/7TIdOMOERhNj
 /WYjUa4UUEsMHCA4T1ek/Mx82fJlugzva+LxT1+O8M+az00+/b1//t2UxHk3YR4a5tPagH9KJUm
 gfmnUbBFmKNX14KbIoY+ukjqwo7CVJUl7FJagJrMKFgiWLwZG0zgi2riLIX4aiCOaf0wV6mXirN
 MmA92//WRDeHh+90aVfySLB9NQBFesoH/+99noWmWzLhbK0dbkNneYaf+Fu83kakxTVXlBeKT/m
 Jci5W0UUwUxM+V/zCXave9mt/PKzz9cjLpjAWMFa1HlXRiVTd4qM1aRWDOo1Y7ehQrEKUNpjk7p
 Ifbhvf4WCsFn254MKKFupG9ml95uuFOgPScu9HAuaAQAZN/RfApUmR/ku1TQQ6HTUy2QvkSgyoG
 NynoMo94gUz/OmKALjA==
X-Authority-Analysis: v=2.4 cv=Cd4FJbrl c=1 sm=1 tr=0 ts=69ba9d6c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QEbT8_BQrpgYwvZUqSkA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: EJQz3LDVJqk1pChNsTbVEvcWSZC4HKPP
X-Proofpoint-GUID: EJQz3LDVJqk1pChNsTbVEvcWSZC4HKPP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180108
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98457-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 038012BBA96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mahua is a derivative of Glymur SoC with the third CPU cluster disabled.
Document the compatible strings for the Mahua SoC and the Compute
Reference Device (CRD) board based on it.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 34a19e664556..be104b4be7a0 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -66,6 +66,11 @@ properties:
               - qcom,glymur-crd
           - const: qcom,glymur
 
+      - items:
+          - enum:
+              - qcom,mahua-crd
+          - const: qcom,mahua
+
       - items:
           - enum:
               - fairphone,fp6
-- 
2.34.1


