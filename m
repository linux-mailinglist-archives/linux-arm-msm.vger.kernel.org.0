Return-Path: <linux-arm-msm+bounces-117217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5iWMBPHETGrKpQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:20:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9868B719AC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:20:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ESmUJMH3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ROSYQSUT;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117217-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117217-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7874318119E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 09:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2837390C85;
	Tue,  7 Jul 2026 09:10:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DA639099C
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 09:10:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415406; cv=none; b=giaYHYzWhvpS/e1r9343AqLYSzn4vqV+0hHDqhbMh1p1LN6jxYWXjl3AYR6Ui8Cxk8+AXu7Ueu788yfiyov1ycpQzneQkQAR7lM4HL1Jp2XRtlODzL4pNxbKdFAU7AnKoxa3HsFq5/nNYDIzKTakxKGI6+Cbc4P89Bj3IkJbkkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415406; c=relaxed/simple;
	bh=AX4e7umZ/nF8QTH3oEcp3uEN2fG0HNKco3Yl3M2KAQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LI2EibGySbMLb4dKTY7edkqYTE2EoGfbDbjhSs+SuHUfZLvMHMrv4/sR9RrkERFrghf+GU5cPa16HopIFMKNvXSs5nQqCaRnXZE0vh0mHIIMWI96zINgglbV8ZdeicU6HGryrI1myq3K27aK6mPsKILm1nUoyNkVlAA41oqtOGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESmUJMH3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ROSYQSUT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678E8uA3209957
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 09:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ma8Qglin4wLiiN/jJxaHvIWGG+yKZ6gNvSxOg9CBQqM=; b=ESmUJMH3xIUW8a7E
	KhEtY0ZN08EolSjtQF/pvNXCxuQd+psQ+OUmkYfpN3sR1JlhXSZjAiE9c5NmYeI2
	UerlU7x4eHVzgzRgI9jHJaqkbuy0VI6SVe0VB91bI7Pclj7sz8AD1GiiSrgrwllO
	Y00ZgygRuSrb782sBeuElMEPKyixyVeFZ7yj/AM83i7FcFoW1GgOHC6q311I1blO
	E6fWZLjb9wJo1bB4QBYK/hF2wlnIxfUZuoK1pAOTHtNcHRN716dUMxA8Sro2Q2Gs
	VfdThWvGF7pZCDB1zc+fIbnmd1htED9hTOvWowV9eZnk4gtuwYNxubQg7vRh8uu3
	44kE9A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdj8kjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:10:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8478ff5d801so7444546b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 02:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415403; x=1784020203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ma8Qglin4wLiiN/jJxaHvIWGG+yKZ6gNvSxOg9CBQqM=;
        b=ROSYQSUTBtCEHO57WrrHe0xr/eoqp+vkCHBc4O9G/+uOLkDfT6gxfY+p0rJaTZKrDs
         ItDcuTjYQNsJLdvg2bq1GTnRbaYilSlQ2rOXlAG35vrJwmvlAeGXk35vNgtogzwiYhM+
         z7Umq7cRjbDLlJwl/C6TxTTbYpkkNy3stThoJe31LcTrbMB8s5conkHjZ3v+6LF1JMIH
         aQBq1ROMXwIypm5gg5qcNj8ffO9Sh2yIE90wdzBT1OAf55ngFpiN6DKgR9SY1M+iBqBI
         CoXVfgqUAyMOH0aCSe29VhcOIX1uOCnwJ8DfeqzEIv4v3TEscNL1jeBN+W4T8I19vUei
         qqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415403; x=1784020203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ma8Qglin4wLiiN/jJxaHvIWGG+yKZ6gNvSxOg9CBQqM=;
        b=GMCDNcZiLNdjSLRVIdzme3F46gFbUCDyQBvY6ERFAKxC6leMo9B/dEBACqh/Nf1/sM
         eQY9Lh3Y/+z/zqKumHrdxGv6zuoyZVFki1VYIWbmEkRG78PO+eBk8XOKosXM8QPMiwfb
         GY6i+Kj4z879m3gJhJFcu7Gib3f2ql0klNcAZMVqunAwKvnbLN0L+FgoP66k7q5V57sf
         kStC33TkxmB0Wg8pR+hq4ryqux6f1xG2uQRbHtn650n49qmPDCfZ7sqPV7apJzhLH58g
         ajenEJggZVKIHLyiq3pjeLZQhYShzEHrzWaOPKrRTMNoFGZWKo+9jqCXMQyV1xSr9yk5
         TPZg==
X-Forwarded-Encrypted: i=1; AHgh+RozWqTfiCY8jmBDQlbQVCq5BGEFt+uV8GMjpPy6v2MyRYMlJi9XBmZUIR/zMP2jaPQlY1FR1LnwqgTtS5tj@vger.kernel.org
X-Gm-Message-State: AOJu0YxGXWHabSyjnUiAbZcudnaoHajUQP2dNF++oz6fEpDIFMABUXQ9
	+dajusOFpKvHbUNXlcIqeIDq2BTKzSHUFbKm77Q1ZJWYmVzFG/WsiAyLVQ6QO7FMv5qisUK4i4U
	zj63tlCpShw+C5KOXImfp9IlHuswOJgrWiFR9fR8DROg1oFXYH9Zy8ua0zJIw5Z8dnNeB
