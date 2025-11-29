Return-Path: <linux-arm-msm+bounces-83854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E79B1C93E07
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 14:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 305DC3A46E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 13:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184A030F7F5;
	Sat, 29 Nov 2025 13:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFvqu2wL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ly08D7bS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8096C13635C
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764422294; cv=none; b=n1KcpvQ0pkL4XA6HFFcwUDNxmVCVFnNykHhIOENiD1RfdRjvwJI5l4noniRaxniTkQpQNj3PTWy3jMNSC5EFyx3Vc2xT6k35MgcEt8XzEKLtCuH4Y9ird6tDrw4cDyarmHPOdTYXiwJepjniuUoHSp4A+mADVUblLikwWZJ5VWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764422294; c=relaxed/simple;
	bh=8ovGvZCqwjWCnMvCGhP69qiIzWR3JWOhrYiaIxD6IQk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Om4RE/Z+yPbWxvWbsUtfkCAqhcBv7hzzHQjR+7BcwmddQpQOcuk7aSwTNfkrxpGe5Brg8Khj8QOO2Xu0nDb05TAS8Hoxf7840DakFTs80/O3YAYrDSrBn97VaZ7jRdnXoIKbj37C2tXBAdAoloOv4avWTvTXMHSiJ7n1JgoBbEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFvqu2wL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ly08D7bS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ATChMeL2891031
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 13:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V5KOudL6rBk5/+I1FeGWBg
	g8OueTM9TbKBT7Hh8bzN4=; b=FFvqu2wLHbMcAwzYwWyNXk1tcvsprI1j4cS9Wd
	2XiI84ESICnxjoN2gWtoEaK1vRwhfQD/zIiogHPGlXAF8O0PwQ9boMNpuVDejQPF
	i7TR5cFIILKY87WD5Nm+YNpeT0vIs7v7TEySXtauUTDRhH9Q3wSiSxty1xzxCAqp
	5d/6bBNsYwd0v5TSqE1/HPcGlyI5pa/ywwvel1YahVtd16OFSmLMVcfhRI/cc/LS
	s8pz8vIZsSKJYdIK8NEqlkMPRKDSuE3QSEqXCfFbwlxyRjOFGwOBb+u6weaVGy6N
	w/p6dy6OjRuVimgz6WrtEGuI0ptObP2zSpPrQBjgLogepPrQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqqsqgtdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 13:18:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2f0be2cf0so774141685a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 05:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764422285; x=1765027085; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V5KOudL6rBk5/+I1FeGWBgg8OueTM9TbKBT7Hh8bzN4=;
        b=Ly08D7bSEvo9+ABC2WzO0rKnwP4QKmIIwunjLF8BbLDKPJAogeY6AoTWwXSDQgXTu9
         VP+K2QJvBxXwjxTwGN2mvaHVzF1ZGLfKhsj0vXNKj4BNlx142zFLCzaUYiorG9zSCJDx
         jzz1IgurRkJ6p6zVoVvIZuLgimGrN5cPogp8PWBBR2TwXXJFha1hNNsvdBmUfb8kA9FV
         z+6P3Vi9ajiIDB6HHf9ceF25sqnscr2oIRsdjOoHNTndLv50A/29ago7APGZsEoiV7aO
         bREczR5tnv79lL7eXnSaePcoCqENG9uPXUr9GQdSi9ZnOr9xwNQ8er2wehkHErB/4QuR
         5F/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764422285; x=1765027085;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5KOudL6rBk5/+I1FeGWBgg8OueTM9TbKBT7Hh8bzN4=;
        b=AnK27ua6cbnMKJ2/8LcIQKlaUPazGT5Yw7Qco7yRK6GlUi3zwiU9fFwf9vJSJBQbfT
         dkekkxto61gVIQtvkP1Foua5aqLq4w57BVUDQW4Q+w4hXtd5Kmp+gyvYUmhJS9GzrcdY
         S3OFf5iKhshrLo+VBkI0+WsqIZPSktzryxzDJbB2rvC8mGaWYQleIBW+8gRhqXBI/y9/
         QLh3fQ1WHIb7VoNHhHV736fXqpOjstW4EWutVmU0p7pSw0kcSrvtjJ+u8gaSnKV4Z33V
         RlP3snTaSoUTDlRkKZDWgWb/KfZufZUn2GvzP+X8r8HlSx2jEGgaXZS1tSmutZXOohQY
         KfJg==
