Return-Path: <linux-arm-msm+bounces-119089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FlcOGjRwVmpH5gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:21:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D288D7575AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:21:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=G0qCDEZ1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Fyk6JADB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119089-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119089-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 319D030727D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 17:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2970F47ECF7;
	Tue, 14 Jul 2026 17:18:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFDD3B47D7
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:18:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049539; cv=none; b=kB6h4/etWXZ/wXbRl5LxV7MYzxOQ0YN0Qe63b+P/qAWckO60x5gbgUX2GBbkJHIilJ1pt8l/VtXx3trrjVLyBmvXvGcBT+Vq1msjk6ZPDLQ3gj2gqPsTq/phTbfR5QPgXaMLDS8IU2a/ZUCbIOu+HQVD1GQZL+zO4TYeVUMRggk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049539; c=relaxed/simple;
	bh=/qLMtF4YYOHcd2N1W678IQPXyBmX86FCA/XfWBXjocw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=suzR1UQhuODdU3ZpmG+XKfUU9FfGJiLX8gxIWCF/kJvptDc2bvVLbsJvA/+lRvjUOS4Yw2zU51miPFKtuyYvNp6IUi4qHqDW9fJuqBAUn9XUmiRyu6hboiEGy7akculSJ0bR4MI7PTZ+Q4qwq26/0wJaXiEoG7abm5wL1273hNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0qCDEZ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fyk6JADB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6uaH975509
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WlWwBUz8oIiLyO7bjGs1oO3T6bcXCkYkZ3ytXjL7maA=; b=G0qCDEZ17DRS3o0E
	11ggJ5j39opLgDxXNK/d/wONKxa0fVnp1j9mZQfJ5c51xMnCvqSw+AjQ/xNUsThs
	5KAB7Hc+Lv2RM8XL5wMX1Ojr14IumaPWXwjjM/thnV186H5c+BEnH9Rf6wpe/f9f
	Kgwl7uwHWicwx2y3C1mf+uCPeo7zX7Aig/AfPDNNg21mJCe4OpgOp5jnlQcRKgsA
	1Senm7UsHKP73EwEWGE/ApfeigX/PZY9w0UekDDkNY1tqyApbxNJ3uMlFAqx6/wx
	RQCeM9HFe8/pZuIDQao7b16GfptJPaP2zchdS2djMOIDbzhBlw1EluvDwEd2bJzT
	RvMu9w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgeq2ddc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:18:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8483e038efeso1425088b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049535; x=1784654335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WlWwBUz8oIiLyO7bjGs1oO3T6bcXCkYkZ3ytXjL7maA=;
        b=Fyk6JADByf8pihKmgB9KVDx0IvVW7QbC7XbKs/CiAE292mqCdiNvGeuLd5+7L5sA1k
         /YfrnUmm5sG1+ommHZPMQr5iWj5t5ChydpioGK6ajIzcR+tD5uc7GEV7Q+YR/fPzWtRo
         ZV7l7Myak40rQkio2nGh2/RiVKfzwM6LX8NI4p+zUVxLFXrLy2kE7ANaNLE5dDoeNC/D
         tnXkjpTNs+Bq8W2e99e3Q++j1NHI90T/R5xUJT7ZyW4y2Qb2ChVgY9E54YFcgJPfGVsi
         y/xcjw3G00KC9iHPnY142H4qXSTrFJYoZ/+59F9Qjed9AzcpL1GUUL0wVQIJGoYoz32/
         S8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049535; x=1784654335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlWwBUz8oIiLyO7bjGs1oO3T6bcXCkYkZ3ytXjL7maA=;
        b=nTuEzX+uuVvet/va4klmTi+lYp9UEXYBlmN2b8BhjdlXzCZqs2Q+KtOsA0A+1+eBg1
         fh138ITW8IDPYaxthjOYgVQ5KPW7nmPLCvwitnF5FmGDS2/sL2nHBLv7VmSVX8G9UMmZ
         g3p/jHWJYSE+Qwo+JNjJRxyhsWDDMBtOrbw7WJ2kUa24YeoBEydh70aMvYW4jll6ovWc
         izXST1uH975UgKqa9VqWdPCRiFAkO61UUHaFRGJ7mCthEDEdoFx+liJXUNwkLRb4rwkX
         0WyFVi86r54mRH0SJu3HG4ARJfqNfA4MIxzLuNMumbD1ixO8WNJVulF/nsYT0va4UL/b
         nuRA==
X-Forwarded-Encrypted: i=1; AHgh+Rpc2a7S0xp5MvHM84y1nGLyvlv3qiIUPN4Q0DLOxH6+z1C4aZWaCGy/t3P6gKen1Uln+Gz3LSNAAb61l/jh@vger.kernel.org
X-Gm-Message-State: AOJu0YzSbPFAdiEuMQ/vzYe29jqfBaaHaYPWyY2IWyH5NImtBrVpJWeV
	g/Jy3GzdoLS0/eMGbclJmVjhrTH1Z79Q/n7byylaE0eNhmjD9gG7ENG6MXeywdTzwZt/GRQG+bm
	bJ30wUpXw9UUsmOkogbAY4c/vL/sDYl/PKArCyjJ4++ldZmia9Me2i7iprDqIBirSDzWk
