Return-Path: <linux-arm-msm+bounces-98086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJ6fJtYEuWmEnAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:37:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D5E2A4EC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E7E85301B784
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 07:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBCC29A32D;
	Tue, 17 Mar 2026 07:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSLLS03Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AO9IwVBr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BFD3909B3
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773733075; cv=none; b=ZYYtvveBbQIsKOTtU+2vPL5fYHv68U/C7buaLcfEx8JWZLtS1J2R8rMPnVZYtlDxwSKmmwuETahPHuoJ3Q35UzVC/ICq5kgkjzg9U5U9/eA/thy7GbT97WYDfjcMfQC2/qZPccsw3If6iat+0c7J0mRN30Ex0xOErtBNubjJjUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773733075; c=relaxed/simple;
	bh=sAvw51wMHU1PDqEYMYScQjoDa9TqMOrwgxwTvCl3y1U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wzmpe354AiwgXg7MOn9wlL3AuU8iALxH/mjKBsbQawNcTB1eTRkqnyeOW5HFY9Du9OyXQrYp/31i7oLMx/PR4L0MRN5er2J8TwnAj0GTABqhFndn66yIJQMQujk3BlUazC5QIUIk+4/ulXXy8kd4B2qBf54CQWfBr8P0Cfkfr9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSLLS03Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AO9IwVBr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H66PPS1621383
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=k2vr38BJTLxbbdoN8rXxgY
	169cMo6zlmntkacMwgbT0=; b=FSLLS03Quc0L3kUhW9MG9P4W4YjclC5heOZtOD
	Mg1phHgRd7FePXUr5Axa/5KI/IJELyXRcYftp5RLMeX1zkd0tJACkwVPy08aKpUS
	wC6Fj+vUKJQbpls9zHZED8jfvNZPcqzXAiwrWo8OMSt4GeW5zrPV12yM+ykeOrk2
	IUnRja5jsjBWnQJlV3pxNOOBzZkmSscOrnpKWnp3lwkCi+fI8KLJPKoVbG0LMw9Q
	hWdXDOKxwEZvM27b74YQZsFdmqdXCvuZtDCuoQlYEVcfQJyy8cf4eBb574P9yTqT
	ECorj8gAdHfdwNDJImZo72/MSZX603tyVQ7cBX7Wd1VvEiMA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxhyekgn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:37:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35a019abd6aso529652a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 00:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773733072; x=1774337872; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k2vr38BJTLxbbdoN8rXxgY169cMo6zlmntkacMwgbT0=;
        b=AO9IwVBrDwdRgPrCQAfjAVSqsBCthZv+bYzK5WK0JWCPcI4qxY0lt3vHZSpde/WDij
         7E7wql7tZiZA8AN2DLycBxB4M2Z2c+idQTGxt4a8LmuNoJNl8XGTdRFpNVEPRvoKshew
         ripHP5Uh+6UdtkkHz6gkFjATlK2tQ2lMmn5QqgMMu9/GRM0UpSQuCPSBNSR6u4t/Hrx+
         gqcEHPQg+c2nf1AKUB7g1W1sr2I74526j1uWHnCKEEd1RYnx6XXeFhEV4zY7cMKDOmWw
         i+ZJ1wYOOmP7+t0+A3p4rnY5xd0TTmbLq01bdw1FqosPkmAOd79XOgqERCw3U0I29bcY
         EDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773733072; x=1774337872;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2vr38BJTLxbbdoN8rXxgY169cMo6zlmntkacMwgbT0=;
        b=LsZa+Z/vM5yxWZXK5D5/LxJFsW6xklEX8A3dfyZJo2QFli2SO91zzt0nttOFENYUX5
         Yt/tZKnFrKDXSVKaid9076WxMRuVn73qP+wNBfW+VWETZHsLOv9gXA+GxG2n7YmFNpyz
         r//gRFkqfW58iHjxHAlt8MGEBoDafsbT4ZmIWU9zCtYXhz/LI4Mx53CLdyabYFxMKtjs
         BNlmgt3fmazd3sEYKzpAKCBpVO9iHCoVbkJapQnFU4aDt+1raSGX0kCQDFQbcafUlinv
         UjOYZIovo+TA5UeJdl7gZypPZQSg5yl4mTgUslKGutuMInbCxqRxYJnCGtI+2FDTvKDc
         eWcA==
