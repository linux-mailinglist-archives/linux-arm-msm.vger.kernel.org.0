Return-Path: <linux-arm-msm+bounces-105222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yC9iD1cR8mmlngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:10:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C247A49563F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C722301A90F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 14:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E2F3921C6;
	Wed, 29 Apr 2026 14:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CwJqMuqo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdFy/q30"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60772EAD1C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777471442; cv=none; b=rYmjVyBSdLcH4yW540Ac6OwY6BgRGaRTZmI+C5jLu3qwpEcnNzlQ3OJnhB9MoZofvLvqHwDBnJSa93KbiG+YZegYBJAZZOA0jepm3Qj1cFZpqu/8EC/7TJrOhmHXc8OtT3ufHUJV6JArx6tFeNG2IKPlXBkaWreL8WywLMO2vaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777471442; c=relaxed/simple;
	bh=TFNBZbF2AykqlmAlNRgGuyEzwxEGnJlOKVQCArTNHJk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wwl+S3uDRWcl2C1Dc8Lq3Crc3OXuTW1yS+mgvvOW9phhgCYcu+BFw9C5nCcso/EVp/+EQoFkudQODvx93ZQJ2sECzU18s0pWWXAaGVN1QK4IGmAkjTj/NAcH4JFFXv8sQvTABJqjGcf+bXfQ4xzqOUipnbztSseeCxA+peNKgFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CwJqMuqo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdFy/q30; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q7Gx1721222
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zAUEpmuNkB+tZxSdEw+3Gm
	F38llUPVXR8WmpxBRa8gU=; b=CwJqMuqoVo96t8g803mCCxDfql2cIvgS9ZB4+M
	Q60HRONsMmLd6A2lFqz7Pn16BH1j3suDGPTz4POz7+7BJQIPL0DUtSnWXwozLO5g
	lPJKwPeJKE19RwUpJBCMp5FdoLoRTtdYV/3GiFceFVuKqgqD+4IRmO+YEWHw1KMx
	njS6a4iYmFbDCKd0fc+lXwzlz65Dw8qEY21gQh1WiXwxhE+sf14dySpic+r5c+n/
	C2M6XcwnJk1NRJoPqSMrmHaamBJJNKDp38sZACwrUL60BRSbmXQEdzyKWwpAJU49
	FwT3d58ba+ZalSKZ0Z4y8hV0jElnsvjhb+fMNM0qwGDXZNyw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua732b8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:04:00 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7af89eabe49so262843697b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777471440; x=1778076240; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zAUEpmuNkB+tZxSdEw+3GmF38llUPVXR8WmpxBRa8gU=;
        b=fdFy/q3084YC6dhc2JDWniOkKP/M0ZKpX3RTnb9c/8KQwHu2ZLGCH9ztwHu8iPREtI
         9pgt1HYBt9wrON7+qUdIF1HvwsIWJfAXkWPoO6H8/QAFd3GksnBONousi6v9lQI0vYVT
         Zj9wpica5jV/Ek49BOXpjzEfPTeSS+uiIGUqRDDkN/F7YLyc1C8wg0eCpaRpVSSWepg8
         MstrsgP/GA0PFjkSfC5AKCAqjVdbLoQ25FgkczDDlknb0Eh5QyqZi5OdFb/cuuYWMQZw
         J37knm/iq+LcNvLaDqp2N2dbTfzNlzCxIWSvoLnUi80KC9IKcxKk6WMJmW1S9ve0nP//
         EffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777471440; x=1778076240;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAUEpmuNkB+tZxSdEw+3GmF38llUPVXR8WmpxBRa8gU=;
        b=Vs9SibRFm026Yug6KY4bv90eFlWinM3I5Ahb5H03/k3oiLKb9IYbCV6pf/Cr0687b8
         /gbMQ3hDC+kKLKraIzXqSI+DtC7iHIWzdgaFc/R5s0bnioDsjF5lMMbOElzWvXKicNps
         Sjx0X9aTnoeDJkSFj5QUGw3LcBoOKOxe3jTfvIR8wR5Wt/Eejlh66bsZPucFNdV1kh7U
         vYDWojcUn++HRrkAUeZjCd10rOIjggEJpxx9qxlp79yUiPwycBaadk7ZhRIjFW7FKtA6
         k+qDs/2zxGfjO7p/EcHJNGJM0iKvDCsIQQgWSTgwL82Qu/iWXTMEdjFloiWva+VXQXut
         B/1w==
