Return-Path: <linux-arm-msm+bounces-114390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LJOcLGgrPGpukwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:09:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0E46C0E16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:09:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IUEPbcBD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cRUlz6Tw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114390-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114390-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B69DB303A67D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81716201113;
	Wed, 24 Jun 2026 19:08:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5529C33CE80
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:08:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328138; cv=none; b=na+8NkTXWw92PBhs2eg71vLgy82w9saAxF14fODmXwq70xJLojf8PRVWdEf5ZpeNnpLCqLyLXKPcD3x9g0jF7j8UIWTxIT2/lj9XrwotOg7hTfj2+eJMEHWEnbRN4vxahjmSpyOEk/+Mghiw1EO9G4KwqDcumxZZ4AVtLN7Ktps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328138; c=relaxed/simple;
	bh=07WDKA0OdoOqxTpe+k+VziHT+HpeKDFAeOlyfNRgqpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eWRBNYLdTdWx32Fcn1Xvnwq/mEuv3vnRfha4DlNdrN6sgs/KXiyY+/+EseZruVYxd4e3/wr4I+1D9crc4sG67cErafxAtxog53ep9HDk3XUtO8K46GySJd0HfgFrvoAn4CrR2kjiMEXuz0N+VeyBKgrmMo+7JIR8wtSmJ/xZJAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IUEPbcBD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRUlz6Tw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OITCLr3666234
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=T81WvvV1onC
	oDTK7QcIKnL89AdcLmXT+NQJ9Gf5Oqjc=; b=IUEPbcBD/Dz7Cr151OoBwPjK8j9
	fmMSIEk4nvNENUeQ42Eerx0cSU6ZS1H/rrBzcegnXTlOxRZ6FYVqctHXCwdzBz2A
	A3geQczUVM+GG6wngvlcZ7seHvduYbapWjugrc3DCFL3ulFY5gHELnmN3QMiswyl
	MHuacsLPodnzjJDv3ma0PNimt4ip3JkTejXOo6DlBJHBuI0WjWsvd804ZhfMXUqC
	id+RYZ0HqAynBW9oaTPUiKc1vE0VLZdqfmKucZyKKJAottMxanKmQTxsn/cSKEQB
	b3zzuu7Mi3P9WHJxP0ckQayi+LuuepYEppZxLq/E5wIJKwUiETG8pLU/v7A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbr52k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:08:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845438fbd9cso1382502b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328136; x=1782932936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T81WvvV1onCoDTK7QcIKnL89AdcLmXT+NQJ9Gf5Oqjc=;
        b=cRUlz6TwmLwAcV3Wic7l2hlG/1sZzIULzC1DNg2IpY6h2XjUmK3cNXUGQQpfcbRD5V
         5sK+clA3RT68TknRwJQM6R1fgxr8Z4yJUcrw+6jr3B3+4xqjg0+4O062JrekB4USgHH+
         zM3TpEQJ/ff6auI08XnsBbuutWOiKt9qxdFCly7pI5ky3o8/ZAJN1HB6K02lRZ05ri90
         9XU87796BucXtD9jnT4Meyh69qMpa9ScJZ3xTXzE4yUOe9WxmWUreSfEJObLcOg89e9x
         mogoDgpVuVFhOTgHeQKcSoLvT1tDs9lM14KGJq9pLmsfcnHf1ZDFaj6J7lQI4/b3VitW
         7V6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328136; x=1782932936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T81WvvV1onCoDTK7QcIKnL89AdcLmXT+NQJ9Gf5Oqjc=;
        b=ndUXJ9f0AGT2XU+S+TP4yPjtRhyn5MhD34R/opzKMMtyXDrDSBmdabCluV9l4QkPTd
         KJgnmrMtSzNiRxAP5yY3T2ME4NP7ZMzhcA2eXh475MnQ5dtmiKtbQfbSeXv1QgPWsb+o
         a8qyr5y7xsEyDtXMXJncy3LEL0R72i0uefuDIuzeDeDYsuECOJkJzPWjvvUXiVWAkpXP
         jwj6eoCq7pU4a9MKiVSN790/bySmN/XUMwDDsUETn55icq7eDPVxZ9fOTrNC28x6uy0o
         zn6p5UK1MsdHebL3GwGdW2puwSw1GeP+4dm+LgGRZazaPRki0f3jr/9YgGSQXMs579Rz
         vh4w==
