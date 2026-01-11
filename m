Return-Path: <linux-arm-msm+bounces-88386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92552D0F565
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 16:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56E7B301671E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 15:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7941E34B683;
	Sun, 11 Jan 2026 15:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFCg5HvQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OpzEf7y8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20547303A15
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768146562; cv=none; b=Xrn8IAkPucfX06dtkChC2rIuOTs0i5c2jjCxrA2EovMDuLRSbuEJCokdqdBwe8d3J14gPkccNUxzAd4Dvfy4Y8vZJDoN+Vxdb2HoDRaEGCJBkEobRdmmFnIdVaa23ROA1PRoD8ng8/NEcX0ikbKoMUtJRyYRjHV1jLLS/Ydkh9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768146562; c=relaxed/simple;
	bh=WQuMSF7U4ERbrc6GLhExFtoMtX3nNjug69Zngdqi1E0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kEthI7sVKcXHyMAPnh79OOkj5PDu3rlhe+t3pm9Xz1StOubTEae0a4/GWqNGITMEE8I6V+KZdn5mgFMMt28tTYAmOckGyHAAlAifazDeYEDe4YC2ZwhnkYP1N4EvrYucDp2qugL7/uX2rASKmpLlBnANRrhUi61miE5pTf/XEAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TFCg5HvQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OpzEf7y8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60B9tXSa2875265
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0R0ChqWp0pdt++SFdjljlF
	xTEfPDQFb+wu6OerIv1HE=; b=TFCg5HvQ5EELcFnggjOsUwMmbqW08dcLfmID3u
	UUsra3jj9Fwm3MU9YRFllNp+EpzSxAm46ASZqCO0jHCk7XOK9ChI4KpGJi6qKU5n
	rYgme0qE1Qpw63yGTFcCPm02OvuYWYLXWfP3RB/dUg9W9jgxyfujSBEn7r6t2G09
	WGhWzkzCmvK4xqD0bTw1ruf/mKlugzNKKZw08vaRKw/FRtC3Kz1oq2FZI9cdIVm8
	1v1MlkdhjlY7LP8CiDx3wM+QBkWktV3xCHxDyjeK7PRnK+0HOWAkytI7mjDcrvre
	Pe51S7G+l7mPnuh5LQrhN6GYe6684xtLeXj+ftU4xqvFJHLw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kyrem1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:49:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b6a9c80038so610140785a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 07:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768146559; x=1768751359; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0R0ChqWp0pdt++SFdjljlFxTEfPDQFb+wu6OerIv1HE=;
        b=OpzEf7y86bKHUZXTR2aAC9lbsPDfm6NhmbxZij1Urt0twGIk8SXKDm5Yltkm7NLKy5
         jItQjEDpxhks5dTcvMSqGsp+wKrsLMZGb55Cb0RoaTvJFZ4FYXmWWtaJsAJAsW0UVSjZ
         sPYNHdTIWu5jORFeiY2vFqucnTRDnD+4pCnUHbPD3lSNA9WThsVnpheN4s+3p1tPpKsH
         IOvpnwYuM/+yONO0ev/JQt1OG73VwmSm/wL7nQDMpBvZfQEfOZvDwwKPKk5ndJUp6gEp
         mCdjPLY9t3g4o/ROzQtarhRw9VnpDCvv7cMqcHNfEpwM+0HHjoZCXPxFuLsXMFKD/Eok
         wpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768146559; x=1768751359;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0R0ChqWp0pdt++SFdjljlFxTEfPDQFb+wu6OerIv1HE=;
        b=wJULmuRjHn9AEfjjuHf66Sm7bwElWaX0WsPhE0kzT3Pin2jbxtuB5KrZG8eQhzAFoI
         2l+7u6iOXmSVBOqTuEzbPPPxamalcPL52Ct4jcwyUDWfIGpEFBs1l+KmDsa0Axe7v2sy
         MstzEVUP0vANG+UAFXYBHqY5AjOtRi7Tf15yRH/Z2LF1t5lbXJhvEddLutXN+OZKx8ue
         N9UUB279pYEAQmWuGBjgR7c6KBXDMgJ44uUCv2xwntBc898akc5awExbXGD/3i9J/Bck
         mEt6VPL1riJQdkGjwKwUedkoEsrR/wG7qCZLj9+J4XCfIZlCVKyW0jwcZ0zPQ/RAfqj8
         uaVw==
X-Forwarded-Encrypted: i=1; AJvYcCW6vh12w+uvF2W98vJhIN3mv5G6SRrC++ceySm/TjCKaD14GFN5/EaYnrUDjyEmuRSiGDsJ7/TeHyInUKaC@vger.kernel.org
X-Gm-Message-State: AOJu0YxvvNYy5sNpH6t23YPc7Xo8Sd2aeriaK+s2c2HZQqZ42NShmACL
	sJometKsbFQBMvVAwZRbF373aIDJSb31ZkhuJAtwmPhz9j8PYgnfIHJoSqP5RwcPcsyG9Gbe6hB
	owjD8RqW1BfeGa0IqoJqYsZwodYlIkr/bot8R5WNADvh1klA9GptUNlnYPrhra0bSlR5h
