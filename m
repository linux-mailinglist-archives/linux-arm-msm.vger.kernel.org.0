Return-Path: <linux-arm-msm+bounces-108632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHkFAW9fDWquwgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:14:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA84588C51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4789302A1A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 07:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A6A376A10;
	Wed, 20 May 2026 07:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXFepp14";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HIuiX5Pu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FB6372B4B
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779261289; cv=none; b=LvuD8hWoyd12ICnt0CvOFjfZUj7t2B8UpREQh4WNDocckvrvW7SXgphbJ9TOO/dkzU5a1B0pyYGNFaYIRhYSipbWFW13oZISto51KZkKAZ0J7qHQuiw0e+56yS7HrWsIBEdjB+1UEycthNZPlw+r/ECQCP+ctoKvdYGvJlsb26M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779261289; c=relaxed/simple;
	bh=j01mAF2BlRaYdJjrxolhRRNK6s404xsfaKWCuIsdi3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hbBf9aBbMDUZtvm5vDWOMQ7IsE5Jp6EhIvi4bdSQESMQ8xmrASDBlT/Wota1XSBlgjnqfXK7BufDI8MDEly9V1pPXtcOGkULWx9ppUu9Cg/AYdhmdveGxHGS1jYUtyflihsfholkQBH5nGlcBzADUhWOHoBUictOe3L2lv6PiBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TXFepp14; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HIuiX5Pu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7EO9W341538
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JMzYm37TS5IGSik2OF3PJi
	G3o/syaNDnjzGxh1Bl7dc=; b=TXFepp143QeeA9qAqCc8tP95tGoyKZS4EQhEaZ
	twF/NDZi28LwQC3DnurDZ28w+0VkKyuXVFM69kTMo/cjLb9dAKiStCOExSbf61qX
	U2VZgdU8tD9nbwiAI7Uert0umfpzpXMDFOjjvrqYxY8Rcpq2hjpvWRvTTA2tvUa+
	9guBTbISETW7MxPpZWOAWBDkVkp5gtrXLSE9BuP7HuuLhhBb7qAflniu74ISI8Lb
	jl1ffvOwb9RPI2FoKyFKw1PTnIdmN6HkUu0bTHJBkHAGYeaF2zN1tUMULj+4P5ba
	CrxsH11mhATpT/yaTwrOfZ25ux+7Rq3kK1YOSREnCCvhw10g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3vbfc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:14:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c82ba4715b6so4755218a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 00:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779261285; x=1779866085; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JMzYm37TS5IGSik2OF3PJiG3o/syaNDnjzGxh1Bl7dc=;
        b=HIuiX5PuyVcsXPZ7jZ4flS8sT4meG8mw3gSv2aStA5k5/3COACPWYbgaTnxKl5kWme
         RD4xAtgD+96HpM/mVboaoADeIyaqH4SoNezupFSADGYiHMyKlF0Ra3ozzLoZqGA6Jx8V
         aKTudlvtS//DOGGTmm9XPuLXi0FzTim4DcKwF28Gk4F8zjxOkdJ54bZDfufLVYYzTwfs
         ZKm1GipO0/shQovTzoq6yyohQUmSCDKBZJeMhTYnuCtgcW8+J9c1aHbRvOksQQvq/PC7
         TRoq/K27yAd/y0oXWFed/QCfJfgmjO2xC9bAncoRw2Ei2DQ9FBA78x9dK3L4s4lTqd+a
         s8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779261285; x=1779866085;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMzYm37TS5IGSik2OF3PJiG3o/syaNDnjzGxh1Bl7dc=;
        b=lIwkHny7h7vvp/YdXHgwU+dmQ3KVSU+veLCxdwKMt8j0MgIv4XKT5AupkQHaknrb9+
         P+SUX0dlrTcIqj/L3VV1QXED/aDcL+ssZMUIC8kGVUuQ8c1ZOfZYNbIcDCH6SNqTU2T7
         iQgYkY/5YQbKm/Yflx8267wHvo8Q04MAuoj7zy6gnuVQuBMec9NU2eufC+AEP00N4nMn
         WY0LcIIc87W+z6jwpbeOjTssHlobnLhRfpZT//FsK7beZbt4gTrbnJnEU6OlWq8o5slH
         Kv6TEDEu9rye7TKE6Ox7O9NwmgHaelmPB5rtMUZnXgnHniUuuJdwuZ4BKXdukmWJ+xrU
         u5mQ==
