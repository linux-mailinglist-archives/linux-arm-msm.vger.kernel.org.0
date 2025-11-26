Return-Path: <linux-arm-msm+bounces-83361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 816F3C88056
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 05:16:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AA453B0E96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 04:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7DC236437;
	Wed, 26 Nov 2025 04:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBgNYPVo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gGXjv86p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FB72248B3
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764130565; cv=none; b=Lk5YW3FO7goonGh5kSNdLAQKFp7rMDn6PcR5YJnCNVN21/HPap1Gvnf76A0yom3TV08jHDhkCWy62JucJAKgtGom/IZlezSAm+QexWbKcyXls3EhhU/SnkbkGT2DnckLSG6gZT6AaOBdVwZOAYNpOOERLL4lFn2DmeIJpo2HeaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764130565; c=relaxed/simple;
	bh=PiGNHUw9XMrK30QdDmuUWjmkKzuZ05XoeRwTVilrQmI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XL82nTGa+xzbW9vrlrmlmRm4EYP9cOhexLzo7ulJNichHvROTq0KTrRmnd3q0kRpetfk2LIYPHRRdOu9Xidgr2dcR9fbnypkHzVQsVoc5MKWOOHnwZOrol3NBaNX274AgwI+RsU2azOLM+tt8iXMiejyyyOoUtX+lWc98XLVhNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fBgNYPVo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gGXjv86p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APIdnow2659009
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZeDgF8LwHhTMSDMaF3nHNi
	djlnubsXwQ1NaMfVo0yTY=; b=fBgNYPVokiceo87dEGCIQ4AeJ8vJP8VDp3n8ll
	+oqwiyAGfIXZdhtfeS96tPxS80WkuyaEThlN6nsTTeZmu0Khtubpyq5My/lIB8us
	sY4+96X9pM+bgayu849VqVPIAWUAOLpZWF/pSCKhfyVHb5YzXFmiGnYe9mJfBGKX
	+IW+POkDJG5nrqFZOmY8gea8hURgaGdF8VPXfE4JSSeS0YP0ILZ6YElS4mJ29sxA
	Mt8P+Yrnwoa32oMNt77gs3UprTSV3qPytEBdMmIBl+NAId8BMLxNCQApn3AuvORE
	3A7JfCV6mL33Fox414Qk9fuHjIav0VGxMjLSQnACUXW/22ww==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ana9xaqqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:16:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2956a694b47so91230995ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 20:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764130563; x=1764735363; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeDgF8LwHhTMSDMaF3nHNidjlnubsXwQ1NaMfVo0yTY=;
        b=gGXjv86py1m38QsYTSP+bC1S1QlIhpIxVHT8eT6rfnpgsuV9a47mteqx/OM1GhtUCJ
         qu4EOQI34XpfrfnuI8QTCG1Wn7z0BMInbvlXQUdHnZ+u0Lg0kOB/boTCL6m0Ndwp4OQy
         hM08kp3MLHvkCTaMnIbaLDUxeUUEf/44DGkE/gOBN6xU+IN6n8eaRoAhQ1D0tHcgxLJZ
         XHnoGmAlD6OIdK18j/ESmSFk+WPulZnVhN/3Qn0M4Qb03E6wRDA7wNtN1daJDOf/OxJc
         qnu0hwMEw4kp0UnULxUbnE3RDtXXf+U+dusng2I+ss64/BpCrWUDQMmL2WoZhUdPpCz0
         XBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764130563; x=1764735363;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZeDgF8LwHhTMSDMaF3nHNidjlnubsXwQ1NaMfVo0yTY=;
        b=kjjvp5Ceh5p2ZLZhCl0YH3AbIf7anHs1FQz1T2WifRX4VsIl8VzBZ10OZQ9c3tOjR1
         PhcmbKtk8Fc35+atltS9fO6Oq0qNSFclbzLcSeiHCskVa/mvbpggvjRsZiVY1QDC8Uj4
         sPpgBdC5XJs8bW7BPDaHpD3E5/f2TrlV7FrEZH1P/AFxvIza5QDy+sK2EHSNBZyeSOwt
         f1efjrfTcd92edT+iv6G+k23gLCbKMq+r+22ePwQojdVBl758AI0qKTzDiQ7y+UkdM2N
         CPFEG/wQI2uwzMYU37wQ9x8UzDZZIWTCw171E20M/LtbW+oiXTx6U/SS8cheTvV9nIFv
         7NXA==
X-Forwarded-Encrypted: i=1; AJvYcCWAlIOeeKBLXeRGr2WHm+NjTNptiE2UlNKftEE/qw6Wrd/z4mpUwhmmb9GlZBwXBx+rGX8hEa/0aKmuifzc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+jITaQp0Hm1UEGZPcM/fK95icQyIyJjp99dE3geiULyy0HfhN
	0QJ8INtH1VunTws1zR0dgqCgCRWAZNNd8Q8Zls1O6k1mQuzOrBfIkxcF5uoDcAYQFYgMhdYYdTl
	WF7H1rPE7s9DknhS1g0i1bVUilOKw3h33XL59qjxUo7YjtZLpIV/Jl/U8QCk1lJPUH6k1
