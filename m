Return-Path: <linux-arm-msm+bounces-86921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA74CE8E02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 08:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0A22301224E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 07:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9212820D1;
	Tue, 30 Dec 2025 07:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UwxeTQdE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhR4P0cW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05B939FD9
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 07:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767079084; cv=none; b=ST9FK7f8RrVQI1tlw/5kzv9tlK3H9kwNHyeAgdSEMdxWQiiq987G6Wccz0vQwttc/vi3A8dK5RlN4CJBWb4opq+H8LWWKyl7RJ2kT0PkUj6gS/tOZNjLoi7swUF+JK7p7+Pa1UOans+rSKZD/7Ubrz6hrCadvN36GSW49Ev3Slk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767079084; c=relaxed/simple;
	bh=rjcGmrYy9UrdPHnUVn7OH4gCfyt6FSy4sSqVbUoAeIk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uXjkgzbEj2igSlDHDuPkFSgWFmjWFNov/8Vu9QijMl4XeeGp3RD37MRm6vbvPYtMkxwlemQl8ecz6tWr2KtkLfjhRuTgi7woFdwLB7jl6RC9WBU8K9fXQ+zFxLxnyI4UrYu0u0gb4mcrtQ6zAmMYTOnpOsbGJj2HJeu1G7MASrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UwxeTQdE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BhR4P0cW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTNuvuB211639
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 07:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RDfDov+21c9xI+NU/eqDWb
	Fpcvc+X8yxuZnrRdrgcdw=; b=UwxeTQdE1mzKRJHJcJZqpdvN7C/9A3JKeSyaEP
	qSnqQ0tnLXwamep9uGHftlLHqZoFCfgAcDzGAq3fV0DxoOFOQp/RTj+VcXwgBfd3
	qz+Pqq4xiw95geYp5h1Fg3pHlo7jA4PJbdUdnkEWmjV/5ceR3oOQnEz5q1OHKHx1
	3iiHVbd7CIoHLn8fLQ8oWAKGsGFNKFj1PE4coQS91suCMU4rfzCAYlH5ojU0TLKf
	578YnIR2GWlbIwIAd/LB5wnGsJskXAnK2fw2d79EGtrZH+Hf1NdjF1c7mcS/y1LH
	Upp/fwM9C+tA4uxEf0xNVkL+5ltIjR18IkROHq8vZJgGrgfQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc9v3pya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 07:18:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d2aa793fso263031171cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 23:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767079081; x=1767683881; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RDfDov+21c9xI+NU/eqDWbFpcvc+X8yxuZnrRdrgcdw=;
        b=BhR4P0cW/YkovBNKOdg0+vX1YwSkPJCBfdKQLd1AZAXs3Tl8tQxq/LqIhWSqBSv8rC
         rZeQVFo6P+ktGE/idSbmqeW292ZDGvRzxERSfVlwXc6U4eR3oE000KP+bJzdZlkZHQGw
         DFlug3h2xmU4DVvfyz4EyErWnRcztD2xQGJONC9hCJr8AFVwLVpxQ6b9tldqQ5JWK4R9
         QOYFSZZgCnQyPVfDWXsEdcr3AWX53QYxsc2LgA4wCgwJNQpabQuB1MOyd2OAeg5S3vyt
         4KUv3VR06Co8YJMqptD7TK+vzd3pymSpNxP2e1Ee+j4kD2Zl6eCLvsQLezj0XL/0MTSt
         9SPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767079081; x=1767683881;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDfDov+21c9xI+NU/eqDWbFpcvc+X8yxuZnrRdrgcdw=;
        b=F9xCNf1PngJHACj89vjed4jyjouNxIfMb7qctlvEWJzo9pzdClcgi6khFkKYckDzU2
         lV6Hi7ZpoMAUqhugzJUWBCC9LVQNpr1iVR9Zrz29zaXsx/7oV1pdezdOXqekccBZYUwL
         eccyQ9ozGBvVjUAYKNN7Z+n3jZOqtrxZqDr3+e4QyUQUV3U+8mH3F2Aau2sZtu43Sotx
         20V49nzJMJ4uOQuAsUElrA3TMZ1hoSRYnIBsCSTju80f67TFomIxArIs8rwUHxxievqs
         iA6DEWZ6rtysI8xb0aM+xi2cytqo+6fWkaA8uRn5L4063d1It+n2Gmv80p5ZmWRBrIW9
         8U0A==
