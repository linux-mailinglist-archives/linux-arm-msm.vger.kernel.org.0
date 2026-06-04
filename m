Return-Path: <linux-arm-msm+bounces-111145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5wftBowgIWp0/QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:51:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5F163D5B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:51:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WjQ7e68W;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OjOIUrVK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111145-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111145-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 21917305CE0E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 06:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885773DA7F0;
	Thu,  4 Jun 2026 06:51:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F0A3D904C
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 06:51:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555881; cv=none; b=rvf6jSWmidOKVOLLiLr7D2XZbI6dC08Ok/NeDAPIDd9YrVd8VuQ/Vtbja0PIGfw/U/1ndZbVibZnvfr6F2mQ/XrtPsBd0X1J7vAkX2i4RW9d9W43tVM9keopAS5lMui54iW8N+86jPywlOKeJ1SUZHIQm6R4h9yui33AUGMaajQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555881; c=relaxed/simple;
	bh=fpy686p8ddKfyBsPF5CtRR1fnIjNugEqnWE+etuOQjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XKhA0RvDJ5XnYjxMWscgSV1AvwYTROKIffGdqqg2JjEMZ7zQYD2sMiMG40dKIzOwiedBj31nxqBe5n42U/pKDlVGS7io65HbiL5FiKPWDc6n/+EtzHHEtQToM/Vykps5wb/QWbPoEVfKqZzc8rTwfB4SS8g3IoTXrTmKJdPZCzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WjQ7e68W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjOIUrVK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65419Jg8141926
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 06:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2088GKdH+0zCG19DSxc84/cxuUQLcsZtoIjUnM9OSZk=; b=WjQ7e68WNO+wU0zV
	dGUp414Hr7HAL5YpWcHuOp9E6BZWI+kZS3dHY9KnC+hV6a/k94rLrm+e2m0dv7Sn
	wNRdON9ssESYFfiK/JLAvwEVdtX5IxRQzuLnZrUTA2I61xYFgz9NBSXLniQJ9o6r
	PW3QRYxhXA6q6KG+x1bnRIUvKJLkVnGpNVmWAhMPZr8eFsWPeYV2F4M+1PdzTNd2
	bu+x3nLGXpWscvNDjGIaahQZKQbtxCWUysoQxXRfsr+RjhwfcPcuRdvm0s0hBcCj
	coyn90pWlCFpWBKGMqG8yXnnCFF28GrUyB5vMko4YEyKw2Wf754zoLOcs9VVPL4k
	+A436A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyen90pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 06:51:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8428419982eso371830b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 23:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780555878; x=1781160678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2088GKdH+0zCG19DSxc84/cxuUQLcsZtoIjUnM9OSZk=;
        b=OjOIUrVKU3exK8VyPOPM77y3/X1TVowMMdU/CKYCHl9o+e6P2J8+wP/9i+bHw7hVMM
         O5/EhGniUdXUAV1eBq9KqDEQDgM2+UVwE5WXIi2Eb3JCtCCXZvk+jV4K4ENEvg3wdmpx
         dlilu9iEe6lyZ4ZGJaHw13b9fUB8RCzjn2+UmgU+YIRVd5aa+6BmtTIHtycqF4CRO4eE
         97KgYlBdTFMk/15JTVisDPxCvvZ7P6mpmzNkNGYWKzk/AlGlg/pIwSQiKHW29YYlE9h+
         cUN89ZJrIbLIPqtoHsi0SxMZEr/gCNPjfEgIs78Y3/fzK064znlUR/afjfbAmLuoGef4
         MugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555878; x=1781160678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2088GKdH+0zCG19DSxc84/cxuUQLcsZtoIjUnM9OSZk=;
        b=SBVtbTcaJHgM+uEqZFrMZR9yNRoAMXFiXsJswH39PTV3tkZail+mQjUZOLTvZopb7k
         NIDIYXKMtaE/XdgUGO9+RuNjjuTOqStHPiqnrNLeRib5yt/om3v4vbRhTKKV644VhMVx
         0RL+HqUYEARMfQKKvbFZmPtD4fYsud8LCSiqi2Bo2220xt510I4oWA/l4VlcKOau6ZhC
         iSmrNv0fQEsPUHbw5J2X0zXuPAt8W33uxVF0g6IWgnXaJLd59P6011Up50ywJKNcE6Ac
         wUpu+VjCumyCwSATr5L7XuR70cS4P2LAspvwv/HroMe5Q+Xd++FpnEII2pkZ/GyvnLvP
         vyUg==
X-Gm-Message-State: AOJu0YyqahSojEP588BSzj+FS0qF0WqRYZAryw2tfD6eQsaHQ449qiKD
	Ao0M16HiRz0lmdxfBov9k3t0wIfkEva8dGLIxnUlULJ4b+BMT0ygU/x3EMcuFg5w/dJbBwwboie
	3SydEsLcwy+yChUcSLNqapyD2D5rN92RGkW7UMrjLA1Cq0Il5yqH5IWGcjiw8hDNXExmq
