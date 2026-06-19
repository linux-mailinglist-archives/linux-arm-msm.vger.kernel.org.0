Return-Path: <linux-arm-msm+bounces-113875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ae3uEw2pNWp82gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 22:39:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD0B6A7AC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 22:39:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hdyQmJBc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V5f8J4fd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113875-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113875-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 569C53007B93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 20:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701B63AA1A8;
	Fri, 19 Jun 2026 20:39:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EC018027
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 20:39:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781901579; cv=none; b=cMdfGzmUaSiFXbO4gtu7K6IYWhQXT6Qw6mSULq7LbQ0j+Zn0i+dUmwYhMNzPT2slv8BWU+6pmenuGS6Xr1OxG5D7Cwiw3Us6vLjVS716jwKeVaUrh3RxvCu+p1IPaLVuNVVNwC7WpsZwydObuvwfi9/S1EzYnrh7mlQPgtqkEfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781901579; c=relaxed/simple;
	bh=MGDTViq/25fSLrHp46gVaSl4IeeT/JT5BWra4wXc6iU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qQ4QOPZKiJ1HP0MrGCJx5ytmZHRgpWnnEFwcYfH5iajMM84O18FeUDDGluX9aqM6x1Ihvy0WVFCM1aQnlzZlDCqFumTbUBKF/XjnAKbu7KG9jy3TrwJf6WrUgvY9NSKQ8/fBRbJ/Y0ZcVjXUjOROqaPbSUix3Yxp3aVv35mkGEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hdyQmJBc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V5f8J4fd; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JHVc2k1120594
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 20:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BJ7zWh7sdhplied8aSuinwx8WP+FgR0RoqWaQeEZthw=; b=hdyQmJBcExCMoZMQ
	ig5LJl1Kfg3DrF/rK9j60dFM9AF41ubw6KCC3Ziz7r5ER7akT4mgy/5Xu+l+CtTR
	uqMBs+V/xOBiiQwzD0YdZjaJgOCe3zwqMpRfXxPOGkCMTUrBoYsiXcwvdeKwA+T8
	URDSNi6IL61iRjykmOI204mh5Wyrh4B7ZuuzVALquA5qfEMjsnu/y8yMCkO+jdP9
	JCPZNfGWLJwOcTGSG5NMS0PHW6EKPxixYsEUmo9pVceuenw9oo0YJJaFngFY/jXb
	C2pqQOPwLWvBUJ3JoBuuf5usR3YNZVRYjg7LOiUveugMHIt2TXATNywikCNWjeBA
	y8sH3w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evpyuvm8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 20:39:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84245e2bb00so2222884b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 13:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781901575; x=1782506375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJ7zWh7sdhplied8aSuinwx8WP+FgR0RoqWaQeEZthw=;
        b=V5f8J4fdE4lbtsbewKFn8grSnZvR+scs6Dk9dB2nKcqDafG2TSwaosTzgcl0wqxmyN
         Tgvgv/S062xwrZa8c2GEG75FJxtgF8GkLXgDsMzOZWFnHib1WZPg7cre3Ca8Cn4vxs6I
         B3DaljCSHu9i//aXSh5Fuh4uEztmweGkNR10Uw5gzkjwtY8xpZAh/dGDUh+zHs4BDIAG
         UAsCTUw9l/LfS8yHdrmo1yDzn3vQXuSBQmdOBw6vVsAj0viKvlKMvyPzblWQPj9cU7xy
         CNyoet25u2EcY1fIWx3dy6QJ0AjXXojfj4gowUU28SHXrciE9fQaMUo+zC7Dpws6BeZ1
         MSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781901575; x=1782506375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BJ7zWh7sdhplied8aSuinwx8WP+FgR0RoqWaQeEZthw=;
        b=rAq/ABI0TTG81kodlquSKmxtnVeNnSbDlGfUPUZ/y/Uks10vpbSh4dhruEqBX/6J7c
         u1bbb/At8yFjTXNF4CjwRYvW0veXAxTJ/lQzm3PoqjQ2k91oSzPHLnckKvkBmTbngOcg
         /PXlJraTL5GF5EbLH9XAtfcAPpFYdglY6HQ3rLnYzuc4tmYu9V09e0O8GQWG0vrpdsmT
         zpq+i/b8O/fYQa+jUWoIQd/yY1rg0aFw1LoWgoO+viWdE1sJNPLxCSdKzqDUX3vP5oDj
         8MtwSfcPzufowdEzQq2/PgpECPhJh1KtMKmASniINcfxxBOLA+tjt0LG9T0Z+thSp34b
         uRmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8umAp0i/TamWz+/MvtmBnPzbZYA8eFoYVlzxnZGr3bZtMzCseGmApGYLWLjBmjNGEwjzkDmBaTywV8whMY@vger.kernel.org
