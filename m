Return-Path: <linux-arm-msm+bounces-96844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EvDKojhsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:29:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B55E125B97F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 90A483060250
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F02377017;
	Wed, 11 Mar 2026 03:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Noa8luIz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZuSVfmkY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD69376BC5
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199446; cv=none; b=j3vSq49of2XCdLoYMKXOtNDRATJH9+G03FwO4zK6NZImiI/rBM684uwUMYYkNnDkG0zLoqFXbjN5quo3A5qpZmSoyhhiF4wy3ij3kn8gUMp7RbGnS9rBY8Q8s3MKpla6HgmlfGwJ+yWU8HGWmb4Foiq67IYoxva2I4ZRb97abAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199446; c=relaxed/simple;
	bh=z4RQ2542mdKmT7Il7PrHpeGFC5QNfj01HavCYOFO0fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Di8tF1HAEVYVyNKuNgf7CSAqZvx2L/pL9DlgA7o86e5jrOwsqVrfMTCZ0YNELbSywLw3g+IVHjtNYXL/BzMsUVo2TxQJABtVs49oEH7Xo1S4C+V6DRAf/hecDrOq7bdee+eddiKp6j2g5CLkQ3RG4EB+wkFgJBjyHX+UyamIdeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Noa8luIz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZuSVfmkY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AHcrcv2179348
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M38kDb4qB9NXYQ+LHNR5zTGrfaGpw+7+YITovw8Gl8A=; b=Noa8luIzcFT1At9I
	FnV7rPMMC+CRboIFcSDn5QsCnzzUxpmjgS4gfaHMGVwwZGbVAwN2nGZPtzleL4hi
	2BeeTTYXyIrIJDADJWCgnNFxci7BbPazmDwkE6L8PDX22SgKgD0nkJFIpyHeaJ66
	y0thpT5mteMoKP9gwPSHx9LNNcXAwAJsr3tRPTTMmhGj+6LcjsPEjppygGmRczTN
	9IVsoqI76eaexJTx30w47lStuHCfkicn0vAamR+m4oUaprsKtw6n0uM8E6trH3kj
	qKiLcLTXYm9PVNnpHBr/ilPiiRIo0Zm3svpqZ+VtrI0JIObRjsqjRffaxG81NXlQ
	4oVN2g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqvsspdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:04 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ffb9a0bf22so40660383137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199444; x=1773804244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M38kDb4qB9NXYQ+LHNR5zTGrfaGpw+7+YITovw8Gl8A=;
        b=ZuSVfmkYIBdAFi6PKiNoq6fjVtlzw3+imo7I3TCUAIcWV6myQ1m37wik5L+ivkiiUK
         4kv9zIHALHlxTadA8lfEvRKf7Xo2GhyshXivKX9uGJ7h46MdDb8+b6YIZOTbzmhjVAFZ
         OZWOloCDGY0oeF2avdwhvNVRZi0JG/p9obeDdv0KsK8mGvQjQXfhO3IfvlRawfY7EG7E
         nyZFQ3SvbEDoFd+Mx0dekQxQarvspd+VoCEpQEqTaW3gQOwqiQQKtKTOitAPPufjsAQb
         AvNEK2tMiIm+6DCpGSyIbTvfQavYg87fIzRD/LL5ShDGehSvt5mjaU3hRVhDtNpzFWyl
         4bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199444; x=1773804244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M38kDb4qB9NXYQ+LHNR5zTGrfaGpw+7+YITovw8Gl8A=;
        b=I67MDuGcfZ7QDpMk8bCelw6L/bJQbwoLNLElMU31bKeb1fq0SPzkGGMMSCn07jERh+
         xVZSOlZM8bt2aceG9kuXlRV+aJ4Di/77e5Rx4+ZKFIarof/6i5kLh6A9kebepzV/Mqmt
         VG2yPRNH4nqZOcfAuJ4JdoTdFoXQ3o9lpLVvc8FLKeiWLABZEFiNB9Kl4/ogqXp2WoOI
         VaNLzu4R1X2nL9ftMZKZ2RgFL1p2WdsuTdR+XdnnPpWwyZ0uTVDC3IA1FD2/+l1gy+AV
         f2nzC2S1xwOdoYygPBdrmaKVll55q3U89N0TDVqM/EmGxo0rad8Eq4xpPNDQkuHpevw8
         yObA==
X-Gm-Message-State: AOJu0YyzNZmtpsUhakHb62EGp+/yeRintapzWxNm7l1HWb7clBgvmsem
	q1X22cEOKQHuzr1lqg9lPbf5Fi5bPhaHOCTRfj7DpEgINIn95asA75O5N1jUIodp1Yhm1DbyC15
	bNSKTKuhoi1SqmWdn34QavTIJ63gB8iWBqDuSeQcgs87B6UfQCCgZ83mhjUgBbTAZK1W0
