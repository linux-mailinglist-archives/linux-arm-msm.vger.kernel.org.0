Return-Path: <linux-arm-msm+bounces-114655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S/K9N+55PmoWGwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 15:09:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BAD6CD4C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 15:09:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fhsIX5yl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S8FkW4nq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114655-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114655-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D644302EEAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 13:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F393F44CA;
	Fri, 26 Jun 2026 13:08:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DBF3F6C5F
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 13:08:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782479299; cv=none; b=Ftvwnj+yPX6FZ8jScw+sMBeWlUDNw+lXVwYkWENPutleznMhahU67yAIElj7DoJi6Mu89LQCVd95It6HoWDVWUP8Fd8YjYwdVWefWHPqalYK5XdokoIpXPDI244Tx+e2TAoLxZXIScWQXjQqf8uIqi7R/qe65NZN7qQWlKVkoJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782479299; c=relaxed/simple;
	bh=4OMqDq+6Oe/xsyRMRZ+Ck7GyPJ7TWqOMWavyAzqn3mY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=flTKvu+JRoKPQxchKNF4Fz7lINH7mei9tn+kPHHVnVv7spPbQdh9MEw/O0uu5jQHmtNdp5y4DMdK+B8Bcgk3VmuEfaW+7NdPQuo8QMm4+p1NXFC9LiQJ4uuqdtUEbu2yJ5KoOu69UKPrbxIvMtQ7yzWjbz7J1ezBkD8gGUSvEP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fhsIX5yl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S8FkW4nq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcjmu2239442
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 13:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fzPkDH1JFdjroeGCXhX8Qh
	HFnHf97FKWCs59ps3MRio=; b=fhsIX5ylh9+gwkSDRQTmwbuEZOzIvjpcKCMAQV
	KACjNVk786T8BvZmFIPLIDKmN/glz9DLP6ozEmdop/7hEMLMjQYOvegHr1bpV6WU
	Nri81Vn7LKDrnWAM00tPLuRkn3fhdxS5kXZS3i4AFOtDfvdrQBrvG0+1CJqjeDpY
	BA3VyMgoWleam1clfc6UoIz2u5CSvWcKOmur5qgJF6PYTXT0pzjcc9bxHwCzq0Uh
	4Unm/m42XMfP8iwfe1L+Vo4L+30YrlQndYKUFsAmM4Hyr0rMJgh5CjodYI0VwXEi
	/APVNHbfNXNYL5Tfr71N7JVVObJvrJwf7l0RP8JZ9fZOiuiw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgc2gdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 13:08:17 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7349e174e05so41462137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 06:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782479295; x=1783084095; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fzPkDH1JFdjroeGCXhX8QhHFnHf97FKWCs59ps3MRio=;
        b=S8FkW4nqh12VvMevGVXO/bezLmAejngaAEbQ5j0JfSpH4bhd1UM05NW0q/iHkcnncF
         0ghzdMCHldNc9pQjIDyBI2brQk4kyoVklUSDBUvTZFeIhszha2gk7dHId7Wu1r5jlKOV
         JDkJ05UDzEpXc2h8WUNlb9s+av3lRk20auJ6fzoZc7IEGXyDUNd6ClFPsLv3I/DgYqv8
         Fq4NftQrrE70rrD7N5JqdYBE3bXfYSUZQZ7dZDTt9TmThjkhbGDBTp0DlJwoCV6cbcHM
         biMdw4iYouXERN9lz0NlDuEgmKlsxvPqZYXiYOB/Ne2F5o8ky3OpfUX5aOz5sTSu+yCD
         3DrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782479295; x=1783084095;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fzPkDH1JFdjroeGCXhX8QhHFnHf97FKWCs59ps3MRio=;
        b=hebgLlPXhoOnDAu8SaSiNBynvkeaZdLhRxkZXAJFdPQ07i5tV2b9waHgCIqxxGUNcE
         b3manD1WnNBelh1DK5pFD4scd+4IjrifQnVHWA4+zHMQ3YNvzs8r2fyJ2KXNFHZF/jAn
         4XqmLl3Zo0GHmUY0okaalpW4o9RB788axJqHND+UTWa0wUngxYaFjDBb3v3mwHQ4nnP5
         6tPp2SZZb6DWloEImI3yyr/D1WT/6fZ+B2Xn63oSfMLKFaVFReUTHTGKvCC+GLMnqW/r
         R2ruv/d45/u7gfbUQmOTsYJZ2UoF8qilROvsnTsoR6IqtVLIpqpqGcd9P8YCVF4dkQ3C
         8qFA==
