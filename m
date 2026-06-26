Return-Path: <linux-arm-msm+bounces-114624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bb9jB9lePmrbEgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 13:13:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2816CC4EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 13:13:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Gprx1U3V;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iw8UXptq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114624-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114624-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C44013004C68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 11:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387C53B635E;
	Fri, 26 Jun 2026 11:13:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0345237F00C
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:13:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782472391; cv=none; b=TM2poByJAACfmdp9IAeRAR772cz5JCXAcneA+m01eYZppgmdVDJoOnSXwBLWDp8tZirx+swVrlPUCr6wFqW/fVIySAxOqXqWPcbB2e9JSFmRMlgcadddp3f+rxaB4c/tbOR6geLi2+Rw1A3NvoeUf9JP7DrxxJsw7RADJmGdRW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782472391; c=relaxed/simple;
	bh=QYBgVQxskSazxcouL6gdOVq62NdDeciGPeouETYUhEg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=T5r1DVqbIt6N1Y3Wbp6l2MscBHH4rb0hB8F61qhMxc4szjd6xWy5/fMseoFtAemWSefVyWF74cdoZJbedoz6xG+NS3DsTHHQ3sjqqjKGUy9xgD7D8pGEkPv1PKT448dK4GFvQT41y5kxM6EQb80wSVZXPjdhE763A6jvkSTXHrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gprx1U3V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iw8UXptq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAd2HF607792
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nufNEXe6n6im/2o7SwFob+
	PGR9eOoydkvan90BQnLbo=; b=Gprx1U3VTnCX6jMDkpZs/K/eUXU/hSFHLoVyTX
	T0WVsb0ZrnpBkrA5K8R9o3negs/hK3KJLNoSu0BwRo8Zs3llNx9nlDvCxXPNtdNw
	smFAlukUKmvGapN8I6PrlhPkAhUEK3T5P7WIPxBC0krFbn1h1M3oDWdwyZQeQ5tY
	LthXlGDxrUex/Q/jqArRv9b0ccM/Xs1aggJ7siqlKYPA0QaYusQrB8XRnFB2JPqA
	7x0c/UPXzhSBcmLuMjXaa6vsF8tNLvjVtpuXpPkcaCWHG0e7aOZs9mu16kxYSow/
	N8Ixb10SZaWjXUiLAIkkrxu4b6VO7G53CPhjYOzqB2Z+28eQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f16ukcbxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:13:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845ba567d69so148868b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 04:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782472387; x=1783077187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nufNEXe6n6im/2o7SwFob+PGR9eOoydkvan90BQnLbo=;
        b=iw8UXptqEFFr/QesEy7xk2IaQ73vv3SfTQCkjCKp0jzAgTnfp+A4ZbCh+H6d5YJTJn
         VGYhk1Tjm/9OMMkr800Ub0G8+8UwV/DOoXr6I7dRX42SVy48SCOoax3omSH2aXPH401t
         1HCD1vNpcOeqvFk3VI8hCIe6p18JOWs9FzjhCViFyUmkmTaWYckcUTLVUyXrNF1eHjMV
         fSRiLGM3Aft88U+yyyjbpBw/ms4NqPPBPx//yNaM+lhh71KE4qeqhvKnofT7HQO6Ulvg
         g4LeoAxga92Ipial87dLeGicGOqmEl74yDqv4gJC27mp7U84rcwKkVVAF9Tzlp7lZsXF
         TeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782472387; x=1783077187;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nufNEXe6n6im/2o7SwFob+PGR9eOoydkvan90BQnLbo=;
        b=F09o5SFY9CmSZtgBgq8JBZW3yhTtoehaaCev44Tmiy/0sNx/STaCA3nm5XZh5L8nD1
         bfYIO2vH6STHtyzYWsimnMou0QfEEYLFvB50b/D3by3ycnVIubpWF1E6VIaiL52TtH2T
         bRDYAq6XxvQwCQTcAu3nxJB+HvDFMNc/OfN1C9Uy7W+ifu8Vm3KZ6DGmEFh620u/4aVA
         KPmpaSe9k+Tiv/gyXU8xaOFdzNlp+KzT6m/aNoRbYofhvEl6r+p2wAZEWdT7A7HmYZIa
         YABRz4WSSR6WMIj3jkNi4WkPKjqm2MBokddPGqnwF31R+c/DlXCfgJocfjFrEG0vy+2O
         NHOA==
X-Gm-Message-State: AOJu0YwsiBY2UiKuF6RnMmpFoMWyl93/fbMUL4AQUsWE3jxpZD5ci1Ks
	t891AcoziMJ54hnI0ljofk+w2k1FJOeaxlYyMiBc1fjjM9qG5/HmbYIu4rN6Z3jScBE7b5R2j+E
	jjmpVTNymUZ5I2Ln6dBy9pfoOX1eEnkWPcZ4XCLRvwXqvEkPu1nvbQvK0Vobyc+2MSIrE
X-Gm-Gg: AfdE7cni3RDCRi7tFgntmz6lnd5wsfItoUrhpg47JplUOWqE4SIaUqM5tE+L+HNaB/m
	jLMY5WmPcdMsj0Yfjwhzo7Ac78FwspD+7vzp1yhyYM5wsR1eRrRyqYK7AwVXRUto9yIivDXOwd1
	scJ9tFBy/vQYLA3Oryp1KdU6cvUY0vX4f4CcI4VdwwopqnLhlSwnaNDDALGdPp6RM3xAbQC8miP
	rXiv9QOYxIZzwF9wBpoUegEGr4osIq63v67p5hlLSx/k2fzdeU8bfVXY2woVIkGeP9dihbaOtRL
	lCURFSXr0yiwAYc6NU/8z+O2xqA5KRDI81xxylQawom2Vq9XnK7V6HBUMlQSMxAfJm4r59Y9mqR
	fVUmuk0Sd6YbJAbYW+bAnPQuYVypFkzbOTSfS+Wc1zg==
