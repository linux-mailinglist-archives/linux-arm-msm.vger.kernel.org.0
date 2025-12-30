Return-Path: <linux-arm-msm+bounces-87016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB434CEADF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 00:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67ABF3020483
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 23:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0D52E1F01;
	Tue, 30 Dec 2025 23:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IAq3OLI8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/AW4XqL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EA81E3DDE
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767137772; cv=none; b=msxvcE/fujgJKplGIYox58JgGlDNrvPGDWr5vfFpQO8uAvUNcj+HpkCY7CJj9klG0rdwNpzJ2WOg9T6wBf8dkWQ3U7A5mQr6a77DzLzSf3ywFveobydcKCxqNrtNOev83dca5OPFppr1I07HH+j+BxeL8lalrMLRRsLWcK0bSSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767137772; c=relaxed/simple;
	bh=bXiffYe+pGwR6NdvYFKSdqs2/i01fTSO8sfcFDANfYI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YenVBTw+ZQ4dICp0KLGrAjoeja6kKSWH/s2Ffpz7Bupmr8SMc2iNh8i8pyDYr6yE4zhfYot3osTj6u6SKmFLgUraRJCyNR6uVdhq9x03HgotMRqtmGiB1QeGo1o8uta3/Gw34PqPdvCeRIiai5oJjf5N4zEozSXReIlZHwar7oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IAq3OLI8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/AW4XqL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BULpoBY2916171
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iHIv9QUmmytm0fzr7fSOVg
	rYUmUk9Taj3QlV+Tv7v8Q=; b=IAq3OLI8tekB7DP40aAgXOSjohTykJApdWvsHh
	e88tZb15sVvCKc3AxCjYAPVG1l+vJwRXuccUzFBCBP1BYYDSTiG2r7WAmz70Gbk7
	N21QrpFGF1sU3eUpeFYep5QsJgu+afeVcwUK3pgxqqquTSTD2qdFG4MqKPiVT4+0
	OMlZzJwQnRvUUxZ92s2GZPao5CQFyfvjN3HVNeOekpn9B6I/eXa1tW50iKuWpgDY
	YQ5kOR0mxBxWhKFeaY6cW5r4ioCh0JOvYtyYv3pER6gzxtlb+kttSuuu+Kji+WWX
	dt3PM7b12P45+rmXKBVkyr5mx3cA+M/ts4e4p5q6vQNyao0g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky26wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a32bf024cso104112546d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 15:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137768; x=1767742568; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iHIv9QUmmytm0fzr7fSOVgrYUmUk9Taj3QlV+Tv7v8Q=;
        b=V/AW4XqLUVRiFKk9D+m4HvNoBOaCvl+XAK27bMnmRAyTWbDUEtR+klBGYxUqbrHw1J
         t4LEdS5QC7zRdA0aQAYaiUujAcPjuE0byUkIh+EUYS9M5zgwsKEJ5Y0o+f82RPTyUGIA
         fsrvWffKCKMOnBNW1JBnnl065owpVtt84ILrgwKHCBpJqdt7JYtpG8zsJrjedtz21RX+
         tqctS2jhJHHxKSKQOOxE+sGVh2kivQ06oYCSsHfUIEYNmai+zcTppxkjI0woeiSOTsY3
         Nj8tJKpe+XFuRWleOyBdQt+5OGVB8sqLC7WUS4zZV9/1JLzPJEsz6eRhmv+Qo0jQFAbA
         RcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137768; x=1767742568;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHIv9QUmmytm0fzr7fSOVgrYUmUk9Taj3QlV+Tv7v8Q=;
        b=OrrLRnAO8pQ+l3mGHJ4kBoztiA9RuLoqEzvF/39vqNZg6dMWL/fzGzFd/G1/5/FdDu
         Ft8wRc9ciwXc2DYRobu/xDK8c/drzIKO9El98QWvBownDkJyj+B6NAN06TXHpoZh4Sxg
         F/NcOFm3i4CUbJw5yzlqcQ23XWnybn9/9pGGGk/4SztR2KyUQnn7swRW6gIapryGlmrJ
         UoyNqBKTPTjoPMXughhuE4Le1HhctPfNkXkvF6FPm7HnqDAf1Gu6y/DGb86241ewYWeT
         3mUz+axgxUxfRBTTU2Ubehc9Qee5zo2Ur22rT6HVpiIlsEgliCvsDgCSkOZsFr39+OUW
         CH9w==
X-Gm-Message-State: AOJu0Yx6e0Z/CuNdNTR9mANy+ZSR7qFu+spldgEy81wgAQrojjpZsATP
	jATGeEufvA6/m1Pcv65wVrbfgHB3pwogLioIup9awmU4PWDwqbt0qPwpX+nijn2GN51d5nLJX5j
	F1KdPHujYFdJsceGF7nUjiCB7lvnbNDdA0t7/3Obe6UplygUCH3G39UZ+YnyUHZWQXekB
