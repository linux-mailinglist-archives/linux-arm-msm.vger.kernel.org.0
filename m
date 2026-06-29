Return-Path: <linux-arm-msm+bounces-114946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uEitAr1DQmpC3AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:06:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B35D6D8A85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:06:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZUmlEoEG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JqnEV8Gi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114946-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114946-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AEF93056FCC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694B03FA5EF;
	Mon, 29 Jun 2026 10:01:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118213FAE15
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727294; cv=none; b=P6Rp/II15Jda5DH5GgSKIZUbhDdIZz6qknGjVC7wUYsF129Dhd3D7w6//9UhFNScmyc4U95yFiHGFcXCXNZ89A9SMp7E/dsZLg3YV8HaRyooHlds8tC5MWiKDU3lDV7Z0fsZkrsEkK9ZPY8c7YGErIA92m9OWRWogh5QQzQwNmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727294; c=relaxed/simple;
	bh=wwQQXRM0gaMVWX/Dzgfr4bRQXhzRu9ojnjIrabYrXjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sHvVv5dlDoop8p2ooITRsVg4pWVytXYycRfSEG7At8SHUU2a0qjfU2eNyt4kv2xp8jDidR1gBwzY/iI54jbfvpNLi22gq0r5fQY+YbuCbEp5IunkA/8VNNQs2tzMC5Vx0vCeml/J+xtRWTx6uwqevPT9Be4NCbTLOYrYZdSBB/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZUmlEoEG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JqnEV8Gi; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8xEmL2447431
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bgcnvEi7Ugd3Hv4P87KEsVYA0DlID2yHzdzIugzgP4s=; b=ZUmlEoEG5NwU9itX
	YK1eHEQZHppVWzXbOKbDgG3nJIjOrHO/RGzGzW4n3sGtg14SKkR+Dawqkfgb5E9F
	d5mcERF0UZpL+7ODPMO4UWMpdboCQuJ2Sl0dMDy2DYh8d/Jc5l7TpskKV3O1DTbx
	VD5yRnjBJt2DR0+Q5hfKSVbmVavRRW/Tv86mn9MkPnWRAAccnL5QzBHoVLyq/sTu
	YwpvXeIfCtj2IWEiNLGbYNn0N/HBuNaD7j0+AhQGTvtDRn60HvlWuok9Qg2NqMoK
	Sm0maLwXWM2t5CKRukdGQ0CrpGuQ4icEB302l77b15AT2DAGQcZcMs7c/ngR8IyI
	lZ1apQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7g8a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:31 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4959c49e054so1298773b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727291; x=1783332091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bgcnvEi7Ugd3Hv4P87KEsVYA0DlID2yHzdzIugzgP4s=;
        b=JqnEV8GiEc3sQuX4GE4BF1hdO8GHoZdjq8VrqSu/jdAt6qdDg5Pqj6JeAf38KAP5TW
         kXsx9oyUSftMXfd0C+ozmzTL2PSGKBaWPinweo1OnNCBjt6nOKKcXfqgx1UeabyoZUOB
         8sCyiDumwfZFOn95j5Krjl5TU4SpRq8CBUJbHHXVGGmarMEoRNZV8lOWs4ikTq/fLXtM
         KBAaT5T6NJPbXUPRTZImK5sLHxDMTvB/vBab7H6JW7itS2jg8BMdC27lugydyyga/YUP
         PEullvc2vguA8eXC0tNpRQkj3jHKLclzkC0CzIN0sYRL2bH6dVa2sgT+nhFUVf/6TEwO
         Dudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727291; x=1783332091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bgcnvEi7Ugd3Hv4P87KEsVYA0DlID2yHzdzIugzgP4s=;
        b=REnt9v8LUB7GwjgWwIKFo88z5uxGTUESGJRAmOE7yT/GdAN+L5RRC9lyhr81LEvKHH
         YkNS1zH3T2pS0cdffywcOvePZcwStyrg/PWEWhwN7DsMSd4tSABXsX/bPuXwoig36afQ
         O2lBD4Gkvmd2dJsgQv4yTPqBGHQm8orRXtmzMiX5y6Tg+cm6SLcbJPP0tKB0pGGPBx14
         j+h/7cYZXl0ZsLn2gmM7hzIXX/uJZcXf6GOymvizP0WqYO2vT3MF6TDoel9xs5pl8G6B
         IrajNoJQ5feszYzIo1c9t/m/pKn8KpgV91KBrV5HKc42+k6SlIhFOf3+YoZY8MMBY9hs
         eOzQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6PV+vE0BEEpu1iIW+C/s3MJwgz9OnRfQuHsvHTjn3clAyxb692/L/VX6PYVMKcw0/rNXBuWwsZAcT3eIr@vger.kernel.org
X-Gm-Message-State: AOJu0YyRZX1cpONOgaDrzvhoTcSrNpqJQSBRnhWZzybE5CEdGYp+uL8e
	cHmaJs7KTQAjg3+T4qX/VRoNa3n8giBRgBb9QOfQfhY6LXAzHwFoHw8rIOjWy08sq2TEvrNuGeU
	O3W2C358ZUedxFNULI9DBqLhFRu92oLWLPDCklxm8uwKYWVXDJUKvGc1Eaz4U2WSTOJ6E
