Return-Path: <linux-arm-msm+bounces-4362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6F380E6EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 09:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D2F51C213D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 08:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F23446A6;
	Tue, 12 Dec 2023 08:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bWViSQ/W";
	dkim=permerror (0-bit key) header.d=linaro.org header.i=@linaro.org header.b="RMfAAful"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AECB10A;
	Tue, 12 Dec 2023 00:55:50 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BC8W0X3023252;
	Tue, 12 Dec 2023 08:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-type:mime-version:list-id:content-transfer-encoding; s=
	qcppdkim1; bh=lDPE/Wh8ZqRTx07oUVbXiwpN0yIqml4Pf3dHashn5bE=; b=bW
	ViSQ/WzhrjABmZ/SeOZc8o1I9kahz/MBn50s8TSRoKAMWVOnbIPva6rQT/8hEjkl
	oQuy9sm2fSdI8J/1GXqypQDpTHY7dKxcT+WbROcWd/evAmUUv4Y2LP6GB5Gkt3gT
	QQ3YospkH3SXUMub9Xnq8PGjApQNPx+t8ZW5lWF3GUOLHYKpY8l03H+3p4XX0zOa
	beJTsDkLIYDXmB7pIj70SFdXPEpNEpo/14Rk4JnDTo6a33C/nH3Pz9W165e83Ie2
	ndAA32mBXZFgvWroEk3I8B7NUepKqTmhQf+3+mrWFJNvyNCj8NYpjmBCPoXeiFa/
	ctHrUPipXVzJ/Exffx2w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxa8jh7b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 08:55:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BC8tcdr014732
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 08:55:38 GMT
Received: from hu-omprsing-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 12 Dec 2023 00:55:32 -0800
From: Om Prakash Singh <quic_omprsing@quicinc.com>
To: quic_omprsing@quicinc.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
        vkoul@kernel.org, cros-qcom-dts-watchers@chromium.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: crypto: qcom-qce: document the SM8650 crypto engine