X-Forwarded-Encrypted: i=1; AJvYcCU+u5Wc0SZ42vexAL48V+sF9Bp9mf8EGuQXH5Wx+fxeBHsYXH1F+bkeZ9x2Z98n71BclVVNU6/ALsHjVcNs@vger.kernel.org
X-Gm-Message-State: AOJu0YyFJKecX0MAPnAi0EVb28DYX2WQ+q26ptZRNWsCZVVK1iqtjxvt
	Is9HUNGi6GNuyF7U8SA52aQlOxepGBd/v5YD8hTQxdxTJ52op/iEvWR7K1aZXKFEf8OgIuL2Ipa
	XH8qxvn6lL0YIk5LNCjMqSy78Hhl2U9qtluv6XRG45rt6EmML4Rh98yzCbj8JdI7vmr8a
X-Gm-Gg: ASbGncvP6b5Ci/vRmhT7OJCtSMixiYf5lhbuCnoAhrAQu7C6hnEtA1e19Bk/5llmSSi
	Q5O2w3O+LVRmhkcrw5s6y7FeSmbk3x/gxBVn9cfed7GpyWflr0Oe3dgdFekT5gncFdEiVgGCxzu
	vRfXT+G1+mKgEGMnaQBBH6L2RltO2ORNx3tY0vJZkoeLxEhYr7sbHfQMK0XnvZK5nIFmbIkrgXn
	Fpjh+FmJN6sKzMVTS5bcGK2ygy6sztCRqI7NlvILdhAx624nQJxmnzy8jx7UvooGjYLo17ezeTs
	5uhxFZmTXmD2nqA4MGMvHERlrlpXLzUcTWpXRfpScY329Pg7PoqT9UeNRkj5adfj3Fh70EjMAtK
	wrlpnxZlEWBsU07eWEl+cNrEz/a1A7/EalQ==
X-Received: by 2002:a05:620a:4146:b0:8b2:edfc:bb9a with SMTP id af79cd13be357-8b33d49884amr4021130585a.59.1764422285397;
        Sat, 29 Nov 2025 05:18:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFY/CJRsstpjohsfuMrCwIlaflcx2iU/oSil20m9KkSPsSA8uwFHtzy4dOe+Y9AviKJiBO+/w==
X-Received: by 2002:a05:620a:4146:b0:8b2:edfc:bb9a with SMTP id af79cd13be357-8b33d49884amr4021126285a.59.1764422284982;
        Sat, 29 Nov 2025 05:18:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5163903sm723233866b.7.2025.11.29.05.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 05:18:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/6] ASoC: qcom: Fix confusing cleanup.h
Date: Sat, 29 Nov 2025 14:17:52 +0100
Message-Id: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIDyKmkC/x2O0QqDMBAEf0Xy3IMqWNr+SunDmWzNgeRCLtaC+
 O8NPs4ysLM7QxGYe3a7K/iKiaYG/aVzPnKaQRIau+E6jH0/PIhNPW1F00x+Aac1UyTPiTI0LyC
 rmsmQgjSjRjHapEZdKxXwOQb1Rphw54nDDePo2lku+MjvDHm9j+MPy9zf35gAAAA=
