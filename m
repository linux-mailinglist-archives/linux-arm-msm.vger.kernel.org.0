Return-Path: <linux-arm-msm+bounces-95884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL+lB8wFq2kMZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:50:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF233225763
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 523C7303A6D2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026973F0767;
	Fri,  6 Mar 2026 16:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YPKou1Ck";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GdcBwZre"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4D041C0D9
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815657; cv=none; b=Nv9axorlAuAQAjuLq5QyP/+I3H1teG7JdvvA6pdN9J6KMy1ZfpK9d6P4JiObYDZuUFJFF0yVYn/p3bu8nQR8aHlvX4NUUKDwtaLUHPRZGKZowzkqrYDv1DVTetfWBSclvejcLLylJwp/CJqefc7LAn26oB/zlA9FAO419LaO/Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815657; c=relaxed/simple;
	bh=cNUVi8GGg8ORsbdj0ijaFrB7Eb4PIC5uP3bKn2pf2xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=egA6Dkmtazh8ZNoEMkLHgYuHPhG+yWnl+rezE0YYcq/pd6yxpBFjWSwfXh3cp0B/wYTtYr9tpyeKm2jOboNhH+oa1Ytd2UR3DBWDBSfYY8GoGzVA6fsyj2JmK0fdnUn1qdhWBv0sCvyLOGNVPLO0P0AWtR20Dzz/k0AOCLqJgkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YPKou1Ck; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GdcBwZre; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FrJj73960155
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3wMwGrhT+6wGV+QqWZ3abUAX5y5DEnILFWoqJJJ8JfA=; b=YPKou1CkHJyybE9A
	5jcuN9qA22CrCflNrI4lc0quCx1cLiizxT/7tr29ZfN6gkEqzgyd/RG+gOSlvk/x
	BOPTydVfGa3wK5AHZqfdUgvgjARpQ79K44TsonjH468DxZvkbX2KmWbcAA008aeH
	2pVCNH5Up/AmFDNrITTWqjrsDuWLV5X+8YV7m1SG8s0jZabKxPlmwB6ShC5w/DFs
	2dOs+L9cmGtVo5v5sFNTIlhMsDOUP89i9xUCcM3uO7wut1Xjd03IvHgCyf43ZuD3
	sEH/AG763dh7bBBInZ9LL/wpDcU16h7bVyDW+6RSHxmZsdAbxAxDaFxJ53Gq4Kf3
	+XE5lQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u9ca7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ed6c849so2001419685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815650; x=1773420450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3wMwGrhT+6wGV+QqWZ3abUAX5y5DEnILFWoqJJJ8JfA=;
        b=GdcBwZrebwTGHEWEfubVhgg2CXSGl6VTfyXYxqno6v7eBBK0iC2Chgqg/q6QTAJPlb
         RqXgNJ7dgVqE/2AutRu0Kg7b6Gm1GbCgXSlNPbLkUyDtMbd0CLdPQqVWZ6gHbfGc1wxT
         qbtnyi9D+Umu9nAkMSUJjIAQXsWYxKnnozHnUslevbkWWjIynS3ufO5OZwMWl0fbPrpQ
         WfczcEfnQuDIqxrRrLP70wNybMtUkeVoM/PWLMmims6OghRhNpumqfNnIkm8eoXuZ6tx
         jbzblI6HSUFXAyarltLVcN8EnJqDJOKXy0oazTnzf4ihGvUwkJfI4oeOlni0qoQblcsb
         pRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815650; x=1773420450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3wMwGrhT+6wGV+QqWZ3abUAX5y5DEnILFWoqJJJ8JfA=;
        b=KWtpNJaL5Zf9QzyJML8wQf6WAFc7Xs2K3X2vNXkyVz6oJD4EpkSePAfaGxyOtwazu+
         ykQuYNzITs1dhWMtmZXpNKT+f581fN7/Sx5KG6xab0v0l/V+Onodm5Yof4YNGb2Sw1Ti
         o5NopkDpcbFlM3nZsdEfy0JQJq2gyx434utTR7mN1d20UIPRgiAwaVRWgzQLV9TKCPt5
         XLM5E8qLxj/Zi06kh9e1IcuOY+2ackKSormqgmXlZkmLkUxquybWM8BkqbWb0V/lbceu
         ifLybmJfRwzMQobMYZdGijhdm56PL1DIYr/g7YiK1OA0b3bN2WurVQBeN6KQ9/0nncaB
         cOLQ==
X-Gm-Message-State: AOJu0Yy5tXAJsq/5YQa/8as81WnCz48Vs+bDaeoLptgXUI+U3FBzD48M
	tl/4guKqXs5WsvYLA0H0oGRtFmwgUfrirq/OcTlUgDlHQodfzL3zP9ccySOlytog+8zrRJKKdJ4
	1ROjMQfh4m7rvP3RhPH3Ro2mJ8HEr9lKQ2foq8UGBGnuFsOHOCVmRT1INx/kNSb0DwAv2
