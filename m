Return-Path: <linux-arm-msm+bounces-61376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 143BBADA8D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 09:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61E0F16CB8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 07:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2332AE72;
	Mon, 16 Jun 2025 07:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qx3HVd+P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4385C1F2BA4
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 07:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750057467; cv=none; b=HOt1IGCEFQxe54sq7iZ5o+Vyux+mEMfHSeuDs4nzwmDy3pgcxm4aQG+ee2MiNL9e2vKHpp5hXX2mSC498eHA5rVUHxMMPBatimIkBpBIl2tMxCKotgPAojhFVVkrE62Tj9+02/DUvtxe9Nt1HLPx4KaLekQBUvOMGWO/8DY5AV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750057467; c=relaxed/simple;
	bh=DkGDjczW+RAHUbptz63iFFEXvw00+iORY5XJP5CER6Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O7Lx5PS6I6ZTEgAuoKeRvZ7SZzK7oYW2NqjV8fjsdSWwue1JcRNuHGROeZksocAIsrgjEp81z7xxZtkgrt4d+bFVO2iyWBQ16fsshlAOgJ7ulidn/QF/90TNy72mxbauJ4liun979rtFj6vsJi56evsKUIojU7DKhlYT0m2z3mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qx3HVd+P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FNehgI021721
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 07:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8CSXs8YLFA90qJz0nFGCAuGj0c2/SeDodgr
	F61jLHXY=; b=Qx3HVd+PIi1iUXhXWS1X0pQXVs4oktpQBwFEUbjfwhZI1nXN1k1
	ygxf+9vQ6BfplAZP9qm4SA1LWblwhQUsgFFq0P4oJyV6rpqga8Y4rsa+OZx0pmtH
	3fB/3mw4zsY2YdH9X1sKvKfq/Xr1XO5EkKb4kAhUYlqLmj3MmD8i9hzRX3TuZoIs
	5gdtCekr63Xh7ScJUhinRA6LgxrrXLkb5yFtOwMRhEvBPn/sfOxZexSU4MmHpTOH
	iblaMvMJbh688c4msQCZBJu3VgIlYHCODnY0RgqESphk+MJJ3s9RsCuIW/kgCn98
	EsEv/3k/Dhc1JRVdWhfT9/uWPUT0xFK78yw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792c9uc6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 07:04:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235e1d70d67so36160555ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 00:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750057464; x=1750662264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CSXs8YLFA90qJz0nFGCAuGj0c2/SeDodgrF61jLHXY=;
        b=NfJEeHSm1vxtrUhWmjWwcZD4Y0XMMt310R9amZbP7K0pTmKH5w4O9m0XEV2Va777PG
         g0uH+Gl0bywkjVmtK7f9NM20tk6xdyD3NVPgb6Y71/nG50HrVixs9uQ6dyPektjvwJ3u
         AD2UZZ8+rsJcqhmvCBh8OUMbf0tIq9Qc1uCXLOnBPMGGZLFunDYtjyjau3IcrkGc6qJF
         ZKXpUkv9Uk5mU5E0umM3vjRuK1dwoyegrwrnNZ6TMoLiRAS6ImmoK0DvVmyiI/MNRN0m
         o2IBfdAfQVSZumRLpkTQeaSMc6VOqE2tFa2FiYE+2GJsZmx6jCaTOK8uP6HCdgaSoo5j
         0ZsA==
X-Gm-Message-State: AOJu0Yys96JVjTbdi0P9v0HR8sG5cufZeVj7JVO4ma4j/ucRdxLEIIzg
	UsdXjgEIBC7gboCVa6ETh9WUrF5WS2/jqnouF1R23xfoR331T1YNd9QlHSpEMZ2tDuscWxtILF9
	eAVZhG1G6u6JnLaQMh3eYMD8wsapSKuF3uce8BCHWIpVDgGwHXJnX8EqZWpqDX0QDHbag
