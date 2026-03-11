Return-Path: <linux-arm-msm+bounces-96832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGtuA7bgsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:25:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6281825B89D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 064A13214360
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA11E3370E3;
	Wed, 11 Mar 2026 03:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NiwBQHBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hajwiR7T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847B136EA9D
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199416; cv=none; b=OGphI8RZj03jGWP7vfEq/GBaNFWGs9hoUIwvlpnreg1T+vEgGIzCxKOUK0biqW996nsua61zpQ9+H8GvlMn9jf6UOjQ6iyzLCc/p02OaDi3UMoVdpYJ1K+1kp40sgKdtxeiCBLqB6J9I4xd8LkgqlFI8S0kP6gzVf9uF6DB89hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199416; c=relaxed/simple;
	bh=wXJJ0dAZpKF1rU+9v2j++kD4vXhMZtkbkrtjqNCMm+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HonPE+UajK/WfFU07sj9F53XbR9cVCZt8T0YLdiwTiAACRM/9h/lOm1LzunWExXh0SbeHvDoSObyHfQ01jrbmLf2j2dLlVT4sjhFrOFIjx9PExSpAaGICIkpnWJ2DfDWWKLhcmgjBTCur883bQFKs93J4m5TcAZj1k0QWAtXWas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NiwBQHBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hajwiR7T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B34Kcr304472
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nJxnxNjXEHAomyQpf6dxP3G900o6a7htory/+Plg2ys=; b=NiwBQHBfujfdlSs+
	2wk2SyMCW2OhIC02hPtaCwJHPhXgsFV1FeWWkSfTZyA91PhOoHiEG8Ut8LB3VemR
	qzfYACJT5sXdkaQ+kngHMAF8aBa3/aMHHIqKudoDiL7xVnsVzxGsziwEjzNzBfUI
	Wg+ehUMzaJZCkVCXJRN8eTyynCGcsxhTGNLBJSUuvaP0o1GUihAZZKdOzOFcdR8f
	wjJAp0Rt76aaNXcemM9a+MjbTDLXEDhhpjfDpRyETzFFp30GjpU1sVZ/3WlB4M3Q
	3sb2KhYQv6dg363V3YBdZHZMqTjZgQiAELUq6NBag+rFXwBv+0JcC7tNuM9J/3JM
	OiWtGA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cthjf3emn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:34 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94e9d481d9fso4870750241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199414; x=1773804214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJxnxNjXEHAomyQpf6dxP3G900o6a7htory/+Plg2ys=;
        b=hajwiR7TvdfKqhmLvQOfhN0anweM9AelUOkzTvcBh5CNwZQirvVh2kny7+aAxQPcL1
         1XG6JFLAReFhNN/kSlLrc7IIuiCMivfoYe7UIqNk/aZBpqqSD/Ub1fFYe3aq1DDkBD/F
         OvQIgCBAIw4gsnh4v96mcFHpo50beUp50SnPUsRhxFQ8LPzum92XnQHK6UTDxc7L9JpN
         iVSahrPz9ykZHxj7rwfk1p5zLYEhJaEAbhsx3s5TwPojd7IHbw9O6eoi6eNRpG4H++qV
         MqzsuOrQv8tXWL58jAMGq05otrMXjEeYXLuIxy+/Flq+eyZ5Noaol/sflhU7JLdMpgqu
         xttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199414; x=1773804214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nJxnxNjXEHAomyQpf6dxP3G900o6a7htory/+Plg2ys=;
        b=RaQt+oEc1O0D9SQDgT4YCqItNYhxIs7qcTN3jlVYyBVKFxtc+lRCnmc+O7j24nNMeG
         doqFmaOlj8HhFWez5kf+icsLLlG4m8zGC4IlI0nNUv1laJErhKCCR1++Iiqrsu0oSf2i
         rX/6yhB3blYIUEVn970FjyNRE5GW0IkkSZL9cn4Q9vmAXLaqB7n4b0gb7lvjLJ9UXc9M
         Fb20DNt2RE3Xze5HMwj3zymTzzuvgHk/p0zzYJ9rBwEhSTd7RgFzc7sCjT413/AkE9WO
         k75xgWZLu4VgaKCsufkp2Rik/nGaZTtEGZ4hPiLsJxu+Zcq8Y9AmU45U+BeRQfori2PT
         ZUcA==
X-Gm-Message-State: AOJu0Yxg01QAh4dvcWakYakG8YTH35o4C1srDt/JDCPie7mikVaO7kBV
	+T27rqeHjKTDuS9asH2TIEAd8dCJYKtQsfhwULhRUhbXL5FRfPTtn8XMBYBIZ1ydiyyDc1s18ae
	L+VhoRvdOmieQaZY3EGeRe/1ltXMfaPgPFAgyQEI2c8jIve7YEnuxJV7gSiOKFHXAGCX/
