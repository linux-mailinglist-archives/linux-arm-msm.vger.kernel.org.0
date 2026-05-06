Return-Path: <linux-arm-msm+bounces-106077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OXBxL1//+mkbVQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 10:44:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A47B04D8026
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 10:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E56DC3019884
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 08:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD7C3E5584;
	Wed,  6 May 2026 08:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCZUwXoj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VcYhy/fT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AE830CDAB
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057046; cv=none; b=pAt03oKgaNi95Hyaw74i56l5F5SZuhizNZnmImZ/ilVeJWbtpINzuFuBgAbatswI1guJf7PLip/F2yxVx1VE1gXMbhMQFgk1BomH1DVRdxDYjSY/R0Xj72cOqJaOCIrGAKscQOVyTGoSBq9AO1bAra8/b+z03Lyugd9RgffIR+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057046; c=relaxed/simple;
	bh=9vA4fHyYmcRAvdU9Qy5L7g1YHobZkfL7qBI9EHl1cc0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G/Q7LMzYerBOHKAZFnXteYCf220VLMpg8vpoOMXyZzsVXAaedEfLdjvMeUSEhvgAcbIyjTqfkFcxDpwHA8bxbwE8BJOBMga0+lSRJSCMkVBKIQQVfirHZWoJAV9SeO1RBIYSvmcoInW6qoZrFCJt5E4I4F5YOvo86Cu4iDDyXeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCZUwXoj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VcYhy/fT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64671crG248286
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 08:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f/gbsaC8MFwCW2tlaPZomx
	EbJBK/uagWxLG9GJswcSI=; b=kCZUwXoj/Rf8fjRHnK2fnKtFhy3F2k4AG/7W64
	shF4X1khm3WzZyinGjZYXGQGN9ZpGyZpTjvjxwySZ5WlH0AvbtnNkYFKmS3fJpwA
	CyCUHEgmbTsMa8uTzKMWPEEi4RnONq5armI8CwGMRzudaWyKNoRRuWASpglRSqup
	sCnoICQbnV5Dy68B5GCfb+CQo2jdOgaAAZmJ+glKrUQO8+nM+jzVSfkRCzNGAS6+
	k/8qOufZU7YSySY+DHD4f5pIShSzkDTUFWGirs71035fINMs51MQ72CftXgsq3fp
	mZ6afirwtWr4OwG7YAtfzPj3STcA4SqVe4hO/tYHGb3Hvjhw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyjq43nfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 08:44:02 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c8ccc7593so8228033c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 01:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778057042; x=1778661842; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f/gbsaC8MFwCW2tlaPZomxEbJBK/uagWxLG9GJswcSI=;
        b=VcYhy/fTxIscYOxRTE75xhDvgHsDa5pg2U7bhzKHO8hHyLF3ktr1RMU7QmMW6tayHF
         HXJ8735IWOuQEm9DSKLRqdRtRtGNMt5rWSCbtkTiFrQnTNP0MlO4kVKKv8NNfQhdBRTn
         WQANLYoHq+4IfdLOhRwtQlyE00tzMa4cs6xqSyL5MfXLO0CdK6b42IKsGzaP8e6QGZt8
         8xCCUr518GuwD9SvzVGflL0IfX6yfzcsIZtX7V0DArN2sLJ/EVyWaBdboocapYMNYQG8
         OTBW0GeHgNEdTZa+Clq0nynhdqTV8HPqR+I3ZsJ3a/0BaWBvl+kHafUjIja2BqxKO1BW
         lNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778057042; x=1778661842;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/gbsaC8MFwCW2tlaPZomxEbJBK/uagWxLG9GJswcSI=;
        b=P/eevN+D4XvyQv66GCzF4ghUVpKyQgkehlLEYSAZDx7uGWqclWlwITZgK9R9VJF90r
         yeSB2KOsa3I9LSrrZ+c/lpv17ceLZjJlqtoYNq/RczxRt6LGzi4zQrz7aPjOHMfkeQOL
         h0o78IRm9Et7TMI3ZsOxd8uPOssLF7UGKRhcEKy8NAECwF5kopTTgVyKIMx2TfHU608Y
         MTFSd3z/sTUEyqh8qWn+QZrCVc8G4sPF/FOQiBS4nGdgezgw35d6Qe6R2wBH0WHtmrQq
         0N5R8JYI9SOENAqLJYH5bgFoIyfoGDAFKSqHpAN7o7ZZuSRphOUKA3wNTchPdslJeABi
         o0nQ==
