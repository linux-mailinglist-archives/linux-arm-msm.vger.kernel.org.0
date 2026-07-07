Return-Path: <linux-arm-msm+bounces-117216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5rBYLrTFTGoDpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:24:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C2B719B66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:24:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RYN0mCQ3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="b95CJ/aV";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117216-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117216-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71DD530A6B0C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 09:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBAD738F93B;
	Tue,  7 Jul 2026 09:10:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95003911B6
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 09:09:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415400; cv=none; b=L9cWgx+EglTylUpB+F9hyGR2wVveW3MBhLmVuXb4YLXvlY45rEbbPrAqBA9nwglWdzQ0CE/rcSLJCbjHrOmIWxEVsHVknyLGCBN6I+0h6HqIxIePJlcMr+xZPi1YeE0UJ4RUCYdVNknPN16Uwk/cjMWnhfYOSCRhzMdWMajeXK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415400; c=relaxed/simple;
	bh=/Mt1ZVMxcVAHm03erAsxjaKR2bufRmN8oCEQ0sOATqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=if4ICk5cEDV5Gciay44umv0uoE+C9fAJRDyUdJFLsGOG659TBuujhD9tGz4cXntkzaZUKenxjLdtDTpA0JkY+QQqojD45wgbaP26+Iuox8rVu3YrJX7oWmMNgBwpOKsXpZdBaXaqKzdJSECwbE+8l5defT7YzsxlEOz9vStcaDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RYN0mCQ3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b95CJ/aV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DjRd3050545
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 09:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XN9EZ8Vs9RFpXQv4qKlvuP40EdHpXbacHIHmoFVSqpk=; b=RYN0mCQ3Pb6m5jTw
	XDmivWKvVyy5pgTHzV+Sw5a3chhYQ+3N6g6kniK1U9zHZ7wYKY1PN6IiCU1ZYviS
	caa25KcRKwgjSWDss3cncH+40XvO+zuyxlF4ZLiLnCv0K0VaXbGErQzvx98gaijy
	JEFX8M03+qA2BZoKeCO7eFAEEqhQ1oFDXfk9faZkHR19pXoDJdAE7QFP//BvcTn2
	D0hLoIB+wse2iBywe1ntfOM18K/aV5rpuCv7+LTx6c3BZzU/t6P/g/+x30YJkUTE
	vlu0Kn7AAjJiN7Ypm5+6NK3TPhIHLu8s2a6JUHh2zFSDomB4PAksADqI69+kts3m
	oyIw4Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2u8d8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:09:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8479cc04d8fso6778008b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 02:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415397; x=1784020197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XN9EZ8Vs9RFpXQv4qKlvuP40EdHpXbacHIHmoFVSqpk=;
        b=b95CJ/aVV2ZNesJA9wepojzFJgy3QuJjajg8KFgvf/7RwUvx/x2581ZVEnZCeWMt7U
         qb92FKuARLEGjzKNlsaUrhNCJO8ZRI2krpErSCbJ8Oz4GALcbBstM9u8Y2zcBIfkdpbw
         I5YDpHvW8XpReD9FFxgqrTZRuiCMg6zGbrHRXZC1AB3Ir4m9bPl7kUJnPfPDpUL1z+12
         VY+0UkmzNJmeCFHxxD9zhy+SM5vKo8Ww81A4JiUQdDMlefFBmvjaCFzvjem1DW4GEe/a
         pMBxQha5GXJHmPw/sHVd3FAwmUtlyxghdPKvV5mOFMvXfqImvFDsc40KYincnmv5AcM/
         XqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415397; x=1784020197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XN9EZ8Vs9RFpXQv4qKlvuP40EdHpXbacHIHmoFVSqpk=;
        b=kr6qHsdfPHenR36AQ4HEMe5/rZsM8hz2fFZEtfuHhBY1yncaqx5RtxNE2ecPsy7sMz
         XG0gE9ctH44aPzPz2J1ueIl92fhmbw31mV1NRhjmMVipWO1RX8U79itc4guPrMZhetkQ
         m9C0JBrEU6+kTVBn33Z1C2LN9Ui9Y/dEiBaeDRmJqTpIqW8dH0TWwhRn8rcb4f9hpqjV
         /7i/FUH7jA+SBKHgce50m7xsQ9j3GMxr0naCplHYIk+AY8ZUmZXYGHmBZnUamGVGWdzU
         vDbjtfkC0mDVykGZ2PKZwwHqv7mZQM6YHcJ/sLG/PdTOmn+BZ5NE3fPmPTgEBQj8R97d
         +cHA==
