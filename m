Return-Path: <linux-arm-msm+bounces-97960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMa6FdoEuGlpYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:25:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9380C29A4E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 11E813016B02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5BBE397E62;
	Mon, 16 Mar 2026 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djTK11N+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLk7JEtu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F24397691
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773667461; cv=none; b=Z1QkaPF68DDLDb69P2ko6qqYzYjEPuc5MNbsdp2GW4GuGdVPQU1aPYSlFqX/AyMeQ4gW6cELKV7gqfjUaXSFMl7TJWfVzOepAseUAmGAW/3gidAEMRD6QY8mcDR0EUatEe8n8PZRIeoap7HMuZrBJg8PAXe+STkHGKBNiNuPOOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773667461; c=relaxed/simple;
	bh=nzqy+hSON4ND/X1vo5z3WIJHZSGtctE4GPV5DLK9Pgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=s95oT8xiHDrrU722y6oEDaU3THYurHrMHVfc2Oap8Y6lAHnk6wIdnDVXuHitT9V5fWE6DT2gtpnHsFEgmiGbngomvtIRNMaYJxwlgFQOIjVLCM5fryMePTPSJCjgo4rwSqnwpfvCz18KFX2TtbMJJeC+CtCeRZQXwVgATkkMcs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djTK11N+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLk7JEtu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBhtwK2672154
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TykivBUS0GQn7Dlm1dBGtz
	uFnfmr8W6go4PhlR2QyM0=; b=djTK11N+YBMw7tqp98Wqs5otQiFVZuX+g3R6F2
	VaI6Ctf0B37TclyT5uAAGEU7NPwODLhWoMxDyLuQlEVSkMo2RELHpfjVZBwCrFYv
	cgE9UGTM13ueYgz+j/fnjRvcWo0yyaHBHTnSs80maPOQo4G4B7JUGSKPaK8WzCj6
	dIOL3garX0YglUUjOr7IoBTnWff3IVsTTlRto1KKahFRr1YNz9VLNyxuyyULRIwc
	q8X9ZaXgDjXQxV/c8MZy+mLdGjUmqfaut3XY2damcEltmLJyyT+bBHRCTjIg7OBF
	BMg3N1/lUVpbkmBXbg8g4kgY/LpmAmNgX6YmG1AhuQxvaSSw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xnyr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:24:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354bc535546so4804300a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 06:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773667458; x=1774272258; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TykivBUS0GQn7Dlm1dBGtzuFnfmr8W6go4PhlR2QyM0=;
        b=GLk7JEtukgU68/ysbbVoNgPACYSwI8nxe0fJTUv9g1pbyvsEujOfuvbpaFV2y5cOeq
         EcImSaM+KY9SHKDNN0oHZlUycdGL4Z97YWLR3EMjE28TRVOcXQjxdD57V2UthuHOiLqN
         9AQBVSqyQEYx1hSo+6e1UFxe8x3i1yVmxSVwtiQxmWhVcFWFWdRfUBSIgZusfRfmgJoY
         BPXrD3Sl6B+OCyrETNvPny3drkYD+8dbhyHZa1Y9B6RNoowAySv0cl3YGWRwa5DOJ/1i
         dRXklAiJf42LO1gfOjWj/app619hNguqTuAOyHixp/0QTrS7SRdqubC9RGPf+k3iEcyZ
         lVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773667458; x=1774272258;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TykivBUS0GQn7Dlm1dBGtzuFnfmr8W6go4PhlR2QyM0=;
        b=p53YXdf6xjADspveQ+EsxoObwzqpwTQPD4hAaYypLNk2M/eHkh0Hn0/bhW4niGv1oA
         GK+fVqhlzSI6ce70EXadll00gS0fcVoISth1HbvEK9hbJDcnFDNDq+s0vYqgSW3Y2vGF
         3G2KEiuUt46uBHj+aG/bPfs9g5AYacgDJYjnOZiccMSWdsjrj9RaYWZtJ6YpGeO5FIyR
         hVUq5026GO6REA6eFppE5PkHgsm7/1MXU5sp0g3o/wIpjWcLLm2vMituQ09dchlb6xPI
         WIj6+QlfhL7A37z6tL2Aac2TB1TLY4isFcBUsapCPTKn019o/IFWcc2S8u2KSBQA3Mns
         93vw==
