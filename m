Return-Path: <linux-arm-msm+bounces-69123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E88DBB25D0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EB8F1888BFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 07:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B97126AA91;
	Thu, 14 Aug 2025 07:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLHFlrFq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D4026A0DD
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755156151; cv=none; b=PhJqFsXc5k0hsozcNqFn1KDjNGXqHncW1qwoYHDJmmOhWtvxbeNtWPV8ZhpDqhZ9fJ1JgokahRpV1PRLedm8x9ed4NB0I52otuFzOHuM4/5R0LMzGTxMfrV9DqN+ncknEJGD0KoSm3LzxMZZvTBoowIDkq8pFaKtFNS70EsQQPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755156151; c=relaxed/simple;
	bh=BdCL04OAptKdQWGchPijTezBT64XWbmizjFr1nay0y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d6zl1kvsoRUgOxinyHmI3ZPavqRXgylhOnBj0PhLShtBH5U+NiMJwEjoABVsn5NfK2UZ0Zc/eO16c5w9qoMazTgs4RyEF81ADJREBtAE/NKepbrHZS9TrlZRr2SsKx0gsQrwSYVzPEP0SzrDNZDYZQAUqdecS/AjKV1EXxi82xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mLHFlrFq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMXWep031953
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TQc6bIMTdxAC6yFDpDqhMe0BhKN2QLBxitGDduPp3Lg=; b=mLHFlrFq7xPKYeGD
	/gxkYUZfP9nDkU49zg6LplmyyNyT4fEy57gHo06/agQ08Weda2LZ835LdSilTCE7
	emFfJx+GRlgowkiS95obz4+r/dCv21d8FgDFWmAATW3yKxYm6XlqZ+HM/vhjP3+v
	FTInK7jn7LOEiGrX4ZxWaKHsvA8ya0nC6pMGa6ee2m19LxtOBY2hYsu1OvbMlqmP
	pAqAli+gmB9AWkviDHQVRtUWZ7ckUgWedJ8bhNY5rGCxDUq9t82CxxqHzy+8c9He
	jIetqOi/CgyKaCu3F9pIslbCLo5t8zrHpHKCbg7AETyzOqyfqb6ylHVHPpW5c2oI
	mLWP+Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4jqa0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:22:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109a92dddso18716091cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 00:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755156148; x=1755760948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQc6bIMTdxAC6yFDpDqhMe0BhKN2QLBxitGDduPp3Lg=;
        b=J77n1XkSbZqLX44ISNy8mWPdViLlWuzohIF2IIddV4/z1n0xyofP05tgXD66nCbK6u
         q0QMTiWLE+iI+MeDd1MMsjnghaDEhKcVu3MU0DW1XegJrZmqA17LbJ3JIKEOrwVcf71O
         QbUnhOJgZSh2ioQStmdcAro4yMoLrM1ccwHnohkmEeTkJK/emJjgiREg4Jw5zoDAzlSl
         mGHXMPGim8/OouV1lkza/bLoZCMtmTSr8jnei/suEIqV+dFSx4fMNio2Y3Q6xPGzlcXY
         FOWD2oMylHgwbq5elDEr95ndC8do7r3k/SoVes394tOUIAqWq8EbcHRPwOpwoWNcPrhP
         g/EQ==
X-Forwarded-Encrypted: i=1; AJvYcCU47ZsaE950OwI9SB9Pb0GHDwrfAwPubUd4MNHGecVkb40tHnkrGWUTScSuMviq5Hjc6rucYjViTnX8pS9g@vger.kernel.org
X-Gm-Message-State: AOJu0YwT0sKfRnMxF/wy9Ug1jWYkKaTANKfvx74+pOW4I9102upbWM/M
	XP/ZAbkLab1L7932XuFlODrcE+GOHxrHsfieXxsjbJsunA+WeHYUtZslLFVXZ90wW76rdUJEiDk
	UJAJhzRMvPyNBZpCtYPN1Bprk5LO5V/g0whZrcjRdQF/0QsIAkCKFlgLxsxN426pPPdvMThyCNK
	DgBAw=