X-Gm-Message-State: AOJu0Yw/Di+MqGUWPpoI1RROUsnYpVjB5H+SEWyZRwizbZMgd+RGFgBm
	zwN6xvdJPtt4OD6sDId7SDdyToL8Cp0pTwBdlXiKylzzJqZwneIC0Gb++QR99PdjoUyAqMVgyJf
	EciOgls+FgkGDoGoH8GOn1nK6CcnxIl8HM9rChYyZE3FDGOB+MqAnIx+ehDCfy0eI4uT3
X-Gm-Gg: AY/fxX6s+yXQIhI0NcG+RjVYVCincL3nbjdHuMOLMp5TcNoqc2kuktz0uoMxlnTEfro
	u0cPII/YGTUQmcHxD0EJqcO91UXbdyoc+NB2hJV5TQdzv9c0VaaaBQ7PFhT/cRJ/RlRDpvpD14z
	IDJLcqx7pYUZKKlkFmauIIwWHq8oVlrTutfanxSJ8xFunCTIoX8x1HutzrJJWpp0zwHLBCveW/s
	rGwAMAU4t/07ZAxKNexqAnvNROGHhTP6eux8+f93YORm9Qwuo2RjBrjxD//8ztuRjwRmmnfrgus
	xxxvDshjn0FwOmwSGpvlhoK5U6npOb04asZi+xG08O/cHUSoEyKaaX8NkMLDRgMw8ubdIW4Ozzj
	URzpTZQ2hdDj1cXUMgZOHZWuzHZtS9A4Ofx3e33SQJJSelsKwNOGn2yKwWn3oT9U2oVmdEolTk5
	Y6JY0sMBrdfyx8Ee9vC+3pClo=
X-Received: by 2002:a05:622a:244a:b0:4ee:1962:dd46 with SMTP id d75a77b69052e-4f4abdb6718mr540628281cf.79.1767079081008;
        Mon, 29 Dec 2025 23:18:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOFJXh7VBC0CA1QEHfedT0Vh9YwUikHzXQJjpFbxXBPOzJd9y+5itmQlXgUcbEv9V2Tridsw==
X-Received: by 2002:a05:622a:244a:b0:4ee:1962:dd46 with SMTP id d75a77b69052e-4f4abdb6718mr540627961cf.79.1767079080388;
        Mon, 29 Dec 2025 23:18:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ea2d8sm9924615e87.45.2025.12.29.23.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 23:17:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 0/2] drm/msm/dpu: fix vsync source programming on DPU >=
 8.0
Date: Tue, 30 Dec 2025 09:17:55 +0200
Message-Id: <20251230-intf-fix-wd-v6-0-98203d150611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKN8U2kC/63QQU/DIBgG4L+ycBbCaPkKnubW9WZijB6M8UAKW
 LK1VOiqZul/l/aiS3b0+Aa+5+XjjKIJzkR0uzqjYEYXne9SgJsVqhvVvRvsdMqIUcbXjOXYdYP
 F1n3hT40lF8DsGgqrC5Qm+mDSyaK9vqVsg2/x0ASjFuPp5fnhkcL9FqiUO57Jbcl2MisqARmtK
 rEvy5LfbS6uEdXXfdAUSB+8Jv40HL0/kNq3c2Hj4uDD9/L6MZtr/7tkXmPMF/nqF4w5ppgWiko
 GVlnNNj5G8nFSxzTd/hL8LyEuCZ4IC7Y2wIQBe42YpukHWDlk+6sBAAA=