X-Gm-Message-State: AOJu0YyirvLzxaqXDUlHf8uS4FqzTJS8ZpRpz+inQ8UBDBfX8ixUfT6W
	oZd/6zrzLyMusBADkvKQMA8vImsNsJ9dJ6KO8VkFCYe231cMuRHIFqRVPlUUSPylDFW9c6cqfoV
	pKzXkAIb+0o8KGllqnP9Yxr15qDS6LFVV0I1iflxg2aeeJI/6vTj0wrRWCIkHkLrPWdSBBqDEut
	Yn
X-Gm-Gg: Acq92OEG8LWBJ/xoGA9WwypO8+O7FHp0a725es4ELELBn9tTc/a7R5judCZe7yRfglf
	Qk8HJANjwvCHTC25ae5JwGOskTTAAk2PCMoBsKZ73TOJfbXEQapfREubHDLnDjqVnw1KcWc4e9m
	c+hacskaMj8boqLgR29ncxUrqoEj/Ot18cCLvQjJqqrwxaCdSe/ueG2ZL0gD+8bgb0TMUozUqJj
	Hs/BFiHdf2pJrrlhYEN7rO+nIekWEqfhdmi/k+Dmfa64ShCsNsbPnyyWmazmsgZxDDe989rNvxx
	hK+2cSafEohF5WSvH1Ms5xjjK9Quc6BzOKKaXoKjC6bTrrTdYWe439P7e8wMSYzb8Vb+QiYKFFE
	7pRMPEGz3EiAXKkZOmRDnu3JCeyGJxXc83wtHtXSZXyTTrtMY1AXhlvY=
X-Received: by 2002:a05:6300:218f:b0:398:a306:d64f with SMTP id adf61e73a8af0-3b22ebe1b32mr26842103637.30.1779261285340;
        Wed, 20 May 2026 00:14:45 -0700 (PDT)
X-Received: by 2002:a05:6300:218f:b0:398:a306:d64f with SMTP id adf61e73a8af0-3b22ebe1b32mr26842061637.30.1779261284772;
        Wed, 20 May 2026 00:14:44 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb08d06csm18736977a12.14.2026.05.20.00.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:14:44 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 20 May 2026 12:44:29 +0530
Subject: [PATCH] i2c: qcom-geni: Use pm_runtime_force_{suspend,resume}
 helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-use_pm_runtime_apis-v1-1-6a5238fc6cb6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFRfDWoC/x3MSwqAMAwA0atI1hZq8INeRaSojZqFtTQqgvTuF
 pdvMfOCUGAS6LIXAt0sfLiEIs9g3ka3kmKbDKix1hVqdQkZv5twuZN3MqNnUWVDbbtg2VicIJU
 +0MLPf+2HGD+3wCVxZQAAAA==
