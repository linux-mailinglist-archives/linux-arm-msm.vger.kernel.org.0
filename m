Return-Path: <linux-arm-msm+bounces-71633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C06DB40625
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22BAF188E47E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E31B30BF5D;
	Tue,  2 Sep 2025 14:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nolUCwk5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55962F363A
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 14:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821670; cv=none; b=ZmLiM64r0Jfek2nicuTR8z1UO+Gf4jWXkDKXPemwjK6YnT/g4ojUqVp0ev+SpoY+mE+JMjitU76B2PW19eAQ691ypVThYh9csOWtZSBwQ8lkuNne5y3ACAuq/eDzXtjruSfLbVqSuM4Vrv0Nk8HuJM3yRUjxeVqcfbvkg1SIhgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821670; c=relaxed/simple;
	bh=lzi7PjmrbdiTIxDM4q1qCQWpTdwTH0ya6B+wcBwilSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o9M3vkjchqZ6mHk5wvxlCJoEGgcN2OopQkPrkV8CERBXHcBxGkl+cjBSYyBDY1O1ocbLt794dL+qnkBwGdJ2lu9KzS3uAaKwX2s5KLVVr8/iitbfEOIfd+ogeHbH/lstp4ZyxHTDzGAygDbHJmpUAzpQrBuzk7A9vDHYpG8i6fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nolUCwk5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BGFpF010341
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 14:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4elZEAGxUxZ
	vEJD8DID/5RqvZhZy/oGpNYortaWIzhs=; b=nolUCwk5gI840TZbsYE9bsSF2so
	/8qyZgP/r0pDHDc8qE1TamUJx/C6Tin+c578ghNPCzQu5Bpc9sVAs8Az7VSp4AoS
	8pIsV7maTX5gp0lqlcFd9cGqC3qKhtRDgHrWP8jsXWpONMPsGLtKYLj0chIIX+dW
	/2L9VVEQZpfMQJIAVL0ccpzoxUrwUdPtxdEeuet1eUwiUQqwXoQeREzclF0dZEmU
	XKSjUGwXAoVJFRUBH9H2Uw9duEHkKOwv0u1RRTCUmslkHsh5zhlF4GyADB3nwohz
	OkzrGiYcX2iOIivK5rkfDr+dObxP9Ve2k4ufAk+SQ2sJlAWGQfDwATePL7A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjg0fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 14:01:03 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-51ef425adeaso158717137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 07:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821662; x=1757426462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4elZEAGxUxZvEJD8DID/5RqvZhZy/oGpNYortaWIzhs=;
        b=dmf0A7f3TxaN6i4NE5GJbanCKl2K6Y6m19fk07RQBKBNWGZ3MJmA7rleTiGvjo5Xt6
         sDBhc5+U+K5nkgcnypzgxq3bLWBFOpv/ZsrAdE85ODBzbEDJNDOyEB45PAqyTesU4O3V
         il0nmb8A3NLFrZnNacEc5Z14KXLInf0teCIHr3oQuvW6khViIKQGMZVTBufU4tCy6Hze
         6dHgzWhAzm9yzhWJtysIwLHtjnKBPuyvVJT+SZq5Sui3r9ojcRPtIHUWCoephJMXoWrE
         PHPC2hDBug5b8dbRtVtCCeWYl6gqSvtRmLgk1lagz1zqE4CQqtqLLC/E3LMiIzyDeZax
         rnPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9cj2Kac+H89D1zYb5cAtMlkQzSWj83tXHW8+6Z5xd11ElsEzJFh4bApvf9oV39+wi65QJXIAAhUpkhCUU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9FeKzwnXKrBMYj9O3DyP9tM/DLy7gRXNwEA0PBI6saMwD4Ac7
	g7wFXZDZVYn1/UbcawNsj++KEB+DC0fdHG4Fj6dLIXCWcwDZDZB/JjEDJcv0fjmgno2R2i7S9sc
	QYPMvZmUBl1n9yLOEHhB70HLwkULzYIXchIQ5lMdoVmZEemgjqhFGByFie+gtVA2JhGWX
X-Gm-Gg: ASbGncsZwbeLWct0a81pn7ezPXEeK25cl8GzUPgkpsnTKiM3oJloQj7QWRh8OI25lK8
	zz3KaY+ZK7VDdPYvYIrawq05jkyTG6SaGoV337Df+HKWMamCB4LyeE9QloN9SRKKWjSbJwA+rA9
	NShvBTWiV/b9TrM+9dCM1pyBZrYLihEjgZVjV6AITZLFxzRPtOMtPK8lUJ5CIL2D0k/dEp9YVOF
	+tONo1PtDX6RZ7Svd25EMByiDrts6BadIvbHQAkhdLXA73K1tmN05r1E5QW4wBkB2iosp1JUvNp
	2twhgbtCvzjFnVbbN62XcxhdOF94hZoyRqXzML8CdB4qwOWGfy4cLA==
X-Received: by 2002:a05:6102:685b:b0:530:f657:c1c with SMTP id ada2fe7eead31-530f6665444mr447387137.0.1756821661522;
        Tue, 02 Sep 2025 07:01:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4XanQI+P+HUm3egZOKx9hQOOG0P1c24g9VEwtKc0I4KsM/LPaQOP0PJ6Mb77+ov0hpW2oDg==
X-Received: by 2002:a05:6102:685b:b0:530:f657:c1c with SMTP id ada2fe7eead31-530f6665444mr447186137.0.1756821658795;
        Tue, 02 Sep 2025 07:00:58 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm14381196f8f.40.2025.09.02.07.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:00:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: srini@kernel.org, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/6] ASoC: qcom: x1e80100: add compatible for glymur SoC
Date: Tue,  2 Sep 2025 15:00:41 +0100
Message-ID: <20250902140044.54508-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b6f89f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=eB2jmeKzBhuYpaM94Z4A:9 a=zgiPjhLxNE0A:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 2dJbGc3fBaZJqRiMsq3i5lxs38eQh---
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXzaX6p9IYhuMo
 GqeX2hCNoRLkZnNoaKsxaOokKPoFMdI18ntpwEm6IGDQhgqkB9zdV2+1tGBdRNI0LA0u6oU6ABP
 6Y3TsRcM28wSPDE4muvRYsfniRcp55ke5gw4863rNb8Gz0hHDvgzGEkj3pBq4h7Hcr1nLvjh8hH
 zu2T+gV0BSrw925Zu1mRVH0qlVuPFy27MhCI2oxkV1Uiscz5BoHuoXoN5aEEQ7hLueOARVonXt8
 HNgYq0mG45v2p4VcjGJqH9mnKDWfEWtDwsMtM1w2SZHzYRGgFz2TiiwA4hFTiJ9UZjoc/3PKL6d
 tdwnOgKP8eMP8Fi3YuO
X-Proofpoint-ORIG-GUID: 2dJbGc3fBaZJqRiMsq3i5lxs38eQh---
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508300024

Add support for glymur SoC based sound card support.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index 322010d54af6..444f2162889f 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -218,6 +218,7 @@ static int x1e80100_platform_probe(struct platform_device *pdev)
 
 static const struct of_device_id snd_x1e80100_dt_match[] = {
 	{ .compatible = "qcom,x1e80100-sndcard", .data = "x1e80100" },
+	{ .compatible = "qcom,glymur-sndcard", .data = "glymur" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, snd_x1e80100_dt_match);
-- 
2.50.0


