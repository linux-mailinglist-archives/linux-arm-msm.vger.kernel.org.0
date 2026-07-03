Return-Path: <linux-arm-msm+bounces-116309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PxKpMGOsR2pFdQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:34:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2075B702660
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:34:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DohD7VqE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bbUFyFGB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116309-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116309-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E78743007F61
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 12:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702003D3327;
	Fri,  3 Jul 2026 12:31:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC513D3481
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 12:31:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783081902; cv=none; b=BTsz56oxtxN2q7X/7JYEaUtEy8laLBIJm1igIeiUs9ce1pi7nRpkYFZcQamDQWLj/jhtr1UdwIa2fBhSodV5PgmKwczARIg4G8kmnMQPALO2JkVrRySEpv1QDHD6dKk7ofROTtIFqL/iZ/hiFm5by5QAwBfAAtASMxxNEEgu5zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783081902; c=relaxed/simple;
	bh=2P2pDH5QM5dOgk99KIQRb6As+6P1qsImfANC1dJZPD4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PxufKUw1F3Uct8TYbH7HzAjROowfEiGgMDnJ8xdy1b5JSOYZVQ7uns4HlSOodXCdYV6s4e/g7kgicIEgfInPF9Dga3rrggRtRzC7mPUprW+YwJL1I1Dl2iwjTNsScM5OvXrqSoaSre+JDdV8C8DaPii0o1BMK8IxUQx35qDug94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DohD7VqE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbUFyFGB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Be4is3054310
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 12:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dh3FdVNPM5hSi+POR8I76m
	MIYHZB2dDIHKfjjUCocxo=; b=DohD7VqEw0G+K9rwMBQ3zXrM4aG/1zLZU98xWq
	aFfJ7uzLVHu2m4DEP0M9Qr35UnmC9qIKYUecUPi6JHhjsw+yOHK/D/FTkFC1CEGa
	0L26XNKqNr2F3A99LEebfG934lsZgF+EirkO+m97OAJ+RaKDThbXk+5/jOXyeMEZ
	VdUgdGTfXhAOvfGWC1ftqzgBnxbTQzMYCio42YcdMZ6pur2AzAna/9qLlCt9H+gR
	SoaNSnWH6ZH17+xuE3auKVJtFbCP9LYrInZIBSHFloZ0wv1LyRzVXEcRDxSwLBTq
	FXF5ai/M/51fPV8WvpYYSOc3P47U7vf6/1gcuz/ucNZpE0bQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j01ecb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 12:31:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37d4eede8ccso536235a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783081898; x=1783686698; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dh3FdVNPM5hSi+POR8I76mMIYHZB2dDIHKfjjUCocxo=;
        b=bbUFyFGBlIzrUtPxHz+Cqf2m9TxnhJHu0+QFgdbG+2yrJyO2siasjlH8hdpy9uOgYk
         Jj1CapdnDV+ANGau5CI/yhFUrOf9SM50wNniVrWExdy+KJyndCMlgaH0DLxEPrjuO62n
         122iyUPlyx55ZLLehrcV8k7vJXjr/fLOlhX527wmyvXokQlJhGjDsoyd//rIlEr0bcm2
         1O86hyjUBQhfCo2CKPMaAmYlwrjo61LH2DhbTSzUm/xUkonEjj2SUP5SralQNKZPIiCA
         quk628oEjeWi3V3N/gfLdP6zZVZNaZxeSOb2JpPBNJ/7v67MOe7g9NTrVZfcnjJN24+G
         SHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783081898; x=1783686698;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dh3FdVNPM5hSi+POR8I76mMIYHZB2dDIHKfjjUCocxo=;
        b=bmC0p8xFjUHgfn3zOSvzBMn9l9h0G7LKevu7RqkQHH8Y/iu6cz8dEP7+Pm2/zMvXGZ
         lLtNqWAOi71QG61nmtoSRybOowaGRxCK05DjGpHuB0D/Bw4kBdML2OGRJLogG3zggBWM
         X5DEIz2jRkkFHuEb6rgecpTPgky9eGreKJGcyD4eF7MyXX/1Q+3H3IWl96OmbqgSdkGg
         VvmMHVmQ/gXb/dWs+fHqNo/OuGvG83C4IW3JuR2HAxLBm47/Fuzbe+t8wIKhOnSl3Byw
         O9FBODTFnwhwJrX4yiiCbIMiosQl/YfygKD9wWQ3i4AiUbdmi/RDZ2Cs2ydwBfPyZUxO
         6dFQ==
