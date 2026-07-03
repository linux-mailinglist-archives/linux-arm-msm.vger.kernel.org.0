Return-Path: <linux-arm-msm+bounces-116158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ATiiButDR2oWVAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:08:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A0C6FE958
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:08:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MrHm0D5r;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NHlON5Tm;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116158-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116158-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3ACE330338B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 05:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FB8380FF7;
	Fri,  3 Jul 2026 05:04:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5879435675C
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 05:04:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055068; cv=none; b=Msia2f6VPCXdyLVR6r/9pxdeJVFX+aFT7foE4ERsVP04q7L6UMSP3FaSy2E3aW5a8KHbGw5nCn1O5PNTzrkNYfJwfE/fy+LYmi3JWXwuGVVhnVZ9KneEjEZRBdqXcqrmXHVpSZnwzauBuSt/8JxN+uS3Ov3pC7bwvyOoxKI1C3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055068; c=relaxed/simple;
	bh=YLzzOqexgI2OLB1izWL/2pvG5P3Bot9UTn4BCsjmqe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bqBn+bCyXZ2LMmkueTJrmslvBt8cLBH+AAFwH0M9dSbZ90h0RldwMYpKMxQfh7m+SjbfNDt0jQHCXL0BcSFUdM22PtosQQbmpkb+xs1rQA9QT/1wzju31GXDd58HHR7O1LAHcvczMf9cgx2dCwy3HdAlGtS6TuMLmhQ3TuGHovk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MrHm0D5r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NHlON5Tm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342b6B2687040
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 05:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	styMC/RSg/rxk9wJAUjveP0CR5WBpn1D9q8Ul1nzvgM=; b=MrHm0D5rkrAQOwq7
	X+pVipxIDs1YlnK2Izv4dRp8rrmrYE4P4y3zl4Ve4CH+ojxleU0VY+kBLiXHiID3
	jeaDQGPpUI4c6s7n8USc6L8UV7H2KotLP2cAZSHwBHzhnIgtTKwlyTYMS8wJOukI
	+kLp8A+ewYX9a7hOF3LdMPl87IAtbK6yRKkN2JdMx0UtLrFe7QcvVlXhkXeWYh++
	nR5h6HgexWM5sWQJsC/d7aOaE0Y9lKwIpTK6ee6PAQJBMk7YDkgTigxWQaj5x8tB
	eeym2e0QnuThidzlnj8tFihf9Y4XPUQoY8DBem93n6Wghy9raiW7iNgfR9TaiFqf
	DYQL1Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n0hsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:04:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c825562f8bso3581215ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 22:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055048; x=1783659848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=styMC/RSg/rxk9wJAUjveP0CR5WBpn1D9q8Ul1nzvgM=;
        b=NHlON5TmpAjzz3eVbCMqvOj+BSsEHdu1O3rFZJwuOJ7uiOOdgVfobWXD8SxaKQwvbV
         6RV1WWaFOn93DLeWbmriY4PQQEQXGsj9RaHDQTmCIOk2y9EPlFLNSwR5jRNfQZ88dvVk
         mPB5huv12TljrovnrKWK3V9G+ih5N8/aeWPSf/Uv8MGZRQ9Cy6xVbkEqmMlPWFdasEBV
         odkV976LqneBQ4dbMU8oP6FUHC81K7gDEsc1wvthsY7F4ryIVPK1y5q7q2QgVoShO4yt
         aDmvzBisKg9cG2PGSdWgWNLHz+YwaU2nEhScCs2p5x/0QAFgDlAshi+BMyhwnaNrTqaw
         DkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055048; x=1783659848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=styMC/RSg/rxk9wJAUjveP0CR5WBpn1D9q8Ul1nzvgM=;
        b=i1Wa0IUis1hZxT3yldmGYOwHsY8dcDpSkn6Is/8AGpzfGIHiIL/hnjD+PqBa1kDaM/
         wMclV6XR0VGAAiUBnCHthvq864ODmGF9tiruepefoJb5cheZ6N82Zc5YV4E+qKArfoRq
         JAYH15qss10Gc9TbLV2dAk9rmxkybHHv1wHORgaIclKybzzeE9QfG8/rfmL4/bXnLwA5
         OzPAATeaInZx2Ocb1roUxBfdh/bMowKn8kwoSNM2WO2jJR8DeCMrKxfofQh8GM5vzv9i
         edPI42jupwMtblBzqF55zSHKH5Si2MejOYKhsf8qccT+WCRoJoanhAYpbanxYh+9sWcy
         XNdw==
X-Gm-Message-State: AOJu0YzWt2t0U20uaGs+r7BilHAxigcJb1avcn1Et3fZ0C47RLHoEaLL
	B1lbZ5MzCvNn4bZQ+/YOKGgwuHnsma6JD5lkMfCW5H3J05YLZJxh+qN9zZQb12MLhlUETnvrY/X
	he9VH+QrZt1bE5cTX8s+NpPv0m+R2ViN5JfzIFk/NQl+wU3xCyHmVk1ZUaoUTdEgJT3+h
