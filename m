Return-Path: <linux-arm-msm+bounces-116965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /XdYDVD2S2oLdwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:39:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C86714986
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:39:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZKErIk74;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=R76s+8fR;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116965-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116965-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C161B33200F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 16:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143CB436BD0;
	Mon,  6 Jul 2026 16:56:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6CB435ABE
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 16:56:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357011; cv=none; b=GmhxRxjsTvcJFAu7JH9nUvlf7wEtb5o4hcsurgBGAhJlL7zbh2vwV/TbtwI0UTp4Tj6U5FjkO3gZ3idudWy72XSKoLtmz7cSbJMV/Qhg6HG00emlJ1GJ0/lcVv/uLJv9aTDUXBLFHAgczw3VsFasJe/F1ZWqpD76ppHRcitAG1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357011; c=relaxed/simple;
	bh=pNZbynUekfOmHusDUjDc/vF186uS4D6Gv3Un79o2yrE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hmTxV6xzwtOk2CJ8hSe9zW/0GSNRtJA15P+FUu3gJkm4mHZjVYuQ+RxbQe832P0YLiNH91Vgk7eGYLkLDNMOOnvkJF/4LDR35rndCMerpUpc9lEdJb/vMHuxH1VrklmDvruqGOUW++DhKN2KanblQXYod/9MMPdExcTjnuGaIjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKErIk74; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R76s+8fR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF8YK990252
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 16:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XkGXfX6x37QUZsM6pLd70y
	JpzoAVIy49ICSIs9qnngE=; b=ZKErIk749gR+S6axVFdqFva+LjBiOK52IOsouG
	mYaDGQjZRfPMHEVQM15EHooOgt3dL6n2WZW//bASMB9g3s23HUPyS7yIzMR75dRG
	ab2tKtEJYDD2EBjU6YrqOhGnN+pKH3hIZpEyxF4YodPO7Yl19RK2+ZVsMA8xiBRv
	D6lwJbA1dHr8r1FcAydskeS3LT6GtvyUiBFIIdx3yKH/lmtmOg8897vqbrvBgPUs
	PQDCtQHqxSkngaInscpyDwJBZS7swlvE7mLoxnPkkercpMXN1fxqOo924aGoteWz
	EKuRcjYewMAT7rzgI9Vtkz9QVzbjbG5u88TbWCTnD43zsu8g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gsymp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 16:56:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so5028718a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357008; x=1783961808; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XkGXfX6x37QUZsM6pLd70yJpzoAVIy49ICSIs9qnngE=;
        b=R76s+8fRzmONuDJGUuiQzXKwmBzZDe3VLTTNg+R6h10YUEwKZMoAfrr8Ov+WING4dY
         O8kocrT2WPuNp3TDtIEeoe758zE0qpYDl/f9ZqvZZHhpG65CLZddSNx8Pj0TG/0dVlUk
         Yalur0j+2BBLBtu8jfRlD/LjSSWX6auuPillpNcAkj4s1MiwsUs0ju4RSXwmfHU+Xrwa
         g7KchoO2L3Hqo2j4deWoxG3QBpq5WlKIS5Oko+7Hv4yaD9kxYCdeN0Q3119E1tNKcibe
         FVDocrdsHVtyfzCoDUScAns+tSsGQZ+7m/K5Vb090W3hFaVDK30S47dYaRw2yyHX6duO
         UHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357008; x=1783961808;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkGXfX6x37QUZsM6pLd70yJpzoAVIy49ICSIs9qnngE=;
        b=H7kt0KQFNnGj3Yu495uQGC6sEHxnrcM7FdTAv0sBC6PUKFaaUKkfBuajyqrsY0DFl8
         +dI4Qp3284f9jtRteI9nQLR1PWH13kcDByAikt/5/ASNYF7LLT7yVSRL7U4JjagdVVMT
         co6+9+GI62W1RS8KOlJOnIHLia0eHwF45P2OX7DSubMh6dqbI0fP9rsmJ61MSzqJu+VB
         E0aaFZWgpNUQBVVv2C2pooOM+JrFKI7jLBtaqjWZFeIT0y1DviS7Pq7ZdGh/3bBpr2JZ
         7l3sE9j6lw0dc3v4EaiNWiQ2Zq1Ds3xwbpPzbbNwBGF4ttEkXMi8rrS7ScXuk3S6koEo
         BbUg==
