Return-Path: <linux-arm-msm+bounces-111123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JRuJK3UNIWq++gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:30:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C43A63CFBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:30:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fsGIYaoE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HnGHmC4B;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111123-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111123-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 155073080EA5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 05:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561183C0A03;
	Thu,  4 Jun 2026 05:27:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294B43C0A07
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 05:27:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550827; cv=none; b=ZqpC4bZyQfjmBTO2qAPT2bqy7DUmjTfa8SrCWelQ9LvJOzg3c+0Scjf6xaK7A+cLOw9lcw+WuVrYw5kSCJaKJXUHQ3cA8G36AfkuEgkUERIHXKSQvBC7lyMWOH6JI4QRIZbKn/1q6Oi16wghCdp6H2NnDNOTi+vXCF2e1JyMxVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550827; c=relaxed/simple;
	bh=qzmO9vTT9ZimsgS9gDOezDShy+F93qGz6TXjYzvqf8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lgooKR6RpBUk1NYTV7M+eP9vayRnq9gcXsY+MrqG9pwS6K+EM0fiGxzaBR3rknp0ezZb1C5lTF8RgRHd1h26ubDD0FY24zoThpUZfyIQpwUhCcm7cgWvsK/uqcWoulRrn56SyvVWoLSNLi5nQND7hsNxp7C5mENXnqzncCwcQCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsGIYaoE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HnGHmC4B; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6542bDtj3552133
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 05:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9rxV24LmCwJGuS/+x15NndginwjP/FOCBgel1x+6cU=; b=fsGIYaoEXq/YkYZ2
	h58HKfWQxZW2f4Zxl3CNMFxWjI3SE5jSZsLv6sj1J0JVnS5fTfmlj3rn60oYHWFD
	LtLlBzLAcE4udR5ABFU6LeuUc9mQFBnINB9yGvmbpNm82pYc704fjKgpZAOXR4eb
	jZCugHGX6K8uIu9dvMGUbfE0wHMy4FkTtPPm/AX6eAMSzHL64BUFC8eSXbcwb8k7
	jFUz5O+2JPP/e9CwDY4j8DGhzYi4JlZXjemjYNhnxEW+xNAj9b6iHncI0qxIIrRV
	KMGjE9fFKH0ugqZZCa1rKKNohFRMgGsbzNLtlQG4JMEQBNO05gLGE2wDmYCcMmBq
	hInUmw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9mv548-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:27:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8422ca754d8so263389b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 22:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550825; x=1781155625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9rxV24LmCwJGuS/+x15NndginwjP/FOCBgel1x+6cU=;
        b=HnGHmC4BPKDaPfQ+KmTrTJgAbkYzjdys5FjLCal9h2x8a8Q74MlqTGs64rkQaR0iDH
         itv4pPAwBm70a6AyOtVngcBgT2bQVSR03JC/jbjjPZ8IlcJTI4kXoFQCqHsOdJ8gH/Sb
         4sjxZuzHTBlpNdG1Xtcae3HlDd/eKZCsqw8gXKbaylEFg/9OYFDcXd/KPh5DyMgYhYwq
         Cin7yuDpjNrkJ6cXWQRB9ztNSoORjg9M2FMzOozTlqXtebTJjh7hi7HFNi6FofpB5+b1
         Ky1WHRLUJPTMqy9tPzp3co8nVCmDVVoO7+k0ElOaMmHAOx2COhISuVYf2Z+5VWORQIju
         NEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550825; x=1781155625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d9rxV24LmCwJGuS/+x15NndginwjP/FOCBgel1x+6cU=;
        b=PAsfKDu9bRJiNmB090rHXaqEjzjhDPGDd8ovtgn7TiDHOFstghYvgoDbYhMWjdUSTb
         iWbEPiDK7LQbwxN3GqT6aImLV72a5E/Eis1LtEQNVFmx5FDaONcvKIcoyZOwg8F6wGoj
         tmoB1jr76UZ96jeGx22AkU6eNqzCJmz5TT7R/eIIawFJF06IM24a4wjW79IJ0q11LevH
         2gvChh545mOoyeHYsCP3fh6GT+OoDuILOZvk4tJr0Bmq3WzvI66gTSfb2iQHBDAx/YMZ
         MUbXqdBHiSQK2Y9q8g+vDYUtihZgTkrZS//piZMdX67ctv6ZLTMh0AypiLWqJRp7wJEw
         gt9w==
