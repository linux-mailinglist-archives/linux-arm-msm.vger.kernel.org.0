Return-Path: <linux-arm-msm+bounces-108794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEH8GIHMDWqq3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:00:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E83935905A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 97AD1309A851
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C663EDAB7;
	Wed, 20 May 2026 14:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="coCyPRsk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jy736gtn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574483EF65A
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288700; cv=none; b=SSf/9zExTFypGZf7y+w+GTeotHehoKA8d6LelqoQv4ebWmU1gyzHqP4Mc5xiFgbBPEAhbuZzfEuaWGUM4eXt4TGRn2LA7q13xvoy2Fzl63wvKZ6H1gmXCZNX6vkQIWKg3gQblY+aMHeXb1VF/Q9d3RW5xok6TrEbnclr+s14ayA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288700; c=relaxed/simple;
	bh=2ZvEjuy2Z2pk8ChjGlcTOYKmEPN6QT5mYQGegDBtU+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RebUZxaY95ZXWj5BXU2QQF4Clle0oJc17/wfLXJEmgIhQfxnKkYi4Zn82Vm9Vuo40Gkd6+xaiSOHJMlMOtegfHQvT5llzUMg4cTuGppdOQy0sjn7JJ2xrXPp5fIDv5hItqNUWDPn5gwwyeK0aXijYSKlFW8bkjrA3aZrJO+tNzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=coCyPRsk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jy736gtn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDuSIl3680289
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xeqmVqS4sWTzNC5Ka5lPWcTosbNT5mxXRMsZpQCt8rc=; b=coCyPRskEV/fxgS7
	HkcT432VZ03i/n3vjw2hwqdbupn6FA2Xd2X56hqt39oCUS5AAvIY7uFVIUOfg61s
	kShVE+ZAfSMBdoConruYqX4bnXq0OPzhIeUDpQU4zxPRUqbKVBTiCbcDDUQvQH36
	GvOvKTsMBbPboJbzlR5ZAuNA3ZSDIz9O8/B7XDrwd5Fdx4HoDWS+/7p4S923gMGT
	jdGCh9z/FboxLhpgki6cxH4LIncy7/U4jLHH39uYQnWwolPFQEI4sPza6UWwh6NM
	plqto0OXjgLbSahD/lgBQmPDB+ucekKtz8f8FvgvsM575c+WmOeYOCnrECbCrYha
	XrdmHQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j07nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:38 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95cc77982c5so7470218241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288697; x=1779893497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xeqmVqS4sWTzNC5Ka5lPWcTosbNT5mxXRMsZpQCt8rc=;
        b=Jy736gtnxBG/zrNirbvwFEOuiUP6nkfvIVFarwoBQ6MjBjWrfOCCZCF9DqQGt+lcio
         HeH1Izx+28f5yFeHEG5zZdw6z+5DHcSMQv6Fnx8u2DvKV/iPvJA44DX9wSXyRg6cSbo2
         Po896fN8X+D1k2ujZCLbL6L5Bc4KSsD99eE7L41nyIRmBYgoHAGigi5xfW14xaOlexvr
         ifoi6ILGj8Q/igZs4f/MkLklTS07FgnPMprH65C9MVN0bQWnaUGSbwrHrNe0Zl2FZn5y
         Ev/GuzHZdTI1TS0KY83/KKvTw1oyIWdlvsri3JkONhj5pZqhb7PHwlAhPWr2wBZx7dZH
         aboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288697; x=1779893497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xeqmVqS4sWTzNC5Ka5lPWcTosbNT5mxXRMsZpQCt8rc=;
        b=JE8JKY5vBWwtmXyZ5Peeedpb3M9n9KUcJBzY5h51HvId8uQ2JJ1R7WgLsPPGVgpVJ1
         nSHmKYzAVA7AVXMaC38bVrgFs1OiA1R5k7wvHLCTrIR9Np4fnNChW68XrttF6VIatfDg
         /kxwKEKnnVrV5mlRIxWygE6XfqafhR5qJEqRiaW/2S1z/TKWIMw9g4837i4l4TPG+fcN
         yYid80iPVByiKJoj8/eirvs3W3tIGa2vo6ENxrhLZTh22H0YbUFIUcwoZ2CAR56hfIDH
         9nVEDOqjwDuLP7T4QX5u4ThaG7qBD+Cj3noOQx3ujXJGEY/igY3GwUUROyD7p+MXLKZt
         88Ww==
X-Gm-Message-State: AOJu0YzFyk5tj4Bqu+UAi/dfUN3VAAD89ymMwQsLSEjKe8WB90tWqRdl
	DDn1dv3vlP0L8PTWjwVHncE42l/JNRT+bax12qc5A7qv6I7CeR8Y6rqw1YIL8k1qMAzgnXGNCfe
	n1X6LJDHty+d8zdCHcwSSTDK5bkoGFTFOeo9zFe4hwOTGHaRH3eWZgN9qVAUYnGsGfhMZ
