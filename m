Return-Path: <linux-arm-msm+bounces-115636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FuJDL3TtRGpq3QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:35:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C14636EC314
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:35:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=URoN3Afv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="j//Evr2u";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115636-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115636-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B1BE83002D20
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E9A3F1AB2;
	Wed,  1 Jul 2026 10:28:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25923C108F
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 10:28:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782901712; cv=none; b=JaS/YMlrYgDLhVkPmT7m04STwAc6a18LBYTgW+BRiaPHUeNJ1qzM/W/wHWThUGCvgeeyJa+bmMoZrYdFcd7NWHQnF/+NESIVzETeCuuYcJbQHSSJvZxeu9DXNVhIyTkfuhS1LTxyd3DLF6y/beGQIyR70fKA5qbnsUxdkEU2fa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782901712; c=relaxed/simple;
	bh=p6/rbiH0yy8V/Ev7NvyttLP2qzs43HvqjCcMSAmF2eE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YLuDNG3tso3SdaTk6RB296fCNT3KrbbQbJyOVlGugqpGC3YGGgfMwfSz8P3SL6MHPfZd80Gy9W5JUi8vAYQn1h73hD24cEmbkF9x/JD7KgqCJqjbFXWI9CeARZOtQJHRgpYgUNfOvczkAc+pTlg87fuhD6kO3pd9/ASJuV/B+Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=URoN3Afv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j//Evr2u; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8tsk763068
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 10:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vkf6H4xF+/bBNFoTzQu+NM
	XiBTVIE05hAp23yXjsnuc=; b=URoN3AfvJwnKPPU4sFjL+i0VJ7YFm2V5Y4sWWj
	jVItoJ0EnTjXB//W4P+Zq10f1NX3YaKKn4djzRVEz/HFy6b5GZBxdYPxhlk0JKK9
	ckSfHIKn+nbjq2LDZ9ge9k1jhKSSxY6ICsQ32FqR6YySm4rDaOcJa5q9OhF9GIl9
	cARjW7fKW7xn0iInY9az4BmLwXWg5D/h3CWjR9nlKCKgE+LalbfzZg7BitdBadDQ
	opYgZ9UUAmY8kE89UxRfU9JeArQFOvYRUaHjNAEXSNp3mxFScgUeygctUEqOsuCe
	2QMvcbjfV1xY9cMMESGEOYOvucxpvyu5yjJnMZqIvZCf6ngg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktbmmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 10:28:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fa907f98eso435215a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 03:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782901707; x=1783506507; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vkf6H4xF+/bBNFoTzQu+NMXiBTVIE05hAp23yXjsnuc=;
        b=j//Evr2ugMh/y0qn0ai17z8DjTQoMyK9o+HxdVs9JkHD/9MfJlAjRr9vvb+qafFQPr
         vbo281QL+9dBgJp8oAcY1C4ZDkaHT7DptUfnwLL4iHfEJS8Hz+T8U2V0dnNMhvG/jVIj
         BMEhg2ZZ+a5SIv8pejDr78EOiClnOgL4W9aSKkPXN7o6tnrMJlH5Qear1xsMow6Q132R
         oxUrsKDtdw9w5w7igIXkrLinRxAx+WY3B5GIkcai6gK6TJLqRWQWsBPOqc5/CaJ4YPUp
         H2NShKpjQM99B1DXZH9edDk2XLJoqfX4d/5mUwEgeMm0rbLpM7RRrgm+RemmRfJH6hjq
         ZS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782901707; x=1783506507;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkf6H4xF+/bBNFoTzQu+NMXiBTVIE05hAp23yXjsnuc=;
        b=mSbcg0XnuEYKIHzeu0v9jlOF3oxm7Ln4fZh1KO08EGLuerzuFtMJeQQlrD9cHKaliP
         j+6IkftqVwLWemzc6ZGcsa6bAHeUWa0NFLCBy2syYrMxz1Sv7GZ9NTBltaTvoDzq4/uC
         ckn0GSGOIQs37FB3RkT+uGiEAeudwEVHr+njwG230t6VtcDQihsfBNhCMbgc0InRJIIa
         SrGAki/WcJ4hJSFkJvTrADL64f3zu/H57zYEt0iyS5tWDD2aarmp4ipz0Fu/xyG0NcbK
         5tHMrequRO9BJoJ2L+B/BL0vCFOIuAHLddCNR+/uzeLBTe6Z8aLTdl7/a6yzAeBCcSj+
         WBLQ==
X-Gm-Message-State: AOJu0YzdgzWK0mXfBfiLHZgLhusex/1YQdOcP01l1obJeXXA/r9R1TlK
	0ADiq+qhDIMbv9ArljTPBoJyEvOPR/wxsFRu/4InJA9rXrGdtWjGCh546ZB0MIyIN/g9fWA0onD
	LgAbtyyvNt7W8wCg4cTEvi4ynCSxdFRA4h2lttOidDfIOLUtCZLRkwXUHzfFREZuuD/M=