X-Gm-Gg: ASbGncs3rmcyloaufIjVb6GtDBhNNPA2En+ZbMQYNNGhY4KS8z9JT70EsEzet3TYIdB
	tumH/DiuQJiGVlBWUqEN4MoAetz/is9Nbs9KYK9EMUpzit3j7IMNoN1M+EEyqG+3VBVk4dEZw6T
	m34LfKfiHbVLqX8EiQM/r1lCAboD6BeQqnRCyqnwCjk86n3cTYjfRXbVkJUVrKkKI9xoIW4OFh6
	FyhUQHJK0oYT4LvkDv+SiWp38wkUst3YK5p0B2lFV+U8R46hqV5LMYOlxLnuauglAzzBwhJTzKb
	zEN9f47Og+sRMolR+dCUL6LYnKmAkc8ZuZoAJrwoZEQ2u2MNDgelNAWvUOuzS7sbp/A4XCFnVT5
	5dz14N6/bue9KWmmtKMNz5WI4gsMx5AX3T54WjCORJfrB48SwR5/w
X-Received: by 2002:ac8:5783:0:b0:4b0:692a:d430 with SMTP id d75a77b69052e-4b10aab672fmr27451021cf.43.1755156148089;
        Thu, 14 Aug 2025 00:22:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNFBrlBr1dNMCyhmaJIm96Smu0B1IphGMBdlZj0GJem7QsVNBtQvGX3YL14smSqPKLK7uA/A==
X-Received: by 2002:ac8:5783:0:b0:4b0:692a:d430 with SMTP id d75a77b69052e-4b10aab672fmr27450711cf.43.1755156147622;
        Thu, 14 Aug 2025 00:22:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bde5sm5648258e87.3.2025.08.14.00.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 00:22:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 10:22:20 +0300
Subject: [PATCH 1/4] soc: qcom: ubwc: use no-uwbc config for MSM8917
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-more-ubwc-v1-1-d520f298220d@oss.qualcomm.com>
References: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
In-Reply-To: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BdCL04OAptKdQWGchPijTezBT64XWbmizjFr1nay0y4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBonY6udRYZ5ORJnkEqhveAjpyCwQyXvyjNpd42F
 vIs9mOUiXqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ2OrgAKCRCLPIo+Aiko
 1eDhB/91ysi69q80sRB5MQBUiIr8YwpDizYVm78VUvgFL/feN4Yw4bb1gcseaH3A7wdrJIzDR9L
 U7q3/oE8UNEQjP/8rc927Jb0lXSTUfUgFBXUt8k1YjETmyfanKP2jLo0z4LkiwKydFgGcjOGuld
 aijspVK0wHJgL3r+DvjkF59fieNIYg6FtvQrkCsxKK4yczRA8hn85WGOZ/xJvkcDYn6bx7TUyOR
 tZwuD0Fwkxj4iXm4ZORtSwizuKCV0HEZQe5WGOVECTBQi+LwUGuJ7+PzrX1TFlaVmuVtndL/pz6
 df6Ca97aKVUBebAVHio2u5Ofsn6qEK1etaWQgJhcNiQs1KIN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: HJUN-Ykeek4ZopQoKg5SXM8sujcQ6l9K
X-Proofpoint-ORIG-GUID: HJUN-Ykeek4ZopQoKg5SXM8sujcQ6l9K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX6Z0nTarKgymi
 FuIC7qFvKUh+u637ol4j8yCNdPzUPDNDx0B8O9E4N1D0nd5zrTVPJi4SFcuUIFyjoPNY6plKcMH
 NpggWdwiAwDXR47fXdgzkAhZe6CWQG3hQCGeFvVs4sFHJulJuYpnmDMpnrpoADrD/balJPwXX+L
 mybK0v365KtI4GifPUgLzRnPm89ZCHBFBqXdWIjtClbEuNWfNnuQgXbJECS/SA4RL32sxCFJOUl
 h1BK27xXQWmC0IIYDvK3eHnXbuRlJRRyfAsZMq2qBVT58zYz3B83irWun3N1q2fP80oICJY+mHT
 LefLW23rE9ai6agXqz4/C4oiQDnSOqiUUIoEPkTySS3e3524C3UMxEojOVL28IOBTUD9fWU/obL
 maxxojgW
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689d8eb5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=MyDQx4m5f6BJRij3LbIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

MSM8917 has MDSS 1.15 and Adreno 308, neither of which support UBWC.
Change UBWC configuration to point out that UBWC is not supported on
this platform.

Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1490a7f63767bba176e8e2e76891d7d2c424bb7f..5113c2902bf2ba3711bb14b35bbbb8a2b49b8cfe 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -225,7 +225,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
-	{ .compatible = "qcom,msm8917", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8937", .data = &msm8937_data },
 	{ .compatible = "qcom,msm8939", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8953", .data = &msm8937_data },

-- 
2.47.2


