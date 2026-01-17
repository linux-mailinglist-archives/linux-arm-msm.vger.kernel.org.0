Return-Path: <linux-arm-msm+bounces-89486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E226D38BFB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 04:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 641653032102
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 03:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7555F3054FB;
	Sat, 17 Jan 2026 03:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXNBJy5H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sts6VP3a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D2C28030E
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 03:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768622094; cv=none; b=Mup96aE7Q/PQMJhKeVN2rLnYiy3TfJj1Vsr1EHvgyQhOBdaySEeM4LdtSb0nZX5NuqayNVVdOSR+T1tuIZCm+o+sYVe0jdck2vulDBrEUasImdVNhwiDPT0RAEvVi442AeC5obYT5YTbvlEx/aip0FK0iTuXvRPvKyq4kY6p9NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768622094; c=relaxed/simple;
	bh=BXrb8zBMarQfydKiG56Kr8TTVhRKu2yKOODOTG/TY6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mkq884GMQDqsWgIuTcHF9saljQpBvRkU4K7NVtHjFrrVAgY6VGDlXClJFlHuHQkWIeCxQUpBG6seLzDlXeq5Th6dckYxgv4S8QS8fWg71AC3FBxinNgCa/Fr5XqZZG5ibRRbvjOsYP9bvuiVs5D1d+FwbkXpr6vSIKGMVSF7Sus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXNBJy5H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sts6VP3a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60H2pmQ82151656
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 03:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3sNL/ED0+ow7iJyCDM2dh1
	nRYsu8X+UUBWDh1RFitl0=; b=WXNBJy5HgcaLcaOmkYLvaM5aDALPz7M0qB4/U+
	R22RlkNidwg0LRc6KRITlbJDVXzGflpcRI8DJ0HbvoBn+EkoKzoHIojz8TMpBdkY
	/yfiIO52OHjlzWBujLCrOgf88KQYqR3vJpEPOCRnoj7bY5dbGERbh5NnyXSBtx+e
	ysftlfXvHY4X1l+FDV9HxmRujAil7Kts6xfzZ3+Nf4p7RSaCATuJiakGoAcFeI+Y
	E/oKvNfz+54xdvUykqFUvYO8qvF0pvDIgBOTZz2bz6Y+HkprLDruQCZicekSHxzs
	KJSCdXS1dC6VaJFbHAYlt/nbSrmZ82C1fJD3ZQhqbxlkObMw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br20x03v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 03:54:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c5296c7e57so993001585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 19:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768622090; x=1769226890; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3sNL/ED0+ow7iJyCDM2dh1nRYsu8X+UUBWDh1RFitl0=;
        b=Sts6VP3aHa3m0ObBngMCJb3uuki5r13mJLu4bDqkg+73ehnRUwB6wB8qmSwrREIKjj
         ONxBR6S5INSs+09tN4AjpdPJ/wUqATeX3+PJ60MOBYFU7M3r5BJpWS/tyQ/AeRWLQ6um
         HraUeUI3NKXJgsQbZtOKS6IflQxaU6ZL3BbsDI9oANJrNjZim6UGR9yYYW2OJc6T3YqA
         Kw0ASyVVCTGLn7azw2Etp0AB/vbwJitOKQKSkkI7F3VCkgs45yzTGHkRCxB4C8PeA5P/
         ZqjhIH6nlt2D0tX8PNPFdqbOugNkrp0F0qX9atSKJzE5tSMIOfJn3DwrkVK013CGalmI
         w6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768622090; x=1769226890;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sNL/ED0+ow7iJyCDM2dh1nRYsu8X+UUBWDh1RFitl0=;
        b=hloylQGH+JO0yeBftrFEchn2f3Qy6f7FTincYV15PH+bjx3UgvLljgxzPbt2qTIewE
         VNj2gKmgG0OR6s/2rxjH61q/25MudNE9gP8LkW8OGAhNs8A+YWHRu+bsdG7xqp9DoOVu
         UQeWROovN4X2IzIoDF9SYbhEOhNMOehBeOGFmIbnHZ/dkqhxMgX4KCkJ6rPOvZCxpc8J
         3uUDhFxs+aNlZ6UBf18DS6Zz1iXFJWKflGQlkOxuXwTyYYw6f6/vxlHjMBtbbjqwoQFF
         +BbmbUG8Xiz9C61YsdjwmTEAKaVfeFrpjYZ/hYQK/0uZIFbUUfy75ncvfGqauzYGhjFC
         jO7A==
