Return-Path: <linux-arm-msm+bounces-74048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC9EB83C9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 11:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D333188425F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 09:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7383230276D;
	Thu, 18 Sep 2025 09:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aonR3qr7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADB0302745
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 09:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758187693; cv=none; b=ujwCblS7wzQOAjbJjZ2ejyvi6x7q1nw9kaRFqrWpfraOnQF7cKYMeh5Q2oLHc7G/AJ6T7H/ht4c1hwjLvSShfoA5gPKz/CU0Q3o5Yf21dZOajG2gUCNAqg0vqcoeY5UAgQ4oHtO7bS3tcBqomgrBCfFEIL/7BypPEFwoi8pbhno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758187693; c=relaxed/simple;
	bh=Q2k1OGZi1tJ10Qxj2dLCmgjuSxg9MrRTOJnHncy862U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DkjAAh+zwCfxWycAyipuTqRnReVgCwItpxFuhvKxg+ZWgOr7SbRSStx8jc4otGvytC6N/1fmrgnMJrLaPR9HmTQ1o84Tqp2IGDocBPxrRhXsWJBTNsoYlzb9N0tIWj/uS2lMRea2/9dpWDROi+sqtc+wkGjlvW4xrK8QqtByfLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aonR3qr7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I37HrC026793
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 09:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1vmZRbmtKnmDzwshtwRuWl1jymhjwTHzJdcYwocu9vQ=; b=aonR3qr7SLRQP5uu
	wW2xW+GodCH1vU+i9Qz8x1VdOjyNPLASRv6GCcHlIAbFMaDYk7R4YRpCCqowlmC+
	oavLQpaWbGtrbf81qvbkJQdKniFJjIX78g/dt/H1iMMPQSzkcZYzWU64l1vBpsR8
	m7pSWNm/JekbI2eN6jRs3c4UqX8yDknDayh/7AdjIX+oE6SOgNexnC5To8Z3mlQi
	5SRfNX2AL0TJZ34702A3up/oDfy0jbled9W1DGCjSou0XrvDUkXFgn5XpE3CM9rV
	zagD7O+Any7ClPPDVLpg89PEtMxrbda/mR3bFcG/UJvES/pkmVxV+HDYq7xtARVC
	b5CGmg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxt5s96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 09:28:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77cd58a9939so757924b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 02:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758187690; x=1758792490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vmZRbmtKnmDzwshtwRuWl1jymhjwTHzJdcYwocu9vQ=;
        b=F+RlkUUBB6vK7RNaw3I57hW2NuJIJP1iNWr0IFChwQaZrt1B/cti8FIMdc9W+EcBsK
         g8Xhue92hou/isDTL05vc3lQKKkCecA2B2GeYjhr3iq5UzCzg7uGyLaknFNauYTqhGAg
         iNAcjBpVVAs4m+lcBXzc2M3M5tRzrm02DEITEX10DxrCIFoumhLEaqiIfksw9YROiDUk
         phfk+aCR7G1CKdi2/nO9iuY/f4VVr7EBBpZM8DN23zg+HfqNNy5iHx/79NNE3S0nnE1U
         n8lguaVtbAgfP4W7YMDp5RMQPbBB7M+vj3kpSmFyuJr4uN6FVdzA15Q+ymxa8tiPOJUX
         yNBg==
X-Gm-Message-State: AOJu0YwI2XusUVMIuYN0tlPZCGzWf26hD6A9Ko+S4umOFWwsOUYOJ/t5
	G6gD2GzLe8Jcf5z3+HEUkg8tXkJHZ5IVYUMsDb4G/4adtA8Pnw1vj52ElARgQJ0GE8e28twPziB
	GtJXxDO0LTCDgQA0HD5rEkMMIQW1thq7SAeJXbR8YXxbSurNYdK5yf850bQYzc31apIpt
X-Gm-Gg: ASbGncvsPTeKBqvu6P1Wq0317j/zPQX4WOMlH409MTtevY5kcNdnQYlrdrGpgENYHpF
	FK03Wfth/nHevQUB9dpgoEj4CcmZSOLzFMQZOpAFfga3Jf2HwuhZ2jfe7ousBoHPBFn8tqXxOoR
	LFOfA2q1oObE6NlSZ9F26CzdFKrVBlkPY57yJo8kImH35IjkMMzpYj2gtT+hjqf0NtN2b9z5JjY
	nMytXLx+Vt29nzoa1EP47NtVDZIMhIjkuVc6KfEF/Ad81bW/sBo67yH2d20vNbpjqIs6N1SR433
	46rFlunBnmwJkXZi/DtDHMfjl6q4p/hPmG2xxHrgEvAcfDlvtKWAHbIU83dTHVkD/kaqX3iMpxe
	/GnSYw9HyC7doruNuiD3ZMjfoDg==
