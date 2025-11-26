Return-Path: <linux-arm-msm+bounces-83367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C54C880C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 05:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BE293353C45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 04:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E2E30E856;
	Wed, 26 Nov 2025 04:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdpdLx/P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="irCIGYPw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4181307AD3
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764130997; cv=none; b=o+DqGLuLRmjOjIYgOEq6yuH4S2g2FxHoF6XCHw+26DVhVLBE9MKVpN55fFXJYRDWo2DL+TuTl09PZNgljPoBo31eSfSzOtMi2Cp00b/t541MCMyBjegXzuqz14i5eOOgi/Ejscx7A4b4Fz6sX5HVvfAfc/FHyTShrqYNDwMzatU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764130997; c=relaxed/simple;
	bh=zgCjYR5PaAdHp5cSNkkvKa5iHZekQNMYhW+StxLcdW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=R1k6k55YTspH+274Y9mwQF/azysWNEG3f7GB1KhAJQSbdNzCgDYcy44s8b4KushG2hx0bG6DQ2LkdWumPcG2fUHpLlikEpDiam7QLFRuERy8qB34BHE9tf1zWTigEpffcQcDpGSwufihwPJE2ipeb0nZTcM80hXjVcqFQgmBuAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QdpdLx/P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=irCIGYPw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ1dRLj3317499
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mA3f4NXMbHml+3MjRCSLdP
	qSfLgSxNeQQL4kyKta4x0=; b=QdpdLx/P9Qq85m6Z2DNONSysQsETKqPJVwMrK0
	jJLm6cR3fxSj2UByiMVgPAm/aWlwky1aQgjgRrisuQyTGImSGdjaGAc4cDOosEk+
	Jaw3YTPwarZEwRUz3t4FWZW0XILTYpm4Vg/J2bOsaW1boNNrzGjAEr4hUjKqPvfV
	VG4KonCy6y4Z9EmJRv6EuTkbTQaC9XSvz7nA72A/uN3aM4zfTkzjMX7CutYo5opU
	/BQlc2NzxaBAcE5lLq5Wd64MCpZ5OVR6GptVO8zgAaeeKj0ZbmXsKulOGjAAoz0a
	FD+sVjopx+3Z5P5bQtxoGT1VINwgCp+7w2SgvC8wgB4JYedA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4and2qj7nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:23:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3436d81a532so11719549a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 20:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764130993; x=1764735793; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mA3f4NXMbHml+3MjRCSLdPqSfLgSxNeQQL4kyKta4x0=;
        b=irCIGYPwpWt9efLktQD5udYHOw1shUKHOR9/5KM59W1vmUhz8SjrEWea2PM8wfW7Et
         f/Vm2x5av6Zx0WoTcwvg9WXcVvqsFZxq3Dx6rHa0Qtyk2Aw5ZTb7/LEfDL75isKjra04
         qMB1gfonIxKpDYoXb4jF1i2xr5J83nTdsdn3R8LInMTFn1U+hwK9FPACtA4lVJOnSl0W
         niVao9mKT5sfu2UPUCD0PvFDjA8H+zzobtB0F09tJEeAtipSak3Wz6HsKedOgw/6S/y6
         tU80u0djSK6DDaS84nxIwggKlWjGW5ZOp0m28tEwbjOycdaPTeFojSrDF8tC1cP7WaWl
         Gq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764130993; x=1764735793;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mA3f4NXMbHml+3MjRCSLdPqSfLgSxNeQQL4kyKta4x0=;
        b=annZsELQczbwn5sn+V7IQ1PCjHsspTuYVYETyFn8hJ0PWtFQOo7QuMPEXZTFwNgMF8
         BF1fJTws8jy86AI6BckdgEcf8UmGjjX30FefizhQKwo9MKJsHRyIAMrB5/gy6uwg9IPF
         ToPKS7XTskPyq2Znr93VRurGv8IYvHN/G3Q2cKJP14JTv7eSiX3+l6uDGiT3UHoifJyc
         7QYfYMNcoo8O6t+twXTg7fATKUSpu4jxQIMd+9I9V7vKJsryRIMOqyZD3x/wduz+8swc
         ghzPLrk7OYFb5TBtdA7spUxZZkqPbju0TlWJ7RxguGWxM6i0Y23s1+pCs8YlVEo+Umq7
         7gGw==