X-Gm-Gg: AfdE7ckN7kJkdYCw81SPtPL++DnlvOyMsU8e//czNqNq5//wIeAs4hDMYD5HJc2wkdW
	fTc8j3zSrzytmTTcmt0ydTuuHhFoi00w/XbNbF2Va+B5I9Ev7ND1UgY2an4poM3vlkrFmlftZm8
	/2ygnuTeE+ouE6W9pXGt3c32/RTB+RiUWIVbqKj/vJfKZX4KzgMp/ykH8hrEUWXlVITmyrsYbZp
	NqaehHtMZ/iFmIS9V+W3ptdf9g86/jll5sC0UK1DZqWL5igu6N741tKVgKMcmII18ILpWNnZpH7
	KNWEwIKdpKv2s+6nXrbDHzd3pNBuvxe8JMG+1coSYHqI1IeXd6dBGSwkZBWDFey9Yxm6yHifFrK
	M7UayhP/mCru0NFjmW4PATBemw31WnX/4nQztnAfM
X-Received: by 2002:a05:6a21:1b84:b0:398:9b42:69f7 with SMTP id adf61e73a8af0-3bfed3b19b0mr11022079637.39.1783055048158;
        Thu, 02 Jul 2026 22:04:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b84:b0:398:9b42:69f7 with SMTP id adf61e73a8af0-3bfed3b19b0mr11022032637.39.1783055047655;
        Thu, 02 Jul 2026 22:04:07 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd2362sm16771941eec.20.2026.07.02.22.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:04:07 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:07 +0530
Subject: [PATCH v4 04/10] remoteproc: qcom: pas: add support for TMD
 thermal cooling devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qmi-tmd-v4-4-3882189c1f83@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
In-Reply-To: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783055015; l=5135;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=YLzzOqexgI2OLB1izWL/2pvG5P3Bot9UTn4BCsjmqe4=;
 b=YvqhK7JA8HM8KLaZwwbl8HmRXjMNiXwabJxM3FFxhuxfhoFMyNsz8aacsGcqMcwmDPZdYfbxo
 Yhi/6zZ6v6JBFaxFyyFu/mXMB2GnNHvMVK5VQXVdzCmxMg4sF++uyGO
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX5GQwiJRjOvOv
 BDmegEK/CODzt9gjgcFV/hF+eGD7P8C2JmStwGmWjZoFrSP9lEsgAUwc0KEHbOCUUAWoLE4CETs
 YqR9Cs5mg9dAp90kkv5svA+YP0hN518=
X-Proofpoint-ORIG-GUID: dw8RANlQCs7zyaFMNx5AAGg3ZL0fBcS-
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a4742c9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JsyU97BMdJ6RvXteW0AA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: dw8RANlQCs7zyaFMNx5AAGg3ZL0fBcS-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX9yPIJJ8Vq3B7
 E8ciuPVTR4B85BVOzeMuUGQ0Z3a/iY0y84rjKN6dpHCjKn1qXsCzTVyQmYm+JdmUVU1sGi1hzTQ
 Z2V0VRpwnWwGthM+UvrDSra1SP1WComMQqoG+UW65ZzLwvkb2QhTCe8VJ6L4c4kS2YHzMw4Ah5d
 uxtxB2gOqoOr2FtqUSR4R8vmO62B+CoeWJ754Ec22vDhGH7B6JL3KqLLOlBgqj0NgvMDNuufmGg
 vUShemG4Uu8MhSfO5brtbrxTE0UF07e0/NFNgvJnd8pMnXgE6tnH6kxCycje9lM45vdnlZGx0W2
 BFu/ErjslCNhUcNNkzF6uVdjXyd6xh/jU9k/WODbiFfssOlqcPiKjH8vvVoeWhrFj8Sq7xmOqmw
 ljSX9cZR1NlMlMINLfUKo2UKnnQGdhc0bKP7gQvct9Dx67IDY3WzJg7Io5QS3cl0zgVHw56EjEB
 RUUw4biaYeKqEo+VVwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116158-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1A0C6FE958

Register Thermal Mitigation Devices (TMDs) for PAS-managed remote
processors to enable thermal throttling through QMI.

This allows the thermal framework to request mitigation when remote
subsystems such as modem and CDSP contribute to thermal pressure.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 drivers/remoteproc/Kconfig         |  1 +
 drivers/remoteproc/qcom_q6v5_pas.c | 93 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index c78e431b7b2d..cd8cc911e1be 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -228,6 +228,7 @@ config QCOM_Q6V5_PAS
 	select QCOM_PIL_INFO
 	select QCOM_MDT_LOADER
 	select QCOM_Q6V5_COMMON
+	select QCOM_QMI_TMD
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
 	help
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..ab5bcccc91a6 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2016 Linaro Ltd
  * Copyright (C) 2014 Sony Mobile Communications AB
  * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk.h>
