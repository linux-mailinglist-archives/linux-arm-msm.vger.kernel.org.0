Return-Path: <linux-arm-msm+bounces-91436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCorDv1TgGkd6gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:36:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F75C9366
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:36:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0001F3015D01
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 07:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5489A21FF5F;
	Mon,  2 Feb 2026 07:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iUSJomn9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cflg2KQg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1B029BDA3
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 07:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770017762; cv=none; b=p4v2OFgWTZ1Q+MYdqqsBqMCu5BM7taienbeDvK1E+xgik0xlazGnKitJ+uTZxyNZnHW+x7azH2IiOTBWKl8qg4ZaKww2z63cCO5g/JqarEL7o2esBOWNp8GPYNTsQchW7P0yesG+QqsXLNdkG0SvvkDKPg2/7avZEXDKlAx/umA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770017762; c=relaxed/simple;
	bh=1HUUEjHgDcWjIk9i1IbMh0KQYREmSO/89fEdC+ob1DM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cxJfmUSFvLyIwPgKydhzh1qNZ8AMLpMWi66psIOJ/000LyTNXkGeu7UVP0CmtRPSr6XoNhmC/pA4JlgiCYAvonW2iEg6rQVEjjIn3yrdWKPVZDE0H9WYwTg7tdFge34WZBCCtgR7o3gXYGX/SlVIqKcZCKmnXDIw2rn6gAXMapY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iUSJomn9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cflg2KQg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611Mtq0d2705690
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 07:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=So6nutfOYbF
	5hqF4ny0RAy4gW3NAh5oEnV9tydHlSvs=; b=iUSJomn9igs3CU0vXqYqEGSfzh0
	Pz7PqSWB4O8Vp23BGAcJcD7tg+u0XvVwHqQQQyIdnkjJtlAk6CpKXDf9ayclL7mJ
	T8Bx89ifJTbPPoGCcJVvXki/FxgUvuT5wvAyEr0A9ehcha+Vpq4JR9AkrzlPCejI
	ZNEIhs3IH29rzwoqUGkQGlOB+Z9dQK+suuXs33go6phHZJDHn+P/DgCHuxKeY4WV
	ri+h3BXOYKSsLfRmrj/Q3xUnaZKmIv9QIauBWFT0g8hEJuEgYwpEXFOpfJYNFIB1
	hfg2zHpmIEW30ESfhYxkgfUWu4ac2Lt37mWSPQYK/XybDQP/jmueeSLxx1Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awdceuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:36:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34abd303b4aso11327824a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 23:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770017759; x=1770622559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=So6nutfOYbF5hqF4ny0RAy4gW3NAh5oEnV9tydHlSvs=;
        b=Cflg2KQgoRCkRwy9RQoNSAvOog/JMvqsA7NJYdnbfpCil+POhN3l1zHiHMHMtYYuxh
         h2wpLU0ZZ3u4JjvPqxa8wXJMqTN2WeLwKjaxLjUdij2hTftGSlTEpW57Q9Uy9o0oJMGe
         g6OIyWE75snEvzoP0mk6QX+FUJFqP6ldFC/a6xhJgUHvb8nteQzv/seBNqG+tKq/1BOz
         1wQvXF4tIsCh1SUAOXX6yqdid5tPaIIT033uIh7F8HQyyZsXEKKEOKzkk68f8IymwLu2
         z5cQvg4SU/QxbvtI6hyDU+PPtW0oIdULWiEKSNKgsSlNpmfXqGet/ldsHkDbviAztSya
         SnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770017759; x=1770622559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=So6nutfOYbF5hqF4ny0RAy4gW3NAh5oEnV9tydHlSvs=;
        b=GNZ2qD6QOcBAjo5OuuVYKS6nEjyQmugEmg9v38qXX6BiTNcsjIUYaGMndCfBhlTpd4
         1UefUBYsTBJVTuFj/trWKwS1ftr5wAtlDzSH1hdB7LfALj4ItJQ0HkFHY7V557JQb/uX
         smDMLEm8zUbbWnU7WaqsP2NwQGQLRLc79Xbclkzpr1RJGdY0ABADNfVg6Ja6P1mreVAB
         WtgIGKXeftBK8/mI1cffsBkR/CpQCmE/oZCAEschyibq7KwX9fs3lx3+d8uc8Nu4qU8g
         a3O9bG4ymKWy/SsU+yGlTGH4mSXb88QVChA4WqFdDgNzqPkHUJ50Zgbt1F/bKLdpAPCE
         gd3g==
