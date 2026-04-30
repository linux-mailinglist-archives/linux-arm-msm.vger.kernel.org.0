Return-Path: <linux-arm-msm+bounces-105421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNpvFeep82kF5wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 21:13:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CB84A74D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 21:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F109B30098A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 19:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4575547DD56;
	Thu, 30 Apr 2026 19:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hCMi/HFe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OkJF+nbs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F403A47DD5C
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777576412; cv=none; b=kDcgWMZg2cJF2vdUE0C4RF+kXlTx/A0LTIyc4AiBj/weZ8wp316QQgzpLUvO78Ttf4/EurtzbozkT/nH9Lz7Pncaf+ovGDJ8MHDxihor+dDeExoalluzQMeZuZOL1y0hKt7SxBm5nF+p0hbbQdLT62HTIuVWHz858qdMlrvkucQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777576412; c=relaxed/simple;
	bh=zTTihws/0VZvak5g01RFclHQtHBO7VYsS3WuK2DBoeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=btS5YlGuff1YEbDrx4nRfdtGq+LDHgDQna9TiyrqOGbDT8/geUdZ6wchHAvF+U3XovbKgqYzU5zGyeBtOYjCTa8o0B0Bsc58krqhjdGF7r816BkIrqE5BSAiazI+G6Jhk/K81mhxEg/jeRwBQXQbTMHCaX7L/IWCF2HA/8GfsTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hCMi/HFe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OkJF+nbs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UGIYHc2121566
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+S5J50qjEa5
	nRH2WIvLHmY5/93dfYCrgfWlwwfYk/Nw=; b=hCMi/HFeWHlXYjcVGLd6I6mof1+
	Ef3EGREmiXZTXHoJcQ4XGGRGpzymyDxk4klDaca3EQXVQa6XloXXikwfwNM9v38P
	QBokLjrr06mZXBLmJCrbHa1m4WEGtVJ5rXQw2f53ZeW1dWxX3SgxSw7O9IXSE4vQ
	p8l1zxwfdpVomSBUlouEz7NnofxuvhsTU/kYtvSFc/dUq9OUg4WT2WpBqMDZHIYZ
	v+RQviVJflKk247y9ibuL4Hfn//BBSmfVgN+NwZVfcq3iizw8yygxxPe8hStyReB
	STIibXD9eebMgHy6OaouhejKxgH96ogylGP2p8+XH6mWyTMHbapX/FfgcUg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvag4rw9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:30 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f6b0a7164so1797477b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 12:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777576409; x=1778181209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+S5J50qjEa5nRH2WIvLHmY5/93dfYCrgfWlwwfYk/Nw=;
        b=OkJF+nbsNz5tcLXWDbIU4MKc/xBmhhedKhDPhhOpIsuVFztopJNTTMETwfhbh5QRB+
         BOeVKXrKjieEp4g2yzWagzTbT8DOJNpKgf8ers180P/esPOItVgMwXIWhkmILCTJsh2V
         +fNwX+gM/bIbLbDE9bk7+aZA+PwCBUp0+XnwuZtwd2K6VdEFZO2ZeDmDULCdg5JNBz5t
         3//BYLGO3kjhe6GTJhr0xDWcn9bDbLqcj5ly+WtZNINu1AKxT4u9iir42lOuB0KwPvf8
         B7bYtgS59p+vus8QGUXWSbABIFgDqO7g21mKPdOQx8gofd27lhU0/JvfE5gDHf37RpHF
         +Q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777576409; x=1778181209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+S5J50qjEa5nRH2WIvLHmY5/93dfYCrgfWlwwfYk/Nw=;
        b=HtTpEkb0kpGK6d+Ta0tEb2a/GBHsba8bkfkKRSm5ttgRlZIgpsFF7L2Yt8aOAy3Y67
         pfa3EBqkNGBJCRKtEF1PZWh/xheLmxuaAKKMcsRGehp0hQCKXScKYU9eu1Rhvd3xb2i3
         JuKqiP+uOuTSHzjh5YF8b4ygJE4ycIZNAoHbg37FHbrMlbx3ZAsB5qfBj0Szj/xMP7Hg
         w5wFdi5sYAv7Zp0sg/5LOjI8Q5AzXJjJL13jslolbCVC1hH9fXqBahyb2Bcs8RXVoJLW
         PnhkLCAZAQBU29+IgyaLDKLWbnd7kcQiVkKxfVSSOwHnn3TRimZeXb/nIrEEav6lTfF4
         V6YQ==