X-Gm-Message-State: AOJu0YyWyHxP/cnInkzm0Vb/P9eI2DJne5gQnnwzO5nmNUx+6vIrz8Cl
	h1x+y+h7yEpLlhnONptfKk0EYEcoC9EGdyC3tG01fDSGc9vzYwIAODfc6z3gBqRhMb4jouVtd1x
	t5FcWbWSdq6Vsn6wDAnTX5UJLCjreTd4b+bZbAkhxL21Z3cp34Rw369FubVpUWLrnRE+o
X-Gm-Gg: AeBDievWzApm+gHVWWtOMVLz3FgiZWPyUBDQs+RdXnk5e5ZgSXRCtoepR6PfP+5UzDP
	btXt081zQF+86hopuN9er1S6LCuEVyY31lKAYvENPkFCz5howLlMY6R68jZ53Lba8KguC64VWWw
	P7IxLiUJFoRW2jqxcYa/NxyB6mdnryM78RJxYI+RJjjgzkJfg25dYs++4yP0AKmMjs2siqRnHIf
	6ZpdpUNgWDXcUwfOXzvIM58gjZ/Bkv9Ks5QWoJ3DGptKlTySRaPCVVe6KLulVUOK/nTiWQD+TOu
	6YgSVFDx5GxYSreME3ma+etSjszDeNo8dwyzzH2VztJ+arucgiRfZ5Tg6ltDGyLXP6Je1/GybdY
	XQPfGgm1/RNEN0C4sgIWiQNgK91T04pMdaJx+2OEr79uC+fNmmFv6gnHukDDxULHPe9tROqkfpE
	vbk/4=
X-Received: by 2002:a05:7022:6191:b0:12d:ca31:f1b4 with SMTP id a92af1059eb24-1318e92854fmr1239797c88.24.1778057041730;
        Wed, 06 May 2026 01:44:01 -0700 (PDT)
X-Received: by 2002:a05:7022:6191:b0:12d:ca31:f1b4 with SMTP id a92af1059eb24-1318e92854fmr1239790c88.24.1778057041117;
        Wed, 06 May 2026 01:44:01 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13202fbf0efsm2257796c88.13.2026.05.06.01.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 01:44:00 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v3 0/4] clk: qcom: Add common clkref support and migrate
 Glymur
Date: Wed, 06 May 2026 01:43:50 -0700
Message-Id: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEf/+mkC/yXMyw5AMBCF4VeRWWtS1+BVRERryli4tCUS8e4Gy
 y8n57/AoSV0UAUXWDzI0TIzkjAAPXbzgIJ6NsQyzmUmM7FZNO2xeGyZuTAqSpVRstB9CXxaeab
 zC9bNb7erCbV/K3DfD2xyfu1yAAAA
