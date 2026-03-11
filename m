Return-Path: <linux-arm-msm+bounces-96893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KOfDfgTsWkZqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:04:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E25125D297
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D901301C3FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C373A336EF8;
	Wed, 11 Mar 2026 07:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LI9PUK7D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GqM7oFJP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FF3377035
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 07:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773212661; cv=none; b=kKaJ3imBaNNxGfHk3DpaDda8Y9CtkGYAovsQnoWV8MQXTGLsSh5+SGlH6RirdT18uMU+aCFP/eMhlYOKxX9Y6kUqfugLqydf9bDn1QFP0ntOXSG20qVZ6x8xt9LWKzOZ0ZVlmc7jukHmHsFTeP71ClbKLpt/Y4UIiHR7u5+YF2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773212661; c=relaxed/simple;
	bh=VWqKurBxYJdAW/CPRT4gVM3scZ1DFdjkS32zw5TTzhE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sqFKgkCc/vyYBKVsg2m1UmcScmB4/iKZDmOAJafTC8N6ur+sIntlGJ30hFQ18XqhYL+bMZ+XAr4RYVSLmiapYkBwudoyu+EQr/oKMkmu48BPY3ilzbfFjkSLMSvBagABBoDozwF8y55eRhKdOjBL2oZyPJkoKqwy1n8HEqvH7t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LI9PUK7D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GqM7oFJP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B4J8Hq3417140
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 07:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=u1dHLzLMJ0s
	Lo1VKU6WC1FPnWsCc2m9dyLLFAlosA9k=; b=LI9PUK7Dlci1A+uJj1jfIzaeNiF
	GYGq8hknGEX0EFmmfzHpokCP56uLVMUy6W463eUR6YLM4ppLPJLw3Oww4CBtjjRQ
	K9fCR+uwpTVVuyEG/m8qXjrKwh4w12O/e7qf1Pm1vhJM9tD7hMdX9n0qbnNS3cwE
	PT0vI3bWvmWpP0qIfMZICmTR+UyhzPU1MkSiM95IKVHNwhPHCHoy1NWaY3KfWZvv
	Q9WtHriEkf2RyUTW135BMY8g7sc+HO59/96INWPkjUYGOAyHdueVMJc6T1lQsUJG
	r9WAM8R3MdCRPzhI/ZyrhgkVMWAmTwEADXajcOjcO2rjYhuEVyk1Vgae4dQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja2btd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 07:04:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae49120e74so95828745ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 00:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773212654; x=1773817454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1dHLzLMJ0sLo1VKU6WC1FPnWsCc2m9dyLLFAlosA9k=;
        b=GqM7oFJPlFwm5jeD6Qp6mYqk/m6INvRQISJN5b3/9MW7vP1vuzjhdxan2tQe0JT6aE
         FpA+t2owXVnP7hVp8bc2K1sBtFYIqSS6DsIcneshHl5r2/UZ0fuWJwFKpaYWgUVLMmJZ
         lUHj2w40P7zCtzeu6tM8cvXbj/0t5fuArmWqInRrXdCCE5ZZa8lUnSf4h/78IGylUo1S
         00M9ayl1ANBGIaNb2mY85zDHAav3WI539+H4i3OU9UdBqWj25mhmQFyNnQmuYZ5l/XTz
         /PkgRiZRLC2g9ZTYdFAF2WHvYNUsep+ApWaf4sShGscovUc8XLV9SZg8g2VSi3C4278h
         TEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773212654; x=1773817454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u1dHLzLMJ0sLo1VKU6WC1FPnWsCc2m9dyLLFAlosA9k=;
        b=NvMB1hct023VC0HqNe9+cCAnAV/U1gpUGsyH7wf3KBz4HfXW+UkpEG1TZCMH5Igqnf
         okpdqE2s4CjOYNf6tSD9jcGdgCmEQ9MHCrMsrzXvfytH+1aJHEwYW4tTvDzV0zrlreiZ
         u1SEb1LDnGfi7r2g4dVAj2YbbplxajYDrF7GLaY+80IE6JltnI//O1dAUJ+aWQrZwg6m
         2jlaLfqeQOF5r4pW+PYrAdlOwWFMVMq+4Y0d1PLgaMYGHsHVW1H4w8Nrkvqnaf3l5lr6
         GAgxIqck4aoERDTUi/JU+VQSHQTjVgi1M3qAo2fpJ9/OMvBi4L13+Gv/WIujsfgZr08P
         LXZA==
X-Gm-Message-State: AOJu0YyV+3IOXEStoEJXr4CQUy6Gv7k7ZgnVL9Lu3wj4Q9gYAkf38NbC
	6PPA8CFZX0459pOR5vLKTaj9orX7+TTZtFVAIz5ng/8BsS3v+ku7c/lQ+McK9xqCYoXZUvTosOi
	KK3WQaRNk7RyrLL+BO2Avxs3yVzYRlcFv+Qw8lahilnVyLyV0FQOUjgNcjtFvKxs3+JCwjGLNJ/
	NY
