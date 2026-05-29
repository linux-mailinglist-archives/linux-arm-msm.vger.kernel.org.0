Return-Path: <linux-arm-msm+bounces-110258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QK7AHoF5GWr3wwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 13:33:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CADB1601A8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 13:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8CBB3036390
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7520B3D47A3;
	Fri, 29 May 2026 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQs8+9K8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UsJfOjln"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B123D47BD
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 11:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780054036; cv=none; b=A/U7S8HHr5+XxyWstAAj2D9kmAsUSlXrMx23BS0hXRY6tM3Z8kVFUJEkCxoJTEAo5xiJ34kdUtaTKHE7+gEeMncndYCFDrKuiYqhgnJDFP9E9Tn5T7Mdgc3bSrN1X+HsbgexsWYKHoIJW5LvfybF2k1TinEbyhSYW71LNGYhnHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780054036; c=relaxed/simple;
	bh=vKZsRXFjBLtMEWFUSdndoWrkKKPOtdzvTVX7vTz9Mn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cUDFhZsB3haRCWdWujDOO4CN8AGfCWprwt3WkNFFVjlhVezU5cLxNQZm23ddkEgKqiPg9gwt7wru1WmCRWghpEXZfAfhdg+taRTTR9gQab7Tyksvpr1FCd46bMQylqxr1kX++R1NgU0Ul7rWN/MU2RCDjGvxeP82hmtm2EMCyXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQs8+9K8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UsJfOjln; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T88HR11495603
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 11:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7tYy7oeqfyjGswNTb5KcNc
	hClqtkOLSJ5yUuJnsOtnA=; b=iQs8+9K8AR6XwqdmEoRjseMTO2yVT6J5whSFkv
	STSVDKUQ1Hawd1WB1vih4Th/dw4rAZmi+uaRQJlh9JX69G6unAp6dat8hsgjZTmh
	UP9TjJeZQWlEt8EVLynXwJ6egj+ARyTDLJAsOfNW9Eg+vHsDEv1pjlxYusfzFRcD
	pP5dE7Y5VB+Qw83m+Uwh/FP4zbA4LHj+Aizp5zjZ1Wi1/xdzXf1UZG7dvNYPJapP
	Sz3EkEboenRkPUJ7mp1MPBL0nOj7MnNixF6XdRXr8XzyIbj2wLXBBMIfAWD08EQt
	FLYoSZ7PhrZ7oEHK4Wek/eNxmkezPuN44c1fixSZqBed1U1A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef015ad1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 11:27:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516cdd89225so159714391cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 04:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780054033; x=1780658833; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7tYy7oeqfyjGswNTb5KcNchClqtkOLSJ5yUuJnsOtnA=;
        b=UsJfOjln2rFGKsw0iNQ2JBquvM/f7SgKnWelfmqOzjAKY65EiRQV2J5ZRbIQcIdqLu
         qBoeh3z3W7xNIubeYaWbrS3AktZEau8vskQqy069UbPyubbNNOYFCaMWAwkF9iXM3jlh
         PqLaR+k8EaK2qENspxBE4OnpcSbDEZfRh5yUFJEt92xd0SRmGors8txt8xIKOuYIqrRo
         s2QnqN21W2+Mol4VIv8FnIfq47MRavA/1nIPGKWKnA1GdnsGmuRqdfmTm9fRAcOT79zn
         LtFj/6DAuoJdmWU56oGG9EilA3WCg70zRJBMeBfbUcjYjdFeWcapXU+jks+VpUQ74/Oj
         gWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780054033; x=1780658833;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tYy7oeqfyjGswNTb5KcNchClqtkOLSJ5yUuJnsOtnA=;
        b=DgtiHN9ZjPjGHCDpqWjsShRbZ4oCeHMmqGQh9DSAY6jISBAG7Irsv9m2RRLWa9WQdf
         0hbOOsAJs0cNXaYV+3Ifg5f8xjSkJjG9faIAvO9y1HU6WFxz751q+HYB8ZBF41/600jy
         KcVzV9FKOdFk2P16ut4PpH3WsSjv7k4y6IxwWQQDf/YDxzCItwznoMNUPhKBeOAlAMZ2
         Y/PkKpaqA1XxYQYylylBrSon4kNqL15M4SvjL/4Yr62YvQsP+H7GDUIPQ2FHQRpoPK13
         iwEYMsgCGq1MQHySVRMbCAlMrCwPu+s3Amq0VvQ3ZQrSlGVJaSnnIrUJwGlKG+vitLwa
         cr9w==
X-Forwarded-Encrypted: i=1; AFNElJ+o3Q23lrxKbENsQcRm55OJJ0TFRf9A/xOFE9QtO7LUluf60BtLhdl9CtwWhiPhFZ7bBiK8PHJhrpqeOmv4@vger.kernel.org
X-Gm-Message-State: AOJu0YxI5OEmoF3Vx1mjWAkuvog3SVWFIl+NUjgsooaONpnzbAHA9Uny
	Y14FeJjj2uRtcbdyjttx+YRXkJTGcdUaUlvOuNmX2axAwV7sKTkYvGyYtBmnoCObcQK509OZHng
	BgykcyM5LP9W6ByFz4sBSjuIXWvg06R1iSupcX+fdyAMYrPVwuJR540C0s7BdVVaXX/KYixlkIB
	3H
