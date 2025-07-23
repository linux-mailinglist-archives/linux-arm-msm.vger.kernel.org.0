Return-Path: <linux-arm-msm+bounces-66370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ADDB0FCB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 254CE3ABBDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA504272E48;
	Wed, 23 Jul 2025 22:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IQY/7LQT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8120149C51
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309674; cv=none; b=LQngolIZvpPRWN1zD74slvRs2mhHHgFLx9cW6Hwrf7emzqpZD2BGQ/MdEwRsSU420ACcEGQhGPebwyFTO/zl1ZBPDcFusPawKhSNeCcWtxEYpTVooGMR1Sby7ILjBVzbmkucpPjfHa5MHQ41/BAqJ3zEin8L1JQRgbI+yGsglfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309674; c=relaxed/simple;
	bh=ml/nSyTS4nfNiVoXhTw4+0kOFaq7KatZVFjsGfHaznU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=abD4Uk0BhEy52lktjGptt4UPqWsX6y4QUCGoqWyAYjoifBVTyv5gqEiUnTXCYHjIcO7lMIdN32wYcmz5Yjd/oulR9gnLtfEBQtc8+JLP0yG06vj7a19rpHaUZ2LvTimLkL00kCRfLBrRJMxGgjY65cnZa5kHaJ/+vur9VgcnT84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IQY/7LQT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NH6qF8005070
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tCWhBevTdE4kvZRMnxa1E9d5Kc39rrSpZ3A
	+p8Y4ZLE=; b=IQY/7LQTRxJnXzgIJAzOsr67iXJwDvb6tMffxSQj4MlnmV/eOUV
	/SY+EO6dM7wOuEvYrQjD0leZApBG4wSSnFLhmxe+VslSWcDWDd721SYIk/anEvZp
	tLkPwxLF4YztS88R85SwIb3xHQ0fwBedHooxwMeCiUEjEeJI/5shJSlKafN8xzia
	gSFs0hVVsSJRUV9m1K+Hn0B8wyGeo6fyk6noeNCLSL2A2UCibBPdCdduQN8NAm+h
	s3cyTHQQSmm4/aINRqsVujKu94toj34C1hidR7IdAT+Uap4hTzF4GW65T45Y5uTp
	mpGJ8YWrQxCv3sTWlHwBql8oT4EATlOO1Ow==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w7utg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:27:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-704b4b61d10so8391766d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753309669; x=1753914469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCWhBevTdE4kvZRMnxa1E9d5Kc39rrSpZ3A+p8Y4ZLE=;
        b=CyxpiGfp58FM7OcbGjJ238RL5ZB3K737Y4hyX8xdTS2ncMZO3K/dVnHxDU0S2gXTmP
         pl5Mf3xlEziJ1UdGpMhFGHKh/Td8javpPnSCtsWU31KwiiUQAbo9QUGka9+Pz5V8Zrcl
         J5zZ3Oy8eRu9I/UsxJgrCD9mXmcU0M856NuU6TS2YHBMx5sj/uS557AR5XFw4uHK3gnd
         Y5P1Lpgspg+HwcyjChbDGZL3D56UYE7FiFJwH+XdLJlfW11IIm21A7mAlIusk57XpGsF
         nkqHczN6XfjgDkyudy7DzESzomdB8MJIMEo1AcG0dr8yOCmBEKZZLPrQB9LOuMAzY12i
         WqrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfPZjDN2zKhHrX0PfcglYyp09z0MXlLqYZv6YIX+s3u1n9nYKxTARhOSlcqOZUbCVTAshQ1/c3MWZ0Xd7c@vger.kernel.org
X-Gm-Message-State: AOJu0YyeTsehxJpk001LTUmNADUFnoS2PlWcGIwEcZv6Jwd2A1nQBd/t
	W5DxBRSayfyXvIwt6LZx7K0qi/Qji/wXVavM1S5I0v48Wu2gBTOShtJuX60lch7iurYVopbSiSE
	KsiK7+l9lJbXGiB9DXxZPk8FlWP2oc3QfsSx3Ug9j9t9YjjSdi3NOHz0pNP4d7dDH90ZPMGBspe
	Yw
