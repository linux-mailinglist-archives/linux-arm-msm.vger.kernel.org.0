Return-Path: <linux-arm-msm+bounces-84928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E835CB3D04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 20:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6154E3080AF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 19:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88C0158857;
	Wed, 10 Dec 2025 19:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UT/C/c+E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cMR4Buw5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649A623EAA3
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 19:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765393373; cv=none; b=VKut4GTyLJv73/fVqAG4P65EXQKyi5DxZKkObV1oRwiSuf6h+SfIISoBDZM884RGGLPqZdW+ybcVYMChaFQghlSzfeObUsCKVasZSz3OVHW3JTAJ2MpNkg1mMAQ9pSF2l9EQQIT8dAIMV388C0BOPcHa4/6uOIolSrTxwIV2DTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765393373; c=relaxed/simple;
	bh=zCRVzUDVjpYrZJf7pNRuz1Eg83yBgTnv9RjMEu4R5ss=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c89/qxjMVfhxDSifuiggAD/A/D1XEix+DRTDbgf9hCXWNMGmfOdMJH65cmHAPk+KdiDzzALnyFGCGI86dkCTW/zWmN3kEi7VD7fesTcaM9vNlCvO64Rb8OxdbaZdu3SUpZ/lpCnZd4pe0JQiUQQbBShsQAYV3xO932B7ctEdryk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UT/C/c+E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cMR4Buw5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAIRE9n3685866
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 19:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+bqt69haCWbAOVKkAXinlH
	eWPXH+vwr79zol61nj2x4=; b=UT/C/c+EW1FjsqGXU5gcIuqRYCTnHeCOxinr24
	6G3a+9WzouJzUfC6LSxYZd/lNiPdu4MD6yBZESrAmQlBwfXwyDUXTaIfsvGqulT4
	PfaHKaSBRCOpyxugo8GoxrRmOJSUGHKln1eCNZXWK2pd7xui1vX0ZfWx3Mg4iQv5
	23FYqAfSFRXOQDujKft0+msDw/8hnPSzYfc3brxIs+oY7H+tb0nXjz69XImEWe+7
	VYcP4DszUZIMnCpq32KshXo5CCghuKJyVGCYP35cQUF5YklI6rPQ+CY3Ka0A3mdu
	dmgELcFFoCwIHuFuwUEgkBgAzuyrpSiTJj4iIjHyMKa0NV4w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay7pm9fuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 19:02:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29806c42760so4598395ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 11:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765393370; x=1765998170; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+bqt69haCWbAOVKkAXinlHeWPXH+vwr79zol61nj2x4=;
        b=cMR4Buw5V8GOMw6NXs2/+YERL80skgjGMRpPvJZ8mD2GldrLh8Ns5JNXomyQa+eprO
         PATmaLuhM4+Qi+HB3CyasKDtb7c/lM9m3JQ40ZEohsa2i7uG5QZSEr6SnZ6MnnjNPGLF
         BB8Srzi8Jwx0pYP6jPsq8ss7z/3Z527sTYvpbJgHXC440wKcCfIeSOVNzgs9+nWlg3yo
         1uBLSbIUmFxNS7osAUYL+ZilCVuu54McdQzkfiHq28u8vB960+E4hs6abYxsDCNg6chI
         BHnlyQxU4AH3V1dmr7ZngwFGKAN+yvMXmOJkEFPYvdiobaD29tpGFwRG8WLRuGHOvrzk
         tRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765393370; x=1765998170;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bqt69haCWbAOVKkAXinlHeWPXH+vwr79zol61nj2x4=;
        b=LipmiXv5T9mFZudvK4NUpTbCg1afWXLRHCk23ienBPPzMC2NxQ2ycQJiBBDRa4Qbp6
         pnKivuqFB7Wcf0/VH8rcBmsZWf8Y4OrWCd33Ari2CC45V3ymUbhw+iL90wUETDtT/JqE
         t5c8GhX2wv7ta7qeHzeV8NBIY1WH+H/+cQ7dOx3VP7mWdMteomDoxZFlm3CDFn1ZK00w
         V/EZRf0s5eBlPu53cQ2/d3G1DeK23A1EXni1w0KVfqlscdF2E/5OYORA7I4cxXKgfsQ6
         QmDyiRzFtzsBBiV/f0F3iCgoBlp3VAtuj8C1APJ6dyyokzV8/+HI2uYODJHKLA4XgIXq
         oNaA==
