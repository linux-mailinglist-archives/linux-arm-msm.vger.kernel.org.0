Return-Path: <linux-arm-msm+bounces-86782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB388CE600E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 07:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE2723012BC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 06:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6198C279792;
	Mon, 29 Dec 2025 06:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QARk2Jud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fSRWJm/H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC1E275B18
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766988441; cv=none; b=Sb87X8TeYJ1LhJnJtqj5xIbyxv7zQox9lmCAPkXq01gTQ4pdQnm08dZVN9XUl7qXOzbkYASHZLm++eYUbCITQ7NhU1fHud13tvHEp+ErhDYBx8u1NoSzbJpJEA8uAzDRPJ8YEKMz7yhcjebKBdSSauirIRu7CDdPyUeiybeyhRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766988441; c=relaxed/simple;
	bh=1a/rkl9DL29252mLhAZQjZjZoImYh9SS+B0b29pr5wY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n6RbBg+nbLuoNrC5Mbu/QGQE12fl9YG9Z22FS7FC9rbnSvtD3zjksl4EP5JV5LHaz995ORC5zunVHI7XV3DJBNVL6hZob+l4j7dz7fd6QRLF83qE/gL1CN4Wt9fV+7zFo/mud90vTnEILissm3b5G1G3c2CSGVgOrYf38wGd9rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QARk2Jud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fSRWJm/H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSMdxIE3252780
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zTbjgk+NOs3
	Iov4G6gd+2hf2/oFZUgG+sIHDNi2qqkA=; b=QARk2Jud6WXpGHJj9SRGkA8d/cA
	Iz/L43WUW2LOBZSYB0J2BJEntf7kCJTjtScJK0tnP8ZvXcQDsgEyNu/2swBmTvP+
	6lSOD6ly2+4sAikoSSiyDF6KfPmKCsdeNfy6n+DHeaERhM8fEsqX+sfo/KXR89sN
	lFba19itaweXgfqJYYlVSqI/DlUz+SRhBa/v3lTxrlkBie28pTrwpfYCwVrSTJsR
	Pny22lVnMWaTBJBJww3jQt0ARYRiApErxDf64gnW5lUpOTGeSGSqkwrUs/nenDgx
	tX/j96jKlKtcz101VPzxh8qnICTsi5VKX8rtkFviD1YxntNnwIfVRA5Z0Pg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba4tnuq41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:07:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7ba9c366057so22895348b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 22:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766988437; x=1767593237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTbjgk+NOs3Iov4G6gd+2hf2/oFZUgG+sIHDNi2qqkA=;
        b=fSRWJm/HCBw4Z6MGLdqIiqlSd/uxtJwjIgLIU2XD3RoUKeV1lJo/46WYakijwMI2JO
         f7y9ZvpUYqE5P18DfTx48O6jzuMGW1xBZujKfTPz9SeGnFmNjZlcNLRuNbYbc3Av1TEL
         isROlL8O5nNMAXmfppKm6c/cV7BGTsyeti1YkaZefTlIBZgCEjw/rlzvuLWyROu2DH1k
         FIGNyH/K0LbDGM6wpZpsNpuj/eEAUrcKcscW26QnTkT+hQiorKoahgaiacQI8yzmyKMQ
         qRiq+ZVtquS3Jl6xPqLmvHzpKuyuQkGxsLOCKumnwAIXeSnToZ3+PKsQqdWc91bbAaf2
         nF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766988437; x=1767593237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zTbjgk+NOs3Iov4G6gd+2hf2/oFZUgG+sIHDNi2qqkA=;
        b=WFfL0IRx6aq6SEQ3WtlbLE65BcFprl8BABQTSNU/9fBvnoVBzowWwLt9EaVdrhcgtT
         1b5UVXwzgsk7YrJOG1SKGbmKahs2EsOFSV7/fpSMrcneosa1IUmRhjAgUEqTgL0J2Ake
         d2IyJv4j1lg2iH8nrrhHnvAEhi5wmPy67AQlXQc4IcinOJIJ8ZY20jlY8NvmZClBZ9GU
         6wO5qd+DOH62esPU11MxWVt+haxgggn1uxcv0UrOcJ4a6Vx0M8ozjCzE+eOakJGfWhUP
         xiuX4F6TtW+xa8Ag8mZtD2XoLFp19AhE5kH53iaKBHBDW8K5/2LKseOaHOP7AGHvtz3B
         Qtiw==
X-Gm-Message-State: AOJu0Ywp3C6ikYUv2uHuFe/dGE/6N9YIZ/eSi8UL6gQWU0Rny9hLkbIE
	lkPly1APHvUI+/HfhBBNsuH5m6oTbz0tbyykBDoRj7ckzaWE4Zk+HOLg6je+eXra1FTBzhFamPU
	RO40HAv2Kvb+7NnQptntcRa5PPFgzn4VcIV6EHGbGRP1NVAuw1lOV7rdkCev/r1HjnAtA