X-Gm-Gg: Acq92OFVDpqPlG1R2pstrMuvwVi8ikBySOvWpSBAYX6Y5SI9M/0yfN4FEBpVpBZOwUt
	phJzUOGOpXh6eUNM195J6OH1S2vpUQnSblWAgjY5ccHR40I9GwaWU9yFY/ML4n9AhyVJsvEq1Ov
	fncRaSFAb5PydFzLuiuWFQmp/+IHnUQtoBe0GCR2CUvYbFuu020a3vQnvSE/gJ9gpVogMhMbq2s
	nMfRgE+SvWk+iWXhU9hH9o2Imxqc/ncx9mbO812PS4SLiKCS4JbtaiCQfcSJhU8QhouSPJpvAAH
	GfS/DW4OQtETR4W7wCQ1QD4v09aDdGW7qlxCFGfwZ/trAvwhVWLLMPaB7knwzntd4V5kBsBUTF2
	JTZ9fLxrt3+uReZ0u7qrF9pqPHIXYtsDFapN9JCPqvbmAEDiSKrQUa4zD3TZG9tetqE8nV13iOu
	QqfjbXeAlnus4n2YiqWpYeRI9bfGV4F6go5+gobCFhD1TjZQ==
X-Received: by 2002:a05:6102:3911:b0:632:b111:965a with SMTP id ada2fe7eead31-638b70ad67fmr12317894137.11.1779288697534;
        Wed, 20 May 2026 07:51:37 -0700 (PDT)
X-Received: by 2002:a05:6102:3911:b0:632:b111:965a with SMTP id ada2fe7eead31-638b70ad67fmr12317880137.11.1779288697109;
        Wed, 20 May 2026 07:51:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:15 +0300
Subject: [PATCH v5 08/28] drm/msm/mdss: use new helper to set min_acc
 length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-8-72f2749bc807@oss.qualcomm.com>
References: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
In-Reply-To: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1832;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2ZvEjuy2Z2pk8ChjGlcTOYKmEPN6QT5mYQGegDBtU+w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpnSg3pNpgwzfEh3V7TwPJgChmHzrCdBHVlJ
 +Sw3P6JQ5eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KZwAKCRCLPIo+Aiko
 1SqkB/9NDgpTEOuwrSiBDqeuqRiL52qgHqQllHdru+mhQOQicKMM6zdSJI+7VvIocBy//xCl74O
 oOkqcYdCdaSvEzPz8sA9s7VozHF/6S/Kx8d+quZkRoiaHL/6oir64aR6ArfQ+gqn9m/Hsmn3Ro2
 Ff6hM9riHxTUfWxgbhRoek0yP+DLvqdVxvDIPoSMNjgtaMSoNYzsjMJ1Ii+qUBdU4RYORk47otR
 7tC4TrtIPVtlC4Oudf4bunUD1AnRBsDaV5FcHZ5bSHxbeIP9420EujU9ePdMG1LM1QQ5xekRSf6
 kBMz8RQCidexoZacg25miN6pyKOGkWvkSxaWyd36tAPMQYpH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0dca7a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=X-e67srwgh_QgMMAbO4A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: OepMWvy5qJRMQeY6bDmXmgHFm4NB-f9N
X-Proofpoint-ORIG-GUID: OepMWvy5qJRMQeY6bDmXmgHFm4NB-f9N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NCBTYWx0ZWRfX6bRwovcpvGs7
 LtwIztY+Dga0uOr1MSPL1VrUy4MtcvBwewxyCo2ltRY3QNiZ0C+Op1o7FaE0/B3wDOMO8GKENFC
 ODyjGqCAs5kv/DsysSmiM20t+op7lPL99sydbeejXaGATmK/5I3KNeluYuOaCMWfywi7riHuNYU
 a3gxjdlxtVFg9DyiveFcSLf9UGjm5K7N3uUlYSb42RaA+PW2W/DvyhsuWgcPkdNgeKEso/futio
 Xacn3LZUVe3PuR4AH7BiL21i0GaRP0CqCXfE78PG1TRwjSWOceHwDjX0PHh5gZQfqNoIqQVF+XP
 RegrP2ohM2N+psvLlt1PYZnhFa/cLL+Qyimav2uMM7ihIXMLXx9p38jRIx7u3iXiQHAga6YMQN4
 5TyxA6EdSYIBcyXTMQTd8iXeh6iliynPdiHmDgbdazJB8PDPkfJbJe3n7tnIqBScqfM7yHHwgvt
 67Km+vwWKOPeEw6ExXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108794-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E83935905A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 229b47415f29..9f2b366d45fc 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -172,8 +172,7 @@ static void msm_mdss_4x_setup_ubwc(struct msm_mdss *msm_mdss)
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
@@ -190,8 +189,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 	if (data->ubwc_enc_version == UBWC_3_0)
 		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
@@ -209,8 +207,7 @@ static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 	if (data->macrotile_mode)
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 

-- 
2.47.3