X-Gm-Gg: ATEYQzwDvvn63w1aXYS6g7yHeb5FPFq2plre6KoZzuc/2IC2t7sW+NLtwLx4lmIhYMd
	FhHH+Mrp6HCrxQqS719r75bxyjDPiRuGNh0gMLFtLOYFx+NoDAN44IALdwUoxFMiJxAaB9HJI5U
	UF7E9wQGPkAqbNzq8HF6GMzJHZZ1JW5005iqxo31FSZUUzKD9m2i83Y9MoZqfEIzS+ygxPFkZUU
	wsBcskbtDiMIBPaWJl5r1dAW8WjkxIsmGLyauJrweBdGI8+GRHDWT7pT7k3pdvx2X/GbeUnyMUA
	LWpKEBCxZ8X3NpDvG8VbDCb5SupP9QhqcZ+uQ5y7Vktkol8xYRE+8/CJj7BnYJ2DXiWofR95VCM
	e2OlrgbTXUVefQ1eQlOfS69tEPOBJkDxQr7Y+FI9BVfePXNbPi3Fd07FAqmXX+JB3bRD0YYqpPE
	J5oLsS9d3iY5kC1o7tlhVWRj8MqHO5yP3ppo0=
X-Received: by 2002:a05:620a:4044:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cd6d340439mr333988385a.2.1772815649883;
        Fri, 06 Mar 2026 08:47:29 -0800 (PST)
X-Received: by 2002:a05:620a:4044:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cd6d340439mr333984785a.2.1772815649299;
        Fri, 06 Mar 2026 08:47:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:15 +0200
Subject: [PATCH 09/24] drm/msm/mdss: use new helper to set macrotile_mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-9-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cNUVi8GGg8ORsbdj0ijaFrB7Eb4PIC5uP3bKn2pf2xk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUNPNyiAskeVyt3JIkN4/qJnuZp3EfyQ2g39
 P7v4Dt6EumJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDQAKCRCLPIo+Aiko
 1XG1CACMWskmpv/iNW23lzWv1mFDidXHoBto5XIAMA9A7lhfb/9RI5NBL5RgT4LQUs95Rih5S5j
 lh3wXtUZGipqRHeGt4P/rdhwQPefTZ/UFe7Wq/IB+DGeaHDTjqiFBhukQlN+vDPUD3yqt9TyQiQ
 bvKOeAPFl6E7uh2BHKp99b2/r0kYcESKOldbx+d6E27ZQB0Y+qH7CoGABKnOAXnwJ0HyOtSOSO3
 IjfxihtojQCK/EZqI8pte2fbV85pVsgB7PXZ7X7ro7KYxKx/1EfAnv1Xl0ZbglA/mrOouZTAbGv
 mfz3wyuinPMzaKonkt+gbSZF2pIn0/b0ui1EPfwcj6zRYnnA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX/uqWZuc5lYfw
 t91R9K6eAe4NddBnfEIi3XHbcwlIXITHRuZfIz/uP/9vL7QL/OMG4sCmshSNbQQo9IElSIyEqPc
 6IQW5ruPreajz+BytHDwE+D3yX64mxj4U4IEzqNVtU53yUD/lucuKsjUCMtL12pzLKUnKf0TzQ9
 q/kCu9M33hiS0wjt0PFoQqr1ipfyg3uSfMrkJG2pS3IBfmImeX1PKbtiCqy5Nzfr5blEUlMPKL8
 gKy2oLVMeCe+09jUEe1myTFP1EZAurmUWqVPVpOhUhfoMApBGFJ9IA/3a9Qj+TKRzaQ2I2OkO0t
 xKlbpxEp7wGjIZrJAzhr/bg1Ns/p0BIVZU+qlGVN4z074zQcXZMAGg83XW0Eh31m1SbAPGuvbxC
 /QPDOSUXLV7jIGQNPwYPBvRTTgqhlAg71NfIJ/0mToSlwekxJWrKTxGUtjUH9vNRGtgXgChjii2
 JL6Rq/HP97/IAOwqq/w==
X-Proofpoint-ORIG-GUID: otBzSCPCeEyX1NvmNV70GVIVS7TDeCL8
X-Proofpoint-GUID: otBzSCPCeEyX1NvmNV70GVIVS7TDeCL8
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69ab0522 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ujCctoy6CNRHcyqwK_8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: AF233225763
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95884-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.926];
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
index 16bc9589f696..41289606407a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -186,7 +186,7 @@ static void msm_mdss_setup_ubwc_v5(struct msm_mdss *msm_mdss)
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
-	if (data->macrotile_mode)
+	if (qcom_ubwc_macrotile_mode(data))
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
 	if (data->ubwc_enc_version == UBWC_3_0)
@@ -207,7 +207,7 @@ static void msm_mdss_setup_ubwc_v6(struct msm_mdss *msm_mdss)
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
-	if (data->macrotile_mode)
+	if (qcom_ubwc_macrotile_mode(data))
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
 	if (data->ubwc_enc_version == UBWC_1_0)

-- 
2.47.3


