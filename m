Return-Path: <linux-arm-msm+bounces-104367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCd/En9Y6mkhxgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 19:35:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ED645592A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 19:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFC8530234E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 17:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5E23A7858;
	Thu, 23 Apr 2026 17:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DDTkaXPc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CscpW3AW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D7B2D97B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 17:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776965754; cv=none; b=LaH9PD1lkxb37Qdk7TxjlfnqlZ/hKl7cYTq7VYMWZwuTJr0Z0ybbw9WVSz/4DhKpgh09Q7BSyH/CsBDPxQJK9GqXUeTrSBO9raf+FFjdt2lDkCUtue6NCa+6zcxFoKKKnHM5Fyi32dY/jHiPa0c0XW5i6lbDxbjtX9sKlXdOA9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776965754; c=relaxed/simple;
	bh=M1bSMEuMwavTkVMlnKwpWhUr8Rc0F8yHb272lSkqvBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MohQfrpXpXKZuTSg4zbBKCcAep+p+7E0j0s055HgF4Dr8/i5DQjBpj6XM1ZjqnJbHUSlPibQ+bL3loAe001gRRr/VR6ShmjB+8BWkLLkQRs1rvy4jTlkXDkLOeyIRi3ijogrJoAmar4JbwMgVw4M01brPQgSpkgORx0cO6J/838=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DDTkaXPc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CscpW3AW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NFr5a4154579
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 17:35:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Sjqdpq7K1sJqnlPifhmO7wc+iVfNkL6W+jn
	jLLcTwoI=; b=DDTkaXPcHW9H7RbxKmHCqoeoItn88LEUCSazFM7o9Cc3/XmX5hv
	K1a6GU5L1sNF9I1Yz84Fpz7hNCgdAcSXBU9yXDmkoOYvY3bxawNq/oJLey0SkyRJ
	OJJgEWoFm4hyHHbDFdbvezvOLGeohxcgEFD4mEiCxGgpguVi4m0IKl74E5oCshoU
	gSShCPPftviUWzaPqKaN3FMcpWepNJeybBAvoyBypaZltiVatYcpJ3XfaCSkp/dl
	L8saTjPIv2MgcMhDzr4gaMcXCm3q5uviuCL2wtnaFWMM5MREZoYujqtojCMfnhWE
	cVZ4uG8JqW+9CO1YJ3u4mC9D6PSpnqmxCiA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqpf60ehw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 17:35:50 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-953cccadb32so8487788241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776965750; x=1777570550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sjqdpq7K1sJqnlPifhmO7wc+iVfNkL6W+jnjLLcTwoI=;
        b=CscpW3AWiq9s/umuwyu/NUYouPyUbZqTVlvFa7Iai9q1A5likgBzSArGCK7G1hW5uX
         n4zO6LuICKPBs+hrQmK2AhU2yBzRdM0P/Sjpa2hb/IKgy8shCff/2AZKk473PbIH0X0G
         l00f9V8V/Y10g9mPvmCgwD+WDygOvjnDFN2jMfXC+X6x34xJq6nTSPFHHuoeMnKPRjYR
         GunFZSXMai4LDnju57Eptzd0Qh7yLgXdTfV+NTZhiD40iaUdM8MyKLWEWQPcEjj5uqF3
         Esm9XT5bxxa+ZwMSj7dp6zmM2yaoPf+mcWqCdgWa5HDw3Hut9VW9zVg4bwX4tNmPHItR
         6sbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776965750; x=1777570550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sjqdpq7K1sJqnlPifhmO7wc+iVfNkL6W+jnjLLcTwoI=;
        b=PA6Sb1aMH2VC5EgVzyYM14zQWNiiXiAwDkLDgoMg3n7D1fK0Xq6x/HxeOtq4HKU/Kf
         xe8BmjJ9mWNwLLsV5f2uj3EJ5z5MjHaRpjuBvyX6c6fhR25HWtPpeOw+AKrptIBMcmeL
         gdWhFFLJrM+p//IVLyTNZKsGeFjRiBX5+0ivl5bwo28D6Gnq7CnOX3u81hDjnNP/pqan
         BN/LOQIui3YicfZCI9w+AB7cN4e/Wv3oaqaEsqzeXKI1aTjdcqS8N0F/CK7cPH23fOez
         5gVOwMBhrYPxdh+oaTgwVm22WzgEWqRI18FfUww9fA2Tb9GHcJ3c/dHzaXxcFh6MUAZ9
         P8oA==
