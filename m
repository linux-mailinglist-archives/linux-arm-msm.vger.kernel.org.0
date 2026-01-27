Return-Path: <linux-arm-msm+bounces-90765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPKFCJaueGlasAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:24:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44092944B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:24:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 74B6F30131D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83CFE34DB68;
	Tue, 27 Jan 2026 12:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZkHF303U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iapn7+m5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF25734D4F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516594; cv=none; b=KEUr5GT+P1PAjmwrqOWXqzuRFUzf1OsitshES8rfPvTWDZzLn8/gB24hDWuyW2n9TX+/1FGU5EVN6oQmg6EQ+YJTaIw+x+Dc8QtkkDANJG3pNtXmHaOcB+/Ck2fnaJwC9xJlrqjwCSpGQ8cbSao58pEiIcheA459TcsszthI3BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516594; c=relaxed/simple;
	bh=O6rDG01uuKhI+p5aawFUM6OGJMTB29WlyXqC3eML6Y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ahddRUDChiL6ARjIK0oO6KQWfl4XEgaPkPW8tm6ZQt1r3scJ4Q3Krmd0g2xIos0+v/0rzpBydaWw6wihZBbDFxvkKe52cEYJGRb+UWptaAEyCb5skv0s0pO3siQQ80AZSLjIPLvs+b8Ck3zhjqfj6JPwB02oaLEDYXlmsH1ILUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZkHF303U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iapn7+m5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R876602378873
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+oDnrqs14XAXLjkyy0vgrxBDcXxr0LVxm/6KC6d1bc=; b=ZkHF303UhEKwwtrI
	g7ufgwgU1ZzxxDghaTI2YvIxmT/LSaS2+oOPV3NoBAMySE6ATBTPkdW1YiqdgDcS
	I3Q6SE1LJbtdTxShejon/mfeGxwp1Q6w+fl/2Ap5H14g2fBUvpFBs9bW/aFbStgK
	m3rmGtSdfxQZjpurnKBzGUkKtsI+t3w/0aHreUkV0M+ahvZ6aZ9H7Yp2UStpRwxe
	9HBqfaaj2imXnaW2EIpufoVKaEd0ICT2wyE7L7PLQypCQ6iB3/DkgVaEXq+iAP/D
	FOSAIeDGHZV5pr0+xM68KmsynognwLJwZQZOuBdyfEqy5b/Vy87f3euFl1tyUfKb
	K8r6dg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjr8u99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:23:12 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56632d985e9so21518492e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 04:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769516591; x=1770121391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+oDnrqs14XAXLjkyy0vgrxBDcXxr0LVxm/6KC6d1bc=;
        b=Iapn7+m5Lwe0b1vp4moqhfoiuCDRj3KHk8VBZPCGumYkhmE7OB807PCt/EW9UnSJ6/
         0+xMEnIBFdBCJbuTNhOiaHN4bRUxIt0v8hNHqh22jDm69gfbXkLNC4p/Fp+Jto5dCqmr
         9npeLANq8Kg7MNMlHW+EhV1DfYitHTUVqyhkpRveFE7f0Lz1cqxPT6cInlZ4hZn8Cpjs
         a2a6yT3i4yg/I2MqkyFIyPQL74NbrZZbPkC7vcvH8QossJFvQIlO+V+39IsUjFV8RsLK
         aRUXW7hPJ/TJLUEDASDlkxIk0kh1Z/5YKkSciLPb+RV9vYQCLk0YFOlYW3SzdoDeIYJ/
         GOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769516591; x=1770121391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X+oDnrqs14XAXLjkyy0vgrxBDcXxr0LVxm/6KC6d1bc=;
        b=XtY42c7mCaCR7vi/5XUNgUCtn9eQaCpcvVZAlqhKSay9EIuyRQ/BN0oFxtJYatqbQU
         L2oHGVT2sC0GRvGkIh6IRgQ7UYxlpuBWhQTaU3QbOSbCuECp5+rFxZe/s/ynsAtKH0fq
         gFFTv/PAIMTU4vAJDfhdnvxXEkeljYPo4OBoR5AcmkCjaprK/UASxkLtivP0oYRGBOk8
         X7i82v0YoXLiUwxVJAZsVIDbwhMxe83lH1iA0kMZcNZwaIv66ZR1a7n3n7Oy1ECN3xlV
         0/kiHt9NTvw8UejfficV6Nz1C/4EwGWZM1/TcPxfuXGwOKfPtV5gB69P7chyJD+QK2/K
         /BLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQYA3RpeM+hXDt4e0LZTn7yt3m2+zSndHue/ghpEHc/FHrnpRZ+6JzeDHTRy4QC9DU/QXvIKSKnIMmx3+g@vger.kernel.org
