Return-Path: <linux-arm-msm+bounces-89644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 177DED3A86C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 81C23300AAD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B2D27E1D7;
	Mon, 19 Jan 2026 12:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSaTB+Xt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B1oTV1HW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320B72512E6
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768825040; cv=none; b=f/cKOc1wI8V0ed5/fpDtB/CHbQiB7GQpwXtPj7Dr4zRqyKX1vypqL9bUkN2loxOsLNVywif1H9Asp5aSRLHjFNpk0IMu75oR7xjPdWYOC/uJ7J1IJZR+tbxKHYqLQCm43D2StFV480q49PIbJ4XQqNIwOOG8oEzP7qGuyB/IAtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768825040; c=relaxed/simple;
	bh=odByiESPUGRmFH9tngtI6WdI4/EGTchJdAMNllxoeqk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ork+LhvbvqJtd/XrSwAB6mdQk5fTOf0H/IvPtnClj4Au2HNaUy7hwk5fWjjHJdWEuxXBP8CDtokCZWqhsOdy2uTg44MFZpoBInuwzXtvA8vNfcZGMux/kcV+7JwzdAQXbII0o2LjOyPf8S1tgGww0+xQoj/h52B9KsD7RAla2UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSaTB+Xt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1oTV1HW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J916vc903264
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VUTjt55ejTVHkuv6u1gjuO
	A/GOQfMpED72ORe2+Ysh4=; b=NSaTB+XtyTQABuQ3S8mkVtap2cLJzvixjxIPoI
	u7nI3Fv5ICFV79UtJpD3Saq4IflGd7cQYCdaXgG9qM/CR4ux44V1HaOCsqfqy1JZ
	urJyzOtzL816nFenZkqTc3JHwrZ9M+Xcs4kCBo/dRNtFT6X7Y6xbxylXssSJS4nr
	FbIIX75HJURek9XEUskrNvgcmgAKQHCxzz1BwgBZ2uUGtGQrjEzET5YW4w4WqkP4
	ES3NAMhxnpprt3ttzeqMJ4bzrykp1jZSyO4bYb9T//gsJ7saEX3iaJrFPGceTa7i
	wOUAWIp07lC/j02J0mDr9jZ2TYR9lx3NPzTBYliWeLAboJyQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsb4yssnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:17:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a0ec2496so834392385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 04:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768825037; x=1769429837; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VUTjt55ejTVHkuv6u1gjuOA/GOQfMpED72ORe2+Ysh4=;
        b=B1oTV1HWFu/B107Cyx+9792vizSXnYXJ/oX4qR/BHDjBJYna/Ew0QKhVIVzd1g2bZV
         CtCahE3ZpSAktwpLsDXi4nmkXSc2UiT+s71SnlFjf1I6a37DyVQIbU33YaBIr35//O9W
         3E7B9p4GnNwG3lh0AhsPOSD1ZbjWXW4YHskioRUBVpcQ80gZA42Rd76hOGbP9ZRiDatX
         V4PIJY2DesZK99gn98h8dNdsII3HHs0wh8DORXptJXfaJk8098Bw1Y2G+jCca01Gk5G2
         AE3ntjb3+wVLOY8liWhOdNxEQFFR7mob/8ZdQvalVY3v82XBDV5/5tGprIsNcO3Mf4Fx
         0uaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768825037; x=1769429837;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUTjt55ejTVHkuv6u1gjuOA/GOQfMpED72ORe2+Ysh4=;
        b=bHZK70ZVcHqfQ4dT3qp2JSPUO7YB9QJQepQfOH8UfBI40oX1ApZVJWq6MIaofZ0+We
         Lq6wq3dIkp2/fIdCzRBFiRar4XQcDI8MSOo5HLOLsn+PzVnCrH7Ay03iydAEuggPF90i
         FB1vgPcuPmE3+wWpOeikltloaOOks+P41LSgSy77y0LFWx32LCYwpE4UZJTmMbe5qdM+
         ZBqOrHxHzsbVeJpYcE9I9dAorpFamJ39sbJMObMyoL3zMUTHrf+pYAx9cVBn67Qmbp5o
         StDkryLJu/fN8o8ey29HcxrUeb3uauZ7kEwerV/I3Q627sukrxh0l18T1/9+DNNOUkYS
         zLbg==
X-Gm-Message-State: AOJu0Yz0JXEhmqY8OrQmPhW6oDTpUTOHuO/yddS2OwiM+VOwf1oWUPVi
	nq109+XrWiQb3JGBU4udY79emVw0ZZPIw56uY9/GT8rJVj/xwuFdE3LwfjqLFBs4lllaSSOZ8B9
	/wGd4pHjVf3ugxrt9pigVDcum5enwDlXHAEOeIKfGcG0mvSxT7Ze4QG76jOpXUYuLm9HH
X-Gm-Gg: AY/fxX5Q2RDoKuf/CMD9J47RfziAlpjJa1b2QaADwfahCjK6aawNdgFvIwlniGeA97S
	+78eyLbGsNNcnx51BeAhu81dlvV0Cb1NyJUCGnJPsaEe0iULSrhfuz31lffsSX47uuGd6Wj9YSa
	7goRM4eI9KaZk/+uPYoSpoVy1UhifsMlEnuItNZ+9CTYoNNGckUrww+pWh8BVUm08ZzVH3iaUfx
	BWv43RS5ZbGb1O85qraZ312kkrYV3nN6YU4XV8ryLVX0hkJclbhdrCz8720Eehu9Vag15TaMC8j
	1DXyUkawhzA0mX9jxeKAz86WCq57TObxYryK6jBl6Hy0k/ARPtv2Aqld7BSzV8e4xY0FKGH1CsI
	t8yZnZ+GIYKpIzZ0S7arjLLHX7g9Tva43/hj522gNks4/nkvKOTDMaam27NFN6A4StYcmx1XCqs
	wAldKh57L+V5p2HSlFri5tKyg=
