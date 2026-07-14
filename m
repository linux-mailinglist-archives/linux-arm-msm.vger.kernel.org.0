Return-Path: <linux-arm-msm+bounces-118972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mJGJKlDjVWofuwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:20:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 055E5751C95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:20:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oelj8v7M;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hOHlzRMD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118972-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118972-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7433304C2D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358BA3ED5D6;
	Tue, 14 Jul 2026 07:19:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82393EB80E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:19:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013592; cv=none; b=dPCMKh6Mawl2Muh1GhAAjKAf5sSJOv32ZrrCAHlSg0+baZS4SKFll7GE+A7He6OPO10R/xqLWS1v1TMlVvjvmvCx9AYE1WjR/jCwBxIVbugMrC/acHJwZBd7Qd3StZxzygZFF/wOx4AFHFD1KH4jFMr7XQOb39FAe4mHBJ/auH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013592; c=relaxed/simple;
	bh=2olSJeQThdFIjSb/qGPFCp0Sj552lGbJGxTPH5sNjyk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EKGJzfVFvi7XW6Qye/MvrjezhsjlqglTpTtGemetYop+2RHJxIFoYfu2uzD5igeYexV3Z+rSH1WtX0sE4EnRXZYBfIIq6t6KAC5oVRtS1MPtuNCENDx9/RCvsUIgTaVUBVfDvF2TeQq4yvzDyHYFJhkjSFVWZutY/1XP4ch4aBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oelj8v7M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hOHlzRMD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SYTc3743793
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UwLKmPd8Wf72kXwCBZSNtT
	R/YasAOdt1cfgbUUtCPco=; b=oelj8v7MsYOKvULX3HZRX9wAwfAwPowgvPAWCL
	RjoynuPTXx1YnnzvWLGdo+WWkH84gg97i2OOtKOz5h1CBwt57xtouUUGpgM+RUiH
	rsLa1gKkbYAXbe9Aizo+fojSK1/ImXz8s/p9PYE3H+mSdXUJeeDjezeWW2pOjx+Y
	YUfXxgrV+eL6KbPzlLOgMiAz/iLgnuOv2t1tgl2+0l1bSy7ivdYkkG7YiwgqqnAr
	Eju/Hqg3Mjo1dTV9Z0FJAV81KIkGexhACunNx+fc3Bk2DnygOQF9V5DoCiU5E1gT
	XfujyvmuMEqho8ejOqTmlXPmrs4uWrKbCWfulih0GBS/dUXA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p2gm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:19:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso52358905ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 00:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784013589; x=1784618389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UwLKmPd8Wf72kXwCBZSNtTR/YasAOdt1cfgbUUtCPco=;
        b=hOHlzRMDVtSzqr2Fp0ebwXvvBWizGhK8fyJIzO5rc4P1LwXJB0q6PB1YFlRipU9p3K
         bw8LihjryuzrTPa35SPAKqCc09n5YYEzO/QOa9bB+vxt/YboYUEfTNHMvwHoYiRfOoB4
         9UTpy848XKKCiH8igaWcrS1W6mRUe5bKeGlYndJtxQyHF7SPj7NpTyh8FV07Rer72V/u
         EYRKq7mZiEgJHNjub9Sf5T8jrtXwF09EYn4xmKIvPPTvI/SmZjVqPmvgDYNP5HPN/Ad9
         oHfC6BtN67MymXP6/jFkhS5hPisbV6TqYbl9ri76Ou5akHAdaKscfV44QQCFQNyaJxx2
         zOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013589; x=1784618389;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UwLKmPd8Wf72kXwCBZSNtTR/YasAOdt1cfgbUUtCPco=;
        b=SeTjn+My7NW+ZG5iBvqOzADL/TRZUpyCHw19bpeJkVihS0lQLSRDVCwlDTJrroDGel
         5BGFepzHP+or/GJtxaIboRIKtPkM8/Y5opEmjZMLt81+a26Gnmuc+SKI9GU1zqIkOiGo
         6Jb+g3cKtxMV7U7G75UQInZ/5wpNLEq8AKCfayg2DGxoFJBWNwz9ohPDXXDJHgUzojat
         uF2z+8cNbaS8biArPXHQUNFyN8CZFIkdAW2c10IXa+cZYotIn/74NBLrD5n1fhelIMJG
         9UkCnpGn7ztfqGNUXsXqktkhw+zIECrJLOvxvcTPRMztRdks5Qr6rMzLzGpQ0C9BVPiA
         dY/Q==
