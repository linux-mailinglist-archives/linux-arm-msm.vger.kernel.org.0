Return-Path: <linux-arm-msm+bounces-119085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t40vEfVvVmo45gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:20:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C76757579
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:20:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=k6xBjTjj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HuXKonpV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119085-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119085-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B246030AC3CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 17:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F042139CD03;
	Tue, 14 Jul 2026 17:18:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518AD34D4EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:18:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049500; cv=none; b=QGs4OCEznRFZULB7HV/lhH2iTColxegU4H/yCN3dj8QpcQ+/+cJp4S5+NaZyDbEYSujqP1OTyPZnzUuGvgdfUHaiShHprc5I5mFpkVjTgU1ZdOxOZ21acnWGJSc74g2KKrHOGPPMfHFP6/sHPpxh3joLOM6XyH7wmaA6WFqFILg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049500; c=relaxed/simple;
	bh=MfoLK8M+cwJsqJMcoFtwkeKu04gSS+o06svNL8s3zdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D2MqJvq5Vz9qVhkCr2jg6hKo+pRe0wSmoguWFxPF1MczX4sx3FnxjnxOLQwW9Z6CYDAE8IDUmcIRUirDuIai+vSYA0yfAAGQ776Gr8XFUZCM0QUhTin/6fQOlUQ9YlZJ8HCfxLKF6Tilnob0KjX+K7Dbllw9w2V8NrBqRlxH8y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k6xBjTjj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HuXKonpV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG7OCC1091741
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AE7EF/yIi6dKqkIKGLCajNYTAH086MLgb/mh4Ejjrpk=; b=k6xBjTjjlCMFY+Eo
	3CjKPlAA3V0CWRFA3KF4IASSJ8C7Pz8GwNYnuoHyOk3kdGLwleJ3haABo7c8+H4D
	QnSfJNgDRtn/p9n0l0ZTMGVZ8eZ5HtARQwnnagmgX5xxwt6cD4Oql6LzFYb4caoq
	b3YaHlfRUUCt2d60seda6PPS9/tQbhfGQ6I2jND6A21umB2pZTegMv45orFEe4oi
	tXgpyK+v9fukW0o2On8ZXbsqPAnwHDXjolG7pDmso7eRMEOCGYDT7RcnuGUVscZ7
	q6T8Utl4V4Lk7Pug1zbUWhF/U98DdK50p8q8Jpb8wCybm15H7GLk1K0+0e37e7VH
	vxSBIg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgudjav8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:18:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8488ac68185so7058179b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049496; x=1784654296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AE7EF/yIi6dKqkIKGLCajNYTAH086MLgb/mh4Ejjrpk=;
        b=HuXKonpV0J9JhWwTJ2omJv8TtRRMWv5FWENsXvIvT06BUXzYrejpYiELMYrEx9Fntk
         rWJ2QwTaudBF3lqUG5W3DUerssocQUG3PsClNVu869vxXOSTvqQDAIVuvUP/+ADlnOEY
         yL9SxHOpzkCtWwoZsCpN2Ff4a5BOFfAtUtgtOP/+52STjWotpwqNcDV4mnuiZEd/2e9+
         WLrC3rqZYpKA50tf9vwzDsCqWSN8tgIwpmPvZsm3/avV0wKglASwGOdzRZI4oBlR/lPM
         Rj4pa89zsqUVB17fyKkY0tvXCm/6pzXT+kIl0GjFsUz4nwQNmSLg1klkUCYLcYSCIKg3
         nxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049496; x=1784654296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AE7EF/yIi6dKqkIKGLCajNYTAH086MLgb/mh4Ejjrpk=;
        b=CS5kgdu7Hna1NL0SQGUUNi8U7Q7KyjIevll1Kn4Y3gqjplxiwWN6U0cVZbLULUKWAG
         tF4OkjR8PJaHhNcu/yLjJfWYDUB+zzidtbQfBo4WYIM4TrESwpxoliOEuPAXH93aDZRW
         ehugvGNWEYJqXwVXn6ujVcnx71vx0drxRCMCG36QDZqaKBIGW9Spg9WwCe2gP5kCAUHv
         GIh1luoKysw4JWpmxdKlNdppDNa1wYK1zIvTyte/2zGwv88Wi7X7XWwzskKhxSV5cfLK
         l9oJny9vg37Vf1SdNtTOwZN2VPC9dibbTiWNnsZ8MhmfZUoPFlnsZgbHWmclFcwRmuMt
         FbSw==