X-Gm-Gg: ATEYQzwcObIpyus8KC656Gm4eFUG3h1TQFVaT+ER6WzUxAGT0cNrz3BqaeCdinMWb8O
	CFUaQg6extTJe2O5wtzd6Ato0l3nOrK/gd88eKzbUfqaaW5XhnnjaY5FNjdkr8OR/BozhJArbkX
	c9iogKrjbIYPDgw1KRJ7aceCMDFJ6mpKMnMU9VYBLXJU3+e6JQMA58WA8RktRIqGjLHU2AeLQjv
	5q6hCCKq/oxtNKUcB7KL+3Yw0WVJFAY5Eu0WAhSiC1sRSffSNWpR8Bp//q4ZjCjLXao5LM7SgAQ
	A1ZnvSQ1aLV2Pu21PXRIWSHAffx//c6pvJuGzNEKHgAitAuGIBGE20t+yw9HD6Z0Skq0esdu6Hp
	8SaJshygCfjUXFt+xjzxELOs8e8Bf521HRuifZOrGvBCt9XGGCk0FnMO5oUWZB/g8hqcFKTW5sb
	Z9FLDqxKAwk3kRMotYaVaWMiUd9RzmRDxXxz0=
X-Received: by 2002:a05:6102:c8f:b0:5f7:24e9:ece2 with SMTP id ada2fe7eead31-601defa4eb6mr521396137.28.1773199443670;
        Tue, 10 Mar 2026 20:24:03 -0700 (PDT)
X-Received: by 2002:a05:6102:c8f:b0:5f7:24e9:ece2 with SMTP id ada2fe7eead31-601defa4eb6mr521385137.28.1773199443255;
        Tue, 10 Mar 2026 20:24:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:24:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:23:12 +0200
Subject: [PATCH v2 18/25] drm/msm/dpu: adapt for UBWC 3.1 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-18-69f718f2a1c9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=z4RQ2542mdKmT7Il7PrHpeGFC5QNfj01HavCYOFO0fw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAflWjN4izX4SqVd9rn6j6krJXFuSY4SL4IF
 gEpYBJPalaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgHwAKCRCLPIo+Aiko
 1ZfCB/9dnS4sDKhuaQOiiic+SvhyaDzbb0irFe7XRCHXGrYStulh8swHtQW3jZpluiXTyr8s4s2
 CzWyQtzWTfqR6dgtvq8s44/BvgB1rlTj3CroiNb/PxhjWJAYy52b3E3So3pt6246Hyx5j/lBrZV
 xoagAwN1/FEimGiJ3u3b8bZP0t0cWWTo7Zt6r03qTQKYeAKw4FZTPRUV2EjPLf3h2SamvMYqX/I
 kyrOGIWzuQXkwLpBMf8ME8AfXs91xliaLOYlDZOsfFfyhv0zUzy/PaY8XfhYZcb7+AxwYySUqFW
 tEZYPlcoDqb5syb4U7SFqYu+WUgvQqfx/qLOUfkcT6BTHF+6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfX5Gh6V5XYl2yu
 oUnUSvNHSne8jkI5lihNNsfWyJ24+WxCwIFrSIXyphGck5NvrCBKn2B6jJnZI7EvDCn4KFeHYez
 h4cJTnXpwdjkc/ebXPKQGxWaHCAP9s5pewZeMTROweabSJvlSb57k7T1WopOZHv3PK5l9eG1XIh
 Yhd/kH+F1MuEtqvgErriOJoAbRlXN33SESLg7qi1aQpbOH8hIEpje0RPTP68u/86hCbzQXucpVA
 tZvbAQ6/lWoNG1tNq89HoOl0w7lLEI5m7lhSgTXCyENHLFaemq4jOuG26SWlGpQz/DMFZf2AgT7
 JN/e0AkYCsy7RzS0aCJZt6s3hxcj1DFFof3RHhVuChTcW1J9RjMbxDPd9rXQeijTDG0jWp1JXIA
 nffwPGvoucxJ8f++9dX/Gg7SRy3BOyXtZldli1bGsRSwHhy/NU3nyf6jxYxYY43B+ijtvDS0Uq7
 BOvyDd5qcr4jN6bRiPQ==
X-Proofpoint-ORIG-GUID: HyIpc1k2qkKYxts1jUNejhcEw6s_aUFL
X-Authority-Analysis: v=2.4 cv=Lo2fC3dc c=1 sm=1 tr=0 ts=69b0e054 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=2jSDvX-ur01rGIY0dUYA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: HyIpc1k2qkKYxts1jUNejhcEw6s_aUFL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110026
X-Rspamd-Queue-Id: B55E125B97F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96844-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Extend the driver to handle UBWC 3.1 (in the same way as we handle UBWC
3.0).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6089a58074ac..cb06db3cb367 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -324,7 +324,8 @@ void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format
 		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			ctrl_val = fast_clear | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
-		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0 ||
+			   ctx->ubwc->ubwc_enc_version == UBWC_3_1) {
 			ctrl_val = BIT(30) | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
 		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
 			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);

-- 
2.47.3


