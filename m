Return-Path: <linux-arm-msm+bounces-111828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jKRbBZmhJmrnaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:03:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF6F655788
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:03:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I9nCPyJQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LVNmAs+G;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111828-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111828-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A92FE31769FD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E3083B47FA;
	Mon,  8 Jun 2026 10:33:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D0F3B47F1
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 10:33:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914835; cv=none; b=S29Dbwbm63nqkvZlRTko+fVYOIlm+C9gSExmAO9Btw5J801CleWEJMgmRf0MLrPE9oNkkX9UMB/lm4+R+OogozP+/sEocNXFM1rwEJtwSAuHU2c+Zbp8ECGCOSGwd0x9jccBDxEjkdjujeQrbgI2onF/lpeAlhlR0VONa5/mcJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914835; c=relaxed/simple;
	bh=mfALNWkEEs2WNfix5EiGhh7bb5Eqm8ervGhQXKLAydc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OJxLycNpKN1k3rvzFDBxDAjMZge2+GtL52ysGBBaMZkhcC4fxp/pLpptTCwPMWSRiDDyFCK9AJ5N5litTD6CiKDqekBc2vbhlIYxDo5u/56tMtGCbV1YuDXAmlHWzRlPeDHGWfDVzX6RignG1WQ7FlBUfZQxoOJKmB09dbSgy4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9nCPyJQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LVNmAs+G; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658A3Zuw2848214
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 10:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3GeAp5gromZM7NUB9+Gdl+Z3P+05LRfVRMU
	kyPBfN4s=; b=I9nCPyJQMndq/fShdXiRMUwtWy0Hj+k9aSmnI7rTDEQWYwzcZ1y
	9MdKoAr6Jf+8jDchswVlW9ZI9IeT6v3qYMQ02SaJe16bNWLSPKY7tHKdRs2xVnvB
	J+q3shx5CRMKQpRvqZi7+wWgjS3IXyNYEef15s1cdTVWkzBXoyCQ3JpKqtZ+Eu25
	b4BeGqLJLv5MIWNSZ6zu5aiU93GRzgK0+v7W4uTIArLCNe2bmfxluKtsvT77NIWc
	apOl41VOoAjrw50itfNVa7I+cRlutKzKN3uOFC7M0NV7/qk95ZJbd/wdyQDF1DKM
	idwaZG7u7tg9cH5qgxOZ4MUGbkVIYhQFtrg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuna84em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:33:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36ba98cc003so2866075a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780914832; x=1781519632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3GeAp5gromZM7NUB9+Gdl+Z3P+05LRfVRMUkyPBfN4s=;
        b=LVNmAs+G2hPGtq7kHz3H+RGr9ujpmAb05uzib8b3efIwel1hiXKsUQHkKzY44WQH48
         DaTNgsUAYfabjd+fNEnM/0UiyM758e49Od4HDdNj/PoK7lIOc59obCa9N4o018TKpJw0
         Roh07sTE4HNgcICa5kx5K1dhcN+V7JvWtEK+8f/VTyi5/W7CqG6Jd6IOClrxBnBqFKbC
         pAI/Lp+UGvWvfWq0AccM1txNdIl+ABNyTjpXt7duywxwU/Ld3cS3FI3jvaarBlwuUVfp
         S52/kXq6lEFIGYtxfgYWJGSvPKhTgNCqOFpKheN7Acs5a4yViD/HfHm98osMfb/Lvn9j
         z4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780914832; x=1781519632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GeAp5gromZM7NUB9+Gdl+Z3P+05LRfVRMUkyPBfN4s=;
        b=BzJwK6h0Pet/EBE3eoqutl6YwF8cvJQH2oanEeIE7/ZIil+OeSy0w4XsHX2xVII/vO
         Z2DcR7FKVGBYozWWeWsrIoDyO1jXl9N/6YDm551aUNfx8AJhTl2tv5NVWYnqnECP6zFu
         FbRApHOSLX0+OPuJkTNs8tbwkCQ5crpM0FQOLUYfrz+BzhZYNG7QESjrQwfOEPTecHvN
         UwoPkpwG3Qqow6F0MXdqXEFObEJaimSFGEmR2WusJ8ZClBSsYgE8kvsrQJFpZMiKuWG7
         fm+75S6yN9LbeKuYEwvx3CzkAF0Koe+PMGDtqrjPRjSVvLOVnbsnXOSKb+idcRHiVI9O
         x69g==
