Return-Path: <linux-arm-msm+bounces-89599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5D8D3A409
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D0B4302B11E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D6133E347;
	Mon, 19 Jan 2026 09:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qa/m2WcB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L+jYIPNL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED735309EF7
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816766; cv=none; b=lIM9Oa5F8rSVnvA9SzZT6L7YqBuWHCv8MszgrY21+KLrPamhVkyJbdqZyMHcynyoLS1Ws5n0B6vLBaKxZU0M8ZVYbGAom4CIHLVF9JhTyj42PXcNmwl0IW9e9+vSwa1tbyEMZH1cHVrtWqxHL4/P8NK+jB5YVY7NSNeq3orQvoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816766; c=relaxed/simple;
	bh=1T2p+/vbfr8CSkXKP8r2GuvxXHP9/qqQvE3njaPgF50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e/ezNpy+PZxBLq3RHZSCzZGKnSAjGBxKI4dloJWGlgJMFdfN9WxAqnf9VZlhs53dRfUp8KcSxKz5StE6Xh5tfdhMWiZMvuVKvyn3GD7DaBIK99S6sC8Fn6YdDoEx720/8z8W3K6dhmAPESGvPp4rfnXyVjpjE7rtl/9hAPUXos0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qa/m2WcB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+jYIPNL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90wGK1044138
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=q8/G/7hqZ6psTINWY52jB8tiJ2fk8cXDNOt
	lC9V9Cs0=; b=Qa/m2WcB4Kxy9zsdmPjAqigvYgwMAoGLfUQ1ttUOtU6/k8bhXMj
	hUD3NzCWOEQua1OHwVk8FZl9l80pwPeNAQ/smizJFtiUkcPMOwjwJf2ix4EXsIUS
	OvuYVzkWKVRqS77GDq7FzDZre+lUifxgfk+aKbhgCfL6zMcS06unMyjFtKzEHsxf
	v5Xm/1X55Frmnk6tBeJ+H3Cd5f+w18WR/5hdp5z7xTkmynJOl5KVwZlwwgwnDwKZ
	yu8FQwPHpGarsKbsuH7SYFaS/oIC0QStiQSETP1jUbbCvgGAYHW66ATIxqLRZKoQ
	Ezg/TunYQ2kabHpcs2Nv+mCk79TGDL036ig==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79ehnb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:59:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c1cffa1f2dso1301373485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 01:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768816763; x=1769421563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q8/G/7hqZ6psTINWY52jB8tiJ2fk8cXDNOtlC9V9Cs0=;
        b=L+jYIPNL32dMNX7J6w0+Cn7FNBewx2h2AT0DyJRDZ+52hPqFPxTBztgSxgw7aytQ0H
         q2hvX47nfnQyaP1S63JR5qHfB0ucEEXUa7Q9hwM5V9f/KXrceUXggvIkDgGkJ/3xFWvO
         Cz2CnVkPqYtnIJtY3xditGuaARvLQ9N1bhRH6Eb9zeVUXNbw9e4Vku6UJpSG+4bz6zn2
         OHFVsITOrn8ll/xabuK1z9aGQmxPm93A4rQi9JdQSNV3CrqTqJEgXbbP8c1F0CxhGRwe
         YLOTNF5glxlafLYwcmf6LvcZkAE6p8axBDfAtiQyVwnUIU/HWeC28kfcJzqT1fAYhBgA
         +eWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768816763; x=1769421563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8/G/7hqZ6psTINWY52jB8tiJ2fk8cXDNOtlC9V9Cs0=;
        b=s4ME1lNFBhFwJB2x+1mt1Nc2k/VI2jXsEDGij1uE4NxznKaHeB2joT5Z3AEnKxtkme
         8QeFMwNlLWARjHwl1CjJpqrIocZP7YcROZ3EWReBGbZwHAy/EMFA5Oo+uOiygRGfJj3h
         EVaJkMK1vNoqld1O40avQSRpT905FrMvt7Gom0rkknj+awjIZQmQIjPivM1Z8F+U9uGW
         OX9IDTMoe/AwueokZ7QMiiC00YtRquS24MonUE1ct8eaNRJXFRo6+tVkbb9M24eZlulV
         4jN1e9vsZNFrI4h4H8MlVQaQtfUWYKTSQHB9QxW2V5BkGNvH5PAXWZV8JZdzy9Cmebgf
         v8kQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3UwD5CcX8gHobL5IBgA/c1fgOXUedXgJ796x0kVzyGSsyGYQ/d/+OmQmMW78BbE/Jxdn1YQikSpw6gVf9@vger.kernel.org
X-Gm-Message-State: AOJu0YxcX0ElBpWJfrwnZ/7Za84mtJIj8Pkvcfhk7ClXTGMKIGDAR7Rn
	1PTVeBtTjw1l/hlJllUCRO5DS1xcfJT6ACYKU6own4IsG0HEHgVbc5sOIw2wzpX0dydxcWa5NI1
	6rkok/s0k3H6nvQGTIBFn3fWMYllnIrzsCsFYxg91BEe9dkpVNY8+qkiGLw1K3zYTavG5
