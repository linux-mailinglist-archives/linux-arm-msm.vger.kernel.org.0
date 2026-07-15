Return-Path: <linux-arm-msm+bounces-119125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PYFCLYTfVmrvCAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 03:16:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2FE759D46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 03:16:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iii4boXy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RO+68lDg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119125-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119125-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 203A23013ABB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 01:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1664370D61;
	Wed, 15 Jul 2026 01:16:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FF636E46F
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 01:16:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784078201; cv=none; b=fimFsUBh5D787hLADLr5TjLiRq0SzIsS+F4zKoaTDHrFcMtkp6+SrqA6iYhVEhcqTbh+7HfG4vFDb3JpF6KnItILEZQJJi3H425/QzuaVQCOtb/p6Xss9zySHsi0cviWqTLpZwHnm6HVBwlHUxS6Sp9He1jC3TvOfIWEQHiXVJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784078201; c=relaxed/simple;
	bh=aFIWDU6AlfYlaPP8X5OcNF9jcaSZ/urzY1gk6bBHoCE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cePh5jQlQBo9ihYD1bQCalcW/eIMCdxvsS8k9Gbc1l2qW5ceuUJPBFKgUTfjJbDXWU7JaBrwV63dS8T6nnWL68wfTmioOL7ncGWA6mJSjyqA2phOqCpsCSCR1ILltRE7oz+/cNZl5W8qIg9t7fI0a43F/FcXET4Pujcx6cB3OoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iii4boXy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RO+68lDg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0Iqsb2076884
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 01:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pAtH5G57y5Gbyi1Jlqywtr
	XzbSjK544adRCQmBhjzoA=; b=iii4boXyuleGRQ6V5NlVuC5I8eyHZ6YgyCZQOx
	1zZSqWLNeL1bN0G+jwsidoGpONzkVtOPPQ3bLg2tIEswsMCIQKxwzwqDETz9GWa7
	EnHGaa7veKyZhZvFGblqkUi0ShjeRDOcw5s1lezsemkX3D6+0pv452AYkNeCSqng
	PfRQngf0op/0NPE4WguuQorCokY1ks0tsQlg76eyBGH99uhl1yGth66egjzuuaRm
	wkb42OlLx20Mz+fZCFutBSZFkW5yFPpZMKawuSRp1UXxeaiTLl+khejmtj/v05Rf
	hXKCeWt0pPtHFgxZzJgkwtOCFiuh2vgC64IQE6ARUyanI+yw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr2f3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 01:16:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccafc5e82cso19522325ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 18:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784078198; x=1784682998; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pAtH5G57y5Gbyi1JlqywtrXzbSjK544adRCQmBhjzoA=;
        b=RO+68lDg3Scgsm0HRtJOzUb0djs6DXlmaw/af+jhz+ULV/F9TBdG3nK2bz4GW1d53G
         +tK42ZOh0EL0pIM8KOdow7HXpHBDQLTAX5cV69XzNFVlHqMBz9iqf+KCCihomn9S2p9w
         XIQclOakGmnIXLAg2OsaYjQduS1bAU2z5mjMhiunX+EEaBc/3CoB8Sd7UPZ0bB+czNDz
         U7BW45NgblB/bacptn3idnWpmzhNTCWXzql3B/JS6JQbEcB/9AEhvHFbiW2JlNf+77k+
         omAGJhtZMobnisqnmzHgcT2WuycRSwFoSbfIjOvEbIrWlsoHmd8A9OQqNwvg2Rn6MbCw
         qazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784078198; x=1784682998;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pAtH5G57y5Gbyi1JlqywtrXzbSjK544adRCQmBhjzoA=;
        b=RfDxfdVv+M1O37dJO+m+rPN0HbhDg3VxNXQn33dDWZd8NHEvOe6X9oQzqlbTKHM4yt
         cafyluDaZDlIukQ/ecJpwxIfdI6MSlEflCb/VWRYokvNtv0uquxoF28A/VpDvcpyyjbr
         DOYyz8N6sYRijcXSriMPubN9NCEfgAwjupsUEtimG+AlCLZKycLhHkJC5ey5qScRWVRI
         V+qGVsLfXSdyz+fAKJNsWzRGEQq0agU+3RdmpOVMZcG/0JSfJ8pTPZ+8LSjShCVqXAYH
         mHYY4l/Nam3DMIRVMb7IUQ6/usPsdjAvCQwhgq5mCwlHDONsTe0alIybj30tfdO2o3/5
         L1tQ==
X-Forwarded-Encrypted: i=1; AHgh+RowaaGKdjYjcNa2hPH7xROnBPu1+sByourVw/mEj/loNMelCN+pMGhr1biBXYnW0qDHW9AqHA9A95LvrcxW@vger.kernel.org
X-Gm-Message-State: AOJu0YwD6dGQE603oLqTv2rLghNQXLSEkZf37pADS7XEyeiNNbdXbKG7
	ghfqd25MmRY8PzP1JaKLY0SPcFGFdWc7/AyQNz+nWpCyzh96AbPZPIU4a8PPiuK/tStht2y5It9
	zXgK3Sew+d5p2/0TTq3LgKaqR4lAHWTozB54JoITx9Gq30mML5usbmApFotSuQIz/zPP1
