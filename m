Return-Path: <linux-arm-msm+bounces-86297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2978BCD88C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E81D23020361
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 09:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6406326955;
	Tue, 23 Dec 2025 09:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dlXIYoPk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nz7r681l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90707324B35
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481265; cv=none; b=HEFcwDBmU6w0Sw4anlmWSjunE4OJ6GGbT9F/3PILpRjQth8vJPa9k/b6b3wXuQyUzLwH8MTa7P6iqJU/i6VleY/kML7U+kQtkhUmOniZRd6RNXjTaDnkcuNRDhPGvQw1t2EfUY7N/Z32c9jhlThgWy2ySFWolRY5RBf3FvuCeHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481265; c=relaxed/simple;
	bh=xT3Z0RX9zoOKMq7jFVYf2pwqfhxYhtw1nSQ1v0B4npw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MvzwNYwQ2r9uIutkTGFQ7Pmwqb8Ac+PbHLrQaFI/joaDtuaNbTxgoZk7CfmSgZqSphGTvM8YIKy93OR2fUITiNwzI53sqaRUx00A5Yy/HP9LU5K9NdmB4wwPuR8RRKVMRJpYhgMXzd6/06p7VYRm981LH5bYRNQmJLwZqTIfiTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dlXIYoPk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nz7r681l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2iRQV1568783
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15z0GkALFdQCnt2s+WGZIOpr1bmUM7lJKI9p/mPcc4k=; b=dlXIYoPkhhT+EGR6
	WlMl/tNraeEl77YpioIb0GhqzzNHLHsWF2YhCaND0HI9K2zCBDtmHwhrLOZJBS4w
	8+8TMUuwAW7xvUIZWU4nYrvufwssU9e1NLfPdzQYlEJ9/wt4awLxR1HEGPnbO/Oe
	DxWzwBpZwWS+TYy1yVMw8UqwYvMoz1BRfUIPCbAdx80josI9owiX3D1NSSSBgfw/
	0Km9ppRNF+muHc/zpO2o5D5oQrfINNin+tZnI1bLhIxXCT0JtxGjCi1Wy+InbTMY
	6v9rDW9ZMF4khuKpuugl58hUVaS8mWr7Bey3A57hj5KoZbKLFICVB3ESaz1zTBYS
	2Ysh3A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b76yy31jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:14:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bc240cdb249so4399677a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 01:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766481259; x=1767086059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15z0GkALFdQCnt2s+WGZIOpr1bmUM7lJKI9p/mPcc4k=;
        b=Nz7r681lcm/MqN5ngpzaxGDk2319DfilDGzDt8km2IQO5ehRi4/MURG7+gF8dkkhcV
         bk8ee3+/bjpyeq7gZxuuftbW8I7eEBGpC5bXwkcj7MkzLy51SIH4HK/BfswHxJmf7ACp
         +MKYnRmLwY6vSmWIXbsSThjVTszaz7JFrgx8YUUfp9s75GjbIYMSA3Qx1s37m1w5xL1n
         fnzQQ0zDHyJNtDwWjnRyyVKAVJLYzx0O+gxSe1YiOKeID2KuVYQX+ABDBktNUd0bkZun
         Ezq7WajNMCdXUjUfcsfbZuxe2xaPuOTmyTX7xBlty4J+pF+UqHLk/CkvcAoxGQ4T1l67
         rfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481259; x=1767086059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=15z0GkALFdQCnt2s+WGZIOpr1bmUM7lJKI9p/mPcc4k=;
        b=d0Um+rKmOlXdw0xdU6u6ZPjM2Cy0M3tWez+I/ygVZyAGrMWFPfgq3mwEtGyryT2pnf
         B7Py8ebn9teujCqou8TLU1OjyQ89aXEU1JenlEx7Bhqe9A1GyfJrYvMGAtvXN9hWoDjv
         8AUtnI1bk7NN0iszigkBKD3QMXzQAaek0xfKW+Ozjvfcn3py8+lukUehg77Sf1i3ZeGs
         BT93d3p/fMj9GBFTvVh05dX/3Q9x2hTlPLUMYcDsMoVgKRUmbl1aKo9wqawBWOopYxdd
         xO8/jL3fXnjG3KqSn4xyvLdLM4KQJ2B4zIU0kiVH9JjehxZnSM8pBMzB9GCwFXldnJ3e
         pnLw==
X-Forwarded-Encrypted: i=1; AJvYcCW37v33kIUmlEKIxXoj2JmNrueEa44MJWHbyOXDhd7v884Xc5sPBRJIw/Fg18eHG+1bjn9G5Y39AyVfPWxE@vger.kernel.org
X-Gm-Message-State: AOJu0YyNt9GsvUXV96porRkgchl5N1/SbWjic3YvZCReIJY9nkc77NkG
	j8sav+8dcfm0xI4uhCNeOTxTcgWj57GGlsivB/38RB1l5vOxV0rMuNPD/9fIdzjUfE3j4j4ztkZ
	Y0nk6tEM6KVlS+aUWVwTLOGe/BBcqg2xTg4PD4L74c2m0+kKNDwMgRs69hqiemNHDcCWf
