Return-Path: <linux-arm-msm+bounces-69366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E57B281D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 16:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E246189135E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 14:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F9E24BBFD;
	Fri, 15 Aug 2025 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="njNXP5y2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61E523AB87
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755268241; cv=none; b=PM+CbfGvWBGe+7trm0+lBLp0zxCSTfiWnvYgUC4sFGpH7zrbhbLWlVwlONG2vee7DgGWyNQBbjQby8G4usSvw7URPVbOuFnKSuXP9hqPqQhs8C0bFLmHZvPF3fnoIWg0ZjDcqDtXFfDttA7ikjeyogJ7ZdWgH96nE4br/GB7XDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755268241; c=relaxed/simple;
	bh=bQapPzenZLyTGK7ECXYfIjUl3GjiSCJxWw0TY4elCgM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tl0BFXE3mWswkAAXoyEGttwEuHCzKyRcSHmSDAZ265XLzOGWwEqKN3aqRwBKmtiFPy/KRdk8Jb/Dz0HZjWRJdeYr/icGsAHKgi6pqPoUiume7vXCRJNRBleHpxluiyEav8+UI5x/u2ln298+L4pgjNyXshvwWWrlaF0DiN4FM+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njNXP5y2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJ6CE022073
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 14:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xKUxqUakXVVJwGJfwjTjI/
	3/s/4go7L7H//VCeSe2AQ=; b=njNXP5y2cpu2CcrqwDAoqUq0rDGIhBiC6wIALF
	4nI3wkIwtQaU1tpQcbYCi8n6cj5atVy4wGYHX22AxJKXRRchS6Dm7kIiRXdvWpdz
	D4KXzd9F+Ey6+uNXbCnpnDCN4D+AsrnBy4T9jMfS292gWGaYy2RcERITK8JQFqF8
	eMWtZCN9O512b5Sc3mDvPynE1DabWoqE6XBv+YVcdnax4G4FW/Zy3O8rbwLui8Vs
	oE3gOtbHQ0yEJCLgBKcjqVHhIjql702+ig0uJ5yI1NARxYbzX4Vp05z3+tKf+p0f
	C4ev8rlLvrUqNUiy9Ja6yxKcq9Otbx3a39ozBBdn0R766a7w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9rywww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 14:30:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a9f5b078bso22092116d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 07:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755268237; x=1755873037;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKUxqUakXVVJwGJfwjTjI/3/s/4go7L7H//VCeSe2AQ=;
        b=OwQApj94VlPgjKgM4aidYp8CK6JcWiKns9Kdqb9KyuJ4v4dvtBTtkUlVQpvuYJNStI
         QYamcfPprJTT+amwa61lIF0G2B8rRs3hda2O2+dOuvYsRn3LPK/OiS2T6GGSa1hIQf/H
         mLozUQY/YGZaFn64ySNk4vzCTPPsoef7ClnTn7jaiI6KZ8nZIJkChCmhFg/5SdNuQ1TD
         Dv48095GzPBVp/QuA8MHoZAJAnDPnRjGD82mzdg9C+auuVNJ0MjHXHoUERSjwtIxgJBN
         mItO1exj6IdUJC6vtDv+LnCs09XKFFl/1dEdav2NrWF80QXuFieAIoKi7Suf1W1cAJj0
         Me6A==
X-Gm-Message-State: AOJu0Yw5r+/t541j9O83tE6RtDj9bAxSeotZKuZ14+qydE7eYE3CRhyK
	Vz83YSlgayPty504OiI+feAmYOhiNeK7H5i9t4Ra72Nvr4VDeK/xwU8YGH3EnY9EOu9Rh0/suYg
	2mgeUs2U9br7g8/h2YXAC+ktzF2IRgasXj9Xpj3c4I88jqSgW80BmgEFOXuv8lpcGB6qr
