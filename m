Return-Path: <linux-arm-msm+bounces-83644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D1900C8FD10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 18:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6F6DE4E1E5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 17:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53332F4A18;
	Thu, 27 Nov 2025 17:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQa1FdJx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wjz//aVV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436072F39DD
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266291; cv=none; b=HJmjSo30etOC9mSAHLNdlgu7kqKLaeCcWjPdK7FFfvOKFErjOxu+RPuGMvQqJm0Fo+lMco01cfllGh/5E+XRX+Oep9Z2nr0U/Yi0bfVtsCWdD0Lu7isDj1+r6oleNIq2jVf3UffPgh/quwqPeXdGKBDgoJwRS+RFTAfR21Zysos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266291; c=relaxed/simple;
	bh=furyDZlmLc3xCTAePhEJDZM34ZMnN5QvUae2oONszpk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wql+jXM6s8esgOMpgg5BOQEOi+Urqt3xS7SGmrbxXakCsYAdqMUSWUFNEFVyeetpa7gneljFABTpSAKKnJPr7lEh+L4E4iD6q2edqf5ARGOSKwZmG4RSYlWdW5Znz1+uMvaOnGzVqkyFWeMKZgrG1aB7T+SUAR9OZmRG/uDxkF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OQa1FdJx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wjz//aVV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9GBVE606822
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6qfQ0xhMaDEiBsdpx9O2N7
	A7GMeP6biSSr7Ux58azGk=; b=OQa1FdJx422vxuFB90BRbeCXc69mcyYgCwHmaM
	GF+JqjPuvAHgBWeb7iH8fixDE/Mw2MrzP/Mim7UxAT/RLCs+hMB0cxKPE6YUN83R
	FlWncmQTDLn3LVNF9OJGzuTwLLRyhTHeG6SNAq+7IHn82BKULFb3HnOLi2bLaBvM
	NnqW+0uWrk9jElS2AZ/vbVqxdrOzYgRhKuONlMV/xC6BOVTUbCRV9Tg7FcceJFsR
	fX9DP/LGIEClzqvYEGWew5E/LxrPGD/BIRZZ6Skz5A4v8nqT/17jJGmYduOYg7n3
	+TwDPvDqax2Iyk/ARl8gDDxVVkZDh/Is2bdis149qstPbkBQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apkv5h91f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297fbfb4e53so16506505ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 09:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764266288; x=1764871088; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6qfQ0xhMaDEiBsdpx9O2N7A7GMeP6biSSr7Ux58azGk=;
        b=Wjz//aVVCnFdhl7NPXxmnbLhkkn4ivsoj+vXiPA805ysP6BDmmqBh84HOZdLamLyFD
         nW8/1Jkq4s8Oy9TljeMbMDsbt9ifOU7uD8bySRCwtvPT2Vqlg0Eq7L54UtMcTJMfWIYb
         pD5r4EeAWHn+ykM+Weqr6MLdEmB7cawwG6zbSMm9mvYbsizyRo69z69U/Tv/1W2ce45Y
         e3VcdiMDTQn385IJDFVJau9FjeJln7+wNf+dQnGFQWhr66GxjJswVQZeZ/VEqifVSk35
         MhkQn9pg3629xwZPGzbi+LoM6hNPFFQq+QLRUE02VmgWYYS1H9MPgQ9pyyW16to6Ffze
         BJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764266288; x=1764871088;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qfQ0xhMaDEiBsdpx9O2N7A7GMeP6biSSr7Ux58azGk=;
        b=SxDN0FZQaMj0bXKpDDGr8d9+DUlg8ey+fTi2Qv2szOoPB5W3XbhVXxcAgWLTEKskUr
         8ujmJc6B+vnuZw/kBHazh32NG7cnokPV1aOvBh3kf8TzsLmD9mNw5BkfLWGSAx5hrnw5
         8LQrR0FJ9i9Ox70oAGmcVk42G03xm3c5Ml1troZOVjlAbbiy6Yd/ZVrgis7cyCPaD4Ig
         UruDnMG18xQXxKZZI6YgE2g6v527C5TZSnlP39ii3YCeNRUOxEwlIpmDT2SEx5xC8nWe
         t84lMU7v/aPO48Y8iH0EE1mSk5RAEPzakBW/GujiZChR1aGHejrJ/gTA3FpQun1YjuY/
         YRQw==
X-Forwarded-Encrypted: i=1; AJvYcCWysvOgeXtIUUxiBTmUYl+yYx3WcfXTeJv1bHQhmSTO6uXpe7wg0diLn++7cqouvJi2myn9ZUXhiawc6y64@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxld7qEROiQSxfM+9f0nmhT1qCPPEJH7kivI4GZ7n3S8sqzHUx
	13F3aFl1lGmfJSpILfNG1Ta24t5UKwtMSLJStPf/f7rUMnebc06bOlGARYbyFZsTGRZ/H4bGCGx
	E/i4/OgelEcCUO2EURIypDYF1rtAiXc6j8iqksQyYIjjwlDGPgcFAsQ2wpvWnpKHonhMb
