Return-Path: <linux-arm-msm+bounces-89143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E4FD22DDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CACA30DACDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE5A336ED7;
	Thu, 15 Jan 2026 07:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWdUkPAy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iSK1tCQg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1979334C17
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768462160; cv=none; b=QtwOjqJXwjb07eTJI6GB07SFhHkj6D+dbkO04IFG7mAP3ihl3Lm5z0tubFcyJsYNVZtH4oO/Eo6smm7uaa4HGM4BtSN6dAv+VxK4N4giMS5WS+GloqqTo4zlZhi4FIbfRGxbaF8Dgsf+JBR70O5BHfXNny8YLBXo3BPMQ/0aTgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768462160; c=relaxed/simple;
	bh=hvUV50vOotIGhGSbBe1rDn0cVLNRTXQOwNKUgE/1HFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UzHrGEhyNr1bqetwDhbFwFVhCB2O3vMfB8F5USwk1fcG42TXFEceWdhP4lk+DsgypBvnp+mNFskaEn0b+5zEW/5uJKKhuCyjErSgef/UE/gFREMlZc4Lnbwwyl0sr0bWVawhSIpiACSmz9Tmw/Bma5M5WRRZi3q++UudbrX0HDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JWdUkPAy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iSK1tCQg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fqVb1745019
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ih7YS3OMF9nyIk8eRvbGlEtAYQc1C2qkylBgX1JHA3o=; b=JWdUkPAya1vw6Ha6
	tuxrqztRlb6d6UPyODapJfG/4WFlSfGPsR6gSeulBEi/WwOId5W8QatoqT95S+xd
	FXsf7amXdK39OohD1QSrT6EF0M3ZSSg3LNewn8X1LHRDYaYrYtUYikWLZ0hTmpFy
	4kqCgTbms4j4NVu/Zkzqk1Ni+m03B2euUAd5javLeczQqsTpOpwvtb4KkLxlEzQR
	9o1gNhVNk702OwdiIyjnTSgjtWw0cbOhkwPu3Ee978t7SiyUhp0K+Gld3BoPCMst
	/xx4G1xVquVji89u2E0vO/MFPkSMXPC5/awTr7THJK85hbpDzkSF9JV4aWGNkB8W
	vYcalw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2g68w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b234bae2a7so183376585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 23:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768462157; x=1769066957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ih7YS3OMF9nyIk8eRvbGlEtAYQc1C2qkylBgX1JHA3o=;
        b=iSK1tCQg/6axGDmtJC8g3wHOhRqDSO4rFnF8ogQqK3ZzF/I6s1Hl2RptetG4H2ip/i
         kZJPsjH6CFtTWfEUTHLbwKk5nn6BcpGF1OMfEMfAhA96NWWrdekVg9Z+bnqWd/wqtoZE
         M9mgrpZiTnpmsnkOB+uYuSoRUjDQsqc1ot1B5VUZWu0QfVOA2M8v90Bs6DufN7eTGiDd
         1F+hpYBR5EBrGnPqoamNR4r/XjbTbcV3L3veGq8HVcrI+/Ig/zVjbhHP4n4AMusx9Skb
         As07OIlz7HqtDvNGKTiJYmk7562Ly4CPWtVr5/lxJ1V2xs0meJ4xwAQCWaMF8i/YfH+U
         SHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768462157; x=1769066957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ih7YS3OMF9nyIk8eRvbGlEtAYQc1C2qkylBgX1JHA3o=;
        b=PfJ+KlTPxncx9bTEGEtjj4yxxh8cIiRBahcKb4QK6HAA7fMchLtqE7OfCyjC2f4ziQ
         iNbirLZuIOHMAlgRKefE4CQzYARAXXMP6l2PXQXOwP7/uWL8YMPjxdfJeBnnybPFnm3z
         EUANDNi8mCWNtSFfPPRdzpkv6BhCMsKGW8qfumXTNy7yAWKTwujeuQfPcOtRwIf0U+Jz
         6FhH4Faxj0OdjWVaY+Oy2uweUBgXAF/r5oydozLDWPU7X7fYIvnMv+F2wlCFt4Q//a9P
         1L/hMt/t9CiqjfF0tiIMnDGmi52vnyi0ffKgYFBN/YUdXI9VXZBXCqIfAs9x6ikCrOA3
         xQGg==
X-Gm-Message-State: AOJu0YxsQxQD0GulxxzWBIqn+fm4MZu0RaN4a7hLAKPSRC5QnFk44Ykb
	Pcc1+90bzRN4Uc8FkEnOll7ta2g/CUcE9dDBZY0yYYHi6n/aKYl+yYKPAlu/OUpPUAt3/FVrkfb
	v5uyvnSaxFiVjsdij6LCtYkTKRJenoP3qnoJoo9hOSt5ppZe85EQaNPSZMV7y/G3taLtcGN/VxU
	nA
