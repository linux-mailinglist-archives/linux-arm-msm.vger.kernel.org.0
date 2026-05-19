Return-Path: <linux-arm-msm+bounces-108515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D9yI3FkDGpXggUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:24:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 044B457F8E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB1AF307348E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B615D3BCD1E;
	Tue, 19 May 2026 13:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IlKGjKmB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h9WAH7DY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6933E4D8D90
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196693; cv=none; b=IaEsoiVABG3IHhSC45VXX0vJGsVIQxLuXYrpGb2Tsb1601x+/8Roo4UUb/YX49wVgTuJ40kpZ/h5Fl248Cqu+3fczq0weWIezpLHXW5zcpQdZXEY+6EE6lx1F0ZcCjYy3hrjAIshFJ3vz7h/JxOlMTCqj/cwKlYFD0+vFIXls0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196693; c=relaxed/simple;
	bh=C8t0ZoGUnDPF/P+4BK1Ho5MJ1aexupcCMbMgOX1T0s4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kHvp5iyPGX0r0epaoSlZIY2NFWjt9YyQRCWpeQeZ35I98fTJsinfaAHznPCvRLLqUnVunOSuwmievRgUMnsYfPC9S9m4qs7P2zKCrYlOZYRPqPMfmy3nl3eTff/7ynN4XyfgPTJVKmZsqp6yHjBbY8dnZudIvyVtBeq7ZSyTF5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IlKGjKmB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h9WAH7DY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JC8ZJu1737098
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=; b=IlKGjKmBMfHoP/Uw
	ODUVVhGKU8n0Y+jF74Y+NLjzOjTKiI/MJxOvBY5Y6DMJqO0LPbZnMuE6j1pggWqP
	dO8fxuBHTG80xAhKkM9ntHM0thlEng/7t75TacaEmg089ySAhp+TpxFd+G5qDIdB
	eCToyJWc7BMOIxqkQ+kyIfJ/He77N9yn6nuEGg7+cugB/4Cu7scTpUjgSI+h2sN0
	7oDBHU6dN/Z6+yW5OSwti+qVFwLe2mzDU0NXAKuHcrZOSK8OpoCMcSFc1X3Pytov
	YU0+TwEYY+ExDV39uyYUHNo1/sluJeBm+BaToNP4EFoSBg5pINvvf5RBFf8iyaXR
	MGyqbg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ju91jj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:11 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5756024c77eso7900637e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196690; x=1779801490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=;
        b=h9WAH7DYAS+hxGWp9vNSgB+QPUUIJDutoc60gdjDqL9mzQKXSy7uuJAdZH+/PPgXOQ
         zRqpPloWevITDVb17xykMenw8xb5Qj0iVQUrmlRVyYHnzLwEfJ/doBYIhXTLegioZz9B
         ws9GHOadx3vtJhwRzt3BcoAE0+2QkDJ/gu6pkB3uaY1oe/A3WW4t5nMWlJKeGrEuG3eA
         jnTqTPwMoqfyz5Nx3Nj6nNOrrCFdUUu+s5erldKClWPUMK1DsjJ7IRqaof9cyAVbKzKn
         WWTdqu7y4H67FN7IHL4Z/hik5TNOiacbW+90ryM5GrO04TmD5jVnpKwEA4twZTT/x5KJ
         kCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196690; x=1779801490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=;
        b=f+ORfMittRPdiMiPQPT2e299+skKeT9RvZQ2na5PWWtlmE+FdUqG9klNEJe22eDvqj
         OFuDfMaI3QNdAipMIo/NjnrO9MmcFau0lr4WRPP0joT31zuDMVUyXMU6U4vCZIgKx0T+
         wyq7vy+QjXjCfz2SdDFgaWMoilX4aCZuf5/o5xFihmYggEZBq2j6KYnfXyFRBGHUofTb
         Lpv0EqNKLDoAY2j+G3p56i3GBObi0WHIjmOwIFIkivyx+HgPRDiglc03pl1NZp+Nfl1l
         8dcTx4YrYELvIkUGefiFW1XCAlqnspYwky8aZzjxGLSq34OQnWqhjyI6IsciJV/vqxX9
         UCHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+mx3A4FREPaL8CRmq1D+LufuRXA2k/nwgvKBLT80kOgze/XNVPa7/S/Ws3aHfnPgI7ZManWsis+mdXxz90@vger.kernel.org
