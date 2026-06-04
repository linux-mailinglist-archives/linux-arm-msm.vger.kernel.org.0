Return-Path: <linux-arm-msm+bounces-111142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 96inJXohIWrN/QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:55:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E752E63D655
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:55:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WZzfpumJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IgO5crr1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111142-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111142-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A262E3022ABE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 06:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7511A3C0639;
	Thu,  4 Jun 2026 06:51:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338FE3CCFC3
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 06:51:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555866; cv=none; b=HMLZaCtjINIztubsUzeLc/Xb7GP4K8oGuwdCjqbZE2vUxnIx7nrYR9iLAmxRNO+7NGibqfO3+BcIbbiMe+nl/tNzWovyoig2Kx26h8QwXNjEfeOBghf5WE8BJ+q/Mownihm6TQdACF6m7ImQ5P/OZn22QqH/UiIKgIdBSXwJP+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555866; c=relaxed/simple;
	bh=UG0ZvM4vow4j04FZ0ZuaDuDoHfARFyoWZe4jipZwpNk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S1pHxw6tAyDsNOdt61o35dKbm/U165/QUz4SYzfZxwUi2Qmi267j+TvxwYfeCf/eFGm+PsMgrhnbfZ9N8u/yEtVorVMSAdi9XGPMkuYf8qkiezNj6aRxQbl2oFTklpPclj6H41c1TtTsWuQhwKbm1FMo3NggCTlHT0A861gdSaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZzfpumJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgO5crr1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65419EpU141895
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 06:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=peKwpELzZL6vKrTtvqgHNH
	vqCTkajJ4VLkel09qRyoA=; b=WZzfpumJslrKR8wQf/hVO+NUcgCUuTH3Z5fuHE
	aOWui3NUSnDHVETzohGpr5B+IsoN9XOuLerbTblWJmYWkEdt5c85t/f41+bdF6uo
	ibUVsky3LedchjHmCNyx2nsb2OCH28e59OGJxGTubeR/DxYeRROAqUQPkPONsvB5
	dlVmW+l2UbZoihhQ/64hIJEuOggJeKsQxRt0X/AW10FlmGpofuQg8cBiOIgdrLLn
	hhWmoASZlhVqdCC9xdJG6dkw3V7qmcIz3Lh5jWJTL0kus2FVTvsTkb6g/xXDqwIm
	8aDRdCRjbIzHIxCQnsD4qnRkRL0RPSTzh83ORwq9//FvEYYA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyen90nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 06:51:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a366b61fso249079a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 23:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780555862; x=1781160662; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=peKwpELzZL6vKrTtvqgHNHvqCTkajJ4VLkel09qRyoA=;
        b=IgO5crr1fCYnwnpNltaFglJLsM4W4GRwC3icKQkrmrEl2JLfJ+RBKIJb0ke57jSfp5
         +Jm51Bxhp4UPYRgur/Gb5J00U9NR7cix+uvrCNukK0PV5esV34ORPMo/EpC43M9vkwHT
         aN4UpIGaeda7iKZLsHybkRiTtOwHQKYMqu07ldIiaeU3gRIiNfuhlXShk82VpyPtm18I
         SvhJl9DiYqcDKYHsG2ySDj8gLuXkq3/XwKQCNUdqodgIiNTb/lUemSdfqCWCsor7IzWo
         18mPLziq/LPYJA5/zbWVqinDuLvquO4A1FekPC9BJrZfKosAekcIDjV20qDC1iT09rae
         oYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555862; x=1781160662;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peKwpELzZL6vKrTtvqgHNHvqCTkajJ4VLkel09qRyoA=;
        b=BssdbsiARcMvANO4GU7JapTr1lP9KzacmaQXUo73OifLF7ptPaXU5ySHMsBehBqRPh
         PNeiH1EJ0JlZAY2Mf6916hjJ/MH5AFq/5+RmV+zK37TyxBoEGyVbjrH6Oo9gXuiBdapp
         7kelkD/ZjFxY061EBIWvmajUbktft4Ff6mJu8ykFEgr2Y7Upcb8z3so1wH6WE4zOARu7
         MRmQE5tvLmPjBMfc1J5tgNsG3JVMLY958UoWuCCCPOm73Ni9m22E4gJUQ+OBUn2hKxof
         ARb3R2Upw1fnvpSGLm8FdXtHaCqyNlSZjc7+trDoAOA+01SoB5UHSF1917n0su0IcRBK
         0jgQ==
X-Gm-Message-State: AOJu0YxB4vJuRCxNjOb81X5RhiK/b2NhEnX7LHU6MWwtBRrK4zVQHAJ1
	dK+xM1bX5qXeDPVS+hIeUpBuy3S09q+Bm8mKSQc3zqQmXZ+0zt8y5D+IOUdGWdZOHBWq4ljbGBq
	KbN20j4hiQuaXTwM6v+5n+7lb0AO3I0VwSr1qZWgXUkS9cd+u/AcGYG2Lec5l+Ouc73s/
X-Gm-Gg: Acq92OFi6WuBwSmFgEnatIK00qkfOV9qsqpPszwROlPVq30BZTA9TUsrU70MSxJeH8o
	czr+8ew9ABtZ/xXOwPO6Xo75NHT8oEe3BiHAgmzJpRMmY3dDSrmgbRRWoCzbXNQnp1IydIfm/Hd
	ZxdKEyKugdON1tjtKIoinZcmCZWDpT2Dx2PsyO0xuP6RykcIyylCc2bbzXTc79W6SvwIdd5Hnu8
	l4Zk1f+ZYr/mC7adreUwEWw1ic8zzI97OZQpsxDyEqxxeJdtUT0i1+C/cdoYse/GIeuRagapiHX
	t2/6QkcRZuTKj5rgzL59xdf9tg/nsUIEVp/9cOG9YbJ0/nhEiKerUidcdC1z4QB82nocrAk+ShN
	BKvvX2X9JcoiRIkPeyw1SPZmwXkbq5Jds/bOb/TfKkY/2Vi3vGAW9fv1n9lV6tpLl/g==
