Return-Path: <linux-arm-msm+bounces-112357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5H4vLMAoKWr5RgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:05:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F676679C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:05:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="TuF/hJlt";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dp5Pr+rU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112357-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112357-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 928DC307D8CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0A03B27FE;
	Wed, 10 Jun 2026 08:52:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1AB3B27E9
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081538; cv=none; b=qKvBMM7uDmucZW3tDs1gzZsv0bSRraU7gb8fLuRzU+0Uwd8rCnO3iF79ASq2t1Ly3Ay/ptzFCqmpNGWsuS1QPpcaBwjZKpt4+IpnxnsVFVI+Ct23njUV7aLj8LERPRjio9rWDhrtrZy47VwYWEUvRNoCibQER23oYjZJZ9jhqdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081538; c=relaxed/simple;
	bh=xfgZ82rjabE9Wi3S8DTrU80WTlz1niktdrkFyPMK128=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ooUxh34C+1NNUiElJJv0N9YUffVyckrMEotd3k2vbfPqlTc0qLAR5khiRSGxq2t4Zm+uZ46FeKGBrUy74YkmNfrCh6SOMt//tzz3HVHM6kIImteikj/OmJhbd+jhfsbH89I61ASILNR8eizZFC2mPydEZIyATLiSkM2f6STDFgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TuF/hJlt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dp5Pr+rU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hnTL530332
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zj008DVGc5kMK82k+xOC+qfyEhbgRDy17GsHFb9DToo=; b=TuF/hJltFN4tC830
	2w7eWLS9JaNZ5WJh7CYHTmuho/M1Q0cSCqb7SL/WN2EdTb9cjSAyrWOrp9lwC1kA
	+fdQC6vb7aRv6RbQCi6MoO77KI+pKngOEtjV8oT6GMptDz5+5EtuLXQNZ7q76irh
	9wkvJZK2xAIsMjGAJLUoKAH4HijCcrX71mM4LKkHpInj2F97tivl+zcA6eoVWhRm
	rxxZCmr8Go+Mg+/GiDTQ9OB3o448VAYFAXd9Mv2hRRNzM4ATp4Cye9yWmJRRv9al
	ac+s9gNfrAtPxWIeGL/qb3oF7/A5ID/qpD0ng/DbLyid/PFw1P8LNM/AnR9g9jx5
	Lq/+1w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2hk01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d97955899so6222631a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081535; x=1781686335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zj008DVGc5kMK82k+xOC+qfyEhbgRDy17GsHFb9DToo=;
        b=dp5Pr+rUvLIZ9XNFfesmmhA34yQtg8PCOKMf0tWDm88HkeTmR4XNxLRWtuxpFRCJwQ
         dfWobyI2Di4p6nG8HHOfYQyt6Fza4Bxb6dFBBXgk1G72CP9W5XfmDwOwwukRt5e8BAFl
         c0BosfSn274MiRMo/9hfxfE9gbGFuIcjqT996SN65/v4DhnRgTSzYniw2gr7HcjmcPjJ
         KfPa6KIRe3wU5j1GpT7Zm/AllXsxcxAcpQZuPp2FHLONzqqrRHyeEYlA0b10lGCOhLq9
         Ag3LwQbFhMphyRsSnIYcvvlY+U3CKwFPF3Q33EXR+W7VvMjJf78dbk+1DhbmRre6KQcG
         zoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081535; x=1781686335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zj008DVGc5kMK82k+xOC+qfyEhbgRDy17GsHFb9DToo=;
        b=FPrJCujR1XMLLTsg03/YViZXWOur9P4tUFQA/S6jprY9kYYDbA8ZpPi7ge6+wrDJa2
         G7Orm3C8ZeqP5xV4+Y2KhbN+jnhS6j/aB01BuF0sNZGzGKPC5zV5MCuey0jU3txUflxa
         1kyYdm1BMznwByF7Tvo8brn+gYo4D4xAjq8K9Krm8W+wKocZGZKEucI8nU7dSsiigmGu
         alSbRsURLGhnHGV7EGIwE7ht1cIdj8NcUOWfzb/0fHaIHpkg21H3Amr8CjQUdBiONpSe
         AAWnpxb5/rbYfei5HpO+RCODehF/2wRG1r8Dauqxfyq3hBkTTzkEgb2xTdbHM0SEQgG0
         nNcg==