X-Gm-Message-State: AOJu0YzvgNRM3trbJ8ahRry4eY52NL+RKYJcgOFHYGnjQUPVfsZaa9hq
	1ZMs+jiJa2w5JxwiWjci4gnqxI9PqtFyX1rgztxPp3Ld8MpinP1ZentCkyvY8gWjQCGDd4Fc8ml
	l1bMJzgcgs+o1RniL+5pGAwSUQz9gr1YQmpeWhzi7OBFb7/hCamDkQTYnEurtiHYGi7V0
X-Gm-Gg: Acq92OFT5p9DqLGldyPf7VuWbmjZUMq9nVNkUKwzvUDRnnqej7whGwXhbmJB0Qje5zA
	0MtQ1uzZGRjpBql2a/IGSXINWgnqxe5qV0iyjvgv9129gcCF1ZDFgSfXxU4En70KdeP0TQUc45e
	FWNXTsN+mpo9AV3ZT72EbELDTpb8QxocdlQotbQo91l8DR1wnNwFcqLBxEbPFL2skNs8XhlS3RF
	nMHvIBwqoV4eREufIweGPTwZzc+ekRGGirrLXegxpuEuVvx5lioc9lrlp03LqQHMQzy4JXJWyzQ
	7oOGRlyeXeuWqvbzbPNMlmekYsku5GWWxAzbmru6BZgNN55vm+V5UYAqMACGm1v1Zp2hvdB57ej
	HTo9StPcF7lFUYY+5jpkArxrFv/toyMyPTxaxOOAP6egA+sAiwOU=
X-Received: by 2002:a05:6122:32cc:b0:575:22f2:a1f with SMTP id 71dfb90a1353d-5760be7221fmr11587026e0c.4.1779196690537;
        Tue, 19 May 2026 06:18:10 -0700 (PDT)
X-Received: by 2002:a05:6122:32cc:b0:575:22f2:a1f with SMTP id 71dfb90a1353d-5760be7221fmr11586982e0c.4.1779196690128;
        Tue, 19 May 2026 06:18:10 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:43 +0200
Subject: [PATCH v17 01/14] dmaengine: constify struct
 dma_descriptor_metadata_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-1-53a595414b79@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=C8t0ZoGUnDPF/P+4BK1Ho5MJ1aexupcCMbMgOX1T0s4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMBpRPcmMP8RCpXvdvvCjt8GuMRMYumkun8t
 rBFMDYop+iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjAQAKCRAFnS7L/zaE
 w08wD/9JUWnI4khSPNi63kU4tLcUcH8kzPNM/MzRtKHS25Z//x35eZUftdirhcdA6BixIB31+UQ
 0QvUons1PUJBz3EV9NzbR9pl/z0opC+qk7fzX9Dtr4jSgZlbj3/EZtGYeZO+SyHezEqkaGQmKKh
 P8qfJUtTAwPjbWyebjRQ9lLcRO9UL98Sev1cO66qbRdYFFuyeJQq3D1ldpmJhpRqSj35BO3DsZf
 Bbw4cXm9zKOdaJbnpsEWQ2H2VQs0nRyH9T71zwlrScypudaEs/qQZQBn2oyM64DHIvcfO9NzlnH
 r3kcVM7s/CiMg+Yr1YUMRALxKMG2yjChxOEM/lQ28bZQYf8dP5l2Lasv5DDdBqDgTOgYBftB2Dz
 NqhUkNTZlu31dqmnNRxr5/L+LDHkIJfR/03ChlXl8ZdPxcjRaOmk1AU0ksHm2APNkALgt9ATTO1
 7Q/cY+TnJIFmrEjh6GJ+NgAhrgpri00zxMlnG3oSEPm3WCVSJaNcQ3fvutRPTQZdSySsdln+rl6
 djDpLxUCLRG1ejkyvefNrTvkWx2cAE3SVla35UDZrAx7VLO1HjGjdqNz4bVCHI7fxnh5GZBKXrz
 dtkf6Rtgk2D34ZZatbq3bPp/HOOUeRs/mTi90WLaRsHu60dhi+HvcrrWLB3t0fTHi/aY6/Ay7ju
 LSjtVkiFUANsmmQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: ce5Q_VfuEcjLsBI8-Qr2rFU3ghBLQ7GK
