Return-Path: <linux-arm-msm+bounces-110625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ8BGq+pHWp+cwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 17:47:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DB6622068
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 17:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFBDC30E1782
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 15:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0CB37416B;
	Mon,  1 Jun 2026 15:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V181xsIq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YYfYB+fA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED253DB961
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 15:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327884; cv=none; b=UQgUb6OzbRSKf86B4v5noxOLdyHJ2knGYxKf++HI+I4Vkd2x4ZWVNSNxkuvQMEMrW/3UAhh/j+yHhDVo7iqVA5Ynk7T0W1j0cniQRx8FVTB5QrFvt4w0xCejl/Qtz7znLhaLOef0vssqUFMiGVw4ALGf5iYJQaldZM9D33EKQIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327884; c=relaxed/simple;
	bh=uSomH2xjvcY5RVpIGMe20pFDWnjG0v4BbpUk4vieK2U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Xg+cxqRLjJZDcUex+3uma03EfPI5HhGhMPsrDSVV7na3z3ZNHnv8UVyAr3Rp3FEe9QmBEa0CgA0Y91TRS6/qVO8KOG8AgBzCEXDilS3sUnyfApxH1TtszTFJT1/2W9fY5RvLOGUnz6tPkGNC+uuaEmadf6YTmq9jHmyAv2eNGSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V181xsIq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YYfYB+fA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651EnK2d3563527
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 15:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GPH9lE+s5Y4kIJwia3fw8P
	9gaNrxwWNGH5E2wNasqDs=; b=V181xsIqBl7tee7ZOf4XtyW0tiRlJnXXKrKeon
	1tLTcN1CwX22hJTVSkycbFOa19clOlHco+R5C7abJju8Y4fI0kozyRejpHwzRp5S
	Sxo1f2inlPPwU8SvgsMchFHZQyrD+jEVJJmeHBbo5u/3ZxG8xmEqkXVplc/yptYC
	nt8upHUX/DsWjA6KN8uxPjBwNDK/LQ0rliy/bWfUdOrJtdprqNrKE/qmSjb8Jmdw
	tHPj+YUEozTxcazxFkupmgXaUV+Silzp2maa+R190o6VxLT1tlng2dUrVlXEdsdG
	2Hjtm85k68Sh64AnuxbtJhUJjpSNdHuCXQZk/suN6zNxh7Rg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6rxsruu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 15:31:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304d8e9563eso3002896eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 08:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780327876; x=1780932676; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GPH9lE+s5Y4kIJwia3fw8P9gaNrxwWNGH5E2wNasqDs=;
        b=YYfYB+fA9jc4LOETmfiksqSfF9Cwxr12YGfh3zyQkOC7PWFcfCKwjRSvRjG4AqLRz3
         AsLyBva1PjaZ8+EaJ8dT+NjXr4oegFHyOGlzACpMA623DPa9nW1nYy8d9i6duGN62wh4
         6yMQrvemvuu80fxOm0FV+DBebCHFpAySRhh0gIcpYPxNhQYqHyubPfRXOGwyfC4rDxfW
         1N0hVIAttsIzzHjQvp2VhfLTHYfcWe2iie5G9FDNP4r4Q0+Tu20gRlw3WSATCRZLmXmS
         XN4kzvDCvgooGVc196S3uyr7drpcfPiuU/5kBdei142XGL/Kkpg7Jq2TyB3L24sqDfn2
         cpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327876; x=1780932676;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPH9lE+s5Y4kIJwia3fw8P9gaNrxwWNGH5E2wNasqDs=;
        b=pbTrlzNbx4TJtH1D4xT+BT6ejbEff0te2E8OCE5T950NqnBRjYDpycx4c/u2sKmBm3
         /6YVjixltfrW7yVOVy5e1rPij+tSxy4UcHtQX2P46wJB9b1x4FWMJJV23Ryi29Oc1Sou
         Bp1rxM56haAf5CUoyiCXceo9GyI9PaU/PQpm/XN2bqrfPQznWok0qnyeSNEsQNKvt7aU
         364qJ0O68MojjqTz1oPN+2kTyDNw/wRKfsB0T2uAEFUh6nat3Tgk0ge75i6SR3LqAn+N
         e9k8ZbBwGgPNVFWvvcp3gttMi6myWtQlVIVTOq1rw5/VMm3ON/Hfd/qm4AseuriB4JHD
         RVnQ==