X-Gm-Gg: AfdE7clEGPXIO83clg9aQJI+zctCUvqQpVGIaw3dBPmNgBioI4Q3vvB8U2lRGL4J9yz
	+bV2xr51LoKujrlGRorDDiNamc+k4hCMdbkojJub5WKTi6a+xhCdR3aoSpmJRbTZxdhRcCz8yCF
	2KxYcVtvCJakD9IGUTSjGq0m4QWgJKaMZfFhhkK7Bcq/UJCv4NzPuEDTXzH1nIBVF1MVYBa1eiH
	2ABZbxtvxPqlzFJkCrIvcZJ5xvMSL6WQfoX6yC0tza1oJiyQrsnSxBJed/HV8I6ldjDoKIA7a7k
	MTlIz752/NWesKUulVvKftdP4hbrPNjne7ZFkrUCJBf1i4FkDeLH4e25ZtbVzU4t/QY5K++9jaU
	SesgkvJcPj1BbtzG9ACBPVp9y3PYE7uIjRsUMFsJXOyauY0edT2yTV+m2F5lsBVNdsHP4A/HAGQ
	==
X-Received: by 2002:a17:90b:3a83:b0:382:1a6f:ba3b with SMTP id 98e67ed59e1d1-38dc74d04d6mr13821923a91.5.1784078198088;
        Tue, 14 Jul 2026 18:16:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3a83:b0:382:1a6f:ba3b with SMTP id 98e67ed59e1d1-38dc74d04d6mr13821886a91.5.1784078197613;
        Tue, 14 Jul 2026 18:16:37 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e1745a3fesm2207487a91.13.2026.07.14.18.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:16:37 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
Date: Wed, 15 Jul 2026 09:16:13 +0800
Message-Id: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF7fVmoC/42NTQ6CMBBGr0K6dghtaP1ZeQ/DorZTOlGodpBoC
 He3cgI3X/K+xXuLYMyELE7VIjLOxJTGAmpXCRft2COQLyxUo0yzly1Y78GljEx9nGBMHhlCysC
 RbtlCCMEqI9F604oieWQM9N4Cl65wJJ5S/my9Wf7ev9WzhAau0oWDPhrVan1OzPXzZe8uDUNdR
 nTrun4BMGpfPNMAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784078191; l=1381;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=aFIWDU6AlfYlaPP8X5OcNF9jcaSZ/urzY1gk6bBHoCE=;
 b=WEFYv59/YJRcXk5HjnUKTQ+mT91vfzOOTpTQoQY20Vt8nnM5uVg9+ccZhEhHFAl+sTdfH6+09
 fDtaLiZtefRAzHpWJWnHQCV0A7bNjLVlQFQvvbiro07GyVvMDvcCNA3
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAwOCBTYWx0ZWRfX1Blrc5o//5aY
 bYIvPEGH73gMmecioqQ4GeTy1iaoAIx/1IzprP6ByIuen9mgqFbfzio5tocx8wC9QEPxRr2oupm
 sp43ihm3MTeKASNWIoXPfBMjPCe1LyY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAwOCBTYWx0ZWRfX2FuITZw6ldNW
 QZyk2KHIiITbJ+R93PbkHT2EkOXLSzT35LtrFshpazxEmbocZ7XbAh2sXmmMT0NYMr8F7hgl9SD
 GM3I9MpMDifXaHa/s68MoXaVwElSyj4bDK29bEUKOKumdCrJqhYyLOsm9bA0zOwBfgHRCORjrF5
 ZxTksei0VV62qNC6j0c1zVB0z5yblI+ANbE/LJ2wCJ4BVAAWL5gRIjFMt80La6/Vsi2wxG5tPz8
 cK2RhpWfCTrusTCC7bmbNsJrFPbwK4ounr7vZ8otNf1VmiqVuytE1q8EMZNSKg5QQnyQpJ+jDRT
 kZs3FSOLW/z9eGroHb1fSRkNHyeDgi4oWe5G7jnFHIixikxi9gHhrVJdcdb2a66xYLfYGu+bab1
 rpnpzBEoVgLgw0Gigdg/kUAWJBWeClQsaA5KxwJ8jvV3u5DbiG59CxrNVAkCwpgOS2GIJ3e5Nm1
 xseZ6ybMcYWEhH+zLwg==
X-Proofpoint-ORIG-GUID: EdTUrW6ZDw_41y7IA1sSDWb2RVd8cJZG
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a56df77 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=anp7WcwJjaQlINPkyJkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: EdTUrW6ZDw_41y7IA1sSDWb2RVd8cJZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150008
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
	TAGGED_FROM(0.00)[bounces-119125-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:yuanfang.zhang@oss.qualcomm.com,m:jinlong.mao@oss.qualcomm.com,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:jie.gan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C2FE759D46

This series adds the CoreSight debug and trace subsystem for the
Qualcomm Shikra SoC.

The first patch adds a fallback compatible for the Shikra CTCU (CoreSight
Trace Control Unit). The CTCU on Shikra shares the same configuration as
the one on SA8775p, so "qcom,shikra-ctcu" falls back to the existing
"qcom,sa8775p-ctcu" compatible.

The second patch adds the DT nodes describing the CoreSight topology on
Shikra, including the funnels, replicators, TMC sinks (ETR/ETF), STM,
per-core ETMs, CTIs, and the TPDM/TPDA trace collection blocks, along
with the CTCU and the dummy source/sink endpoints that model external
trace sources and the EUD sink.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- remove MMIO for the ETM devices.
- Link to v1: https://lore.kernel.org/r/20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com

---
Jie Gan (2):
      dt-bindings: arm: add CTCU device for shikra
      arm64: dts: qcom: shikra: Add coresight nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1295 ++++++++++++++++++++
 2 files changed, 1296 insertions(+)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-add-coresight-nodes-for-shikra-fffa261ead64

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


