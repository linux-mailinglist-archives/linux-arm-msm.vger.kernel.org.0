Return-Path: <linux-arm-msm+bounces-112311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id buLFJFYGKWr+OwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:38:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 769C966652B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:38:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kLMHvuiu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=R9lM0U5D;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112311-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112311-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF12230B54DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 06:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291B2380FFA;
	Wed, 10 Jun 2026 06:31:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F36D3803D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:31:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073080; cv=none; b=IFwnUPDvxHCXixSavtZTczeXn4PyYR2CsnnmhAI2Fyz6+/pQrU3cnZqWCFt6KXgUTEJR43m3/XfDUj3Y6hU4nqguNzc6tT/hfNkx82CAE9BiPDYe09HAELTZgI3jN1RHOcShKO3eGEhE+z+4nP6nF0nA8m0ykGIn8I1lv0mXjrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073080; c=relaxed/simple;
	bh=8RL3NQHK2YI6snwqnJ4TW8ew/e3wnzFaRZK8oYiIJxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=beFOJlpCdGCnL32z55ZeI8aiFLkWR+6teEhNWOtIxMM3EJdzUWjE3ImBrxk1JbvKUjhkwaSAQqu/4MWiKWDCGEnCvvSi7XBNmmfVgi3n5ajSebIjLXgrRnN1dxSc73DWQ7WoXR9r6TFePvmcCIpBHNo5ymq8Pbz86aPhPj1Kz3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kLMHvuiu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9lM0U5D; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A5SrAn689056
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DpOVmk72nTJ1YzO0i5+Q2SQdHj7Pw/d7vi0qoKSzApE=; b=kLMHvuiuQEkFOmXe
	pFeliG0Jl9jz5MBl+bwYuZQbX4lVteG26UDdyNzV1eYpFla2aNgAOo3vfeO0x4LH
	sy1iKgv299tKhJvDr4r2NdqKfZ7No+uvXITd82w4GYB3mfuAmGIT7gYgEXOAdnn5
	uyVIhvQoT2t5Y7d32EC0bR6cbDico+JNVSsrl9pdm8GziwSJsZtVwDh1rEpC1x/1
	7lc0YsaguzlRa/lPtpva9Y9rUZc3BehMGRhKsRhm+mRhvM5gHeT4mbUnOfRoLHJh
	ecAxAJ9iYqUB6BET3PeDVSGwltnch2LwyXrCAfzKJwcwCdRT3YpPuPfOvKSWRpGx
	eAnrcQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg0740-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:31:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso5993225a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 23:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781073074; x=1781677874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DpOVmk72nTJ1YzO0i5+Q2SQdHj7Pw/d7vi0qoKSzApE=;
        b=R9lM0U5DhOz7iHNj53w8jG3lir0zal4fA3NirRBJCuRVdO2StUndriEWB19KgQu7i9
         TOzbDRMY0pN3sWB1ol9wQiivy1BrLLhNfXDauJeyZVLHjjp5qM1mO1DVbaIMxmPOFRP8
         DDwfK4IG4XyeKCihIlVL/DXMUS9TtKNNDrH2nDEhWQrdJyaRh+VdyGeOYkdMuhepTdgO
         MXHpOsvTRbPTYw0gmws5e1MZ+eukL68i/kTh3LNkSCydv/y7zCHQkdj3fpvcEMI6FrJz
         Cp6qgOJB+CijDj1ArUKfKpZLm0ytyLCe3YOujnTBylKmLS2LyRlEjbZXEorHOaXMlsLC
         MtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781073074; x=1781677874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DpOVmk72nTJ1YzO0i5+Q2SQdHj7Pw/d7vi0qoKSzApE=;
        b=ixHEjm+5gYYmkDkV6Z0bCB2lI5kQbIjEKTG4qfleS+34zekoO2irHzwCEDtCK+Le0o
         KMJmC6RVLjIceJ3vS4L7eyAz02h2IYe4Cta2lPRupIK+umWc6hWAxfP8CCgL45UkAoxK
         cyTI9DtN2KTAn7fLVyvBrUDuMIu1sTXOBtqLgDS6Nle/SDtBFxoFqSFy85Y4x+X2CqL4
         iRAPKjiCj87MWWTS57GutpYk3c99GQs/hafUsm/GntHgxULvStsCWd0t6T8UtP82vzYb
         lcIt2ciK2LJVo2XkqsxX7Hg86IgYv1IphcLUmm/Moznm4P46otkoaz7RJbQwR21YpMxg
         FbKw==