X-Gm-Message-State: AOJu0Yw11eeNJP9OCmjen/mh/8TKaxnijyKRHdPI9pUzmwX3oa50sag1
	nkWQXisS7XzCO9p7KmOimFMKNBh40DqIzkMQveMAIwu4Tbz/jqCKkEocS2R6oO407rX8qW0kgYj
	aVBTO5TIZd+doFChfZqgCxPFG2AIgcmJGFoAAL0TM8gPW8LQmISH5Gd2nVvIH1cPsyXBK
X-Gm-Gg: AZuq6aJPrHbflVnujJIzm/rqtEqnf+tVK5+79FpyXt/T3+abvLzh2N93bmQwGwndD0V
	MUc6AdMjB+t+NuDWoHb16b/uh0jjBa0ulLaPS2wkRUOPcsxbtbBENJW0T2Oh5icOEpLDK1eMqbM
	GFUjgdu9/C84WlwyFYO1tYxqRQGS41hfCAq1FTgaabipsm9dFmr6sGkTiyJRirgY1US78kwh9n3
	mykaqM3KSVUE6aMycr1iyJPnlAe1+Zew/E9sQX8yxoyM4pFtyMgHJX/2NyHrkMMfW1I+k0+Vr1H
	wjBggEP9Zooc2XeSodZhlIZMslEJ/cFwnvNI6zJaRq3U7IFgS4F6YVnD+eZBFp3osnQW+ER0n1S
	HYyo8XjBm43QtoE8ypVIJ0+Xx709oO/H4EnB3Ap50haNuBHlEvynrOqdVD7VpCnlkYEZEgpxYR2
	389DIDLN0YA+nVbxaiJ78Fe6k=
X-Received: by 2002:a05:6102:5492:b0:5db:d60a:6b1a with SMTP id ada2fe7eead31-5f723811ad4mr928516137.30.1769516591056;
        Tue, 27 Jan 2026 04:23:11 -0800 (PST)
X-Received: by 2002:a05:6102:5492:b0:5db:d60a:6b1a with SMTP id ada2fe7eead31-5f723811ad4mr928505137.30.1769516590620;
        Tue, 27 Jan 2026 04:23:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de492cc4asm3375442e87.101.2026.01.27.04.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 04:23:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 14:23:03 +0200
