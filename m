Return-Path: <linux-arm-msm+bounces-117762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FSWzIw13TmopNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:13:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F09728827
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:13:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RE5cRXpa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OZUIcgif;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117762-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117762-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A7E44302185B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F8F3F12C8;
	Wed,  8 Jul 2026 15:49:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C30373C00
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 15:49:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525775; cv=none; b=RbWF4vabcUpE0GYYOLIZQ/YxPSiuCG9bB9O2lwjgsCZYYKCE7148AQs9R8x3R/kAVSwleDmTzQvMePpb3rnQPqRWD9focZkW2IyzSViXmU7hvP4nWxffL6ZRroNuwHZ6m8qreUoldwR06Y80svMsWdO86L24xL5PKfm8d2EAzAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525775; c=relaxed/simple;
	bh=wUd67YiL92N1CuDQkjv30mUOlyPnJuhWDtLVGtJpBzE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Nq78Uq0gkebD3hcPyLnqt1uEdH5JvOEJD0W7d/sy/PWxlrojEK8Zxcw/8b1wvAbAwXhgzPIYwghhfFpooi4ge2+iJxmQ/bWEMdhGmDR4AKTzWDrUI2iw4mwB9+jG3pO9p/8cLEu5EKlbjtu2vSZjjxkiWXNYlJHQ3JiTGTyBBxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RE5cRXpa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZUIcgif; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668Er2OD3100839
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 15:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JcG5NAumK7H9WvRDE3PWtG
	/QK2YaOaSq9r0Xqz7hK4E=; b=RE5cRXpaO9LV2ijhbIoNcQNJvwQgzzBuODHC1Y
	2pssHRmS33Engo/zx6F/Ba6LKHznhjJmvW0NxRsbg2q4vCfN5MP70DoxHZWfgVLz
	wPhh9fxOieArtu0ExLQ8KSHT33SPKvGX5ufJ22ALxm1ept9i+ufAQQPOBSsCCALO
	y5cRVb6zj/kcWW+lTzyAx4QI8NftN8cEO4VuTQl7xhakgno2cYSDrDfY7/9tpiaz
	0MuzazPtowoLc+6cq5ogkAMdlfQM42KbKiBEfmdmB+fw/QzYO4GTZyXuTJdloNc4
	VHY7yVM0tcSxMfuK3Q/556tcbFqHM9b5+fz/xiz/wG86nuHA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq308st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 15:49:32 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-44aed65b026so2408570fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 08:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783525772; x=1784130572; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JcG5NAumK7H9WvRDE3PWtG/QK2YaOaSq9r0Xqz7hK4E=;
        b=OZUIcgif1pDFYB8BQ2cPcWYsMd9MvItKBQx9iNg9InB7dH9Z1wfQ4BCyTErTaK5K+f
         /a5O4R5btdnlu/vS0VE6OpdXdHkp6qVQIYfdKn0OitOFsGJDWSpfIkRCXscXTSbRTJwG
         jKx7fSd8Us5nF4i/2WeQgb89YrtpQ4cmFFKS9sqAvwzvJWtsBHTTdGWD2Q4hax1UA+2S
         QWxupi8Zj+HwtneUOPOBPNzQeQB+M0SaqgOJNQ6WFcwUGpnaF30hof20kcEZEbZCryS2
         6qYMKOBesiGSKnEPnZneyQNhQprO2dQAbWjSj/tvIsSwnQWBH8cwwdAld2bmhFnI5s4u
         YgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525772; x=1784130572;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JcG5NAumK7H9WvRDE3PWtG/QK2YaOaSq9r0Xqz7hK4E=;
        b=HbS7pYdJOVqgQXLemdqYQh4DeysLNUe6wy50yFGF7K10C6Y6LpXyrSU5pJPF2e57Q9
         ZhE3njZx6LrZWJ5El/Kj40e4T5hyiLwanv3rxqdmQI85fdW6rjOCfSxTrF94HnBivWHH
         43R/nJbMZdJDbhphz2AmuMkhKnKHyiuE/Cp0W6b3Ml6Eh0kPqDVF3C6fNxOgHbf4Ym94
         gDLKwXHvOLskt6uheXGkPoBlm4LWCtiJNxSB/+3/qdn3cVY/5snfbzNt5/BOYyvRb8vj
         jtv3AXhPR7KBqRF7Z0n4KuX69wls9oso/ORVHd169zjz1LzBWaVuQp32fGnEwN7EWP+3
         RJRA==
X-Gm-Message-State: AOJu0Yz2gn3MlYLOoVtet4w569o5s0Sdx4Sum3rp0h0ODdV7n7EYfGyT
	LMrteR1ehl4j8Sg54rZycaJGPLoPJEnwGy0kRWODwsm5abXDYX3/nrqNLtMniMtlEHbNfEQ9s4U
	kCQDoi5rSWdfIk5DJWlnSkehy/id/TO/2QBYU+vzhTIEyvzV+8h7WlQwylY4AtliYKato
X-Gm-Gg: AfdE7clvr5sxAujNGMEX6jiUjEEF+HXmBCIQ31mOTHHD89fSMzBID8cLNTm6I7TlUB9
	U39hoMQab/gSWKEj3rfxDa713BxBIxfM0fk9qUXLNhraqybkt3BrHaGV1LWuJ83/FB1/EDdpzZb
	/YlAwth8aL/vDsQx1tmxABCo504q3SnneaFh5pOuKUzG9hMBGfD3jwr+OwdPrg8j88KnETU341C
	+fQmnW3JxivabWiu8n6HtsMyGQ9aBOn1DpQwTqH4JHCxNAj6h9nKFivDAdaqm7gl6FrSQWersq/
	kC+x8UK/tCNQUKgj6BgyZgSQ6Esd9P9jGho3LCpgdeIZdHGEPoE9CNqkoszzY6AavzVrS/nARyP
	Fa/ebPsx8MxhQ8OX9SVIw9aXlVe8X/y9Ns/Fomjuf
