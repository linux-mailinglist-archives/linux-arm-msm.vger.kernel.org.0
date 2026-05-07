Return-Path: <linux-arm-msm+bounces-106340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qN8yCTR3/Gm3QQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 13:27:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1894E7736
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 13:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00FCF3009F9A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 11:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53ED93C9440;
	Thu,  7 May 2026 11:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVBo+74y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JAIT18OT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70093B7752
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 11:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778153102; cv=none; b=bzbCHMR2coOOMKKhp9fcuz3z8S4/bCu6PrfgR52b2CQOJhuVc52ilgJ78JBR20YAJCqfvWN3tHYqYkqNf90FPnkLf/QK/pSWKqL2p1Ho4KlOWLSaCch3IqSEauCqToENCH/zN9J9zUYChAcSNS8EJBP4v7j0dEqo2PZz+IJkuHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778153102; c=relaxed/simple;
	bh=osXmgGSxSrKx3zpZtjMg9bkFc0mOhov0B774lUtqcLw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=f9C9XWhLDs2EM1kYg+7nL4QmgmltYb7eITpsNk1N1GV2tTa3dUwexPWpLi/BefT96rmvro3fHnuN/n6sNpRerMaC866l0DRq3puBMgnOgY6BLZ7rZ4SuECz4gSPn1LbLjg258RsEs872WKKLRHVEshGkiAyj1kVAFfJZ6I9Buyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVBo+74y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JAIT18OT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AN3Ib151144
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 11:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TnhnLrL/izdip9S/qBfDLn
	OxhSE7toF4Nmjgx76c9jA=; b=bVBo+74yzjol/N510ibPK6L9Iu1PqEfY4Vpfum
	WYOAlMs/Y1HPcVMlGKb2o40CYKgDbk75liOoc8HTpng9qTOP+ag3To0vwpordzBQ
	zLkaVErp3conl/M8+ZNDstccOF25q1S9QdMj5T5Y6y4YYBelY3F4/sDNvzaKulPw
	34ebKqt0Rp7D6E1AucdV4AvmTEMfFBBpbPE1SZk0IExdcgwLzJ8UG3lvRwlZSDVr
	tnB7HkXv9rocQRv1R8F1GL2y6Aexikx5Fin+PGSq2COOmR6CB8CMmARzoSMXBdTv
	yefJkvghXLMtdN6hswKmFhx2QEOrS9jO7GQ0g/JHTyvg2BWA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctsjts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 11:24:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c16233ee11so1040131eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 04:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778153099; x=1778757899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TnhnLrL/izdip9S/qBfDLnOxhSE7toF4Nmjgx76c9jA=;
        b=JAIT18OTh0ZN1gzIM0G1n48ua+4Dghhq+l59pg/xh+AY/x/l2iKx5SzZyBLLjr36iF
         52Yr0c5JnP8gLXwnJ7GXKNY0+ncr/AWRe8lEJZQk848GaOLA6s4SMOfP58ksJ8rKTOa6
         bLm7OwJ8SBYwIF4/92FCZl8YUZWtYxMuonNh9ZxI3RKm9PjSHzeajZBz3y4kQ5LFVVwu
         oN3JHQVU1Yt5vfzlYLPR2MysVnFoMw6Jb56K9mvUpCwfT2ALN6LoV3pd8fR9mEFLjH+V
         HcjKEBVD5VbI7VqjjXzJUOi5St+Ont5HSFzVDJvxalKtVTVZC4HBXdenZDtAQfV36x8h
         a0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778153099; x=1778757899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnhnLrL/izdip9S/qBfDLnOxhSE7toF4Nmjgx76c9jA=;
        b=fMLpAYAErmWichRl+TLnsotCDQK5gdjSg6ZRFMowkoetBoKpKGNQ8esMVsbDVDvyFD
         opIxXkoP2j8cqPNSKeVuG99KsTNO7CsDbqG/q4qd/e1bZM9IV4/7qtGy6IgN62bp0xjU
         wYbWFJlXa+QtV9Qs71OYb6ahPqWZB5W9tb1fhbel1HWcaEiCIqf52BSc8rhrEOoAJVny
         3jJyGwDtqrU24VTuSPOvJR8FHDhgzTjWd64+ygtQ9s+32QCU+Gt5NhW4LX11yrs69OVe
         WKyZuSJNN5+jHk/Ib6gMqPlX1Fo6gofLXP90DxX+RiQigplZVgo11lM7kTE3rGKfWJzQ
         rroQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9UZMRjLn4XJCwol0EoGSV2eDD6iOzPCY4jR9RuPzcsEVoL8m0L93pkcu2Ri0YnpUekp37DA5V5+9XkmCw@vger.kernel.org
