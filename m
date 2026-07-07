Return-Path: <linux-arm-msm+bounces-117244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UxUsAeXRTGr3qAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:16:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6485271A2EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:16:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KyFVSw0v;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KI+PgJx5;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117244-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117244-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95FCC30CCDC2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F7E3DB640;
	Tue,  7 Jul 2026 10:13:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2A83DA7EC
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:13:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419186; cv=none; b=Mjb9dO7ZzTlVNJtvfVbwwV17bZAPASm23RJpnbJVIZz69a0+xnhFch6Mcu5fE6jAuEymcCQUuRzVGw3mdcfLmKryg7+WnHK6JYPsW0zhqaRpBKRlzgYitUNfcLF9uBTd+lXTiYX+MzGDniWyrDmj9on9GZD03VBirts4g8jOKis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419186; c=relaxed/simple;
	bh=TU7emUYnOIccgBfK79pdZFOaCbcc5EGUoSDSzUTWuMg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AALbI2mLlwLF8pGUJ4UljMk4ZmTdTtMSUOBjzV0/b0CVdzQqSDKDKKcuVntrEUBlf2sFEUgCySCftKr7mUmDTOJLKepDMiWujl120+Z5bW37OdlRtTppFH+74urNmGoyYRm7a2EM94U2znKQHaNwkrC7EuyBgy7v5lhK8NY9cMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KyFVSw0v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KI+PgJx5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DiX13243256
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 10:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VxbtuvwpRUoGvdivWcnmVF
	8rXncXc4QE+jBcEPyZvS4=; b=KyFVSw0v9tk1MPz429pyJWIcZ59O1REBmp/Skb
	5WvKlzrPhRQxfggRGN8wOvRHfxPwbMsV64PTs2ODF6ld/biu51IZRqz33GdXBN6N
	uAZEYZ9SHOQa/SDRrHzuYznujKt0uwnO9KYaRXsUJxOzn606CVrCV1cCmTiaP1I+
	tOL1QyRCTGfpoWoq2dPZWOTXhf+7rmclxJ308bmGnP768cUaOBQmCRDwuYZA415E
	ipmHkgsbBGZCv4Dhp5nhpnRm+n5uMMGP9uRO/tI0DjZTYPNx7hOKtebay/0bb7gn
	WISAeVxs3QGepTAfx9gZCE72cNaptLF4jrmJuMG6NkbVZ/rg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11rp3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:13:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88d7a75507so6688478a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 03:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419183; x=1784023983; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VxbtuvwpRUoGvdivWcnmVF8rXncXc4QE+jBcEPyZvS4=;
        b=KI+PgJx5688Fl82SSHtwEXN40Yx9fPtfOlkcZm9I8RbOKtok6AKKsCcE3CX6k4XUnx
         U9X+tKS8h/xeCGDJHElSbbD7NMlRVsrVK4r04AUCLKb3fo46+0KFwg2ocdJlV98Ow7qS
         h964KY/CM5gbyWEUYU8hx5EwgZoPbmiREgc9qQajmUaY4Sj4RhB7N2gE01Ensp3yi6iq
         Jf9WtTBt7g6B5ZlP1d3SKPLVOSG/zwGHSLT6swShkTFdLK4V7xPCNyaPmicFGKvUOz/o
         o4HgU1kpnPniUpVwcxvT1YIH+03zzjKzzXvlrZFRDsL4756LH9bsGBqjYsy7++zURry8
         EaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419183; x=1784023983;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxbtuvwpRUoGvdivWcnmVF8rXncXc4QE+jBcEPyZvS4=;
        b=OME6m2NhsnvXpljqSyHahzkH/JHtUWMjz1FBT9qaI7B9U2NHjSKQVvX7ubmL/qgG9H
         MRHM/cvElyiL5L2kooj51TD+dMuiYhHPdbd9z4v9XRcJNV0gl0ENdb3nGVAdSZqqqMKk
         NXpjsRS6AxXjLHQ/b3atehrSWZ+3clT5OvlPjqhzZw09522cOrWMMob3XqrK3044CR9j
         2C34fXp7DXkIxHr0LVtodXNc2x6U8TgpNFz2wLXPDm4WTX7GeHYPkPh2AspXymB6AiV5
         tnmDxHigjxXtxAxuSbJyG4GzjYhTttnv4VHlr/N0WtH8uJvpEvZgTG7teycpsXcZ8ChJ
         VNYA==
X-Gm-Message-State: AOJu0Yy3vRtkxoQVnsLC8k7Rbhz7XVaKynd/zD9ZKu652b6LazaxFgEJ
	kYVvR3/nBvuY1+mhO5Kqm80fl0Ph3s/ZG73k4Vi1WPMWhe94Im9KTObife2Dv81/Cb+eKQdKqkl
	kebuYp0RAX/+xhHfrkrvWtqk8wN3gIamlRXH6ACLW6aUgYwuwjAiLg+fQWtkWXKrOjW7E