X-Forwarded-Encrypted: i=1; AFNElJ9vLBlt8O2GtThDrGHa5NRp+DIGf7JXz47biViHEX6rOcFVaC5Nx/aeYQrkyRSYvmxVAqh7WSe5RVG2nwdA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/vFQnEfKYMBQmwKFqfoYHI2MGebMCLF92BGkIuOwcYSwEKxoz
	lvrLwRmY5rROQueMEtmW/uXNkNqW5xzc4BxFvcojq6XRhIp0vx8B4y452gC8rIGQpIZW6fxyreb
	3fX53ji8r9j4uo3hMMDkVh++M+dOSSrLzspPKj/c1rL34B/yj5t3ru+uEJV8RqZwSfVIX
X-Gm-Gg: Acq92OHzkfMGuGMSA5NxNvWzLbiRtEZ/ZzBPV4bxUGqImaoXhdqJtk0NDV8quj4pDga
	PTcm/AgPcwtohaNVXEyAP0fB0grb2snu4eIc5K7zkELtaG8JTGvnW3GYLZQlXfBytajD+crfG4M
	m4FuuFY5Zm/fF2pk72svqaDDGCAOlQkNwQk+dCQggGTbcumz9zg372u9xzUPr1Z7rho4Mc8Opbq
	yz5bhV5Fb6gKaP99sChCEI9hD/erOgabjEP++ZIrcvlnIecqdS03Nw/NKITONYb0aRH7+cE/k72
	KOKLFkkNasgONV+KSNXef3eGbIalwFUIZITPW83O2kflrnYJbEDiW3ctbFmszMNmg/6lB+phoq5
	96A0o3/tpXUpuQq4ai8UlMzEPtrof1tDuqCmtWZcNLm3YXhGh3u0gJ38H17gVzZKDD+j314I+bK
	lE9DtPyan2DUd88EAcx1I7FaQxPur+AmOayzBQvYvZFZ+RiWkHHe+dCj6WgfM=
X-Received: by 2002:a17:90b:390f:b0:368:b01c:85a0 with SMTP id 98e67ed59e1d1-37520dc5920mr7199958a91.14.1781081535319;
        Wed, 10 Jun 2026 01:52:15 -0700 (PDT)
X-Received: by 2002:a17:90b:390f:b0:368:b01c:85a0 with SMTP id 98e67ed59e1d1-37520dc5920mr7199932a91.14.1781081534868;
        Wed, 10 Jun 2026 01:52:14 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:14 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:30 +0530
Subject: [PATCH RFC v7 3/9] firmware: arm_scmi: vendors: Add QCOM SCMI
 Generic Extensions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-3-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, Amir Vajid <amir.vajid@oss.qualcomm.com>,
        Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=10720;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=teXO5koBrmv3aA4ZyAeyCgjEEP97zvPys0ur9lr68Q4=;
 b=Y5L4HL88UbeNsfsuiEHNiHQ2Mt5BmhyjqEHH/Io11WTARLldgiF907aIgcqU5CKmAxXNOsp7U
 7MFapu/mQTKBEVm5GtRmtxujsJAFDWqgIPrxe8Foi32nFbBauMBha1m
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a2925c0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=xTFWSTIUIKHfy7pKroIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX2/RFq0IfGrEA
 BrexgX3qDZRB5kj2ztwIIk67QgLHCuOoyZ8ZoA+jYXQV2Hkye0cGnfWihCyLa6VliDNKoWWpIiw
 Nhxj7B3fvJqkfTCQN+cdD+shGMaurNUB245+3H+95qVS8HEWKvWwKb/S6BIthKQF8D9PGUD7A9M
 zWdk56c1Mr09SBndLgF/Xb0WnTpfgi/oZXSZflFiB9i9yZ6rs7rki6QXx5djBmBD4B9UnRxR3uc
 NcTpwfllFMfdkD0PHxjO2LXjmq/pvjiKsLK4tptD8l8DCFk8JrwjYOUS2j5YFw9z6zGZ5RAiBEL
 45ViF6yQjIsNxUUMNvktTk3lNDBIbIXK+iWrnQliDSOokga/ya3e11Ifh7YhOEMTFWa656VU2HL
 /no2PyXGMnZbRqTPRXYV29mv87CO7JspBgdrqX0oRlH/aZ64j5DGc4Dd6i+S+9N20RiMUbqx4Z2
 pdrKm88WKgPSNPXENUQ==
