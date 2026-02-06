Return-Path: <linux-arm-msm+bounces-92091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KXpKH4phmmuKAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 18:48:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F3C101681
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 18:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B742303B4FA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 17:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574F1425CFB;
	Fri,  6 Feb 2026 17:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cgMXsDSv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApzYFOhX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A777425CCD
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 17:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399767; cv=none; b=OuunXxdGbteAyYDzrOGWGqyXhM7zO77ycl6gN4qpqmUYwGMl8YRsQTOJvVPcl5emIkZNMJRQ5/D16sO9BMqA7ePKOvR10JksQPLC7qSRqsGU4kA+8JrrzD83WioBbddcsoy00doenF9+8whzyti2KKoZgkJRfqc1lISQP1Jz/TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399767; c=relaxed/simple;
	bh=INGstpgJLmbXtSQabWLbgnYYayWnJH8f7H+COx7b8d8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fKuMlORxhKlG4IcP3tba4r3qKHd+5PwOSc+myPT4eNY/fJclj7nEXkQzS5vKCBg7OH1QCEO15FKxtjLzhIz0Kj9uTdp0jfHYp/mgYGHQCN38PnC/sYmLtMm/xP7gstiGhALcc5VYdEznKM1+lhiisMXcFMY/SoRquFsJIZR5z6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cgMXsDSv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApzYFOhX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 616C7jhG3011932
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 17:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WwOaKjslk41
	m/3sPlhy3wTfRdNt9ldvgK3Mn5lILziQ=; b=cgMXsDSvVDF+BrT7dY/t2F1V2PW
	AMGcVPcSr334O4cIH6ccS/YV6EvY5m/xlz7cIdeG7Xzn65/0r2MfhzbCmkfH7ENG
	BZ548M6nibpNAYLLMfQQz38t8ERIuXGWAJGhiLGlcaoruHaUV9gm0f02XQA1UFsj
	Y9qxEXfUB5FkWrUqZZacLq0TLwJGrEEccnhVdqBDotGeQrynvZ9R2VDbJ6XBoN+h
	C6y3/3IeGLKVYL4gYOrEuSaevaHrSsyXvnuZvzhUkwlTimPli9Oy4MS/atOz2h70
	R0cbsqux2Ll40ESXu2W9/hXe+XMNaF6pMu+a9mvEdSCS48Gw0vteeQPTu5g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c59ukj842-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 17:42:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c5eed9a994dso572347a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 09:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770399765; x=1771004565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwOaKjslk41m/3sPlhy3wTfRdNt9ldvgK3Mn5lILziQ=;
        b=ApzYFOhXaIyRECKPCtL9xHJbZFeVFqkNvzUpUdJ/wcd+0iMK71S4vnxb9W9zUlpQ5t
         +3vG0kGYQT6gb0z544Kk6xsMIjAF449C2vJXexbIMX+XHJnEt62CfVVXYu4AUopDmYZj
         GXOqMh3km90yFCbev3fzsa69BhHQwRBxbnJAFtK/5CE7XGDya2sds3g7aXO54PuJTEpD
         9J+aAisPLveIPTdLGiRkkuEp4lzx0dKEMK7zkNGGZ+xKTuQrz/KjJNFhyhGl55TjBCzA
         CiMQxMo5ztZ5mCN8ZSRL4AhdlF78z1AQpaharUsSXwdrpWaX6WSP0qU8rTxE2wQAtiYm
         yfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770399765; x=1771004565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WwOaKjslk41m/3sPlhy3wTfRdNt9ldvgK3Mn5lILziQ=;
        b=lj479MD8kyf22ea5qi/tR/HYWbVd/9Pauenwh+WWAJ5dKKTlQP0meeJxSS+zj7KtWj
         g2ct2Sm2u2kBpCrQahjHhahTCeiqcVqoJdmdWHMhI8Z4UrdKQTWIEARpiqdKr2RkLRln
         nC7ZVmMubu/J2jk6SPx30iaIzmIGDVwWcL/WHtCJxWyoVuhMhKl7GSJ9bLqhS9OV/uKA
         YPoDpnAsYM9uDTZKmpE6Fs24ZwkZZVclaa43OACD32/UQsldd3A4SE4hbnkjQQtk44e7
         Gu0/I01UPEWnY6WCQ6tIbVQqM5W1iYG2Kftx0Ljxz3R14uT0YHqwsHGgUzwgCps19QV6
         /dqA==
X-Forwarded-Encrypted: i=1; AJvYcCXzFuBpmvCkEwHiYhnww4DA6VkgyKR2SuiEQzG4ESfyecIs2kbKqZvm/66xhON2R+ndOTVbMXL/Q0htM6ar@vger.kernel.org
X-Gm-Message-State: AOJu0YwQdT4gPaiy/lAlk4VjqiBt27Vge/czJuP7RSZH6YRf7wkSfU/I
	CLSdteIpWuwZBQOKzhdkkYt3is1/NyE7qRK1UvFfj3h4doTqOa5FZIZFYEnh8k+tr/P08jqg3j5
	CUKvLqt9RAHY+r4+7pqCqJ870H38K1WupBRQ4DQUK9qvCI+YazcsSTx0l9QmrTD0qwGnb
