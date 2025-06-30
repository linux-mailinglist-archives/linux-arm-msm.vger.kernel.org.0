Return-Path: <linux-arm-msm+bounces-63113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B025AEE68A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 20:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6707B16BB5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 18:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE912571C7;
	Mon, 30 Jun 2025 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHzydmNQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6032E7186
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306987; cv=none; b=X4UmItG6aiSfFUTQHCMVxDDk+tu+19//odzo+9prPSnS1y/vKexnOp++UDYPVd28oGD37XlzD/bOryY0F1nKN7ncZjKraCjPBX5l9oJOwcGQqekiHJ3sWqYp/51ugWsU1IgP2SQ3BtqkzoPln+mWw88wtIHrzcziS7lEqIP8/Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306987; c=relaxed/simple;
	bh=ZgWVypTD1COLek6c9tCRLw3bw40kN85cu/9O7Xy9ffQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SybFW7nPzfi8HTiU1gSF+u4PxAu+y3w55HJLL7DlLcknZ1uqhA2VXrw+KbQByps1fBXYhwE26rbgzUusa1aNJdMNYhCSGURm3aN0IQ5RK+N7wQUkDpAMN6c+qsx1n9zeVTljc6+pvbPwhQjeMd8Imo5XX1T+YRJt5KTxk4q33u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bHzydmNQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFVQSr000324
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ledPMpTWELS
	QJRePU6zVKWClM+7ulZ3H+KHRTzRaaUA=; b=bHzydmNQh8C4XTMLZGVr3vn/p6s
	uVOXLE4hIbkGlEKDRBWgJaLWcfkbE3aS3tKMMeF96OcYJGGgbhUb7qMVjI4cedWk
	D+d0HpRABBdVuPk60E5gqQ2PLqJzPiVrlrG/doLR2qwb3QWUTHjlRCTCofwIDOtA
	Sjb31c7iUVrKXRv5LaImKEPSkjS2/UuCKQ1vMZ3BFFm4I0iV37Dr3mQg7s1Iqa8o
	rqkKyf14hhk+ceW03nbzvsN3WlHxjsKKI8wM2Fx3FKyzXJvEQLYI8dxB3K/46ZpB
	WoSt6h+GUfdoRO2odfUueoWT5zdVZWxXjqpCudYQjOlGOIKjrdvGLK2Ah2g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm5rav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2c36d3f884so1902615a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 11:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751306983; x=1751911783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ledPMpTWELSQJRePU6zVKWClM+7ulZ3H+KHRTzRaaUA=;
        b=sm+vmQ01vt0IXXSDhJEBSM0UdXCQY0B5iXixxX2rpNmg82tUvKw9soJFtJeiqp1a80
         y2WQ+9oswcyOS143OTM/IaY9OxmHh2ImLgsRCkb9ZxM9qIrDLOXuSIAqUEbSKpPLBbcV
         K70qEcicjF1Y+TdJoeUQA/fzGdjA7QDZJJEvlX+LqOa7upFQARoW4BfTSoYorCcvYuRg
         cy3E4BZdREL9aGtfOhTjLipldZOE8Eg6+VxqBabhrOB9p++kuAzWF2zDwVz+M9bLXmQ/
         GXq2i1kuIxvLIiop+I3OfcvTM509EI60Q0dG8wAPybYZg6GwjnQOCsh7CVrKNGut/a7h
         NEHg==
X-Gm-Message-State: AOJu0Yy/xKZDcwtr62w5DqXECqjbkg3+L1SLRR2KNONsCjz3oBiYaXuC
	mk5zuQIfbYt9pdW1TXzeNxWIFVFoQE/0+wGVCc0X51vMnGGDCgxysjq8s/BznL02ILAuJCvViQ1
	ftzv5LMLw6Uwijl9q75eBs9TOvES2uZwrKul5JwryjV56qXgWnjliWDLo4apyRePYIWG1
X-Gm-Gg: ASbGncugrqy8NW96VHcktnqZjQYzqZnikKL/FcvUjEXmH5GDBZysAjx5BnzpRBw2zo9
	DSDUk++rTc7/P6O22QfTtzEtpWdUSwoMHAJ/TuJH8YNJlyGziqTeY0HUv0v1clyRLPjsovaLUcU
	oPFiYzbNpVrRdNgBjSFciTmhjvrh2Sh/ipdwP3IlqdK/55sx8SUG+vNisuMvSshQh41VwCPgZo2
	b6a61DdsQdj4qiKG4iAex2TvO43zN3be3fRdZvQKMpNpSBQfRpv/ctUn0BKYeaqBPRV8/vUfBvM
	zO3NK9rwpx4/Zik+goYz39bsyEj6bRZV+w==
X-Received: by 2002:a05:6a21:6d91:b0:220:10f9:c99f with SMTP id adf61e73a8af0-220a16ebb23mr23391260637.25.1751306983576;
        Mon, 30 Jun 2025 11:09:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHxgDA/2hdrci7CdwulDX+7LZwb8o0NSAmSWgKVJFE5PGUtcgCs/T/JwBf1IB9rohUfQMu+w==
X-Received: by 2002:a05:6a21:6d91:b0:220:10f9:c99f with SMTP id adf61e73a8af0-220a16ebb23mr23391223637.25.1751306983143;
        Mon, 30 Jun 2025 11:09:43 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31bea0bsm8558468a12.41.2025.06.30.11.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 11:09:42 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH igt 9/9] msm/mapping: Free devcore
Date: Mon, 30 Jun 2025 11:09:03 -0700
Message-ID: <20250630180903.77990-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6862d2e8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=YG-Ktf8kLO1V0yi116gA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 7HCYfsL1QNrDE4FwJy0ttlv1-ysFzfpR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0NiBTYWx0ZWRfX7pwxp2UDpVnN
 zJhQny/Nbz+5lHE8KT51hvIvP6i3q6UBCCOdJdTzJ24+WnIfWU2ilmau4295EBAYnlkYC5pDlbj
 kPMXwwqrpl0sF3JJbTtVjEeoNUqLG762FUDZiNkRc0GJjeQSpt35/dyvrymwY/gNBSmlroSfeRR
 ojni6iet2b72s6ySSKgoO3hKPwz29bKjLi/7Pl+4PlQnVCKTz/wuSHmosJCNhzxligdfkrivFBw
 TOUX4/xPrXN2qmcP/N92ibKn96hcovPpgWUmOb/2BLXhWhBrIo3QDXmF/2Nm19bqXtdjHpu37go
 4Lm5pN6hZTPufiODylcL/R0vH1A/iCadxiQKl++PImbDmwLwcPEGcXte3TTQGZUglw10twaT/bh
 DTXX6jnrjU5R5FhYbwfIZ7965IDAdQLsDu3NX7xA9ndENUA7/uZk4eEbL9toUfLomFuIUgUM
X-Proofpoint-GUID: 7HCYfsL1QNrDE4FwJy0ttlv1-ysFzfpR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300146

From: Rob Clark <rob.clark@oss.qualcomm.com>

We shouldn't leak the devcore.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 7e2f5c7eadc8..b735d5f014c3 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -249,6 +249,8 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
 	igt_fail_on(ret != 1);
 	igt_fail_on(addr != fault_addr);
 
+	free(devcore);
+
 	/* Wait for stall-on-fault to re-enable, otherwise the next sub-test
 	 * would not generate a devcore:
 	 */
-- 
2.50.0


