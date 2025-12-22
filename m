Return-Path: <linux-arm-msm+bounces-86252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB8DCD6C9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 18:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F3013005038
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 17:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EAE634D38E;
	Mon, 22 Dec 2025 17:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8aZRTTt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LLohvLkm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69C634CFDE
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 17:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766423305; cv=none; b=psPq+Je8Mv7viNGiW3BROJsU/YaPcdkl6UqQIr5OdaKsvDtnacfeXnEWBBWKwHBGAJsYeEqnvAHjxOZQfD1EaVYF8eIZjSmwWutXgJBox3VO8XfbnW2m3oOW+svGmYL/da1eO9hr6+ZZQ04x6D8oMIjKmXLOWG+3EjN44PH7muk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766423305; c=relaxed/simple;
	bh=yuU6e2e1qZAfjqJxAR2lxB+hua/aywi4MlVW193eIY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aU60weeSQ8MYFipjZKhXUqudp1JU3M65coLiQS6nSsj4CQQNrRVGUrG5F5uZcU2rxDXA26Ca5OphseDVPbTyhlsPu9wWNnfZ0BFUKAEz/xjEmaEOmc3uC68IsNDY4fGbf1G28uyqAlvsIQ+hNPrUx4GCLct30y2l4NJMtzsJd1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8aZRTTt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LLohvLkm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMEBw0a1568783
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 17:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uTJu74kOrD+Mhqkhf+/YtY
	rkCua8e6faBgar0XkLxRo=; b=S8aZRTTtflFDOmze8vOzRZTug63Skr2gyWXOpb
	OffiUxIl5oNZCMMUZa04HTcCciY6IdMvKuLwlM+RUFjz5lbeJX7Uyzc5Ba2bMqPf
	oQvbhHBcMh2ZavbA83C2U0p9GIklyKPgvREKjnZAjqbHigc0hOqZLVJ3TfFLZNr8
	pF7WkMi2SztxV+xBohB21/c1FL+sOpAfgRTZkzzZb1OhNVTx1dFs9jcwCXZ+59bI
	+X8MJXoOtRBFhBhnPj62Eiai8YyAdYnvmqLAPsRo9+DV0DFPRC49l1C9iuvw5w/6
	+kF+eaZgvNYHr5nMzyqTXjvJd8Tnz1QCUVa6OA1hgedYXypQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b76yy0kcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 17:08:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7fc82eff4adso3970206b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766423302; x=1767028102; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uTJu74kOrD+Mhqkhf+/YtYrkCua8e6faBgar0XkLxRo=;
        b=LLohvLkmfFK78HAwveZyRNtuuOkoBwu7DHQCIJemISLWt51qcvGnnw5HD7Odc8U3wf
         NBVbMLi2Z6TDDsK2eNSGtbup7TOkV82JU1+FpeYowacAq4RvOYafdm98NW2362S6GxR4
         QCHQRYZpbtmYs5+P2umJLpzu6Ly5ZxGRYWKVHSN76OUren5ip3I0FnRrUcIXTADRv+TX
         fLprU8Z5uEa2ArHo0+0cRzXAneE8y0wfaVse5Ns4/SKQy7FSOErQKxKOWjKkmS3mubHD
         GGLYqCNubk4gfSz4ZGG09GrZ+0wxfr+aV/ONmDrRTL2k9yzI9Prxq/qmIbxSGYuOah3P
         C6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766423302; x=1767028102;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTJu74kOrD+Mhqkhf+/YtYrkCua8e6faBgar0XkLxRo=;
        b=YMPST6icWgEAoJpp/tfZUd6CqplhY12qefuRMGQI6rAyFewT+OrolxoOtmjVTpZDre
         98g+pnLZXfYgmTesUGUC/noBu/TR3/dLLSccv7L+jXNFjfdKyf13IG+sMERiZ0Mmnl5d
         zr48iwdLeQByBRPljgXdOeSQD148oGYSV3ExqGXf+S6Llidk3KvlVgb+EGg8tvn2fa+E
         GmA3HXby+yB1oO0anvxCUyvsbMT7Blkm88GUnVZY/VP60xsXR+LA/sNPdzdo51b9C7IH
         JDKivJGVPBsOe4MrmsJMDCsgd7YetpVvDI9rMR8oCHQrtty3gj4EQ26HseNoJ5I7ZAyE
         KjLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeV8HreBJdav+vYzbZqSQ4c8VcA4althiM9xHCE6P8+Ggk/7PyWlX7QEW7Vte375qHvpZ0NfFJxwNcLV+S@vger.kernel.org
X-Gm-Message-State: AOJu0YxAihptzmXUb2WleDcpK3y5j3GaT3A25kU/caXaIh75YLQ2hKo3
	5lpSPLFhBQO3c7dwtvqwacojSjipDVt+vB2CVd/QdftHZbDr/swRNHILIGtEj0BdEuV1hzdbF1M
	bYyj/DsgVEILnwgClXqeWXySDc6mQlpFxc5KTaTkHzd4Ab66xxiKb4ZdADz/3WXRNtwg/
