Return-Path: <linux-arm-msm+bounces-119082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qzDFAJVvVmoM5gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:19:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6D57574F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:19:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ef0V5nvd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TeKYEU0I;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119082-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119082-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB80C307D87E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 17:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D562AD37;
	Tue, 14 Jul 2026 17:17:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1601830674B
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:17:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049469; cv=none; b=hxu2zZwXPDjGxhfRp+RwWQ1gvZGvk/kDbvOrN3clEkPT9qkklx9lZKxPyyb8HSqvJfBMRwwQCks1trLSh0fcwmeh2UAeJ6nqnAxLCVLnyyPvDZFpjdfVwlKYO7AiUxdrfVqPdQS1oiPoU09K71ce4B4JzTVW9BeZKtL1wJt9Oac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049469; c=relaxed/simple;
	bh=IeB5JGZlGnhunhqpImylStG7bJZPq9+76gfyd+j+btE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ej2+lvDG202M6vOEjo5uBW0FKvkMiKT43bGbtr5GZQ85DgshzU4Gffl5mhC8VVepkQ/b99ksP3rffS8LD+NecUtq4M26KFJbEU3aXy2q8/RV42KJst5kasmvjQkQMJDJg9hTxtUuASdZwPQm86f/eW30yTlRI2lBUbNHPG/7Oa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ef0V5nvd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TeKYEU0I; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6lrP1068097
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1PGsQdjfpqkGRVClnA4+TCms2gSn0k/rM0l7GkssEAo=; b=ef0V5nvdxoQ9Uunt
	UqGTUhKqlW3C9z290Yj54z+LupZDTZ1sjEjCalHA6STcYmlrE3Db27rSKHVQbHGg
	E3r0Sm1EaLG2Ag+UqnBfvoC+ocFB0xpqU/2ac8mqdwyG74/EyykQXlUJZqbGsMbc
	8tQUU0/Mr15luVNcXZAe6ha3PP0zib5JdQL+S1U5N3coaYk3peXoHaeHEYqtB+CW
	Zgj3PKsbduMuasDMRAvPF0pwxXM1VabLZ4S1dXpT5jZL+iofIoL4PdXNeLr1Iied
	RaCpNWPJGNcs3XgZJdiwzYvzNfAMMcTaupug8k4qOYsGCmgHefWX5raSoxa/DaiJ
	RrENpw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmjq1d2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:17:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84240683a82so1259629b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049467; x=1784654267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1PGsQdjfpqkGRVClnA4+TCms2gSn0k/rM0l7GkssEAo=;
        b=TeKYEU0IyY7n1IqjM7vYFDbLn/V8w3ztPZY5v4mS9Jca6plOeH/3js67oO58fwzUg+
         nDsoIlircE16Ys/qkU9IZGvmVVyirdWEn31OdwW6xa1zjBZr6xdlc+EaumZWwhvNaXOE
         b4bsWmDspUg4dxBI5Pat7USFn1L9ixKj83J10SNX0IKA2UyX2MfiQYCSTSywRZ2WMOI3
         9VZG54rvrZKmMDZ5m6INQjzX/5gopaJSx/E5hTrriwAeIam6LltKmbV065jsEnATOwrV
         UAp0YUFBVvboJZQTFJ1vYQiAXeQMbFK4wmNWivfPZzolPcCGNwGNuWrl4ZKVSKvgjI69
         Eihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049467; x=1784654267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1PGsQdjfpqkGRVClnA4+TCms2gSn0k/rM0l7GkssEAo=;
        b=kGH2vr2JLIpW2ytaMmHc8rjpotRy9uQ9bu9LHANwBeII3+r9rCdeiM+9hviCYrobZS
         o/eLHhAm6U9/s6/KVpNtY0Yo2bEwLx145Sb+eBO6odw0/cUlq+Mqz4nT6eMIYiSVi+H2
         49Y1DPyWqGPyiWBj9YwAJ3QSiJuUbagiTn2m08rSWu0LRQ5qrFz0/FXNl05cqS96jXIA
         UK/MmuvNEQ/9YLpynSBWqPbZhRiJmV2ZBJ4WX4CCT1xt9PQcxJGMwVyN00AfpZFaHDWf
         ob9eUzgP7kIkCNU3zAHszyXdJ0ohFzoFhafTFr2eu/nfyS5/JNmBFHZOyHBLunf1Pk3J
         WMVA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7p0EwcOtV+jXNIdMmuK2iRkVpwjf0NNIRpYsFXtdVShNFeOkyjgGnX1qU36jaycgntPr85REcPvJJWYhT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6/YBcaFmK0rWimYDsyl2nC8cOtlSB+In/9ylApt7kd2+d+wJc
	opd1Ve7SNb4r3IkRpcLA5J0RzGq98bJGxLiZgz6Bi6swUb2thF8soCMLo+kjwdNFPorPEtE4PAw
	te0qbpWtFlX2EHwzs1C+LA5pk/qQZNoQ0flpc4D0fQq+U5lC8mp0eOEMT1pThSs61dUqJ
X-Gm-Gg: AfdE7cnnYYTYEs7w9MvN54ihF/2+leGsFdxq282aeeKNK/2gRjKES0/0+WeuVghrJ8A
	J7/cg3/Su7hNjENWdS64Wkwyida1YSl9zMvM3u6j/jaRVAYzyvZpSDb2+6cyYoCjfmvhV5Yiiw5
	raP/O0V5++QQWhMwOxjQWCcu/mVLFDOkvyF3a8urYZeJpahAwXK/d+1FEzK5i0NcPrBv3qufYaw
	Epw3FsrwN/A991XoVwBX9yayDHQOZzQWHFibJDtiwIz5gqsbZ6felTb9DhqC5WO3CDT57jNIP5f
	Jq8N+HdL+VBmbKcgpV3oU3D+vQ85TpEEcE4T2IumzKCpr9/dNPY/wFmAAQ1e9c5v9XPi8VxD62x
	a+6IwHtaB5f1+CR9vPz/NQLgMXiweQ4M0VLWwagz1KBGRdXo=
