Return-Path: <linux-arm-msm+bounces-67138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8942DB16067
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 14:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A36E318C6FD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 12:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AD8283FE5;
	Wed, 30 Jul 2025 12:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dK9Xc8b0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F49A28750C
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753878958; cv=none; b=hrY43tCHgxIrGhDMX8hCVP9G4MLK3XHOfJBUBn6EnHS94EwtrfyGax68oOP5FFO7EHUDis1GL6w4i3iwIWHynmkXgiCfhLALsnHQuS906nJR4sNONrDairoqa2dF7SZ38A4QYZcSItZFZb9mW6bK/+8PcNfynZGs1TEzrgbmOxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753878958; c=relaxed/simple;
	bh=TL1jslkYbGnwFQhxIVDseQLkHj1wo3EdT3LmGuFst8U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R0m9u6jCxtIxlxyKxN0rumBWY5mTN72CibYv+X4NDCXjPPpErNthFtH7Azbd7CUaY5Q3BwjhqWcUfdDwHtIz6MydFTSXpyHKtc8sIlOzRW29bzg+XN8sl0k512cft70fWx/08E7iqhzVoTpQxU8HeV8LAj8mPrniMV73JA+yukA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dK9Xc8b0; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-70742520205so7869836d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 05:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753878955; x=1754483755; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CjCcWWa4qk/EoiiwDodc2dHJ7c4wzCVNfTSg63QPfzs=;
        b=dK9Xc8b0CDWCFOc4cVm3iLvlrhsS5bi2v7X19qbRVe+Tu+Q0zNCigUeD8o5XG++JDy
         crL/1/zZxl17ICAz0v0y80So5kBTPkV6lPL9YjgOaERMKLe00s3EoJgoC6bhICPaIA70
         meLf8mfFpVA2Z5cR5hPxvqOMB7jRsfe926IRMxTJqtXGrTcnuB5YE7zTqXhUqbP5suuK
         cp5sbCjP6BrX8NfWpXVfW9oFE6UGwmLr3SJQ+PS41zm3m9+p7AcUFNqsus6dro5cSW5q
         IbgH+kTG3EMxqzUdriUOY/GyN0ZUlmedExgnFgWrjHBeBVjUcFj7D/Z56FQhRO/3viW5
         3Weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753878955; x=1754483755;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CjCcWWa4qk/EoiiwDodc2dHJ7c4wzCVNfTSg63QPfzs=;
        b=vbLVKPLRTrdrPer9/VaBzZjuhWHe6E58hhgzUMcSOVs+yBCm4No5ZYeyl2lKQ5srSB
         0gx1ycDSvaNrzUV55K1pSWDSaXChgYgatYnA8nxbN7DJjDggncXWIQ4TU+g1yZjX/nrx
         +MYANSzG2T5rnzKf8HynCbqujzXyA5opS6EuaKf89jgOPoQIMv/ykpZg/WbF0h2UrlcP
         Zj6x45a+c0V7APA6ibIboNdbVeGJVrGWhjcjXKSUMJYVoBA7ffrXuFuqGsNz4+QBCblt
         8ECQMVCbgFO97HU+sRHcaH2gcFop/qfqdyrlEbTYiQcqQ1kLfNcszY9w7FJziZH09+TP
         Fo5Q==
X-Gm-Message-State: AOJu0Yy7fYjVZowWm0oK1Z4LzKajPkBtK5vnG7SUDg81rv0uEvcyimMH
	a28f6UkOElU5i/XSbMab5WTz9qQl7fn8Bu6l40mXO3ez2TCzYo9iL45UW4dZgk98F/w=
X-Gm-Gg: ASbGncsohJi5Dbqz2FrbTTeU1LPJbD5bG48jugkxqbuVAQJN2VRW390D0oqSjQWwCDi
	VO0eVZXAVxmP7aKt8pMI4yP0N0gtlgy7b6ICUQqvqT0aYDT0jrcoRpMw1/dpI1kZ9y6RtlxfMQs
	U0q2VBzuViRHidDRZcOA5z28g0xj8gsqL36/qg5cN/sthzkVOJsSvGGZL3kynR5ml2lgxOc44w2
	qbBq8RMjlTLRGUZ27ZSQaM5Pz6o/EIp+fqbxfIrPTpuBgq7A7lB8cvePWjwv+1MfmWWR0PzE6wv
	WkMTFcK8VUQeXpa2Sy2CeqCC8ttiLv0Owsgsxd1QRs3r62jYplt4En+W1Dg2phfov7iqh7Gsl2a
	pyPg/UKUpFhRTQtoiJ6Q0J9qUmGnGXQYlGN5hNDI=
