Return-Path: <linux-arm-msm+bounces-119037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7y+WLz82Vmoc1gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:14:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EE7754F25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:14:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MTKcjYQm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZeA5Wg8k;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119037-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119037-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B646F30A965C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38897472784;
	Tue, 14 Jul 2026 13:06:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E9847276C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:06:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034384; cv=none; b=uaPdygbWumwDDYbqLQ+uKrQf0sWFaGV3IWFrIJn0P2czlwuYhTIazDEjVvKPCbuy0uy/XB/qXisfWduzirYhV92rGfSs7qcaudqGsdlTAIFCGYLy8XRT619rDHyi6FNrt6Yp8F/yjrgS1Vtk220sB0rPrJ/aOlVRc0Tm2mvbuNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034384; c=relaxed/simple;
	bh=WgltQu4rBO97NE7AGv98oHbaEqfGh3fT6SDmoWy7vMc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VbulV51MaCQlY/jFAwa00TlIZBzZ2XM8qfEHlNa5XVekkR7IhRkE4Su0HoGMQgpvFNGi5cXYdmuJZho0zYneXCRxVylpmVj4qbYRTUyMxrgbDgIhG1+uY9S3siwJzdXqg7EfWefjweIYSK1u8yWb7olMSLlhoJhYnkn9PKxymcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MTKcjYQm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZeA5Wg8k; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBO9Hu108278
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rpMhj+1GgnqY6rP0XzyhWl
	Qv24rH02IBFpIK/76iZP8=; b=MTKcjYQmbseSAL/DqSWgq1Lcb4o3w6tbZSi0AO
	vxa5eDqHXoy4mWAi/eit7XHTzCCy1zAQZ5H+I+70riSFAZ3JAB3VtZLhkycLoqJU
	ya/PtyDM31WSRMhZSLXOKKaJ8lox4tKpPvIw9JHipuRVprd0eP0nYlKT1IsUy0U+
	E8eUV1mNC89Vn0cSNwZFg9gfPPcxAvR0w6Y5z0/Xjw3V3bhDgzqdhSLF9BMlz0Oc
	StKq4pYcsni5wKicabs3AW4OVIkA0siW7qve2gF9TQrPBklat+gj+1dPlKtX86YK
	wIcjUQFeZ8yUfEnCqUOPpGzxjxHX7Yh87lLQP0a/1lxK9l1A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdesa9rda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:06:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c2af04aeeso12606831cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784034381; x=1784639181; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rpMhj+1GgnqY6rP0XzyhWlQv24rH02IBFpIK/76iZP8=;
        b=ZeA5Wg8ko+R2dpL7ZyBjFim+STd/e7vEkdjAN/EvWLX6SuIEzbZ3IHjhz0tu2uhliv
         6VOQUP4UmhQtPZ3xnp19gmKbfxsGVhcxlgf0wiHlD6vUxwWLYMJ8+fG0tYOTzusa1vBc
         BqeqCyWTWKfGE15cJHPHqqsMuWDNCaYjfRC8cs8Y5DucIKzgqc6jovrAgsvqFzCi6b4u
         WcBP6QSbK8kuXpS6PydRaqFSChguPzvwoW/P+Bi4fa+nMK3W/R8dLIFX5U0IwpuSwCng
         A2N/e47hxVjA6/UlYXd6g+aD1nZLO6QF63PFfmoIlPepq9G4VWoV1zyFnp52Xf2sBvG9
         f+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034381; x=1784639181;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rpMhj+1GgnqY6rP0XzyhWlQv24rH02IBFpIK/76iZP8=;
        b=bso6ZPEB+x+b5ut2DNOhdzpt469IKikczM3EzQlJ9iJsMgeM/kw+zSGjR4FMRWKKO+
         D8n76J6bdTMk/y+H2MgPojqSOeC4AkG+E4NwSk1zhMUrP6UUtsNFqgArokHGHvmK9TTW
         LAyzEzLsnDyG9BW7Q19aWkY453KNIvETLGV01fpeQ5rAdylUmqvSfjKA9oUB2Kv/0JQV
         ktOAzHls0H/4DWLAjPfiuh0Jk0nkL0T4biXszJUK7FOg8Exu9ntiiJPOv1oCHd8NS2NC
         klvxrfZOY4MoF5zAhBaa0d73Onih0LT+uAjjFWVq4uZMZ62zk7cQo0Hqfw2+0ITwp2Wb
         4Grw==
X-Gm-Message-State: AOJu0Yy7FG092yzZ9FGjPKk8KfNzrqJYY9eDAcRkJfmJ3Ga18SbOyH/S
	Q3POK8d8FXU19kaZGf8H6+p3PTt58W78m29bakmJU3+xCbGtrsGtZFWPNAXmnT9FniYttfGmcKm
	sZli39gCHppJvJ7fpd42GP2etj3TWqZGO8fIJqycHiNM4MNHMssfKrnlabjsujdqWJz/k
X-Gm-Gg: AfdE7cmPl6Ru2UIlZ71dbWkUx0Cd6ZrCb/j5gCqCqyynAAj9HFzwAZ14Tf9d6GCOubc
	NScP13tpOFUFZqrxcze8uHozvphgTZ1UKRJnpgHxJpkQ0h9xvmJs9m651FB4FMUuPujEk/iJlsx
	VdrFzTQ7iIQ06WLExM+jFxDVnn8O320auGhdboH2f4lu2Yq6mwf4NNiiGlB42d5Lcya2OWErXaq
	49IulEMUCziX1aKskNuoHLrKLX6/6ogYG+CIIYBFHoXHtOf4BhOhW+sm02Mm85ftTxizhTBm/wl
	8nHpkhqVXBPFVeZMQxHRYE3Lh83NgWQ1YRj1454jktQmVhIxDOYkY72QsNpJOU+/tGj40qhJ8xw
	DhqDnIN7qakweRzU=
