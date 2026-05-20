Return-Path: <linux-arm-msm+bounces-108805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOIUNErODWr53QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:07:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F75590834
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 31A91305A759
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672193F7874;
	Wed, 20 May 2026 14:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7hMz+vA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IfS6yE9y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E2A3F5BE1
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288720; cv=none; b=EJTchUdwUtLqZTxe5ORj9fp/bWTDsea581UU44MuruDnjR+QP76xdQmy06w7iC+vZRQaePe+/f61//ATu80e4XBhl79gcz+7jgtwEGHW7e9Zrc+q8WI/EbqR0WDEfkReweditnz/iG0GduFzdkxVxbHbrGKzjegpNSjinhC/bUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288720; c=relaxed/simple;
	bh=eWTJTWUL783ux158sDIK3D1pfEZ6TYiZyg3QZi3K7zQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uEbNePszhZLK4bW6LpTpLQU1qgXyzVO4Kri7rPaPp2GEallmXWM3uz7VfPHaBKBcNDDDpwPlqahiOaG7YSi88I7BIS4Dv6gBxY0MlrRCsw86hFBzIixvDoANdQOweJAaWu0PmW9hXs7VuVfXYM+XL0icGJHpbEBZr18gIF2vVk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P7hMz+vA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IfS6yE9y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDXgDJ1798325
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JAOFJSnWiBy82M4+mbUAjlJ2kFgTEHkTViqywRBPv8Q=; b=P7hMz+vA3NCsGsCE
	4QC3v9I6qxT8sAHATMHWvOrvJMFnEWziB1H+yhPYMRUAOAqazWkM8rsKHtFtpX9P
	BG3/X1tvFnGkuG9W2meU7Tbb8GWh1SYI9eNUE2NWZkPpLbe788fPKp5K3LzUhk1a
	cjw2wiTNrLfMEtQx8Tjs7h7EpChyvprVJ1SHvLmmXpLR0Si3hZb3f3CE9obGQi99
	jY1+OjZPvPtcykUNCvNOrF1jg1bnnanQNClXQFm7NfUPMx+s1UNJ+9F1as9SwXrU
	GwENKOFp912pWhVVNEDobRd6GMrAwGNbBc9QpSjn98faSWh7mF+Al4RjfcdSpJIy
	A74D6A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu0a2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:58 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f73835016so3995727e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288717; x=1779893517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAOFJSnWiBy82M4+mbUAjlJ2kFgTEHkTViqywRBPv8Q=;
        b=IfS6yE9yxUFVvxIYEXBNuS7tUiN+4s0+2p3FQAEcCLG3sGGhESv0XNw8sBw3LnxUwD
         fEuORMdNDVLk2FuMwCKkWwOkNzEOdPF/+e3ZNqt4mxyGh5Asg0/IkqpwvqBXhoViU4TN
         jMMdMW1M+c5gJLtY9lJGGdbnZsyg3zMCSB/g99O1Pgzcd/6G1TLAXfLcYWxLPmbPGJMZ
         PVpcb1xDFtQ6LGB28ziDkrKavVKjEv36o4KO3RzJHT8qBVsvjyaC9JgdYcUfh9vmQ1qL
         JtOUU59tDaNyOx69krdZjvvwEuCr9/6vOOD8RTOaz8IOo2ZCb1HPn56lrbT86WnwHYtY
         n1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288717; x=1779893517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JAOFJSnWiBy82M4+mbUAjlJ2kFgTEHkTViqywRBPv8Q=;
        b=nV9jiDY0rXGkLJaVJ94YHktgl+zV4Uoe1Q+Vxsau5GPvGYRBb1BfxlcBIrNHhXRRIi
         HMgvYkqOcFEEqEn8Ke5Kkcekn0Y9q9G1xOUdofaovKB1ppHcVplCM1NpVTGhqR09mDjP
         zXXA2Y9BSXN3zl5U08dbQnDzb10im3b64PNbcGmcFJiHq9wW1DlKWwyrA7RGTprxS4XC
         aSMz+2GUZ2BP2UhmWYmJlghM9fMEDNzMpePxESZUBBuvFDRnZoyaw7CaVM/X/KLL1A/6
         ZdK9UJXXwjEBduZRl+idjo/QrvL5UReRTwxZkB/lyI1fblV+n/p/EP3R8veoG3bbRB6Q
         P5Pw==
X-Gm-Message-State: AOJu0YwRYa0j1KEi/z5F5/TkqSEJ3KoDV4NcZ0YyMo1OYqrIQoUG7XGF
	7jP8slfMtPaS/BCgpS1StjC/kvuuZVz+VrCkQzVEJ8SQWN7g7V2bEhIVl4wv4FIkjSXKDwMAvgJ
	dG//fVPbth7rSzi2EiEZ1zJ4J4RJGhfPOJkZFuGkUTmfoG1tOs1Kb+cbI8IyoKAlDv0DY
