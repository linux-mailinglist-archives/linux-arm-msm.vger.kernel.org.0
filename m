Return-Path: <linux-arm-msm+bounces-94100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHOHKuTmnmkCXwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:11:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA161970DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4B9430ACEEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A5E3ACEFA;
	Wed, 25 Feb 2026 12:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cjixfsEn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c69BWizE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A58C3ACF06
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 12:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772021260; cv=none; b=iYoVmHIQEGOCFmhPPX0ZQVh3ndzXUjVJkGQT9L1Ode5rGmnIQMUVe3KSzkHyF4740uWwUNInLGdCaHP4qgSSBrYgKLNPCtGZX5wfLK2gPlZ//ZJdZ3oPRgW0kOdrxGvuU4VnuUXUp4/o33aTBpsSZFGJ2NbLTf19tapr8dod6hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772021260; c=relaxed/simple;
	bh=ovCw0BRA5whYTQfpKQCjzVCHioWD25HaIVZKIm/SYB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iuNElG5QbtSPBJ+mzPyCEE7SXUtmc1Kz+TUlBPliGKlVLpwufaFAvC/JYqp+D8Suw4JjW9XnVqYWz0Nui5x4LCJEtrdkr8lEYNPJmpmy3LlxCM0an2vZak0D5MjCPnX4+0+42LnS+mYor2zbazD5xgN9sOvO5yEYqe5PrcWSrBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cjixfsEn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c69BWizE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9TBdc1579490
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 12:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m9Oc6WgK0kZmj0+qzqc2rn
	CAuEWxg77H8/R4iUwdWWo=; b=cjixfsEneJgQf5atQLnkovMKEt/epI8TzOKgsE
	Lw0p/beXAZ1len/3Hss1ovlsCw/HdoiJPMSdTYsRIriFxtgm1jOGLPhtUi4/aXTR
	r2HTLaq5aQbB5YfFmPp7T79jsZCzBPzzm5BEC6hMAtyHvWypkyLHRa8lj/2nFL49
	Ncw9e3UaOYYpcPKBAi2ICnc3ZsA41ExLJ8LeEbokv2dlHV1ctKhqGfl+sNfthrdW
	cAVYKg/PLqTR2inC6AaW05BBVQgm2/uXlVkkWotEAUQqF85WeOTBM9RF+aBOkiJp
	dSmoePxd7iDNKniq1gaWmssAMIEyS5XLLKTBczta9AurYaEA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg1sb4ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 12:07:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8243ae83898so2579134b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 04:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772021258; x=1772626058; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m9Oc6WgK0kZmj0+qzqc2rnCAuEWxg77H8/R4iUwdWWo=;
        b=c69BWizEthHAPdM5RJquP8ccOLs6ie7TtgHl8X5TCv98RMzGrz9WNmq8TCp6sakvqw
         mU3a2dWG/MKexrTxDrMT2pviutnKoTpqhGtACfsNRj+8XuU2areJ0L0+7XjYaaxE0ZN5
         hdcj8WcTfc1X5sg0FRJsgpsstXgH/gxMGh/nZIPNH/BHE9xTQCS9U3Gr5ju5YPwg0Q7d
         nJK3RaRBmQsTuiTEenhFJfiy8wJ68EZMdYNt0Jjd3fnZBvpmsDI6kLHPYuDpDXHxvPqC
         U1tLT8cw23DnvrfBQyohT9HAqQM7UV53f5BdKWlCZKTCiiw9cMOecxNgL25QO16yByVX
         o75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772021258; x=1772626058;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9Oc6WgK0kZmj0+qzqc2rnCAuEWxg77H8/R4iUwdWWo=;
        b=POgeNYmNMMdmIYnRtmeA+7OkukNYZnC8/kXe19Pz8oUs3GC4QGhSQcIn6sWTWP5R99
         6UvqBJrYMbOK8boqNtuX5G72JqYNdqfzDTnS0igZDiuow6VakrcLMyPY2zSy1CqEv32t
         z2wJutETIzAjimRBfv5WKLOjYVZ47qJwj0h+kaTL/5e9N80ezcIjrDog4Wh1YCRhifKO
         ipwgbo02idDj5RVUq5GXI1Ic+6gX78WYGeqWur81nuu33D7QMQ2XhyjsXDtxG2qLSB8e
         zSyFb89nbAyMXeXocPXUXzxECHuy/PWqXeQDqZ3nDQaHaAAm0GUTuE2Vns2OYBXvFR3q
         uMJQ==
X-Gm-Message-State: AOJu0YwsS2aDRHnHPWE4f+EOWOQ1gWgvvRBWQMJ6IALRXBHPenXFsgk+
	RrNza5MFMEwZmmWWfou7+qGeesh7T7LVb3Pxk/HfuD0rt5SattYaYx3OEW+ESxaWPyrr6T4/B6l
	zXKvEyN8otSg2hXfJsjnZWNQtpgnHYus4C8z1Ea01kxWBeC6zYaqLFyegw9OCEJmLvlGN
