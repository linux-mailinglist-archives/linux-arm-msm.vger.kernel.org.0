Return-Path: <linux-arm-msm+bounces-110415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MD+LFPQtG2qU/wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:35:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D29B56120A1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36A8630B4560
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 18:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F473CF973;
	Sat, 30 May 2026 18:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gdWfRsu4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGUNB6iE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3493C73EC
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165732; cv=none; b=HMzIRtm2/3lBcGn9/vTCIPZhzRN+MYlANMXeFBNbPONKFyX9D0D4QEK66JgXp6Z0/swLiVHhmqO0oYA0QbixGg6daIk2c7WbnFMuQhKm42GDSfdAxFGLcnHFbJZKoUqP4ebGzsuDTAkLQtwHWixnYAW/etmJQaFUJsSczn7WdY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165732; c=relaxed/simple;
	bh=rlu63NqzgVZGbDQFT3XHJ2eEFRpxquNj27s2b770qto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ayXl5pqVPP6jWRMKKCdxB1Yehe4gxolDJpW6a3qKJ1+oHAld4xW6cCThfCT3ljBL76DZ1LOhgTor/HIGaydZxNyBvcApBfLhOlhyBqITymc0bBbnnDl4FVQxGKOURSrTY2dLXCshqyEG8yt2o+HCSqo2gzYDqKAHN9ICu8E2gWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gdWfRsu4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGUNB6iE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEOTdD250147
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Grijfbm0GSs+meDyPd4bXAK+a5thmeqrFJ+N6944pxo=; b=gdWfRsu4Tv2tq5yQ
	KKNYzjhztAjyNy/cbGyBGKjDOI+VPkliaNCKt/zQewwxDiyWkEtmOmxp4BuMov64
	qKxM8z/4zV8nxTdYYcv/lbyPnbDIiAGO4J7Iz5hIGgHBwetmTCQJRphykcd+69p4
	4dVQRH3ZhfFxmbz/x5DdtHuOcvQXry96eqNkxrVtuWKjU3M+dOGLV5LMJmcnGeoc
	Z4rph33joVUKmEwXvyHpfTflwMVNO+0dJDNEVruaX+H6b/QUsi2hrhl6DPyU5xW3
	2AyqslReOtoPg85rMqinB48BUlJMoypDg/BszvWEB6VdhW+1COkLlB7B61ojedS7
	Qpr8TQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efux519nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c36f4b76so687775ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 11:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780165730; x=1780770530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Grijfbm0GSs+meDyPd4bXAK+a5thmeqrFJ+N6944pxo=;
        b=dGUNB6iEDJVs/m7Zm6ebXRExf7GiXQ5DZTw26U8xWQ7V7Ds2gDK6MwYceO2Ku8emVw
         fEkDBWKwX/cTjd51IZ29iiiW2jSxA3cqYPPmrxdj3AzqS8t3024yu+gyc5hb5GxOtpym
         PZALfoXBHhmy8f9WNt5U59dqvV+S3nax6/pK+T0+WzDnWKHs8HWzZ05roPBPC8IxR/xa
         I38XARqZrtrnVrecd23DZrGKFovebYKaH3Js0McvAYFENE0W9G91mquoVd9WhFgcMq3h
         D+3TLIRstuuJQ4KZAk2Ph669gb16MUSwgcpFgVcMVJf5QybqqKhXhtRgg9eOcpCKk29m
         VEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780165730; x=1780770530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Grijfbm0GSs+meDyPd4bXAK+a5thmeqrFJ+N6944pxo=;
        b=n+n9svUc3cfUlZGdB05iTLGnnCj1CqSHodJfL0qZ2GO9DWh7jos7ywD6fhllZ3H+gT
         HsysMm0SVDKvCBmh/BzTQbWgX8ZfonQkWwgyqWwoe153wu3LwWg3snIx2QgLHuB1FP4n
         IZ2DNSWv/1Y+LPdef38lb+rr54vZQqLdNLGojMB5fOEET70iZNIOTwn4OfR9XWNbcaIS
         J65X72+4ina4gUQSsB3SzytLOOxXA/yzMtXVb+ZiU57tCqMWxEva6MGIrRhBcSu3HL+o
         zFL6LvV1i5UecJ4iokSYIEwotK7g5kZFKz0IqNs97pyq+YvvxY88VUezvJ0xrj3qCVAI
         bzpA==
X-Gm-Message-State: AOJu0Yz59ShlINpgJjlKromf3XUECszD7udMgq2c/CMdFr1IRD26/7mQ
	TOW7MqV6J9RluipgXJklft4RsC1vartgZikCSqqhB9wiDOxtpfzQCWjGKQ7+/QX+SEOMukzenxP
	tgD+bwXozARV+kAqv0SKrwMjdwqoTWea21S8O/1i+PMGg8VorcPh2YT0Y/a1NGBdhiL7p