X-Forwarded-Encrypted: i=1; AJvYcCXs/jKkj0kizWlsCmOGLSrTQu1mKXYidU6AoEI/0oXkIgWVzJrReMNRaDDg8ywz4rp9onjJmbCg6h1alUlC@vger.kernel.org
X-Gm-Message-State: AOJu0YxmLbcofAg48dwN8lFaDoZvvYZtz46l+Hfb7R4feXXj6C/miivn
	fvI5FtCzKfTUt88U6Q9UHQ5E2dmCDUTqJibeCJdka+lkvYo1Ivr77sdem1itySye2Pe04hu2RFq
	W6Sme2kKoX8HdLrK5NfJhGZ7CCYQRefRS0OXb2HTRHosizk1kGmUiu9XmTzRbFm2Jhbw6
X-Gm-Gg: AY/fxX5MADJcwKI/K6w1Ftu/UVi/ou67ZO55+lQkdMoYp3hIBdvGA7LcYYijzdxnpEf
	FSRJGFVqBhyOXEiPjQ7qbli4lIVUgA9JJsVsv57VpLo/PkFlZokU6xHj5M8VfFuAyDptDZe1+6+
	KLWoUtGcU+iQvHmXE4baPaSvbUfApkHO7QHqSdYFXfs77zUFPXRMRPQ3LaInfDddUpsjfqaaBZU
	VTFJjSBezGk+sRGl7gLulj/JN9lJJBe1BYr/XIl2SQTz8tT4RaMsuYJ1sNsRKd0g3PJSx1IMdYQ
	iMqzknNtLMhVnScVKmXIFaQdm4yfZIpV0OdWre47IPm3i8cNfmb5ssNyMZxtgcBMOgzbeJvWaqU
	VOX6bTCA8H9uxGD5KHC0hrwJqF/V1UUWk48RiaJWP
X-Received: by 2002:a17:902:d492:b0:295:557e:7465 with SMTP id d9443c01a7336-29ec22e3e83mr33026175ad.11.1765393370013;
        Wed, 10 Dec 2025 11:02:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5A+q7D7QVDFc2KKQ+VoYW8O8VrAjcZHjO0QxemqZmBovQMde+4YyqV/ENoXMF+yChxCXqzg==
X-Received: by 2002:a17:902:d492:b0:295:557e:7465 with SMTP id d9443c01a7336-29ec22e3e83mr33025805ad.11.1765393369341;
        Wed, 10 Dec 2025 11:02:49 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea06b49csm888225ad.95.2025.12.10.11.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 11:02:48 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/2] qcom: SM8750: Enable CPUFreq support
Date: Thu, 11 Dec 2025 00:32:22 +0530
Message-Id: <20251211-sm8750-cpufreq-v1-0-394609e8d624@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL7DOWkC/x2MSwqAIBQAryJvneAHMbpKtBB91ltkphSBdPek1
 TCLmQYVC2GFiTUoeFOlI3WRAwO/ubQip9AdlFBGKil43UdrBPf5igVPbrXGYNG4DuhRLhjp+Yf
 z8r4flQzUl2AAAAA=
X-Change-ID: 20251210-sm8750-cpufreq-733ed7e5a3ed
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=A7Jh/qWG c=1 sm=1 tr=0 ts=6939c3db cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lYwxeunw1VhM2irEm_IA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: iV8w8bmtyzFg02ffR8wMBAvvFcU8unw7
X-Proofpoint-ORIG-GUID: iV8w8bmtyzFg02ffR8wMBAvvFcU8unw7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE1NiBTYWx0ZWRfX8ZSV7cLAV54w
 BN1trDPzWrMgSczXvEwJdToE5k493sqpi+qdlKvfGknxfxkuJTq9IAvuitolZxb7TclUOGS+lKO
 jjPZVLhqYto86/SgQoZ8ddJWcXlpHVei7NFfPVd0n0Bwv+brR0Bn2WWK5m9Oaq9ZR5oLCKQWaYX
 Ykd+hzgcRqjYszwEiVjuRrbj/ZJG+moZr1uCGiS9njV50QtAM8e6QD0z3rynUQ6H22BHI0W5T7S
 prlyBjSzuSbRGcmNYdDxVAChTFdSzfZKQNVslpsFWWN/t2fQh7xWa7XPf+PEbAhOLF5wvMqynna
 iwE/7/1E2e1VOLQN3WZxxoA9VOCjX4HXLh+00Kza6T62SnTvy2k7I43du5ozJb6D5D71TrTe0Hv
 4WOel21jzMr2mt03JwGqc7NzkVfFbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100156

This series enables CPUFreq support on the SM8750 SoC
using the SCMI perf protocol.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (2):
      dt-bindings: mailbox: qcom: Document SM8750 CPUCP mailbox controller
      arm64: dts: qcom: SM8750: Enable CPUFreq support

 .../bindings/mailbox/qcom,cpucp-mbox.yaml          |  1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 73 +++++++++++++++++-----
 2 files changed, 58 insertions(+), 16 deletions(-)
---
base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
change-id: 20251210-sm8750-cpufreq-733ed7e5a3ed

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>