X-Authority-Analysis: v=2.4 cv=eeUNubEH c=1 sm=1 tr=0 ts=6a0c6313 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfXzHnRf4ktSpqc
 5+H5+V8I7bAFKI4d21HtuBvm0is6MROTAgXYyyTvAMD9SorNrArBLbxeB02fkOB+fKPzK7Bz7WS
 uyDLdPmXBFuaB8LHlUKDj7Ll3u1tv9igK3rLvqx18Xk1jpZIBwQ1UzSgSIIwDY1wc8IjCd2xsvG
 GxImYnDjLaRYd95me0bAZ73/Uc1BtCRgEUt7eXGwazg+nuHqVDE6Po6UPChYpT/b5+k+4u9+Hvm
 DMLOhWOEl4YsdsgdEFqOum4zqUg+tYZRVbIb+rAZvpNBXniV8o9cjhqm7W+qlqVTNFi74Qn3rbc
 JpeiV8xyh+AOPuzc9NuoGumEBbBbG7QimgSYEEYsb37ihlsRVRzNw6FJPsgzV4vkumLtiKfJQtJ
 DHFRAvuPp/L8lXOEk2qOBU3s9R38d1QMT5bpT4FdXeqFIIlPI9IlyKh9ccYQJzumDuJhw0XWXNX
 kfcoaV/VmcenAu0LIWQ==
X-Proofpoint-ORIG-GUID: ce5Q_VfuEcjLsBI8-Qr2rFU3ghBLQ7GK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108515-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 044B457F8E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There's no reason for the instances of this struct to be modifiable.
Constify the pointer in struct dma_async_tx_descriptor and all drivers
currently using it.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/ti/k3-udma.c        | 2 +-
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 include/linux/dmaengine.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index c964ebfcf3b68d86e4bbc9b62bad2212f0ce3ee9..8a2f235b669aaf084a6f7b3e6b23d06b04768608 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -3408,7 +3408,7 @@ static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
 	return 0;
 }
 
-static struct dma_descriptor_metadata_ops metadata_ops = {
+static const struct dma_descriptor_metadata_ops metadata_ops = {
 	.attach = udma_attach_metadata,
 	.get_ptr = udma_get_metadata_ptr,
 	.set_len = udma_set_metadata_len,
diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 404235c1735384635597e88edc25c67c7d250647..165b11a7c776abc6a8d66d631e19da669644577d 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -653,7 +653,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	return seg->hw.app;
 }
 
-static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
+static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
 	.get_ptr = xilinx_dma_get_metadata_ptr,
 };
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index b3d251c9734e95e1b75cf6763d4d2c3a1c6a9910..5244edb90e7e7510bf4460b6a74ee2a7f91c1ccc 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -623,7 +623,7 @@ struct dma_async_tx_descriptor {
 	void *callback_param;
 	struct dmaengine_unmap_data *unmap;
 	enum dma_desc_metadata_mode desc_metadata_mode;
-	struct dma_descriptor_metadata_ops *metadata_ops;
+	const struct dma_descriptor_metadata_ops *metadata_ops;
 #ifdef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
 	struct dma_async_tx_descriptor *next;
 	struct dma_async_tx_descriptor *parent;

-- 
2.47.3


