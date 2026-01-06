Return-Path: <linux-arm-msm+bounces-87579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 598F3CF62E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 02:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A19430C3BDA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 01:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE421DEFE0;
	Tue,  6 Jan 2026 01:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SweYJe5X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eq+9044e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFA0279324
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 01:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767661280; cv=none; b=HU/HkUO5UTQWjkZxcE+rjJi4PWe9H9DJtMw/XIpbvC4N3NWsZbtMcns9hVY6sZiDWw6ZJ6+ALtJeUPqMTbjRAKBOxKooFPYbdIXEZxJ7LjP8n8nn6PByUjXIM2YgKPAe/I5ZrvP0J7ZQPaDiYzPbSui2nbDGUp50C/JeEvnR7LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767661280; c=relaxed/simple;
	bh=CIG0Is9FpLut1uuuiBQ9Ij+nmpKB6QNbq141HKGdsi4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s+b/XFv/DCkige/foAQhKmt19FUwNqzIVCP2rCYuxUrJzJj2iDeLG7mJImrNOGkSur76HYH7zRPf1tbkiXkzJLHcM/GGJMTjyYQkgaL8+sWJId7PVpxjgLzw8bQ1hNiDUQJuNLOpun6G5UTBSXW7sgzLpzaZsTsT7KPbFVHqVUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SweYJe5X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eq+9044e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nGXY3114825
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 01:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CpE/A+RJl29TLk93kJv/na
	TvWiBqJr+zO5MsuSOsBCE=; b=SweYJe5XenberV8rWMUSd9F1lZRZF52w2E+hit
	vttKHo8Q00sCJgqPY4h/G1U3PVr1sKAIfZTpW42CAmxy9qLc6loxMLP1kD82OGXt
	xdILxzdbWjHJQIQvxDFkcHY7qfPFaOKYfiKzEtzPOPU1Rip8wFQ1aMp5ZxIbZpbh
	TONH6z++GlXv/KPm3o7gb+1LTLReQwSLN7jiP/+Vcl4FJamfVlC+RKG6zWfIVAak
	BHiVtWSSuptai+GHfEya8f8O8cJI4uQHa6c8+xAK+9dvvyB1RnEoXerw5mRpyQuv
	5+woCTgu04Qaflhn1ii35/AdtivCafHGZwlRZDQj+sOV4pGg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgmnh8gwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 01:01:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4fb2f0cb59bso10673081cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 17:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767661277; x=1768266077; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CpE/A+RJl29TLk93kJv/naTvWiBqJr+zO5MsuSOsBCE=;
        b=eq+9044eipxqy/bnD2GP8dPYtqbsbXkWTTv8ImTLc73visksULS6qgKoYq8x8z68hW
         5+31HsYU7MAYAUKlpXu9YpC1nj+BfPu1kjdRstnt6XVKOnb/s+KiuX2ls0TqA/EK9fpr
         ApqbcLMvL+5o6XLg1grJJPW2yzvuzWerSi2+gVaBAw9Rjl3FP+tCvmmlc9e7MldRtfEW
         bk7J88P01tEgFgYcOL9IfAjEqsQp/MmlWzzFqluIuWg3xhqaXvDtDJILCjj1F3XVcU8V
         0q7PYdjXxWmhTRwfgwoI943V7Y8GE2qwDOZ9bmAQUvt2Gq187/RR9ErglMNfgXLRzV0n
         LU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661277; x=1768266077;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CpE/A+RJl29TLk93kJv/naTvWiBqJr+zO5MsuSOsBCE=;
        b=VvIvw1VvQcyQbJe+xvJzKgN32llISgJxyPNR6wWvd5YKlcAhUe3nWb5l3zOK33BoRA
         Oce0hqwW9NWkQgz8lBttPL9SS9jVVY6MNln6r20Qdu/6r7FIUjx72S4BkYqRFFVqu/as
         liuOZC3Kx19esy85cC3reMAHj7104JNvHuI4riPNPgwFR0ANA2wqbKzSsBYaCPWZ+ANf
         DvogX+q/q6gYRHSISj2oUVrN9UVXE8XRhV+w9HhkPKcBgV2vtDGT2qA4F3Ix0XlXfdU/
         q/2GtRHeDXsfghV4ZMk5gvjqAyO/+api8h45MHVxB/zmcbWMvOVYVJsQsr4yvlJ7VYCi
         QU0Q==
