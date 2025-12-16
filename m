Return-Path: <linux-arm-msm+bounces-85394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D3CCC4669
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 17:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28FA130072A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 16:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3974C31960A;
	Tue, 16 Dec 2025 16:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f0Vg8Qtn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ImOJg0WV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C082C0277
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 16:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765903693; cv=none; b=c4zG7v54h5f/o936K92X5Rrtrd72b+POqxhkgs/FtQLDH892+6B40aYfal22EB2+m7zSRrlmv8j67SrPScbv7L0jqYbc0wUpgxoUCv8RIWLTeMbwsthmEwzLY5xXuY/WjfBXgStX/WCpdrBgZAFvduToQcBSk2bYGuYpO8MmS6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765903693; c=relaxed/simple;
	bh=Y+aNU/GnbBKkmA2Hk/SKqdRM945S/DX76ZJUZblqaak=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FIYiU24Ce+blcoAVZYs4S0FmpIUZF6TVyIN7NwFC8ib5PxG2aU/Owe/by4YCkB8nglfSUtA8UX3xfN1tj+sFVoXfQKjPCTKcTnD41ZAHBt1wP3r+5Kci9CI2aC64/APjT/uICw80l8Tjrk9A2n8J0iOGSbmdTnazypc7A9zaJAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0Vg8Qtn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ImOJg0WV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGGipTP4077093
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 16:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Yt7+Qfz2xirNaaz7WR78ab
	E193GBpDrtpjBGsRIPEQI=; b=f0Vg8QtnqDOsxZbt7RErKlEngHMP27V7X0Layj
	KTK6pZlI6SW2EWRis6brUWNLx5uxhws1mi3PJWCxC3avgmqlQCuvN16P5F9WGPQ7
	XLTPXPWC9LlXpJrIjFKg1/o9wgWWFIVaAfJgdfbBtvkR0CBEIrvOnCyGrwkvAhIr
	CRSMp8MUfFkA7571ALJQG5v+yFeeX0GVCHhjYXTM3FI6Um3/PgVDVw28Z14MWfIp
	GtNOpjeM+zsBtc1z8xGnPXzQs5Tu9cKal/nN5s0jLc05QSEvwp2mj3PO7PjUambX
	vDSY6moZZaO/+DVrW5ZoEX+7gm9vM1aL47zlPyvekOKaIkyQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3b7g00ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 16:48:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee416413a8so56642721cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 08:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765903689; x=1766508489; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yt7+Qfz2xirNaaz7WR78abE193GBpDrtpjBGsRIPEQI=;
        b=ImOJg0WVWyczkC8H/KqXu0WozxzH01PQTA6RA83pz1rGbVcpDQQNqgoeUazeao9a66
         tVE/UBz0W+axSatWuv1vs8aH42ztZYNT2JKwd3LokbO5HWPd7n263H8DWiw9S9a/ReJC
         szrNJymCYNLQWWPy2MLoapC4QpG0pBnEmxCimNUpxBFMUiR2y0NjEELTKHC75EfbP/SW
         HpLsk7VZeu6GD4VkM8GRd06Rig8vWhE87dQ4LLbiqOCGncfejaLmNHjfnKSvntFOEDPJ
         F8lpUklMssHGeqMISuYpU2Nvpk0+PsSFDcVF17P2Ugko2y13uJ2KCokvLK+5wX8D5pXi
         6YaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765903689; x=1766508489;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yt7+Qfz2xirNaaz7WR78abE193GBpDrtpjBGsRIPEQI=;
        b=epCl8R5RNSFJ35hvzxElnF3NtmUO4/EDZU1VS0ktSbC6X/CIifA5FzDtecouASDVNb
         Ztn87PkB0E3fq1YzwppmpXMxJo1l+nkbc6Ggp3SN1Ng2wg1Q6VeiUmxeP1seenZNqtxo
         MFHHQtKBYS8vcd/3NGi70IxiEaEwUqyW+qop9b8rUBhTx9Nzhif1I6Q1pFXaP2LeUJ0b
         aCl205RH9mI39gaT1ueXriCsq0UWvzSApohrLoQrtHtqYp6FpCRpUlZoLmfje30PHnL4
         zXvnUK37w+LVWt6O8uLLD1V0SblqBXvSezx81J93bdD1vXXERfJmNbb9nlMpYktAymRw
         IuTQ==