X-Gm-Message-State: AOJu0YyX5+fjXOww9bQhXu/jGt3R/rSmIkxgGSVdEQselunadO6aYomH
	qnwqYynEBJsc65JWZI1DXWrUPt+T3ngrzXd3QJNQVtDhI9id54AeqOhPUfPfoFvQzsrS5GWCIwI
	/E1bzPNdb+iWUB2XKHgzvgDNflV9PThxUmdZhtdId8rRLqOvlMzXjoibiWMUPcT9sXnBwKKRwyT
	YfWmbJ9g==
X-Gm-Gg: Acq92OFIAjxfAtKQYO3Sag2XM2GSgvSOge/p9kVqHWLz45SiaFibmeveEvH7TyRLmU0
	Ho+RemD3teaiBiK7R61K+TN+hVXsPk+gN0SPIGezddjTDQ4sqXBDO0a2XFk39H6bRhbEs7apEnX
	T1RMXXYCWL4ob2458RhI0+opnjEqVFVPrUdSptDwwPocs3Ib/LLMOMbrOdGBKajgqVFlM/RZQcm
	eUhrtY+XGTeeJIxDxE9I9Hp2B0P3bXSCu5W9x900pUZRXt2hXw1oLCMyOW/8C3U6Up+D4xdTQHg
	nO/AHEEvgbcFlpC8JtMZwKegLmOm0jNnt2RL5pnB0/gGh6lv2MzLznfTTzCDbWLHh9xuX8dAzq5
	NOMNcENCOtuRaLLplDLVQm0wPfx4SuM9qMxC1bmRj6xoby0m3kT1iTN9uNuQBiYgKWveY13OgFp
	qpRusBPE2l4ZA=
X-Received: by 2002:a05:7300:ef83:b0:2c5:b972:b436 with SMTP id 5a478bee46e88-304fa647572mr5096111eec.23.1780327875322;
        Mon, 01 Jun 2026 08:31:15 -0700 (PDT)
X-Received: by 2002:a05:7300:ef83:b0:2c5:b972:b436 with SMTP id 5a478bee46e88-304fa647572mr5096070eec.23.1780327874662;
        Mon, 01 Jun 2026 08:31:14 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2efb4esm9207707eec.8.2026.06.01.08.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:31:14 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v14 0/5] media: qcom: camss: Add Kaanapali support
Date: Mon, 01 Jun 2026 08:31:07 -0700
Message-Id: <20260601-kaanapali-camss-v14-0-e76f26aa6691@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALulHWoC/3XOzQ6CMAwH8FchOzuyjk2Qk+9hPFQossiHrkg0h
 nd3joMXvTRp0/+vfQkm74hFmbyEp9mxG4fQgNkkompxOJN0dRgIrfRWAWh5QRzwip2TFfbMMs/
 yXNfGUNPkIqSunhr3iOThuPaebvcgT+tQnJBJVmPfu6lMBnpMMuJW78Qn0DqeRv+ML80AMfL3e
 liQShZAprE7tLUq9iNzertj97mQhhLRGbIvZFXxA8oCpK2BuiBrtxZ+QMuyvAEZbQw3MgEAAA=
 =