X-Forwarded-Encrypted: i=1; AHgh+RpWn3u2VOYJbcfLX3X12GdX5cYVmjWgPTM8DDqpCGm6pmzveyY82Q6/FaI9fTswqkn8GFUV6lh1BLOVXpdX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzr6TWHRmdtarkpq29j/af2U3atbCSmuaOQtfHWuV5XQdcLTOV
	0KGf7MrPcfGGM5pwUUECyJGXmb2GxMj3nf6JZ4JHOppfvntmuyZaRJeGsdSBwZqf/roRNgEyA6m
	oiwrVS+VUESzsOc8hdVJ+YyC/OlVLnKfp2ppcKBvCXvpbg0fRMElVauzlq4Ddet/w8IWz
X-Gm-Gg: AfdE7ckP+qRT4kfaEVX91XEFuIKhv0Pmfso2HImoUDGLyzAXxCRORtTC8DBzWVCIAWP
	hdAt6cuheXaDtvH1WS2vmfpcRM01+QXH1Efd1BHj0VktfwQxvOVVzb3fHYZ3rcxBxAd7pxWxbCS
	T4AZ31R54dBRA4swww8UdjfPVjcgHHiX4mf0Cq8Rb+cD+SkxAVGargBnQC63fTvNOg+Lh9/QUC3
	v3Iw1mSC7pvPmePLQz5sFPK/CLh9nZO28RwkbDlqLk7cg/urhiZVfrWdROmJ6eGlQpEIIg7RDHj
	zvjJxsQoMv52Lm+MHin6KwGA7vHz9di9htGyjvs9tRew00xyVAeEp3kyB6Gvto8omi7jUoHOiqD
	sezSYh1Hzc5q41re34QQpobwNfWnmvNzp2yHcYWuABA==