X-Change-ID: 20260520-use_pm_runtime_apis-47e99f247d2b
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779261281; l=3006;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=j01mAF2BlRaYdJjrxolhRRNK6s404xsfaKWCuIsdi3I=;
 b=RedlrFg7lmL+r+QqY8uuS9Q0Ppm+8eRV2SFWsKctRFYp9Is8wK5Wxy/svo34IjC0/Z3FKtnW6
 hYEOt+pPrcZDnnRrchbgmLHR+R0a3yMiUxwXpEBTQ6OhurxxIjnosZL
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: bZE16X_uvmVwa4v61LRQeoGz0yPtL-Ul
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA2OCBTYWx0ZWRfX+bM3wnv6qnYs
 2oA/E+auD3qVvg7wIFPvN8FlkKVvEeuFzUVdvJgLmhtdNfhHy/M7Ek8C+LASE4SwPoCZY5fPNpt
 DIfNZ7tKmyRpvAo3Zud3czyyblRgsxNwygDK/Ad1WUc3urq5bJpRw71HuH0feDJIDOMJUfyweAJ
 bHclNBrFwM9l8mSIb+Tk0WvoLXrCH4JE6XnGtGEYHR2grGyfjIZorUqfVI3wYXrQ+bEXiPlfk90
 chaiHWUcyh49lnM6czWjIsX3JLWx8m/BemZNJTkzl1eav3qzf+k0BwMtQ8AWeM5FDIo6kPfqS3t
 MVz2ftjRSKKNoJpwCtxyTfj72kAZtbHBCuYUELCVvnr5x8mImGxG/8i5EprlvXQq2aEQ7gVTRVH
 HsHumiCBDcNmtkbI/jAyWojHV2y6b/sJKLGpdAx2yjfYxs4uP29+xpUs6Hqm/orNkBSk3n/7j+d
 +RxiTYB47QRcwEzFTlQ==
X-Authority-Analysis: v=2.4 cv=JuPBas4C c=1 sm=1 tr=0 ts=6a0d5f66 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=DWeSS0CfW5cAq--l0NsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: bZE16X_uvmVwa4v61LRQeoGz0yPtL-Ul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200068
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108632-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6DA84588C51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver carries custom system suspend/resume handling that manually
tracks a suspended state and conditionally calls
geni_i2c_runtime_suspend()
from the noirq suspend path, then adjusts runtime PM state by hand. This
duplicates PM core behavior and adds unnecessary complexity.

Drop the manual state tracking and switch to pm_runtime_force_suspend()
and pm_runtime_force_resume() for system sleep. These helpers already
perform the required checks, call the runtime PM callbacks when needed,
and keep runtime PM state transitions consistent.

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a4acb78fafb6..ee04d542e055 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -110,7 +110,6 @@ struct geni_i2c_dev {
 	struct clk *core_clk;
 	u32 clk_freq_out;
 	const struct geni_i2c_clk_fld *clk_fld;
-	int suspended;
 	void *dma_buf;
 	size_t xfer_len;
 	dma_addr_t dma_addr;
@@ -1129,7 +1128,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_dma;
 
-	gi2c->suspended = 1;
 	pm_runtime_set_suspended(gi2c->se.dev);
 	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
 	pm_runtime_use_autosuspend(gi2c->se.dev);
@@ -1186,9 +1184,6 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 	if (ret) {
 		enable_irq(gi2c->irq);
 		return ret;
-
-	} else {
-		gi2c->suspended = 1;
 	}
 
 	clk_disable_unprepare(gi2c->core_clk);
@@ -1214,7 +1209,6 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 		goto out_clk_disable;
 
 	enable_irq(gi2c->irq);
-	gi2c->suspended = 0;
 
 	return 0;
 
@@ -1229,21 +1223,25 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 static int __maybe_unused geni_i2c_suspend_noirq(struct device *dev)
 {
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
+	int ret;
 
 	i2c_mark_adapter_suspended(&gi2c->adap);
 
-	if (!gi2c->suspended) {
-		geni_i2c_runtime_suspend(dev);
-		pm_runtime_disable(dev);
-		pm_runtime_set_suspended(dev);
-		pm_runtime_enable(dev);
-	}
-	return 0;
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		i2c_mark_adapter_resumed(&gi2c->adap);
+
+	return ret;
 }
 
 static int __maybe_unused geni_i2c_resume_noirq(struct device *dev)
 {
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
 
 	i2c_mark_adapter_resumed(&gi2c->adap);
 	return 0;

---
base-commit: 1f5ffc672165ff851063a5fd044b727ab2517ae3
change-id: 20260520-use_pm_runtime_apis-47e99f247d2b

Best regards,
-- 
Praveen Talari <praveen.talari@oss.qualcomm.com>


