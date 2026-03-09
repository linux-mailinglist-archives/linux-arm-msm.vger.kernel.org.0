Return-Path: <linux-arm-msm+bounces-96295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLIMDcjormlRKAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:35:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C9823BC73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D7F03164A80
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 15:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E4E3E558C;
	Mon,  9 Mar 2026 15:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLxY740e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wl/oIEIj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395933D9058
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 15:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069881; cv=none; b=Jqe57LXzsIOGBJHMPYbvIXuhrhG95s30HAs5AP0sGoHSL0S/Zo+Omew4SFgIh+zqFTpUCmmPu71mwXeO44iZTDk73sxY/iFC0wIAjbdzJD3oQDgVvCXO84pgId/5g4Sw8BKKXbn+hlevXRDiB6oE5dtgzCV2rPWLl3fQLWoMeS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069881; c=relaxed/simple;
	bh=F9n0ftLKGlM6JU8PeQyKHdnuFLu0ujL0nGM4mPk+Qlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A9QOIm2wZMT9xt17WVKc2GsZHlllN6bFsBplVzJ4Ofn8PF49q5sIXBARYd+GtzJ5T3CCa43njJf7CIR7o8O/kUgRHwlKik0PHytKsmiYjPhKJDX6C9aJaYJPtpSNQ1zwIwghNIiNpSrt32gaPt89csJHEjdJePYSHEnk6aIj0Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLxY740e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wl/oIEIj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629Dqhel2137784
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 15:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fT0QxTs3w4o
	nOwpcb/N6xWIFXq4k74USa4Ia+RJ4IcI=; b=SLxY740eFeMHXel3oQxGTx/vPOK
	ts6zQHxpSRpSOu5czImJIHPnK6ylFHpIb0Y4gSDSJeuMIrw/oV6U6Lq1pPkj62l8
	HvXJ3JdLuVInwI9U9XFozvYpvJk9dKWOwWcUBYbprdrWE+fsPKSf0YcFE5fNIkt8
	nYzhCxeyVJIKZhjmrBMkKri63WgVbUyT1KxOkBEs+xJ8v2P9HKG6eMXuoAT6VeDr
	HVuSFxuymdMwRfsBywCv9MXm6fl5OTd7BNWyky20kd1oysVxVRn2HkM1y0onnlTL
	brJAsia8VZepycP9mXshbkryi3kLhxbHDwxDNa75/B+gsCjF1qy/RFh48eA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyft09ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 15:24:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7fc27cf7so872906385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 08:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773069879; x=1773674679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fT0QxTs3w4onOwpcb/N6xWIFXq4k74USa4Ia+RJ4IcI=;
        b=Wl/oIEIjkvaMJU9P5akmev2x3UEGnOFsSNaIC0L+VVkqiJI+XRW/Xe86klFNxrt1es
         Xis4VjPiHpxZI4gWw9Itt2mc28aZOjhJIFcI94blq/wKbNQR7Sz9m8+xPViWb05ow6wx
         NX4GIVjzBR/iKeVZUWngWX/cxHQjWnopD2v5b+8xDtPFWZ1gEgO2rD+yUXDbLrwudYTh
         HaYgofe2Ol00lK+YNhboonJfW4ncCs8Xc3chqW9h+wGRAc1D8lKN7yJ6/7yrF1smVyuK
         4U1BuG7xiP+VQD2Ra0B25+iI45kekPn4Lda3ZFVPiTb1aCUJTzZNiPaq0stJCylDk0WK
         hEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069879; x=1773674679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fT0QxTs3w4onOwpcb/N6xWIFXq4k74USa4Ia+RJ4IcI=;
        b=DdMDN6qUkjoGh7cZrccaXv/QG0zpl+xbo5x3XGv0ORbHB3Bh8tWi/stE9i/1JpS/9c
         SJ97sLs/NPsCZ3GQau959iNR3LWmvlr3eAhuuz1orhWFvx/S0nAsSsxYpyb0cYDLS5dy
         cfTUX5E0rp51hNUgMRCucZdrXom49P9x69wAfMuCm3bXa81C68smFuPTsfBVdYd4GtUx
         IlPGbmhFGS5ER9ndo4RLds4pa8EIVLmACk4W6Y50hU3in3H6qsP9JF8Vh920+A6Yf146
         7ooHYoO4i6ycIVl8zzGhG9ku6C2OGBEwrbM6uKoUQQHEZX+YgGSqr40KhU6WsuPl0CcO
         /dZw==