X-Gm-Gg: ASbGncsgcfxjCMSkZ/TGlQEHJMFfx8DbRA0ZTAdHp6mJ7UUxRyuyUbP+RFlhvL7RO6j
	VKf+pJ9ABR2E55azQjzLxyOXj3diclk+V0kUT7byabLVMAs0gcbGtMr9VjoYHYUFce+hS6kCXZZ
	i/CvSqF5Z5Y91cF40HRvT1JhxUBPz/3o8c4o4umjRVEDZ48RqU9tAuflkb5d2t22nFIPV8iLOyi
	j6g82/5Do0qWnfI4VkTgvtSSbGeGI13cyN7pqgZBAKBDYEQoeP3+miToOhxXyF+6tmvQN7p+RYW
	Qn73M1FH7WCgE4ar2MBwn5Dw5aXIP+ecv+kynl63DHQnB15P8213IA==
X-Received: by 2002:a05:6214:27c7:b0:704:f952:3d66 with SMTP id 6a1803df08f44-707006a3e74mr56004566d6.47.1753309669342;
        Wed, 23 Jul 2025 15:27:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoTPc6rZ3A4sCYOQY6hqoF6vg5g7pJJHVgRIc7sboGdJqU/JZ/MgA0NmBi5HBfF4TKbldvJA==
X-Received: by 2002:a05:6214:27c7:b0:704:f952:3d66 with SMTP id 6a1803df08f44-707006a3e74mr56004156d6.47.1753309668752;
        Wed, 23 Jul 2025 15:27:48 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad23bsm248520f8f.44.2025.07.23.15.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:27:48 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 00/23] arm64: dts: qcom: cleanup DSP audio services
Date: Wed, 23 Jul 2025 23:27:14 +0100
Message-ID: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=688161e7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=CqbkFek1id5cHgMPXAcA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MyBTYWx0ZWRfX5c0R9la2yk1Z
 GWopKggDxteEJDHSbvYJzHzFoqXD+wSEhISzo+MWwjXTwNLPyOgtJDrhkAdvQ2MrRPJHrAvJVj1
 IjqbnW+Nk6bcjSQIM88E3MIFj0zPj/EUwAqOYtr1QvBmDwiLFCtkfqWg8jleGKpaq8JoiSKvjUu
 bS1DGtRl5xSnwgrYbs+8MVjsImllbeQ5Vmmxgb2f6unOsuiisI8Q07VP6t7egjQEZ7A3zuCBzXA
 lg/zbXXslsmHulAJXRg2X5Kkp6qF49KFn2FL4QQV7OHInlh76enOrInDUbzADnArCLjRp5z/7Q8
 C2Lpp6PLrrF70boXWePJGfa8yAyM4M6/B3bbC0wnP19wwXI5N1jjP9RTWvAOsvuVeYrJfawFrmL
 kQU4XFPPdYi6JztvOUDX+FZU7DGuhWcj/pwjC5RsH3z/wJqZhoECEKM9jsdWe3Qf9M06zpw/
X-Proofpoint-ORIG-GUID: ey5nODgp4UE3V9n3MJksIV2_lsAiRwBa
X-Proofpoint-GUID: ey5nODgp4UE3V9n3MJksIV2_lsAiRwBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=2 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=969 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230193

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

All the SoC level dts has exactly same device tree entires for DSP Audio
sevices (apr, gpr, afe, apm, asm, adm) and its child devices.

It does not make sense to keep copying the same content over and over
for each SoC, This patch series moves DSP services to common dtsi file
so that it eliminates duplicate content,  makes audio dts much consistent
and makes it easy for adding audio support for new SoC.
As part of this cleanup, two common dtsi files (elite and audioreach)
based on q6dsp framework are added and a SoC level audio.dtsi needs to add
the required iommu configuration for the audio stream service.
 
This patch series also addresses another issue found with multiple
instances of wsa codec macro, his can lead duplicate dapm widgets
and mixers resulting in failing to probe sound-card if both of
these instances are part of the dai-link.

Tested this on X13s, any testing is appreciated.
   