X-Change-ID: 20260112-kaanapali-camss-73772d44eff7
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: RUe7T8WJdDOE79TyyFu0yi0q7sbUIH3e
X-Authority-Analysis: v=2.4 cv=dsfrzVg4 c=1 sm=1 tr=0 ts=6a1da5c4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=d-Za1eDmXPogXgNBA_QA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE1NCBTYWx0ZWRfX2HJOZepNxTI8
 kzOvJLMoB/qxzKT8scgXqnPBiIqNogevPO7Z08WNNWbqa2/cT09bQJwwnA/pLJ6x2/pcamGzTTO
 k+MHO54Z81cjOCksfL091qfWRHLBgE7kmMJsPTLrZ+bOqvrRKNgj8izq6M6fQgdGLXJ1HNOx46O
 rv3w8GFmGpYrlaICRF0OivJodowDPykWOKhfzFVvYbUBEqKte04Gtq3Qml4w5k07c1/Isw3c4Ub
 dXQ9QIvv6YOhsdsUqZMbrzCxEH83Kiz2rLbAP5OrLAnbTkYLAj/JbL9zlTzryjBZckJNUZi7hXX
 iUtl+AxK9uUGDWS3WjoFmjd9ZDtP9isMQ0zNYa227kZRzrNm+Uv46J8bhWO+husQOFWRdglliSW
 JdSDomAerwFStWiytRm3R01pSGwCy5APgD7coq3ogFf7dm6ceA6TV5hrCnQkSO6AosggtrTpQxd
 OencfZ+d+5NdzESU+QA==
X-Proofpoint-ORIG-GUID: RUe7T8WJdDOE79TyyFu0yi0q7sbUIH3e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010154
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110625-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B2DB6622068
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

Kaanapali camera subsystem provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

This series has been tested using the following commands with a
downstream driver for S5KJN5 sensor.
- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v14:
- Define 'CSI2_RX_CFG0_PHY_SEL_BASE_IDX' locally in camss-csid-gen4.c - bod
- Align csiphy lane registers value capitalization and case rule for 2.4.0
- Rebase this series due to conflict - bod
- Link to v13: https://lore.kernel.org/r/20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com

Changes in v13:
- Remove prerequisite dependencies that have been merged upstream
- Remove redundant empty 'regulators' initializers in csid and vfe  - bod
- Revert binding from full hardware description to CAMSS-only scope for
  modular and incremental development - bod
- Rename icc path names and vfe clock names to drop redundancies - Krzysztof
- Separate port index from VC value in csid_configure_stream(). Previously
  vc was used as both the loop iterator and the hardware VC, causing
  misconfiguration on RDI path starting from 1 - bod
- Link to v12: https://lore.kernel.org/all/20260112-kaanapali-camss-v12-0-15b7af73401e@oss.qualcomm.com/

Changes in v12:
- Add CSIPHY regulator current due to regulator interface changed - bod
- Link to v11: https://lore.kernel.org/r/20260112-kaanapali-camss-v11-0-81e4f59a5d08@oss.qualcomm.com

Changes in v11:
- Rebase this series due to conflict - bod
- Update binding commit message to align with previous generations
- Link to v10: https://lore.kernel.org/r/20251211-add-support-for-camss-on-kaanapali-v10-0-39e8874dcd27@oss.qualcomm.com

Changes in v10:
- Update interconnect and CX domain AXI clock names to be consistent with
  previous generations - bod
- Update the struct name for csiphy lane register settings to make it reusable
  for other compatible chipsets
- Updated power domain names to IFE for consistency - Krzysztof
- Add description for acronyms listed in binding commit message - Dmitry
- Link to v9: https://lore.kernel.org/r/20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com

Changes in v9:
- Updates the names of some of the resources in DT bindings to be consistent
  with previous generations and improve the commit its message. The name
  changes are also applied to csiphy and vfe camss resource lists - bod
- Link to v8: https://lore.kernel.org/r/20251130-add-support-for-camss-on-kaanapali-v8-0-143a8265e6e8@oss.qualcomm.com

Changes in v8:
- Change csid and vfe driver file names as 'gen4' to reuse for other SOCs - bod
- Add missing register descriptions to binding and cover letter commit log - bod
- Link to v7: https://lore.kernel.org/r/20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com

Changes in v7:
- Add ICP SYS registers to camss binding - bod
- Rename 'is_deferred' to 'reg_update_after_csid_config' to do rup/aup
  after csid config to make it clearer and simplify its call path - bod
