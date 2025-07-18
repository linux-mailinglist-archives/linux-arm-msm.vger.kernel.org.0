Return-Path: <linux-arm-msm+bounces-65678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FFFB0A7BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 17:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E36C83B7326
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 15:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F13002E49A5;
	Fri, 18 Jul 2025 15:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ELDrK/Ul"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7558C2E498A
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852823; cv=none; b=nyILxfMPs4ctGf+ATwUypeugSlN3r19DgWUKXzSWVjTJqrMC1pNOd5lP+iy2Y6NIvABh09rLhwkMuh7tCk00+dxQ/Ks2fy6z+O7ltdtKKWJ0Azi92Wsziubz/hlWD8teLJlMMHX7syH3CFURmDA9ASXbvlpwB0GGM02/H6/x02A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852823; c=relaxed/simple;
	bh=7Jh0ApwfVeGj8KwNOzX4awWIjsQMmQqcBIrdHZKDbRI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XC+1jkJp9OAPKXQCGzk4OleBhwZxUdvFMQswqfZ+k3io2vBxacBNk2iQH2S2MMAJWJRbZma7iJEhfg4x7ANxYzqNCyKPNyLAn3JT590tTIi+mCkUlmquas/KPsXFxY+abybt1o3xYWZk+umm6i87/7lTAPx6Ib1DnRilptL5ePs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ELDrK/Ul; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8NjG8008518
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=drqirIeVXXEfxAW1fu4y1d
	zsapDY7HV4N/7yaGv5Sls=; b=ELDrK/UlV5KqmHOaEMB3WvW6dsh1Fch7VEfHNo
	AIkkDSvuZgDS+O8Hhn+12RsSlAkNwEupN3d1yaiway8zOJVFkYV/+O3z7oRMu3J3
	ojxE9T6J88TGY3ZCJ7LdNHKw8+3anUuXIKi0K/l9BjmxY6Mni/5yhkNGKylkUXuv
	0BpsgEh/M1/oduE1HzJ56AX0O8FNFopPbE3r4Wl4sUs+Ipf8TjH+qeXgNo77E9lo
	xuWypD/EkbGIRd5PcpVRY5clilfx5gAjbpCl9KD1sG3rXP4VZvSD5sV8+O3gCnuh
	3xiCLMSoLn0NldiSmJxa1tvzo8CNpAO+3Y9l2EbIq5Iw6HFg==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxbc457-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:33:41 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3e29b48527eso8918615ab.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 08:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852820; x=1753457620;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=drqirIeVXXEfxAW1fu4y1dzsapDY7HV4N/7yaGv5Sls=;
        b=BFIECcZvlNTqFPiMIO9v9FG7tWWxN55LkjSL86uRLzrJyoYy8n0ssRl3Ojgp0W7S1u
         GWbJStL/MG3DjuTblUZtLTMZgAFjRH+fA4JPwrtxOr2zR58fojhfNPzMNqLAmHWIn6m8
         OPFhnrWWODUK8ehrYlXwIVYtNJHIv16/Kz8hICr29914dvGUNOMRTUhXL2OhuO47/oqc
         XSe163t8wu7pGAiQV4OMsPiA/iIloc2Bmeqlrit3jXsy5VaGJtfraUpyZKIWCGLk/VHf
         8GQmP1ktfi67csKsy2iXiTknp/rmzoUYDraMLj216HfWpBVGNsLERA4JEkyhsSpsFZiw
         Zs1A==
X-Gm-Message-State: AOJu0YxerRA/+Q74yd6zElffrOZrX5WaBMIV6v03h1WlAvehQYUylZ58
	gjSnt4QCyigYJ11tkxKVl8koC40DI3vxVTkWMXkSQc95dfrd/go2wRAUMtY88+3SJtWNoES4tGE
	dLIt3+L8fjNBbgYkSzCEzfeUE9/8cf8/IA8as2bUdHThLzNFB4GIN6A9oJFYWcmd0LiHJfRk/Tf
	aK
X-Gm-Gg: ASbGncsSqVkK/8oDBg75k3zqQk5fzUYKB6wXly8g1QQZCMKWC2SUQvFJSg7I0RRro4f
	uxykR/486LZ1EgyEtLFOMJIFLGejVVd4gCcEVOtuq4XgDQN+rqkYN6mkhIGUIdKwGO7BFegHugk
	uHZs/cfjl2xVJklaQCJUFVuzpM2IahDQa7GKtYv7zmpxIlxC0DJ0cxPXJSwor/BqcPSmpfDsQY5
	/GexH34VvFzcCpoeitt+UG47BspcmMDMxYe2D12B+Zw3YO2+LN5jAqzdPpXQb1av6MWAj83kxQ7
	+UV5OZiRH/tTOMtQQ4hCOv4+oI0eBYxWww6c7KLJpdqE/nDtMVaPGTea72WxGtfFDKogN81pEDr
	STiUkVcdmIfmFxlrGdjVkFKjq3nA3pDT05zdCOsuPaepjjs0z71Fc
X-Received: by 2002:a05:6e02:18cf:b0:3e2:988a:101a with SMTP id e9e14a558f8ab-3e2988a1365mr25488855ab.2.1752852816399;
        Fri, 18 Jul 2025 08:33:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcnPvBctrIOobI5Y6udYDD0b/geBcKaa7wSMklKLg8ppUEyhKsXeNxAsmArw0cImYApnAJxA==
