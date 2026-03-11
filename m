Return-Path: <linux-arm-msm+bounces-96839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JsQOnvgsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:24:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5B725B863
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3EEB33040297
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389D836F405;
	Wed, 11 Mar 2026 03:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgTARJuf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ax6hh7Vc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A8836EA86
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199435; cv=none; b=uoHPzz4849/Rtl5f9MkRspWi3CVjmdOTcwh/c5VtSBCel5/ItuV8I7zghjZkYtCID7Q1aNQWIsF92Bs5gbfpthwNEMHF/p8Q6bC0tJzSYXdeo7YwhEV7toRU3CY1wfonB3fiiuTyn+SgVdmFV8Rs9pvgPlVcfIjhYQYwgCUOhzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199435; c=relaxed/simple;
	bh=Q8nHBL9aa2WdW/t5nAUsHsORcWzw1wI0nDN5vKUfyFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rpa20nbL2P5XxnWfCoNCIzOQ/j9sO8nPbb36unWTrkTMySCSx8mKqisaN01q28bHQkoeXsi5jm1IJdwk5jUUL1GdFv19KtlGx8YAXyD9qvRbrgQC/aht19O1MEOHQjj1QN9QtlhzMMDjpdEK3FyYYUWib+1wQWQiD0T7DRAVpAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgTARJuf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ax6hh7Vc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AKoJ8n1863538
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ObK6ICCUnKq+NtFyUqm9Dz+ktCq+FEBWAvwrB0A4ScI=; b=BgTARJufVBFXbkNf
	va9bffX+WpLoKDrAV5cVGKBR33Q+ziBVy8NXt+Tyvh6zHwNeaVYGBFD1IflAFyLK
	y5WJNUmRZUPmgzC7EUrvLnfqelIgW1vLK+EMSmPb3xyc3+ByCf2lDbnag+8vFMKh
	RP57lnTj47o6JC1tyWVkOZNclDds+AI0K7vJkcoiXejqv8LGuxgQWkkPUpT3OF2O
	rQzh0xVnc3t7WopzQ4OlKukMrorDFwmDEO1H4tgnBFXWK8gECwpCF3smRdLqCNNs
	vwGpy8eAIEPJHRDsTpYjFNqpqu8+aih14L/uy5G4gr5vFH5pBTwDuljd1tpWVXTG
	gEAarg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctmw82k97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:45 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94acebd8d64so19879511241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199425; x=1773804225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObK6ICCUnKq+NtFyUqm9Dz+ktCq+FEBWAvwrB0A4ScI=;
        b=ax6hh7VcDhJqtRO0RmyjVJm+0n+vazVevXXKsTYnZFsBsqBm3GlexjtBo7lBuoD7Jm
         Y/LlRAQP/WIFkD4k3kcdpoPiGPe2nwBsR/EaHH0Fw0z1ypkq0OsIU8RU1m1Qiqh7d2Ml
         ATDFiKu1J9RakNMoWrRgbouhVOq4/9x4bhYaXIXE5hY0F99mmeg/EdGNK2XG5a16OQRN
         MYvwYphBeAOgJVGTudi6f7ET0FERkKZ84ZtQTY6NK3kM5/rIN2q/4rsHTLK2Q9A2NkIz
         q55c9KWh5vw0MBid5xab9i9ttoNZLuKlY17402Fi20G4Wg5cJa1NKRCNtShalxI7dL4M
         pwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199425; x=1773804225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ObK6ICCUnKq+NtFyUqm9Dz+ktCq+FEBWAvwrB0A4ScI=;
        b=fHo3rRFLSUTYSYtJhBxIMtXHie3FARq1A9XQ2OODVAhEb1YSUlXRP7l6LoIwrQNYPe
         SDxkqGel/M7gC97zarktOqdib0KlhhMv2go2KkB8hIr//I+uRjUIn02184mJCvECdGwP
         5MbGxOlkgA0AMdYkb7nqTZscWghw8u42ouAMzm73a6f5ROjoVHUicQQrmR35bxTFI2dS
         r3kT1zbOwUKZ9MoVZ3ibU60/bKHL1YMHc/dhnyJK1XyL9GhNG7AGRFOaN/Oi8/1PDJA3
         8QyJTUhTqSwl9ixvNa2yNgljTgcd3WcFpeBZxarM1PmwGEzfaRwrBI+rdafsbVne5JI0
         UCuA==
X-Gm-Message-State: AOJu0Yw2QkiXrZEyfL7RaKXZ7Zm+u3G9UyAHgksgwMVe6QTTVNTW9/o3
	zt87Mduo00rPDmo5n0y3gMAdOF/R0rZNQIKidbSbvB1c9wyaY70E+WgUGzzLdEHPqXE+xllbwh1
	iyYZl74t2cSU/ReqREq+ybXtT7tC4WIvsl5MN1x//QQutkgI963VvDTur57uSZ63yJtgt
