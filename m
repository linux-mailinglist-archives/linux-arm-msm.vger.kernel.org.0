Return-Path: <linux-arm-msm+bounces-116343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aUCtIs/PR2qPfgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:05:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A45D703B36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:05:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SsieaRLS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bJoQmGSc;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116343-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116343-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C3FC3301257F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 15:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA1D414DE6;
	Fri,  3 Jul 2026 15:05:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13333D3D16
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 15:05:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091147; cv=none; b=BFvi5EDkIMngrjSi/CtZuxp1DoZakAVOi3Z1W+P3rCZXU0xnttI1MehhCJ9cmEtdMnwlE6obSN1vhGdDh6Z70Jj1iuHUjQEcf4EAmxAvzonfiQKt3sLolAvzli/tRND4XQRPcceWgHydSO9Kt6TZ7uVUq/gd4KnaXuhsGzTAEEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091147; c=relaxed/simple;
	bh=2JNfmkrDXlzcvSizv/iAqx3lfl6qRnhrAE7oNNSShdw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=baoiEjVNGzr8d8Ihfdi9EIZHzMc28/sm5ihppeAeo8o+AMl6qTeQ8oD7/JzCymd/FnIDVZ4f/GahOaOKjuUnAmLZP4ehmrU+HDBh9Y0dboJEnrEpS0BYru0hhdEv3mGn5AybzoXHBqhdSiZ102nzet2gwSU4ORpVVFigwMXpH1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SsieaRLS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJoQmGSc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663DBdF73144241
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 15:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ymd1YdLxXbtUH6VcGFjA1u
	H5awiZ4CUoXHPYrby/Xn8=; b=SsieaRLSdLfL5RPxXFNoz3G7Fi5vTs89jcFp9X
	SVxukLqjMdIjzIVFqLb4guYkqH+n8vLqw0AGn76wq+8aNl3dd2F7YslNLdmlLsYD
	6UqO1J2QCwbvajiWhDg/MYd7QCbB4w5UQz5wv4YcgWtWxE69ZXyrMfuMFEeZSBW+
	SuDBuDYBqecyQcAmBoCrZS4Kf4XDolaU4tyFj/NKtVff9vvthwUm8KPjpKI4aGUc
	tweI4b/7DpPxNDTy3WOVxlx2AqnFAgDRSM3YBQXl6nV1WbZMlbgMIkxaQJt8Tg7S
	zgT3Ctcq2Z476NgHGIjXiNDMRDCktTRxpsSPQSuZPZPcpT2A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682bst4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 15:05:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so1070542a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783091137; x=1783695937; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ymd1YdLxXbtUH6VcGFjA1uH5awiZ4CUoXHPYrby/Xn8=;
        b=bJoQmGSc+z8BROsLUj/PwOcukwu+hUmtv/msTc4jenLId47YQELuxzyQ65QN+YtNAY
         eqvGihzS9Hmx8zLx/SE4jONtSEJ0D/oA4Y+Z/ECxRVO9vSCjMisHCFMQ8eQXv82aKjy9
         4/PVVTu6v5G8Qxdb/39BDF7VuHuXQdkplK7wtPYMNXSppZvkt/JuARXFvwN7zrxjs708
         FX4t3PrJrt1rOrcyNVvwpzWWu2FWigSAa09tpEQ1fDB744LWeSFcvlT0AYyBOy7AxOPY
         vUOcSuVwIAkRgDKeWp0CwTd4K59PnXaKJDJixCWtrwDdgsdkrS+4DjsMFsHjp2YuOqsa
         RL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091137; x=1783695937;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymd1YdLxXbtUH6VcGFjA1uH5awiZ4CUoXHPYrby/Xn8=;
        b=lNNDXX0I73JghiS37uJ7s5FRINqz3uYKyv8gs5nBnvDqAHNdNse3KPer2P3Daqbh6c
         1+7g3oOgbOZ16qWJOFJJR0gvks6+fbVMWKuXS07gUJ+bsFkYZGmMWlN/6CRwY0B1IkGK
         rnEECHjiyTqd0/QJAermiNVFbAr/AFgFfHNcfpytIEa6DcwY/9Juvu2RlqXHSCGkD+zd
         cs0T2yEAgr/q4XPSQR71gTyhVRx2RRVteA42Vfc0L9pO/mGMxmkvvGBDck2+MuS/bT52
         hhEm1BG3jKcStFyKkrZzPQthN2ptlRfco/ZzEICsG2ea1hsEJZ9evml/1CcDDbwN9LEm
         lEGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9LoOOH4uqECAlECE9cKNZS7rQsrdBYhYLYHWB4s8NRYEK3WQcsDsp3x30kuBHpaxuUJFGNAVg6oBbg42YC@vger.kernel.org