X-Gm-Message-State: AOJu0YzFU4l3oKzX+K2VcpkKNNqpDZVJUzHr+BUGFMqgDYx+2HUaiYtA
	R838DQ62w1RKyWr/UCofub5oOEuJXgvwyXZu1VwwSuOUJKD0h8zZcDi0SjVe+KfcyEIHLXa4wF2
	5JdI/ZvlVUQn8tFhMLsWKo/uUc3R/xgQAfoG12jsua02sr7uZI7hqp5V404/wG60eLaZ+
X-Gm-Gg: AfdE7cljZ0bRqWbrOrw5i27HvKIg3X2UmAbbhEQxojZlJahxza1tg50yEmXrifExmbF
	cejwyIlCdIp+0eEuqAQmturbvT2ilGzzipNwW9t7m2o+z6gMWm0B64wolH8Tt9axvMk2xZ7RIbO
	l2MnsPCtXkjH1ig+nc000ZUOKIoREneqwap1pA9XP1E3T6ZoxLCSlQQqTVnYe8no94Hp7qIWxgy
	b+uXAT8oq4atZ51zOI1EexxQ43XRgvFzpjnHTF6mJuSCRmbpUUNh//ok8vI6OAVvhdYrSBWwTv9
	odNrQyAurT4bvQDo6sAIRX1wnxS6pZScXMFcLiDd97/mHV6cATe48VHOQcuPD/y28Srgzq+m+7J
	R3eZKW8QioUa7iomVoN6kjVj8vxqmSfVY6IoqpKfiVVJETUal4hghDkJdD8wE
X-Received: by 2002:a17:90b:41:b0:372:b4a1:21d8 with SMTP id 98e67ed59e1d1-380aa0f43d6mr11329162a91.13.1783081897730;
        Fri, 03 Jul 2026 05:31:37 -0700 (PDT)
X-Received: by 2002:a17:90b:41:b0:372:b4a1:21d8 with SMTP id 98e67ed59e1d1-380aa0f43d6mr11329118a91.13.1783081897132;
        Fri, 03 Jul 2026 05:31:37 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd223esm20949375eec.21.2026.07.03.05.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:31:36 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Add remoteproc PAS loader for SoCCP on Glymur DT
Date: Fri, 03 Jul 2026 05:31:10 -0700
Message-Id: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI6rR2oC/yXMTQ5EQBBA4atIrXVSOn7nKmJBq6YmM0gXQsTdN
 Zbf4r0DhByTwCc4wNHKwuPgEYcBmL4eOlLceoNGnWKGWnW//b84JaMxk8ptgm0RZzbFCHwyObK
 8Pbuyei1L8yUz3w84zwt/3wKWcAAAAA==
X-Change-ID: 20260702-glymur-soccp-8f50d947f601
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783081896; l=3797;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=2P2pDH5QM5dOgk99KIQRb6As+6P1qsImfANC1dJZPD4=;
 b=f4vOhL8MpdPbB6P/DtrmC750S3iDUuZXP+DGPaMxQFVCc6tD/kMto5niKqhgwQxAAB9yvbWI6
 LZTLhy/VtagBDIzoS6s/OYJ88QJDwmN7nVtosPYmhGR70jE+WtNQkar
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-GUID: ZFOGE8Ku1dXiUM3yl45gjE950Xyw7phT
X-Proofpoint-ORIG-GUID: ZFOGE8Ku1dXiUM3yl45gjE950Xyw7phT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEyMiBTYWx0ZWRfXxW4wkHyOW1bL
 nzcDmj9uFYgdlegYwSHbvfMzmtgO8V9bXqYAQ2OodI+wsKWJc13pImnJGJWAsUPdtocH4qf61B4
 itqHmPUtry1KytOT9CNAMcIwvvhyvV0=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a47abaa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PyseVWS9GzFPcPOKfMgA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEyMiBTYWx0ZWRfX/j3K6LT9+zRR
 8NFT3yr9cRchq0P9rBwmxlaq3Bjz/auD8cfiXKRZAnpoNBEzz8RhTFWFD4GxSV0T+AypOeBYl96
 jR03E77kZBrwTm6DTFKWt/Q0UYpU9UUMxUsITB9UobSzI6MFg92leqs+CmTAM8hnt6bXDQ1LZWH
 eXier0H+gC94RZYv+iyc+pOmMKHN5sHH4hPR6A7x09EUGSCZtdL5cKCPEaiirrZR7GPEYtWsLOj
 /z69stTrVZ2UvPSSpbuTyQakCVm96dakVpkXxV2kGjA+fWZ5cpmvbrE8mcOh/aO6AhCnB5zkbrH
 sCijLCQmF3BxzPLkEcj5Nf/57HyRqqDHAOXeVSSfmHWt5iywCtxPs4Rs7H8cX4YVpF8GWIcQsZt
 i4DqjyHZ/FSTa5kCcjiKPY2kwNbJ1uUt3zvuZxy9NGAD1M05awKKe2jf7AeY4mowmSxeLQPfZ7u
 dLly6kX5YKd+KOE3X0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116309-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:ananthu.cv@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2075B702660