X-Proofpoint-ORIG-GUID: eeqkI5B1FqjKmwyRfT80UXRDq1xZJfFS
X-Proofpoint-GUID: eeqkI5B1FqjKmwyRfT80UXRDq1xZJfFS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083
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
	TAGGED_FROM(0.00)[bounces-112357-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,oss.qualcomm.com,samsung.com,gmail.com,nvidia.com];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:myungjoo.ham@samsung.com,m:kyungmin.park@samsung.com,m:cw00.choi@samsung.com,m:digetx@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:pragnesh.papaniya@oss.qualcomm.com,m:rajendra.nayak@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:amir.vajid@oss.qualcomm.com,m:ramakrishna.gottimukkula@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: B4F676679C3

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

The QCOM SCMI Generic Extensions Protocol provides a generic way of
exposing a number of Qualcomm SoC specific features (like memory bus
scaling) through a mixture of pre-determined algorithm strings and
param_id pairs hosted on the SCMI controller.

Co-developed-by: Amir Vajid <amir.vajid@oss.qualcomm.com>
Signed-off-by: Amir Vajid <amir.vajid@oss.qualcomm.com>
Co-developed-by: Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
Signed-off-by: Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/Kconfig                  |   1 +
 drivers/firmware/arm_scmi/Makefile                 |   1 +
 drivers/firmware/arm_scmi/vendors/qcom/Kconfig     |  15 ++
 drivers/firmware/arm_scmi/vendors/qcom/Makefile    |   2 +
 .../arm_scmi/vendors/qcom/qcom-generic-ext.c       | 153 +++++++++++++++++++++
 include/linux/scmi_qcom_protocol.h                 |  37 +++++
 6 files changed, 209 insertions(+)

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index e3fb36825978..a52f4d1b8b2c 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm_scmi/Kconfig
@@ -84,6 +84,7 @@ config ARM_SCMI_QUIRKS
 
 source "drivers/firmware/arm_scmi/transports/Kconfig"
 source "drivers/firmware/arm_scmi/vendors/imx/Kconfig"
+source "drivers/firmware/arm_scmi/vendors/qcom/Kconfig"
 
 endif #ARM_SCMI_PROTOCOL
 
diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm_scmi/Makefile
index 780cd62b2f78..5a0e003c2477 100644
--- a/drivers/firmware/arm_scmi/Makefile
+++ b/drivers/firmware/arm_scmi/Makefile
@@ -13,6 +13,7 @@ scmi-module-objs := $(scmi-driver-y) $(scmi-protocols-y) $(scmi-transport-y)
 
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += transports/
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += vendors/imx/
+obj-$(CONFIG_ARM_SCMI_PROTOCOL) += vendors/qcom/
 
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-core.o
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-module.o
diff --git a/drivers/firmware/arm_scmi/vendors/qcom/Kconfig b/drivers/firmware/arm_scmi/vendors/qcom/Kconfig
new file mode 100644
index 000000000000..8aa0efd6a03d
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/qcom/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "ARM SCMI QCOM Vendor Protocols"
+
+config QCOM_SCMI_GENERIC_EXT
+	tristate "Qualcomm Technologies, Inc. SCMI Generic Vendor Protocol"
+	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
+	help
+	  The QCOM SCMI vendor protocol provides a generic way of exposing
+	  a number of Qualcomm SoC specific features (like memory bus scaling)
+	  through a mixture of pre-determined algorithm strings and param_id
+	  pairs hosted on the SCMI controller.
+
+	  This driver defines/documents the message IDs used for this
+	  communication and also exposes the operations used by the clients.
+endmenu
diff --git a/drivers/firmware/arm_scmi/vendors/qcom/Makefile b/drivers/firmware/arm_scmi/vendors/qcom/Makefile
new file mode 100644
index 000000000000..6b98fabbebb8
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/qcom/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_QCOM_SCMI_GENERIC_EXT) += qcom-generic-ext.o
diff --git a/drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c b/drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c
new file mode 100644
index 000000000000..77c07272c09d
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/module.h>
+#include <linux/scmi_qcom_protocol.h>
+#include <linux/string.h>
+#include <linux/stringify.h>
+#include <linux/types.h>
+
+#include "../../common.h"
+
+/*
+ * This protocol is intended as a generic way of exposing a number of Qualcomm
+ * SoC specific features through a mixture of pre-determined algorithm string
+ * and param_id pairs hosted on the SCMI controller.
+ *
+ * The QCOM SCMI Vendor Protocol has the protocol id as 0x80 and vendor id set
+ * to Qualcomm and the supported version is set to 0x10000. The PROTOCOL_VERSION
+ * command returns version 1.0.
+ */
+
+/**
+ * enum qcom_generic_ext_protocol_cmd - vendor specific commands supported by SCMI Qualcomm
+ *                                      generic vendor protocol.
+ *
+ * @QCOM_SCMI_SET_PARAM: is used to set the parameter of a specific algo_str hosted on
+ *			 QCOM SCMI Vendor Protocol. The tx len depends on the algo_str used.
+ * @QCOM_SCMI_GET_PARAM: is used to get parameter information of a specific algo_str
+ *			 hosted on QCOM SCMI Vendor Protocol. The tx and rx len depends
+ *			 on the algo_str used.
+ * @QCOM_SCMI_START_ACTIVITY: is used to start the activity performed by the algo_str.
+ * @QCOM_SCMI_STOP_ACTIVITY: is used to stop a pre-existing activity performed by the algo_str.
+ */
+enum qcom_generic_ext_protocol_cmd {
+	QCOM_SCMI_SET_PARAM = 0x10,
+	QCOM_SCMI_GET_PARAM = 0x11,
+	QCOM_SCMI_START_ACTIVITY = 0x12,
+	QCOM_SCMI_STOP_ACTIVITY = 0x13,
+};
+
+/**
+ * struct qcom_scmi_msg - represents the various parameters to be populated
+ *                        for using the QCOM SCMI Vendor Protocol
+ *
+ * @ext_id: reserved, must be zero
+ * @algo_low: lower 32 bits of the algo_str
+ * @algo_high: upper 32 bits of the algo_str
+ * @param_id: serves as token message id to the specific algo_str
+ * @buf: serves as the payload to the specified param_id and algo_str pair
+ */
+struct qcom_scmi_msg {
+	__le32 ext_id;
+	__le32 algo_low;
+	__le32 algo_high;
+	__le32 param_id;
+	__le32 buf[];
+};
+
+static int qcom_scmi_common_xfer(const struct scmi_protocol_handle *ph,
+				 enum qcom_generic_ext_protocol_cmd cmd_id, void *buf,
+				 size_t buf_len, u64 algo_str, u32 param_id, size_t rx_size)
+{
+	struct scmi_xfer *t;
+	struct qcom_scmi_msg *msg;
+	int ret;
+
+	/* Reject calls where rx_size exceeds buf_len. */
+	if (rx_size > buf_len)
+		return -EINVAL;
+
+	ret = ph->xops->xfer_get_init(ph, cmd_id, buf_len + sizeof(*msg), rx_size, &t);
+	if (ret)
+		return ret;
+
+	msg = t->tx.buf;
+	msg->ext_id = 0;
+	msg->algo_low = cpu_to_le32(lower_32_bits(algo_str));
+	msg->algo_high = cpu_to_le32(upper_32_bits(algo_str));
+	msg->param_id = cpu_to_le32(param_id);
+	memcpy(msg->buf, buf, buf_len);
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret && rx_size)
+		/*
+		 * Response is returned into the caller's @buf, replacing the
+		 * tx payload. Callers using the same on-stack struct for both
+		 * directions must not rely on tx contents after this point.
+		 */
+		memcpy(buf, t->rx.buf, t->rx.len);
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int qcom_scmi_set_param(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
+			       u64 algo_str, u32 param_id)
+{
+	return qcom_scmi_common_xfer(ph, QCOM_SCMI_SET_PARAM, buf, buf_len, algo_str,
+				     param_id, 0);
+}
+
+static int qcom_scmi_get_param(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
+			       u64 algo_str, u32 param_id, size_t rx_size)
+{
+	return qcom_scmi_common_xfer(ph, QCOM_SCMI_GET_PARAM, buf, buf_len, algo_str,
+				     param_id, rx_size);
+}
+
+static int qcom_scmi_start_activity(const struct scmi_protocol_handle *ph, void *buf,
+				    size_t buf_len, u64 algo_str, u32 param_id)
+{
+	return qcom_scmi_common_xfer(ph, QCOM_SCMI_START_ACTIVITY, buf, buf_len, algo_str,
+				     param_id, 0);
+}
+
+static int qcom_scmi_stop_activity(const struct scmi_protocol_handle *ph, void *buf,
+				   size_t buf_len, u64 algo_str, u32 param_id)
+{
+	return qcom_scmi_common_xfer(ph, QCOM_SCMI_STOP_ACTIVITY, buf, buf_len, algo_str,
+				     param_id, 0);
+}
+
+static const struct qcom_generic_ext_ops qcom_proto_ops = {
+	.set_param = qcom_scmi_set_param,
+	.get_param = qcom_scmi_get_param,
+	.start_activity = qcom_scmi_start_activity,
+	.stop_activity = qcom_scmi_stop_activity,
+};
+
+static int qcom_generic_ext_protocol_init(const struct scmi_protocol_handle *ph)
+{
+	dev_dbg(ph->dev, "QCOM Generic Vendor Version %d.%d\n",
+		PROTOCOL_REV_MAJOR(ph->version), PROTOCOL_REV_MINOR(ph->version));
+
+	return 0;
+}
+
+static const struct scmi_protocol qcom_generic_ext = {
+	.id = SCMI_PROTOCOL_QCOM_GENERIC,
+	.owner = THIS_MODULE,
+	.instance_init = &qcom_generic_ext_protocol_init,
+	.ops = &qcom_proto_ops,
+	.vendor_id = "Qualcomm",
+	.supported_version = 0x10000,
+};
+module_scmi_protocol(qcom_generic_ext);
+
+MODULE_ALIAS("scmi-protocol-" __stringify(SCMI_PROTOCOL_QCOM_GENERIC) "-Qualcomm");
+MODULE_AUTHOR("Sibi Sankar <sibi.sankar@oss.qualcomm.com>");
+MODULE_DESCRIPTION("QCOM SCMI Generic Vendor Protocol");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/scmi_qcom_protocol.h b/include/linux/scmi_qcom_protocol.h
new file mode 100644
index 000000000000..41632ee7bbc7
--- /dev/null
+++ b/include/linux/scmi_qcom_protocol.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SCMI Message Protocol driver QCOM extension header
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _LINUX_SCMI_QCOM_PROTOCOL_H
+#define _LINUX_SCMI_QCOM_PROTOCOL_H
+
+#include <linux/types.h>
+
+#define SCMI_PROTOCOL_QCOM_GENERIC    0x80
+
+struct scmi_protocol_handle;
+
+/**
+ * struct qcom_generic_ext_ops - represents the various operations provided
+ *				 by QCOM Generic Vendor Protocol
+ *
+ * @set_param: set parameter specified by param_id and algo_str pair.
+ * @get_param: retrieve parameter specified by param_id and algo_str pair.
+ * @start_activity: initiate a specific activity defined by algo_str.
+ * @stop_activity: halt previously initiated activity defined by algo_str.
+ */
+struct qcom_generic_ext_ops {
+	int (*set_param)(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
+			 u64 algo_str, u32 param_id);
+	int (*get_param)(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
+			 u64 algo_str, u32 param_id, size_t rx_size);
+	int (*start_activity)(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
+			      u64 algo_str, u32 param_id);
+	int (*stop_activity)(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
+			     u64 algo_str, u32 param_id);
+};
+
+#endif /* _LINUX_SCMI_QCOM_PROTOCOL_H */

-- 
2.34.1