X-Gm-Gg: AfdE7cmu2SYwraSfJrs5F545T2Urow1GxLEF/P2XwU+vjG+FFeqkm+MHVUAjftgjNQ+
	ABn5AtvuXydQg3wt4YQcbZBYx5yDnTlDFopcynBSyMpE+WvzK199EXclmTUFbG4BtzKqQI35pm6
	JztJPMyI19uqtOUUrvsPFOXiYaJwzRCaxVi2CwzBJxMTpmSvUkiO1ctNZdB+lxx7BtJ87qPvSlJ
	Bp3ySHJmivjFLFXYP8RwEyEmkESW0oQf4aAk4d52FUyfawdXtZDqnCiL7YWEJ1/TqXLuC5ivwAf
	Y3vLLiiJSxkmDxgGdzDGo2WrpC62zVMKkR7g+ozaSVaJaXvfshtDphICJ/29AJb+rMDAUWALLb0
	G7RIEaTbSAecYoTr4HtwC+DiUDjjQmPJ1zqPnudxvv/XlxOXH5FC0NOvowEcA
X-Received: by 2002:a05:6a21:e587:b0:3bd:203b:982b with SMTP id adf61e73a8af0-3c08edc9729mr5628902637.16.1783419182810;
        Tue, 07 Jul 2026 03:13:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:e587:b0:3bd:203b:982b with SMTP id adf61e73a8af0-3c08edc9729mr5628868637.16.1783419182252;
        Tue, 07 Jul 2026 03:13:02 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8665sm7098929c88.10.2026.07.07.03.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 03:13:01 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: [PATCH v5 0/3] Add remoteproc PAS loader for SoCCP on Glymur DT
Date: Tue, 07 Jul 2026 03:12:43 -0700
Message-Id: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABvRTGoC/1WNwQ6CMBBEf4Xs2ZJaCqgn/8NwgGWBGqDYBSIh/
 LsF48HLJC+ZebMCkzPEcAtWcDQbNrb3EJ8CwCbvaxKm9AxKqkSmUom6XbrJCbaIg7hUsSyvOq0
 SeQY/GRxV5n3oHtmXeSqehOPu2BuN4dG65fib9d77qaN/9ayFFEUqE9R4LSJSd8scvqa8Rdt1o
 Q/Itm37AHKcLzjBAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783419181; l=4007;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=TU7emUYnOIccgBfK79pdZFOaCbcc5EGUoSDSzUTWuMg=;
 b=RalaVswj47OU3zbODi+lYkATnKxEsrWn7lIWLXW4K2yXK4JaMkVZRjWu3TSC06fGglFB7aOte
 APKLXvtCAqaA3OyJJQyG7Bd2X5/6Jb3vMmDTgTBYgD6y8mk4geNjYF3
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4cd12f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=PyseVWS9GzFPcPOKfMgA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: JHRop4sM0vGKhkiQL_Qih8ZRu2ubulXT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfXz6Cwi9ZunZ+L
 evwOClaRzI/4bNasB6/8ZZlRxlX+tmfVfL8WS/hfljD/IQxluVCFYN1bcch3Mm5PHbvEQ1t0yIL
 1PFLfPPkltj/4yVU2mPq0IN48GLz/yM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX3Up1Q+QT5u23
 +UfyvhSC6wSf/JmbzdWEu4P62zUQU+lVc4o7Yjsx8FPTVXxtPqJ9bUaMnulrf7c8WN0F8uaPGPg
 vL+rHBAZVlEK62Gew5sOVe5P9eUkAgrm/0HpwOxrT5DcU1euP5jrtOytqavRpWIrKTGIEpEJU4D
 mJ4R0hvY/WfHZDod7sbs8aBV7947V766NL2DrgbpdmHkWbMH2NlFwxHIuOSSsnhoYWUhD4En9P9
 NVg4kR/n/DfgYsCPr57pBVmScnBcasUPIFc7a+Nqb5ZXgzancVFYeZiGj+lOl8hpPrxuPx7VJ9j
 +ZlTNFsKIuMz10E9Gm3UfTESRLtzHWN+mAnDd+UiuY0k74wcjIBqHgF/BjZ2GsNkzn8CSPnwRqK
 SVkvA1zLp8+4/y4j4jkyVDWnMVNVEF83Jhzs0ynMNWqe5Mek0rVeqyi5GzlgzXo5wYIQRYNZgIi
 0xgiIbmMYXLbUJmRL8g==
X-Proofpoint-ORIG-GUID: JHRop4sM0vGKhkiQL_Qih8ZRu2ubulXT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117244-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:ananthu.cv@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6485271A2EF

The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
USB Type-C, battery charging and various other functions on Qualcomm SoCs.
This series add the nodes required to enable SoCCP on Glymur/Mahua SoCs.

It also introduces the needs_tzmem flag which would cover for certain edge
cases by serving as an alternate trigger to the PAS helpers to ensure that
SHM bridge is established on SoCs running non-Gunyah based Hypervisors. This
change is required for SSR to work on SoCCP on Glymur.

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
Changes in v5:
- sorted soccp memory regions in ascending order
- readded qcom,kaanapali-soccp-pas compatible as fallback
- updated commit messages
- Link to v4: https://patch.msgid.link/20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com

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
      remoteproc: qcom: pas: add needs_tzmem flag to trigger shmbridge creation
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


