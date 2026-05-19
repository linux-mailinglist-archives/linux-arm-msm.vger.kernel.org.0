Return-Path: <linux-arm-msm+bounces-108473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBwCAyVJDGoMdAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:27:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AF457D917
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2613E3060FD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A534949EA;
	Tue, 19 May 2026 11:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HMvil/hN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZI17VQfJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DA3492532
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189721; cv=none; b=dsxvgvfLk2LNjceOxAfzx2ei724v1RQiJLiV6iRq2redrCYwYTfenJ4UoZES1aSKfjeG/ngdTlzGMf5bTfJuMLQSMr1z4oDDfgTs8QnhQ5dUpzLplEYJ3b6+sLO94jpdJGMUQ4iTVIbbmCAvFKl7IpppRIVZQuXVY3xLszvK4TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189721; c=relaxed/simple;
	bh=/0gH2RBKVFdECZHy2OYb/vQdn0W3A3ypRR06Nb2Te8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=We4a/T6tf2w6uwboQ5qeL2A6jB+kKZ1RNtUmCVlQV4gpv/1U66ERI3sKqSggGi59nKN8ag5JO+VjDqkXUj6gbFThGjlBVu+PSMJLo43tf3mO3AybmL80e/MN9LiBk/l+wmP2vrcsRD87iJYfpWoALk5nFMoIrGpOK5fatm8Ng5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HMvil/hN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZI17VQfJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9kwao1257190
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5rZhel/ZfqNBkxZ73MGg6Xy1kCPJPWKFenIAB/a5RyI=; b=HMvil/hN1BBRUAR8
	oqc+IZxzY3iqmsWqxZBRrDVcknoA8poa1f0jhWVnaGAxlxkJBdFEsVJqaVAB1fDF
	klE80MHM7rCWV+GK2H3dGAOuDB58XnjcXiowPKxqLDy/gahuMj49IfWILauTOY8x
	uiLgZvZTG+EWU0YxOZcVbV3OHYeEGYY/5FTR8tOAqHJDhDpXclOX4eGkHvzFs8Ds
	bs9L0M4TaPM5mF3VWva+c2CQC3pECmrdXv84rhxv3Y7A5FGqzT7K0/CY0NLOjchv
	sr9CdjY0b6UHlSh3hzk03JOy6g73ZJwp90UTa/Vd1PCfzAuudDuRxcQxlXmZX6Ap
	a/fz/g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8nhj8b85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:21:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9fe2d6793so85617055ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 04:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779189717; x=1779794517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rZhel/ZfqNBkxZ73MGg6Xy1kCPJPWKFenIAB/a5RyI=;
        b=ZI17VQfJoDa9EslxqhTBDiRFMKC9a+Ku3VQFn5tNyP6V4hhn1c7yXAS9/yeUuA1MTX
         +hzfqzWnjRFOofN4ULvaFjiDOFSLAKvWbqYKAq08c+jL66Zj7H4+tGehbhqvI1LzqlYk
         CbqRSri+ICPNcRhmICMlR+TNpegfA+H2xrjZLC7xDIeTImC6E0PWvXtEYknEBcCdW2lQ
         bUBugyN8fRhTbzhL52bmhb4yhglHlK6gPIPu4SAlwQiWifgE7pIPzCfaNjvUHbOsz4cy
         tICv8KtwLBRRYIicWTvbO9YYDVpUBUarjtF6O28ffcs3/29rCBWgeOPKWyuQ6nKiXgid
         Beew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189717; x=1779794517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5rZhel/ZfqNBkxZ73MGg6Xy1kCPJPWKFenIAB/a5RyI=;
        b=EXeoR2aEg1wRus4ktdTcbXwDBXHPTtSMrF4qnj3zO2IKKxV0MiEUoFDtfodGMtt6de
         9fXkncOoMKLCpDvOdzVnzCPdSxsK9knN3kCKephFLYaYOaELdED5KSUvS0j1A1nKGbCW
         EFvqRwsmoTa7zlyswdwBqhfkcGwH0wvucgNAaVdsdXDPUKV+DZamijTF357diGmMAQMN
         FXziYptgZEARXy17cU4avt4QQFdvIdfSyNmG5NTVaT5HccH8/ab+mPht4MlqWq4m04/L
         EnqsqH8QdMbqKcqzipathnjKgOcV1uSKVCJgUieZVba+ou6MEjP/mEexwIaByYImWSnD
         Ng4g==
X-Gm-Message-State: AOJu0YxdzG/Od3IIHE6QALO1tO1QBCyCWtjzaDHVM3zad1dUyc8xcpqL
	kzEy2VcZ3wSjB42MbgoBOOEaMXbLmmRWPLVxRclAXlvO7SD4DRSaibEGAmpN0hEZ/fOfplH0FW6
	MgK7SLWfjp0b6mF32yk0eJK+dsQ47fqzOFKFauRuL/nLd1WVjkUis/BeLN7g4Wv2Faoz3
