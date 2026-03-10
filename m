Return-Path: <linux-arm-msm+bounces-96650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJb6AhEhsGmCgAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:48:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A6600250CC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC5DD31497D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EE53B2FF4;
	Tue, 10 Mar 2026 13:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QtdS0k8Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QGLbHuw0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB933B2FD7
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147823; cv=none; b=eBESY8OhMVBg57X925LC1VOGlZLgAvz4q/CTKPSTjRM/dkR0W52uGUqRQC3ir5xh5qqZDR1uv/1hMt8GZWNtJvKAKFbL599w+KAMCtkSAt7ykGIOt0ZSiqW32q2k+1lihFxzCh9GF8CXkklMSYQdAGdXNLhc566CvTrd/bfh1/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147823; c=relaxed/simple;
	bh=fy3vzdGySK2wbqzP9MNs5ECBn69g/zX/st3lHUOilDQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j1nOZbWj3RzgQQVUCcRGlCd/vuTM7TzMFMkSgyal6huSsxiea/iaI9/76BTuqacLE7/7sQ0DxEE9KCK4pI9AXWHqXgFpUcc6XWyYurDxLcJOkZdHgNx4ulAU/+jaXHxAvAgrFMNhjgt6ByfsZPM2l+V2kF9IIKnN7hQjidD4/ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QtdS0k8Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QGLbHuw0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaRQh3417072
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=G3pEbzlilEvq+U1Yo+FWIn
	0xUqppfQhmIf79hXS9xAU=; b=QtdS0k8QnwMpySVJnZd1zgwYgQI6iZhuYSFQ0h
	oJUZ7xcuJqn4kWx2ix9hCGi7i/JqtMw9quNdf8Yz3YEI/fjMM9WBSzqhXPU89M/N
	ILFM8bXBhzd8TDNjmzyJrjoBvSLok54vN9b1AbJ32D9eHFsO62ex74xfvchHfyt6
	E6TOCwaoZrpC8IP+KdLV+reC1HhpxMHxU+M7Qx+/gZYNgmBIzSXDGy2zCLBBEqf0
	znn89NwuklAxAj9PQmqCd6Qcn5eswnjocRmkfeokjXFdYc/rMYlUfS8LYkxaZbAR
	71l4RbAiIqX5cOqirgp8ddNL/VM8Z5oiGR7NFUO8hQkRMG0A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja28bdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:03:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7381a95fffso3459828a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773147819; x=1773752619; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G3pEbzlilEvq+U1Yo+FWIn0xUqppfQhmIf79hXS9xAU=;
        b=QGLbHuw0JqxgcnvoPyGdcrRFEFWE2ZfLBwYhZEdsrt8oDqzkSE+Diujf02rzMIa5rY
         bvkHBDuV8YU3pVEhI/bfKIgeZeDJqRuBrhC+l3lYTCKbyk2lTg75cwuYuv0oX0SEYnmc
         lTrEgJsc/0WlG4U/7hEYpv1yf/H53bT/WXvWDLo+KaHGPyhGzyGPr68D0Q8XKsx+orP/
         s6jy5e+Tw8yJnDZYdX4i2gN7TD96hTl6LpjRWRi/kH8MZx+2XmfJS0Xdvi/gLUgpcuQS
         qPbPw7x2IGfKpHrzyPIt5YtQEYIpZ0CCxTcXM3pPUMXWxjeA983xaBiS1QuA2Rjc2m2b
         IOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147819; x=1773752619;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3pEbzlilEvq+U1Yo+FWIn0xUqppfQhmIf79hXS9xAU=;
        b=xUPptrtGgIPFSUsjM7Ei4l/eQXPWzVsAzuldjczYLqf6YS2gaaXBR9R320umst3Vzj
         UmJDKYmN/SENiZGWRiRUg9KDqoSS0mFWWJqxu6zj8yeuDHyEhWTjOJqDwtkXeDD2+5yJ
         GavXnB7tICRhftHbbRT8g72bk8mG7nIFxl+h1wWitTVvcV3zpwSJUB0W7p+7G+9hDTRZ
         hCGUmSu9Qt5N9o6Y647Q8OUIEYStTam5QORhRO60nQnM/LHMLoY5c4K1iLPMHsbiAGwa
         SToGZoqsXtV5C/rFNQr2WQYP8/2MX6bU0ZaRUdz9L8NehWU+C18BhCKFKOUOA8YJ4BK0
         t4kw==