X-Forwarded-Encrypted: i=1; AJvYcCUzAEbfuVG2J2t4H06JOcAySVz+4+YB/9kQrEfG6SXa9mKO2jM0/wbWXbCylz2zJFXVvU0wlSrBVrOKylS1@vger.kernel.org
X-Gm-Message-State: AOJu0YypsTrqQAYIKp6Cbv7zIioMa+ynVVOKeQNOx4H35UbkXNjxqmLj
	HN6z6CQAc6krODeV+gVDW0/OvzOhCBw/uSMslX3Z0eTP8smRFzHOOOm4H7M7K48IcT8xAL+BWy+
	86Px+9nVrHPoIm1ioc2AxAv9UqOSes6FTNgGKRfk8yQVyhXOF0rFpeaWTm4fvFagNfsiF
X-Gm-Gg: ATEYQzzgBqnjgiy8YtmOeMugVAOk4R/gpxM91YTF4esy72iwyZ8icTbb9efB0D5wXhz
	cSUvP6mgD0XKayd/K0w+3/AY4NQ8Xzfc2WhDF0wEiqyEO+b4eEgxDu9jo1AkkiWDq3Y7ljiJRf3
	PbP4XDeeAUcGNzvkhk9R577wnhXGvszOoP4uWzQRasIl/5HMXIxzk07Ah6OxL4YO5lMV2Axf99A
	BxdMtoTtCocw81tWz1yYu1VxyyDwiT5+jjWbE0aN7TrR1xru4iKEiYh1pXC+rAdHDTlLjaIUQEY
	i+Lg9g0H1wGds2uVr6ygTKDl/qqumKSefK9b4q6/JYphaZAvAa7YTFprkhgYR+h208llaufXztX
	QutCnzEk++epQSnzBFg7994/MPhl9MZjhW2Th3KGzSn4=
X-Received: by 2002:a17:90b:5345:b0:35b:93d8:6ab7 with SMTP id 98e67ed59e1d1-35b93d86c97mr5359848a91.28.1773667457982;
        Mon, 16 Mar 2026 06:24:17 -0700 (PDT)
X-Received: by 2002:a17:90b:5345:b0:35b:93d8:6ab7 with SMTP id 98e67ed59e1d1-35b93d86c97mr5359817a91.28.1773667457498;
        Mon, 16 Mar 2026 06:24:17 -0700 (PDT)
Received: from [10.213.103.163] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b929558d1sm2493497a91.4.2026.03.16.06.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:24:17 -0700 (PDT)
From: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 18:53:31 +0530
Subject: [PATCH v1] spi: geni-qcom: Fix CPHA and CPOL mode change detection
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-spi-geni-cpha-cpol-fix-v1-1-4cb44c176b79@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFIEuGkC/x2MUQqAIBAFrxL73UIqSnWV6ENyq4VQUYggvHtLP
 wMz8N4LlQpThbl7odDNlVMUUX0H2+njQchBHPSg3WCUw5oZD4qMWz69IF2484PjpLSjYK3RFmS
 cC0n+jxe4FaytfaIAwpNsAAAA
X-Change-ID: 20260316-spi-geni-cpha-cpol-fix-89126ed55325
To: Mark Brown <broonie@kernel.org>, Jonathan Marek <jonathan@marek.ca>,
        konrad.dybcio@oss.qualcomm.com
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        bjorande@quicinc.com, mukesh.savaliya@oss.qualcomm.com,
        praveen.talari@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        naresh.maramaina@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773667453; l=2079;
 i=naresh.maramaina@oss.qualcomm.com; s=20260316; h=from:subject:message-id;
 bh=nzqy+hSON4ND/X1vo5z3WIJHZSGtctE4GPV5DLK9Pgw=;
 b=KbIDaMv5XyHWZjr46USGkKLK+8aSZrOHTD5aWp+gPDk0pGYv+SkDzPx0VBHJiKYblI5nL6Rty
 4WFB3ovD672DVJ6361LFXPP11MuuvDoe9iONv9nRSMj4cKxWbQSs/jb