X-Gm-Message-State: AOJu0YwDn+7FXA31UXnaUH7xZyQllDjx/tdkHS/ILYL6Qz28BwoYKPdn
	VBK9FVd32xMUAip2HxysC5mwhGcrTt203DABGzHyqU/zxXfF8LG7BFr5eoxw6D1NIbCH9fDgNNY
	FS/BlsgKGhNCLW1AHdM6ZvpgQDNALl3v79kuHGU/jbChighxJnLnCsNm+pJz8e0Nbv8bP
X-Gm-Gg: AY/fxX5u+kLCqGRl87y0dG2+dBYOGrv4vFY+c7zCdWcvjtWxX+zRBXJP1GfjDOFBSFA
	ZvtXkfj9fZSNF8S1nbA+G0rnAVxbLFjgvxWyfJLHoGdVB3edmluQOwed2R+1cqQq9zLAi88/zjN
	CAC0tJx6+jccXzunndRKIFXHJw0n/o+Gw3Y9lE2w7smhvKfTWXAmU+5FOlhlBi/RLPR5BP9vBLE
	a9lNnOv86tNxdbsbd2wP3joNTf4HQg0SmmYLTLUu2FuBDR7DlwR46VnFKgw0fQhqC8RwuTiPld1
	xUrf/dcirbpS7IlEDIOBczCxngEukgZxyrSi1JOX9JUfqyDr702eHBJbXqwgB0ZwL0cn+7LMnlT
	psfTmJ8ln5hCIDDQLgaqMCfNDqRUZndg18gFzgD93YbesWwQsxI4PlQ1/e1E5AT0xPkU7HxC+Re
	wxinD53ImsUVlAFTNa7VzaxQA=
X-Received: by 2002:a05:620a:2947:b0:8ba:187c:99e5 with SMTP id af79cd13be357-8c6a6909ac9mr719325085a.27.1768622090001;
        Fri, 16 Jan 2026 19:54:50 -0800 (PST)
X-Received: by 2002:a05:620a:2947:b0:8ba:187c:99e5 with SMTP id af79cd13be357-8c6a6909ac9mr719323885a.27.1768622089492;
        Fri, 16 Jan 2026 19:54:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33e7fcsm1321656e87.20.2026.01.16.19.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 19:54:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 Jan 2026 05:54:47 +0200
Subject: [PATCH] clk: qcom: gfx3d: add parent to parent request map
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-db820-fix-gfx3d-v1-1-0f8894d71d63@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAYIa2kC/x2MywqAIBAAfyX23IKuYI9fiQ6mq+2lQiEC6d+Tj
 sMwU6FwFi4wdxUy31LkPBrovgO/uyMxSmgMpMgqrQcM20gKozyY4mMCstWGJkXGjw5adWVu8j8
 u6/t+9zAPbmEAAAA=
X-Change-ID: 20260117-db820-fix-gfx3d-e61329023c8a
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2539;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BXrb8zBMarQfydKiG56Kr8TTVhRKu2yKOODOTG/TY6A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpawgIxN4YW1dmqsptBZiSbadBO3jjXlAUAuTbE
 8WT3Le56OuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWsICAAKCRCLPIo+Aiko
 1WNmCACm1N2dCasPaz5rkejNYlMz3ijUAacgeqRMLEUw9dh2mZ+3N8uOczs5Y9X2VEp+/IMz9V9
 cRAkZiBaciGolonItnRCzB45lOR65M5OJNl5OiWR3M3LwEmt7bJq6mz1SKwptXhHnylTHavxd5k
 Wwb1vIjku4usQr4eQ9F8szeFmDpp3xMxKZSSlLCdoAPgOR5dPRtr62zCDKHZ9M5GEQ2UFidRO4K
 Fz+OjObkOjhGAtxaFduduobH7ZCNAksx6eWdwyQ16qVZmFQLKzofYnncId9V5hYJc6f5+OMvuLM
 x8crmVhsoCtCajlYrTOplQ7hjMU3FMClBY8y1Tf/hefYcz6a
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDAyOCBTYWx0ZWRfXzLTMZ+fwEIZA
 z7q6gyTjYgWD9oUcuwNSQ4oJUQhnG6aUzftzwIS9OliFGJKF6Q59a23KNaZJmX0X6NOPVoCp3W0
 c1Mn1m59gUzeb8j9jz4hAQtoUppKIPZ2krCwaXsues2UZVba2s4Kmsu94GFMjlZvqVUISBXd6ly
 EmlqlwnJZP5L/+CT9d36wmY09uW9h96yUWMtIkMJwC3EBLJP3onrXkt2gU19JRiA3Q9xjl1BoQX
 TZIFr9cI5T9ksY/Y1b2fEhXPmtHVkIO5MQoaAyDoVydZT/x0uBuzZrjScHAmbZjAz3U2cVF/4X3
 Bfh1YgzYUE1VL4kI0GQUrRVZLRXOm+rSlSp71UQDPxkwFTfWu2yQiD3zWJlp66ZXo2DXkvwU4e/
 1oOgTjCSRAgQUm3fvDavYtEoN1ehCl20TcyBtws2O0bX5HfWX2oKmVMt2YUEOzXrwilEvK+2YOG
 +qtSlTkzlBew46zTUUA==
