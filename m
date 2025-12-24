Return-Path: <linux-arm-msm+bounces-86553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC8CCDC031
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D16830213EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249B7314D18;
	Wed, 24 Dec 2025 10:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDUoObXE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ABgbSf6l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91161314A63
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766572517; cv=none; b=lNOdit2x9NiaaN/ETT5pIyU01Aem4bnRrbL2rnuVhuRqQkaSZcPZJRw/HJLQEXtqBuFTivM/ucfBeU6IOf7ONjIvFhixisBgearme7dpSaStXwNHoWJW+VMZbl86U8QSC+5vfbd7KBJfsL8xbaw+nh5Yh9xYmvjBMsejX60DVqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766572517; c=relaxed/simple;
	bh=j6nlWo9Zte/AZNkxrawtvVBrZ9vO9LHUPPlVhgWEtgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=svCO5CddbivcQjbXa5fRtwChs65V7RiRF3MOTpb+4dSMah5aitEjheW9CZPk4iBvEPfazXs2Wt4obdnjbpH5Aadt5L4CBodA21FniC/P1ysmGQmO1WNylCnJ+eC5PPT5wZRzht/4rci6C3+vBPzkrfBTFjebQ7jSkb098wWqTNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDUoObXE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ABgbSf6l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO2YGT0461339
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YTxPY3TcxySOfY2Uu61rvScRPeMxccIhMlEzuAx3jSc=; b=CDUoObXEp4U5nRQG
	v4YYMOKj8lxFen4gEOzQC4A1kvJTV6tcPZ3eDpSut3guc2NtVkTft3gC+5u6iJMU
	Up/O7vkOoBKOeRDTx7nDU+Jd4ueQtKzkCpusm5RUxAGPpPhCy0RAdo3bcFfZOAA5
	UI3Ji11gFV8WkFr3SWIYWC1Hlvvdi2hrIM/PqPdC34b1CJu4mP6CGMQoEQtzgL2L
	3IOx5KQf/ik5+ywugpP4322HmcAkpPY2KpTfi1weVpjLnN1y8HgjpO2ztn0Tzxd5
	2iTIuMVmAjdBycxJhmSqoC2Om/HrR4f+T4QhRrD+faU8BGwszymcSfZlpkUhhAN3
	NMPrHQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8ftx92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:35:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee1b7293e7so201780771cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766572514; x=1767177314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTxPY3TcxySOfY2Uu61rvScRPeMxccIhMlEzuAx3jSc=;
        b=ABgbSf6l4ezeaeNTmNVHF44MjkKbyVL+yZq8v4FzWzRBgsBt9mMq+L2b5cSuInVSC4
         7GcagCNTg4QA1K557aIU0KpO+s2SzaRhkpRDQPB/s86yNFqX49eGxkDzl/8Cfjw9aSkt
         wzTYTNvKY3FxxTFbGUqvZBFGeJvMbogf/AZ/o/h2nRGTj0gb7atEXfr0IyMeQ9GEa12T
         C9EvoU7/NiBrNCWCoYK2zaMqq+g1W/JCpcK7CtUowhZiQPlC93/HvT2bCiDpkf7RCtD1
         FMFbWt9tRsB3LND1sw86oAmp6N0CFNqt1PnzDoui5P9JfYKgRJuSXgT9TXiXQaSt5SsC
         9Drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766572514; x=1767177314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YTxPY3TcxySOfY2Uu61rvScRPeMxccIhMlEzuAx3jSc=;
        b=EXPJR4U6Fl7ZAcQTWcrXUNTjOx7BOIAQrSyHoULPNXg4lSC45ZrvGrMVLLHu4NAxei
         AKy19TJzMyVxisrOHW9WJpmzx2qnE1hKBZ1sAPZNShnWcwRVyL6JX4twoqqzdMzMcBQn
         tZsTE+2kb8s9kiE5wqLUJ+gTZIQykYHfW+Oa061KRO4QuZHsWsHTA6a4lbmbmpWBb/p6
         6o1f3tYiMLTM8jnD6TJoyewx/WjleS0+lBLHms2//cmE0W4wHfrfUDygOna268JomLbN
         LtUHnAzgL/6vAXbsaZY3Hd6+ev9+ok9vv+SNaus7DMPJ6QIfhSl4C9lg9+mjV2Xemg+I
         nUxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhj1oUEmYiyn4r4zskCgN0WWdsDcRog7tEeUGueMz6bPpXdRpv6mpPTPuz1MC335XH1iGW4YWz1EuLxa2Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwdYXJpzvEQjtyo6f0dNjDAk57ON5Nkaf4+LAHNvGLKyFoq+4Mq
	8eBWNtAEPeTYznVIqjWWRHRB5dLdgcD7BFMe07j8e8hVzagqXNe6QbG6zeRBoePIK0f+HGn2eRZ
	Jec9M1jGjbArVQiwI0+Cv7DAI/9xe07Ebr32JS1HmfkQAU0+sU8LS/1MJ3W2j6xY5QxkI
X-Gm-Gg: AY/fxX4OkHs1GBeP+V4rarR7KsTrEIXpLOj/cqiATRUFHQHFYWR6LsueLluk3VNKS6A
	Cnfo0SZ9658WJRQUT7RDo0pKWkZaNjoV1lnH854LfU/HQ+LLC5aocAD81/CDowraKV9j4r+h9hH
	Mqcfmjzb/NGeqEOZb7FDY9wI1XoeWwf1QOq+khB6cXGN8Lg+FYpTCoePVavjT2kGhgePiHd+wcA
	1EjrGaSMtEZJwZwc/0gWRhHcBbvPHRLW0YdV6RCaig8VrCIZAS0SYgr6Fbx+7ikEB2hhBtN3761
	baKEHdjC+0vaqG19gOHmdRlaB2ynMx0ILY92V3YPnvztCA4Z/qk8xUSgCqzJ256kg5Ov/5Y9Zik
	gMLyqTUrAI5ZqbW0=