X-Forwarded-Encrypted: i=1; AJvYcCVUbj8BLWdRyO6P3MG80OehsWbxCpbqdkS6UVOv6E7lGM5dOsO/ZOcwJKowqJPoIJt5UVRN+Q8qaYHIU4bn@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ0mr5Qf/QV0njCc6qJ29qwZyKvr36hik+cKwDaOmCTMUBiVl6
	Hceo6HYgJMxWU386XQAQ5uEDwxTWC6sx0zkfnjO4kJxtRma1i1jjMFxKtqJBis3e3Ur5eaLWAPy
	URmPYhyS4sSpt4GwX0h48rwfbgmoFasXgQeBs8XnaQ1dVslxYpAeh3cExm4QES3VsKaR7yeRSWe
	s1mAc=
X-Gm-Gg: ASbGncuuIUUCWYCukPYWKZHk3IgfE5VPU6WnjccJsyonLDWBmfNckOr213kadW7Hvkl
	TwTFfWGq8DNTV+7vh38Xxwe+sw3IYdtbKWh40Lnbqu8xQKjAwy5a48R8Eiqw2qKAJSo4t42+E40
	JnEgCyriJy7Ym+RNU/nVG6ERiq/wW4GU26JiZ9+nYgZOWJIc3NcRvzrQy60F2Bbh3c4NR1z+kP2
	mW3TSVNkAfLSUyNZptSm06H5aToWGCLoC4iIiH72GfcQA+pNNcW0dAaJ6UwNZIIc2xeJSTfht/S
	VbdMiUXz0XkBlJw3zQLMus2+rVdbtyk2HHSHqvpUvmSTbQgO7uKo5bzbTUR9ScQWVPmKOARaIQ5
	U1goUcLj/RI6q5dlw/f/8hSfx3XumgRdbEin2UnDWLP60ox0WEfFNrFqDVijEAkVOr1mSiSfBpR
	ay9HOKXekMkrnEIA==
X-Received: by 2002:a17:903:3c46:b0:27e:dc53:d239 with SMTP id d9443c01a7336-29b6bf3b302mr215806205ad.35.1764130993453;
        Tue, 25 Nov 2025 20:23:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFB4bBbg3StUbit/NXOH0zAP7VM7mQNGo8fX8lTINSFH7JiZ4Mv27SRK1Kj9rodOQ4nYXGJuw==
X-Received: by 2002:a17:903:3c46:b0:27e:dc53:d239 with SMTP id d9443c01a7336-29b6bf3b302mr215805465ad.35.1764130992350;
        Tue, 25 Nov 2025 20:23:12 -0800 (PST)
Received: from hu-renjiang-sha.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b107effsm185495685ad.14.2025.11.25.20.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 20:23:12 -0800 (PST)
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 09:53:08 +0530
Subject: [PATCH] media: venus: vdec: fix error state assignment for zero
 bytesused
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-fix-error-state-v1-1-34f943a8b165@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKuAJmkC/yWMQQ7CIBBFr9LMWpICLWCvYroYYFAWbXVAY9L07
 hK7fD//vR0KcaYCU7cD0yeXvK0N5KWD8MD1TiLHxqB6NUqpjEj5K4h5Y1EqVhJqkE6jG7ULEZr
 1ZGqXf/E2n8z0erdwPUfwWEiEbVlynTpjdOyjxKQTUiJjdUCfBm98b60crugsRisTzMfxA6DdX
 H6tAAAA