X-Gm-Gg: Acq92OH8y0svg5cL4isg4Hq8PSFQd3OBeuQQ+ESd6IyUW83WgVsQAuFFpXb+XDgYFhE
	XDq8/taZiRpekjafX8JLZcYVK4zNqZDfa+eMy8LZh7D2hWMb2R/gEO75p1rfxFELJE5/B5Qsr0W
	nhwN9etyBBblUoFt65dCJFHN+cDYVfsDD+QtMBVeyQY1sGIZi799CN0nV1DAKplUukelC6jsJPA
	IKsuwJ8kgLJIRhyOJmTOTEqNYI3bPtC7HzwOHgIMNz4ClXBadoWkJTH/s5zp8gQggieRExi/sD2
	mFuDU1DNAKYOV9VCgGxxS5nWEvHmjIb470w6837xeLQXuDoolSupGHCdSVfb0HKlBnehGJqDFQD
	02ZcQP5gvpTq7XdpdE8ftrsQYoxLa3K2hP31AIBay2pOL7rff9urq+8ecNLIhcMHwWg==
X-Received: by 2002:a05:6a00:451b:b0:834:e092:2631 with SMTP id d2e1a72fcca58-84284def9b3mr6399200b3a.8.1780555878108;
        Wed, 03 Jun 2026 23:51:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:451b:b0:834:e092:2631 with SMTP id d2e1a72fcca58-84284def9b3mr6399171b3a.8.1780555877584;
        Wed, 03 Jun 2026 23:51:17 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842823512b0sm5365894b3a.15.2026.06.03.23.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:51:17 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 12:20:37 +0530
Subject: [PATCH v3 3/4] spi: qcom-geni: Use resources helper APIs in
 runtime PM functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-enable-spi-on-sa8255p-v3-3-43984eac4c67@oss.qualcomm.com>
References: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
In-Reply-To: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780555855; l=2060;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=fpy686p8ddKfyBsPF5CtRR1fnIjNugEqnWE+etuOQjA=;
 b=pcA7p5YWDG4hCeq130/J37d67EimO2DpnPJYKmiICTCw7KfXE+tSrz15gtNbpWrvc3bYmqQKC
 iIz46UvSQCWBQSxL+lk22jcwjFD1DdvyMn/DvSa3ZNwPE5d/V5VnbE/
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a212067 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=i7xoKaWEWnc8ZE6DH4sA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: trNTYg5lUn8XgxR4ddLAazQppPTmLWpT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA2NSBTYWx0ZWRfX8275ev/k4KmT
 U3SA+p/AsnF3Uk73d7llPNb22BkoxB66gYbxI/YAmXockYNFE4apNgU3FlXjaXoT1ZvewlU6nVE
 Qy7yFXazK1567eMAMcBhzKKfz8Nz1cOuPrqTzYy8KpmtRaPFc4MOIZ1Twc4FyztcnBeQ5IRaZRE
 C+p/BZ1sF/WzglqvW3AP1SCAy7ZCF+ghm7+tKFmo9A5I8TLh6sxczOt/tPazp+K2Uk0WPjeeBIf
 LzFTSWADZYe67d9pS+73cXD4HabzBgpwL5KcCJINouOkFtFAdOS/sJBDWJJCr55eSBFgLMGocL4
 Euqvxh8dio3ePBjSSOFkskw29IE9+acsOIvsumqzy6e3nPMpzR2m4AniwSGIQW9xam95k9sNRNl
 dvgcuMQcMrEXDpgeS5VgP+CxHiksf7HrpoG2KAHEilybwPrbPU3d2zh/9RRW77bXQVTCpMEfFeQ
 XKP4tYsMmteotg78wtQ==
X-Proofpoint-GUID: trNTYg5lUn8XgxR4ddLAazQppPTmLWpT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111145-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:praveen.talari@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:chiluka.harish@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD5F163D5B0

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
v2->v3:
- Added the OPP rate restoration in resume callback.
---
 drivers/spi/spi-geni-qcom.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 333216df922e..420534937695 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1119,16 +1119,8 @@ static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
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
@@ -1137,15 +1129,14 @@ static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 	int ret;
 
-	ret = geni_icc_enable(&mas->se);
+	ret = geni_se_resources_activate(&mas->se);
 	if (ret)
 		return ret;
 
-	ret = geni_se_resources_on(&mas->se);
-	if (ret)
-		return ret;
+	if (mas->se.has_opp)
+		return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
 
-	return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
+	return 0;
 }
 
 static int __maybe_unused spi_geni_suspend(struct device *dev)

-- 
2.34.1