X-Gm-Gg: Acq92OEZSmQ022Vseol7w7pb5O6a8DIhPP6lFyxqX95Nxk851lxtE0KgqQMVYNsyyK8
	SnlxQVDFS+Y7mveech6GD5VN6HWyqr6L6kcb+l2JTkyROz1mm9vBCaL5MmSrmDeiPXgYXZIpmjK
	HBbMtTHB3hu3xluC+At6fgVOPl0o4d04TzGGjoyz0A+FmV3hDdb6hPwYdCN8v53Ez4N/dcKDPzd
	qEhz4Ak9PJ1dFI1QXYzvcJZxCKMYDvSfwFgsBDwy2FKjVfEMpjWMlPSLXIlPCv9t0oIPOG95IWE
	I3FKtTYDECmdxicyFWDZl/JCJQFKND1/ce3JryVo8z4TlvS9fSOtyJ9M/UQlZLXAg7X98DqTqCe
	oRhCICWb7lP7L2KOhCUAuR2aLKWeqB3B2TzeHpDF+rCYPxuY=
X-Received: by 2002:a17:903:f8c:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2bd7e8057ccmr209580865ad.18.1779189716789;
        Tue, 19 May 2026 04:21:56 -0700 (PDT)
X-Received: by 2002:a17:903:f8c:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2bd7e8057ccmr209580425ad.18.1779189716295;
        Tue, 19 May 2026 04:21:56 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe78b9sm192743605ad.43.2026.05.19.04.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 04:21:55 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 19 May 2026 16:51:21 +0530
Subject: [PATCH v2 1/5] dt-bindings: arm: qcom: Document Shikra and its EVK
 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-shikra-dt-v2-1-c01b90fb4395@oss.qualcomm.com>
References: <20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com>
In-Reply-To: <20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779189702; l=1683;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=/0gH2RBKVFdECZHy2OYb/vQdn0W3A3ypRR06Nb2Te8U=;
 b=PeZo0W2eoXZTAKaQ7d3CH96/n9YjlCZSu4624vjdkgZ/G37ljAl03mfE6/LXplfr83jlvOKKM
 nx25Y4zpbIPDL64JQ3xSTflLvSFIXhnySbIgsVgRVUC8kQV7HnIv99X
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: feq9Sl6GQBnOspZdx7RfCym9t5H29cYz
X-Proofpoint-ORIG-GUID: feq9Sl6GQBnOspZdx7RfCym9t5H29cYz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMiBTYWx0ZWRfX1xsc1WW7BTNE
 v5nDkvBBJDHPIsLO0hU8xvpJ4T5xrBCZ6YyPWAfCqIJts/D2dvNjYLaZQt4/wRJNqF9Ft6avqEl
 zQOuuwO3zAHhfY31lSPm/dR7Fpgtn3jsm/45h9HXj4lECLNr/NJ5lJ3hH2EUWz5NnIjx9DSTWx+
 Kf3jO1Wdxh/NPErC0jhR0ihNpSuUEemCW3/cYaEfXwkG/7rjuWAT5paJkwOGKZv9/YVQFYSqFO6
 wSmd1CtLVJ0GCkTVjyzXpyNA7VOiOD9fEmA/uEUopyJZnfoxGYj9a1FS6EV4GM+JmXzMKedR/Qi
 n07Co5h6zgmG/7GG9nvQdX4mvk2PxN2bLC4UNa4mrD530bb643pj607b6Yt3aXRzakY0IU1SbeP
 ourSk5Xn/B/U66OuLWhQF63fFvFP7DuKCu1DprKVASNDolDTG7zJGdMz8UrDoLFEuZI0A/aXvep
 6Q48kcXicgYiCiho4QQ==
X-Authority-Analysis: v=2.4 cv=ToTWQjXh c=1 sm=1 tr=0 ts=6a0c47d5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=nhUW8Zqzme2qF2hNOrkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190112
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108473-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A3AF457D917
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
form factor. The SoM integrates the Shikra SoC, PMICs, and essential
passives, and is designed to be mounted on carrier boards.

Three eSoM variant are introduced:
  - CQM: retail variant with integrated modem
  - CQS: retail variant without modem
  - IQS: industrial-grade variant without modem

Each SoM variant pairs with a common EVK carrier board provides debug
UART, USB, and other peripheral interfaces.

Add compatible strings for the CQ2390M, CQ2390S, IQ2390S SoM variant and its
corresponding EVK boards.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index af266d584fae..7c5c5f4fc30f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -968,6 +968,24 @@ properties:
           - const: qcom,qcs9100
           - const: qcom,sa8775p
 
+      - items:
+          - enum:
+              - qcom,shikra-cqm-evk
+          - const: qcom,shikra-cqm-som
+          - const: qcom,shikra
+
+      - items:
+          - enum:
+              - qcom,shikra-cqs-evk
+          - const: qcom,shikra-cqs-som
+          - const: qcom,shikra
+
+      - items:
+          - enum:
+              - qcom,shikra-iqs-evk
+          - const: qcom,shikra-iqs-som
+          - const: qcom,shikra
+
       - items:
           - enum:
               - google,blueline

-- 
2.34.1


