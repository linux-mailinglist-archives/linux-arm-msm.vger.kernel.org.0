Return-Path: <linux-arm-msm+bounces-105062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mF7IMcfv8Gn9bAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:35:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E6B48A089
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DBD53092352
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 17:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E2B044D035;
	Tue, 28 Apr 2026 17:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RW+wzwvA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HfPeuKX7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EEC44D01C
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777397575; cv=none; b=gHXF3ke46k7J/zLJEtwZ1TXX5TMWD3S5EPM32rcfMaBMW5r/rd7HisJa3xSwdHRNMnl5ayDgSPNgvLlE/aMdmDss7bhO1TTbIzA6dm8n/PAX+wVLkAB5i9e0vGddQ3p7tAhXEcKDYxQx9GvtoAPolef24kIykJWtyN+a30DLGAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777397575; c=relaxed/simple;
	bh=yQAWJBywT6pwqGJLKFwuedfSMNGXnwkl9Ism4JarDpQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bL4IWclcCLNvYboCrqU0+NtP6jaP79IqtRRBaSF9IFi/BI6qFeVyf3smEG9Pm88QoJ1LQTUQl19grLq7nonkuPxgoeEajOcYA+5WIIQtcRuvHIteRxL/dELX01+9hBdNGSNI+eq8wOHiHOhsn3f5gqxgR5hKf6Q4eGwQN2oxYv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RW+wzwvA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HfPeuKX7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsDtO3634398
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dEMWb3CKiGmBJqcMxJUz+Micd4CN6K2YYETwoBGc6kg=; b=RW+wzwvAfP4l9Asj
	jGdz/TNLYxPDz3POML9mOfd3NOPug7kgVb5BMCFTV0fNSwc/qhCHYN+R1SVxuSlh
	rg7HkTSucqC533H/g/aA6RRiwmUkaHIthCqGWIlNCtIzXGyQQILIbx94uv9ln8CZ
	mMTwCa2ZoPBEK2VhXkBzGk8Rb58cf93RcWlSrVMJam+gxeLJhe5VahdYZwS145Qn
	KA1dhEmacXL7RQrGFB4WQVsdk6Ng2huWA6YPcE86R0OsAWvp7BYq/JpH9v/qkJ16
	Ms1/7qV0lIPlTCEu77jlCW/hP9/j+UPB+aB+ND6Eh2rf9SRgoPMkcdhogcOiiVJH
	plIylg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dty87rm3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:32:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d826ed6f9so1634901cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 10:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777397567; x=1778002367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEMWb3CKiGmBJqcMxJUz+Micd4CN6K2YYETwoBGc6kg=;
        b=HfPeuKX70Vr7Cf/DYE1AeN9a687ukk00j4zHo5NRNI2sVyR0mf1ZSF47NXFP7bAK9W
         nl/WDUimen/PdXZj9T6BYJFlPKCBqhetSQI08F9xFrAIlGPPbv+AbLTYGywG7bqsJTxH
         8ESoyEw41JWXOa/1zP08cg35gScAjcHnFo+y3OcoSFcQjnlm4TuzkxDjtvlZhyrhYIyK
         bZL7LLBMwXS4I6721WXsLI6sfpRrUqxG5hWIZvGZvxVRhL5Ga6dwVhQlNGXpQVGB+DSm
         hyP90xCvHAI6yl9veL5xlVpeCj+s/a7WbTRTT7cHiykgs0t7bMjsnO6ICIva6XGcCxgW
         6Y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777397567; x=1778002367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dEMWb3CKiGmBJqcMxJUz+Micd4CN6K2YYETwoBGc6kg=;
        b=M3qmUmTqqo7YNEpROamNvPV8rfjS52NO5OltBcllrBd71r3NpOQW0gtaOhoaPtC6a2
         GdMXmBs6f/sgFQrBFa5edu0wLyrZ0x07RpqDZNywFOfl8GosBqzupzfFOhleLlcjzLID
         dbEdotGo5NhW3BmfmERh2i24PradA/G/DWUUiiOE2MeX+ssZaFGofk1502QAZ1ToSQZ3
         uNaVEvaUBzwaaOxps6/KsoDDA0/yCLY98kX4iKDl9EuaaFQePeoMK1p1jA0dmDUgWdKX
         ayTtZoeU6RKa2Rtddt5ywlY7SZwX4wZ+04cKjQtGZi49Z5rayjnjNnYMHawgSmFmaCtu
         qE1g==
