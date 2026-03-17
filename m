Return-Path: <linux-arm-msm+bounces-98226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCqPDIdzuWm8EgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:30:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E01FD2AD116
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 43FDF302C720
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD24D2D739D;
	Tue, 17 Mar 2026 15:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H5hq37/Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CmrtoDvI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01E97E0E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773761411; cv=none; b=XCGdE8gghDBv7Oc2yhBSTH11iriRLv53BasUCDIRSr9h4r4NzYkYUFbzfORwtonwSRHL4XGv/wPS9Umrg+sa2f/VRIQH2prL4FX+sBjnSyyGW3w88EnftsWLxBFIMdUtyvaXuWw7V6HpKVZDOLRTZhnsBfTAuCLeJVd3jF4qMHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773761411; c=relaxed/simple;
	bh=fiS+v1HmnasQUzAggFrQFAVyqQDaaFzdUqmjR23RuOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gLGMcZSG7npec+vHQ0Rd279BQcM0qgRPP3T9IhjNhqPpz7jZe6qjyLfp7/Ow3oU+fWMdIZ5HwSWN47GgOKthtHb8Ske1byNUtSgnwG6bHy4omhNR3RVJsE9fERRJm9HC1D5ZOIIrjB7+7YofSs3+adHoRPIIzeJPF0Hh0EEDfwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H5hq37/Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CmrtoDvI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H9IPP13102148
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2hqyYSaS4VrNG8NPTYVWAJ
	QabhTTesNn0LmRhzY1g/g=; b=H5hq37/Q+b4kSAPhz0LvTLga3y5Z3DySsip5rD
	rI6qq0EYC7pMNfVUQQs3G7IwOLqLAO6k9l44iMOSKxYJb4kvkLH1wIZkJlO91JrC
	qXrS6KhW8l6rJvepHOYFmRh6cS+Ir5wf/oBOHF4k83LQRthaCLbrBnlYNbqV0SGY
	b86Yf8F9uTVbqIq/peKr3EjyeNUn+D2+vbqw3gsWz4rons4P95x46TmZxamf+4bA
	U2SHzmDKAsPQUFQlxBVFd6NAX/93xR5HWvIB6dM3Q+N50in3p7YwBS4k+HZ2+cUz
	N3fFAvxisIWutYtl6f9IYLr/Rxa3y04t3zmmVXYOfSzpY5RA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxnb7ce7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:30:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cdb995a1bfso3936245885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 08:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773761409; x=1774366209; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2hqyYSaS4VrNG8NPTYVWAJQabhTTesNn0LmRhzY1g/g=;
        b=CmrtoDvI8d4tveG74nhplEL97LNXAbQXXeoswIWhdKpfQWNAWoVIRnHj9YTpWtsb4/
         w7bTZaA8Qjdi63/OX27HbcJmzxMF0Q5nrw50EicpRjhsUUfpsX0S2tpHlBvug6zHUV+D
         KbRfEdvUJEtYq02o87aNFv2/Qjk96iPstOnxxtJhTWH9znqhU3ponl6D+z5NW0g8jDeJ
         5lWS8t3CEzVVX21TDCj4Fc3qzZsUecnrOluyGO1hqaia5YZkBVCLh2780fNdeauCXTFN
         XQGgETkBqIhjbVziqgUO9RttVhF2c4tQpVB4rbbAfRMuAX+0Vlk4fyTBxPaxYh3EO/FY
         624w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773761409; x=1774366209;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hqyYSaS4VrNG8NPTYVWAJQabhTTesNn0LmRhzY1g/g=;
        b=bXDfIuTDU8b5cQawKFFqT0+4vdLzs1c58LSkdyg1j0Euz7St6ASw7ySrARHCULDitg
         SAePgDcPRd8K4Ru+OTFu1EII8d8v11PZzr3TY/M95meXza4UZwC4x5sp4lsGC502Utta
         7sSKOQ8hwpqZa5Ul82F39xfKAxrbEvwvxRLRxBgzjwD2oAtAPlsYPPA1hQ55GBjold9t
         PacLm9EPUJwzO/5TwjSwszkt41mwuI67PeO6sL6DkIN+IeCRvGxpg1BWnYeeALGCk4/k
         gpL/cD+QXfn1+dXZmzYbeSxxw5ERtgZjpMve6C4b7Jq6Y2860DjcrapK8WSGQc0ydcDk
         R1kA==
X-Gm-Message-State: AOJu0Yyz+sw6RWO0KUOm2RmvWrtcBs+GK2w3EdysrYmVT+XiWper7l3r
	HohjRrjmdZwQ7z5yUBrqLcgwRHFgKw7ajh0n2hjRq87NucLb8a+WhEVlw9tYpCxZLSUrog5AQnT
	FKUK26IAwo+s7CmBouyhkHMoAGbiev3uOcDv0wVxwKiwpQFRBSpReNnSjUybxuOEfhr3x
X-Gm-Gg: ATEYQzwjebOnud2DQLRBIA7fSMN93dgjS6fhxKd5xmrN8jDZ5ImpSwIwtDc+cJpL/R8
	/EjxT42AAEVOD0yxXE8LPravPdzqBweOfpaEOYHWQ+ncuYJO7cIneTS1vygD+y8alCtJ9gAWvlh
	BR2lOWIRqmKMqP3WPrVB/AtCU4ZP4xLAjT4S4REoJG5H+MEzmMLG+yZMEKXMf5hk6OCQ7f7Gv6J
	RO/0c6qd3W1bej+t2m9SIRYelr20g+++eeg1n3/s3WHv4xlR/RSBQKZzw01k2PqwbrLLzGCxUFc
	ua8j+edJLG3seiz+rqYPckyN3yfOQYg4wbsoC+AXSTPLK691S65hDEpVx1NAFg/gBG3oVbgxKno
	5fT0veE/R0mzukN2+tAbzCy59dENDQDezKT5fcBbUg/7xnee9icN+yLV8jeGkmFeJxFbb+How6t
	+FAFCZbTp6z+gW4gV7/x1Y5aX1UaNNnxZkgP4=