X-Gm-Message-State: AOJu0YwyD97Fd36F6c1rpX2YPa5J+rz0nWTzmLgPRoDejbUC7GzOzQN2
	fvAdEh3s81LOFQNfRqXB7QBMWDyqskaQCCxVQUPZHVe7Sl/AxPRUbPlnRZThqZYMhZgfYX4NpAu
	OneTgHSBlRCHmtcERHoYsgbDThNgYdKAHAy3zMUux4z3BsX9jYAsQGZ4eKQz12IKzOv+a5v5JKx
	Ys
X-Gm-Gg: AfdE7cn0IXDuJB4nlKzMxeZpEvB0/2Hg8hhxmggLcC+UHRqCWZnSEBQ2CjFZFXa4gr8
	hKnnHM96rmrbCMBIwzjQxAlTOKQDv5AqeoAUa3aaIubxtg4sB5604jR9Hi3p3L3635cFm843X0J
	RQvePO/bGvqCcDXFhf0sQgUNVnD5Xqp6GiBOloBdcw4OAujn1XaxlWlGqynoKUTMsvJLcKF0Jl2
	GFIj3PPaX9ZQU8XEl+Cq/051CX3ZZWOVHNN9/7rtoE8hzJrEysz2y0PCM42+0mbrQ1yOMMjNYQq
	IqwhIx1Yeah7Fl5PACcxGuL8XZugobFxKNLxkAdB7qRsEm8JhnQFdngAvuZwa8lmWSNIwN9HxEC
	2Uwi+zFDfHMweAaC1KBjRuriV9FGEZHgn2LV13Q==
X-Received: by 2002:a17:902:d489:b0:2ca:7131:cace with SMTP id d9443c01a7336-2cee9b6b5edmr23000485ad.31.1784013589248;
        Tue, 14 Jul 2026 00:19:49 -0700 (PDT)
X-Received: by 2002:a17:902:d489:b0:2ca:7131:cace with SMTP id d9443c01a7336-2cee9b6b5edmr23000245ad.31.1784013588641;
        Tue, 14 Jul 2026 00:19:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm113037435ad.39.2026.07.14.00.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:19:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH RESEND v10 0/2] arm64: dts: qcom: kodiak: EL2 overlay for qcm6490-idp / qcs6490-rb3gen2
Date: Tue, 14 Jul 2026 12:49:41 +0530
Message-ID: <20260714071943.2036353-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3NSBTYWx0ZWRfXxTwJ+il8qW32
 5fCdqMr5RY5iE02DU9RpPQ2NqVBUQC9b30r5wp2ax3GoDCt5riQlZStGypwJtyQqyrFnWMFZJeD
 RyWa0qJQ7nMIxUOxw+9fnfWc1V31zzM=
X-Proofpoint-GUID: 7xqDc7U7RDhEgcwFCJO5L9FbgPQDaCoI
X-Proofpoint-ORIG-GUID: 7xqDc7U7RDhEgcwFCJO5L9FbgPQDaCoI
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55e316 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=n0mgBXbVGTAyQq78KrMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3NSBTYWx0ZWRfX2hYfFTFCcccq
 N9Daujh91+JPB2hcs0/HJwywaViWEthOtwM4DuAD/otUATRSw2Iy9/r7gGlhVqRhKrE4v5eGx5R
 qkZvmwEVelx564DK/bC/jL32PU0ZhILotNBIYLw4KiOuq9szeNI9aY/plFU2t89k4/PHSlllLG6
 EEWnJsVYA0AkzuGkES7nka6Jqw/xQgPvcLHrshtXZt7XymchKh8E4La2qzOjxsp3ZIeyICY+0H5
 bQlPjx3e+ud7GGNpPggMEEtLdXdQD3JHw+RRDDrandPH7LsD4yiI75jFXrMfdNzBHlAdnTjBcHk
 tmM2Md+LoCMfVlM+QUafyV3erpvf15h/FLVFUk0JN51mz2EqkG28hKukroIme2EbFKbegfhH31S
 QAB8zHeqryeajSZmUOKj+8yZSOlta3SawcQIO4sMLqljB1rcsRdRe041Xk9sTmsc5EN6N1b9jGh
 tCuqr2vcVy53ME49u6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118972-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 055E5751C95

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

Changes in v10-RESEND: https://lore.kernel.org/lkml/20260713160754.1250988-1-mukesh.ojha@oss.qualcomm.com/#t
  - Nothing, just  removed  In-Reply-To tag from each patches and
    cover-letter and added RESEND as part of the subject.

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