X-Gm-Message-State: AOJu0YxQA+YeL12JipktFalnYVmNdlmSAXQPhc3IWmGLLjCYBsuCxn1H
	P8yw8szOkhUcmZz5qEpuMfwNiP0NLdb7DT2S04AicM/0+J44/7lUYLwLc7ef9oQ0GToj05GRXBv
	FSTEjFQQ13PZKQbetmHhxQy7iEJi5yeogzKlPqZAZPZ/IDfLPI8FAAUQaI8E4MkfhufME
X-Gm-Gg: AfdE7clDyvW4N0EjhPvUv//bivxv6krPDUYxMLLBKUicviv8macDGRRPdKNgbgG1ogF
	DhxqWls443qboM3Oj2TWekyxOeal/nAFrsfRV5qdu4EpPI6wDMT3wXAzTq01Ai4kB8w8U9451/A
	BecWniDuiIqZp2FK+HK2ILg5PAwOFDhyLRVWd7+k8Ycf3U1S4tNXAreTB605jhnxOYV/Z8WXlQz
	zvtojWi8CTHr9flvyoUiVqiUO/el56jW2OI77Ff7qXNg2j8g4gSAZXpmt7cLX2n4u1wun/dLXTu
	owBzln6nGqyQPsERHSfinXu1RHpwKqTqc+eJlPbiq4idfnAIX7ND9NjHRjLlNvge4gYPlZEfUhP
	hYntxRqPNkLcD1K6gUxY3XNt8C5rcyO0bWPP81iObR2Bu0Q==
X-Received: by 2002:a05:6a00:3405:b0:841:edb9:4ea2 with SMTP id d2e1a72fcca58-8455089f74dmr5372227b3a.32.1781901574921;
        Fri, 19 Jun 2026 13:39:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:3405:b0:841:edb9:4ea2 with SMTP id d2e1a72fcca58-8455089f74dmr5372191b3a.32.1781901574255;
        Fri, 19 Jun 2026 13:39:34 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ecd779sm94190b3a.53.2026.06.19.13.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 13:39:33 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Sat, 20 Jun 2026 02:09:09 +0530
Subject: [PATCH v2 2/3] powercap: qcom: Add SPEL powercap driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260620-qcom_spel_driver_upstream-v2-2-a3ee6837c18f@oss.qualcomm.com>
References: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
In-Reply-To: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781901560; l=23176;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=MGDTViq/25fSLrHp46gVaSl4IeeT/JT5BWra4wXc6iU=;
 b=P2/0DYlHLnXDxfy6gQTPV+YBts+zN+ErOLp2XGtzr6NH/5xWn/n0Kp1KWRbtd4aV5WDKbq14L
 57nXW5YawtcAVfnSS2+57fb+q5KHX+hu6kTYilln5enSxjn/778hDhB
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE5OCBTYWx0ZWRfX4DP2cw7gdFKb
 QYXqQpFT8zzhyr8mMNYAGP/JVWLO72YKg/+O9xVimoY3juimC28CNxEETImv/77VvdOAT6JDKbZ
 52+xsDwlbBQHiLM2gPMF5RkwivUrl44=
X-Proofpoint-GUID: ymSjEEyGTG7UnAO6gyrwrS9TngC6FQtW
X-Proofpoint-ORIG-GUID: ymSjEEyGTG7UnAO6gyrwrS9TngC6FQtW
X-Authority-Analysis: v=2.4 cv=cY3iaHDM c=1 sm=1 tr=0 ts=6a35a908 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Zt0GjZiXUZBacOngTVwA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE5OCBTYWx0ZWRfXzRrLVxhSYMdh
 kOdKCEs/Ev4DCLnxd18WvdjJz4273boADCRKPMpD/vyzqXiBimmd2iB1LO5EihGke1B41NVduXB
 1a+bUuHVmXJybwGp+uQPcSCKq73OiEa1Q7xC8Z9Tf3Y1JKhK5hDHSWWovjgq7+0234cpnl/h2Ct
 v12AasrUW9SbUCmI29HD62UTmTZoQxwJcMZARF2thEko7vwt8tshPx9hcJK72UnPaeQW3aZxbPv
 ErYF2VJvUTySFy0amDsOorH4KA/kZ14tQYZnEVIheyow/SrwSrYt/AnCOY3PfJKMUWj9wdLLl/F
 NRS51I1zKxQWmasNpTs4GTVODFybr7zrumDwYPNFimbQsSw3tGdvpk6uS8urKpg7KOCGgpEpbDA
 SiVzoq+VPkwizzYMxKXDYhr0EJOt7dwCODipETBC4McIfnhrks47ch29yDOUbDHaB9SneTmXSbF
 +DqAt75poGnpitqRIDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190198
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113875-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDD0B6A7AC7

The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
based power monitoring and limiting capabilities for various power
domains including System, SoC, CPU clusters, GPU, and various other
subsystems.

