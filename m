Return-Path: <linux-arm-msm+bounces-85915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B205FCD0623
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 15:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35A1E305DCC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC447328632;
	Fri, 19 Dec 2025 14:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hazDBdWu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESZDMn8K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025403195E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766155653; cv=none; b=WHPFf+sQBNafQzFvyuMs5mJ//sHutDaHd5fDsbWQj730GytIuDdQzuQPH6rguZsp4r1XU1iakI0OCA5Eu+Lr3aEcvyMeiALojKMb29gDoOEkVseWF56utQjfnB68dVOJi2OpcmROddxQbCU551OzgJXLA9xAloVcsHSwBN7P2uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766155653; c=relaxed/simple;
	bh=p/FYO+cgrSLHxRhbpCV/UYlZo4tDHaxzvSR8+4HrLpI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kCdmHrkLkKgdfVCmgsYOncbEVLP87Ua4Ycq8Kakp3nBHP0xNRqgtzMZ/jvgeVZGhi7wkTmQIasFxozQzNoUkzdMXvtWIPZKT3vRCYJopn0BweL+AqXZW3kDj8mHe2kn9HS99dwTYaVJT3Ca4dR8GDFVbQVvUmWOrBIGuCFDEnpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hazDBdWu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESZDMn8K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBFwpu4101409
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=z7JI/P95ZVGWwXQhRMziPA
	teBLRQnsPdP0Y8AgRZyc8=; b=hazDBdWueMrHawqZMaZSFyZE0RHHXXlHO+R45b
	dbh0KEvNbQxs7ZHBWud9rhXwTZbxMOsAYMU6ZAF6UwOkgQx98vevR1Mu7KHAx861
	qRDLuvXkFIEjkDFQXVu1HGGAhOJR5MKeMXtd81b67r8lwC02fq43uOV0GF5OdEIQ
	X2anc25lj9aLADuqQwhp+SWhpyEMRm6yfngF7JockVlT1X3scw5747TBybgCv740
	C0xx8+543Uow95732BOF2NkoR1nhmw1PQAxdvL44NUaqp1hKz2KhFIEfBk+RTx6B
	ZYYenB5YAS0JI8vPVtXT3NmR/LLMBiYpHeq57T1KnEB0OW1Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2ywx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:47:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f177f4d02so37742725ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 06:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766155650; x=1766760450; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z7JI/P95ZVGWwXQhRMziPAteBLRQnsPdP0Y8AgRZyc8=;
        b=ESZDMn8K7ZONcw504urBelRJEFQyQJq8/7sNnPDdvhMfRT44t8rCqDiF8Amxb9ysV9
         B4WC7X7TIGGx+gLNkDb03IOWBK71CGnva92CpZ/ZSN8G+JbKaMTgaWusQQllz9Bzloxh
         XsgRsKzY0IJ5APhWOe8QyEuTqXMIb9wMWApdO6MS9RE/IOS9vn0bRB1p8uxqRlX4Wo5S
         Sv1LGKSNKmFS9PHYCgh0x/69ANMJOt8dIcWF0wHw7P028B54h2tC8aRLXiZ6p1WEAnVv
         rV0hhHaR5L42469DgiN9+AQ0GN/l0wNrsGeIL/jAnRCInmwKwIwMEJB5aUfvub+2D23O
         iCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766155650; x=1766760450;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7JI/P95ZVGWwXQhRMziPAteBLRQnsPdP0Y8AgRZyc8=;
        b=o6dU2RhvTTwIyfLys23Hp87Ee5Mb9XTJ8kZERNraWP3HUvdzIkp+h1QcWXNdyQWIVe
         4PxxC3Q6w4dvIy0r64C5VFjD/G5PKbLkjrnPVa81dgesO7hkVzGsA9XQXl4zkYZrqJos
         FpA5qiJB9cuq4cWUVqPWUjYPYckha1OTixO4Ee6yzyUMTqNHZm0g4pHTMFrHMKS7loZj
         HTbjyePhyB1p11UTs6/k2Asxjw5E8+AsAu9GLhJUXPsqdIdMVyXQfLroX75F7ASkq+fq
         GrIaq3kwKAwc5tldeIEx8FUo4jw9ur0I8E+FS+vKbbaZHcHcDtWcMDNruGiZf5iPXUQG
         TFmQ==
