Return-Path: <linux-arm-msm+bounces-89105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C42CD22A33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D0B23014BED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 06:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2319B2F25FD;
	Thu, 15 Jan 2026 06:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mMOHN5nG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MVCjvg1Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAC92EF67A
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459761; cv=none; b=dZ0vSXTtlJGGpD24VQ0kImU9R7jEkCHtooR6QUb5pxrDBkoNlNVDwH74g1/8Hs2jEZp1JIima2XQjBH0UfTrFFDqCVPNLe0MJqmFvJZoCi5wZuYrE4wSY21APAE0NpqY5LydjYpoMuN+XYiDlDA0QeBB1Y2+zT/d1FmceIPDXKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459761; c=relaxed/simple;
	bh=i6IjVT0PVjHWCKuqfNYPEzUmuVN9r+s942D4D6I2g+k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dh+x+Ae7yPBUffEiEW+g/TU55MTHJdFBfyns9OsToSi7QUc6Uvx3Pglt3Wju6jNToQ1A2qseFHAkhzdvUwTjfdrcGdoNGlsnCD5yBPNMrD7GI+PwSHkFybIMGY+prGXqgRzsinvF7NohLOnWkYK6uA4PAer790sn7RI5kPjCCG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mMOHN5nG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MVCjvg1Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fxo82074723
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PdoDjw1bltD+OxcYidWLfG
	AM8l0mMCYuDPsGC6qHPmQ=; b=mMOHN5nGMmigepvvQ9rmelGJMoUoKdGk8HvWQa
	fe67NGmUGW362ESwtK62Fw+gXj4o5wdQeTWA7HTdN6V7sgiA/mp5v/gSgvgR0/Kb
	8Veclky/1gyTceSiYC1vthfoW4LOQKfkxyGsDTc551I9KU2Y50E+ZqtqIkVDBxJT
	MtJ+iFKCVHPsyrYfPRahf49+dhR3eMIMLxWdUjYh+SzDYRwE1Zko3OP2NDI/kuwQ
	eOegpQvlERBrY3s/TEM0pW92vXlMfpzaUXwGVa28WRmOPxRa42ldvXSYNXokZN87
	oNydN1esceSFHq0rn14PWpW6DxLXKt+sM+tc0r05QgXocOoQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj9hfnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2adc3990fecso403917eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 22:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768459756; x=1769064556; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PdoDjw1bltD+OxcYidWLfGAM8l0mMCYuDPsGC6qHPmQ=;
        b=MVCjvg1ZhE3sK4WwAhKucTwldibrwyDyNIi4oM6ll0vzBIzuHqNXICTSTZlPen4Cwx
         KY6zr6QzbB/I/DsMF+msSMcsBouU4ODNh5FVtzZJ9RZrw6tFWJY1WuR2QnXWP9lwfrK4
         2jUw+VgPUPweXDyDovMhHe6+1T7YOvTxoaf4oV8fxZ3CQYY0ISBg69KSy1ereufyYK8r
         hUDuFzkuqRS0/47EpckDAMC3fzykCRQbPtxEwW4MatbpF5natOWXefayvAiMkq7hRiRs
         jQsMlL8AvcQZCY6CTSs9Z3d9gRyHhc/S9mrO74s+JLE8OB3DJHZPLjUq7UqgwOD+roXm
         6CNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459756; x=1769064556;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PdoDjw1bltD+OxcYidWLfGAM8l0mMCYuDPsGC6qHPmQ=;
        b=xA9Ir6osJwkBHnEwEuh5fXZXA/7cnF/ZLsvOYGCT8divwILUJO8Y8d11pcWGpOiQkS
         Hlm3hXpFipZ9DmLyktBldhOsDXuTHIqn+x4Ec945HB/TB8RTbwXgI/gtPoESkTdCzsjf
         xj++TITBYFF75CCbcWbL7lTK9coDF0xTEU9sE8DwskTDO7Vn9X7/SubdLon2e0irRjTf
         BZVlFgC5gxt7w5tPdzq26mdZAbL8PrhwDK+pb8TG1ulnt/fGHlp/NG8J3peWpEIMl/cU
         pJtbJ7A9z3Lu/VFE+TnNpzwZgc+9bpGd6qKyB8YWZYs54XX0ZY3nn2m105QcPgCielJR
         3kdg==