X-Gm-Gg: Acq92OH5tBT14cpJ7/CJeIsC92VCgryx6TnROsRB3I7CrRq/m2189IFV7aQ9XeKu4CK
	fxOLpFD6dzdyyGJnhwc9JaNpFP9Ruz1szlI82KGiZuX6E+oAi159LWKJLWMIdj04e7wmOBZ6PxJ
	n+PFB+lMxHt3qxBbfWJ3VyUYU/1MZkfakqZe9obfxLDZjp4gUUCXYDVFSUT298nLNKWse8wbi89
	oY8LaAqXrseXcoXe8Z9sNDwR9oxIOERGR5ydXIkftHAUR8FnqpR2i7tVTo/fjajUbPr+wDjVva6
	LfH8F0GfP6KLmaxYVv/WkSVDgYLdwh+RSRxuYi0NVvhUIfLhoPm1f+WnYxAgYKvSYS05t7KH2iZ
	4tqtMz236uH2Ni3Vdi30Ne/DcvXnMyXoO9A9IucYRhKozPLsRoqHFoNfuZ08Jl55RoA==
X-Received: by 2002:a17:903:124c:b0:2ae:6259:5aff with SMTP id d9443c01a7336-2bf3679571cmr54559455ad.6.1780165729594;
        Sat, 30 May 2026 11:28:49 -0700 (PDT)
X-Received: by 2002:a17:903:124c:b0:2ae:6259:5aff with SMTP id d9443c01a7336-2bf3679571cmr54559265ad.6.1780165729033;
        Sat, 30 May 2026 11:28:49 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a27ee3sm56879635ad.36.2026.05.30.11.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 11:28:48 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Sat, 30 May 2026 23:58:25 +0530
Subject: [PATCH v2 3/4] spi: qcom-geni: Use resources helper APIs in
 runtime PM functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-enable-spi-on-sa8255p-v2-3-17574601bd63@oss.qualcomm.com>
References: <20260530-enable-spi-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com>
In-Reply-To: <20260530-enable-spi-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780165714; l=1862;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=rlu63NqzgVZGbDQFT3XHJ2eEFRpxquNj27s2b770qto=;
 b=H4y/JGukGyrEaXtiG0q8jIuFzEudHtHcqalv9AP5Tk1w7MKQOSZQUGodDOlM2SdTuWlCNVMIX
 E/yfI37wg09CvBqbfXZ/7MgQW58hKZDx3I5Rha552v3Sv+YThfpuIfe
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: CF6FcBkJaNJ2WKFIVZqXSXL8fc-hAgEh
X-Proofpoint-ORIG-GUID: CF6FcBkJaNJ2WKFIVZqXSXL8fc-hAgEh
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a1b2c62 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=i7xoKaWEWnc8ZE6DH4sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5OSBTYWx0ZWRfX20uC9SxaRcK8
 Ft01h7+SYrQ8AwM5NfBmr2paImLOuKpHRzpKSehqKtp9AfPraRIRo1v93N2jn0hccrH8IUZEfzv
 7sfcqJb+DVfsyNC8B7Yy8V034JQt6fPMgiQutAzJtKWilX/BVqP9z7ojl0zLrUbtdpp1T7sAjyI
 MnAk9POw0TtW/w0tC/9YJFrEbRzg6LYdvmS/JyOZgQxiZw1SjUQhIOYBOIQHtWBDPC66UDxfObt
 OmPkCQQGPZJR7lnnbqhwRpfducSvlBvY6lHXjw2gGazQkY6mZq+EKcVZC8FxIIIUAb+g97UUdKv
 Rn52D0MZ+HmotOat5BVx2rQvpLvqNpi2/sKjw2pZtdebLtOW1Wfz3IYnPQTdGYhi7AaKDr8VhqY
 ncZMHJ8C7drFdWgZWN2GWC1pZDR7jFPEip3nOP9hwswyaugUrHot+qoy47oBe50Q+NHMQaG2qDW
 nfu3hlA3HoZHO8KOKPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300199
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110415-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D29B56120A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To manage GENI serial engine resources during runtime power management,
drivers currently need to call functions for ICC, clock, and
SE resource operations in both suspend and resume paths, resulting in
code duplication across drivers.

The new geni_se_resources_activate() and geni_se_resources_deactivate()
helper APIs addresses this issue by providing a streamlined method to
enable or disable all resources based, thereby eliminating redundancy
across drivers.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 333216df922e..7696412c6e87 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1119,33 +1119,16 @@ static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
 {
 	struct spi_controller *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
-	int ret;
-
-	/* Drop the performance state vote */
-	dev_pm_opp_set_rate(dev, 0);
-
-	ret = geni_se_resources_off(&mas->se);
-	if (ret)
-		return ret;
 
-	return geni_icc_disable(&mas->se);
+	return geni_se_resources_deactivate(&mas->se);
 }
 
 static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
 {
 	struct spi_controller *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
-	int ret;
-
-	ret = geni_icc_enable(&mas->se);
-	if (ret)
-		return ret;
-
-	ret = geni_se_resources_on(&mas->se);
-	if (ret)
-		return ret;
 
-	return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
+	return geni_se_resources_activate(&mas->se);
 }
 
 static int __maybe_unused spi_geni_suspend(struct device *dev)

-- 
2.34.1


