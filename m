Return-Path: <linux-arm-msm+bounces-114604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NEP0C3USPmoE/ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:47:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFB96CA75A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:47:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eUKipxJ7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JBCbmv5a;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114604-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114604-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC4403028C6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B0F3CAA25;
	Fri, 26 Jun 2026 05:47:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD1F3C9ECF
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:47:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782452848; cv=none; b=hJRjYyUZy0ORHzXyZFsuQQEeukp4Y5CtaSevTJABWMzzClRiD5MMcRzvE03jHqfUG1qlaNCleETZOK/joK2kuP+KjpTvGLCGDHmePjVaC8dHU5OzstOJoV96HOLMY/yfSoNOASwqO+YRICUsevgBZBfmNrui9RgI7SA4I5pJNUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782452848; c=relaxed/simple;
	bh=r18zUcCEtt3q4VZvrJxgIv1cyuMWFYL1BvadhzW/xf4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hpJEE9j3bM+OIbVIm8omY2G1LWa1eVqccPz93bqZCJ0E5QGf1GQrKVsJDfM07VzOBjOiZCWuaT0HZ8ERSB4L7KFdqpseTACYoCo1iUZnOWD32EU3mEVW8kmbA8LGwGvClhVtz8Z49MgQ3KN82B16HkXlVgH79fdbRtfTYJhTJqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eUKipxJ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JBCbmv5a; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2ilq9003564
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=L0vlrvagyMguXc/y0gIFf7
	fDulN127IXK95c6qxEp8c=; b=eUKipxJ7xsy0pa9IUsEcQdNcMU0HlfOq/V5vfy
	1NPKh6y/ATyazRpCwAma9J+6r4doXTScl7KEXreEx8me3RoubFawSLqqEQeRyOOz
	ijYt2CzjItfynAzJxmFKULBfjDC0dB9XiFsr0oRt2X9aUjVZ3pyEEKTb/4Ly4euy
	bRJ87OIPGX08sykeLMQFYwcFrhWzlAM5EffG0Mk6XVo3QMH2qzthFHGs1/b1HVEz
	ozea2dIjkR7uJhLnce8bPUt3AKkcAzT49ibF+YDh6qH7ejt1ACTocdY2wbwjVJqN
	XHQwBoPKpP9qK+0dLbFCr8ceY78D4QdwcEmR/xYXaAZIjoOg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fct8xre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:47:25 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8067fa066bcso27167067b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782452845; x=1783057645; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L0vlrvagyMguXc/y0gIFf7fDulN127IXK95c6qxEp8c=;
        b=JBCbmv5aEDPH8dyF3ncTDtIMo6lnu3YZZeXpG8tnhINucslhaS8l1zmrU4uXKsApMS
         Vqqvj0XRtb6PgHfEj9OrF+uU1bfDmBJHSJsemlyLEp7Akivjl9ba5eGZlEjazBaCRL+5
         6WVgDCo2+kL1L8eXFhiPTMpVzXesxmiKySz7sHeTYUqCd6IqN2A7fZ4Q82aXqoNGkezd
         67thaDX9XhfKtU1HikKWD6PbOAFic1DrQvSiyTjBVq6jg7GqQzfcNBpZqFBfeEV3st5C
         cTtnW7ewwNAc8vwNG1Akcp1jyKK5npCbrIRTZxh8AqBBrviPkmp51Sh1iQ9r4f/rzRcG
         1ZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782452845; x=1783057645;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0vlrvagyMguXc/y0gIFf7fDulN127IXK95c6qxEp8c=;
        b=suz8NCnotmIbXKLTXw+dZHfJLuDOBcB0wTiaMzYxaw2cJNcww0EUDlozjg//jZyGK0
         wuFC1q1HvcmPU33FDUR3PMwpgH+L/H8WkLZ7Z1kUiZn7t2fjPGoBtAK6b4H0Dn53Bbo1
         iGXBUJX8ZpjfhYerGht4ukbVcfqp4/fWqgveVz7Li3gal4lz/iRxGdU9cJ7u8kylG2Qk
         5auDdenOhRbbpW53wKJ2a+TYQ3eZIZml8sFxxWUDi+6w+TZI8rFDpLHI7A8Bl3U8/n2S
         kr+f9WqR5RIl4wqx2sE9NT5QfOuBT52Xtq2U98fXrTzGbnrICLVnD4KP7LiYHp1E39wb
         uGkw==
X-Gm-Message-State: AOJu0YxitY3jerUb2SjzqO9vmF16B9JiywHivZNM3bn7P7toRnWmg4Dj
	emAZr/CuxLVD8++QAG/CioxoYgWMdgLT8NDbo91ltUUWFSMNoURnIkKnKQfHEnFyNgR6LRYBapp
	3J2wX0STnHIpXKdAyt2DUzwFJqPwAhG2u0l+PepsgqBKNqk2LUrBK6+Uu4KQFfCDELQZcm/3MKY
	ze