X-Gm-Gg: AfdE7cnP6TsnvtMRGLXIbsORx7BlVgJOW7Or4gA38Fvc13kfs9E7lPN5cuwTMMqllL7
	F781vWQNTSCtvas8JapsYFBb2fqwzupL6VENuPPpR2Fb4nu9VfWfTp4Bbs+AGurP8Qeam2RVlYo
	nYW3rZ0Vj0FG0Ph/jqbdTCuNPB2WYhUukiTjDCpRHR8sx5GlkeX7OuF6m6bPu9K40b4vWm0Ws9A
	tjOQh5pnXP8uvxZsmOp1CXW0sPwoGuhFE+KaSIDMLf6PIdNHQOmd79o/mEupo2yLuY0dUTne/Nx
	kGsjLP+DkQsQESpTfD11aJOCdvBgJp2ksTI2mzVKrtQ/1UvuY/BC/KtcjUzktlIS/1ZXzzOSuWF
	B9Dm81kHF3N7AKB4Wna/fx/ajUUfU9oqhgNHR8XI8ZXsA8GE=
X-Received: by 2002:a05:6a00:1741:b0:845:e1a3:107e with SMTP id d2e1a72fcca58-848896eb340mr13731434b3a.52.1784049535197;
        Tue, 14 Jul 2026 10:18:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:1741:b0:845:e1a3:107e with SMTP id d2e1a72fcca58-848896eb340mr13731384b3a.52.1784049534635;
        Tue, 14 Jul 2026 10:18:54 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:18:54 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:41 +0530
Subject: [PATCH v23 13/13] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-13-e7453c548c21@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=1558;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=/qLMtF4YYOHcd2N1W678IQPXyBmX86FCA/XfWBXjocw=;
 b=rUE2oOT0yyF7AuITx714xgSvucEBSc9KhTWpFSLaurtFc1XMsG6TrtEbHt/m+uYS94IanfqNZ
 NwgxWKW/LsVC7sB2UWTCKChhYXd85Mq58VSCviNCWEBEwY4SaEZPtkL
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX88m4wHWVNOYV
 l7E9EPbBztbIXGFlbcLGAm9H++k4/bQGEjWfUVvGcq5rykxsMYhfjQ6mNidgyP7zGjGyqQC5Wha
 eFObyK+BRlXwW+RA/JavrltyQAOT4Wa0hmrtMg5CK8DBYTdo27fn/gUdeWKIqb8JhwEPIwv3D2r
 u3oJ5VLbi7rgzbE0REOR8TbPetMg4ZmPYbpqrooEztTm7DlOmY7vDNYscJNUmtUdymzyP/exmFK
 0HRy8rEeOYljixPtsSNL47oxjrwWnd/Y8gP3vd7lIECT6NozDSrXHDz4fUtpwQysmcvG8wxaomd
 Zbc++QJ+I3868MB6ehWF8gEJm0Cek03MocZD6+E9daqDFVhn38lnqCaqDTOIkcem8kLfMFvX8xe
 QFE5dEScj24eUPgalicrO6pgbXvL+NfqlYBCFuqqm/KPVqhteh8kgXTx3mGerGgTwpauftGVKBC
 TR4Jujd6f9DTrioa5Dw==
X-Proofpoint-GUID: mIPqhzSXP0qYbM4nFxIezYovZKxjf1TL
X-Proofpoint-ORIG-GUID: mIPqhzSXP0qYbM4nFxIezYovZKxjf1TL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX1Lo8X5M9EkJt
 jffz2Rlm9+3cDrBXaQCNnXjFoDT15IkI46PDM4IhAtF2NjB9o3V4XSAeXWaNALOjOvuYKoodYPc
 AdJB8xPSpbEGj3cKuXuzY6hX1ZbD2OY=
X-Authority-Analysis: v=2.4 cv=V9VNF+ni c=1 sm=1 tr=0 ts=6a566f80 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bjH5yOvFM8yfI_BY5k4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119089-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:ulfh@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:arnd@arndb.de,m:Souvik.Chakravarty@arm.com,m:andy.yan@rock-chips.com,m:matthias.bgg@gmail.com,m:john.stultz@linaro.org,m:moritz.fischer@ettus.com,m:brgl@kernel.org,m:sudeep.holla@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:shivendra.pratap@oss.qualcomm.com,m:florian.fainelli@broadcom.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andre.draszik@linaro.org,m:gregkh@linuxfoundation.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mfd@lists.linux.dev,m:srini@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:quic_s
 ongxue@quicinc.com,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email];
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
X-Rspamd-Queue-Id: D288D7575AF

Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via the
  Firehose protocol.

  Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 047b4efb04b9..48d3519f50ff 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -498,6 +498,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qspi {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index bdfb70ca9740..6a7ce5a2963a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -581,7 +581,7 @@ pmu-a76 {
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


