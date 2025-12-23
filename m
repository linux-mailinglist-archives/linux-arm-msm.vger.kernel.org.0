Return-Path: <linux-arm-msm+bounces-86385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86635CDA10A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43866303FE28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D20C34844C;
	Tue, 23 Dec 2025 17:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djir0/sr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VoVh02mm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1164F347BC9
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766509737; cv=none; b=vCKQKNZyGZkH2xa/7R7v3o3qNfJqjP4a6MpHrWrervu20QcET25piFhgSAvcp/y64SQfP0fYymncaCOkCLIbGwU0FMsbFqbGEICRTFM8je0fKpUO9MJ+5P/oAAWfRvlcQbNr0kduSwEE+5xhOvG3YiNj1mnKdcBCiTHHzJ0OeUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766509737; c=relaxed/simple;
	bh=0rsUdCdVzH+igD6u68w9uIiPh6ggbgRgiwDr1wBAjm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VxrtbtXxi8u88MFc+dtJdTIr260tdForqK/nObjLxpg/Gi4uKEndeyUnY2fhoT8OKp7z5y2ZsuWxSQo8XwoHFwSlvxqzso9FCsadUi5zd2H8iSqoNtb4cwEHUmwNLk4FRqwQnIYFIxxq0pAoqnDcnlTj2r3D8Skuv3T3gtI+Oo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djir0/sr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VoVh02mm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGcs5H2748768
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWKchhYmME2TIdgWLH1Giry57SQALMGVaYfhAJiBNzg=; b=djir0/srkYtHhMZy
	PbTFSV+M1L/GEqN6mMAh6j6dyBY4DcYdLwvhpoyjz2zIm/D0K4l+2FI2NRcMvWHV
	h2miwNwtXuRIvxXly/jgJOaErGWQKvluSOHwapE+Q+DgaOACx26Tx6LVrCpz2IPw
	sxu5eK0GlZ2e4xj6vZSOzsa2kevbimgd4pJTzO+WIYwiR9ScRfTR31Mdpq3vByn6
	iE9bNzg5B8rP/bZbxbu5DqbtqpoTBDiYRr9vetkqyKb2dKIjLoWYUBV8Hp3izTaf
	6kfCsKIl+zdYj6QRC8McdtwE91DJmhLMXr2J/sQwpmrkLWhtTu+6y8aIzXrueGzc
	VWSwDg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5ctvhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f177f4d02so115509545ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509734; x=1767114534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWKchhYmME2TIdgWLH1Giry57SQALMGVaYfhAJiBNzg=;
        b=VoVh02mmq6JcwyJgv2TKuuwgGEyNPdzTgnwqQbeqhO0voHHBhcP0+S9Io+sDO1kjKz
         Pj3+sONdZPJv6FMH9PBRp7aXNSykEAZXtXKvHAH/MXyx8LeIuOINa0rfyY0Ei8PgNPgT
         S74lz66mRb3RH9ApmbDPjjjjLYBIEaS9AuNXVVY2qA1NCl7I7zOO9r30jNMkuyBTPhWv
         rnqo8ya8SPY3c+qADXK0WW5NYnCCqTAmV0GAW/pxdNP88GK00YIPnXR4dbtyRX3MiKE8
         XePEPVZpKV2nOQ2S95c9578wpEaWfBANa+3cSE3p1GMaXGlSah/C3N6QmEhMohoYapTk
         d+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509734; x=1767114534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kWKchhYmME2TIdgWLH1Giry57SQALMGVaYfhAJiBNzg=;
        b=qpzc/k2w8jBGqiKQSonF0oI9LtMNeP4iJPjje8kHAiijM3yT5HABf4oeByyX5rGg2i
         HQzSjqQNfyW0dvOwEaSRHFPU++A25rhp6ePb1lCiObGK1z2xNpqEdR1Suy5/k+SHIzxH
         bug0HMfRj02CdPv4zn/VC47VvpYu5AGN5AVKV3cxB1Otr2MtoFV4m39IQmO6hAaoiB1w
         Vu9ZpxrHUNWH4icwl2MS2sX6RIOzQgcU7LL9alobJjirHNQm0dZQw1RMsADWdch1cr9t
         Efv+ARv1eWR3b+E48YUVtCt/hEJFXY9E/6Rg9NE2Vd6GaiauIlo7pDRrwDTHOY1IwGP9
         56hA==
X-Forwarded-Encrypted: i=1; AJvYcCVH6vKji4N2daD8ElZNH/h2oOBYeFeo3V5CRX5FsAlPAQWNg9muJjaCdgMCvgpptG49n1PwdD6ChKErHyKI@vger.kernel.org
X-Gm-Message-State: AOJu0Yymev1ij5GqP42GgHn9T2daT/tgvCXH0rYTZ4aMnYuD4ewed5vx
	Jcx0t7ixpgV6mSmYmEY62DXzJfdYP+FxujTmyMipb988sKaM6ZWsH5U49T8uYOfQ5UufXYrXLyT
	k8CHVYXVUTt0V1AUqrlT1jGOcp+syYniuDSHt+7mxcE0E9e7fs0WMuLV1CbVHxIj06Q87
