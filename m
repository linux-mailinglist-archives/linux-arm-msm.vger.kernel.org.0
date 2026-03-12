Return-Path: <linux-arm-msm+bounces-97222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPooGdW/sml5PQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:29:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC4A2728E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:29:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED87930300F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFE83C73DF;
	Thu, 12 Mar 2026 13:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWa70JMX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SQDkKkHc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F38E3C5DA8
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322178; cv=none; b=rs27aFVOAGWQrnCmNkcJaMIos+nb0NeI/E88arbxM+ytJz5MqbCNzcRLq34Pu26f3VIfYtvwF78CoHqrShQAEC2Re1NYh60Fea4fkCBRK0PybhYHqUuHiIy3otQyZcUj4fmsuLXVV5096zrwdlwqVDAJJ5d59RI+39Ggs9c4krM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322178; c=relaxed/simple;
	bh=0jnnTKmBVzx8ajx5YR0+k88TfAux9nzkeECglU8qUoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JluG6cDFTY73dLk07emPXS7ZFnq9pZezzDQclGO0uXzNHFt2qtDNOESK/EAcPrU1z8ZvirDl32LNTjLOz/daUF+KZE6zmIpFNLdxp/akEM0o4P7h1M/GERqV/Bg2ZeL3vv07cmTYUr+COflMGJL9i+Eea+5KCqd1qdjzvOcMaS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SWa70JMX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SQDkKkHc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9eMsl3666914
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DhLMvVZQbF3J03WMc2id/1RoXxcDZvjE9wQx5sGd7p4=; b=SWa70JMXlC0X12dL
	AILf+ASk3C1/ih8h8qIVooo7H+rlrhKpgMe2ulwlOcf7QY63JzAHSTDXo4AKqSts
	TQ2rpd8rpUe0vVfA8ViZL1X9V6EoWYLPcCLQ56FEZJFbDCtvg1u2oGs0useMGNp0
	IveZWx+b60ZBUgqcdoTliEB6oTSTcOVMzHI51lFrLrZmJe/UJ39PDbO8E63BePtq
	fBYXsuoc9zmsGgkjXUMubiyngQ1O+PHUv4fO+dQaHJgIaZEo08PSiTcOGjWZw/+c
	bV8Os/xpfSROl11ST3v310k44uw+DriKPjRFKpmz3peAiYHpTEMHy+qLYc8D9MIF
	6XtPag==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh60j7s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd773dd409so140689985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322175; x=1773926975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhLMvVZQbF3J03WMc2id/1RoXxcDZvjE9wQx5sGd7p4=;
        b=SQDkKkHcO+fWcHYtmCbH7zqorpVocF9Atb5FtV6nUmE4Kkn8U8Tsokiw65OCnV1bxC
         M6nDhqAqQltLDO4KxP3zD05wWGz2qPZJY1I9W18ALVNyWeOyq7nCybs4GBGHmQlPUyuL
         O7NC+yOdPJ/wmeEnZEURlggBW6PXHkk1u9tmOjFYZLp+uznDSXUbjVpIIvfsPOHaOQFW
         wAZODeK6tSjUmzUbvMuExYH+gqfVSZ3WFB0Sjr/XFi7ssHnbl4Ly+0FhxXpBNd12K1UY
         nY7QmpFldjM3AGgdRUOWKkI3lcwJrgV7OgHor6GW9G3JCS5QUipDA2HtNFK/kczAUp7/
         wpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322175; x=1773926975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DhLMvVZQbF3J03WMc2id/1RoXxcDZvjE9wQx5sGd7p4=;
        b=GI6ATfvqAQqYWB2TLVWrrYociAEDRAOAXMN6cdEzx5xkXoFBGvJMlD5XJf8fTXeOev
         Pf+qv9iDhqU/Ntdj0ZardZgI6e81Q/ShbfupgeR2AhxGb04acjOVcyGniqsoCjmipKuk
         P5oFD52lpbtmrZ4I/6Vg0NdTQLhLCccGBKiA1wQDQgkn8XuzvjJpa3j/j0NmlwtpHKMU
         5I3IailOsz4Tf3Eqk8DB+r/Vxxv+IIWALh7/LWSp1VCf7dW2GHvrZuMGoxHghc/oAWZW
         NONRLvlvVfgDj0sEc3z45SZynrjrBNccBv5vgJDXhfGsCTBZgFF0nZGJsX0D++niPB2g
         6LBg==
X-Gm-Message-State: AOJu0YydizRrDvEptHFxHeHXLn1EwacEXniakHP6RJ/Lc1eq5eaBVAcC
	SSBaRA/Jw5xQ+YDSTz8mAZ2YmQVaJ31O/nI4ukb1U36XZoZmV3rw4o+iLI9sSA42QVcDZkh6vmC
	CoZwMsxxHxgWmvNUt0vL6wS9r8Tnk4EkcxTq63JLNz4IQmY/ahsTj9DVDW07Vlkf/7Y36iIRz8H
	COntE=