- Remove unnecessary bitwise AND while configuring image address to bus- bod
- Tidy up a comment and a couple of hex values and csid/vfe - bod
- Link to v6: https://lore.kernel.org/r/20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com

Changes in v6:
- Modified the bindings to represent the whole of the camera hardware on
  KNP than just what is exercised by the CAMSS driver by extending the
  descriptions and the properties, the regs, clocks, interrupts, power
  domains, iommus etc. In addition, use the word 'vfe' everywhere in the
  bindings to be clear that all of those resources are referring to the
  same front end modules. - Krzysztof/bod
- Change camss vfe power domain names to align with the binding file
- Link to v5: https://lore.kernel.org/r/20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com

Changes in v5:
- Refine v4 change log - Krzysztof
- Fix typo by removing redundant numerical version in kaanapali camss binding
  comment description - Krzysztof
- Add missing tags that should be posted with v4 revision - Krzysztof/Andi
- Link to v4: https://lore.kernel.org/r/20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com

Changes in v4:
- Add detailed hardware descriptions and revise message title to follow the
  standard comment format for kaanapali camss binding file - Krzysztof
- Format kaanapali camss binding file to keep style consistency, by reverting
  power domain name from TFE to IFE and keeping clocks name order as last
  generation - Krzysztof
- Separate the 1.2 and 0.9 voltage supply DT flags for each CSIPHY to allow
  for arbitrary board design with common or unique supplies to each of the PHYs
  in kaanapali camss binding example, based on v2 comments - bod/Vladimir
- Link to v3: https://lore.kernel.org/r/20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com

Changes in v3:
- Use the name 'ahb' for 'cam_top_ahb' clock in cci binding file - Vladimir
- Reduce and simplify CSIPHY supply, port properties in camss bindings - Vladimir
- Resolve the dependency issues in the camss bindings file using ephemeral
  DT nodes - Vladimir/Dmitry
- Update hf mnoc name and bandwidth values for icc module - bod
- Split CSIPHY status macro changes into a separate patch series - bod
- Add clear functions for AUP/RUP update in csid and vfe for consistency - bod
- Clarify why the RUP and AUP register update process is deferred - bod
- Clarify the necessity to keep NRT clocks for vfe - Vijay
- Link to v2: https://lore.kernel.org/r/20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com

Changes in v2:
- Aggregate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition into 'camss-csid.h' - bod
- Remove 'camss-csid-1080.h' and use 'camss-csid-gen3.h' header instead - bod
- Remove redundant code in 'camss-csid-1080.c' and align the namespaces - bod
- Slipt 'camnoc_rt_axi' clock in vfe matching list into a single patch - bod
- Add whole vfe write engine client mappings in comment - bod
- Remove hardcoded image buffer number but use 'CAMSS_INIT_BUF_COUNT' - bod
- Remove SoC specific logic for vfe ops->reg_update and add a new variable
  to determine whether ops->reg_update is deferred or not - bod
- Add description to explain why 'qdss_debug_xo' should be retained - bod
- Add the procss node in csiphy register list comment - bod
- Rename the variable 'cmn_status_offset' to 'common_status_offset' and
  align this with macro in csiphy register structure to avoid ambiguity - bod
- Aggregate Kaanapali items into the definition that introduced by
  'qcom,qcm2290-cci' in cci binding file - Loic
- Format 'kaanpali-camss.yaml' binding file
- Link to v1: https://lore.kernel.org/r/20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com

---
Hangxiang Ma (5):
      media: dt-bindings: Add CAMSS device for Kaanapali
      media: qcom: camss: Add Kaanapali compatible camss driver
      media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID gen4
      media: qcom: camss: vfe: Add support for VFE gen4

 .../bindings/media/qcom,kaanapali-camss.yaml       | 433 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-gen4.c    | 380 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   9 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 124 ++++++
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c | 197 ++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   9 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 360 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 10 files changed, 1514 insertions(+), 3 deletions(-)
---
base-commit: 697a0e31ee66f5ddb929c09895139779fff33f20
change-id: 20260112-kaanapali-camss-73772d44eff7

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