X-Gm-Gg: AfdE7cmFuLsivgj9nV9V1c+H1B+Ju/59e0JEVgihd9vYH/uuqbxf6M1heTYGBe6kiBu
	OiFwD2QaQa6ysp9f577uKXdEcluyTHLgLczcZO6IoEtfeBvDhvVJBIj2RjgK24JcFIH9vCU9lFB
	PtODZsvza/yrq/kAl5asXkdf4CKLqTVyHiOXaz9RAMp1igV4qWX6WK2c7jnlIi6EYc8/GxQhORM
	OdR5gRmngrXe86BbTT+nFPEGue6nYrpjjFc/8swI30QRKMqFJK5ruWVDopgRCLYyjMDxLVcCNi0
	OLKUB9PDO+Pq5wkYJ3Sq92oXDvvL5yWTQi5rhJoPOnQvmasgx7r2ZWD99hFGGgQ6SMthNeuP2UP
	1bqmkV5Ld5+YBboQYlbgC50ge0dSl5OAzwo9dGE1durVU1wthAaBjkbdspY9RN8zLGGgpf+Dev6
	eNnGk6/6Z6yhIJvdY1wcWhjvqD5w8WBQ==
X-Received: by 2002:a05:690c:e191:20b0:80b:9efe:4a8 with SMTP id 00721157ae682-80b9efe0a3emr8621557b3.6.1782452845209;
        Thu, 25 Jun 2026 22:47:25 -0700 (PDT)
X-Received: by 2002:a05:690c:e191:20b0:80b:9efe:4a8 with SMTP id 00721157ae682-80b9efe0a3emr8621447b3.6.1782452844803;
        Thu, 25 Jun 2026 22:47:24 -0700 (PDT)