X-Received: by 2002:a05:6a00:189f:b0:772:397b:b270 with SMTP id d2e1a72fcca58-77ce17975efmr3278421b3a.10.1758187689854;
        Thu, 18 Sep 2025 02:28:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM9Ng6LRdJFvsS7waDhp1Q6bkzfw4TSKnJkjVy1/ntjaST5iTEkBNT7bhGD8Yf3/oF4B8ICg==
X-Received: by 2002:a05:6a00:189f:b0:772:397b:b270 with SMTP id d2e1a72fcca58-77ce17975efmr3278394b3a.10.1758187689401;
        Thu, 18 Sep 2025 02:28:09 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb79b81sm1819205b3a.10.2025.09.18.02.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:28:08 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 14:57:02 +0530
Subject: [PATCH v3 2/4] dt-bindings: rpmh-regulator: Update pmic-id DT prop
 info for new CMD-DB
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-glymur-rpmh-regulator-driver-v3-2-184c09678be3@oss.qualcomm.com>
References: <20250918-glymur-rpmh-regulator-driver-v3-0-184c09678be3@oss.qualcomm.com>
In-Reply-To: <20250918-glymur-rpmh-regulator-driver-v3-0-184c09678be3@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758187677; l=2308;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=Q2k1OGZi1tJ10Qxj2dLCmgjuSxg9MrRTOJnHncy862U=;
 b=52X7WcYtkPgVaETGF44fZkY4QHN3oYL+sncyuSRp6tGU+gmkRNABc3+goKEwj4MmxeHDFNaSP
 3AL8iQJ3/zOCrlOM19167QxgWkREpUsOHiFnMgYU+lP74ABEvrd3joY
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-GUID: gOmr3O8DwxD4ygpPf2XdVSRXlFSoRF7f
X-Authority-Analysis: v=2.4 cv=bIMWIO+Z c=1 sm=1 tr=0 ts=68cbd0aa cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=QlHTb26AAUdUyTm3vN4A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXyUehISvDn7me
 LaHDWIAIWA/NKDP5CEXx4COWHtpDggkCV/PbkD6befJ0lcmIr9oSRb0pEuk4IcvoL6jwsJDJVvp
 0iweUhEpy33AN1h5rvyLIud1uiEueyawJJsKqMJutlFBNMTmD03XTWhINVhNw9SXboVEOxx3fzL
 0Pn6Hm0B2wDbAsAyZZgPqX+X7oC2teZLpAO8Zss7Gd6v9j6pfY3OAFQihIYE0AVtcI/SGFupIg8
 MoRmPQDWDwHzaPcUCQySTPop77twyyMcCCImp9h6HZFaU8NbtZ0ih3mhe4QN15K3K3zbyNJE081
 1xWlFStx3LYSGfSjTGwfI+BSAbHlZTYv1o/4ISoGhLsfPgrk3SFRvHxazw4XgeaHmXC0iWrh1Cz
 ecD6zC3J
X-Proofpoint-ORIG-GUID: gOmr3O8DwxD4ygpPf2XdVSRXlFSoRF7f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

Currently, CMD-DB names for RPMH regulators follow this format:
`^(smps|ldo|bob|vs)[a-n][1-9][0-9]?$`

Here, the `[a-n]` value is read from the `pmic-id` DT property,
which is unique to each PMIC present on the board.

Note that in this older CMD-DB name format the SPMI bus on which
a particular PMIC regulator exists was not apparent from its
CMD-DB name.

New targets like Glymur, where we have multiple SPMI buses,
overcome this limitation by following a new CMD-DB name format:
`^(L|S|B)[1-9][0-9]?[A-N]_E[0-3]$`

Here `[A-N]_E[0-3]` part will now be read from the `pmic-id` DT
prop and it includes the SPMI bus id `[0-3]` as well.

However, the PMIC ID part `[A-N]` of the CMD-DB name is now
unique only to the SPMI bus that the PMIC regulator is present
on.  which means `L1B_E0` and `L1B_E1` are both possible CMD-DB
names for two different regulator LDOs present on two different
SPMI buses (bus id 0 and 1) on the same board.

Note that since the new `pmic-id` DT property is a combo of
PMIC ID and SPMI bus ID, so its still unique to each PMIC
present on the board.

Update the `pmic-id` property pattern information to reflect this
change in the driver handling to support this new CMD-DB naming
format while maintaining backward compatiblilty with old CMD-DB
naming format which is still supported for older/existing
targets.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 40e57b10ebbebeff130871b6d978df64111b6f29..40ddc64577e78b5c0dbb7b4e8893a08e8b37c92e 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -108,7 +108,7 @@ properties:
         RPMh resource name suffix used for the regulators found
         on this PMIC.
     $ref: /schemas/types.yaml#/definitions/string
-    enum: [a, b, c, d, e, f, g, h, i, j, k, l, m, n]
+    pattern: "^[a-n]|[A-N]_E[0-3]+$"
 
   qcom,always-wait-for-ack:
     description: |

-- 
2.25.1