X-Forwarded-Encrypted: i=1; AFNElJ+Mf0zAtQrNUs2s0ddtHc2dCIOMZq05TYANaGUQVWPoLMlTnj6yFi9dzpr4SXNIxlu5Yk9HGtvbB7EDtt3W@vger.kernel.org
X-Gm-Message-State: AOJu0YwS/3hnHCyUufNwbs+ORK24lL8Mufgcpv80RH0DGPyI2iKBqJyo
	oVgmbE3neoAiPdPq2ae6FdDZ2dAEl9zC/eF14tnlvMKrw89Ih4MLRr05eQMlbhHWFvqMAhJipZA
	ca7/lAjiTLplkDadoKb6vi2bZql8MjDP26s8FtPJnI2rYgbAm1eREJfKlDNh6UhV7EiED
X-Gm-Gg: AeBDiet+el1J8pP4dHRxmOfOzYOEzvMgQNU9buUBexHWWVRT1ZN2zSlbZkQS3TagzoF
	gp80/hQEFJePEXe3hHJsfCCTlEc6/0BYpjHS3wVP1huDLe8zTvMR3jOXWhspLkNcKZgOtQZSr6q
	qgzlcqrk7MIfCyPZhiYmOkHi0RuWNGgBCCDt+8ejmN2r6x5beiZRpBKNlIsLMHZSscihEiEA2z/
	jVNKaB5zfwjG+QE51Ca0QaTpSz3agVqfPNH171H9V+6o3UNlL2GBzBNdpWP9YoGVmXauOipmJhz
	glrEtjdnrEVXO7KeBhXB2BY9yANtr+Jpqt6QqPJ558zRRqZbB6cLVPurUsVVXMprtnr0GchWnZt
	cjXoxCsmeKDmZyDsernvtB4up1HCOBU4mMEroCiJPyEiNvVk=
X-Received: by 2002:a05:6102:4426:b0:605:2a07:65e5 with SMTP id ada2fe7eead31-616f67c7eb0mr15148160137.18.1776965750001;
        Thu, 23 Apr 2026 10:35:50 -0700 (PDT)
X-Received: by 2002:a05:6102:4426:b0:605:2a07:65e5 with SMTP id ada2fe7eead31-616f67c7eb0mr15148137137.18.1776965749518;
        Thu, 23 Apr 2026 10:35:49 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e46471sm52632244f8f.28.2026.04.23.10.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 10:35:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] iio: adc: qcom: Unify user-visible "Qualcomm" name