X-Gm-Message-State: AOJu0YwmxSEah+2adpQbwhAV6W0iAga/SUu0k+7PwClA/qA0HgqID9Nu
	RK0WMSW7zVCGCF71sYaXrdxk7NfJP29yDy8jiFcgk7BLgDsAFLQ/HGx+hJhuwqZYgVuaFXXYStw
	ZubzhXNHwcgblhDkeTKU+BCcbN7HjZ8g0c1g67JsvkQsXZm+AGeuaOzFG8tJ1Wffc62uVAglK36
	KT
X-Gm-Gg: AeBDies622J4bWKrjCf9AJ/RmCA5rn7wFXdrT7R5YK6yAOv677FkqXr924vsrTubdhm
	E5Ra0c9DxEbaeF9IByUbMjZ0cAshmMEaps55KHCKphGV2WTj6etry07uKMdZ/lGSnBOdHa6HaUj
	LwTpkacSQaxkZLC4xrfR5K4uW0t49ABAvzbzXrWrt0NKqG6DQ6YBtfgPaudjNusZeEEn+b/DF01
	AOXN7y3nc8xmjqFTZ1PSgEFdV2veJ3yzSCKXTsfILXTYIaYqbHdt2jIzJL5w91k5sTosgP+PetW
	tIAxtFCdf5+hBbGuq5+vAMMqgXcohzX2ZOL8NH8VhdQzF1yG3L44A4F/Mo12JtK8FrtnUVRFnei
	XIgq7irTDB0Rci3B3acx7YvMh4It4gF+guNaQvXsQlt5L0xIqW5fP+CVqmk4=
X-Received: by 2002:a05:6a00:22cc:b0:82c:20be:57e6 with SMTP id d2e1a72fcca58-834fdb2ab1cmr4870733b3a.11.1777576409434;
        Thu, 30 Apr 2026 12:13:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:22cc:b0:82c:20be:57e6 with SMTP id d2e1a72fcca58-834fdb2ab1cmr4870705b3a.11.1777576408796;
        Thu, 30 Apr 2026 12:13:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b485eesm373640b3a.48.2026.04.30.12.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:13:28 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 2/6] remoteproc: qcom: pas: Guard dtb metadata release with dtb_pas_id check
Date: Fri,  1 May 2026 00:42:49 +0530
Message-ID: <20260430191253.4052025-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k3ve-k3xveAbFc7hN1cgK-Tan-0HgbEV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE5OSBTYWx0ZWRfX8vaFLRwx+0VB
 Q68Q8iSuSF0p/dxto+RyDxTJt9aZSpatT9GXIGYmWQQ2fcv9ZlL7GXtmjG7w1xHbJftVDtQKvcV
 tQJ7zgYDBRRoPWUuRsaS9aeMRRWLvHZp0WuHdHUk+shYKNvaD8Zm1oN1i9apX7eKm2XzM2C15/8
 11erWrTLu2vr0fZmLs1Upw1mjeef7i81yVDwYZycDHS0iI3VXOxN3nZ78vy3+ev9f/yhOU2++L1
 e0FwqgZe3fQexW6eNB548g+9WoYe5U4xnJdzEU8UpeogH0FYqMq88b72hUJ0fpA7hCMDkT9cCTN
 L3pg9F9ZVdOZcPFkmjASq/FZ+Og3LzVhrKZvjHrMelvsTMNEW7pds0a2miwU/kdHyiUR1CwbvDt
 yUU7UIzT1vsCBouY/vhuFNo6tRRoemQArgvMHuhMVTLwfs+yBxNPoa2ObpTexytz+Wxdq8tn9GP
 y4a77ZAhuc1UNrQAMCQ==
X-Authority-Analysis: v=2.4 cv=UcxhjqSN c=1 sm=1 tr=0 ts=69f3a9da cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=LDFLutnZx2YFYSqWXWMA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: k3ve-k3xveAbFc7hN1cgK-Tan-0HgbEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300199
X-Rspamd-Queue-Id: 18CB84A74D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105421-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

All other call sites of qcom_scm_pas_metadata_release() for the DTB
context are guarded by a check on pas->dtb_pas_id, but the call inside
qcom_pas_load() was not. Fix this by moving the call to the guarded
block.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 45be8c5049e1..2785d19408d1 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -243,17 +243,14 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
 					pas->dtb_firmware_name, (__force void *)pas->dtb_mem_region,
 					&pas->dtb_mem_reloc);
-		if (ret)
-			goto release_dtb_metadata;
+		if (ret) {
+			qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
+			release_firmware(pas->dtb_firmware);
+			return ret;
+		}
 	}
 
 	return 0;
-
-release_dtb_metadata:
-	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
-	release_firmware(pas->dtb_firmware);
-
-	return ret;
 }
 
 static void qcom_pas_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
-- 
2.53.0