X-Gm-Gg: AY/fxX4lYhhV8b+ARRiu09jCESyGVFsNXAnbHt9BI7rXGUJvqyM9dNLYx+8F72PsWL5
	U4ZFudEtrF2VhIqngj2G1buU17tzbGdrPZ3IvHltIu/5so3gePe3UJhVzg1ipBUck5xFZsjjBCY
	9w25Yey3IJxXIL0WtlhBi9FDAZyCqziX4wewsl3yVV7zGHbHKzQNbT1D5iAGskKPof5EHZ/H2aA
	14dF5iVOq2r6RVWpMtysuu+fiyhU02lPACAUlPqeaFDpCRXA/BgwBI0R1+1ihzv1vWT91qbe+UM
	YRdZw3Iu9R0sknQdS+PjkQxmmt0aWKi7OJDniZcpDQXT8Y/9MR/ZPNwSnMfpQbIRfANLD9roV31
	fEgr46OX27uf6Z5ZZUOsSfIS9wlN7SpiOr3Mj6Ku/BzyJXfyAyiVLnlIOVKut
X-Received: by 2002:a05:7022:4425:b0:11d:f0d3:c5da with SMTP id a92af1059eb24-121722faaf3mr15338510c88.43.1766481259472;
        Tue, 23 Dec 2025 01:14:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9fkd9hZsopvGc2lfvXvSoLBlIoGjtpZpf68WoLQpF6SXYPlFmWv6sFE6X3j2JF2BJQsJESg==
X-Received: by 2002:a05:7022:4425:b0:11d:f0d3:c5da with SMTP id a92af1059eb24-121722faaf3mr15338486c88.43.1766481258920;
        Tue, 23 Dec 2025 01:14:18 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254cd77sm56931833c88.14.2025.12.23.01.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:14:18 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 01:13:47 -0800
Subject: [PATCH v3 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali ADSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-knp-remoteproc-v3-1-5b09885c55a5@oss.qualcomm.com>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
In-Reply-To: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481257; l=1292;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=xT3Z0RX9zoOKMq7jFVYf2pwqfhxYhtw1nSQ1v0B4npw=;
 b=es02FZMS4tTBwODpq5fH3Ay/WKnYn0r2xil6rHTrDlUYq5FIP7A1UMfSWmeszR0Ssmuzkb4la
 29CTURKcFHQACAdeLe9c9FGGPNGsgqpIY9js82ujlYkXFnQFmIS7gLK
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NCBTYWx0ZWRfX6U4NEmdUadwe
 0gzcGvnkjdkbnFCWOc3STtqT9qgaHAsLxncYI1HTKxFyHl+3AyCxW19rjijGO0boR4LJqcr2osl
 tI1NYDPuQrCHKHY37spVsMdzIH+QWU0ECOqHojLabtBbTake98xP9BgJ58prFxs93ELYHfoqOwg
 EcwKw2eRK+qoGo8I1APsOyXgV9JeSRf6TfIxB+u+bQSx+9ErsMN1gGTaWKueqQezvGR0UvFdZ8X
 GdDG+8W5xcJZKDFv0YQH1Mjk9VjOjx7o5UyXFmftxP/EfkBflECoAvarWrX86OLKbydumk39BIb
 OMQXlNJR8CFGXrLzBeQoM2bLpLijhgx5nIgWqG/0Avv90eunLAh/NQO4wNom5st91HWa9ZaK1V7
 N8K+J/GMhckonzPS3hsJ62GriMQKDt7JYEOtwY8wA0u9MBf12A4amxvnaAg+PpAGAQyroFbYwsi
 8REBhVzveDAkJIBYyWw==
X-Authority-Analysis: v=2.4 cv=Zb0Q98VA c=1 sm=1 tr=0 ts=694a5d6c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7zWBZCs1gTFKjwm3VpwA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: FHDTWwqUCLWEHrvWiBebT66Ok2liqgom
X-Proofpoint-GUID: FHDTWwqUCLWEHrvWiBebT66Ok2liqgom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230074

Document compatible for Qualcomm Kaanapali SoC ADSP PAS which looks fully
compatible with SM8750, which can fallback to SM8550 except for one more
interrupt ("shutdown-ack").

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 2dd479cf4821..31dffd02125a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -28,7 +28,9 @@ properties:
           - qcom,x1e80100-adsp-pas
           - qcom,x1e80100-cdsp-pas
       - items:
-          - const: qcom,sm8750-adsp-pas
+          - enum:
+              - qcom,kaanapali-adsp-pas
+              - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
       - items:
           - const: qcom,sm8750-cdsp-pas
@@ -95,6 +97,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-adsp-pas
               - qcom,sm8750-adsp-pas
     then:
       properties:

-- 
2.25.1