X-Gm-Message-State: AOJu0YwJJilIS654cN6MswEyi3R06SOj/notkrOu60W5frhdgc4wzbi0
	iCuD4PvhCwkKxIZRKLElFpTVr89eGH0Y/86i9phqCS+NHUPVuUMbAHCzJORwHAreDRCF92704RF
	3jIjgzRINepFRpzmI9F6detxW2K25/O7NuBFsmTZmQgDzaits2uJXG4dPpRugQVy3jSbG
X-Gm-Gg: AfdE7cmYzXe1UjEs/OUeF+3yI1pEqMzdUb3CIr9hfqlMS1s9cebCVl2UHlMTtS7xnOT
	hV+VwBeODMbrGXLtwbprUx0NIXy3U1tdJ52G5bpVluBmHV1P4QXMy/7Or4W9NWEzY23AI2q3D2E
	Af/mammwY9d5j0dj3x5uOplXtN2MtE6gUnN9zAi7di87X189LNv8u86GmbvxpRiRARQSfMRHGr6
	HbU82KJsh7ZFux8vcp0GHgosK1VuMieITEmEKcKyI4m+bg3JByJpk2PZyshBRGRj7MMUnSdSseK
	m43uTTL2DUH74xJe8OiwHzftCCVoas3IV1n2Em9Ru8WmJqejSnfJX1whxd11HYMz8KRxY42q/sk
	GtRmgaxg8Mor2Ew9KUVhaQUSclpidg/xPXEE3GILm3c4f
X-Received: by 2002:a05:6a21:48b:b0:3bf:d1f9:b1ca with SMTP id adf61e73a8af0-3c03c6320bbmr216505637.30.1783091136846;
        Fri, 03 Jul 2026 08:05:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:48b:b0:3bf:d1f9:b1ca with SMTP id adf61e73a8af0-3c03c6320bbmr216464637.30.1783091136224;
        Fri, 03 Jul 2026 08:05:36 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85b345sm32904517c88.10.2026.07.03.08.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:05:35 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Fix sticky -EINVAL after resume callback failure
Date: Fri, 03 Jul 2026 20:35:19 +0530
Message-Id: <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-0-578b78a0cf46@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK/PR2oC/5WOWwrCMBREtyL5NiWJtkG/3IeUEJNbe7Uv8yiW0
 r2btivwZ+DAMGdm4sEheHI9zMTBiB77LoE4HoipdfcEijYxEUwUrBA5rfCrfEDznhQF7EbdKF0
 FcGpolYtdwBaUHlBVGpvogBbyIi3TuTlbRtLq4CBNbMZ7ubOPjxeYsGrWRo0+9G7aLo187e12y
 cTf9pFTRgtrzYlLxrlht9777BN1Y/q2zVKQclmWH3hXCEsHAQAA