X-Gm-Message-State: AOJu0YyRusaylxTtkc7slOKVTbcm7r1Zugb//zUr30W3X69SCwHUpmB7
	bJVM77NXJ1C++uZbwN0nzQFS2lfg5xM1DRKRZjbj3aom7meqY6qTkRNSrhRwwftJ6PgpOOw5EWl
	peZlrHGYeOdUba6kCSVQ5k1vWfiOKB6UJdbiA7pmPhNXl3tnBZSwZwn2WyKhPpnsnAa8iux0ZEk
	aE
X-Gm-Gg: AY/fxX76gYTTFINoCzq7ipRNJ8Mr3TAs9XcQ9jf3T6ox4mHF41WPHR98kc6Jdf7xBDO
	qP5eXakPTMa8kRCUTS9a6tDXjU/qHgF0aBj99reY176dHtLmfg37KZG1qxr03Mk3tixe5ksqsTY
	d2vcvr0xsqGYJ3ZYh+7PXHLX/YgPXL7HkJXZE3kRwsx4DRumTUCOb4ZC873GaygFG3ZZXBEza2v
	0B0XZVJtk6QLFDPKvUBasOnyUr/ihU2iZRzMSrwPd8XGo5nQ3jwz9UGaYrEQNWqkTo7yFsu0u2y
	9KF1C+jsMvgjF5gMK8zYYht0T0xgXOCMPLcSGtsubr1DURxaMMHsCvi5cOXDcK2z9F869aZTsmx
	VXZrzjxlq2KFCpRX2rpXJU5EFekd/7EBN
X-Received: by 2002:a05:622a:2589:b0:4ee:428e:bf0f with SMTP id d75a77b69052e-4f1d04ab2famr189684821cf.2.1765903689418;
        Tue, 16 Dec 2025 08:48:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESX+C3jPvLlstqSlAbbzIt6X94xGqIUqrOw2MvNA/DXUMqK4B1s38h/d7sSi8IKx19QpTxKQ==
X-Received: by 2002:a05:622a:2589:b0:4ee:428e:bf0f with SMTP id d75a77b69052e-4f1d04ab2famr189684461cf.2.1765903688917;
        Tue, 16 Dec 2025 08:48:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2ea57csm1730719066b.22.2025.12.16.08.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 08:48:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/4] arm64: dts: qcom: sm8750: Enable display
Date: Tue, 16 Dec 2025 17:47:30 +0100
Message-Id: <20251216-sm8750-display-dts-v3-0-3889ace2ff0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACKNQWkC/33N0QrCIBgF4FcJrzPmr07rqveILmzqJqy5dElj7
 N1zC4ogujwHzncmFE1wJqLDZkLBJBed73Kg2w2qGtXVBjudM4ICeMGA4XiVghdYu9i3asR6iJg
 xwQRVlFprUR72wVj3WNHT+ZWDud2zPXzKxsXBh3E9TmRp/34kggtc2gtApfbcUnlsXaeC3/lQo
 8VL8DYIIfDTgGxowktRcUklkC9jnucnrKk16A4BAAA=
