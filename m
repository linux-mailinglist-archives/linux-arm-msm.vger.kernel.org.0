Return-Path: <linux-arm-msm+bounces-111395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ClUfM4y0ImqycQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:35:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BD432647C42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:35:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=M5ZFMUt9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MmkmReaT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111395-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111395-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D2A233046733
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 11:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F36F4D8DAA;
	Fri,  5 Jun 2026 11:27:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020A64D8DAD
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 11:27:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658838; cv=none; b=C3RH28yuUeGfBjPIxdds3BQItuftYkLofrocdwi33k8SLvGE7+Jx3rfQNfnqWAvbp5y8h4BonxJd23igGZIlUZFatvrU/6XhakUzU97m23xBr+z92z+etwebx6ny4KC3W8JKvtO0oatclR7+faR7viRM2/wrLVMXp64SYUC5Jas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658838; c=relaxed/simple;
	bh=ChvYzcr2u4Fh++LD0E7RIxSbhsNKKHhS5UcQ0qLd8mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gAme492hpwBeU7htkbtrrv3QjJFJ7aUg94d0GIjkAziiw9+BnwM/HbGdWKKW2bhi6Q3XFxndY/PSU6Og+65xX2pBUA+Py4OxYfKCVzEiIWHq+icGdGnzdcqJQWbHMvk3kZRWK+9Xd1RmVbEi0Mt4vLDVKB7f7PMnZsl+RlMg4Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5ZFMUt9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MmkmReaT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655BABu42667412
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 11:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rhFW59SY3tfpeAz7AxtwTJfisOOYhI1T4QbgIvxLrA0=; b=M5ZFMUt90t3O98go
	EJPDoNgQ1DMDhMw9iDLi1yZ9NWv6Y/QjZvAQFZ0gXizjUnVI5W/5ech4W7orsnSg
	bZW4QT0fkOb9LRgSH/z/0jmnyd9Q9uwQPacgP3ku5Z3CPjVWK55wydNakXhceXF5
	pmS9YIteL4TSHanIGZUYWVl/o3jrpYbdgAkBfVzVwwSeoMoePCTMnaKJo8nJzBQu
	fRWJ4klzb6wnB6TWGhRnZLqVuGelauJyWyez5RMZ0w2DW7rvv6kJA8GzOm0j8WK/
	Bmkh4VK3pWFaDhqOPdAhLhTzmJYd+p6cwKMRwPeC2IBt9yJN29B76cobRulN9nKd
	l6x8jg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekemyupt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 11:27:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85dc345ac8so1018824a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 04:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780658835; x=1781263635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhFW59SY3tfpeAz7AxtwTJfisOOYhI1T4QbgIvxLrA0=;
        b=MmkmReaTfw2JAyioBbKdoJzmO/z62vZxnc6S0glkKTTnexMF2gqGWe6a3lMZYzemmh
         IV+SRy5OjDjgkujMyK9cTwp5fgnm+Gu3QPIDs17PVtWJx7M25CtzdkMlUSe6cosfNZkX
         fizz0olyS8XNBFtCR/Jgva7GOr2ABYOVwiuNk3zACDpjJP98PicRSvxF8fwT/ZBBC6ys
         imQUjM4stL1oV/+Fz6Wl6U3HklRnSU7/MNCixH8kQfkHUCC+Y2DRcaKtaHMDVIgeL4kF
         K8qzzxqdN1R09KD0AyO6dLcoGAXK2pqxlYfb0rqF8GhF6qhuomVgczTmMb2uR+GHUJle
         e9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780658835; x=1781263635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rhFW59SY3tfpeAz7AxtwTJfisOOYhI1T4QbgIvxLrA0=;
        b=GdGbWc9xVtknK9BANzSUAN+Eo46t3w2v/kMRSquzc6p/sM/86E1dSE5mF8JNtp60lP
         ySqFDnAxXPOMJisZt/Q5t6oBnMCrJrUtdMDZdtX91CYNCZ6zM2gltWeiUUOGBPius1gK
         1l/Jt2TXiARXczKfBjiwywO9PpoU8yTEwKR3xM5keFiDSX4IUwMpncEE6+a2aBLE5VYD
         KI5dQx9iIzT1FFpP4j0vi7JIsSnXPND/4pXT5i/3W6W2nguHAJ+eKhZRSH7yHkSE4qtO
         Bz0gCO5QVHrVux+GSZvXIZr8XKz6Sqfmmq9ht/dpqsXzy3/OFlz7/bQo8UwBBTZuZ/Xl
         uWTw==
X-Forwarded-Encrypted: i=1; AFNElJ/PTAN30R99YRuO2B5dkUCj0kLl8wtMKoXaVqPkptF9eAinnGqkLfqoVhY+8v+5H3hLTU7Qn8f3pFWa33Gu@vger.kernel.org
X-Gm-Message-State: AOJu0YzxFRN3ifaCiIoJDCsY9vXsRyasBBwvSqmPw/CUObLK4FUpUkd7
	WkTrZMiHkt9LsJBM1D8JKD/+6sH4CiqT5HM21Zez1khDcB831QqrDUiJjmoUbwvpOYLvjctAcW7
	44NZipEzPVUNzziEGKEWbDeHmJTyybDf/VxB75MBpv6R2Ewnd4G0qPzYHWWoG4PaHCri2