X-Forwarded-Encrypted: i=1; AFNElJ/EHDEn8Lda5BHIwTBg0+mepymFAl6p5Ig/19vAR8oc1gIiNGQMcDx8xCNIL5E4ISWKv7CdpnZDAISZ4Gos@vger.kernel.org
X-Gm-Message-State: AOJu0YxuLLoskrLqTIDJtgMOaSD4ZIPUWPitPtyaOfB93nzxbOXkHOpQ
	KyM1p/ZysZM5+hi260PuDUjgMLbPoQ+Gk7WgBu/k/AyfgAT2xeXh56YPikU+9GIoIianYsZarqQ
	XlKTs1t9nsXXwjfeJoSYRGOze+LeBNe0ZdMDf2NHs1YxxpdBG7ivwcPicbUZ06ujYW2RH
X-Gm-Gg: Acq92OG+ZOh+If4MpS1SzNXa45h2N2m60QgZbZpwaHkjfPfrRv67dyiLjYycpjS52kJ
	WBLgGnulmFn3OLbR6AfTt3ASTcBXp4751lzK/J0lbEnBlNT7yVKRTCzaCRMJQbzY0mJ/4JWeoco
	LG0AHtZ7gxkzvDVDzGuxyjGQr9Gv88VafATHGYU/R3gpJ3NEZuA81NyJl/npNwN6Gk7CdD36UwJ
	Q0sOJhllMQWsLa/2IAogNa4rlXNL7G0/5x7k2BNYW2UtTz2NKYGvYocIaUc8imo8J6F6+VhU0Ol
	djjEo8mfoPMp+6Sq/t0c741/2pC1E+EoauPwU9NUS+9DV/hpaOBVeMQ7FVs6yNfnO2U2Fy3xTQQ
	KqPLFCoyUuTl/JbEFinE+Hvi/o9hDKf1dE5TMLdZDYErYeSrxMMyuDXP751A7/fX3dpUSiRFF99
	L2TuStIzobZ4kxzm4vkDKMiNEN5n2EM9hWuGtg2HURfXxwOgOtVc/OoGXyXLVkGg==
X-Received: by 2002:a17:90b:1fc3:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-370f0b554b4mr16414529a91.16.1780914832245;
        Mon, 08 Jun 2026 03:33:52 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc3:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-370f0b554b4mr16414515a91.16.1780914831731;
        Mon, 08 Jun 2026 03:33:51 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a2600sm18571570b3a.27.2026.06.08.03.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:33:51 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add ipq5210 USB phy support
Date: Mon,  8 Jun 2026 16:03:42 +0530
Message-Id: <20260608103344.2740174-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5OSBTYWx0ZWRfXyC4uB1W7fC71
 mYz2V7ifqPgQkfLMC1vR7DLpDCGgvpvqjuP8l30CT95h3Sh2hooOz04OGPmYfE++xk0usf+BxzX
 0P11I3KIQ75E1KyOAlTLE/RlnX/kx0IJ8rKZqDjAxZFS55Q/18AVf/Vp6ExsCDyBxS/isFhDM7z
 ydyqHAt+khWWHC7ER3PQXfnXKMApadX/afWVXFzTUoZq3QaGaZx0VWzTjVw6vy+y/SmMOLM48Az
 D4ud1xKdrSZHT5jDlLckju93YSpR5klWnkPh3iBg9Qc43DFdKPP2ydbz82Nhu5UaOmI120EMI+W
 4BXsFxdAVSSnvtUe3FV0IorDXS+MGzG2YuNVe72DuvR7kFFSJUp2FOCyBw64I+1TYA32FdcXE6E
 LmeXgquSuLtVAsKkpVi596Sw3hhje8omeRP9Qbi3JBV+mWtf7dlEdpNNLCW6yJJuRNQUd+tQd2l
 VI93GFP9eDJXbBAveRg==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a269a90 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rhUFs459tUsHgh-773kA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: l6jHxLzu4H985dQEfRF4fqBxOkHUL9ov
X-Proofpoint-GUID: l6jHxLzu4H985dQEfRF4fqBxOkHUL9ov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111828-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FF6F655788

The ipq5210 SoC has both USB2.0 and USB3.0 controllers. The USB3.0
can connect to either of USB2.0 or USB3.0 phy and operate in the
respective mode.

v2: Use ipq6018 and ipq9574 as fallback compatibles for qusb2 and qmp
    phys respectively instead of introducing ipq5210 as a new compatible.

    Dropped driver changes as moved to fallback compatible.

    Separate the controller and phy patches

v1: https://lore.kernel.org/linux-arm-msm/20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com/

Varadarajan Narayanan (2):
  dt-bindings: phy: qcom,qusb2: Document IPQ5210 compatible
  dt-bindings: phy: qcom,qmp-usb: Add ipq5210 USB3 PHY

 .../bindings/phy/qcom,qusb2-phy.yaml          |  4 ++
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 46 +++++++++++--------
 2 files changed, 30 insertions(+), 20 deletions(-)

-- 
2.34.1