X-Forwarded-Encrypted: i=1; AFNElJ8C4wj7VOIOYfWyC6iNvBaoJLKqayvPZg0u/Hl9dKe/ruX0qzbper6UYH46cNDZdcKpcixCZCho8ZTJGtl2@vger.kernel.org
X-Gm-Message-State: AOJu0YxFCExPIHh07eAWfsi01Xlvpvo3jdTpH1eU7jTEITMwBssz7xvv
	MW9TCORtIEUa+ttjBc99WvGpsMq5cAqbW1DPgw/Yr7Y27BAwBPXJ8SMyBfJAkSfyjbyD87xBdn9
	SmGw+FomfYBLM1IQFCzXK4RRf1ChWXMkTdBjzOsMfiXOBhQp+tI5OeRiiRKZxF1i9BJtgCL7ZTg
	nr
X-Gm-Gg: Acq92OEZPT4qpAfgd/4RP0pLzRuv/ofVQdLYU6JlFAXBOQN1WC2EJ+sLbyYT0ZhNdDe
	8cbm0XmkX9nBhiiVPwir8obZbfS4DRB2xv+BhJ0ttNSn4M7ZdTXXv2LIJmrTD+lJrztCLvLWiDG
	oszL1KZkLEFwMF/PCYZg6QyQxYfCY5gm+KzNzPOKcPf6Jfn01XgdvXMEpjZD6Kv9K6ZqtZieUWI
	Q4vOQm/ZWMDKUx+nmHEhManWIhZLwoczYHpw+kmXh4yBEchbVO7q9vwapJBgXj5Qrwro2jvsDy/
	OIZTcULvbyWxp5lRST01vBObtdK/0p5chxsVt8wxHWVgDQaFDuHLuoRZYAy6VZfgCsjZHLalWjc
	kjmBF5WXptgnribYEeXTCTyXEtX5T3qoniUF/JBkDBThrupHSm9pA7WtrlArG+Ig8Cw==
X-Received: by 2002:a17:90b:4b:b0:367:bc89:546e with SMTP id 98e67ed59e1d1-370ef2ebe43mr25287745a91.12.1781073073320;
        Tue, 09 Jun 2026 23:31:13 -0700 (PDT)
X-Received: by 2002:a17:90b:4b:b0:367:bc89:546e with SMTP id 98e67ed59e1d1-370ef2ebe43mr25287705a91.12.1781073072841;
        Tue, 09 Jun 2026 23:31:12 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a2892esm21580420a91.10.2026.06.09.23.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:31:12 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:59:46 +0530