The driver integrates with the Linux powercap framework, exposing SPEL
capabilities through powercap sysfs interfaces.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 MAINTAINERS                  |   1 +
 drivers/powercap/Kconfig     |  13 +
 drivers/powercap/Makefile    |   1 +
 drivers/powercap/qcom_spel.c | 776 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 791 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c63f147e8c54..5c7542754ab6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22238,6 +22238,7 @@ M:	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
+F:	drivers/powercap/qcom_spel.c
 
 QUALCOMM PPE DRIVER
 M:	Luo Jie <quic_luoj@quicinc.com>
diff --git a/drivers/powercap/Kconfig b/drivers/powercap/Kconfig
index 03c4c796d993..e3a47c653499 100644
--- a/drivers/powercap/Kconfig
+++ b/drivers/powercap/Kconfig
@@ -93,4 +93,17 @@ config DTPM_DEVFREQ
 	help
 	  This enables support for device power limitation based on
 	  energy model.
+
+config QCOM_SPEL
+	tristate "Qualcomm SPEL Powercap driver"
+	depends on ARM64 || COMPILE_TEST
+	help
+	  This enables support for the Qualcomm SoC Power and Electrical
+	  Limits (SPEL) hardware, which allows power limits to be
+	  enforced and monitored on Qualcomm SoCs.
+
+	  SPEL provides energy monitoring and power capping for multiple
+	  domains including system, SoC, CPU clusters, GPU, and various
+	  other subsystems.
+
 endif
diff --git a/drivers/powercap/Makefile b/drivers/powercap/Makefile
index 5ab0dce565b9..8235fb9d3df6 100644
--- a/drivers/powercap/Makefile
+++ b/drivers/powercap/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_INTEL_RAPL) += intel_rapl_msr.o
 obj-$(CONFIG_INTEL_RAPL_TPMI) += intel_rapl_tpmi.o
 obj-$(CONFIG_IDLE_INJECT) += idle_inject.o
 obj-$(CONFIG_ARM_SCMI_POWERCAP) += arm_scmi_powercap.o