X-Gm-Gg: AY/fxX4N8viO+mPWabByPdpt4ZLXjpvA6n6sX+N9UFjYeppGnk9Z5jkww09/xgNqbu6
	5dz11USO0fPws/XPcXzVqmv4YE4S3g/Ag5zbxYvdxp0s//FNfNmDY+EWpYidVBQyjDS9DjKKkNs
	mp47PRgXvkBxxfkKnqP7cYCilS7h3hrXwZX80CbH5bFjZDAsD59H83q3sygB3fXF5RUe7GJf+2W
	tKl2KJX+C5KvxsXwUaKrR5+GsAF7wJAh0nCYK6IzqgAqkLnL5Ek2AfQdRQoCjJMUX1UOpmsftHd
	lyNzXFLSz5cYUEwSOzBjswCLVieAu87Ms4zIfZye5jSGuj2K5Row/lKMxyH2cD7DAe+I4Ek47BJ
	/5PZrYOpWrKdi1HFyLDsfhoUJj0UmmMezGK0+jbYSW/kPlA==
X-Received: by 2002:a17:902:d547:b0:2a2:acc5:7a42 with SMTP id d9443c01a7336-2a2f2833082mr153875675ad.48.1766509734465;
        Tue, 23 Dec 2025 09:08:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3BOO29YtCZeSocm5bw4OEe5WRvx83A2dEk1ULNixXLH3yXehKh2ztNeHGe61KoH5qcRQlmw==
X-Received: by 2002:a17:902:d547:b0:2a2:acc5:7a42 with SMTP id d9443c01a7336-2a2f2833082mr153875355ad.48.1766509734023;
        Tue, 23 Dec 2025 09:08:54 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d863sm130019325ad.80.2025.12.23.09.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:08:53 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 22:37:41 +0530
Subject: [PATCH v18 10/10] arm64: dts: qcom: talos: Add psci reboot-modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-arm-psci-system_reset2-vendor-reboots-v18-10-32fa9e76efc3@oss.qualcomm.com>
References: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
In-Reply-To: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766509672; l=1101;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=0rsUdCdVzH+igD6u68w9uIiPh6ggbgRgiwDr1wBAjm4=;
 b=M6t2WQm+DfzWeVcmizN6fQJnXCGH5hGQ4Q/0xf5/jF/Oal8bkHcXh2BlAuR++9oa67NuXqXLn
 M2qwoeEe7ByDSYZkJJ/S7BvqYMDmGpBhjYqKOV+vY7OoleP0iESUs+z
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MiBTYWx0ZWRfX3u4JCNCi//tG
 iOgg01pMkioxE4Qb7OaCEyfiyhrWGbYJ3OLryB411qlg6yKKo2fAsuYkKbdfecrnvTiB2rZtMVv
 CzL5wOeIwpzrjSURU1fkGIvgFa3KEoh1mbU5vKNHeVayGot2DQI4szSmnJIxZhT8Z/FcCaZkKg3
 65G58+B3M0bhITCyYwvwE8bC9nBpNUJTSMEgxbSWeBVhi1VR48oymUOnNor4I77iUICiACUG6zA
 a0fztoXRUHJn9BJw5TKRIRYEpQ3QUT4R76ZxBtLW5KGeEl1ftbrLSjT8jlRGTfIGiudDPs4xCj5
 dozm8jXcQFx9yI+PgdCKrULwKuKHZPqzAszK7jUxloKVjbUoYoj14m8LdoxG9p9+AATzF+4WnQ5
 /EtBm8Kj4A4iWtKq2bI/ZmSaqBrCAPA3DllRKKN2bqNSz8Pa0vRbUyFjunX8akRSyxkUKjmQPIo
 n6WObNnHE+grKEFperA==
X-Proofpoint-ORIG-GUID: 1kLoB63m9FPUY0zdWjz1hcqmTF_eDOsI
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694acca7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=4cuBwC7xTQKafrdxVH8A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1kLoB63m9FPUY0zdWjz1hcqmTF_eDOsI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230142

Add PSCI SYSTEM_RESET2 reboot-modes for talos based boards, for use by
the psci_reboot_mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 95d26e3136229f9015d49e2be22f6b28f1e842f4..11a2cfa209065776a8ae61c6e661c09bb871c400 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -613,6 +613,11 @@ cluster_pd: power-domain-cluster {
 					      &cluster_sleep_1
 					      &cluster_sleep_2>;
 		};
+
+		reboot-mode {
+			mode-bootloader = <0x80010001 0x2>;
+			mode-edl = <0x80000000 0x1>;
+		};
 	};
 
 	reserved-memory {

-- 
2.34.1


