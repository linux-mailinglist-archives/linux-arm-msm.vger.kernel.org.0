Return-Path: <linux-arm-msm+bounces-70626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 777F7B33E6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 13:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B5C1202C06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 11:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCF12EC576;
	Mon, 25 Aug 2025 11:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDCU99zf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD8A2EBDCD
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 11:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756122746; cv=none; b=mlfqd1EoltLLBRLJV5R0P9qSEuivWA3HYhvqc/Uc9okZsweyShlR6+J38wRq8Zhe/eavWMqlXipit4JDsHh471Hwc8pPfugn2ZgTpVo93TNiNoUv3bFMaYI3BH8gqMP7BHMhsswscI0sKUqBgrhiNT20Ag7UvFRJw7NV7jaKDMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756122746; c=relaxed/simple;
	bh=WrQJ8y2wkRh0Pm9UxftV2Jxk1mcEkUib4bVXH4a+nuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RVJgpQsNBxZ2yI7sVQfFKaAO8lNBL1Gi6g+j4h1nh/el8y8QDoLKLrHsmNskPQ0o4NqEVPR4WgRjYZnuC19mKTbORXqXhYY5yXy2UUFEhxJmw/a+awbrzDdqNZGQS1/Mat6nlwI2OPGdRtGZEeIWwoEgxhqcjDHCwHHJJFl8Pg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDCU99zf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8PGtx019764
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 11:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1RD0fxwdT+wj1xPAjqTg5MEtJTG2YBJSBCyvEzZQyeE=; b=hDCU99zfPOpo3lqc
	QnzIA0HfHXmMAQ9o6m0PoOm0e+5yfXdqKA68kB3DdltalXW6KJmqdWKAp+YdIXH+
	OwcN6qpBJDO4LGhjBRhol2CJve6gU8Em/7q2rvJZ88WxmyGflnHavNxTPdKaw0dZ
	jtf2p+dBHZ8uIUYctm1cELUA22Ho9dNM9Twy05FhkMzfbXaLCuNy4/oosJX/dAIf
	P+fCseuEvx91k2V3xsBW3FnTLhIy4ar87C4dmfLvyZdEDjwZS56mlKxRdjdRSm8k
	KXmTiw9KR02c25TtJm+cDxbWeVGfpiD9HPsUDHlvSv82tEYE9gVFd/IfjRcSydYZ
	09bc6g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615cvwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 11:52:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24636484391so31728495ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 04:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756122741; x=1756727541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1RD0fxwdT+wj1xPAjqTg5MEtJTG2YBJSBCyvEzZQyeE=;
        b=FtzvlA85BTogIMLEaBWoY+tE6okGXcgOi3VY8e4XA5i99/PTgCZfQ6QWETSNHwpHQV
         eohVVoqC9lgD8mXuvM2fk7VIISomBSNUDCm3yzANjghQ+70i0OKnFqzk29otJRPVxEP4
         ZEXGIYaiXBnZWgGnnq7T2zsEINtLKr4kBbqfsgc9Msu3sUi1MIdJWykKzVK8LDtHsjnU
         qNyD2M9OTW3I1i+1l/1PCO4DDu5euEV/r5qu5QJ54Q2WIxsejeqs28E6a7TQsId9BzGk
         orucfAcE9nOELcEVl8g9p7kpxg+/OcC+2vyizKh7YxVCV4a7OAlUxW7pLQ9HZ4juagrZ
         cw4A==
X-Gm-Message-State: AOJu0YxPzuNyWM2uIiruN3etAdPhmvXr9c48yWa8zSzA+qe48N+F1xqQ
	o9lUJR032o9hHODe/V8I9oTdA6c/pz4V5h+yyH2T4NgQjyq2TafcGXPzrBqOai2nkvroRfBdEQd
	mdpzV3fSDPOX0P92xBLi7g6+lhRUHwfIOX3t2OcOzhiSyQApyWvvJ6ny2djaBytGIA4pk
