Return-Path: <linux-arm-msm+bounces-115892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DlprD4E2Rmp1LwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:59:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F24F46F5960
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:59:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X3qTiyPO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="gI10Yj/3";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115892-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115892-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D86B430C678E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B64A48BD43;
	Thu,  2 Jul 2026 09:41:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F4248A2BD
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:41:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985278; cv=none; b=gitr3CJ2iOkbjVjrWM13nkHj6Nh/Mhrbf6I0HmfTfrtMxTJc9uj6mcL6/rBe9yC9kstCA+nMBRE2c81dyepk/eWOoMyjz1BkGNMdrsMtfGGNacY79I8iBBhBwlbdsQBWoBuz0xIk9LaqpmVgS0Hl1mgau14OP7b91iyhYgeGwL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985278; c=relaxed/simple;
	bh=Uqluud263E5brCcr2XHFpOjXh+t6eAS3H76ENv887cg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rlMVy/kP4KgazvVz4vNCGoLUHznynPBfQMByh81PA6o1Zg7/W8P2DqWRcnebPN5qeq1oBgEc29iHtxLldxRfA5PSs1NrSyaWPLmjWuAGnHfWcBXTj+DHFKROeiMPcpg6LG+D7EFq9GnO7r3zSmbX5tbqHPgjIWQW0v3X/eKNU4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X3qTiyPO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gI10Yj/3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628QZ3L3053022
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aZA4ZrQW69o
	qC6+CpeaGYgpvQV9ESaL7nyZ87hOcFP8=; b=X3qTiyPOdNFs/MH5Ar9/gXnW6BT
	1dsLlCnhr+rotXBVt6EBzvTRSlA+tVQaevQfD1Z2Jbp4G+D3EyNn5yY68n9pjIRI
	6OBKXk3iYtdmVpfGMGMQ/DKWt/zir/01UAO+zDb8WOE2qZAx4wPcdF2P/YfWyqrK
	RZOWiaJaNjOyAeTTqw1o8sazHgQS3Y/KOkKsZ/9RfHwYIvaBwPywteiFq3knBblX
	AAZNoWje57F0cuAHtnEXNIN8EuYIM5huaKcvJtimyEO1BwCB7zPJNJsJ7qU+R6v5
	ilQIjY++XwvxCBxkX5n1suV7+IfwSMxcgDQLFxvSyGTs4ZYoL/2FHqKBCfg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f56gpuch2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:41:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84622d6102dso2056510b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985276; x=1783590076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZA4ZrQW69oqC6+CpeaGYgpvQV9ESaL7nyZ87hOcFP8=;
        b=gI10Yj/37C7CXtcawYVaWERi9mS26UssasnIII1a/4ETP6Nzfp4liraAZpXFRiUXZA
         /gG6sawfRA9Ak6m1cVf96cuV5ke8ALLc3UgfHKUvoEqKWtT9QD/7tCS1+UdmUYAAx+Jx
         oPssKaw+x8tb3KpgOeG62jlkTSkSEX+U0bfU7ycvA8ca7P5bDvYvxJS53rkyu05VMR2K
         ltTkdos3pjKAowm7bUy7D0xjcqHKfzUQ3W8utIehvGuXurQiDD1S+AUGpHPN7OP5ku8i
         ZkFcDjkzEQxfVs85ipu1Mh2hi7FldDjvBKFD+lDgeyfD3SMbux2JqYNgYLpXFKtKq1SX
         kwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985276; x=1783590076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aZA4ZrQW69oqC6+CpeaGYgpvQV9ESaL7nyZ87hOcFP8=;
        b=pLp1uXKPYlxTtC3fjl8i+mrGqSCcAzkfkma7H7PLPAA+WPKzPdhwhWOf4Fw8JvnZBd
         aGtq4IsnNFQh3iy+RTKmzS501ks15NkS+CG3Kkr5ckfy/1+8ErMkeqJP2masKZa68mEH
         +BWllgj4SLfc8UkyUMgEspbMqepUWO3DEH7gOX6ys2dtaJP81i/TCktOltb8clx6xEHa
         Uw4ukm4RGbsUQcWF6zN4YxbZk6H9aeW+fOBBCi61cKoKWnOqrXtsM4UFVixyOLtL8L5t
         JJEY0j/qqOkvyMxNlwK5cRHgXaZHqSoutuD2xslRKMceaZa/SShqvg7j4PzhCAfJS+Dg
         pdug==