X-Change-ID: 20250424-sm8750-display-dts-447473a33fff
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y+aNU/GnbBKkmA2Hk/SKqdRM945S/DX76ZJUZblqaak=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQY0/IuhHbCKyjzBpFzgS2UF5yN+q7YuGBXBsW
 0aXrX00Kp+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUGNPwAKCRDBN2bmhouD
 17oXD/45rYMu2Rm2r2hK5MhZMuiQUFxp3u1HC7VBSm8U4Z+J2l2q38GDgN1aDKglvuJizimvcFq
 yFitzBoHtdyAdYjLcyo3RuIJVPjXePD8P0xgGgk8/Jd8wWixSNEyxZqq4Oajpq7XlzYe51WySJw
 tmOzkKJNWMHrs13peB6f+vshczr2KZgWG/N4G1HeFEQbx9nrCCauxXk86UP2296EKqhRJVXBLrt
 UKffuTr15OZgmv59JIA65DBDd0b9+itcsi3qmi3ej8OrN9anlq9jA02RRIlPBInfHOpnvZjJVup
 c92yADOS3LYTAQh9DM4cI9iyx5voTyym5LzZqEgBF73wE1K9GYW6SGNGvQY0EpozZFkZFHUKtep
 tig7PXzFZKsnl+L4nJqiUldaeEWj3TL14VdkgVGZIAMWBGwSF8Ck19x7PsX8e6g7YV3pZgaKJiZ
 KZYCwMhCdfFiZcWlEtcbWKsL/UHZjc6rlOiGB4NSAxSGY16ERVuPf86A9on7NjOoq9zPpMgSvyl
 aJT03xwVMXZCGHKCmuwb8GrlKPA2ZR0rvfw9+kXWt489wTSqQ/HU/EOZYWUEEd919UeclvlORvX
 27GEsVfIrtIN02+V8chCwNYdKPTuONKSiFOhzQj12R1jN1COkcK/aTLDMZmBMAKjJ8XC5GhDsHe
 YBIvR3CdaA2KTuQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: dcgVp92eRKtx6c8Fb9eEO9I_ZCmG86wO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDE0MyBTYWx0ZWRfX1dLqKH48tCAX
 ID7rSHnqD3OkSrcNe0vbRgqmnwE5zZ5qg8RooupUb3elbRZigIpOpBRH3578oGp5lZ1YkM2mMIW
 EpMLKIeKnLH+AuYhVbqfSVp7oVuteIt4cnxr/xOPuRc/Y56/Y1thEoee20fIkXYDlsPBlAGu0IM
 TxVj3QNc8Pr70GVBt/zQTwFrqLktR36/Dj0wY5MnRCRreIn/uADy9ljKJgm0Ac1weieJPwH6r5l
 SCOygOGsIgLqoazRVARph6dMKagbhsJDHL1h+lCtfbkGuyZhHviWjvrGYOSqbrMAZnOCq7PbBaw
 1Fd3EfsEX9kVAAyGCp/PNWvd/5+Cs5Z5HYjdqxW9jGYDHiN7cmrkO9P0VZ9JWKJULf02qJTlegH
 GWSXcbb916Kz8RwViCzV+/9YD/Ht4w==
X-Proofpoint-GUID: dcgVp92eRKtx6c8Fb9eEO9I_ZCmG86wO
X-Authority-Analysis: v=2.4 cv=PbLyRyhd c=1 sm=1 tr=0 ts=69418d4a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9R8VuvqHf2Z2bX_J5xIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160143

Changes in v3:
- Rebase, add Rb tags
- Patch #3: Add link-frequencies as Konrad Suggested
- Link to v2: https://patch.msgid.link/20251112-sm8750-display-dts-v2-0-d1567c583821@linaro.org

Changes in v2:
- Add Rb tags
- Re-order nodes/sort by unit address
- Add low_svs_d1 opps for DSI and DPU
- Add DP Pixel1 clock (they were added to other targets as well, also
  Abel pointed it out)
- Some context changes due to dependency changes/merging
- Link to v1: https://lore.kernel.org/r/20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org

All dependencies, including bindings, were merged, so this can be applied.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      arm64: dts: qcom: sm8750: Add display (MDSS) with Display CC
      arm64: dts: qcom: sm8750-mtp: Enable display
      arm64: dts: qcom: sm8750-mtp: Enable USB headset and Type-C altmode
      arm64: dts: qcom: sm8750-mtp: Enable DisplayPort over USB

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 129 ++++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 439 ++++++++++++++++++++++++++++++++
 2 files changed, 568 insertions(+)
---
base-commit: 2a4e7901cb5b2a7dd277e93a5b8b10557260fd62
change-id: 20250424-sm8750-display-dts-447473a33fff

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


