Return-Path: <linux-arm-msm+bounces-97430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLC1BKbps2l6dAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:40:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC542819CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 017133030FCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC6639185F;
	Fri, 13 Mar 2026 10:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bebmByIP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jlbbIkTG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D000739151B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398343; cv=none; b=Uy+MXWxw3p2vHXyBAUOXmUpkcSbBoCm71Y4Zub0D6aTdwub+cAmZoUyxPJ/HegUFk4iqAjsQFmhGKUN5+SBVtioJIwVSxVfKDL31zn/7foB5vTxg6PAS1adAb6sz21Q1POT4AslnRRZy2Fh52Q2dsL734JgT6h7ZFSfqe8IZnpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398343; c=relaxed/simple;
	bh=FoqFSSAiTfyIAuZzoV7iXeidCJ9wGZojo02/RhEIEps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BhwADseJz4iimkotpQundVIH/ZWqxo5HSJIEHMI9PgqCGAOQeXTVzqo2pPe5oj2aSFGDihu5JkH9FXMVvTLvTor62jKg0EITtHRAPgZ3IFFmnOEFcikAxTFJZqMTHKK1FXIFpuuuPxXOELjhKpr90qfdxvhsnJ+1w+T19iKHZBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bebmByIP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jlbbIkTG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7iVhM2262758
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WSrl/GiyTFY
	uo8iwDHPoqBFgN8PwcEDEUqLDvv0RTlA=; b=bebmByIPKFS6zIoSaioPiDaaHrA
	pbIBwV3xvJdq2qBVUX5CGIuju2+eqFQMTRjjn0A7W9sJBE8i4RYirphshtccZi9S
	YHfAnFAcujpKzw1c4Sot6ewPemK/CnuSjdNaRfbaFxiIYWOgOWybj1Sy4CAbFsKU
	97/DJQnVd23GcEqlBXQh0J9sMDOPPoggleRMf9SgIEo1pUGkDKJ2GI8PD1qqDX/c
	p+JSKab9okXZj0x6EBHoSjRxMbcI5uZOaTAoG4bnY0h9MGQa5XcrxwKlImudo6iC
	W2Epqe3WJkLqnV+B/Kiou8Em+/N4hOGD4yf8IPLdB4xIezj3jI1ch/PZaeg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4rmb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:38:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd77e5e187so1119642685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773398338; x=1774003138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSrl/GiyTFYuo8iwDHPoqBFgN8PwcEDEUqLDvv0RTlA=;
        b=jlbbIkTGR6EBm6JeRIhsX27ve9WxunIffqbB/LvEUb12rDQEWLMLOdKoH3+mBvgdkS
         VH9tMsjgTKKH1J6GBJtM+nEnSF0lzMCr1vjNiBVmZcNMxhfZJWdocXITkr7mDjgytuh/
         bV0nBnXnocHD9pa1WaY1ibE0+6p8zO1szklTNcY7MH/9ewKPfd8a2bkNClqDjXoWRJus
         o1lfU8S/+umF1sV2Bq34vyQPWHC3sP8SCpAc1trFOCh6lGx8IrQKwWVQHAkHGSt76RfN
         7Jr2hd8BmNeNNJ0M1HzXS5EembLmKV60XHH2+veCNkPoYqJZFhGx/SQC937zMbvK7G00
         9WZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398338; x=1774003138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WSrl/GiyTFYuo8iwDHPoqBFgN8PwcEDEUqLDvv0RTlA=;
        b=jXBLVg19YcyhBboAfTN8ysZfjdyu36OL34MA/1dpKyGcmudC9sewfDcQi0GwsGLGRt
         OyCgODPIhsA8VmLQQ2XRp3sf52LfDQLFgdxO4GEn4Ga8jJnc9X3We0VL9Wi7sT5sFCTG
         1fEj0Xm8XxGjG6uvOB3wimPhicupefI7y9ExyRo6+P7a2KF93Y2dCo1Cyq7KK0Jp1ZlR
         Ub+KMpt47d4g91rzBpZjJY88tkFWouiVZRzaW/0N2buxAShquhjVSWgZoqG5V7aVT0JK
         R7nijW3FXojdjsLHHtGNY7JpZb1KywQkLrfn+bPbCalaDhQnhgKNJPWDPjdqw+fvg6Wb
         4RWw==
X-Forwarded-Encrypted: i=1; AJvYcCU2rOHBlUr+AD5rv8BjUWf3wrjp8kc/VoA4UHHfJQyleXlxy3x74GzJVKePQKWqWSjnAf51FIYpkRtK0z3t@vger.kernel.org
X-Gm-Message-State: AOJu0YzpRlQRQuKOPd3rsR9C95RKXItgSyyr4FzCuK5xUssZJfnspvAp
	ZSSAITuPOX0hHt14AJYGNmKkP4AOmvaemwTmPDhez/w5HGwTp4HmBRw6TS3nlUZGmdYrqgkpstu
	T5AHwtU773nLtxJDw/DX+GwgWBY0CFLDS4r+QXM1dn1vIL3y3FYBCQ6UP/HQhQwdhlMpa
