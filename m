Return-Path: <linux-arm-msm+bounces-106263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFMvLBM1/GmNMgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:45:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 119F44E3A54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 920AB3052B56
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CCD343D8A;
	Thu,  7 May 2026 06:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxESMiHm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HxMA187v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFB733AD85
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136147; cv=none; b=UjgJgYVe9LexW10+MJeExiQqZzF2sKXyQVWCgiReZTxDxxLqBByO3+hE9Dz1h1MP/gXrDQCBx9bSAQIpBlpwOwkuVFHA4twGWrpDgUh3gbvGRENXmHUd0/CckO6/2nZ4QCV42q5cOKggOZiLX0VAUZqlthR7MMTlSt9OFEUuK+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136147; c=relaxed/simple;
	bh=gxgKlk8U7o7rPcDA7wzebJQFCIcBZ4dBOE0PByUcthA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L/QrqV2XZJD09ddEX41KgwOeUSRJEOFSya7XjihgpJ+Hq6JGVZdNmu2zSVlr7xLNyrWWsGzMJMgCpGptJU1pSbjPj5LAHaAqHQMp+gFhUJ/lVBhXUhN4u8fYN9qYlzWORSqVi3Re/meVtk32U1m3nhJsK2zs1YY5S6kmvsjfVeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HxESMiHm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HxMA187v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475MJvj3157423
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BbuOCCQkqmd+11RpoiDQrDzWmHqm80eHgugw0mju+II=; b=HxESMiHmNn5I2fPD
	NdJC3fGpcM1N70e/mRmjcCEyQSdbXiwYP1jKkGpbwLsLEq6G7rqGNg7Lih9kxvoh
	kzCFiBxYkOFTlCFdraWMDYobtK7jcictNGmLPFxFMb7pDTUZY7c1HmeESm2uf6Xr
	3YKQjbp1S1z8t4Z8vvV1j+m3n1etM+w8CV/8v4AVHY4HzDGnLRI3MaRjbygBpPbZ
	EfFdPPLpXQmxYcqtwbs/xaS0ivxWPDTRr2FudveaAFdomlc6sfJfquDEhykJHhVy
	S4+xYJR197TdUiQ9s//6WGVCd9W0juW3tWnZJvHtoC0r55w1VwNMKmMleygurcEL
	eYuncw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf08p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:42:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8ed08aa4so15869001cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136139; x=1778740939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbuOCCQkqmd+11RpoiDQrDzWmHqm80eHgugw0mju+II=;
        b=HxMA187vQ96YuXuSR/VK0M4PU7vSZpza7/dAPMLMG7vyRZVMNbcQSb37MnGDXkzDJC
         PuimQkE2OAT71MNgNpbmOA7CepruGoCAxnPaWBHPoUZG3T8urH/Y8xqd9eAq+mC3jUSU
         mRJzjVvV/332RwIJJe2Fg/HUeS4/2qo+RngBP55ojfaFWJ860eFdsgVKmkf6W+A0IEFm
         9qvX86pqK4L8MLhAfE7/avmTSI43B3374gakMOsLlmqKq6/CEkIQ+WvDe1RmFayAspTG
         7LMgd09ziHH/j0Eu3UlGRHE2siQstaysqrM81ahiZzYmBGYbMBoPdU1cfEJ4QXw24ZpY
         U0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136139; x=1778740939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BbuOCCQkqmd+11RpoiDQrDzWmHqm80eHgugw0mju+II=;
        b=fkC43dNrQ0tTpI6y+KZRtYGS7CJf5cyXF7J9EOnJnPfVjqRdIGcTGuG5HTH+HrrWdU
         zfgNyoCYH3dkTVLXW+2N7mn8cY5/iBCKQy7ADofJ6v3zXJq420xgz0Mvt7541aDT32ug
         Xvuxy2wEXZN8ZHgMfmYs+q+NPm/a59ew7fssxxn9NQkx6KAv5faytdrDerwJrpmvjQS9
         QTt3t5ruMhQdnGJgt4o1IUTP1f836FV/Yl41vt25kKtFcHp6R6bC03JR1jQONCDoq3z7
         wkHYxMHHrG/K0UjWtTdC9c5Oqpm1UKe0cW5uhubmkKC/JvonANYAPv2OUUIwG2rUmEfz
         goCA==
X-Forwarded-Encrypted: i=1; AFNElJ9YbycBq2hCZ7Pcxr6YBvo9m6VbkkzYgJGn56kkS1zwuTl8Z24H2EPWfUTgP9VdIi1Ejyi/t+5yMe1FJdIw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx32DeREuMdkpYnDEkxGaaTHrqB3/Cg5OLJRPQ04hL+vd0VDSA8
	+sUx96K7JZNDXvahXMAzbZ6S94iKfIpZG7O72XkFX8YXXKWoZUh8fH2jH6O1oyzWfHmCYwdOAPJ
	pm0coCYyPLGZJq9/Jboj9j8Gx0hntTjpIanuohydQcYVbmkG6N3+cIxRUF6ak7BkAMk2XRxJFgb
	u+