Subject: [PATCH v3 4/4] media: qcom: venus: flip the venus/iris switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-venus-iris-flip-switch-v3-4-7f37689f4b39@oss.qualcomm.com>
References: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
In-Reply-To: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4504;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=O6rDG01uuKhI+p5aawFUM6OGJMTB29WlyXqC3eML6Y0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpeK4mv48HyhHRJB1xy9Fj/VwTAdT9q4lho1IqU
 rhXjH45KUaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXiuJgAKCRCLPIo+Aiko
 1bpZCACbRjwawbbj4eT0N4rNQ6vV37xnqhofZJOQ1e1Ia1pEkDdMQ8HueJq2D8SR/ry2WEAfkX4
 imhemVutFwtlDR5BFNUK3FI8ESM5Xgl9+WKU3Mdohp1+rJr72IMerPenQFPvUiNd1ZX8+9DLbNu
 ujVN1Xz22XelD7HfZmIqN3nZNVUAXFHamKCWURQ/BJKpieCfaz+JkRat3neWgR0csqWSfxu0CRY
 xPYZlZJ7HVjGPSBksPrRCVL8Tb51Tk2HSdgZ/zUlXfSHzVIef5nUTBh8/CIhIb6qpA0TN6X7kR0
 I0csveL2bbEqwIlON7cgPQPJv86hAXNSlzyfZodlXhn0deZX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -4j7dxBPyzkmLsCEDXHeagFwiYx983LJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwMSBTYWx0ZWRfX9+0wjsrKeAwz
 /9pKgo7itk+rrZwdMsrAJotIFfSDMISvar7aY5Olxh++Szt0QIGhXFlDW4jsTZkh7i1tZtMW4Vp
 2EIu/XR/GihjJSTaK8pCHd4oTfcbLKXXVbfAfEOr1zbtPzZGDAdiord3wqBCLlCHOcRIFzGU9T+
 HrZfYSDGgrxHr7q9OzmVY2BrwJ/3eVc35GQGgyDFyitfmDc4LLbYawbfaxsnA8XH1BGx8gPXMCX
 iiW8puoDzt+bhYgx6G4r2ixbtxrAYlgzMReIr/2+kwcacg8UQo0nea8l8QzIS+8AcIuSZjP0DYm
 ngZZqmLx/p1gDwDxPZh1z2JAcF3CyVQs+sCaTtyfnp9WgI9kMqI0pwEAnjaaX2JC8rGZwxe29t8
 /Cra1wAb4bQUGg5xXyeEU2g++Fyy9436OoWe58rjMZVNyU5986btr6V6vHYrd17Zgh9icwqj34j
 AmylQ9ci6SQR3CGWGwA==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=6978ae30 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ch7mjRkEqDhx0_hr-tEA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: -4j7dxBPyzkmLsCEDXHeagFwiYx983LJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90765-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.30:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 44092944B1
X-Rspamd-Action: no action

With the Iris and Venus driver having more or less feature parity for
"HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
switch. Use Iris by default for SM8250 and SC7280, the platforms which
are supported by both drivers, and use Venus only if Iris is not
compiled at all. Use IS_ENABLED to strip out the code and data
structures which are used by the disabled platforms.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c |  2 --
 drivers/media/platform/qcom/venus/core.c      |  6 ++++++
 drivers/media/platform/qcom/venus/core.h      | 11 +++++++++++
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ec..7b612ad37e4f 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -352,7 +352,6 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,qcs8300-iris",
 		.data = &qcs8300_data,
 	},
-#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
 	{
 		.compatible = "qcom,sc7280-venus",
 		.data = &sc7280_data,
@@ -361,7 +360,6 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,sm8250-venus",
 		.data = &sm8250_data,
 	},
-#endif
 	{
 		.compatible = "qcom,sm8550-iris",
 		.data = &sm8550_data,
diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 24d2b2fd0340..646dae3407b4 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -949,6 +949,7 @@ static const struct venus_resources sc7180_res = {
 	.enc_nodename = "video-encoder",
 };
 
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 static const struct freq_tbl sm8250_freq_table[] = {
 	{ 0, 444000000 },
 	{ 0, 366000000 },
@@ -1069,6 +1070,7 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
+#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1125,11 +1127,15 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
+#endif
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
+#endif
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609..c7acacaa53b8 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -54,8 +54,10 @@ enum vpu_version {
 	VPU_VERSION_AR50,
 	VPU_VERSION_AR50_LITE,
 	VPU_VERSION_IRIS1,
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	VPU_VERSION_IRIS2,
 	VPU_VERSION_IRIS2_1,
+#endif
 };
 
 struct firmware_version {
@@ -525,13 +527,22 @@ struct venus_inst {
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
 #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
 #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 #define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
+#else
+#define IS_V6(core)	(0)
+#endif
 
 #define IS_AR50(core)		((core)->res->vpu_version == VPU_VERSION_AR50)
 #define IS_AR50_LITE(core)	((core)->res->vpu_version == VPU_VERSION_AR50_LITE)
 #define IS_IRIS1(core)		((core)->res->vpu_version == VPU_VERSION_IRIS1)
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 #define IS_IRIS2(core)		((core)->res->vpu_version == VPU_VERSION_IRIS2)
 #define IS_IRIS2_1(core)	((core)->res->vpu_version == VPU_VERSION_IRIS2_1)
+#else
+#define IS_IRIS2(core)		(0)
+#define IS_IRIS2_1(core)	(0)
+#endif
 
 static inline bool is_lite(struct venus_core *core)
 {

-- 
2.47.3