X-Change-ID: 20251126-fix-error-state-24183a8538cd
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764130990; l=1849;
 i=renjiang.han@oss.qualcomm.com; s=20241001; h=from:subject:message-id;
 bh=zgCjYR5PaAdHp5cSNkkvKa5iHZekQNMYhW+StxLcdW4=;
 b=W2uwM6gTQWZ/1no2aXhKIz+lmHOyUNq04MNzEWUgFiTcDxc/PlhPTXjknno4eef5jBoWZvZDi
 I/hZUzHh1vkCBy40CjHInxe63eJvrxDXWzPeUSWpwxGBJaeJIrR6j3Q
X-Developer-Key: i=renjiang.han@oss.qualcomm.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAzMyBTYWx0ZWRfX+ZL9GQLkxjIR
 zqm7nn+ZKB63iCK0HfksZ+PFUI1eoLwsp0gziZexaHQgHEQ7RwcVlGrUpidxe7EBE0ZCVz6zn2b
 56WIbfjd/3xOOnZaDV+G9UdUvY5YCaUkpwjFEAekDxoxi5D9Fj3knlXXwRW7Ng+9OSC7MruTNP4
 VJzF9iT3IZw9bqps4FWKIlxG9KQ1i94Y7m/tXwd7lSr1Fj06nT930aMnRP/+w1knZ3b77zPxaQ2
 RH8+l75wCRS8qWrIju84ffYFUZL9R3dktoIHnKczKjlZDpb1QGT7jQJ3mEe0msGaije/6dVfg0H
 wt4qh1VRUfNXmFUdejLOY1Tyf1Y6HHzlrrdreIg9DbnmgGAwRat/Gc6QkFNnoS2DXoAhVQcZI3W
 R8hlO3wWazPCBzpwvGHpZC0g7dnHUA==
X-Authority-Analysis: v=2.4 cv=dZyNHHXe c=1 sm=1 tr=0 ts=692680b2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UCHoedPerF6s_gDRrecA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: OJiKdHgj0_YLt3RoWdBhd5BJB95gAFgw
X-Proofpoint-GUID: OJiKdHgj0_YLt3RoWdBhd5BJB95gAFgw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260033

Previously, the check for zero bytesused and the assignment of error
state was performed outside the V4L2_BUF_FLAG_LAST branch, which could
incorrectly set the error state during drain operations. This patch
moves the zero-bytesused check inside the 'else' branch, ensuring that
the error state is only set for non-EOS buffers with zero payload.

Additionally, the patch keeps the rest of the buffer state handling
logic unchanged, including handling of HFI_BUFFERFLAG_DATACORRUPT and
HFI_BUFFERFLAG_DROP_FRAME.

Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
---
This patch refines the error state assignment logic in the Venus vdec
driver for Qualcomm platforms. Specifically, it ensures that the buffer
state is only set to VB2_BUF_STATE_ERROR for non-EOS capture buffers
with zero bytesused, preventing false error reporting during drain
operations.
---
 drivers/media/platform/qcom/venus/vdec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 4a6641fdffcf79705893be58c7ec5cf485e2fab9..d0bd2d86a31f9a18cb68b08ba66affdf8fc5092d 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1440,10 +1440,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 				inst->drain_active = false;
 				inst->codec_state = VENUS_DEC_STATE_STOPPED;
 			}
+		} else {
+			if (!bytesused)
+				state = VB2_BUF_STATE_ERROR;
 		}
-
-		if (!bytesused)
-			state = VB2_BUF_STATE_ERROR;
 	} else {
 		vbuf->sequence = inst->sequence_out++;
 	}

---
base-commit: 663d0d1af3faefe673cabf4b6b077149a87ad71f
change-id: 20251126-fix-error-state-24183a8538cd

Best regards,
-- 
Renjiang Han <renjiang.han@oss.qualcomm.com>