X-Gm-Message-State: AOJu0YyTFbB/N75muejEMwoSt4vJ+ebu8EM9IfRizj2dQOHRtRQQcawL
	oZPKR6OAa4hx1RMTWEYixr3b2oXHbWvMxSkODvdlv/5dvc0zv72ERgoxoNOuZM0Z2+GZDh60gC5
	mwm2+mNnzh1hFl1Wsop9eLjYt7+fDCbYq+I+WFMqL4LXkdfVySrj1GSaU1ggwDJeeGvHwTivkPC
	T4ZjU=
X-Gm-Gg: AeBDiesBVcp8cp7uVwpAthd2cPLXhwDNfyAIE7wOqjitQ1IO5+ZhCM2v+jPoG0Oo2f6
	Jav/u1BNykpVQQOkZR/wLtfGEHr9JR8F7ZEVUTmEqflu2HYfGTqTctQYhOtUy01oEnWhSVzV7QC
	nWlxzp02k7neHWPjwHRlzfkgQCLvMrghWQevHzIq6ZayRJJCIO4BoXaIyedt3iPDSygPUMzW1eW
	I45ALOUfurZMbBQV4uEb1JLzZm31jH+Baxh1BAEjJA4xlcMSnrbXuGT5tA/+K32cXjEIpnWyDns
	owEdyKrYZw3WrAoskDI7OxFNt+V9Ry3/4r4m77zW+z+wq/TLo5myTQRXLM7h69oQs/zhRngJKwQ
	jntoHk6VsGoS5fQRN7beJGHeoHuR96PhmiFlEDvEl5n3LHIQi+/OeT1fg5csdTQk+9dBNW3tdfv
	1PcUJGuR6hlwWIGN59pJYH1zha4g==
X-Received: by 2002:a05:7300:818d:b0:2df:7882:1ce0 with SMTP id 5a478bee46e88-2f54b364cd2mr3581697eec.29.1778153098714;
        Thu, 07 May 2026 04:24:58 -0700 (PDT)
X-Received: by 2002:a05:7300:818d:b0:2df:7882:1ce0 with SMTP id 5a478bee46e88-2f54b364cd2mr3581668eec.29.1778153098149;
        Thu, 07 May 2026 04:24:58 -0700 (PDT)
