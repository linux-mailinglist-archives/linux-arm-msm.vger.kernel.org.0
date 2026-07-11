Return-Path: <linux-arm-msm+bounces-118454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2edTB9hEUmqDNwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 15:27:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C84B741AC9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 15:27:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ka7rUrs6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LhhvKur+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118454-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118454-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 882E730097CA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 13:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34EB33921DB;
	Sat, 11 Jul 2026 13:25:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC60C3C5836
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 13:25:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783776356; cv=none; b=Z/gRU14Q8xmEG4VVHckm06z1eOi6A+86Y3BeueJkzN9x6J2+E8i76pER//La5dU3Mio4JgdE0R1DeJ7KeS3KK1l/ZUw/cjXwpFkQZ5B/WwEGsJxMgKLyF/iqxpOZlooan0XK/a64WlDQW2Fm/DnTxJfcw6eLdqGaZ+3AJuK0o8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783776356; c=relaxed/simple;
	bh=trZ/E4XO26da/mhSb5ySVVyndUZizSNk3tZ3uomkL08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=izTSyquazl8bBS1JOBBH8Xp2DkeqS/OWb+tD+iwyCL9DF8V9n7Pd8xhDovwMTYRJahMF5A5hHscW1UMv4RdJl52yP81dKBqqEidCL/o8kOm0xE+TJZOSXpO4IXY7SPbs/GzJzsxpnTnaD12RSvTo1y4gICLcfn1FJSO5nJJf2qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ka7rUrs6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LhhvKur+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BAmaKQ3666606
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 13:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iBDVxtwo5G522sp2YomwpfimJG3Bg2W+ONywALKIPQs=; b=ka7rUrs6/xqjYSFn
	vjEKpAhTmyML7ay+HEAZ6lOYCG0Sp375uzFsqQeqmzdhrL7wbnPf6aQ0amM4l64o
	n8hRCM1PRPv6WCZd7ERUH5BZoVhzxnO9afsZcuMHqRsXR3aD43TOd5rxWKCgH7+Z
	h9SeD/hogE488Dc78wURZ0MddJG72+gt2jxcPpUpYEZhiCRlOl768/QWl1o+3wbC
	gr4RZDVuOBx9iupHjqnk02TUW3pbXPxZcsd3LgtXYyeQQMBb09HvbdhU73sf9QXy
	OaKsnP6J32dAIP6r5W7Moy+01DVz5hUddUcHs/chkOrAUSeaorEhNFhpmzg07+nd
	fmVQNQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe8v8u9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 13:25:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c12e43b98so23825851cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783776343; x=1784381143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBDVxtwo5G522sp2YomwpfimJG3Bg2W+ONywALKIPQs=;
        b=LhhvKur+H8Q561rbXMcLvTe6wJtjjspGB+kxL1Rtec7w0D9O1TvxIbxLoYfdF/EbYS
         b8ELkKLA8TjbHSA9tcvWMy2AnJvkcEm/6XSlyZk3b8emLAswpEyP6M1dh8+RPF0UFYpf
         VWDtgfD9rNZopQz0lR4hXujWNg600bzoAXm0rOFO0/flHhH60TEPDuY+yrL2yb7ahrfN
         ci17YujjpXn0Y3FQoJbHLcsF/gWtKW+7MFK/KItnocZHF4NMGeUV8O8tnHELPRxMW0xE
         ZCMTNHE11/phaw+bpcIgLDx8A+4xQ4iooTC55Ej89BVQifl9ljz2szSQVnHbX2U9EkUK
         fGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783776343; x=1784381143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBDVxtwo5G522sp2YomwpfimJG3Bg2W+ONywALKIPQs=;
        b=hIQ7nCOVWfzpiGredM01Jpd1tXo6QntjkUN5CstbLHMbLo/KLA/KNNSfxX5hVC9FLY
         5vn8q9bxIBDbgHISC4VJ4hxevd9bpInu+mPmUiCTyb0P+Fgz8n08U68wqCTl89RzRNdY
         8Msiuf1I9eHthzl0YWqKvKCGmnK2MmM9jTqDf2OTKPgqdVO2zKtwXGTkeKhhrMBYEfpS
         7WEVVsb9cMzetKd0yRG81J3hTHrg3TYZDe2UPK6VBoOqe1JVyqaM4ch/m1e66oH4kPAU
         QYi508oAipEaFn9Lz/gZuszRdAFlwHr99GNv7XEHxC1zVsHL+efUx028MFofSqX7fhIw
         +8gA==