X-Gm-Message-State: AOJu0YxVzjbNXKhkT5oc6xUvS4OK/WWTvlAmcBWfaDxr66kH6W0W6FLW
	7JcOoL+fh/r0JnrxXWowLY7OL6PMoax2J4sskSRWUTHKb7N+HJpvW9uwFr/bKEM8Hq1YurCSaGL
	XeGkES/QFHHHxbDeRg6ovXMY4nGHtNPV7YnT1rIKhjVlVBioOOa9U0vhUlI6jBUphDB1d
X-Gm-Gg: AZuq6aJVYfQHm7ZktO9HfrwE1zAcd5aYNqhSGeXgUd/pU+yZbZ+O/fotkGJ+d8m7oUx
	q6DGOm4jWzRtOFC/tUDBxCvgFCGSajRz4UD09Sn0quv6sCz+xoY62hclkJRRbbhGXt0ru3kxdRd
	PCvZWZh2BriAc8erTOZFWE3ag7jH5Lv7sMgnk2O6pqaNWxYLVjqbBiCWUfmXduH5NAsJfWzlImw
	mwrWVImmzy3U1VlNhpT6XtJ4pPt0eI482c+roYQ/bV0dodAQCDi8nRlxaf+NN26+pHZqdhUI5T0
	+A2ZvkRpY5AxXm9feqmNONZLM8CPsxg9PRXFRtNpaxGTTrq3wQ2KQxdq+TwsZTvVk5ZpOL7I7EP
	Pt6aRW+BxCKI5NaXWYtZPV/2au650X84VHCnZp1mOAc5R+ylNx3i1N1sHZLmj6hgfq/FSY8SKHi
	0=
X-Received: by 2002:a17:90b:4d90:b0:34a:a65e:e6ad with SMTP id 98e67ed59e1d1-3543b2e000bmr9911179a91.1.1770017759463;
        Sun, 01 Feb 2026 23:35:59 -0800 (PST)
X-Received: by 2002:a17:90b:4d90:b0:34a:a65e:e6ad with SMTP id 98e67ed59e1d1-3543b2e000bmr9911170a91.1.1770017759015;
        Sun, 01 Feb 2026 23:35:59 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f3cc71bsm14129847a91.11.2026.02.01.23.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 23:35:58 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, yijie.yang@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/4] dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
Date: Mon,  2 Feb 2026 15:35:45 +0800
Message-Id: <20260202073555.1345260-1-yijie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com>
References: <20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OUfUt9VwA4m0m9ma5rOlu9F6sigW43bI
X-Proofpoint-ORIG-GUID: OUfUt9VwA4m0m9ma5rOlu9F6sigW43bI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA2NCBTYWx0ZWRfX1WIhCuHbZYTB
 sKG0vAaMFiMNTqnxwFci9SqdK9jxRwnXDwwtgHddmYQZlOC0v/Njay+b9nZFM2ZqN9I7QTqo/o8
 ow9HhQLHP88pVOBMiHm6vUq4QNHm8UObcoazNRnkEYVOWwMOhszdZR2TggOl+mJv7rB1UxGquFi
 E9NFCoL0Uv0hA3wt56s94nQVBMRTqMzw6b/ww+Bnjzh2ZIHjEp0NkRrPaupIWRxM/1Xcd434CC8
 kQUGVekjaJ+0AO8dsjzAzzoLR5ESBTRqMXLBEjrRFH+J55yX4yosjQCG60Z99ApnHo3a4FtfPhd
 BHsx2nsC/uErtKNTzF3R5mopFYzJYvnrgWTOu3lVsiC6XhMgnAZZWx6hOYe1gNDWSPq0+QaCzwl
 i65nfXs+IQfnatIbcvATqqO+3ZDoyJslAbQYuMJM2p7StRwcTun4ABkhhdZlgfCMZUjauGaR5TC
 bAxFHPZYZqZMZ2RYQsg==
X-Authority-Analysis: v=2.4 cv=T8OBjvKQ c=1 sm=1 tr=0 ts=698053e0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NXHrG6A95BBPE0CoaowA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020064
X-Rspamd-Server: lfdr
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91436-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C8F75C9366
X-Rspamd-Action: no action

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

Document the device tree bindings for the PURWA-IOT-EVK board, which
uses the Qualcomm X1P42100 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..59b8a4267c14 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1122,6 +1122,12 @@ properties:
           - const: microsoft,denali
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - qcom,purwa-iot-evk
+          - const: qcom,purwa-iot-som
+          - const: qcom,x1p42100
+
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa-lcd
-- 
2.34.1