X-Received: by 2002:a05:622a:95:b0:517:c65c:4987 with SMTP id d75a77b69052e-51caa128585mr180200441cf.22.1784034380920;
        Tue, 14 Jul 2026 06:06:20 -0700 (PDT)
X-Received: by 2002:a05:622a:95:b0:517:c65c:4987 with SMTP id d75a77b69052e-51caa128585mr180199951cf.22.1784034380380;
        Tue, 14 Jul 2026 06:06:20 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f47688f29sm6323742f8f.21.2026.07.14.06.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:06:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: eliza: Add CDSP support and enable
 it on MTP and CQS SoM
Date: Tue, 14 Jul 2026 16:06:07 +0300
Message-Id: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD80VmoC/yXMQQ6CQAxA0auQrm0yTIiMXsW4GNuCNQo4RUIg3
 N1Rlm/x/womScXgXKyQZFLTvssoDwXQPXatoHI2eOePri4r5NHwTf0L5alLxMiMxDag8yE0XJ8
 okIdcD0kanf/ny3W3fW4PofG3g237ArHhQhZ7AAAA
X-Change-ID: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=915;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=WgltQu4rBO97NE7AGv98oHbaEqfGh3fT6SDmoWy7vMc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqVjRF7g7vH7IkSslpwwpm7/FtXO6GBekSwfL9S
 w58Y8FdBTiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCalY0RQAKCRAbX0TJAJUV
 VibKD/wPoE8o2OYe7esii9RZ/mP8uhAPDBv92KXNwLrG+x0NhtpMZFq35bMZV3mjdk7AIpggFB2
 E/mInJKtOxrYVrIbKcIa8n3XEDII+BhbHUqmdm2xgLXUMM8TF31RTUDqJOBPMqewUYhOqLpN3xf
 Jv3qso4Hrc5OJVFpjnly6EE5ODXgpFIGrmWb5CU12cRANxpOopqsyuOhkr1CjSCSXcY4UaQLLEU
 rN5JUpH1w0uN52G38l70TmScwujDVoBDtVceDw6xo1Xfb2fVGl5zDQJ0tWXb+U4x8YuZoTl6tLe
 KQYqNwdRB+u8CJWgzTq/WujZYV2LAjaxRIStzBI4VuAc1XwIwvlv8+8CykhAdAuTkSoOdIu9wan
 lYYiK+4rMVBXQ9uwoeKeZ9j51/O4ZN4NNc71K7ZGKxJaDwxxOA6/t8Rk75vMPkTESXJd1KzyCru
 s5bfn1l0iswd3px0A+PXs36te3JOkvY4vVWt9hE9PNEGc9UOKX6dn4Wtbk5dH3dqzarcj8Tx5KF
 idQXaHEhqzTwcd07lFXIhdgIXYZFnVL2GByJXNp+92yWHa3nbvR1myFyC9AWphvfyPhewU8swXD
 L8GLhtx1MZDYkZ48G6XPeR2EiSLPi8MKau2tm08Czfc7+TrI52eTOx/MCbhrztG6CSGWMcHIcdu
 X2ULzS8BhK0jAxA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNiBTYWx0ZWRfX1iRzXIWHZMal
 OuodY6yTjeGVJij0SAOEM1q+p33DUIzH6z+aKBd35yEKXg40Nylc/DGLytG9LrvZjCL61uczm/3
 X5WcF94w/OtCjJVWDLdWXRpggHhECH4=
X-Proofpoint-GUID: zs6OkijTy81frdeWxu33QF5jTysa_y7O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNiBTYWx0ZWRfX4nrx/H7FrO8p
 gxiDI/4ckNff4x9CL2lp215I1/d1QyJuOwCo2tnqZKLw9uLYW0x7uQVgnEYk8ymXqe5snveYKbo
 UjDlyNyKnrozG/2ogpce9h9OBGwsTS/jVz0fGgdPFaJJlsFHcJ+mGza8b6MB+PK1eu53KSNp3yo
 faJlDxysgSUZhkcgGXsyb7zEq+uwpuZq7ny5GPAr3Z2AjqWk1vx/RIkYJzKT2/fCd9pXvle1qky
 80s4n9czECQVBMZ89paTdx+RRBviz4NgmPhMbpMs90EX54IDGhhI7I3zRPqybyyGe5ey3kMsjxJ
 yWflKck9coel2a8DRYxtvB/7qI2ZEGF6kwcjPrOaktYJLui48sisLua9C+A6DZI5GjnoiHWwYIg
 U39SaU6M1a8QiSLs4OasGYPSRhhYXTmSNpOoAADt0KsIomequAITTSdv5LNKGDHGoh9WyiAJJdy
 oDUFiMuql7+CMZoljEw==
X-Authority-Analysis: v=2.4 cv=PZLPQChd c=1 sm=1 tr=0 ts=6a56344e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GS9eBAP2CcFxjFPammsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: zs6OkijTy81frdeWxu33QF5jTysa_y7O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119037-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40EE7754F25

Describe the CDSP node and the related SMP2P, then enable the CDSP on
both the MTP and CQS SoM.

Driver support and bindings update are here:
https://lore.kernel.org/all/20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Describe the CDSP remoteproc
      arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
      arm64: dts: qcom: eliza-cqs-som: Enable CDSP remoteproc

 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi |  7 ++++
 arch/arm64/boot/dts/qcom/eliza-mtp.dts      |  7 ++++
 arch/arm64/boot/dts/qcom/eliza.dtsi         | 64 +++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


