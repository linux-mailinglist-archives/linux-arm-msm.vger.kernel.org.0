Return-Path: <linux-arm-msm+bounces-79439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F958C1A162
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 12:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FCEB5807D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 11:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B67F2D94A0;
	Wed, 29 Oct 2025 11:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZljZNyU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="US/z6kE0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCBC340DA1
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 11:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761737461; cv=none; b=QD2wtXfPByqLanOLLLixrKajTg6IClj1gy/VchksW3Lj89P/7QUivHQ3MUDOIQAICyruKCFTY3MlEyhyCRRH/xDmR82QpV/gdHRYW2XM0p41f7Xv8qYK+R3yFlXAu2sPsp5rZhoxZWmaFeng0DeZ+rPRrbc+w2nQqd5uf/GxCcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761737461; c=relaxed/simple;
	bh=Qp8Mmp7bx4J2E1JhmAOqVGzqZtEIMBaTUoGYrEMgWiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EKsvImAi9r87PcXbrwq0C7SELa9oFK7c/GXAoxzg6fi0xYEiql2hA3LK/yK0AK0ZcWfBlUOtHJsqI20yxhSpfSo8E99/Kri6quHqaHk3USzLm17bxUNjK3PfOVOLDgWBSah+9+aqsuQofvBOwCLqp/7EU1HEnFeL2XKaa6Pnajs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZljZNyU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=US/z6kE0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v70g3755102
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 11:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lgDEHTIbutVCIfjWEkDZtgrQs+c3+lk079qYfyA3JzY=; b=QZljZNyUqyObmm+B
	Qo6Fma1Hu1xbCpKQZ0eVPDgipFqom3gbmpHTpBw/zPpkmQoH301GgSlA8tnNmDM6
	/JQmMCAaHkfr/Kgwh15zqzPrj7a8R8hTU9J+xzjH4oOV0wr8/1MFntHOd+wBayjI
	j0Z5kTgnIQR8qeJMsM3n6UvfBL+Pq4RmWDUuheuKU9W4hSL4+HeLNSf2ivvTTm0M
	O8Lnqkyaxf3MhH6KIyQ6+JgeFkKmEGho2hEr536ttLUQSrskLUhfU2/+PRS4XTnk
	GykaEKE+qfuA54bvidcRYIDsK6bul8bCyXQbSroANjKefF7Dfk1z+hcV70eoJhlI
	bV4pPg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a02bhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 11:30:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6ce25bea3eso5037400a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 04:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761737451; x=1762342251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgDEHTIbutVCIfjWEkDZtgrQs+c3+lk079qYfyA3JzY=;
        b=US/z6kE0hIWTJf2dc/ZzkRliEIrDEsAZfNZ9wsyR336wsZr5A2G8WaO4sUwpR2eeUU
         f9aV4SbIhPWK4Z3CSXNDaonDt7A+nyZXeZ3B7mgaiFd0Pb+r8d2AAPVqzJ8FuqBJzOSf
         HOM2D2da/coTQ+EFwUHrcO48ibeRfPixNS9uFHR8Tfy5iEmuD7xOUF5N/9CCFDavF6wN
         lYqtKU+JUYrWGXV2bVWAShfgf2bnlwTmipllY07Vco45eg+HLb9r0qxA3fWtI45tEzYx
         NTAI/TW0j3iSahsL50tvkqgI/F95PANRqC2GdraySUY88qFqNBHpiYiQyP+f0a8ygVfb
         4i7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737451; x=1762342251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgDEHTIbutVCIfjWEkDZtgrQs+c3+lk079qYfyA3JzY=;
        b=nBzWmYbJKvjMR6ZBZaandLjyzTb8YmGn+nrpoOrn2oRJgt0UOdgZTQYhXYIQARRtwl
         skHFLFBHuXudrGYgP5XRH7cgZ6LKoIsw6mq7ai+EuBE5e5fTq69UnrOF4jg2N0Yvz3St
         obJlfoI/vUdjcORPYcPOwyk7T/+5RhxeDkMB+V9B/OEZLhov0Cf70NSJb4th30ITnms7
         LBOgaY9Mi+LsJHJ5sM9SbhoM38H1yeS95LroPLl7rxknTYMKyQuEbxXrbP0tNLubkHak
         JBQko6N7MuASYu4A8hDIjoh3ETHKJMNhk69r9r4rcEJmYOCW/G5EmOkEKLLcuoLL1aZP
         DyYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo0pDIVgQmoKHTkJqTc2ZN75eINemYvhDGh5hATYecPXdBLjFItGoA2nlold+oB4/KrTaUQanOOhZUVDSx@vger.kernel.org
