Return-Path: <linux-arm-msm+bounces-118826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AIY1MWUNVWq1jQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 18:08:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C90974D6CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 18:08:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OhbnVXqV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CZQI5iSG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118826-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118826-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA37530010CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E833E32D0F5;
	Mon, 13 Jul 2026 16:08:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8883A2236F7
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 16:08:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958883; cv=none; b=Uk/6Xkm64nk0/5H3XjhXd9RqHIKasXi2CGfEvJjKPc5D3sT3cHPYBAtZlPYbnct6hzKBM1okQK1/tfdQg1OviI+EeEG3SQIyAvDnvKLO2xFBOJNmMNZZer+Y7GHE1jnBUEoTbM9jZRGHHuotX95zuTXwQoGXn2Cs/XvbJ5nBCeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958883; c=relaxed/simple;
	bh=fDDi3VGBsM1RSmL/j03lndLu5j1CRsFIOb9plDRnauA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SzsoRGh/XthQaV10l23gxc3x/XJ+je/Sk8FYq/LoRuzuGeNutlhSakTD1kNe4frSKSnSLJcawo5FsK8Nv7x6CtmzFoxa93oIDg5SIPOXDCEGR7vfyoC7NUh/xZp8zc9diE7/2MWwc5yrwfoN/IVGmOiqCQ6nWSAcvyfvqeGhg2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OhbnVXqV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZQI5iSG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DG5HcR2030810
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 16:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R8NOPLnKoo6QrG2E7W9gceBtElHZ05++bescYD+aziY=; b=OhbnVXqVchFuZ3PY
	WBWAQnogNINzPNaJuhzejsKCSARX0WhewBSDCv5ZQt2FbUI3ZFwQG46gS3iDLvcZ
	fFzAKglbNmWpagSAjkQxW4Q1P+HYYvFDzlLvvfz9cyz/IiO8TgTWHCG1ujFvKt11
	/zMXEnoj8K/MOmf4JWRk8RwJNZnr0vRWBR0Itg7tcvQDIIph7kmPiAuCS30Q0D0l
	Ig2s+Dqgdy0rGAVhdaXlWfKXUodMgEIJzGC5fx8BXREhIhOU1LL2N+TKjSyl4pkO
	fsE6jcEJHCURDeJ1/T+sfj6566BQYTD0cXzfKQyzG46nwjWQUvc51Y6Y1aKmS1zO
	s5ilyA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37x80f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 16:08:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c892143db7fso2930a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783958881; x=1784563681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R8NOPLnKoo6QrG2E7W9gceBtElHZ05++bescYD+aziY=;
        b=CZQI5iSG6D/Y2iNIdgDAXwqSDdroDbtJ1iN/RJYtTvhksVG9sq6KnU2HnvBJa04IAr
         qk76Lf+0f/2guIX6+wyd3a5m0H9rK/jcZpOEGQiy3i7EM5mCoH5Nj92vNy/KxVqx8fH7
         almmsuovT0IW0ucyko99/w92P7+UnViP2VRuK6IJZYKhPN59dUw3iOfmU+1MlDzfnDKD
         gDvo2lP+jmfPU6O6rv8jl/nv61b3xQkCfqBhJRIrauhuGI31wQVsMZjCyXNNsyh0WSD6
         Ep9vTA/baPePVRjVFPAdtJmiNbN25MBckQ8DSQjJYm3kpyjWQB+6CA6yElNPxbS9w7D1
         isfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783958881; x=1784563681;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R8NOPLnKoo6QrG2E7W9gceBtElHZ05++bescYD+aziY=;
        b=tSq2zn+BZmpOmPVA5xmnmvUvNE/Bo+7TNenMmAR66R37IUcBHTEwC/w5BIZKjcZDv6
         9OHU0i8WTjz0+HsHC6PieEvSKUiuBX+PIHCatA/W4S0EwT6l94es8M/eM0q1t2fFcwr9
         ogB45BJyLBs6honcJBYZNE5dte2gkKxlHpXm3YTUdGEOjh84AWngjcabmJBNWcLpkjI/
         NTeA2bBBmxwH6VFcRAKa/CtqU3/VbUAKE04KbiUJu28sKjq37e3CSVxVKqiWQG1N9iyi
         mgkUogj4/fdzhEoeNYWTVx/ctQGh2EtnxWulllbTWpi0oLTGizeDLFmVq9pB7nMpaCLk
         FkPg==
X-Gm-Message-State: AOJu0Yz+9KA7xOXDwQFoZKVhJMBmc3Nah0X/TAzmRejW7zrlXw6fo0i4
	nRDUVBIEojLbWrymJg2F2ugoT6jDzqrEjNuE4bSqyN8nQN3LZn1oNS3jOTX6uXoZUKRGBiKT90u
	3I3azBzVnyd6nzASttqlSqLKK9ZMjXqqni6JCgiR3G4vV3SVhEHUdqNamvY8bpG3g7exk
X-Gm-Gg: AfdE7cmWigNIm3EgMJ8L/WXiyhuNxJShUt3Vx+zBHUl7Kx66uMGS10IWZKQ7RoE+lpL
	Flfvo4xzCtpffEi5bEMy2uP/UQLPgAxezqgA4qB7kP4veapaGwsrEh/ZNhAA2NJ/NZEMAQ1FJHs
	seqFMi3X+kBPUIRjulE6aoNzyCbpD/phDcbvkEzh/0neNhuhgbmwfX9TM5rSRCT6Za8s0GjZCjw
	Ub4Dzx7iWOOdcF2eQOCs4AxBsWvr2Sv75ux8Az4ZjPrsY0iHGf/Ot9PCcuHUvTIi/e3YktKW3PQ
	Gr3MEe2dTMl5MuIkQN7pKEoqHDow8RLpE9VI2xAxRZ9JSAGNWsZRcCLzDTjEjZciq8hGJkKGbcH
	nEzU53u2IoJnt9WACxVwBbyXixzi611gEWFoNzQ==
