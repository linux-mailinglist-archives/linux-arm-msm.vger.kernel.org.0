Return-Path: <linux-arm-msm+bounces-105317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODaqAF0o82mwxgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 12:01:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0C14A066E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 12:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0127F30557F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 09:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFBB3CF02C;
	Thu, 30 Apr 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mTxq+ay8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h5pmcIjg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0C53ACF05
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542335; cv=none; b=QGnK5EjUiYqmK1MAh74Qd57lXaHwG+hloA9spCyF4sjsSzwQj+Fc97dAcD3Bb255BWX8NpC8cSBwODNoVyIdl6f/v8Owhve+bAvg10QaxBDehr70xRlszffuVOY0hovqcHllnCELPJaVzLHUc3m2tYhQXX/UsJSMrfDpe64lXwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542335; c=relaxed/simple;
	bh=MSsuyX7kuGk37NXM51O1GO4ffCLlI00kBU5NRA/D9vQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ufs+UZmX4u28+12H3g5EkLegEqXTbFAFfxWLNBq0ZhhnVQCldtzYSN4AUdWb2bCfyqFOMD4sU3BD51KrrmDCHVxYvAHJ5t3MAaMAdM+2h9fVcaiKm+1R/exV3m/YR6qVoCDF22Ct8MrmzwOM+oz3PhTlY/b37ZmRsJc88MlmOng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mTxq+ay8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h5pmcIjg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U6CNrV3992776
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/cAO1EL26dlRh42EDv7JJSDTJA1vZfPlEFwSCvRAApE=; b=mTxq+ay8uRBlPnPZ
	QteNsP5S6e5XuftAqHU7FpsGLYMxEDGH+KzPzfxyjVLgcjx/xD0fsxTu5r975mc3
	Il4AX+640fvAkkb+pm2fr7Di+n8ClgpPe5nTODV4RRClVZKBnBIJuoBr7xIKNnFI
	cYNlnxq/QLy36EEKX8bUf55UaB0IO7Se/FdezSSjd7PVN9b/bGUc+7kr2xALaFhM
	NhEZmsVUE7Btv7wQ03R7D0cOcV0aNkK2JbdItB9DRf95DYd7ThFoPmZGAFkOlxT3
	8KO+34FVaZzssuCkqbOjmEcl7+SiuK3Siqdn2IdwX9M3B/WC0NFdJs5LMJOooCtn
	/xP69Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duhx949aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:45:34 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so1478212b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 02:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777542333; x=1778147133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cAO1EL26dlRh42EDv7JJSDTJA1vZfPlEFwSCvRAApE=;
        b=h5pmcIjge55y2ZLupUp9UI4bCsYUHYaE/PGE/rn97tNj71Hmgk81yj8b7oYU6FSx/9
         Uh0Q+cB6UJkkQm8OueGcf6Kkjv0ScTAnJo78YkQ2b7zwDvd5WBQBXXHmheD4NueLBYY5
         YCck1xYshPrCoPVljfJhhYQ8ttzeSPvMX5C7mosudAZ/gfcoUOpz3yfbcu2cGuH0ORsp
         QhY8yyEc6BF0jQW1auWt+oLTqEcQKShY7FaFM0hlEonVOGFT4ZZQVyhVjmsEiofsXZcA
         nMDzTiReVqFfS+DKyPhBdQx+138iZOgj+d7MNzBEb7ckn0cLBnEzkvXQXfrhVvb7jk7G
         nxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542333; x=1778147133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/cAO1EL26dlRh42EDv7JJSDTJA1vZfPlEFwSCvRAApE=;
        b=B7bMh/2BleFK9q2JNucr8iD+/g2Favw1JRr30Y8n8Xyk/U2pANA+vy40quNyQnFDp5
         7i3hF5R/kl+EV5HSoD7MrVkO7lJWhV/aI+89204zCZujEiVxDtpoFoVM2QpZLndOhMMK
         BRP6kS1Suua+vZIZr1mbFAkemrRng+Dz2H+6WofWcFaAGqgVaDBVSEyXWyy4x6q+bj8Q
         oYdoxHYUrCMBVeC0xtbeNzXRbgQa8hcn/3qIAYFizDLcdGxlasoSg+iFyIN8IUTINPi+
         9xdwhSYZ3An084Vxjali8UNlF632AmYmgjDqEmPujJToNlfdhRwxWUvShOuX8FL7JqZp
         6PDw==
X-Gm-Message-State: AOJu0YyPPOSrzz6NanOx6xRn1ww/raGEAvDMS1jVzYtsJYAqu5mnk0WA
	ujVl6ykqB35u7w07dO4s9MCpdf0dMUb0dPq7FNwOzeZlXWYuV7SEFw1rR1GeSylzUXfzWrdvwHi
	yLRR7d7lw2VJo3JxaHT2dwmRpfbg/XlCVqF2/VJyd6KkXeVV1YIF6zacG26ExnQwnlU6/
