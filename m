Return-Path: <linux-arm-msm+bounces-118121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PeUDL0RcUGqwxQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:43:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 359E6736BDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:43:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OdkRUdt5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iH5FLYpK;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118121-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118121-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46ECB302AD18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 02:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21ACD2D5C7A;
	Fri, 10 Jul 2026 02:40:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E2C3242B0
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651221; cv=none; b=Na2rwROe1CShiOCGDpsUwN0keXfZykyJbvY2v1rEYv041+W+yESet69IPKA1maC/HqI2XWWbhKm7F3n7JUabFeozMiF/OxhEMVlm9uY34uUh61KQQAtcVDWLuSevzk1MGNB2ZU1rsfsuKZg3nnluhDeqvUj0cVjA9l0eujEPLmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651221; c=relaxed/simple;
	bh=4MVQmgwxUQUw39D/a4v3zOkEzV18aEDsQ8FTgHlTgXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o4U08sMsRpnuReucP6/3AqwR1ep3MvnYB+05xvMMvwX6qH7TbqAvbT7Df8LajgCd3VcYUaIuaBvcnT6teOiPRntWqNMNZtRN0UjRRc0Lai4UshyCaMgaC/offgBtHL9v+CikWR0A3okaG1QXrJbMjB3eDs/VTl5eeExmvHBOdj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OdkRUdt5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iH5FLYpK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669KZJTX2917921
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8mNKTHss5RCMjCMw1FqMWARAA+Av+jdGhXhUgfnnAQ8=; b=OdkRUdt5AGZY24Ac
	D4wv9Hd+nCoQCg0YwCcAWBYSpCx9Ce3ulqn9brMuqYEE6EUh+CarLNIE73FUEEbb
	/B8U6Zuk5IryQaDigiKSULvrHc63C9oB6RSAevvp8RySHR/IIEgCyT9WVbTZqqu8
	LMEOGoCeYQwi/g//w8LwhdKYt2g1AVvdVy8TJ84sMS7r1/nv0+t2GEmMIrQlXLss
	bIeVw4FIUvFpHB2FY65TX81Hs6AI0dfUjC2LsbltpQDSmI24LSAJmd92/xLyXGpa
	wFqppkAgqcSMGCTksXm+CUhfSIqnUVz0+CuYwerHVlJGoD2jp805i39/8KJxtMWV
	5Mfg/Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte0ysa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84865f326efso480886b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651214; x=1784256014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8mNKTHss5RCMjCMw1FqMWARAA+Av+jdGhXhUgfnnAQ8=;
        b=iH5FLYpKvxX8O9PJfRXIOWSOahdIH9pKNP5cQL/+auAjg5udt37q23nFWqRAFC49j2
         SBx1MSrwcJ6Aicgs957Wh8ldtzKf8wK8Yna7WhKI0Ha5WhM3FpjwV5FnO3elFnETTgBL
         aoZxFaHJSh4xTZXhggB9H71gC8dLrKaglQUNS/E5wXBEQVUEOR6I39dKw3ptoNu/xNk/
         1Rh1f50jur274GS0gIR484nuJR4y9coictySVRXK7+PWuHwlfo3v9MXXfz7nL2uvmXWW
         GLuhMS+LOJ/my3A96NkaiUdG1B95OS4In/lPf1DE255DAIrEgAgIBcBP7AxvE8lmeLNr
         1MyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651214; x=1784256014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8mNKTHss5RCMjCMw1FqMWARAA+Av+jdGhXhUgfnnAQ8=;
        b=b5NY3Svtz7iLW2mz0oCdExFB4vIOdlx3G3CBXn360/+qFGWyL0yZwHlC1EfPpSyBV+
         asXP5rkj10AhBIzXmtIrWRvIebfRvrlY7nsPqQ3EWEkHtW5f0SHK9kzQHYUistcLtRU4
         Dn+iyKOvyVDGAjaJthRqPjj2gAl++ZccdOUiSqTDaVHYGMiIE2Gebqzi+IU5ByKEuY4P
         UJUdDJCJVi8BnjK330NGCiKzE3H2sxlmvFcawZ2LwcbkL7b0rphlwSq6FI6iOVLFJGE0
         FL+lHJNSb3WRn0ILz7FrnM+2NvqEeEmBOjbQAYl6Op07zddxZA2WW3u8H3Lds+9/DfqC
         848w==