+obj-$(CONFIG_QCOM_SPEL) += qcom_spel.o
diff --git a/drivers/powercap/qcom_spel.c b/drivers/powercap/qcom_spel.c
new file mode 100644
index 000000000000..4dd91cf36ccc
--- /dev/null
+++ b/drivers/powercap/qcom_spel.c
@@ -0,0 +1,776 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Qualcomm SPEL (SoC Power and Electrical Limits) Driver
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/powercap.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+/* SPEL register bitmasks */
+#define ENERGY_STATUS_MASK		GENMASK(31, 0)
+
+#define POWER_LIMIT_MASK		GENMASK(14, 0)
+#define POWER_LIMIT_ENABLE		BIT(31)
+
+#define TIME_WINDOW_MASK_L		GENMASK(14, 0)
+#define TIME_WINDOW_MASK_H		GENMASK(22, 16)
+#define TIME_WINDOW_MAX			((FIELD_MAX(TIME_WINDOW_MASK_H) << 15) | \
+					 FIELD_MAX(TIME_WINDOW_MASK_L))
+
+#define ENERGY_UNIT_MASK		GENMASK(19, 16)
+#define TIME_UNIT_MASK			GENMASK(11, 8)
+#define POWER_UNIT_MASK			GENMASK(2, 0)
+
+#define LIMITS_CAPABILITY_OFFSET	0x20
+#define ENERGY_RPT_UNIT_OFFSET		0x04
+
+#define ENERGY_UNIT_SCALE		1000
+
+#define SPEL_DOMAIN_NAME_LENGTH		16
+
+/* Domain types */
+enum spel_domain_type {
+	SPEL_DOMAIN_SYS,
+	SPEL_DOMAIN_SOC,
+	SPEL_DOMAIN_CL0,
+	SPEL_DOMAIN_CL1,
+	SPEL_DOMAIN_CL2,
+	SPEL_DOMAIN_IGPU,
+	SPEL_DOMAIN_DGPU,
+	SPEL_DOMAIN_NSP,
+	SPEL_DOMAIN_MMCX,
+	SPEL_DOMAIN_INFRA,
+	SPEL_DOMAIN_DRAM,
+	SPEL_DOMAIN_MDM,
+	SPEL_DOMAIN_WLAN,
+	SPEL_DOMAIN_USB1,
+	SPEL_DOMAIN_USB2,
+	SPEL_DOMAIN_USB3,
+	SPEL_DOMAIN_MAX,
+};
+
+/* Power limit IDs */
+enum spel_power_limit_id {
+	POWER_LIMIT1,
+	POWER_LIMIT2,
+	POWER_LIMIT3,
+	POWER_LIMIT4,
+	POWER_LIMITS_MAX,
+};
+
+/* Unit types for conversion */
+enum unit_type {
+	POWER_UNIT,
+	ENERGY_UNIT,
+	TIME_UNIT,
+};
+
+/* Power limit operation types */
+enum pl_ops_type {
+	PL_LIMIT,
+	PL_TIME_WINDOW,
+};
+
+static const char * const pl_names[] = {
+	[POWER_LIMIT1] = "pl1",
+	[POWER_LIMIT2] = "pl2",
+	[POWER_LIMIT3] = "pl3",
+	[POWER_LIMIT4] = "pl4",
+};
+
+/**
+ * struct spel_domain_info - Domain configuration
+ * @name:	Domain name
+ * @offset:	Register offset in node base
+ */
+struct spel_domain_info {
+	const char *name;
+	u32 offset;
+};
+
+/* Domain configuration */
+static const struct spel_domain_info domain_info[SPEL_DOMAIN_MAX] = {
+	[SPEL_DOMAIN_SYS]	= { "sys", 0x40 },
+	[SPEL_DOMAIN_SOC]	= { "soc", 0x00 },
+	[SPEL_DOMAIN_CL0]	= { "cl0", 0x5c },
+	[SPEL_DOMAIN_CL1]	= { "cl1", 0x60 },
+	[SPEL_DOMAIN_CL2]	= { "cl2", 0x64 },
+	[SPEL_DOMAIN_IGPU]	= { "igpu", 0x08 },
+	[SPEL_DOMAIN_DGPU]	= { "dgpu", 0x44 },
+	[SPEL_DOMAIN_NSP]	= { "nsp", 0x0c },
+	[SPEL_DOMAIN_MMCX]	= { "mmcx", 0x10 },
+	[SPEL_DOMAIN_INFRA]	= { "infra", 0x18 },
+	[SPEL_DOMAIN_DRAM]	= { "dram", 0x1c },
+	[SPEL_DOMAIN_MDM]	= { "mdm", 0x48 },
+	[SPEL_DOMAIN_WLAN]	= { "wlan", 0x4c },
+	[SPEL_DOMAIN_USB1]	= { "usb1", 0x50 },
+	[SPEL_DOMAIN_USB2]	= { "usb2", 0x54 },
+	[SPEL_DOMAIN_USB3]	= { "usb3", 0x58 },
+};
+
+/**
+ * struct spel_constraint_info - Power limit constraint information
+ * @limit_offset:	Register offset for power limit value
+ * @time_window_offset:	Register offset for time window
+ * @supported_mask:	Bit mask in capability register
+ * @domain_id:		Domain this constraint applies to
+ * @pl_id:		Power limit ID (PL1, PL2, etc.)
+ */
+struct spel_constraint_info {
+	u32 limit_offset;
+	u32 time_window_offset;
+	u32 supported_mask;
+	enum spel_domain_type domain_id;
+	int pl_id;
+};
+
+/* Constraint configuration */
+static const struct spel_constraint_info constraints[] = {
+	/* SYS domain constraints */
+	{ 0x10, 0x70, BIT(0), SPEL_DOMAIN_SYS, POWER_LIMIT1 },
+	{ 0x14, 0x74, BIT(1), SPEL_DOMAIN_SYS, POWER_LIMIT2 },
+	{ 0x18, 0x78, BIT(2), SPEL_DOMAIN_SYS, POWER_LIMIT3 },
+	{ 0x1c, 0x7c, BIT(3), SPEL_DOMAIN_SYS, POWER_LIMIT4 },
+	/* SoC domain constraints */
+	{ 0x00, 0x60, BIT(4), SPEL_DOMAIN_SOC, POWER_LIMIT1 },
+	{ 0x04, 0x64, BIT(5), SPEL_DOMAIN_SOC, POWER_LIMIT2 },
+	{ 0x08, 0x68, BIT(6), SPEL_DOMAIN_SOC, POWER_LIMIT3 },
+	{ 0x0c, 0x6c, BIT(7), SPEL_DOMAIN_SOC, POWER_LIMIT4 },
+};
+
+/**
+ * struct spel_domain - SPEL power domain
+ * @power_zone:		Powercap zone
+ * @lock:		Mutex protecting register access
+ * @sp:			Parent sys domain
+ * @status_reg:		Energy counter register
+ * @name:		Domain name
+ * @id:			Domain type ID
+ */
+struct spel_domain {
+	struct powercap_zone power_zone;
+	struct mutex lock; /* Protects register read/write operations */
+	void *sp;
+	void __iomem *status_reg;
+	char name[SPEL_DOMAIN_NAME_LENGTH];
+	enum spel_domain_type id;
+};
+
+/**
+ * struct spel_system -	SPEL system
+ * @domains:		Array of domains
+ * @power_zone:		Parent powercap zone
+ * @node_base:		Base address for node registers
+ * @constraint_base:	Base address for constraint registers
+ * @config_base:	Base address for config registers
+ * @control_type:	Powercap control type
+ * @dev:		Device pointer for logging
+ * @limits:		Supported power limits per domain
+ * @power_unit:		Power unit in microWatts (common for all domains)
+ * @energy_unit:	Energy unit in nanoJoules (common for all domains)
+ * @time_unit:		Time unit in microseconds (common for all domains)
+ */
+struct spel_system {
+	struct spel_domain *domains;
+	struct powercap_zone *power_zone;
+	void __iomem *node_base;
+	void __iomem *constraint_base;
+	void __iomem *config_base;
+	struct powercap_control_type *control_type;
+	struct device *dev;
+	int limits[SPEL_DOMAIN_MAX];
+	unsigned int power_unit;
+	unsigned int energy_unit;
+	unsigned int time_unit;
+};
+
+#define power_zone_to_spel_domain(_zone) \
+	container_of(_zone, struct spel_domain, power_zone)
+
+static bool is_pl_valid(struct spel_domain *sd, int pl)
+{
+	struct spel_system *sp = sd->sp;
+
+	return !!(sp->limits[sd->id] & BIT(pl));
+}
+
+static int get_pl_ops_offset(struct spel_domain *sd, int pl, enum pl_ops_type pl_op)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(constraints); i++) {
+		const struct spel_constraint_info *ci = &constraints[i];
+
+		if (ci->domain_id == sd->id && ci->pl_id == pl) {
+			switch (pl_op) {
+			case PL_LIMIT:
+				return ci->limit_offset;
+			case PL_TIME_WINDOW:
+				return ci->time_window_offset;
+			default:
+				return -EOPNOTSUPP;
+			}
+		}
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static u64 spel_unit_xlate(struct spel_domain *sd, enum unit_type type,
+			   u64 value, int to_raw)
+{
+	struct spel_system *sp = sd->sp;
+	u64 units, scale;
+
+	switch (type) {
+	case POWER_UNIT:
+		units = sp->power_unit;
+		scale = 1;
+		break;
+	case ENERGY_UNIT:
+		units = sp->energy_unit;
+		scale = ENERGY_UNIT_SCALE;
+		break;
+	case TIME_UNIT:
+		units = sp->time_unit;
+		scale = 1;
+		break;
+	default:
+		return value;
+	}
+
+	if (to_raw)
+		return DIV_ROUND_CLOSEST_ULL(value * scale, units);
+
+	value *= units;
+	return div64_u64(value, scale);
+}
+
+static int spel_read_pl_data(struct spel_domain *sd, int pl,
+			     enum pl_ops_type pl_op, bool xlate, u64 *data)
+{
+	struct spel_system *sp = sd->sp;
+	void __iomem *reg_addr;
+	u64 value;
+	int offset;
+
+	if (!is_pl_valid(sd, pl))
+		return -EINVAL;
+
+	offset = get_pl_ops_offset(sd, pl, pl_op);
+	if (offset < 0)
+		return offset;
+
+	guard(mutex)(&sd->lock);
+
+	reg_addr = sp->constraint_base + offset;
+	value = readl(reg_addr);
+
+	switch (pl_op) {
+	case PL_LIMIT:
+		value = FIELD_GET(POWER_LIMIT_MASK, value);
+		if (xlate)
+			*data = spel_unit_xlate(sd, POWER_UNIT, value, 0);
+		else
+			*data = value;
+		break;
+	case PL_TIME_WINDOW:
+		/* Decode time window: bits [22:16] are upper 7 bits, [14:0] are lower 15 bits */
+		value = (FIELD_GET(TIME_WINDOW_MASK_H, value) << 15) |
+			FIELD_GET(TIME_WINDOW_MASK_L, value);
+		if (xlate)
+			*data = spel_unit_xlate(sd, TIME_UNIT, value, 0);
+		else
+			*data = value;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int spel_write_pl_data(struct spel_domain *sd, int pl,
+			      enum pl_ops_type pl_op, unsigned long long value)
+{
+	struct spel_system *sp = sd->sp;
+	void __iomem *reg_addr;
+	u64 reg_val, new_val;
+	int offset;
+
+	if (!is_pl_valid(sd, pl))
+		return -EINVAL;
+
+	offset = get_pl_ops_offset(sd, pl, pl_op);
+	if (offset < 0)
+		return offset;
+
+	guard(mutex)(&sd->lock);
+
+	reg_addr = sp->constraint_base + offset;
+	reg_val = readl(reg_addr);
+
+	switch (pl_op) {
+	case PL_LIMIT:
+		new_val = spel_unit_xlate(sd, POWER_UNIT, value, 1);
+		if (new_val > FIELD_MAX(POWER_LIMIT_MASK))
+			return -EINVAL;
+		reg_val = (reg_val & ~POWER_LIMIT_MASK) | FIELD_PREP(POWER_LIMIT_MASK, new_val);
+
+		/*
+		 * Enable/Disable PL based on the value:
+		 * - If value is 0, disable the PL (clear enable bit)
+		 * - If value is non-zero, enable the PL (set enable bit)
+		 */
+		if (new_val == 0)
+			reg_val &= ~POWER_LIMIT_ENABLE;
+		else
+			reg_val |= POWER_LIMIT_ENABLE;
+
+		writel(reg_val, reg_addr);
+		return 0;
+
+	case PL_TIME_WINDOW:
+		/*
+		 * Encode time window: upper 7 bits to [22:16], lower 15 bits to [14:0]
+		 */
+		new_val = spel_unit_xlate(sd, TIME_UNIT, value, 1);
+		if (new_val > TIME_WINDOW_MAX)
+			return -EINVAL;
+		/* Read-modify-write to preserve other bits */
+		reg_val = (reg_val & ~(TIME_WINDOW_MASK_H | TIME_WINDOW_MASK_L)) |
+			  FIELD_PREP(TIME_WINDOW_MASK_H, new_val >> 15) |
+			  FIELD_PREP(TIME_WINDOW_MASK_L, new_val);
+		writel(reg_val, reg_addr);
+
+		/*
+		 * Time window register update doesn't trigger firmware interrupt.
+		 * Write to the PL register with current value to trigger the interrupt.
+		 */
+		offset = get_pl_ops_offset(sd, pl, PL_LIMIT);
+		if (offset >= 0) {
+			reg_addr = sp->constraint_base + offset;
+			reg_val = readl(reg_addr);
+			writel(reg_val, reg_addr);
+		}
+		return 0;
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int spel_get_energy_counter(struct powercap_zone *power_zone, u64 *energy_raw)
+{
+	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
+	u64 value;
+
+	value = readl(sd->status_reg);
+
+	*energy_raw = spel_unit_xlate(sd, ENERGY_UNIT, value, 0);
+
+	return 0;
+}
+
+static int spel_get_max_energy_counter(struct powercap_zone *pcd_dev, u64 *energy)
+{
+	struct spel_domain *sd = power_zone_to_spel_domain(pcd_dev);
+
+	*energy = spel_unit_xlate(sd, ENERGY_UNIT, ENERGY_STATUS_MASK, 0);
+
+	return 0;
+}
+
+static int spel_release_zone(struct powercap_zone *power_zone)
+{
+	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
+	struct spel_system *sp = sd->sp;
+
+	/* Free the domains array when the last zone (SYS domain) is released */
+	if (sd->id == SPEL_DOMAIN_SYS)
+		kfree(sp->domains);
+
+	return 0;
+}
+
+static int spel_find_nr_power_limit(struct spel_domain *sd)
+{
+	int i, nr_pl = 0;
+
+	for (i = 0; i < ARRAY_SIZE(pl_names); i++) {
+		if (is_pl_valid(sd, i))
+			nr_pl++;
+	}
+
+	return nr_pl;
+}
+
+static const struct powercap_zone_ops zone_ops = {
+	.get_energy_uj = spel_get_energy_counter,
+	.get_max_energy_range_uj = spel_get_max_energy_counter,
+	.release = spel_release_zone,
+};
+
+static int spel_constraint_to_pl(struct spel_domain *sd, int cid)
+{
+	int i, id;
+
+	for (i = 0, id = 0; i < ARRAY_SIZE(pl_names); i++) {
+		if (is_pl_valid(sd, i) && id++ == cid)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static int spel_set_power_limit(struct powercap_zone *power_zone, int cid,
+				u64 power_limit)
+{
+	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
+	int id;
+
+	id = spel_constraint_to_pl(sd, cid);
+	if (id < 0)
+		return id;
+
+	return spel_write_pl_data(sd, id, PL_LIMIT, power_limit);
+}
+
+static int spel_get_power_limit(struct powercap_zone *power_zone, int cid,
+				u64 *data)
+{
+	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
+	u64 val;
+	int ret, id;
+
+	id = spel_constraint_to_pl(sd, cid);
+	if (id < 0)
+		return id;
+
+	ret = spel_read_pl_data(sd, id, PL_LIMIT, true, &val);
+	if (!ret)
+		*data = val;
+
+	return ret;
+}
+
+static int spel_set_time_window(struct powercap_zone *power_zone, int cid,
+				u64 window)
+{
+	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
+	int id;
+
+	id = spel_constraint_to_pl(sd, cid);
+	if (id < 0)
+		return id;
+
+	return spel_write_pl_data(sd, id, PL_TIME_WINDOW, window);
+}
+
+static int spel_get_time_window(struct powercap_zone *power_zone, int cid,
+				u64 *data)
+{
+	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
+	u64 val;
+	int ret, id;
+
+	id = spel_constraint_to_pl(sd, cid);
+	if (id < 0)
+		return id;
+
+	ret = spel_read_pl_data(sd, id, PL_TIME_WINDOW, true, &val);
+	if (!ret)
+		*data = val;
+
+	return ret;
+}
+
+static const char *spel_get_constraint_name(struct powercap_zone *power_zone,
+					    int cid)
+{
+	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
+	int id;
+
+	id = spel_constraint_to_pl(sd, cid);
+	if (id >= 0 && id < ARRAY_SIZE(pl_names))
+		return pl_names[id];
+
+	return NULL;
+}
+
+static const struct powercap_zone_constraint_ops constraint_ops = {
+	.set_power_limit_uw = spel_set_power_limit,
+	.get_power_limit_uw = spel_get_power_limit,
+	.set_time_window_us = spel_set_time_window,
+	.get_time_window_us = spel_get_time_window,
+	.get_name = spel_get_constraint_name,
+};
+
+static void spel_init_domains(struct spel_system *sp)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(domain_info); i++) {
+		struct spel_domain *sd = &sp->domains[i];
+
+		sd->sp = sp;
+		snprintf(sd->name, SPEL_DOMAIN_NAME_LENGTH, "%s",
+			 domain_info[i].name);
+		sd->id = i;
+		sd->status_reg = sp->node_base + domain_info[i].offset;
+
+		/* PL1 is always supported (required for powercap registration) */
+		sp->limits[i] = BIT(POWER_LIMIT1);
+	}
+}
+
+static void spel_update_unit(struct spel_system *sp)
+{
+	u32 value, shift;
+
+	/* Read power_unit and time_unit from offset 0x0 */
+	value = readl(sp->config_base);
+
+	/*
+	 * Unit calculation: 1 / (2^shift)
+	 * Masks limit: TIME_UNIT (4 bits, max 15), POWER_UNIT (3 bits, max 7).
+	 */
+	shift = FIELD_GET(POWER_UNIT_MASK, value);
+	sp->power_unit = 1000000 / (1 << shift);
+
+	shift = FIELD_GET(TIME_UNIT_MASK, value);
+	/*
+	 * Time window in register is in milliseconds.
+	 */
+	sp->time_unit = 1000 * (1 << shift);
+
+	/* Read energy_unit from ENERGY_RPT_UNIT_OFFSET */
+	value = readl(sp->config_base + ENERGY_RPT_UNIT_OFFSET);
+
+	/*
+	 * Unit calculation: 1 / (2^shift)
+	 * Masks limit: ENERGY_UNIT (4 bits, max 15).
+	 */
+	shift = FIELD_GET(ENERGY_UNIT_MASK, value);
+	sp->energy_unit = ENERGY_UNIT_SCALE * 1000000 / (1 << shift);
+
+	dev_dbg(sp->dev, "Units: energy=%dnJ, time=%dus, power=%duW\n",
+		sp->energy_unit, sp->time_unit, sp->power_unit);
+}
+
+static void spel_detect_powerlimit(struct spel_domain *sd)
+{
+	struct spel_system *sp = sd->sp;
+	u32 capabilities;
+	int i, j;
+
+	capabilities = readl(sp->config_base + LIMITS_CAPABILITY_OFFSET);
+
+	/*
+	 * Detect power limits from hardware capabilities.
+	 * Start from index 1 (POWER_LIMIT2) since PL1 is always enabled in spel_init_domains().
+	 */
+	for (i = 1; i < ARRAY_SIZE(pl_names); i++) {
+		for (j = 0; j < ARRAY_SIZE(constraints); j++) {
+			const struct spel_constraint_info *ci = &constraints[j];
+
+			if (ci->domain_id == sd->id && ci->pl_id == i) {
+				if (capabilities & ci->supported_mask)
+					sp->limits[sd->id] |= BIT(i);
+				break;
+			}
+		}
+	}
+}
+
+static int spel_init_system(struct spel_system *sp, struct device *dev)
+{
+	int i, ret;
+
+	/* Read unit configuration (common for all domains) */
+	spel_update_unit(sp);
+
+	sp->domains = kcalloc(ARRAY_SIZE(domain_info),
+			      sizeof(struct spel_domain), GFP_KERNEL);
+	if (!sp->domains)
+		return -ENOMEM;
+
+	spel_init_domains(sp);
+
+	for (i = 0; i < ARRAY_SIZE(domain_info); i++) {
+		struct spel_domain *sd = &sp->domains[i];
+
+		ret = devm_mutex_init(dev, &sd->lock);
+		if (ret) {
+			dev_err(dev, "Failed to initialize mutex for domain %s\n", sd->name);
+			kfree(sp->domains);
+			return ret;
+		}
+
+		spel_detect_powerlimit(sd);
+	}
+
+	return 0;
+}
+
+static int spel_register_powercap(struct spel_system *sp)
+{
+	struct spel_domain *sd;
+	struct powercap_zone *power_zone;
+	int nr_pl, ret, i;
+
+	/* Register SYS domain as parent zone */
+	sd = &sp->domains[SPEL_DOMAIN_SYS];
+	nr_pl = spel_find_nr_power_limit(sd);
+
+	power_zone = powercap_register_zone(&sd->power_zone,
+					    sp->control_type, sd->name,
+					    NULL, &zone_ops, nr_pl,
+					    &constraint_ops);
+	if (IS_ERR(power_zone)) {
+		dev_err(sp->dev, "Failed to register power zone %s\n",
+			sd->name);
+		return PTR_ERR(power_zone);
+	}
+	sp->power_zone = power_zone;
+
+	/* Register other domains as children */
+	for (i = 0; i < ARRAY_SIZE(domain_info); i++) {
+		struct powercap_zone *parent;
+
+		if (i == SPEL_DOMAIN_SYS)
+			continue;
+
+		sd = &sp->domains[i];
+
+		/* SOC is child of SYS, others are children of SOC */
+		if (i == SPEL_DOMAIN_SOC)
+			parent = sp->power_zone;
+		else
+			parent = &sp->domains[SPEL_DOMAIN_SOC].power_zone;
+
+		nr_pl = spel_find_nr_power_limit(sd);
+		power_zone = powercap_register_zone(&sd->power_zone,
+						    sp->control_type,
+						    sd->name, parent,
+						    &zone_ops, nr_pl,
+						    &constraint_ops);
+
+		if (IS_ERR(power_zone)) {
+			dev_err(sp->dev, "Failed to register power_zone %s\n",
+				sd->name);
+			ret = PTR_ERR(power_zone);
+			goto err_cleanup;
+		}
+	}
+
+	return 0;
+
+err_cleanup:
+	/* Unregister in reverse order: children first, then SOC, then SYS */
+	for (i = i - 1; i >= 0; i--)
+		powercap_unregister_zone(sp->control_type, &sp->domains[i].power_zone);
+
+	return ret;
+}
+
+static int spel_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct spel_system *sp;
+	int ret;
+
+	sp = devm_kzalloc(dev, sizeof(*sp), GFP_KERNEL);
+	if (!sp)
+		return -ENOMEM;
+
+	sp->dev = dev;
+
+	/* Map config registers (units, capabilities) */
+	sp->config_base = devm_platform_ioremap_resource_byname(pdev, "config");
+	if (IS_ERR(sp->config_base))
+		return PTR_ERR(sp->config_base);
+
+	/* Map constraint registers (power limits) */
+	sp->constraint_base = devm_platform_ioremap_resource_byname(pdev, "constraints");
+	if (IS_ERR(sp->constraint_base))
+		return PTR_ERR(sp->constraint_base);
+
+	/* Map spel domain registers (energy counters) */
+	sp->node_base = devm_platform_ioremap_resource_byname(pdev, "nodes");
+	if (IS_ERR(sp->node_base))
+		return PTR_ERR(sp->node_base);
+
+	sp->control_type = powercap_register_control_type(NULL, "qcom-spel",
+							  NULL);
+	if (IS_ERR(sp->control_type)) {
+		dev_err(dev, "Failed to register control type\n");
+		return PTR_ERR(sp->control_type);
+	}
+
+	/* Initialize system and domains */
+	ret = spel_init_system(sp, dev);
+	if (ret) {
+		dev_err(dev, "Failed to initialize system\n");
+		goto err_unregister_control;
+	}
+
+	ret = spel_register_powercap(sp);
+	if (ret) {
+		dev_err(dev, "Failed to register powercap zones\n");
+		if (!sp->power_zone)
+			kfree(sp->domains);
+		goto err_unregister_control;
+	}
+
+	platform_set_drvdata(pdev, sp);
+
+	return 0;
+
+err_unregister_control:
+	powercap_unregister_control_type(sp->control_type);
+	return ret;
+}
+
+static void spel_remove(struct platform_device *pdev)
+{
+	struct spel_system *sp = platform_get_drvdata(pdev);
+	int i;
+
+	/* Unregister in reverse order: children first, then SOC, then SYS */
+	for (i = ARRAY_SIZE(domain_info) - 1; i >= 0; i--)
+		powercap_unregister_zone(sp->control_type, &sp->domains[i].power_zone);
+
+	powercap_unregister_control_type(sp->control_type);
+}
+
+static const struct of_device_id spel_of_match[] = {
+	{ .compatible = "qcom,glymur-spel" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, spel_of_match);
+
+static struct platform_driver spel_driver = {
+	.probe = spel_probe,
+	.remove = spel_remove,
+	.driver = {
+		.name = "qcom_spel",
+		.of_match_table = spel_of_match,
+	},
+};
+
+module_platform_driver(spel_driver);
+
+MODULE_DESCRIPTION("Qualcomm SPEL Powercap Driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