X-Gm-Gg: ATEYQzz56MqZrLf9sjnTGrkFL9qlkUdPh/3kb/reASjv37fkOhhHtgpOneL7SPGNVeL
	ESbEiD/AO0zQBe/I1kL8gKPdbi5JBiKqJo9qSr8V0TO9NpZvxLHI2WohK3SMLRCeMoOVuFStPth
	qh4umTolVavvvvyW6gyiTTIY72xnLhUWhiIJnuFiT93Na+H+GcBj6bvDFXEAzHDnRDavuD6310Q
	HLrzt+ajM8dVMjtbd7s5axYTRGhoyNBqvytmGdqPDDuYxYcBdngUB+i3VsV8e4ke04KDIj4uJO4
	dl+3jhJXaPRuDzf/xtRH7tKtTOvXXcRxqzUbrecbR2ZYQUKdLBzFIaknXC01u/RE8bmZqS8V+Tl
	ml6M7oLulVkRp1OTUwRizP3F/OFqT6qsnDALluTgtuVWz8542y8on0V0T53sjsCRnidKfvxyeeK
	6m9m1Q++rWbBXrri9kumQnAIy6JkonY6mwQ7kcmx1fAg==
X-Received: by 2002:a05:6a00:194b:b0:823:603:3230 with SMTP id d2e1a72fcca58-8273362816emr35692b3a.11.1772021258048;
        Wed, 25 Feb 2026 04:07:38 -0800 (PST)
X-Received: by 2002:a05:6a00:194b:b0:823:603:3230 with SMTP id d2e1a72fcca58-8273362816emr35674b3a.11.1772021257591;
        Wed, 25 Feb 2026 04:07:37 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8ee244sm13710959b3a.63.2026.02.25.04.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 04:07:36 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 17:37:24 +0530
Subject: [PATCH] firmware: qcom: scm: Allow QSEECOM on Glymur CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-qseecom_glymur-v1-1-0cafc709e2ef@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPvlnmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyMT3cLi1NTk/Nz49JzK3NIiXcNEc4OUZOM0i9TUNCWgpoKi1LTMCrC
 B0bG1tQCyr8K3YAAAAA==
X-Change-ID: 20260224-qseecom_glymur-1a70dc3f8eef
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772021255; l=1023;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=ovCw0BRA5whYTQfpKQCjzVCHioWD25HaIVZKIm/SYB8=;
 b=8ixXHPq3n/Po8OF0itHjYeD0UNSPkgzsRutSwLaAhWq/RFSb6Y/mvtu8IeWcAA2kPC11VWcZv
 ZlkRzGnD/rVCCKr0MJMOMXfk9u6IdeRJQ22HlEPTLd/KH9GVC11pqWP
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Authority-Analysis: v=2.4 cv=ZKvaWH7b c=1 sm=1 tr=0 ts=699ee60a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1125AH0Hm9WAScK2f3AA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 4Xdghy7aHE0CSWQXiiMulPni9ZuoFXdz
X-Proofpoint-ORIG-GUID: 4Xdghy7aHE0CSWQXiiMulPni9ZuoFXdz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDExOCBTYWx0ZWRfX+fVnvo7mYeAi
 AcgyGt4qTUXgVhGuB0k2yLRlHow+aQrWUYCgmn8V5tfti/XvqN/UqFjr1JZ7wOGyWxf7/BxjHtR
 NMtH9i5MhfjwirgSmuLz3DhtdvGArGHhzLFjc2VFQQCTNOwWPQSboGzDCIuAhEYdq87X8IpO+AX
 qxblfjVUh/GwmTaHDZ4fLeoFo3URIC0OIZ9jEfhjbxAVhU/DNJWoB/sgx9eYRmHSfivZycQC7tC
 4+HJQ0OmKVQFNFoga9DnxOOZJRjDiQ9OrMeDWF52hgCRlAgTaIc2GSkRi8Di1s9v5mJ1Xep/fky
 qvuz44RLv7y5Y+BMAueXwnlw2PdLflBqsHacx1W5vAlZeWi4nkboT8n/mII8fsgo4p5nJAj+z81
 NV+dRlocgxyTSQQ6O5piqkIgJWmu0tE9oKmMoXsnTmdhBEboVYRkUGAseniqSimf2e68BsMDGAW
 +2EvYsr8edoOl4YGCWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250118
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94100-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ECA161970DC
X-Rspamd-Action: no action

Add glymur-crd to QSEECOM allowlist for enabling access to efivars and
uefi bootloader

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 8fbc96693a55..86214fb361d8 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2309,6 +2309,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,denali", },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
+	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },
 	{ .compatible = "qcom,x1e001de-devkit" },

---
base-commit: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
change-id: 20260224-qseecom_glymur-1a70dc3f8eef

Best regards,
-- 
Pankaj Patil <pankaj.patil@oss.qualcomm.com>