X-Gm-Gg: ASbGncviwqYQ2WuBR2Oseelb/KUJ6Re9l5TK/BGYELMxUkppBwAgO8SrwAnU3aQ88oK
	ozUTWqP9/M7O6Bv82Tth00Sxh0j+lrFS/QZaZSqu0ykZ4u2N3gOPZo3wE6G5B2nzm5wTTupUPgs
	kcRcRBmcAlI84+Cc/xbXKTw6ikn0/xHxZiynld4gxLW+Ir/wnT0Ecd20bEKPY1Y9p2uKcZ7SJc4
	SVtOE80M6TwL+bgO9rjKWjAE0tfinKOs7CKlrx+mwLBaF2PVLJTXXYOvKKExUg2C3FTeAZnK2F/
	wxxGmMxQYqq2lH65Y7XumxBBij6edfXrB+ImJmeDum7wli3WlYxQp8mRsmwQfKAPadUWbKlJ5bY
	AcDiWeHbBXDAs40Z0dDpj4+iXoKsLJbw7Ev6UTn070XAdLMZtUpqnb0UYHm3CMAoWtkyql8+iM5
	o=
X-Received: by 2002:a17:902:d48c:b0:246:96bf:c919 with SMTP id d9443c01a7336-24696bfd54amr85187545ad.10.1756122741410;
        Mon, 25 Aug 2025 04:52:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaLDyLIvMkQiJKdMioGfxMs/33mkrUVT35+uXH7WGxzy1geJK0Zer8Luo6lAcRhKMl1HXryA==
X-Received: by 2002:a17:902:d48c:b0:246:96bf:c919 with SMTP id d9443c01a7336-24696bfd54amr85187225ad.10.1756122740912;
        Mon, 25 Aug 2025 04:52:20 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687b521bsm67081015ad.60.2025.08.25.04.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 04:52:20 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 17:22:04 +0530
Subject: [PATCH 3/3] phy: qcom-qmp-usbc: fix NULL pointer dereference in PM
 callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-qmp-null-deref-on-pm-v1-3-bbd3ca330849@oss.qualcomm.com>
References: <20250825-qmp-null-deref-on-pm-v1-0-bbd3ca330849@oss.qualcomm.com>
In-Reply-To: <20250825-qmp-null-deref-on-pm-v1-0-bbd3ca330849@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Poovendhan Selvaraj <quic_poovendh@quicinc.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756122727; l=1613;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=gZlFwG2FsBtPkQDUxJ9WIqEJzQC4A40Ol48lNH0eyzE=;
 b=D6EbEOJZPQ86Rzpamaut1ppVk09TGRn58vCjBk8qVEa2c4cjy4SEham80Ams0Yh1KNdQlocGr
 ggkfCvnjmIQBBnRZyJ6QA+WIQiSf623Aq6EZmfjH4CwGqa0rTbtvRrp
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX3wfgaOmdv3xi
 YIfRhQH6ryoO2TKl3OnM1AsBax9O4kML4Lge5NPOsSjtJfnBhZBW2XLto7jnrp1XIdUVTnOsTLs
 Q6Xj7gd6yzRdPpbYzkf0g0Fh1VJef5ZwTm5ax3434E3fRiJn2x6cjjGLFmPxE70fqi4Jqm207hT
 baC6GTUNpNxbXfaz3xcfX9kuLbNll/DheEMCcnupZ7xxPidOlTZtQzOT+cJJhP+J/6wlBk/2JuI
 HVtDG+frW6zLX4sm1/GA0pecpKlWocgdszzYzlOuXsw7g3FnEtIq2la5WP0FAce10o/SEi2whCa
 MBRp8lW0chuMlUMTyDrcxAPyiJFgjKQzU8CfUaqywhUhcGMh3CqRZbHyBcK5e7sdrGN9pgIcAv4
 SGlPgJCL
X-Proofpoint-GUID: ZOaBvk_LmPuygzI6IiJJKuPOnr6aVwH4
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ac4e76 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lFmJHyBsCXrKv0U1x8cA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ZOaBvk_LmPuygzI6IiJJKuPOnr6aVwH4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

From: Poovendhan Selvaraj <quic_poovendh@quicinc.com>

The pm ops are enabled before qmp phy create which causes
a NULL pointer dereference when accessing qmp->phy->init_count
in the qmp_usb_runtime_suspend.

So if qmp->phy is NULL, bail out early in suspend / resume callbacks
to avoid the NULL pointer dereference in qmp_usb_runtime_suspend and
qmp_usb_runtime_resume.

Cc: stable@vger.kernel.org # v6.9
Fixes: 19281571a4d5 ("phy: qcom: qmp-usb: split USB-C PHY driver")
Signed-off-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 5e7fcb26744a4401c3076960df9c0dcbec7fdef7..640f6520f7c1cd78f9e79843a0778c1bee790f64 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -690,7 +690,7 @@ static int __maybe_unused qmp_usbc_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->phy || !qmp->phy->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -710,7 +710,7 @@ static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->phy || !qmp->phy->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}

-- 
2.34.1