X-Gm-Gg: AY/fxX5pf8jSDd5kY/f/WDzU8iQ/o84qv5TStkAK4OovUD6BDsZ09ysbbWJ9Pws8ASA
	khSZMDrfTZdMBZ76KjUb+BdOxfHzYGv4GiMCl6nz3acEj/QP2OLMSn01MsCyAVvPxKifvlIC2n1
	TGIjTNQW//zRh3wrWSQ4DSQ1ZXPy8uJ62EQkOhy0IoVgVpWyoZ5wqsb38HwGQpHRxeOdNzeeTVS
	9Ak7wXswbBhtMUyBVWPjexND+2mhbc7oNCvjMg1p0r4f8V/hLn+it/zjKognS/ylG7zWsJfmnog
	UhZ4L/+sei6oMtaVN+naEJZ4TclKAcCkuBgalFsJXyaP88zi6Zqrp79s2hDodHsVRzbdtUf32OU
	1dcedEJZras82aPfGi3Lja1vRrXEiQa+YxmzQmlHV3FHmYtqaVIHFsSyLsNpni9dsLcPo8GDCHR
	b0qRuTX7GT8qC8Dbm9lPYBMZ8=
X-Received: by 2002:a05:620a:3724:b0:8c5:2f89:6904 with SMTP id af79cd13be357-8c52fbdcde9mr656948385a.45.1768462156812;
        Wed, 14 Jan 2026 23:29:16 -0800 (PST)
X-Received: by 2002:a05:620a:3724:b0:8c5:2f89:6904 with SMTP id af79cd13be357-8c52fbdcde9mr656946085a.45.1768462156353;
        Wed, 14 Jan 2026 23:29:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7b1a4dsm58078801fa.17.2026.01.14.23.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 23:29:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 09:29:07 +0200
Subject: [PATCH v3 2/8] drm/msm/dp: Fix the ISR_* enum values
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-hpd-refactor-v3-2-08e2f3bcd2e0@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ww/3qknDh3ls3uKJd9KJ6MipP3FzUf7GXLi0EYvbbNM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaJdD8iaVfqQctF1fuYMmitxW2AoGGVd+jarYM
 1Fc+aQwmJCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWiXQwAKCRCLPIo+Aiko
 1RfXB/44P3jjfjIOIC2l0lP7Ir9d1o7Aixod0q7u6GLW2lFftilClKP7EunTO8cq+IgD3nTQoED
 XV+1shE9OCnUlvjQq2UFbAgh0AcfRQfTG2Y6ubtE2vu9Hl25KyfOLUuy+h9kPHcHC0d5jDuxMWi
 E4LdltEClbLp/C8+TGTVB953f653Aag/iSvoXlR7IzS2b9SCUECWHRptR0AXXuTztCnMRjJPAJB
 S1TsGwMhl5sTTae8WVxKHrTcvv93akl9G0vMgDcZ6FBDtTdnZx047GjVgy/K5AzWnTKlJgU1r0c
 1HD89JZ+9p+z3Nqe/P1ckmPFpMj87sTH26EtwBFAta3m/Mmh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfX6TdgpwkcdapE
 BSvj57kpM6+ephWtWUOgWqFd+tNSq4UX5Fbzoa5wD0b4AYBWBK8UpF067vF9w0hxAqCKmJBlVZ+
 lPJ+jlN1aAT0Kqbi80s1b5+YOo3y3mZJia+AMcQOGdYVkWsyBVczgYd3bf6O2d/C6Y+v2nhiixe
 5s6++BBICMPbtzw4N2RmxeXRqdd4JAz2qyENqwqmOIZ0/RcNuAaF2UHcHJHvyOj4Repp/HOKiQv
 YH32KTAJYXOF0v9naMZHDdpGjLJVEhXPXfUmsRfYzceBMD9aSphIQ7YoZx1B5Uirh+2XngMjNTG
 v4zPrsikoazEuTh6spATQrKXPClnkEoQ6GOmlIejehS027GmNVZNw0lkTYSQbMw1XDPgD1qEzBo
 WHzftWfqwlNKWg61ff+mt6wnQZmsxQCD6tTz5+emgVU0neDskJ36kO35T7w6mV5ojVxEaFzqZLg
 bT5cWq6uLoRNcIQmV0A==
X-Proofpoint-ORIG-GUID: iy5Pzm8gASuQZiA5eYH5IS845UekKmkY
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=6968974d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=aneus3DpQx8xEqIVSrsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: iy5Pzm8gASuQZiA5eYH5IS845UekKmkY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150049

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

The ISR_HPD_* enum should represent values that can be read from the
REG_DP_DP_HPD_INT_STATUS register. Swap ISR_HPD_IO_GLITCH_COUNT and
ISR_HPD_REPLUG_COUNT to map them correctly to register values.

While we are at it, correct the spelling for ISR_HPD_REPLUG_COUNT.

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 476848bf8cd1..5997cd28ba11 100644
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
2.47.3