X-Change-ID: 20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-ebe8abad6e55
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1697;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8ovGvZCqwjWCnMvCGhP69qiIzWR3JWOhrYiaIxD6IQk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpKvKC79gAfIMlK4qpZbLCo6s1nxKPDX0A/cEyF
 CPs1w4qbZmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSryggAKCRDBN2bmhouD
 1zR3D/9h/KwSIs1oF6MNgWPZlK4tEUnKWGw3WKxblZhB8RvrqyI8+mbf9iAcWH0EtjrtQNjsEmg
 qGR6YG8q/heBkiIUZhgg4ds8QXVHR/GEvJFPeGd+jowtzEhpu9Kui/iWLTa3xKgELwcwTRNcnCe
 EcaGKUBnKf8YOW4Rrt1oDdU4Itqb8MvVaSuE9P1kh9Ivej9OBmTLtDdLiPi3Aw467FaN8wWDipz
 B0Jh067H7EEhhKQVltSSN402UWkRE5Ac/z6TUBWlGwEJhn9qgrt7JnDlt1PB6Rer4wMSmVn6+rt
 VdE3Re25gjIDLeOZAhWig0N/RM/Q28wky1SFoa+BG7JGnO8XyeGE252UpM371AO0Ck+pzd1NL9s
 O+s7/Jqim34XzAtKtTc3tINN7GshgwO/Qg2bVj11mCB4Ic00pnJxxQNxoK/tp0qI1tLsMtVArAu
 D3f7DDqxPfQtvWG9ntVV0TM6WPKWQC0LTeMp6jCDuvKtOqTFzX14VBf1oWJPn3CWYx+w/K6Zy5d
 W91PtFZTfu/vDUcWgDwFZckYos2+7xK+Eq/YsL2aGK2qITHolNyXYZOxT21GKYLpA+lOjkJyYv7
 3o5LtPZ9FnQU8SEJMsrln+/wCN0wfFVTPqrowkHkmmaPVwW7jway7NQswcMDv8Z0v1GvBq0pjsj
 fNg9dws4ctt3QYw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=UqVu9uwB c=1 sm=1 tr=0 ts=692af28e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1KnY2-9VyibwWvIg4X4A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: vtttphKrQ24AWVHExADpY9uULLxOTMZ7
X-Proofpoint-GUID: vtttphKrQ24AWVHExADpY9uULLxOTMZ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDEwNiBTYWx0ZWRfX2fHV/9xYp/CP
 5k6bWXDAxMtj8WTFaVoMaUJ8BzdHGJIf2WeD+cHRVAuVDixGSn9T5ja8JDs3Y+gAjRdEJDbMR0N
 aYKcS+FbuAbnib4lLxcYZWpJHA0xZcUzqXMgRtyA8z492aNv/CanF3cZ984VWCzV0Ins70gW4j7
 lXJIunF5qPJJxBxVmb1NiwRi9Sj4wkrH3ZSbLQ0kGa8KlEBYaDBxFKrcf5AC3IcrewdctmE3TSU
 gDxxnXJ3d5Tvv+xanE8/0UwU3a6lYjP7NdxThQIbtd0wTIranjOoUzBYighOj028vqI1Uw+aMVv
 PAxmy0tDqQqnPy/gR6r64fu0nd/kBqWBFk29va/JL4A5vaEw8ztYA/JL6LcEqjXvrTrEV+FPz8G
 DG3t8uGXjawLFUQBMTF2we4C0wNZlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511290106

Please, please stop ending cleanup.h patches for very simple code like:

  foo = kzalloc();
  kfree(foo);
  return;

... *if you do not intend to read cleanup.h*. These changes are making
simple code not necessarily simpler. But worse, if you do not read
cleanup.h then you introduce actually undesired, error-prone and wrong
style of having constructors with redundant values (= NULL).

This is actually worse code.

If you do not agree in declaration-in-place-of-use (fair!), then do not
use cleanup.h. If you want to use cleanup.h, then please read cleanup.h
before.

This is second mixup I see recently around Qualcomm files.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      ASoC: qcom: q6prm: Fix confusing cleanup.h syntax
      ASoC: qcom: q6asm: Fix confusing cleanup.h syntax
      ASoC: qcom: q6apm: Fix confusing cleanup.h syntax
      ASoC: qcom: q6afe: Fix confusing cleanup.h syntax
      ASoC: qcom: audioreach: Fix confusing cleanup.h syntax
      ASoC: qcom: Minor readability improve with new lines

 sound/soc/qcom/qdsp6/audioreach.c | 28 +++++++++++++++++-----------
 sound/soc/qcom/qdsp6/q6adm.c      |  2 ++
 sound/soc/qcom/qdsp6/q6afe.c      | 10 ++++++----
 sound/soc/qcom/qdsp6/q6apm.c      |  9 ++++++---
 sound/soc/qcom/qdsp6/q6asm.c      | 19 +++++++++++++++----
 sound/soc/qcom/qdsp6/q6prm.c      | 16 ++++++++--------
 6 files changed, 54 insertions(+), 30 deletions(-)
---
base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
change-id: 20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-ebe8abad6e55

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


