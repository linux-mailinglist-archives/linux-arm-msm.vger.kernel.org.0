Return-Path: <linux-arm-msm+bounces-89994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kE+jHZ63cGlwZQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:25:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DF50655F58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6439996480C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C65427A06;
	Wed, 21 Jan 2026 11:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="joYaf2n1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fim8HzB+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE823D333A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768993730; cv=none; b=TSjZ41Byx8SkhCshV1bO+ZCtijAYCFMBb1VzBQxYh2GLo0tLMo4PQP4ec9rqLUNg6MxYpdWbQrAiQpkjt3rt3cpYQHVAGHRMKXtH/9oVKlal52kD5QaWWKzXgBHZRdcnWJxH8b0MV7/DEDxj/9lwxxX/KxJ5XwvIe3KaIjHxmpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768993730; c=relaxed/simple;
	bh=ttuuT4a/yce/hPwLos4F6FaJOgKfFvjfty/guaeo2rU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lY4VsStuNqvicVOkO+2V59KhwRVFSC17qHtapBY8I9YWIkK5ol2Vt4dAdzeUg11DDMDPuSRcyr62xUwTudhRSj+CbFNb5o7w1YSGLdzVcoVzANUwtnqu4Z79hYdrhEbhKkhWmtwwV6cc9uw7v/Y8LsxEsHz3hNFBKh+TfdQtru4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=joYaf2n1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fim8HzB+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L8vFYI2946315
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rqxtMdegpYHYw32YRg3oTU8jud9UIt7Jz7U
	y2WsI7vo=; b=joYaf2n1I6RHD6BrSYOOGLveaD/gwN+poHv3cj6vjJXNp1CD4eU
	Fz5TPuiiOv9BGhdvrAzxObJmZRZhGta4G3nvwbcVBxGHuiBHDk3Y42iVvJMFTPKg
	jmtHwtfa92VlolG2BztubCoMYeB9JlyYbaa+86IVLv8IIlAUj+c63WWhXinwYdk3
	LJ/pXQLR4ABnHKzWRzcWiCV0fzQZCzjN9TVuHFnc3wEvg8vtcmhiB3oREm3Q0e96
	69E/quqtP7QiSCzOkwPSr+VHozMAcl3794tTKz6fGwpUkVCUIHdxcYQNNb4fBf+A
	69qH+temF6Q7AZpS6O/CPPlF+vJP54B7Q3Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btur98n9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:08:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81e7fd70908so11320125b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 03:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768993726; x=1769598526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rqxtMdegpYHYw32YRg3oTU8jud9UIt7Jz7Uy2WsI7vo=;
        b=fim8HzB+PjOcVH7E5lxY6sF2+pnmI+qqq/ujOErIka0iwPVnzNhRecI2tu64PIEchg
         2lg1zJS7HhtRfUYtC5ZvKoj1WU9gBqShoRJZf3sNk5TtqG0qdvJAaNazCjf5gF3W/m2h
         fbcSquBCMDXd+E3tDbGz+4ojCaEcCOqu511fHXuAj/jmeG7tFblHD4LMxEl7DwFEtKiK
         Giqdw5H2qchTyAmYglEKOTNCJ0mNbZWHFcNPSiZFlDYc8nHkFtLoNY6oMgefIgXn/bOB
         IJvpMXHqo9LPvMppvfuZnztdFT0MIM4dOHRALD9CZbUOIlhc7Lh75RYY2L1zOlWv0ewo
         OLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768993726; x=1769598526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqxtMdegpYHYw32YRg3oTU8jud9UIt7Jz7Uy2WsI7vo=;
        b=c81g8oQ79u9mkZ5APFpunQL6a2eSybMwGCC6+Dl0zqDKvs/aWEFrSMakm7So34Ia0h
         +YHZ9LBd7K5sDfpdTbmemgNWHOIuFLqhEhkCKlyjuWJmoMDEg2vtButTevEKwdDr2fCy
         obuR++r7826MBd+VDFRyfEv0aY0OANjY9guGZmR/2v57g34si5Wx7ODP0xqk7ne4KXj0
         LRTmMmBlUua3OL0tZHgnW0tVQltF0o+rNYF4zJhpl8SixuBxDlBEvkyrGfkgQxJsDZ8p
         DJMPTGh+1G/8W/ug6+YCIjX9Px2XnClC8WOIRKJrZlFYcGONO1B50dEVqQ46o1DcZlc+
         4bZg==
X-Gm-Message-State: AOJu0YyRk+YuJDvE1QcgvgoPBfKwRLq0BR0sdZPvSglBkYml7b9OZCe+
	Xxvm6q0YBRmmY6vrGlftGigmOozy2toNcwBaOEmVQO/bN6+HE2cjo8w7IgpmHPggNLn8bv0Wp7A
	DC3K8EQT0UAATA2oW9U2L6PLpR5ut9jGY2GwIEK0sbhZaIqKHDAzIB+gqgRjf2wj05Dcl