X-Received: by 2002:a05:6a21:7704:b0:3bf:7f0b:2f70 with SMTP id adf61e73a8af0-3c08eec7ba3mr1828000637.34.1783357008029;
        Mon, 06 Jul 2026 09:56:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:7704:b0:3bf:7f0b:2f70 with SMTP id adf61e73a8af0-3c08eec7ba3mr1827965637.34.1783357007495;
        Mon, 06 Jul 2026 09:56:47 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0efc8sm6960604a12.5.2026.07.06.09.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:56:47 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: [PATCH v3 0/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Date: Mon, 06 Jul 2026 22:26:33 +0530
Message-Id: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEHeS2oC/32NQQrCMBREryJZmxITklpX3kNKCcnXfjCJ5qdFK
 b27sbh2M/AG5s3CCDICsdNuYRlmJEyxgtrvmBttvAFHX5lJIY3QB8MphGnAWCC7FCO4MljvsdQ
 Z9502rVYaOt+yKnhkuOJrk1/6yiNSSfm9fc3y2/608q92llxwaY0/OquEN+qciJrnZO8uhdDUY
 P26rh8JQKYrywAAAA==
X-Change-ID: 20260516-smmu_interconnect_addition-d9567535e9d7
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783357002; l=4134;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=pNZbynUekfOmHusDUjDc/vF186uS4D6Gv3Un79o2yrE=;
 b=zVp3IoV1k1Bdu5+mmVSi/MvhRK4jbvL2R7AbmXGDNW3lBmkJKhNXSYfKXr2YxUIPSNUeOXVL5
 85tOcqpdhETBWbyyTnM2s0bd36rcuYFlF3UntoiBA0kE8UN9ui/b5hn
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-GUID: _Rjlw62ZDKnawdN1k0ppp0AD6q7u9TMx
X-Proofpoint-ORIG-GUID: _Rjlw62ZDKnawdN1k0ppp0AD6q7u9TMx
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4bde50 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cnCtU0XpSSdWNXPVHlEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX1F0WWPYw/rnF
 WnzgdyB9DYYvRWyIKW5rnxloK2JfkquGXv06V9bhOl8AwvkscwCm4QeA3MrpI7Bh82eyrSQCQ52
 C9AgC++AhIFLI1o/zsv3Un7NT96H0AjnA1CWXExQzkLnMTHsOotTstEpleDk31gAl4J7NPiJgqD
 +nst8HBECXDPxZZrP03ksh9ks2VQ8D+K0reW92g7XUEVlOQKhC5axGXNTt7emAQa8e+HyZFhe9u
 1hmauAAn6xYDZvZRdBXVmWySVbwYO1wr7u0a5x6MqohFZt6xnoXP7b7oWE3I047AbCzOZr3untA
 ZKdVB1tEBHmXOiZl8TFgMP60tCdfXuPL8GeXX6ZaydOF548QK38KKQXUxf24c2h4nJCPdwSQpHL
 9gKuujCPu7bmwL3ZxwiE0Uv1Lc3fAO+/ls0/w7gymTkBL36DCmk8UmH2e5wKQcma8Fy69sOiXg0
 IftTDZ8ABfLrVmUdNdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX6y6Jv0nfDTze
 gh5/ZQ+B9cJQwyLd+SK+foQhcTvjnwspr3rWPK3Da0LxsydZGIPM4K7tyXWEL9O+PTZLjKv6I2J
 tKKBOguzkN2i5/sjaFiLSh7v7Tjy2eY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060170
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116965-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:bibek.patro@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79C86714986

On some Qualcomm SoCs the SMMU register space is gated behind an
interconnect fabric that requires an active bandwidth vote before
registers can be accessed. In the common case this vote is held
implicitly by other clients (e.g. the GMU device holds a GEM_NOC
vote whenever the GPU is active), so the SMMU works without any
explicit vote from the driver.

However, during certain power transitions — specifically sleep/wakeup
sequences — the interconnect vote can be dropped before the SMMU is
powered down. If the SMMU is then accessed (e.g. during runtime
resume) while the vote is absent, register reads fail intermittently.
The precise ordering makes this difficult to reproduce consistently.

This series adds support for an optional interconnect path in the
arm-smmu driver. When an 'interconnects' property is present in the
SMMU device node, the driver acquires the path and votes for bandwidth
before any register access, releasing the vote on runtime suspend and
on error paths. Platforms that do not describe an interconnect path
are unaffected.

Changes in v3:
- iommu/arm-smmu: Moved ICC voting from generic arm-smmu.c to
  Qualcomm-specific arm-smmu-qcom.c via new runtime_resume and
  runtime_suspend hooks in struct arm_smmu_impl, as suggested by
  Konrad Dybcio.
- iommu/arm-smmu: Moved icc_path from arm_smmu_device to
  qcom_smmu to keep Qualcomm-specific fields out of the generic
  driver.
- iommu/arm-smmu: Restructured arm_smmu_icc_get() error path to
  exit early on success as suggested by Dmitry Baryshkov.
- iommu/arm-smmu: Dropped if (smmu->icc_path) guards from
  icc_enable/disable since icc_set_bw() handles NULL path safely.
- iommu/arm-smmu: Changed WARN_ON() to WARN_ON_ONCE() and
  propagate error code to callers.
- iommu/arm-smmu: Changed ARM_SMMU_ICC_PEAK_BW_HIGH from 1000
  to 1 kBps as a minimal keep-alive vote.
- Link to v2: https://lore.kernel.org/r/20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com

Changes in v2:
- dt-bindings: Cleaned up 'interconnects' property description —
  removed "Optional" prefix and driver implementation details as
  flagged by Krzysztof Kozlowski.
- dt-bindings: Added allOf conditional using 'items' to restrict the
  'interconnects' property to Adreno SMMU nodes only (qcom,adreno-smmu
  with qcom,qcs615-smmu-500, qcom,qcs8300-smmu-500,
  qcom,sa8775p-smmu-500 or qcom,sc7280-smmu-500 compatible), so
  non-Adreno SMMU nodes on the same SoC cannot use this property.
- Added DTS patches for kodiak, lemans, monaco and talos to add
  the GEM_NOC interconnect path for the adreno_smmu node on each
  platform.
Link to v1:
https://lore.kernel.org/all/20260516-smmu_interconnect_addition-v1-0-f889d933f5c1@oss.qualcomm.com/

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
Bibek Kumar Patro (6):
      dt-bindings: iommu: arm,smmu: Document interconnects property
      iommu/arm-smmu: Add interconnect bandwidth voting support
      arm64: dts: qcom: kodiak: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: lemans: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: monaco: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: talos: Add GEM_NOC interconnect for adreno SMMU

 .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 +++++++++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/talos.dtsi                |  2 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         | 55 +++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h         |  3 ++
 drivers/iommu/arm/arm-smmu/arm-smmu.c              | 27 ++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h              |  2 +
 9 files changed, 119 insertions(+), 3 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260516-smmu_interconnect_addition-d9567535e9d7

Best regards,
--  
Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>


