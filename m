Return-Path: <linux-arm-msm+bounces-119084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fQX4EFhvVmrk5QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:18:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C97F17574AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:18:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="MwdR8/Xz";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JE7YixD+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119084-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119084-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A55D3034466
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 17:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9675039CD0C;
	Tue, 14 Jul 2026 17:18:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EDB2848BE
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:18:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049489; cv=none; b=icv0s/fsRTyYsjHs7w1dSdqqiNG4EeecThGW0c1JaeBXA21eg4uGdlp8nTki1lvSznI3GKvIzpjl9AQpBoeZAKqOugSAyE1Z0cqRWEVqIg5L7K9zm+nQVUr4rXyWKZ+i5L/BhRfKej5wPsPuXw4Al2e/uAdS5CfERjYRB8zB5sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049489; c=relaxed/simple;
	bh=xpBz08jTmXyusCjePfq1hVafxvJ109djGJUNB0orD+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LquF65ZOhXWEzx15slGkzzArJ4KqPctWaJpY08pHBOtEPeIqC5FL+mB2D3saw5LuC6dH7g0w1Gh773IwgcwcH/EYynBsI8aAB3wVTX/tyDcUJnS0vjDJ6mGg/LASdP+m2ng5xlaEvVgwVsNJMFap3xheN7UIS3b9uIUSmIexn9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MwdR8/Xz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JE7YixD+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG7EEb879777
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8s7l/m7UGxkZIIDkB6Sh24bMViJas+fhJLKeQf2TBPU=; b=MwdR8/XzC7jmZcmC
	T62ytHmTWUJFu8YBB7JXFSNibli9m1pMFh0YKAV/hkv/PrBhi9ZP9PaGmJe5Oogv
	bqBQuAG0tx5XqSW30+Pjmk+oHl41zBOhxoL5EPH8QF2mhMlM6+qqLT48Ei17fCX+
	I3hmssAVq/R3aqwNx6/Yd5jMCC6tU5ZxHxe3cIcoriAXqtROLSDDS87F2/xZO1GV
	ZaUzc1HWd6blOoEFpCn3M/Jyhe2nrJ8xjYMJaZKPaBd4wf/lgvknGLqLi5yHJDhQ
	gNrwYALaUa6KJVEsvUogQi9DFwMq+PcJq56xIoKwFSLrcBsg00P6yp/crTTfnF9T
	PO+BUA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnp0h426-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:18:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848551b54f5so8790280b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049486; x=1784654286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8s7l/m7UGxkZIIDkB6Sh24bMViJas+fhJLKeQf2TBPU=;
        b=JE7YixD++plJgvMT4O6iZ0misqcVF2yTfnHkApeOAMoviWvpxGXb5OtIX5DmQ/umFD
         ajmzaZPfHBdwayrwBDie/1ebh6acgsn0umrs6xWzrbS2/U8OgQWscXwALBwUL96VXovm
         UqFVTbXRBbPCVtChuyPJbb91Le0uAQBeNOpaj5mATG5Firo9YdoHHFl/xt5lq7w+vGt6
         IjhsogpbXPhDTBGMrhZiG4PEejKtvt4D25zd3LJ0dzLXJ/qiJhTR0inJvFxFBOlyjsUt
         M+P9PYtnsjFoduSLV1jfAjUGaNM42sbq1v/g4IO249dsSiFjT/h72SZMeVbxTUCxS/wB
         5r3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049486; x=1784654286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8s7l/m7UGxkZIIDkB6Sh24bMViJas+fhJLKeQf2TBPU=;
        b=DzLeECIHr+x3mH9DddhTkE1OffXB9zlAykUK1jgxu+uMnKVPo+tSqdfz2v0eJWmn+g
         YXH/8Tb2cy8CEB1ZCEFNqbqQ1qslDK4U54s7pHwqle+Ze+xAOcuHOoGZyxl75LLi9LoL
         Xle5Lo5J06z5Fqc3bdBCrg+/LwimyC9e8GnkyXmnS1WkZkBaOyD89vDxIOMVWqSKwjo2
         D6+FyVkz4FZZ23y3lGnbkOU+5ghVfQIkq8OetAhl/THnNfTQvy+jNlzhjLO+YjhZDZe6
         kpVz1MI3GwDEUm/6pajdgEnu0R5VWqXoBFoYbBMa1j3vceP6ffuNFPS6MMJE0xHw9dY8
         TzUA==
