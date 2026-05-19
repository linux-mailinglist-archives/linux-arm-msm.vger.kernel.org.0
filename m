Return-Path: <linux-arm-msm+bounces-108589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vK7gAg2rDGrukgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 20:25:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A325839C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 20:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A7CEA30516E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2262E368294;
	Tue, 19 May 2026 18:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OgcysIwJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A2T9a0L1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8A634FF40
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 18:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214909; cv=none; b=PP/qokzl8AlArnHiuu8fWJwWZvS71qTTbX2/VGhnZdJk+BEInvhS8j/MXguBry7xIx3obg5WyFXjsOMMxJR4f4vrfKWeKYcBNHGlAcAfpZU8p0VRFeLFAJ8cdzW3mgBpE1qLT/AevPEnyG7qSkIUqtrv8NfPNtLC9mMQJFBhVN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214909; c=relaxed/simple;
	bh=kos5+DJaOfQUVUWfj8UH95kxmZdxMBX8TC1MwIyGT8c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tDOtCezeprCigbn3HOjss85e5uajQsG5+T/0SD92pLKJYy4Q9kZvtreilRCKGXsTAHON1rMQ8epL6J+OQxRL9dWcgLdiIxOYXh1St0zcRYJDVXwcoRlHDFAFs1oZwuQaYlGZCMO2v7GswkdnzfkbWK1o8fxOdeJmVF1zl6iqNQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OgcysIwJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A2T9a0L1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExMme2143802
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 18:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aKN7rJqZYkKR/T4I+N1VFP
	xJ5Ty7+HAjZtKLNmu9RMM=; b=OgcysIwJCIlzjuTRCU93/NdlMDKC0v9yfXDkYB
	bSN/iQ0J0mKZETWiDykv5b8YDFDybfRhPaZAkmzHxnyRgINQqQPwOo6XVCyK5DV6
	tc9LbTJOnV1CYEdPEAKGAsKzKT4XQJAkC3zTMZFsvXANVDdA2LOJzkY7O/gCKip2
	q7+NefcGcdTpBYZyreK5jdRqIBJgeitd44nIOeKBfpRX8GUt+V7ZATs0usQAo/CD
	A2Bnpu4C8gHe//GB0FBYkvE4hx4z94V6GkxDAgBk3b0BI0nAuH0y3Ra8QvqroIw0
	mY6RDnpkdWAO5YypNfYnLvyNWDusFG2Xgi9J/YMI/8FfSqwg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3tgxep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 18:21:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-366ded5ab5fso8003877a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779214904; x=1779819704; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aKN7rJqZYkKR/T4I+N1VFPxJ5Ty7+HAjZtKLNmu9RMM=;
        b=A2T9a0L1kjYiyyI7lqix/BRrbsNrsGKMj8RKcY9uNc18GG1DeqpXDyo1z9FFlVv0Ip
         DfBGzBfKRfv6jszMqlHejv8lP9OYLt3kISVX7AEoPh1MLzjjBI/kEZdCmk3b7a++fbZl
         DdzEStpeoF5flIJVLtNdmB6WRIN3onMR9Ci7B5XtSD4g21Nyavc14DfRa56NwxhuZpQt
         4tbXvvaA4JczjKfoRl/ni9Vm2kkqJVRe93VlWqR6rqECoIJ4s6Ncrtcq7Xven++3urKU
         rIOugEgVxQdo509bcnb6xbQ6KvQe0Soelvpczkqylls9Pw136hyJQmmBqx8JM7T3AjD0
         Uq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779214904; x=1779819704;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKN7rJqZYkKR/T4I+N1VFPxJ5Ty7+HAjZtKLNmu9RMM=;
        b=o2ECBjU7sLx8oB428uDEPq5ls3wtvrg28C/LF19G47gcx26kF4PzFTMWplbN1IMsF3
         Lq/XaTdJn9QkYkI/ZsUW7SCiR1AjCv+aLGquVWKUyIOemcsc4Op6OR8cxOAqeY3/yjYu
         lvVX4Z25MkdBhnqCXhUIpDoulP8wTQvh+VB8J3f9tclKj+WtVTcG8nIijxiHSZ9rUT1K
         SqJq/4muSTj8fSbscHOiMNtbjdTOZRc6EtkeNAtj34eBkruwvtS73b2qp6u4Usk8j8+C
         ERAVF6XzaFGp0txXRbV6YZ6xVTzJrXzewdagbUP9yVNI/em7mz8IzDS/EHXAElQ2BDgg
         J8Zg==
X-Forwarded-Encrypted: i=1; AFNElJ9gjp7a9pNi/eYoIRJMxfeWtgM3bQ3N8XMKlJ89h+rcZ5HCvZZko2+EiYiLRoLbHQd78FmnTITZl0UzW6fM@vger.kernel.org
X-Gm-Message-State: AOJu0YzrV3hKTjzH7bBRmcRdguhfRXcoXXQOrhM+8lcgPL+aaMQmi+bG
	96eM+fwtxLGitZW39dJ2AGpD0AhX6WnFrle+JUYSHqHa+JN30cX8A0d3xOOO3XFmAa9U3wsuNwu
	cVXHTOBj5jaCn6d+513S93D/DSzlgqZRc9UME4+Gq1BQ7WocbCAGKF0dTYQ4Pgyy51aO8