X-Received: by 2002:ac8:5f8c:0:b0:4ee:18eb:feb6 with SMTP id d75a77b69052e-4f4abcb8186mr248179431cf.11.1766572513701;
        Wed, 24 Dec 2025 02:35:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNmGecmYe7lfwQD7aY/ySvDToHZzaHAWpuH7fGMeF6quoYCuVzWNykwPqgKdGOnNGBW7LIpQ==
X-Received: by 2002:ac8:5f8c:0:b0:4ee:18eb:feb6 with SMTP id d75a77b69052e-4f4abcb8186mr248179081cf.11.1766572513153;
        Wed, 24 Dec 2025 02:35:13 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad806asm1729496266b.23.2025.12.24.02.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 02:35:12 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 12:35:01 +0200
Subject: [PATCH v3 1/2] dt-bindings: phy: sc8280xp-qmp-pcie: Document
 Glymur PCIe Gen4 2-lanes PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-phy-qcom-pcie-add-glymur-v3-1-57396145bc22@oss.qualcomm.com>
References: <20251224-phy-qcom-pcie-add-glymur-v3-0-57396145bc22@oss.qualcomm.com>
In-Reply-To: <20251224-phy-qcom-pcie-add-glymur-v3-0-57396145bc22@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Wenbin Yao <wenbin.yao@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1541;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=7/wDNM9Wy8eGw1Oyh/WSaTVNuGnrhF08Nu1CqEGz104=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpS8Hbcot/Ua1hyfW6r8Yb8ukYPY+csfkib1F3B
 vgHPh24oayJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUvB2wAKCRAbX0TJAJUV
 Vo+fD/9LqROlkgt1NbNR2JdPoI3T4gu/95gWqUwz6K9HhN9/d8SIrJHgSt7TBtlMPJSPR1Hfamr
 5uHbgKNKImRgcwrL+tfbPPzJ2H81EcJWDyOErxeYkpO2rohCvxtYnIm9c31wgHkoQ5S+n1gy3ua
 19ADzbGS42hR7gEkdSGn7XrI9UgWQqjPbbayhCPZWEv76oVnXKEHePvYir97wtHVZssZMz++GL0
 ZpuEMmbJWRU4wAr3CIWsMnNh9UHTueY/om6AZOtYjLGSylB0RX7rvyFqm8DcH6XVowEmyw/G8o1
 l3B+SnAs1EAAa+/AuhTnkF2SK3sjpTFcJciwol8lFVNGmhBWgaTLZkIN8KACFQ+N37P6HfJypho
 zjTCS5w7hcdi95UDYSJsbgIOifA04NDmvLrhKz/sLhFNxLR9TDsEjES4lLwzYkXMnke7DgopGtS
 dZ3jP4wXw7mijf6yK+g3GSur42aiNjZI5jQYq7m25OG1gkF0VWtP0nIDvcwvvQb33wUrQXP1fKy
 M7ihiKUVugB3Oazx+wzqJ+WhWMpEqHDGQPtLvBnjUCW4vLx8T3U4bvzqjmctIp0rPQIN6c89WFi
 jHXunGNoC4QZwelCN4bKPygcG090v6ly2KCFoyj1LLtBJrbKxBfg0cNO9uW2ahceWEUWhfl/n3O
 +A2ZtRgIqB3H3mw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: k36jh51pQPRZnptldRmFlMoorFflar4P
X-Proofpoint-ORIG-GUID: k36jh51pQPRZnptldRmFlMoorFflar4P
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694bc1e2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=CzDMsQTYOGAzJB-GoUQA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5MCBTYWx0ZWRfX5li4kaszJKW/
 dF/n/kaIfwYeiYBmaQ81HNJjvRlE6JRWhZ39tLRDVs88x8MPpE2KUZhvn2R8z7Vahkh5b/UbkKO
 b/TqAmoG9IN+sk5eKjngaiGvtpU5n1Do82YrFlU49mOAW6c34Z7LcsqZjfUgkTawLBW1o/gfIMP
 RjKJ0UkLzIANdRRgC8tgySn4HsRqfbl+9zFc4DhK65A3ngdnk+UKv0WSQdqdH+ICjWcNrg7opJc
 Q38pHJC+BQgqVbKUpKgzqJvnRBg78Ij6sVYNSOw2SxsRZj0iO2If7vUMlT+rZJJSmqzceAdApU0
 xmPQjsaSeCen7fLEp9ZgiHHWNa8C/Cx5CDkhZXRP9vtEH0ZlyWUh7Fzp7nZMAQ/65XRirKMNc+a
 XWjdmrP4UxIa142voB8DeNzMpcjcdK7hyD6N5+3BX7jNkKFdUaVZhOO9h+Fb2cZbbAiGGgSeY6U
 WQd6biEUjJNKMpeoZPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240090

From: Abel Vesa <abel.vesa@linaro.org>

The fourth and sixth PCIe instances on Glymur are both Gen4 2-lane PHY.
So document the compatible.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index b8f3b55efd6e..82316aa5e15f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-gen4x2-pcie-phy
       - qcom,glymur-qmp-gen5x4-pcie-phy
       - qcom,kaanapali-qmp-gen3x2-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
@@ -181,6 +182,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
@@ -217,6 +219,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,kaanapali-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy

-- 
2.48.1


