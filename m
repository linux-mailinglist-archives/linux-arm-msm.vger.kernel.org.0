Return-Path: <linux-arm-msm+bounces-110927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BFISHN/+H2oAtwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 12:15:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF6863677B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 12:15:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XWfzMXDL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="iuTj/YOr";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110927-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110927-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AAE230AEF4A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 10:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74E54508E0;
	Wed,  3 Jun 2026 10:14:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729E644DB95
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 10:14:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481689; cv=none; b=OphtdQIHH/SbwWkpOzDyDzsOHYPKdCkgafp3up/9FwTJ6mgdGFfW0VEjhn/e8cSZhtJbKq8MZyNGrnMh2riEf2mPJlGh8sNtQVQmTfWgSIjWOiV+xNTj38lJfwijTxHyiRqm3KlrbaIANvuUCPjB8+NfKxLxNya1djzRxfuMoAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481689; c=relaxed/simple;
	bh=ZmzlMq5l8xv2ijHU4ddQbj2AgHT+1ygitV4sixDeFQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CPpSlrJGrbh0e3nxLShiQ+slSxGqqO9Hy6lFdzIAu3FZ2btL02ZFmtkqmEVAY5DhiWMkj+awEF85Oa4MRDwwrrt3vw6SjrzPPkpLiXn2yhtP6rpNs1W6VElI9VsTt1IenxhQEtVPXovD9zB34f0CFCYIs8lo/CBZz3Sksv0Ovek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWfzMXDL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iuTj/YOr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653AB5q93552300
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 10:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1MbKYOxYNhOubmMTGU6IUo9PxYH2oVk8G/hA/fqgBHE=; b=XWfzMXDL5IRfHEG6
	GkzILN1/Q0prLEW/596xuUU35At52iSt82ceomQzGsDcxZZ/7oHvbyChWrut7Fuv
	yiVNi3puosxg2Crq19h6FIiUTz5KBrGNdZTHigNJlqQzPeP65bpq+e0PbGrFuyKM
	iD1LGjkyCBFzLA+7iRzVFh4Ny3Iypop08+VG9BgzSk5tYFq0Ob+VnAEUd977ItKD
	ewDYPse1jI2T7LCB/e74WfxA8akYNA+xWHUx1k1o+rZQH+XibHgQxgjf6Ww092n2
	VuPlpIm8aEikZjlnjekR3DJNlcixFX0/9QhDjC5ZVZ8lulbuAAVoo1iWX9lTMDPe
	IxMPsQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9mr0g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 10:14:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso3498334a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 03:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481686; x=1781086486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MbKYOxYNhOubmMTGU6IUo9PxYH2oVk8G/hA/fqgBHE=;
        b=iuTj/YOr21QckrBd7R3TUOIO5FwLwW7WX4Nh/QztTuSGJqXtK1Qq1HhFOnfx8WCGda
         b22cLh/G4Mux81d4xI3yeJm4icvgoUkEPdcKnlyQRYM6zaWidNGHSOX1SWSqvEIO7DLN
         53vdybgSWssvW98zDO7K2HyTatHq49scXDalUIzEBsHaqSq9Q3bmoRBFiYlAMMvCKQQO
         ycIcIQncvd5frqtvsfGm06Tn63uJAGo7tlsHmFmA0cGXXjcBpPi0IcXi7NWRHfa+v4V1
         hCh+piTeYDGpBJz3UwqW6frE7OKrN1YguIrUwVD1tJWnQaiwA5PoB+QwN6wldhzXDYoq
         ZbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481686; x=1781086486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1MbKYOxYNhOubmMTGU6IUo9PxYH2oVk8G/hA/fqgBHE=;
        b=skYx5F2F49VKdwy/mX5NRLQpql91u+uH5YGblZ/Nhpt8V7Trd1E8k8yUdo3PRxym80
         /Fuk+nZsBpyUUkJycSCyYUERrPMdYo1aP5kNuBzntSQ1NgjA3ORl41UbiOJE5mi1EpGH
         kRr8yRwCecCDZNySRAtfbRctalQ6F6Y2awY+n4cFRwvcXFASicyPv3uptsbqWCuxtUDu
         ku4juSaLMgrRrTfH79fHmItF9pO1ALoyAJ4Hl5BVRUDSD4knDS7J8R00Y9mzuJi0Zf8p
         YJnOg+PYBgFQBDd2xmXi8zLCFchIcyMhulPXu3xas7MNV+MPIBL6w8zmTMw4/xkhtyU/
         5Dlg==
X-Gm-Message-State: AOJu0YwRDtdexBLrf46aJSiWYjNPv2cZnQqcAQFl2MvgR5VZpPzkgMN+
	bIXu3pmV04ePV5R++CABhbkRhVfy/Kd7Gb4qb4mXSShpqu6tq1YSqsD633WStDNQbkrduxiZb+z
	H66LoJY8nq8V02bQ81SvOckWK3E3EdVA6nAZwvu+W4i42Hz/z2mYDkx+Rje/NkBh/kLFVlTyX7P
	a/
