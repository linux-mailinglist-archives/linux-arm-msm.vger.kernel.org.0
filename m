Return-Path: <linux-arm-msm+bounces-107122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIgqFThOA2pq3AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 17:58:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C01815243AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 17:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE75D31BC405
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 15:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52424397AE5;
	Tue, 12 May 2026 15:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D33mOYUn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eZmJv8Rh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E919537CD31
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 15:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778599277; cv=none; b=mHixBXvYrwWq9cm0MZ6tmmor30524VDBTyMUO0WaRPJECP4kC3Cu51zFtWMBNvB+6wawQhSKx3xkGoPW2ig2PTimaBpdYniwXbzb+p+hpI/HGIE/xLO788QBNZ92if+DhKaC+cY5z8P1EYgCQXPpy+ahOvbRAzvk5b1KpduLlq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778599277; c=relaxed/simple;
	bh=HCRGBUtkrSoGUk8jEGoVTJVZHXmbNMegp9Xp5SSwp60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cXJMisa3vp8u9ynyHrlBvEkcSfkf2tCQIUq5j4lA++gD2je78kX0ZnhBFy6nOFxloywK1QTPq6ZDLnmWg4bwZbNN8I6W0iCavsPXLnRQxQlEGUq2cDKvRfrp5tVxBuun5WZI84fwmEA55RtlYiyMibQB9mePldB0tgHWcsi85Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D33mOYUn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZmJv8Rh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCA6uH144590
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 15:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	02ovJpLqS/OJQIwZyeSKKeC+6lmXh6VPbB9glk5k+CY=; b=D33mOYUnSqrJbovu
	J6zlRYOyZ5QcoVa2I8B7m7nWtzLVP3WjUbq9mtapvqzjurJ/c3N2TJnLoOHCyRiq
	gv2aYdkKoNFYg3wl7DOs2cJbYdlOk0GUJcFgW5yt1MfiVqaPKldZKNRTiJmiLtlz
	ZowXgMzTrVOlRNp+jzAgTMB3Tl+5syx+b6yRIldOPjrPwj3thUMOcea8nfyNEPR/
	SJWiWD8TE75CEPjXBn+lmnDeA1Pr0blYzTinEjVX9fQDW8GHkyDn0194CLBk1MW9
	1ESTchTOjyZYSpLPbbbeKby4nuzfmTacbf30Z6/faUF3KRqWTkQslHY3AUkmbTnN
	knSpIA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43yp8quy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 15:21:14 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6961e8fa90bso10520670eaf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778599274; x=1779204074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02ovJpLqS/OJQIwZyeSKKeC+6lmXh6VPbB9glk5k+CY=;
        b=eZmJv8RhQh0rZX4aT+j87hAl0eJvKOd9tE2sD4KpWlUBmce1WCALJlsk/yUAbiWkjR
         xGztCib0fWHriX0TIxtOThwoui2tktc8bjzYvAUXQF0epVbHoFPuj5xXoBE+G8febq5r
         aGMO5Bw20Sa2MtxLsECi/d5q4p8iHYCQhwrzrHnlecuctR76IEmxOiT+mIcI7DNstNba
         AnHC/19d6TtPomk7KTQgv9cMschN1dsSCGhtOmRFueWVlKRo3fBgm4cyBoGMeQgD9W1S
         R1FscNofqs9olZkZ3APSNkKP68ep3ETR2qBUrk5e7yZV2H3tdsu41oOjW8fzHhnroafS
         fS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778599274; x=1779204074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=02ovJpLqS/OJQIwZyeSKKeC+6lmXh6VPbB9glk5k+CY=;
        b=GttAfm7YcsjXPSZPnqdb/PB00tvUJcf+1UPcI0pDzGV4gzdYZUHKx3+GTmW2AuhPVc
         +LN8OfsWYJBqCBronKXp1kmZlGv+C4qLy2ZriE46taR3r3JGcrasEmkbO/k1fvxYSPol
         o4haIjhVMxySCgjc3qvMfFffmR8k8XQWaM7+1EnB114D4jHAvr9oUBIi34w8q1uUbYKf
         A02TY/Qeg94Ks6RfHOoGBzeALY028ZvQtGpZEkwUVG5gN9KQyqX6XbPcDCqR+mo/9XTc
         Qoj55zPoEULdJbJKBXMYPNsaGHWRbgKvaFQRVsZWI0BaVE0XCaDhPDzcTSwaoo865bZ4
         5Mrw==
X-Forwarded-Encrypted: i=1; AFNElJ8mckNQy7PE64GuDExHi6JMz6C8bRmAK2Gp+3QKbbeSswdIPKO9XkDXef0dSbob/7ZcRQX4TVXFV3IXs+/0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwj+CpflOVPnqwCyFtunTvUKugiuqihsSTgtFUPmc1hI8SGCxD
	vFsIqjIzvtC3fxwPHpTd8XDu0H6JrPEIGfGJLfQenMQNLdsmNytoVE8ipPeXHdNc9+DBuspHGDO
	0OLHizY0X55R6a9g6x71ch1PExwH2nGS4PM3UoJ/uHswIk1lyY0Sv07y/xi4NIQSJU3R1