X-Gm-Gg: Acq92OEqpxdbBmfeE8yfvVCmow/GzSsGsfQ/9QiwyY6YqoUc+jm6KfFQVY1tebUwLlR
	P6el7FaDSor0i/fTAOYb75amX/uO479XRfhgAFsi7ekibB9H+IM97DJi9yw2LjRGYaWdcR9OCIL
	QQsdwTB1KW/HRWfobI6e7KaDoTjCqOc6K/bb3+R5UkvVB444GuP80E4+KROpeFauOikAzQ9Wv3P
	wLoz3LJZJKNTrqEBvf8lAVXuCDGvp2MuKuhl6d2PSZ+CEGF7ewAuNQfBEVScRQD8C67VmdiPnPO
	Xm/sxqzvk9T9yOzbWkmKQ9ctUIOTWy0Pxkw5WlwnicksXgerk6QU0tZ6GwHcOH9A7U2qv8+z7D3
	Eoy/k+UumiyflttkpPFSppvx9tivz+I8RmUbR3bPPL4s2nN0N+6zQKmgirHKOKfllqOCRTslTk0
	CTTLbajFVsIC8I2swh4NUISznBbCrmuMWPSRE=
X-Received: by 2002:a05:6122:6093:b0:572:36f3:e792 with SMTP id 71dfb90a1353d-5760c099739mr13100954e0c.14.1779288717242;
        Wed, 20 May 2026 07:51:57 -0700 (PDT)
X-Received: by 2002:a05:6122:6093:b0:572:36f3:e792 with SMTP id 71dfb90a1353d-5760c099739mr13100753e0c.14.1779288715950;
        Wed, 20 May 2026 07:51:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:27 +0300
Subject: [PATCH v5 20/28] drm/msm/dpu: drop ubwc_dec_version
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-20-72f2749bc807@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eWTJTWUL783ux158sDIK3D1pfEZ6TYiZyg3QZi3K7zQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcppsllJZkno/Skw+O4wXgaexZO7P5t6Q9FGk
 TeypT/FPneJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KaQAKCRCLPIo+Aiko
 1VKcB/9Hjas/KBnLvigl5vj5BzZ3aiHBgOxosDr6Q+pF6sULggHYWAQjWwib85XFMGQ2E+WC4Pz
 PM2oCjrVSvtZLyp92KZLMGkKifHVRVdSNea+ntU1JUbSOddLxu2skeykUmpY0m9Yo2MUMCFOIK8
 UpUEk/fYYWDhF5TurMBWGg/5uZwLZd+KDwaQyOW0wuJqg0vwhQEpuxcDOD1q60dsUDRKLb8kDl2
 p0iOuqIsOCYaKdWId9CPJeJlD43nMvuT0x7pvghYA0M5RyfhxWZC5xue04BtsokfvlZbfyQKha7
 7cLiAKeRAWuLlr0No17R0ODdBo3VEjJ3xRKlx6M20T1HKRvx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfXzzAjmzIwEE2h
 upI4YZkfWtD5elxi1ntkBRLSA9VVvjWmPK6pX3NZIBALkKx0K7zDTByk/FbpYuyntT4lAg/WlAC
 oRvBDxpbFSCo3Q33BmaARFFfa7UvoHEe7BjVqEx6DS0ouOdjXzONSMzbctw4H7zWOTYqjQow6+l
 jrq4JKRkgQlMn95jtSSgq26UgIc1wadnm6n0AiMaKgPNkH9TUGn5Xd334IYWz9XiuvR40gN1Vjw
 VOsyWgH+eoVGpNuHsOb3aKe0r0bp7fhym2MYbMfigeHAB5iQnXI2xjnDE1o0OhyIWAQSVfXGb8y
 7c2cH1InzwXeOrNZxu/X9p3jTXIYeCLvKm9LQK1x17D1hjxdxr7tYk5WJcn1Zkn6SAwZMBDGicG
 yyBp6t2SUG0IbjAW5nwBsahe5HKMtF9TGG9LIGY4JTBl/MBz8CtJ17a9Uj1yL3nJAe6UO4fyKOR
 cCYeWqnnilMVA8a+K6w==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0dca8e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=OFVxzADIxEWc22agC70A:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: gWXufyOa5fKw0cSaBAuEcahBGcPQb927
X-Proofpoint-ORIG-GUID: gWXufyOa5fKw0cSaBAuEcahBGcPQb927
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108805-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 74F75590834
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Stop using ubwc_dec_version (the version of the UBWC block in the
display subsystem) for detecting the enablement of the UBWC. Use only
ubwc_enc_version, the version of the UBWC which we are setting up for.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 5642f3bc3568..7b92082d35a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1781,8 +1781,7 @@ static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
 		uint32_t format, uint64_t modifier)
 {
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
-	bool has_no_ubwc = (dpu_kms->mdss->ubwc_enc_version == 0) &&
-			   (dpu_kms->mdss->ubwc_dec_version == 0);
+	bool has_no_ubwc = (dpu_kms->mdss->ubwc_enc_version == 0);
 
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		return true;

-- 
2.47.3


