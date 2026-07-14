Return-Path: <linux-arm-msm+bounces-118933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YCzmErrHVWqpswAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:23:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9122175117C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:23:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=muZWQFtv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hCfj0EG3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118933-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118933-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 636023029771
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66B03264CA;
	Tue, 14 Jul 2026 05:23:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7C531F984
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:23:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006582; cv=none; b=KWB5YWbT/8LikRNQQD6PdNq2cXZgEWOVb+g8H5caTiVNCqD0mDRPOFwODJPfiL5k2BCLFPVPPxa8RfpsSivDAYiPG2WNYnn0q6Iz8d427OlQVLpuMpLbc9AMa/ImPacd/kWFoYCzCKynVK0t+lKRYduumIzKVHSLIK1Xktpm6sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006582; c=relaxed/simple;
	bh=hY84MH1T356dLuOtGk3IYq2rzHaNDOahtodfDNMp7D4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=flm+/iOWGNe1HCIUWtg0xq+X9lurE4EcPWMD73qAPzdG0P7l7yQYzxiLc7wGX7BJCzXnCQqiioLghQdJdEgyICfFDHWRp3K7J4r7ItbAQwx9yLAJOMlHrtFRFV6SEgVbYHKmhLamoI3QhMEKXFYkU+tdpDIevvNtV51Lec9t3P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muZWQFtv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCfj0EG3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38I623441399
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=b9Sc3n5U5C1+CsrAALlPaG
	oyuHeytyFdQs/RjS86mH8=; b=muZWQFtvkFpvaAjHcRsgbj3q5IaYWr9RsKOIQj
	z/y2osAssN/y9Mh5rE0rvKvOQ5TL8hlpg8NLE+nf9sim7zvYn2tiDx7GQwFgpM5h
	cZ+NWspTLZLAACjFw0uHNwhrXVEt0gP5gD9pYhafIbpEcBBDjsyyW62kwBRW/i57
	KfjbgVfJBtWleea5ObOqc3ArYPY3ginjP+06R0dWpG9FLS2fRU2PZpGTZmM0EpW5
	oG4HUO1kTFGO4b76L1hM7loG33zFS/EyyUI42TBbHPntxf0tzbBF1qRUw/p/Oiro
	pQrwWY9i5tLZndogd3rWQ6W9LAqZojI5KPP+IxdbuSbN2+0w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr48mjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:23:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-384419c6c74so5315556a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 22:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784006579; x=1784611379; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b9Sc3n5U5C1+CsrAALlPaGoyuHeytyFdQs/RjS86mH8=;
        b=hCfj0EG31ddrsBhLmrOPLuQXnoSPOc+9D3wZ7mgW62HVwKxllsuaN4agDpnMBnFjDc
         EXDPEwO+qlEtZXDvQ/1pq57jMzB6aZhgBw4CM3p0+z4jso5Ov44/0xqFHScpEyaf/cpO
         5egSN8UaZ/9irl7pCqiCU8gFGDcP46UzA+uVKnLGYKHODFnNNxLxOWQSAP6r8X7wGLpd
         atHlebbVlSn68Syq3/zskZ2p0umLDFbYsUGSMFcqoOlErcbcfYPbZHFjcIY5j8wy6DwT
         k1BPZo/xgvGmNwZLKCoGIRAqUZ3ZrTCj+XA2QKitj7zENTCs1sTzyXvEbTrT7QBsBRjM
         umsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784006579; x=1784611379;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b9Sc3n5U5C1+CsrAALlPaGoyuHeytyFdQs/RjS86mH8=;
        b=hdMxNISCmZpkU7sJa29jbKqBFD3QQa44Yjou/Sa8gv26SybcKhLey0U4bkaGVA7HQC
         7EERkxYp6aZMIiVfw/6GJLv/OIK294Mm1RFjvJScyrKoOaWfKiWrP6WxwPjj7kLph1LD
         3nvg92pNa0Axp+Wy2NxTUepqVdN8MUEB31SEWTnADKDlcDyB806/w60FSx9HnJTsbrX7
         gDs5aqDBxHvarQS/3gJJNX5QCWI0wnslUabLLqKUBB4Iz/fBXZ9lZXMriMjNrKkK6pxV
         /ldZuULLqWrHO23C415xwsy+pucp9Evhf76NTqE1tpnpZ43qncdU7uUjq7FpiIkT0WOF
         8hIg==
X-Gm-Message-State: AOJu0Yw+q8asOTrHjszObzplnDEfQbSAaSq42SVXAmTNK4JdesKAb455
	B5N7KYntZ/W1b80UNmqhTRG6XvfBMxz02qWSJlyMyoheLzHrx4/VmOTD+OJjfjJ2RBPMnMv4KP7
	+2lBYRjwjNUStxJmkqFE5A1xoc1V0/oNhUdt7bY4jr3jX68VQLKLkXk56e+X4x1hii31nUgWZpC
	Gl
