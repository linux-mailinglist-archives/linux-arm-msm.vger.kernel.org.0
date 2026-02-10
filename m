Return-Path: <linux-arm-msm+bounces-92506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aVQSOGoqi2kvQgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:54:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEFD11B090
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ABCF9300AC9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 12:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6990130F531;
	Tue, 10 Feb 2026 12:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3VXLMKY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aHswWuhU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5BD1F8691
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770728039; cv=none; b=kEKioQXEI03rZtsV8B3W2oQ43gC9S7DJg8175A0OEDbbFCUipE8adEncYDgD+yp/uWfsPLxfwwHkWni0AEoNB2JHN2gL1e19JKlRtDWq8Gfm0W5knNPkgyTYqKvmPbk8sb3Jo2TQX7yy1R/HdeGqw3ozFlufUtS1HHvccsReme4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770728039; c=relaxed/simple;
	bh=/sUdekDqliu4vzUgEVf2ZbskSPin7viNkHdZp6V0FXg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t+ixv/p4l6ye0XD/hQkgH9+kBuVidq1mRac3GeuOF9GplfZMcfjh4TVqOdSBcUf+OJhviNnKC19DcG+LkT734WcBc4kQOScpzwv95osFJj539x28wuXAmEyX1+v3JDmxW8EKW9agjT5a+WMRCJO/PuQVVIOzNhEYEgInIqNNa90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3VXLMKY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aHswWuhU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61ABDA1E801266
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=O5AXGKkTSwpt6tH1a4P0ayNqMsI2BiAyd9+
	cuD5b5KM=; b=N3VXLMKYLn5Bs8g6X8eH5h7WMZ3LUvyeAv/kdrxQsg8UagnNNbq
	F2n7ESgK4wM3YmWgl4LHWV7wcbs+SMDHitDqaudhFjztpSwOgliHSEr7uf0XanOU
	xeafd4JQDLgiOxQS1om+UfCZmddEDVh8vc5K+zWUVbFJDTRs7yzBgLgrkXfm0+CI
	+3YRDgunN+MObHh8xPmRFWzg1MuqiIxOx0wlMHlZ73msePPQGGNbLxuMZgZrkeu6
	9imNrr0KF8vcptcFI08Rw1t5OqoxLSI5OueahivcWT5qe2wt586J7TbB9lE7K0K5
	M5yrFee5Xzp1D89lJ1TjgFNTsAtwoHNwW6w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7x6u1eay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:53:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aadeb3dee4so77890505ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 04:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770728036; x=1771332836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O5AXGKkTSwpt6tH1a4P0ayNqMsI2BiAyd9+cuD5b5KM=;
        b=aHswWuhUXuBWuqh+JqicjcHh2oa3nBOVcudhTnew8ovk6PcxsCkfKjS5p5kYEraRdA
         RnJFJOtiUNycTfdlEWxsrhaGRcdRQg5DujPTq1Ic40e3+y3o+fpTSdb/mBCADipeFKaO
         RyZPUZxsJAGy8Hf/Ar9SxUc70s5kx3B0cWG/P8NPA6RpF+Vx5UPBWGsVLSokrwCBfa7C
         eg1gO+gkV36X0nXg4boXhyEc7dmsRLhjxkY3qesXKOrsSC8L4tSZ1YeoOrkdpjlz59pG
         jTX46jHqU9L0p92fYKdXwQ4YCFqYrkuqZT2U+aYPPAKQV5QkM5XNXIb66HXyr3uNW32g
         V7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770728036; x=1771332836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5AXGKkTSwpt6tH1a4P0ayNqMsI2BiAyd9+cuD5b5KM=;
        b=aHARtW8LE2dj5vLc1TUdnTItQXL5qX49b6SMoZK7GiPFV1MWzTJljA9FxYKZZfiHJS
         OL70ruLdgUiYmKNQ2LT9OlQJCWd+YAe0Ayvt+xNJkiINTtdQagZch5hTNLuKWrle0E/t
         RABAx1gQj6tE0i043AP41GCm9Bskv+sEZhAawzSaT5zBPS3/37lsrNDdULyIZX99Fy23
         s1zvrHerOP2hpbnwbAYD0YTq2WSgAwu5PZX+sL+3h9NzQx0k4QHCUz71IdpkKjpUUCg6
         UAQpcgD00UkZzgMH733n8dNT8NMseEs5cgVHMB4z61sZkjLSkrhjCyGvA3YbchUg7QOe
         k5fQ==