X-Received: by 2002:a05:620a:40d3:b0:8cd:97a7:a343 with SMTP id af79cd13be357-8cdb5aa4d3bmr2317517885a.36.1773761408494;
        Tue, 17 Mar 2026 08:30:08 -0700 (PDT)
X-Received: by 2002:a05:620a:40d3:b0:8cd:97a7:a343 with SMTP id af79cd13be357-8cdb5aa4d3bmr2317499585a.36.1773761407484;
        Tue, 17 Mar 2026 08:30:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e630sm4121394e87.26.2026.03.17.08.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:30:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 17:30:05 +0200
Subject: [PATCH] drm/msm/dpu: don't try using 2 LMs if only one DSC is
 available
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-3d-dsc-v1-1-88b54f62f659@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHxzuWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Nz3bTMCl3jFN2U4mRdkyQDc2NLc/PURENLJaCGgqJUoCzYsOjY2lo
 AMZ+5QVwAAAA=
X-Change-ID: 20260317-fix-3d-dsc-4b073977ea19
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1391;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fiS+v1HmnasQUzAggFrQFAVyqQDaaFzdUqmjR23RuOE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpuXN+ZPtoJCWvlZeEDtkMzjrM4xDUmcWGMh1aJ
 84QuQJnQi2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCablzfgAKCRCLPIo+Aiko
 1cA/B/9vDg1tz2ba7zdh/eaW1Eh0xRGsoAKWUcd6aD2nkw2Mhc0O3uHDvwxwQ5bgsLKLz7jTU2G
 R3Ej03EzgJvClrTVEthrh7FIb7Df4xaTuHwvAop5em5NKPC/VX8MvAkFDIEFQFqiAbQQYRQY8hp
 OCYiX0gvhQfS7RIhJOYaWMd3/k7X54I8cMxq92LHVWRJj8davFeBCfGJ3FKypAvP6PftIV/8jKx
 6wP2Cp5IVnBqx1a+DYhcDu6cv3w0B0mvWEe0LJG+rSGsHso7awlWo+/RiXPBbh2N9b9Ut8jqHzK
 hvNm/SFao2/2VY/Vx9vGYZBNQaCaZArOritgb7HHi0twJ6Lv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzNyBTYWx0ZWRfXziHAXqNp3p6N
 bgBPnkLopaAe+yxqwX560qSB+prMR15f1/av/iQQcWBZg9BN0DuyRFrXKC9zYV20ufpyJc8KdMC
 2aJe+4W5fOnu/zMg4jMUmx1d4rQ75ntUvQymuUdqAqWVmiX6hIx7l40gPW0SrDU/gTup/wjs61Z
 M+pL5K8zUjD1zBbAF8uESatc59k39fJaRI9/VjFiQAfuGY+QlNDo7if1UCv6l367leWYJLeuCjJ
 xmirNFCbCIGo6BHVj6vIV5MLG4tS/36+04jGXp+eW1Sz9cVlK48FtHkSJN74j3CmN8D8YwzKq9x
 vCEDIeCerFjWnrNSKuJOdxXPpYAHmjgtMnfR9ZK3QefqSRotT2Qqn6s716lDAYJyV4I5CHC+ms/
 JB1UNdNkPSE2BSw+RoHnzcPhiFHBHDUFBwN/RmpGPEkMJim8E5cdn59uNTiRiUoU/O+wwAWL01N
 eIhJL4zLvRh4h5i1MlA==
X-Authority-Analysis: v=2.4 cv=D7pK6/Rj c=1 sm=1 tr=0 ts=69b97381 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=LbxHV1oPoWewQDzF:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=yYukBbz9-KCo0coATbYA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: oqOgy25NnXTpCADwdO8fnTlecKHZ-s9w
X-Proofpoint-GUID: oqOgy25NnXTpCADwdO8fnTlecKHZ-s9w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_02,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170137
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98226-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: E01FD2AD116
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Current topology code will try using 2 LMs with just one DSC, which
breaks cases like SC7280 / Fairphone5. Forbid using 2 LMs split in such
a case.

Fixes: 1ce69c265a53 ("drm/msm/dpu: move resource allocation to CRTC")
Reported-by: Luca Weiss <luca.weiss@fairphone.com>
Closes: https://lore.kernel.org/r/DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.com/
Tested-by: Luca Weiss <luca.weiss@fairphone.com> # qcm6490-fairphone-fp5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 6bf7c46379ae..96b67ea3fb4c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1410,7 +1410,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
 		topology.num_lm = 2;
 	else if (topology.num_dsc == 2)
 		topology.num_lm = 2;
-	else if (dpu_kms->catalog->caps->has_3d_merge)
+	else if (dpu_kms->catalog->caps->has_3d_merge &&
+		 topology.num_dsc == 0)
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
 	else
 		topology.num_lm = 1;

---
base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
change-id: 20260317-fix-3d-dsc-4b073977ea19

Best regards,
-- 
With best wishes
Dmitry


