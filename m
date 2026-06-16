Return-Path: <linux-arm-msm+bounces-113320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CG7lD3fZMGq8XwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 07:04:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC5668BFF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 07:04:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D+L0GTBy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TgYhcPov;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113320-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113320-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51F2A303FFBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 05:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F9D3CD8AF;
	Tue, 16 Jun 2026 05:04:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AAC3CCFD2
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 05:04:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781586292; cv=none; b=uOniqRNbR93+dMTXjjJNASdNbiupMUNK0BUiHc4s8brW6fg+1f5nQYa0BDuUwl+OoTTDToNCsQKErb4ueVgKOlriv3A3ATghLj1BMbn4qAaDNwsniJwdnYrtJ3CmKJikiG11b1HL0ksmCcMJnR2zNhobAVWKCm880m2SCt5Ii4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781586292; c=relaxed/simple;
	bh=y+k/+o9Uzwp6H9bizQRJ5xJiMyI1jizKoq6mW7USx4w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rbUsf8/GDHDGF661SiBsBce4U1T18laYu4+RwZSGFctGWbYhT9etmW3lAJVqS00zK0zjrxnLGENIg/HQIre2ZfBcHcskpDtC5g7xedUPxK+0YbS+dmt0Gi8/3OMLRQ7U4bTsD71CXMOsB+Eqd203YsFbnSaYUmSokDahggp6n/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+L0GTBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TgYhcPov; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G1xjGv1767118
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 05:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=19ZTO3F8MsnWqxrh4Ubj4M
	4mvN5UpQJnOBRUpNroWwo=; b=D+L0GTByGWU++UoJAbg1f2ANj4OEAn4Me1v3NA
	+9D7x/kAy0zKExWDDNG8JB3s6p0EwDHHRI5QZ0VWKUHkKKHCxUBNtSAUqBiMS/24
	0ba8SAiiKGF5jeBdsWKYw0FJTR4Hapna6WHMEixD2kh/9nAIPGgBorJtHq/JVlpQ
	hlSzUpxD2wUAOJzUNb7qU9+JfpnruwnegQTTKCQRQ03THkFLK3DEpfdaqLzdzZx0
	BP2UFOmECPwCcOGF5HqTtrcBmf7OzcDAK84tYdjDUlsvGrt03e58OdXMFp/cqOiP
	dJw2bwvu0yx/RL3tm8gk7d04zeNB51+ZDK+9L2r8cqJNRm5w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteydctp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 05:04:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c32faa62so63039225ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 22:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781586290; x=1782191090; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=19ZTO3F8MsnWqxrh4Ubj4M4mvN5UpQJnOBRUpNroWwo=;
        b=TgYhcPov+r8c8BNvD/fNqnmY59foRTeLLRPhMQ44hTu/wSyIXSyrduHmAiRAOtCkWv
         YaxsJoMUC6JPjf3vMlVZhhgx7W176q45sJr8jsO9cQjGedNSQlOyl0Vh/uOhiE/JJZ0M
         lXK13Gdeh0LxdUrcneBRaLYnO0ONMC4iTbY3LStXoQQHJAVdOv97KIMWbnzR5IaKwdZP
         P4jDssB4k9hyoKxjsxwH0hxiartaT1DYG0wkYXs/d7aYQqDTBhUcQyv3+oENtJ+SlEOY
         RYO2YVFz2tAQqmR67dBkwL6ArKXxY7lYOHpgkK8s8BxxrRn4Fh1B2Mtn+3FnHQQv5Prn
         ZK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781586290; x=1782191090;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19ZTO3F8MsnWqxrh4Ubj4M4mvN5UpQJnOBRUpNroWwo=;
        b=XCx7cIXHSQvKUgcqPevyXAioREizm6ncTfb9dRbGshR3UEwmlAK2L+UhnD28kAPTrj
         riCxAFlsDwesYZl/p3LXKdb126LFRbXOZ4dFJjQXG92JsZYxaH2hRPavKoryVt9kn54J
         Ydpv/5D6geUtavTAl8UScnsF1JuUe2Q/E3B5eNoIuHTyA55Axp5bdMUAp8vg7f68QuRw
         5Gt9FQ0ofIK9GBz4B35CS/h5IpBbzQR5DMMAbPBXT21TPuz7GTEcjjYezTU+9m7pUoSc
         9O8LTsKb3OIqTc/pIYBJnlQgrJI7Xxx7wiY9jR7r93nkIdjB2O+hR7opc3U5fdLdDfWu
         of+w==
X-Gm-Message-State: AOJu0YxVhVIKto+exjyBtA0g5WYnBBYcZBEOYChdU17fJ5EFfJJk2BL8
	IGHrVa5+3y+hGHizGVjRV/bvdx+6VOEvQkTZXdyqO+MfHegM5AVkKnv0ZZVYAFbBkYMCmAP4oSg
	mC9SwqzptiuYjQHRNtrO0+ack1FGyFL6LPSHdh5Vi2ngsWQiaLUUD3cBj2cHVBZLpSMDj5KiO5k
	Nc
