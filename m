Return-Path: <linux-arm-msm+bounces-102085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAjpLsDP1GksxwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:34:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 134CA3AC17F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8F8E3038290
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 09:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504AC39B963;
	Tue,  7 Apr 2026 09:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbH9fGus";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itEwDLiF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F6238C2D1
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 09:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554299; cv=none; b=GMgGhCpX2dTO+GiMJypnRFfLz2pWrMSnkeFMV550ij2qFA6sj8U5VPyc3bvp9SY0to49V7I4avBIAKsaJugJa7JOzML2pdhQdqsAhydgY6scKMjAx1bSqX6s9aPzLcVzoo3n8wYIf4shvrTZ+pCG3NbWw9Q0rB4LQ/A1E5w0Iu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554299; c=relaxed/simple;
	bh=5NO0Fd42towIS40//QdgD2H+fOt/M3cbf891ePrQMCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hot+xEQSLlJIF+tAXLjLkH4+NWhzfD4u5/7LxKWjWT62RFzy3vbNT7MWsJJ6/VbI56xOb0bNT7dVWhlJerVfkk9zdSE0XNxpWb+MHw+JKtZQ9Fq+ur7tpk9kUQF5VldE4Mgvfmw2Hof9XXscAqcj17quhsPOj3wdH3gP0J8qRWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbH9fGus; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itEwDLiF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376WlZM1584681
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 09:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KK5gjgnaalniXHVQETjquADftfg1WO+N6PsIIlecERI=; b=bbH9fGusY9Nosdil
	zvPpKkdKOk9iwDUSH3MNOUa3h7rm0A4Fhyo2uKZX13wI+OXgkOy1jWXzo2tA5ZPG
	b/9mZ666FH44XDFmteP098d6D/ZDeKo5/KzP88OY/jVdpG82zifEKuLFw8ReDg5p
	8Ij7CvYQSU88KUC0nuF4ePeopRqF9eVzNWeFFTVduxHoH4L+mWCX9bGbhKHpX+2O
	oCdYri0USs5e2US8vLQH2vBLLIrzAABJ0DYjAu94IzZ0W+hQ0wrVqV/hGnqizYmU
	iA77W9tHgERWUg1BRUXG5t+8k79cn+Yh4v9XyOe79jmyPHBCGUDrQSjn3Ou+qm4O
	WPO0Vw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9t2jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 09:31:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b242062308so112534745ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554297; x=1776159097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KK5gjgnaalniXHVQETjquADftfg1WO+N6PsIIlecERI=;
        b=itEwDLiFTLU/DN7VL8NXRIdOxgYETCkRuoRCDGaebGaz+eKQmGxnrugFCeJRId2L0T
         lqqRLzY4unLO1p8yV/KRMsk6AFNxtMNQQdZsnvsXlE1TJ6i3kLPV55MEC+6b/GbyqNft
         hB0+imxQVAp92dyb7Ovf0Mus6Xf/MI4+Ws6VFwGuPhxAx2CVbR/W5mVarMHH+Nb2t2Q3
         AQyiO+opuGwNkg/nb0QhUt4eJRZudNpijl2iwJm/Yu49n77uuyFNAdfxvlmwz4tEdUkz
         ccOwuiPaXwb+F9pD89dLTFIyq6WKhfVGptzjCIwl0gfPVHbdYDpFlrkrcdy3c7AiBAO8
         MWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554297; x=1776159097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KK5gjgnaalniXHVQETjquADftfg1WO+N6PsIIlecERI=;
        b=GiiCT3f7zMtI+V/cO5F6YrA9bo+uktni58wJ4fq9gJ2hABm4F6ihSwDRgGMbtk9F9O
         1qkRBEB0TAmRuFwbnMlI2hEqS1oGbIo84n9UIV8lr9Hpe4r0yB5BR0W16JZ+yBQX8XBa
         7AK14aOcON26lesc36VFCv0U81CiJVwRYEmAkD3tFfOTVdvWHEVdXzH3cZXAY44OzWGt
         6pKzMmDXx2cyNqjWrfNg6U/y/kIkchyi04ulrTq2ZyLd5I9FwMfCJv0zBnQovP7mNwG3
         wNlp89Oy4k1SpaWuS6D/TxWYBjH0BuuEKR11VFpCQioNkGjqFBiL1nWcv89NDcmZK413
         F1pA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ3/PHV9P+dvQrLzg0y1PXn0oZQQfGo9o9k6meeo7cOdv+aZhch1rQwWTizJfUmvyrJmeh2Kco1xDdBIA8@vger.kernel.org
X-Gm-Message-State: AOJu0YzhfBMbsqVTISQevLA6xRpojbgtodDaJXRoJ16po5cs6QyzjLAS
	crP1OsrmnUb2eb9ug26FQ41PXkTP3GbF217K359WVPBG277t4OusCx4yRi/XBDvhLG+y+wFWcWO
	xyP6L8fKz98rlHou3evJ2nGpGOwW8+BKmNPfsd4qn4Aguh13xKr3+PPlltm2Wr9BPZTdd