Received: from agents-Mac-mini.local (108-89-202-162.lightspeed.sndgca.sbcglobal.net. [108.89.202.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-80259d20d84sm80029787b3.0.2026.06.25.22.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:47:24 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Subject: [PATCH v2 0/3] X2 Elite HP EliteBook X G2q support
Date: Thu, 25 Jun 2026 22:47:19 -0700
Message-Id: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGkSPmoC/42S3WojMQyFX2Xw9TpI/p+wLPseS1lkW26mbWbS8
 SS0lLz7OpMQKNuL3hhk+3w6HOlDVJ4HrmLbfYiZT0MdprEV6kcn0o7GR5ZDbrVQoBw47OXjy/v
 +OMvKY5aI2mVlNKEC0RSHmcvwttL+PFzreoxPnJYL4vZj5tdja7Ncv4kDLWnXmmw77YqJ0XsDJ
 TubA4RCzgUbE5sI2veBrPGlrJy7CqxxGiGoZGzWFDWiL9ZggWxyD9E5yJS8/qyigoG4gPJNplA
 nxGi088YV0hh1dBzZuHhR7blWWoPYdj/XHMw9h7/5IE8oUVJGcJ4CN+zvqdbN65Fe0rTfb9rx6
 2uMVRqCtYgbZbVyrm+cOsRhU2l8pvm7GKe0fB4Psk4pNTdegkROPkab+sLpuxgD+j7cK0k3PwU
 4ZOtLy4e+JkWqLC83w7LtRn5b5M2VEZcd2A11meb3dcFOuI789g6fdqmlCLIkQyqVlqX/37d4O
 J/P/wAwBl+1sQIAAA==
X-Change-ID: 20260619-glymur-send-1136d243a120
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: beatjM0tieF01eHRK9sIFCsNlVagqMpG
X-Proofpoint-ORIG-GUID: beatjM0tieF01eHRK9sIFCsNlVagqMpG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0MyBTYWx0ZWRfX2HSmYgDZo896
 sNdn8tn7xt7P9Im04eFlRer9kTZCA5U5rLcGzYLjr1ArAa57ag0BKaHIG9LKKF3Lf71A/fWVOP0
 //C4JAEj3Lh701xeKCJF8yrKjAh11cR+JTBtolOBzgwzCLZFiseWVNmPMXOTexnsuTqE7etrv5s
 h0Jg6taFRruou+jLBeT7kkqXIBraInoMxzsP3txchtSFpfkkZIuuqZFr1MFCqyLP/OrB07NLmvw
 f3EZvrmbBHxeJLYetAZNl2jhqjsnHzyFKySRjoQHQo+UA2LXkp8UOIZZo+1wtzuNl5COXg3n5jN
 4KuISOoj+9Qh3xYS4iSU/fcVMYNc/oaAszGTSlM9YnwQP3rifwy8HiyLwzZbCz0Fml1WxN1JlAg
 Fd1lintsoOLo235VlkXPLGKCwFdmnqCNf5Xvk8TP5xTEcK9mG1oBH6b/qcRLhxb9o4U8PkG/8fo
 t/cbrTp6OprxFyodO5A==
X-Authority-Analysis: v=2.4 cv=FPkrAeos c=1 sm=1 tr=0 ts=6a3e126d cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=AgdIAmbgiPN5lz+IpyuXaA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v_Pz4op7f3T_4hR4KoUA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0MyBTYWx0ZWRfXxjKj0hjdyhdS
 Zraacxj4ICnvsWpG4pyOQ0hDV7DFRKrKOp6VWlD5RqsLN8Pdrq4ZJFtqIyvPWLcCOgmqsN0MwxT
 njml8wfnaqS3sALiRK58+qDc6NSjw2Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260043
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114604-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:jason.pettit@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBFB96CA75A

This series adds initial device-tree support for the HP EliteBook X G2q
14" Next Gen AI PC (product SKU C4JG0AV, board 8E91), a Snapdragon X2
Elite (Glymur) laptop.

The board was brought up and validated on real hardware. The electrical
description (PMIC rails, PHY supplies, the HDMI bridge wiring) was
verified against the live unit rather than copied from a Glymur CRD.

Working on this laptop with this series applied:

  - Internal eDP panel (samsung,atna33xc20)
  - 2x USB Type-C with DisplayPort alt-mode and USB
  - Chassis HDMI output
  - Chassis USB-A host port
  - Fingerprint reader
  - NVMe SSD on PCIe5
  - Wi-Fi, Bluetooth
  - Keyboard, touchpad, touchscreen, lid switch
  - Adreno GPU and GMU (Freedreno GL on Mesa)
  - Audio playback and capture
  - Real-time clock
  - Compute DSP (cDSP)

This patch series builds upon the recent work of Qualcomm engineers to
enable another Glymur-based laptop.

Like its peer submissions, the camera support is missing today.

This has the same known dependencies as other boards on this
platform (audio, GPU, SoCCP series).

The GPU device-tree patches come from the partially merged Glymur GPU DT
v5 series at
https://lore.kernel.org/all/20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com/

SCMI on this configuration needs CONFIG_QCOM_CPUCP_MBOX built in (=y).

The bindings patch is independent and can be reviewed/applied on its own.
The board patch can be reviewed in parallel with the GPU, LPASS and SoCCP
SoC series. Until those land in the target tree, it will trip the expected
"Label or path ... not found" dtc error. As with the X2 Elite Lenovo Yoga
Slim 7x submission, this v1 is expected to trigger some dt-bindings warnings
that come from the in-flight dependency series, not from the board patch
itself.

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
Changes in v2:
- Enable the PMIC RTC (qcom,no-alarm + qcom,uefi-rtc-info)
- Add the SMB2370 eUSB2 repeaters on usb_0/usb_1
- Enable the compute DSP (remoteproc_cdsp / fastrpc)
- Addressed comments from reviewers on v1
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com

---
Jason Pettit (3):
      dt-bindings: arm: qcom: Add HP EliteBook X G2q 14 AI
      arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
      firmware: qcom: scm: Allow QSEECOM on HP EliteBook X G2q 14 AI

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 1019 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1022 insertions(+)
---
base-commit: dd60bcf0ad17dd15d6d4d677315c4cf9827445f9
change-id: 20260619-glymur-send-1136d243a120
prerequisite-patch-id: 36f4bb7740fd65d808fa6685bce4b03798a547ff
prerequisite-patch-id: 054631082c45d3ab3117f541f0d4d90b660dac73
prerequisite-patch-id: af18aef027c45213c11b436746fa31b3b6ebe46b
prerequisite-message-id: <20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com>
prerequisite-patch-id: 7cb9a168c33491bf91ece900a2218aa7b4b68ddd
prerequisite-message-id: <20260523085511.2532669-1-sibi.sankar@oss.qualcomm.com>
prerequisite-patch-id: 43e96d8a5063f51e2b5ee75fc8c9e10682e5670c
prerequisite-patch-id: 2e71d345f84a821d89da2a6064954409fdb1277d
prerequisite-patch-id: 0b9f5995044bb3d3ffda227ac986b755fa118c63
prerequisite-message-id: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
prerequisite-patch-id: 8459bcae98ac156f6576657fe9233badcd385218
prerequisite-patch-id: b5182f879cdd23c5a0c64bf09b40213b71059b51
prerequisite-patch-id: c962e3f24c435e91ae563bbba9e396bf277ff0ad
prerequisite-patch-id: b9cd65895f55e9d76ba28ef8f9aaf6cdefe1b9d3
prerequisite-patch-id: 6484d1056e30f2027e81eee375d979197754bc12
prerequisite-patch-id: fa7954f6fd2d27a6f0e805c9643b70e7e201c503
prerequisite-message-id: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
prerequisite-patch-id: 48c26c428cbeaa674a615704d1abeb87e4e965c8

Best regards,
--  
Jason Pettit <jason.pettit@oss.qualcomm.com>


