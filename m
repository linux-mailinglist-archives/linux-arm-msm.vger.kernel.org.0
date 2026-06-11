Return-Path: <linux-arm-msm+bounces-112576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Vx7wEHhAKmrulAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 06:58:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F5966E557
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 06:58:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ghy+qJvy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eGWXhINP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112576-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112576-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 360823023046
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 04:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFDF355F46;
	Thu, 11 Jun 2026 04:58:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165AB2848BE
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:58:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153897; cv=none; b=mdkjjKz+d74/nBfmlWOQ7IqE23poPmfTftW4cY0fMvp8LMsApa+yRZq4tyJMMX6yNH5m8/flwwrFe3rmMDvDFnKIooJLG0nxAahEhAwmwmoHJLZdsl8YgqEalkg+U1gSgICPL86SlMtiTOFfsTqtRb9nGtcCW9/iWyjBLcogTE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153897; c=relaxed/simple;
	bh=uJ23gIHQJ0qpMozI1rE5Gfj4cM7y1tPYnyGtZZNKffs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RdG1lBfvlCxT60JQOVr5tKjeT7t2YDx3mUlLY9yN4mGJ88TS68K2wR8ZNTuNrUc+N78pSB+BUNN7pkWfFZVZXCEY8f4eulpOjXbHzXHbVeeVsp7IdmYCanUR3L9eQNJH6CPJj1wD2OOE10K1k8H8l00vc/dSfUgffOt8dC8Itig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ghy+qJvy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGWXhINP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0Ncq73212596
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YazJ8TlDEdRjRhXV+XboVmc5RQQNzPAMZOx
	A+5i/Das=; b=Ghy+qJvyGFnduftGD4OeS3tviIsThUjsA8M+GZwlCZO/4jpGr8j
	xr7JH/E3i9GwC3gEph+QaCPTbfcL+PpMW+ttnJ0N5MBxhchNeFsDqfxAGcQ0MuGJ
	eDitoRbMqKQaoKwAwNZvzo4KRO44IqA92KjzKhSnRUIfPDkfdSFaxdS5PxOhzcsV
	iUG1Img1ROoILAhvmrSyBtgA4YERDROZCV48Lsx8wGjIpUvVV7FkG7C5AwcBePTJ
	aYi34nzfI9SE+aoFwMDGluDudGmMVx+XnFacgeD7VK3Zbuo9xfq0WuZZ6H8zHEz8
	iDEeLdYAh0dxrxRWjiDTq4Akkqa6GLsZkHQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe701n66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:58:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84240683a82so460940b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 21:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153885; x=1781758685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YazJ8TlDEdRjRhXV+XboVmc5RQQNzPAMZOxA+5i/Das=;
        b=eGWXhINPzGkEeygMYWRFYrw4BMtnHToHFrvBjVv9A+SA+UGZLIOY5V9HHe/AAfGGvY
         vM0HXUCgSoXVxmqEgaIAAWI24TlERqSkWjYfxLUulNhNYpEyqRU8JaH8YXLXtipkJ5fE
         vKxaaiAKu2MsO9xeVhFFmqiuRZrpEpd/VlOqM7aA6Y3j2xq1g1XNYLwW27X41Uy4udbw
         AT31fL4glSYe07/vaquH0kxWHXMUL1PUdBFI4t+EVHMZomamMXCVz6iII1rlvWdZXhFU
         6tC/cs1tUqw85xZDflQGTluhgTPWBp12hFRIScZrKY77o0IiTVS2DyZsEF6G4Jvtls1n
         Fm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153885; x=1781758685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YazJ8TlDEdRjRhXV+XboVmc5RQQNzPAMZOxA+5i/Das=;
        b=GcX+sHrxlLSvna2owx2r8T7rM3pniRMojBTawyGpgiLTtacrNYo2R7MmLYwmFIaA92
         akYBC1EnIejK0uAkF1a4rDHA7wdGkdKSDH2ZAgBosCfvt5ZN2CNprOXMBovt2uJDIfp4
         tntw7bj1Kj2Bk1foqNguAsYDU5NOm1ui4bOMhMIgsQ9jHyb9P1awrPakr0ovNi1zWdiW
         RcVdT7HO7b7/f0cRS1mzwNPfDsYAINCFfHQ9ohw3UZZAGd2bZLP3xGhkPYtQrtjw6Rju
         7Xt/aFNDO8pIveuaos7m0MbiU2N7KbUlwMDzUUClpXd9/V9fNlpXATvdVyrCAzds1Axk
         Sygg==
