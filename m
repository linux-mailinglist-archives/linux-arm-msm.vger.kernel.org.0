Return-Path: <linux-arm-msm+bounces-99078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEY3ECeVwGmxIwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:19:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF372EB6B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A209B3038A41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 01:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E08820125F;
	Mon, 23 Mar 2026 01:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXk0p3mh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KXMNUYlR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12168218592
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774228663; cv=none; b=cCnBthbX8EEQ8nrxL6n55rWFihClsr2drteCl1UqlGgeWLX/zT1r6d/09s1dnS7ibaDxYcJZlItYTvOfskqKhpCdLnAnOXkkdDli0sDEpCL7Em2+DtwsTGA3di/oMSfdQ1uwti3E1yeQooocIMG0BUfjGOm1yWztMkAWRl+5bbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774228663; c=relaxed/simple;
	bh=Ya/NJt7pKVR6io1jC1dQy2DY1Rkbk/XPlKWL7mD+Jmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hW61mCJNmkTJpLVYwhKrefkPDppUsFk5n12N17jWWtyWhTW8+wv527S6AMNp2cMQ5gMXyG0sWGS/BPAt8xCGbKZ502aJiNla0TqKOm+FdM2zgRSMvUR+8mQti6Y0AH81qurbdSm3ZjafwxpGLl+CDGQ7EgH9jKuIgOKLpa9jln8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXk0p3mh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KXMNUYlR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MJxKiY774541
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wTOuT2RJ0koUSSURaKhqCLIXf071rLm5jfDuWF+MJ1Q=; b=cXk0p3mh9bZFmsB1
	DFxBheHjhCI8KZKQWoagU5+TxwtUFBkzg9tDHefVwD0K90HjMv/1YLDiwOcJR/K7
	s7JzwSeg5SyKctpppNsZm96XN7Ek/DJxQx17vsNjLmVs9lhXMFhPx2ADu9cf8tVD
	t0R7qYbPpD9HPglZIewp5TAU+3aqAak/T4Q4FTcJRF94pR+T8FlT8gCxo7XcZ+8S
	D8mzRFXYVok5TUGu5ZIu1Ows5gd6RJzvRnjX/vuFrWvB9VD4hRW1v+gKncTT+YoT
	HUsy3qmd4Di/ZGF6AA+WTKMlDg4FRTxLiXWS6jhPnErGySYGY8u9+7oIv+HGzQo2
	ZsmXsg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1j9rb9us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090e08dcfcso339456341cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774228660; x=1774833460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTOuT2RJ0koUSSURaKhqCLIXf071rLm5jfDuWF+MJ1Q=;
        b=KXMNUYlRq6klgzjcJSDlL9fjnoPCIIneQBP86zBQT/y8heuTjLTzXBv/ZyBNEfUKYT
         628WByvZ5aGi+DrCkPwC8Dg+cUd7CCf6lyxowvdkhGk+Smodo9wy2uR7KwGDFfxTWpLO
         fzhvY5VlW/00flOnRYoUiOY4w0mq4De465WkOqx5ikPg8CNB5zdFIH1SS4Yf/KzV8yLn
         5jx4YEYvLBR+8lK2eyAdE/WOJCOoTGeKxD1nC4WH5vLtDRg9Bpx6WaRaqAphA/E/8t7q
         +r/NMzjVOHDe54rWosZXDkkLSOAdmWAJ6atI9m2AZascMb3K8+3lL274Sob44cz7yYS1
         DCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774228660; x=1774833460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wTOuT2RJ0koUSSURaKhqCLIXf071rLm5jfDuWF+MJ1Q=;
        b=sMJG5cuyJc09YHVBoT0eHzfo/rcTdKmFyZ1tkHJFbQZNAGoSKP7hbHl2JZ7yVGB2+d
         5+NQH7CjozSSE41upTWVNH0/kuzr8NncekXCj19vfRaU8nnlDLRFBJuzVQVJYNhPt9xg
         IZlwI9mkzXpgIzZw2dfV3KUY37Bu+tfFd/U+Zov24i529OfRPxzDi6fPI9xqHRV2zEne
         uRNHmZkazi9CadXBXcs0OaevQvNcpbxBFFOcBUZo4ExcMlpiOKodjI4pnj4pOCcvRu1V
         Ra0f4bKB+Qw77jw5EYFgGkYVXAySLtY6A+zrqS5XefqcKaFvIvcIRWicC93GvFCyA6ye
         c+LQ==
X-Gm-Message-State: AOJu0YzUK71vP1vKGgz2V5Kw42SHSDV2A5tNw3C+2RqYMp4yCjMfoLIO
	mXV5lJ7QCGccW/ogXHdT7A3/FN9bE9q+r2yxF3r3+Z79swdhJSOHPgIbrSPu+O89yB23YxjutfX
	ouLGH4+gHdoOUoE9a4PLxwbgfItJ+azMX+vBHVJ+IBX5r5RcgTgh4WdyiHecz3w7MDGF1
X-Gm-Gg: ATEYQzwJYVUpeAx76PELu2se4irtKYOyjEiAbkxdwk+bksZdEt3GIuKsji012Ovk/LV
	PrvPjQyRaNuz2wZQg+TKZk4O4eYqOEN/giH8BGtO9dpp9Gm0WDhPL1R45lc9H34vc0Aa5HvvtXA
	D/Ww9i+T1x4iBou97yQpqYxGm+GNRHxGEwWcVWPxiLFTtWd20G+Wuvy6+rUuzsD6H8bRypJqlZk
	dBzLiamVBPfk82nUUdaNRaTNIztP174mVs6WcTKuzukEROjtKhE9LGHy9er+XZr1C2uaZnXjk1c
	NWIwCmAwPVt8R+lOsMu73XEPOggyYUPCwbPb5DzJIokF8Om0CjnpqPHDbbKsnKo2u0aOILWkg6P
	7ruWGw9h7WnF0jccPd0uE+7NFYzy4qiCSO4C9UKtd5N64OtSQSxgaZcUSdecD1U5gVuYTXP4GPE
	nUehnB1QbcQRtyNGrPdYRN2NhWI+dd3zfsdko=
