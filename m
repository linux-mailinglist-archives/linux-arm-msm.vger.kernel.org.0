Return-Path: <linux-arm-msm+bounces-84760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E63F7CAF54B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 09:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA79E30562F6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 08:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBE32D6E58;
	Tue,  9 Dec 2025 08:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fd0iw6dW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WfPPHj3Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252422D6E6A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 08:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765270182; cv=none; b=cZOqfWEqy5o0ErTJndGycoHEejjTo8Oy+LzHB075Uvw6E+Rlfblrj/uxk5zbZtUfNTXe9Ayr6TBVOLbcOH+HNcw0KAgrdqCXsESCQrjHOrCgaT3I887SLP8AlZrp50QCxJRnw/7tjhbAR6cpghO2xfLz/n1DDgQ3AG+e0yx/TIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765270182; c=relaxed/simple;
	bh=kDDkCkrxsEdPuzWXXMNlKktMJ7QnhN5gS1dMjDFOOvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fxHvCMvsixsbU3zaAVVRB3OGLsxydkawKHnBzIX2TM92+2kv307FbSL2Dnw6+jRuF9Pz/S3ktLOo15z/7Ueqtlj85o7xb9ui/MzIoiHlo5coFkAWD6o9uHFtR02SKoF1gpMpUKqdcerJ1D9dOmJfQeTpTas6b8Ba04F6q3jV400=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fd0iw6dW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WfPPHj3Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B98jbLC2474985
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 08:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8r/OCV4JzdrTmO1P2Rr184RP5VV7Yro/chUDjDrzwr0=; b=Fd0iw6dWQkVtEwZj
	mX2bbb2V4KPckgNKJfavBw40KAOd2BESvPjKyLqSNGTgt+RL6vNX4RHTSWtu7BxB
	voBdaO+9nChXsTph1L6/jaGVPmkHcOvDZ/6qK1rOVg+zNRSpwGuHbcLqny9fgSs6
	w14wLOgudN+s/qRxgqoExJlDEaATS/7u852keGxugK1vGqKGfS5EQqQVgLXbJ9++
	9cwAfOWhxuYFC7s+t1EBMsd/EFpJy7rJGBl+nkK3fsGtDYPyhT1znjm1gM2A44JM
	HN/vB4sDXz+OvP2WebdShMBwhWrI1U7huCbEelokPbvtaLDhyqXp9bBpgayylAph
	SFLIGw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axesf0b3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 08:49:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-295592eb5dbso99222205ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 00:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765270180; x=1765874980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8r/OCV4JzdrTmO1P2Rr184RP5VV7Yro/chUDjDrzwr0=;
        b=WfPPHj3QnTsKn4rbblXm1Qn3vxFnS4HK0BzeQPA22+jTmR31TBqmEUDzU37iPX2gw3
         gEFPdsSrb5YxZ1hOiZudiT5AbIrzaw3fgdSwU5wQwW4EH7pH0ImOLi/Mw2cD3XdjXqoc
         8gyAlc2DPg0FMI96mlm7WlAkccEEkyYrelDx7DTTWoR4YlDw0RxGwT4lA7J9IRxau+nv
         0H4Uou1ODa/u0pWfnU+3d3G6Z4C01H7eKo178WsAkySy6idZSosBBMe5JUZTzahsU0zl
         aTsL31axlwdJd0Jd6psLlVJv6vkuk1RkzTW5lpflXgvnp5dHV4V6ZpftDpvxJ3WNwcnH
         wXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765270180; x=1765874980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8r/OCV4JzdrTmO1P2Rr184RP5VV7Yro/chUDjDrzwr0=;
        b=jlkDIxfqKbaZUmgLZgAbLnHVFX8IH0+nxj2VwbHmL90OGd2a59d8P8DsxX306iFAN5
         xWZHRsy7pk8YxLeDnzFhBAGn5a4zRqc9Ys3D5IX4XJOWq77GRKwlE0xR6jkwfF8eacnR
         hV/fvDlK7r7irNxjpCfcWApGQg7hkUc3YRVRgfVL4JXrl1jILEcziwGLJGKai/yvvbht
         ZrkdsvxICzoP1XjH2jnnd56gy8WLYiR5NkWMcMIWStauPFH7Tom+QydhsINvY+x5DJ/7
         y/2+lnJDzoTUXsgJPHvSgIzkmm04TdHJKZfVndMAtRuNbsXW2RGh0AVKp3e09WKD/FSD
         S3ww==
X-Forwarded-Encrypted: i=1; AJvYcCVkkTCI5HelIbr4xRzPnsg88bJQAGPDcU4n1FGjMEBGCE2Lo0vr/Vf9/TlPtQDJ69igTwlDEMmAPqs1Le5w@vger.kernel.org
X-Gm-Message-State: AOJu0YzIsV9xyqvs29KqoryKfLZ0g8OP7P+8kT2xWKUxrJFkptKXF0KI
	TFoMS14OYe8twoAqvrhEnZe3RrNmkWz07lQXlZRSivvt02KhPi1qG0e/onmIVhV0b3d/o9CvYlQ
	Dpez6TTSlX3HKzRbw+Q5OvLuo2mJQ4i2jeiwjnSxJjwjQP+L/Pgo2mzSEW37HhxWQI4f1