X-Forwarded-Encrypted: i=1; AFNElJ/hBtknLlYkIEcQfkf62iaiAFMZkZ7JrE2bYRqMdR0/1fGqx5jYkode2mv4780rTr/CQqnOxofOreE7Q3HX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvv/mgNlryvjFbtJDkcagkv6ZwuYdhFquGI9qYTaiDG3D28nDR
	hAqyitIrGjVTR6LvS6PhfJbmqcxfa2Pm6Ghqn/a2sSGyUqnu/agAwbs+xwhWFil7u83eiLqIv4L
	QN5x3bQYDGKd7iGKRHea4/XpKQcEQB8NOZNatbC3om0mEZlUbMC2uHtKbr/iBH6YCR9k2
X-Gm-Gg: Acq92OFeq3ow58ltGcTYdfh7DVhKFcOfNCBm/N2V5B5cuuzewl6wSJ8TkzoI82i2eo0
	ptkgC5U0TLUXltDf6IoJBI1tf1nu/jLQo7ujKsX6GNtLr8wCJ8F29zt5sZCoyOXPfM4XMsEXmT+
	UGLh1et0h2RuOI7ZSwW+Gmo/4POO5uE2RPcu+Xxd9mN37gm9Td+TI23krLnAJ58C7xbNNlRqqnj
	ibhJsE3/2lk7T9TMVsr9tzOWJXa8poB9CSh+UF6JLzMODAdraZv9MbS9BbPTIdddMqjQ9Ghh4Zp
	0HI1nsVgT6uuv0eXqk/jd476D6DjPW5W4uoOjsshKsNvSHoeps421tfzEjH7iHFDwF0OqSFJrE1
	8QcLQHZEweIDwwXPPGzO5YAkatnAwLpE28tlSFIzWkH3efeiFQD8xA5t102sORKhNq+vQ2GWA/1
	YhPBgt1EBLaAIuLWqRJoscshw/l7Pfffmpbtf4qB6Ngkxtli+2WKQP+laWPZjQ3Q==
X-Received: by 2002:a05:6a00:a87:b0:842:994:939e with SMTP id d2e1a72fcca58-84336101d84mr996183b3a.35.1781153885476;
        Wed, 10 Jun 2026 21:58:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:a87:b0:842:994:939e with SMTP id d2e1a72fcca58-84336101d84mr996159b3a.35.1781153884976;
        Wed, 10 Jun 2026 21:58:04 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843382e5caesm510853b3a.44.2026.06.10.21.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:58:04 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Frank.Li@kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        md.alam@oss.qualcomm.com, lakshmi.d@oss.qualcomm.com,
        varadarajan.narayanan@oss.qualcomm.com
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v6] dmaengine: qcom: bam_dma: Fix command element mask field for BAM v1.6.0+
Date: Thu, 11 Jun 2026 10:27:57 +0530
Message-Id: <20260611045757.2841252-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bZcJZJvPmcIHHWXigJdjUvLswOzX3v29
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a405e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=8AirrxEcAAAA:8 a=Hu1su2-jXyz-QqmgtKAA:9
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX7NhtQA9yMuiw
 XZN5qXnyejoG8gsLd/KQTjbBfcUX9F+fT5lc0RN15dLqfBhckX36WUtxNFkbK7vYlGjx2Zk7A0h
 KXd1jXcBYFCvZNLJc3dk5qCYD5f8Yd25X8tSYqKdK0glU/UY7+JIH0sK7g79Vr7gDqoK933mGFC
 m8Y5Xa1SfIyylE0Bf0n/4psfZLfxm1Ov8CrLB43RWBB9Q0ZqB7v7IcdJ6kSVMLpvFyzck3oK4+N
 7eJb2r8S4jC6q8VDev44PL5wD8CtF04ld4rWXU4iqEFzWaI49fBaY3OgauZBhYbemnwtH7PNzSA
 Vp8luHmJRyPQXfg/x/GHv3W0oJ9rkub1vUEQzuhu1nwRwMBMk2ZfJP/XDJc4wxMtsxVNkdXBRMm
 C8w4m96B7Em6V4Nd91SUh6HR6SX72FOtTbw+WUZeYTgXyxChaBV1xhIjSFiSqBbOPPrCc2Spu7C
 CsHt2yGWDyk6yXQz7Cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXy6t/T9qBXzGi
 EPb72emwEr39G+/f/ipcEwl7QaVyMvk9y2zEQ4mnx1YSUfKf4pkwYKKuaEm6cL06yRRFph0uXCv
 dBvp6f/3+jiSeYdMH9wfoD0aTFOvO1Q=
X-Proofpoint-ORIG-GUID: bZcJZJvPmcIHHWXigJdjUvLswOzX3v29
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112576-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:md.alam@oss.qualcomm.com,m:lakshmi.d@oss.qualcomm.com,m:varadarajan.narayanan@oss.qualcomm.com,m:Frank.Li@nxp.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:url,nxp.com:email,quicinc.com:url];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7F5966E557

From: Md Sadre Alam <md.alam@oss.qualcomm.com>

BAM version 1.6.0 and later changed the behavior of the mask field in
command elements for read operations.

