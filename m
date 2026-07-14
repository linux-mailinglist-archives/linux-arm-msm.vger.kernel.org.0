Return-Path: <linux-arm-msm+bounces-119086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cmmMNqpvVmoU5gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:19:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3F975751B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:19:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pj+DyRlc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZveenGZc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119086-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119086-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC2A130570FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 17:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6246D449EB6;
	Tue, 14 Jul 2026 17:18:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1052F2848BE
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:18:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049509; cv=none; b=ip7OfZTb4Qinq3K6/DH2xLcvMOTDHyTEtOWhnP1hqsgORsslj5XLWl4q+dIS98LWfdL05cmQFzol930lUFjgKcyvZ7MIcwfeSDOj7YcmDTK2oQ1rvUeZc2ebBQzaZxmQIxe7WD0iG5P4Y7N7KtDbj/LGyiauhdOZ/WBO9/fQC60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049509; c=relaxed/simple;
	bh=PUOB/WUFiDir0kcvDNojilOCna+Is8nt41EZNien9Ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GwLlZ4OGASbRn2Svql2Y1elOtrdfK5SNiFqPx/UlmQlPbhdmDNWee8l9XP22Ymb65zDzHfHcLpUhPwsSMdqtbWMseOAWG5wVzJF9UE6nM2zHBaZwmgCcOHFVmWFS2+6MjQAFgEPJTUKP1TFqq3/t1dgvmxjjDI9KT3/KJZtXuC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pj+DyRlc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZveenGZc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6uaB975509
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gG7R/01sqhJDRepizNPrgnwNsv/MIBa9LUQwgiZjRW8=; b=pj+DyRlcHZB4KDEq
	Nyo+dST9tBKMJxKuyLZw/7K/s+E12bczgmD6bODwSreG4Wpw6AYDFsh2+Td6Mp6P
	hZitrFRK/qLghv7wFT84ICnhwGMiAA63ohKh/UT5d9NUyp4HcKDSP+QboM9XTXCn
	zZ+NBRYMTwwvXETcg7d4GLFQn/TcF2vpAIGiM10kMbydWocyBVolvscpk9JxqOuY
	S7kZehoVzaYWPY9+U9kMWfRBBDxKbOV/GuD1oMbcfJ4UIC3vZREWVhnDVKEoxrgm
	vqjYIoJjWqtLRrF/UjWvrw08745qbHrfaDNkEjn3QUbVJmxv2umFvFm0qIiA+PXB
	RFEy/g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgeq2daq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:18:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848474825ffso1890821b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049506; x=1784654306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gG7R/01sqhJDRepizNPrgnwNsv/MIBa9LUQwgiZjRW8=;
        b=ZveenGZca4o/kC4PMlvnA7txYltNShO/OO4T8JWNGtSNwSUFetbi8HSJXdvLQrEsuH
         5iFgaPeqNuDJYtCUD6DQKPCGyDl0Wk3jYcGKyLfpmapraGISXAZbm3m9g33LctZC9Y2g
         jh34FSwf0yeEefPl87aQqf4/ZXmfjivIzyDquXx/Cga4UA79hfAQWCWc/+QZe78BB2Oa
         wmUNi+3/PBrhYTbbXKaKihtHpkgLHqvdvGUorFpPl8OQsmxl9b1khuT5N097TZcn75oJ
         H93XX0J3HQlD+hCtFQFPx73jnvbVcmQ5Ql2EMB+y4152FnBEapyoTI070066WTcke46Z
         ViYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049506; x=1784654306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gG7R/01sqhJDRepizNPrgnwNsv/MIBa9LUQwgiZjRW8=;
        b=WnAm6fF8pBeD4i0sGf6jUdVnP3HcE9D0YTcdv8cH4FBjjCoTrB0QHrFvpUwuqC8cdo
         L5Uw4dn2ruT9/gHl2bqRz1scEhBnd4LhU+y7BjkGWrNHWNopMl8bJARKHXxBthWhT4rd
         qcZb8I29Kib6DH365kYlI7WzVImbDd0ouvl2b81PJz0oe0/vU3DKGfFP22pHnM0T4G6g
         5EAUexhJGt8WhmR+MT6M5vh9MkJa1rgIVbqLpihLWc3w56VYILUYlAxXS5TDwn5bHxa/
         +iGSo3WU8Wh0bzep+jU/QXlUcM+go0dFBfrI/T/6vf+d0RaBt3vHSJGWJdqSuZBIF050
         3w2A==
X-Forwarded-Encrypted: i=1; AHgh+RpozVAaMB6cWFgIlFNM8AgVA+MwGrWJlJJhguGOvci/mYp/fCSDatf070OENKBU3hjp4BFHj5zK/a5migBk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx91Ij2yOz+9vyM16Y7ZgkmqGIsnh3+KZ6/mWRdhb4nFLZ70o+8
	ExvjPtBgz4LwieD+lL1+50ixgV0isgY4+75V84x+9+FYWVPjfbo73KuIfM0RPcRvShrVNruxmdk
	Knm4GvAnsJ+SKIvORnJ7ZrFYA0cQBVaZdhDarysp5Ab9N6zkLsZGdO9lz3avqBTRnQsIV