X-Gm-Gg: Acq92OFmBvsQZdh5p8uKwRRdfvxmKwzuJT5MRA18gFIhXqeR2zTjLdRrKpaE/IO7uTy
	jiU0W3s+s9UJfIcSK9AXi2NnJCaXKfjq6AFWBttniHZUM7J3/t5sXJ86DYro/pdJC+29LuFvw6I
	wrJB8koW4tMpDmrFgAYfwkfg7XSEqC6qVf8BkxCCnYbZEZjAerGWfR20SnDJKt11RCC7rHS0S3P
	3AL7dtRCQXESuFne9Qv54VZZpZz7okvSWe8i90gSkke8rFvpiHlfvAPi0iWWnp+LYTuHlQYPYcg
	MAqC58WyJ/En+0WbGZ2MtahOsAkCZpu1uNgB3diHR1ilESWCGGeWRh9MwVeuzny+V8TK1emefym
	SNuD7fqcHbGAfV/6rP+Qg8fL43kMHpoXYo6z6B5kyN66FSlL9Mo04LLwpYMJtZMPwBwt4xi4vNf
	t1E/tst8pQO4QZ4rM1HI0irad9xjd1xLTiSKjtdvGo6qbIMqUFiU8=
X-Received: by 2002:a17:903:2285:b0:2c0:db23:4a4 with SMTP id d9443c01a7336-2c412d25493mr182944835ad.36.1781586289907;
        Mon, 15 Jun 2026 22:04:49 -0700 (PDT)
X-Received: by 2002:a17:903:2285:b0:2c0:db23:4a4 with SMTP id d9443c01a7336-2c412d25493mr182944525ad.36.1781586289481;
        Mon, 15 Jun 2026 22:04:49 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm128957335ad.14.2026.06.15.22.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 22:04:48 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Enable the QMP PCIe PHY present in Qualcomm ipq5210
 SoC
Date: Tue, 16 Jun 2026 10:34:40 +0530
Message-Id: <20260616-pcie-phy-v4-0-504677c3d727@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGjZMGoC/2WPy2rDMBBFf8VoXYXRw3p4lf8oWcjjUS1oYltyT
 EPwv1dxNoVuBs5wuY8nK5QTFdY1T5ZpSyVNtwr6o2E4htsX8TRUZhKkAQOez5iIz+ODex8xehF
 AxoFV+Zwppp/D6vPy5kzLvTqu7yfrQyGO0/Wa1q4JzlpltWoxBqF09DggGm/6oMCBbf0AGqOV7
 G+Trjl6tELzhMjTvLRSAIfQg4oqKHKq2wR7xY+prFN+HMM2eeT/37BJDtypHh2Q9TGY81TKabm
 H71fNUz3ssu/7LxU+PUwmAQAA
X-Change-ID: 20260609-pcie-phy-99fcf91a02fd
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: fXiFihC6d5s11g0shsITIylszs8vQCTU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA0NyBTYWx0ZWRfXyQgTDbSY1TjV
 uHhKrjYI+xeTxoMzkQmFguDoOA9SoSODGtvp36antfhzSbrbCN3pEYYwOlNtM0WSdlsp/8zvOVQ
 Z5/el60LHaGyUG2OIKCTVZksgcyZpjc=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a30d972 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FkrAw2C3M-aabWWYlxUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: fXiFihC6d5s11g0shsITIylszs8vQCTU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA0NyBTYWx0ZWRfXzgaAU1wb+/ze
 ZU56NDo2KIQ8sJdeJIaT9t6INtGNlCTWcs3fRrYPo7ly2NRvNwPdmE5+/ihgnXscSy2I0CdDKFo
 96+0nFuI3dSnFA1uH9s6ecvNsY1RuML3Vi2a30ig6uyEqoTTK9IwqBD2Y/IeWhoncq3Y3dteVJ/
 YvCxvMLuyx4tWxbpfl/i7N8ydNJ+xIpTXcRk6VP72WRCBx0Wc0+grIrwN9i55BosZeEI29Dle7Q
 6bt1hAkp68vPvlORx1ig8kAJ+mXWOLFs5JHknlzL1nGd+yPqlUUOTKkmFJWFBfrx6rCL59uRUR0
 DHRrpNccpuqaDnAqylNuYgzFtET84wsnr+el7WYBI2nnGTAw7vUz4h+NoUdM5dqjRXq/njpE9r/
 LCr42R/2/UpADVoTBnhUZ3xjIFni1toYQpc3r15AjyPjdM05QSbPz1eevA3zQuz7auQGWY9F36N
 H46iA5VH7hOEMWLg3Ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113320-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AC5668BFF8

Document the bindings and update the driver to support
the PCIe phy present in Qualcomm ipq5210 SoC.

v4: Fix commit message for the bindings patch by removing redundant content
    and adding explanation for using specific compatible.

v3: https://lore.kernel.org/linux-arm-msm/20260610-pcie-phy-v3-0-334011b378d6@oss.qualcomm.com/
    Fix commit message for the bindings patch
    Remove unused tables from the phy driver (ipq5210_gen3x1_pcie_ep_tx_tbl
    and ipq5210_gen3x1_pcie_ep_pcs_tbl)

v2: https://lore.kernel.org/r/20260609-pcie-phy-v2-0-83bc80e79fa6@oss.qualcomm.com
    Had incorrectly made both the phys as fallback. The single
    lane phy is standalone and double lane uses ipq9574 as
    fallback.

v1: https://lore.kernel.org/linux-arm-msm/20260514-pci-phy-v1-0-482429192746@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (2):
      dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document the ipq5210 QMP PCIe PHY
      phy: qcom-qmp-pcie: Add support for ipq5210 PCIe phys

 .../bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml    |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 129 +++++++++++++++++++++
 2 files changed, 131 insertions(+)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-pcie-phy-99fcf91a02fd
prerequisite-change-id: 20260514-icc-ipq5210-0ab03f3a3e83:v1
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


