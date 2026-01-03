Return-Path: <linux-arm-msm+bounces-87287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B821CEFB78
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 06:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF4F8300D15C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 05:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4400A26A09B;
	Sat,  3 Jan 2026 05:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kdj1pPX6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDr5K8rW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9935B24E4A8
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jan 2026 05:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767419843; cv=none; b=PxrF1r+2e+ozAKDL4O5GzUap8J4XbmUMiqr5iuMWe3WOz1Qi0f2RyLegRD6RlLSONuVcKaaASvG09TQe0K8Lv7683C2HD+SvdFLJkhAesC23vKFavnYzo2u6xAFFuPCPscrzTZ+TUw+gn9BuHyoQS5UFTcLwnpFju24o+/haVpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767419843; c=relaxed/simple;
	bh=zR0ZKamJhj8fPRJFjLx4SI1+LEepdyCvufaUK8H8Twc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K/7UcEar8g24qzq2GqHWsaLLNqLXy/zaS1HGgVJLRDo7Oo1NTtvhqN8t/yTsMj8eIZ8NoqOsKpk9AaDs/SNNEv3zn1pGlCgGBv7zwI8Ikl54+1iD9C+zc68PzWabkLZwrCvjp5U+BOGvV4CTPm7sryqNkjYWOF1zgtuNggxYO80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kdj1pPX6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDr5K8rW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6032Bbkn3017696
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Jan 2026 05:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/OG1VgE/jVbBxc/gh4mUXE
	U4V5VDa8HcFUCStq+l/RU=; b=Kdj1pPX62X2f06XZLl5w1OPmzuDpkV1YTzGBb5
	kIgjBIfWWjxdgEgDqbPb9S1AYzyvnwtkbhWUAfd3Z35HHBTL5vU8ITqd5Z8wOlYD
	KWB301zMbWUP0JiuKmOWjpg27cGa5IVlL5RR+rC0z6up6RsPSkhJp5vHUZKMe/rb
	s7QbsVgdbdolayuE1xVEhC1KnUPxvQylno9R5lX2ObmcgcUCQcAh0H0cMU0EwtbP
	9Y0Xp2/V1uYQHkAUoxb+2Yq4Ff9c5jMNYgl8WDOyzIi5jGp1m8ioPTANGzG/WB40
	LNSpxV/+3uZVFdMenyxuDneRpu7bgKCS5PZAq3AokRHFUQVA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bet4607xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jan 2026 05:57:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c66cb671fso16962658a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 21:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767419833; x=1768024633; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/OG1VgE/jVbBxc/gh4mUXEU4V5VDa8HcFUCStq+l/RU=;
        b=RDr5K8rWKatg59ShtmNxIUYiXtUDM3l/wmTOHZKuWrhq+DfUmLMjqa72iAnFDBiNy3
         L8gFLI9mW7lFuApbcAhilyaD0I+pvskNEOrcBdheRR3BmhNCJhmqBDcjVrkZrm/Tu5D5
         82O7/A5Iwj3I8KGLseZOknzFPTlf58wmaxV4kjz5UvGpTDlhHZynU5waek3MpjcKaet8
         GTXfgRggSmnJRn0wFsG22sgxkUfu0MAzG6+D4PKddMFWLEgSSh5F0EBar7+HOWlFxdou
         DpnbJ9jxDnDnqW0BsAHYJH6ckrVHnr1R+kioWmmcE2rJ0hshqEM4U1DwBB9OA/W/RyxG
         RZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767419833; x=1768024633;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OG1VgE/jVbBxc/gh4mUXEU4V5VDa8HcFUCStq+l/RU=;
        b=EQhsGUK/a0jiNAkiyPbrdnHtPwV1uOJ7KxXqWvyc6ogPZitp0qHAQJ39jeXQpG8Fjk
         zjVuMX8lRX/iVWhB5uMQBDFmz7/QiMx1Yw4qbF94Ve144hwB2NCsG2jJ8xY1m00K4yvt
         tYBeIhGaJH9/rJHNUijXx9X8vpuehya/EeqK1Bu+WQMoDpxHC5fLM9gLYu1h4BPR++zV
         Ph6vSq/aBy7vKoKJyzlpq0XaNe2VKNYac7ABuQKlWX4a8q8bsLJ9BQ1EL3h++AU5BEa4
         PJ8UxRBSn0jjGpG/VTYtNI2iXFRofD18menZAGFkH/t2Beeq4FRwHs5hJzi+ixMg27H2
         PQrg==
X-Forwarded-Encrypted: i=1; AJvYcCW4fk0DYhUgjSwQcpwHTs9Ei1++QTrjPKXKeYIcC2R7ro+eiZPh7ku5WdAADrnvx58yME4aE1gyLeAKydb9@vger.kernel.org
X-Gm-Message-State: AOJu0YxLWp7mfE8tSpTRNCbhG1s7AeVz8SNZWHB+2vEhLHQbaKCqvQCK
	9TM30RlQw//Fg/eWx2ci3cEmtICjzJiFa8Wnmxr0v0zw0FJlAOPd1ZwjR74kBwzHhDu6QAbUxgr
	j3vt7YIMg1p7oi8XJWjhtKLcXc86SrTeypFyMQP/yiwULaN58+H5PvR1YvPoHf6WEa+Gp