Received: from u20-san1p10573.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56cec592asm8151115eec.5.2026.05.07.04.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 04:24:57 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] soc: qcom: ice: Enable firmware managed resource
Date: Thu,  7 May 2026 04:24:52 -0700
Message-Id: <20260507112454.2527088-1-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc768c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Jyhv0Gfyiw9a8mKZ3MwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=s5zKW874KtQA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 40_barcla9G_YJYPgqDawCWD64QY0LPR
X-Proofpoint-ORIG-GUID: 40_barcla9G_YJYPgqDawCWD64QY0LPR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDExMyBTYWx0ZWRfX9pTVBXDsZMfo
 z+DbrH45pVZXZdYdLxb/RczRvhv59AWdKwtzi3wU5wluSJBUL+TK4z991QWLFFfnhnOEeidMszP
 B8DnRIfmYlIdj6EKIcL8H7WZs6K5XPjnDYbK7WRdA/qPs8m6Npq0HhhU1jF8KK6tuHWHxShSQos
 o3XpB6btFcLImuWHjhUguF4W6fMgVXwK368r7NZzOwFOwBKMfoTb1JYtSYxECkwxxDHnS0sjNGW
 F8t9H+ubU5Unxu/77AitWrYPqnjhYWci3b6H6HZFtRzVwys5krLhv6pKvILpug0YKN1gvNn6LF7
 aaiQbJuA7Yr0RePm4ALcGybr5bK20EJpqoIx1++uI80WCox+Lokde/gQHSJJCOXpGeWAnWoqN2K
 iaeNjhPlvKmqo3FOcPX6pVocEyQgTS5ltpbxXEJl8beebp4N9TDAwynue7cgDxtkAru8Q2ghFPN
 XfKigjN6JuJIs8Itj4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070113
X-Rspamd-Queue-Id: 6D1894E7736
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-106340-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[shc-kerarch-hyd:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linlin.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: linlzhan <linlzhan@qti.qualcomm.com>

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM (GPIOs).
These resources are controlled by the driver via SCMI power and
performance protocols.

The SCMI power protocol is used to enable and disable platform
resources, including clocks, interconnect paths, and TLMM, by mapping
resource state transitions to the runtime PM framework’s
resume/suspend callbacks.

In this design, the ICE driver acts as an SCMI client, with clocks and
power domains abstracted and controlled by the SCMI server in firmware.
This implementation depends on pm_runtime_resume_and_get() and
pm_runtime_put_sync(), which are available in the OPP tree’s
linux-next branch.

v2:
-- rebase the patchset
-- update to/cc lists
-- Link to v1: https://lore.kernel.org/all/20260430032136.3058773-1-linlin.zhang@oss.qualcomm.com/

-- To Linux Community

v6:
- Protect calling clock API with fw_managed flag in ICE runtime OPS callbacks.
- Link to v5: http://shc-kerarch-hyd:8080/kernel_archive/20260324095703.1306437-1-linlin.zhang@oss.qualcomm.com/T/#t

v5:
- Align the continued argument line under the first argument after left parenthesis.
- Modify the return value in probe function.
- Link to v4: http://shc-kerarch-hyd:8080/kernel_archive/20260318170626.3654744-1-linlin.zhang@oss.qualcomm.com/T/

v4:
- Commit and signed-off by OSS mail id
- Enable runtime PM for ICE dirver
- Add driver data to diffrenciate the clock managed by the firmware or not
- Link to v3: http://shc-kerarch-hyd:8080/kernel_archive/20251107091315.476074-1-quic_linlzhan@quicinc.com/

v3:
- Update the subject of patch 2.
- Update returned type of remvoe function and firmware flag in ICE diver.
- Link to v2: http://shc-kerarch-hyd:8080/kernel_archive/20251104104935.2752144-1-quic_linlzhan@quicinc.com/T/#t

v2:
- Addresssed comments from Badgey
- Make Document binding of ice pass for binding checking.
- Link to v1: http://shc-kerarch-hyd:8080/kernel_archive/20251024050921.3573402-1-quic_linlzhan@quicinc.com/T/#t

Initial version:
- Add fw managed resource abstraction support in ICE driver.
- Add respective compatible and document it's bindings.

Linlin Zhang (3):
  dt-bindings: crypto: qcom,ice: Add sa8255p support
  soc: qcom: ice: Enable PM runtime for ICE driver
  soc: qcom: ice: Add SCMI support for sa8255p based targets

 .../crypto/qcom,inline-crypto-engine.yaml     |  27 ++++-
 drivers/soc/qcom/ice.c                        | 108 +++++++++++++++---
 2 files changed, 115 insertions(+), 20 deletions(-)

-- 
2.34.1


