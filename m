Return-Path: <linux-arm-msm+bounces-74812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E8FB9CD53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B7973B50DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A0A15B0FE;
	Thu, 25 Sep 2025 00:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ihe6JRv9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64CA45C0B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758759456; cv=none; b=UnPd6udZGLiuGJsZ/wJRnHmR4pqmOfjpJJR9mQhPHdON42/L48IWkDnTTsCCbw9Ra4q+fQEf/kj4ZvkAmgt9CpUG614zDTStJMRUmlKkotdStiidW0eXfUOGOvlElC40SuFF85i+FD5wPI1isOGFpmBeQHBZvujhZjMC3mSdSQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758759456; c=relaxed/simple;
	bh=1Slhr9ERZIcI0tadoCZpX7ihSjrncVgCXNr8B8yU8uk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P9V1N3EB9I2J4UhKWOzPMngT3rYMFVyN20QGjbQQS+NXfpjAWhcMpQ+FHbQkfBI4ALcguGJRKqc+eobBqA+VqKdbsfLQUOLmyeKTxeFm9v5ppM+ihuxvu/Rv9trlLRVz63T6k/V7it5+YbImelYbfTMWWnn7+jyOeSu0dxAEjng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ihe6JRv9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P00bQc025133
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FHUGNwkRb2SXOZNiPj3Ebj
	2KX406CegzHSbFTrEVwK0=; b=Ihe6JRv9ZRq1ojMv1zmwsWdxpJnzECExWlk8bn
	VPv1WL20pMn0OSsdL3kqi7xsHBPCxs9yDfFJQE1GjebrPPZ8JotwyXmi9C+rDro0
	cPDwcswozrP0NlzmipVap7mgXsc56lnVtOFsQsR3tIF2RXfDz+fKj/+xku+RcFr2
	oI3lQOg5EbPG33EuzVzFlvz0kK0dweNDDmUhozxluBYaPPL6qgVrJq5LdOaU14h0
	VLWfXLAzJcf5Jb3tTYvRqvpK1l4r7T7zwLsxRpO7wxpvVjV2dUO/gblAUW5mBYWe
	Xi0taGWo3lWjTEUUQZM5wvpLTB3Q8JYVYujVTD4jqzJr4d4Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv165t0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-781044c8791so37454b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758759451; x=1759364251;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHUGNwkRb2SXOZNiPj3Ebj2KX406CegzHSbFTrEVwK0=;
        b=f5QdOckT9oC/01jR6HpxpMpnimlAwN7lyLnCtniAy68O+rFHVgX5RJ7SzE4eCA6EYw
         uEG3kV3t2sgYpjIXFwMEO2/eAWhxlq93QtR5NRoIHVNH+zgtJ/WlYT8d3POGQAzEULn8
         XDjQMVBbWjnA4i1ri0xERYKu2mXtZm9IP93XH7yDVOUcHjvTYR880VV1AhvUywdDKM6I
         fGU+AyReA1l6xeyUM6T35FmSm2i5Ivirkgq3rH20j+ATsqskPqAfMGAFw4xScTJHn781
         VA2Eu8vfJIIrQGHHBTh/iyduZgsJHfcpRE8iJT9xWaf2RNxIX6v9QaUTiu91wqUddIfT
         FxDA==
X-Gm-Message-State: AOJu0Yx0Deat5CzL0Lri6qMXo2jxNEY3iY6XyOP7gXzUcG1+idnCbrg9
	ssI0xm0jOzr4SD/Bcl9Iy1PfIsK2L8m07f1A7gYTWIDVZ6PusxguFxlD3PqcpoS35RXnn4JpSDb
	qXDDCrGIfPAlKFWMPb1u+uL23DFf5OToiB+knXJJgLhjHb1jb+/I7qlsXW8ZUOBSzGGYl