X-Gm-Message-State: AOJu0YyRUzGxcKsIJj3CCq/dr5WWQiNQhr9X0JDw43pU1MbAM+RyyNQu
	GWILcTZ+kWrz/ulhj6ZgQZyDORnP/jiit+4Yq18IHaUCJ0ghI+IjoP4zGwmbpvMF+MS9sqrSdG/
	KCxpp40ONKEpAxfmmWfBL3Frn4VXllacgW+I1CxZ/9MgZzBQyD7UmEl0Eub+r5PI4XBXF
X-Gm-Gg: ATEYQzx8WCHjg3pNF96cirKWclYfWfZH1q/Oh69Vybd5S6fGLl0Gew1EpaIUAKuDZSo
	PvWeORbfbMhINyBYKQeOkuAGRfRt4BDpMioLweFHJXoLAmfERlpHxmcoVCI7JXXOPftV3vzdpOz
	RalfcdDYBqvScmmuxMvnvd63KyEKd5/CS0s3rD8EZwfYsBbNrUDDF5HxBrVEC3LxdlW0tczqDL2
	naO1EzehAv3ou86lNiEkVJr/PWoEwiy2svFim3NmIAcQz+OfmhtlPn5oOAIgIlc8+8RtqgOiMtN
	P5sFgmsXxyEyReqgoy99BvZzaQCTGuz09MG1jG1OJggEbQck+OtMGITqBxqGI740nM8i49HRCLm
	cKgUSGB37ku+nYumZyZUZ/OfweDRlmV0BCtLFLU13pW6En9+C0kSJy6vGtw==
X-Received: by 2002:a17:90b:530b:b0:359:8df1:8553 with SMTP id 98e67ed59e1d1-35badaf6a3amr1917615a91.9.1773733071748;
        Tue, 17 Mar 2026 00:37:51 -0700 (PDT)