Srinivas Kandagatla (23):
  arm64: dts: qcom: x1e80100: move dsp audio nodes to dedicated dts
  arm64: dts: qcom: sc8280xp: use dedicated audioreach dtsi
  arm64: dts: qcom: sm8650: use dedicated audioreach dtsi
  arm64: dts: qcom: sm8550: use dedicated audioreach dtsi
  arm64: dts: qcom: sm8450: use dedicated audioreach dtsi
  arm64: dts: qcom: sar2130p: use dedicated audioreach dtsi
  arm64: dts: qcom: sm8350: move dsp audio nodes to dedicated dts
  arm64: dts: qcom: sm8250: use dedicated elite dtsi
  arm64: dts: qcom: sm6115: use dedicated elite dtsi
  arm64: dts: qcom: sdm845: use dedicated elite-audio dtsi
  arm64: dts: qcom: sdm630: use dedicated elite-audio dtsi
  arm64: dts: qcom: sc7280: use dedicated elite-audio dtsi
  arm64: dts: qcom: sc7180: use dedicated elite-audio dtsi
  arm64: dts: qcom: sm8750: use dedicated audioreach dtsi
  arm64: dts: qcom: msm8916: use dedicated elite-audio dtsi
  arm64: dts: qcom: msm8939: use dedicated elite-audio dtsi
  arm64: dts: qcom: msm8996: use dedicated elite-audio dtsi
  arm64: dts: qcom: sm6350: use dedicated elite-audio dtsi
  arm64: dts: qcom: msm8953: use dedicated elite-audio dtsi
  arm64: dts: qcom: sm8450: add sound prefix for wsa2
  arm64: dts: qcom: sm8550: add sound prefix for wsa2
  arm64: dts: qcom: sm8750: add sound prefix for wsa2
  arm64: dts: qcom: sm8650: add sound prefix for wsa2

 arch/arm64/boot/dts/qcom/apq8039-t2.dts       |  1 +
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts   |  1 +
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts  |  1 +
 .../arm64/boot/dts/qcom/audioreach-audio.dtsi | 45 ++++++++++
 arch/arm64/boot/dts/qcom/elite-audio.dtsi     | 86 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8916-audio.dtsi   |  5 ++
 arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi  |  1 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi         | 44 ----------
 arch/arm64/boot/dts/qcom/msm8929.dtsi         |  1 +
 arch/arm64/boot/dts/qcom/msm8939-audio.dtsi   |  5 ++
 arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi  |  1 +
 .../qcom/msm8939-sony-xperia-kanuti-tulip.dts |  1 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi         | 44 ----------
 arch/arm64/boot/dts/qcom/msm8953-audio.dtsi   |  5 ++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 78 +----------------
 arch/arm64/boot/dts/qcom/msm8996-audio.dtsi   | 14 +++
 .../boot/dts/qcom/msm8996-oneplus-common.dtsi |  1 +
 .../dts/qcom/msm8996-sony-xperia-tone.dtsi    |  1 +
 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi    |  1 +
 .../boot/dts/qcom/msm8996-xiaomi-gemini.dts   |  1 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi         | 48 +----------
 arch/arm64/boot/dts/qcom/msm8996pro.dtsi      |  1 +
 .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |  1 +
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts      |  1 +
 .../boot/dts/qcom/qcm6490-shift-otter.dts     |  1 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  1 +
 arch/arm64/boot/dts/qcom/qcs8550.dtsi         |  1 +
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  1 +
 arch/arm64/boot/dts/qcom/sa8540p.dtsi         |  1 +
 arch/arm64/boot/dts/qcom/sar2130p-audio.dtsi  |  5 ++
 .../arm64/boot/dts/qcom/sar2130p-qar2130p.dts |  1 +
 arch/arm64/boot/dts/qcom/sar2130p.dtsi        | 40 +--------
 .../boot/dts/qcom/sc7180-acer-aspire1.dts     |  1 +
 arch/arm64/boot/dts/qcom/sc7180-audio.dtsi    |  8 ++
 arch/arm64/boot/dts/qcom/sc7180-idp.dts       |  1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  1 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi          | 56 +-----------
 arch/arm64/boot/dts/qcom/sc7280-audio.dtsi    |  8 ++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi      |  1 +
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi    |  1 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi          | 68 +--------------
 arch/arm64/boot/dts/qcom/sc8280xp-audio.dtsi  |  9 ++
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     |  1 +
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts |  1 +
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    |  1 +
 .../dts/qcom/sc8280xp-microsoft-arcata.dts    |  1 +
 .../dts/qcom/sc8280xp-microsoft-blackrock.dts |  1 +
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 38 +-------
 arch/arm64/boot/dts/qcom/sdm630-audio.dtsi    |  8 ++
 .../qcom/sdm630-sony-xperia-ganges-kirin.dts  |  1 +
 .../sdm630-sony-xperia-nile-discovery.dts     |  1 +
 .../qcom/sdm630-sony-xperia-nile-pioneer.dts  |  1 +
 .../qcom/sdm630-sony-xperia-nile-voyager.dts  |  1 +
 arch/arm64/boot/dts/qcom/sdm630.dtsi          | 45 +---------
 arch/arm64/boot/dts/qcom/sdm845-audio.dtsi    |  8 ++
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |  1 +
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  1 +
 .../arm64/boot/dts/qcom/sdm845-lg-common.dtsi |  1 +
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts       |  1 +
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  |  1 +
 .../dts/qcom/sdm845-samsung-starqltechn.dts   |  1 +
 .../boot/dts/qcom/sdm845-shift-axolotl.dts    |  1 +
 .../dts/qcom/sdm845-sony-xperia-tama.dtsi     |  1 +
 .../qcom/sdm845-xiaomi-beryllium-common.dtsi  |  1 +
 .../boot/dts/qcom/sdm845-xiaomi-polaris.dts   |  1 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 49 +----------
 arch/arm64/boot/dts/qcom/sdm850.dtsi          |  1 +
 arch/arm64/boot/dts/qcom/sm4250.dtsi          |  1 +
 arch/arm64/boot/dts/qcom/sm6115-audio.dtsi    |  8 ++
 .../boot/dts/qcom/sm6115-fxtec-pro1x.dts      |  1 +
 arch/arm64/boot/dts/qcom/sm6115.dtsi          | 69 +--------------
 .../boot/dts/qcom/sm6115p-lenovo-j606f.dts    |  1 +
 arch/arm64/boot/dts/qcom/sm6350-audio.dtsi    | 17 ++++
 .../qcom/sm6350-sony-xperia-lena-pdx213.dts   |  1 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi          | 62 +------------
 arch/arm64/boot/dts/qcom/sm7125.dtsi          |  1 +
 arch/arm64/boot/dts/qcom/sm7225.dtsi          |  1 +
 arch/arm64/boot/dts/qcom/sm7325.dtsi          |  1 +
 arch/arm64/boot/dts/qcom/sm8250-audio.dtsi    |  8 ++
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts       |  1 +
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts       |  1 +
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi |  1 +
 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  |  1 +
 .../boot/dts/qcom/sm8250-xiaomi-pipa.dts      |  1 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 53 +-----------
 arch/arm64/boot/dts/qcom/sm8350-audio.dtsi    |  8 ++
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts       |  1 +
 .../qcom/sm8350-microsoft-surface-duo2.dts    |  1 +
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts       |  1 +
 .../dts/qcom/sm8350-sony-xperia-sagami.dtsi   |  1 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 67 +--------------
 arch/arm64/boot/dts/qcom/sm8450-audio.dtsi    |  5 ++
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts       |  1 +
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts       |  1 +
 .../dts/qcom/sm8450-sony-xperia-nagara.dtsi   |  1 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi          | 40 +--------
 arch/arm64/boot/dts/qcom/sm8550-audio.dtsi    | 10 +++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts       |  1 +
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts       |  1 +
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts       |  1 +
 .../boot/dts/qcom/sm8550-samsung-q5q.dts      |  1 +
 .../qcom/sm8550-sony-xperia-yodo-pdx234.dts   |  1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi          | 45 +---------
 arch/arm64/boot/dts/qcom/sm8650-audio.dtsi    | 10 +++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts       |  1 +
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts       |  1 +
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts       |  1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi          | 44 +---------
 arch/arm64/boot/dts/qcom/sm8750-audio.dtsi    | 10 +++
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts       |  1 +
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts       |  1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi          | 42 +--------
 .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    |  1 +
 arch/arm64/boot/dts/qcom/x1-crd.dtsi          |  1 +
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  |  1 +
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  1 +
 .../dts/qcom/x1e80100-asus-vivobook-s15.dts   |  1 +
 arch/arm64/boot/dts/qcom/x1e80100-audio.dtsi  |  6 ++
 .../dts/qcom/x1e80100-dell-xps13-9345.dts     |  1 +
 .../dts/qcom/x1e80100-hp-omnibook-x14.dts     |  1 +
 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  1 +
 .../dts/qcom/x1e80100-microsoft-romulus.dtsi  |  1 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts     |  1 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi        | 43 +---------
 124 files changed, 401 insertions(+), 946 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/audioreach-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/elite-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8939-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8953-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sar2130p-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6350-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8550-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8650-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-audio.dtsi

-- 
2.50.0