X-Gm-Gg: AfdE7clATOHXG6vvPPheYka7XMRcsmjESJTrwe65yNBvLz2Uzn9/8rp7mdl3kandBKL
	xlZrYtpn9kTyq8FErx/ObEaDzW4RbqCjM5mrevSfUb6HW5wSWA6DRBG9Dp0pzBVusG1GfjUhMYI
	/9SlVA6AgSooyUFTbZ/C+GKQEsFbBARNldtojCkM942i7OAssHCLyFK2fUGx6q3OCfjv5olRyRM
	Rhd1QCxnA1nRITnIDpmlWz/1YQm72rLQlDQv7wvc8UVVMm0ewcXtXYUkkvuHC1ozL+ttD6MRxH3
	C/l3ExWMmJPLYsCFIHGqUPoRfzhmbJaq2WrltkTE0LlqqFls5FhFlNhrCWfegk9xo7nXqaKnKp4
	kH0aSy88ICNrAMLp79IYNDofv9CGcLSd1C4KirjZ+FcK5OVA=
X-Received: by 2002:a05:6a00:1a87:b0:848:57f3:8f92 with SMTP id d2e1a72fcca58-8488abc3652mr12495396b3a.17.1784049505565;
        Tue, 14 Jul 2026 10:18:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a87:b0:848:57f3:8f92 with SMTP id d2e1a72fcca58-8488abc3652mr12495342b3a.17.1784049505079;
        Tue, 14 Jul 2026 10:18:25 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:18:24 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:38 +0530
Subject: [PATCH v23 10/13] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-10-e7453c548c21@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=2145;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=PUOB/WUFiDir0kcvDNojilOCna+Is8nt41EZNien9Ag=;
 b=KWNkfXMmKYthJN1uiFBbtCUXReE0eGK3H1pxspQgqexOI1PPkEewBDCDbvLzZhUdhh0OCxaDh
 BwcB08aHB/3DrxL54W/bnlwFFGWJlmFNQDZ+h9ABzFiYnUXo+kw1SS0
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX/qRNdfV48H0I
 cXU9OPAD91tVAxPRN6n/WpmVOX8HF3MEmXJQVHt+0rrGyxwDbyQiaYw8gEuHhDzta/M70FQfIAz
 7djCyqoNEc+x5/Fdrnck0aT9mr9o/wjmQEEYb37eoqceo68ck3HxIi+XaSWRVfP//45czCHNLCN
 jtoc0Lm9WmXCjhHYcHg60Td+j1hVMqkf9BZhoqY1MLVvfKIqg2/XXnp/Qtj8E+2x0lKJYQncDUw
 oOcrm+wRluoKs5BvlmEIMOPOl4cDTZgFmwZ/DItkIvnFdVuXssbSsbECdxrcwB1Xi+WAO7f1Pw1
 /quHUVsMDEkL/h07cBSgVU+cFjzNMYi5Hdayo/BsW3yCnUqgskLNk5X/Sw9/46tXlFj1hsnxx9i
 VU7CbZqaGCrDXpikfGv1wTmsaKO6bMBXJZKS0HrHJ3+Y2aXnz6rZ6Y/69/CbdbiA75CmyL8xYUi
 3SixjjWFv8oBmVTtN1w==
X-Proofpoint-GUID: 3nPAINJovWcDdhvdDLxlyQUvjD8a0vbQ
X-Proofpoint-ORIG-GUID: 3nPAINJovWcDdhvdDLxlyQUvjD8a0vbQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX38tmI3skIFly
 YRF+IP1fg2vGiiyDOR9V586D/mc+MhgZuqzev8kCN+u5HNnmCk+WSoaVFaSVA4qoSJHg3WV90wP
 I/Zru1/KyB4NH8tOMrLvkfQQUBL7tr8=
X-Authority-Analysis: v=2.4 cv=V9VNF+ni c=1 sm=1 tr=0 ts=6a566f62 cx=c_pps
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119086-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:ulfh@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:arnd@arndb.de,m:Souvik.Chakravarty@arm.com,m:andy.yan@rock-chips.com,m:matthias.bgg@gmail.com,m:john.stultz@linaro.org,m:moritz.fischer@ettus.com,m:brgl@kernel.org,m:sudeep.holla@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:shivendra.pratap@oss.qualcomm.com,m:florian.fainelli@broadcom.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andre.draszik@linaro.org,m:gregkh@linuxfoundation.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mfd@lists.linux.dev,m:srini@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:conor@
 kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 3D3F975751B

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci-reboot-mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all kodiak based boards.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 7e73348fe0d0..82713f49ba63 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -866,7 +866,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..b7a0b5347639 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -786,6 +786,13 @@ &qup_uart7_tx {
 	bias-disable;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e9a932c90d14..0dd67cae41ff 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1105,6 +1105,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1