X-Gm-Gg: AY/fxX5LFgUiG5eSrbMuDbBY0ybQkIOih2+x8HbYA68iwTmcgpDyF9sBAvDp6ca3Iye
	MRxbXgn1ukNwv+w69cSdZi9xaVFyt067yEllYZir71dV9ES6eH/Hby9S8ky46kvdlpan43YvWpE
	TM63lPQlQUquHrtlvkxjhZpWiSjfcYNBV3t5xbJHFGsFHyMgX0PxR74lJVDk64haubC6JhO8dFp
	s/z8vxn0+OcF+6Vyjs5iz+tYUnbplVmFj5N242ltHNkCdOV1ySzsNJTGGsnXbNvtGciKOZZ4zZK
	a2rTJMwTMzTVwez1U5rJxYJNm05r1F7e45pauYoFcRNYDxTahjPDXOnK1W/0wtL4SAzEWQ7Pa4I
	xzfqZHz/Ryt6inMjdPvhd/OXYaR6Qx33DWSfnSSc3arpvdv6B8WcvvhJBAlYUZTvxn1kuPeit8P
	ND+WvR7o0JHgVOll9sF9DbwP0=
X-Received: by 2002:a05:6214:5346:b0:88a:577b:fa4f with SMTP id 6a1803df08f44-88d816677dbmr455657536d6.12.1767137767746;
        Tue, 30 Dec 2025 15:36:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdnza02N3sSIYqg8QIbbm0Oq76vXy4hsYlfyFT5vTsSTcIzXDSLfcpiTPdwPf76j1mcmQ+Ew==
X-Received: by 2002:a05:6214:5346:b0:88a:577b:fa4f with SMTP id 6a1803df08f44-88d816677dbmr455657166d6.12.1767137767195;
        Tue, 30 Dec 2025 15:36:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/14] power: sequencing: extend WCN driver to support
 WCN399x device
Date: Wed, 31 Dec 2025 01:35:50 +0200
Message-Id: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANZhVGkC/yXMQQ6CMBCF4as0s7aRFkXLVQyLWqY6iS0wrUBCu
 LuNLL+XvH+DhEyYoBUbMM6UaIgF6iTAvW18oaS+GHSlr0prIxcXa2MqOS7s8kc6b5uLN/1dNTc
 op5HR0/oPPrrDjNO3dPMxwtMmlG4IgXIrIq75HGzKyNDt+w+JUlN6jwAAAA==
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
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2926;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bXiffYe+pGwR6NdvYFKSdqs2/i01fTSO8sfcFDANfYI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpVGHjsWqyWw8firHhZXjG//YGd+ddG8rzLWWCL
 WXNgAt92o+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVRh4wAKCRCLPIo+Aiko
 1dM0B/9/9lvHUyWnm4IW8UQUVd6Ydzg+g+mgeLq4Q3CFWTqW9Ic1I/uar9yFDIiUOKm/1iqlvKu
 XzHHVPLclr7szWyZVYQoGRDbpQBulW9Gv9dLrugNavrtjSqXG1A/O/eZa/P9f1efTR07zOXsMBx
 ZK5ecfcSL+j14c6PNvQpqXRaR3NDjgtqcj6QRTX+5oiaTTsfdGFjoZYCN0vZr5c+0aOlWgXyOdG
 TzywGECxV6EHJSutjs8MgHgjyrVeiGTFUAxKYZ0nrp6mghBowjfA3aWRIgbRzJqwLr08OZaH687
 gv0DA0MhoJeg3kRPZJYoRGKy/UFCIz/lzBcyIAwmF9KPMGM2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfX0quU8/SemzR2
 iTww5W2IqbqowHGaMJdMihi8vNxP8W2u+GNJ8CjjircBKqHmBQ3tCfEmaFO0arnL8+3rR2UFfv9
 3PYostMEjY0OC5wvBDWUkz11NhjQfk9Y8QjetTImnU9gb4SP3r1DgQ99InDMAMZruK814pa6dsn
 RkiRh7FT8a1Q+mHxVSTwq7tKK11Xk5G+8nbUIZrYyxbTGQlr3xXPTL8QQJzhfGGYPBJJFX3eOFz
 Q+OFn6Vq974mCiHLlaiVHRoz6LBcKGh38QzBwGSjGULd2xN4Lh/2C5jA219UvxIYVspoz1MeYFW
 h5K0dSAvhVbWnsSyY7dcwp+zhY3TZWG5TvSGP/i2uGZ343mcRsngbjZw33D3u+bgIiSZ3oBn9d5
 +eXqlVlNdE3+4ar1pJnbED2g2mXIR3hRs4gNkQemr71BmzUJ3CyB92w9OKiw+CNtwtGssX2fOpb
 iRjVibeXaO9jxYDQESQ==
X-Proofpoint-ORIG-GUID: CZ8wRXHvLhjyDjKvgzrO4LA3rpDaJ32Z
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=695461e9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qrAnp46GSAHW5yBWPzcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: CZ8wRXHvLhjyDjKvgzrO4LA3rpDaJ32Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300211

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
Dmitry Baryshkov (14):
      regulator: dt-bindings: qcom,qca6390-pmu: describe PMUs on WCN39xx
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

 .../bindings/regulator/qcom,qca6390-pmu.yaml       |  36 ++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |  60 +++++++--
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |  62 +++++++--
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |  66 ++++++++--
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |  75 +++++++++--
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            | 141 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   9 ++
 drivers/bluetooth/btqca.c                          |   2 +
 drivers/bluetooth/hci_qca.c                        |  26 ++--
 drivers/net/wireless/ath/ath10k/snoc.c             |  43 ++++++-
 drivers/net/wireless/ath/ath10k/snoc.h             |   2 +
 drivers/power/sequencing/pwrseq-qcom-wcn.c         | 130 ++++++++++++++++++-
 12 files changed, 596 insertions(+), 56 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251229-wcn3990-pwrctl-cfa64f9d8167

Best regards,
-- 
With best wishes
Dmitry