X-Gm-Gg: AY/fxX733kEVsBjZoXfWo65xFNE+ecj6g5VCReJ7iyZLbcxomCirGaOJkV06JliZZEn
	Mai5wSovs5Et1flcOqupPSK+CzAF4GXNtvFnf2Ij++UxyIKbfaq9PX7XSZy/N2gcgS8ChX5QPCg
	VdexCF929lx4bBgHUqmz2P4N0jMaz9y9EM2t3vZqkMLMfqjhEvAERMVdFIYfa6WiDWVF+Fnxplg
	gZeOl1hUer4EfcE17TzgNLTE3JsMBZ9e1LNRtvMHIRfQFI19OekaSAtLRqP2tIdHZCfTUZISgrc
	UArxry2t1cXK9nIHjAwxiFgxz6hMHVQYR9vWE3bZyfgjhH/YAqlEZS5v2z1I2DpBrOgkfvhz6yZ
	GqfI4fjjm1vV0X0OHIRMgPVXmv4BpbbJ3qw==
X-Received: by 2002:a05:620a:7006:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8c38935623bmr2123414685a.6.1768146559238;
        Sun, 11 Jan 2026 07:49:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmcuJJPsUlhOx8Dm+GFrgsYQgqIsQAQViClKcrn4ilAl4JhTawi8geKku4fzh9VLihRuPR9w==
X-Received: by 2002:a05:620a:7006:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8c38935623bmr2123411585a.6.1768146558762;
        Sun, 11 Jan 2026 07:49:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5180bdsm1637163166b.57.2026.01.11.07.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 07:49:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH RESEND v3 00/11] Bluetooth: dt-bindings: qualcomm: Split
 binding
Date: Sun, 11 Jan 2026 16:48:57 +0100
Message-Id: <20260111-dt-bindings-qcom-bluetooth-v3-0-95e286de1da1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGnGY2kC/43NsWrDMBAG4FcJN1dGJ0e13ClDs3ZIx5JBkc72g
 SM1kmNSgt+9wksLhdDl4L//+O4OmRJThpfNHRLNnDmGEuqnDbjBhp4E+5JBSaVRKiP8JE4cPIc
 +i4uLZ3EarzTFOA2itd0WtdTPDh0U4DNRx7cV/4DD/n3/9grHsh84TzF9rT9nXNv/8DMKKbTa2
 rYxVDtvdyMHm2IVU7+6s/pttQ8tVSzvTSNbLZEs/rHqH0th89Cqi+XIG2d0p0nhLuZcXa52LHf
 nqgw4LsvyDbfOhMZrAQAA
X-Change-ID: 20251028-dt-bindings-qcom-bluetooth-9af415056c1c
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2890;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WQuMSF7U4ERbrc6GLhExFtoMtX3nNjug69Zngdqi1E0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpY8ZyQj/wv6h2+dnu3cOKMAPDi3dGJqWx6EAFJ
 ZEehTe7wqmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWPGcgAKCRDBN2bmhouD
 15QxD/4+QHPX9rOy8/UWPIldi+FUT5YDTeoKhxjcfG/WR208x2uQ8prInpIabloalLvPDJgULk4
 aPflTrZ7YwNDBsqCE9XLFKQjcrQ19PHNFonrSQcfUWY7N2a7joUD9X+FW72uIjVoP+q7ahSFlHa
 ZN9UAskNn9XsQYnFx/VtdokMJ/t9tAhO6HmyAbO5FyDDL7JX7zaRV+9vRdOWlAIRWpFpaEIOq1r
 L7hDndVAFw9K2/5qdEdOcspL8KjBNP/xsp8JviiSLwe2o5r8KmtaQazPlMGxKZ0n57hMQQx2QXW
 nk7iKEy1dgBVntudYz6LZ6EX8kDr4pehZTCA5UDg/d1L7Haqa8kSNviqHQow9OLUhkDArjX5KEd
 hJwEQN3bsaOZYZjyU5O3rZbHPw2o7IX/wD9TtUeY+a4t7KdKLK9TZFKhzO2LEZyjxOPqkyeUgnF
 XlGB9yzxsYIAhkzIp9ZpAPyHlsIdmJuphvLd3A9Z29fYCZmGUWtK/kYEpw4zXNZMW0Qyc/w5YRa
 IAKVny90Krsjkri5fabWZPD8x0ki/kWwR8KPL3afTXANlfoiff0qLpX+T7izkHqtsxvGMqjYGh1
 sML4eCpThM/bvQvdxTe1Ar2oLT/FhZ0NvE45pD4Oauz2zzG40S5Zy3OvJ9Osnh2W+DpWYY7ZUaM
 h6Bgw6HZsOrXXyA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Cdq823Om9Gzomx6v0uXDty3ndRDD1IYB
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=6963c67f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=P9jvEC7lATeLTnKe_mwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Cdq823Om9Gzomx6v0uXDty3ndRDD1IYB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0NiBTYWx0ZWRfX/CI3pDsrRE60
 nbq8cavgmdAlV1eEsZfUs9XwD3CjVOpinqNGA1ZV+PSGYxUjw/U0Et/lgMIxOvYim7S00CFkne0
 XRJDUR7KhrOJjxPRwPdoZgGdmXH3EKdsXShxh57dDFE35YZa/7+uHR0Xz4dokwnB9Lcmxct2JEG
 K/bz16nksnURnCFrl7Cye6+vb+CBUQoCCwTxn19Idt5+cZ3/hkp2xxXgi7DiIkpFbKUuWhTQ2G4
 LuLlT+LQoY1Nwz6Hd1QuERlAKZHwLlFERh8ir2M7ygFBP+tc62jIowm9zy7jjzfck7QXnHl6EDn
 Scq8oiKL23NLgM9CGgP/+Ohu4lMUOxMudJ3ZBDUsOxpA4lgdD/z0XRyUAOo4MK0mb19KQZDtSTD
 BdoAtgMLDiiIPgwacfTeEy+JjRQsFa+dXuqJL0oUJLqNF+YfxnsYbkUu8jc4n9Odc5bXTYkzvk1
 LfJTU3W9UAtCb88Gqag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110146

