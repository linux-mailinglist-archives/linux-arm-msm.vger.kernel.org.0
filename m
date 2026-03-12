Return-Path: <linux-arm-msm+bounces-97232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IC7TOEPAsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:31:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C7474272A5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F346A3048DB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39AEB3C7E09;
	Thu, 12 Mar 2026 13:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fs8BPgeh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="elfAJsGa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29A13C7DFA
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322195; cv=none; b=KRohjw22ONpIWf6qwT7ycv0KcvN9l8VBZdW5dL8YmDLOEtKdwBLwL0109arhX6hGZX0DFmve3ufqH48MiHWZI5tSKybyGu3c2XWplk1sX9r0DWqzvemsCMYY2VxfGzUujrUAzlENDrVxQZHK+cflw2FARiT2KYXmMF00dSUAhOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322195; c=relaxed/simple;
	bh=JOt5df65NmH24+iTFsP3gw/fBTSNHiBWXeHyf1rSg48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X5dD06+c1VDTzXyFuSTfAHO1W0SNH9P75MzmtLUB/CN+Si0KChPAi1+Oz4ozJOhw5G/4K/tnsVNGUbslp0pKmgJgutdINfE6F+FnIFWPwkLTmdDn8cb++rgwO6cJQLlegYHvh1qd1gJTfVy37eBWaylmIw0IZpdCTrEw6vf+8Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fs8BPgeh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=elfAJsGa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9GUgb1756606
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e4LPJrHt5PphqDtRIqvbuMWAWBhobfystAANNIuWCU8=; b=Fs8BPgehBMU6DTZP
	PVmIw6mz39FBtyG+v07dj/+woVhMeJ5cPJZ3RDoBI6AxB31OvZqCRZAWIvbjXqX7
	vCTzkOyrdkD6DJCYfoZJxnhSHhLZbB4IAKxV29VTyGqE4FPsHrRGxFLBvLXSZ8Y1
	QA7YHKiAL1gFIhKQDiQhTxWWqjfA832DswWgmNNmz8aBw1EE+AaYeE+FIkXhbffB
	LNHWVkm4EHk83M9vGB7vmQiLhfuoJco82GrO8OasvVmHaZYtg8gxeiRugFdJ5p1a
	6PWv5ICOsDcVusQ2GSP0RAaJsOEzXfNOb5Q5bFb0SYXskbfssXhhpsDzay694hyq
	Tkyh/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53j6tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7774be64so603749885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322192; x=1773926992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4LPJrHt5PphqDtRIqvbuMWAWBhobfystAANNIuWCU8=;
        b=elfAJsGaoEr12ymcrzFViTKN6WhCQnQWjn1g/pAbPEj6uEIh2DE127gbztVba8azIO
         CPCQbjnuEtCHShXH8EjQmcgwYy12D467J8/gfHXkuLjQsMYkC91HVyNHHtsQ2lnWbrzj
         Mep6ACSbVUSmh3p4qklFavJOvtDatrtZG7ZuVM5kYbl8meEphX20IOZsCbzma6OXTLSX
         vHB8CmM025SaUCuENL1gJmq8ePntAO+EYJ2FCasViX4cmJiokU+7+LPMbC50R49UXRvX
         Df1TAGBaqHe2Nyn5JlpHRiQRaE3TRY3dZYqAU9EjlEFhD7YiLyPYbcaVlPTEeo4ULEv0
         uhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322192; x=1773926992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e4LPJrHt5PphqDtRIqvbuMWAWBhobfystAANNIuWCU8=;
        b=tqy9GhrtQZ6pp3cc7pQSxAt5TNr/blim+EliqGTXlYEDub2xyp9DB3IOks1IfpMht9
         Q4KRUa9eu3x3VxnpOpfg8/ujZdVOnuVH6055ciTh7c0OCMva6Zw8mmJ5RrlApVTghEqY
         3xRk5BHkrQCVtLHMRN+Qmi1bBv7cF+DMPpnP7J3NoNYmQiHKbZOipB97r8iWh9O5kVDU
         fKf3kmB/Yxd4nrvJL9nIliu6rgEggvMexPecEfIOpMdYbmcrw7sMWttge8zBeFdSTkFJ
         CH0dm6/+EU98OiBilWjuCdN/boOOiGB1ueS5+bhejrKcs8b5Bb1kd+wIpbwpsknsG5gD
         cawQ==
X-Gm-Message-State: AOJu0Yxf4MWqYeahcfFSWwexaUALtHQjCgzSPgIQdwVHb3I6qW+Rk85Y
	4Ib+bzjvB0UTs2HBYqYTYD2l1kCzWyGOHMzLqYRUPu0MAp0WikBK3xQACb9WILNgcWcLzaAlU7/
	Qx83vBF/g99cdCwTiW6JuO3XL91Qu3lmlI6ONFL5CWm1wfdd27POudUY0s6dKQ/BOCFxE
