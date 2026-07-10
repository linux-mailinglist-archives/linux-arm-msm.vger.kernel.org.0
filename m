Return-Path: <linux-arm-msm+bounces-118122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OwZ3N1JcUGq0xQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:43:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B98736BE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:43:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QCAslgIY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iJJLjA8J;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118122-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118122-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63B5B302BDD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 02:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CD821CC5C;
	Fri, 10 Jul 2026 02:40:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F4231F997
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651224; cv=none; b=NC9F4HFs9hoBTJf4Gu9nMY1d7QtpHKFMtri2KLtVjUA82RDxxgNHRgcuTZJmosdEZRkvgedlfWRlny09IajCjCg/PtTDCSMXFuPxSAWPKSxMtj0s7H8NXJsnZ9elKR3qnNOT11qdsOrjQ9jBTHccwce/cOMJ40he0Z3D1wLNWw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651224; c=relaxed/simple;
	bh=kUxtfu2GkKubtJdHqbDaFenuC/gQXoog7GcvX2P9CYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGaWXMkEz/H/Aq0HYkzj/NhdHIfHLmGaIaBN+rdsL0rPcHxbsE9raKcISU8ySSnwC9NpwSFI2nCYI+QTW95RM63Gh0Dlv+LFqCeom0tm3WBDjjaXlPWLtU+2ut5+bE1evXoT6bYZHOyH1byEtQBHCMo7gNzYblMxfsfJHCac+2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QCAslgIY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJJLjA8J; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A2UZqq2518770
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mY27m7v3cEAaQpyiABwCbYqFFK/jPd97b0pHI8E07Gw=; b=QCAslgIYZyTntJHk
	MLk8ssPfTuu9MUEiM2pcq5i6a+5rJvYOVB5TJPcRChhLm3pDWMe9u4gOe8G0RsR4
	jgzeNpKET7Bri1b3fTb6IC/1Stdwr0lAzmAc2YvKpjkCsp/8ymF2viQHp1WKZDSd
	rvVfbTGNqRB4kcoaS+wEfA6sRK2lVqwQ8IPCtFX1o1Li6GX1Czy/w6mj9xut01u8
	zHEPKW9eQr9T4ZnhRBaygCENQG7I4lujyONwxeSWes53py73tVarEFJ0gaeMA7/Z
	IzjvlK8AxvaYm9s8+n1VrZ15R/WygIx9DsOCRWQxt10mnc5wI+X3Je3z2vXbI4dA
	TiXxlg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeknabbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so326712a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651220; x=1784256020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mY27m7v3cEAaQpyiABwCbYqFFK/jPd97b0pHI8E07Gw=;
        b=iJJLjA8J5KDaf1DJ/duVpVwBEGfg0mqirKz+RggVa8Q0SANIK8nJ+pKZcM5KpSSa8O
         BmH4eEjUW96z2M1R3hZVAGUKtpjufnvswOz0qTQQmyR7zEUzamFTZbgajsdDGWm+76Tu
         1jGP5B4UJB87c2WvUcis/PUCA94yKzFg7GFpReEKsPV+6GnV8lmrhpk0oARgfVUPTykQ
         MZ9yNLLqZ4pkzTf25H7eyqusdhhTzmMuhR59iVuDw2CF/UKaIOfYaMmZgu1Cwpl+vKiA
         nsXgyklq00OVeRJCRpHazD6HplKNOMxyCiLROzKvctTaW62RsG/oQr4gOjsB3zP0msB0
         gD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651220; x=1784256020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY27m7v3cEAaQpyiABwCbYqFFK/jPd97b0pHI8E07Gw=;
        b=a1+t3LBjfQ9bmnBIuQXR1ZdOfDduTmsE91xh+20cv5XOQs9EdktT/eKZYUSe6n5cRc
         PUBD0c02A+c+RudeadKG1pFs+O47xtS4XmUT6rWaBdb+YsW3zVIB4EdgHZurZpSLFCnH
         SuO8oflKnRGnUQrV6lIPP8lQ+egKX/iG6eORjRxssX2lrVyaE3vzD5uRhtz3hMi/s7hJ
         r3a3xog6FXSfxixOskLTeM7nM8/rPJjjp+9nqQXJPqDqiaPpRkk9LAkC/UFlZ0SMo43x
         7h40Pdovx7+P/03sTUiigEPciyd3/7vFKhTQUxacFf0kxsLEUIARGfssuzjtTumUBHb2
         0bqg==
X-Forwarded-Encrypted: i=1; AHgh+RrR/mF80Qp08IEwOarzJ1GawL9dhXSSh60egTm3nZV+GWLT/jzewd3lAH4TLYHWX1cdxICM7Vzg1Xi+QHH9@vger.kernel.org
X-Gm-Message-State: AOJu0YwRhuttlqKhFNV4SzSH6IvQjKa0p5zqlTl1r4QJ98lvt7ffuVGF
	ZZR4L0efpd4YPC+WjYcNT5UohcMh1GGljLHqHm3PeD3/JBz68vnf8YxB5/XTO9aTMNfa4AyPBqA
	pjSTWmh2lK3pl6jDIkx2+lD6ALZfPudbk+DOzoDzRIEoG4oaq4yA8WaRCHEzM+o5QcUDO