X-Gm-Message-State: AOJu0Yy4kq12C7cGUpVbFQtSJpBmWwa/tFFhu8gNzx7yh4i/aTC6WKt9
	7RhHMjlsFXKLk2s3OxG1qXoBtdmGeItMxwqjuTH5HNE/426dTgOaKWy3lw1p1xeZlOUshal9nZp
	1Laj+FEJSD2uok2O1so4OFT0/E9vXd79AOQHv0Prc+P3+mZHZ1Ys528nk1VsAgHkWeTjQ
X-Gm-Gg: AeBDieuX0ybt82WhSGFCwQbZNpeZpUvlfhcAI+QK1MjwkvVwe06jJ7FJh7wkZ1so+9T
	9dOyoupMweckEkLm5MV4leTZ+Y1/jwfNMkSzUeF7b62mC5u7ilBcdTcjb/NilPoMOruWuo5M+0u
	m8lqvox+luL/nVjJnww4/Uqdewy/xeylzAUbRHlgeWFs2dmB5dDqVaOjN7+b3p+OBdFUV6nAsHI
	mpzddJrHWlOif60HBFi5IF5Rv9MwVDu0H5TNpLYqxUWqqsFQxdEK90HYgz+FJ6uqGO9s9uaMhqY
	eDyoNjhvkua9MuHntYzC4HOm/hEgznEX7wLd5b558BCJ6sc7uWEfwu79zXqFmdyhPFIEkaes9Ol
	Ldc6oWv8hJBpnh8Z7rlA00+eHpxr5shk9yio3HkHM1vKfVAd9W6iai6U=
X-Received: by 2002:a05:622a:454:b0:50f:cba1:18c4 with SMTP id d75a77b69052e-5100da50fadmr52787461cf.26.1777397566850;
        Tue, 28 Apr 2026 10:32:46 -0700 (PDT)
X-Received: by 2002:a05:622a:454:b0:50f:cba1:18c4 with SMTP id d75a77b69052e-5100da50fadmr52786681cf.26.1777397566110;
        Tue, 28 Apr 2026 10:32:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b8ce444sm2089545e9.0.2026.04.28.10.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 10:32:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 19:32:37 +0200
Subject: [PATCH 1/3] interconnect: qcom: Fix indentation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-interconnect-qcom-clean-arm64-v1-1-e6bc3f7832db@oss.qualcomm.com>
References: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
In-Reply-To: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1875;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yQAWJBywT6pwqGJLKFwuedfSMNGXnwkl9Ism4JarDpQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8O83Fu3GfCGKF7sJQ/ZUFjiWtzMYyEhj5ZLnx
 s5fkhc6OpCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafDvNwAKCRDBN2bmhouD
 1+CZD/wPHH6w2qnDNKJ3cBQTuiZ0KvF1tnVH9pGm6JRyFwmQUocpUUDXozSfHDJ16Q0UhryYLfk
 A5JafqUStvVzVHl1viKG6ZuOKZqRcOR5J1OIgeEKN4hGhlHFPeyJjubuaTJvm/mfeOSBN2OsE5I
 1B75cRhoxwF4EJGI5OiJ872G84a2NstxA6DhTEew8mECqTvRGWHruVcABQhKtHliYuTIA9rGuuo
 Gk3Y3GsmbrLf8Z6Vo343qUc1R0QGvv6VBZs0kDjmZPRYGvn9RsDpaS904TrCOU4Y+lQAI88OHeO
 4KbxDX8LeQaJtaTdwouk3dap8NdItPzjuMwBK1mcddXasD/7IP9HhRZNcdceus03uy9IoC6M6+l
 sgLoQRR5FPNzqzud/GWfx8NpwKepeA2BUiKoNPRtwXQmQA73u7hdHz1Z/M0ZuoyZ97f4eCDwLSb
 WrZmbFr1vqo8mKLZzz5h6vjuzwkEujZOZWhf0qEN3d/ZgqIopGiVK0Rvw2jpMrigGyFMFgr2Nj0
 6uAaGXcRQ6fN1dYMQ14vVDddDBRjRkcjeOemM5e7X0L5TBYbLINcVgCfwiIzyLDADFr+Rh9XkIa
 J+iq2ejazlnlwTJ448iio0Wf84ZIOPsgWhPbtSN+xoq1KjUN8+CpB6kEm1HdcLOCCVG8eXbX/Vx
 fJ2Xv0ui4TNPodA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=abJRWxot c=1 sm=1 tr=0 ts=69f0ef3f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UCTw9GvNnafMAvUb21oA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: m-mdomIHU9UgLtDJYZ5O8agtFBcBYrMi
