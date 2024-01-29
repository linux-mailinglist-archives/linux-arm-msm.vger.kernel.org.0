Return-Path: <linux-arm-msm+bounces-8860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F3184070F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 14:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBB811F2785D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 13:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9A1651B1;
	Mon, 29 Jan 2024 13:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mfkK5AmW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0737B64CEC
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 13:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706535294; cv=none; b=czc7I5tzC6fq5brehWr/aPs2yjSjDW/iyZy93uaNU7e457xLQe0kXCkAOPBq3pNsqullTg5dl4/goDkQYsFxDWmnjumLtXBosPcWtFcMhN52agrotB3ITow9UZjKl65wZ1UkuyNtaBouaYRvQr6gbqteZCohv1u9niN2b8mPGa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706535294; c=relaxed/simple;
	bh=d0G++yM1L4bZ2X4j1KyYeIn3hj0pYRz8vVfTzils9Cg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HyZypTKyxNh0a0S/b+DelJkIX5Mu/Jah4PQIVe/kzh6DMpid6pjHLPdslG8pGHPNbcV5mpmvt+ZYwE4+LUW++Jg2yki/Lxg1EmUnXMVlXanB0v7qK5jxHVdGRGV3MQ9wxxtmkequP3AD1l/1G0kt8ojG28Fxu0CF9QHBcFuGqHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mfkK5AmW; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a35ba5744e0so105210566b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 05:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706535291; x=1707140091; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A5lN2RFti/0uAPsAIuzSgpGpyVFWHHP46PwFBbIkKk0=;
        b=mfkK5AmWIe1QzkUlFXrbc5D91Qly5CVcKXwjAlRShthrzrAX1YSvBUwt0mlM1gDOme
         +BZ0ADYFhuNk1+a4wwE6pCP6wUgayBybW+bUkuUUd8qsotKEsorQ4kUYGFSk90ycEc9U
         l/YFZbihCG14Lbiw7N+TKBxpOcFQFYLPg+H/jauSZcbbjjpVT/BWAScpuMDRsm6OzWz2
         G2NX+zZLLkXV0Xsg6gxScFVn9BW2vJLy+o/97TtpZ7s56CygkM34xlB75sFWGAjg2oJ0
         JYSYig98CN7zm6Z5tAXFqGjEyeE/wXjg2+mR+RnOmH38jdQffc9bpQT+6HkpdaXNuISX
         baWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706535291; x=1707140091;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5lN2RFti/0uAPsAIuzSgpGpyVFWHHP46PwFBbIkKk0=;
        b=ITNsilzF3SrQAMXnIpFL6eJ5qCCxuwFHM6iA0faOiMXKEBWija+UBqAOo+iszp1nXo
         HawBLzIdjLp2PThFK4xQBvJw7QDrFeW3PSO6zCd1pe3tDtKN3hzAkDPm0JRTw+UJANvn
         1yTS0WWP+neA/M0sdaE8DekIGW+5IKGouLfxqBWO8IxUopRIq5GdHqxXU44iKdOBaMUa
         n2IthnJvHupPyra8TQ8IMAjm+rysNJ1g1SqY9If0SogrmF/koHm6s+u34GJPltD20kGZ
         ljehmoKH7GimO2anMP5xmknaEuLjTsNclwUYnEQB6nEOxfzyZWgYyrAg4x4RJD12MIsw
         YWDA==
X-Gm-Message-State: AOJu0YwgEp3c/og6L/8hcJzbvtiGyVm8BoGa9XWJlno5rxO4zUdhAcEQ
	L11/rdsO3us9IoqJYVy2zepVU1tf5WIL0DcxN33ZAT1kMSIQ9nYviP5mxiNhMSQ=
X-Google-Smtp-Source: AGHT+IFwMDlt57rsNy63i0SWKIDyT09z0+4gVI1uZZq0kql5zyFmD+8g431XufZc0uslUUgNZZ6Uzw==
X-Received: by 2002:a17:906:ae46:b0:a35:7d90:1528 with SMTP id lf6-20020a170906ae4600b00a357d901528mr3030047ejb.32.1706535291297;
        Mon, 29 Jan 2024 05:34:51 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id vi1-20020a170907d40100b00a2f48a43c3esm3911483ejc.7.2024.01.29.05.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 05:34:50 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/3] remoteproc: qcom_q6v5_pas: Add aDSP and cDSP for
 X1E80100
Date: Mon, 29 Jan 2024 15:34:36 +0200
Message-Id: <20240129-x1e80100-remoteproc-v1-0-15d21ef58a4b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGypt2UC/x2N0QrCMAwAf2Xk2UDSIRZ/RXxos+gKsx2pymDs3
 w0+3sFxO3S1oh2uww6m39JLqw58GkDmVJ+KZXKGQGHkQIwbayQmQtNXe+tqTTCHy5TOcdQoAl7
 m1BWzpSqzt/WzLC5X00fZ/qvb/Th+eulfjHoAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=656; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=d0G++yM1L4bZ2X4j1KyYeIn3hj0pYRz8vVfTzils9Cg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlt6lxrNZJp4BqGaH1Fc1i5wEM95JTCQvPAOnvs
 Un8LOil5XuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbepcQAKCRAbX0TJAJUV
 VuJ5EACd1WoJNIUtO45BJgROaRjnc5NsXFOQm7CzWcSsrOBVd7IJiWlJSp4HgAg47j+h8jP0QdV
 CCdnh7swWQtaTuDPqWUYsjmvXwQ74UC0c8LwKY3uDzb8EcKNCiO8PfPtQYReLdx1M/+rff+uteG
 cTIBD+BsU47NdA3RhV56KFxYML4rHAsKKv4k1953FgOGUjSK1NgOs6zllsK3tjbAcPojrN7eTGu
 /pzu9tvQ9DrQFM0ecwhUsJJUDBRPynpD3IAowT9wv2Ojc6TEUp+r+eMkWVxKD+wbxt7v9gBzH7u
 gBtxHl/gOPTKmb57rKoHoxzNp7G+T1zzruYqd952poJX0IkUlVFZZry6+qAoA8oIrz2JUTu1btu
 gz157zjtW/BYm+t/NLRb1PtdHiWxZ+r+p5N+YORCqLVU9vbxV+bwKww2i0V2VC0Lmd7doykXGiL
 pzeRqqD7oGLVDkcZ5jcnexBtGKR1ktY37HUJMy2dmm520Jy2T3W34uzir8w0vqT4JK7zsgwCH9e
 qlkiWJ7VpyPxIxmlER+hLQz5ApYVxetGJSUTFfK/IwDEsNx4FBnOmgieNghmsSaSzCn6gkn9jMD
 MOcl2BvIXbxuRHlgV5ouUDtf2Unh4LTPffaitK6keAPvUWWGwqhQkRTN1MNgLTPozO8cjDgN3KP
 Mcq+4Gr9yyQvatg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (1):
      dt-bindings: remoteproc: qcom,sm8550-pas: document the X1E80100 aDSP & cDSP

Sibi Sankar (2):
      remoteproc: qcom_q6v5_pas: Add support for X1E80100 ADSP/CDSP
      remoteproc: qcom_q6v5_pas: Unload lite firmware on ADSP

 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |  6 +++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 49 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)
---
base-commit: 01af33cc9894b4489fb68fa35c40e9fe85df63dc
change-id: 20231201-x1e80100-remoteproc-b27da583e8cc

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