X-Gm-Gg: AZuq6aJaj+jLY2uLVUbN3+qpNKIBodkWT0b4tjEz+t42WlfWGt7Y+ORe0UJaM+lNISJ
	NmPEcO2W1I5nNN5NReR7HXMs8vcTHrjVlnwSC22WxOylELcduSuLehCqV7Q3ixzE+wE3W8V7J30
	UMvyIdabRaox7glsetWy+0bDN8M57ec8ztZ+wc4pQrcopFk5jkyyRxMz3ySnCctpQzcgh2U01cG
	2CqY7ezk1IO06BRvbLFOsx0UwSrhJ8qU65H5wWX4ocIoxHH/JBl6g//Oc5UNtljQCEUa52KBr7U
	BJDtM7kGCyOpGPH0PYYWje99p9OgXaHHJkhME6kqYGK15MOaOYe2C8IqH81i6CDRPy4AxWj+bU+
	4dGiPuSbTVQ4DdetAxhTaeDOwtP6wdtMG6b8nuU1x8k822zJdAll74gDkglC02kvytbMxy8Wz8v
	XTzldoPTXx3njGWzaSv6Ec6lkUoaOxIg==
X-Received: by 2002:a05:6a00:4299:b0:81f:4a06:702 with SMTP id d2e1a72fcca58-81fa036a8fcmr14849570b3a.40.1768993725978;
        Wed, 21 Jan 2026 03:08:45 -0800 (PST)
X-Received: by 2002:a05:6a00:4299:b0:81f:4a06:702 with SMTP id d2e1a72fcca58-81fa036a8fcmr14849527b3a.40.1768993724828;
        Wed, 21 Jan 2026 03:08:44 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fddd12fcasm6511788b3a.0.2026.01.21.03.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 03:08:44 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com
Subject: [PATCH v2] dt-bindings: dma: qcom,gpi: Update max interrupt lines to 16
Date: Wed, 21 Jan 2026 16:38:28 +0530
Message-Id: <20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768993708; l=1046; i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject; bh=ttuuT4a/yce/hPwLos4F6FaJOgKfFvjfty/guaeo2rU=; b=S5bWQ4+twbQlCFWR9QTl+iQPLNv3ciPUN+kcDCA2ER7x+ku1Q11XZ/4oJhKQalFs0fDAsaoD2 60RqhWVlwRqCVXjYFaGTSocz0TYkIB1XduluSbDUdtbqh8sXNj71WND
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519; pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5CD442NKCJB-sIyGBsWnMVYxIe8KJ9ME
X-Proofpoint-ORIG-GUID: 5CD442NKCJB-sIyGBsWnMVYxIe8KJ9ME
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA5MyBTYWx0ZWRfXwOIZhwls2IM7
 WzDe1J5TDoe0A1SsnRcc/j3CU9XGkGfuKDeRVUW2zQlOIB7KPg4xmrKmdPnQzAps3WkDszJVGH/
 5vLsB2VFZFKNFqxvdHYE1FthuPKiJomWZDUHr4LUzk5q/YkgbmqQaSF+1Y7vhUNhuoj0dixT/MK
 YLZ/5bEetXsZnwKddKmgFIuaRjpm3xYsCplDEbICkljDeG0C1PyfrFsUYhLNSbkaZfUxyY9AS4f
 nSKr3HDPAh6bMCZ7KAnalWeKM8gtmBQSw3i5scnxb/0FwzN3Gx+4zcsan82CFJzg2EqYBRKKFoI
 TqtpxiyLCC0zazKzjS6YXGR09NCI3FWJNtqIYH9CdIfU9urvmU1NqlvjxHp+3PiEXM78j7PYnml
 eVM4z/8Yvav5Dze6mCK/NzgWMe1htcgyVZ6B37oEzpVEvY0hom4hzSAvcLki2uDxEdRWjszGICD
 NS/eDhbAoOU3dYRGaHA==
X-Authority-Analysis: v=2.4 cv=QstTHFyd c=1 sm=1 tr=0 ts=6970b3be cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9a_DUlnzXuJTuH-cha4A:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210093
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89994-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF50655F58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update interrupt maxItems to 16 from 13 per GPI instance to support
Glymur

Fixes: b729eed5b74ee ("dt-bindings: dma: qcom,gpi: Document GPI DMA engine for Kaanapali and Glymur SoCs")
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Changes in v2:
- Added Fixes tag
- Link to v1: https://lore.kernel.org/all/20251231133114.2752822-1-pankaj.patil@oss.qualcomm.com/

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 4cd867854a5f..fde1df035ad1 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -60,7 +60,7 @@ properties:
     description:
       Interrupt lines for each GPI instance
     minItems: 1
-    maxItems: 13
+    maxItems: 16
 
   "#dma-cells":
     const: 3
-- 
2.34.1