X-Forwarded-Encrypted: i=1; AHgh+RoR3GC/YXMUzmbVgwbMennEVOlwkQ29DdPB4I00CM+KrXRFebLCyJZl9OmQTbQ+hlXuhU4zGmly19tG5gEc@vger.kernel.org
X-Gm-Message-State: AOJu0YzMvx3uYY9/TAZl9WIMrJBK533gp5HszmkqPTbqPcK6OY7hCt8f
	mz4U2dfCGpCgPwAOqDQdiVGFJNVKn9wTlNPlJiUiPgIQywOZCbvO4UK16urJ7EudoQH+tKSULWi
	arREy4NKCbNSWpsERBJgitHOTiO5qRGrP9h7ejvzVKkDwm2c4pHinZgJwaJ/7oQbnfGqQ
X-Gm-Gg: AfdE7cnKIiq0Jk38j/n9htVK8Cw0H/Xx+az4JcobgKeD+eZou3fLc8zK+tasVwBW8nE
	lQy0RYEJoOGRBDuQ9V0BpNV0kstxGD22B+V681Dh8zh/OCwmlNBnYH0Pdu9UUekXoUUmZXYej7e
	IQ/1QxzcfNkcGHlIxUqT8cDkIATbT7PYPCkmfqZ7ur1Jkd3JAwtda/Sc2h4uCLJ8Rid4KBj1v7Z
	l2O/z7Yu2l/hFme87R1yN/6xg+yIrI4mpYh95bFPyfUbNGTdOfKAO7nz1kzTcRRCxe0qWUfsV4J
	xVcJ9eRfpgJN9uS32bcuGnALaiYHR+59ffFC7+0KOmcpklwF8dwuNfpMng2qBlZdKmoCFyX2EaX
	6grOS3jRY5F5GGprkczegtAoGbUWO2cu1xCaXlFPrD1Mrg5q4IyKbutDP2W0po648xVS9O4AKaA
	==
X-Received: by 2002:a05:6a00:1c93:b0:848:2f84:f42a with SMTP id d2e1a72fcca58-8482f85045fmr1704887b3a.67.1783415396616;
        Tue, 07 Jul 2026 02:09:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c93:b0:848:2f84:f42a with SMTP id d2e1a72fcca58-8482f85045fmr1704859b3a.67.1783415395991;
        Tue, 07 Jul 2026 02:09:55 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm5140582b3a.14.2026.07.07.02.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:09:55 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 17:08:51 +0800
Subject: [PATCH v5 3/5] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-fix-tracenoc-probe-issue-v5-3-bf733ed9ebd0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783415366; l=1610;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=/Mt1ZVMxcVAHm03erAsxjaKR2bufRmN8oCEQ0sOATqA=;
 b=w1AYUlv0hOvAn87Dq+iBdIZwsf3tpRAjM3BSzLkQN4a+eqx/waUGj11eHa+2GHAgRA/i0PZO/
 7EhCux2xmOQAaDaiv4aij8yNz+nuBnEQNaKL1fmXJjMgNyBJ0SLR2y7
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfXygHWjor4ZP1b
 UXewLEfaD00uYGUDFkAB1af/+/ubud//SlbPG+H905ijD2X7hXw3iIcUg3iT23SBCFZ/gVVo1p0
 3zs5DlMkh8laCa7AujdvsecKSiRqu2c=
X-Proofpoint-GUID: 2epi4THE_uAG9pP-MbFDvXO63sePob0c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX7HpVlCVAohDY
 L5PgOFqebBfTEny77V8ZTaJFo3jjRIeSUG9acK4RhbfzUV/LNky2idLik0jNVXM9SzcEDCoZyIB
 44w1ndpwOjMRc0YG+k5EuetkaSuPNZV+0/n69L6TBjNBJNyAx0XqTwp7DwNOupPoz9c4z45ucHq
 wzBdQXCOkDRYPJzXTnIWTKkOi/TCc/RFjBV/+xW0u3JyhRymo9f49kPzP7KMs4ITXGv9F16FwtU
 GTYK7jPXe5gz37yOUqqwVrY+4UFVNpQF7XoW+SV80DPPBXi7B6WMur1ZwU2drECnb2czIZW4HK8
 PD94LzuF8wahKZPHdz+LMs8FhjZN4DfvOF2Db2Pq/fXJH239Z3CetrSf393tMowDLaU7u5Q1R1Z
 mXaokOJqRTPdx+Tks4qPW9LtPQzqLIt49T/mV9urIqgL+LGO8OEaH40rFfC19Ogj+AK+/ZTCqmk
 l7j3//aHAk4BCdRZfvA==
X-Proofpoint-ORIG-GUID: 2epi4THE_uAG9pP-MbFDvXO63sePob0c
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4cc265 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=06MyHLLTRG02JqLiNUUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070088
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
	TAGGED_FROM(0.00)[bounces-117216-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 55C2B719B66

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


