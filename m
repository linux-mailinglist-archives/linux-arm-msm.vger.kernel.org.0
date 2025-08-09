Return-Path: <linux-arm-msm+bounces-68138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4D1B1F18E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 02:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 067A47AEACE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 00:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E0123816A;
	Sat,  9 Aug 2025 00:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AeqcSjQ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0032376EC
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 00:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754699742; cv=none; b=Sw3zBDYdA7PhkkGdIAYS67x2Q+2J0OWCENRSgxUvwohfcD0RChzxJujKNHaMzfgCQe/dwzLL1yFRxW6YjcbTtZLpfRd5AfJLelb+tI3/Nb1o7oitGIbHSqBe6cxpnP/9uY2/EwpYFfS+4h0Oqrmby/m1ZoLmiqZ+o1zQESoU4J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754699742; c=relaxed/simple;
	bh=4dI75xSUxUaqLwUMy3UReh9bT/U4ccPbg+CHWdIsNCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UrMZI8EADP7mtg1cWSVYq11io96AiO+CZ3fiayXaERSUBmdTwG4FgQ3EYhLhuT7RrNBPoHvlEaJCI0mI1dPlNXWXMHEjrFv1NubriWzW/fwsFS0tD1NfJ48J33mmQrB90vJJirkMdqF58GQs08/ihw7eKCcLF1Dkc1RpY9kEX5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AeqcSjQ6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578JQuuH019525
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 00:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bOPqaygyz1VOMQKkg7WWHDM49dkikPWmvYtJ6Qfvgpg=; b=AeqcSjQ6V54+/n8k
	degUFSHzA1jYAR6Cnb/jnjHLc05nlzwYXU/C0IZpkFj/52KUxn+PR/vdNJo9V0T5
	4KPbzl9qOeLINoGIoubbNSPN2Ib2XHUMVLY071KTYOxH1buG0QLNLv51+4af2S0g
	bL3FOZ1Bv699JQztT5va2Qpq1dLg4yeU0B+j2/v9ue22BpWRWpWapTZQMPEistWr
	mvpFoc7imTfZfba5aNhawYnMUT5SetJj/6ZzHlzv06z/5qzW8gSc97GWL9L3Yo1M
	JhPBJLyoldCPhykn5k2k8JFgzGt4UcEN7G3EtSt2xvjjZ9uCy5BE/xdSIx0UVJj2
	I2QTpA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8kjgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:35:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76bb73b63d2so2894512b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 17:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754699739; x=1755304539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOPqaygyz1VOMQKkg7WWHDM49dkikPWmvYtJ6Qfvgpg=;
        b=OZhtjpB+KBwe29bTWaBmqjEzZdt6kDWxC9c4P4IHsO2YXLfnYVTM6Zrfhdylj37/iY
         oEaLCOc/nDN2jI6U11J9YAcN7pndd5SqCBYCcLu1DAAEoIWSVVJDDSC1GqQsZ2+eKapY
         JjeJKU7UiPC4CDRXcjjhHq6qLEGyUzZvMSaWu+P+DykoZHPms3k4202nsyLQeE4nWSNx
         owLCejb5bava/ysJmrFSyu9gUjha1K/3XPSoPTIoYbX9Imt3Rs1z4XQPiZP+XW0IQPdU
         LdFHvVD7/l6bKvUN+MprRdjIEK+YSXe1TwDzbnMyTmo59U7gDVQdz3VGnGs+Mipl7j1t
         TirA==
X-Gm-Message-State: AOJu0YymDrcZC+1Kq6//0F8Dqvc7tnJZXP4llZ9ozZDsAKprZ/93fr6a
	WRXxfuh1UGhZrefIx8X8cOdeZMlVaDbNW/awprs5V1g6kHbTGf9C+rKAPgSBLgF276GvcdxoUmd
	Hjcs5hzaNGtxGnispXFgidLseUwYtuLQAt/CEVjoNQLkrpNHPmi9wmZN45JQKL7siB38ESs9I8L
	uu