X-Gm-Gg: AY/fxX6C0IsCnfCVpmuPLPeiRAladXFy9/BlASnwC09rjHTygmcOsSvdW+KjxG4EWY0
	Z2c87Gko6h4vXlcruoSYnMAbni3P3chWkAm4dqeEjaCFbbokZh2EsNN+TYvje6vu2kaP3DdH8AO
	sF+Fofhpxq0ASXXl+Ul0iWXFCu5Avvov9uj5wFuM+dFtB8y6AKcFscwF86Iv414bV5iEA+xDxPh
	k0fGXhFUfHNiZVHIg7BbZ3hXYM0kgc8OnxzoclQMPkNiNu4k7lUjkWssrKzmtvO+u9bUXaFoysh
	DVJZ63VRtUjZ+5V+CH5Y1vK/4baxQd9ecjJxBpQTfODsWke0OyjITa5MX55x0H0fbB+U89bEu0l
	rkg3R7Fv6zvlpqBzfUIQFJAhD4ZL/Quc6WA==
X-Received: by 2002:a17:90b:518d:b0:343:7714:4caa with SMTP id 98e67ed59e1d1-34e9211c415mr35159640a91.3.1767419833347;
        Fri, 02 Jan 2026 21:57:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBHOepO2cKQOdMz9KWWGshGlEkeLqd8ARIn1Z5OEkhgYEK7D/KnM+tOanIL358F26UTTzzzA==
X-Received: by 2002:a17:90b:518d:b0:343:7714:4caa with SMTP id 98e67ed59e1d1-34e9211c415mr35159627a91.3.1767419832873;
        Fri, 02 Jan 2026 21:57:12 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f475f1726sm754760a91.4.2026.01.02.21.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 21:57:12 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add missing UFS symbol 0/1 RX/TX clocks
Date: Sat, 03 Jan 2026 11:27:04 +0530
Message-Id: <20260103-ufs_symbol_clk-v2-0-51828cc76236@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALCvWGkC/3WMwQ6CMBAFf4Xs2ZJSS1FP/ochhJYiGynVrhAJ6
 b9buXt5ybxkZgOyAS3BJdsg2AUJ/ZRAHDIwQzvdLcMuMQguykIcOZt7amh12o+NGR/MKHXmUnS
 q1BaS9Ay2x88evNWJB6S3D+veX4rf+ze1FIwzWXVSaSENP1VXT5S/5nY03rk8DdQxxi/gH3ens
 wAAAA==
X-Change-ID: 20251230-ufs_symbol_clk-c669042d65be
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDA1MiBTYWx0ZWRfX6FJjT75glfIy
 sHYHmQFwoiA7MNWDhrNns1YiI33D824i7bK87Ylhh2gIOuooRLypE19wrm83nZ/7JNoJ+DGiLXR
 1+JOqqEkEYyOytUdIMbXoxrvMW9ofxu0aNVUobSaGoJ2JnSfLNPRAvFZI/NMYLB9SVQJUb/T7o1
 Vv37DLpxsmQBFDzDEMJ2DMP0sv7xJki8/7B22GAcX53esXQZIlyUS46d5q2+3AQ6Hyeum77lIrb
 VFPNEhrlkGBOb9Pzz4Qu2Fl1M9gfxXqTBi6+F69xPcifumXJik1ZL7/FiYrFJXlCOQHXEryDNVu
 3kLZeT0E3oxSzPh5o5lfv5LIDNMsX+K1p1836A2189B08nNqHRqasdprx36R7iBp0BGMUbXNUqD
 2YzPX9SK4AFfrK/21jq1dlZFv0Gr+j746d/qA4brjjgm6kU3iZC6Co7Yk2rBbwUgFXR3v7/WQr3
 DQfWMan45x6H3MJbiEQ==
X-Authority-Analysis: v=2.4 cv=UuVu9uwB c=1 sm=1 tr=0 ts=6958afba cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VRlZGQLi0vypEG6YspIA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: ciXIBsWeCLICt1fXBQ4D1rBSspekjsoe
X-Proofpoint-ORIG-GUID: ciXIBsWeCLICt1fXBQ4D1rBSspekjsoe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601030052

Some of the UFS symbol clock infrastructure has been left undescribed.
Add the required muxes in the global clock controller driver.

The UFS testcases have been verified with these clocks.

Changes in v2:
- Update the commit text to remove "Add indices for them to allow
  extending the driver." [Krzysztof]
- Remove unused parent maps and parent data from GCC file [Dmitry].
- Add RB-by for GCC [Abel]
- Add RB-by for device tree [Dmitry, Abel]
- Link to v1: https://lore.kernel.org/r/20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (3):
      dt-bindings: clock: qcom,x1e80100-gcc: Add missing UFS mux clocks
      clk: qcom: gcc-x1e80100: Add missing UFS symbol mux clocks
      arm64: dts: qcom: hamoa: Extend the gcc input clock list

 .../bindings/clock/qcom,x1e80100-gcc.yaml          |  8 ++-
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  3 +
 drivers/clk/qcom/gcc-x1e80100.c                    | 72 +++++++++++++++++++++-
 include/dt-bindings/clock/qcom,x1e80100-gcc.h      |  3 +
 4 files changed, 82 insertions(+), 4 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251230-ufs_symbol_clk-c669042d65be

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