X-Forwarded-Encrypted: i=1; AFNElJ+d1FCDHlyfrRHxhd8k54LlM2dokh80kOjTl/rXVU/oCt+TPvLaBhaGwt6fRvjuG0XqB9RmWq6mHQgj0Sy8@vger.kernel.org
X-Gm-Message-State: AOJu0YxlivL2hns9tbiCYNz/v02zqrRS5EVWpI50+uruAVYDzdfT8KL5
	O52sOSy/R5p05J6ZkFsE6F7yrQyf8a0GEsh4H16alRbit8DdFVk0MmZDFESlXs3+WiJsaAHzzmQ
	/kXAeCGVFKdpxfA7kp6GAGcyAcKmr4n/NeM4DQfMHpjizsqd8Ng3xN//K7palGbF+lLcM
X-Gm-Gg: AfdE7ckH528X3ttZFjiZ+gqP98ghiOUoVpq1dIJxWATSz4dT+RlxRXlAyi7jV1o4TsH
	IMnpYYhZRlJ+EAFoZKLruvFHVGHtYD+5SYVjO4UHD0JwEydNDwjaQ4I3mUYUfHLhFk5KVTrRLin
	mfjr+v3vpCv6qqrOkX6BV+e1bU2tzsGb++o9eXXn7NXOcz/B6h4ZHaHtDa87j11gazZd9RVRxt/
	NwS9bj32CeY4+tdPsNblqe8J9OzdDhloCE3pc2JcoLDOWpdfsXwxlJtxAVvp5zmR7h9cf+L4Sb6
	hFsKAp1fm4YyrQ2pVTGUk4f3lGFGxj3axNcAGvV4YVIsCtBgTJRxwaYdfPkTCpsRDzENZ/hPQ5A
	5j8Y4E77aB+KAiYTnwVp5Zk+yrqiVU0KAwtAA8g==
X-Received: by 2002:a05:6a00:806:b0:846:f517:ba5a with SMTP id d2e1a72fcca58-847c5141135mr4342788b3a.28.1782985275736;
        Thu, 02 Jul 2026 02:41:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:806:b0:846:f517:ba5a with SMTP id d2e1a72fcca58-847c5141135mr4342742b3a.28.1782985275185;
        Thu, 02 Jul 2026 02:41:15 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb75d850sm1141595b3a.19.2026.07.02.02.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:41:14 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur compatible
Date: Thu,  2 Jul 2026 15:10:54 +0530
Message-Id: <20260702094056.3755467-3-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
References: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfXzE0KUspHAsyn
 JUWXysrCBswNRwLCoetbnZLw+9BHTOWq+gmwLa8WN/SpWkz2ZqIsHkfSuZVr6PgYXybvdKRX/xA
 XrLTBB3GUaiz9cfwILt03VQy9iQc2do=
X-Proofpoint-GUID: OlByXwYJyuy5MbDbV6RNxQ-WRn9u0056
X-Proofpoint-ORIG-GUID: OlByXwYJyuy5MbDbV6RNxQ-WRn9u0056
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX3XHxWY3KVbap
 0zhocaw8y8mLStzLfi2iwqKZUlEGa79ry7HBEgMDleLWUiiTJO2Gl99cXdmFh6EZmw0XaFjuiL2
 Iwj/xq89BQjAQCxX9O0RHqzC2KKZIbq/jJqsmH012NkuXSgCoiehIbYs2S3TBbGojfQETWoi3Gt
 sjcvdmfmcrs1s84Km8ERkoZFsfLHYdYnzqZ0ouATi4ZZ0h1/MkZv8/aGMmKNd1x0l/AFKXGxnn0
 RERqGizpQNlaui85IOUDG5iSRHFsgPN7nKJUl848bcHz20uU4AYUj0Ps/qGUK6HNl/hxobR5bxf
 CjyKqeWvWCK019x31p1U7LuUbIPgVD6+AYxwJl2QFCkWaeIOaLpYO7RyxoKukjV8gJ2bYvyxsE+
 YZx42ve1bHli2qpFprxP0V90DV/f4H6KvuJT+ub1ig6392PjFu07MV3QsyVookptXzSv8N1eL+F
 9f34A7/KbGFQpoI5RIw==
X-Authority-Analysis: v=2.4 cv=K9oS2SWI c=1 sm=1 tr=0 ts=6a46323c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6d2A0baYHafENtA5ngIA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-115892-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:sachin.rathore@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F24F46F5960

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Document the Glymur-specific SDHCI compatible in the sdhci-msm binding.
Use "qcom,sdhci-msm-v5" as the fallback compatible for the MSM SDHCI v5
controller used on Glymur.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
index bd558a11b792..6a8ef84617a9 100644
--- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
@@ -38,6 +38,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-sdhci
+              - qcom,glymur-sdhci
               - qcom,hawi-sdhci
               - qcom,ipq5018-sdhci
               - qcom,ipq5210-sdhci
-- 
2.34.1