X-Gm-Gg: AY/fxX7hLcoTGKtcYHMsTcWj3/e1EMdU+l6wW4U3nTHHFkWGPj2YkF+PcO57Z4XnLlK
	J4DrloX7MG0ZKsNl5ONwUkqEq2AmSIy6c8bt5XkWxG1+EAm+LLrrDjqOfaNlmpF4UlVCz3pOB3u
	HSBdoyJaPEKQLl7nAOnCMU8gg6W8xeaKc14ZfTJfaZRewgKJLmpYPeu6XlLG004Sgu647wqzdD3
	8O9/1sUjuPxJ1p2jiY7EmQOyCnxxhZUDvzYNU5VBkgN4rBPMB67r2nLQq7845OLmgPF5jAcsaFP
	gjQZUh6HZCN1RU3VhADHW1LlhUdEuplPnU5Tq8upWSEsyvHso03mukAS+yEjpiAFDmnY+ACB0gm
	BcxjH6LVv8xDZUQ7V4Hym3pPnHw==
X-Received: by 2002:a05:620a:4114:b0:8c6:a64e:f66a with SMTP id af79cd13be357-8c6a64f04camr1459016585a.21.1768816763163;
        Mon, 19 Jan 2026 01:59:23 -0800 (PST)
X-Received: by 2002:a05:620a:4114:b0:8c6:a64e:f66a with SMTP id af79cd13be357-8c6a64f04camr1459014985a.21.1768816762743;
        Mon, 19 Jan 2026 01:59:22 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4289b789sm242530635e9.1.2026.01.19.01.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 01:59:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: qcom: Add SoC ID for CQ7790S
Date: Mon, 19 Jan 2026 10:59:08 +0100
Message-ID: <20260119095907.172080-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=581; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=1T2p+/vbfr8CSkXKP8r2GuvxXHP9/qqQvE3njaPgF50=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbgBr04jzEn+l69yC/a8d2yy0zxoSyLR+/oBOm
 vn+FDvGhs6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW4AawAKCRDBN2bmhouD
 1+9xD/0dOO7IQYPSm3eTK9nDNCPfVdtqdo0M1kFEGeywTTSmxF/c9Z2ER3AWWxBoEx9Zuk+WdtF
 qTyxMdG0Pgbiw/3fEq0a0F6ldIoSeI/RbLy58n8uS1DKy+Fz7FsNP4ZZFxOA3A4d986lBAmYBPv
 x9U82lbv0WNjzWQb/RrTS9JY2gOUU0Pstfn3lTn5QhOVJz6euN4prUtWFX/J5WWYFUVUD4/ogsp
 MW86/wZTWEXhD0sXhBUaoZqbiX+267B3beB6I9ZHLh833vHV3zOPP73Bmilq6Gdfvogzi4Nm9Fg
 gm6utf4K2gDbr0SVaZtN5jFvm8pJZa81lm5LoYZQb0nPvoZ0bceRPBE0CvZJ4g2LKBJkNNyvdiH
 cAtiRbOF08fAYZf+C1+wsNut9kUted1Z0E4B0sP+GmIx7yI+i8agnp+yWF7LS+UQPyO9hj3M12H
 X13231VAliKtM205O1BaEDRQzgiieRluL21yOkfXMIuHjTMNklMJNCpsyvJUl3CcgpInDotNM6o
 AntchJzYCMVE4N8gL1JeoAM4r3QW8yj+q43KtErBy2tSufMZZbEDX+UPRIksb8k+I+4kjjeznQ8
 Gz4u/BfYSuMg5JcP0cOm6JAdK/HzBAnYw2TKG0lJzV0+OPPxZnYZyDTiH7m8lWar/HdFHlf+Cis EkG7wA0XXfPrRyw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4MSBTYWx0ZWRfX9KR3NDwemYXU
 yMB5J5YDLlQlKogFXS1/+3POpcUdQkfhuyvN4/Zc+z8owMPM+j19OyhxEeAUvz6ty4PHG1GAZHz
 WfRhD67eGfW/B3C9y2f16KCgYdFyCfHxNC4S7E1lXuxzzWJLgqLgNcS1ovPukUAHQXOr2Byow3P
 vVSz2X1RXYG6ogFT2t9t7jkLlS27EXEC6YJ+cINZThwpc5hdyl0Ab3ZZefxZ6izR/his4qW76G7
 kLKNeIfU8PmsCBt72p+kJLNZnbZdw410C49m3guNA9kldMyRuW4DPbeJzwEg83KelRI7z5Vk0lh
 T9Wqg52mIFsipbCVVLpBdlOi2RDF216pUqQ6imu/yZ2ARqJ6I7RVYgj/Zcp5MS2jpsyhrZf/1ie
 75nTS7mgWZcvmYR6b/BaRFY4i9aqDeXZlE93+8BtwSAeGZAEFtWZJYUm+KtxDo6UCe9I01556v5
 9Mtl1t2MQfvJqxmhupQ==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696e007c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=_wfq7HxkzpDXNbtE7psA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: lqSb6V_u49Xfrwvu9NZqHRPL-HO0qfad
X-Proofpoint-GUID: lqSb6V_u49Xfrwvu9NZqHRPL-HO0qfad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190081

Hi,

This is early and first/initial posting for upstreaming Eliza SoC, e.g.
CQ7790S IoT variant. AFAIK, there is also CQ7790M variant with different
ID, but I do not have such hardware, thus only "S" goes here.

As this is very early posting, more patches will be sent gradually
later.

BR,
Krzysztof


Krzysztof Kozlowski (2):
  dt-bindings: arm: qcom,ids: Add SoC ID for CQ7790S
  soc: qcom: socinfo: Add SoC ID for CQ7790S

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)

-- 
2.51.0