X-Gm-Gg: AZuq6aL+cxjd4N7IDNaRZ005NBQCVhPszGFuSgbUwhm6MwWC337pOuUzeOpGTiKhpWH
	pUw9re1S11L6bVkJ5yBm++7AbNxsizNID4UQLoqhvfGjvxW7JdxxHMaEBbZaCvR19HoG62GXnc8
	Ca5C5iJ8nRA8hf2Qf3ETSKf6l7dCbqh4aAT09AN0OqCSjDcRBXVLxR7jFrEv2B6yqwaXmKpfKgn
	du12tijMu2xYxLSj5Vn+o1qhPIP4V5DokjfKNqNQGKuG+4I9YtSgJYHSwnW8If5+PYGYxraqwO0
	+PSLmdsWlPsUGK6INHP7kfypRDvvxpEyP5Tlt/05QYat+j2O5WubUkPNnrcJVJo9ulJlx9guhPd
	UaGxIfBFK6ebQNyHdipAoJ3EyLhiENryd20zAYgf09Ec=
X-Received: by 2002:a05:6a21:6f09:b0:38e:9ebe:5267 with SMTP id adf61e73a8af0-393ad366d21mr3564261637.57.1770399764561;
        Fri, 06 Feb 2026 09:42:44 -0800 (PST)
X-Received: by 2002:a05:6a21:6f09:b0:38e:9ebe:5267 with SMTP id adf61e73a8af0-393ad366d21mr3564217637.57.1770399763929;
        Fri, 06 Feb 2026 09:42:43 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb5eccbdsm2639387a12.19.2026.02.06.09.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:42:43 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, chiluka.harish@oss.qualcomm.com
Subject: [PATCH v5 11/13] i2c: qcom-geni: Use resources helper APIs in runtime PM functions
Date: Fri,  6 Feb 2026 23:11:10 +0530
Message-Id: <20260206174112.4149893-12-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
References: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OM0qHCaB c=1 sm=1 tr=0 ts=69862815 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=3PeDo36KSfG0vlEF63sA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDEyOSBTYWx0ZWRfX3l0QZN2GT4co
 laEEQsbY/4sOwFhSMxQITplECnhS6x+627iaRGJcoAJLfzaCSajOkBb/65lCd79heKB4/zd1RFp
 i+j4C+Aldxe+fMEV+MRDfoFLdeRxjF2oKqDY5TWR0kr94JbdOFI/d5vkOegVpaocYlzDn48yWwT
 lg8Z15/vksewdMCgl71IJVbd8IwfsiaMsvFNY2ZqGoAYzAB7hgALl/0ciuLLjoU9Yds2oi/HsiE
 SiMREn80ShT03WSPyRrDB+h6RdyKJRIkmlngrTC6Ag6eLzd72Qg1s+z/r/0XPmzrexMC/Zcn9Bc
 cevJ4Peol3yTkAh99RlfXNzt0Ck1AMPfAwCsiWUgLcfEDlqc2ExI6ivsjxyVCAVLLdDAWGvrNuh
 ijDQCa+QTIou57K+pQmroAoCMIVCMSr20me+LKi8tFz5o8X5UgBWxFIAxX8qxiPAwIRfPMkhrxk
 XYL5oAcpBk/rZPYzQgw==
X-Proofpoint-ORIG-GUID: BQFuN_YMDrFjI-jJp0mocr2AJqtN9kcb
X-Proofpoint-GUID: BQFuN_YMDrFjI-jJp0mocr2AJqtN9kcb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060129
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-92091-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 28F3C101681
X-Rspamd-Action: no action

To manage GENI serial engine resources during runtime power management,
drivers currently need to call functions for ICC, clock, and
SE resource operations in both suspend and resume paths, resulting in
code duplication across drivers.

The new geni_se_resources_activate() and geni_se_resources_deactivate()
helper APIs addresses this issue by providing a streamlined method to
enable or disable all resources based, thereby eliminating redundancy
across drivers.

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v3->v4:
- Added Acked-by tag.

v1->v2:
Bjorn:
- Remove geni_se_resources_state() API.
- Used geni_se_resources_activate() and geni_se_resources_deactivate()
  to enable/disable resources.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 05f5705b0319..0ddfeef6d1b2 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1160,18 +1160,15 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
 	disable_irq(gi2c->irq);
-	ret = geni_se_resources_off(&gi2c->se);
+
+	ret = geni_se_resources_deactivate(&gi2c->se);
 	if (ret) {
 		enable_irq(gi2c->irq);
 		return ret;
-
-	} else {
-		gi2c->suspended = 1;
 	}
 
-	clk_disable_unprepare(gi2c->se.core_clk);
-
-	return geni_icc_disable(&gi2c->se);
+	gi2c->suspended = 1;
+	return ret;
 }
 
 static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
@@ -1179,28 +1176,13 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 	int ret;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
-	ret = geni_icc_enable(&gi2c->se);
+	ret = geni_se_resources_activate(&gi2c->se);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(gi2c->se.core_clk);
-	if (ret)
-		goto out_icc_disable;
-
-	ret = geni_se_resources_on(&gi2c->se);
-	if (ret)
-		goto out_clk_disable;
-
 	enable_irq(gi2c->irq);
 	gi2c->suspended = 0;
 
-	return 0;
-
-out_clk_disable:
-	clk_disable_unprepare(gi2c->se.core_clk);
-out_icc_disable:
-	geni_icc_disable(&gi2c->se);
-
 	return ret;
 }
 
-- 
2.34.1