X-Received: by 2002:a05:620a:27d1:b0:7e1:68e3:712d with SMTP id af79cd13be357-7e3435f77d2mr1326292485a.31.1752852340559;
        Fri, 18 Jul 2025 08:25:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91d994csm2466821fa.84.2025.07.18.08.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/4] arm64: dts: qcom: sort out RPMhPD domain indices
Date: Fri, 18 Jul 2025 18:25:37 +0300
Message-Id: <20250718-fix-rpmhpd-abi-v2-0-0059edb9ddb3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHFnemgC/12MwQ6CMBBEf4Xs2SVltUA8+R+GQymLbCK0tEo0h
 H+3knjxMsmbzLwVIgfhCOdshcCLRHFTAjpkYAcz3RilSwykSKuqKLGXFwY/Dr5D0wqSsbqtWNe
 l7iGdfOC02IXXJvEg8eHCe/cvxbf9qap/1VKgwpOtiUnzkWp1cTHm89PcrRvHPAU027Z9AOrlt
 V2zAAAA
X-Change-ID: 20250716-fix-rpmhpd-abi-2ac5b7e5865f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Ling Xu <quic_lxu5@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7Jh0ApwfVeGj8KwNOzX4awWIjsQMmQqcBIrdHZKDbRI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoemdyXisrXLgSiWLqKDSy19GhFXIva6Bm/jmVf
 mwBqMiWncaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpncgAKCRCLPIo+Aiko
 1Z1LCACGrgR9N6FbDNEby8b4CBiYzcdPOouKFSsS/EGXZtqsZVOrWBbyWryRC76OdFlRm3vuBxt
 hg9hO6yLQbOIP+2Y0CX0z/fzB5E1xkvGHJWJv5CySBljPs8+nAZuIUBNuDhbLYDxCcrrM2kek21
 csaOMxuk5YEsODJ7xJOteotj3WxcBEDbMllauC1f2ltTz0s8rtTWKm399LCV6GTKcWHFz8NlM02
 +oGbTTPEqHUC12MIBPGSgcB+KJKzULIYhEwAriwXfOtuoE+GnBIVCA7rOouCD1C6SILGYqvKhKV
 rhhyr1rIwlfwRNtE185CNUkpNLBoa0+/mEYKGg2wJYUHY8PD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 1Lf2Vy6gM848KoL86CEQ3MF7wWw1GB4o
X-Proofpoint-ORIG-GUID: 1Lf2Vy6gM848KoL86CEQ3MF7wWw1GB4o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEyMCBTYWx0ZWRfXyYxRNghfxxo0
 NYq+vLum4kQeSrG1fZxSTWoV7PyhXoopV4B4/GVmrpJ6DyhUY96fngjC7Xq0nuWRDpsr43rtoRR
 GQgq1uNFoE0q+Kytuxyk53Fqk2rgJTWZbbccXz+5UnSO0QpNxw8RucWJcziFTKhk+P6YnyYyi0h
 Xey8ufZaYRAuXVWvlqyGQJ16NlaXhDTxffHhJFo4fSOYdbEgBavYnwxT1VqwLV4E6hGWBFrHZOV
 +a5KOWW6evL+go8kZecT705ubc4W/ZBgwxp6P71gQS4rFHa7mvz0qQNw0dGvIFN4+G34W4oKJOU
 +BRC+lZ2GCXNANwQapwEVSNH0TGj6ZWi4Exc93Kor+KTWhbOm4VTW7Hf6lksV4N2zpa+XrexlNp
 BU+9wlIuHrwk2YUkWxlYUBo9TyxpY3dQp5w87ZZqPku8mf4HTz5DAhObahaNK8NfRCG6cVYH
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=687a6955 cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bJKr_GLULl7BGc3kRxwA:9
 a=QEXdDO2ut3YA:10 a=HaQ4K6lYObfyUnnIi04v:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=593
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180120

Several Qualcomm board DTs either use incorrect power domain indices or
use old defines for RPMhPD even though the platform should be using
RPMHPD_foo defines. Correct all those issues.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Fixed SM8160 -> SM8150 typo (Konrad)
- Made corresponding commit message more obvious by specifying indices
  (Konrad)
- Link to v1: https://lore.kernel.org/r/20250717-fix-rpmhpd-abi-v1-0-4c82e25e3280@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      arm64: dts: qcom: sa8775p: fix RPMh power domain indices
      arm64: dts: qcom: sm8150: use correct PD for DisplayPort controller
      arm64: dts: qcom: sm8250: stop using SoC-specific genpd indices
      arm64: dts: qcom: sm8550: stop using SoC-specific genpd indices

 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 25 ++++++++++-----------
 arch/arm64/boot/dts/qcom/sm8150.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi  | 42 +++++++++++++++++------------------
 arch/arm64/boot/dts/qcom/sm8550.dtsi  |  2 +-
 4 files changed, 35 insertions(+), 36 deletions(-)
---
base-commit: 78a8f8d4ec2bf09266a03a0a8cb0af82da0766d5
change-id: 20250716-fix-rpmhpd-abi-2ac5b7e5865f

Best regards,
-- 
With best wishes
Dmitry


