Return-Path: <linux-arm-msm+bounces-109782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDtuBNZ8FWpEVwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:58:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5957A5D4810
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D33E300A5A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793C83DD856;
	Tue, 26 May 2026 10:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IdWAjImP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BiPhfwS2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146743D890E
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779793002; cv=none; b=SpfjAim1As3XnD951jOwDyIxcazNxLHocbeyeyftIAk6SzOJWKIBsCldcnMWXag88pxSdQ463MRt6qpIkMuEJTyzCFhuggeK3kOnUlethv/mdmxMp15T1HGZZyJYFZeFYxKNFgt73ArMlFLzF/Lbgoo/PI5mGypZNEt8y0qBx3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779793002; c=relaxed/simple;
	bh=dn7IGaTgNv1nqYd2NWc8NQXcqaOvapPO++HaXqecuCM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tCb5h7MRLtYt7WYWYkh4txzY1OVybJGYBxru2iUtYrvOG8+LUy9S3ejHeCp7/L4IWCa3t+8nYfGY11XlLukupnCiTVQLsogIKtQSWdzqY8qPBxxUn7JJmN+aRgFLdMO/O6N4Q1YtEFjxkUvktCeRxI44P23VhSb2r/d8mK8w0Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IdWAjImP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BiPhfwS2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QAoaEr1802490
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0E1qh5PwHIeCTD6xxvgVPS
	VF2zSONYtMdLgzetdNRl0=; b=IdWAjImPRF9muDSMn1Mk4Cb+TTerK9skjKgFqd
	BilFT2CoakgJ/3MNudpwAgO5LqCemqNUfKzRwpPRV/mH+9C8dxRIRb4SKckUShfE
	WFQeXkU9SWyW4gAOV7W7r2VwtkJ6w2VR14DXPAS7trVs1/JuhS/O0hxxNY4Y3DVX
	Ex1gWyF3k+Ox3E47QDaGNFaSfe4qvPS0p0+rp9x3471ItYkBVkuYUDy9gCLjDjZc
	TXQF2P0FKYhiFsPqKLclXlMPLJZMWnoNeVg9Piat0KhTd2eMu4ItWXpfUYAKmkMF
	XMhnDGPEQ9r26fiA0oGn01i2jrB6t06VMidCtukTij2arzWg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqmcd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:56:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so10556079a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779792999; x=1780397799; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0E1qh5PwHIeCTD6xxvgVPSVF2zSONYtMdLgzetdNRl0=;
        b=BiPhfwS2E9QOCqCzv9YgXQGK8aWx3j/fRW8LEGikBzHnbd1rHAgX9B4tHjmj4GM/oV
         gz9RBMpTXgs1yiUmTbdhlUcF2at7VSLmSq2x4laakh9KYLvCyrs/gnmpff9U0+AbeRgj
         l60szVTcXh7j/DHIjlSgYEY+xcXBQnPjdWJhc16CSnCGfODkEEGYBHQpsfPpSra10In/
         U4xQo+9Y4v0+YynF9TZx2wIi7pD8SQGwi2vAkx0gIC6d7mCtII2l7Aaq49ID4G2rkFf5
         5fyIU/iLPq4lfbJ2ztj+Sy5ACUJ1K3d2elWpeECSP9dRUTmVngZkAoXvtEbFeYOtf1GS
         L2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792999; x=1780397799;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0E1qh5PwHIeCTD6xxvgVPSVF2zSONYtMdLgzetdNRl0=;
        b=T5qxj5qdHX3QVMILnsmCK7DMASbddz7SejbPUe8CyhGOBdfBzF/btml0d76SWArLCM
         UoiRPYfpEagez4BQ+5LXGEXoz/jMzhVxr0e+60o28Mp6PWd8OqUmfswnCpXWdgHbTGOP
         0jLbDP09c6WGiExbMQ6nn+9jRxH04H1Aan3U2B7lUUvPysWqMj6LUenFKGmmxAbEjJi+
         2wL5ODQczuw1tY6cqz/1YGv7jgkg9UsktjMnwmmRxlX4mHznyJt53i+Fgat6nbxh2EH7
         20/G4JwcjjyZHEyvBEDQbbfPC2MHpIoVebNVrFzeTSRF2adpEeTyqo+Cn/bdrZXFu2yY
         hJVw==