X-Forwarded-Encrypted: i=1; AHgh+RqEFNtvPaqz2Llw6mL2RcnjGOV7JED7Dm5o0SdCCbXLKwGIt9/YA0u/CpMbGiSuVuFAkox/Uin5KbGamccx@vger.kernel.org
X-Gm-Message-State: AOJu0YxgsRD4S4OFoBfqrFUMAblITZKvX9nfGkv2M8U8hrNjS4HwFbgM
	14agaWlQoJpmy2K3+d2aSDBXkyrggNUfKP28PCG8+2v6RLqcBhHlVKQ6aN4SEwq/N4GBGtjwW4k
	/FjnbyUvndWw/ooot3nFqFq4jjmIqh+/4rI/zdF8lqjwCMGPoBJoG4p3SI0ql5d+cu/tX
X-Gm-Gg: AfdE7cm79tXGQzXHhJKDri94aVoJwo0z54BZ3EhaatAnkNqVubPW4uA4dm8hLgEmQaL
	Efu80YfZXRbXW7NP6YWnVMhV+UQErFKygMgiSpEs+e7Vaqt9VYGTyAF9XM45+oaRgOVRKF4cW0e
	nHDQEw3lCT3bWdsI7cYmNNf/Rt9Fd42tWPXFvvZeQ/3Mi8A9v5kND1fGulUER+quJX+M+xbzyCS
	rtXNcQqTQ6PZn6mxQOEGvhPmm+O7PnpZQ3vwYdvfgrjyhLmjw2VBG92PzzMymBCWocpdxwuXoPM
	IJDkpazcm1Kc99U3mMzdjzBCt2F9ve6S4kDqGOcr6BCIquoG6p2Cmh+mIjnXAqjAsDcAzpORQlw
	2v5SDYySkGujMQkF6NNKNfOTPu4BWOlLSeI/TBbe9BhCF6Ww=
X-Received: by 2002:a05:6a00:8d1:b0:847:8704:1c48 with SMTP id d2e1a72fcca58-8488961992emr13510264b3a.20.1784049486342;
        Tue, 14 Jul 2026 10:18:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d1:b0:847:8704:1c48 with SMTP id d2e1a72fcca58-8488961992emr13510216b3a.20.1784049485746;
        Tue, 14 Jul 2026 10:18:05 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:18:05 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:36 +0530
Subject: [PATCH v23 08/13] mfd: core: Add firmware-node support to MFD
 cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-8-e7453c548c21@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=8008;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=xpBz08jTmXyusCjePfq1hVafxvJ109djGJUNB0orD+8=;
 b=KXZZ51uhN5KQpmxnw/BcJEipsOj+v1rq8O/+vuB7MR4ZBpdH4zXSPh1vcBBbaGBLatOIJ7tI3
 XDEbJayfgkMDK54Wj3oA6XDxJxXNlYM5G3JYYHiV9uKvkyjsv5yH5Ci
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX9+o+s92eUuXD
 Kmr9+mXzqjsN+LlACbz3ftIk43bh096JpRBci+brURGUA+7G0nKSrtGQgCPMDRic4qQ45U1XtPm
 g5ObCsJaPRhRhrDZUxhzEQselXVCr7k=
X-Proofpoint-GUID: Q3eM7Ul0aMF8yjTW2886dn9XWxKpMENL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX8M0z3j3aH8x+
 V+NchZo/lrsFpaQOY7XFsMIlv8WAscGzRoO11xU/gOpRC0HdgQ/gZbn5G1J8QBtrmWZIW5B2Mbl
 RF530A7o7TlGo0upDNMKnCkenCjLGPq9nuJYWM6WclZ+suVheNeHf7DVTzhat8sgWbtZo1i5XMv
 94ThrFK5QBsUHlbr2q4H0yE0vbUvhBq0OzB58uF857qO00Om9SVcTk0DfdzMGgEUt2Vlq/26dyP
 8UgJJCOtniPD8OvQ7vsN86N+sHbYyOe8yk+WRtLjERs1WwG65lBsE3q4QZ5iC5fvYio21ZyA0Ss
 KAa0MhQbiRquNTonPfYMctEYMVhb4bU7qBCkHcCz/aq4FHm9hjnVB+4QLsID/PtPcRmPbhsEmuT
 zBasANDehs5CHHOu82J43Unzs5MqYwCgU8BKpHkqXGEdw/0i4OQCHKSx4PjchGTJKPmpulbUTBH
 0E0DnX76LqSw7UFcouQ==
X-Authority-Analysis: v=2.4 cv=FtM1OWrq c=1 sm=1 tr=0 ts=6a566f4f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2Layw8R8_bQqnRkAqW4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: Q3eM7Ul0aMF8yjTW2886dn9XWxKpMENL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119084-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:ulfh@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:arnd@arndb.de,m:Souvik.Chakravarty@arm.com,m:andy.yan@rock-chips.com,m:matthias.bgg@gmail.com,m:john.stultz@linaro.org,m:moritz.fischer@ettus.com,m:brgl@kernel.org,m:sudeep.holla@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:shivendra.pratap@oss.qualcomm.com,m:florian.fainelli@broadcom.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andre.draszik@linaro.org,m:gregkh@linuxfoundation.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mfd@lists.linux.dev,m:srini@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:conor@
 kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: C97F17574AC