X-Received: by 2002:a05:620a:f0f:b0:8c5:32c7:d2ec with SMTP id af79cd13be357-8c6a67ad8afmr1741008885a.85.1768825037397;
        Mon, 19 Jan 2026 04:17:17 -0800 (PST)
X-Received: by 2002:a05:620a:f0f:b0:8c5:32c7:d2ec with SMTP id af79cd13be357-8c6a67ad8afmr1741004085a.85.1768825036803;
        Mon, 19 Jan 2026 04:17:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3a17b9sm3274641e87.92.2026.01.19.04.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:17:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/4] drm/msm: UBWC-related fixes
Date: Mon, 19 Jan 2026 14:16:36 +0200
Message-Id: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKQgbmkC/33MTQ7CIBAF4KsY1tLwU6B15T2MCwRqSWxRsKhpe
 nenXZlo3Uzy5uV9I0ouepfQbjOi6LJPPvQQyu0GmVb3Z4e9hYwYYZJQqnCXOjycHgY3/ukS5oI
 0UtlKEisQjK7RLQVsDkfIrU/3EF+Ln+n8XaUyxQRbYaRwWghm1D6kVNwGfTGh6wo4aBYz+1TqL
 4WB4oipjOSksZavKPy/wkHhpdZaKmYqVv9Qpml6A37gHPk/AQAA
X-Change-ID: 20260117-msm-ubwc-fixes-350f67d860d5
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1454;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=odByiESPUGRmFH9tngtI6WdI4/EGTchJdAMNllxoeqk=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGluIMuhRTL5NZArHsjS/MEj8mTu9OBuS6Jq+SpkQemqlynle
 IkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpbiDLAAoJEIs8ij4CKSjV4VgIAJeI
 6x5H9+8erGfTT30hdUxjxNknaprLYtkPQvUgZzFduROo303EfnL/zJ4nOMBm9tN4MYXxHoH9B12
 VBC2qL+VyzUbHwPkw9nSMUFKjsDW7n9vE7qsKGuwfIrpNRI3ajUSUDnkZ0fxPj8WsQp8LpxHGTt
 YNodaseAWCa3rl9yxWz7faAAOue0wy7TiUS6zAsm4kVgWf+zjjmJRRf5zB64zfu/EiHFABx2Q7/
 UapASlJR5ZoDoBWPnUQVwAmHUrcZsk9M1h+qmtfpYLLOQQcHpEuGOdCO9E3BqfpCuENCUCJAMaY
 v+5cEnA64W0NGzmo9dD9v32HBYyXim+KBdxTd/U=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=SNhPlevH c=1 sm=1 tr=0 ts=696e20ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xvqa9-5REf62IQFaZ80A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwMiBTYWx0ZWRfX+hVKX9QXLUWA
 I8qkhuU556tK4SDMGmLQ0xh4FUh6xtqr1lk2sPqoRErCHlzWXFaFsvvNyJjDWPo2/9Zc9oG/PWs
 FkIbZGA91on2jQGgZNAqwpJ/uCLZb7mEa+TgBVTU30g+dHoPnK8AehagMabdvKbzdHjyRTQmYfv
 N3DPHUzJY7/6jtOEmtYH0aSdDWH0OdBl7nPAeoa4wMIkd9UTeRE9G4ZatEg1nWTT+DLaMO24CdQ
 YZlsYGUzMadGuqG8IZr8k1TOvhyhbQYj5n+KirBtFyJIPNAjTcOvrRtBMTYGK2wKYLZGVoOTZTx
 yvhK6/bw+HvGyvQeLPHX2TI+5Feh9nKQqcAEraFxAqpUeBQGH/elUL8PfBUZgpoGjBinEkKweT0
 Ec+g5110YcvqfTRTI7h84XWmfe2Z/tCuVDGK0MFx9uFyC+rwp67T14huzMA1G+fUgkDQcoQZHGF
 OioeoIQRrBSdf3lKdcw==
X-Proofpoint-ORIG-GUID: WBWol8347knTCC54BQgmNf2TEGYKgOHA
X-Proofpoint-GUID: WBWol8347knTCC54BQgmNf2TEGYKgOHA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190102

Fix several bugs, possibly causing image corruption when using UBWC with
the drm/msm driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Added comment, mentioning bits related to lossy formats (Konrad)
- Also handle SSPP_UBWC_ERROR_STATUS_REC1 together with SSPP_UBWC_STATIC_CTRL_REC1
- Link to v3: https://lore.kernel.org/r/20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com

Changes in v3:
- Added Fixes tag to the last patch
- Picked up t-b tags
- Link to v2: https://lore.kernel.org/r/20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com

Changes in v2:
- Added warning if dpu_hw_sspp doesn't support UBWC version (Rob)
- Link to v1: https://lore.kernel.org/r/20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      drm/msm/mdss: correct HBB programmed on UBWC 5.x and 6.x devices
      drm/msm/dpu: offset HBB values written to DPU by -13
      drm/msm/dpu: program correct register for UBWC config on DPU 8.x+
      drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on UBWC 5.x+

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 66 ++++++++++++++++++-----------
 drivers/gpu/drm/msm/msm_mdss.c              |  2 +-
 2 files changed, 43 insertions(+), 25 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260117-msm-ubwc-fixes-350f67d860d5

Best regards,
-- 
With best wishes
Dmitry


