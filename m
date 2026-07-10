Return-Path: <linux-arm-msm+bounces-118196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zEG8Gk25UGog4AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:20:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF3F738F63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:20:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=B3MmdWAs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ute0qQLN;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118196-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118196-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19A5C3033D0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10453D4138;
	Fri, 10 Jul 2026 09:04:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412973D45E6
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:04:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674297; cv=none; b=a5zB8bO9A7oRZEYxe21mcSLnaPSmz4Ylt5By+7tF6r56eySC6oXaX3T48jRyOfb2DyZO4GVGHoCIdB9z7oOWRl3vUK772Pci0eC8PE9bbg6rXcvyQ0sWAu1JTpy455E/WMzgOd4QFHeLeKlYUuX/Y9JxcsQzQ+Dxtim/GFE3w7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674297; c=relaxed/simple;
	bh=sgYRHAA8IdQaPOz1SqFrkChGOlRvTarETIwlza+HfrI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TTgKqMpxm1QN4kPEF8qzVx6ZAguqUUsI5MDe4i6KIa78T+v/KEvUIJAz8bZRFBEnGd6tB0K4gQRaTN8+GJttPXEaSJ/E3KCHH0lfqi34ettWNr5GmykytEccafaUCnDYnxEcVRLpg7bYXVY/mBOG3ouXqtFGPUU9QHwLZl0rsMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B3MmdWAs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ute0qQLN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7eJfQ141562
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9eRQdmSTaAB/jSbenBeTeY
	iG0btcLXCQgf9ZqLqJf4g=; b=B3MmdWAsxNYGp6MsDkHYeUQ8iWE15BPpr10nAz
	NeABU9A/4zdNODEZw3tdHNzLuOirk7Zb/belrwdQLo0FKWPNGX9BvaUM9zk3xI7j
	+HAUeZTSupijZnTphXR+mo5Y0stXLSeTSa1xGNYFVR/Zl+Hmfsv0tS1f0lXWZFrH
	x2H5b3Fa3H4sfRFjMVxHXHQZjTlLY9CZI/0m0xdv6UGAS6eB3Q/9Z1PV2h0Far5i
	uBvgY8PZ9BbauFTT8Zf9zs9eMkhqTJEMjFxdYqZtycanPEN4OxbNlfyuLaxjSKwd
	2lAYjUBeZBGX8uiVVlwUawoI6v9YEP14kfbAr5PvbcReyvVw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf5mueqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:04:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ee2847cbd4so9626286d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783674294; x=1784279094; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9eRQdmSTaAB/jSbenBeTeYiG0btcLXCQgf9ZqLqJf4g=;
        b=Ute0qQLN8BSElBORaH8BiK4p6FFNNdRM5S/htBrXuvcrR85Auzws86BJEi60VeBb11
         8GKc7GcwdVAE91YEm8+QWRxvO0aHrguBVCE/J/TOHzJewsLl5nZQrUVR3T+6XooV/Hvj
         XxGJxv7LZx5x8Q0U0Nk188n26EjFW08hItSJJOeTWJQ2481aavNL+2CpFp/1VXUIywbA
         UZwbBUedyj47dzd+WaqeVUE/4Q9PiEz3AAeT2eBB50cBo9uKRfWfIK0T0xkNGuEKdAl0
         cVluuhRUSU8YErLQ86AbkV6XilFvg1TCVnm9DZb1giflGvLWO1VEnqShoY2pFFPZacTf
         rr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783674294; x=1784279094;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9eRQdmSTaAB/jSbenBeTeYiG0btcLXCQgf9ZqLqJf4g=;
        b=gs5cneViUNiv7pfkl+RT3nA8aDnp5OHKX9X2M5R8rNCu92IJ0GLt3qPtdTVy0rGhqr
         uDo8sBW7RTpLdaZD90mN4ZdWl/gVoderkcZH0cD1vk5fHrxzkBcS/Bbgi5Y+nAzux0xz
         fcu29lATR2vd9JMN9giDss/mOz1e0b2Y77Qli5t+FCjPykexLOmsREppxAk3jvhwqnpt
         YzPSHDbJ+SI8qGgCrdu85QpV2gyU4oVNYkwdK4pVrTW9PoD7VMjle6ns6tC7YOud44xr
         NxxncQuPCqWq6oVfheBSRuMmpD3rDPlmjpeOPk4sOhArtFMG+CQ2ej97V/1wvw1HeLzc
         CSDA==