Date: Thu, 23 Apr 2026 19:35:46 +0200
Message-ID: <20260423173545.92271-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=M1bSMEuMwavTkVMlnKwpWhUr8Rc0F8yHb272lSkqvBY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp6lhyXCJEdgeZayHceQTFnLobmrBeyNZAeRjKc
 Gv+5HyEmNmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaepYcgAKCRDBN2bmhouD
 1ylDD/9gEI53VrBLIaLeJ7HYwFdgMm+Rmn2TV2fw0gucfCPtzWKEXx7QVCm/m31SBKOYdYB2nRh
 Ogk90SWtf03c5WVI42PwRbvhnRcpkFTJK6ipu7jq6mkZX+XpWy7/IIkI3hx4txCDU9wm4ZwLo4U
 qzUEyFWovgd8jJXvaOLLH8ZkoF61+WKc5Rw9C6b5yOtsjGHH7rK+yYFusGdfCcoSy02UP0p/2yr
 L5TXeZCJyW1NDpChZF7g5okltIuHHoWTM8bFffVG+LKoEsdQPZ7QkkytTcdaC8YTl09iA+qQTKh
 lGTRAPoES3qBvV10nPE4BkTKkIETFEP26Pz/ieioAwXBc4yX6IRLyyx+p7eKjFJHqHvB66gxz+s
 m8yG+T+eN8E6qW+1O611iIYz3YhPmq7gD7Yvy6kk7/5Z7FFoYuE5m6T0psRcOe2b2yiIU/E/MQP
 C0uZu+Yj6JGITIUYWPz+xmFfu7Nu/f8ydNi/a2PRLjUKvkMSayj0FUoFUWVbPnWBeDAkjraaGtO
 L+wi49fBPe8it6nBon+Dosd1W82JxrVhn330m7R1BWOA5EHyQEZZPv21wf1cK86J5knyQ73nrzc
 +wEhpHU/x1WYwhRzn81gspEwl0Pk3Ks8DQRfgtfvXT7zBaWaesMKZn88zbTxJnr010OW7W5m3Yn UegPWdBPAHKB2KQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Iocutr/g c=1 sm=1 tr=0 ts=69ea5877 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=89dWTnP0534NunzvFJkA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: aiINBZ2iltaIPwzjNpQVPrb48umw-zWJ
X-Proofpoint-GUID: aiINBZ2iltaIPwzjNpQVPrb48umw-zWJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDE3MSBTYWx0ZWRfXwkxo52nbrwQf
 iiWlSkaZfjdpXAph77ARoS9dpercwroI7UjSvD7FWfQecdJswTa6fsYoQaxuebGPFoCFr25+1q4
 8BeosqcZaGvVfplRZOkViHoWJ785SUUZX2Ww7LxWwCcxDcUHpt+DLGlzRvm6TCaF8PlGUWUeTfn
 dvj3tEwOstZpxAn/C75lUKYE9w49R6PglIk5JqHjb8svVW7Jf9Q/KYHhh18/7rK3q9f92aUU8pG
 qsv/em4rpmGFEOBQjEPMSJOwQUvnKB4RUHthxmfB9ASnYU0U6OFFJ/prqFOxyMC/BZHI7Iy/Hfz
 yi8r4Kkxo19YQevB0ZeNILaewSh60oPJUKxSQcPbIrmqTXJtXqCLaTkFjLL1zGhgh6ValjQP3pT
 e98ML2nVx9P/H2t3YuIt8tY3hbW/qrYIdn15fow0bFjluH1AJnIYy11SEwnjdXDsPUjLFbmw+Ah
 7eBI4czitS/Gq3VUtXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230171
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104367-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 83ED645592A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Various names for Qualcomm as a company are used in user-visible config
options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
"Qualcomm" so it will be easier for users to identify the options when
for example running menuconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And "Qualcomm Technologies" has even variations over the tree:
Qualcomm Technologies
Qualcomm Technologies Inc.
Qualcomm Technologies, Inc.

I am doing this tree wide:
https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
---
 drivers/iio/adc/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index a9dedbb8eb46..1115e81ac45b 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1354,7 +1354,7 @@ config QCOM_SPMI_VADC
 	  be called qcom-spmi-vadc.
 
 config QCOM_SPMI_ADC5
-	tristate "Qualcomm Technologies Inc. SPMI PMIC5 ADC"
+	tristate "Qualcomm SPMI PMIC5 ADC"
 	depends on SPMI
 	select REGMAP_SPMI
 	select QCOM_VADC_COMMON
@@ -1374,7 +1374,7 @@ config QCOM_SPMI_ADC5
 	  be called qcom-spmi-adc5.
 
 config QCOM_SPMI_ADC5_GEN3
-	tristate "Qualcomm Technologies Inc. SPMI PMIC5 GEN3 ADC"
+	tristate "Qualcomm SPMI PMIC5 GEN3 ADC"
 	depends on SPMI && THERMAL
 	select REGMAP_SPMI
 	select QCOM_VADC_COMMON
-- 
2.51.0