X-Gm-Gg: AfdE7cmCYyA4+L5yUMJFjGUFdQIsJvFdU/Sc75QzWsXMjDYIvMB6Nnn1+YAO85jhQrG
	B2IuGN8GEOZLz0QAPEMliaUpL8NV+mDs904MUVfgfv6m4v2tdBTs12XWc2xwXvRlU06Nd1Msngd
	f5WkeT+z2OVYIJ29FEih9xQNpOuC6PBsUV1FIa8DtGboa5LyJBUYgu4kTMW+6ViDe8JHFRGX7tJ
	Ffuwo6jUUt1umub9FBiRo8yLA2Og4HFRQghG2gGicBuSOwV60z5ZucyeuCW58DnhV0P4nccvtp6
	2qpp/CwtccTu4zekMXjoULmKOomNvigHBMa7+y6GqHZJ7BBC/RtfIWUT7Mci4LauQtRofxL/K9m
	I3dlBPmNdWBgVC/XrRoUIi4L80mh9v7Dcoq90BIL3yjN7ptfreGLdhJZGMUybJ/Y7OJQMMTao4w
	==
X-Received: by 2002:a05:6a21:4c13:b0:3bf:5539:f8f with SMTP id adf61e73a8af0-3c0bd0fa84emr11841135637.37.1783651220446;
        Thu, 09 Jul 2026 19:40:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c13:b0:3bf:5539:f8f with SMTP id adf61e73a8af0-3c0bd0fa84emr11841093637.37.1783651219984;
        Thu, 09 Jul 2026 19:40:19 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm4517611a12.5.2026.07.09.19.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:40:19 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 10:39:03 +0800
Subject: [PATCH v6 4/5] arm64: dts: qcom: sm8750: bind traceNoC on the
 platform bus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix-tracenoc-probe-issue-v6-4-41eb36fef8d9@oss.qualcomm.com>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651186; l=1616;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=kUxtfu2GkKubtJdHqbDaFenuC/gQXoog7GcvX2P9CYg=;
 b=hlg9blVs46R5OiJ16+aISTtFikhio7y1TA4JxSn81vWK6bQvO1MyWoU4RGnN5Kjasstk+58Id
 xNgxcCOpTOqDrJ6K8vWSPiIWE7O0Etl3i34zOsebsMTQ7McjP4QlPxA
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX0i4kL02QJxM8
 96HcCwXlJzbDIXTcRQ2k7pIQ6P6vsfcOPolCuNyqMSYahYcvoSUA+hgcQvS1m+17PlrtrMd1lxp
 jRAJqC4zq/9Yq9dczfpmsAvzJ7cs73E=
X-Authority-Analysis: v=2.4 cv=SNlykuvH c=1 sm=1 tr=0 ts=6a505b95 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=i4VRK_AS-aeX222KLmsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: WrEsZLqzWJs6g6IVUPJe21wXabeWDgbn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX8IvIppfADzjA
 F8XojcJt21hqjVZ6iwBqYdGHIZuChMn6DJ1QMJmRzrCP8Fw8VrBqQ1R6FKI8jhnW3hNjTF6Oh7D
 kAIUMb4i+6xzEJJY7WQXUVSeAiFNp+x9nw7ddAaH/qpujK7qmbsJybq0dZX/y/OUABq+hzj6/CI
 KZsnWdbTlMRLL/RJ80btbFlOBiIkGIep0KixiFrZ9SRMMjwUZ+7xNV+NG6uIItqdG0QwTPmbvHQ
 0UcyuZS8Nldim+AafG7u/o5mjnysPB1wS1V20SlQ1/fdTkXXGG9TFkDIG8BrfDYJo+fmBrpu5u/
 eJGW/p7o/BOyNSFWCLFQZDfdkcKPhEfiybDnfmNfEzlJGemPdomJXozx5A8ZKMfIaYBjuhcndWx
 ej2ONPcuHdPqaObLXEnDMcVivTk3BtPZzzWd6KMdAtc+gg+J57rgQTrvaFvWqfHInt3bVnESpyO
 U9j9fzI05KPYi+K9K/A==
X-Proofpoint-ORIG-GUID: WrEsZLqzWJs6g6IVUPJe21wXabeWDgbn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100023
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118122-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48B98736BE9

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus reads the peripheral and component ID registers (PID/CID)
at the top of the device's register block and matches them against the
primecell ID. The traceNoC exposes the CID registers, but the Component ID
value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID, so the match never succeeds, the AMBA probe fails, and the
device is left stuck in deferred probe indefinitely.

Drop the "arm,primecell" entry and use the standalone "qcom,coresight-tnoc"
compatible, which binds via the platform driver by compatible string and
does not rely on the component ID register at all. This lets the device
probe on hardware that does not return a valid CID, while remaining an
Aggregator TNOC that retains ATID functionality.

Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index fafed417c66f..1e25be41aef5 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4687,7 +4687,7 @@ tpdm_rdpm_cmb2_out: endpoint {
 		};
 
 		tn@109ab000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x109ab000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1