X-Gm-Gg: ASbGnctl14qqjEfTS0h1JjbibbmZn6v0e5ndvJ49QikSwht1Hca8/hgT58nFoKtANNO
	DIhw/T8IFADCpVe41QeDOGKDJphOPwMC6n2EiM68kaxWsDm8gkEw0mfrQJvTDTsojcZdJdXGofw
	AINHADl5XqOgDNuiIRHv7UhI4LL7vmjvvm3e9pKerWjkbELmxnWrHkvpaacYRzxT7HdEmB1jlvl
	yBS5ODg/ZpfsMzrKivIdopidu6SWbBHhC4toKk2WjSWbh7/z/Txtl/wEfkw+3pfZzO8XWt9JC/3
	pGxLo+YDWrmrwXfz9Ca8W/KRo+MX86fQBtIF7ES5XnK+3sWKe+Yn89FzS++wqo3T3yT+4jCM6Nr
	Yn/NVucgth37MF09/BTMEpypQfw4N2a8r7wk2ZvPE
X-Received: by 2002:a17:902:da82:b0:269:82a5:f9e9 with SMTP id d9443c01a7336-29bab148972mr132276145ad.29.1764266287973;
        Thu, 27 Nov 2025 09:58:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzJeN91LKau7SoWOtLpVjxnPCY44Cl2b5fLY8v/1Q6yZRgBXgSa5jCAeyFPktaMjvh9Rt0Gg==
X-Received: by 2002:a17:902:da82:b0:269:82a5:f9e9 with SMTP id d9443c01a7336-29bab148972mr132275945ad.29.1764266287481;
        Thu, 27 Nov 2025 09:58:07 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce445927sm23785535ad.37.2025.11.27.09.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 09:58:07 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v2 0/8] clk: qcom: gcc: Update the SDCC RCGs to use
 shared_floor_ops
Date: Thu, 27 Nov 2025 23:27:35 +0530
Message-Id: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA+RKGkC/3WNwQqDMBBEf0VybiSJWm1P/Y8iIptNDahrs620S
 P69qdBjLwNvYN5sgjF4ZHHONhFw9expTmAOmYChn28ovU0sjDKV1qaSbAE6HvqAtnMjUehoYVk
 bA4DgsG5qkbZLQOdfu/faJh48Pyi895tVf9uf8fjHuGqp5EkVTVko69CWF2LO789+BJqmPIVoY
 4wfgxS1Z8EAAAA=
X-Change-ID: 20251125-sdcc_shared_floor_ops-722ccecfe787
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: k5ezh5Bm6ykqyfJ4OvaCwPpi47h9NYcl
X-Authority-Analysis: v=2.4 cv=O8k0fR9W c=1 sm=1 tr=0 ts=69289131 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pguQOEV48Il3LvxSDVQA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEzNCBTYWx0ZWRfX1KtV4Gczztcz
 1JVKXcWnO6pjwY63UkhxnHgkW7x2CuVD95fUW0q9Hw56CkkHuLvJ7mCdb1uLN8BD58QE/ZWVOit
 fhIG8mnyJ+Im70NslzFRYHw1yVNpne0b2Z589a8YTYz3EeBY34WMFulf+XtXUsKOtm5KwLkwQdP
 bVQuauccw6fbLpvAUU3vidz7OXcQVhw37jfET84y2FN0cNCa3CgBDT9t5LorEAnvsG9MzFnLn5L
 bQeAszZHIYCRkZHdGCz+538L95aE8bdiV6VZU8LbqxZl2hAXfNa4bm7Mo7WoXsFWJj1iQ4qEvnQ
 gky8/Z3++uJ1ehnwVTaUW8zDQ/aLQGcv2YVJnMwXbSLVh0CGnVRVbdn6un8PB/TbAL1dt5Ih4dw
 UgCnYuY/gB/3WnoVJeSp/qfdoIF0HQ==
X-Proofpoint-GUID: k5ezh5Bm6ykqyfJ4OvaCwPpi47h9NYcl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270134

This series updates the clock ops to clk_rcg2_shared_floor_ops
for the SDCC RCGs on SM8450, SM8750, SM4450, SDX75, Milos,
X1E80100, QDU1000 and GLYMUR chipsets.

This change is required to ensure RCG is safely parked during
disable and new parent configuration is programmed in hardware
only when new parent is enabled, to avoid cases where RCG
configuration fails to update and overclocking issues.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Added patches 6,7,8 to use shared_floor_ops for SDCC RCGs on X1E80100,
  QDU1000 and GLYMUR chipsets also.
- picked the R-By tags received on v1.
- Link to v1: https://lore.kernel.org/r/20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com

---
Jagadeesh Kona (8):
      clk: qcom: gcc-sm8450: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sm8750: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sm4450: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sdx75: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-milos: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-x1e80100: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-qdu1000: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-glymur: Update the SDCC RCGs to use shared_floor_ops

 drivers/clk/qcom/gcc-glymur.c   | 4 ++--
 drivers/clk/qcom/gcc-milos.c    | 6 +++---
 drivers/clk/qcom/gcc-qdu1000.c  | 4 ++--
 drivers/clk/qcom/gcc-sdx75.c    | 4 ++--
 drivers/clk/qcom/gcc-sm4450.c   | 6 +++---
 drivers/clk/qcom/gcc-sm8450.c   | 4 ++--
 drivers/clk/qcom/gcc-sm8750.c   | 4 ++--
 drivers/clk/qcom/gcc-x1e80100.c | 4 ++--
 8 files changed, 18 insertions(+), 18 deletions(-)
---
base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
change-id: 20251125-sdcc_shared_floor_ops-722ccecfe787

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>