X-Gm-Message-State: AOJu0YxW66GHvL2eNar5eIVYJNC5ZsW+559AlbE+g2fbema7jdisW0O3
	h32OL04aNZrKr5WmrV7/F0Kc3NhFo7X3dpmJ9/eSkf4a9U6c4wrSx/+xGhbojK+FYc03yDw8c1V
	eZBshy3Uc2wQZmasZFEJ2ydP8Y6+yusG7ncAiWd4+JddRRn+qCMlYpDlLvQ+2fBJYW1Wi
X-Gm-Gg: ATEYQzx+uzah3xMWQE95nl/qMVkXHlZU8NHPkkMLidhkar1tPcrpLXBNo3sNi2zWwlx
	SaoEcLmOY55SO3gTCnm/UadQ0uRavOrEljPpuGW6Nju+L9F5sp1T7fN9YLPJ5MnR+KmK4B83rvK
	lS2v3hEiGGirEzSy3Mn2I9oBieZHmXjaViru+TgzocH4vYIy+BwbTpNQJxgxf4YekLZ6Ux+6PmV
	yR4AoO8PKyN0SUzCryrnuLxj9sw9HYr0QP2bg+eNkBLteFcfid0iMxJQas8VUH9OqtqJghGJjH3
	EL/7c6PPoCDGffxjC3XENFJNgjvL+gXzN09ORKZNtmN4cw7L5V2DshLWlS6mYZgMJE4ygWOzH7M
	oDNdcUD0IFjfFuGqd16j6F/jTW9mJN0z0NkZ2v1rQg118
X-Received: by 2002:a05:6a20:9397:b0:398:97dc:5534 with SMTP id adf61e73a8af0-39897dca851mr6178163637.12.1773147818401;
        Tue, 10 Mar 2026 06:03:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:9397:b0:398:97dc:5534 with SMTP id adf61e73a8af0-39897dca851mr6177756637.12.1773147811751;
        Tue, 10 Mar 2026 06:03:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485246ed174sm178732855e9.5.2026.03.10.06.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:03:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH RESEND 0/5] arm64: dts: qcom: Drop redundant VSYNC pin
 state
Date: Tue, 10 Mar 2026 14:03:18 +0100
Message-Id: <20260310-qcom-dts-redundant-pins-v1-0-98e2ef430717@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJYWsGkC/4WNsQ6CMBiEX4X8sz9pCyI4OcjqoKNhKLRIE2mhP
 xAN4d1teAGXS7673N0KpL3RBOdoBa8XQ8bZAPwQQdNJ+9JoVGAQTGRM8BzHxvWoJkKv1WyVtBM
 OxhLyRCaStfWxSTMI7cHr1nz25Sfcy0d5u0IV/M7Q5Px3P1z4nv7dXjgyFKeiqHOZ8jzVF0cUj
 7N8h0IfB4Fq27YfK9CZ7c0AAAA=
