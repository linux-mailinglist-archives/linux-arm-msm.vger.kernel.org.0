Return-Path: <linux-arm-msm+bounces-119087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id scqKIa9vVmoX5gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:19:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 848B9757526
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:19:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SyMiKhuB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UAPnZh0w;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119087-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119087-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A9A63017CA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 17:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF144A13AA;
	Tue, 14 Jul 2026 17:18:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E8D30674B
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:18:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049519; cv=none; b=ZSo94w8O6M79aW7qpw5wZdBjuD2Lah5CjM2hlWRN4lT+PK2vGsb+0z5s+vr9+P3wUb0iY8Lx2sT1/BGKKkBJWVMVgH//Hvvs7gwuk/f9Ob1CnZ4dxa8Gypphei3NSM1svaLfz+6sFpAxaW8bMPozLu72nuR9cb3DGC3QMqWNyc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049519; c=relaxed/simple;
	bh=Z/HoJXdAtZ7QJgARbgQpZ4UcAlYil6V3oBtsMpR4ihE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hSfJWcx8GcoTiUH1nvcwM5gRwndtIVR0TNbTeMUkV0DNh6gA/j7CK5FWN9c8/3L4yMpTd2RFZp8Yzef8YuJKjYYJsxNDZOuS4nMYA/SgvCni1j2eKDMC/BTXqWKeZAEdPkShLot4z5ylsRzgbUBqwB/7ULvC6zl7W89BjIqGdVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SyMiKhuB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UAPnZh0w; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6uxs975504
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lgh4YODdsRL2iadze+USZ/JyD5VPsxlZsZRCppKGG/c=; b=SyMiKhuBEFGFFMOG
	LAglW1TGtpv/TspKS7Wg3pvdduKYdbbfmGDlAH7ZKt8tBULqrXsn9uiHVVJkDgoG
	W+B9IpwImW9+7Yn1J0t5CeEhONPr8r5gxb1vOFFGPWRDiXINfSu6IhY+XMvE9OLN
	RMTd9uyxtWqVBfl/ZDUuqhXKNL80/B11nO4AqON2iXz5ghYKsCQcKRqsMKqBnJJ+
	pY0P5grkstTY4pn+v6idCcmd+u2VfipEYrotii3oFGfll7NjymxlsXncsMuVzvZH
	6A+G41QOBNlW1UHBofIp1ZcElq0iuK3oR/CXChgkp88QfmAr2TVMyuwXZmKyQiZk
	+w70Fw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgeq2dbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:18:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8487eb67173so7161189b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049516; x=1784654316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lgh4YODdsRL2iadze+USZ/JyD5VPsxlZsZRCppKGG/c=;
        b=UAPnZh0wT7HoNqtfp24yEguHlQ0XSy4oqaZ/oQnKK13q4GOzIQGiqLADHqjso98TKG
         q0iJIQ1P2xaY/D83GeUUALsg0jZeSXkAdYEblNCeEJhGwH41UPQ7JaCepcmyNP7eUL6V
         mK47B8N2PsNKQUa+h9L/hD5zW52a9c/sp+6ChutGRxMuTHz/Z+0FijEw/E7Bdu2OvcBA
         sZkcA8In3TSKnwVoc6tFxFBc9OLKJQ/YTJPZniGVJCyTQXCsQ6GP1QWHBh0TgtE4i21Y
         6pvooyHHjRa2karcg2PGVtVpqCFUYaHhwzJDX4ELN90OjRUf6a69LMfA41BWrRuGDhvu
         RH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049516; x=1784654316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lgh4YODdsRL2iadze+USZ/JyD5VPsxlZsZRCppKGG/c=;
        b=edfccjPqTbJwj2OcREeOAMb/b4QK4XzrPg3ZKwPDbyu5bFO7lZ5Zx+7ah5v1DCD3fF
         Fss85owNPMFmCaTB64RChTmbCBiZHzsVxYG2dyoVV5mdRiDcHq2sfdj8RC62BXwoNN7Q
         /Xs6qDbFMGWyAmqRTXPIaC4bG791AxIPn1VnIaG/964AfZsrhT3g6XAuAgMfgSBv+fqK
         CKaMCuqXS9ycWRChOYCeZU82M9hX7N6k8yEPfd7Q2yNvjyxOnArIOrQprP5mCxd/djUm
         UGbJvwCxjCEDFD1ARRhiKSlcUktpo60zWEiRBAzs8mKYjvf5NSE+SuU9O+m5ofx3sC+v
         DWHQ==
X-Forwarded-Encrypted: i=1; AHgh+RofAvvlcBizOt2GlQM0OQNrATUF+kIg0QnnJcsQKsJ7p7ykQWBxFLwOxjuwZGzrB3AbZ/jHUXOPXP3Uqqth@vger.kernel.org
X-Gm-Message-State: AOJu0YzFQZsuz1oI4m6MnZX9jq+GG6kSC/1Ut1XGnLL9i4t2nuld+1w8
	J2ECPnugi9/XqD7Wzg+dhEhFrQTETpik53FBvzCap8pKFBffYS4jtbODK7Gpc2K2zBan4z1zCw1
	94pQGDvLLsKt3V9c4ey8y8j28yBVnQp8+7DeBTGygotUAex+QdRoHz1O4DwVMzdnbns2J