X-Gm-Gg: Acq92OHKkhVGa0grHalYXrnecA2YABNDGNRyB7ZbLMlyLEIq6E8X1jpTFscZmTC/wqO
	hFjk5rhnfp49udYJCGdWGWVP3Dhgp4XCUe3k67uLvpEX93JP5JMDfxp9HI4k3+jH/qze34iP2z1
	loZ98qaJQdZvMDDDGrYa03WtLE8jhhon/zsDAJArQCAYmp29qej83PRuoyvpmVVGM3ehnF9wd/U
	BX8py5VbLv2kWTDzdsT/9MbmK+wDC9hwWgVhLGvZtsVTI52sndImOIrqzVQtPF7YFDRvjML21sh
	fb1ivo3nEN5QzqJhyh3sxOK7Or4eYRF2a9HIqaLvxBeqc0I+ewGQUmRHfS8V3SXiHUDpfpSioHt
	l1yNxL9ArXS+r5RFAh0RkcHqptBtglyvsYmVH/1HOTxPn0spXuToNPBD40KngMQgg7RVIDG6FSx
	EMkGbf1knzj78zOs9U22qZt8v3ZUjl8pqF529dDiRXIykJoNq9q00=
X-Received: by 2002:a17:90a:3885:b0:369:a359:b192 with SMTP id 98e67ed59e1d1-369a35a15cfmr7832589a91.10.1779214903620;
        Tue, 19 May 2026 11:21:43 -0700 (PDT)
X-Received: by 2002:a17:90a:3885:b0:369:a359:b192 with SMTP id 98e67ed59e1d1-369a35a15cfmr7832578a91.10.1779214903207;
        Tue, 19 May 2026 11:21:43 -0700 (PDT)
Received: from hu-viswanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369514aecaesm15434362a91.17.2026.05.19.11.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 11:21:42 -0700 (PDT)
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add regulator driver for MPS MP8899 PMIC
Date: Tue, 19 May 2026 23:51:04 +0530
Message-Id: <20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABCqDGoC/x3MSQqAMAxA0atI1ga04lCvIi7URA04kWoRxLtbX
 L7F/w84VmEHdfSAshcn+xaQxhEMc7dNjELBYBJTJHlqcT2qylpUnq6lO3dFUvGsOOQ0lmSznko
 DoT6UR7n/c9O+7wdBlYDiaQAAAA==
To: Saravanan Sekar <sravanhome@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779214899; l=1133;
 i=vignesh.viswanathan@oss.qualcomm.com; s=20260518;
 h=from:subject:message-id; bh=kos5+DJaOfQUVUWfj8UH95kxmZdxMBX8TC1MwIyGT8c=;
 b=frRRtluacWR5rBh9TAT0oiFIBy+2J4GCADA21nVUN/6y6Fo9K3TgeNqPKG5kg4s1Qb5rcaQpF
 ljAgK18lHQHAmhPr0/y4Hy9UR1NmwyL4aZgqUwZk+Ws/Td1vzVkO5QK
X-Developer-Key: i=vignesh.viswanathan@oss.qualcomm.com; a=ed25519;
 pk=/lHspsTTqZQg546ZudgrbywCsk3Whx/C0XNVUevaKNk=
X-Authority-Analysis: v=2.4 cv=feCdDUQF c=1 sm=1 tr=0 ts=6a0caa38 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=le95F6jzAP0OJalJjBUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: wwU1nRhYEQaOZ-4i0vTaDiXQk6qiLUax
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE4MyBTYWx0ZWRfX9fEjtHKtv/VS
 +stukl2qa/dVql9zFGH+Du55bj444Sn6IrIl+7iOQOQa57Qcc9h8nbN88b/y6vs+2/on6qyP6QM
 SfDfJg6ZnP3V7ahfp5Mc8vgvUdboi5G/6SiEKEeJwWqqQctx/pIv3yNvC+ZgvkcA4Z+nLrM6Dry
 2cCL4U7a/wdMNhviEF+c3Yq/QttjcrpORJpKlj6Aj3QQ25qPrbTRWhApNx3HbZtJalZFHd2Pc+a
 zkKKMzdv1n7PgLhwGrX6D3kxKc/oMZiBirr0SwnrLpus5trExTKugadmzhdVr9KModRhTwiyAzT
 oCkFS8yHegRt/vlabwIpHbuU+0IjlBHqdmfPrzB4y9KGm77npfgXBLNQLiiW7SX4HjNN4Ns7BIm
 kk+hNAzKQq9IjzivKBJ/ybVjOe4FE7sTJMxpDaFFM+1ZzfddTA4wR7ERhmhnoRjg3m60s3QZ4I2
 3uGmMvqrRq+5gf5lrGA==
X-Proofpoint-GUID: wwU1nRhYEQaOZ-4i0vTaDiXQk6qiLUax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190183
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108589-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 09A325839C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a regulator driver for the Monolithic Power Systems MP8899 PMIC,
which provides four synchronous buck converters controlled over I2C.

IPQ9650 uses MPS MP8899 to power the APC, CDSP-CX, CDSP-MX and SOC-CXMX
rails. MP8899 PMIC features quad buck converters with an I2C interface to
control the voltages.

This series adds a regulator driver for MPS MP8899.

---
Manikanta Mylavarapu (1):
      regulator: mp8899: Add MPS MP8899 PMIC regulator driver

Vignesh Viswanathan (1):
      dt-bindings: regulator: mps,mp8899: Add binding for MP8899 PMIC

 .../devicetree/bindings/regulator/mps,mp8899.yaml  |  66 ++
 drivers/regulator/Kconfig                          |  11 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/mp8899.c                         | 994 +++++++++++++++++++++
 drivers/regulator/mp8899.h                         | 151 ++++
 5 files changed, 1223 insertions(+)
---
base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
change-id: 20260519-mp8899-regulator-driver-c5df7d93bd72

Best regards,
-- 
Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>