X-Change-ID: 20260218-qcom-dts-redundant-pins-13a3a0fb5c46
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fy3vzdGySK2wbqzP9MNs5ECBn69g/zX/st3lHUOilDQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsBaYGpE88wksIJpJFWWpcBanwBbZjyrB8o0ZK
 y26gyUUKTiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabAWmAAKCRDBN2bmhouD
 1+51D/972aLNY7k69ObwDX49g+cco0lIBTJpin1cju6xRoqrnWmSTJAcOo0PQKUkiLBsW+breGI
 tf8YBw/j8cavkMldgaEMSBcrJGqHMYWPMhATQ7PG3wp3d5TSCU5Y88tu1B6pAMURynV31OLXIyU
 YE38Dh5EOP6TSY4OP9kB+aUIyk91LsXOwU/h/V91TbHKx63zw454FW5TU6HP6mX3zO/i70nEu97
 RFzsehDd/j//0bHlmHWysiERdvtltAj1ko5njJFdNGwMcS245etSaH9OjWy1dCL0f165mBY1o48
 6t1Jq2iUFgr4fYjZvCO7GgKoPA84ml4Z0LxG3AhWOYLj/huVbCW5Fzqw5bZzLmSPOjUbKHgVBYx
 NyTSsHkI1gIzfEd8Sg0OKdrhm8lWGkAjzv3P9RCPUrNTN6Z+IumCHJZUIzDSUC25OQJ4JguPE+D
 XyrPXbsxC9WVrBYbqYq/adZm70n0Hqs2G6mxX52SttLQ3esjSFOdhClN/JNbRbZuId09hKjtbgs
 fIbEOIFnXQ3pvdrFln3YkkBzRTu8bOEkfqAdWesalnRuKdsSI450HUy3WpLvIbl3Me7oxlnsRqB
 atSXX3UHf8bgwiO3Ftyu+8+VYssfs2Vw01GBcXI3W8nzjB+wH2fq9553N6ZRmWMbY7Cxd6PoxuP
 4LD1Zh8s8bkcEpQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b016ab cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=-sJYpBSRjsJx5iMO2OsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: i3aAE176L61zXHR-G0agOhMW35lShflJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNCBTYWx0ZWRfX9QUGj+3aPERK
 mDbeUISzb0pFefH5RZJyrdoWTyZx+0KLdTtkSjmbe7xfhgFVGYTIeXCnr77mCwH4Wq6rVAnssW4
 6ZH58IQ5GKh4idRgfHSGW2n8kZa3KFQzo6tWkmDNr1XFcSgm0Pnv1bSO3ozlM1aaFavIZv5QZaj
 uA6pOpMtY6kT8Sn//MoA1bWUVsHkFYslwu0NLMLqC/1P+qWLLzlIdw8i8VKpvZ0b7YK45J5nhix
 YBzFv/4Iwil4mEu9Ib1HC260fbJC4ZW2iNHTa8LbwUibLGkfJFXZlAC4zLBD+ZI+GDPisuId5JH
 qno/9rTczm6RE6CABpSUuFFi51hMimSMzWAsAOkurHmjD/I/YD2JMm6yupgnBhP2JTzhPbQif0N
 Et7GQMAerFxWyxK0Z6a2UcmwdZyljkqWz/aJz+BcHhW02Pti/2aBZtQdEanBqsKZxrsTV8wXi+Q
 kQvGYt2QfyIk0oRQbFg==
X-Proofpoint-GUID: i3aAE176L61zXHR-G0agOhMW35lShflJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100114
X-Rspamd-Queue-Id: A6600250CC3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96650-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Resending with tags.
- Link to v1: https://patch.msgid.link/20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com

The active and suspend pin state of VSYNC is exactly the same, so just
use one node for both states.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      arm64: dts: qcom: msm8996: Drop redundant VSYNC pin state
      arm64: dts: qcom: msm8998: Drop redundant VSYNC pin state
      arm64: dts: qcom: sdm845-axolotl: Drop redundant VSYNC pin state
      arm64: dts: qcom: sm8550: Drop redundant VSYNC pin state
      arm64: dts: qcom: sm8650: Drop redundant VSYNC pin state

 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi   |  9 +--------
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi    | 11 ++---------
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts     |  2 +-
 arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts |  2 +-
 arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts      |  9 +--------
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts      | 13 +++----------
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                | 13 +++----------
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                | 13 +++----------
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts                | 13 +++----------
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts                | 13 +++----------
 10 files changed, 21 insertions(+), 77 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260218-qcom-dts-redundant-pins-13a3a0fb5c46

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