X-Gm-Gg: Acq92OFjhgA8+OYkQe0xK7eU5daIKLbiqF1qwXH2A689vnMvu4otUa6DJNSTaO+L70I
	my050QZrtUjNBAIIyuxOFwm4ri3xUzMry4o+qhjjNqP/RIcb3RIcx2gfTmgNTAuRK/Cv4yLCa30
	7q2DKsbubbU9eeTSqIVpP2nCt5wabJKbxOUIUMGP7aTDTwpu4bW1G3bDIcLhVCsWnYQ89wfVIT1
	VAUZaI1WIhod4rs+m7SLpsA/ai1PHPKHQtxiqn+wW00N80k22cHFG/fiSCLaHjn0uiIgs76rAcp
	1Px+PYxC9c1WWEzx2aNY+QSESxWVQavzqg2yZB7x/3EftE9U6JhzsGI7Y2MaouXwJZO5vW+sK37
	44sAFG3P8gEEEejLW7lDqutpOuOQjdETrhrv0zx4fF+g7KZj4ZNiUBmgIAlIdvSxJcgAC6uEGce
	43MBw95KtAwr0o7dVB+OIwxuWFkCD9ddTF5mM=
X-Received: by 2002:a05:6820:80a:b0:695:818c:e56c with SMTP id 006d021491bc7-69998c8f448mr15047274eaf.7.1778599273935;
        Tue, 12 May 2026 08:21:13 -0700 (PDT)
X-Received: by 2002:a05:6820:80a:b0:695:818c:e56c with SMTP id 006d021491bc7-69998c8f448mr15047244eaf.7.1778599273394;
        Tue, 12 May 2026 08:21:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6268ddesm34036571fa.37.2026.05.12.08.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 08:21:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 18:21:09 +0300
Subject: [PATCH v5 1/2] media: iris: Initialize HFI ops after firmware load
 in core init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kodiak-gen2-support-v4-v5-1-a98968423d24@oss.qualcomm.com>
References: <20260512-kodiak-gen2-support-v4-v5-0-a98968423d24@oss.qualcomm.com>
In-Reply-To: <20260512-kodiak-gen2-support-v4-v5-0-a98968423d24@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KiFa/JqpExwVeRLpQRB6b6/r3uzswFx4pVVeS9KUMuI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqA0Vl//QAeOSbmqNmESKLZA9iLZNeydJOb/N4M
 rfYk4itFsCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagNFZQAKCRCLPIo+Aiko
 1fIbB/9IgdORjEiBFONrCN3BW+BB1uI+80ILQKcUydZQF6tznJWOsDwUoxTlHHmF2qo8ke8f4yd
 SAtcRnP0SKkyWTruPN/p86izEdk41GtPjCdkZnHK6Moaa4QTLKcNFVXi4O57Mu/HnHAX7beDAyL
 CAMLGnM0VjvQ6YZcPO4q5k9HrfEtO0xXw88Z9RgG7T3x/wwEuk8+tC8+1B4sypiXYvhHjmXUd8K
 LtnvW6h9ml9pMYYqNNx+K+GR6hLOMFKpOEz/cH3Aa4IsARb7T41DTMd+R+0XYzilihQG9ZwYQY3
 DO8iBGwjIZsVALiF4KUN8Z1adJS9Dutpm75RNK9Jb3IMZJrl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: vmI7LbUwkZ-af9iqm0Q4ZynxSJIZ_40r
X-Authority-Analysis: v=2.4 cv=R5kz39RX c=1 sm=1 tr=0 ts=6a03456a cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=_zkiGRivnqQB5cGHL1IA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE1OSBTYWx0ZWRfXzjjDbVCltD+t
 a/36tKhLK3INKCZS1vGgbY7wFJeQ9admn6ezhCF4GZQJjcQCncAEEVUZx6YGRaB0cExs8YjG5RY
 5wXuAgYlv/3C89sMLI7K+WfqO/zBvuVb8HMOtoVbNXNj3yOtyroC/dGor5l6ThPnEc1jTXPkreK
 nZxcScDB7R71qpOjTMOw/UrolAWeE8WZ9eLsTENamajVSSNac3hdm8V104FvKMXhZZ10amkZqSa
 +38Bm+o65ey0G8UurIXnbQ7gD4odE1OtyAFGvPcUqXhfh5t7UyBuStV2Kibck0veIjNGmRWgOzB
 v8z4ntauuS/FNe/7HITaX/EWFVroImIK3JxtclDAZiFlUexDN15+jiBRHUejlL2zus/HVGOUF6Q
 hi6HQ6ikIPA+NV1B7ubtK+FRhl6JJxjvJM+1y4uPTBGCJ2C2ojQw7K1cZMYCd5Ljvgpsgwcwv0U
 hzxdV+cD8rg5ZBWr9Wg==
X-Proofpoint-GUID: vmI7LbUwkZ-af9iqm0Q4ZynxSJIZ_40r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120159
X-Rspamd-Queue-Id: C01815243AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107122-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The HFI sys ops were previously initialized in probe() but, we don't
have firmware loaded at probe time. Since HFI is tightly coupled to
firmware, initialize the HFI sys ops after firmware has been successfully
loaded and booted.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c  | 2 ++
 drivers/media/platform/qcom/iris/iris_probe.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 1f326f696d08..52bf56e517f9 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -78,6 +78,8 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	core->iris_firmware_data->init_hfi_ops(core);
+
 	ret = iris_hfi_core_init(core);
 	if (ret)
 		goto error_unload_fw;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index d36f0c0e785b..dbc15edc602b 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -266,7 +266,6 @@ static int iris_probe(struct platform_device *pdev)
 	disable_irq_nosync(core->irq);
 
 	iris_init_ops(core);
-	core->iris_firmware_data->init_hfi_ops(core);
 
 	ret = iris_init_resources(core);
 	if (ret)

-- 
2.47.3