X-Forwarded-Encrypted: i=1; AHgh+Rq7TRWRjurKUcCOzpFhdBjlePwwrzaFW6xuVokR32T04icTszsMTvDB9iZHal6Nt1rV35VIWwgblnYzXp4I@vger.kernel.org
X-Gm-Message-State: AOJu0YytrhGHxqQvithc8YSE3TfWL+8hFeXuWIM34iL23jqgoXr2qK7u
	DLO0dH9Hq73gkB1UdbxxGAuxSAELuvhvuimPIyOYYs4ZR3DkYGGBxOI1N1Iw16dhfg8C7QQEOYB
	RaciVHaGm0DOzRvIE5HywqCqUEe/I1Xtzc2KIsr9Gjem8ZCFFDy6Mmndf+1lIhJu7M+Rj
X-Gm-Gg: AfdE7ck6pbpFe7Zb0HsWjUhKhOwviRgzfkq6JoSo2hfNKwp6/GCE+HhaGjm21ppRt58
	DM70B9SAXIWYVzLdF4EcC522vWI8PWFMGm+3+XbdFiXRhZBYYApHvrUMQg+bGG5fKIktxDff1Ji
	oW3YMzeHG/652sjKk6++lT8hwaaCfBvQv+CB8iVognSRqbezETrJ8yQV6t2Otj99nY/pjlK2tcX
	RRbHgUcvfuVPduL4sJ6nGzGmkL46cxeNbqG7D+PlVgqE9zPOAlAQ+Y+xuuyTlWlHoQn5+fI6QV6
	5VvdNEje19hv66KI8oaGBMamRRal5r3MxVpgLpww8p6m+bi0KIPWYeNl0xADbZ7FV5Q6q9EdrUa
	h8cyCCYW9H/etspPRv1stpgkHF0Uf+Ex/q5VeGKFV56Z8JMM2DRK3R4rANAZyNFqRVeNl8gKq3g
	==
X-Received: by 2002:a05:6a00:b90:b0:847:439b:ae30 with SMTP id d2e1a72fcca58-84842edd72amr9032063b3a.20.1783651213901;
        Thu, 09 Jul 2026 19:40:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:b90:b0:847:439b:ae30 with SMTP id d2e1a72fcca58-84842edd72amr9032022b3a.20.1783651213435;
        Thu, 09 Jul 2026 19:40:13 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm4517611a12.5.2026.07.09.19.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:40:12 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 10:39:02 +0800
Subject: [PATCH v6 3/5] arm64: dts: qcom: kaanapali: bind traceNoC on the
 platform bus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix-tracenoc-probe-issue-v6-3-41eb36fef8d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651186; l=1634;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=4MVQmgwxUQUw39D/a4v3zOkEzV18aEDsQ8FTgHlTgXk=;
 b=9id1mYjoy80wRtGxcFyPA7kI5SvnAWvY6ixcWCAoVlNUvjuYNtKp78orzdxBYjBm3CXiuwuyC
 YYkFpe+JU/eBbIMC4Qiu2TzEhjOIALL95aS8NE6B/Vnki47ITGNGYJF
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: z5ogsk5PjEXzL2hgfESDdOrXJFuK1FQ2
X-Proofpoint-ORIG-GUID: z5ogsk5PjEXzL2hgfESDdOrXJFuK1FQ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX51jUgEAY6oEb
 5Z+pID7PNp1A5+V9KSvvA39PfzTbGzuhOi3n/NX34xS1ZgIojY1lXVOdS6d0329wCHjwuoP/2bq
 /fJ3CnCHEVJWh9/p3NVY8p683x4jZeH69lDayMAy1dD46yyZ3FcDK3aZrZWET1FGi8MSFdSrOK3
 SIm4DpxyukYiw/ucYc9rd7KnLws5wLt5rsT3o33eZinVt5peRfwuo2eH1pbqhHl+Zq/7cNqgiGk
 ic6SWInOw/ATiK+JBCq9WkxxMNTUfNg8dF1Dxl7Wch6BiLiuNpbrgGhBRAb7x9RcTfBEMV9VUk1
 iBw8U35v/KO2FamG/AiAiA1kmb+7RacjA5+JFBMiOif306qzP/Fipqdd4bA7y8Tpm4Q1EQTFsfv
 qhxAu21hYQkP6mYZSfy4rd1IU7MYnE6hR7r2fXZezRX7WnwCIZFzESbqcaVuarmceFeQJIu/BlX
 OTBi1sktSKSPC4etW6A==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a505b8e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7Rut49xxg77_icr6qwgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX77Fy+L4qoy9n
 iuQ5iTHELgSghFkg9IgsL/SLEYg43E2wTLyAOJgUz+dP+qp/sJ2c6g1R2tJzqnBxgc3KP5CDN94
 AWoq3IncB/GMinOuAgJyTjjbBLlYXQQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
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
	TAGGED_FROM(0.00)[bounces-118121-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 359E6736BDE

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

Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..5d0e7e8c2e58 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5004,7 +5004,7 @@ tpdm_pcie_rscc_out: endpoint {
 		};
 
 		tn@111b8000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x111b8000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1