X-Gm-Message-State: AOJu0YxqA3vqe2jqWXctNB6C39qpKj0S6cNaool/Ka5atZClvVWP7DQ4
	+3oBmH2RZ4gR8WeARlH00A+kWvwyS3oHlUaKwDJSi+xaJzsCLtzWhiJBwvNEs8JJnU952UWD4j4
	plPkkVWrzkO55KPeU1tveRHCNkgcgvMq4fFjGpup3QiwNNnxy/+m/OIumm1VHs0mZYtPG
X-Gm-Gg: Acq92OF9/PMnEJpa0g4qVOkBeKX2b5Z//RUYsXHaD6z1yuwwVTZy5PJzRU8P51ngnw0
	3utc3Inq6Huk7feRklWp9o8G+cjzBfSKMg7Yken+OtDTYCi2TZ5R7LqcsYU+ucZfJ/rLV9kPQrd
	7XdWmqimjF/q2EgyJmIeW/BfLWT/UoHcOiGnmA4CE5HHICx8q9f6Soyk3rX6IeTIyjjoLwLc6fC
	Z4c/4xSBEOr2liwBtprtdVHXwpQ0hUYNbbmrqlNJ0WnB6RQ2kUvt4QMgyR+vjXnVooQMI06fpvt
	s3O0EA+wg2hbDiuAGBi/UvvEqzFprpBhwolPt1xMDVz9RRO0mTrPjdnxFYmcLpZ3h4FFrmdAmr/
	iBjP0O+GsckQgWaCyrR6eQWGxycwV5ZiheE6u4M3c
X-Received: by 2002:a17:90a:c88d:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-36a67693ee5mr18875843a91.22.1779792998757;
        Tue, 26 May 2026 03:56:38 -0700 (PDT)
X-Received: by 2002:a17:90a:c88d:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-36a67693ee5mr18875808a91.22.1779792998293;
        Tue, 26 May 2026 03:56:38 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a71d9416csm16601070a91.3.2026.05.26.03.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:56:37 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v2 0/2] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
Date: Tue, 26 May 2026 16:26:08 +0530
Message-Id: <20260526-gen3_adc_tm-v2-0-702fbac919ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEh8FWoC/1WNyw6CMBREf8XctSVtecS68j8MIW25QI1Q7QWiI
 fy7BePCzSQnmTmzAGFwSHA+LBBwduT8EEEeD2A7PbTIXB0ZJJcFz0XGWhzSSte2GnuWCV5bo04
 GCwlx8QjYuNduu5Zfpsnc0I6bYmt0jkYf3vvdLLbez5z/mWfBOEuV0VI1ymTaXDxR8pz03fq+T
 2JAua7rB1ymaae/AAAA
X-Change-ID: 20260514-gen3_adc_tm-410dcb98be62
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779792992; l=3547;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=dn7IGaTgNv1nqYd2NWc8NQXcqaOvapPO++HaXqecuCM=;
 b=DtS+mcDVTHJooJq4awfZKREUbc3QOgeAZz0MfdjWhOrinc6mECBWr07fc0NWFu8CzfMShnEC/
 n4fTKrw1S9bB40oaKxL0Eg3+wf4uoypkEd/4LWWeXNKaN5TDHZZr7Ji
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a157c67 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t6WtGzA2ZKrDIJVor40A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 2u8zbdbzM8_g4fK7mztWHNqWQvg0PWfd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NSBTYWx0ZWRfX5A7ap+ao8aYe
 d+QjBn7japBUHRZ9s8xaUepbmHFNurPX+zvu8frm2EXWG9vGU/v3SwrROQhJ23IQvf+ZRcYD/A1
 go0R9mPVjIoKiK6I2MjAIjLxzLFvcvTqvf6Hrak+rd6gF6HpCmSIASCWH0pJt310YmMf3IKjBEa
 qB5LyfiOAwNAeT8XEfrH1WiYK+X7La/WxOWAqg/S3ZDERwxRQvd76TsYW6yTVAhoIJJsBfTwcxx
 HB+kTr3QWoCmDSppC46e1szVYfCm+C+K42j7EHwrMCPJ+X41E708z47KADSuwYCxUHqVcYoMFuI
 xdRRmkyK0fbtWev/2LhFLsk4eMmjNZGPor9EVvgTMtSCEqknEmnwhEAUcRFJEwCCZMdSTIyOYqk
 zsVXHJpkGbypuC6TK3Ow77VaZx7AYzMCcKX0NLk3LahOR4WbqaATv31IrBTgJzVIdmadCEk5DOb
 tfdUOQ2/blv/ocYbFOQ==
