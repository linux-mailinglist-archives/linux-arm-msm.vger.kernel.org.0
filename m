Return-Path: <linux-arm-msm+bounces-82904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A086C7B5E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 19:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 58ED2346EC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 18:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A0827B32D;
	Fri, 21 Nov 2025 18:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVYiVEH7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S+4DKAGx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ECF2F261A
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 18:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763750595; cv=none; b=M/N569RZg7JAxf4kBA6mPKNGribEAH/oV5CV+Qb0oYwh2NWt2i4hkAQSImNGZDq4S70qaICGg+hEfebrtv7Oa3AWPQGPNWsRPu3eHkde6UyFQ1/vcKUMSDeHx/e77Fg0Vuqq7E+ArDmTNWEJIfB+/4BbcSR5IwPNUjpjc7uNJ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763750595; c=relaxed/simple;
	bh=6JFA6PEKwaz7P72HT8ffVP5KXKRcTkuJmGo6q2C7mKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tmE8xlFlLV0QiX77kMoK88Ed4Co34ZvzhAleff0Gq4F9nmF76Q4YBcdViK5GtCefYDn7MigSGWtl0RZHDN8As64fPJ7Y/xQbC2qDPIxdRYyBY+AoAJ5I/1FQyLGRkznCqlcTJ7U0lGgzvyDzNMqmyborZaY2VuczjDKWvJ99pvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVYiVEH7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S+4DKAGx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALIGbWE4024800
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 18:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TCQqezv9F4PsyHydEuHSiF1YdJ/kZjlRcuY
	c6n7FZhM=; b=RVYiVEH7KwhnHJEcZCJOsyBE1W1/kBugLA7MV8X0hu44qfdzCUd
	5U3mtEsmM7tUrumZSbGMTe1vNq3eNUR9zArzuLQh6nougtiGDuEmEOtr6uVl2O6C
	IsoGWjiMfhaoW91GSsvbqzp1p8CY7UGIaNosfNV1RgdoiVC+rUNh9NUADQClajy6
	Pep+77cj/nLgtLukGOL88NRG3K7sT6BRZbdeok+qwhqU6toqWl8kMrFv0UXaXXVV
	s/rHyJIgb/jpKAj34RMXbn4TZOagg0zJmWkNZTWxpHyGye8uhYK39laQC+1dOf/m
	7CxYlGzHjceSl+aMfuOBdH2G6Fzcr3ruzQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajw7a02ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 18:43:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8a1c15daa69so322961085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 10:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763750592; x=1764355392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TCQqezv9F4PsyHydEuHSiF1YdJ/kZjlRcuYc6n7FZhM=;
        b=S+4DKAGxY8oezChwf13ZA65QeOAMpF0ZMN5UTI709WEjXDb/aOG2JHfU5mmpTFnCLG
         IAcg4zO5jvJW1QZxfuej8w+5xcYTQOBnVFONviawxUq3N/5BZ0lnx5645N1vEnwN5kyo
         h4qaZaY7mOlCoq7mKFjbbkKlTck4L12reKeKzLnvXA2PCdX9zdMRu9cU9kkR929JGxzw
         XpnDvbgKBDcRNj68MzJIIeQyQiQDE41U279b4qt+AANO+m3k+i31PT3ychmouomHoXtO
         8SDEQwrKo83ennbFL7jiyIHuC3XMcfcookfOZMUlmAJKrmKxzG4tztrFyFAnmYV1Ltvj
         YTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763750592; x=1764355392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCQqezv9F4PsyHydEuHSiF1YdJ/kZjlRcuYc6n7FZhM=;
        b=Eq+tuqPrrivS10pGLyIl3zR2c+Baqa1eT/r+fAEWZH3ioewQLJBHX2P/jeL2ShYl49
         tHjBuBCjhqtRnylCKc0xDBrod8kcvFscKNturX9V0Oe5pTIec3efNOX+GvjaS0Ax4on/
         UKLKXkZKwpqsFoo9g7e0Ac6tQ1wrFuEvFzvdZAhkQwliFPRkMZ2WRIi164l4dBxpGAtt
         3fqIw7vixIhAEOROWb58E3mloBkUC04Q3hyywQYy0ciBJIV3Y75uvJcj1vOdUbdHCmoC
         vN+pj3nLHa3Lr8pBO74H31coCLxx7ESTryPU+SLwA8PAIeS75oOVbjgJMnEZ/2treRO1
         pjuw==
X-Forwarded-Encrypted: i=1; AJvYcCXksZTz4lYnlqr9f2SLWbet/gHYT2cIWD49hGq8cpZ22DJ9l8jlUyTpEK7rbTrdxsVhmYIiggacbDZAhfjd@vger.kernel.org
X-Gm-Message-State: AOJu0YyMkdcVlHPcGbo4qWDWaXDaHHKGhajD7Sjbc9p5tW9FVZw/qL4U
	/yfz1u1+Z48EooHRkVqE0cwChYDG/slG1kOKHS9YhYSRBMdqy2J253tzCFtH1rQ2MYolimkGOzm
	HpAm2luopZL8gjc6JUc9XkDlOP/VOai2m1USRpzzs02e/F77tmOkRC1r0ob53qGZZ5jv1