X-Forwarded-Encrypted: i=1; AFNElJ945NAsZMLpPdCJ5iWdL2U4PD4FJZEHppfOHG/5kBzh23SuMvg+rZmvvnlzQp1WrzTtvH1xu9vXg5J6Z4+H@vger.kernel.org
X-Gm-Message-State: AOJu0YwnnomyytvQmvW3oXwRPD2CFUwsvGmKKWbAyb9oXHyY7ftoF78E
	gP0CCMaKLKTcapjZVluFMD5zae08y4IclJFBfzjVnc5Zb191QX/r180R3YroeVJg639xQXCUNHq
	Oq5OVkKKntk/wF8rfjVgWK0ofKT2eAk1PwM66QzrOe48CaDF9S7gDTTDdn8xJEfykWs/+
X-Gm-Gg: Acq92OG57veh8FH9T5GS33xddzEU18xeqeMHnM9crx4herzcjjaU+ivO1p1muH1AvQz
	KNZFrpVx/jRfcAhDPWeKX7m1sKWcWnL5vfeLADtgn8X7GkkuP/z52EKTvwxXaPZrSFFF9VMCu/N
	SDab84dJA0fPSdvhfUDm8KVQCe7uL0oMFwwAZzoYFPXSAWXvGHXkq5SR7yKXbukVKz9JAiyatW7
	/Q+WWLwH8CdeoxYavr7bC/fqaWvTFeAa6HIiQrDRW8Yx265BPughVncoQdgGkRgxz64eOwsyFky
	EII1QOYqUNyNYt9ImY3nCI41gBA4ek2MkgaOfoIxzqEW6OCWf4uzWSbpnckVHkzF2D9cjIqpLd1
	rSWEbZb22B5o1+RODJKaSecyv25OhAwbS79nCSl7rJIVIVUe7iXeZ5JguEfOfBTU=
X-Received: by 2002:a05:6a00:429b:b0:842:614e:cc9d with SMTP id d2e1a72fcca58-84284ed9586mr5915289b3a.27.1780550824683;
        Wed, 03 Jun 2026 22:27:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:429b:b0:842:614e:cc9d with SMTP id d2e1a72fcca58-84284ed9586mr5915255b3a.27.1780550824229;
        Wed, 03 Jun 2026 22:27:04 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:27:03 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:13 +0530
Subject: [PATCH v4 07/13] clk: qcom: dispcc-qcm2290: Update GDSC *wait_val
 values and flags
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-7-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: uBzn9UPfpRQIEGjhFNcwsT3wVDSey9Fl
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a210ca9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=USgIuZEjIA_ZHjWqnmUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX9BZubKDAJ6KU
 TNXER8zNbesjRszZJrryPcxOoHZWQCeDME18oUWJPD5KCn7DKdN+QvPNEkn48lSxs4CpHRQuE9k
 kkZ0rvkLZbOqZ0EBpnvbQjwbaEpYSOG5F6owUkPCfVHrxc1ZUKg56G7zKxqi4PaXig41BkyDgme
 7GCLLCK9vPOvVntZ+vtp0FYgHNzP5dPIND4KyJxwF0KKB64iWwW6IUhKPM/u+evGHaAZF85fR+K
 2YF43ZPh6JULbQw3VnIdP7pIumysEAWVTtdQA8yztWwMyrbEcMAH47s7aRvEtq7Kai5cpdgCh8O
 dfmoT+g9vdOfwjZ71d5JiDxDjZ7yWQnIftcLfUJ6vXv3Q0H6QWJ4F1bP20qr6UlO+QNWTAHZjYG
 riSM7QTwqxYWkhTLQbi9QwNU89H2+TQeiyqGvhDPpDEySge292GBINkA/IpvK2G9oTGhOxK9oG7
 PgRoOGtNSPTNW5h1wKQ==
X-Proofpoint-ORIG-GUID: uBzn9UPfpRQIEGjhFNcwsT3wVDSey9Fl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050
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
	TAGGED_FROM(0.00)[bounces-111123-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C43A63CFBD

Update the QCM2290 DISPCC GDSC wait_val fields to match the hardware
default values. Incorrect settings can cause the GDSC FSM to stuck,
leading to power on/off failures. And update GDSC flags to retain the
registers, and poll for the CFG GDSCR, and switch between HW/SW mode
dynamically as per the latest convention.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index f5dbd19d0a0334362a44f91a69229cb0f018f309..4c1eef79f41b6907fe79f2b18bcb5f6160c74a43 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -468,11 +468,14 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
 
 static struct gdsc mdss_gdsc = {
 	.gdscr = 0x3000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc *disp_cc_qcm2290_gdscs[] = {

-- 
2.34.1