X-Gm-Gg: Acq92OE7tGU2nblaTu3RzENuSbaPjoyxZ84Lgnbza67UYVzglvOqMZLCNLpKE6uIkWH
	bD79j7WxwvmqRYdI5RENzjzrY9H1mDrrGN0wVmAbmiYjRnCFqlYOOuOSKqibI/YBHAereTP1bXl
	W6TKH2q+D5bNeXQUHZz+37O19wpo9dRstnYcoeOXC7gRwBONGOCTxP5aW7qKtIJeHKU1ynMXAFN
	t4p8B3nPDrele7tz1o+DUethauldEl5Id/sTHiEB97uw09x1hD2BSMwFJjQYmFswpX3hC4WoHat
	FRoU5vP8d82Dl5JgJzGwZhJRMauydi8W3hrKs8S/z+Ba6MgefvCyxGcERtT//KExfhiX5Psm0nh
	BB7gsrUB3MS4SCs4l8vyvLt44lCd2Jbe9ynoV1IdWNOV+4g/d7MirgWSeT+w=
X-Received: by 2002:a05:6a00:9094:b0:842:6fec:1296 with SMTP id d2e1a72fcca58-84284df0098mr3089139b3a.4.1780481685955;
        Wed, 03 Jun 2026 03:14:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:9094:b0:842:6fec:1296 with SMTP id d2e1a72fcca58-84284df0098mr3089109b3a.4.1780481685472;
        Wed, 03 Jun 2026 03:14:45 -0700 (PDT)
Received: from CHUNKAID2.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e02f9sm2463747b3a.48.2026.06.03.03.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:14:45 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 18:14:28 +0800
Subject: [PATCH 1/3] rpmsg: glink: smem: Use device name as IRQ name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rpmsg-improvements-v1-1-dcfc22ed69f7@oss.qualcomm.com>
References: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
In-Reply-To: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780481679; l=1293;
 i=chunkai.deng@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=ZmzlMq5l8xv2ijHU4ddQbj2AgHT+1ygitV4sixDeFQk=;
 b=uODXbFl41lOh88Hpx+APw1QDYwaKlhfh0Zxa8Zu0thp6bpBSwbTNh+yBhAa4VTVKYxTtIA/w6
 KDrirX4yQsLCSa/3A6hTTvo+6kc0BU6AlQLCKqeQPWK0iQDRjnC9ljA
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=NfifEElkZxgJ0ghUBxNu1RTaEqtoCGYDb0k5UzIRXOY=
X-Proofpoint-GUID: BZpGTpXBwGodKFMGYnaEsgavJtsPPapa
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a1ffe96 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Nqvb9vKcIXZEg_ORUGMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfX8pKQdL5ENdzY
 s0+6K6RfFE//BBYsw475kAv+Oh8RgIxkd7HVbTP0+0JqGU+F5A9gwJ/bVbj2OUE/yxK2atOVQ/H
 3RKXrks3KfgJuIFXTKWwCj8mUdVK6CW8rvYyzTeywTPR//DrcT8cewLBKuNTMy9sv3DUEUGtUTk
 Vbt00xfVofwiCbV9hzdoCi330+pu/K6uqszp9zrL2J7k138tb9gZGhDF+eix2a6JH31t+SqVtdi
 BpLzeQR2NbbY4UoAh1J4xrE55pokM1nts994G06B8J60NFtFTo1kSD4O5bCem1CT7dw6ddIMGeE
 +Uu/VeA5eJbIUsGtJNswTooVw6mKoln8bgBO4MylONpRSvQYAGj7dLjQEp58lId8ZWc1qYbfRK1
 yrJV6jThUoXCSdJL2Ld6nlGKITiscuLzhoxgMhXHjMx4iiTmfjnbNtWBcUAVl3T/H6viK8KHGgi
 UkWPaywrxmj2R7x0R/Q==
X-Proofpoint-ORIG-GUID: BZpGTpXBwGodKFMGYnaEsgavJtsPPapa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110927-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chunkai.deng@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBF6863677B

A SoC typically has multiple remoteprocs (ADSP, MPSS, CDSP, etc.), each
registering its own SMEM GLINK instance. With the static name "glink-smem"
all instances appear identically in /proc/interrupts, making it impossible
to associate an IRQ with a specific remote processor.

Pass dev_name(&smem->dev) to devm_request_irq() instead. The device name
is already set to "<parent>:<edge-node>" which uniquely identifies each
instance without requiring an additional field in the driver struct.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 62adc4db2317..edab912557ac 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -307,7 +307,7 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 	smem->irq = of_irq_get(smem->dev.of_node, 0);
 	ret = devm_request_irq(&smem->dev, smem->irq, qcom_glink_smem_intr,
 			       IRQF_NO_SUSPEND | IRQF_NO_AUTOEN,
-			       "glink-smem", smem);
+			       dev_name(&smem->dev), smem);
 	if (ret) {
 		dev_err(&smem->dev, "failed to request IRQ\n");
 		goto err_put_dev;

-- 
2.34.1