X-Gm-Gg: AY/fxX6i/en2uxZ5reCSnd0vC349qYxyfeTm9hhQdSmrEhDxea7vKkR2DezlQ6mvWxS
	L4Elt1a/z2X5GNbISk6nQ118u1wh49oyC1a6AdnBcI04u07e2d0TpuGuhXJeeXEN+x4ytI8y3uu
	MbkVodw8N/pqLiqkMllUBnC+TMcF3bmGYGgdV/qxjS82wSebGYvAZ3jke/sJIuFMKNOUyn6Ze4l
	aMHdpY5F1wlskdSzzxqRaYyDdZRh9qN7Tc0CdnQPB2H3+g/NnjX30zSp8q7yp9VibHtg0HBtIq3
	whvVWreGsR+grFedeTputHiQxD4V9a6ueAHhn2o0Q5JGHf05ilBTPwMMMCliuaLwtepe4Qu230v
	D08zijdAgbXPYPmpBxL0qMRVeoQBHCXXA9xEQZ/YXrW+IdKlEHukF
X-Received: by 2002:a05:6a00:e15:b0:7f7:4dc8:55e with SMTP id d2e1a72fcca58-7ff646f9556mr26819267b3a.7.1766988437371;
        Sun, 28 Dec 2025 22:07:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFb5Y4sFr51IIwczO5+Lk8y814x/vUUUITjRTxac/NwTklarS9mW2K1VPjPW7044XMMmmWvPA==
X-Received: by 2002:a05:6a00:e15:b0:7f7:4dc8:55e with SMTP id d2e1a72fcca58-7ff646f9556mr26819238b3a.7.1766988436899;
        Sun, 28 Dec 2025 22:07:16 -0800 (PST)
Received: from hu-pragalla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e8947a1sm27917763b3a.67.2025.12.28.22.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 22:07:15 -0800 (PST)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [PATCH V1 1/4] scsi: ufs: phy: dt-bindings: Add QMP UFS PHY compatible for Hamoa
Date: Mon, 29 Dec 2025 11:36:39 +0530
Message-Id: <20251229060642.2807165-2-pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251229060642.2807165-1-pradeep.pragallapati@oss.qualcomm.com>
References: <20251229060642.2807165-1-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G+YR0tk5 c=1 sm=1 tr=0 ts=69521a96 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QmIOYfwlR66hjO0Y-QEA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: gxalirMBIptbTyTZJ3HGVXvLJyO9M_Ka
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1NCBTYWx0ZWRfXyDDEPNpoe274
 aZLvCC3MyF4Xmvyr6KA93MwBhtV8goVI0w1aoTVPNXGbbeWzTLGJ70LvyywE9SegZ0vhF5wNgka
 Zk7DPxeKOjPgTEINVR1APKgiJDLCwAlZCmxLefxnWhxMMNNzrPK7Y9je4Bn0WlCSlZFWSCu2tR+
 do/ocZcGXaAhEPfbrJdM2WPzDi+ynEopW4FsRWTKkRS9WaZZH0Atxfg6JYqXEuZsvTS13oKqNmX
 Q1oJq+L7tHfQxBZy7gt1W/UxW4CLEPTYHLsMW9eoYbRkdncFauE/SJi5sl3J5atbie7c1lGNYTI
 qgc4VU8lofDF9yDcRSHcskuj4T4Yh89dgBtNm1wo+XsvOZ4kGhHAvVjKiplwVGIWMefkMgcfAwF
 /7/JFPbQM2dBGgK7IMrkTI/rU7n9yjN3gY6rwT1ym5vWJSgbQxDzRFXRUkSzyAcPc+0oMDePBYK
 0SANLMnNEgT/JHgCw0w==
X-Proofpoint-ORIG-GUID: gxalirMBIptbTyTZJ3HGVXvLJyO9M_Ka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290054

Document the QMP UFS PHY compatible for Qualcomm Hamoa to support
physical layer functionality for UFS found on the SoC. Use fallback to
indicate the compatibility of the QMP UFS PHY on the Hamoa with that
on the SM8550.

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index fba7b2549dde..b501f76d8c53 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -28,6 +28,10 @@ properties:
           - enum:
               - qcom,kaanapali-qmp-ufs-phy
           - const: qcom,sm8750-qmp-ufs-phy
+      - items:
+          - enum:
+              - qcom,hamoa-qmp-ufs-phy
+          - const: qcom,sm8550-qmp-ufs-phy
       - enum:
           - qcom,msm8996-qmp-ufs-phy
           - qcom,msm8998-qmp-ufs-phy
-- 
2.34.1