X-Gm-Message-State: AOJu0YwFZRFT+i+hnZq4pxI4Pc/yN7IYGTaLg3bnEGDwuGJ2hWOhBV4X
	7Bxv9pguVo/lis8sI39VtlYWE05QB9lz2SnBQfqr60Kx82zkMjw3k5rzrnSOy5KW3yfo7DQ72Ex
	mi3DYaYzlbWkFpMfTGUnz2DEKNz2TB46lIZ80BiAOyaMgWFOhiEaRSppje5CZfEZhcO6x
X-Gm-Gg: AY/fxX4rZAT7Q54f6sqhNcD5hFMvTetEgRJuhwWZmWDKNlk435ChrFkXxdDWYW+PdWb
	dhsUmwUTv14tdlHKAMmZ9z3Jqj3rj6/tEk16q1JNW6EdqHfD04qgW8ASxBsj/7zDt/arNApjFz5
	LCKHZlG70fntmmsxBOfby04iSNns32qQHp+v7esKFCC+m6YDZKWOuykTP0oY2wObYAwF1/Pfiny
	icRMqj2raDYJMaF2+9VBDnjhIb3jOT4FEZICgAdPkfe3PfkXmXBCDlocw76hADhKs/4iEW7R9Pk
	FgQ509vBqq4IJTPu4yfvGS7lkEM6ggvaxa6c1Bc/1oJWxC0vZHkfbaZpXNPAUxxukREFneil6vF
	Ygspmkqo9u5GcOk4nlIaHAEGzFpmRcq+vjohVfsMy3zbOFnxCN21imfigmmBOpfYAzEezhnHZmR
	nujghZFIJY7aoQWN8VltpgT3SBWp6VuA==
X-Received: by 2002:a17:902:e5cf:b0:295:9cb5:ae07 with SMTP id d9443c01a7336-2a2f272b37amr28088865ad.38.1766155650393;
        Fri, 19 Dec 2025 06:47:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMIHUhMwJi0q8Wk5E2GTHl7tzmfZNkTbRtX1WT4ISpBG4gNr7KQi1ZgAQ0AB3PgjwMXJQLuA==
X-Received: by 2002:a17:902:e5cf:b0:295:9cb5:ae07 with SMTP id d9443c01a7336-2a2f272b37amr28088475ad.38.1766155649830;
        Fri, 19 Dec 2025 06:47:29 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm25433855ad.33.2025.12.19.06.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:47:29 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: [PATCH v3 0/4] arm64: dts: qcom: Introduce Glymur SoC dtsi and
 Glymur CRD dts
Date: Fri, 19 Dec 2025 20:16:53 +0530
Message-Id: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF1lRWkC/43RS2rDMBAG4KsErztmJFl+hFJyj1KMrBknon5Fs
 t2GkrtXcRZdNIuAEIzQfP8g/SSBveOQ7Hc/iefVBTcOsVAvu8SezHBkcBTrRKLUArGAZQqzZ9P
 Xq6qP3aVffO2G2Y+02Dn2gjYCdaOzrFKURGXy3LrvLeH94157Pi8xaL4fJj2HYLag/e51y4kCf
 A4TNEuAVYIAJoWVtgUKZQ5jCOl5MZ0d+z6N29st5j8iRb4hU+8s9C3BqqJUEVrKZV7kVD0v6T+
 pYwo3CkGzLlWblw2yfpYSMt+Y2vimXktYdYQyopKsjsuIZyGMM02nC5zjFZisYzBEcP8QWEVUh
 WnLlkTWolKHzg3Gj+noj489rKSC0E9yujdLi5k2baHI2CdHigSiim9VpjKThdTxtb84dHxJ7Ym
 H42OmMYHhduLm/Q6xJKWzwhjWycf1+gsH9rCtngIAAA==