X-Gm-Gg: ASbGncvf0DfXRMjPduTa6Py8u9MIq+53bIbwXdQ2tQrT2bWNGWeBv9nl/M6p78VmHzA
	A7ceGXHKG3SxWlomgJoucQP57ZpPsaMtlpXgWue372udwLYQvD3unailmStISQ2yGG0MGsw/GP9
	JBR76chuebh2Bt/OseA5H05zaShGo1XrSdWTEQOTzbZLxkkWdu7y5I3F8rmo7Hl1BTgE41v2ZrK
	u/DTE0ySvCguefVhdE/n66Lhn9NtetCz4LRuqNArtAHUT/yNzlaneT191II5PY/9vZC8Wy2Pt+4
	iASGY09Eus7yzX2YKW0iWYDLaLOewn0DJK0s0Q6zvnXzahuC3acRIuMSN2uktYlUR/DSx10xNOB
	v/0dg53/EnuBe38nBnl5brTUpFyAgef5GksbzpUEN
X-Received: by 2002:a17:903:1965:b0:298:d056:612d with SMTP id d9443c01a7336-29baae4ee80mr43384885ad.9.1764130562600;
        Tue, 25 Nov 2025 20:16:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0zO21EUR7igpUZqkVWR24CzZOQQzxtJYJt8DHVxe80Uzq7+xMftvrJCtrB1dwHIFlIRFekQ==
X-Received: by 2002:a17:903:1965:b0:298:d056:612d with SMTP id d9443c01a7336-29baae4ee80mr43384545ad.9.1764130561943;
        Tue, 25 Nov 2025 20:16:01 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075basm179300125ad.21.2025.11.25.20.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 20:16:01 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/5] clk: qcom: gcc: Update the SDCC RCGs to use
 shared_floor_ops
Date: Wed, 26 Nov 2025 09:45:49 +0530
Message-Id: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPV+JmkC/x3MQQqAMAwAwa9IzhZsQCp+RaRImmpArCQggvh3i
 8c57D5grMIGY/OA8iUm5ajwbQO0LcfKTlI1YIe999g7S0TRtkU5xbyXorGc5gIiEVPmMASo7am
 c5f6/0/y+HwwHjqxnAAAA
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
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: kMVq2-SC1_tfA53RDzxfDUcSAmwFrnrY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAzMiBTYWx0ZWRfX3GWtNSKBZQqr
 TxXC3xp4eIw90nbCYVsIJmimIuoZuzjLfjXaBSTfKYr6CIk7qAvqSyvO9f4kG+MYdb8JV0y1xF7
 G4mOmAc03hirzbu6g69RV+Dme39bqxtHCBGx+XzpJi00ib4C9XL+p1VIQDCcWOzuXwUNCOf16R1
 bvEwV8Mnqk1fKWXFq1hzofw3mlFa27lDaosMLbpByoz0mpeP7E+rv+pUnY8rrqht2xRSpHIHsZ3
 5sbK8CHOM8Zp7wGNB7f0VW7JUtX8lKBvSJO+mp6afcnJROu/XGsgVEa25kqDr8Jod+FysayCpy1
 uVtWzZ/jaEchNF7Hn1PlEqQBWgZ5EoaWPdCSDeC9o1baksRNT56XIYPRy9buDnK14kxlNp7ZfHT
 8c5S99tL+Y3WtyEUPM7VopCB0e+rOQ==
X-Authority-Analysis: v=2.4 cv=Sfj6t/Ru c=1 sm=1 tr=0 ts=69267f03 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Rgt11g4jKVTE6uy0-YEA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: kMVq2-SC1_tfA53RDzxfDUcSAmwFrnrY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260032

This series updates the clock ops to clk_rcg2_shared_floor_ops
for the SDCC RCGs on SM8450, SM8750, SM4450, SDX75 and Milos
chipsets.

This change is required to ensure RCG is safely parked during
disable and new parent configuration is programmed in hardware
only when new parent is enabled, to avoid cases where RCG
configuration fails to update and overclocking issues.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (5):
      clk: qcom: gcc-sm8450: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sm8750: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sm4450: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sdx75: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-milos: Update the SDCC RCGs to use shared_floor_ops

 drivers/clk/qcom/gcc-milos.c  | 6 +++---
 drivers/clk/qcom/gcc-sdx75.c  | 4 ++--
 drivers/clk/qcom/gcc-sm4450.c | 6 +++---
 drivers/clk/qcom/gcc-sm8450.c | 4 ++--
 drivers/clk/qcom/gcc-sm8750.c | 4 ++--
 5 files changed, 12 insertions(+), 12 deletions(-)
---
base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
change-id: 20251125-sdcc_shared_floor_ops-722ccecfe787

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>