X-Gm-Message-State: AOJu0YznlsEHSHAHbHcx2vtraHhqKT/1GRlYNOoZFkPcVDzHYItivXFV
	Z8GNk1q3rXt/IVEapg0El7GDVLfZuthGSZjcoPHQQPgCY9uIpRK2rJRnRyHE9IBwJr70BtvL3QY
	hnEL+Dn1Ndo54ppjFwNgB7LB4z3fccJMCnoDlVKRF8BNeKYA0laZsnmInPogFdoT6mjKH
X-Gm-Gg: AfdE7ckUj0f6XRrgO7ZoNoucgPCd86NIdNCizxQp/3vQHk51PnuPOhvgjPUsToYfFYE
	n54XdehL3QP7OV0XAe4iev7tOJyQeJ92JyIuKNxg6ZXvCzuUeEbNQDDsdOSmEprdA26jw/3fAw+
	WpXx/ri8e4IvsrExqsfDFvE5/9RgOiearNcYjAUMCgVVfiu8uJF1ETKGbb+B7CEeV9yJWZsazY4
	iHjo+Kz3ilswTqkSk8GYtY/SO/GDlC+uLk7inyirGZtv0aktXN4T43jogtXFQaFOcQ1YTmkUuFj
	gjLs6gtW0lUWOJ99MEkIFVJ5zyLDE1Ot7FkHbz2CYWx/hK2qYd2vHlmYmfB1lemkNUhwP5hZekF
	4PoDsfS9QYbON7/HGUxcXxM7EIAhxFySZjcp3gcTp6A==
X-Received: by 2002:a05:6102:1489:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-734368cc7f7mr1064090137.8.1782479294958;
        Fri, 26 Jun 2026 06:08:14 -0700 (PDT)
X-Received: by 2002:a05:6102:1489:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-734368cc7f7mr1064067137.8.1782479294325;
        Fri, 26 Jun 2026 06:08:14 -0700 (PDT)
Received: from KDYBCIO.eu.qualcomm.com ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3aece6dsm2797476a12.12.2026.06.26.06.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 06:08:13 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 15:08:05 +0200
Subject: [PATCH] pinctrl: qcom: sc8280xp: Add missing wakeup entries for
 GPIO143/151
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-topic-8280_pinctrl_wakeup-v1-1-2ccb267148f5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALR5PmoC/x3MTQqAIBBA4avErBNUwqSrRIToVENhov1BePek5
 bd474WEkTBBV70Q8aJEuy8QdQV2MX5GRq4YJJeKK6nYsQeyTEvNx0DeHnEbb7PiGRhvjHOoxNQ
 2AkofIk70/O9+yPkDGzSh2GsAAAA=
X-Change-ID: 20260626-topic-8280_pinctrl_wakeup-04adde61f741
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782479292; l=2513;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=4OMqDq+6Oe/xsyRMRZ+Ck7GyPJ7TWqOMWavyAzqn3mY=;
 b=aTC7QamSdTJ3VvfHlgyfXsu8GmP1llyATSiBIUZNWxLVLieV9aX1EBbXQpcCBF59JNOsTsylt
 M2gK2zD5258BlhsRWsZeiJGMoyX1JCMS0tyHIJg+z3/oFSGupHxZYuo
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwOCBTYWx0ZWRfX5NshV74ZuEWS
 BX+Pz6OGlrkZucUQQrtiGxNk4PsEUX2LBJVGRdgoWTm0tW0BwaXwUtgRRzoUj9R5ROJo9/S57s8
 rb62vdjbgoN38/In+6uUJhGrD+REsiQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwOCBTYWx0ZWRfXw8iUcWqZz2g0
 rp7eofsPX+6mCyMh5/FOVFK6NfqEpEfevg+OsA9TY4vNAncRox5tvMf76dDAKth4oFXG61XRAGx
 DTsoW89gxKxHxsduc0o7y8eolZpsFunapx4AhmU+uMSeoCLSUM7G24gOOcmlF6kXAtU1bw+lici
 QV8/pddf4Lk+1tSnFei7BDNUYZfQegGAGtvhcjXUzY9lJFBShzkSMXKwiney7+fRXajmvcBiYCD
 gaU6PcxkKJ6OJVVOm4dN1Ku9xrnIAaaN9X/DpH1C296ViKHH9sUrtFnJq9/4vNKqN7Gsv3+pnVW
 27m2+VO62500TwVpc/ucgSDXFad4aEU4xNBzPn8t5sNQUIdpD4uLDQb4jbEk6NGxaH6KPYodxdw
 /kz/lBn4PJRWvQQg2DCS+z3WLGMx0qY9auobhePz+W/vbzBAFUiSWL0A8csmtupPcD6ZPuGEbM7
 Zg0BxKA6zTcZjv3ZSaA==
