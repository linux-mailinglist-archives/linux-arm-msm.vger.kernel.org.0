Return-Path: <linux-arm-msm+bounces-95883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNryC6AFq2kMZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:49:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B348822574D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C7F530E383F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB274219ED;
	Fri,  6 Mar 2026 16:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgXDXmIx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cB5EuwdB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4163EDAC1
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815654; cv=none; b=KnyvUyJzxUiz721UKotCxCEyZenSi6FIb5d+VwjQAs0utJYnjeWoLrqh1ggKyTK0IdDgAdyO+GIGbsZKgFYuugdG+WeqagmhjiOH8enC5oCr4sMXlFCc//P9dSvUY8pR6xXa70zMakftFm+bJofsp+NmdntJbUP7RdaRjsCVMoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815654; c=relaxed/simple;
	bh=jfhtlunzk9GwTp//Me1L6mf+GhU7QSZw7jcsDFdN4VI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ORoW/yJ6oVYkWH6s619Ehx70GCrHU40aK0xpTGcsS4790gAhtZU1AN+r1VZDsz853V7rExXjYrudQKBXMF2Fp03Jl4Uvj075STpEovUaYFMS7YblXaiPxcf2RUvVpdrpXF2FT+yI8fBZjRcIQXG4E53e/okIh7whaD/lz+YqnPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgXDXmIx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cB5EuwdB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Fr56E082635
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJzrziKqS66K8BTFV7yRFO0U3JoxSa5Zc+pCmKaMPzQ=; b=UgXDXmIxS0HdjyD7
	y+NlaWZQ1s3gc+g591ESMTwKb598rpvC2HRitDqRmzUydFY2/29N8BXtxITMPGep
	2I+CclEvBA8c9SNd9Si4LiN/VlKFoEbqwx6tesc+pZOsWxszr/VSaHKDtzcF9z4J
	RtCLM8LK2HjQJGFJbHFIJOtgAWYtKUjkZMjyhuHzksEqApBdifKSJwqY+nj5KcXj
	osSoRTlShdlZzAbhUpl7crxZk0XWDpRD+dLYFtpC0awcCuVsajZ8kntv8YPIg/3c
	WGtew1duxsckLmJq1xw55Hw0CkW6OYmwLCIWo1GdQqfhFytEYotfQqOkwTAzpM8S
	LhGIOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv98hc0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4d191ef1so1258648385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815647; x=1773420447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJzrziKqS66K8BTFV7yRFO0U3JoxSa5Zc+pCmKaMPzQ=;
        b=cB5EuwdB3zuPd/u4YNXBXwn+ASrc4YzYGJ3u6JDEHrDo3+rdzJns5W7Bf0aZyWRFjD
         wjCwoJh8/oKexd09Z2EG8U84yj25qwNOctco1tV3vjyeR5tmut1FOPq/bIO9RJmp4Hq1
         mMvjSjiliGCBif1fBlIdR4cg3O0JHUycBDNtlvqiGi9GW1/88xwxiczlav92sram7rb6
         9EeN/4FJALh9IhfgBpeN61CbslSAcIFVFJ4EXc60cWngErSoxL9zYEPrkBwHrXKBmAGV
         BPb3+298bL4Oc62nxUmKXYH2gYY7AY6jSdDJMEwitsapLGCw5O86g1rHKJMfS6AMV9X0
         SWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815647; x=1773420447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tJzrziKqS66K8BTFV7yRFO0U3JoxSa5Zc+pCmKaMPzQ=;
        b=AEGtW3X4axsBSM2rLaKq3B4L/fGWBu8AfhHima8Cq6GZpOVL3uLjlG98tzthk+8Iqf
         +sZjD6C393N1e1LffUUvB1WVPJGRw0ZRPOE7q3wgmXdpT0raI6fh2ylvvwgojTa1j2is
         PYv3G3o5ZYu+razrVZAfHFeV98LMuoSswZs7zDYUF0qKqDGfi+F5LX3LQc5dJXdqnaUm
         4bBpF3Q65gYI9zpAursUF6gDv9LeFSbquJ2Wm4YF3nLynJLtx5gsXL/eQIjrT1rM2osR
         RiS4n0HRvxRCLosAZuipgLK4WDeC7xNl5ZD8jcCrTqyAn3WINoQxqm7L7Ru7KNDn5CK1
         kG4g==
X-Gm-Message-State: AOJu0Yy4sZ/TbC5rNQW7Nv9pqLJGrUsrC7LUJtmKsJm2APIjNzWbdPvJ
	SfQkd2TEvoF6YF9hQsh/pWd5fAiuK3Fc9wiuf/CdsI0HZgOB/GvwZduPbM+BDPSBsG5Q4gbkxGl
	8aafHHiArMTwSqayLRsK9nopmCSWob2ZCYs/N7c5Sn+/B3SnHqsoC7w5++nAidb6uFdrxNa/jgV
	WU