X-Forwarded-Encrypted: i=1; AJvYcCXyCnMzMlNBBW4ZxawT3ANE7wpxqPzDhGG3pXlNb5ISDsIQiEizIEl970Unqcb94VoDa2Fc9N5Dz+V+ttF2@vger.kernel.org
X-Gm-Message-State: AOJu0YyzQyPOm9Y3JF1flw394934LLbJN3TlrVMb1jajgOsKgR8xjtPM
	y00lnbSOXJXemjZRT1WBsMwZpnopuyn0QkhWPqoY2mrW67JJeZdemyfsJOVPZc5l+AS6kVRRQN9
	OZ0Gqwf7CAgVFZKy5K7ddcUdIUI9JE5sicaJ+cX/PHA712Ae++G917BDwPt5AhvI+Sxos
X-Gm-Gg: AY/fxX5s+p9h6QcbOTSysHOiid8sCh9FRGUYwK719h9f1Wf4zTv198/XAjtMREZnvv9
	ItZv5SCSSinFkag+qJOKqHNxZXdYvSPtUpcuyxxSZK3d0gtz/W2GOvBLVYzbiG/oMKgOSWgIOki
	LcNr2ggcrQVma3ygd6NnenhS9lDehDZKJ+6wu4Rs9UF98YSlnnvnTX9kUBl4IsrWpudeZti4pLG
	q800I2gb55fWFHISzqXie84BQiVdTi9rpUr6wcTZOjfjAACDUAdTFZW3NJcRtura1NuDA42D4OP
	jxU3PZDuadlIJVvdkcRMJsI3QR43vi5wwODMZO4lv1CAtTl+dni3D2pohUDNtM9ZOXqIcsz46XM
	mEbkNKD7xRvM9HGq6I8uHYMRrnFTQ+m/MKkZmDPb4UYZOvoWFvT3/CL/hPgEU
X-Received: by 2002:a05:7301:4083:b0:2ac:2f90:8e03 with SMTP id 5a478bee46e88-2b65b9d9c27mr3173267eec.7.1768459755743;
        Wed, 14 Jan 2026 22:49:15 -0800 (PST)
X-Received: by 2002:a05:7301:4083:b0:2ac:2f90:8e03 with SMTP id 5a478bee46e88-2b65b9d9c27mr3173226eec.7.1768459755111;
        Wed, 14 Jan 2026 22:49:15 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b480dea94fsm3259143eec.24.2026.01.14.22.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:49:14 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v3 00/10] arm64: dts: qcom: kaanapali: Add more features
Date: Wed, 14 Jan 2026 22:49:02 -0800
Message-Id: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN6NaGkC/2WP3WrDMAyFXyX4ei7+iVM7jLH3GL1Q/LOY1XFqp
 2Gj9N2npOyiDIHRMdJ3jm6k+hJ9JX1zI8WvscY8oZAvDbEjTJ+eRoeaCCY6xnlLv6aZuqXSFKu
 lR2CdDEZK64Dgylx8iN877uOEeoDq6VBgsuMGQYDcxsZYl1x+dtOVb8MbX3Eh1DN/FZRR0FiSB
 6eEfs+1Hi5XONuc0gEfcro/fIu/XDH98jAnydcKe/q+eX0KX3zKi59LRnyL+GADG1jrGIfwD/9
 G/q7YfuLSNyxoJS0IOBrtwRknWieNxc4MzHSd5soqLQCD3X8B6Kc4IF4BAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768459754; l=2813;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=i6IjVT0PVjHWCKuqfNYPEzUmuVN9r+s942D4D6I2g+k=;
 b=Sl6B8BsqT4p4509eG0awf0b4GlYcjhE5wYMofarRzaYFE2FQH09jQyZ7EbXgrhr0kdSYvy4v6
 +OgT9ITJf3vCx9xlURj5cDxs87oAsZfyrnVTk9mLYIPE+QH5HbBClsU
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: NkwJyq_-H2SnuNz9SdnFOFDKzhK_7xul
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0MyBTYWx0ZWRfX7op9/7nPuvwt
 nJmiP5P3PBCaqkq99xDQBe/cMcFBJdJRHJVsi8mmtnXUR3xJFob5/4iQvktxsEtvJ+gkpYH+lAe
 I6k0dIL5NLIr29uL4Y0Aww76QDzfJxagImqjVPMGTy8DXwo6kiPzQKMpX4DQ1kBvcAaFRpt+ypl
 KOtyviefzwQXCO0KS87bXb7bcNb3v9huZC9Oi7WoOgeQKr4pKu1i8/LYVrD+DZMDFuwpAoPU+Q/
 9O5RlWCL/huqp+bPqMq9S63gmETNMXiKraa0A7r+Hjqe0j0Vucp+Z7D/cR8pv8Y5xV3e9pTmJEq
 +7TMBLEqyVjFGCUrUCPm44JnaNIfoc34PaY9mvN0Vkcucw9U4jdJHNhkc4vWXvwchPaH8KH3wRa
 EsK/VeJyVz6v+o0/IldG8J6n2lypvFvE6kAObM+bZaYABpNpvcS7CJnL/s7ipzbWhfATljnnqgt
 GzyCMoal5H/Z+ahgj6Q==