Subject: [PATCH v8 10/12] media: iris: Add platform data for glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-glymur-v8-10-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
In-Reply-To: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781073002; l=9932;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=8RL3NQHK2YI6snwqnJ4TW8ew/e3wnzFaRZK8oYiIJxY=;
 b=SfolkIVTOQ+bL83+vxiwCFWgoS6FJoc+1U+w632MsD4Hx08BkpADOH9A558mQw3m1FOhWDl+5
 40Cwvf0HIfuBl6MMtW789qPkg7aFWANX3xJsVqQBI6xi84rwot8ljtr
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: XOf5032fHqqA71cDU0dCu_UwYGKSCGwM
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a2904b2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nHOd-R4ZlEoCelKQ7zMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1OSBTYWx0ZWRfX3etjnEWeRemZ
 USYtwNSIzBF7Us7gJH9ifvBkygCf2x5+8/qZopwZSPiCdol2KQH5VVoz9R4UK7RKcyae/Soqxdu
 13go5bA9q6LJXk7xsUvC1Qm5GVw9WVg5NbrRJ1PX0sdLWzDojWWcGr/q/8V2Mk4FnSWCHPFFUYJ
 W5FycvUN78zA7JtUMTdGu1wZ/cHil4U2khbUOumHbTiSTKUSHs0p5Bb0ukL/THLRIwg+Nxg7D9C
 xZGDMmZeiNBlqXHUKoJ0lSaX/w+bszblNWWg8+ptMDsRblxHghL6gqjTc2zNf1ohh3qPJlB2f4+
 fD9oGZXQouGTZZtqpu/QOcEVgHb0uIItVUZTIzQo2fDi04lzE7MIXJm3XEftaY2esJOLirXLHtq
 dqu0e1BPNVwBKKbK1POy2RoNbHr612wNEF/542dSDsH/wBt3vMjDCXbDXyfK34CdizOlXnyLK0t
 xaju+1wZhAWmngq9KTQ==
X-Proofpoint-ORIG-GUID: XOf5032fHqqA71cDU0dCu_UwYGKSCGwM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112311-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 769C966652B

On glymur platform, the iris core shares most properties with the
iris core on the SM8550 platform. The major difference is that glymur
integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
one. Add glymur specific platform data, reusing SM8550 definitions
wherever applicable.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   5 +
 .../platform/qcom/iris/iris_platform_glymur.c      | 106 +++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_glymur.h      |  17 ++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  35 +++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |   3 +
 7 files changed, 171 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 6deadd531c8e..6c45d4ad13a8 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -12,6 +12,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
+             iris_platform_glymur.o \
              iris_platform_vpu2.o \
              iris_platform_vpu3x.o \
              iris_power.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 99f59b64f853..e182030bd537 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -39,6 +39,10 @@ struct iris_inst;
 #define MAX_HEVC_VBR_LAYER_HP_SLIDING_WINDOW	5
 #define MAX_HIER_CODING_LAYER_GEN1		6
 
+#define VIDEO_REGION_SECURE_FW_REGION_ID	0
+#define VIDEO_REGION_VM0_SECURE_NP_ID		1
+#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
+
 enum stage_type {
 	STAGE_1 = 1,
 	STAGE_2 = 2,
@@ -53,6 +57,7 @@ enum pipe_type {
 extern const struct iris_firmware_data iris_hfi_gen1_data;
 extern const struct iris_firmware_data iris_hfi_gen2_data;
 
+extern const struct iris_platform_data glymur_data;
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
 extern const struct iris_platform_data sm8250_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.c b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
new file mode 100644
index 000000000000..c42ac99870ed
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/media/qcom,glymur-iris.h>
+#include <linux/iris_vpu_bus.h>
+
+#include "iris_core.h"
+#include "iris_platform_common.h"
+#include "iris_platform_glymur.h"
+
+const struct iris_power_domain_data iris_glymur_ctrl_data = {
+	.pd_names = (const char *[]) {
+		"venus",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"core_iface", "core_freerun", "core",
+	},
+	.clk_cnt = 3,
+};
+
+const struct iris_power_domain_data iris_glymur_vcodec_data[] = {
+	{
+		.pd_names = (const char *[]) {
+			"vcodec0",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"vcodec0_iface", "vcodec0_core_freerun", "vcodec0_core",
+		},
+		.clk_cnt = 3,
+	},
+	{
+		.pd_names = (const char *[]) {
+			"vcodec1",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"vcodec1_iface", "vcodec1_core_freerun", "vcodec1_core",
+		},
+		.clk_cnt = 3,
+	},
+};
+
+const char * const iris_glymur_clk_reset_table[] = {
+	"core_bus",
+	"vcodec0_bus",
+	"core",
+	"vcodec0_core",
+	"vcodec1_bus",
+	"vcodec1_core",
+};
+
+const char * const iris_glymur_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec1_core",
+	"core",
+	NULL,
+};
+
+const struct tz_cp_config iris_glymur_tz_cp_config[] = {
+	{
+		.cp_start = VIDEO_REGION_SECURE_FW_REGION_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0,
+		.cp_nonpixel_size = 0x1000000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x1000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x25800000,
+		.cp_nonpixel_size = 0xda600000,
+	},
+};
+
+int iris_glymur_init_cb_devs(struct iris_core *core)
+{
+	u64 dma_mask = core->iris_platform_data->dma_mask;
+	const u32 fw_fid = IOMMU_FID_IRIS_FIRMWARE;
+	struct device *dev;
+
+	dev = iris_vpu_bus_create_device(core->dev, "iris-firmware", dma_mask, &fw_fid);
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+
+	if (device_iommu_mapped(dev))
+		core->fw_dev = dev;
+	else
+		device_unregister(dev);
+
+	return 0;
+}
+
+void iris_glymur_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->fw_dev)
+		device_unregister(core->fw_dev);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.h b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
new file mode 100644
index 000000000000..1dae5764cb8c
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_PLATFORM_GLYMUR_H__
+#define __IRIS_PLATFORM_GLYMUR_H__
+
+extern const struct iris_power_domain_data iris_glymur_ctrl_data;
+extern const struct iris_power_domain_data iris_glymur_vcodec_data[2];
+extern const char * const iris_glymur_clk_reset_table[6];
+extern const char * const iris_glymur_opp_clk_table[4];
+extern const struct tz_cp_config iris_glymur_tz_cp_config[3];
+int iris_glymur_init_cb_devs(struct iris_core *core);
+void iris_glymur_deinit_cb_devs(struct iris_core *core);
+
+#endif /* __IRIS_PLATFORM_GLYMUR_H__ */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 72dd23dbe02a..4049e134c3f0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -12,6 +12,7 @@
 #include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