X-Authority-Analysis: v=2.4 cv=O4oJeh9W c=1 sm=1 tr=0 ts=6a3e79c1 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fXf-XoD2R4er_McQG-AA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: mXwhyX8ioK6Agflf-hlKh7h3CDoHiMCc
X-Proofpoint-GUID: mXwhyX8ioK6Agflf-hlKh7h3CDoHiMCc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114655-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4BAD6CD4C8

Pins 143 and 151 were not included in the PDC wakeup map. They are
normally used for PCIe2A and PCIe3a PERST# respectively, so they're
unlikely to be excercised in practice, but still add them for the sake
of completeness.

Fixes: c0e4c71a9e7c ("pinctrl: qcom: Introduce sc8280xp TLMM driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc8280xp.c b/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
index 4056b9fa32f8cb90b6d0b5edc31e189b94f800af..e018bd11626cad722f2e4a142daa0b7f1f4bbffa 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
@@ -1881,16 +1881,17 @@ static const struct msm_gpio_wakeirq_map sc8280xp_pdc_map[] = {
 	{ 126, 200 }, { 127, 225 }, { 128, 262 }, { 129, 201 },
 	{ 130, 209 }, { 131, 173 }, { 132, 202 }, { 136, 210 },
 	{ 138, 171 }, { 139, 226 }, { 140, 227 }, { 142, 228 },
-	{ 144, 229 }, { 145, 230 }, { 146, 231 }, { 148, 232 },
-	{ 149, 233 }, { 150, 234 }, { 152, 235 }, { 154, 212 },
-	{ 157, 213 }, { 161, 219 }, { 170, 236 }, { 171, 221 },
-	{ 174, 222 }, { 175, 237 }, { 176, 223 }, { 177, 170 },
-	{ 180, 238 }, { 181, 239 }, { 182, 240 }, { 183, 241 },
-	{ 184, 242 }, { 185, 243 }, { 190, 178 }, { 193, 184 },
-	{ 196, 185 }, { 198, 186 }, { 200, 174 }, { 201, 175 },
-	{ 205, 176 }, { 206, 177 }, { 208, 187 }, { 210, 198 },
-	{ 211, 199 }, { 212, 204 }, { 215, 205 }, { 220, 188 },
-	{ 221, 194 }, { 223, 195 }, { 225, 196 }, { 227, 197 },
+	{ 143, 261 }, { 144, 229 }, { 145, 230 }, { 146, 231 },
+	{ 148, 232 }, { 149, 233 }, { 150, 234 }, { 151, 264 },
+	{ 152, 235 }, { 154, 212 }, { 157, 213 }, { 161, 219 },
+	{ 170, 236 }, { 171, 221 }, { 174, 222 }, { 175, 237 },
+	{ 176, 223 }, { 177, 170 }, { 180, 238 }, { 181, 239 },
+	{ 182, 240 }, { 183, 241 }, { 184, 242 }, { 185, 243 },
+	{ 190, 178 }, { 193, 184 }, { 196, 185 }, { 198, 186 },
+	{ 200, 174 }, { 201, 175 }, { 205, 176 }, { 206, 177 },
+	{ 208, 187 }, { 210, 198 }, { 211, 199 }, { 212, 204 },
+	{ 215, 205 }, { 220, 188 }, { 221, 194 }, { 223, 195 },
+	{ 225, 196 }, { 227, 197 },
 };
 
 static struct msm_pinctrl_soc_data sc8280xp_pinctrl = {

---
base-commit: 30ffa8de54e5cc80d93fd211ca134d1764a7011f
change-id: 20260626-topic-8280_pinctrl_wakeup-04adde61f741

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


