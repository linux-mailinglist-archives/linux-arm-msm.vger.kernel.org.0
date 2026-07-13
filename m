Return-Path: <linux-arm-msm+bounces-118679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xg73DJKfVGp5oQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:19:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E163574895A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:19:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KSDYkjx6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YnPjWaw8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118679-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118679-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0DBC303617D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C513B14DE;
	Mon, 13 Jul 2026 08:17:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFE93A640C
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:17:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930641; cv=none; b=n1aWYeZIKfqBkfJsSrNoF79nsD3J0ZLV77BcwjTLx6p5V9dF3LfZ2EhTYGvWv1I3riyirqrJmzGyHBQCmca9EOMPBAVSgP9Fu0FQ+LQGdAYojbrg6wMZcgABerRG9BGJHLF1aTCuSbXY3mbaJlta2KBcsue6kLmRV3z3r2DJtqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930641; c=relaxed/simple;
	bh=TEpHAboYRCNrYmWuk7cTn4eFB1sF9eD4GmknSB3JeVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=swxcSPpPPhv77Zr85deU3TEpi+4ZpWbG9epBzRTpOTVcQ9rNKqqW/woislUNkuPtPF/eB7KtiTRyN4BTPRl+aQFBj1+Z+j4oRpKwRuBuG6bG7HlJw+JowPSLKe+wstWHGXfTs6Klp2M1KEOrHMoyih1aUkCaVl3kWD4w3qvjRak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KSDYkjx6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YnPjWaw8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NpWx469629
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DKsF2C/3MI3j8i6agMiuyrY1TkImd1VL5+3mFxLOY3U=; b=KSDYkjx6Xcz/qG61
	5bFqDEhdGYZGW/RvdfgAZCg2gNBdhHZrsO7fdLx96JID45szJQhvIDl20FwbIMek
	8qoCy+v8X5HierWvLQO/1Z1PqDpgbX23RpyipwDPzwwICUss8LmJr6ioQyVFGWw0
	VE2mTAAZuyaYXQo3PPo6uMcDBMhXPNdj1JzT4JJ2Csl2y5CbzzHid1hxfYrSsU5C
	GmHBmwLJCvb7vALy7o9e8r5k30ldBcXxPOM4C5AibBUJPkWkPcOJ2nlRtFgOb6eC
	DtIKMps0AuwKwLD4nEHr1k9Wddc/ODAhqDoDZfUIw/lf1XxzO1LlaRRSpEBEoBU/
	0IIrIQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf4854j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:17:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8952346bb9so2162323a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 01:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783930639; x=1784535439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKsF2C/3MI3j8i6agMiuyrY1TkImd1VL5+3mFxLOY3U=;
        b=YnPjWaw8gRJsr54X2+CAt3pgx4M+HDLRNkQ458Yhpd8wpV5m0RU05HJhKUONhgPvNS
         wTUmBEFZpwcmxs0CppnRypP5K8NCheHKHacmzNQrJnzqiLGS295LdN+6UCq6sod+U/Tl
         rZkV40e0oS5gLIyLnb8bwD+oH5jePj7pr7S2hdoHzuzFN+e9z8YJPrw2Dr3ILSFcLjOZ
         2q3RsAQhEFho74M8BWYGNVz5qEZdrRn8u6Ni0Ye+JUwS3zcutCvb0U9mDOnxyVu0+A+5
         uUHVlGHBurGj2smQCJBXUhJuDgkt684NQPzD+6dNL7q/CVeXkE5ZB56uIWoczF41RsVO
         0h6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930639; x=1784535439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKsF2C/3MI3j8i6agMiuyrY1TkImd1VL5+3mFxLOY3U=;
        b=GsEZkTgFyIZ/QZ4Hfup6RX6Ks1kAzdljfh+64zvmZKQ15NDfeWmu9ty5oUOnd0gz8t
         ng6PtwVC5jSj8Brqqwq/VmIXlWNR/iivXDsGog3YEK632JNy1pWd7t3JoY3nL/4KZxhq
         XeENuKH8U8U9czdo811/P/Z2ASpewRjrLan5LxJHi41Va/PzKfNo9oPXq5BN3Uhsgkag
         A67RfXHKnNunOGAGUUKcBpz7khNgwNJ7LAdYIAuc8vL6CMYoXNziPTIGc6A9Ni6+fV3M
         ueryuTtgi/cYkz532y8kAHHDkAS33f1krpqsohQycFG96AF9/61oTJygiNLwmcFcAl3r
         noDA==
X-Gm-Message-State: AOJu0Yy2LPCNcdN+Ct7E0FiMeQigiuw/lq16SlNVhqtnTK4595gBxWtM
	5YKBOG1JhhV0LZHjqFQ7pAeBuveIMriKPYwf66DO9m/Q6nMT+gjjvrx8xjgM1IKvcUnWCIhjdC1
	S1t5qZUMs2AppZBMuWaOH0RXLwuTDEucyfcjqfm/1jM2Y6Jf/v5vaeDW23clb30SyVc3m
X-Gm-Gg: AfdE7cmQytFoxdWIglG+4ucyaqB4XQ0fit/QCJCAMMsewq9q0kDh99edW6hoqLwy0Gd
	1mC61+dQuzrhrRpuVKmWtXMQjT9prfreoHcx6v0wn1flmlLQeioHMnu2QehV39QRAAVeyd8Nz7v
	1BNRJAOQWm7mtBFVyCd1Gt3ZZWfQrxylz/DFa6+SoAvFj5f/B0MeywZjocUc79NIqgsD5A1F+Hx
	y44gj/T126xPHYqMq9udslr5LB8pcCSeQ7tl0uEcMMz7Ln5kKGaxo4UetXN48YknDm9kQM1UlUM
	jW/R77NFM5NDDlAmE2JquKaz57E7W4LLVzs/O1AG8VVMBBVrFlH1f7ldNTjERQ/Nxofi0XmtsMT
	cvJcJHjVLH4GjtPqQDTtY6fBrOc4ag8iZwoFlnKY9