X-Change-ID: 20251224-intf-fix-wd-95862f167fd7
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Teguh Sobirin <teguh@sobir.in>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1827;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rjcGmrYy9UrdPHnUVn7OH4gCfyt6FSy4sSqVbUoAeIk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpU3ymkVB3YAK4jAqFVE9gdL3SXXXvkLAOjZU8R
 hU0zIAxVfKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVN8pgAKCRCLPIo+Aiko
 1RLzB/9kdmTzpOnEuTSthFf6CdLwX9jvhDDNiPuAm1fsVzB9LeCYFkS1KtgR9qkDkQoWk/Uj6qU
 8SLT7RSNnTKNYfunPVMkvN6/FgNWouFy3TnXVttSJ6GoZ4iIkQlKVq3KkTIli+Po+OYZF6DloFx
 A5jbo/NeQaCOzVwHJIp+MDCj0V9wvikrhEI9lxVQc+XfhVLNnKf3WU7siPcAyhaWDJMp9xNka/t
 uTRkx4CXwbYj7PrQGbPSNg0QqfQGZyqheVfRRaIiqPY74WPby8YWZrVDUrYi1pCn1cbEg4rfx5t
 XQZcyPN375v7LhFAEPZi5MXRk8BE/ksVx0e+nzfzbBmID0eX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 20eF3Q2q_bsnS9UzUGTiB3GldzOnjOjW
X-Authority-Analysis: v=2.4 cv=R/sO2NRX c=1 sm=1 tr=0 ts=69537ca9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=ytnKcm5597Xeg24-LCcA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA2NSBTYWx0ZWRfX+1KFyOCJedsK
 ujOsjdoKeuIhQzzTpzRgm9CN6z1cASv+zwhq3u9F116KyzPB8n2n8NOURfLGmaP+JneF2pK6viz
 lcAnWU2eJd7ZsiKu29iQ4L27eU+pQHykSpYI3e1Q45dEroQMM5KvRDy/7XYzwp5nQWX00oEu+Nf
 zoHTxLrTxY6R7vpaqvxmnDJ+mJ4WX0XU9QvI6dGlHKwtEg8jJ7WXLCbn0m0dd7vRK7GBZPnb894
 DQHLwLxw6LY0Y3xfETlNiFW9YK4GEt0qJaHxijGbA70fWaDKdqgM6+HlD17b5neDd69Mf81R7y0
 M9DvoPFbkWGu7sGWFvJ0mgtsk6ZdHy8YZ452/TjV6zGNYg08UFQVBvTnDr38fWjebVzfeNHzA89
 FBpeW1/gTJppqG9cJGsKdIybyAYB2KECtXsQSf44eff7ePEYH+fnjDLGFcBOn64GdcEoQc+/DQE
 SK4x7QFHj7OBWU4lylA==
X-Proofpoint-ORIG-GUID: 20eF3Q2q_bsnS9UzUGTiB3GldzOnjOjW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300065

Currently VSYNC SEL programming is performed only if there is a
corresponding callback at the top block. However, DPU >= 8.0 don't have
that callback, making the driver skip all vsync programming. Make the
driver always check both TOP and INTF callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v6:
- Spell out all necessary bits instead of reading INTF_WD_TIMER_0_CTL2
  (Marijn)
- Link to v5: https://lore.kernel.org/r/20251228-intf-fix-wd-v5-0-f6fce628e6f2@oss.qualcomm.com

Changes in v5:
- Fixed typo and white spaces in the commit message (Marijn)
- Dropped superfluous comment (Marijn)
- Moved vsync_cfg.frame_rate init (Marijn)
- Adjusted the Fixes tag for the second patch (Marijn)
- Link to v4: https://lore.kernel.org/r/20251224-intf-fix-wd-v4-0-07a0926fafd2@oss.qualcomm.com

Changes in v3:
- Picked up the series per agreement with Teguh
- Fixed VSYNC SEL programming on DPU < 5.x (Marijn)
- Implemented WD timer support on DPU 8.x
- Link to v2: https://lore.kernel.org/r/TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com

---
Dmitry Baryshkov (1):
      drm/msm/dpu: fix WD timer handling on DPU 8.x

Teguh Sobirin (1):
      drm/msm/dpu: Set vsync source irrespective of mdp top support

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 +++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 49 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  |  7 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  7 +++++
 5 files changed, 64 insertions(+), 20 deletions(-)
---
base-commit: d2b6e710d2706c8915fe5e2f961c3365976d2ae1
change-id: 20251224-intf-fix-wd-95862f167fd7

Best regards,
-- 
With best wishes
Dmitry


