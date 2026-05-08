Return-Path: <linux-arm-msm+bounces-106728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKQ0BeUz/mmHnwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:05:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A98CE4FAE7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 97392304829D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 19:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367B53FE65E;
	Fri,  8 May 2026 19:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZoiccdI/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="in/Xikor"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3237421F1A
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 19:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266962; cv=none; b=tTV/Kcik+WyIZVMPCNNz5nvXJlfyO1dACFX2Sc03pHKDuq7HuiNnbbd7bExck80WAeoA47Wfe3y1YZ/RbiMWurgsCjeIOPLbI4eKvQvDEYQ98WENSwH3ozIja5MT2rShIM6EC9JTBsg3DG758clzJ+iMOE6NwxRlpMj/1VReMhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266962; c=relaxed/simple;
	bh=DDN57pej0y3Ltf0ub6QCqNvBebv6aWZer0W3ArGFCCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O444wrqKYGT+bVXkHlC1l3264RSEUZHxx3fdb7Q3LdGWD63ENzAJrs0pgzUbwKMZmqQB3k6bgD/x9tfg9a9PyR2qr7LooArsAvdZPyDcG4aqJqsAsJ/9eWSYO0tSYnfbsfWXQ6SC8+zTl1/bmvAs4rAU2ShVvA9ES4yeIJvQ9c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZoiccdI/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=in/Xikor; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G2uNS724321
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 19:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VUfpAIf6lAkbIZyifhFThrqlqNv+nw276Cn0YLBJZDc=; b=ZoiccdI/+SBIEzg9
	A2Az9oCQElFc7yNejZdEsCIJ00/VCbC7tpKnJV0Iph/neJL79RUcIET/iB/z1FFC
	ryIiON5IuNMqTQZe3IOdbdtZeuZ1pxS1I7edrAyL/ltzeUrtXcrfvX8iBJGOIvsI
	XbHA9tbvoCTcZbjPjYEEsc5YtkbhaALxMmqeefIiRNNEttS0lFHY6UlsMX/Aoo27
	rwBMj/u9a0RhVm0wFO98NckbhQfOYEShTpKQCh8wJH5UQTHfRCODU9rwhCc7O7o0
	J1JbuBNuEKNxXepUA0CPJgqQf+c3TheZw8YTSDpOig/F7/Q3swqji/aYYwv4W/D3
	NZRmUw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k0ugms8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 19:02:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so2746409b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 12:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778266959; x=1778871759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUfpAIf6lAkbIZyifhFThrqlqNv+nw276Cn0YLBJZDc=;
        b=in/XikorPuEIbIwV7jJuXpYHMVykYDCJO10aZCs3pehZtuXYavWgA52epmMgNxgsvo
         cNduCpsKMKPJaXhbntrcl/psrvoWE0rFjTaLw+iIgFyd35Cz26oB00P348owCic3xadp
         U/x1azZlow8VWmRuMdz3IhefmjbkjFXAI1zxqq21R0Oq6ta45HGB1gCA3XQGSbd9rChT
         j3HAXzkIN6B8ydjm/mHoii1QtUVRzvMLADZE3QfYJert4URKhcSQUpzU/SP2OSuTvBkL
         MLAvDTg15d//JXrmhckTsuDlyiFIOSIGW+ldeDnHrh14QWAR6Sn1MlWMX9jUGgdQ0fTO
         vyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266959; x=1778871759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VUfpAIf6lAkbIZyifhFThrqlqNv+nw276Cn0YLBJZDc=;
        b=tJFBlJSso1gVNxlpzMEw8LwWlReRscB2lLoEke2lIFmPk1N6/AbsnJrchdoUJviLUf
         tC64Qza9u2SBaMWupB2IvX2MtbXLW2sSyZ0bhChY5UNR2Zx5aPsXIH5qevRZUX/xU6k/
         C6b0sGPBOzMj/eLIvzmddek+mR5/j3mHo4zZqkJ57ARU6pUbq+9h2mPhUlmGySbLt2bZ
         SRV76wYxmKj4oqZNXd6dQ2zLcwCn15JMKXbHVrM++gpjN/KypAVGjj0QIMB2uhoTtcz7
         vP/u+AtiJwh2MpVGFlMre912yWCPA64SFHCM00J2KN/7hWk+6h9uayiEChKD2lSB8m6o
         0d1A==