X-Change-ID: 20251007-upstream_v3_glymur_introduction-5a105b54493d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        rajendra.nayak@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766155644; l=5527;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=p/FYO+cgrSLHxRhbpCV/UYlZo4tDHaxzvSR8+4HrLpI=;
 b=76Bu/mwQC4JyXWUnOvY1igTbXABWXFeO9XvVhMBTBB52a6BSDKXUdqMqt6eO25p3WttgeZtX4
 wx6KTcEkhSWA5Z1dvWsrPI5Iw/PCXQgiriofmf+grK6T458rokqKwH7
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyNCBTYWx0ZWRfX7MBjGfu8qGsY
 YgOMnGcSeBaxaaVkGBVCiDPzxWLxaC9ODMx450XBnK32OWeSwm78OslPqP9ueHfDsJGNxRvYI81
 WDyUnwbrXuFO1wazBt15CSo1C8ALWZM815kUT3IiGg76VZqK26cQt1V2xgs9FN1c0d+J0l8IIPq
 MCJhXkTnkO0/RaEomSKu8naBM1+1XB1wQZgXH2foTgwR9GO+bV3253nhgD1bqrDJdHuXzt5jXsH
 tgizWtfxfE0foZXa5+oWb0drbZ15fxbIBqXLwWBcWckbcL5DkGHNCv0cKpKDA9VmzBj+v7ZKlYS
 VPw0BLvYsn8DmzxgC3a/AxtiaYFPk/gv1MSg1KN105Y6UIeCzhDrUBeP03fvQcNBCRDnETxQek5
 +eY82l1fwC3D2QWwMRo4Y4LZ7xoDQZw16ltUBzdurG9esOFn3SOLZsFeoEcQt8EQbL65aZauN0M
 v5Xc0yADM76dCTRS10A==
X-Authority-Analysis: v=2.4 cv=dOmrWeZb c=1 sm=1 tr=0 ts=69456583 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=pou2ygFnXE7-ag75BL0A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 70VqyqoG1m1VoW_85oa65XqK7wTviHCf
X-Proofpoint-GUID: 70VqyqoG1m1VoW_85oa65XqK7wTviHCf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190124

Introduce dt-bindings and initial device tree support for Glymur, 
Qualcomm's next-generation compute SoC and it's associated 
Compute Reference Device (CRD) platform.

https://www.qualcomm.com/products/mobile/snapdragon/laptops-and-tablets/snapdragon-x2-elite
https://www.qualcomm.com/news/releases/2025/09/new-snapdragon-x2-elite-extreme-and-snapdragon-x2-elite-are-the-

The base support enables booting to shell with rootfs on NVMe,
demonstrating functionality for PCIe and NVMe subsystems.
DCVS is also enabled, allowing dynamic frequency scaling for the CPUs.
TSENS (Thermal Sensors) enabled for monitoring SoC temperature and
thermal management. The platform is capable of booting kernel at EL2
with kvm-unit tests performed on it for sanity.

Added dtsi files for the PMIC's enabled PMH0101, PMK8850, PMCX0102,
SMB2370, PMH0104, PMH0110 along with temp-alarm and GPIO nodeS.

For CPU compatible naming, there is one discussion which is not specific 
to Glymur, Kaanapali and Glymur use the same Oryon cores.
https://lore.kernel.org/all/20251119-oryon-binding-v1-1-f79a101b0391@oss.qualcomm.com/
We've kept the "qcom,oryon" compatible

Features enabled in this patchset:
1. NVMe storage support
2. PCIe controller and PCIe PHY
3. RPMH Regulators
4. Clocks and reset controllers - GCC, TCSRCC, DISPCC, RPMHCC
5. Interrupt controller
6. TLMM (Top-Level Mode Multiplexer)
7. QUP Block
8. Reserved memory regions
9. PMIC support with regulators
10. CPU Power Domains
11. TSENS (Thermal Sensors)
12. DCVS: CPU DCVS with scmi perf protocol

Dependencies:

dt-bindings:
1. https://lore.kernel.org/all/20251105-knp-bus-v2-1-ed3095c7013a@oss.qualcomm.com/
2. https://lore.kernel.org/all/20251216-knp-pmic-mfd-v3-1-9d0cd62676d9@oss.qualcomm.com/
3. https://lore.kernel.org/all/20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss.qualcomm.com/
4. https://lore.kernel.org/all/20251209-linux-next-12825-v8-4-42133596bda0@oss.qualcomm.com/#t 