X-Gm-Gg: ATEYQzzGIgA6F15MqOBm1gUpw9bA92qEkqodIRWpYsO0Tnrtv1MqEJ4Ju3rUrCVweIY
	aZW5sRNqfDwrIFIodhmE2hyw1tLk2FtEDOMGgqIuPZN6SXsK5RlRLUIcxORjxOuOn/sjgFEQiP3
	hhXTyYTT75ijUg2Ucq1nSb1TzDryPwzTMy2dR6fPDpsAaQwc76eiVpc86Toz8TmGRj+2HxqFH7Q
	Kkg5y2tYV8PeDFShQyz+dnIiT0ngHgtqoRAks4MiPvVqbtVPKeBhlUou1XxqXoEP3x8Q+nQz2ZK
	FJ+LXIu32H2pvEPdAjdbA2e3Sxtae7k7AFeEZztVSIVx1aKsCWGn2OwtQul7oMwrh+OMeuG3T+P
	MEh7aE0gKFk0pl9GDbrIjox5LWixz906isyBVBvgrCYF5O0IMKHaKomF8tg==
X-Received: by 2002:a17:902:d2cb:b0:2ae:a70a:2af2 with SMTP id d9443c01a7336-2aeae882456mr15324605ad.29.1773212653618;
        Wed, 11 Mar 2026 00:04:13 -0700 (PDT)
X-Received: by 2002:a17:902:d2cb:b0:2ae:a70a:2af2 with SMTP id d9443c01a7336-2aeae882456mr15324325ad.29.1773212653087;
        Wed, 11 Mar 2026 00:04:13 -0700 (PDT)
Received: from hangtian-z2-2004.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae34d925sm13355755ad.50.2026.03.11.00.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 00:04:12 -0700 (PDT)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: disable WCN6750 and WPSS
Date: Wed, 11 Mar 2026 15:04:08 +0800
Message-Id: <20260311070408.2287889-1-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260311031145.2285056-1-hangtian.zhu@oss.qualcomm.com>
References: <20260311031145.2285056-1-hangtian.zhu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b113ee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=H9-LGvTQc6I73mOXZpQA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: EHd1_9yG5dwxl6eFFpOPcJwxfooCnaty
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA1OCBTYWx0ZWRfX3ls465mjr3Gg
 lw4vrgJNVmJmQmm3QRFMlfAQ6mmjEg84wjlM5nFxUg+G6YvodwGBAEhfFp0o6otZhy3nfvK6SCA
 S8xr/mrXtUYXA6R9eJQjvAITHuIZhboOTitLHDbsdX8IN7rk1RUdGMkVAfHu1e/c9F7N09+O84b
 XXRGXTALdn/XBPj1NrkX50HsE6zVmJBvQUU4SzpBY5kDFwgnfcvwQwZs/0thF7U4v5VZ5lfRVXK
 +2uBYgiufUhIAaLhOOrDjZBaUH+Okd+/wDU2yCoRGWgQGtfD1UxJTjBu60ryAIPtdxylpwoup8W
 E1U45g6nFmCLNIOMNX8qoKfcO8iUXSFYnKOt2hu6HMfdNwmVXUG+rv+jzMgtCPUw5FdEOkTx6Ev
 jxg1WB8sYVK1/ca/povXHKWuWdqEFCeQIFw5rNTpkf/eF5DKbvE9U5NCGBJPQv7w8RyaPkhovnD
 qwXQODLZS7MkHlHJKJA==
X-Proofpoint-GUID: EHd1_9yG5dwxl6eFFpOPcJwxfooCnaty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110058
X-Rspamd-Queue-Id: 8E25125D297
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-96893-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangtian.zhu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Hangtian Zhu <hangtian@oss.qualcomm.com>

Disable WCN6750 and WPSS on industrial mezzanine. On RB3 Gen2 industrial
mezzanine platform, PCIe0 lines are moved from WCN6750 to TC9563 pcie
bridge. Hence disable WPSS and WCN6750 nodes for industrial mezzanine
platform.

Signed-off-by: Hangtian Zhu <hangtian@oss.qualcomm.com>
---
This patch depends on:
[PATCH v4 2/2] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node for PCIe1
https://lore.kernel.org/all/20260305-industrial-mezzanine-pcie-v4-2-1f2c9d1344d7@oss.qualcomm.com/

Changes in v3:
- Commit message changes, move Depends-on from commit message to
cover-letter.
- Introduce the PCIe architecture of RB3 Gen2 iindustrial mezzanine in
the cover letter.
- Link to v2: https://lore.kernel.org/all/20260311031145.2285056-1-hangtian.zhu@oss.qualcomm.com/

Changes in v2:
- Commit message changes, change rb3gen2 to RB3 Gen2; wcn6750 to
WCN6750; wpss to WPSS etc.
- Link to v1: https://lore.kernel.org/all/20260311023219.2284643-1-hangtian.zhu@oss.qualcomm.com/
---
 .../dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 2a2b7c2f9210..6594c7e1ea93 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -32,6 +32,10 @@ vreg_1p8: regulator-vreg-1p8 {
 	};
 };
 
+&remoteproc_wpss {
+       status = "disabled";
+};
+
 &spi11 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -280,3 +284,7 @@ pcie1_tc9563_resx_n: pcie1-tc9563-resx-state {
 	};
 
 };
+
+&wifi {
+       status = "disabled";
+};
-- 
2.25.1