X-Forwarded-Encrypted: i=1; AHgh+RoqBD+wzhcv6r4F7ASR08kpcb1tQRiu7+CHWmhry6ONWdu246Bbv1Flh2EmY6y8WUwF3N26llhm7XlKeRgU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw42MutIBT5+UcP2o26Mc/HpCyD7pn78lc0npFjzaW08stxRJ0/
	zM87aKE0dWIBxG3t2NVqSybDA7ToFBHPqjRJEAxUuC7VxpFsmW95JLdbDIgu0+1W0gZc7E7i2BP
	43mdwQz/fwJ8BMK5bpJfHE7qBAVKHQQYRiUuJ5J5fP59PvgXwiRFuGdgFxT19Trx+bsMx
X-Gm-Gg: AfdE7clLQsSDVL+Xthzbw0/AJK7XYo9IDPPVXhXzmeKOoK2QgR2t/awoN0slY5P/epn
	XEuybX+3TcnbJOZdg4Zto2dxId8xSsWQ92NAId8FCBDPz0u5BPS4p8L7y1kPRZEluhNAsVTd+T2
	uBeNtwvo8cnhFo7C4QCx2aFGcIkdyagmtSF9v3gYwvRplkiAgF9Dbt2weBpjZ/7ytwa8i5h+mbH
	cySxxJU5lGa3p6XgShbhBQjepjoqIPslj88VAmeUqIMHdSAU5oh22ufbHO9lPJgr0flscGW6riE
	MeKdRus7onNfPI/KwR0cgtRfqz0tamMsXKhprenKGwpQ2yOS82cetL/g/PqkvHARw2zAfQtKdqd
	5vNMrL4oJrPjrYZhT8YOtMG7KP13xpEiBWzM9dxiM4hmQ5c2s/BV0wiPLbOnewR8daIbGsjA/Km
	ajKyy6akhAaZxSl8Jl3fhJetq0FE9SvppH3pmR7J9oKNfNqjC/anKhK2wyCLrbbQ==
X-Received: by 2002:a05:622a:294:b0:51a:8c9c:7f3f with SMTP id d75a77b69052e-51c8b4fc799mr127639711cf.66.1783674294514;
        Fri, 10 Jul 2026 02:04:54 -0700 (PDT)
X-Received: by 2002:a05:622a:294:b0:51a:8c9c:7f3f with SMTP id d75a77b69052e-51c8b4fc799mr127639281cf.66.1783674294034;
        Fri, 10 Jul 2026 02:04:54 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm259932266b.36.2026.07.10.02.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:04:53 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 0/7] media: qcom: camss: CAMSS Offline Processing Engine
 support
Date: Fri, 10 Jul 2026 11:04:46 +0200
Message-Id: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK61UGoC/2XOMQ7CMAwF0KugzLhK3IQiJu6BGNLgUkttU+JSg
 VDvToABCRZLf/D7/6GEEpOo3eqhEs0sHIcc7HqlQuuHMwGfclaocaMtVhB8LwIsI8SRwNauck1
 DAemk8s+YqOHb2zscc25S7GFqE/mvUmJp0G3RFmjMxjgw0EUOxRivnedhH0WKy9V3IfZ9kc/Lb
 VmmmO7vmXP50j+W09ufRXMJGuraaOewsrnt3zsuy/IEiwRSlvkAAAA=