X-Received: by 2002:a05:622a:590f:b0:50b:4984:148b with SMTP id d75a77b69052e-50b49841855mr91549501cf.64.1774228660426;
        Sun, 22 Mar 2026 18:17:40 -0700 (PDT)
X-Received: by 2002:a05:622a:590f:b0:50b:4984:148b with SMTP id d75a77b69052e-50b49841855mr91549291cf.64.1774228660031;
        Sun, 22 Mar 2026 18:17:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2853050e7sm2216150e87.61.2026.03.22.18.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:17:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 03:17:21 +0200
Subject: [PATCH 5/9] interconnect: qcom: define OCMEM bus resource
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-msm8974-icc-v1-5-7892b8d5f2ea@oss.qualcomm.com>
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
In-Reply-To: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1594;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ya/NJt7pKVR6io1jC1dQy2DY1Rkbk/XPlKWL7mD+Jmo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwJSeX1baotwnLbuBujDe1jnKIQvBvRRnSisNQ
 9ELGzx6MR2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacCUngAKCRCLPIo+Aiko
 1Vo3B/9REU/bTIRSQrxK7GSNxOljj7iZ5OrMDOzjAIf8El8TOMsTuQoNyeL3P4jFS22yNMWE30Q
 j7I8wQM926EiRQlR7c/JKS/h0qxOlZ+cWApf/rvzULqRw2oV37SFjXBqxYHsZBd66VSZEf0RJuc
 dAScHpjwQwgveOWBWd6bLsegZD41BcOL5UvA5LSjfYpKUKL4JGsHp4l7abGStklZX8TXHIPACCG
 HmLSw7/dk6I1P9ZV0h8xwQQO7iQuNxBsOv+4n8Ts8vKe14ECwXd0yCGp78KIuJOuZZCeiiqbKoB
 +596xD3xubsn7dlsYHL4C1ih9y4MY50SvjMuTV6EehoWm2jt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: j06gS4QO0-KjOiDeqeyAS37QIE-8Y5sp
X-Authority-Analysis: v=2.4 cv=ZPDaWH7b c=1 sm=1 tr=0 ts=69c094b5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=zOyvSeg7rOUdy7vhyckA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAwOCBTYWx0ZWRfXwvHs47Nr1DnA
 2bdPmRGNepAqWQ8Bg4MuU4mKVfy26ygN9YwAQXHOsol31CWEiKJwCgTpY8ioHfAMpEgoZ6WJTIj
 5N/hiyrAi/Hv5dOC/UCDV4m8t0SDx0wWfMkBub5PRvaOBevcvrwXcnrawA6iKEM/CN3IxJorF7t
 AOHM7UfITGw3ED+O21x00PvHac/3PNMbUgTCunhamq9XnkWW2coKyJfWb5bgodnpZHmq0PPW1TU
 Z9ji8pQ8OV7WP+tbjsc7uuBhtSVlmLmphNsc7y9vxMOaucjtF7SHyb/yaTOqdqNF8vYv2l3fM3c
 Bpf1SqZvm4ozm+53BonTKr6PGYyIBz412tcuPaFUXyiZRcPPQhjZ0mlaIkTulaIkptaEJQDiWAt
 vc/o0G6Szb4ZA9UOgsPrcIWvLYZNYZTnXjhmBtKvzGB2x3NrVPg2Cjq4e6HO/TgCviJGNcUC2vy
 KqS5OZbGuzPmWyRyn1g==
X-Proofpoint-GUID: j06gS4QO0-KjOiDeqeyAS37QIE-8Y5sp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_07,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230008
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99078-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9EF372EB6B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some of the platforms (MSM8974, MSM8x26) require voting on the OCMEM
clock. Add new resource for that clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/icc-rpm-clocks.c | 6 ++++++
 drivers/interconnect/qcom/icc-rpm.h        | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/interconnect/qcom/icc-rpm-clocks.c b/drivers/interconnect/qcom/icc-rpm-clocks.c
index ac1677de7dfd..69846e26f46a 100644
--- a/drivers/interconnect/qcom/icc-rpm-clocks.c
+++ b/drivers/interconnect/qcom/icc-rpm-clocks.c
@@ -31,6 +31,12 @@ const struct rpm_clk_resource mem_1_clk = {
 };
 EXPORT_SYMBOL_GPL(mem_1_clk);
 
+const struct rpm_clk_resource gpu_mem_2_clk = {
+	.resource_type = QCOM_SMD_RPM_MEM_CLK,
+	.clock_id = 2,
+};
+EXPORT_SYMBOL_GPL(gpu_mem_2_clk);
+
 const struct rpm_clk_resource bus_0_clk = {
 	.resource_type = QCOM_SMD_RPM_BUS_CLK,
 	.clock_id = 0,
diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index cbf0a365839d..ad554c63967b 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -151,6 +151,7 @@ extern const struct rpm_clk_resource bimc_clk;
 extern const struct rpm_clk_resource bus_0_clk;
 extern const struct rpm_clk_resource bus_1_clk;
 extern const struct rpm_clk_resource bus_2_clk;
+extern const struct rpm_clk_resource gpu_mem_2_clk;
 extern const struct rpm_clk_resource mem_1_clk;
 extern const struct rpm_clk_resource mmaxi_0_clk;
 extern const struct rpm_clk_resource mmaxi_1_clk;

-- 
2.47.3