X-Gm-Gg: ATEYQzyySHsHCMzRp//pl1NIw490yIrzEBeS06ZMsNTwF/vmqx7Xd+HdEv+aiOuvYD3
	mV5rpmmZVyS57U6+bpPs2bK7jfpFCd9RupxxOFjly7nriXlB9kM2p40tKWZs01H5MR7czaGxJ6K
	Evnan5jNw8oskQMAdp2qxDvHjXCK5polUDKjrpk6RhkuUutlmZk8JJcgU8TL6/XrK2oybblel9G
	d5dW2NA5O4R1W4WD69Xn9zOgstZeFKmum7/7FN0cMNx8vE8nEBKflB53kcPl8feUcOImwWVWxLu
	ZXVK4PYQPFZQonxBtB9RNYtiU1tEghL53a/rbC58jOV0Ol/olztwrKful6YPpTH/DJUIm+2YfAA
	CYbKv4QWH02or38U2qYQc1dikwoymCfnfRHFRKt34Nxdqzm5Cp3yzTp6g+wbbAgCOaqGN/ifQ63
	JpW/05v0vxbscyuXGGxIyZhBEhqct8VHAySB4=
X-Received: by 2002:a05:620a:4629:b0:8cd:79aa:6932 with SMTP id af79cd13be357-8cda196c6a1mr725103385a.30.1773322175292;
        Thu, 12 Mar 2026 06:29:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4629:b0:8cd:79aa:6932 with SMTP id af79cd13be357-8cda196c6a1mr725098785a.30.1773322174729;
        Thu, 12 Mar 2026 06:29:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:29:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:23 +0200
Subject: [PATCH v3 02/27] soc: qcom: ubwc: define UBWC 3.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-2-b7e8f800176a@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=914;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0jnnTKmBVzx8ajx5YR0+k88TfAux9nzkeECglU8qUoc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+00aU84TlXbICszP5LjuDGDcyy/pSUTU05q
 g++gL4431+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/tAAKCRCLPIo+Aiko
 1SUWB/9sOpBSd02RZ4YD+QhJMIY6PQ9+GWRAmfC4iYUMoQA0P2RHGhA5F1fyMkpAQM5oS2d+NEX
 19vaOHqqdmZMVDImQJF/4+R9TqQTbTb9u+Y2MwdIZYTeKELXF7tULAiiOZQ1xG68Mw7eamfi/bS
 PMWPhcwYdzNfRYwSiMbJNN5YG9MpOf7MB/dRDZIK5yaM87E7d+G2cb5fHbhLEW4Nsw2kQmXiPzO
 /YSsS/uilico0uYf7XWiuoVNh2DguGKSWf0Maulyogzml37RT2cAs5V+zda2hpTlG/q0tsomMjJ
 c5lt2MjCfgbAIb07/spNuKFWJFDG4SHtnGnTxYgpUNOhKH2t
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: fx_SpwpxYevI9v8UVdB9e7rSks9P3jZ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX/jGtprUvMeOE
 1Oz35VRNTPaffAMPHk4mdO+aO0zcfeZPiYJKBgte+Fz8jWY5/nos6Hv/lLmascVVHlKsybqo0Ed
 AeFqEjsQDzD5V3tTKhOP0RxucDnVbbwMBNZJtTE+bnqW2vtLo7+a12Tc/vW0d4ZckvpsysR3Qmk
 hdq6Z+632wnPTLgkbwedRq9G1j7egkq6jRt5KjoMhN1oTTKc/uwW007rFDlq+QTlmzCRTUaLTev
 7A9zLKTrjyNWAPrYDYaCa6AdJPQVG8Mi2CKb1Ei3/VRsFULOnDYUbHddivv3PblvJ3vKNUZlQSv
 nI7VYujLNgOG9LBELisSt6zNrdMGfbnKriATvp6MAq/y82EgzPzBWOiuoF6rYDmdZWHhHzORucm
 bF3Pw+RXrFGq8gxX57Zsg6KQKlbK68iO3kt9EseZePo4fq1P4+gqdeZgG5+bSlTQIK6t7x7+9zr
 B+BG6yAlGUmTZYo18Ig==
X-Authority-Analysis: v=2.4 cv=DsRbOW/+ c=1 sm=1 tr=0 ts=69b2bfc0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=o8D1m1ilSIXDguKSM1sA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: fx_SpwpxYevI9v8UVdB9e7rSks9P3jZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
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
	TAGGED_FROM(0.00)[bounces-97222-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: DEC4A2728E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Follow the comment for the macrotile_mode and introduce separate
revision for UBWC 3.0 + 8-channel macrotiling mode. It is not used by
the database (since the drivers are not yet changed to handle it yet).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index f5d0e2341261..319caed88775 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -50,6 +50,7 @@ struct qcom_ubwc_cfg_data {
 #define UBWC_1_0 0x10000000
 #define UBWC_2_0 0x20000000
 #define UBWC_3_0 0x30000000
+#define UBWC_3_1 0x30010000 /* UBWC 3.0 + Macrotile mode */
 #define UBWC_4_0 0x40000000
 #define UBWC_4_3 0x40030000
 #define UBWC_5_0 0x50000000

-- 
2.47.3