X-Received: by 2002:a05:6a00:198d:b0:842:2382:a0ea with SMTP id d2e1a72fcca58-84284e6dddfmr6738475b3a.14.1780555862129;
        Wed, 03 Jun 2026 23:51:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:198d:b0:842:2382:a0ea with SMTP id d2e1a72fcca58-84284e6dddfmr6738433b3a.14.1780555861520;
        Wed, 03 Jun 2026 23:51:01 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842823512b0sm5365894b3a.15.2026.06.03.23.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:51:00 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Enable SPI on SA8255p Qualcomm platforms
Date: Thu, 04 Jun 2026 12:20:34 +0530
Message-Id: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADogIWoC/3WPy4rDMAxFf6V4PQq2EruP1fzH0IWSqo2HxM5YS
 ZhS8u91OgNdlG4EB6Rzr25KOHkWddjcVOLZi48hQ/mxUU1L4cLgT5kVanTa4h44UN0xyOAhBhD
 aobUD7IxzTITomlrl2yHx2f8+vF/HP5ap/uZmXGXrxjnFHsY2MT39xqDZa1NWhbHoXOXAwJBoZ
 g7FSB0l/xlFip+Juib2fZHHqmq9jDFdHz/MuEb+1y31m7ozggaztdsqh9YnV756j8uy3AHAtRP
 pHgEAAA==
X-Change-ID: 20260529-enable-spi-on-sa8255p-8166eaa226cb
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com, Nikunj Kela <quic_nkela@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780555855; l=3060;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=UG0ZvM4vow4j04FZ0ZuaDuDoHfARFyoWZe4jipZwpNk=;
 b=uUF9ZSk89C79ieWxvHnLKPsaek1RNloAP8IA31omZuktkm4ThBn2/1O614O6C9Nw2CttZ1tCt
 hFgyPFtycoPAF5Bm7T0jA8kUVwfPt91mI+cjo60s1s+zRa/H/RDciU+
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a212057 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=63TTwLHdKWWIMIjarKcA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: RjYZWaR32cwjPKnFoL9YBHKMngGXgDh6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA2NCBTYWx0ZWRfXx6P7lIv+/eJa
 dIrWiHrUOe+2azlMaN21syYw2fzi0vLdrEBLdrYQBy7F3c+nyMvHZMTDhbmodFQ+i9U6G5WjaAd
 I8cb9hmv4oQz2hapWwqpSvEeQyVAb0P+eLjesblZu2DYCuQYi+0BR5Cmlm2JwGSj1uJLyvXNQak
 iAMufRRgiow8b0toALztBYQ8rI5rnRlgP9XwHnxWaNoJfNFMIbnStH6R7FEFCUk/qBBW5PDVNLh
 /QdQ6IMEbiwchs80q1rVa+np1pm3hDDIkSYjpHUN+LJqiWPS0qlqds5X8lzErUJS1M6/2USvwvF
 fStNZXwPvSSWOseYnw0YjeTrl5y+fHnp+pkS3jfyPbP4TX/YB5h62Av+P1fjioogTsKP7Zmvwny
 Q7Hv4ZLjqtVyc0NICyUVHLgdo85bkdHnpFOHjiRHWPl6AJK+JB8796CRidm3rog3M/PrTf5UJnc
 BDgeyNb/2brcRkW2XXw==
X-Proofpoint-GUID: RjYZWaR32cwjPKnFoL9YBHKMngGXgDh6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111142-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:praveen.talari@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:chiluka.harish@oss.qualcomm.com,m:quic_nkela@quicinc.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E752E63D655

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages SPI frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate.

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Praveen Talari (4):
  spi: dt-bindings: describe SA8255p
  spi: qcom-geni: Use geni_se_resources_init() for resource
    initialization
  spi: qcom-geni: Use resources helper APIs in runtime PM functions
  spi: qcom-geni: Enable SPI on SA8255p Qualcomm platforms

.../bindings/spi/qcom,sa8255p-geni-spi.yaml   | 63 ++++++++++++++
 drivers/spi/spi-geni-qcom.c                   | 83 ++++++++-----------
 2 files changed, 97 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml

---
Changes in v3:
- Added the OPP rate restoration in resume callback.
- Added missed dma-names in example node.
- Link to v2: https://patch.msgid.link/20260530-enable-spi-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com

Changes in v2:
- Rebased patches on latest linux-next.
- Link to v1: https://lore.kernel.org/all/20260112190134.1526646-1-praveen.talari@oss.qualcomm.com/

To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: bjorn.andersson@oss.qualcomm.com
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com
Cc: aniket.randive@oss.qualcomm.com
Cc: chandana.chiluveru@oss.qualcomm.com
Cc: jyothi.seerapu@oss.qualcomm.com
Cc: chiluka.harish@oss.qualcomm.com

---
Praveen Talari (4):
      spi: dt-bindings: describe SA8255p
      spi: qcom-geni: Use geni_se_resources_init() for resource initialization
      spi: qcom-geni: Use resources helper APIs in runtime PM functions
      spi: qcom-geni: Enable SPI on SA8255p Qualcomm platforms

 .../bindings/spi/qcom,sa8255p-geni-spi.yaml        | 64 ++++++++++++++++
 drivers/spi/spi-geni-qcom.c                        | 86 ++++++++++------------
 2 files changed, 104 insertions(+), 46 deletions(-)
---
base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
change-id: 20260529-enable-spi-on-sa8255p-8166eaa226cb

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