X-Gm-Gg: ASbGncsrvWVogpJvrm+s3x/WnG3QvJdpy/O0KqymIu810B6fCk3Q5bNS/HA5HmkEJVt
	rIH6y9HX0BF1F+va2BlEH1/+G+XD3RQNHluSfR0qf+KOQawQwHfK1JO2wOIrXIXZQGKoCRiln1F
	F3B/oPr5A/cKaR9FxFbap7DXLamupbvpY8xe9Y6FYACa363AhC5AIJjg1lxO/6LNpHYo/7ZUDZt
	wpfgU1PpXU+MeoUXsKG97hTPD/tY1ShYpSFsRcKZj8ek40iySNph+fsVnZWtImfWqd32s3W2Cmo
	WUPqe3mBIwIzYcHxXbkGaJRholn884aXASFZj2V7EdQCmLKDF3U+FWgpRJRuUsURhBbhlGHITFw
	cpWRY1aFfP160EB8=
X-Received: by 2002:a05:6a00:21c7:b0:77f:1ef8:8acb with SMTP id d2e1a72fcca58-780fce1f022mr1702654b3a.13.1758759451009;
        Wed, 24 Sep 2025 17:17:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDtt708d88kyU5Pau11PaLDVQZBEt1RxiXMDa/KIbcJ6jKtx8cvPLpBVWQ9TNb7jiU9zyQlw==
X-Received: by 2002:a05:6a00:21c7:b0:77f:1ef8:8acb with SMTP id d2e1a72fcca58-780fce1f022mr1702601b3a.13.1758759450345;
        Wed, 24 Sep 2025 17:17:30 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e6fasm262748b3a.1.2025.09.24.17.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:17:29 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 00/20] arm64: dts: qcom: Introduce Kaanapali platform
 device tree
Date: Wed, 24 Sep 2025 17:17:17 -0700
Message-Id: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA6K1GgC/x3M0QqCQBCF4VeRuW5gVaytVwkvRveYQ7TJjEQgv
 rtblx/852zkMIXTrdrI8FHXdy6oTxWNs+QHWFMxNaHpwrWO/MwLp9U5ICZpp8sZsaNSL4ZJv/+
 ne188iIMHkzzOv/1LfIXRvh+p58JGcgAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manish Pandey <manish.pandey@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758759448; l=7439;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=1Slhr9ERZIcI0tadoCZpX7ihSjrncVgCXNr8B8yU8uk=;
 b=aSVq5MMhEjKdKOlAf9y8jzYj6m4BID1M73wECze8A6SDaClhLau8oQqbTZMjllYx8Bqi+9hDt
 XrxLE3xmGCbC3J6Y82oxy9Dk62F0MocOGuRFfpQFScBMhTG3nENb91o
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: 48n6zWruk_lQum82SN-pcfuoxtcgiYUk
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d48a1c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=qC_FGOx9AAAA:8 a=nrb-eYeC1vcmNSdgpO0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfXzIBK9rg0EVeG
 9sz7J8LkrBvf/4fLqSVpUisGSXVWRWe/UcBzGx0R+2ZbkZsbymjTQ7d0v62Wy72GK5BbQIXhs2D
 /jm0RkVnV+uh7ADp/tspSHTB2IWgO9xLxzemHzigYevZ4l33gOtFj63+jrMsH7EDlkX4a3MqjD3
 OKtcnwoY6AFLgWdjnZs1ZX7mL06RSC/4MTZMtIEJER/1bHEaTSkf1yqZ0hoiuNRsBHT7TQrhErz
 n9+IPhbw6SPSR/NGjcKV3xQ0oHEpXFIbyMzUBnuai0OvtwkyaQcA38xCyIAegyxQBBS4WObC2io
 S7ZTaBqW2WIvwE6DMtrrsbtqLLFgnRt8gTc5S6jb4f78CeSs6l05uT0+mAg1iu2tyrIZ1s8GeTi
 G0sa2mkF
X-Proofpoint-ORIG-GUID: 48n6zWruk_lQum82SN-pcfuoxtcgiYUk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

Introduce the Device Tree for the recently announced Snapdragon SoC from Qualcomm:
https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5

Bindings and base Device Tree for the Kaanapali SoC, MTP (Mobile Test Platform)
and QRD (Qualcommm Reference Device) are splited in three:

- 1-3: MTP board boot-to-shell with basic function.
- 4-16: More feature including PCIE, sdcard, usb, DSPs, PMIC related, tsense, bus, crypto etc. Add QRD board support.
- 17-20: Multimedia features including audio, video and camss.

