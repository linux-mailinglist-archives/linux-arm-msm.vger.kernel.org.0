Return-Path: <linux-arm-msm+bounces-106276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BPiFmo2/Gl2MwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:51:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A324E3B90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDC6C3033A9F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856CE373C10;
	Thu,  7 May 2026 06:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/ckaxo4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MJEo9JQX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9496235F60F
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136167; cv=none; b=YiyOtNHtuMavow81EYGvqEzQqx8gBKqQ0Zgwkx9EmJ1UIut5IzmtZPX0flKkFInocYonEb6Ekhu64FhZ8Tp9xxFQOEl6XkoKo+d1wkrv0OzosT+pC6Pj8yiruIzKqiyU2qZdbLCoAsdQlpingQxJWHktlplZCnLCSz4CD4osj+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136167; c=relaxed/simple;
	bh=UiyU2L5PBRVSZqnioCJ8UBKUuINJuvq+zilFpwfxTpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TqTM8eUidjyOF2FeKowIgvkTb2DTumFbFZYYkKvzSXLmtHSU256CQdmdiGP2aabzoo1BBmrQDdhvLm2PV+gXjx5WKfD739o48CsYp+Yjjb+X4sfsYZMb1dpIkWOfLam7Xh1lXfdhgTYIMaMH5wq0k5AxhWdcEw+0UCTbPtWhtyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/ckaxo4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJEo9JQX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647444jS151029
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uP/7DJbBJLezPmijpydT4H32rrWZ8zWH5pgO/YyQvYg=; b=i/ckaxo435Lj1oP0
	fDNU/DOx4i5czp5xdt13JD/s/uJC+kyt5L0MWKucgvTAnPFLaJPK8vGKXhKST5J5
	+W9P64RHEcyxCvVkgsWIxAVsddsvjQ0vHCaO76XDjvGM+x+BqwF6aEt1oQbFOF9o
	3GSopI5+nnGWWH7RC/A3uca1iVaSHndmf5iKyJggb7m2qUdbd4X3+mDuCItixCsc
	81isHHQ3pAzqorS+X+KPnMPGgW3JR+IQh35p2pROSEzyeimpF2XloukcWGBp1gEF
	7TCbHzO52navw3mYw1PFkfA59pZt36/vOWSexPAoNB7C4S4FyD4i8xy8/bu9iTVk
	dYEG6A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctrgfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:42:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51009190feeso10525611cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136163; x=1778740963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uP/7DJbBJLezPmijpydT4H32rrWZ8zWH5pgO/YyQvYg=;
        b=MJEo9JQX0m602umPJR3pqx/WFDfXIDo+4h21hRNi1IUBxkaATFqeh8WWnn7t5gnm4H
         fIlncurcPfmZ3ZhwrQcGrfHTVLxWXJX2a1l7hBkiegvBiyB77+k0jjp/WrCiT0kanPpQ
         Z6Et7R+2XNccuiKXlE8i9syTNmdzGu3xtgMe4tJrYjo/g7rd27k6vfRbBYdYbXq+wodP
         9W8ZWzn196OlL5PR/1gpr+ohe2yq54rwbR536RGxrEmMk/rLGkNgcm6nVrOhHtUWfTLA
         zs02BTEVT7Xf4yKjvZRzZO7yfEqe3JRocZ9cz88vETLZ1DegtjijSiVhYY8+RDu8zvpe
         OYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136163; x=1778740963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uP/7DJbBJLezPmijpydT4H32rrWZ8zWH5pgO/YyQvYg=;
        b=C4nY8Mgp1R3Uk9jGZ3zDUSNMgboVVWC8d1Tu0MeoacOH4A9Ehqbt4TcInRpwK0u74F
         MzMVNAVGsq+OfoCcSp/OuQvF1nOKLidRP3sOXyG5PJumQEm+x4G3JE5Si9f5GMrE6MPY
         KK+6MF41aBe3wkIh1wOKEVeovgVL3wAvrCuAlHN6aF7YZx6m2/C+kusSHKk5Az+/LGS0
         9vhGy1EKNgzqR5NmpjatjS8X/GqKdhxYuBVVdv17f4m73Nf3TtNiI1B3/M4/PVo0IYJ3
         bY3zY6xxnZG2asUjvq50pmJMcFaaIPh3NXIcGXxCSQaqKLncv3fmJ8sw3OsuaiyS7tGM
         LxUA==
X-Forwarded-Encrypted: i=1; AFNElJ+9ODcm6JQKqENLsC8mXiQr2AsYRSRQw08IfCV3ACbcAPoTKWDOWebdJCCjOJ99ldcvH2R6pimauoBxm0yw@vger.kernel.org
X-Gm-Message-State: AOJu0YwkL9o7w2f6Ys5oVdqIQ9D8nESqx4ZyccLT0DOByC0kBkN/BAXv
	TIdF1G1wwcn4gnngORFJJrAvlIKmfE5YxVj6FG5aoTbvvFIvmSHSc5WcB8SFdheLRHV0iu1ECNV
	eF4BposvWGh73WjOKHskRJu/Qmwjj2eYv5D/CIGM9pCNacdeLLqx39whshxZETumssgOrNcOC79
	If