X-Gm-Message-State: AOJu0YxXsC6DHAjY5uPc/SfgcAYXxDHycvWwyEs6RqakyPyHCbd/D4Fp
	MKqOJNyaWiACiwmnrr8Bw5zectBHaINuVrundaQyhI3BzcN1G45NoIO149TXZ8pyRgSQT/0rzx0
	YB8B/od13FU+hF1q0kndSfblnxVxMmdFvqktbnBzvF1vSsAzEDza8/0vD3aJQXDFKYxZc
X-Gm-Gg: AeBDiesTYf8CJVRAB4dr/aGpXvT6Uq3pt6UzgRjD3CzM2YcCDPar2RPwVCUNkPuhNMb
	Ss4pWyima9dfJFfkWrjdd3IwMnruhaFhLibfuM1S4rdZKxLLxX1dXSKVinUtmv/cex/VBuw2E6i
	SiKT7/miljKrY5M+YH4c2U11XMpiZnNVdIoRNj+0ndM2LWJyjR+zt9E1RrIrrVAMjDV73PPVcE+
	1dZ5T63Pu9fvNZ7qUd2OlEnSr+dy8/kcQLwkakPn8qiFN3111mHcSu1Z5PPoowT+VUkvIkXweqX
	r3f7JyApgS4BzvHyEqJbFoMQSrgFXpefZZFmMT6TZWqsWAY2HbRFN1PIVh8fxOS11Iz4LxhoKTD
	w4iTwygObIsbk02WAHZ87X4l3Idq+Q1cAPJtcLwfrvtNs7MST6sVG1zk=
X-Received: by 2002:a05:690c:c4e8:b0:7ba:fd82:9113 with SMTP id 00721157ae682-7bd1d3787b8mr40117387b3.5.1777471439737;
        Wed, 29 Apr 2026 07:03:59 -0700 (PDT)
X-Received: by 2002:a05:690c:c4e8:b0:7ba:fd82:9113 with SMTP id 00721157ae682-7bd1d3787b8mr40116737b3.5.1777471439121;
        Wed, 29 Apr 2026 07:03:59 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd258ce06asm15382827b3.36.2026.04.29.07.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:03:58 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH 0/2] Add interconnect support for Qualcomm Shikra SoC
Date: Wed, 29 Apr 2026 14:03:47 +0000
Message-Id: <20260429-shikra_icc-v1-0-e3439903edf1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMMP8mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMD3eKMzOyixPjM5GTdJMO05NQ0E1NDI6MUJaCGgqLUtMwKsGHRsbW
 1AMUig0tcAAAA
X-Change-ID: 20260320-shikra_icc-b1fcef45122d
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f20fd1 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jFa1RlLEcyH7Bxs9oBUA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0MiBTYWx0ZWRfX/Xaa4tfvF+PZ
 y0GqQxalrOTvbiaB5X8d9P8vJqVECKUO+kQcgxBn3S1HYoOz610V8sE5xWx1OA5EXP4Ea8V0z96
 fjYo9WYcAY2D4+vUsMoJ3Z73Tt9xDU6NlbBkVzYzgM295PaIu1XYbheF816TaFSNZ0lWnPojiLJ
 j8dOqnb9OrIKOOv4ur+Nw419mBWixrOkJflSgVxMgN+VwDg6kozjq19xtHK64UZSoGxgSKt5D+2
 mWjWDJ/qPbrzcbcTtRRemVhLtNTHEpqV8eHzYPkVlzt/2DUjVD5y9v10ueydI8ZSaC6BXjZiVfN
 K7p8OhNq/CwyfiLef407xgWDPc6eRKZ1Kx2rqQd0lfZkjM5mzSEtx1+Fpz/irSlbxr36Vtp9PhF
 908SRmxwwuWsWpfhwdrL9wBf47zpaca/HHuXho22RJCackFtA7ImrdERWPUR0apTrxlFKf7P2KZ
 pjpL2ybN4bJZbVb/kiw==
X-Proofpoint-GUID: OpShurrZbFAeV9rDTTC0TKg1xkTELrPU
X-Proofpoint-ORIG-GUID: OpShurrZbFAeV9rDTTC0TKg1xkTELrPU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290142
X-Rspamd-Queue-Id: C247A49563F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-105222-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

Add interconnect dt-bindings and RPM-based interconnect driver support
for Qualcomm Shikra SoC.

Device tree changes aren't part of this series and will be posted
separately.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
Raviteja Laggyshetty (2):
      dt-bindings: interconnect: document the RPM Network-On-Chip interconnect in Shikra SoC
      interconnect: qcom: add Shikra interconnect provider driver

 .../bindings/interconnect/qcom,shikra.yaml         |  135 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/shikra.c                 | 1837 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,shikra.h     |  121 ++
 5 files changed, 2104 insertions(+)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260320-shikra_icc-b1fcef45122d

Best regards,
--  
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>