X-Gm-Gg: AY/fxX6WiW9rjikplk+SBpz4/DM9UiwW7BJ24vjz2ejtXDbSr+cOBvKuy/w4PHWb/+C
	ApWixwnLkdxuclRLSY0Qh+1+IcVYmTOu1RzoeNzzurlp8eavVvM7aOyQ6cy1qRIHsvPuyegr77W
	3ljK6+xTxlLWTpwrW9V7SoYGl3wHbbcpHkQKchDlqJ8Zzsf4kDhswxMml9CNOVRdXIqGnwoV8Y+
	pwhdjULumhy82+tFnqyQPNsfVTVW+Jp+XtSxtMUdVQlpvb7QnGzocFrqCnJjyQwQp81/p5Jvi92
	ULLVZ/A+qJ3eh+AsS7E2ExxobnSwe3GYlETkiO1HjXu8+VJBG4Pr+GEjm8yE9pUXvC0gaOdArFc
	gxIdeyecNgfs/NhztTBS4o0kzWL/KdgMsWA==
X-Received: by 2002:a05:6a00:4ac3:b0:7e8:3fcb:bc4b with SMTP id d2e1a72fcca58-7ff551df0c1mr11653894b3a.32.1766423302223;
        Mon, 22 Dec 2025 09:08:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQGoTkq6ENiYiLQXUVP+Xrflpg7TfjqSAtigwX2xx0bLzHFHk7HDNLAGumk7ig3V+Qu2T7RA==
X-Received: by 2002:a05:6a00:4ac3:b0:7e8:3fcb:bc4b with SMTP id d2e1a72fcca58-7ff551df0c1mr11653863b3a.32.1766423301721;
        Mon, 22 Dec 2025 09:08:21 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a939ea2sm10897176b3a.4.2025.12.22.09.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 09:08:21 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 22:38:14 +0530
Subject: [PATCH] clk: qcom: rcg2: compute 2d using duty fraction directly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251222-duty_cycle_precision-v1-1-b0da8e9fdab7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP16SWkC/x2M0QpAQBAAf0X77IrNEb8iXWdvsSV0h0j+3eVxm
 mYeCOyFAzTJA55PCbIuEfI0AZrsMrISFxkwQ50jonLHfhu6aWazeaY/UFVd6gJ7y2R7iGk0g1z
 /tu3e9wNYNxqjZgAAAA==
X-Change-ID: 20251222-duty_cycle_precision-796542baecab
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE1NyBTYWx0ZWRfXyD0aBoJXI+xn
 V67twpG19trCq0UNURQInaTHdPmBPzDPC9zMzxY/u4dinElE6cjDqHvHP0ioHOcxpUNcpxQ3ncJ
 d3Higpgd2CEoyUeqcHy7dsISOYY+6j8Iihb9nzBnROH14CqQuroutg2SSS8Ic5WnqwQoGzla70r
 tN1c6U0pNEb1YXjx06zmiuTStYH9SEU2YUcaPQZmbRsbHF7VJ3Wm1y26U30rDJHzmwB1/DCjHPB
 8LEgsMso4CO7ggrBtw0XpDr2736UeYXy2fW3l7fqzyTbmaXAAhwr1n1PCMFOjPGXe9KJZDxwLiG
 yfbBcE+4bNSUBRRs2p2ntn1Fwz0naUSYoD26RR1iPAgvChaTaoHMN6J1jnjRoveRN6Wa8jwma8n
 FRqI2P9XXqHh9hjbFrFf2OFeByFNMRs9k+dPxHtG6KG/h+QocT7W0H0nTCYsSjOO6AGT7lp3fsX
 Ye8tg4miC8YLDinOtuQ==
X-Authority-Analysis: v=2.4 cv=Zb0Q98VA c=1 sm=1 tr=0 ts=69497b07 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=igsz0PQQFTjIY3ArcIwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: nwtE8s4FIsNRplNf1HAEmAQBKnWYVAlU
X-Proofpoint-GUID: nwtE8s4FIsNRplNf1HAEmAQBKnWYVAlU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220157

From: Taniya Das <quic_tdas@quicinc.com>

The duty-cycle calculation in clk_rcg2_set_duty_cycle() currently
derives an intermediate percentage `duty_per = (num * 100) / den` and
then computes:

    d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);

This introduces integer truncation at the percentage step (division by
`den`) and a redundant scaling by 100, which can reduce precision for
large `den` and skew the final rounding.

Compute `2d` directly from the duty fraction to preserve precision and
avoid the unnecessary scaling:

    d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);

This keeps the intended formula `d ≈ n * 2 * (num/den)` while performing
a single, final rounded division, improving accuracy especially for small
duty cycles or large denominators. It also removes the unused `duty_per`
variable, simplifying the code.

There is no functional changes beyond improved numerical accuracy.

Fixes: 7f891faf596ed ("clk: qcom: clk-rcg2: Add support for duty-cycle for RCG")
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rcg2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index e18cb8807d73534c6437c08aeb524353a2eab06f..2838d4cb2d58ea1e351d6a5599045c72f4dc3801 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -755,7 +755,7 @@ static int clk_rcg2_get_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
 static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
-	u32 notn_m, n, m, d, not2d, mask, duty_per, cfg;
+	u32 notn_m, n, m, d, not2d, mask, cfg;
 	int ret;
 
 	/* Duty-cycle cannot be modified for non-MND RCGs */
@@ -774,10 +774,8 @@ static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
 
 	n = (~(notn_m) + m) & mask;
 
-	duty_per = (duty->num * 100) / duty->den;
-
 	/* Calculate 2d value */
-	d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);
+	d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);
 
 	/*
 	 * Check bit widths of 2d. If D is too big reduce duty cycle.

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251222-duty_cycle_precision-796542baecab

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