X-Gm-Gg: AeBDievtWOBD6Ahfwl4/i49v70d8zqY6YrlURGJ3WzzWi9GhgC8s3ph7LSBVAlEOKqj
	XEK74cEQhEsDebev4oZAMM23ixho3lWrtZT+oMnItIHyGB8CrjBMTU5uJLsBakuWaCr2c4bkfkY
	WQCQfmWEifu3OhB7fK4DAHOigBJBChuXXvdb4m2ndBVQDGBhdKqlmx5hvhxKj24o20LnH7MLUjA
	kmV2VLJviUMVWMcuChchwYXnthG75VJ19JHg+rVCH4TxkEKnlU/YOkNUsXkoTNs9x3CjOYhgn98
	Chr6tBgV0/bCObu5/b+/5JFYTp8UDcGf12RChBOLUubTIDJnl1pw3DnwuUT4rRIwiUiKrQ9xtqE
	wWsDsmt0rIjWqHSvV27hZEYyZ0dWEn74t5wp0X5vj4wzIZajP3S2qmPmbIDK4r9EoXrbX04eP2B
	yZQFA9HYIkFKEpEFges1AdC+2lZHZVAyts99wRAKIv8AdLm+jscV3hbFKm
X-Received: by 2002:a05:622a:4a16:b0:50f:817c:5d45 with SMTP id d75a77b69052e-51461c28aefmr85725921cf.23.1778136162832;
        Wed, 06 May 2026 23:42:42 -0700 (PDT)
X-Received: by 2002:a05:622a:4a16:b0:50f:817c:5d45 with SMTP id d75a77b69052e-51461c28aefmr85725631cf.23.1778136162356;
        Wed, 06 May 2026 23:42:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:16 +0300
Subject: [PATCH 16/16] arm64: dts: qcom: agatti: add higher OPP levels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-16-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=986;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pmRxEgr+Nvi2Lw0QP3FluQa801XHFjmueooI09g2R0s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ/Xu+8kSqxX1D/qHs5fEXFlfc1f/wFfPghu
 /LGQY++7WKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PwAKCRCLPIo+Aiko
 1V4XB/45ZlAHeOn97WZC3jPb2WpiP1oqa4VW0qY9GdaVUo5HSeDsPkaJfhU3+Ya0a8bTg5wcAAz
 tx6lV197e8QI/hm0HhUpv8leK4ZJfqthPjBRJ35sTRKDJlXt/SVsYX8Aak07PUynBdGDp6uQTln
 wZDrd4DtSxaZAAg8OA9zEfHNlym9gDxl9YkFCFkvwxlGsD+ME0bBoOtPwdaGhGGGCQYeuhHuFnr
 S2OxmT6g26w65KKyhFAM4CnbhH519R+qOhrRvDL5aKYrqJmL37jVYpQ7eWQAYYgROGCva1JSDOz
 4mIAv9g7X0eYe0S1rmFx+AoU4WCbOEnvD7i2P8KtswP+J7Zl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc3463 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=UHPahDyPz0TdaPj93UIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: QCUTZS5lVMz-4DuQ-4nTpux5nUu7uSBe
X-Proofpoint-ORIG-GUID: QCUTZS5lVMz-4DuQ-4nTpux5nUu7uSBe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX3OfZjHXY4Ydp
 xWLxhE5L3aRf6/Rfz70e9rVxKWguEHUtRXJJim6dLoqXGAISw5T1/h8AAhh8whUV8asnSG8L2zt
 RmukR3rSMI+C2NdJPS86n8sOGg7eRfbSukT/Uteu6a20oYFXjZLjdiFQSgTNI750g4arn+3pLqa
 Yn84VHQY7kSKQq7tbV3XSx529Pprv80gzR5dXoSnpr4nhFMEIxgmAvvwg9bGq93EEIY8O5vCSBL
 7afvW+voGI0TG/gXkUEO+sNzVsGs7CfcotqmShjIg2H0aPqMKnojQOcyBPBX92IYNWqnZ/5jlX+
 zVuBriI/m3uWGpS2Uw14tph9Vtd2a2I3LgNYC7z05KtGPC75yiccggVmF+64XKRYV7nlEB2HECw
 f7suthAEGdFxOu75TRtdRBLZZut1IBl9/VKJaxoLSuqJ6UF62PRjf3LpMMoCH80T2hyRNYUCxCO
 zVO7dr76PKlRUG4YrUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070063
X-Rspamd-Queue-Id: C3A324E3B90
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-106276-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Add additional OPP entries for the Agatti platform to support higher
operating frequencies as specified in the hardware documentation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 8a7337239b1e..fd40aa59878a 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2455,6 +2455,16 @@ opp-240000000 {
 					opp-hz = /bits/ 64 <240000000>;
 					required-opps = <&rpmpd_opp_svs>;
 				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
 			};
 		};
 

-- 
2.47.3


