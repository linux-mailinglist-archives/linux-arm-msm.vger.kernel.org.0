Return-Path: <linux-arm-msm+bounces-102954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKWjNEng3GlkXwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:23:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CF89D3EBE23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC9703009F3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 12:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6323C456D;
	Mon, 13 Apr 2026 12:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dMoH/WRt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQasXWZK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193363C4542
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082980; cv=none; b=OlwopwTrSl9XXpJlAvgmbqT3fKadvbjLixYeRMzKuas2XjH2TxdIMCGbXJuFx1sm5GpBJHo1BQT/Xyw5xcmBbukUPXeFy/YN0a6KM+r80P56C4YAs/Ofbieez8oD469dkmvMYUHLRPXodVyCyKZMMMEnY+p38ocXv1ac50JnM14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082980; c=relaxed/simple;
	bh=Q3U9cR71Ou1c/o6O1vQUwLt7SPIPHBKKzdH+VYokhRM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U4VbdWCfssYaYHYlt5ePCH1ejoYPBaedW1et2hqhqmsCs5WErz09TCUn/dhAZqDDALe31bA5foDygYvmhhppyCZrnA1p72V7oP7zr55zHfP0uboMdn/HeBE7Fzs5pUXaisJjAI3/gAurfPdrQtg+g96qFJ20CAaB/ENS+WM3Slk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dMoH/WRt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQasXWZK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DCCmEw2154386
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aR0wfxNzBVS
	ofwPdxGhUSe58+s1gtFmmIRWzztRcMV0=; b=dMoH/WRt73np3wkJeNeCFojWaq6
	VlbKSYxBeWmdVZ+IJyfd0PFUXoFdmZ8/t20GaMAMv0YGZs+ObZ21xk0o/dZG4YNv
	yM3lkJwP+lSUrlRqz0ndqgggcO4eZX/6ct6fkOsN8ndqt0HqnJ6EbtIUKkXOw7Jv
	5sqLBXHsUAPlBUumSaaveF32ijjHb0HGLvBvxjHObSSmqNFwGNPNbBWYl4qvikoD
	czNTxDrULKFhQpuPbn9rWjOpBIgprBiYxwqPD/Z5qzH4+MX+PouzSIy4GY5p25NT
	oQmifzYp1Uw1+cke+HK14eRxQlBeLlOZwbmtU0R88uwBaigigJ5TLdj1oGg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffk6n7u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:22:58 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7af89eabe49so60443057b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 05:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776082977; x=1776687777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aR0wfxNzBVSofwPdxGhUSe58+s1gtFmmIRWzztRcMV0=;
        b=iQasXWZK4VFqdGWH3aHE8KvAk04NTf3NLB7hlHxnN56d73+78em/vtgSO1ynrS0Vt9
         yUPWnnA6dNGkLHKyx9fX6zdlRnTJCEW3FpQfN8rMlFINR/6LL3i3bcruEOiqRTFh5ecL
         Zy5m7TMcmGMpN7tuA7d0QqoDsssOzVdSFxM93jIcuCUuqMFSjBar9Hqh9faVfm8fMhFf
         Daxq/l3Lt1AlXTPNSbzo32E1slq/AYY0X96iLSTL80XPvF1KB3BSSUc9fDrlOA8Qb80h
         mO4g5Wgjo3TDfNJDPntm4u3cCgCfz6z8kUe3ebv+MVRnXxq/10P9N2WK/beV/mpUqRtE
         yFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776082977; x=1776687777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aR0wfxNzBVSofwPdxGhUSe58+s1gtFmmIRWzztRcMV0=;
        b=WF+HBjcOpRIFGIQHbfP1zzTmazVAh1EuYqvKdforJREOwKRnm91JPd/SHNPrMa3tjH
         NIXTTG+cOcX/a4hO8Gf/vewYViRphxrwb1TXxf54IIQlDYVB2fYfXNKpfa4cuHbGgdNi
         i7xlX8VEyMMUDOnCuQ0FUDtnKaNhDIynf9eHN+XKcgkqPj24PMDntlYrkzdAgXJnu8sp
         QZIkniPCheBt+dxKd8KPJ10UYYWCSYYQo4cuLan7mnhx185haWvEN1Iug3j8qTGfdFm/
         SvSl59Mhp4eMDLk/jE6ckQwDJ1sLFZkT6kMWh6LS+MRCQrvqdCzn2BEZfy8fqYBd2OPB
         NFTQ==
X-Gm-Message-State: AOJu0YyzgwghYPJPcHIjbeQRdzsoD7Na8Nc6mVThxrkIfdD+ujGx9LnR
	9Ml6cJghGJDIGjjsNEU5kNvqRSntBetYVDxDQqWkvPBQFcJoRpAjWKy1IXC8rc7in6jNESNj+ZU
	w6gxUjaBn9B9eN/3r9TDSKMCG5Dann88MgJURbLqs61qo+JCHlGIja01vys2jo20f0DYk