X-Gm-Gg: Acq92OHyV1l0FGN1uiuRaHbXVk+EpHfxPUtR8K9Scvr/mMFR6lFd7IzU4lmIyy5VMa4
	mGU5+WVLOvmpcyGuVxbEPYkyxSN8NU+AFvyuuCJPCZ8Y/bAKnan/Gx4DmHL4ftI5jAbMHgJ2ASQ
	5eNBuybEBXUjLCu/NL59Qzla3q3WkNS3rtn1LmzhT96AGGL6kqGBZ63iMHUbaEMFqsCszKcnR3E
	m5JDXkIgJuSkM0KCkC4cVxhZgXHto648rG/52Mrjf3fwVvqR9PQzghDOLR/+tJAFOGnQJm4JrqQ
	U6zOoECfQIz3Mt2Pu69fXAX8OeSLFmQ4BEG5T1FPTCoYlQ9c35GI3yA+6Zcjyt3O4tBmpTYeKyc
	HDXdazU/WhrOVE0+SBZtQtSI0YlBEST4cx4J/tOVWOf95B9B1pO2bcJENYYA0vag=
X-Received: by 2002:a05:6a00:4216:b0:835:6388:655d with SMTP id d2e1a72fcca58-842b0e6353amr3187739b3a.14.1780658835008;
        Fri, 05 Jun 2026 04:27:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:4216:b0:835:6388:655d with SMTP id d2e1a72fcca58-842b0e6353amr3187710b3a.14.1780658834458;
        Fri, 05 Jun 2026 04:27:14 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e21c8sm10626246b3a.49.2026.06.05.04.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:27:14 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 16:56:30 +0530
Subject: [PATCH 1/4] clk: qcom: common: Register reset controller only when
 resets are present
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-shikra-audiocorecc-v1-1-7ee6b5f2d928@oss.qualcomm.com>
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: wWb86E6b0RP-BOwBdmoCblD3dExgcLj3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDExMSBTYWx0ZWRfX2e7aAlS29/9h
 zI2eD9QpYsbfflftxK3xMU5lAVFlQIoV1q3CPvoZAvEmvkkXwiO7+J0pmUxLwNVZ0snKCwQOBHJ
 Ql3eBeLnkAgOh7X/7EDcYKaFrzOhvYt0mVIXWpH/I8eSJG9d5pGrAG0llF8s+mqBz0H6JDNF87Z
 m0O7tP8nLvTSRFzhVjosx2h1Y0mnfgRoM51OfpI4gUsNU3/gyOBhp+JDg1MteQZopQyoda+dH2h
 MrIc5NDoTYxt1X6GxlOd//SoscZOMgsvBm7tdgwyU4OA9D8FjB1My5CO6ufNEMej/V03Z67ankb
 5iyLRHQiiexgr5wrQr5rhPA9henrOWUD5fl+lNV+pOgnXNHYrnwQAZYr+vZzDPlpjnaiSCCXmZ3
 ZXi+rw4aIDyvtf4JMAHVr/4wm2NHUEMqtpmr/ocVV2f3TsuTcytv1vaAovA3qIm/8XNVIYWj/37
 RfKLkcvAPYVI5PlLySw==
X-Authority-Analysis: v=2.4 cv=K/wS2SWI c=1 sm=1 tr=0 ts=6a22b293 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=OBZ5FNg4elHM4VKj2A8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: wWb86E6b0RP-BOwBdmoCblD3dExgcLj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111395-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD432647C42

Some clock controller descriptors do not provide any reset lines. Avoid
registering a reset controller when desc->num_resets is zero by making
the registration conditional.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/common.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index eec369d2173b5ce24bc1ca860d2ac1bbdce04524..be9b6ebb2fffde05e3f209571c53b601d823d479 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -359,17 +359,19 @@ int qcom_cc_really_probe(struct device *dev,
 		qcom_cc_clk_regs_configure(dev, desc->driver_data, regmap);
 	}
 
-	reset = &cc->reset;
-	reset->rcdev.of_node = dev->of_node;
-	reset->rcdev.ops = &qcom_reset_ops;
-	reset->rcdev.owner = dev->driver->owner;
-	reset->rcdev.nr_resets = desc->num_resets;
-	reset->regmap = regmap;
-	reset->reset_map = desc->resets;
-
-	ret = devm_reset_controller_register(dev, &reset->rcdev);
-	if (ret)
-		goto put_rpm;
+	if (desc->num_resets) {
+		reset = &cc->reset;
+		reset->rcdev.of_node = dev->of_node;
+		reset->rcdev.ops = &qcom_reset_ops;
+		reset->rcdev.owner = dev->driver->owner;
+		reset->rcdev.nr_resets = desc->num_resets;
+		reset->regmap = regmap;
+		reset->reset_map = desc->resets;
+
+		ret = devm_reset_controller_register(dev, &reset->rcdev);
+		if (ret)
+			goto put_rpm;
+	}
 
 	if (desc->gdscs && desc->num_gdscs) {
 		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);

-- 
2.34.1