X-Received: by 2002:a05:6a00:6c9e:b0:842:4982:82f with SMTP id d2e1a72fcca58-8488ab52c4emr12500752b3a.2.1784049466597;
        Tue, 14 Jul 2026 10:17:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c9e:b0:842:4982:82f with SMTP id d2e1a72fcca58-8488ab52c4emr12500713b3a.2.1784049466153;
        Tue, 14 Jul 2026 10:17:46 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:17:45 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:34 +0530
Subject: [PATCH v23 06/13] dt-bindings: arm: Document reboot mode magic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-6-e7453c548c21@oss.qualcomm.com>
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
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=3015;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=IeB5JGZlGnhunhqpImylStG7bJZPq9+76gfyd+j+btE=;
 b=Rqul/vs6hKIoNIq8CYBVBXktxm+9XrK1d2fQHxlRs0lwZTte0K2Wy0m++KG3ub+9uPYRfMpW0
 cWLGWZTns3eAts3X64dU254nt7q30B6sK3/wB+hz3gjRYl0RgDJsSwU
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=LqmiDHdc c=1 sm=1 tr=0 ts=6a566f3b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QueE7lSFyTnArNAPXxMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: iLn5RQu9whT0PPjKqvQcS8SxGXkAyosV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX7Yxq1ooXleMh
 zfWwmZhAPBWuuJdALTVHNSet3RF/+nm1cCfEwFScKqGTE1kNTqSUZp4o4a9IhuWO3oxOWyPSeW+
 rS7X6NHJRxZtgXn6++muiK05qfppQYkIfPTDOAshap8JjclWdARkzPv6DqfaTWWhu5CH+xwpmwS
 1GefkcouS6f93cjzygP/4yGDiRtozKa/Pbb997wwxh1TMHt67eeZvU79V/52e060yD0ytyVfSVZ
 bbeBCEySnsyUAUGaPCbNctCfaPMmbrVUMb+FlBLGd8JQSx9ieDCgUKJILRy/Zi+2dINr0BafumA
 SCXTXliymq3FXzgmLiU6maRv3m7zd2icTpB9lbpxyUeKGfJA4rliYiXrrbFrz2+86jkFUMnxguB
 gEfEltyLMpxToDtfiFOoKBCFvkoekhBxIGkijiJlhelOr6V7tZ1ZmfVgRL2WddEUfZ56L0tar5S
 L7D6fUZDvugCJ+/obDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX2J+LBda8hxY5
 TC8VXZygYaIwHKeI2+/uQE+M/0fQfLCh0dvReNavU1sos74rSlEqxQjH0xgAmOkhhkEt4CD6bT0
 eslO1NrkB652YPL8Y1rMtJjbWns7bU0=
X-Proofpoint-ORIG-GUID: iLn5RQu9whT0PPjKqvQcS8SxGXkAyosV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119082-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:ulfh@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:arnd@arndb.de,m:Souvik.Chakravarty@arm.com,m:andy.yan@rock-chips.com,m:matthias.bgg@gmail.com,m:john.stultz@linaro.org,m:moritz.fischer@ettus.com,m:brgl@kernel.org,m:sudeep.holla@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:shivendra.pratap@oss.qualcomm.com,m:florian.fainelli@broadcom.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andre.draszik@linaro.org,m:gregkh@linuxfoundation.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mfd@lists.linux.dev,m:srini@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:li
 sts@lfdr.de];
	FORGED_SENDER(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 6D6D57574F9

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 54 +++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 6e2e0c551841..11b90e8affb3 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,37 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  reboot-mode:
+    type: object
+    $ref: /schemas/power/reset/reboot-mode.yaml#
+    additionalProperties: false
+    properties:
+      # "mode-normal" is just SYSTEM_RESET
+      mode-normal: false
+    patternProperties:
+      "^mode-.*$":
+        minItems: 1
+        maxItems: 3
+        items:
+          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
+            minimum: 0x80000000
+          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
+          - description: arg3 (cookie_lo in 3-cell form)
+        description: |
+          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
+          after "mode-" maps a reboot mode to a vendor-specific reset.
+          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
+          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
+          Each mode property is encoded as mode-xxx = <arg1[, arg2[, arg3]]>,
+          where:
+          - arg1 is reset_type and must be >= 0x80000000.
+          - In 2-cell form, arg2 is lower 32 bits of cookie.
+          - In 3-cell form, arg2 is high 32 bits of cookie
+            and arg3 is low 32 bits of cookie.
+
+          All values should be provided as per the PSCI SYSTEM_RESET2
+          specification.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +168,15 @@ allOf:
       required:
         - cpu_off
         - cpu_on
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: arm,psci-1.0
+    then:
+      properties:
+        reboot-mode: false
 
 additionalProperties: false
 
@@ -260,4 +300,18 @@ examples:
         domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
       };
     };
+
+  - |+
+
+    // Case 5: SYSTEM_RESET2 vendor resets
+    psci {
+      compatible = "arm,psci-1.0";
+      method = "smc";
+
+      reboot-mode {
+        mode-edl = <0x80000000 0x00000001>;
+        mode-bootloader = <0x80010001 0x00000002>;
+        mode-needscookie_64 = <0x80000000 0x00000001 0x00000002>;
+      };
+    };
 ...

-- 
2.34.1