X-Forwarded-Encrypted: i=1; AJvYcCVpqrhiYfHzFGQT7rVmERbipdL/PkpoQTx1yI4K6rWKoMFCpNtyAf2mNXd0sKpR4XR/qu93cioH7Vkd5c8I@vger.kernel.org
X-Gm-Message-State: AOJu0YwtSWQo3ewPJAKM0oTFOUWw0XFrmOrCqCckfCigwARLEU6+r1iy
	xm+6DHE0jmynjelrF5Fdc+MBHK6NlRozx/+mr04BarpyG6J4ydKe3fltcgsjJZvJ6qdO13PqCT2
	Fk9/z3w3mGw45X742mSRoZCyk6560OIghWenkQJUU8UGedeoaR26Jjaig2joBGYfWsTIL
X-Gm-Gg: ATEYQzxE6ZbEc/OYGSux29GHOx1bPKtBLji30LxyGTgtAEIvOHCLrzr7kRf7nRKNygy
	gcTIqUeHl5e0O2E7Uoy71JkOPs4mV+qMrRP1yXjH69pTvn+bStTppHbM9aE8QkXVmUv8r/xsmfj
	JtpITcOLuPFz8hrvfAfIy7XAe/M4D4MDZQtRaqvrOWhZnptSDN7xS2L55pzy/nWEC9CQpu9aLOl
	sGRQhTmgsk6nUJiGX8QrmLKHQ0WmuT2+cRfMIKNTOZ25UUd9RG5ptMD4oknP9mRD1MGDuO+VRNy
	+NPKP5R4xRJi09cgT59CqwZoxXouIQl34Ulmo/p+YfMBmPvB9My5q+x59Ya3Os+MOjc915jAq/h
	PeK0yJvgDFMX7i2uo52y5OwSYHmLvWN3YETXiELpONaxlnlqZvVp9BUg=
X-Received: by 2002:a05:620a:480c:b0:8c9:fb0e:ca43 with SMTP id af79cd13be357-8cd6d3868aamr1381786785a.24.1773069878732;
        Mon, 09 Mar 2026 08:24:38 -0700 (PDT)
X-Received: by 2002:a05:620a:480c:b0:8c9:fb0e:ca43 with SMTP id af79cd13be357-8cd6d3868aamr1381782185a.24.1773069878230;
        Mon, 09 Mar 2026 08:24:38 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853a59fc36sm192812515e9.9.2026.03.09.08.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:24:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: richardcochran@gmail.com, geert+renesas@glider.be, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, m.facchin@arduino.cc, r.mereu@arduino.cc,
        loic.poulain@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 7/7] arm64: defconfig: Enable configs for Arduino VENTUNOQ
Date: Mon,  9 Mar 2026 15:24:18 +0000
Message-ID: <20260309152420.1404349-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309152420.1404349-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309152420.1404349-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZTYFZGY9euFvUg19vnC77uM_AywIbniv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEzOSBTYWx0ZWRfXxeeFv0md/qso
 BIvu08p5mP3AEuYI8KlBl1jiDQX/BMbtgFamiS9YzLxtuBxG6NK+ED5uBLxNcS5Fbf71mop9Vd9
 pbgVKHF0totTXjs45iZy6Eoj5imcrOLUFUGLN5WU+EGXSK0DtRdk8/ZPn021ZeYZnKJzhp4kT5c
 O1vMHpHYtfb5MyOrfwukIuqi6j7zt8G4d8ZvUa1mNjNKCGtIQ5qhc1vTH1IRwovChuHkHbZicMs
 FFkFtLxacaetTSzGgXzDLDTDODQqx2LXX2d4xMEmVAjmNeyPi72mNrIhj/m4du7BJJQnjVYXn5T
 FQcrF50/sXaHbeuOa5IxaK7HOHYgahxM7i22aeuo2UGnW1yz1eD4m0oyZAjcnazSmv4ErZuU4zR
 DZf164uDgV20SsKRPeXruyctMdlyqZ1I0cIY0DU9T40haiPQ1C/s6DUOAECtZYu/sfBjUkyw7Oy
 T5HyQf7/uR95YMbVznQ==
X-Proofpoint-GUID: ZTYFZGY9euFvUg19vnC77uM_AywIbniv
X-Authority-Analysis: v=2.4 cv=F8dat6hN c=1 sm=1 tr=0 ts=69aee637 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=rO3wVDe-YCVyVCuK1RsA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090139
X-Rspamd-Queue-Id: B8C9823BC73
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,glider.be,arndb.de,oss.qualcomm.com,kernel.org,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org,arduino.cc];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96295-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable ETHERNET PHY and Analog codec configs required for Arduino
VENTUNOQ board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
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