X-Gm-Gg: ATEYQzzIzdLd5Xs0BJt1Vv9SWD9AUKEpsovI9X8aYnfcBDizgmjbSNM4N6M0av7SblM
	P1GliM0GAqWFHYJZZ9cBeZ5deALBbuYZjiG8Zkcwa/2geTHQgXuDv/Twkj6yER+68FoyC3mAElq
	Zb1dLoj9/ZbSCUGa3NaurxMf79x/knJ89p4+EgBQPvVMmhaHiDBK26t6pi81YIHnHAxpxOb1hq3
	nWj6nb/B9IsSks8Tn34LEKtSfmYKK13C8dH0mIgKmCFAYw6GZO54iG7olBegPQcGyAbCcNyvMZ9
	KlFgnd/QQFuPNwBzhoCrRb80vHOM80AIrVFny+H0uuYgcO3PgihNoolcW5HSFmEWdiQHpKE0b8O
	TwCI7mwpd6TMmrHWg6/HP4umda52QMzMjdXc4mZFWU+wCDPgB+9/HJHs=
X-Received: by 2002:a05:620a:4092:b0:8cd:7fc0:ee1d with SMTP id af79cd13be357-8cdb5b23729mr387024385a.46.1773398337951;
        Fri, 13 Mar 2026 03:38:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4092:b0:8cd:7fc0:ee1d with SMTP id af79cd13be357-8cdb5b23729mr387019585a.46.1773398337375;
        Fri, 13 Mar 2026 03:38:57 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48556426be9sm20183445e9.9.2026.03.13.03.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:38:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: richardcochran@gmail.com, r.mereu@arduino.cc, m.facchin@arduino.cc,
        geert+renesas@glider.be, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 7/7] arm64: defconfig: Enable configs for Arduino VENTUNO Q
Date: Fri, 13 Mar 2026 10:38:22 +0000
Message-ID: <20260313103824.2634519-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260313103824.2634519-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260313103824.2634519-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8oOLy84P2j7A-ohCqPcb9rNYJnLzMkCK
X-Proofpoint-GUID: 8oOLy84P2j7A-ohCqPcb9rNYJnLzMkCK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MyBTYWx0ZWRfX8LWpPfBfDdxq
 R6ilyUOGDhkHDkh/0wlSI86wURVLvsy5B2zch7Uvhp2Gw9Zp5znJdM3kzC+OJSa+l9tUfNuycL7
 n679P4py+8nw2B12dmMPLegQHYUvfT9jATKIzz2CuUsQvZ/mvCOskpM0OcPPtcnKAOJf8HN/36J
 KPMxl0ZkGG6rdFlLylWxgQ02szAX6IOV5b/LuYqV1yOzVBFtyh83J9SBwfAquir0W4DQCdJwIsd
 H9e+djHywyx70/mXekpfb2ZpvNRVXg6V3oQEzEpkjSNyfIUYryC2Rk/bxrR0TIW4HOqg2YSwxyk
 grJNmyw1jbaUNeUOgxUbmcEPPrJQOP7i5LeeZSWguvCf1+iOB5FaFPy+GSWsELFyHPA4tsq/D6E
 k6oTZ1K+9bvSGawbPE0YP62hMiUt85wM8lnehNtmOPWSuBb1cqGJuNdIvpiASshXoZa0eIQjAje
 1rK2/My8Q2wgeHX2RlA==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b3e942 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=rO3wVDe-YCVyVCuK1RsA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130083
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,arduino.cc,glider.be,arndb.de,oss.qualcomm.com,kernel.org,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-97430-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ECC542819CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable ETHERNET PHY and Analog codec configs required for Arduino
VENTUNO Q board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4ed70ab7ee85..aefb8a81b78a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -416,6 +416,7 @@ CONFIG_MARVELL_88Q2XXX_PHY=y
 CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_AT803X_PHY=y
+CONFIG_QCA808X_PHY=m
 CONFIG_REALTEK_PHY=y
 CONFIG_ROCKCHIP_PHY=y
 CONFIG_DP83867_PHY=y
@@ -1145,6 +1146,7 @@ CONFIG_SND_SOC_ES7241=m
 CONFIG_SND_SOC_ES8316=m
 CONFIG_SND_SOC_ES8328_I2C=m
 CONFIG_SND_SOC_GTM601=m
+CONFIG_SND_SOC_MAX98090=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
 CONFIG_SND_SOC_PCM3168A_I2C=m
-- 
2.47.3


