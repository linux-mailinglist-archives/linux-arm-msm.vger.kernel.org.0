Return-Path: <linux-arm-msm+bounces-97224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOuwECXAsml5PQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:31:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBD8272A29
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F1E73039318
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5EB63C6A5D;
	Thu, 12 Mar 2026 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DPC7C6Bs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EWmqOyVH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A2C3C7E0C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322183; cv=none; b=rGAYZrl25jg0aLngcEBjRp+vAiTmukWyYcHxWbxu2Zs+Tz6egHMIfrobwWNsB0vHH+I3rL3dxTW1D6cmFL9wFBhfHun/u/MyS3e78H5W+QtdAZYf9k1wO/tcY/ZKfpg9MsBixRTRDyO0eSodSmNzX9CRcumN2eZFEzpusk/BZR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322183; c=relaxed/simple;
	bh=DVzUVHYL1LwQyydsa5bse8Qdux0+ATejKvt7PdcnILs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kx0qvqhTjkQNXisWC9F7iOcB37z2wtWRlfXGM1dYFFuwEoBpNiYX+MRi2EuN+pvs6aUE9/B2WW12EqnmnX3BFyoug1J+3JxMhll5aLon+K0uxW/rXAhLfza9UQ+FTyEkLGpLuDh01Z2r/65OjnWo14or+cw01n7f7lz3Tsf+t6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DPC7C6Bs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EWmqOyVH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CA4MWO4026468
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l4shwfMjGLnh2T+SL6QX2H/uv+6YZBYhzZVvBdIDpp0=; b=DPC7C6BsDEQjSznf
	kkKXFAEyIoMNf0D9kut8GIj4Lh/VI5vn3KGqcZJyv7nDDMWwGmk5CJEopyz1Fym6
	awbeyCvhPQVYuyGz5QHxahcpZ4BBlIaFvuWGkf5Ln/25YuuEsASx8SmswmQr0Or0
	Dippv63PvZ4GJgGf93NAsgDCjdOHjY78m+V6i1/LDiY6pGE4Va+259aGg8j70x/y
	Mt3kQ0sebFNHDaPTgbaV7I7lUcVCT7KI8P1321+3vlxrYcJNkz69gsQ5aqNow/Ek
	HwQPAw8mQN8MZ5ciIsNb5SC+MIxxlNZHRmHM+ytyxLCoI3ly9bxDC/fAA7O1LFHA
	1hatfQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54t5qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd820c6a4fso887794585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322179; x=1773926979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4shwfMjGLnh2T+SL6QX2H/uv+6YZBYhzZVvBdIDpp0=;
        b=EWmqOyVH+E4vN/A2+30fzPtNXkfDLAsLoRVVJTCyIKG7hjAgY3HLtd8+pPXClNMgnC
         iIwlqvwvgHhovyzMPwDtq3lvF6LiCjz1cyUSWE1yaxD+2A9PnwJYWY4VEx1dfNOiiSXj
         gYlDGbCzZCQGqrZ/FDpXuNxgfgKn3iyOoxfPhTNP1oSWHNTDpt2Mv7O2uhOKYuF8HjRu
         VN3niRYPd92+10J11HaMOek3fw9V5+dsS8NiY6sqvT0eYz9YRyoeuiuZCttr49xcuFam
         ggdDRV/jGTDj450LmX2UtD1Q22Ua2ioaljrCyjTMSgKTIYmSPG63Xsa40GENH7/1zcN0
         Mokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322179; x=1773926979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l4shwfMjGLnh2T+SL6QX2H/uv+6YZBYhzZVvBdIDpp0=;
        b=Uwf1U2yhX5oX/khfpoQzlr12S625rMKc0XQmNTvgAJhY/ouNcqL1O8JNACNvhUYc5Y
         hwHYteDSrYf0gyjsx5suHWOwXcZFPX+Gvvuu3jKFUtcl06dC/tqacAmMhPyijyJnAeMp
         yMgEVlJa0mX6QvwhiQFpy5HrgQsQnumQjc5fo0puxMmEmn0Ptu67EMQalZtqxuUFKFvL
         rJwFdK3xA7X14Id5p989NBe0Ljijqt/jAqZ3t6WX1KBiAbGlRxjsvuQyV4FlE0L7zowl
         H8r1TDGa1ERAE8098DJcB9rn0Kxqdbrrc3JuXcnrTsR2d2twV+H5/kyt5/8EaEDBef8k
         Y/Xg==
X-Gm-Message-State: AOJu0YxIjru83wZDtlWww37NbNErqSqC3Kst/WGE2WPXyX5W54qoEt20
	eLsnAtuv0ZEpoYVDFLpKSk25G/MURrLLzXbV3LXuky7B7FiS/XtabF1HerO60zuUdLLpqKFDtIT
	c0cCa73mBHsVYv+ZAq2jDAumweOw8KlcuZz7873vaeYi4dPRSdG8Om6NovKxqQ6+XOTA0