X-Gm-Gg: ATEYQzynM0hVZrHo5LWSPfqqP0EqhMiROdTPrr0cvhmI4gCsXoRavAV9W2SnjXisxrb
	XH65/bbKA7oF28idIoXuhn3oJ9zz3olZYa4tvD9WDFMfWe3Sgxgz6OSOE8WL9Mcgl63CfKJmgYB
	0a2L+q/Y3kzT+viioKbID7I7LSso+vsaOV8iZmXpJbogTRbyVRzqiNpsULiEaHE0eGtp6cbl4Gp
	9auffUDFOCrY9yx9eNYxG03heY9mj/Yx1p5/WahOjuTWeLZXjSBgWclbLrlFti4bfbuq1VocunR
	G5LVuIGorSeAfLpjpz8uGKJo77NCM8gpls2veJnRZRSNrfvC1RMNRPIIXRh0jd3wM/qTmn7Szdx
	fngzUaj8ykSO2WiuB7vZMmVqeSbqITYp9gvZH9/IFiamxWu12OyTEFlfb7sNRGL9ssSAKG2Odx+
	Zg7MBzl2ciUW3w2p14o59MFAeFMrWTdCipPww=
X-Received: by 2002:a05:620a:d8c:b0:8cd:7685:760b with SMTP id af79cd13be357-8cda19f6121mr873695985a.21.1773322192342;
        Thu, 12 Mar 2026 06:29:52 -0700 (PDT)
X-Received: by 2002:a05:620a:d8c:b0:8cd:7685:760b with SMTP id af79cd13be357-8cda19f6121mr873692085a.21.1773322191924;
        Thu, 12 Mar 2026 06:29:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:29:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:33 +0200
Subject: [PATCH v3 12/27] drm/msm/mdss: use new helper to set UBWC bank
 spreading
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-12-b7e8f800176a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=853;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JOt5df65NmH24+iTFsP3gw/fBTSNHiBWXeHyf1rSg48=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+2G1HarewjfLVafCYRROn96lUpB/3kNNXI6
 w2kBgXpseOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/tgAKCRCLPIo+Aiko
 1c2xB/sEXxSK8CqsbWxg+V09F5jUrxaXX+WVJmlIxlWPndBSeVgv3rJPo0DojV7UQUS6E8H9vJY
 D8Wuf/kA1Jxvw4owhsqAdkWtOZsJVChbjTeJgl70kl6Ar9B+C96aKTApNTnx+t7+mWG8P+SLT4g
 2LVt4DgQfZwKNDc0J0Jch65BtntHb/DUufYctRcuv59zlFrgC8A5Pdr+I7aWWPOnuI/P93JlCxR
 wDA4rNemzM8h+PolJcTvAJG5POGhafs41REY+XwYqKVmRZl4eu658HWdR51og2JheCMLSti0oS+
 HtSp5bzBesBQ0fbcRhF1LToAehy+wvKPwwTVgkY3a/7dTc6b
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b2bfd0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=vkIeKiNhsAXvYQN2DwYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX64cH7E3/wjdS
 8I4lZQCLQDp6SCjLpXs30dcomuILIXGTDnavShPdKVBjY7WjTxZKdfuUFS7eac5TBo05bX5wdVb
 gq+jMrO0HW8JJET8a66zKZkYIbD6VTjOwenO8xcmAuKa7Uv03WRds+KCGGjZw0jdm+eMuufH7M5
 M/0QTXV3yWP2PQ9d+Z0G/fV7y4VhiD4R1O4VfwcEyu8LUFWm1omJp78WdpPffCxArhLWD7DDbl9
 LAnScYmlk1zuAqbOpNl61UbLQqmtku0a3HkS4i5B0mvNL9REXlwuG8twqVDpu568M4gSBtB/I7l
 sWMBgFFGh3ywhODRUhfNV+5BGs2s/KpIcnKNzYpElnXrR5lukQXYxJCv58s9LWCpqvwb03upgQX
 NabW4+aM2XlfKLLXEs+f0lRY9eLp9BR3/adpyWWLUe2+sr0V0JSTXkIcS6PrdPAbwQ4IKodyc6L
 FejyMf38fVQp32sltIA==
X-Proofpoint-GUID: Qw_QP68ObW0C6uU3fNAyNtG_3xpwMcPt
X-Proofpoint-ORIG-GUID: Qw_QP68ObW0C6uU3fNAyNtG_3xpwMcPt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97232-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: C7474272A5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 453be86c3420..76657a4a8f65 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -201,7 +201,7 @@ static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 	u32 prediction_mode;
 
-	if (data->ubwc_bank_spread)
+	if (qcom_ubwc_bank_spread(data))
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
 	if (qcom_ubwc_macrotile_mode(data))

-- 
2.47.3


