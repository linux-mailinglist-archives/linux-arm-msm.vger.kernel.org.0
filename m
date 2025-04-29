Return-Path: <linux-arm-msm+bounces-56009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D22AA0109
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 06:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C122D17F4D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 04:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65090270571;
	Tue, 29 Apr 2025 04:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l/4r+JUP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EAF21A449
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 04:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745899359; cv=none; b=fJKDQ/aXuqEz93eJQaEG97xqdAC4dPekO9sOl1RzwJ75ibdd2dZo7SLdlHvozQsmxEn8xsV4PJXuDD1k0R+bwLThmt8bOowsPoERE9vcxsKcqqjdLk9rm77cEeS142jrZW19fCrHLJOmc4Ul8GwHzI95SPznXXVDLYyn1AmfoPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745899359; c=relaxed/simple;
	bh=ewyN4s9Zb4rKfeEtwBwnUnCLyrklGDwG9BhZeUolaVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NabRR8Ju0ApjiHp1M09q3zkqfdyQFOr5VmQeawyGcepFmhaGAAp6M4TvKJM6VDRQah7tnxCTCW+gY7GC8SiPws/kDtimHfgeqe7LTjmEZIPJHFMKcnOUWemRtztGLlSEuK+p8dJgCU7NbYBNSe7RqQnfMuRpz4UeOBVCM16/MAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l/4r+JUP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq3C6015373
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 04:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MQOMcTqCEqcNFPlmglwpnX
	1yVDY/ZRzLIDa1dQXcAo4=; b=l/4r+JUPIVZTwfqViuKuvrVZPZTonVRnPVRsZX
	ZElCp1Q0HXqqC5NvdsTFrjva77B0jlrGYLqhYk7EDkaF+ibQOBK7qcy12lkFyias
	eQYjbG0DfQV/NUyZu0FoLCpjaNqpRjxZFhdTXgd5p8Tb7/rVZ6/9/9BBC8AvBODh
	NH2Rue2IluOXHee+e4V6nDrfkvlKPHb15iiJE4JyNK6doJIl6WyjZRX3sEOYK2VE
	WHBQt6MVUv3fw0t7j1VAIniJnrDksWxznJilxB9mfbx2Zim5eCOQ7hpFe4MEWGa6
	6YvIUofJRNzK+Tm67i/viDYaR0uhRK3Ri07qT+VwgRAwW3jw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qjwu50c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 04:02:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2241ae15dcbso63217435ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 21:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745899355; x=1746504155;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQOMcTqCEqcNFPlmglwpnX1yVDY/ZRzLIDa1dQXcAo4=;
        b=NRaAWIHIUsaMM3MunSVbHfBe08OU3HtzbDrFVjfGMmTmYuh7xVWduJWN7YFd/BbXSy
         M6xob4AB0xv1FWi8KFen4kmiBFu+Ju4hlL1fbF4JwCeAeWjfzmLf2Efinp4iTS731UmG
         ol64IXYuobAKHJkv9tmF2mLNt9DRa76HLG+orAQ9y76TuLjBeai6i1E+zLN2Uy4K4KIo
         Jg4VOV70JCKdf9IHkRZEiok3xLUs/9tq99tYC8jtT4kYmnJK3gkLyjnLk9xfruI0SE9D
         eXKBOn4y4h4j1I7BwT5wC+gOexjV5Scw1vwrM8nxIJRvWrMoo1MzbTkLYS+6BP4+jl0c
         Mxig==
X-Gm-Message-State: AOJu0Ywfov/NbgRESlI1rZ5Q4w34MqFniscslQjNejFi00ch9qqhjdcH
	tlqAPTr+CQlqARt/Tf3pwx5FQBRaIfNZyAmls2rK+KyUzJRs2pWXMkbwG39Tps9x8NbpT9w939H
	QLZA8d3uHhpQnJnZBoOiWacxvL+x1GSpqXTf8LNY/FH9OV/z2KG7FamU2wXoHL3yP
X-Gm-Gg: ASbGncuY0J2qykdSKw2YSFx+C3j5aMNtl2dMk1yZsQIxbIzO/31hdVfqnof995VNcOz
	5cRQ5nfLVHwpS6WhST+KkVUglQ8pxOF50ON/zWVNWijOyuZDMq4HA3Zt9efa7Vbo25cCg/dLq8A
	DG8IcrkDHo4g9isSrGW2t54Ke0xbNIN9Y95xTSPo8w6f/JFvAvOUfMl319Vmnks1kEzg8aW9RUv
	Ag0c2R4fFaeYmlPxWQZVUJZIFxKCmjUA/IqUFyUu6Q5yxQ3ouuudDakzbSPbyndYf7sq80AIH8c
	c8G24cVR2+U/zLUmL6lJSxe6QQ==