X-Gm-Message-State: AOJu0YyitEGcQ0Ri/ETk536uX3fDk6tMVkaGNyRCR3paWRRs28XLQyCf
	X/y3wPgNuadx2iglyvmucWJTzKwTX3VKzWIu/VTVDZ2lrEZADaSiG97Xzs0nhljXGsgNLEiCnXa
	n5jAegAqDgysh1kWZ7d3ONqhm5uPd3wKe0BIwh2xjM6V++IHLoABnTTQE9O95GLAabend
X-Gm-Gg: AfdE7cn7NS+We8CBlDJbkjYPEpZPCFO1GrQHAVGzkFPI9UMxM+P3EfjLZ+htTZ1MJVR
	JWAmOo6IGAuP3NgZY8kkXAt3rvWZVUkLKoTzdQgSaE60gwJ3cB7oG4E1iFBFBnakAt+nKC8dN5F
	FqRV+LFOYg1ZSsYVJcgI4lhJC4b1DCyFIbsSwtrtaI9ET7MZTMxCWkKYX6y6o7M55969+HTXKx4
	m3wKoZSypFUgvmD8Fy0BpZT3Y0rzcYZB86m5t2ttmntohKuaEHDFre3LxXoa31psTUcKwss7ICI
	/hA5wOO5OYG0vlCbf7+54ik53kxF7maUZcstZ43uTUCSEu2D+MYafK/4bORMhTZ7zr+exVUSV7g
	RivCVcRs+bGEnqel/7YukH7Wq7GzJoJbS794=
X-Received: by 2002:a05:622a:302:b0:517:6350:ed50 with SMTP id d75a77b69052e-51cbf280b74mr27809171cf.45.1783776342860;
        Sat, 11 Jul 2026 06:25:42 -0700 (PDT)
X-Received: by 2002:a05:622a:302:b0:517:6350:ed50 with SMTP id d75a77b69052e-51cbf280b74mr27808931cf.45.1783776342410;
        Sat, 11 Jul 2026 06:25:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm67915265f8f.14.2026.07.11.06.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 06:25:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 15:25:05 +0200
Subject: [PATCH v2 5/5] ARM: defconfig: qcom: Drop Qualcomm SoC drivers
 with defaults
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-qcom-soc-kconfig-v2-5-4a907e064281@oss.qualcomm.com>
References: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
In-Reply-To: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2578;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=trZ/E4XO26da/mhSb5ySVVyndUZizSNk3tZ3uomkL08=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqUkQ1f4RiqpM0ITH/xryaAJr9qgCLPwsVUHAOJ
 S0smNtt692JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCalJENQAKCRDBN2bmhouD
 1yyTD/9fo4hEfWZLWYdwoIT18lw5uGPdnNcv4EEVDTdbusW3Wk7Q3kj/Ao8Gxeu3xVTW/oUoVT7
 0lK9FNC4LY2NeiYhtVIeHH8sKn4c/N6CnYlymMm5rzD9VghRsSD/iiBRbKXqnxUr2yFY1t42K9K
 Frog2+v0nP/fgbM6STr8QINxFO/vcvr8aAXtJSmO8wOII4wo5ftnM0y80EbRk3P21f7fw4+SBtN
 wbenZDUdsLktim5x4mhiPMQCEEI+24EBcrnNo3RN1ypivQUfuM7P//6zgXH3gtqpiEiG7NkYLsS
 VxvMThuIYi4ALuylEeNvb3HXn1e63gxjDVzAT6/T8tIGMd8ISV2gZNgNDixB/GePyTkjeqY2OHy
 e3biRP/M9I0useKfC+y28Wk6NmpmSMKhlyHL0NtMoaBNhi1/Z6XrLOy/N+YtvU+u8B/Fwx0GHK4
 ieIcftFVxS+4mPWbcqFArfSas6OgZ/imal7jB9eix6UkYxdgqSUWMHFfcH9ESUEv3CA3ZmmWkOi
 XYvfgFdHsmc8sxWzb9PNZfgQZmhghYi0nAWRQxQgY6BgYaHLycgdwh5nKa5VW2JkBu714hYEL9f
 TIMmCjv5+E9be+NVgpno12P+LPgL1f54VXwxUkAXkUXne2bLp6sAzbar7wSt3ajMQesyGr06ZTn
 mSyo7V8DuLMyOBQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 4rflIgBpjR5xqr3Kk8fwfq7zKp2amVGh