X-Gm-Gg: AfdE7clCoJDD9Jk2ilkgIsCALe2i5R4yqBPNzL1cV7tXy9KLYbGtbVWCbGe6WmEGnoH
	tA9ZbeYoQ2sjGiHlnYOdfC0XtktGvSR+q4JEpemM6ZfLllOb8w18UmIYxHJgoztrnxrc4wFD2NP
	jKJjvRUNXlfsefgoblv762cZvkHEmJ+06nY609a5LJKmqZL3CuMHE6x/J4SaCRpT1qNIs6+WxLM
	QNq1goPvzzJsIPPg4dYXzBwfyP+23PEQfL8d+Sws7wfYtdfxBe80QB69JVihGfN0Qm24zHR58Rb
	mtdISBh9xP9fDwaaiiq6pdIlVatXm/Fk2GpAR0EffMPsNaGsgGec8R0WYGNp/LGdqzHbL1prCfs
	UFUGf2eShU18gF2ZBiBp1isBh1U2WjwShmBvctySWp1WcQFo=
X-Received: by 2002:a05:6a00:a0a:b0:848:2f73:8ffb with SMTP id d2e1a72fcca58-84a51658d90mr4261340b3a.68.1784049515434;
        Tue, 14 Jul 2026 10:18:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:a0a:b0:848:2f73:8ffb with SMTP id d2e1a72fcca58-84a51658d90mr4261285b3a.68.1784049514895;
        Tue, 14 Jul 2026 10:18:34 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:18:34 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:39 +0530
Subject: [PATCH v23 11/13] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-11-e7453c548c21@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=2178;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Z/HoJXdAtZ7QJgARbgQpZ4UcAlYil6V3oBtsMpR4ihE=;
 b=NaGRjqx/cA+/1xxaf4JRY1stuUiBVDE4/O5+Y6k9ajUNbjjxsYWFrascqLHoEHnRcwwMr0haC
 V0njs5oGlkgBrHPIGEO6WpR56MRLhWFK/13OcpxwoIQxt5U9fMLpEoP
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX1nfachqsE+CV
 ZrCEHLO6q2f4cBVVnzul6fvC3NWUnrc1iD6Lu/6RaWQloAjtpj4VY1sSDF3erqMI7ijst3rbCxh
 MTgycZueC14f8JDm0aF7vP6EAZKk7XQvZJZYHGXbWpBrf2dV01l3pqQCL4Nt+0ktvvJewxsX9GX
 WYPjUhj9URCPS82erxHZMogXeG/MdCTKwLQ1ZFJciZ0+CKD/b2uvzWUXqiU5SY+pYav03+TIcs/
 Po1GtUriPXz3PZ6DJ1RCEw8mKzjetPUzcqJ67TM/QS09vXA0eMVL8EnO9qVhJXvxjRvkVbrk69x
 1U2lhBJAUkmzjv1zjTzUcAAzmijxB4o+RXjr37P/qbTDQOXHuxdQ2YlgCHynsGgNZZjMyspMSrk
 RCXoWVwPm7uku3EAIiX0LurPqHheQjDNXI4XKD+zXlQ5foplHUhNIPxA0iEqvu8r67qfLdiqDHk
 RE2QXREOonP2g4LLqaA==
X-Proofpoint-GUID: nKZwx5jHAeEZDqbh-lm7bsgIsL87AvJu
X-Proofpoint-ORIG-GUID: nKZwx5jHAeEZDqbh-lm7bsgIsL87AvJu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX6o8zMoVhTVca
 m3pZgBZ+UogXRInP5kzDQTZdQFKMmtzH2Kovep7WNMoWK2HZemWgKHcAIR6zazpSifWl6zUFGFt
 TE6jnCKqldYfG5MlpZv/7P+GEXk99Qw=
X-Authority-Analysis: v=2.4 cv=V9VNF+ni c=1 sm=1 tr=0 ts=6a566f6c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119087-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:ulfh@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:arnd@arndb.de,m:Souvik.Chakravarty@arm.com,m:andy.yan@rock-chips.com,m:matthias.bgg@gmail.com,m:john.stultz@linaro.org,m:moritz.fischer@ettus.com,m:brgl@kernel.org,m:sudeep.holla@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:shivendra.pratap@oss.qualcomm.com,m:florian.fainelli@broadcom.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andre.draszik@linaro.org,m:gregkh@linuxfoundation.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mfd@lists.linux.dev,m:srini@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:conor@
 kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 848B9757526

Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
qcs9100-ride-r3) for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 0c53640c42a6..3baad102270d 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -911,6 +911,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c19_default {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index cefb8ff00806..cc96442403e8 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -800,6 +800,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 3b0539e27b51..55a3fac0c4c6 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -549,7 +549,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