X-Gm-Gg: ASbGncsaM/vzhgPr+PFzGuLGf9Ciq7m647DJyk4zWcZ6owKYBgh0tb4xBqone2VC4+F
	TAcneQbzo0/MwxKt2qP88Aag1UsCz0TT6aVcAJCgfIk1cr4c88TLJWixQ/OQHHZuoZ2KPgs4QYS
	BHa7gC054SjHm71DjbxlrWfYx6uuRY6QEJl2Jq8UMv1mUbl37M2EJ01Nv1I5I0edfW/gpeW+C1U
	N2kUWCFWe+etGBvsFg9cEmQ9itfiG7hQ/2GooXLo0oFck92S4Qj//uhoNb+2Ye2mXRlAfi8i4fa
	FrHKQJ8G7nFLfs7+m6AF/hXZCybWEQEhDLFxmIiwJS2OKBq5mHNox+N8lEjdvBJr21xeHeqHmYq
	sUmLJhJr3ynNoovBlzHkfh4ARCZopdWu/8/K021txHZ68h9L3NiU5
X-Received: by 2002:a05:6214:cc6:b0:707:6161:5988 with SMTP id 6a1803df08f44-70ba7a8abccmr27697116d6.7.1755268235997;
        Fri, 15 Aug 2025 07:30:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKls0jJzx30qUf8dAuDYp42OoO2+G5R2cjgAapJP5umqOkhX87B5oQFPnKJlUQW7/cVX+lUw==
X-Received: by 2002:a05:6214:cc6:b0:707:6161:5988 with SMTP id 6a1803df08f44-70ba7a8abccmr27696246d6.7.1755268235199;
        Fri, 15 Aug 2025 07:30:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f358bsm305661e87.110.2025.08.15.07.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 07:30:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 0/6] dt-bindings: msm/dp: Add support for 4 pixel
 streams
Date: Fri, 15 Aug 2025 17:30:27 +0300
Message-Id: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAINEn2gC/4XQTWrDMBAF4KsEratU/7azyj1KCbI8SgZqOZEUk
 xJy98oJxQvXdCN4YvSJeXeSICIkstvcSYQREw6hBPO2Ie5kwxEodiUTwYTi5aDd+dCnfGgxdBi
 OiVZaGu9dY0F4Ul6dI3i8PcWPz5JPmPIQv58fjHy6XbdGThltbGOVbJkRyu4vV3QY3NYNPZm0U
 fwKmmnJloIogm+EVkZ1Uth6P6S0vVztVxH6mZEzU/FqycjCVMIBq0WtKyZXGDUzNWuWjCpM20p
 uwMgiqRVG/8PoieG19qAr5eVfSz1e1UcojSXMr/5JaxPQaQjzbhPglt97mzLEMv/4AUOwPEv7A
 QAA
X-Change-ID: 20241202-dp_mst_bindings-7536ffc9ae2f
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3828;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bQapPzenZLyTGK7ECXYfIjUl3GjiSCJxWw0TY4elCgM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBon0SH/tT78u1LLbXDS+TPv5j3dB2r80a0zqj4y
 IYLLH+w6MWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ9EhwAKCRCLPIo+Aiko
 1Vt2CAChlv+VPS1gkmTEv3nFDlmH9JWGwstHv5HCMGMEi3a6Sg4mU8aM2g6QX4PGWh5Lfb853Ir
 O1KFH5lOCcmYIbejcLoC6p7afpkdVKj/Aho4Evmvw/qSgEKzA8JhBeYUT9Du3mkBsVkzo/NWK1F
 WU523oRGyHwcEnkzvmmlaPLFjHNWvcCO1aTaYA8oQndYeEIWXN+bFiyO4VJFl1gPwQdUR9Q3AE7
 yQrzMhX4t9MyuJlfEkzIxlgn5c5sGW/H1BVQVfevBE7WTI/AwjqSF5ukBxhDV1aTWAxtRCoJxeV
 lQlCa104AyiwvMAFtH7VUmSUwSH3W1Se8HC+mH92k9k3hs8N
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfX419bBmTlQpcr
 /z0ySHccKR6nRADZs3ynRumvSLY5EJLo/Ap633ZH8dPmUrkIW0DJ0pTjtVuqovKR7CavHyLynH9
 BuUN5F19yy7CLlCyCKlUB7D3Ctm9LyqLn26CQhwZpRkNfFq1hYZIAn2+9H5JRR6s6PYyjCb2Reg
 Brm1jU7x1tuXnW8GJFwO/sWX0HOtXbn2kom1614VSMXwLQLF+CkZ85pSFNkZteT5v/EOQCBArXy
 QsGmC4BEJxAf/qoQbNxMi0WjX56XVhPI3j0AjrySmLjKsbTrDCLdwl8KWhsUxfsz8f5pgxAp0f4
 VNydFyCzrgINwjRYmSXh9/jAiMOdX90TkSrXpwDqWM3AqUC2LnLnREb2+wLeP+JpHXR5Y6kck9S
 7+Z0vAGV
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689f448e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=nKDAeR57af22TOinyaIA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VcowUikn9_xtxXQKawQAJWGtiHe_rDQ6
X-Proofpoint-GUID: VcowUikn9_xtxXQKawQAJWGtiHe_rDQ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094

