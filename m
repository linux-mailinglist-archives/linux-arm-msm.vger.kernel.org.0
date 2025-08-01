Return-Path: <linux-arm-msm+bounces-67421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F947B18708
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 20:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CA417AC446
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 17:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED1E28D8C7;
	Fri,  1 Aug 2025 18:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzLsOGhn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49EA28D823
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 18:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754071222; cv=none; b=S4lL8pciKgZptIrv7cbsi8oobzt5N5h1Hcyqzl0Se36EAjD9s4O1NCL0ts1poqWxpE0Ify9yAI8iBRZUmY00uSLFRr5Wzai6iFizW0j2kRyBenJEbiwgs/svA+7dvA0jxsXnslt4eoZvAjY3GO3Sw9AhMGn1TOHjore3WSWWFmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754071222; c=relaxed/simple;
	bh=OjCcQPQrfynntfXQWE1QbRhM4jxC/iuvd0QhrBx8e+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s3jEvKCWpf0WeKQ/vFJkpgQCPrGPsoGEa6rbxtWbAI40y7WnyuPTfGX9IJpyqi0+UoxpQ3hkIlx6Y7G6DYqtwIMDAAhetiAI1kYKAf9U2oSmDqfiJUAevgpebtfEHqa1SN97/JNP1BzKIit9tNsnxDTI5JStrZ/jvWbCemHaVG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzLsOGhn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HfQdK028603
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 18:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JAyYn1wklNQ
	c4y389Esg9VJ4y6TS3xXtsI3mzf8UH2Q=; b=dzLsOGhnul4nZ5I7+cQsdMKEAmV
	gy5K7ViT1KebwdmpHhsypAx1PONroiKyBavoudtKCdQNorSg+gMmGFdpq6cesjML
	fKvxyLVeGv+cA1HYQ9yuw2ssO5F9097RZP276dHkgy+ulIsuQGqP9L6AXqwTbhgx
	Y7ForzOSJnf6lfeY1aTzNP84TvmYbjGXEcfDstVT7uqja8L+fpK5l4xCq/la9GX+
	axyTjm3WGDRuO4H3+ZC23Yh+ocAwpA4vJslTLl25v6TqYwDPuc/dS1zvtpPz2k28
	lRgFBPeTnk1BVFNpEnJSWwnsds5omm1fcBaEeGgEmpkrPrzwjnWs2B/QtsA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q86d59x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 18:00:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23fe28867b7so15020685ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 11:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754071219; x=1754676019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAyYn1wklNQc4y389Esg9VJ4y6TS3xXtsI3mzf8UH2Q=;
        b=Bh5kqKaSelbz+8Crbf85/4N3DfXrCPChT5yx4oOfmA5/+QnFA2TmS7RoiteCfN0iX1
         Y/tLE2pdq3tf+mfHowN95nxOGXJ7hudSmv2XgHfJHQsd3ak//jcEtzc9ZIQTfjJXJ/JI
         iVCz2Nz2rdK9kjw3eUOxg+YhRVIfhzjdOAG13Bh3sWofK6siUaqt7Nd1fULwdFg6yW0J
         g5rQ+txaB7wG9djzOb/bFIxlDYBKlvQPxBgpLTpD/fzGhn/laHuJDHhu8GdvxFiSBQ4Z
         9eADc+sx9PIedfVJ+wQaotKXKEH3BiBw/sEcXVD4bq/ak3XJPbLCZRBSLNn+3pKfEgdg
         0p6g==
X-Gm-Message-State: AOJu0YyyfS2XLRb/tXUct1gt9ttes6pI3be3Xyz6sHV2Wl3BQeoM4XF4
	jIOu7ZK4p7Lk8y/5C3Zy+3PXkp6KY76NwaY1RLLUWJcsgEOTMx1keA00sqPdAuYuyhCyeBNrOI9
	5YgeqqM+1X90/ZuFBoEP4tMt75fmD2ZfYG8x0uZWfYRmwM4Wq7GRBifWahOvEdwKRdFN3
