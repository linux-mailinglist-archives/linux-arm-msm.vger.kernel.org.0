Return-Path: <linux-arm-msm+bounces-113885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UApzBca0NmptDgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 17:41:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5893D6A9221
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 17:41:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=T+cwCQ8b;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZInH4P9Q;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113885-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113885-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BADA63003316
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 15:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4551121B192;
	Sat, 20 Jun 2026 15:41:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC54B184540
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 15:41:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781970115; cv=none; b=MRPMdFLgs0JrxFzKZ7SzkxOEV2Qbxro3wD0ZfEsrKHKIW5vkw5dqrYWT5YPLeVgzUKQ8nMWBRIpNLKUPbo2ylkpkrXHs2xDHS4Yd7iVa42u5weqYeDAI1bny/I1zhQYwMSeipjnewu6YRQ+OmFvrhQtcU+n+dbDOmWUDPkVetTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781970115; c=relaxed/simple;
	bh=tDXx3wroFrRAKQmBzd2yLg/NaUx0j/jHpTibaqhT1TU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=crXh4vLaHm0okUqF5RTXPRyBiIdW2bbtt1N2GCuB8vBNuY1o8SIGYk2OEjtN6E2SJxYRMVnPT9w+HAL2Ea9JLNpK/Qgz2YQB+DyPV6HFIi6gqRVGd0TgZ+JsTJojCQUKmay4f5VGRKRYoo6UFQmsGl6u4/NaPjLrSDpBabeRJpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+cwCQ8b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZInH4P9Q; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65KDsULY3808661
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 15:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XthznrMWipPHmPVuxKSsO8GKMIYUVQMvTuS
	e7mtIKDs=; b=T+cwCQ8bo9C9/22tifQWozfplrh1HZa40bkBsylXdbHJ3rDmGB9
	n92aqqP3lNl1Jt9xx9zmkFRv9DxkYBSw0mAaZ0ZCrXWfkA104e2MUShDlaWkLt4F
	TeHe5cLqPt+q9w3hckLZEHPqcmuaoTu0Ve5tuzozLcHaDvzZDeRH+8nZWvleQzJk
	cV1/Krtkzs3Xd79ciaQ8HHyD7/xG9WYBPP51xQk6/dNPIan1LbF46G2IEtbcGTKf
	8T0waeepjLEJb6wtfhCvWAf8uHlceMaNefRd2L6ygxZAlVz763Aok3QDJNthPr3b
	O/nDRRn90d9q9j1UPSf1tgrli4FqXUJFpew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewg7mhg9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 15:41:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157db42dd8so631248385a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 08:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781970112; x=1782574912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XthznrMWipPHmPVuxKSsO8GKMIYUVQMvTuSe7mtIKDs=;
        b=ZInH4P9QTfPLWipbAKNRccdizW4xHMcNq/nK96KO42vHja4KG6Ecyu+SlIp996oox4
         BmXz/gMNwcZXwua2fl5xkt5mukzvaQ2gL0N0U2X7oMwrCW4imaFurb9z80YNJiAaOn/K
         G2EMsYcGw6tnGxtI9kXLMGbyr6t8Gh/7GvL5yNj+mBqbWaTEUnwi9CsyqwUNDgvERcPz
         oyJVCnT1C6Iozp/z1QogprDP0JzrZo/E3yLDnRU+anBbnyZ2f0/7YY/RQbySaKBW6/1U
         PIy7Lq/51vLxchbarEVB6vS5s3sDG8In+i/7r6cEGhifvpEmZaNfuWU5IP6gmtuUtFpF
         GVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781970112; x=1782574912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XthznrMWipPHmPVuxKSsO8GKMIYUVQMvTuSe7mtIKDs=;
        b=k4yL/m44bY41J30t0OBrrCAD6mzj0UkjXgK+//Gox56MK3RluGzXWybaQtFmwUOUat
         zKqZzFIWLrKTFbKYwMb+nO5HTyEdYxPkdhctn6jeyjs5n4zxYBePyeDCgTxZjOadiY2b
         7438I0dj6w2HfL56MGnWGm8yxtJNTDwHR252zbgIW2CHKUE5wcYNa/0f5rFIB10JdVtF
         0bAmVp5Zt/KYwNIYOFf/tIFz0y7hNaIBZPnwYnDXWybVV8i8y/ERYGUD0CagT2wMuS6U
         46hwf+qijKD75Byw06rnFYubIK+qADv0wCR99XDlCsd2Wwqsg9OmPUsQXzTGPQFDJ3Ku
         1uug==
X-Forwarded-Encrypted: i=1; AFNElJ8HH+DvjsH/Fezg8m4z3y6Ark+/9e43IDEsvog+SOpnxSD8fDkoTFDEZxms9xMjgDEpOZCywy+cY7VnP/Cg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0vqxRQkrmwTwnAYF9+F8dob82EiFHmHMoC3yPZlod0qwZaA94
	xLVSynkw5jKUR3U1I373jeM7ew5DjarCu7YqbEmJv9b4gunGwuYiQIAmgCGdr9MvJPr9vXQlx8c
	2Eg0doAeLc8XQSrLEXgn4Zt/En7boGFaX2iWxs/r9BtV8MG/TXLz7JYn3tN+ImjntZ26p