In older BAM versions, or prior implementation assumptions, the mask
field was effectively ignored for read commands. However, starting from
BAM v1.6.0, the mask field for read commands is repurposed to carry the
upper 4 bits of the destination address, enabling support for 36-bit
addressing. For write commands, the mask field continues to function as
a traditional write mask.

The current driver sets mask = 0xffffffff for all command elements.
While this works for write operations, it breaks read operations on
BAM v1.6.0+ hardware. In such cases, the hardware interprets the upper
address bits as 0xf, resulting in an invalid destination address
(0xf_xxxxxxxx instead of 0x0_xxxxxxxx).

This leads to failures such as NAND enumeration issues observed on
platforms like IPQ5424.

Fix this by assigning the mask field based on command type:
  - For read commands: set mask = 0 (upper address bits = 0)
  - For write commands: retain mask = 0xffffffff

Also update the bam_cmd_element structure documentation to reflect the
dual purpose of the mask field across BAM versions.

This ensures correct behavior on BAM v1.6.0+ while maintaining backward
compatibility with older hardware.

Fixes: dfebb055f73a2 ("dmaengine: qcom: bam_dma: wrapper functions for command descriptor")

Tested-by: Lakshmi Sowjanya D <lakshmi.d@oss.qualcomm.com>
Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Change in [v6] -
	- Commit message updated, no code changes
	- Pick R-b Frank Li (given in v4)
	- Change 'Lakshmi Sowjanya D' e-mail id to oss.qualcomm.com instead of quicinc.com

Change in [v5] - https://lore.kernel.org/linux-arm-msm/20260514-bam-fix-v5-1-58f6edb34969@oss.qualcomm.com/#t
	- Split the driver change into a separate patch
	- Update commit log with 'Fixes' tag

Change in [v4] - https://lore.kernel.org/linux-arm-msm/20260206100202.413834-2-quic_mdalam@quicinc.com/

* No change

Change in [v3]

* Added Tested-by tag

Change in [v2]

* No change

Change in [v1]

* Updated bam_prep_ce_le32() to set the mask field conditionally based on
  command type

* Enhanced kernel-doc comments to clarify mask behavior for BAM v1.6.0+
---
 include/linux/dma/qcom_bam_dma.h | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/include/linux/dma/qcom_bam_dma.h b/include/linux/dma/qcom_bam_dma.h
index 68fc0e643b1b..d9d07a9ab313 100644
--- a/include/linux/dma/qcom_bam_dma.h
+++ b/include/linux/dma/qcom_bam_dma.h
@@ -13,9 +13,12 @@
  * supported by BAM DMA Engine.
  *
  * @cmd_and_addr - upper 8 bits command and lower 24 bits register address.
- * @data - for write command: content to be written into peripheral register.
- *	   for read command: dest addr to write peripheral register value.
- * @mask - register mask.
+ * @data - For write command: content to be written into peripheral register.
+ *	   For read command: lower 32 bits of destination address.
+ * @mask - For write command: register write mask.
+ *	   For read command on BAM v1.6.0+: upper 4 bits of destination address.
+ *	   For read command on BAM < v1.6.0: ignored by hardware.
+ *	   Setting to 0 ensures 32-bit addressing compatibility.
  * @reserved - for future usage.
  *
  */
@@ -42,6 +45,10 @@ enum bam_command_type {
  * @addr: target address
  * @cmd: BAM command
  * @data: actual data for write and dest addr for read in le32
+ *
+ * For BAM v1.6.0+, the mask field behavior depends on command type:
+ * - Write commands: mask = write mask (typically 0xffffffff)
+ * - Read commands: mask = upper 4 bits of destination address (0 for 32-bit)
  */
 static inline void
 bam_prep_ce_le32(struct bam_cmd_element *bam_ce, u32 addr,
@@ -50,7 +57,11 @@ bam_prep_ce_le32(struct bam_cmd_element *bam_ce, u32 addr,
 	bam_ce->cmd_and_addr =
 		cpu_to_le32((addr & 0xffffff) | ((cmd & 0xff) << 24));
 	bam_ce->data = data;
-	bam_ce->mask = cpu_to_le32(0xffffffff);
+	if (cmd == BAM_READ_COMMAND)
+		bam_ce->mask = cpu_to_le32(0x0); /* 32-bit addressing */
+	else
+		bam_ce->mask = cpu_to_le32(0xffffffff); /* Write mask */
+	bam_ce->reserved = 0;
 }
 
 /*
@@ -60,7 +71,7 @@ bam_prep_ce_le32(struct bam_cmd_element *bam_ce, u32 addr,
  * @bam_ce: BAM command element
  * @addr: target address
  * @cmd: BAM command
- * @data: actual data for write and dest addr for read
+ * @data: actual data for write and destination address for read
  */
 static inline void
 bam_prep_ce(struct bam_cmd_element *bam_ce, u32 addr,
-- 
2.34.1


