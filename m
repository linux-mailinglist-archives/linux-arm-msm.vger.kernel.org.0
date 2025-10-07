Return-Path: <linux-arm-msm+bounces-76238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7728BC2183
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 18:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 924703E0DA5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 16:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0028C2E7BC1;
	Tue,  7 Oct 2025 16:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hrM1veyE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637592E7658
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 16:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759853974; cv=none; b=O2DQy2dnK/AcxYsqVWjTRK5KIZuPKSVPlBqX4o0JkkT6smGD5A4HwXaBYu5uNiyqKu+bJE1llPcR8zjMEDf/94dDsJ2/kw8kGZ/obOUtmipVyYTNu5kXCI8B6iH0XWRzyHOrPZnpBEcc6g89Ug7D6kl8/X++OwoKZJTUt96MpWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759853974; c=relaxed/simple;
	bh=RK8HgdbGAR9l+ozobU1+H63IgRhiRn6B8++ErI69yHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NwYAzfuJTeNR3uGirW35GsNqXPcTLd6xTR14yyw2WjaG8XLR9dXNnx02wjNuDTOGuatGIL0VT4V5zYGTHhPXNYvkEVx3sMvSgTFpKVjNlFroK1QujMuo6RaIfx4sdtrwR6ISrJrZkFnwDTqebF2/ZTv/LdpX2anzg2WjIBYjhAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hrM1veyE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETLIQ020777
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 16:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=K/W8W3/0EUILvvxrJjSwA/7Ax2aIlR0htR3
	Tzr1QAao=; b=hrM1veyE2WcuzXt2xg5JqDAQRM46v7yOXf8/18e/OnBqBNKQQll
	I+ADJx6VifwDxlr0tBLzQM50l+mEtDsxWcwEyIgjvx3uFQOxnJknKRj1ga34yTxu
	6k110atFeC8qlOcXPT7xAXYA8yRJMo9DzxDxSNwJlh+k5Kqpe8LWPCv6+jiX4SI7
	wyAHOocDoB3IsrUkkINUAnBX9jz9mURXH81ylfM87QN4W2Swf+Ou0ndg4ENdvcLv
	HrbZA9VJCN4tgRDc9X95+TMDazOiOKnm/OdynavE066/nCzaTbpvdrut3YBQGYjJ
	Fjf0lhrlg47dBwRWK+VSv1se5FbhgCVGdvA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9e01tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 16:19:32 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-54a8ab48935so9654226e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 09:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759853971; x=1760458771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/W8W3/0EUILvvxrJjSwA/7Ax2aIlR0htR3Tzr1QAao=;
        b=JkHdLB5bzwJz0kALza7FhZDq/+6Nt2g0fMG0I9JfP7ZnAu0TazWdnrEc09YWZOMRhq
         03ISwewdqboCWwYtWVoav8AfLeEVUNHfIg0+EMBPw1ch1+1arGZIcLDtbstKO6bC9zkf
         YmNrq5TV6M8GjYoElFiqgxSU0Gi3XJgt+3NuXIGoy3GNHSdScpC3q8TAV6B9LRLD+CBO
         GG7MB1ssNX5hdppBhe+1KXY5M0c2lBOg0EK9Q+Mnqu/KZrHZ96+h1eTKyIIlcfs/omTB
         zPzkEz7HdyTlA8I1DOdvjThowmS2dBcxe51Ve1Eh3U6rFbGurX5dQwmoH5u15ukfPWfV
         Wm7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHIOIie7scdzS8l9aWjp1i72J35sa11sW45ET3uC7OKqeHIayUDwuNhD9NTMcIlY27r9kG3+4fyb7b8L7b@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6c2qxT9wNopoNNQpHKt2uR193j+QROGIcYkzj0H7Lnlppax9N
	zchDr0Tnoi1eavagL4vWKJvEwfMGz1f+HgP82oD1xNX2Xr5TCqIyl0uBEiMLrj83CieoIdrArY2
	PoSpENTAr2gTWxYtfVWWzy+FMhaEcTLT3ax3qcojws7Es12LMY2ObyCtoG5LHk8EEzSeC
