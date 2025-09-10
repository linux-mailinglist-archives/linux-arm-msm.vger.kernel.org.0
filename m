Return-Path: <linux-arm-msm+bounces-73023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 908D8B52460
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 01:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E07A1C822E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 23:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331F630BB96;
	Wed, 10 Sep 2025 23:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKRzPjbO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1DE3002C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 23:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757545558; cv=none; b=uiBpfWRPWjeZwjxTG+m/HrZA53ZhQuqa0P2J/n4Gly5sJtry6XXqXZ3B3tc8JDz1AQS4+YxpHB3/C9sYfhdBGIxmi9p7uZ9g/dtcexUweEZ4izUC9knr9HfWy7YGNtsMFlv76sZjTdclDEgS1W8ug2cLnqPCeIr9cZIEft9NOxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757545558; c=relaxed/simple;
	bh=P3r3Q5J9MFgReONWW52/IgrN1VEKomisQPuiug698ic=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SxrcHdm6KhtlUH5LF7guDXsH2B3GyMJpEwmfV7VRTgzwIp3KnTelAPfuEgWhp9Za4MkKWwf5xLli8RzEdZt70jDnYUnZVKPAjtfSCSXtE0YujgKN2mpKDANtifYCAM8QCRnqU6k50R/gbwJ486cDGQF+o4boTXT6LpZi7/jxKHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKRzPjbO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AMAJnJ023751
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 23:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DbjE+Ga/S7b92Kq29BDPlt
	EzbSzJixvT2Scuayssp1g=; b=DKRzPjbOgrQ8sxC5TtqWZkaSA/gTPRuMgGUBj+
	oY3X2KOk8WBVE6mom5r9QPew4q11OOiNEVhnNIW/CVBKl9fCltrpa/QAFLkTSGvh
	1J4sdZ7fAH9pHAYqBXJgEye2Uf5GsH+omwmtiXsCAXVcHVtzO/EvbKBle1/3Lcku
	grb3wRjoPdTk5OsNh7UTmGhibXMTegNB1fp/K7M7cH/ICTa81eZK4i2WVz5jZ04y
	K7WyGIjyz0xLAf0V2jqc2lTQ7v+sWpxrMftBCOq+JUSsREVDyfK8v2NdPc1VkTzy
	Hm9R1rnk7U2NM6eQ5tS3N3kF5VZGhaEELaF2kKXt+ncjceQw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m5f2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 23:05:55 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-43841a00b31so160108b6e.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 16:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757545554; x=1758150354;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbjE+Ga/S7b92Kq29BDPltEzbSzJixvT2Scuayssp1g=;
        b=faqTLNjWHoZI8UiXgeNqebM3ybT/tSFnCwuzX1OtVgrwM/5bsgoYP3SCZlBXmocQ1l
         TJwv+BYNnPM9QzqDvk5kdT1RcQDFrxyk+KU6h2JfM97hxPbFVd05iz+nHFXXyN78ojKW
         0QDohxpaKzFdrKBSqr1QLRwbnayk6NEcOR/GEY9sO5jWsez7wtbLbAkkDxhXRKSDamEF
         XYQ6t3LAJHUQU5LSq0iIeJBxGP5YfEiQHymkkqhLDnm8n6R1eXv4QTXmnEtNnLsIFygr
         agXeFZMNbIGjNlMVH4hHTcoEcLx3Le/TS1FJrWhhNNs9IztbZtZEQ6FxX0eqbZeJTQFa
         J4fQ==
X-Gm-Message-State: AOJu0YwtBLB7JFqMwzaplsKsXQjT7eEfTl4qma2WywL7er/oUUojUCC3
	yB46l0lm2yHmAssBdLbg2T78rehHXPIp5Xg8OnMBWd52cWmWYGqdb81GfLzYw3WYr3ZhnR+NiM0
	9X5TX6pwTWejw8gslmo4g4P4fv47IqKl+hKIEdgdGmvOjhFRCGv8X9t+LWTYQ06Z/gNN4
X-Gm-Gg: ASbGncsVgirY9N1C/ahbvHIl40a4fO6Z04c1EwckSNm3AhqwkyebggtW20WntFVmVWC
	0vUmZRKs5if8xJdy3BZ6rHFhYFObzzfsfeSKzHfksgaMBvUVPZbEAVbf9FmCxpFrgFEI7F/I1Tp
	r4SFj/jxEliX96IzEziet3rCWuVL7BSVMlsEpIcPno6WrhLhnDxfD4ejIrZmB4YP93tZL6bVV1Q
	1G5X03hKSR7ATDfOXVAm+4LI6MGbQZjfi0zJc/FQn94DfWzKeWGjLI+PzNfQIDZLPG16n7PFz/v
	KTyuzQXKy7lkPwhoMdlAGBagD9Tle/yuW8TP3SxJ+N2c25cZx/WK03DvkK4TuIlQMD1TQNUCHlk
	npKN4pwyuR9TFK4w59Ge+0oEDYidRO2nUzzO4n3g=
X-Received: by 2002:a05:6808:d52:b0:438:3867:d770 with SMTP id 5614622812f47-43b7b9ae108mr695931b6e.3.1757545554198;
        Wed, 10 Sep 2025 16:05:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMutvuPer6FBYPwmVH3B2JS/hzfAc3lHBoF9or5fT3c0WFHgHTYjxvsTvRSanpC/P/oMg6SA==
X-Received: by 2002:a05:6808:d52:b0:438:3867:d770 with SMTP id 5614622812f47-43b7b9ae108mr695917b6e.3.1757545553708;
        Wed, 10 Sep 2025 16:05:53 -0700 (PDT)