X-Gm-Message-State: AOJu0YzL2I6AH9eoqluBtSkmCwg45jvTXlH4iicK+45oYjiopPsleXC3
	u1LiqyKyRKKODH6sQMVwq2II18iYedcbx6Lf0U56Ct7JmCbKoNcGqe6mK1GIjmJVY2xP3x3Fp0Z
	d/dgwi45M1LxkZ501gq6hHpwY5oBQQgsAMD1orY+2tligU9YflhY8MReIXh88cAt1T9nI
X-Gm-Gg: AY/fxX5FstVPHUHycoRZ5cZ52FFC5/GNMfYLP745ffjLy8XscDudjf8uioKq1vyfccY
	wv2dvTKfjv9+pNk9VjZpiBg8encJr7OfkjdlmO4guw74O37scX3oIgzSmb2pNrrFgWksi3iV2MC
	rEhBuCxQGvQyS87QL81wn+Ri+4/dct3NIML3Ss117HR9JrkcfO36ygWMhP7B7WZ+Dt+f5d12yhj
	LuynGfg16O6iSAC0j3ygTCVyaKgcF0oXdwBTlxUZucZzkUfkMuBoptW6iei5wR2Tpa6sUZEXTtm
	wT1oHxf83U6NexoSfRjpS53lxUfvJ8BhxRGfxj1km9rLqiv2stZjJC2y7uupYXMn6wv/g9TYU6d
	dHEATRws15AU5gQbWSLntilv0TlehJvLP6H4BaA10kMIXq7sXzSuTkHMD5rW524gCkoqKxjT+3A
	vP63fi+N8EfkBgL61VdGvQqpw=
X-Received: by 2002:a05:622a:11cf:b0:4ee:9b1:e2c with SMTP id d75a77b69052e-4ffa76de52amr22746301cf.33.1767661276589;
        Mon, 05 Jan 2026 17:01:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoPcIoXtZ5S3sACfb6AlbO/bvWBixeg6CDOT9VqCG7O0cs7fHG9tI8NmT9nXBGmCXl0qhHmQ==
X-Received: by 2002:a05:622a:11cf:b0:4ee:9b1:e2c with SMTP id d75a77b69052e-4ffa76de52amr22745571cf.33.1767661275935;
        Mon, 05 Jan 2026 17:01:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8b1sm181082e87.6.2026.01.05.17.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:01:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 00/14] power: sequencing: extend WCN driver to support
 WCN399x device
Date: Tue, 06 Jan 2026 03:01:10 +0200
Message-Id: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANZeXGkC/12Oyw6DIBBFf8XMuljBR9VV/6NxQXGoJIoK+GiM/
 17UXTeTnMmdc2cDi0ahhTLYwOCsrOq1B3YLQDRcf5Co2jOwiKWUsYIsQsdFEZFhMcK1REieJbK
 oc5o9wB8NBqVaT+GrutjgOHmvu5bw5haJ6LtOuTLQuLp7x61DA0e8Udb15nu+M9MzfzXH9L95p
 iQiVMqkziKW8zp99taG48TbQx76AdW+7z+G70fn4gAAAA==
X-Change-ID: 20251229-wcn3990-pwrctl-cfa64f9d8167
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3235;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CIG0Is9FpLut1uuuiBQ9Ij+nmpKB6QNbq141HKGdsi4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXF7YalStl2pZB8CIWM7xWNVMoyMjk4VhBVVLW
 r/nqGqZmJCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVxe2AAKCRCLPIo+Aiko
 1Z7jB/0VmTg+9TxqCA3shr2UhDZ+pWcE6JzPASajt3+q8+WTb/DbAFIE4bO0En5q0Qts4XrLyue
 5Wv9S7gcT8v8cCzMAqupR3c66Xgup9gOhlUhOc+Eg7kN8sM3PIlK/fT6MplmL4arM6HnKUAMKrZ
 UpakFjS/+uZlFbZfZR/QOkdwe3BIU280FXovJ3DDfpnNdG/CvFEMK6ykujZWhFpenT+EDRUw7Om
 E8fgRuD6g5VuSjZtMIz0mqxws954yB3UMtsL8VjB2ddORxCxHERyvaVBOXfmdNCMeOqExxd9DcG
 sY8QTJhCxpPrZhMw82Ks76WPSS4pOD1B/cyCbcn+th/MwyXx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: S2h77SkzASJuhAT16A15J3UfIXEkDNt-