X-Gm-Gg: AY/fxX4/W43Ztt8KqZlKYzlDCBTWyoojO8qkLBEj8PHHhz1a+xgWuyuM6Ni5GOYYkcj
	7LeST8HgGySFEIEAcKOSUBI9lh0qvV+jbsBHZm+Nrot2ee+LHvHAxOgDTsEgE7czPNfirbiUuo/
	5+YIiUCPuewHcR+PCQTNmXWXDKE+io0z4WuJRCKU6SgArHzf83YcIpRVe8cpjywCH7zLc82T0DZ
	xFjeXK6Ja0VestMbNvPQ3IY0RCgFzthyDPF1b0AGt+5ei6mECf0p9KIBfmplL41Xsmr/3kndmuX
	+qRH5BPNgFCjUqGTzBeMK5z1fOd97ytvbnCG0eigWbqkeQFJppvpGRi6tHhs0+DA0Io8Hb+lbLz
	O0UHe39DnQPHlzucSCL6RET00qVi6U51wIQ==
X-Received: by 2002:a17:903:1a43:b0:295:4d97:84dd with SMTP id d9443c01a7336-29df5deb3e1mr69478475ad.51.1765270179674;
        Tue, 09 Dec 2025 00:49:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0Rgk4ajgg/wOO9A9a5YM0UPafBpTNBIzy4nCpgdI40oM9gnVBBDvCVObQ/Vjv+d0EYwwC+w==
X-Received: by 2002:a17:903:1a43:b0:295:4d97:84dd with SMTP id d9443c01a7336-29df5deb3e1mr69478385ad.51.1765270179232;
        Tue, 09 Dec 2025 00:49:39 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f1cfsm148615065ad.55.2025.12.09.00.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 00:49:38 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 09 Dec 2025 14:19:24 +0530
Subject: [PATCH v5 1/4] clk: qcom: rpmh: Update the clock suffix for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-gcc_kaanapali-v3-v5-1-3af118262289@oss.qualcomm.com>
References: <20251209-gcc_kaanapali-v3-v5-0-3af118262289@oss.qualcomm.com>
In-Reply-To: <20251209-gcc_kaanapali-v3-v5-0-3af118262289@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: iMrJY5Lzo7jxI5UokuJXfBhdkUx3prFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA2MSBTYWx0ZWRfX4Y1vYYJtmWg4
 veazmO79gELbAejbv22RgJQ93m9R2jqtSey6hq6QpaB0PKZbssZFalPv/N+aWz2u0Qpt/Ba7UGj
 nHoukF0l16B/bpesx/cPiitHH5Qv+V45Xz5oe4UdfBtcwi1atnkdl56qAkbjhumYnrfzJXS/q5+
 k09NtZA7k42WRfs+fraABk/5CPvqDinEAmRM0dAibGzhfVz2HXu8fzxHL2kYrAiTbElO95stj1Q
 gb9Fmz7vCHoBrCpjhWEAjfaNtFYNufTp5/NfjByY1L51ih7lW9qV5vg0dIVHszuBZmvDK+u0J+j
 SBT7mozkPdxSk/AFbN6g293/Rr9OAuQFb3qkYFGF1/KSJdAl6Ogc5dc03RDMIsoPcbDtMxJ/CMi
 WrUzICWOl4SlZm5Lx/vBenVC6kuPNw==
X-Authority-Analysis: v=2.4 cv=fMc0HJae c=1 sm=1 tr=0 ts=6937e2a4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Qiw7p9IdSg9ZJVkqk1QA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: iMrJY5Lzo7jxI5UokuJXfBhdkUx3prFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090061

The current RPMh VRM clock definitions do not accurately represent the
hardware mapping of these clocks. While there is no functional impact,
this update aligns the definitions with the hardware convention by adding
the appropriate suffix to indicate the clock divider and the E0 variant
for the C3A_E0, C4A_E0, C5A_E0, and C8A_E0 resources on Glymur.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..a2185a6f321fb60ddc9272582ed67fa9ada6535e 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -390,10 +390,10 @@ DEFINE_CLK_RPMH_VRM(clk7, _a4, "clka7", 4);
 
 DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
-DEFINE_CLK_RPMH_VRM(clk3, _a, "C3A_E0", 1);
-DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
-DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
-DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk3, _a1_e0, "C3A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk4, _a1_e0, "C4A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk5, _a1_e0, "C5A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk8, _a1_e0, "C8A_E0", 1);
 
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
 DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
@@ -888,12 +888,12 @@ static const struct clk_rpmh_desc clk_rpmh_sm8750 = {
 static struct clk_hw *glymur_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
-	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a.hw,
-	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a_ao.hw,
-	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a.hw,
-	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a_ao.hw,
-	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a.hw,
-	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a1_e0.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a1_e0_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a1_e0.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a1_e0_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a1_e0.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a1_e0_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_glymur = {

-- 
2.34.1


