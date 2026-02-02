Return-Path: <linux-arm-msm+bounces-91437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OuSIiZUgGkd6gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:37:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0FFC93B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:37:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FF013013003
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 07:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D2D29C351;
	Mon,  2 Feb 2026 07:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SKvsvltF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TdY+gCrf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D7E29E115
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 07:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770017766; cv=none; b=V5s53VLegR/wNKrNpMDWCAtbqBS2aJWol4F2Bqg21ObVWbyQO1gYxagm7w++O5UQ2yA7dZRnQSJvzD75LK1AMVLLplbUA09EspDoUQOZz/b26WiiHEt0GR+TvZ69oNnsdxhvs1CcLBm0/VbFHEbaRpIubbX+QUOIe3HkX7R0Hak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770017766; c=relaxed/simple;
	bh=+XxOPqOL8Sz4kIMwBSwZEDo6eLF9WV07OksEG35kIAg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fGN/MoBeiKiM83r/e3GT4iO5HfaAiUxZt7ToAHZ96Ut/iAX/0rZ02NkXtY3hV4ZD8f3OWJryTLsyMnV2snlk8LxUtSheHZv9qSxdJyMk3uhCg5vZ03/VU/csoJZhsaNirHf9eJg/sFwjsS8gfYpska104XrXOgqQeOx0MT/7vmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SKvsvltF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TdY+gCrf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611MlhhP1189735
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 07:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e+jQxJO0dnS
	dAt0rky0l07ozz99OWCx4Kw8JeM9fu7s=; b=SKvsvltFIMSB0WSk2zHauA4IupX
	2EOysLOAgCauQKb1hPBO7/5isx9qf0fLD7fHRrSgNKP3oOKvGbxRCKTr4FhUECpf
	ZnX3r5oo02Eugy2PYiL3qiuQvvaZGZidjbvTlCoQnp6H260kYTIGvIw53vpRSAvS
	PXI9Oo8zjVE8LZE2Ki2mINJK46FhkH1kbOac8PLqh+nHwrbaBUgn3jgeDM6Gv0uz
	HKjfjdj1agJW5v8vfDnG/95QV+A90WmROGvZGNcpKX1Mf825RSYjODhU+e2ltnlV
	OL2+joySwf5nyw5pU36s5daVJcMLs3do0Crs/MuKcp/2UHItOU4eCycfqXw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awnvebp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:36:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso14672435a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 23:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770017763; x=1770622563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+jQxJO0dnSdAt0rky0l07ozz99OWCx4Kw8JeM9fu7s=;
        b=TdY+gCrfyzEegmL8u2kzC9AjYYyI+PqY8TvVb9K+YgRp6Zx4ryWtD94txXzwZMlNOI
         O7QMrrCuUM2goysOOY7c9SroKBCo/joAc8b3XQiUduk9Ft5TaTbKX8xpv2bhp2VPb/CY
         RJOll44bZpLhjZI37suuwbyTJdTgIJLaqot6oQo8po/rrT5Q9A6rs+yoMp6XmqDc6PjY
         VnqGQ3wFbkvkp8Rl4BsZZhndYsQywjW4WzcfRYkJGG61aGt0DaE6MghIG+Rlg4tS7fVq
         gwQg/7p+e8eLsJIvOOV3yNYqd/IrOrKp+QpLRtS5a/SZ2GyLiXCidhVmkRj36HedLql9
         nRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770017763; x=1770622563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e+jQxJO0dnSdAt0rky0l07ozz99OWCx4Kw8JeM9fu7s=;
        b=VXNSyU3ftFWjhVKSyWCckptwGso7iBRAbNWlcEZg1tYJsQk7YkPCctuPAUbNS/k62u
         kiKRG3CNwRMBAc81N4/1RywImaSdZiYjmhnDHoJFSXho960TjLyNIQ5rm7vW4WAfeCKP
         GhfJy9scPm2NAyNZ8BoGodtJ1aC7f/LkZMCwlxk7TU9sFoiMyRXKbC6VN9qiQrh743CT
         Npbxv90orwiEVrpSl+rB4dKcPMhb8o0lKR1B2pHYM7Jm0EyzMtyIz3bnKBjr+BG1Mtyy
         dYyZUF9TT77PIMeMEM11PFr6FbWUGJqw3XckCxy5GSaoEisw2/LMZi8shgRreDRvDxa4
         hSUg==