This series adds support for SoCCP on Qualcomm Glymur/Mahua platforms. It
introduces the needs_tzmem flag to force tzmem usage and subsequent SHM
bridge setup required when Linux runs at EL2 in the absence of Gunyah. We've
been currently relying on the iommu property being present for this, but for
remoteprocs that are already running like SoCCP the memory mappings are
already in place, and any attempt to recreate them would result in smmu faults
and a non-functional remoteproc. This change is required for SSR to work on
SoCCP on Glymur.

For SoCCP SSR verification we've raised two PR's in diag upstream:
https://github.com/linux-msm/diag/pull/23
https://github.com/linux-msm/diag/pull/24

SoCCP SSR on Glymur can be triggered using the following commands using diag:
  error fatal: send_data 75 37 03 152 00
  wdog bite: send_data 75 37 03 152 01
  Software exception (Null pointer): send_data 75 37 03 152 02
  software exception (div by 0): send_data 75 37 03 152 03

/ # send_data 75 37 03 152 03
75 37 3 152
/ # qcom_q6v5_pas d00000.remoteproc: fatal error received: EX:idle:0x0xa90cc050:PC=0xa8eb5d8c:LR=0xa8fe5b3a:CAUSE=0xb:REASON=0x4
 remoteproc remoteproc0: crash detected in soccp: type fatal error
 qcom_q6v5_pas d00000.remoteproc: Handover signaled, but it already happened
 remoteproc remoteproc0: handling crash #4 in soccp
 remoteproc remoteproc0: recovering soccp
 ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI write request: -104
 remoteproc remoteproc0: stopped remote processor soccp
 usb 3-1: USB disconnect, device number 3
 usb 5-1: USB disconnect, device number 2
 r8152-cfgselector 5-1.3: USB disconnect, device number 3
 qcom_q6v5_pas d00000.remoteproc: Handover signaled, but it already happened
 debugfs: 'pmic_glink.ucsi.0' already exists in 'ucsi'
 remoteproc remoteproc0: remote processor soccp is now up

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
Changes in v4:
  - dropped soccp from remoteproc node name
  - dropped status=disabled
  - added a new needs_tzmem flag in qcom_q6v5_pas platform driver, and added glymur_soccp_resource
    which uses the flag
  - dropped qcom,kaanapali-soccp-pas compatible, due to the kaanapali_soccp_resource not having the
    needs_tzmem flag enabled
  - fixed memory region mappings for glymur soccp
  - Link to v3: https://lore.kernel.org/lkml/20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com

Changes in v3:
  - dropped smp2p nodes which are already merged, and adsp and cdsp nodes
  - updated interrupts-extended (dropped  <&soccp_smp2p_in 10 IRQ_TYPE_EDGE_RISING>), interrupt-names
    (dropped wake-ack), smem-states (dropped <&soccp_smp2p_out 10>, <&soccp_smp2p_out 9>), and
    smem-state-names (dropped wakeup, sleep)
  - fixed IPCC names, GLYMUR_MPROC_SOCCP -> IPCC_MPROC_SOCCP
  - Link to v2: https://lore.kernel.org/lkml/20250925-v3_glymur_introduction-v2-24-8e1533a58d2d@oss.qualcomm.com/

Changes in v2:
  - None related to soccp
  - Link to v1: https://lore.kernel.org/r/20250925-v3_glymur_introduction-v1-0-5413a85117c6@oss.qualcomm.com

---
Ananthu C V (2):
      remoteproc: qcom: pas: add needs_tzmem flag to force shmbridge creation
      arm64: dts: qcom: fix SoCCP memory mappings for Glymur

Sibi Sankar (1):
      arm64: dts: qcom: add SoCCP DT node for Glymur

 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  7 +++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 52 +++++++++++++++++++++++++++++---
 drivers/remoteproc/qcom_q6v5_pas.c       | 24 +++++++++++++--
 3 files changed, 77 insertions(+), 6 deletions(-)
---
base-commit: 6eb8711ece2ce27e52e327a5b7a628ed39b97f45
change-id: 20260702-glymur-soccp-8f50d947f601

Best regards,
--  
Ananthu C V <ananthu.cv@oss.qualcomm.com>