X-Received: by 2002:a17:90b:1dcf:b0:38e:673:5d18 with SMTP id 98e67ed59e1d1-38e06735ef7mr2557216a91.36.1783958880880;
        Mon, 13 Jul 2026 09:08:00 -0700 (PDT)
X-Received: by 2002:a17:90b:1dcf:b0:38e:673:5d18 with SMTP id 98e67ed59e1d1-38e06735ef7mr2557164a91.36.1783958880280;
        Mon, 13 Jul 2026 09:08:00 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm56974789eec.6.2026.07.13.09.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 09:07:59 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v10 0/2] arm64: dts: qcom: kodiak: EL2 overlay for qcm6490-idp / qcs6490-rb3gen2
Date: Mon, 13 Jul 2026 21:37:52 +0530
Message-ID: <20260713160754.1250988-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com>
References: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE2NyBTYWx0ZWRfX/zNRVUy8tYhi
 /MDRcY6BTP+3REBgzl+oJ4u3g7HbQh+16SzPN7bSw0qpvt++xo67qxNXgC/7j6LYyc/hhm9jRT0
 jCIBVhSihMRztND2F0/9MQgjiTvw6wVHJdqgZ8ZArpJCaou2tUJJsIepnhPyXonRxyfqefCap0Y
 sy+EqncdO5aK8HqqtpbRtcDP6ioG7yV3Bp5xWLWeMYoajSeoieAYYO5eyM+2GJf9X6/V7KhpMQ/
 oCI44mOXjJThn+Vj4on6sGdib38faeQKrJQZOjua9w3gipxDiDm7MjmK9OrxK/1dBTg+bcPJ8/w
 x3DQckqm/Bo/5eXtQ4vm4cZyGbrziyVUX8Z/A97CU9iZVoKK5/YXjlauWTseNvFQ3LBqYh97Iwb
 TlPJQcrDnqeDSgbUXj+XWcIclloDJDiY6zP030jfh2DlCxHElwraetCoQOnvs7Lzp5Rk+fEf4FF
 K3ziuVs9yFU46EyhnIQ==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a550d61 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=n0mgBXbVGTAyQq78KrMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: -vyhzQMWSRab6US5JjMCFYjLoe21Wobv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE2NyBTYWx0ZWRfX+0AlocNQtb13
 jXHQS883kK5rYA4e6m/OveIxhYSTX17YLcQHB2cR8Rzre+M9Qd8ISkHqREUhMf/jSFZDvbTQZ8D
 tCzVicGMJqB9gFvvMBJMZ2pAoRTPAr0=
X-Proofpoint-GUID: -vyhzQMWSRab6US5JjMCFYjLoe21Wobv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130167
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118826-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C90974D6CF

All existing Kodiak board variants run the Gunyah hypervisor, which
means Linux can only boot at EL1 on those devices. It is possible to
boot Linux at EL2 on the qcm6490-idp and qcs6490-rb3gen2 variants;
this series adds the DT overlay that describes the IOMMU streams and
other kernel-owned resources needed in that mode.

Patch 1 is a small independent cleanup of the two board .dts files:
keep the wlan_ce_mem reserved region (its /delete-node/ was erroneous)
and drop the redundant wifi memory-region override that duplicates
kodiak.dtsi. Patch 2 adds the kodiak-el2.dtso overlay and wires up
the -el2.dtb variants in the Makefile.

Changes in v10: https://lore.kernel.org/lkml/20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com/
 - Split the wlan_ce_mem retention and the redundant memory-region
   removal in qcm6490-idp.dts / qcs6490-rb3gen2.dts into its own patch. [Dmitry]
 - Drop status = "okay"; from &wifi in the overlay so platforms
   without wifi enabled in the base .dts are unaffected. [Dmitry]

Changes in v9: https://lore.kernel.org/lkml/20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com/
 - Instead of adding wlan_ce_mem back in the EL2 overlay, stop
   deleting it in qcm6490-idp.dts / qcs6490-rb3gen2.dts so it is
   present for both EL1 and EL2. [Miaoqing]

Changes in v8: https://lore.kernel.org/lkml/20260522115936.201208-2-sumit.garg@kernel.org/
 - Added a wpss copy engine memory similar to chrome for Wifi to work.
 - WPSS does not have firmware Stream, so that was removed.
 - Added wifi streams similar to chrome for wifi to work.
 - Removed this patch from Generic Pas patch series, can be followed
   separately.
 - Moved Sumit as co-author as part of modification done to the patch
   in the past.
 - Added some more kodiak's board variants in the makefile.

Changes in v1-v7:
 - mpss was disabled and will be enabled once the dependencies patches
   get merged.

Mukesh Ojha (2):
  arm64: dts: qcom: qcm6490-idp/qcs6490-rb3gen2: Keep wlan_ce_mem and
    drop redundant wifi memory-region
  arm64: dts: qcom: kodiak: Add EL2 overlay

 arch/arm64/boot/dts/qcom/Makefile            | 12 ++++++
 arch/arm64/boot/dts/qcom/kodiak-el2.dtso     | 39 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     |  2 -
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts |  2 -
 4 files changed, 51 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso

--
2.53.0