Features added and enabled:
- CPUs with PSCI idle states and cpufreq
- Interrupt-controller with PDC wakeup support
- Timers, TCSR Clock Controllers
- Reserved Shared memory
- GCC and RPMHCC
- TLMM
- Interconnect with CPU BWMONs
- QuP with uart
- SMMU
- RPMHPD and regulator
- UFS with inline crypto engine (ICE)
- LLCC
- Watchdog
- cDSP, aDSP with SMP2P and fastrpc
- BUS with I2C and SPI
- USB2/USB3
- Modem(see crash after bring up)
- SoCCP
- SDHCI
- random number generator (RNG) and Qcrypto
- tsens
- PCIE
- coresight
- Bluetooth
- WLAN
- Audio
- CAMSS
- Video

For part1(patch 1-3)
build dependency:
- tlmm: https://lore.kernel.org/all/20250924-knp-tlmm-v1-0-acabb59ae48c@oss.qualcomm.com/
- gcc: https://lore.kernel.org/all/20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com/
- interconnect: https://lore.kernel.org/all/20250924-knp-interconnect-v1-0-4c822a72141c@oss.qualcomm.com/
- rpmhpd: https://lore.kernel.org/all/20250924-knp-pd-v1-0-b78444125c91@oss.qualcomm.com/
- config: https://lore.kernel.org/all/20250924-knp-config-v1-1-e2cf83b1932e@oss.qualcomm.com/
binding dependency:
- ipcc: https://lore.kernel.org/all/20250924-knp-ipcc-v1-1-5d9e9cb59ad4@oss.qualcomm.com/
- smmu: https://lore.kernel.org/all/20250924-knp-smmu-v1-1-c93c998dd04c@oss.qualcomm.com/
- pdc: https://lore.kernel.org/all/20250924-knp-pdc-v1-1-1aec7ecd2027@oss.qualcomm.com/
- cpufreq: https://lore.kernel.org/all/20250924-knp-cpufreq-v1-1-1bda16702bb1@oss.qualcomm.com/
- mfd: https://lore.kernel.org/all/20250924-knp-mfd-v1-1-6c8a98760e95@oss.qualcomm.com/
- watchdog: https://lore.kernel.org/all/20250924-knp-watchdog-v1-1-fd8f3fa0ae7e@oss.qualcomm.com/
- llcc: https://lore.kernel.org/all/20250924-knp-llcc-v1-0-ae6a016e5138@oss.qualcomm.com/
- bwmon: https://lore.kernel.org/all/20250924-knp-bwmon-v1-1-56a9cdda7d72@oss.qualcomm.com/
- ufs: https://lore.kernel.org/all/20250924-knp-ufs-v1-0-42e0955a1f7c@oss.qualcomm.com/
- ice: https://lore.kernel.org/all/20250924-knp-ice-v1-1-1adfc2d9e83c@oss.qualcomm.com/
- regulator: https://lore.kernel.org/all/20250924-knp-regulator-v1-0-d9cde9a98a44@oss.qualcomm.com/
- misc soc related: https://lore.kernel.org/all/20250924-knp-soc-binding-v1-0-93a072e174f9@oss.qualcomm.com/
others:
- socinfo: https://lore.kernel.org/all/20250924-knp-socid-v1-0-fad059c60e71@oss.qualcomm.com/