X-Received: by 2002:a17:90b:530b:b0:359:8df1:8553 with SMTP id 98e67ed59e1d1-35badaf6a3amr1917593a91.9.1773733071239;
        Tue, 17 Mar 2026 00:37:51 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bada2bfdbsm1954913a91.3.2026.03.17.00.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 00:37:49 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Subject: [PATCH v5 0/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch nodes
Date: Tue, 17 Mar 2026 13:07:06 +0530
Message-Id: <20260317-industrial-mezzanine-pcie-v5-0-1358978517fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKIEuWkC/43NzW7CMAzA8VdBOS8ozkfTcNp7IA5p4g5LNGUJV
 Buo776UCzuMahdLf0v++c4KZsLCdps7yzhRoTHVMG8bFo4+fSCnWJtJIRsBCjileC2XTP7EB7z
 dfKKE/BwIuTUxtgZ60wnN6v05Y09fD3t/qH2kchnz9+PVBMv2P+oEXPBOBelE9W3Tvo+lbD+v/
 hTGYdjWwRZ8kk9QCrUGygq2xjqMTdc7BS9A9QsEuQaqCgKCkU5Zbxv/AtRPUAmzBuoF7GVwEZT
 W0f4BzvP8A9wkfaa8AQAA
X-Change-ID: 20260131-industrial-mezzanine-pcie-75dd851f5b04
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773733066; l=5972;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=sAvw51wMHU1PDqEYMYScQjoDa9TqMOrwgxwTvCl3y1U=;
 b=dbd51eoZy2qtDS77cuB+RKsAoa9vBhZ04dJItYNdkYU9T3TuNvGDWfuVEt0CRcbj19VGuNdQ2
 4cOWC+wJfBGCdksBoz6cFyZ6OuoB4kSjqPhSvIaBOcHHLyJjy2BBNhh
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-GUID: edTTSeRNBmR-BTIYzr60psUYSg6QMU6P
X-Proofpoint-ORIG-GUID: edTTSeRNBmR-BTIYzr60psUYSg6QMU6P
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b904d0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NDN-Thz4kSymccZKQFUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA2NSBTYWx0ZWRfX6BohxcEqVgT/
 F2wl3krSUqExyXr3wyXzm0eNA8t/NXQrJ7f9WQrea76WD79+s3uNbyw2DTpPgTWlLIwsUv5J1oJ
 5XEzBQZHvRtyVBBleMunzvSA6EcbZr8yE9s6EghXIecme2CpDar0wbGXrl/GRA/j5oDlLh5D5nc
 AJIdEDAlbqhsUNjEol5q8Ql5JfQnL9O6H6NQSh7pFRyk0hjn3u8A3k64iSp3RvBjiX3VNARRNL0
 knA+CnvcjBejFfTtXjpQzroxRoYTscCO1zgShjbez8wwMFCc10pYIQNoc6OJ38lnrKMJ1MFeUpE
 jZ2Qhu4Dn4k9IX+UstkjVfLrV4eGTzB5ofkR7YTHGFq4rjDYFcBOTuGAkpFpj46uWAMXEiSmVtV
 1zGBatewQ1qaPv4IPCVP92e2jo+AzFNG34ki9hDMjt3P7CqJgJaewEhv3nmXplErgPFwEgZ/eqg
 dVl8cY/U759xkPdQRVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170065
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98086-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 83D5E2A4EC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add nodes for the two additional TC9563 PCIe switches present on the
QCOM RB3Gen2 Industrial Mezzanine platform.

One of the TC9563 is connected directly to the PCIe0 root-port while
the second TC9563 switch is connected in cascade fashion to another
already available TC9563 switch on PCIe1 via the former's downstream
port (DSP). The final PCIe hierarchy on the Industrial Mezz platform
would look something like below:

                   ┌────────────────────────────┐
                   │                            │
                   │                            │
                   │                            │
                   │            SoC             │
                   │                            │
                   │    PCIe0           PCIe1   │
                   │    ┌───┐           ┌───┐   │
                   └────└─┬─┘───────────└─┬─┘───┘
                          │               │
                          │               │
                          │               │
         ┌────────────────┘               └────────────────┐
         │                                                 │
         │                                                 │
         │                                                 │
┌────────┴─────────┐                            ┌──────────┴───────┐
│       USP        │                            │        USP       │
│                  │                            │                  │
│      TC9563      │                            │      TC9563      │
│                  │                            │                  │
│                  │                            │                  │
│ DSP1  DSP2  DSP3 │                            │ DSP1  DSP2  DSP3 │
└──┬──────┬─────┬──┘                            └───┬─────┬─────┬──┘
   │      │     │                                   │     │     │
   │      │     │                                   │     │     │
   │      │     │                                   │     │     │
   │      │     │                                   │     EP    ETHERNET
   │      │     │                                   │
   │      │     │                                   └──────┐
   EP     EP    ETHERNET                                   │
                                                           │
                                                           │
                                                 ┌─────────┴────────┐
                                                 │        USP       │
                                                 │                  │
                                                 │      TC9563      │
                                                 │                  │
                                                 │                  │
                                                 │ DSP1  DSP2  DSP3 │
                                                 └──┬──────┬─────┬──┘
                                                    │      │     │
                                                    │      │     │
                                                    │      │     │
                                                    │      │     │
                                                    │      │     │
                                                    EP     EP    ETHERNET

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
Changes in v5:
- Rename fixed-regulator node names as per current format (Krzysztof)
- Squash WCN6750 and WPSS disable changes for Industrial Mezzanine (Dmitry)
- Correct the pinctrl function for PCIe0 CLKREQ GPIO
- Link to v4: https://lore.kernel.org/r/20260305-industrial-mezzanine-pcie-v4-0-1f2c9d1344d7@oss.qualcomm.com

Changes in v4:
- Added the perst and related pincntrl gpios, due to default state of perst
  we are not seeing any issue with v3.
- Corrected actual i2c address after cross verifing from the spec, as we
  not updating anything through devicetree properties we are not seeing
  any functional issue.
- Removed extra dummy regulator as per latest discussions.
- Link to v3: https://lore.kernel.org/r/20260212-industrial-mezzanine-pcie-v3-0-1e152937a76a@oss.qualcomm.com

Changes in v3:
- Fixed DT binding errors.
- Removed labels from unused TC9563 switch ports. (Konrad)
- Sort nodes in alphabetical order. (Dmitry)
- Fixed styling issues (Konrad)
- Link to v2: https://lore.kernel.org/r/20260203-industrial-mezzanine-pcie-v2-0-8579ed6bf931@oss.qualcomm.com

Changes in v2:
- Posted as v2 by error. Please consider as v1.

---
Sushrut Shree Trivedi (2):
      arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0
      arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node for PCIe1

 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 269 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   2 +-
 2 files changed, 270 insertions(+), 1 deletion(-)
---
base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
change-id: 20260131-industrial-mezzanine-pcie-75dd851f5b04

Best regards,
-- 
Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>