X-Received: by 2002:a05:6a21:4ccb:b0:3bf:9abb:a8be with SMTP id adf61e73a8af0-3c110ad2de8mr8666783637.41.1783930638842;
        Mon, 13 Jul 2026 01:17:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:4ccb:b0:3bf:9abb:a8be with SMTP id adf61e73a8af0-3c110ad2de8mr8666740637.41.1783930638031;
        Mon, 13 Jul 2026 01:17:18 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca79aff904dsm6283954a12.6.2026.07.13.01.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:17:17 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:46:55 +0530
Subject: [PATCH v3 2/3] soc: qcom: stats: Add stats compatible and config
 for Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra_stats-v3-2-4be17121729d@oss.qualcomm.com>
References: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
In-Reply-To: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783930626; l=3195;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=TEpHAboYRCNrYmWuk7cTn4eFB1sF9eD4GmknSB3JeVs=;
 b=tV5O+GFUJdBIhGlxxFjJyu3R4Cv0dbIYvDksfEaiAdukKjzgnnFPObMVT+z4Cs3lxXlUq20Uc
 BMMH2qQSarcBbI3x3Vq3a1zPtg+pY7jK0FKtJP1kNfss0GOolJOUL7F
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfX8u5im3qsWdZ8
 //L32kn7lZrfkAvcWFOCucE8csxbrbc51DaLHkG1x2HnhFz950Z3ALDdr5+85N0z/BA/gwXgO5w
 kphx9ndSNbNspfhF1wGZYvN2Pul/0BM=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a549f0f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=t9MvkJE27OKZGVTZ6eoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfX5z0MctENxXKn
 aNptAQtsCWPI3oG1Jo4qjpdynVd8WsPtsKeR+kX7Vc+8gNEUxIpvsm7qOX0F2w6rm8uuMdxK9Rs
 T0u6C+arXjtBvAmbTJn56tUQhqXhPN1a0IGw7Ym6sor0DIFrJ4sM6nXW0Tlsrk+nWD7P2N+hjJh
 6vo+yJmpQ2XWsG88MzDk7otYT+wBeXN6vt8AdulEnZP/pUgF61chx3begBhbgxURg3L0kxY9A4b
 rZz7e1k3RdMVXlK87wdxZYmFCHx8rt0a8UQTrwLDBcHzwiFGNeED3GfOaCs4ZdoMjGx58L/8wFI
 QZgoaQ4oFsMUq1bvsZXP56uaG+lrjpc66PLbo/Pz6T7PZKLrSOwm4N3wSbHesOBKIz2yTPMkExO
 jFn1nDw8aifqHkL4dveVO+Dg6wQHmrw/zAi3KPMbYLIC+p988jQ4TBbzMRUEvNfIiFGJiAQy48v
 f4Cx98QlTAbyBskWQIA==
X-Proofpoint-GUID: tEGc4lFsn-0LVi7lKuPZ1jMn-yKGJGrP
X-Proofpoint-ORIG-GUID: tEGc4lFsn-0LVi7lKuPZ1jMn-yKGJGrP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118679-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E163574895A

SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are
present in SMEM for Shikra.

For earlier targets using RPM processor like msm8974, rpm_master_stat.c was
used for subsystem LPM stats since those stats were populated in RPM
MSGRAM.

Here is a brief summary of previous targets and their stats configuration,
along with the drivers used to display them.

+---------------|----------------------------|---------------------------+
| SoC           | subsystem LPM stats        | SoC LPM stats             |
|---------------|----------------------------|---------------------------|
| msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
| msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
| sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
|               | (qcom_stats.c)             | (qcom_stats.c)            |
+---------------|----------------------------|---------------------------+

qcom_stats.c supports both the configurations for shikra, reading subsystem
LPM stats from SMEM and reading SoC LPM stats from RPM MSGRAM.

A generic "qcom,rpm-stats" compatible only reads SoC LPM stats like vmin
and vlow. Add shikra rpm compatible and config to read subsystem LPM
stats too along with SoC LPM stats.

Below is an example showing LPM stats for "apss" subsystem with this
change:

cat /sys/kernel/debug/qcom_stats/apss
Count: 2192
Last Entered At: 5498618336
Last Exited At: 5498708046
Accumulated Duration: 2046572620.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 2e380faf9080354fae120e74f0b9bd1f3786d3e5..2f1615e583bbc6ea596d8b73d9bb0a2a00953cfb 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -376,6 +376,14 @@ static const struct stats_config rpm_data_dba0 = {
 	.subsystem_stats_in_smem = false,
 };
 
+static const struct stats_config rpm_data_shikra = {
+	.stats_offset = 0,
+	.num_records = 2,
+	.appended_stats_avail = true,
+	.dynamic_offset = true,
+	.subsystem_stats_in_smem = true,
+};
+
 static const struct stats_config rpmh_data_sdm845 = {
 	.stats_offset = 0x48,
 	.num_records = 2,
@@ -401,6 +409,7 @@ static const struct of_device_id qcom_stats_table[] = {
 	{ .compatible = "qcom,rpm-stats", .data = &rpm_data },
 	{ .compatible = "qcom,rpmh-stats", .data = &rpmh_data },
 	{ .compatible = "qcom,sdm845-rpmh-stats", .data = &rpmh_data_sdm845 },
+	{ .compatible = "qcom,shikra-rpm-stats", .data = &rpm_data_shikra },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_stats_table);

-- 
2.34.1