X-Gm-Message-State: AOJu0YyCuJD2Jw/L0tb5xieQoU7pp1JaqCbFprFeK7+kl26PD84LAB8a
	96Fxoq6gqyfd5FbYd5YSvbtyunPSObsldmSar+OFXiaELL7OJ3FtM2ag2wmwNFvqUX4Nraif3Xd
	5Dr60IxtwLWn8zN9ksUA6GerHZCjsMrjnEvphOZ+smxOXWmn+zBRmUxcmY23KwdRnU/rzcAbSrK
	0Y
X-Gm-Gg: AZuq6aId/0TSOaKkG3fPwzixOCK4YShtw4yD7/FcLiimpOWZ7oj6Dh72DaP0c4WrQxc
	NLgNEyRJOq6Mq35x9klPgVRSW0TDPvuv8KjxYglheEP2D1kcm+DPow8Eg39X8y8ydYes3abhYop
	YkpI0h8c0gp5uVlGuN9CRhHMt4EQUkkXKcQKWpQ+0Z/2f1I0+0CNndTqvORcrwtf/SR5kQCENyc
	f5EIm7hHpy8oHHk8yfmNicrVcyGXMQmUUhzp/PpPDtXHLnrzMEnQnPar0f4h/cvKkNKn3n7b3AG
	Xfre9VLgcRKr2OwBpto1DJQcTRs1rkKegJo8Iy+0A43hzTz60UOFRPVxeOqWYwJOuVWqdZ/oPUR
	NFUeCbXzDJ/hHpf4fayTuXJqaYg70meOmqEVDywfYWC4qcXjXccPMVp8=
X-Received: by 2002:a17:903:3a8b:b0:2a8:d9ea:8b59 with SMTP id d9443c01a7336-2ab1054a371mr21171585ad.7.1770728036233;
        Tue, 10 Feb 2026 04:53:56 -0800 (PST)
X-Received: by 2002:a17:903:3a8b:b0:2a8:d9ea:8b59 with SMTP id d9443c01a7336-2ab1054a371mr21171425ad.7.1770728035781;
        Tue, 10 Feb 2026 04:53:55 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a64990sm185356375ad.13.2026.02.10.04.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:53:55 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Enable tertiary USB controller in OTG mode
Date: Tue, 10 Feb 2026 18:23:46 +0530
Message-Id: <20260210125348.2800846-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gV6QbUUJghrvxFccp1QxJ8P9sFvc2GnL
X-Proofpoint-ORIG-GUID: gV6QbUUJghrvxFccp1QxJ8P9sFvc2GnL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEwOCBTYWx0ZWRfX3cyJ4XD3H2Lr
 ymSZVTRjAEZf/b5f5qciHSRy6OcuxR9yaSla1A7V2pA+Tar1uHVG2fg2TgmviwTdIaG+ZHHlyJf
 xzf/gONTOrm6rwQkJEFWxDirB76+JuLlix4PX0xYVJxn8dp5Rvzt9XTDzQ+eBTIVqmECbMVOUK4
 BFMY0uuMyf65rtYHz0jDs7W+3wTh5y7CNqfsy8lKV4Gpy76DQyPVlRB8Rm1QUvRIbmco+72ycSa
 wYk25dpsOFGstGlNE1Ibu7659+If44dGkYODoehq9fPV6Q2JYS06gO4FUZ3pciM/FbzfAMSBzBe
 UB09znUMXG9An/WtRtO+mgIlCuSCYLrlA+kbE0jRqKCHvpNyhS3NK5QbV6KjWfWkelyXmdVbR5s
 WHz1Ga9V43BhDVbUg1kJIblr8zi7pgvrZutEP81jT63U0v7f0Uugwtler8HjZtLhWEVMGme6Gub
 UePcU7dnmwklYcbzMqw==
X-Authority-Analysis: v=2.4 cv=YfmwJgRf c=1 sm=1 tr=0 ts=698b2a65 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZYlc2bHgbGXsrt5v370A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100108
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92506-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7BEFD11B090
X-Rspamd-Action: no action

Enable tertiary USB controller in OTG mode on lemans EVK platform.

Changes in v2:
Added interrupsts for all expanders.
Minor formatting changes.

Link to v1:
https://lore.kernel.org/all/20260206104642.1038381-1-swati.agarwal@oss.qualcomm.com/

This patch depends on:
https://lore.kernel.org/all/20260122092852.887624-1-swati.agarwal@oss.qualcomm.com/

Swati Agarwal (2):
  arm64: dts: qcom: lemans-evk: Enable GPIO expander interrupt for
    Lemans EVK
  arm64: dts: qcom: lemans-evk: Enable the tertiary USB controller

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 96 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    |  7 ++
 2 files changed, 103 insertions(+)

-- 
2.34.1