X-Proofpoint-ORIG-GUID: m-mdomIHU9UgLtDJYZ5O8agtFBcBYrMi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2OSBTYWx0ZWRfX/IVG0LHfBKK9
 GCoK+fHt3ehP/wQ2dcKCUc8HemWAKBADg7HwtiwaZcUolUBhJ92duLtNoyzP/cmkxvErBDMAWNV
 it+vHdYIW9xo2xICARalde/NEuXLAR+dvczQKsMxvvNCmqBx0q2+Q7znk01BZQFWya5IIB8bSWY
 shEo3Mp7GazirMYNmxCN7t/kuB/zBT/kSPXcQIza8TmxxrWtZ88pxuWnAVp/dL6ge874pLnTjqY
 yKK2iJp6V35VjMHX33Zli20Vgfdf7zxRC26VgUmdXT3W1SoEBVF6cuH3L8/jXLr5ioFXaTGMdbc
 zxUXD5q9wJLkKfS4qjTGykOFPEFbpHZc7TP4hPa/sdnHTkVCZ5buBEayeIBjQ22l0+VuSEuflDB
 RrCsJUaXCghamMBxrOcWS4noTiEQ/LFUkY7mZ0SdFdt6L91Z8VNP+LRX4zU3X/8cgmhiu9BBTi6
 un9hctkF+68xvxJtWHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280169
X-Rspamd-Queue-Id: 45E6B48A089
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105062-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

KConfig entries should be indented starting with one tab, so replace
spaces with it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index 786b4eda44b4..871663bfd094 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -9,22 +9,22 @@ config INTERCONNECT_QCOM_BCM_VOTER
 	tristate
 
 config INTERCONNECT_QCOM_ELIZA
-       tristate "Qualcomm Eliza interconnect driver"
-       depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
-       select INTERCONNECT_QCOM_RPMH
-       select INTERCONNECT_QCOM_BCM_VOTER
-       help
-         This is a driver for the Qualcomm Network-on-Chip on Eliza-based
-         platforms.
+	tristate "Qualcomm Eliza interconnect driver"
+	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	select INTERCONNECT_QCOM_RPMH
+	select INTERCONNECT_QCOM_BCM_VOTER
+	help
+	  This is a driver for the Qualcomm Network-on-Chip on Eliza-based
+	  platforms.
 
 config INTERCONNECT_QCOM_GLYMUR
-       tristate "Qualcomm Glymur interconnect driver"
-       depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
-       select INTERCONNECT_QCOM_RPMH
-       select INTERCONNECT_QCOM_BCM_VOTER
-       help
-         This is a driver for the Qualcomm Network-on-Chip on glymur-based
-         platforms.
+	tristate "Qualcomm Glymur interconnect driver"
+	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	select INTERCONNECT_QCOM_RPMH
+	select INTERCONNECT_QCOM_BCM_VOTER
+	help
+	  This is a driver for the Qualcomm Network-on-Chip on glymur-based
+	  platforms.
 
 config INTERCONNECT_QCOM_KAANAPALI
 	tristate "Qualcomm Kaanapali interconnect driver"

-- 
2.51.0