X-Gm-Gg: AfdE7ckWmGYo0+NSTY6MzV67XvtHpVHe+ZXiUMnewAJ7sQdmXbBuycPItomSmawjfqP
	Hkr/7Gf/7hynoQPrLBih1Th09fdudSOOu/6kz7tcubz80dF51MiNr46NmhhybCDWQF0agk/N1U+
	S/WhL/3Nzkb2cPoQN8ZLHm0GTWHomz2vaK04dTVE78w6j+Ltjf8Hun+1WCuKo2p4BFqVc1qE2NY
	Kl0jgHPIjjyvpfvjlk4e+Ro6VbI4xke/deypUPU8bzTho6p6ysqaDCMbcLUicsFPyAxwsQOAyji
	WnTNUd99kGbw6yYE8q73ejO15CnP5zqT6UgpbnifGuze5oeDsAqZIaJfu240wT5ryaB+N+xuU5K
	sge9777EJ+2PCHlL2wVw5dzfVg9uk2zMoKibLb+h6AIQV/WjCn1oJSM1zqwhSPFCqEJzJgjkZtg
	==
X-Received: by 2002:a05:6a00:b84:b0:845:e8cf:139e with SMTP id d2e1a72fcca58-84826e24587mr4002419b3a.59.1783415403510;
        Tue, 07 Jul 2026 02:10:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:b84:b0:845:e8cf:139e with SMTP id d2e1a72fcca58-84826e24587mr4002383b3a.59.1783415402910;
        Tue, 07 Jul 2026 02:10:02 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm5140582b3a.14.2026.07.07.02.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:10:02 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 17:08:52 +0800
Subject: [PATCH v5 4/5] arm64: dts: qcom: sm8750: fix traceNoC probe issue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-fix-tracenoc-probe-issue-v5-4-bf733ed9ebd0@oss.qualcomm.com>
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
In-Reply-To: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783415366; l=1592;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=AX4e7umZ/nF8QTH3oEcp3uEN2fG0HNKco3Yl3M2KAQc=;
 b=y9rBBL4cpbeysm0K+/fMtdsyTi6NsNikvfJPx69rjKtnxuyTBK26xKkDxeNOftMHiiQk3lssH
 QqjEHt3ckVxCtdy2auPmbWzYSbbxYPbL/XLAu+patCqwFX1elXxeHbe
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4cc26c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=i4VRK_AS-aeX222KLmsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: SqJseYsgNL41lQCJMtzkCGGNFn6wSTPZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX8CfGx57G6qIX
 ZdT3IJe42q9frONMi9WeczTDeW3fkcesgwTXTyFA7peoiGQBU0v+ddj/1r3Qcgr9UZ675kBmg5s
 VfPC53TIBbQ4nw8bErkquXsF+ltCxkMMNUDTOjOmYkJfgciZlZ5oi/A5GOTfcASseejuQkrD5Hg
 TFpGBBzXoXSEgmlHISDNPrGjXMTJk3mXL6Oi5XSfTWEvETUms0oRwqEqTAD7mKIIKB4zCVI3+vB
 eX+YePB4FjY5xc8vKGs5XP8y61UZRDUk8WBbSczyK5H9ORUvknfzZSkEhUlbF980hLOGFrPE4/9
 KaJ00bft2uWZVLeiahqZ/T+9E+rYiZM1DUE+6abF1xvAgWJVzGgpWinDmDp5rDyGo5ZAwgXZFMX
 SB5C6og1yIzP4c/a8es3nbVEnjyMrniwVp1apelGkU6gLK7/sMHEdOW6LBlO4vEfxX/p3wQcyXC
 4hsFrNUhOOYV2vI+Fsg==
X-Proofpoint-ORIG-GUID: SqJseYsgNL41lQCJMtzkCGGNFn6wSTPZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX2fK/Lv40J5ox
 ogoxaYo9dCjjWfEJLwZLIgjtANl5w2IqHTRdSDm6aauaNOm6iu46QujwsCAeDcDwVbIFgX0d/a4
 mrAH08jzxjyfOZE7Wbcv3Qm2Ay03cVg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070088
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
	TAGGED_FROM(0.00)[bounces-117217-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 9868B719AC2

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus first reads the peripheral and component ID registers
(PID/CID) at the top of the device's register block and matches them
against the primecell ID. On this platform the traceNoC does not expose
a valid CID in that register, so the read never yields the expected
primecell value, the AMBA match fails, and the device is left stuck in
deferred probe indefinitely.

Drop the "arm,primecell" entry and use the standalone
"qcom,coresight-tnoc" compatible, which binds via the platform driver by
compatible string and does not rely on reading the primecell ID register
at all. This lets the device probe on hardware that does not expose a
readable CID, while remaining an Aggregator TNOC that retains ATID
functionality.

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