X-Gm-Gg: AfdE7clslxiMsE6GrXm7Ery+/kC/lmI+fks2n+mE87O/qmaRnNBQvfEXkmUJOWTNthL
	YQzjuUMzqCSITJW6kvYKSecdaoYBQeaKOUyflBrnWGkX9XzaKNtcADu+aljXrqfdRDRbP8mmPxc
	00ETM4Vvmf2ZrlOYp24vlP5jPXNHG7LZvaxRZz/Hh/Q91SCgfU9kyX3pbAAs0rggq4HYMC/pjkp
	gsw6NXdSGtMEHkAMXfH3xz9pLXWcmpMduvgPPhDcnjFlDi7g7WRGbwHq2CgQPDqTfgQFeMy/vy5
	CFIWyxjT76erjs91CCf63lpgJqTpv3kXh5IfKA4/7bN2RNyw78vmXLPR2JAb1X4zEq2/rr+Dpl1
	3Knt0kq8zelL3XOphoZl33aGlyWBGshbV9sngBQ+q
X-Received: by 2002:a17:90b:3c4f:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-380aa1c973bmr1005968a91.19.1782901706728;
        Wed, 01 Jul 2026 03:28:26 -0700 (PDT)
X-Received: by 2002:a17:90b:3c4f:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-380aa1c973bmr1005944a91.19.1782901706279;
        Wed, 01 Jul 2026 03:28:26 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095d2a0f0sm1658103a91.3.2026.07.01.03.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:28:26 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH v2 0/3] regulator: qcom_usb_vbus: add pm4125 VBUS regulator
 support
Date: Wed, 01 Jul 2026 15:58:02 +0530
Message-Id: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALLrRGoC/32NQQ6CMBREr0K69pO2UkRX3sMQU9oPNBGK/dJoS
 O9u5QBuJnmTzJuNEQaHxC7FxgJGR87PGeShYGbU84DgbGYmuay5khy0tfdlqoRUELuVIOAAZ2U
 a1ZhaY3VkebkE7N17t97azKOjlw+f/SSKX/vfFwVw6GsrlD3ZrsPm6onK56ofxk9TmYO1KaUvz
 pI00b0AAAA=
X-Change-ID: 20260520-add_pm4125-vbus-reg-95c858c6ae43
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782901701; l=1329;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=p6/rbiH0yy8V/Ev7NvyttLP2qzs43HvqjCcMSAmF2eE=;
 b=W/leEBvfrtoOeu68dfF32o4P5IKBubHrLO/qJuo96qLQlQo8taKmoJF2Klf3n/8UCd+jEfC5w
 Rw8yhqhaK1wAGijDHnTYVKz8n3XzkuWi5Eaa+brqlT05TL0Q7thxVgc
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEwOSBTYWx0ZWRfX3IIV14VVPAM3
 0Lbrdx017/iyjwVeVc3N1zw+N7rYoNvKZiNGwlJ1FhoZ+Mire6u6p9l9Jfx9JOFnkiMRc5bqReG
 GjJ6AbwmwtJMCF4GwKL7f2pUjfQl7ng=
X-Proofpoint-GUID: 70ypr-ydv7pkSXuRagsIi9Xz2WpGsnJ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEwOSBTYWx0ZWRfX5tpHkb7kV0ah
 FWKnZHHzRCz6UTpH0zv+r98/AeDXJrfPjKvsi6xh+CqwHa4D+H6JNTVvMbTph86mCP2jOxmhwrU
 JX+RwZBsKHB8kkqgVl4qYJFFncveqUpwbUur1QVz1eY83OTt0Ga3rlRbxWOY7A52NxUTb7tpEP6
 kyKAA4akTuILyW0rToPBYlcpIoVRIZvXNMw1oi7E6rgcGVtpVIiiQN2qGtL+16EUkEhYwUYrFor
 lCFn3781OdbQEf7E6YgfYHPiOMDQS9CWgImEtbSxMRiLK8g+/iBhRtQ+bzHhPIsaeayt9NcuQ9y
 GXOa5lojxqJNqEpMecEO7yW/afGNRjndPBfWRngehS5bQiPoMXgQpLPYGjPqKBPIQikvF1GOHDI
 VG3WbFDzlUE0yw6U5zHeVAnDrGs8VpOZOjgCA3smgRndyBuk7lipc45o5Cuo9rRED3HzVLYEj1N
 QbAl1NbcQjG8XmxGxww==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44ebcb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=R4MlLg9bFeQ77G5B0twA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 70ypr-ydv7pkSXuRagsIi9Xz2WpGsnJ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115636-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,quicinc.com];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C14636EC314

Add support for PM4125 USB VBUS regulator. Unlike PM8150B which uses
a current-limit selector, PM4125 uses a 2-bit VBOOST voltage selector
supporting 4.25 V, 4.5 V, 4.75 V and 5.0 V output.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v2:
- Fix the registers name and unit-address as per Konrad's suggestions.
- Use microvolt instead of microamp for qrb2210.
- Link to v1: https://lore.kernel.org/r/20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com

---
Rakesh Kota (3):
      dt-bindings: regulator: qcom,usb-vbus-regulator: add qcom,pm4125-vbus-reg
      regulator: qcom_usb_vbus: add support for qcom,pm4125-vbus-reg
      arm64: dts: qcom: Fix pm4125 vbus regulator compatible and constraints

 .../regulator/qcom,usb-vbus-regulator.yaml         |  50 +++++++++-
 arch/arm64/boot/dts/qcom/pm4125.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |   4 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |   4 +-
 drivers/regulator/qcom_usb_vbus-regulator.c        | 102 ++++++++++++++++++---
 5 files changed, 138 insertions(+), 24 deletions(-)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260520-add_pm4125-vbus-reg-95c858c6ae43

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>