X-Gm-Gg: ATEYQzwmTO0eXi+Yl8RvQsKq+DDoRf0B3xiHG6RqejOGAdOO2/J8BTksom0f3+DqlDr
	SKQ9u5LsCklLwUP7odogpft/9LSUeSNrvGEWh8gxxxFf/sqxsRWzvq034oCW50asEfbrxVjHMji
	aUFsTxl+XvwGRkz2wo6wdG5fEYPaOS0omM34XuCEYpOzT9u7Hi+m1nHXgij2MQbhkH1z4eroZg6
	Y8b7BqZYQQp/acPy+oBIQSP8N6Jyoya3IwcctssbdXiOfexX/DzQ0Z3w+HAz8gDV0qNROnEZfW3
	GRdGAzGuzF6Tmtszuq2UDNA7xrP2lIBak3XC2R4n+950YhquY0hutZR9R6Jay6u25B52KWvsv41
	MIq5EMN3y68C6/to0BnBm5rBZB6rh3VF1tc1z1x0XZdv2d7Kv8/dfhjMkJtUyxhjnOhNZOcgIOR
	gGaHvaSg2Fb1fnktO77nAJlfVo10FXPZmYPKo=
X-Received: by 2002:a05:620a:2806:b0:8c7:9e6:3a72 with SMTP id af79cd13be357-8cd6d31f36emr346105385a.6.1772815646774;
        Fri, 06 Mar 2026 08:47:26 -0800 (PST)
X-Received: by 2002:a05:620a:2806:b0:8c7:9e6:3a72 with SMTP id af79cd13be357-8cd6d31f36emr346101485a.6.1772815646235;
        Fri, 06 Mar 2026 08:47:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:13 +0200
Subject: [PATCH 07/24] drm/msm/mdss: use new helper to set min_acc length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-7-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jfhtlunzk9GwTp//Me1L6mf+GhU7QSZw7jcsDFdN4VI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUNlQJZkBObTPhQ9Zlm0bWm4Fh06JPeRJhSf
 /dUM7IqdyOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDQAKCRCLPIo+Aiko
 1dqPB/43amVQBWWwwVe5xbDNn6w9ZozH9OsgFmzp4BgoeO0swcs8jgDuNpU2qDRl++Iw17k7dB3
 PwRY0MLxk0C1p9uCnJgLUUHvOkVR5r04JLSOa8wVEhdtJ2TaX1ildgcrGv+gPHajDVq9pV4sgOK
 WlV1TjETXKWGnM1usLnGCVQey/xVtSn84DcYEaGi2sTnuBIuEzfu9p0/+7F0gZT+d1x9wKwy1QY
 DA7NNKqdL+Xglw+F0ZMuHcmhsHSJXnz+nVckTbbDpSNLwTdP1F7Aa/tIeiPdogDGArGGqAkvNhI
 nvXBFUiFTevcuEKfPkRDVLPU68kuiGJQgrEN621haTpd3THw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: bws37ai9_kzPRhHls08tW9uPQvZ-xs3K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfXy60mMIIaMqsf
 LEkIajkcBD7wjOl888I47OHkzbwboYaz/n1ueSxoWkYE5pjlwdVrA72N93LqvEzHS/1dmuG1nJL
 FTdZtOZCZshRsB9iO94TIXEz4WjJFmxADju1qMtqeidqZtf1sQ56r7hQObzx5l45z89D+cCKw5K
 cSBZ7BmE2uH6+0GmRQ8eqQvcwRFxEDNKAUfgo6qgfq1Vbcn8SzI7Lm5nfhFPW+LwfykK3QrEaFq
 FSpiQDPcL5I4zzZxKYokpIU1P+6bBLZrX0Kb0QADsUBCuWKZHp1aOabU+xfs6ZBNcRdxWaYLfz0
 GeOJCF4hul+8aj0iBL2v8VVmpkknrQRtFpldv1+nbkNHi6PUWhLIqgi4+zfiFbNuswTYmUs5c71
 A70QSPWPfTOTcuT/udZAbqQzZqu70Bq8JMbZnqDW94weFvf+6P0YvyaeNjwzKciREQ0wMhIAjgs
 AeLXQkTgq0XWBQQwSAw==
X-Authority-Analysis: v=2.4 cv=LbcxKzfi c=1 sm=1 tr=0 ts=69ab051f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=X-e67srwgh_QgMMAbO4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: bws37ai9_kzPRhHls08tW9uPQvZ-xs3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: B348822574D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95883-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.929];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 798a23fbc906..16bc9589f696 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -172,8 +172,7 @@ static void msm_mdss_setup_ubwc_v4(struct msm_mdss *msm_mdss)
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
@@ -193,8 +192,7 @@ static void msm_mdss_setup_ubwc_v5(struct msm_mdss *msm_mdss)
 	if (data->ubwc_enc_version == UBWC_3_0)
 		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }

-- 
2.47.3