X-Proofpoint-GUID: 4rflIgBpjR5xqr3Kk8fwfq7zKp2amVGh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEzMiBTYWx0ZWRfX8WOgxMSGZy3Y
 x7eAjr5YkCpMl3jBgbYbY/Cc0qXdVFXy11p24uRTSlL3+YRIDOvRqEIsZxi04DTxmYt6lKAwJ87
 +FSkWUXW0LOFvSHMzTvZz4UgJbkwH7I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEzMiBTYWx0ZWRfXzjcAkzvol057
 +8R2tFp0gc+xJUglN//CLzK8apnN5ErYhujAIiKqn1K1Rj4Kt3qEqnLeopg7c7cLVjXQNw1MG7J
 eMhrnfXHK9nFoqe238CgvxgeZ6FbQ9f1zk3D4MWgCVvIFtrcd8vr4/c1L1Eiv3gpomSh2GGe5e2
 NbOKS9DRKRViIZmz/e3pVzpBVPmA3q3IRMpltVx/9YqZC261WI5O3Io2ZMy4OFxLFFIfgbUPggP
 He53fZryYQHb6pIy5q23RNTNyXNMXky6OplfEpqdC6pLjF2hhLuCcnoumr9S2Qz3vMdJ5GvHut/
 DJ7Nsz2Kx7TSgKS9tm4I8XDqM/EoVOUJuRP2wa36+CRn3JbVKpTLPy19ucDmSlD6OIENnctWCxh
 casF2y4laPsVTIGx7ll92rc/LjqH+1u9AkF1lw+LdvD/FYP2ufk32I1ZZ4pXXl0rR30rlZ5Om1t
 Ojnj5d0GwTyTDfdoeLA==
X-Authority-Analysis: v=2.4 cv=WONPmHsR c=1 sm=1 tr=0 ts=6a524458 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gBdK3KNpVRY46ggoUIgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118454-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-pm@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C84B741AC9

Several Qualcomm SoC drivers have defaults, so their defconfig entries
are redundant.  Keep the few options which choose specific choice
different than the default.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 11 -----------
 arch/arm/configs/qcom_defconfig     |  7 -------
 arch/arm64/configs/defconfig        | 18 ------------------
 3 files changed, 36 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 2d6292f8cab3..9347998e495f 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1141,17 +1141,6 @@ CONFIG_ASPEED_LPC_CTRL=m
 CONFIG_ASPEED_LPC_SNOOP=m
 CONFIG_ASPEED_P2A_CTRL=m
 CONFIG_QCOM_COMMAND_DB=m
-CONFIG_QCOM_GSBI=y
-CONFIG_QCOM_OCMEM=m
-CONFIG_QCOM_RMTFS_MEM=m
-CONFIG_QCOM_RPMH=m
-CONFIG_QCOM_SMEM=y
-CONFIG_QCOM_SMD_RPM=y
-CONFIG_QCOM_SMP2P=y
-CONFIG_QCOM_SMSM=y
-CONFIG_QCOM_SOCINFO=m
-CONFIG_QCOM_STATS=m
-CONFIG_QCOM_WCNSS_CTRL=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_SOC_TI=y
 CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index df0a0ce5b097..330d28ecf7f7 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -235,16 +235,9 @@ CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_QCOM_GLINK_SMEM=y
 CONFIG_RPMSG_QCOM_SMD=y
-CONFIG_QCOM_COMMAND_DB=y
-CONFIG_QCOM_GSBI=y
 CONFIG_QCOM_OCMEM=y
 CONFIG_QCOM_PM=y
 CONFIG_QCOM_RMTFS_MEM=y
-CONFIG_QCOM_RPMH=y
-CONFIG_QCOM_SMEM=y
-CONFIG_QCOM_SMD_RPM=y
-CONFIG_QCOM_SMP2P=y
-CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=y
 CONFIG_QCOM_STATS=y
 CONFIG_QCOM_WCNSS_CTRL=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dfc52e32802e..bb6afa8a6396 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1645,25 +1645,7 @@ CONFIG_MTK_CMDQ=m
 CONFIG_MTK_DEVAPC=m
 CONFIG_MTK_PMIC_WRAP=y
 CONFIG_MTK_SVS=m
-CONFIG_QCOM_AOSS_QMP=y
-CONFIG_QCOM_COMMAND_DB=y
-CONFIG_QCOM_GENI_SE=y
-CONFIG_QCOM_LLCC=m
-CONFIG_QCOM_OCMEM=m
-CONFIG_QCOM_PMIC_GLINK=m
-CONFIG_QCOM_RMTFS_MEM=m
-CONFIG_QCOM_RPMH=y
-CONFIG_QCOM_SMEM=y
-CONFIG_QCOM_SMD_RPM=y
-CONFIG_QCOM_SMP2P=y
-CONFIG_QCOM_SMSM=y
-CONFIG_QCOM_SOCINFO=m
 CONFIG_QCOM_SPM=m
-CONFIG_QCOM_STATS=m
-CONFIG_QCOM_WCNSS_CTRL=m
-CONFIG_QCOM_APR=m
-CONFIG_QCOM_ICC_BWMON=m
-CONFIG_QCOM_PBS=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_TI_PRUSS=m
 CONFIG_OWL_PM_DOMAINS=y

-- 
2.53.0