Received: from [192.168.86.59] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43b7f1f7d63sm23944b6e.29.2025.09.10.16.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 16:05:53 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: qcm6490: Introduce Particle Tachyon
Date: Wed, 10 Sep 2025 18:05:36 -0500
Message-Id: <20250910-tachyon-v1-0-5090bfd133e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEAEwmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0MD3ZLE5IzK/DzdVGNTEwtLE0NjS/MUJaDqgqLUtMwKsEnRsbW1AMV
 6leVZAAAA
X-Change-ID: 20250910-tachyon-e3548941397d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1992;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=P3r3Q5J9MFgReONWW52/IgrN1VEKomisQPuiug698ic=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBowgRQn9uGs0wOKJ4UmGLE5g4NC8fpvDGmY+q6L
 tMacrQaUvuJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaMIEUBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWWxg/+O/+uhY+L4rnSa5EDya/xMG+Y4rt6kEKbwivaHhL
 oxZJi7wR+O5DYzC+dytcrU2NN9ngsPGhFPeaMTwjmaL9drQQuvxFIUzisszTj3buU9aP07S+JFg
 FJbFNXm4N+rYWd+n2g0vmtv/l6TyQu1vfjgrP5aHE0VvInX2hndDn9YOvC8Qums6TFZQUIsWDRe
 CoTgegTHVU+Nfk07KfXWRIs/FumR/qtkafiUcx9g15Z37in/oDsLAx8nQhTNIQnakYiRnlWFS6t
 6FOKIdVIOOYaf7MlrDCgQAiHuFcJ3FEUBssewoTZaERQjcRIKNQNyxFw2fq5o7OxBvmydaCmLvL
 mj4wiP5pluuRrBBjZYW/VWhLwnXFuY3eSR5lQHKSYN2nT2X35aLVxhXAik+2DKSmbIl5H9nPuoA
 qXj7TTxkQ852OV9BAxZzMKygKtg6AMYqWbXuTXN8g2cQSyaugd/ZaEUh6xoH+WedYYO9WqvF8rA
 pzTfi0vRvczsJiJvEo+WwWc6O/+1iU3UN0APgJ2ZllDnaLLb1psc+4rYKHiGbSPpnULTROnH2C+
 BTf0dEumBoMDuv3Ykq0RcLu4MSCQ7YNM37EMsOD7VT6hAOmLZaNmIc2Ht57h0IyLWHNAFz3AfYa
 9f5XLBLANWsCOuVi04JuKTLUhQxE8bvZxx9f4SxdSxZY=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX+T3vRGBoJWp/
 wOZbocpJRGu3EAXN9qpvBOiQ4DBa9Sd1KNOHt7faFOZfoCn+iSpLE25eC6Ees6txQR7n4zZkoWK
 IOOZd2d/Yk2sYsA4HTg1w8/sGGbC5InRnn0Ll2P55mhKbM52X4M4joJPynRs9V/z2Z6i0jaSlgA
 aAfSoom4Tnn1aC36hfSHW5k/9pynxHaurXxt+jTQnZlSrE3sRa2S6lTv0ypYtmpXUjU5ZlK1Aoy
 eIwHVfTvCZ9IXHO8Whd/pPmSy7s/c7yJavLZnkj/ip52QqmN5K44geqi4P0eYXFHF4ZPHha4TdW
 /EMiI5MlIrbePgvHnWtMD+IoivFYznRbcLkecFp5x7B1Z5Oi4ejnaY7lMpODrgYqXrC3STyB7Gg
 uXeefOU9
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c20453 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=7AODkVuKAAAA:8 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lKVRVJNptnIkKiSKaGIA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=sRHRY8H3vKB1GfNvUtpx:22
X-Proofpoint-GUID: -WmgW7nfs6MO35V4UJ78TC3yAQ6121xU
X-Proofpoint-ORIG-GUID: -WmgW7nfs6MO35V4UJ78TC3yAQ6121xU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

Introduce the Particle Tachyon board (https://www.particle.io/tachyon/),
a single board compute with 5G connectivity and AI accelerator.

The boards currently ships with the Android Boot Loader, but replacing
this with abl2esp allows writing a EFI System Parition and OS partitions
to all of LUN0, and a more UEFI boot experience. A prebuilt version of
abl2esp is provided at [1], as abl2esp-v6.elf.

With a (very) recent version of QDL, a flash programmer from a Tachyon
software release, and a full distro image, this can be achieved with:

  qdl prog_firehose_ddr.elf write abl_a abl2esp-v6.elf write abl_b abl2esp-v6.elf write 0 image.raw

The following firmware files are currently used, on top of what's in
linux-firmware already:
  qcom/qcm6490/particle/tachyon/a660_zap.mbn
  qcom/qcm6490/particle/tachyon/adsp.mbn
  qcom/qcm6490/particle/tachyon/cdsp.mbn
  qcom/qcm6490/particle/tachyon/ipa_fws.mbn
  qcom/qcm6490/particle/tachyon/modem.mbn

In addition to bug fixes that has landed in v6.17-rc this depends on
[2], which is available in linux-next.

[1] https://github.com/qualcomm/abl2esp/releases/tag/v1.0
[2] https://lore.kernel.org/all/20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com/

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (3):
      dt-bindings: vendor-prefixes: Add Particle Industries
      dt-bindings: arm: qcom: Add Particle Tachyon
      arm64: dts: qcom: qcm6490: Introduce the Particle Tachyon

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/qcm6490-particle-tachyon.dts     | 877 +++++++++++++++++++++
 4 files changed, 881 insertions(+)
---
base-commit: 5f540c4aade9f1d58fb7b9490b4b7d5214ec9746
change-id: 20250910-tachyon-e3548941397d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