X-Received: by 2002:a17:903:22c2:b0:221:7b4a:475a with SMTP id d9443c01a7336-22dc6a8a948mr155240125ad.52.1745899355009;
        Mon, 28 Apr 2025 21:02:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfeveEwDRtBqG6Lk7bB0D7+sUUPKuDIbAdq/68nC+bRSnjWFgO8RVXd3ZJwIdE0t5+GjkvYQ==
X-Received: by 2002:a17:903:22c2:b0:221:7b4a:475a with SMTP id d9443c01a7336-22dc6a8a948mr155239935ad.52.1745899354688;
        Mon, 28 Apr 2025 21:02:34 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef09985asm11077957a91.28.2025.04.28.21.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 21:02:34 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 09:32:29 +0530
Subject: [PATCH v2] pinctrl: qcom: Fix PINGROUP definition for sm8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-pinctrl_sm8750-v2-1-87d45dd3bd82@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFRPEGgC/13MQQ6CMBCF4auQWVsyVEqRlfcwxECpMglQ7GCjI
 dzdSuLGzST/JO9bga0ny1AlK3gbiMlNMeQhAdM3090K6mKDRKkwl0cx02QWP1x5LLVCoZu2wzL
 HotAK4mj29kavHbzUsXvixfn37ofs+/1R+T8VMpGJFjXqExrTGnt2zOnj2QzGjWMaD9Tbtn0Ab
 XcMsrMAAAA=
X-Change-ID: 20250423-pinctrl_sm8750-7abd08406675
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745899351; l=1896;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=ewyN4s9Zb4rKfeEtwBwnUnCLyrklGDwG9BhZeUolaVg=;
 b=ua6PF0Rn3GncpODIKmHe2SMs9xkGtQZHP+cFSzYbkhZCEAJoX5uk2eFgF3iAzQxJhgn9NrKg/
 flS+60G/fDXDQUk1MGKynwSFjQ1dBiVn6fm4TjEGavnuWh+R+jIkEYf
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: TS1kwcFAH5rpVv_YugS2bQxt6lpEG9jD
X-Proofpoint-GUID: TS1kwcFAH5rpVv_YugS2bQxt6lpEG9jD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAyOCBTYWx0ZWRfXwvJAnh5iQNy2 3OV8RHM0J3ZOzNekfKvrmrUi2Uk7W7Il+po6zz1kXsWsL4V68y2kh9WPgxSkFWPkKYtM3+FpvKi nrY9FikfwdcdrqQquMAkSMAlMyoL5Qx71jBBTObjCrPnZrtqWEkUN1P6avWByIoaLJMGM+IIN3K
 PFnoEZMy967QFQlAmcwY2eSHlao5Zje8/KlGGvIumPqjtfAWx7BANil/GORzulXWwIretyWtwiJ CMWqM/aZPtZ5PT/8psH8R2SIQmm9+ErDtBy0/aX14XYNRlBnBWtcHYni7DdUHOxJ0/lJDkbkX8M aw4Hmz/uWLGuldv6xlVh38CATahiHxsFaehl1csVkEpXrLQaTwxz0xLPrOJjsGnejbXIJYJMYf+
 FXciLty2Fui/wMvoOccDi7D9Ts9pIjmfhhlAgnBG9Mwy4lE3tZlpNeBDpv01M0Dy7Tiu9MU1
X-Authority-Analysis: v=2.4 cv=c/urQQ9l c=1 sm=1 tr=0 ts=68104f5c cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=61JurpKn_mCFDXP9eHYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=603
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290028

On newer SoCs intr_target_bit position is at 8 instead of 5. Fix it.

Also add missing intr_wakeup_present_bit and intr_wakeup_enable_bit which
enables forwarding of GPIO interrupts to parent PDC interrupt controller.

Fixes: afe9803e3b82 ("pinctrl: qcom: Add sm8750 pinctrl driver")
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
Changes in v2:
- Fix spelling of definition in commit subject
- Add Reviewed-by tag
- Link to v1: https://lore.kernel.org/r/20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com
---
 drivers/pinctrl/qcom/pinctrl-sm8750.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8750.c b/drivers/pinctrl/qcom/pinctrl-sm8750.c
index 1af11cd95fb0e69fcc876fe069cc2cd6fd6679fd..b94fb4ee0ec38013d8cde7e45a7d6088a20e3b28 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8750.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8750.c
@@ -46,7 +46,9 @@
 		.out_bit = 1,                                         \
 		.intr_enable_bit = 0,                                 \
 		.intr_status_bit = 0,                                 \
-		.intr_target_bit = 5,                                 \
+		.intr_wakeup_present_bit = 6,                         \
+		.intr_wakeup_enable_bit = 7,                          \
+		.intr_target_bit = 8,                                 \
 		.intr_target_kpss_val = 3,                            \
 		.intr_raw_status_bit = 4,                             \
 		.intr_polarity_bit = 1,                               \

---
base-commit: 2c9c612abeb38aab0e87d48496de6fd6daafb00b
change-id: 20250423-pinctrl_sm8750-7abd08406675

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>