X-Developer-Key: i=naresh.maramaina@oss.qualcomm.com; a=ed25519;
 pk=j7iST9yrLbsgWcWrqdlUNIOWl2WBl4wV1q35/n9SCkg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwMiBTYWx0ZWRfX1wmrSR9fCIxG
 Re/1ScmAgSCYpzycmH6Ruub77k4IFHNb4WpMyphFiGK5HIv3NIJfgQsTnZu8b8VjbtmYoe4AyG8
 IrVlNahO2luvSvmqOxFcs6lhrqPOuBDF1rBXnwQ7/WYwY7NYV/OTA3lOWEqJI/ItiiRTZC8VzDa
 tJX7gJNWd1T3atDSPd1lFb3SmUiO2cdDanpj8TuwkpybE7oX9ljxovDV5zbxTHXbY8xenvQQ7iA
 mngxgxUduWV62U2wvYcQyfhEazwKenRfJSTfW/yJ7jjqzLbF0RQO0NyRdIeysOsmsyCXPP14zYD
 atooUA/Zw/cmEOf/ixh5NJUCbbmG1PaAGoX1m4P9JRTnDbCzZEwwupSZsDXKddC78PLFU3KiYgA
 1d3GyzhcwAMp40JnwYHeblYVzRv+uKB2Cu9AoBHHy4hwdlUgIODp8TBrz3zIjTAu//VgK4NUnm5
 Hp2qETQ/a2DDiojWp0Q==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b80483 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=D3EvElEm-D6odJYB-dYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: cwzXF073jvVclP8sEiG5RKkmMm161ek3
X-Proofpoint-GUID: cwzXF073jvVclP8sEiG5RKkmMm161ek3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97960-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[naresh.maramaina@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9380C29A4E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

setup_fifo_params computes mode_changed from spi->mode flags but tests
it against SE_SPI_CPHA and SE_SPI_CPOL, which are register offsets,
not SPI mode bits. This causes CPHA and CPOL updates to be skipped
on mode switches, leaving the controller with stale clock phase
and polarity settings.

Fix this by using SPI_CPHA and SPI_CPOL to detect mode changes before
updating the corresponding registers.

Fixes: 781c3e71c94c ("spi: spi-geni-qcom: rework setup_fifo_params")
Signed-off-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
---
This patch fixes SPI mode change detection in the spi-geni-qcom driver.

setup_fifo_params compared spi->mode against SE_SPI_CPHA/SE_SPI_CPOL,
which are register offsets instead of SPI_CPHA/SPI_CPOL mode bits.
This could skip CPHA/CPOL updates on mode switches and leave stale
clock configuration.

This is a single-patch series.
---
 drivers/spi/spi-geni-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 43ce47f2454c..772b7148ba5f 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -359,9 +359,9 @@ static int setup_fifo_params(struct spi_device *spi_slv,
 		writel((spi_slv->mode & SPI_LOOP) ? LOOPBACK_ENABLE : 0, se->base + SE_SPI_LOOPBACK);
 	if (cs_changed)
 		writel(chipselect, se->base + SE_SPI_DEMUX_SEL);
-	if (mode_changed & SE_SPI_CPHA)
+	if (mode_changed & SPI_CPHA)
 		writel((spi_slv->mode & SPI_CPHA) ? CPHA : 0, se->base + SE_SPI_CPHA);
-	if (mode_changed & SE_SPI_CPOL)
+	if (mode_changed & SPI_CPOL)
 		writel((spi_slv->mode & SPI_CPOL) ? CPOL : 0, se->base + SE_SPI_CPOL);
 	if ((mode_changed & SPI_CS_HIGH) || (cs_changed && (spi_slv->mode & SPI_CS_HIGH)))
 		writel((spi_slv->mode & SPI_CS_HIGH) ? BIT(chipselect) : 0, se->base + SE_SPI_DEMUX_OUTPUT_INV);

---
base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
change-id: 20260316-spi-geni-cpha-cpol-fix-89126ed55325

Best regards,
-- 
Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>