+#include "iris_platform_glymur.h"
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8550.h"
 #include "iris_platform_sm8650.h"
@@ -48,6 +49,12 @@ static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu36_p4_s7_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu36_p4_s7.mbn",
+};
+
 static const u32 iris_fmts_vpu3x_dec[] = {
 	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
 	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
@@ -83,6 +90,34 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
 	},
 };
 
+const struct iris_platform_data glymur_data = {
+	.firmware_desc = &iris_vpu36_p4_s7_gen2_desc,
+	.vpu_ops = &iris_vpu36_ops,
+	.icc_tbl = iris_icc_info_vpu3x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
+	.clk_rst_tbl = iris_glymur_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(iris_glymur_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
+	.ctrl_data = &iris_glymur_ctrl_data,
+	.vcodec_data = iris_glymur_vcodec_data,
+	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
+	.opp_clk_tbl = iris_glymur_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffe00000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu3x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = iris_glymur_tz_cp_config,
+	.tz_cp_config_data_size = ARRAY_SIZE(iris_glymur_tz_cp_config),
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.num_cores = 2,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((8192 * 4320) / 256) * 60,
+};
+
 /*
  * Shares most of SM8550 data except:
  * - inst_caps to platform_inst_cap_qcs8300
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 1e362570bb15..3537cf283f14 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -468,6 +468,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,glymur-iris",
+		.data = &glymur_data,
+	},
 	{
 		.compatible = "qcom,qcs8300-iris",
 		.data = &qcs8300_data,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index dc491a5aecf5..87a0a2546284 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -8,6 +8,7 @@
 #include <linux/reset.h>
 
 #include "iris_instance.h"
+#include "iris_platform_glymur.h"
 #include "iris_vpu_common.h"
 #include "iris_vpu_register_defines.h"
 
@@ -415,6 +416,8 @@ const struct vpu_ops iris_vpu36_ops = {
 	.program_bootup_registers = iris_vpu36_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu36_set_hwmode,
+	.init_cb_devs = iris_glymur_init_cb_devs,
+	.deinit_cb_devs = iris_glymur_deinit_cb_devs,
 	.check_core_load = iris_vpu36_check_core_load,
 	.get_required_freq = iris_vpu36_get_required_freq,
 };

-- 
2.34.1