X-Gm-Gg: AfdE7cnyUb/WcMcCluZQnPPBteD9W5af5wiodezFs0MjKqnyZHuYA4OqRkJuiRIYk9q
	eBIgKC+3BT8dHSqwpykkfJ9FI0hp0YMOYPG30W3y4ACEW0MmSGnO3VEw9r053ZLVmbZPKRytayG
	if9VCAzqtRiVRb2EwpnWoHKIvjuxALUZhC5ip6Lq8csVLq27bgbX7sqtvByJfLf9trfTm5pn/r8
	dwzO0DcLvjvIYkzSJjPT7CBab7Kdr/6UpFGlTvSoUjIDCIhi6pfCjmKDLffhEb8e4Ml2YDTZ9nt
	3lsGj8xJtz2ROsrlbFLRtUDUYfOnOw9iecfY46CznhCJhOoBi/1oFzbBLrgASINEVYLj2LP3uFR
	QY55/ZQaLpoTIERjUZCWDfAd+o5QCzSi9Z54Z1zUl2jkYt3YbbW/Q4tjhR9A/wsM=
X-Received: by 2002:a17:90b:1f8f:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-38dc75eb7d7mr11774134a91.16.1784006578968;
        Mon, 13 Jul 2026 22:22:58 -0700 (PDT)
X-Received: by 2002:a17:90b:1f8f:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-38dc75eb7d7mr11774088a91.16.1784006578434;
        Mon, 13 Jul 2026 22:22:58 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accb0esm78609864eec.30.2026.07.13.22.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:22:57 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH v3 0/3] input: misc: Add an initial driver for haptics
 inside Qcom PMIH010x PMIC
Date: Mon, 13 Jul 2026 22:22:53 -0700
Message-Id: <20260713-qcom-spmi-haptics-v3-0-c931bb7cb94f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK3HVWoC/33NwQ6CMAwG4FchOzuydcsQT76H8QCjyBJhsOKiI
 by7g5MH4qXJ3/z9ujDC4JDYJVtYwOjI+SEFdcqY7arhgdw1KTMQYISRhk/W95zG3vGuGmdniSt
 rywKLGhQgS3djwNa9d/N2T7lzNPvw2V9EuW3/aVFywRvQqAEaNLW+eqJ8elXPVO3zNNiGRviBQ
 B9BkKC6lPKMRrQK1QG0rusX1633AgIBAAA=
X-Change-ID: 20260616-qcom-spmi-haptics-3cc97e7b232e
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784006577; l=5077;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=hY84MH1T356dLuOtGk3IYq2rzHaNDOahtodfDNMp7D4=;
 b=kSe3woW3aqDqRhqg4D1BvQ2tKoN8uXea77QAdXAxfyRIKK10fiwZuVT3cEKH5JI4pJ/bM+bby
 rSA6tIWoXXhDcP6xdS9FgVRjp7JnN+GPuQnlUdByQvmLdrbWQPCylka
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: E5bb9pelKZBgujY4pHGHfoWA20mJQeYX
X-Proofpoint-ORIG-GUID: E5bb9pelKZBgujY4pHGHfoWA20mJQeYX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA1MyBTYWx0ZWRfX8WQWKtAEK3xF
 qCSpb4VhE0lWRhzZ1B3xMeCWxlkt866D1FTF2XO6K4ob2nHZ9houc1zAmbsE/+DwhtsVCrF8zaM
 5yS1pP3dJPnK845VFNRVjr9dKnMxzUoXD94Kg37McjseV4ocFjOHydfc0AbH2cCL70P6eHL/JLq
 4NfrCQPYkHbau5ZgN76qbaMOxuPgINZJ6LBym6uS1uHQbFMXPV3SBRijVr67XrVWfGIvYvHTk39
 F3wjRHr4WtKqJ9UgRS/rFWoY9yrumkS4p27y7Gre+/Tzckiugqdx8V3gw6FxXpvqFzcC0sbjlZL
 AZBkxXoGUufRMYoU7ALYu9sgGx33oe4NyrOcCdxQQjldSMwcKS8KHRRkffXtu5ss/vaacHGkBWe
 yXv7iNJV3QRdWIJvKfUtJfweXW7NB0AwJzwyePpt+3SZINmEbsqMx8xsOFU5p44WUYHQ5bJULkt
 krGKBrVNb8jCCM2fIjQ==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a55c7b4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=BfAra4sw-YzvcMA48iEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA1MyBTYWx0ZWRfXyCQ2mIQu4oqL
 yfmFz9BKCV1BWjHjv05i+3LuGpAcit/W49GBYlO56Z8KcWLYGskz9WCJYZPlpyEBa6ZRH381G/d
 Lp06Gvr3VQTxbxj6+6V4p2HP2Sp9MIY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118933-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9122175117C