X-Forwarded-Encrypted: i=1; AHgh+Rqhe0qOacRghy0OyNcjdQ/FKSUtvv93v39w1pU0IoiwB3p3s7dMT/bGAqLVyZXhleAWUtVa3tmfweLrisaQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/M0hg8On4FkYnVoMJ3LYPlG7LtxbUHw8fZq8SKccatu8jsou6
	Wt9z6ilThp6puw3Ogab6knlmTwXlMsvc6v9iMMzFpMvovvGGdIEr0tBYY1jPu/naEVgOefC6+Pj
	jeqx+aam1MFBrcj6g4+1Nw6r0weX7K9UqQXnxkz0J6h137SYcodgCUL6a+cYsM6ceBoCK
X-Gm-Gg: AfdE7cmTLBddt5k2eixBQUAcVpJ/TASXCu1UH/mq9CYjtt2yJVIvaB69Nk7nUtRmskq
	wUT4Ja5cniFFhmGer2HpChRQYKAemw/f3bFTxwEYS4ZUV5LA57oYTrChnwBIWdFHxt+71aCxj+C
	q0RmdkjvslLVB4bdDCvNnZbdHrWA/xdx1GRPuCrHRL+SdnHEtgeiUoxCTd31f+kbZy9F3RTTICk
	YxpU7MKx+cPWbF7U0WQwWeLczfgaBOPIeOZ4EapNg8pmCTuu1xubShLZMSQyucFLIh4IaFLa5Fn
	mkTn7cXcb0Nip30wp4yJ4IC4Q1Pr01tF7g8N3m+AYOyRJ334zKdjcW/Qbt5zD+6ZoWeOYI7Rn99
	SgASRsOgxrtRwjYq1HQtR/yeqT3+/nO1wortqLRRCOTsqW5s=
X-Received: by 2002:a05:6a00:4405:b0:845:d286:1fa5 with SMTP id d2e1a72fcca58-8488974b096mr13460081b3a.52.1784049495840;
        Tue, 14 Jul 2026 10:18:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:4405:b0:845:d286:1fa5 with SMTP id d2e1a72fcca58-8488974b096mr13460058b3a.52.1784049495426;
        Tue, 14 Jul 2026 10:18:15 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:18:15 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:37 +0530
Subject: [PATCH v23 09/13] mfd: psci-mfd: Add psci-reboot-mode child cell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-9-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=2622;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=MfoLK8M+cwJsqJMcoFtwkeKu04gSS+o06svNL8s3zdQ=;
 b=qc68dV4YEQckF6aiIfbEhwnkSEuflVjvhtpo0b0PGXV9fx3UjJfg2D23zCw4Y79QkpPBLReqM
 GuYHD88XpFyCNQDG5Cmiuv47u8F4gUERJM9WMx/92hPByxGmUSwjnIM
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: tDcXiEjLs5pqQcXsSTJkf5p2Lr92a-k-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfXwE2wTc7Fb+tQ
 q29ZpnY0oZN48ac4lyjTYpNEZpIzUprBCdmRPGAJaAODjz7/jIwtMorOrQUOOesdBpOX1siK9Lv
 OraMM/BchK1IWzX0aI69qdC7FYaD919wqSWcVA6TlfpbaUQP9J6hdLhbfOSttSeP1oYu7PPCkan
 G++pxjk51P3Yb7mSq6l4zY7C38yFiGD6RUb6VhgIbKGsqjS/ZL7QioqrhRw9JTimK3MrOvn51rg
 D5Gp/1gvkYi7ks9sVNF9/Jz98vYspxqXV6l7WssPVRKecyzWLaWsWEzEdaWmD8gigMF+DyBSA/H
 Hp6JoIflrhIX4qQBCkryZ/R92rWyulxSRoGjOcj/mNnLVmYmzof1jf+qMtsHPH8XajRc28z6R3w
 t6TZ/DmxCe5cFUeTU8iOphyveW9J+5o6SZfViVVTCsBefmRilkJpZP/LTs5EJ5IPM46i6nJUN7S
 J/gxEQ5KhgT8/9JRHIg==
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a566f58 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qQQu7YRYY0fa_xNKXW0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX4fpNGlPlgyu1
 F3aSK7lBQSgZHjPAOhggP2nmCpz1kFXJMZqLcx31BYk4s2Ry2+SllaNpMCV+Qr3qfbKtgWsk0Ot
 NQQlvZT8AW0BAKK0Qb7u8MsJXTcr6Nw=