X-Gm-Gg: AeBDietuJbPsoPeiXgu6f34B1HxhFZ981Tav/B4eTSPcbIgAjWJH+01UoiwmMrZK46/
	Im7gZgslc0bpYIG4V4eHMGhllJo0c80i9JM4b5UnbghU73NiZqhL7HHnwsI60cOTM17gYgLNV19
	cwV4iIZOq7mSdia0wH04enFCKjR9dPlhiAZfNpenTw3CbgF9ag/ysy5R7NHRd7N/0N6Ci59X9fD
	9yssUi604+ar0ISnE0V76Rk69qZJw2GvAnMc104DTUJ2YPR0RtoVk5CGixiINT0b5q6UaXDfqTo
	9fFkvBgSU3Od1iTADfw4Eo6OTInNfcI3A6d9kBS1TP3wS7izXJh03dlD/clgKLO0eDw7pjgzqpy
	ZZTiP8pp69rXH1zTNghKznd/111rWSpifXRAgqxK2+0R5gA==
X-Received: by 2002:a17:903:2c05:b0:2b0:6475:73d0 with SMTP id d9443c01a7336-2b281854f0fmr177278735ad.12.1775554296695;
        Tue, 07 Apr 2026 02:31:36 -0700 (PDT)
X-Received: by 2002:a17:903:2c05:b0:2b0:6475:73d0 with SMTP id d9443c01a7336-2b281854f0fmr177278225ad.12.1775554296196;
        Tue, 07 Apr 2026 02:31:36 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478bc96sm172888365ad.33.2026.04.07.02.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:31:35 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 15:00:52 +0530
Subject: [PATCH 2/6] clk: qcom: gxclkctl: Use custom disable callback for
 gx_gdsc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-gfx-clk-fixes-v1-2-4bb5583a5054@oss.qualcomm.com>
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
In-Reply-To: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Alexander Koskovich <akoskovich@pm.me>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d4cef9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=r9sBLZ6K9uwiCka_ugMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NyBTYWx0ZWRfX42WnzI/ZIbJC
 ey3FLJM1A2fhgVT8gN++BLIOPxUiZpFPj41MUz/rOAzPgvpUy09U6K7gwcMbTodHteNtLDZOtAC
 D6mOPwjPrvdCRiXXTW9f2uvJh9Kpga9dGtqgEIXKYy7ruT6bWxRm7jSdw/WpBuoQY8qGGnuSvQi
 WIK5N0GU9KCC4MlzH2f0HCePikIGWY3q4TxJHejxPziIK/L2uDvw0m6SCIKYmIgpI3WOffkg0cZ
 L7UqNNoks/aRUYZ+s6Jc0c/AXamZcG9wzNHY4dhad42/j9mNnzlvj3h9VxiPFrID7z2XlVdq30i
 ZhLeOpMyjN1AEa0by0wRIVzSvECULnKl5m4LU49H3t6gY/osjtuFhxTwNROzxbiEp3r6gsb6Fvc
 hBWz6KXkjZjPkdt6HVjY4qDf4iLPLKcL6ox7XijpZ8E4+sTvRxVeD6OnRMON50sAQf4dnCmFRn6
 9ejMeLd3+INHQSutYkw==
X-Proofpoint-GUID: VJbBHbZCZTyHUjvWm32HpDnz2heBEbkw
X-Proofpoint-ORIG-GUID: VJbBHbZCZTyHUjvWm32HpDnz2heBEbkw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,gmail.com,pm.me];
	TAGGED_FROM(0.00)[bounces-102085-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 134CA3AC17F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The GX GDSC represents a special GPU power domain that must not be
disabled during normal runtime PM flows. As per the GMU architecture,
GX GDSC should only be force-disabled during GMU/GPU recovery, where the
OS explicitly resets the GX power domain.

However, when managed by the generic GDSC runtime PM path, GX GDSC may be
disabled during GMU runtime suspend, resulting in warnings such as:

  gx_clkctl_gx_gdsc status stuck at 'on'

and failures in gdsc_toggle_logic() during rpm suspend.

Use the newly added custom disable callback for gx_gdsc to ensure the
GDSC is toggled only in recovery scenarios, while preventing unintended
disable attempts during normal GMU runtime PM operations.

Reported-by: Pengyu Luo <mitltlatltl@gmail.com>
Closes: https://lore.kernel.org/all/CAH2e8h4Vp9fJYAUUbOmoHSKB25wakPBvmpwa62BTRqgRQbMWuw@mail.gmail.com/
Reported-by: Alexander Koskovich <akoskovich@pm.me>
Closes: https://lore.kernel.org/all/gwVAH2mJerU4dBInw8pKmOs5aQK55Q7W6q_UQAlLFCsEgX6eyvSgXAWbNNMqAX4WmPlYCKUSMhfkr5Jry4Ps5EqnxYZqEEDd3Whwv7ZXGlc=@pm.me/
Fixes: 5af11acae660 ("clk: qcom: Add a driver for SM8750 GPU clocks")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index 40d856378a74aeb706c2f4a7a17a2c5602042af2..d7cf6834dd77c2a5320ffb8548cdb515be237bdc 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -26,6 +26,7 @@ static struct gdsc gx_clkctl_gx_gdsc = {
 	.pd = {
 		.name = "gx_clkctl_gx_gdsc",
 		.power_on = gdsc_gx_do_nothing_enable,
+		.power_off = gdsc_gx_disable,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,

-- 
2.34.1