X-Gm-Message-State: AOJu0Ywo2HqzEW2grUUB+ltnoSn639+OZ6w8G6V7pvOERoDWDsJrm9nD
	HCDvsu9jjhloPCxZDTKAmsUKFKG6WPpk+A5AsDECoKsU/YrbSK6NH9LIObvxWcJCiNlVJITywDk
	YxZ5lRb1T9EWSHTcEh7b5pknlHmh2sMDbNtJQRg8Phopp4vD3OVYPhq4YQ8OhfxPkjSGE
X-Gm-Gg: AZuq6aI53X68ifMGlztg+HpWiVOqJmAJ43RrUcIjSuI7SQW6mCWvcd9xgh0kZGhcime
	cMEPgtRuF622q+DYpz++gHnLVMNJWBC2N8f4vxvNuaLb9wL7LjdPf6oaRHKcXdFbPFzD53gmOoq
	N6B1aQ0ETavaQlZAZUkKsm0Ec5pkbuvFXRwiRrDK1x2ujTVzT/gEYS3DplL7JX/0pOR/YsSpSEQ
	/utcoik6I8C8iVdZI7a+4L9NIdIr0LFqS9GCLcdZRl9eRzirTok/qGLaG31WFyR9fRtjBq0YfIe
	ADOSVFw7+jDB/LKN03e2RVHAvny7MYclDDgAUe16Mrgz3i4uhESLWpBKOetaJfKBVqxb6WnePl4
	Yy6A7VKFuLXV1WFgebKWfPwNu0dK/Bqw+Ms+1XY4xudGIqMQDya7cnycY/8pDpOCTi6RfxB3bf5
	c=
X-Received: by 2002:a05:6300:2287:b0:38d:f16d:2002 with SMTP id adf61e73a8af0-392e00659efmr10464402637.32.1770017762863;
        Sun, 01 Feb 2026 23:36:02 -0800 (PST)
X-Received: by 2002:a05:6300:2287:b0:38d:f16d:2002 with SMTP id adf61e73a8af0-392e00659efmr10464375637.32.1770017762420;
        Sun, 01 Feb 2026 23:36:02 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f3cc71bsm14129847a91.11.2026.02.01.23.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 23:36:02 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, yijie.yang@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 2/4] firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
Date: Mon,  2 Feb 2026 15:35:46 +0800
Message-Id: <20260202073555.1345260-2-yijie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com>
References: <20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=698053e3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=A5G4tF9_Y6NSfw4zGTkA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: _3dUq5nVzB7V4GNUyXRTy06kzb4TGbAS
X-Proofpoint-ORIG-GUID: _3dUq5nVzB7V4GNUyXRTy06kzb4TGbAS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA2NCBTYWx0ZWRfXySskYCz44ZFm
 v3QTEwSZJCzlh5N7LazCWE4FhgXBnXj72zjgscIwKU5ait+DNf3sSpsYQ9fnJd78KPRfGnBoDFd
 XrVeMVGs81C+ZQPNvpZjioc0BS6XObR6IQbziuv0fpjyKWJnCyUPevgh2cpzA0byJmBwQvH5yFV
 So07V4p7P4hysU48C3JIsjhisjNDXzb3IoT5sSWOdNW0sSYpaBIdxGOjzjbC+BgJF1rjyvaCwjg
 1NkMo4MYcNhDof5npeZQ2wQJU8Ui6M4jscqVPYulOohuZeckDnHGkj3Uh8gajoxQ0caLoGcfn8T
 PkmmL3m93JcXRuDJ0rRtMxWk7BXLmOOfogufn8QtBIePCYdj41UP7ySIgClRP7Gtf5BLR467cfl
 MQaPjENoSdjw+mZBcs4wIEKVeEPbphv1BsmcFdwwhazwr0Zx2KW6rjECOk5O0I0oLe+sr2DLxK9
 dMcpp+NGYLsXWr08JnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91437-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3D0FFC93B9
X-Rspamd-Action: no action

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

Add the Purwa-IoT-EVK board to the list to enable access to EFI variables.

Guarantee that subsystems relying on SCM services can access secure-world
features. This change improves reliability and prevents missing
functionality or boot-time issues by making service availability explicit.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 8fbc96693a55..58d9911624b6 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2310,6 +2310,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,hamoa-iot-evk" },
+	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },
 	{ .compatible = "qcom,x1e001de-devkit" },
 	{ .compatible = "qcom,x1e80100-crd" },
-- 
2.34.1


