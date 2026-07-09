Return-Path: <linux-arm-msm+bounces-117922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2nm7M6BjT2oWfwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:02:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7F972E9FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:02:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EfDw+euk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fGyMRwMd;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117922-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117922-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0BAA312E1FB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA35407574;
	Thu,  9 Jul 2026 08:52:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DDA3FFFA7
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:52:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587176; cv=none; b=hF5ejNGn8WPS/rHYZQOmcvHCgY7HuTH3HmSbIthe1ZGt6qWH5fxF3o0sEceAgvVhOUJWOMHcjPam/vAvRtH2C0+jA6haJNEb6anaQRHgFxxq6lK8cOFA58p+uz5dWDYExbaEA43cS70BqDveFCV7lNEmqwRDkgpxurS8CiODSZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587176; c=relaxed/simple;
	bh=XYBIxNqxFlq7OZ5a4J4tYbrJYzcu3v+1g3fbH6mCKdQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tC64S+RULywkVvLa0+r4tEwHGySvOZG2hKxeh9hcw8zhSEkm99zkfIX4LuEU3qKbrqyzidExqCjFWTctnl820O4CvIWf13r4b4izD0+LbVX0bYgGeLI9hETSFom+K4kXUEe8eEVHedZvfSjomfaSMsala3sBypAoptBwmWU90Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EfDw+euk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGyMRwMd; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960Z7T837402
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KA8OKDkI5NrQUgJQohCBN+
	QBBA4N92j/ePJqgTem5V0=; b=EfDw+eukyxyjSBy6yicqy8j1xLVJAkpSqVzXBI
	3oM23Pil3inMDkpYdLS9mOv6H1Aardrc9rrlbR0r425c2vvYRCpTRkFXXbzG+R4H
	RUta10frVzJEfS70ak07VTuEyj2eqGi80EMWDBZpnWQN9upe/wxGpQJQNh0YYD/4
	8lnHMHZYxnlxMR/CIM151j8aq4Rl/5AkpPap+zT+iCxzuMb6SY34CMpzZJNGqDn4
	bb4tzpPO2o79twuQllHPwsMf6Npxp3lln4ZvsbzRxJCD9s8LyaI/cvb8uefrfqZo
	7WjzreV9NyKXNTY6NNJhirY5kWmXu5Qj8AKvSeC48a/I+z6g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwb9v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:52:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3810960140eso3196582a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587171; x=1784191971; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KA8OKDkI5NrQUgJQohCBN+QBBA4N92j/ePJqgTem5V0=;
        b=fGyMRwMddP0WEzVpJamHXwzF3tYSpVEa7P40ynJRBdIUW/zpol3EeAZX56+3DeOV/D
         mVfEny9KLSuvb/5+/bVNXnZWUF7G64S/YlRUBgfb0NJ4QEeVAckEFkruqPArrDwK8/ZT
         mOgEg+wMrvfOf3TzOw4rKD9PpHpxhC4BhvvW1VCYY/nVKrN8423nQD0i4I6Ral6hUpjl
         6mJl5Ff/Mn9GwGglc8OUytP4HUAbdcJ+A0ZEMgpACTOVHXjgXdoquvg2JhVpG1axNDJs
         L75lHxWKMBMfOTVSdhZiDrJEqGgu3awgw7xCEO8zpyitHOidi0/PIzh0Jwa08qUr7o3g
         EkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587171; x=1784191971;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KA8OKDkI5NrQUgJQohCBN+QBBA4N92j/ePJqgTem5V0=;
        b=mDuC96TEdQ4SnOH01theWEcWpJavh/4YRM3zw8taEwMGCWF1gpr2ocToX7Ibr8Xd1V
         deB4ViKQzmTPa1S/tfNSXlxXPvCrbEj2F/oyHGNNQnB8tS3Wy3vyiHW/1/kF2NHcbYyF
         aCAEva4I0Rc3cmZf/sOAYp16Ba+aAQ1UCPYtVGYUbV66fSsgN5282IZ2ZlAGpwPz72lv
         lVT7p2aWIN/3ZiRuZzhVGNWofT6pT4os9vvOu5nozUO/VUlXh5RBNoWlayvrh/afrmoF
         0Y9/SujoLmdEVSQ+88BUzEDfXrjvG/qmsXiHVKukvMMh8wWmD0Nq2yKF8V+vEK9MOWYK
         C8wg==
X-Gm-Message-State: AOJu0Ywsqjnio5PCUSy1RT+tDvFbU/YQmltr/RTSFKPEoDzXz1Kt9sNC
	p2K/Ej0Iae/y3w7AD3aN7Ym/IJyPFLm5060leY7YXsW8k73Su+2Xzahj3NmDLxC2wiMfdJx69pY
	HS0iN7RrjWbB7JkvQTDaURftO4aLkpg5//Jif8TZk9bUiIjxyXqFnASYmE2JwXgfMDt2S
X-Gm-Gg: AfdE7cnW5BpBzpjJ9jLFgvvwyEqFDOo3D71CIYn68T2A0VGV7HSBO6WaD6kAadUX3nc
	IKxIo6vc2g5PU7yjWXPwDy4PEw6VqQ/Rpiq7rpM3n4kN1NJoQHZUbrPlerFmy5fD4lbNLd15UjY
	fXjWXLYw+YBe/0vGJPhSJgLc6AY0wdhoi22iXGUZh7v0ZY1uRUJ237amOPo2qJPSz2MoftubRtx
	Jyfwghi6WyN41zzUeCcooQNdQsENjH/faY5gqnB7lQZE/WMgW7FHZd5N3TBMGH595FtbOG2QxT1
	F0WziIHuxRL8zz2tL3bwv8GzEdGd208wTw5d89i9DX8HGrnUBXyGgJWMiW9cI1otWzJY/fuXUYK
	ysvBJI62zP3EgK1Vtqt7t7q8m3/nrnCxRDKW9MMjsLr2Jwyz3HDJxV3n8DR0dAmh3SlpwhbkGVc
	WUq1fD