X-Google-Smtp-Source: AGHT+IGwmNhyLd0DJNnkCT8/jZWKIr1CBuLvQyt8ZpffWXjV7NHNiRP2B0ipuCo3xhp1GZHIOlRERQ==
X-Received: by 2002:a05:6214:cae:b0:707:4daf:62f with SMTP id 6a1803df08f44-70767230172mr19957096d6.7.1753878954791;
        Wed, 30 Jul 2025 05:35:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7076a647d47sm10105716d6.9.2025.07.30.05.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 05:35:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/2] dt-bindings: ufs: qcom: Split SC7280 and similar into
 separate file
Date: Wed, 30 Jul 2025 14:35:35 +0200
Message-Id: <20250730-dt-bindings-ufs-qcom-v1-0-4cec9ff202dc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJcRimgC/x3MTQ5AMBBA4avIrE0yiPi5ili0OpiFooNIxN01l
 t/ivQeUg7BCmzwQ+BKV1UdkaQLDbPzEKC4acspLqgpCd6AV78RPiueouA/rgk1NVVOydWQMxHQ
 LPMr9b7v+fT+nToDBZgAAAA==
X-Change-ID: 20250730-dt-bindings-ufs-qcom-980795ebd0aa
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TL1jslkYbGnwFQhxIVDseQLkHj1wo3EdT3LmGuFst8U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoihGhB/RGRzrg5Tdt3rmYaNBElttGKFnKKlPZR
 CgVwij/l3eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaIoRoQAKCRDBN2bmhouD
 18OJD/4wpVCzAyd22DzRzFtEz75KU8fQ6hsp8mAxyM5GPjK00GuPcR+lthX4JfMXIiHGBd0n2Sb
 iHQ8uj9GGEOUlxYlNPI4BtyDqVu5K9yuF3PMjpYriQwuYacPVczW/zgEUpHg2oL8VJtTJF6kxch
 88h1ivpTvFLKdF8Q+CKKQbhbfTAy9Eixrsn9ZsZORDYbbb897TJ6a6uTqnEPXLb5octEOyihwgK
 B7EfkrHg6XhBoGh4F3ZNrPfg3moQDO23eNnSLwd0bW2VaXLPcSx0tEyU2Rjzu9y40xR/QTWtKJz
 g2QCZdj98DV3RcwW/Pc6YqoUZCN5m4bH+brGElQgCuWAM3T7hwuKvWrgshygIzXOfPFBSuwNUNr
 /ruUjfYMIJ8mT+Bw148mb8b2wg1o3ojuWvsgZ6JAPm5hv3rCOyD+Aer9FIKe6m7X3m8Dk7SLCMw
 w5X6ufiK5nz9svvavOhsEVa60kYvI6d1mXEMt5brtjONMZFG0hgCBAtUuYCV5hbrVbXYydr0qgO
 +4Fdgni0ISqZG9AlSMCcqX1UcMObmIrowhLW7qij33qA2mEHXb6fHBsupeX+ArcaSteQi4Jwkyk
 RTmE5ZX0XBpmUHWrcqVJGjfkNB1swDtzPF3Qx5mg4rQJMpPh1wbrm08M4u4xUHjC+1h9XeO5J1O
 jRaoPR+XZc8wLBQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The binding for Qualcomm SoC UFS controllers grew and it will grow
further.  It already includes several conditionals, partially for
difference in handling encryption block (ICE, either as phandle or as IO
address space) but it will further grow for MCQ.

See also: lore.kernel.org/r/20250730082229.23475-1-quic_rdwivedi@quicinc.com

The question is whether SM8650 and SM8750 should have their own schemas,
but based on bindings above I think all devices here have MCQ?

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      dt-bindings: ufs: qcom: Split common part to qcom,ufs-common.yaml
      dt-bindings: ufs: qcom: Split SC7280 and similar

 .../devicetree/bindings/ufs/qcom,sc7280-ufshc.yaml | 149 +++++++++++++++++++
 .../devicetree/bindings/ufs/qcom,ufs-common.yaml   |  67 +++++++++
 .../devicetree/bindings/ufs/qcom,ufs.yaml          | 160 +++++----------------
 3 files changed, 251 insertions(+), 125 deletions(-)
---
base-commit: d7af19298454ed155f5cf67201a70f5cf836c842
change-id: 20250730-dt-bindings-ufs-qcom-980795ebd0aa

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