On some MSM chipsets, the display port controller is capable of supporting
up to 4 streams.

To drive these additional streams, the pixel clocks for the corresponding
stream needs to be enabled.

Fixup the documentation of some of the bindings to clarify exactly which
stream they correspond to, then add the new bindings and device tree
changes.

Note: SC7280 changes depend on clock driver changes and will be posted
---
Changes in v6:
- Switched platforms with different MST configrations to use single
  properties entry instead of using oneOf (Rob)
- Link to v5: https://lore.kernel.org/r/20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com

Changes in v5:
- Removed SC7280-related comments, it has no DP MST support
- Link to v4: https://lore.kernel.org/r/20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com

Changes in v4:
- Picked up series from Jessica by the mutual agreement
- Corrected Rob's tags (Krzysztof)
- Split X1E80100 DP patch (Dmitry)
- Removed SC7280 changes
- Enabled the MST clock on SDM845
- Link to v3: https://lore.kernel.org/r/20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com

Changes in v3:
- Fixed dtschema errors (Rob Herring)
- Documented all pixel stream clocks (Dmitry)
- Ordered compatibility list alphabetically (Dmitry)
- Dropped assigned-clocks too (Dmitry)
- Link to v2: https://lore.kernel.org/r/20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com

Changes in v2:
- Rebased on top of next-20250523
- Dropped merged maintainer patch
- Added a patch to make the corresponding dts change to add pixel 1
  stream
- Squashed pixel 0 and pixel 1 stream binding patches (Krzysztof)
- Drop assigned-clock-parents bindings for dp-controller (Krzysztof)
- Updated dp-controller.yaml to include all chipsets that support stream
  1 pixel clock (Krzysztof)
- Added missing minItems and if statement (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com

---
Abhinav Kumar (4):
      dt-bindings: display/msm: qcom,x1e80100-mdss: correct DP addresses
      dt-bindings: display/msm: dp-controller: add X1E80100
      dt-bindings: display/msm: drop assigned-clock-parents for dp controller
      dt-bindings: display/msm: add stream pixel clock bindings for MST

Dmitry Baryshkov (1):
      dt-bindings: display/msm: dp-controller: allow eDP for SA8775P

Jessica Zhang (1):
      arm64: dts: qcom: Add MST pixel streams for displayport

 .../bindings/display/msm/dp-controller.yaml        | 97 ++++++++++++++++++----
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 20 ++++-
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 10 ++-
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 10 ++-
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 20 +++--
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 34 ++++++--
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 10 ++-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 20 +++--
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 72 +++++++++++-----
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 15 +++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 30 +++++--
 17 files changed, 295 insertions(+), 103 deletions(-)
---
base-commit: 1357b2649c026b51353c84ddd32bc963e8999603
change-id: 20241202-dp_mst_bindings-7536ffc9ae2f

Best regards,
-- 
With best wishes
Dmitry