X-Proofpoint-ORIG-GUID: S2h77SkzASJuhAT16A15J3UfIXEkDNt-
X-Authority-Analysis: v=2.4 cv=Vscuwu2n c=1 sm=1 tr=0 ts=695c5edd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OJCnd7j_un46Nmgy12kA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwNyBTYWx0ZWRfX1/PMouSAQ29S
 /nhxzJoIraJhGnngEDViDl6WhREvpQzWaySXIkb8Fct2Ct5wi0YJA1DbJgjmeB5k52YDPNCWW/h
 cDSAly/dz9NX7IAvqiz69IAnTE0zRVpGnYEycQpjPoA+xS2Gr0SRtNkSzrUQZYoRr/cRN+uZvsl
 ATl46PKb7WADxzyPDO6TDXaIlAMuQJRMfcYtlssoGm0M3ZOfC1Fsp/IwS0dx2Z12DXLx3h8ci4o
 6bNoeiU33Jifs6EWd9vLQpXJOVaXjDgJy0QrKzoYG1JmM7a2bclK0VCi+EUoFvI8ssw3xIgIQ/7
 /Kug+l7jTLgBtcpHJA4XSoqDdRMP8Jpgk9NmI2M6CwAeQ32/ekfDknRZlGnfXUKRpXM5QswcVhi
 0/5p7QOE2li4v7koRIupB8PzEw5d+3cikH1wzPhJ8QMPdoU6ySjXbreNozI7Upqz3HEMeP2ixGh
 PGOM9AkvJ1oAO2+MVkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060007

Qualcomm WCN3950, WCN3988 and WCN399x families of WiFi/BT chips preceed
the later WCN / QCA devices, but they still incorporate a very simple
PMU on die. It controls internal on-chip power networks, but, most
importantly, it also requires a certain start-up procedure (first bring
up VDD_IO, then bring up other voltages). In order to further unify code
supporting different families of QCA / WCN chips and in order to
maintain the required power up sequence, properly represent these chips
in DTs and modify drivers to use power sequencing for these chips.

Backwards compatibility with the existing DTs is retained by keeping the
regulator&clock code in the drivers as a fallback.

As a part of the series I've converted only several boards, verifying
that all known instances of WCN39xx family works (fixing the issues
meanwhile). The rest of devices might follow the pattern later.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Split the WCN39xx PMU schema from the qcom,qca6390-pmu.yaml
  (Krzysztof)
- Expanded the comment in the WiFi driver (Bartosz)
- Changed vddrfa1p3-supply to vddrf-supply.
- Link to v1: https://lore.kernel.org/r/20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com

---
Dmitry Baryshkov (14):
      regulator: dt-bindings: qcom,wcn3990-pmu: describe PMUs on WCN39xx
      Bluetooth: qca: enable pwrseq support for WCN39xx devices
      Bluetooth: qca: fix ROM version reading on WCN3998 chips
      wifi: ath10k: snoc: support powering on the device via pwrseq
      power: sequencing: qcom-wcn: add support for WCN39xx
      arm64: dts: qcom: qrb4210-rb2: Fix UART3 wakeup IRQ storm
      arm64: dts: qcom: sdm845-db845c: drop CS from SPIO0
      arm64: dts: qcom: sdm845-db845c: specify power for WiFi CH1
      arm64: dts: qcom: sm8150: add uart13
      arm64: dts: qcom: qrb2210-rb1: describe WiFi/BT properly
      arm64: dts: qcom: qrb4210-rb2: describe WiFi/BT properly
      arm64: dts: qcom: sda660-ifc6560: describe WiFi/BT properly
      arm64: dts: qcom: sdm845-db845c: describe WiFi/BT properly
      arm64: dts: qcom: sm8150-hdk: describe WiFi/BT properly

 .../bindings/regulator/qcom,wcn3990-pmu.yaml       | 100 +++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |  60 +++++++--
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |  62 +++++++--
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |  66 ++++++++--
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |  75 +++++++++--
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            | 141 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   9 ++
 drivers/bluetooth/btqca.c                          |   2 +
 drivers/bluetooth/hci_qca.c                        |  26 ++--
 drivers/net/wireless/ath/ath10k/snoc.c             |  54 +++++++-
 drivers/net/wireless/ath/ath10k/snoc.h             |   2 +
 drivers/power/sequencing/pwrseq-qcom-wcn.c         | 130 ++++++++++++++++++-
 12 files changed, 671 insertions(+), 56 deletions(-)
---
base-commit: f8f97927abf7c12382dddc93a144fc9df7919b77
change-id: 20251229-wcn3990-pwrctl-cfa64f9d8167

Best regards,
-- 
With best wishes
Dmitry