X-Forwarded-Encrypted: i=1; AFNElJ9Ot6KXA7qwG3P0+I3/zJ7790YULUzyyrc/i+lhXw9yYqVX1cHTFIlA/A14rpC7aBq59MI4wleHTyLbhfNO@vger.kernel.org
X-Gm-Message-State: AOJu0YyGJdVQCOjlxW/vowRaUgQ9f7z3/mZOXqBOslDPrj+5qnw4fY44
	7fommTPZ86ektxm9HMh5rGe1pdscxjKmTFBuSdDBightqE+uRnrd5hzxe0eiyaQsmmWd/9u7BO9
	ytuJjehUT5UAAL+2aCkg4lWeStr9co+ZSwQJoVd+1nV09YC5NxxMPBxW1GFGtjHqnbeB6
X-Gm-Gg: AeBDieu/vc50dHse6QkJ47SRnV8nA8U195c9OBZlew1Lo2DY1O68DNH47ozNH0ToKPn
	NsSHfrz1n5Xw8dKy7c0mSkJX5QIQHCIzX01/zUqTNISgEPKYhGAZZI98tb1RoPsoiw5dzqjPMRm
	3hE80J3wAlhLqPZ08JhkUG2/axOn7/IS8BoV/VW2xHiIqHOKjQ3MpqW60vVUtpYBFhRqmReTAwV
	LNeqaaDMa90ubvFfLkvV0UwB75xLxRQNJ+p3AmtKW868pILwSZEOeWz8QTiMsOsDxnvxbUfeTT8
	BNxPa2pHZIXxLmanAbPdqGxQndbrihdCdp0WdJnf6xR6xRt3t0JKLhBNqoHwuGJ+glP8SFuzXW2
	eyij949cfzRA3ukJiYPDsul9GVGm0qTDhnDFqn2bBYN1dbN19FHzwW6E=
X-Received: by 2002:a05:6a00:4b05:b0:838:af72:fb2f with SMTP id d2e1a72fcca58-83a5badbd3emr13466860b3a.6.1778266958762;
        Fri, 08 May 2026 12:02:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b05:b0:838:af72:fb2f with SMTP id d2e1a72fcca58-83a5badbd3emr13466823b3a.6.1778266958288;
        Fri, 08 May 2026 12:02:38 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm13395550b3a.19.2026.05.08.12.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:02:37 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 09 May 2026 00:30:03 +0530
Subject: [PATCH v5 14/14] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-glymur-v5-14-7fbb340c5dbd@oss.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
In-Reply-To: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778266845; l=761;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=DDN57pej0y3Ltf0ub6QCqNvBebv6aWZer0W3ArGFCCk=;
 b=43GoEfeonHscvF5G4ZYHZZNfYPeq/aygoPj0v3/hqMHX2/+nPmJQ3WoIzvOBrug9x+yhhPKtc
 JFr/KTQrnkQACNGBhNoUj3l1N0rXNSwZa/klt7wlr+TtOon2nDNgQDS
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=dIqWXuZb c=1 sm=1 tr=0 ts=69fe334f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Dn0IJEph4XI5J7oltBAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: s3T_eG-uFEYMKQRZSXnp-Jzkkj9hkh91
X-Proofpoint-GUID: s3T_eG-uFEYMKQRZSXnp-Jzkkj9hkh91
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MCBTYWx0ZWRfX7AMBaijwpjjF
 5oI1pMx3upUyxaPRgadm5x1eTT85U0cGwgNlyqx4eFJMSb16+XIZ3/eV9gmeqvqdXgtsVJDHwmb
 vkR8KyxyU23XpxdMK4+zkVb5qSbQVBlTHsq//gfqAY+SuEL9g71Xj5e350tRK5ASRzE68jdT9im
 FHKgthybbwR/ujCujtgBzNX3hVMcHKoG+D1OO1hUJF1SAdpkONrzwSQa/aKdUHbhfIK4V9Izom4
 kyve754p1F2ZVClX+8ulhi6IuDevYV8D0k2OI5o3CuJ379EzQW2EBzDGuuSdNjKP/zgBz/aax1g
 kVva7N2wlIABLNdHhcbtDTsoFOSRA1xVI/Af2wE44tvTxBjt/5hEyBqny+MkHWv7Od3iuX+ZSnF
 Zuox9kIstE7AIuGwTZKrvcQNFCzRXw5BmrYNpv33bOPiqUfCmJh+51o6fwZS7jgKYctmxXaGMG0
 vB7H6YLuc4cxpsvp1XA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080190
X-Rspamd-Queue-Id: A98CE4FAE7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106728-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.47:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 35aaf09e4e2b..8d6ea857634b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -198,6 +198,10 @@ ptn3222_1: redriver@47 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.34.1