X-Change-ID: 20260625-fix_sticky_-einval_after_pm_runtime_api_failure-6797d0a5c4d0
To: Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783091129; l=1942;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=2JNfmkrDXlzcvSizv/iAqx3lfl6qRnhrAE7oNNSShdw=;
 b=wa/RbKyRfhqoKsEoOwy7Ku0Vy+5t4iXcub3dAWFoKrRUmmipC9chaycRNK38K1GiPTvt9gmHl
 FwNxT9h3k/nBTbI2jgcva0bENGK4CpDSOex2Lx0VQA0gLGMfefVLhCd
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0OSBTYWx0ZWRfX0FPfqhDlmYPm
 qi60mYzvm5t32B85N+j8BxRUwUkfZIoesO7QiiBItqt/MxPZ1g0h+x216Lbw9XPdS8W2A+fAqPA
 q7vp1R4M31wFYk2wM1Cnc7rvJHSlTItomYulV7pCxysPMvWRes5tsQ6LUBNy7uXVFU91s9C8ICR
 j2RGoFOZBcTWi4PzrN9dN72LRjlIAUetn1Ql1Qyf/J4tF+MiJM7H1lg87iycDDnJzZYsEEwpmeo
 Pr9Ina2ybOmrXHbZusjPTUItEnjSLRJBATJJXJEJc501tQUM1QNWCdACz4SUMAfgaAnKhB/hvVb
 EuxKqRY4Zal1rsJilBnsZ8rrC0Soxpi/7Q4rXC8CDfNfYdC74pwnq2RiccRCCJUl81rzjI5o5gf
 6u6R2W0UitQ3T6NidEVZ+1ShTdXwJJ3RoZoUDVTj3IwtuV/B3PvuyI4sjZ79NBznRN1CXbW5s9W
 COOlfXRH5QKrcAzfo1w==
X-Proofpoint-ORIG-GUID: v5h_wjszc7egXaLROQ5yylU-skgr9JBM
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a47cfc1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=4GhjkeDSICfBxK9jGEoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0OSBTYWx0ZWRfX5BVvDjgirDUs
 RBLqN+dxgLwt3w3HETgz0oHhvqu4F9M+sshjos7Qwer/mXIrU9GP+Vi2KwjGG01P1LOn4iDUruI
 7502CpnIHl8bLH0QW6XI5dfofDxO//0=
X-Proofpoint-GUID: v5h_wjszc7egXaLROQ5yylU-skgr9JBM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030149
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116343-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,msgid.link:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A45D703B36

When a runtime PM resume callback returns an error, rpm_callback() sets
power.runtime_error on the device.  All subsequent rpm_resume() calls
then return -EINVAL immediately at the top of the function, permanently
blocking any future resume attempt — including those triggered by
consumers trying to power up their suppliers — until runtime PM is
explicitly re-initialized.

Unlike suspend failures, resume failures should be retryable.  The first
patch fixes this in the core by only setting power.runtime_error when a
suspend callback fails, leaving resume failures transient by nature.

The second patch fixes a pre-existing issue in the spi-geni-qcom driver
that this scenario exposed: pm_runtime_get_sync() was called in
spi_geni_init() without checking the return value, so a resume failure
would silently proceed to access hardware registers on a device that was
not powered up.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v2:
- Reworked the fix per maintainer feedback: instead of calling
  pm_runtime_set_suspended() in rpm_get_suppliers(), fix the root cause
  in rpm_callback() by not setting power.runtime_error on resume
  callback failures.
- Removed other patches which are not needed now.
- Link to v1: https://patch.msgid.link/20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com

---
Praveen Talari (2):
      PM: runtime: Only set runtime_error on suspend callback failures
      spi: qcom-geni: Fix missing error check on pm_runtime_get_sync()

 drivers/base/power/runtime.c |  8 +++++++-
 drivers/spi/spi-geni-qcom.c  | 17 ++++++++++-------
 2 files changed, 17 insertions(+), 8 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260625-fix_sticky_-einval_after_pm_runtime_api_failure-6797d0a5c4d0

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


