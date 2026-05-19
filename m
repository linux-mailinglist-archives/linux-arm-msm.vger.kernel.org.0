Return-Path: <linux-arm-msm+bounces-108524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJutHjZkDGqxgwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:23:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D83057F880
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CF3733045360
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8213E4028DF;
	Tue, 19 May 2026 13:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BjcZyfX9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LyzOg95c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145B0438FF5
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196713; cv=none; b=EelDuOThbQJwilN8G3glcO3EEXLTlP72YiXU8LEN7x0dvYTX+ZKy9UdjCbj8dqkHhevQo2gDcLlBQZSFqVCjb4jbUz8BoWYjUFyR/WUzrpUMlW/Q55ry1nzSL9awOMuGCYtmUv9fNJs/Up9iHtwZf2CtWw6SIWAD77BcS4Czz+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196713; c=relaxed/simple;
	bh=Q2skbuYcneIldj1tp/vKCnWZqrb/wZJoRKDIAdO7kR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VB2c9CtZwh/hLE5Fjxpn+X7LmG0Ei9DiS7ZQmWVVPTbgMQbOf2JqfpVG7AII5xkMBQF5YWRsyQZUTDCTfxd6bmM1raMLpJtFpYxnlOOfRA3L0TumRzcP7AA6d3tLAjc/fkTIw/eh1tRH/AbZ0k18GnxtkRTH9Es09NSZszKyECM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BjcZyfX9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LyzOg95c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9krNv1257006
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	moLln03VVvMKZIRmek9qRzT0EwTuwdZZIig7cvQ2zRU=; b=BjcZyfX9OW56lcFk
	qr3AoW5Sg2qj/bTx6Y7WBYJZTEKZ0S+l0XrnmIx0ry5I40GhxLQ64vIB/Scl1xtX
	TZqody7SAcqVe4iMnoN8xAiER2jb1TA715Sj3kGiEd9unBZ4qj+Gf3Vwwi96oFwS
	S98k3GKmxxgbNRQV1LhF2nOZFo2y6UcTcv4JwBMVQXnNvFuvD+FRJBg7GnVyDbTf
	Juxu5Q12v/CCo/EEf3aFORcmKVvbFepslulH9FaYDfdzVub7vgVYlAttR0aJCiaj
	BGTZAd8P0N52D9hrS+yLAf9TSmr60PHhK0qPpngHekJ3PXKNHf65IqI45fHs+5BW
	EFAJfA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8nhj8s3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:29 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5752402f5e1so9491388e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196709; x=1779801509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=moLln03VVvMKZIRmek9qRzT0EwTuwdZZIig7cvQ2zRU=;
        b=LyzOg95cdAOTAXPLmHoxW4n4nijL5iTa+mtdJYcxhSSMByaaxnTkxOjk/O/VlmMRay
         FR7lnlxxw4xYg6M9qKT25amOdYcxq6fNFVS3SqnHRPiAqB3Z8UIRmI95tVoLZo8jI9mc
         lgQIUqgS4PCHgyqULdvuwxjyfIGeKnpY9seoa71wcgTLXNf6nhOfz1TDhJUw79F5V3Ph
         LDaSx0UX9Oo1Pl6jw/q2Xy9GMEM3Bnv2plr+boTZangxOWydwPKOTlb/u6dUD+C8wSQV
         tZ6tdAYipHdw8Qwj12ce5WpE6pwBzLqGo9HVDfIYS7Pp1ebSvlRB6Tda/4b7NPctF0hv
         pbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196709; x=1779801509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=moLln03VVvMKZIRmek9qRzT0EwTuwdZZIig7cvQ2zRU=;
        b=Z5He7qEZwtrPXXe2Zr4VNAPGT+paJwbVC1GzbUSGakLhVcj6Wi5igiyFYnDt0WKUJ3
         djr3BE1GCTV0qJwOC21O1CmLgivspcDJzlDsKyV8MhLlpLsoGw9I7ttsdUmA5DnpjWDZ
         2ZlL4r1CPjaSHkKJ33sx3v1a0urFAWNxqijAINiI3/OLvr0hVidnI1GxOP/WElH2VwRt
         6zfL6G2P3fIeph4M/8rnSNYwJkUJALWcDIgNYiUscEvq800Yw3aoIivohLdEJNSz/9LT
         o5TaQLRDO6WgbrvKwaz0oz/jbMHDUI5xaN72/NWyLBRhGBRcT+CuuZTvIZIss44qyRmY
         KPsg==