X-Gm-Gg: AfdE7cmrENBe4kX4vYbUtaHPcH8cUKvqMNFBvB9xyyOwJOUid5yEM0KyYLe+Uf8SrHg
	W7l0jTGReU8wCPJVC995LSDRHH5PZL0M16CkGOyDC3G1llxPe7Ds0egQ6WD83ahIskfUUboRaDz
	RMCKqFP0tQcZLBX029XQR1tHCfeDKHfkdkQOGMZPrKgKO0Cw3nzByxI21UVHk/wcLquY1KeC0jf
	3wC2hrGO0wdVN1hvM0qoQHwsLPdXKnO1fx0Z2EVnArm0KRSIxQWvMPJHaUNKef5Y7+3zj6eV0ty
	bg8fyHS4ScilNZWvaCV/Etz6uEq02abtzo8GVU4r+Zze7x9qMZ7h70k6HYDH/LwhQk8t3W91G3e
	KHfpbUHWjo+Su53AAnz/PywVa9UuuRPoA9PP/9Th3
X-Received: by 2002:a05:6808:c189:b0:490:a1df:b17e with SMTP id 5614622812f47-49218112e37mr15351320b6e.31.1782727291115;
        Mon, 29 Jun 2026 03:01:31 -0700 (PDT)
X-Received: by 2002:a05:6808:c189:b0:490:a1df:b17e with SMTP id 5614622812f47-49218112e37mr15351293b6e.31.1782727290728;
        Mon, 29 Jun 2026 03:01:30 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:03 +0200
Subject: [PATCH v20 01/14] dmaengine: constify struct
 dma_descriptor_metadata_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-1-56f67da84c05@oss.qualcomm.com>
References: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
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
 bh=wwQQXRM0gaMVWX/Dzgfr4bRQXhzRu9ojnjIrabYrXjE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJnL7OegSYxwesjK+cEVKpb3XLBwJVycyYXi
 aaBmx5iG3WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCZwAKCRAFnS7L/zaE
 wzb8D/9vPQevfch3WxayUq7v0SUu5cwPXdZY019Aq7isOzzbiGYG5zcvmLNnQwXq+j9yGzqn3VG
 lTKhy70aktK6FeTk1a9GM3HDYDJ9DaFobSLCGrxBuP1ZHCz5je7yQFcz0L7H7WDFNoOYYX67cjg
 hqx+f9ZIBiTaFeDQU6Mqhc/cft47IwZxBpAhNvLSWatgmr3nzqH4SQM1x1pYLChA5Y0e/6zPo+4
 p7luhmuiuKxD9ogwGt9Bja7D8S+yesMRbF9aBivwp4Z0hTSHI0g1lKM04ROdHLyrKGAhl7i8HEN
 ZVqLq1RAOOwtm4rmjb9njODYRK+bWaIJhO+PR2rrGlV41tIo7FbjWaww9J2QOKYVK1XrLFUAT2K
 5Uzc9NBaNq7tA2LbDS9e/ViHPAGv96R2LGHgZ4DV2U6E5tPXSTknzPxHLpPdVZnWdjKK+YxDxAs
 s4KLJvKKmXzzO9mGv2ziFc7Z1SA8pObdfvIpiTS3IrglxBNF/wQrnMgn828W9l7niu1rgvZJf/Y
 PQwhKDDv+DPYCcX8CAwfNGnXdcDTWmYgrxwYxJ4W8fEL+CeQWaToNfoCH2Rp2zViVcUW0Zo4Ja5
 EhFCbcuPIhV06E6J78FR4OcHsm9XcvLdo3F83DrgaP3r4C0w8XiuZxzBhjlnofarvc5FWw6bI78
 qemDa0OHWgvYE1g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX/Ci380eBd6pm
 x8CAzWLr+m8Z73UobrpCtNi0YSZwM0Khg1DJkwMxFHwjM8nZZRHPPDtNe+UDzfjYTesD526pP76
 ls6B/utx49AoeWNdyKgiso5ExnjgsF2jR2TNIh3uwYwLt5VxAGSQt8IuLVOuVx5c6OXBeUzAZjc
 f+m2c5Zu1HvBTUegDNClsREcC4ELdT76G+c6d5v5kKzQjP9GscJAFOQl9UEIVhTBhOGavNYKFaC
 K0MBsyvU9yis7LN7SpI3WywkmKl+SvLbruzmxqi2FFDBIZ2PXCIp9wVyllC/rAcoQxsxw1fKrKg
 RoWzFfr2KV63IhlBkNnjZnbxBJd+vxJYUDF6yYH2QYn2aDzr61Eji8LW+VhQBd7GTq5kX9FetSA
 k3sows2F+o4VxVgXk1y0xTQPVJTXURRALm3+QpxI6KW3q3rT0BIq58pAgYgSPOobEl+jS7ITXXb
 vUYagkPQHpHX9D+bJhw==
X-Proofpoint-GUID: ojG7QygQm0ljM0fIMCwLuIhkHAmJkazm
X-Proofpoint-ORIG-GUID: ojG7QygQm0ljM0fIMCwLuIhkHAmJkazm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfXyboAk19QWhQl
 JQNrCqI7V6B5IQFDcTW9WtiYjUD2E8yYD/1i30Fi2qD/GuOoAvb+pecM3nK4mEIf0+EtBBi3QzL
 3zgtmoOSozNeGPmzbwcn0a3uA7NdGP0=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a42427b cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114946-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:corbet@lwn.net,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:quic_utiwari@quicinc.com,m:mdalam@qti.qualcomm.com,m:lumag@kernel.org,m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:peter.ujfalusi@gmail.com,m:michal.simek@amd.com,m:Frank.Li@kernel.org,m:agross@codeaurora.org,m:neil.armstrong@linaro.org,m:dmaengine@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brgl@kernel.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:tharagopinath@gmail.com,m:peterujfalusi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B35D6D8A85

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
index 1cf158eb7bdb541c4e7f4f79f65ab70be4311fad..fb21e0df5ab7b20e4e16777b5ff7f61d2ae67b2b 100644
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