X-Gm-Gg: ATEYQzwP3R35/hoqtNLD1MDa97n1dkDJxeDv5x4ROx6dDJ/MbvSl3vDx+3bBBWrkytS
	LjYUs5qGMDkpnu70fGS7OE16OZJtfXjmTTwNYO2tGFlt9yQxp0uu0yHzYuC8DNZA0or7UVIQeDC
	xZKw/ghtwbTyNT4sIpRdrGt+vhwoJowdaEHqMRIcZLImM+kqKiR5L9PaCbs0HPG9cQ4QuIsqd7V
	Nfj7qDFUT7wx8WkEsX4hYXT58YKMH1d6NSdmP8RYz6wMoszDt59GG54p3DPl22E9OtDHD3zaxGr
	a7B3EKxZpru0K2uPPBV2xYEfkhbbP22ccoP8MRpF3i7vWy971sLGQK82a/TbEq2hAM0qHLHCIQk
	cp1XS+Ns5ToGwZnXmFONIL7khclBvW1ViQ/SVRutZAdhiFg/kvJuIApB4PIHOKQtLFo+KI8HK91
	DOFFzCOqEMP3+qz7VR6wNVaZUu+Js8iLJU3y8=
X-Received: by 2002:a05:620a:450b:b0:8cd:75d9:f110 with SMTP id af79cd13be357-8cda19b9e65mr792733085a.12.1773322179392;
        Thu, 12 Mar 2026 06:29:39 -0700 (PDT)
X-Received: by 2002:a05:620a:450b:b0:8cd:75d9:f110 with SMTP id af79cd13be357-8cda19b9e65mr792729785a.12.1773322178927;
        Thu, 12 Mar 2026 06:29:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:29:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:25 +0200
Subject: [PATCH v3 04/27] soc: qcom: ubwc: add helper controlling AMSBC
 enablement
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-4-b7e8f800176a@oss.qualcomm.com>
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=758;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DVzUVHYL1LwQyydsa5bse8Qdux0+ATejKvt7PdcnILs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+1jSF3ceUSLZoScyBFkXU1mvss7emi4l2/n
 fwzAmEbAUWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/tQAKCRCLPIo+Aiko
 1aQOB/9CNdjt8rSQCnJaGvFDn+NgZIMmvVSiFhBRy2x8PweKIs7pbwve95+HWMQnvMeqLzVl21A
 geVE3PlbctgE0VpzqH3oKtdh0GfS9jL6TVYmt91IhtvvIQWwCNP//5OejC1WuCbk/o/Eh27uwYZ
 MCpmDESQBRaPQgsNhq3hMzkFEyalUVse3AbWYJ4sVHJo/Vg7rOtSivIcyswbZyXJPSRS0HUOdMx
 Nc3m4yrNtiWo4BIb+ZOp6yRjtIx5cYMwTJzrKtQr5agQ6bVLIU0cM4/N8LKlMbLpmX625rxIsAx
 JGoUdpF3BVmlO3R6vFUERECdwHib/DMO9Hb9UJRg1tMpVa+Q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: mZoeQOSqJlN4L-jpf03dBPVIH9zXIKqj
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b2bfc4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=WuC1ZyUpIfxNvbBu5HYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: mZoeQOSqJlN4L-jpf03dBPVIH9zXIKqj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX9MM+c/49yGHH
 EAbyqn8cCvc1qzlKKU7Z9GvaYTLbZpIKXjVCvj7laK0uM59jyFUQoKOAW/w2zK5WwdtJAyb1SH7
 B7JRt02XqrKBms2ugukdeDQNLK5wD2LMPNn3rjjQAsmYFOmoyoNCcFi51jtBmwAvUzLQJnSfFJs
 XYK8+iuKp6K4hRxj0jrcJGC1jt6H8tIRh/jPKBmpgvQgmh5MZtJqQSFRIN4tl9SQ/L6mUufa/V7
 YM60TTrMTN0PFByvwVS6xjKWV3ziMkSfSNlY9IbzkyhIqBQKklGxtqityTKXTMcBjVTe/7fNK8g
 q/laRLMooTuZUG3GxDvWRUaMpRsl1xy7rKZXETrkAfrbX8OUsaDNS/PdJlgAEQ6cqcM4BErjTJg
 LTospbG0jNXBY99MCw+jUq0ZHqVFOjn0R6XNWRaw29KoA8Ig8wdj3iSLZSnqdw/fYXWWcukfp8J
 6sNh2QjMaIoeDSyP3Uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97224-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AEBD8272A29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adreno and MDSS drivers need to know whether to enable AMSBC. Add
separate helper, describing that feature.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 8355ffe40f88..83d2c2a7116c 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -116,4 +116,9 @@ static inline u32 qcom_ubwc_version_tag(const struct qcom_ubwc_cfg_data *cfg)
 	return 0;
 }
 
+static inline bool qcom_ubwc_enable_amsbc(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_enc_version >= UBWC_3_0;
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3