X-Proofpoint-ORIG-GUID: FiJRiAjdjw5jPjO6YFjXM9WlZ681wrtP
X-Proofpoint-GUID: FiJRiAjdjw5jPjO6YFjXM9WlZ681wrtP
X-Authority-Analysis: v=2.4 cv=abRsXBot c=1 sm=1 tr=0 ts=696b080a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=swfMv3hKf4AmUSlbHnEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601170028

After commit d228ece36345 ("clk: divider: remove round_rate() in favor
of determine_rate()") determining GFX3D clock rate crashes, because the
passed parent map doesn't provide the expected best_parent_hw clock
(with the roundd_rate path before the offending commit the
best_parent_hw was ignored).

Set the field in parent_req in addition to setting it in the req,
fixing the crash.

 clk_hw_round_rate (drivers/clk/clk.c:1764) (P)
 clk_divider_bestdiv (drivers/clk/clk-divider.c:336)
 divider_determine_rate (drivers/clk/clk-divider.c:358)
 clk_alpha_pll_postdiv_determine_rate (drivers/clk/qcom/clk-alpha-pll.c:1275)
 clk_core_determine_round_nolock (drivers/clk/clk.c:1606)
 clk_core_round_rate_nolock (drivers/clk/clk.c:1701)
 __clk_determine_rate (drivers/clk/clk.c:1741)
 clk_gfx3d_determine_rate (drivers/clk/qcom/clk-rcg2.c:1268)
 clk_core_determine_round_nolock (drivers/clk/clk.c:1606)
 clk_core_round_rate_nolock (drivers/clk/clk.c:1701)
 clk_core_round_rate_nolock (drivers/clk/clk.c:1710)
 clk_round_rate (drivers/clk/clk.c:1804)
 dev_pm_opp_set_rate (drivers/opp/core.c:1440 (discriminator 1))
 msm_devfreq_target (drivers/gpu/drm/msm/msm_gpu_devfreq.c:51)
 devfreq_set_target (drivers/devfreq/devfreq.c:360)
 devfreq_update_target (drivers/devfreq/devfreq.c:426)
 devfreq_monitor (drivers/devfreq/devfreq.c:458)
 process_one_work (arch/arm64/include/asm/jump_label.h:36 include/trace/events/workqueue.h:110 kernel/workqueue.c:3284)
 worker_thread (kernel/workqueue.c:3356 (discriminator 2) kernel/workqueue.c:3443 (discriminator 2))
 kthread (kernel/kthread.c:467)
 ret_from_fork (arch/arm64/kernel/entry.S:861)

Fixes: 55213e1acec9 ("clk: qcom: Add gfx3d ping-pong PLL frequency switching")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rcg2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 2838d4cb2d58..d0a5847f9111 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1264,6 +1264,7 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
 	if (req->max_rate < parent_req.max_rate)
 		parent_req.max_rate = req->max_rate;
 
+	parent_req.best_parent_hw = req->best_parent_hw;
 	ret = __clk_determine_rate(req->best_parent_hw, &parent_req);
 	if (ret)
 		return ret;

---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260117-db820-fix-gfx3d-e61329023c8a

Best regards,
-- 
With best wishes
Dmitry


