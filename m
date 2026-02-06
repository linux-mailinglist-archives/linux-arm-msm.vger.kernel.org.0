Return-Path: <linux-arm-msm+bounces-92084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMxAJwQphmmSKAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 18:46:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08305101588
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 18:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC1E03099C0B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 17:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3FA41C2F9;
	Fri,  6 Feb 2026 17:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MIgtPWhP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q4ys4HuJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEBA38F92C
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 17:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399714; cv=none; b=XSC7v/YzQfQ0SSu0SAIBNF65dejggdNsnWFonlZCIjwFT7aLGI+rB/TcSka7pWab7R+4XZEUo0C6WVcl6fiePKDFeB1ZSL/YhsUJtk3GIxakW2FEmjvDWUQ18Of++uGOCnVin9ileNuoQXjI9UpUYRYvxPU57mK5oVKeKILtQwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399714; c=relaxed/simple;
	bh=vinpJK3AdlE6QuECVjsA4xyKYusB2fCdpA1B0h1Sv7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GWB1ODlf1XmIaJayQQUB24fmIhIgua74z0DyrM3acVPOvu1UGBLUsBKyju9pVtH4h1cd8jn2nrNUgIL0sX9ebX68hGr5l2RivFx29alaU/5bsVyOIP0W6aX/4Yoq2z70GCLOGxuRu+iAJyDSTpUHNvgdcf/wq0udSb18gfXxtpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MIgtPWhP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q4ys4HuJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 616GKm652314345
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 17:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iEGuO6CekKn
	dAjKBDhzD10xpNyXSXQXlYftFADS5L1E=; b=MIgtPWhP1cB88SA9xggokBWzRX5
	rX6lduVj09Kktz0Dt60q8ul9cFQCZZd4Xs2ZGaVHkRZ/PZud7fy7d3eawJ8Dy0Px
	YuMND4PVzf2nxL4irND+grUbzMUtQzofAf0i+XI1P1vXsWvSzACYxzyY1EQkPq1z
	wltk3Cofzv7No0wAbfgS+tjb46o5DZry1cjtMFVaxdeoQcVWro+g/0AwJsQ7xy+6
	CgAfLkctMq+8nwysVak/dccvpXRVtZxQe8A49/46vrcdrvanTIz7S+TxoByfpdIo
	pcBJb7++BuHQ4FVufMJ+xwUd0oQCKzF3BXdAu6kNeqiNpjMXjUIOckde/nQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c52mrkr62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 17:41:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6366048135so2203605a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 09:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770399713; x=1771004513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEGuO6CekKndAjKBDhzD10xpNyXSXQXlYftFADS5L1E=;
        b=Q4ys4HuJNF8u7jrx9qspgnjLabRD++vfzTJnCcnomL+j19OLfFFKMMtMohF76a3yY5
         m/4L2AFRM0R8otaRVitPtJ+SV0axETGpq64SO/1Ok7b0YG9G8FJ7iAz0ut4HOtvNuyd7
         i6Zp/RYcmJXrDVXO26xIbzKiKDgejLaTw3Chv0jSeWTqMoyZ5l7U3V8LEnnnDJoLV0sU
         pTgLDNQROt4el6V7YWOWkEfXZxM6YtPcPqkgLyLl9L4gp7I3HnZxFZ+/zldMtLLLOGrR
         sVB9+HZz2nLNO5mmcMUR3wBsTCoVUI/G32Is8JYkojUzmf3P23QQ6W8SmNwrBACZ59X4
         2wNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770399713; x=1771004513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iEGuO6CekKndAjKBDhzD10xpNyXSXQXlYftFADS5L1E=;
        b=Fa2hRk7NjWYb1EwzD0rnW8MsWxP46sXpeHwnBhGyIzexPFqwnBsIcIubkDHI/CDBKW
         nf/y804E8A4bioK0A4h/ltn6I4+rEnTmeSXfaC7RFPQrIKPs7+dfat9bIvwETO1+PPmK
         uItxKxktOG8U7vrEVWnF/r4tm+qxw8GTUrLeI9DJF8U989JRGBFBgPR0ukhdhc28ayWu
         dpANO90oL0v6MPRuRKn1oEycUTSDbATrC36VqIEHz35yJytqsZQm6WvIrhnNLYM4oTrJ
         07UaHmvABBgZbRN8EqV4A4XmNRMQL9OqbmZw5uVVyk6/hWzDaq5+aXu4RwMnRWASXdYx
         R3lg==
X-Forwarded-Encrypted: i=1; AJvYcCUfKnhGXFRnZJGfWSXIX3T7QC3Z1FJw83LqbN6BFAJ1mAKj+yyG8fRa+m6UzpDNKvD5Yg/kjdlohhQ0hNNW@vger.kernel.org
X-Gm-Message-State: AOJu0YyHPYm09IOcuo7RRrm6FShmaSWR5y7Sw12Nh5mmZJQE4zLcg2+o
	yiSl3AMu9i3g0z1eSI42ox2jbdzw48Tz4W+7TJWDqmHn5tYm99GtLT0Vhr9zEeMhKfzHqdd7T/Z
	OPeVxvmwupbL2rpSaD+jULvtej/4JNrl7TmXZ13iSVGmIwlg+C3q6PCKjqU9CKKZBiDff