For part2(patch 4-16)
build dependency:
- ipcc header: https://lore.kernel.org/all/20250922-ipcc-header-v1-1-f0b12715e118@oss.qualcomm.com/
binding dependency:
- pcie: https://lore.kernel.org/all/20250924-knp-pcie-v1-0-5fb59e398b83@oss.qualcomm.com/
- sdcard: https://lore.kernel.org/all/20250924-knp-sdcard-v1-1-fc54940066f1@oss.qualcomm.com/
- usb: https://lore.kernel.org/all/20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com/
- remoteproc: https://lore.kernel.org/all/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com/
- tsense: https://lore.kernel.org/all/20250924-knp-tsens-v1-1-ad0cde4bd455@oss.qualcomm.com/
- crypto: https://lore.kernel.org/all/20250924-knp-crypto-v1-0-49af17a231b7@oss.qualcomm.com/
- bam: https://lore.kernel.org/all/20250924-knp-bam-v1-0-c991273ddf63@oss.qualcomm.com/
- spmi: https://lore.kernel.org/all/20250924-knp-spmi-binding-v1-1-b4ace3f7a838@oss.qualcomm.com/
- pmic: https://lore.kernel.org/all/20250924-knp-pmic-binding-v1-1-b9cce48b8460@oss.qualcomm.com/
- pmic-peripherals: https://lore.kernel.org/all/20250924-knp-pmic-peri-v1-0-47413f8ddbf2@oss.qualcomm.com/
- bus: https://lore.kernel.org/all/20250924-knp-bus-v1-1-f2f2c6e6a797@oss.qualcomm.com/
others:
- fastrpc: https://lore.kernel.org/all/20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com/
- spmi-gpio: https://lore.kernel.org/all/20250920-glymur-spmi-v8-gpio-driver-v1-1-23df93b7818a@oss.qualcomm.com/

For part3(patch 17-20)
dependency:
- multimedia clk: https://lore.kernel.org/all/20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com/
- config: https://lore.kernel.org/all/20250924-knp-config-v1-2-e2cf83b1932e@oss.qualcomm.com/
- pd-mapper: https://lore.kernel.org/all/20250924-knp-pdmapper-v1-1-fcf44bae377a@oss.qualcomm.com/
- audio: https://lore.kernel.org/all/20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com/
- camss: https://lore.kernel.org/all/20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com/
- video: https://lore.kernel.org/all/20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com/

For convenience, a regularly refreshed linux-next based git tree containing all the Kaanapali related work is available at:
https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/kaanapali?ref_type=heads

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Hangxiang Ma (1):
      arm64: dts: qcom: kaanapali: Add support for camss

Jingyi Wang (9):
      dt-bindings: arm: qcom: Document Kaanapali SoC and its reference boards
      arm64: dts: qcom: Introduce Kaanapali SoC
      arm64: dts: qcom: kaanapali: Add base MTP board
      arm64: dts: qcom: kaanapali: Add remoteprocs for Kaanapali SoC
      arm64: dts: qcom: kaanapali: Add misc features
      arm64: dts: qcom: kaanapali-mtp: Enable more features
      arm64: dts: qcom: kaanapali-mtp: Enable modem
      arm64: dts: qcom: kaanapali: Add QRD board
      arm64: dts: qcom: kaanapali: Add iris video node

Jishnu Prakash (4):
      arm64: dts: qcom: Add PMK8850 pmic dtsi
      arm64: dts: qcom: Add PMH0101 pmic dtsi
      arm64: dts: qcom: Add PMH0104 pmic dtsi
      arm64: dts: qcom: Add PMH0110 pmic dtsi

Jyothi Kumar Seerapu (1):
      arm64: dts: qcom: kaanapali: Add QUPv3 configuration for serial engines

Manish Pandey (1):
      arm64: dts: qcom: kaanapali: Add SDC2 nodes for Kaanapali soc

Prasad Kumpatla (2):
      arm64: dts: qcom: kaanapali: Add support for audio
      arm64: dts: qcom: kaanapali-mtp: Add audio support (WSA8845, WCD9395, DMIC)

Qiang Yu (1):
      arm64: dts: qcom: kaanapali: Add support for PCIe0 on Kaanapali

Ronak Raheja (1):
      arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC

 Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
 arch/arm64/boot/dts/qcom/Makefile               |    2 +
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts      | 1601 ++++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts      | 1212 +++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi         | 6315 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmh0101.dtsi           |   45 +
 arch/arm64/boot/dts/qcom/pmh0104.dtsi           |   33 +
 arch/arm64/boot/dts/qcom/pmh0110.dtsi           |  109 +
 arch/arm64/boot/dts/qcom/pmk8850.dtsi           |   66 +
 9 files changed, 9389 insertions(+)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250918-knp-dts-0e8da3f76e85

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