Changes in v3:
- Just rebase and add review tags.
- Link to v2: https://patch.msgid.link/20251029-dt-bindings-qcom-bluetooth-v2-0-dd8709501ea1@linaro.org

Changes in v2:
- Drop in few commits the properties (supplies) from
  qualcomm-bluetooth.yaml which are not used by devices left there,
  instead of removing them in final patch (qcom,wcn7850-bt).
- Fix dt_binding_check error - missing gpio.h header in the example.
- Drop maintainers update - split into separate patch.
- Add also Bartosz as maintainer of two bindings because he was working
  with these in the past.
- Link to v1: https://patch.msgid.link/20251028-dt-bindings-qcom-bluetooth-v1-0-524a978e3cda@linaro.org

One big Qualcomm Bluetooth schema is hardly manageable: it lists all
possible properties (19 supplies).  Split bindings to separate bindings,
so device schema will be easier to read/maintain and list only
relevant properties.

What's more it messes up old (pre-PMU) and new (post-PMU) description in
one place adding to the total mess.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      dt-bindings: bluetooth: qcom,qca2066-bt: Split to separate schema
      dt-bindings: bluetooth: qcom,qca9377-bt: Split to separate schema
      dt-bindings: bluetooth: qcom,qca6390-bt: Split to separate schema
      dt-bindings: bluetooth: qcom,wcn3950-bt: Split to separate schema
      dt-bindings: bluetooth: qcom,wcn3990-bt: Split to separate schema
      dt-bindings: bluetooth: qcom,wcn6750-bt: Split to separate schema
      dt-bindings: bluetooth: qcom,wcn6750-bt: Deprecate old supplies
      dt-bindings: bluetooth: qcom,wcn6855-bt: Split to separate schema
      dt-bindings: bluetooth: qcom,wcn6855-bt: Deprecate old supplies
      dt-bindings: bluetooth: qcom,wcn7850-bt: Split to separate schema
      dt-bindings: bluetooth: qcom,wcn7850-bt: Deprecate old supplies

 .../net/bluetooth/qcom,bluetooth-common.yaml       |  25 ++
 .../bindings/net/bluetooth/qcom,qca2066-bt.yaml    |  49 ++++
 .../bindings/net/bluetooth/qcom,qca6390-bt.yaml    |  64 +++++
 .../bindings/net/bluetooth/qcom,qca9377-bt.yaml    |  58 +++++
 .../bindings/net/bluetooth/qcom,wcn3950-bt.yaml    |  67 ++++++
 .../bindings/net/bluetooth/qcom,wcn3990-bt.yaml    |  66 ++++++
 .../bindings/net/bluetooth/qcom,wcn6750-bt.yaml    |  91 ++++++++
 .../bindings/net/bluetooth/qcom,wcn6855-bt.yaml    |  99 ++++++++
 .../bindings/net/bluetooth/qcom,wcn7850-bt.yaml    |  94 ++++++++
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml | 259 ---------------------
 MAINTAINERS                                        |   1 +
 11 files changed, 614 insertions(+), 259 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20251028-dt-bindings-qcom-bluetooth-9af415056c1c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