X-Received: by 2002:a05:6870:720b:b0:44c:5514:80ae with SMTP id 586e51a60fabf-451614c5ddamr1814168fac.3.1783525771789;
        Wed, 08 Jul 2026 08:49:31 -0700 (PDT)
X-Received: by 2002:a05:6870:720b:b0:44c:5514:80ae with SMTP id 586e51a60fabf-451614c5ddamr1814150fac.3.1783525771133;
        Wed, 08 Jul 2026 08:49:31 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb1d1ff0sm17014022fac.7.2026.07.08.08.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:49:30 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add subsystem LPM stats support for Shikra
Date: Wed, 08 Jul 2026 21:19:09 +0530
Message-Id: <20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHVxTmoC/1XMwQrCMAzG8VcZPduRtmOKJ99DhsSauqBbZzOHM
 vbu1nnyEvgHvt+shBKTqH0xq0QTC8c+h90UyrfYX0nzJbeyYGuobaWl5VvCk4w4inYBTDCuDuf
 KqzwZEgV+rdyxyd2yjDG9V30y3+8P2oL7hyajQQMikDcBd44OUaR8PPHuY9eV+ahmWZYPtsLHp
 K8AAAA=
X-Change-ID: 20260624-shikra_stats-3f01f136fb4c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783525766; l=2751;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=wUd67YiL92N1CuDQkjv30mUOlyPnJuhWDtLVGtJpBzE=;
 b=VqUNuVF3rBM5zgM76aTOedwTuZf2nHzAUrkIpGu7S119mOzrzhGvHgMgNc3was7IXgQPSm8pO
 IYvopsia+XtAEQKQC7vuJPAmDOW1asfmClVP+qUMhjd7m5NlqD3Zoq9
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: ir31HWjFzoTVSwKkh3-SJ8794mmHrTtb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX30KQJEpxMaqs
 vqjSHhWPcA2TBrFdiqw7FRmHSXrQLItGMbS+6NqbAP1i8HeemVl2nuuiHFLUcphCOF+jiHpoDeH
 7aAqDVE/DeqYPTFdFDSB/Vb02qaObxIIETFwUL1IQqaemk57TcQhz/otgTCAY6bFaMCctdfnkTu
 pA1lA2JbRVYyELQ1kppAmmrldNM95ECQdcAvXy/AmU+3G5bWpDjlN3v0U7AlnrMKn5YGtcEF3ha
 h7YxzSZEYSnKlhxeAfTHyTxVrgKP0xWbUwijmDefLjm2oTkadtn1XOcboDFU9uy4snBt5bp/8fn
 Z/n7nvQ1ZDNePVY2Fh3bJ86KDpw1Ue8aH5Q34VTrgTJVQiYQ0mJ0TjSil5efaeILKPZoSV1Qzwn
 wWFUgUJuF+T4cqnCTQmlsF7ITO/HDhwkj/UXNVWEU0nkdvTEzZSTfZ9K2y4PNp7r+bVoXjfw8fx
 fhK/6T+od0StNp4yzwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX8x8TmmahvhVs
 UUZpQ4SRanVa2aRLRoE6cfhPVnKLotMiVD16i1ImeylP4TyBydZ2cjLm8MQ7ueJwhcWZxTEVcqz
 S6GtdUgZzJkZSSk9tu8lAQ3NqsYsVvs=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4e718c cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=feAlyiVJtFiAF33yB5kA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: ir31HWjFzoTVSwKkh3-SJ8794mmHrTtb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117762-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82F09728827

SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are
present in SMEM for Shikra.

For earlier targets using RPM processor like msm8974, rpm_master_stat.c
was used for subsystem LPM stats since those stats were populated in
RPM MSGRAM.

Here is a brief summary of previous targets and their stats configuration,
along with the drivers used to display them.

+---------------|----------------------------|---------------------------+
| SoC           | subsystem LPM stats        | SoC LPM stats             |
|---------------|----------------------------|---------------------------|
| msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
| msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
| sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
|               | (qcom_stats.c)             | (qcom_stats.c)            |
+---------------|----------------------------|---------------------------+

qcom_stats.c supports both the configurations for shikra, reading subsystem
LPM stats from SMEM and reading SoC LPM stats from RPM MSGRAM.

A generic "qcom,rpm-stats" compatible only reads SoC LPM stats like vmin
and vlow. Add shikra rpm compatible and config to read subsystem LPM
stats too along with SoC LPM stats.

Below is an example showing LPM stats for "apss" subsystem with this
change:

cat /sys/kernel/debug/qcom_stats/apss
Count: 2192
Last Entered At: 5498618336
Last Exited At: 5498708046
Accumulated Duration: 2046572620.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v2:
- Edited commit texts to better explain the changes.
- Link to v1: https://lore.kernel.org/r/20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com

---
Sneh Mankad (3):
      dt-bindings: soc: qcom: stats: Add compatible for Shikra
      soc: qcom: stats: Add stats compatible and config for Shikra
      arm64: dts: qcom: shikra: Update rpm-stats compatible to SoC specific

 Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml | 1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi                       | 2 +-
 drivers/soc/qcom/qcom_stats.c                              | 9 +++++++++
 3 files changed, 11 insertions(+), 1 deletion(-)
---
base-commit: 4c9d9db1697a873f78d236b4ce304272206238ac
change-id: 20260624-shikra_stats-3f01f136fb4c

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