X-Gm-Gg: ASbGncv3BYu1DZUKs+kUfm7jxils+0WiW0yq9D60vF7H2KO4oHa6TRUV1LC5VRDOPTy
	BT0I9wI+cLONqYzjpLXSo40EOOL+nqLipin8p3SYayXpVRsC345aCKuajuU6HZDOPQ9BtcF681L
	Qvl+LCAlXyUid9+LMZ0vQ00pU08/MUfUgdPAgnVnN7mE2D2okZ1JZ4f4hv03ekDJtV93QChD62k
	kobErCK/P8k0ze/RQlBJ4r3x+yC63veBjqAtQDFvOsKehF4EVki++/jLbn9RiSC9Uq9lW4CyP5M
	iqq023/W2qGR1iJbzhUfrnxuTPyTaUe6WpPEkp3DY1itlezlN+R8lJoA8vRrGGHhTwZ2mE12Iyx
	1FLSQlvrrsntMAsyGf9WBo/DB
X-Received: by 2002:a17:903:1b4e:b0:242:9bc4:f1c9 with SMTP id d9443c01a7336-242c22a0e73mr68472515ad.56.1754699738798;
        Fri, 08 Aug 2025 17:35:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG90TkpPOHu3ik+v+Qlm6PmhiW122lbzmzkgxapd9Ri+VnBLxN8IwuH859qvbq5t5KTGtZyKQ==
X-Received: by 2002:a17:903:1b4e:b0:242:9bc4:f1c9 with SMTP id d9443c01a7336-242c22a0e73mr68472205ad.56.1754699738343;
        Fri, 08 Aug 2025 17:35:38 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 17:35:38 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:14 -0700
Subject: [PATCH v2 02/12] drm/msm/dp: Fix the ISR_* enum values
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-2-7f4e1e741aa3@oss.qualcomm.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=951;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=4dI75xSUxUaqLwUMy3UReh9bT/U4ccPbg+CHWdIsNCg=;
 b=9v7t/t5zjvmt0SS7wNe7gTFJ1P3lQd6ZvEw9FvAt79V9e3RldlmDsTJIL0pzQssWYKovivqqU
 IliiZxToWPaBt9Ldj8dLeYd1tzf06Yme4Xmh0XGrjLZQJwBpdZRzhZN
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: B1DtxXbH8ie44JNXxO1imEqGZY_4iq0d
X-Proofpoint-ORIG-GUID: B1DtxXbH8ie44JNXxO1imEqGZY_4iq0d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX7EQTdULkLIrS
 HWB632fz7WkvAe20aUdWmlBK94pGFuc8ruLY2CRf0doKAYutlVNOBBXfPJ+k4i+K9C4/muHLn2P
 RCPQ4KEKg7PSlKh8bgECDUWviwM31PxAz7gaMOaaWPLlCv4K/C3j+z8H/K7MWech0vAmRd6jGoV
 R7WgBO/67UWpWMBQARv/tiPQrRlFM61iELuKszscJy9CSHAyFmLlpMbRv41UehUuQPQ34QO1Jd3
 Uw2zPtMBEwp9N4+RFiRe4n47B0mrDUTa2Wg9uZLVfx4txhPT3PN8FGy9kjCsy01hEXEfe9Pc7/6
 TjNOWMDP5hJSiOhcH9gOCzlEDjLMNqXShbcX1IxXdj6N9PYFKC7Jc3PcB95wz6zbuS3RJ4c6Ajr
 dT9t9KKh
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=689697db cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=rrNbjNIy7db4sKJtjcAA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

ISR_HPD_IO_GLITCH_COUNT and ISR_HPD_REPLUG_COUNT are not in the correct
order. Swap them so that the ISR_* enum will have the correct values.

Also, correct the spelling for ISR_HPD_REPLUG_COUNT.

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3..bfcb39ff89e0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -38,9 +38,9 @@ enum {
 	ISR_DISCONNECTED,
 	ISR_CONNECT_PENDING,
 	ISR_CONNECTED,
-	ISR_HPD_REPLUG_COUNT,
+	ISR_HPD_IO_GLITCH_COUNT,
 	ISR_IRQ_HPD_PULSE_COUNT,
-	ISR_HPD_LO_GLITH_COUNT,
+	ISR_HPD_REPLUG_COUNT,
 };
 
 /* event thread connection state */

-- 
2.50.1