@@ -24,8 +25,10 @@
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/qmi_tmd.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
+#include <dt-bindings/firmware/qcom,qmi-tmd.h>
 
 #include "qcom_common.h"
 #include "qcom_pil_info.h"
@@ -36,6 +39,16 @@
 
 #define MAX_ASSIGN_COUNT 3
 
+/**
+ * struct tmd_name - TMD device name to cooling-device index mapping
+ * @name: TMD device name
+ * @id: Cooling-device index used as #cooling-cells cell 0 in DT
+ */
+struct tmd_name {
+	const char *name;
+	int id;
+};
+
 struct qcom_pas_data {
 	int crash_reason_smem;
 	const char *firmware_name;
@@ -56,6 +69,10 @@ struct qcom_pas_data {
 	int ssctl_id;
 	unsigned int smem_host_id;
 
+	unsigned int tmd_instance_id;
+	const struct tmd_name *tmd_name;
+	int num_tmd;
+
 	int region_assign_idx;
 	int region_assign_count;
 	bool region_assign_shared;
@@ -120,6 +137,8 @@ struct qcom_pas {
 
 	struct qcom_scm_pas_context *pas_ctx;
 	struct qcom_scm_pas_context *dtb_pas_ctx;
+
+	struct qmi_tmd_client *tmd_inst;
 };
 
 static void qcom_pas_segment_dump(struct rproc *rproc,
@@ -733,6 +752,66 @@ static void qcom_pas_unassign_memory_region(struct qcom_pas *pas)
 	}
 }
 
+static int qcom_pas_setup_tmd(struct qcom_pas *pas, const struct qcom_pas_data *desc)
+{
+	struct qmi_tmd_client *tmd_inst;
+	const struct tmd_name *tmd;
+	const char **tmd_names;
+	int i, ret;
+
+	if (!device_property_present(pas->dev, "#cooling-cells"))
+		return 0;
+
+	/* Check if TMD mappings are defined */
+	if (!desc->tmd_name || desc->num_tmd == 0)
+		return 0;
+
+	tmd_names = devm_kcalloc(pas->dev, desc->num_tmd,
+				 sizeof(*tmd_names), GFP_KERNEL);
+	if (!tmd_names)
+		return -ENOMEM;
+
+	/* Build the name array from the TMD mappings */
+	for (i = 0; i < desc->num_tmd; i++) {
+		tmd = &desc->tmd_name[i];
+
+		if (tmd->id < 0 || tmd->id >= desc->num_tmd) {
+			dev_err(pas->dev, "Invalid TMD id %d for '%s'\n",
+				tmd->id, tmd->name);
+			return -EINVAL;
+		}
+
+		if (tmd_names[tmd->id]) {
+			dev_err(pas->dev, "Duplicate TMD id %d for '%s'\n",
+				tmd->id, tmd->name);
+			return -EINVAL;
+		}
+
+		tmd_names[tmd->id] = tmd->name;
+	}
+
+	for (i = 0; i < desc->num_tmd; i++) {
+		if (!tmd_names[i]) {
+			dev_err(pas->dev, "Missing TMD mapping for id %d\n", i);
+			return -EINVAL;
+		}
+	}
+
+	tmd_inst = qmi_tmd_init(pas->dev, desc->tmd_instance_id, tmd_names, desc->num_tmd);
+	if (IS_ERR(tmd_inst)) {
+		ret = PTR_ERR(tmd_inst);
+		if (ret == -ENODEV)
+			return 0;
+
+		dev_err(pas->dev, "Failed to initialize TMD: %d\n", ret);
+		return ret;
+	}
+
+	pas->tmd_inst = tmd_inst;
+
+	return 0;
+}
+
 static int qcom_pas_probe(struct platform_device *pdev)
 {
 	const struct qcom_pas_data *desc;
@@ -855,12 +934,21 @@ static int qcom_pas_probe(struct platform_device *pdev)
 
 	pas->pas_ctx->use_tzmem = rproc->has_iommu;
 	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
-	ret = rproc_add(rproc);
+
+	ret = qcom_pas_setup_tmd(pas, desc);
 	if (ret)
 		goto remove_ssr_sysmon;
 
+	ret = rproc_add(rproc);
+	if (ret)
+		goto remove_setup_tmd;
+
 	return 0;
 
+remove_setup_tmd:
+	if (pas->tmd_inst)
+		qmi_tmd_exit(pas->tmd_inst);
+
 remove_ssr_sysmon:
 	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
 	qcom_remove_sysmon_subdev(pas->sysmon);
@@ -883,6 +971,9 @@ static void qcom_pas_remove(struct platform_device *pdev)
 {
 	struct qcom_pas *pas = platform_get_drvdata(pdev);
 
+	if (pas->tmd_inst)
+		qmi_tmd_exit(pas->tmd_inst);
+
 	rproc_del(pas->rproc);
 
 	qcom_q6v5_deinit(&pas->q6v5);

-- 
2.34.1