X-Forwarded-Encrypted: i=1; AHgh+RqRrO5Eyyd+YJ3SlZAMgrPpz8aDgot7AtsssM29PMtoVmOo92GWJtyuQNhe/h3s77V6ysGwsCveuZ2Y+YO+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8tVhqf/FIY5U2X7XgI9bpOly1TQVzHsDQwW3koq/B+TNwwfQ8
	azH5IJ+6roCjBFMFOvMexGiyJtadA1u17nC7AcRSpjID5mqWkjANEehetaRNv4D7NqhaOVDdMcG
	U1mhnepu58Uau9uBSr3Mbi5l5PmAJKqRh/3WV2Dy+DeSBe+gyLNKt5HNzvq1hX94FsTNFbP0phT
	ZS
X-Gm-Gg: AfdE7clAq5vInwSdf9Nqbfnwmv/vXICinRbTvnKSVljPn8kVP9s7GIAfBJbaj0rPKLq
	a2j/b3kWNgQQPbOcwRaEO0VSXz2PtUGw++KneCTWVOS6Q364OpjY+MJK2dm+y0shbTCZ7SVy6tQ
	8RZJ/CvOBZhE8WM36Y1iQ1WidsJFC7wTMzJLs4DKL+zIyOUf/ers/Qf6AlQGrLLqPIL2H7SrHob
	a81WHFpdQuS/GGFTw0kW154vugcpX9253LiAaHqvnv3HjEXtLS8On0wi8f4I1//qwm4WSUpcpZl
	8/kT9vLLFM0GyoqqHTIO37+xcx4Ji4+CMWa8umOjplM5/91l+TEieTTe44koq+/oXWzUueYaW7+
	4rAQMZwyVfTqw51iteWZcMzHyiQIcogMQTq6Qxw==
X-Received: by 2002:a05:6a00:801b:b0:845:45b5:9825 with SMTP id d2e1a72fcca58-845a2c7e050mr6230931b3a.37.1782328135983;
        Wed, 24 Jun 2026 12:08:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:801b:b0:845:45b5:9825 with SMTP id d2e1a72fcca58-845a2c7e050mr6230889b3a.37.1782328135381;
        Wed, 24 Jun 2026 12:08:55 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:08:55 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 04/19] firmware: qcom: scm: use dev_err_probe() for dload address failure
Date: Thu, 25 Jun 2026 00:38:15 +0530
Message-ID: <20260624190830.3131112-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX19wYTHATT9nO
 NkGMBC/2bVwM2z0QdyYsGv1BxKXIIyxLg3mKjdZEOJfjLBxEcUKJHNtnJ2RlYGMEbI+lbBdfOCw
 DaAcrcZ6f4yhUBq8EYeVgFuPgce5kfw=
X-Proofpoint-ORIG-GUID: R3zO1NxV7qqw-buCA_1Fl65JT2KyTuFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX+/vDOQSKWCLv
 ei+1El8ggcpL0uaCkDIhIIKDII/L65N9bEz0cK+GGFdr/W2mEWCCpJ19T9TSeL6CXuu9ufYmzh+
 fVnsQdL/8hr+ZXbnsuP1QhPqYQdUJcnenvkpeD8/YLKSH5oKFtGGqWHqyKD1V+1/k89NDy/TdSL
 S6CRT2d404Un2/y27eCkvSrH3g3BX/eqeeiFm/nRtZFR9By9PLu6kPf0mSLVhebpI/28Dsg2pVe
 nmgj0hkiL4MyjU3W2DqXDBPar3RwamEdnefvkxaUZtH7U6yw0ElhPs24rMwNEg7FjD/LzaWBGt7
 7clNiJHlafr0BX1XwL0spVvJgTonJMsSsvtYwKQb/Zl2UlYkoeEC8AR5n3/9QeYBqhX8MVLQIgk
 /IBYRGSnf4jHES6VXOjwxHxPNZujQOtG5lFhAM+YSBlx62VhNibIeCPI98z/pp4NqYmHtA5ec8r
 Z/DATXq7hXjiLEHc6Nw==
X-Proofpoint-GUID: R3zO1NxV7qqw-buCA_1Fl65JT2KyTuFh
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3c2b48 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=GEQWD5Nhug1BhVu3dP8A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114390-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F0E46C0E16

Replace the bare `return ret` after qcom_scm_find_dload_address() with
dev_err_probe() to produce a consistent, deferred-probe-aware error
message when the download-mode address cannot be resolved.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index b78da40a4d60..83e4810f1c53 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2751,7 +2751,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	scm->dev = &pdev->dev;
 	ret = qcom_scm_find_dload_address(&pdev->dev, &scm->dload_mode_addr);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to get download mode address\n");
 
 	mutex_init(&scm->scm_bw_lock);
 
-- 
2.53.0