X-Gm-Gg: ASbGncvfNoN0PW4YWkk6jv+FHVsA1W7jmN+GocD3lmgwBqrOvPwPWAPF2/Z1YwQEBiA
	pG+YfRAIItp+F1BUyiQjnOuOEnWq+RG2E1mdPjr39Pit0auirFuYn9erq1UVGstEkUwR1+Yq9GY
	ltChYnQk03UPuanNyhIZYkv7VazcLQYYz6g6tSnOUCh+cp2zRVuI+vtA5E4mxDS5paqWLSAMsba
	39Yfl6Ojxyyfe/GM+DIWuLPPG+D7YAFxJ1/WkghT6YQhv+12JFHJldN9ysKH5KLvuBrHq3IMi+r
	r0dmDQWw70qiHf/iVkCKrwUEmiBBUTJkQrDDad92fW/ii7/ffDdbiCtwQUQ=
X-Received: by 2002:a17:903:fb0:b0:235:e71e:a37b with SMTP id d9443c01a7336-2366b13c905mr111686155ad.34.1750057464466;
        Mon, 16 Jun 2025 00:04:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGK+vfW0KxFP2RI/6Wr6CaYhcpxAIyDnSQ9Z/QOwugNmsDFlDJ7ZFbg+QCbcqSaAEuW+soZw==
X-Received: by 2002:a17:903:fb0:b0:235:e71e:a37b with SMTP id d9443c01a7336-2366b13c905mr111685755ad.34.1750057464012;
        Mon, 16 Jun 2025 00:04:24 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a19e3sm54435825ad.82.2025.06.16.00.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:04:23 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v2 0/2] Enable audio on qcs9075-evk board.
Date: Mon, 16 Jun 2025 12:34:03 +0530
Message-Id: <20250616070405.4113564-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HtSFJC537Sp8Ar_XEygoGs_qwNPWz2JC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA0NSBTYWx0ZWRfXz8bjmwWLH8du
 kUUBwT8ngB4S89nhIwoPHShQOKWUoqRzT778mAy3f4OjbrDQBIgkxo3U6M9kxDlrbGM9RIPdOYo
 Ono+qqZFodcC9O5PerrQ6oayvgwtduMg3E1LjA1ZX4K0+vaKH35fyUtU3BELTuP9Wg3M6XKyY6E
 YODpl1WMGLMSEVHRzeVm+akzYPQ/p6iYpeh/z73nNvBI1PHfhdxtqIegZkJPTB/hUSVjMYF1v18
 ppB0hKqU0ExWnWXIfw2pISjqBHdR8lwKopvxGlXgzljPevg3HqzJLznI2u6tNy7AYNohKcAEjBH
 UVrjuTx6onM0c7S+U74G99Gs38NSR1dn+Cw4O6dcIirEsNyBcPozC3ceXfzRCaOCsGrtnXoOWmY
 3kRa+gdamwt5lpUgPfr0zMnRqwhtv/c/3ZOq26DpCacP+aeSBBHWfUAtNoBK/oaMubdBdm2R
X-Proofpoint-ORIG-GUID: HtSFJC537Sp8Ar_XEygoGs_qwNPWz2JC
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=684fc1f9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=YkB-U3mbqUf8DnNMcaUA:9 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160045

Enable audio support on qcs9075-evk board.

Introduce HS (High-Speed) MI2S pin control support.
The I2S max98357a speaker amplifier is connected via HS0 and I2S
microphones utilize the HS2 interface.

DT-Binding link for sound compatible:
https://lore.kernel.org/linux-sound/20250519083244.4070689-3-mohammad.rafi.shaik@oss.qualcomm.com/

---
This patch series depends on patch series:
https://lore.kernel.org/all/20250521140807.3837019-1-quic_wasimn@quicinc.com/
---

Mohammad Rafi Shaik (2):
  arm64: dts: qcom: sa8775p: Add gpr node
  arm64: dts: qcom: qcs9075-evk: Add sound card

 .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 54 +++++++++++++++++++
 2 files changed, 106 insertions(+)


base-commit: bc6e0ba6c9bafa6241b05524b9829808056ac4ad
prerequisite-patch-id: 853eaf437b81f6fa9bd6d36e6ed5350acaf73017
prerequisite-patch-id: cf52fc82e606ab87458339f71596ca31253e91ee
prerequisite-patch-id: 3617ce3b1790bc5b8e50dca6c3ae482759dcc684
-- 
2.34.1