Dependencies:
 - [patch 2/3] depends on [patch 1/3] and they should be applied together

Qualcomm PMIH0108 PMIC has a haptics module inside and it could drive
a LRA actuator with several play modes, including: DIRECT_PLAY, FIFO,
PAT_MEM, SWR, etc. Add an initial driver to support two of the play
modes using the input force-feedback framework:

-- FF_CONSTANT effect for DIRECT_PLAY mode which drives sinusoidual
  waveforms with fixed period and amplitude, which would generate
  a constant vibration effect on the LRA actuator.

-- FF_PERIODIC effect with FF_CUSTOM for FIFO streaming mode, which
  can play an arbitrary waveform composed of a sequence of 8-bit
  samples at a configurable play rate.

Also, add the device node in the existing pmih0108 dtsi files, and enble
the haptics device for several boards by updating the vmax and
lra-period sttings according to the LRA components that mounted on each
of them.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v3:

In the binding:
- Removed the ref for qcom,vmax-microvolt as the property with standard
  unit already has a ref in dtschema
- Added 'qcom,pmih0108-haptics' as a device-specific compatible

In the driver, fixed Sashiko AI review comments with below changes:
- Added a list to queue and serialize all of the request, which helps to
  avoid the races between playback(), which is protected by evdev's event_lock,
  and play_work(), which is protected by play_lock.
- Changed to use guard(mutex) or scoped_guard(mutex, ) for cleaner mutex logic
  usages, and update protection section to prevent race conditions.
- Added runtime pm control in haptics_stop() function, use it as an unified interface
  under the guard of 'play_lock' in play_work()/erase()/remove()/suspend(),
  to ensure the runtime pm control correctness in race conditions.
- Removed unnecessary stop play sequence in fifo_empty_irq() as the HW would
  automatically stop after the FIFO samples are played out.
- Added a common interface haptics_clear_effect() to clear the FIFO data with gaurd
  of 'fifo_lock', and use it before upload() and in erase() to prevent race
  condition.
- used __free() for safe memory cleanup
- Checked play_rate against negative value when loading FF_PERIOD effect
- Limited the custom_data length to 48K prevent potential OOM

- Link to v2: https://patch.msgid.link/20260624-qcom-spmi-haptics-v2-0-b9118e60f3e3@oss.qualcomm.com

Changes in v2:

Dropped dtsi change and I will resend them after the driver and binding changes get accepted.

Updated haptics binding and addressed review comments from Krzysztof and Konrad:
- Extended the description to clarify the 'PAT_MEM' mode (not yet supported in the driver)
  by comparing it with the 'FIFO' mode.
- Updated the compatible string to 'qcom,spmi-haptics' to match the file name and removed
  the PMIC wildcard.
- Simplified register names to 'cfg' and 'ptn'.
- Corrected the unit naming for the 'qcom,vmax-microvolt' property.
- Added an additional clarification for the 'qcom,lra-period-us' property.

Updated the driver to address review comments from Konrad and Julian:
- In haptics_write_fifo_chunk(), separated variable declaration and assignment, and added
  comments explaining the 4-byte and 1-byte FIFO writes.
- Replaced manual 'x * n / d' calculations with mult_frac().
- Switched to disable_irq() to prevent late IRQs after device removal.
- Replaced property reads with device_property_read_u32().
- Remove the 'INPUT' dependency in Kconfig

Updated the driver to address feedback from Sashiko AI:
- Guarded pm_runtime_resume()/suspend() with 'pm_ref_held' to prevent runtime PM reference leaks.
- Replaced spinlock with a mutex to protect FIFO data during playback and avoid calling
  sleepable regmap APIs under spinlock.
- Adjusted suspend/remove() sequence to stop playback before canceling work, and freed
  FIFO buffers to prevent potential memory leaks.
- In FF_PERIODIC handling, allocated 'fifo_data' before assigning data to ensure its
  consistency with 'data_len'.
- Registered the input device after enabling runtime PM.
- Unify to use 'h->dev' pointer in probe()

- Link to v1: https://patch.msgid.link/20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com

---
Fenglin Wu (3):
      dt-bindings: input: Add Qualcomm SPMI PMIC haptics
      dt-bindings: mfd: qcom,spmi-pmic: Document haptics device
      input: misc: Add Qualcomm SPMI PMIC haptics driver

 .../bindings/input/qcom,spmi-haptics.yaml          |  136 +++
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |    4 +
 drivers/input/misc/Kconfig                         |   11 +
 drivers/input/misc/Makefile                        |    1 +
 drivers/input/misc/qcom-spmi-haptics.c             | 1160 ++++++++++++++++++++
 5 files changed, 1312 insertions(+)
---
base-commit: 66725039f7090afe14c31bd259e2059a68f04023
change-id: 20260616-qcom-spmi-haptics-3cc97e7b232e

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