MFD core has no way to register a child device using an explicit firmware
node. This prevents drivers from registering child nodes when those nodes
do not define a compatible string. One such example is the PSCI
"reboot-mode" node, which omits a compatible string as it describes
boot-states provided by the underlying firmware.

Extend struct mfd_cell with a named firmware-node field to identify a
child node under the MFD parent. The node is added to the MFD child
device during registration when none is assigned by device tree, ACPI,
or software matching.

Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/mfd/mfd-core.c   | 142 ++++++++++++++++++++++++++++++++++++++++-------
 include/linux/mfd/core.h |  10 ++++
 2 files changed, 131 insertions(+), 21 deletions(-)

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 7aa32b90cf1e..ba9682ead2ca 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/acpi.h>
+#include <linux/fwnode.h>
 #include <linux/list.h>
 #include <linux/property.h>
 #include <linux/mfd/core.h>
@@ -22,6 +23,7 @@
 #include <linux/regulator/consumer.h>
 
 static LIST_HEAD(mfd_of_node_list);
+static LIST_HEAD(mfd_named_fwnode_list);
 static DEFINE_MUTEX(mfd_of_node_mutex);
 
 struct mfd_of_node_entry {
@@ -30,10 +32,91 @@ struct mfd_of_node_entry {
 	struct device_node *np;
 };
 
+struct mfd_named_fwnode_entry {
+	struct list_head list;
+	struct device *dev;
+	struct fwnode_handle *fwnode;
+};
+
 static const struct device_type mfd_dev_type = {
 	.name	= "mfd_device",
 };
 
+static int mfd_claim_named_fwnode(struct platform_device *pdev,
+				  struct fwnode_handle *fwnode)
+{
+	struct mfd_named_fwnode_entry *entry, *iter;
+
+	entry = kzalloc_obj(*entry, GFP_KERNEL);
+	if (!entry)
+		return -ENOMEM;
+
+	entry->dev = &pdev->dev;
+	entry->fwnode = fwnode_handle_get(fwnode);
+
+	scoped_guard(mutex, &mfd_of_node_mutex) {
+		list_for_each_entry(iter, &mfd_named_fwnode_list, list)
+			if (iter->fwnode == fwnode) {
+				fwnode_handle_put(entry->fwnode);
+				kfree(entry);
+				return -EAGAIN;
+			}
+
+		list_add_tail(&entry->list, &mfd_named_fwnode_list);
+	}
+
+	return 0;
+}
+
+/*
+ * Temporary MFD-local cleanup for named non-OF child fwnodes.
+ * Remove/rework this when platform core starts owning and dropping
+ * dev->fwnode references for these devices.
+ */
+static void mfd_release_named_fwnode(struct platform_device *pdev)
+{
+	struct mfd_named_fwnode_entry *entry, *tmp;
+
+	scoped_guard(mutex, &mfd_of_node_mutex) {
+		list_for_each_entry_safe(entry, tmp, &mfd_named_fwnode_list, list)
+			if (entry->dev == &pdev->dev) {
+				if (dev_fwnode(&pdev->dev) == entry->fwnode)
+					device_set_node(&pdev->dev, NULL);
+				fwnode_handle_put(entry->fwnode);
+				list_del(&entry->list);
+				kfree(entry);
+			}
+	}
+}
+
+static int mfd_claim_of_node_to_dev(struct platform_device *pdev,
+				    struct device_node *np)
+{
+	struct mfd_of_node_entry *of_entry, *iter;
+
+	of_entry = kzalloc_obj(*of_entry, GFP_KERNEL);
+	if (!of_entry)
+		return -ENOMEM;
+
+	of_entry->dev = &pdev->dev;
+	of_entry->np = of_node_get(np);
+
+	/* Skip if OF node has previously been allocated to a device */
+	scoped_guard(mutex, &mfd_of_node_mutex) {
+		list_for_each_entry(iter, &mfd_of_node_list, list)
+			if (iter->np == np) {
+				of_node_put(of_entry->np);
+				kfree(of_entry);
+				return -EAGAIN;
+			}
+
+		list_add_tail(&of_entry->list, &mfd_of_node_list);
+	}
+
+	device_set_node(&pdev->dev, of_fwnode_handle(np));
+	return 0;
+}
+
 #if IS_ENABLED(CONFIG_ACPI)
 struct match_ids_walk_data {
 	struct acpi_device_id *ids;
@@ -111,19 +194,11 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
 				    struct device_node *np,
 				    const struct mfd_cell *cell)
 {
-	struct mfd_of_node_entry *of_entry;
 	u64 of_node_addr;
 
-	/* Skip if OF node has previously been allocated to a device */
-	scoped_guard(mutex, &mfd_of_node_mutex) {
-		list_for_each_entry(of_entry, &mfd_of_node_list, list)
-			if (of_entry->np == np)
-				return -EAGAIN;
-	}
-
 	if (!cell->use_of_reg)
 		/* No of_reg defined - allocate first free compatible match */
-		goto allocate_of_node;
+		return mfd_claim_of_node_to_dev(pdev, np);
 
 	/* We only care about each node's first defined address */
 	if (of_property_read_reg(np, 0, &of_node_addr, NULL))
@@ -134,18 +209,7 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
 		/* No match */
 		return -EAGAIN;
 
-allocate_of_node:
-	of_entry = kzalloc(sizeof(*of_entry), GFP_KERNEL);
-	if (!of_entry)
-		return -ENOMEM;
-
-	of_entry->dev = &pdev->dev;
-	of_entry->np = of_node_get(np);
-	scoped_guard(mutex, &mfd_of_node_mutex)
-		list_add_tail(&of_entry->list, &mfd_of_node_list);
-
-	device_set_node(&pdev->dev, of_fwnode_handle(np));
-	return 0;
+	return mfd_claim_of_node_to_dev(pdev, np);
 }
 
 static int mfd_add_device(struct device *parent, int id,
@@ -156,6 +220,7 @@ static int mfd_add_device(struct device *parent, int id,
 	struct resource *res;
 	struct platform_device *pdev;
 	struct mfd_of_node_entry *of_entry, *tmp;
+	struct fwnode_handle *fwnode;
 	bool disabled = false;
 	int ret = -ENOMEM;
 	int platform_id;
@@ -224,6 +289,37 @@ static int mfd_add_device(struct device *parent, int id,
 
 	mfd_acpi_add_device(cell, pdev);
 
+	/* named_fwnode is a fallback only when no OF/ACPI match and no swnode */
+	if (!pdev->dev.fwnode && !cell->swnode && cell->named_fwnode) {
+		struct device_node *named_np;
+
+		fwnode = device_get_named_child_node(parent, cell->named_fwnode);
+		if (!fwnode) {
+			ret = -ENODEV;
+			goto fail_alias;
+		}
+
+		named_np = to_of_node(fwnode);
+		if (named_np) {
+			ret = mfd_claim_of_node_to_dev(pdev, named_np);
+			fwnode_handle_put(fwnode);
+			if (ret == -EAGAIN)
+				ret = -EBUSY;
+			if (ret)
+				goto fail_alias;
+		} else {
+			ret = mfd_claim_named_fwnode(pdev, fwnode);
+			if (ret) {
+				fwnode_handle_put(fwnode);
+				if (ret == -EAGAIN)
+					ret = -EBUSY;
+				goto fail_alias;
+			}
+			device_set_node(&pdev->dev, fwnode);
+			fwnode_handle_put(fwnode);
+		}
+	}
+
 	if (cell->pdata_size) {
 		ret = platform_device_add_data(pdev,
 					cell->platform_data, cell->pdata_size);
@@ -295,6 +391,7 @@ static int mfd_add_device(struct device *parent, int id,
 	if (cell->swnode)
 		device_remove_software_node(&pdev->dev);
 fail_of_entry:
+	mfd_release_named_fwnode(pdev);
 	scoped_guard(mutex, &mfd_of_node_mutex) {
 		list_for_each_entry_safe(of_entry, tmp, &mfd_of_node_list, list)
 			if (of_entry->dev == &pdev->dev) {
@@ -382,7 +479,10 @@ static int mfd_remove_devices_fn(struct device *dev, void *data)
 	regulator_bulk_unregister_supply_alias(dev, cell->parent_supplies,
 					       cell->num_parent_supplies);
 
+	get_device(&pdev->dev);
 	platform_device_unregister(pdev);
+	mfd_release_named_fwnode(pdev);
+	put_device(&pdev->dev);
 	return 0;
 }
 
diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
index faeea7abd688..8daa83dd31ea 100644
--- a/include/linux/mfd/core.h
+++ b/include/linux/mfd/core.h
@@ -80,6 +80,16 @@ struct mfd_cell {
 
 	/* Software node for the device. */
 	const struct software_node *swnode;
+	/*
+	 * Name of a child firmware node under the MFD parent device.
+	 *
+	 * Used only as a fallback when no firmware node is assigned to MFD
+	 * child and no software node is provided.
+	 *
+	 * For Device Tree parents, lookup is by base node name only
+	 * (the part before '@'). Unit-addresses are not matched.
+	 */
+	const char *named_fwnode;
 
 	/*
 	 * Device Tree compatible string

-- 
2.34.1