X-Proofpoint-GUID: 2u8zbdbzM8_g4fK7mztWHNqWQvg0PWfd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109782-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5957A5D4810
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Support for the main PMIC5 Gen3 ADC driver has been merged now.

In order to complete adding support for the Gen3 ADC_TM auxiliary
driver, some more changes are needed in the main driver, mainly to
improve its shared interrupt's handling mechanism.

Patch 1 simplifies the interrupt handling in the main ADC driver
by declaring the interrupt as a shared one and dropping the logic
used to call the ADC_TM notifier for handling ADC_TM interrupts on
the first SDAM whose interrupt is shared.

Patch 2 adds the auxiliary thermal driver which supports the ADC_TM
functionality of ADC5 Gen3.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v2:
- Updated IRQ request API to request threaded interrupt in main ADC driver, keeping
  primary handler NULL and using existing handler as threaded handler, to avoid
  kernel warning for using IRQF_ONESHOT with non-threaded interrupts.
- Link to v1: https://patch.msgid.link/20260515-gen3_adc_tm-v1-0-39ba29f9b4ab@oss.qualcomm.com

Link to previous ADC5 Gen3 patch series: 
V10: https://lore.kernel.org/all/20260130115421.2197892-1-jishnu.prakash@oss.qualcomm.com/

Patches 1-3 of the above series have been merged now. Patch 4 received some
later comments which are addressed in this series.
Patch 2 of this present series is derived from patch 4 of the above series,
with some changes.

Changes since V10:
- Added patch 1 of this series to make the SDAM0 IRQ a shared IRQ and
  remove ADC_TM notifier, as suggested by Daniel.
- Made following changes to address Daniel's comments on patch 4 in
  previous series:
  - Added IRQ request call for SDAM0 IRQ, marking it as a shared IRQ.
  - Split interrupt handler into main and threaded IRQ functions.
  - Removed workqueue used in IRQ handler and its cleanup, instead use threaded
    part of handler for same functionality. 
  - Removed callback function exposed to main ADC driver for TM IRQ handling on first SDAM.
  - Removed workaround to capture temperature causing threshold violation inside interrupt
    handler and then return this on next get_temp() call.
  - Removed all error prints in interrupt handler and updated return value to IRQ_NONE
    in case of errors.
  - Removed explicit check to disable ADC_TM channel in case of (INT_MAX/-INT_MAX)
    high/low thresholds being set in .set_trips callback.
- Also addressed Jonathan's comments on V10 patch 4 related to header file inclusion and for()
  loop iterator initialization.
- Dropped Reviewed-by tag from Jonathan on V10 patch 4 due to significant changes made now.
- Added a status clearing register write in adc_tm5_gen3_disable_channel(), missed earlier.
- Moved cleanup action to disable ADC_TM channels in driver probe to just before IRQ requests,
  for proper utilization.

---
Jishnu Prakash (2):
      iio: adc: qcom-spmi-adc5-gen3: Share SDAM0 IRQ with ADC_TM auxiliary driver
      thermal: qcom: add support for PMIC5 Gen3 ADC thermal monitoring

 drivers/iio/adc/qcom-spmi-adc5-gen3.c         |  66 ++--
 drivers/thermal/qcom/Kconfig                  |   9 +
 drivers/thermal/qcom/Makefile                 |   1 +
 drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c | 437 ++++++++++++++++++++++++++
 include/linux/iio/adc/qcom-adc5-gen3-common.h |   2 -
 5 files changed, 466 insertions(+), 49 deletions(-)
---
base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
change-id: 20260514-gen3_adc_tm-410dcb98be62

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>