X-Gm-Gg: AeBDiesFX4teR15GuoHJZnJO0iL6zuGCEahG+huk+FkxGLI72cimeKRF3vLT6GpZvAE
	UrQchNjn1m2wDSiHuxJSpfg2JXKn2ijnwMcr4cpLcCu0mt1Ld0cGpCeLka4kQw0VWdbwisoe5Ra
	TYbnNZOaRZNO/3KoY7Y1klE+rC2UPZkv6ZVONOiLdSryOCxQ8OSK4oz365OzT7TJ9dY8O1UvuUm
	HCQW/jDmd2M6m/9G+m16LrwFy4kOmLa2L5KvO3atHNjWUSBnBMKt07eljUh4cRHxyi47AfByGr7
	L9mdwFk4RIRi1nSJr4NaijpR+AvfgjGC/KinADI3bGJtYg49TH+DiLsR3iaVZRRh/pNxueI7n94
	bbbcHs1FkUoSOjGmG/NdYti0TML8UamiaNEWFmsX6FF2p5tJeAOXvcRbLLPkHnQ==
X-Received: by 2002:a05:6a00:9507:b0:82f:53f1:1937 with SMTP id d2e1a72fcca58-8350014fe66mr1805264b3a.27.1777542332655;
        Thu, 30 Apr 2026 02:45:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:9507:b0:82f:53f1:1937 with SMTP id d2e1a72fcca58-8350014fe66mr1805243b3a.27.1777542332202;
        Thu, 30 Apr 2026 02:45:32 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb691sm4718937b3a.48.2026.04.30.02.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:45:31 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 15:14:58 +0530
Subject: [PATCH 3/4] dt-bindings: mailbox: qcom: Add Shikra APCS compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra_mailbox_and_rpm_changes-v1-3-61ad7c57ef27@oss.qualcomm.com>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
In-Reply-To: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777542312; l=1198;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=a/F71uL8BlYVHt5572G7k860jwl4RJiexWiY4A6ZqIc=;
 b=orZngModJ0uSGvNPHFHBZGxcX7qljzqhiGxI5xuHxsPuL0HDEW4CMBNWPSQCW8oDGHuynra4U
 F0XqjlMIetqAYOVHpTIqCuDMUhkFAaDOsXOU+GNfnRVySCFNOFHVxsI
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA5NiBTYWx0ZWRfX3FRSGogn0EfL
 dLB+ffd4UthE214wGpSfJ3in9LEEuJY/z8uIxCzV6/PnILY21Rqq2i1ipju3b4YrkaMZ5sbCRsX
 QFfhf2mmiTgkWeQAdclJqaJc4dcbHQgj+eCHSy2LlDfE28LrMmvweG7Fh9vPah2kOEOma/3Lnyg
 RAlnN0TlldPDT2MlAboB7+XqSfB5xERPZ2KIoekYJRD5YiD8gHeWpAKY5DYAmUFfT311n1ZOZbT
 5EG4CF0Zhk711bCoiCUdeqlya0TqUHgwto2fGnU0GkeHeOArLUm04GXXiBd443kzpFnCJLgF3+0
 AdyvnGjWnNNHwJ8mP+sdzFiRw+P1bph0hhNdyHsDrYiYJZOCal4nHi+7ZnrGo9u0xAjjdmcZeBe
 VCHrbbzGPowpt9myO6nKxKcz1JNVfNxXAlVWE4tgbWjnWNe4cAEURie0HtsKstfnE0Rqs/Tm+li
 OLLm3ySyZ8DFgq3gQ3Q==
X-Proofpoint-ORIG-GUID: DG9sMbaFY5GUalznwlu811ZfeVuuv3fi
X-Authority-Analysis: v=2.4 cv=O5oJeh9W c=1 sm=1 tr=0 ts=69f324be cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_6-gM951qmUW0LqwlVEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: DG9sMbaFY5GUalznwlu811ZfeVuuv3fi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300096
X-Rspamd-Queue-Id: 5E0C14A066E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-105317-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra APCS block.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index f40dc9048327298c6e78d4327bbd5f530a013604..f22729a493f2dbc8ec2d189db84f5435a80fede2 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -65,6 +65,7 @@ properties:
           - qcom,msm8996-apcs-hmss-global
           - qcom,qcm2290-apcs-hmss-global
           - qcom,sdm845-apss-shared
+          - qcom,shikra-apss-shared
 
   reg:
     maxItems: 1
@@ -238,6 +239,7 @@ allOf:
               - qcom,msm8996-apcs-hmss-global
               - qcom,qcm2290-apcs-hmss-global
               - qcom,sdm845-apss-shared
+              - qcom,shikra-apss-shared
     then:
       properties:
         clocks: false

-- 
2.34.1