X-Gm-Gg: AfdE7cmTdnskVjoeOX+EfIgJSJZl9N1PDDtTt+j1Qq1kJ47I9cz6fDLTBCLEiJiPqAL
	xQM//fnvn6v1hap285cxTGvuUQezXLPAy8DHIB2ZmBd7GNCSj0tMZj4O2n0Lry2V4ndKN9ITKy1
	Y1PLXLRPRr0QaxWk2tZUUzY5M0ykRyfq/Pn8z/6DFUrZ44G5+PSHLLcA0rESgTShjwKNmlCMacS
	3iRDVAzJWgKBBSBOjtT39LFs8vx/mKFWxUaP5ODCGZeyWLI76KCQfsd+XbikjVoEJfDaP67cECj
	amAUOD2k17m7rbIfGuOoybU+Lwyuv+ZUJOBLVwDJm4UfCtejxCXwNSj4SYWJMAGY4KWMNV5FfP9
	HF60AjjUbPaLClzTBa4UoXUP/YLvVnl4dV6zG+ZiUp9/BYxG6Maxy/wIOyQjUTpjTZNJ5z5fiJD
	TrIbOyCtr/PPLVzcX7L7kMg0p5YQ==
X-Received: by 2002:a05:620a:a511:b0:920:fa37:f249 with SMTP id af79cd13be357-920fa37f4c2mr904533685a.22.1781970112090;
        Sat, 20 Jun 2026 08:41:52 -0700 (PDT)
X-Received: by 2002:a05:620a:a511:b0:920:fa37:f249 with SMTP id af79cd13be357-920fa37f4c2mr904530485a.22.1781970111671;
        Sat, 20 Jun 2026 08:41:51 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c6161595csm115159766b.62.2026.06.20.08.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 08:41:49 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] i2c: qcom-geni: Use device_set_node() helper
Date: Sat, 20 Jun 2026 17:41:47 +0200
Message-ID: <20260620154147.80919-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIwMDE1NyBTYWx0ZWRfXzY8nO5lRWvuB
 qCh4tgF8+x4cPanMYiFBprFB/DpXvb8BV9C5vfFbNExEz/E4IhoO0YXcegp5MSgv24dAeGWMNlE
 gfeCvo8m1+1MedFj9U5PhT0wZkzts3LHye7AMbiQIq5tcpfX2NMHqZy8wbP/p7ylGpBjRTLWfdw
 3g9K/Nb0k2eMKWLvIWPxKBWEd+IQW5C5rrql6kJ6/fNd3reU3IX0kE39hlo3pMz+s7IwU10FkNe
 FMk970nt5HIC7ufwxfBr0urER1xLVoBoAeoLJMesgInn8nQ/hBaVHIq3TgPv7RMUgiIcoBhHG1S
 qnJ3eL7X0vqXrqfSjQz4V5RZ/WlvcGqt7tSLpaSqQ1tfqNuvzSykYh+uoegPJS6rNI6ZuzlK08D
 KjIZ/DPKcfzXyt5pvL/teIvhiwLZuABF08JDZrAYTv8LrJB6QbtyicIrfTO2BtPA+pX/L7n73/a
 +ttEa1xjVbWvT7zXXKQ==
X-Authority-Analysis: v=2.4 cv=IOMyzAvG c=1 sm=1 tr=0 ts=6a36b4c0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=2VF4tGTWRqxSFCeSHQ8A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIwMDE1NyBTYWx0ZWRfX+X0gBfzSykpL
 dwFWjyudEWEjPS1FmHhR4pnklqyVCZ9LdfV6BeY7kfrwGRAHNAlsf+8yZK9x5kzl20qVXfvkux4
 ikA5qSRvFZLbJxvWkQugy2OlaMbV4lE=
X-Proofpoint-ORIG-GUID: 0e77mrIx1dA1H7R9TPC9iGlhIrSH71L3
X-Proofpoint-GUID: 0e77mrIx1dA1H7R9TPC9iGlhIrSH71L3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-20_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606200157
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113885-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5893D6A9221

Use the device_set_node() helper instead of manually setting
adap.dev.of_node, this:

1. Ensures that if the parent has an of_node then adap.dev.fwnode also
gets set to point to the parent of_node, rather then leaving it NULL.

2. Removes the need the specially handle the parent having an ACPI
fwnode, since the generic helpers take care of this too.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a482a4c60744..2138fcffdaf3 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1028,9 +1028,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		gi2c->clk_freq_out = I2C_MAX_STANDARD_MODE_FREQ;
 	}
 
-	if (has_acpi_companion(dev))
-		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
-
 	gi2c->irq = platform_get_irq(pdev, 0);
 	if (gi2c->irq < 0)
 		return gi2c->irq;
@@ -1054,7 +1051,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	i2c_set_adapdata(&gi2c->adap, gi2c);
 	gi2c->adap.dev.parent = dev;
-	gi2c->adap.dev.of_node = dev->of_node;
+	device_set_node(&gi2c->adap.dev, dev_fwnode(dev));
 	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
 
 	ret = geni_icc_get(&gi2c->se, desc ? desc->icc_ddr : "qup-memory");
-- 
2.54.0