X-Change-ID: 20260427-camss-isp-ope-4b575ffec2ed
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Q1OUyg5bxg4sUd-66MCNZUkDmTirLlob
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfX7rjpBk//quYF
 hAgw4iRJVpjkS0Si4rfiVvGvZohKubkoPFB+RN/9/pxS+SF6gSFFnTReEdJn0DwGOZ9LhkTP46U
 Uo9yUkkiGk0GnxvtyyOM0zEkwLcMmeo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfXwVbyTHJmSJ2Q
 TB64TbGvmSzG4fey/bTGBzB0aZ0OtRgZeYeCr8iKJ/aJVXEjxWna2Bl6VhPup+RXxOGjGGcPal4
 GI2b91YruUgUXsUBAJmth+vIqXa77/f6K609qumkeNfj7UX/V1ww/4W2yYGdQdcHzNVa4qZQlU2
 008iptH0xENrtPILBEuKrGzQ2y/w6Etic5dJIYHhk0e7vsx12ScMTHtdqNZG5F+JknS9AHN4GwK
 cn9ljjrbwmFBBVPXQCJffGvlgjv8DkRSzHPs82SBzv3DyJWpLEWSa2mEuYgzdWbfXmUqNQrZgr9
 UCfkmuzCbOZTBgny50jZR1nksRa92t4PejCjscgr3PWOwLHXBDkv1A0klBeIWRnwEFEPiUZAlo8
 YLvjIs1ZYdGKxIXc7gLBz9tFqY88BKOst4Wruw/7pKdbPneNYW/jHFwxBtQtscNXcgJP/BY6Rog
 i/skjp62DohleM1CD0Q==
X-Proofpoint-GUID: Q1OUyg5bxg4sUd-66MCNZUkDmTirLlob
X-Authority-Analysis: v=2.4 cv=N+QZ0W9B c=1 sm=1 tr=0 ts=6a50b5b7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oJE8aRnLwfUkw7FiLPAA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118196-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:johannes.goede@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CAF3F738F63

This series introduces support for the Qualcomm CAMSS Offline Processing
Engine (OPE), as found on Agatti-based platforms. Boards such as Arduino
UNO-Q use this SoC family and will benefit from hardware-assisted image
processing enabled by this work.

This represents the first step toward enabling image processing beyond
raw capture on Qualcomm platforms by using hardware blocks for
operations such as debayering, color correction, and scaling.

The OPE sits outside the live capture pipeline. It operates on frames
fetched from system memory and writes processed results back to memory.
Because of this design, the OPE is not tied to any specific capture
interface: frames may come from CAMSS RDI or PIX paths, or from any
other producer capable of providing memory-backed buffers.

The hardware can sustain up to 580 megapixels per second, which is
sufficient to process a 9MPix (4K) stream at 60 fps or to handle
four parallel 2MPix (HD) streams at 60 fps.

The driver is designed to support multiple processing contexts. At
present, however, only a single context is instantiated, which is
created on the first media-pipeline open. This keeps the implementation
simple while ensuring the design is ready for forthcoming multi-context
support at the V4L2/media framework level.

The OPE is a standalone device, independent from the CAMSS device. It
manages its own clocks and power domains (CAMSS GDSC and CX), and does
not require any change to the core CAMSS driver.

Graph:
ope_input ----+
              +--> ope_proc --> ope_disp --> ope_disp_output
ope_params ---+

Compliance: v4l2-compliance has been executed without any error on
the media and video devices.

Testing: A camss-isp-m2m tool is available at
https://github.com/loicpoulain/camss-isp-m2m-test
The tool can be used to exercise and stress-test the OPE engine,
as well as to observe performance and latency behavior under
various operating conditions (resolution, format, buf count, etc).

./camss-isp-m2m -s 3840x2160 -n 5

  Name                            Device            Dir       Type
  --------------------------------------------------------------
  ope_input                       /dev/video10      output    video
  ope_params                      /dev/video11      output    meta
  ope_disp_output                 /dev/video12      capture   video
  ope_proc                        /dev/v4l-subdev13  -        subdev
  ope_disp                        /dev/v4l-subdev14  -        subdev