X-Gm-Gg: Acq92OEzYehgDs4VwJ+/MQ/H142PdFimXOmIZuEqVYRACPLp54P5Vm1cJYdiOO2W5A7
	hos9YNZ5cusB4QOiazq6Aa4TA4S/OJyXtLQCu6TAdSeaqWF0XoBYC54oAwb4LLh97kWK6luzkjK
	+MEG0BXTBg24ZwQoU7bzpQ9c18UGeXovGcJaxfBx1PXuStJWzbC6UaczpPwaVTjagyu7nAYHphg
	3zqPASP0UcZpkxjpNdOwcUFARg06RIX8t5T8Mb3cG5Jlg0lg01mqz+8l9TPX/yPDZpszwqxEKc3
	DFB7mZpGbxkT/zwvchlIpXgHC/F8+JxCavS/2BWaejGcGYQCE4giBbSxogkgdyjrPk+kKIssyra
	0bnlm3YRPml5Nfb3NQi+N6H45gpUQtK/4Sr7UNtrF581/xX7cWd8DpaD+lxjlyxtoPXVrf8jXRh
	/730uErQVl3DTOd1WbBKgknSSJsCQVX6wRxZN9IjM83lljSA==
X-Received: by 2002:a05:622a:1e92:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-5172dd70208mr29013871cf.43.1780054033529;
        Fri, 29 May 2026 04:27:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1e92:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-5172dd70208mr29013471cf.43.1780054033107;
        Fri, 29 May 2026 04:27:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b596991sm217604e87.44.2026.05.29.04.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:27:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 May 2026 14:27:10 +0300
Subject: [PATCH v2] media: iris: use IRQF_NO_AUTOEN when requesting the IRQ
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-iris-no-autoen-v2-1-b1bbaef65b41@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAA14GWoC/3WNwQ6CMBBEf4X07JK2IlBO/ofhUGGRNdJqF4iG8
 O8WPHuZ5CUzbxbBGAhZVMkiAs7E5F0EfUhE01t3Q6A2stBS5zKTJVAgBufBTqNHB6ccy7wwFju
 TiTh6BuzovQsv9Y95ut6xGTfL1uiJRx8+++Ostt5f+axAwbEoW22klcrg2TOnr8k+Gj8MaQxRr
 +v6BQpG6/bFAAAA
X-Change-ID: 20260408-iris-no-autoen-56e8679aef94
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1714;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vKZsRXFjBLtMEWFUSdndoWrkKKPOtdzvTVX7vTz9Mn4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqGXgPFg5kZ+7RxnZU8a1zLmsiavLGvLM3gjima
 EjEA4y4hLGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCahl4DwAKCRCLPIo+Aiko
 1aSaB/9w1sj7UlYdUff1NmwMa/+qecfog+hInl9Y2er/WsgnJN/pHXV4koqik/Hasdoudt0z6UZ
 3Qn9jabK3gz6yT0V/WPgiq7vs3DG9lHhRMhgam9BfAn1JEZ/x4UDIqx82Or1SfRVO/6xsSG0W5z
 11LfjdaprtsFSNekgSI2WNoL1NK4sKWrqBsRH8MTPnHPj7xQu/y/0MiADLEKRUbDnvB0GkANAWy
 b54XOg/z6jfDZupHsyfEftqQTWPUvWn60e7Qrrzc8xAZhRlQRxKDtGOCguc7K9jRX7tx4uLMNr8
 it6hwI/1rc6DpQYXLiTYiDzRuEqn0ruiz9Gkj0hhaaPHjEFI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: EqFj8dbBqDBONwawVAOyYCfvcUN-v8Gk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDExNCBTYWx0ZWRfXxKvsH/oGa8d0
 zjUxNQIMKfpKiDZEArevjmixzWBfO7ZSiyYrNRt9xydjFUWc35zeWdc0YYBAOJ87d+3w447OtkQ
 UcW1PBLUIOyp8SDR/jPt5J0WfE/NxTI7UgFqCasVRIjwJiXWBhBihtbAoMJuiN5xYzDO1IVRjuA
 VmrKKdy860Zr/LtNzJZ9CJlTav3rhcbJ4vFHAiBGEkmy7XVrEVMrO/LME/4BB0tOc2p9c7ndbX4
 pW09ZhKgtWJoYP0nwXdoOgCr9DY+cfPJdPocOEFVqT2Rrwc36ojT8L6nKqe49GWCDEZCRuOjfZX
 deqND7OA/bz/vHqAa2OfQioU1D/GJ3jIl9VASOpOEQqKEOlA07+SvT4ytl5NOKFCHYRk3g33Rt0
 cP+3ebfGDyDx0eRNnv9x+eLtZmzyNBRm7aG0xUd41NUbm594kwLkcZHHhOVjt3uA100wGZfKm0T
 AWkB2RfyuBC1Zai7Amw==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a197812 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=EOH_RX0NK_dA2BEO_QQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: EqFj8dbBqDBONwawVAOyYCfvcUN-v8Gk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290114
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-110258-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CADB1601A8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Requesting the IRQ and then immediately disabling it is fragile as it
leaves a window when the IRQ is still enabled although the underlying
device might be not completely setup for IRQ handling. Pass
IRQF_NO_AUTOEN instead of calling disable_irq_nosync().

Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Rebased on linux-next
- Link to v1: https://patch.msgid.link/20260408-iris-no-autoen-v1-1-378d290a019e@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_probe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index d36f0c0e785b..a755a6f73ea6 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -259,12 +259,12 @@ static int iris_probe(struct platform_device *pdev)
 		return PTR_ERR(core->ubwc_cfg);
 
 	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
-					iris_hfi_isr_handler, IRQF_TRIGGER_HIGH, "iris", core);
+					iris_hfi_isr_handler,
+					IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
+					"iris", core);
 	if (ret)
 		return ret;
 
-	disable_irq_nosync(core->irq);
-
 	iris_init_ops(core);
 	core->iris_firmware_data->init_hfi_ops(core);
 

---
base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
change-id: 20260408-iris-no-autoen-56e8679aef94

Best regards,
--  
With best wishes
Dmitry