X-Gm-Gg: AeBDiev649xiOeMeVMRp2uJDY+Yj+yvdYTbG19hRWSLUzJQQTzqvaQXRnLpfQ85JLOR
	0NRSmX4keYKwBHCpLUkeGQjEx1tR033r+mCVwVipyqZ5x7SySh+Taw63bPkNJ369AgstyrDvj5r
	EUY6TIPwuzcns5lqpECRuoHP7gQHcnu3AgJwjisNljP1G2wpNeBuLMn8zG7EE00MrNRAHeT3gZc
	tn7pYK2g47U7HzmGinBAy/69UKMUiuwfJDvYGaq20QBKDwc4Ww2FeWEbH8WfEs/r5ZGbj5TXsbk
	kGiQtnPb8J0F4L9nU/ADmdRLQjV7DhQzcVddLq5YRyNPKvwFFt5C2oDzAM5fvo2+hoC0z2N1kZl
	0brzJa35TaQEyWiyLbTOaO6SazZE6ClF7HyNRu4HnxYiDJjDDvA==
X-Received: by 2002:a05:690c:3482:b0:7b3:ca3b:84a4 with SMTP id 00721157ae682-7b3ca3b8fa5mr19090317b3.18.1776082977284;
        Mon, 13 Apr 2026 05:22:57 -0700 (PDT)
X-Received: by 2002:a05:690c:3482:b0:7b3:ca3b:84a4 with SMTP id 00721157ae682-7b3ca3b8fa5mr19090057b3.18.1776082976678;
        Mon, 13 Apr 2026 05:22:56 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7af400eb1fasm50781657b3.44.2026.04.13.05.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:22:56 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: [PATCH v1 3/3] pinctrl: qcom: lpass-lpi: Resume clocks for GPIO access
Date: Mon, 13 Apr 2026 17:52:33 +0530
Message-Id: <20260413122233.375945-4-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
References: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyMiBTYWx0ZWRfXyhJ1AK+LNS14
 +QHxRzSWJkSgRelmYUT34DTxMpRCYJFDnBBB4+2M1os4MWVfNsYdDsJtKFyGz35adPdPhcRUUEH
 rbAr8I2krfzhX1uL1mTR8FZpNRw7Hpa+BpbpTnA3t3r9wp4cVMKXH0/eeF0l6APG+NQ7qwxHoC6
 ogUP9eG/+8lCCa2cmzn6wB802aD9MXC2eivOhNOsX7mWkSmgbDoWb8QYvxQmIFPUg935ghdE/gf
 2igfq4PnvViv0kzW09FPnu2jh1ymGjEiP9tLRWT+/GgI6Carvd6CMuxgjFV3obNHlKXtQ+ugNq/
 9I/uWkDKoRNDxWuvP8Y+faJ5eFPIAdFy8OwUZAcCYJBI+mQfohg4rCgOAFqBY12n2+44KzH0jHn
 ozp2D8fm5KEwbwcCvnjAFx9Afn/Z9sHVUfSXu9aklT+PwlM9UImViDb5cjQUWvRyR9JhvfCKSsa
 f/ET6nPJBI7O34NXGng==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69dce022 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=f7xhw97bOydz6QRQpsAA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: k-FEipaNIdZp0Nh1CxfDJEQa2zb_W5H2
X-Proofpoint-ORIG-GUID: k-FEipaNIdZp0Nh1CxfDJEQa2zb_W5H2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130122
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102954-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF89D3EBE23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ensure the LPI pinctrl device clocks are runtime resumed
before accessing GPIO registers and autosuspended after
the access completes.

Guard GPIO register read and write helpers with synchronous
runtime PM calls so the device is active during MMIO
operations.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index d108e7321..4275f2734 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -49,8 +49,17 @@ static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
 	else
 		pin_offset = LPI_TLMM_REG_OFFSET * pin;
 
+	ret = pm_runtime_get_sync(state->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(state->dev);
+		return ret;
+	}
+
 	*val = ioread32(state->tlmm_base + pin_offset + addr);
 
+	pm_runtime_mark_last_busy(state->dev);
+	pm_runtime_put_autosuspend(state->dev);
+
 	return 0;
 }
 
@@ -65,8 +74,17 @@ static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
 	else
 		pin_offset = LPI_TLMM_REG_OFFSET * pin;
 
+	ret = pm_runtime_get_sync(state->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(state->dev);
+		return ret;
+	}
+
 	iowrite32(val, state->tlmm_base + pin_offset + addr);
 
+	pm_runtime_mark_last_busy(state->dev);
+	pm_runtime_put_autosuspend(state->dev);
+
 	return 0;
 }
 
-- 
2.34.1