Test: 3840x2160 RGGB -> 3840x2160 NV12  [5 frames]
  Input   /dev/video10  3840x2160 RGGB  bpl=3840  size=8294400
  Output  /dev/video12  3840x2160 NV12  bpl=5760  size=12441600

Buffers:
  /dev/video10    buf[0]  offset=0x00000000  length=8294400   VA=0xffffbcb87000
  /dev/video11    buf[0]  offset=0x00000000  length=12441600  VA=0xffffbbfa9000

Streaming  5 frames...
  seq=0      buf: in=0 out=0   14.833 ms  (67.4 fps)
  seq=1      buf: in=0 out=0   14.874 ms  (67.2 fps)
  seq=2      buf: in=0 out=0   14.902 ms  (67.1 fps)
  seq=3      buf: in=0 out=0   14.960 ms  (66.8 fps)
  seq=4      buf: in=0 out=0   14.896 ms  (67.1 fps)

Changes in v4:
- Made OPE a standalone device again, sibling of CAMSS rather than
  a child node, following maintainer feedback (Bryan)
- Aligned params with ones suggested by Bryan (when possible) (Bryan)
- Correct usage of subdevice states for configuration (Hans)
- Removed the bufq and scheduling helpers (now in ope driver) (Bryan)
- Moved generic pipeline and params helpers to camms 'core'
- Fixed Green hue with some downscaling factors (reported by Hans)
- Fixed ope_enum_fmt_vid_cap (Hans)
- don't hardcode DT assigned-clock-rates for AXI (Konrad)
- Link to v3: https://lore.kernel.org/all/20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com

Changes in v3:
- Simplified camss_init_pm_clks()- no clk_get, no rate setting;
- Added Assigned clock rate in devicetree for CAMSS AXI clock
- Add Kernel Doc for camss-isp-bufq exported functions
- Added description explaining the 2-cell for CAMSS bus
- Reworked OPE media topology with intermediate ope_disp subdev
- Support for crop and compose in ope_proc sink/source
- Fixed Write Engine violation with some scaling config
- Fixed input/output custom-stride issue (Hans)
- Split uapi header (camss-config.h) into its own dedicated commit
- Patch reordering to respect dependency in regards to ABI/dt-bindings introduction
- Link to v2: https://lore.kernel.org/r/20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com

Changes in v2:
- Not an RFC anymore
- Move from v4l2-m2m to multi-devices design
- Support for parameters
- Helpers for pipeline, job scheduling, buf-queues
- OPE as a child node of CAMSS

---
Loic Poulain (7):
      media: qcom: camss: Add camss-pipeline helper
      media: qcom: camss: Add camss-params helper
      media: qcom: camss: Add V4L2 meta format for CAMSS ISP parameters
      dt-bindings: media: qcom: Add CAMSS Offline Processing Engine (OPE)
      media: uapi: Add CAMSS ISP configuration definition
      media: qcom: camss: Add CAMSS Offline Processing Engine driver
      arm64: dts: qcom: agatti: Add OPE node

 .../bindings/media/qcom,qcm2290-camss-ope.yaml     |  147 +
 arch/arm64/boot/dts/qcom/agatti.dtsi               |   74 +
 drivers/media/platform/qcom/camss/Kconfig          |   18 +
 drivers/media/platform/qcom/camss/Makefile         |    6 +
 drivers/media/platform/qcom/camss/camss-ope.c      | 3245 ++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-params.c   |   67 +
 drivers/media/platform/qcom/camss/camss-params.h   |   62 +
 drivers/media/platform/qcom/camss/camss-pipeline.c |  386 +++
 drivers/media/platform/qcom/camss/camss-pipeline.h |  232 ++
 drivers/media/v4l2-core/v4l2-ioctl.c               |    3 +
 include/uapi/linux/camss-config.h                  |  161 +
 include/uapi/linux/videodev2.h                     |    3 +
 12 files changed, 4404 insertions(+)
---
base-commit: 6b0fbf4352615cc5e542347120f1724ce31837f8
change-id: 20260427-camss-isp-ope-4b575ffec2ed

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