X-Forwarded-Encrypted: i=1; AFNElJ9ONJeWB9vysuT/ByFPnRygooOCoGLGmpjP7Y84RkwnJSPHq8sh11/pzsDbBMcP+WEqr5Fjdn7ovkOxBJI9@vger.kernel.org
X-Gm-Message-State: AOJu0YzS4iwlThtpKrsrrNTpSGsq24FnjcboNH9peB9gNMeHwx9iK6ES
	XjK53ZwcEfvGBo1W7X2efxbVYH+vb508NFbfxgf0jcPQ3gMs4GQ3xbvrYEalhrEDxULliSBUlc2
	U0uXvYMUHC5IaBcSPVxR78Yj4gH53JSr777k0n1SVYTFtrsk3EeDSImw2vwAg0eLw8BGD
X-Gm-Gg: Acq92OHM96rmoe/J2VhCu/0AIgMOL2OSlG2faoGtJpR6vz++kGCUMtKzAOOTrO72sBL
	mOPvPa58WIU/Wd35QMTT9vtvfYZPmNQC3mzMN0voWFH8IAYAZJC7zuA2GY4hKbLh3wfKDIXVlyb
	pfVXPXPe1bUOgPANSB2wS/hpqJs+bRKVICSjHg+k8eTH4hWr8Mgp+uUMxik2aB0qJN16Lp1i0oS
	M1/oZU0iyuAYJHf2Sn1cwoCoOO07rFlEaA1uI3W7cCJ1YjeVTWRjkbkl9oqRgL+7q3+DFF2AMw1
	ViBYxr+hAfZlaHD5RhjMQ5WHQnlo3nKHU9P6KbOtYqEKJBB/N4Z08CqbpspcgrF5VjDcrIYM+oj
	Sc/O9T7He9AnSs3jUCgRIUAaNtgQO/Z4GpIRNjjKVMMsztZD2yhg=
X-Received: by 2002:a05:6122:3784:b0:578:9e26:e439 with SMTP id 71dfb90a1353d-5789e26f35cmr5125421e0c.10.1779196708967;
        Tue, 19 May 2026 06:18:28 -0700 (PDT)
X-Received: by 2002:a05:6122:3784:b0:578:9e26:e439 with SMTP id 71dfb90a1353d-5789e26f35cmr5125360e0c.10.1779196708538;
        Tue, 19 May 2026 06:18:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:52 +0200
Subject: [PATCH v17 10/14] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-10-53a595414b79@oss.qualcomm.com>
References: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
In-Reply-To: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2674;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=z8R+ergOMQqtDBFCzhyJGktXjtFI7hHEfPs4Hn3rlAg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMKVfVhUnZ6X9Zd2Eo0bF1f8BSs5/ZGQpiO9
 hV6+UnhtjGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjCgAKCRAFnS7L/zaE
 w7IdD/4nEEUBAVXy5CuT/Ir8QkQouzdfD3V53LDe1R7dg2dyUuk+VJShWPPRnTGEo2C0+a7Lezj
 L7TGHgPbJISccas+3c1Z1GU0uzYZXtAGaj4XNiObEQILe7fiN0Z6/vmcfjyH4chgDlRWClc5kOb
 7nwVCfqJHBEupZjPPUMGQJI6rD7sCHR7ydkVxN1rGk1ofXG2tj7PGKJqrQErTQtaQXPU7ppCJ85
 yP2OaxDbw8QvULphApl9Gf7slKPi+vUOOUElsvlSBo22/ZNl1o82pgRVxdCdz+c/6ndppXII9jo
 M25dEd9CL58BFTj7cvsoDpWbzorhU7HYAwitKMVdK8EZQTqzM+dIYDcH5MjqGayV68kUVwTuqug
 UVk02hexvaEWxSpI6ctGboeQecBGkMuooqebMVKwoMPA7aoPYp6tFUNM6j102j4C3wSAw4oXBf1
 U7fpcJEvPoQXepRe7zHxsmTQvaPuoOG4sC0nXAsRDYMwoRbWC+Pw37ft7P8YptBYtG3V8U2Qyh9
 A4cz4lYzuokzHq52HD0erpEhUO4/msOJEHQ2ecCe9HSxH68cezqYiAqlVHo6dhUYv+ZIrAnZ0Ce
 iBS7bak7gPcQOgaJDxow3yNptpGzHcunMrxoKKbcObWiaTZqyplN7o2hVGcYNFBwvyZDuloQSqc
 pa//L2nDAR8MTUg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: R0FOgkJkE8a-PrX2b3gGvSQvahIjVRkY