X-Proofpoint-ORIG-GUID: tDcXiEjLs5pqQcXsSTJkf5p2Lr92a-k-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119085-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:ulfh@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:arnd@arndb.de,m:Souvik.Chakravarty@arm.com,m:andy.yan@rock-chips.com,m:matthias.bgg@gmail.com,m:john.stultz@linaro.org,m:moritz.fischer@ettus.com,m:brgl@kernel.org,m:sudeep.holla@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:shivendra.pratap@oss.qualcomm.com,m:florian.fainelli@broadcom.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andre.draszik@linaro.org,m:gregkh@linuxfoundation.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mfd@lists.linux.dev,m:srini@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:conor@
 kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3C76757579

The PSCI "reboot-mode" node does not define a compatible because it is a
configuration of boot-states provided by the underlying firmware. With
the new firmware-node based cells in mfd-core, this node can now be
exposed as a proper child cell.

Add the psci-reboot-mode child cell to the psci-mfd driver with a
named_fwnode. Add psci-cpuidle-domain cell first to isolate it from
reboot-mode failures.

Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/mfd/psci-mfd.c      | 30 +++++++++++++++++++++++++++++-
 drivers/power/reset/Kconfig |  2 +-
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
index 7affd6bb09dd..8c6b78ac471b 100644
--- a/drivers/mfd/psci-mfd.c
+++ b/drivers/mfd/psci-mfd.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 static const struct mfd_cell psci_cells[] = {
 	{
@@ -14,10 +15,37 @@ static const struct mfd_cell psci_cells[] = {
 	},
 };
 
+static const struct mfd_cell psci_reboot_mode_cell[] = {
+	{
+		.name = "psci-reboot-mode",
+		.named_fwnode = "reboot-mode",
+	},
+};
+
 static int psci_mfd_probe(struct platform_device *pdev)
 {
-	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
 				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
+	if (ret)
+		return ret;
+
+	fwnode = device_get_named_child_node(&pdev->dev, "reboot-mode");
+	if (!fwnode)
+		return 0;
+
+	fwnode_handle_put(fwnode);
+
+	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
+				   psci_reboot_mode_cell,
+				   ARRAY_SIZE(psci_reboot_mode_cell),
+				   NULL, 0, NULL);
+	if (ret)
+		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);
+
+	return 0;
 }
 
 static const struct of_device_id psci_mfd_of_match[] = {
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 93e4029d9506..b736a80eda00 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -350,7 +350,7 @@ config NVMEM_REBOOT_MODE
 
 config PSCI_REBOOT_MODE
 	bool "PSCI reboot mode driver"
-	depends on OF && (ARM_PSCI_FW || COMPILE_TEST)
+	depends on OF && ((ARM_PSCI_FW && MFD_PSCI) || COMPILE_TEST)
 	select REBOOT_MODE
 	help
 	  Say y here will enable PSCI reboot mode driver. This gets

-- 
2.34.1