X-Gm-Gg: ATEYQzyAWANpRcqgR2YQh42utehhAMsKd8DS3g+W+TaLE4mRKKazs8MsjfsmEs7vg37
	wd9cbc893JF8O124WorVU5fgRuupOjpS8ozJ6OhxJRd7ZAcn5mTs1jkw160UOjYbiePE2aiOWfB
	QdpKuprOkaXaEa6h9hXAmJZHBMXzMgPngMfEIwntw2z8fWYg5F2l+jrq7toct8p8YZRVpwT3RpI
	cNiq6vGyp4f0is3+KEh6hn0/HnxDWZb2rUrWAilu39/Qz0J9jJcSQkIMloPGwbk3qMyFWnKX5i0
	8nWPkoGYMl4j0XDcJEhRXVPau4Jz93XxRvkGszQibnHYD0hPKnEypK5UwczMLJuhFpArQVt/occ
	4SLTRgl3CDNRRf+vEgR4S7oX5EWhBYqcpkqP7BAi+mMAtsSPKraI/2DaxvIUHtOc89ND88ALo3c
	5tbe6g3DbU1Xfpe/7Ay7MDTM9KaPUroGGV5A4=
X-Received: by 2002:a05:6102:440a:b0:5ff:2426:94ed with SMTP id ada2fe7eead31-601defe4dd4mr394274137.28.1773199424564;
        Tue, 10 Mar 2026 20:23:44 -0700 (PDT)
X-Received: by 2002:a05:6102:440a:b0:5ff:2426:94ed with SMTP id ada2fe7eead31-601defe4dd4mr394255137.28.1773199424161;
        Tue, 10 Mar 2026 20:23:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:23:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:23:04 +0200
Subject: [PATCH v2 10/25] drm/msm/mdss: use new helper to set
 macrotile_mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-10-69f718f2a1c9@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Q8nHBL9aa2WdW/t5nAUsHsORcWzw1wI0nDN5vKUfyFk=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGmw4B7INzp1K5mWzjaLeBMuLjEYU/D/sdzcLPzQvF60YN4LM
 okBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpsOAeAAoJEIs8ij4CKSjVOGsH/23+
 kZc4rUv3ieE5d8Iw8lr7JPetL5DW6u3J0PVeXW4zAPotJY3WDGczhnCjTTNSC9qD7Q7Ehxgw6lj
 rvIzkSvzKwCehQmO6cOODh0QadY1hxQ7rYq4T4DE0LiEdVgls3mL9+xzM/eRqP930ar3yC6Kyeh
 Am8PgAWyQJVMw3OjaKFX4oXThARvhpWvZvZLBoOeqty3GFxljO+x7+qveMF8ZTJ53XSGkXDj97x
 81DU44etSWTD4kjaa0V9XKBYPNVbxA30ljhTwZMmRFhrqbR7sClOtDUG9U3pYU2Oip3RMtNpI6A
 YsqqA2K2kIipI67oz0YEkKGLdYN5HvEx068ML+8=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: N0g2iMpolqZvcv6lHkwTZwsNWvXfuMVR
X-Proofpoint-GUID: N0g2iMpolqZvcv6lHkwTZwsNWvXfuMVR
X-Authority-Analysis: v=2.4 cv=PJECOPqC c=1 sm=1 tr=0 ts=69b0e041 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ujCctoy6CNRHcyqwK_8A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfX+pf8t5v43Ddi
 CNWgo5RquDqfwev7ATBuXJx6gzvQvnQGLYA9fftb5JLSc++Yy/xjs7D07kaSQj3Td4n4N1I7wHe
 LZJ5Tys+1zSNoPyn1TClR1v6IVqVt1TXuIzi6E6NdYKurJ+9kzWo+QGG+ybA4KZjMw4J+Rk/0BB
 tIBS8W0E4qmN4nV/oqGkpRMJdPlWo6W06BRr3roAR6Zh4xxVPeV94LCmWps+Rvn2bDFFN6Pe7U1
 2A4jGcUMzD4M+6JhNvS1NXS0WFAsvrFgTbaskYc19SA+tsuKePYfyjWlKtj6o+DmPZfpFB5u7+H
 9gJr8VCZFc2dizgMOz544fJOYnRc71QpHEH3aE0Tf9CGWyoC/1qEnbdthsM62xkNQuT1kyfF6lg
 +qHivDRbpfJOG8KUQ1LHTOQeCWm+k6nBb/+4oGzbEWT5LOsQ4tDuWHUWGTUEmszrNR2yHwCuVWR
 UgxkOmZLWgw9p7D+Vmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110026
X-Rspamd-Queue-Id: 9E5B725B863
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96839-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Action: no action

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 49ad1a9bac23..49e7a6a4e5f0 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -186,7 +186,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
-	if (data->macrotile_mode)
+	if (qcom_ubwc_macrotile_mode(data))
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
 	if (data->ubwc_enc_version == UBWC_3_0)
@@ -207,7 +207,7 @@ static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
-	if (data->macrotile_mode)
+	if (qcom_ubwc_macrotile_mode(data))
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
 	if (data->ubwc_enc_version == UBWC_1_0)

-- 
2.47.3