X-Gm-Message-State: AOJu0YxZEqqTz07JKfpIy7dxGx7HD+JNkG5un2oJUNA4V95xggrtAbsQ
	dqru009I+KQugVCZfpsReQ7i0u2+9inYNA2vj81Nd4VmafQYJgwW/NPVLbpdYSxzIJvkF2m/BlX
	uopH0v+ZsoBC0kRpa5JsEqP1ROGBu04cMvbUohMq4lBE9QtOWhBWz8XhH0SOJ6yEKWskS
X-Gm-Gg: ASbGncucSuJJoMJa5bqt0cob8E5SWpEFlnt/xAYRN8faAMn4bgJsDuLH+IuNa2Ka3zH
	bhq/Zm1ErfLJmZJGTW+/9Kc9RvFaU9SoX9OK/1/4b62vmZsCUxRG0f0+LEwggWASQj/jyJYke04
	Y/P4Nf6mcxYitn+QN0/BJQFrv0VweoAKRXXCDd/K7B9I8FwvS+TQBQG/V8TYduiTrrlflGGLViL
	udKEmWBgLSD+puKPoupZtx3XAJd0UmFDH+BsAq3kfJVJABQRbM1w5MzkBMcbMAXRxo096CnkJ5T
	vVfcLx9df7riCa5LOHUR6/gjBmS/jsslqebnnslVOpVGn6HiTpdr0hqv/RkDUG85RBefYKKX8VN
	dhC6rL1B7Ggp19ZFoCfcNKU8tg7QFNb2EsQ==
X-Received: by 2002:a17:903:1209:b0:28e:681c:a7ed with SMTP id d9443c01a7336-294deec8d5emr30915555ad.36.1761737450391;
        Wed, 29 Oct 2025 04:30:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyBGfitnJb5d72matMvOP9OSygmcBCg8ayvZYCaCiH/ZIAXmdr6Ioo8zux7z78Nl4JrVJz4g==
X-Received: by 2002:a17:903:1209:b0:28e:681c:a7ed with SMTP id d9443c01a7336-294deec8d5emr30915215ad.36.1761737449747;
        Wed, 29 Oct 2025 04:30:49 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d429c6sm152154935ad.85.2025.10.29.04.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:30:49 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 17:00:00 +0530
Subject: [PATCH v7 7/8] arm64: defconfig: Enable TC9563 PWRCTL driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qps615_v4_1-v7-7-68426de5844a@oss.qualcomm.com>
References: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
In-Reply-To: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761737398; l=898;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Qp8Mmp7bx4J2E1JhmAOqVGzqZtEIMBaTUoGYrEMgWiU=;
 b=oS/tFzkDw9Orhio33EJ56o8TloT8Jc3fUOBu1nVbqbG1oVR33d72oI95HFn7cfImCLcd3tDqi
 X/CyxlbjwjxAYLVNF55aHWSDFgcqTQF0hz6Ru3wb+KN2ZiETXSXA/II
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA4NSBTYWx0ZWRfX6ujzf5oCNgwy
 qJIhMMMg3LBO5WwKzhG8POVrwxTueyeQoecAbmd41EVC52/wH5fdEICsMa4TL3Y4CeKQDQFlxgw
 NzwUmCgrlY8NrrO5Xzv857s9O5zSTqE9c39VtfK0eKxI3omkl0AEpCj4ZQFxhG+2QctbWCqv/r2
 DChfT2Fmve+Ti2gy90TOvktQ0IBCP2at+DOs/S5xn1vBSDkQ4YBGnABvI5PzAJcFnQYvYZo05LK
 rQ+zLxVycXM81+Y0ht2sfrHL3hx+PcwIy5dSPmpu2mCx3zSMJa492Yw21TyPOW0y/cfEJCHISA+
 JVe44gRm+JvC3uvfB1WspnWaud9jy0nbg3Hhm8wRp+miJy1W4SzQkvjDD4+zfXfBcbbq6CyN9Il
 0O/sAnGe2pEX43L6mVw7Q+OrfWkOjA==
X-Proofpoint-GUID: qqf4QnmuPU6C7Qc6BtO6M41mpqaFIccu
X-Proofpoint-ORIG-GUID: qqf4QnmuPU6C7Qc6BtO6M41mpqaFIccu
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=6901faeb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5PcvmwL3LSb495PBagkA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_05,2025-10-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290085

Enable TC9563 PCIe switch pwrctl driver by default. This is needed
to power the PCIe switch which is present in Qualcomm RB3gen2 platform.
Without this the switch will not powered up and we can't use the
endpoints connected to the switch.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..fe5c9951c437a67ac76bf939a9e436eafa3820bf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -249,6 +249,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
+CONFIG_PCI_PWRCTRL_TC9563=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y

-- 
2.34.1