X-Received: by 2002:a17:90b:39cd:b0:37e:2005:6509 with SMTP id 98e67ed59e1d1-3893fe5b9dbmr7084995a91.3.1783587170661;
        Thu, 09 Jul 2026 01:52:50 -0700 (PDT)
X-Received: by 2002:a17:90b:39cd:b0:37e:2005:6509 with SMTP id 98e67ed59e1d1-3893fe5b9dbmr7084947a91.3.1783587169972;
        Thu, 09 Jul 2026 01:52:49 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5574c36dsm822771a91.6.2026.07.09.01.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:52:49 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Modify interrupt handling for eUSB2 Phy targets
Date: Thu, 09 Jul 2026 14:22:35 +0530
Message-Id: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFNhT2oC/yXMQQrCMBBA0auUWTsQQqLWq4iLpJnWEYllJimF0
 rsb6/LB52+gJEwKt24DoYWVP7nBnToYniFPhJyawRp7NhfTI1WNFjkXEqlzwRalN+cJF48puD5
 En3y4OmiHWWjk9bjfH39rjS8aym8J+/4FG1EyzX8AAAA=
X-Change-ID: 20260709-eusb2-interrupt-handling-v5-da49ab5d5a84
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783587165; l=2145;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=XYBIxNqxFlq7OZ5a4J4tYbrJYzcu3v+1g3fbH6mCKdQ=;
 b=k0BLqybWUhl4RLc8NcIyvSa0hWFcpwp/Dm3Fpd/XbfLBDF1LTyxZO3VIRkMzernvGzGsmjAq9
 hIJw5M7Py7lB0qKQ/cyEQOpvjeqSqhXjJrnPFcxoQwfugo+bnxNBy4r
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4NCBTYWx0ZWRfX5Rd3R8IXCW3V
 fB8YVZKxqYr3F0ILllJQGyqIk3vvM7D2Fx3SpsSYXE7NEhastH7UGzwLiyfTDC4spNKIRUTz7yC
 mqDYW4XRzCwtdmNRmOgLH4RcP0goQAMZSPiz596DPhLXl6TeZUnhw0Lq4v92PXEzldqrtxm/P/P
 +4KNEgsq45TiHZPTS5Yf9628AkJWFBy35KwwRBhjGHNkNFQV4oJoqqANxx+PgvUaruEMvICGw6E
 yNorgiQgWqRBx8+ObbpFucY3GR4eCkdsRCQwkDbLMOF4+ixcuwWPMw2Olp40gmHFOkfN7qshavU
 vSlp10kx67dpK/4G6kkOcuWVlQjqeLpDSY6aKX9+ekwUf//x9qDwTPxeGKI0200AEGSnK8BTVDl
 rv0wBHjhT332gSmTMvUcJ1xqcqI3krVAemYtqcN5i6J4TEzXX5YIPrdegiQYnzmXTorwejq9DX9
 e1q1LA6wpB5etbcILgw==
X-Proofpoint-GUID: VbMiWGgPrfiqzoDa_QBRc4d4QUfoFyEH
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f6163 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hOquEkmrNNFKbTobP-QA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: VbMiWGgPrfiqzoDa_QBRc4d4QUfoFyEH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4NCBTYWx0ZWRfX30sAcQqjBeS9
 FUD5eNeYHLwMkZ/5sBQ3dfTLpBV2aehh5GNF8rZM7KOZavzZbIqPfQ3EFLx3aSdDof6akXSsjL0
 QvrZoTvNQOptWVGUjIfW0Cf6BN75SJA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117922-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:Thinh.Nguyen@synopsys.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A7F972E9FA

eUSB2 targets handle wakeup interrupts differently depending on device
speed when operating in host mode.

According to the eUSB2 specification, remote wakeup signaling in host
mode is detected via different data-line assertions based on the
connected device speed.

When a low-speed device is connected, the host repeater drives eD+ to
logic '1' upon detecting a K-state on the USB lines during remote wakeup
(eUSB2 specification, Section 5.5.14).

When a full-speed or high-speed device is connected, the host repeater
drives eD- to logic '1' upon detecting a K-state on the USB line during
remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).

Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
eD- line states, configure the wakeup interrupts accordingly

Add new property to dt-binding indicating that the USB controller on SoC
has eUSB2 Phys or not.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v4:
- Moved to using binding approach as suggested by Thinh

Link to v3:
https://lore.kernel.org/all/20260511094422.3561509-1-krishna.kurapati@oss.qualcomm.com/

Changes in v3:
- Removed multiple glymur-dwc3-mp pdata entries
- Replaced use of ternary operators with if-else

Link to v2:
https://lore.kernel.org/all/20260505194242.1947891-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
- Updated commit message
- added supported eUSB2 targets

Link to v1:
https://lore.kernel.org/all/20260502095616.666938-1-krishna.kurapati@oss.qualcomm.com/

---
Krishna Kurapati (2):
      dt-bindings: qcom,snps-dwc3: Add property indicating presence of eUSB2 phy
      usb: dwc3: qcom: Modify interrupt handling for eUSB2 Phy targets

 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |  7 ++++
 drivers/usb/dwc3/dwc3-qcom.c                       | 40 ++++++++++++++++------
 2 files changed, 37 insertions(+), 10 deletions(-)
---
base-commit: 62481c92444386d46b3c4a9c3dbcd4917f07d138
change-id: 20260709-eusb2-interrupt-handling-v5-da49ab5d5a84

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>