X-Gm-Gg: ASbGncvxVNquSqNZmfMyQSXtSR1/43gjG9UezgwevSDcY5AcHDtACi+Yy3TPgWUXiDj
	MmMtR/BBkq3/IWjcaoEB48zf+pU++wy2vp625YsNWPBvy8LuMWKRDkwKrUdgU8C8B2FEwVHT0lb
	JsHy8VCTncB6EeokJeVNJ0zMkysE9rJpF+mnE/bkF/lP7L4xwOHHfErjV99bUUeif7QSWD4oiof
	B1PzPe8noY+eW8ds6UwNgKTNpBfzpo19koLMvv1Fu+0Oxaqkz18mFr8lMKxCa+54ZxItZFFEXDC
	iKSsDpv/JaU1d2i87zObo7x+O9wsJrbqLtixe+E+szcxCA9CLV/8NjhCnFyWZnz8guoXPSu9b4V
	xSS2sCtJfow==
X-Received: by 2002:a05:6122:d03:b0:54b:d7b6:2edb with SMTP id 71dfb90a1353d-554b8b42b9dmr96533e0c.8.1759853971039;
        Tue, 07 Oct 2025 09:19:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6CIDr20wttQUFHuKoMRS1z88oWLbD18Uj+fbrWFmwKD20DyvsJJivv3KxooiNO7LmQC1DVQ==
X-Received: by 2002:a05:6122:d03:b0:54b:d7b6:2edb with SMTP id 71dfb90a1353d-554b8b42b9dmr96503e0c.8.1759853970566;
        Tue, 07 Oct 2025 09:19:30 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4e49esm1427128766b.72.2025.10.07.09.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:19:30 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Add tz_qti_config.mbn entry for AIC200
Date: Tue,  7 Oct 2025 18:19:29 +0200
Message-ID: <20251007161929.426336-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e53d94 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=m9KQAbKLkPdkf-ZUn-cA:9
 a=tNoRWFLymzeba-QzToBc:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: o_goQWiBO9178bqs14UFHdBdCdc6M3L5
X-Proofpoint-ORIG-GUID: o_goQWiBO9178bqs14UFHdBdCdc6M3L5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfXxs2j+YfkRzzb
 ++3QRNxbiHstXRofaKCtd4SumotiQTJ2aYoUqtHBPn8TcpGig4rxVOl+RHsYj2gSxggIFO9HosF
 npg2lxIbhHL/X8zHfGsSoMWAWOt8vHbfsAPxGA1L6w2MgcB1146uhvuaYzo6Ta6MTdT1v0qPuR4
 F6nMRkcGOvWjU7l2Nxgz8LPG36GKm45IBYYeIqezCdlQ0mTUNytzJx0Zi9WhmajGFl+v5HE1o82
 xCrCt8g5W2t1Muh6PhOGRBrF+OwlwWcAlVQHSBLo1YWqmxRRV8vhLBsmx1ixI5z30txC1Ru0RPE
 Hp5DRfx8UtwzE37mBsEAD+g/6OAtS+JXaZRwC8QB1//NFP4JGVlBtnXGHldkc2AAYVbLLStW4bZ
 4f+6JwkvCGvwIZYh+4Wx1CjReorO3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004

From: Youssef Samir <quic_yabdulra@quicinc.com>

Update the Sahara image table for the AIC200 to add an entry for
tz_qti_config.mbn at id 76.

Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/sahara.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 3ebcc1f7ff58..2a7b3f725de6 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -214,6 +214,7 @@ static const char * const aic200_image_table[] = {
 	[73] = "qcom/aic200/gearvm.mbn",
 	[74] = "qcom/aic200/sti.bin",
 	[75] = "qcom/aic200/pvs.bin",
+	[76] = "qcom/aic200/tz_qti_config.mbn",
 };
 
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
-- 
2.43.0