X-Gm-Gg: ATEYQzyW5dm1FBtXTdL/COqVKpp3BxvE+vrIPBl2XWT87rN3vI/eGBXAb6iZa5PdP7R
	P0xQTovlyZoxcfJ3gzjplveYBMVCYbo/mTXUiyDhHnqOhqNe5wGoAhSRVcjd2GHuLNRlcfV6j+7
	MeUKCrMrN8uQ7qTTO0PpDSbYNvkxRukDIJCKTPWmiimhp9M5QVGXysGPj33JyPTo+UuDA9Vwbdb
	ghZlUCK5cvMFLfVIgU25GHwebJTSFWL8um6j31A8H1PR9sODrnETIQjD5ih26np8xigF+ubjqNK
	TJo4eNbiz27x89/4mIyr7Q/RqAuixlLfYmplgSZv3lyGHPudMqDPol4Vj3Urr/lMPl6neQJA7ID
	c/UcrA1WJqk/+wx3uVTPEx6INy8yvL3WXX+MeiETST+6Mm689i5BXPpz774ePbHITlRA3e2BPLf
	xDIAg3mGgbxjNUHjZYq5BpiziBk+xheE9/czg=
X-Received: by 2002:a05:6102:50a4:b0:5fa:603:1d62 with SMTP id ada2fe7eead31-601deb9bf32mr368673137.14.1773199413769;
        Tue, 10 Mar 2026 20:23:33 -0700 (PDT)
X-Received: by 2002:a05:6102:50a4:b0:5fa:603:1d62 with SMTP id ada2fe7eead31-601deb9bf32mr368656137.14.1773199413354;
        Tue, 10 Mar 2026 20:23:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:23:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:23:00 +0200
Subject: [PATCH v2 06/25] drm/msm/mdss: use qcom_ubwc_version_tag() helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-6-69f718f2a1c9@oss.qualcomm.com>
References: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
In-Reply-To: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1601;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wXJJ0dAZpKF1rU+9v2j++kD4vXhMZtkbkrtjqNCMm+I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAdAoshTUBFF7gu/dmTFUGS5vZ+v78q9e178
 17nAHXN1qiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgHQAKCRCLPIo+Aiko
 1ch8B/99JWkX0Pkso2rCvaimmcGAFzKsPXaNaGGs1r3r44m4kho81YF8axNq+ATyYyXAcyPIKUV
 60g5lTgSj8etZVXDaiot2Fq05qtkw7JnBF9X+lk/zdQptaB/HkB4fS3td+GgvXtB0ydeQ72vgmy
 hO85TykY/KIN3NRH5ABVsOvP4Q0Ry/DvAZNQqDwo8+9EBftixeirl7x8ox5HXAMIy8hv7kzHSQB
 fB5yquJCe3/vJ4GzTczBHtWoGkZT3J+uMKBh3+TSDGqxSxXlNNP08SjuGQUQMcDXcY6sAJhwj5D
 pGDKhyj0bRFUO9qAcHkaBQQJLwtdUtfR8NuQGaqYo88Tcm/c
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 7bz3UGk9mam4FFNm1Pc6TUJ3IFcfDd5f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfX7dhmBi458c71
 NyufXRl/61m/bW1hekGRrtneMay1V5BHKmfZHqAJKB60XTY64AzO2nV618MlYZVBmjKZS3Yv0B2
 rNZqPYCwRqRESiNkI47IWl0MEHw/e2s75E+2eyqUavQ9vCsOosxLbZoS5ezXZEBA9aShHf5woKJ
 dl+mrUyxZB6ekJLoWDPp9LtKWb1AZEXq0KHU1u+Md/zYUXkEdUBMCy6iD0TQz97xtLTvtMX3eJG
 P7+7fBxvPLOzI8OseUxnAonuRXfPrMbbZBlf7Sbi5V3QIbZ/SgT7C6cgQFJY6Bj8PkfCGTF7rBU
 FGHK0TVvvAT2n8Ct/Ia5jdgmBnYGYDMd3nB2+V7P9JZ6JhKplJzWgCibJzHDlH/w5lRCgTXwXcu
 yWa7kjXBtia5Jtctee3UXOoLauuQjudeP/TBISSRp0TZ8GTxMX6PsbhmdzMAnNPe0bCDxg+1YdG
 WHtjOM7+oMUer0V+jxg==
X-Authority-Analysis: v=2.4 cv=A71h/qWG c=1 sm=1 tr=0 ts=69b0e036 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Xd8vOn4_dRUKSRNknbIA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: 7bz3UGk9mam4FFNm1Pc6TUJ3IFcfDd5f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110026
X-Rspamd-Queue-Id: 6281825B89D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96832-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use new helper defined to program UBWC version to the hardware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index d8b0288f0040..497db0ce28bd 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -204,7 +204,7 @@ static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
-	u32 ver, prediction_mode;
+	u32 prediction_mode;
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -222,20 +222,8 @@ static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 	else
 		prediction_mode = 1;
 
-	if (data->ubwc_enc_version >= UBWC_6_0)
-		ver = 5;
-	else if (data->ubwc_enc_version >= UBWC_5_0)
-		ver = 4;
-	else if (data->ubwc_enc_version >= UBWC_4_3)
-		ver = 3;
-	else if (data->ubwc_enc_version >= UBWC_4_0)
-		ver = 2;
-	else if (data->ubwc_enc_version >= UBWC_3_0)
-		ver = 1;
-	else /* UBWC 1.0 and 2.0 */
-		ver = 0;
-
-	writel_relaxed(ver, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	writel_relaxed(qcom_ubwc_version_tag(data),
+		       msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
 	writel_relaxed(prediction_mode, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 }
 

-- 
2.47.3