X-Gm-Gg: ASbGncvxQVUaxywZ5k4VzxC6Em96XWqUCt1/ypmWWnb78CFVT4VZpPUwMqCQ6V13U/z
	8dyjPDJEPehs1Vh0gbGFivhAfvee5bKokWyyUq7Thg8G9YtroziE8zsu8Cay51/PjwNLKSm9PoE
	7/KCKU4yPswk/Fo+4UQZ6vlgYiRc/+PMWwkY2ruYC02B1OxqsxEjjHM0SHRaQeF6VquIW9MOOFU
	/hJ6jfPw/zoIGZcM3F0stcJ3juxgj6q+XMhI/jJZp0SzKwOSoJ9v0f42w3iLMGTk/29ZC4XVVmi
	WgpOMb9uE+eOGORuUsCBfSpALILdr6M6F93rGMw/a1VCumRINyAnVYHlb/LEykWAhzsOFae0s9Q
	lRNysdMCi9PLcwtrXKBklQQ9DEfQ+hZNwshqwxYJpzZyX6V9T5GkA4SyrQW8RaYM=
X-Received: by 2002:a05:620a:2956:b0:8b1:59d9:f1e5 with SMTP id af79cd13be357-8b33d240e97mr407003785a.30.1763750591822;
        Fri, 21 Nov 2025 10:43:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAQaU6RSZ63cI0wyAQMIR4HL2N3pba/c7Do82t7bAU993xQMYjzhYa/gVdqjPlhnnE0t3zXg==
X-Received: by 2002:a05:620a:2956:b0:8b1:59d9:f1e5 with SMTP id af79cd13be357-8b33d240e97mr406999885a.30.1763750591369;
        Fri, 21 Nov 2025 10:43:11 -0800 (PST)
Received: from trex.. (125.red-79-144-189.dynamicip.rima-tde.net. [79.144.189.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3af0ecsm55118545e9.9.2025.11.21.10.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 10:43:10 -0800 (PST)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: venus: assign unique bus_info strings for encoder and decoder
Date: Fri, 21 Nov 2025 19:43:01 +0100
Message-ID: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE0MSBTYWx0ZWRfX5q15cWzwE9o6
 Ls7XxtHSIwm5xUj1YX1Ukkgn4TdXCdH1p+n0s93dhA1+fLdSO3dlNxGoPFhMGW726jYObbFALcR
 tjaPNnLND7YaIRqyaCGNDI0tRFQQOZgp6g9w47l1cfPgOpFmdIKF87kYUKE0ay3hGMm9oVLckyy
 il7K5ie1ju2vzztrr90jxdVTrjj0AL4mM2YoSCAk3BKVQtYCw10SaKGDGSvJTJebyRHj0t/AaGi
 1yUCjsPWq6YbO5oNCzCgZje1V/TyWD77FTgLyg3nU1pN4AjHpaIFEIm8SR5SvTKQ81+GvOEbP75
 NV2BY9C5RYipkywbQYEvggt+YQECrmrWS8JdYllpTp3L8/bJCCYX8uVQZ+k/wrphiCpPYvahQeN
 xVFqkEooLCvaXdkJPRmT5RwkS5qamw==
X-Authority-Analysis: v=2.4 cv=QOhlhwLL c=1 sm=1 tr=0 ts=6920b2c0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=QCpOfKHlYVe8AePir1+hrw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=owfriIHii3yi9sGd5oQA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 15NukVHL0FhYBhQc4CbEYd0eIOf765bX
X-Proofpoint-ORIG-GUID: 15NukVHL0FhYBhQc4CbEYd0eIOf765bX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210141

The Venus encoder and decoder video devices currently report the same
bus_info string ("platform:qcom-venus").

Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
parent device name. With this change v4l2-ctl will display two separate
logical devices

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/vdec.c | 5 +++++
 drivers/media/platform/qcom/venus/venc.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 4a6641fdffcf..63f6ae1ff6ac 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -433,9 +433,14 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 static int
 vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 {
+	struct venus_inst *inst = to_inst(file);
+	struct venus_core *core = inst->core;
+
 	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
 	strscpy(cap->card, "Qualcomm Venus video decoder", sizeof(cap->card));
 	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "platform:%s:dec", dev_name(core->dev));
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index b478b982a80d..520689f5533d 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -144,9 +144,14 @@ static int venc_v4l2_to_hfi(int id, int value)
 static int
 venc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 {
+	struct venus_inst *inst = to_inst(file);
+	struct venus_core *core = inst->core;
+
 	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
 	strscpy(cap->card, "Qualcomm Venus video encoder", sizeof(cap->card));
 	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "platform:%s:enc", dev_name(core->dev));
 
 	return 0;
 }
-- 
2.43.0