X-Received: by 2002:a05:6a21:9981:b0:3b7:a8f5:7889 with SMTP id adf61e73a8af0-3bd4af5174dmr3530801637.7.1782472387415;
        Fri, 26 Jun 2026 04:13:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:9981:b0:3b7:a8f5:7889 with SMTP id adf61e73a8af0-3bd4af5174dmr3530775637.7.1782472386965;
        Fri, 26 Jun 2026 04:13:06 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845c7c935f6sm1097384b3a.19.2026.06.26.04.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 04:13:06 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com
Subject: [PATCH v5 0/2] arm64: dts: qcom: Introduce support for Monaco-ac-sku Evaluation Kit
Date: Fri, 26 Jun 2026 16:42:58 +0530
Message-Id: <20260626111301.3479559-1-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VuMTxe2n c=1 sm=1 tr=0 ts=6a3e5ec4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Li8ycNgQwKCU7nWBN7QA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: DZ9CSS44TFRcmirZpg2-5-HJaiKJ6hsI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5MCBTYWx0ZWRfX3fkwC/VX3M2y
 QyAaUmZyPMBGw4LwPFLlf5Cr/cjL0socbEnixlbOF3oGYhQlv5/+98fUi+5xjXk77P7Q7/l9kJ1
 Nvs6qyU89J4tIDPYes5ruNXGTmipkNk0ypC1xRdzyVVRXkHS90K54NzudZMnZxQMkZkGCZL/P0J
 kogT04f6G4O9qD7VwimMlCaq3WnwdhB2Tt3Es/dayQENYOIuyqeBWxZN2qCd1DJ+UzDfYjXwvLa
 dvP3z+tjF8NJDSPvkNcwAjo3t4561eSuyR5X+qZSgNJbEfJj3UBB/CJTGHsEd8Lp947HTyKTU60
 XvE2FGU2/VyI7oBLIuhyULCx1YmBGemdxz+Kc1Yl8vAdzJNY0SiDCE5fO0Yj6+4IllOQ4Z83JBB
 Qv0EBG15a17nc1qFnguoW7lGx9VOaeJ2BExfwBafNmd9DB5pNoS6RCYjY3f27eTVVzPl5OAgby/
 7glESwBZZQGeN6/eduQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5MCBTYWx0ZWRfXyoO0oRhYix12
 QmNHdB4VENssY7hOzr3FBf0TYNq5xfoTIf6KTD84rxB850HReU6gPDCYMtFlhKIINcWUpBF6DeX
 6GOw7R33LSVWgoA248AUzUipHM2P328=
X-Proofpoint-ORIG-GUID: DZ9CSS44TFRcmirZpg2-5-HJaiKJ6hsI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114624-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,msgid.link:url];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:umang.chheda@oss.qualcomm.com,m:mohd.anwar@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E2816CC4EE

Add support for Qualcomm's Monaco-ac-sku Evaluation Kit (EVK) without
safety monitoring feature of Safety Island(SAIL) subsystem.
This board is based on Qualcomm's QCS8300-AC variant SoC.

Monaco-ac-sku EVK board is a single board computer (SBC) that supports various
industrial applications, including factory automation, industrial
robots, drones, edge AI boxes, machine vision, autonomous mobile
robots (AMRs), and industrial gateways.

Compared to Monaco EVK (monaco-aa):
  - monaco-ac delivers 20 TOPS of NPU performance vs 40 TOPS on
    monaco-aa variant.
  - The power delivery network is simplified from a 4-PMIC arrangement
    (2x PM8654AU + Maxim MAX20018 + TI TPS6594) to 2 PMICs(2x PM8654AU)

Also, monaco-ac-evk board supports monaco-evk-ifp-mezzanine attach, Add
support for combined dtb "monaco-ac-evk-ifp-mezzanine" as well, which
overlays monaco-evk-ifp-mezzanine on top of monaco-ac-evk DT.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---

Changes in v5:
- Create a seperate board DT file for this platform instead of having a
  common DTSI file b/w monaco-evk and monaco-ac-evk platform - Dmitry.
- Link to v4: https://lore.kernel.org/lkml/20260427170505.1494703-1-umang.chheda@oss.qualcomm.com/

Changes in v4:
- Add support for combined DTB "monaco-ac-evk-ifp-mezzanine" which
  overlays monaco-evk-ifp-mezzanine DTBO on top of monaco-ac-evk DT.
- Link to v3: https://lore.kernel.org/lkml/20260413114819.3894307-1-umang.chheda@oss.qualcomm.com/

Changes in v3:
- Extract common nodes of monaco-evk and monaco-ac-evk into and common
  dtsi file "monaco-evk-common.dtsi" to avoid duplication - Dmitry.
- Update the commit text and cover letter to justify the re-factoring of
  DT.
- Link to v2: https://lore.kernel.org/lkml/20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com/

Changes in v2:
- Drop keyword "sku" from the compatible string of board bindings
  - Krzysztof.
- Wrap commit text of dt-bindings change based on upstream guidelines
  - Krzysztof.
- Link to v1: https://patch.msgid.link/20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com

Umang Chheda (2):
  dt-bindings: arm: qcom: Add monaco-ac-evk support
  arm64: dts: qcom: monaco: Add monaco-ac EVK board

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts    | 938 ++++++++++++++++++
 3 files changed, 940 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts

--
2.34.1