X-Change-ID: 20260505-qref_vote_0506-fb14bfb08cd9
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778057040; l=2713;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=9vA4fHyYmcRAvdU9Qy5L7g1YHobZkfL7qBI9EHl1cc0=;
 b=dNoxL7xzVuG/fA9F6C0/0aOb0eXGRFfaUaiM11KseP4Em/fKs/aBTK02gvsmSySFMLH1rgiSk
 nbHf1viqE4wBtvSMjZKcHpnyStaP9q4NAXW0NjrVk9p13jUhz+j8VN/
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=MYxcfZ/f c=1 sm=1 tr=0 ts=69faff52 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8 a=gTLHQjeEnPAAWBE9dSMA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4NCBTYWx0ZWRfXyYxjIR8G1PHt
 KGlJNMTeNvkDG5e/iK5+oXnTlTfrZ7Lw9VCnjqN9TV3FDhjicgBlo+ZufGLjk6OEacZ09lQ0ZOz
 +f7TD3Ax2uAPdTfHLDzy3vTu0xId98WuUEcilUN6N0B19KHEcoKHjrZ0h6rylYRK3bO2RC42EyA
 sihKi4nnUjLhaQbMORNwcx1RG9duJTzd7AJImSOD1VFNKFwvX9r77gmNxhVWrQ/tcrmXfcoBkXY
 U+9eVO+XLzkDAQJrWZYbrQifUpAW+xV8hDNSeNNJKDlUqZkHnKNOrBWCZ39hytB8m9WUStA1Mxc
 nUbjZb10gybgmnexkwRuRhbDF6IlF0CziWn3xp5gqJN0nJ+H1FB5ds+F6aKJeWjBerA2eOX9f5E
 Rqz8cyh+W6JWJD0h1UXfioXCAxwaPjqN+SpGkg4XNGHVqZU/9spLzI6IYlSYZHTf2ihDXQxq86B
 XA5LCfu5aL6ldLpAkSg==
X-Proofpoint-GUID: xiDnMfmNAS_MAbIf8iTheDvyOUoGc0i8
X-Proofpoint-ORIG-GUID: xiDnMfmNAS_MAbIf8iTheDvyOUoGc0i8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060084
X-Rspamd-Queue-Id: A47B04D8026
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106077-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This series adds a common clkref_en implementation and converts glymur to
use it, along with the related binding and DTS updates.

The PCIe clkref clocks on Glymur gate the QREF block which provides
reference clocks to the PCIe PHYs. QREF requires LDO supplies and a
reference voltage from the refgen block to operate. The refgen block
itself requires vdda-refgen_0p9 and vdda-refgen_1p2 LDOs to function.

Previously, these QREF votes were done in PHY drivers. In earlier
discussion [1], the feedback was that this is the wrong ownership point:
those supplies are for the QREF controlled by clkref registers, not for
PHY directly. Based on that feedback, this series keeps the regulator
handling with the clkref control path.

Another reason for this series is reuse. clkref_en registers may live in
different blocks across platforms (for example TCSR on Glymur, TLMM on
SM8750 [2]), while the behavior is the same. The common helper lets each
driver provide simple descriptors (name, offset, optional supplies) and
reuse shared registration and runtime logic.

[1] https://lore.kernel.org/lkml/aEBfV2M-ZqDF7aRz@hovoldconsulting.com/
[2] https://lore.kernel.org/linux-arm-msm/20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com/

Changes in v3:
- Fix dtb check error: allOf:0: 'then' is a dependency of 'if'.
- Link to v2: https://lore.kernel.org/all/20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com/

Changes in v2:
- RFC tag dropped
- Changed back to additionalProperties: false
- Moved all Glymur supply properties into top-level properties so they are explicitly defined.
- Link to v1: https://lore.kernel.org/all/20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com/

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (4):
      dt-bindings: clock: qcom: Add QREF regulator supplies for glymur
      clk: qcom: Add generic clkref_en support
      clk: qcom: tcsrcc-glymur: Migrate tcsr_pcie_N_clkref_en to clk_ref common helper
      arm64: dts: qcom: glymur: Add QREF regulator supplies to TCSR

 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  57 ++++
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  19 ++
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-ref.c                         | 202 ++++++++++++
 drivers/clk/qcom/tcsrcc-glymur.c                   | 340 ++++++---------------
 include/linux/clk/qcom.h                           |  69 +++++
 6 files changed, 441 insertions(+), 247 deletions(-)
---
base-commit: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
change-id: 20260505-qref_vote_0506-fb14bfb08cd9

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>