SMP2P:
1. https://lore.kernel.org/all/20251103152929.2434911-1-deepak.singh@oss.qualcomm.com/

SPMI PMIC Arbiter:
1. https://lore.kernel.org/all/20251126-pmic_arb_v8-v5-0-4dd8dc5dc5a1@oss.qualcomm.com/

PCIe Phy 4 and 6:
1. https://lore.kernel.org/all/20251015-phy-qcom-pcie-add-glymur-v1-0-1af8fd14f033@linaro.org/

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Changes in v3:
- Enabled system-cache-controller
- Squashed all initial features to boot to shell with nvme as storage
- Updated tsens nodes according to comments
- Merged tcsr and tcsrcc node
- Addressed review comments
- Link to v1: https://lore.kernel.org/all/20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com

Changes in v2:
- Series was sent erroneously 
- Link to v1: https://lore.kernel.org/r/20250925-v3_glymur_introduction-v1-0-5413a85117c6@oss.qualcomm.com

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

---
Pankaj Patil (4):
      dt-bindings: arm: qcom: Document Glymur SoC and board
      arm64: defconfig: Enable Glymur configs for boot to shell
      arm64: dts: qcom: Introduce Glymur base dtsi
      arm64: dts: qcom: glymur: Enable Glymur CRD board support

 Documentation/devicetree/bindings/arm/qcom.yaml |    5 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts         |  860 ++++
 arch/arm64/boot/dts/qcom/glymur-pmics.dtsi      |   11 +
 arch/arm64/boot/dts/qcom/glymur.dtsi            | 5700 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmcx0102.dtsi          |  132 +
 arch/arm64/boot/dts/qcom/pmh0101.dtsi           |   45 +
 arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi    |   83 +
 arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi    |   83 +
 arch/arm64/boot/dts/qcom/pmk8850.dtsi           |   70 +
 arch/arm64/boot/dts/qcom/smb2370.dtsi           |   45 +
 arch/arm64/configs/defconfig                    |    5 +
 12 files changed, 7040 insertions(+)
---
base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
change-id: 20251007-upstream_v3_glymur_introduction-5a105b54493d
prerequisite-message-id: <20251105-knp-bus-v2-1-ed3095c7013a@oss.qualcomm.com>
prerequisite-patch-id: 64b5c2583a515ba7b77e521123058e10e2461313
prerequisite-message-id: <20251216-knp-pmic-mfd-v3-1-9d0cd62676d9@oss.qualcomm.com>
prerequisite-patch-id: 8f2b3aff4b1a152b76251740883ca58a7ec87f48
prerequisite-message-id: <20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss.qualcomm.com>
prerequisite-patch-id: 6bbaff642cfd1f1386ff0ccd746739b68cdbeb45
prerequisite-patch-id: e30603778b23b7f7586b1c01a362e45af7bd0aa3
prerequisite-message-id: <20251126-pmic_arb_v8-v5-0-4dd8dc5dc5a1@oss.qualcomm.com>
prerequisite-patch-id: bb0420363fa9587c62b9ff2f4c57ae9fcf6e4d10
prerequisite-patch-id: 1f263de890046d4051462ef213cdba260512b613
prerequisite-patch-id: e338d64b1966e05270704fc6583f7f3a4a48fa32
prerequisite-message-id: <20251015-phy-qcom-pcie-add-glymur-v1-0-1af8fd14f033@linaro.org>
prerequisite-patch-id: 69d19c558f3f00da1fab8f034b1228f457991395
prerequisite-patch-id: e91da80b9a01a526c69d3055610a39dfa812ed7b
prerequisite-message-id: <20250923-smp2p-v1-0-2c045af73dac@oss.qualcomm.com>
prerequisite-patch-id: 12162e5c8953ca1d287bb23f48e31634828d9abb
prerequisite-patch-id: 0bc9a271a02ed879eb4b7c0f722dec4cf6dccfbd
prerequisite-message-id: <20250920032158.242725-1-wesley.cheng@oss.qualcomm.com>
prerequisite-patch-id: 2da9cb37b69d402d729ce6d0ff0664441c4147eb

Best regards,
-- 
Pankaj Patil <pankaj.patil@oss.qualcomm.com>