X-Proofpoint-ORIG-GUID: R0FOgkJkE8a-PrX2b3gGvSQvahIjVRkY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX3BuuRkgXGEVM
 43lKI2H9w19tK3OHBaxfPGQc4W3ahB07tmfoLv7VDQl9FeE368BaSj4NepUlmE2FFfcasMjmFzT
 jRLSddbIrZCiGm+JlQqW8a+YePFoT9jjyVMWTg4t7xHLQGZNNb/og5S6+G41cJ0gxdsXzdG2rnv
 PFhrBQrboC5Pq3RoSWrwvBuRe7oXgxNR/5p/La3fneSFVB1ntO31U5AzY3GAzSGxeRXIceQJU54
 qI7wQaab6wJPVQbe7d7FRXfNRBR27hFTlnSUccCUrYQQ0btKWcWSb1sH+ZNGKRh8QslEtNvb/hi
 Xb4xcUoO6mGXzBoxIMg5QBu8EzGFBFrPbCzves9SnIKU1yTKeHsEmX5NUdq0ygLYwy1gaI8DfCq
 m5qN8bNQ8d9N/2EUkV+wy1huG+dc9po95z8PLGmSAGIfdgz6fNm/LTjnSqj3bvCZJ+8YzXkgV2D
 93Epzdc1ddp/BKO0pGQ==
X-Authority-Analysis: v=2.4 cv=ToTWQjXh c=1 sm=1 tr=0 ts=6a0c6325 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lH6k5GM5CfRwGFUYfCYA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108524-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4D83057F880
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This function can extract all the information it needs from struct
qce_device alone so simplify its arguments. This is done in preparation
for adding support for register I/O over DMA which will require
accessing even more fields from struct qce_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 2 +-
 drivers/crypto/qce/dma.c  | 5 ++++-
 drivers/crypto/qce/dma.h  | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 5f724db7c65930991218557394d99574418fb68c..90f44db6606173d8afbd295a6dadea177b7bcd11 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -233,7 +233,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_qce_dma_request(qce->dev, &qce->dma);
+	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
 
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 08bf3e8ec12433c1a8ee17003f3487e41b7329e4..c29b0abe9445381a019e0447d30acfd7319d5c1f 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -7,6 +7,7 @@
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
+#include "core.h"
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
@@ -20,8 +21,10 @@ static void qce_dma_release(void *data)
 	kfree(dma->result_buf);
 }
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
+int devm_qce_dma_request(struct qce_device *qce)
 {
+	struct qce_dma_data *dma = &qce->dma;
+	struct device *dev = qce->dev;
 	int ret;
 
 	dma->txchan = dma_request_chan(dev, "tx");
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index fc337c435cd14917bdfb99febcf9119275afdeba..483789d9fa98e79d1283de8297bf2fc2a773f3a7 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,8 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_device;
+
 /* maximum data transfer block size between BAM and CE */
 #define QCE_BAM_BURST_SIZE		64
 
@@ -32,7 +34,7 @@ struct qce_dma_data {
 	struct qce_result_dump *result_buf;
 };
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);
+int devm_qce_dma_request(struct qce_device *qce);
 int qce_dma_prep_sgs(struct qce_dma_data *dma, struct scatterlist *sg_in,
 		     int in_ents, struct scatterlist *sg_out, int out_ents,
 		     dma_async_tx_callback cb, void *cb_param);

-- 
2.47.3