X-Gm-Gg: ASbGncvxLRHB5mR+SligEvzAoOvkmmNuKGAn+fwlmSaAFlBGgE4bh1GO9V7vD4GXlOd
	BJaCJdgw0NgFRGs3Y9p9DNpiUKzOIAgSP9lA3e8OYW/IJUU6x2PAmX1BCnVzHSdYC5oDI1W9pvi
	/x6jg8pl4zEiF9dbbtmHEYp7eTDGE2POUESPCn0IGxJizG5XB2NO/iStOC0DVkd7+A3rSvGBbNW
	IBrXRF8YaLWSSHlSCrcr2C0ALXj1hS9880tn0EYuh2ap4Qwr8Sg5y6lH1frk5eMd+x8IU8ErcY3
	6X39L891Vbnglr8+GDlPcCumP4oZZE3xBevRxf5v1xDgKP9Lxzs=
X-Received: by 2002:a17:903:110c:b0:235:f078:4746 with SMTP id d9443c01a7336-24247030c77mr4913415ad.42.1754071218950;
        Fri, 01 Aug 2025 11:00:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq88m/8XtM65tFOPvwPzp0RMN6Lo0LKYxRrxCCtaSzhjaCvj19hJqOoPXnJBjwX5k93B39mA==
X-Received: by 2002:a17:903:110c:b0:235:f078:4746 with SMTP id d9443c01a7336-24247030c77mr4912905ad.42.1754071218424;
        Fri, 01 Aug 2025 11:00:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b43dsm48563275ad.136.2025.08.01.11.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 11:00:17 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 3/7] drm/msm: Fix order of selector programming in cluster snapshot
Date: Fri,  1 Aug 2025 11:00:00 -0700
Message-ID: <20250801180009.345662-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
References: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDE0MSBTYWx0ZWRfXwf86lh36+DEQ
 tBz74rZ8KqtNKoM/Y8r9QuNf+gzjkoKLo5AiLfBQtv1EmmiJO0vIBgKbxxfLXeWamZracvuBEND
 2vf5EpE7BeY8PjTm9RKgRAMjUl5fYrUrUv2fQs6vS31ybz9IGV3OpNqCqwx/5+fIoOkXZYQXpa9
 GLAUn8x6pkIZqF5UlIWbuPzJKj9x2JUGqO66LUV2h9dO4luhK+FXnrQZVsCLgPg1YfNBYxrV8vl
 EXHBHgSI9Nj7fgDoGrtnGBR2Ica8zaAGnBTrZkmATaPVs5PN8xwevNJj8cyiit0yWQga/T+LKJY
 JxrkPGHHzzo+XdnMDgxs3hgOSmH1u8IQhaXsi/LHmfkfsTjoKmF1g1ptOKGD/8Jt5+jniVil+SO
 Ofu1MYPJkyUxn1IGBS3ZRMT6n9DTd771uocSGPw54IhjU1Xmztzt4FjF/dn0I2UWP1esSgyS
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=688d00b3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=5vtJ6i-I-lkEOiUwjbYA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 9eDQJZF6gx5zuph_7av1kTr5DdHaP5-u
X-Proofpoint-GUID: 9eDQJZF6gx5zuph_7av1kTr5DdHaP5-u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010141

Program the selector _after_ selecting the aperture.  This aligns with
the downstream driver, and fixes a case where we were failing to capture
ctx0 regs (and presumably what we thought were ctx1 regs were actually
ctx0).

Suggested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index a35cec606d59..5204b28fd7f9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -759,15 +759,15 @@ static void a7xx_get_cluster(struct msm_gpu *gpu,
 	size_t datasize;
 	int i, regcount = 0;
 
-	/* Some clusters need a selector register to be programmed too */
-	if (cluster->sel)
-		in += CRASHDUMP_WRITE(in, cluster->sel->cd_reg, cluster->sel->val);
-
 	in += CRASHDUMP_WRITE(in, REG_A7XX_CP_APERTURE_CNTL_CD,
 		A7XX_CP_APERTURE_CNTL_CD_PIPE(cluster->pipe_id) |
 		A7XX_CP_APERTURE_CNTL_CD_CLUSTER(cluster->cluster_id) |
 		A7XX_CP_APERTURE_CNTL_CD_CONTEXT(cluster->context_id));
 
+	/* Some clusters need a selector register to be programmed too */
+	if (cluster->sel)
+		in += CRASHDUMP_WRITE(in, cluster->sel->cd_reg, cluster->sel->val);
+
 	for (i = 0; cluster->regs[i] != UINT_MAX; i += 2) {
 		int count = RANGE(cluster->regs, i);
 
-- 
2.50.1