Date: Tue, 12 Dec 2023 14:24:54 +0530
Message-Id: <20231025-topic-sm8650-upstream-bindings-qce-v1-1-7e30dba20dbf@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212085454.1238896-1-quic_omprsing@quicinc.com>
References: <20231212085454.1238896-1-quic_omprsing@quicinc.com>
Content-Type: text/plain; charset="utf-8"
X-Patchwork-Submitter: Neil Armstrong <neil.armstrong@linaro.org>
X-Patchwork-Id: 13435556
X-Patchwork-Delegate: herbert@gondor.apana.org.au
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18]) by smtp.lore.kernel.org (Postfix) with ESMTP id 81C94C0032E for <linux-crypto@archiver.kernel.org>; Wed, 25 Oct 2023 07:28:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand id S232579AbjJYH2a (ORCPT <rfc822;linux-crypto@archiver.kernel.org>); Wed, 25 Oct 2023 03:28:30 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d]) by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E15DE for <linux-crypto@vger.kernel.org>; Wed, 25 Oct 2023 00:28:26 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4083f613272so44979505e9.1 for <linux-crypto@vger.kernel.org>; Wed, 25 Oct 2023 00:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google; t=1698218905; x=1698823705; darn=vger.kernel.org; h=cc:to:message-id:content-transfer-encoding:mime-version:subject :date:from:from:to:cc:subject:date:message-id:reply-to; bh=JJ2oRpaoJhce9I8GPs6HN/A2iLP6BscGnxopX3PgLBM=; b=RMfAAfulNGvcxjip3liXEbYW6VGMPpYhK0i00RfK4zZCK2Kxo1E8L5r007nG+t43Ig ZaP9QFFJ3BGlfXEEmA28ckUpebTbOvdwYb77rWLgIYywx26DaM+6hiYP+gI6LOHf7oK3 kYBR/ynzHFeZqoPrywRXIBgKrRn/Y37dsaGEj9LspbRdXhh0KdQGAdShtVfu+dMLnH6J JJGNy8wIxtbut+BErM0XWn8E3OfOz3Hw/xfGN8NhzGzmJdSntLoPTTVXKOte6o8APvtF KyVetCh5wcLze81nvSBmwnfaYs6dQgvkGHkxe7Xk7l5Z5uhwYQkzf4o8kyVdJ/RcayXr em7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1e100.net; s=20230601; t=1698218905; x=1698823705; h=cc:to:message-id:content-transfer-encoding:mime-version:subject :date:from:x-gm-message-state:from:to:cc:subject:date:message-id :reply-to; bh=JJ2oRpaoJhce9I8GPs6HN/A2iLP6BscGnxopX3PgLBM=; b=WGLmRRc6B2A2DOSHqbeYatw2q0Fype1/JBBbk78GBn//3VP4F5jgU1nXizXXuGj7Tj UAlrjHEC/4zLVpzNzC5UXdYnIW3UXiLtitIeQBsGQT0cX1rIoBA0KZWRJyPHUDABzQLl R79OB31Ak/WA4Cj9LeoIbp6dQkR+F8VIqz2/+deemVGagvgPJeJOEJOBH4erxT3dlK/k noKrD1twSY7GHW134wy8Us25tqOGqAzxd3lx8DE41/Bp+jotVMuEMu1AXH9Vx5PwPQSo 0TmvhKrgffb5jbsxMcdA5PlRATQa6Rdyrt/ibWsE79Qvwy1CXPMF9uR/RVL7QjAwqhbV /9Mg==
X-Gm-Message-State: AOJu0Yy/rM5A8Olzgwl87vMgLyA2L1OPlqycgDzsn/pm1nEC9zuhrwJu Qj7sIHqvecSBgvcXURqzbT0e4Q==
X-Google-Smtp-Source: AGHT+IFor3h+dAr5oQsSJ1vHc/MU2j9muM4tBS5eoWssbySl5NgMcsBNmIBjd7BJk1YIpCgKCjIEkg==
X-Received: by 2002:a05:600c:198a:b0:3fb:a0fc:1ba1 with SMTP id t10-20020a05600c198a00b003fba0fc1ba1mr11964689wmq.35.1698218904902; Wed, 25 Oct 2023 00:28:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a]) by smtp.gmail.com with ESMTPSA id r9-20020a05600c320900b0040644e699a0sm18495839wmp.45.2023.10.25.00.28.23 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256); Wed, 25 Oct 2023 00:28:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=BOUjaS/EmVt+3/Odcqx3EdTXwZy8c1+gLrnQRALTOxs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlOMOXdANPwSzrGljuoM1hjjOOdVulE+eo81QTVr/y
 j+OOf0iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZTjDlwAKCRB33NvayMhJ0WqgEA
 CTcnEC2yItqtgysd1O56cU5W92ZUXW86INCYQjp3ThOJ3nLtWb5K2hvzXSBW4ubWFln70So8vEh5LF
 hgZZB3TdAnmNb7NPrSoaCd3U4VpKLEwZwq7VYqMjQFxcONA5s+N1vWw1EM72aml8JRYDAAeFzJJx1c
 vzszHpHFTDRiWP3co7c8NLlSU0WBYemhNCQ+ozyQ9wZU78pVI0Pp2KNE9F3c1D5Zf1Q4XOUJ6LOnq8
 5DmD+pPCnhRKniKxuxPgQ79jJUKJcZvd91B0ICIfvRLke4Skaut7WcBhbN7VHhx+99OXB/rcTVZiS7
 qIBx+l62bWffXp+9lhX+DrOD+3kIRwUvNPQYEl+e+182m53WXwCCgtorWdGXEPISNDAT81evKq983o
 iLkycqxxu3vIPu+Tm2iRvIfSG1PSBrboziwCCZMMANDi8/GVXC2hei9yhSKvIm9YbnzIgYsQtEN6pO
 oF9oCXN/5FL4GOkLZumbu95Np5U1roLXe0796nVvUQJ8Wlb/dXoZ6N0cbx60XiOnGF+i0cjnlbMrKF
 ozKO9GjtX21GBKIo6rWy7X4lBU9GdyISFSFH8rDZp8akS6tUVLHaLzMG+gjd/euckYDPUzbEF5eGLw
 3yV/L+me0mhqnA5imKcj2KN7BFleyf3XTg8u8ipK2TsjFr1uprZjispQgpuw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp; fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: bulk
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MFm6lAxEwKdo7n0FGVAGyt2JICeAYwRF
X-Proofpoint-ORIG-GUID: MFm6lAxEwKdo7n0FGVAGyt2JICeAYwRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1011 phishscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312120070

From: Neil Armstrong <neil.armstrong@linaro.org>

Document the crypto engine on the SM8650 Platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
For convenience, a regularly refreshed linux-next based git tree containing
all the SM8650 related work is available at:
https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm85650/upstream/integ
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)


---
base-commit: fe1998aa935b44ef873193c0772c43bce74f17dc
change-id: 20231016-topic-sm8650-upstream-bindings-qce-c6ae7eda5cba

Best regards,

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 8e665d910e6e..eeb8a956d7cb 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -48,6 +48,7 @@ properties:
               - qcom,sm8350-qce
               - qcom,sm8450-qce
               - qcom,sm8550-qce
+              - qcom,sm8650-qce
           - const: qcom,sm8150-qce
           - const: qcom,qce
 