X-Authority-Analysis: v=2.4 cv=dcCNHHXe c=1 sm=1 tr=0 ts=69688dec cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=4LptFnmNR7OdvzKBXfYA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: NkwJyq_-H2SnuNz9SdnFOFDKzhK_7xul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150043

Add new features on the Kaanapali Platform including:

- TSENS and thermal zones
- CoreSight nodes to enable trace paths such as TPDM->ETF and STM->ETF.
- QUPv3 serial engine
- ADSP and CDSP with fastrpc and smp2p
- Audio(enabled on MTP only)
- Multimedia clock including display/video/camera/gpu

dependency:
- adsp/cdsp binding: https://lore.kernel.org/all/20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com/ - reviewed 

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
below binding are alreay applied before but somehow lost in the latest linux-next tag:
- ipcc: https://lore.kernel.org/all/20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com/
- cpufreq: https://lore.kernel.org/all/20251021-knp-cpufreq-v2-1-95391d66c84e@oss.qualcomm.com/
which may cause dt check err which is not relevant to this patch series.

---
Changes in v3:
- seperate patch in function
- pick remoteproc/audio/MM clk patch
- Link to v2: https://lore.kernel.org/r/20251225-knp-dts-misc-v2-0-a8a8a31fd528@oss.qualcomm.com

Changes in v2:
- picked latest coresight patch form: https://lore.kernel.org/all/20251205-add-coresight-nodes-for-kaanapali-v1-1-d3d2099b9b24@oss.qualcomm.com/
- Link to v1: https://lore.kernel.org/r/20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com

---
Jie Gan (1):
      arm64: dts: qcom: kaanapali: add coresight nodes

Jingyi Wang (3):
      arm64: dts: qcom: kaanapali: Add ADSP and CDSP for Kaanapali SoC
      arm64: dts: qcom: kaanapali-mtp: Enable ADSP and CDSP
      arm64: dts: qcom: kaanapali-qrd: Enable ADSP and CDSP

Jyothi Kumar Seerapu (1):
      arm64: dts: qcom: kaanapali: Add QUPv3 configuration for serial engines

Manaf Meethalavalappu Pallikunhi (1):
      arm64: dts: qcom: kaanapali: Add TSENS and thermal zones

Prasad Kumpatla (2):
      arm64: dts: qcom: kaanapali: Add support for audio
      arm64: dts: qcom: kaanapali-mtp: Add audio support (WSA8845, WCD9395, DMIC)

Taniya Das (2):
      arm64: dts: qcom: kaanapali: Add support for MM clock controllers for Kaanapali
      arm64: defconfig: Enable Kaanapali clock controllers

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts |  240 ++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts |   14 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 4846 ++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig               |    4 +
 4 files changed, 5104 insertions(+)
---
base-commit: 0f853ca2a798ead9d24d39cad99b0966815c582a
change-id: 20260114-knp-dts-misc-7a063f933cda
prerequisite-message-id: <20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com>
prerequisite-patch-id: afd581c1ad048b1b9d5cb13cc667a5efbdfd1bad
prerequisite-patch-id: 554f737dd82cedf873d73db34d735c95c28b9cd3

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