X-Gm-Gg: AeBDies3g4QozLN7xyJMj22rH1wmQEpz7dtTzY7PefKZPr5tSrPRvJixLcNzNbqmnEB
	daxLbPpY8F8jaZcPQRmoOxJuwMLf81FvkODZOP/5GyqtQZE/nIMml7LjRTEKR4U34WvBawTCHhP
	E2UneiYXrJ+gOHIfpvGzDs0s+CycfK03uvcE3/nYzO2D2h6cxYbKbkZKvK+cyBNF/dn66QDDIJ+
	gfr5xLFD1n59Sm703+qQ93yPUPuoi+85FNiD6IwwVtPMawwtmQwCB+WSZNfRuaCNENwJMW94DvM
	UdHN7aeHCi3mu9s4z0TAP18q+33oVrjIZjRDFaX3M2CxE0GE4FNtMpf6Brqo1A/P3c0qyDPIuNi
	eZtYL8ENGWkps9ELSyahdAJzZ3L50EX8siwZXmy5Xm1mMuCXzAARGoocX2ZscahJo5o5KbJa7ab
	nU/Lxc4B0BkxVzhOWGn7mXEpnd+8cmFjCA8k+fMIH7lu+S8Q==
X-Received: by 2002:a05:622a:608c:b0:4ff:c17b:5ab0 with SMTP id d75a77b69052e-51461c18236mr89648561cf.9.1778136139525;
        Wed, 06 May 2026 23:42:19 -0700 (PDT)
X-Received: by 2002:a05:622a:608c:b0:4ff:c17b:5ab0 with SMTP id d75a77b69052e-51461c18236mr89648251cf.9.1778136139132;
        Wed, 06 May 2026 23:42:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:03 +0300
Subject: [PATCH 03/16] media: iris: Introduce set_preset_register as a
 vpu_op
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-3-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4324;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IBDxDR3cM9Y0EwQbnRMqwF48utF4pbiMRXgQ3/zQqGQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ9WZem9cOmBlR0d2pz/oqztle7+9LzspLIv
 9eHKrln812JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PQAKCRCLPIo+Aiko
 1ZHoB/wJqkCpxtQqw9Lv0e+iYe2WX9Hwu4TQR1bjfsxX43FNw3T36p4ztVWZBa8jZrcF2KAfRw9
 dE5BmZ8edAk9vYbRgal1JybEcUkWWG/BRdN6LBdM/TANcgY2hFvPfqrv7YU9yevYVVz2+FGUDDK
 e0m58PbuewqtC7pY/JjnsRnSFHcf2vn8xOgLqOlySMONOwz5PzlOK6IFrCPGVHtkdZv1BoOAGVB
 +Q5r/2x6kb2EkbddCRtM8Jr0PW2ZE8wAlMWPnzvz1C+k+/sizs8SEsCM4YHKZfvp+h1QxN6OszE
 fjgTKM21ODasgnfeagR2QNrf+9em5DRhH3D5vWv7BMHmGDdh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX7d2DWmCx5z3d
 JFRIoPuyCd+B9JAAdzcAgjfl9qjtbP/Ezb4dd2EfWWcAZtF85iGTIUt8NrG7lhkoYI00R3UCyjo
 f2EfZ+KwtBqh0a/jg/mVAq7LDFd1E0GJrmv8q773kfK0XdSRvu86t/HZ2AQCPvJDy9tk6CJufwx
 f+ls6UUHAAx3L1BIeEPXvEYujToipg67ptw7tCOGYbmhOz2i05PbpwapqjmGr1FCikYIzYDrDev
 tOQFDhTslvyc06FuaaiZVl380AIdY7UU6gyGibfPkW1dpNN7rhQzzVTHwiw9hv450ik8Wu+t7bU
 niPSeLHfBpYZDmb+yNr9Jq+KCOPT/Cl4eX8+orI4Q7wyudMYv6egnLWgrPiBjZNc8aXW7a5V5+H
 I7169kjjbVaQsSeb61YtNrwhRwbpbr+aFI+SX5QJgAAA8I4BttCZoVMMMtVyuhE5Jsg1m/o2opu
 P5PFhMRS/OjIZWqsoSQ==
X-Proofpoint-ORIG-GUID: DM7764r6wVOVkzKgU-3Wogo1ujcNv2Vr
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fc344c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=4Uh0hlRDs2lXuULb_e4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: DM7764r6wVOVkzKgU-3Wogo1ujcNv2Vr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070063
X-Rspamd-Queue-Id: 119F44E3A54
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-106263-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The set_preset_registers sequence is currently shared across all
supported devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move set_preset_register into a vpu_op to allow per-device
customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 01ef40f38957..d61902c9a213 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -45,4 +45,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 3dad47be78b5..dc02ced1b931 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -261,6 +261,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -270,6 +271,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -280,4 +282,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 02e100a4045f..f608a297d4a3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -368,4 +368,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 7bba3b6209c2..ff0070c85ccf 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -472,7 +472,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	iris_opp_set_rate(core->dev, freq);
 
-	iris_vpu_set_preset_registers(core);
+	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
 	iris_vpu_interrupt_init(core);
 	core->intr_status = 0;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..21ed4c9bd5e3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,7 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	void (*set_preset_registers)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3