X-Gm-Gg: AZuq6aLlP+WYamIpIYftRI35LLnYJvTlgDqGazu30FBMkMp//4QBU5G1Kg9bDQDR5+X
	M9HpES6vMv5B2/BtQloqXr2n1ncgScb5kS6+vRTj+B5/Vpd6EsDIXVswecZ0uBgNhLsNKmaEJGK
	VKyARU4P3uzO+YrVaSuDjwxl0GEsSY1xk7GrOsQ2NebDnRKhaXnsKP/9SuE6exjbLpZQgcBZ43c
	SGxwBSeBI1LltBN3Gc9iwazRijJB+ekqfq3nZSnDQgAW3zNYlGINnjR8+035W/zXOdqtSY9G9kR
	f7bK9yv4IaJyBd2btUvUiuDB3PwDMIB3UpWvYsXf9w6KQ/gVHgI7JT30ijFvgz0zOUyA+sg4Pcl
	z7vlG6ILuiDM4BMb51YUOxcP9HqeI8mfYsChE3d7EwcE=
X-Received: by 2002:a05:6a20:429e:b0:375:4503:ef0e with SMTP id adf61e73a8af0-3938f9a2322mr6550381637.14.1770399713009;
        Fri, 06 Feb 2026 09:41:53 -0800 (PST)
X-Received: by 2002:a05:6a20:429e:b0:375:4503:ef0e with SMTP id adf61e73a8af0-3938f9a2322mr6550362637.14.1770399712392;
        Fri, 06 Feb 2026 09:41:52 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb5eccbdsm2639387a12.19.2026.02.06.09.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:41:52 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, chiluka.harish@oss.qualcomm.com
Subject: [PATCH v5 04/13] soc: qcom: geni-se: Handle core clk in geni_se_clks_off() and geni_se_clks_on()
Date: Fri,  6 Feb 2026 23:11:03 +0530
Message-Id: <20260206174112.4149893-5-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
References: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDEyOSBTYWx0ZWRfXzb91tf1NHxgU
 NwOOpNXV3uO9qvo14AmusZcjWnoa0IxsKB14OyjBTAZ95e9M6gQe+P8VOZU5OEURVgW2t+7Ms75
 15r/djJBjwv4Ak3629YdQyv3U//XSFhVTjwtp5owrdhm+XrXRKdqTmsrNwTAzv9pYcx8KgxVRG0
 PwawkaxqJWy9fnDbzX8N8XBaPcaD2mN9l/K0LRLl38K3h15GDcg4/1pqR8Ci8ZKtYBultgBq/WC
 7d6x74sTEfgHR5Hv1rsATX66rFfx1pETI2V6PHrzj+l2EqQZz2TfuKZq2i9iCNF1aVloPSWl69r
 ikDEe1Lt2ZhSTzmR3h8Hnhv8/XnI37vAybuuZU/dq6ohEvUQvCtGEoQNk4+8L/P4APuGBnPtnds
 Ibiwldq3bYgaHshhwUrW+QbruduH65PAFf9DxwYOwBQq/KLCDUKX+k1N240F70acatL1oJQQUl6
 QYBJFrD/M7yem5PH+Ug==
X-Proofpoint-GUID: t6ELOhYJVuKR2hIsqsEMe-9rp-jQ0eDx
X-Authority-Analysis: v=2.4 cv=e4kLiKp/ c=1 sm=1 tr=0 ts=698627e1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=fzsqq50RfsZR9heXkngA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: t6ELOhYJVuKR2hIsqsEMe-9rp-jQ0eDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060129
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-92084-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 08305101588
X-Rspamd-Action: no action

Currently, core clk is handled individually in protocol drivers like
the I2C driver. Move this clock management to the common clock APIs
(geni_se_clks_on/off) that are already present in the common GENI SE
driver to maintain consistency across all protocol drivers.

Core clk is now properly managed alongside the other clocks (se->clk
and wrapper clocks) in the fundamental clock control functions,
eliminating the need for individual protocol drivers to handle this
clock separately.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v4->v5
- Added a Reviewed-by tag
---
 drivers/soc/qcom/qcom-geni-se.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 75e722cd1a94..2e41595ff912 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -583,6 +583,7 @@ static void geni_se_clks_off(struct geni_se *se)
 
 	clk_disable_unprepare(se->clk);
 	clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
+	clk_disable_unprepare(se->core_clk);
 }
 
 /**
@@ -619,7 +620,18 @@ static int geni_se_clks_on(struct geni_se *se)
 
 	ret = clk_prepare_enable(se->clk);
 	if (ret)
-		clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
+		goto err_bulk_clks;
+
+	ret = clk_prepare_enable(se->core_clk);
+	if (ret)
+		goto err_se_clk;
+
+	return 0;
+
+err_se_clk:
+	clk_disable_unprepare(se->clk);
+err_bulk_clks:
+	clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
 	return ret;
 }
 
-- 
2.34.1


