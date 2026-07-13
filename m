Return-Path: <linux-arm-msm+bounces-118782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FQsSCIrjVGohggAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:09:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF4474B540
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:09:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Apz6KNtL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Z8DHo/ol";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118782-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118782-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44CD6308CE5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B63A416D0E;
	Mon, 13 Jul 2026 13:02:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCC3412289
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:02:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947731; cv=none; b=k73hYOsqBcYt7ZPYQXHghqD1z27S/1ViUsvyIke/NpBgUEaOtSbU6l1GZwOmX9sXSSHl6ZgVjoENqUumSTuzNNl4dLN9U/16ZNROvhsTT/85YScRO+6eT3UTm9OB9eEIT4TmVw1aJpPMfmksakjCjgPGNslG4KWLz4DQAuY4Q0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947731; c=relaxed/simple;
	bh=I6qozPBGCCC+qW2tSIhDtPr1pqACnLdSRJYO6Q/jVhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TzLTGqKxxEoTQ6vItB7AXf8zB0dON1xSElJRNu7PE5hoJJ68vEHpuIHOp2299wd9OHI+G5RflbDlb/q35/+g18vCN6xXP3Z6BXVMISsUkCLkhDt5LPIZbJOnCeH3YoqcP6+DNYD97EgpTOS3PgLkXsubCmp+j4wRJYFoBjh6E6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Apz6KNtL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z8DHo/ol; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDw9j1494416
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=; b=Apz6KNtLUUkpqBFy
	wbJooXmdHavqxiRK9SRzxQjoh8jddyAeXVAfsJpAzPeqX3uQsj9GYNrCY0Jgz2XL
	lkeLmgJ5TxKKIRVU+Y9MuMV0wpz5qK7WK52jor38TezZRpjWvWK7Ot3S8JUrGbNg
	bFUzJ4gSEwNEexhEqdPYcTz3Gj13GmvNFLz+It/VmXb1a5E/6u/yldFoH11GIdpl
	PMXmVU6TOcLz85SJrmdIGwxrD8mzI0nEnXU7v4vzRpPjOnbPjXxuXfmQkdFE3Jos
	R3tpBnCXyHgOL8rnbhx1WQ40Gozgg94BPS+fDJygUHKIprItcm4bSqJ7dTY4z3lw
	+MCO6Q==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm2mn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:02:08 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-48976713b46so3193426b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947728; x=1784552528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=;
        b=Z8DHo/ol0Iagd7pmZQw3RFwST3uMgoTC30QuHK00pT6O1490yQSwCWSXspAKc5NDGO
         ZjkxelpYSyhPNoxrTKnB6tUv4GQ4GcLugSuucJ9i/EskITXoMdX1/8DfbqzpMmzd969X
         f9jkX4ufQPsvR8tCEmsxMEbX7k4ubdl/YuIScy6f3vPLjCz28DVX0sad2vAIkLYURRE+
         BBl/z5+Mqjq4ujDHYM9PDA5NNoDtyR9alVMy21Vu0vooKVlEs0AB9Kx0lcT62wQ5bWFq
         x90TC78CYSDHiNc8vAsaIGsUdaNjmxMWKBY59n0novkcXNFHFCTv44d7Hg1GRTIq0XA3
         3XEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947728; x=1784552528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=;
        b=kmo+OXaf6f2xHDh7/WWki3Od3IeFZj/76WlkMhgTfMckdfLP4X31r0mAM/gNRILnDP
         ovxpya3RfoZXU7oWJ/J3IWRZ5VstDsMBbqzQhcU7t7c9TddwC/F9naLXYD67A03nuRRM
         5ZI4nu0YEcfVNZjckPJvPyL/ODyoBMnldWXeaIoeZQISdnvgwTzJwqTHxZRCwTujRwFz
         anClS0gujzSssdvEp3hhPTpqh6iuD8ft8Fx2w7R5GQAB79A0lEoBEnx+GX0+g/RSBEYs
         D/pZnWUyCv8LIWpK4M5DvtlAnT4AWIzHpIpA2cax6lK0zHGvhVMxFRSNKZ+K5trvHLra
         24Qw==
X-Forwarded-Encrypted: i=1; AFNElJ+ejl/3tSUicuf4sOghb6Z1wYyS/KrrWEu/xHZwySjdlDHPWeMuklrZGDJbnSyO0oyJiAr1rJP42IqbB6MR@vger.kernel.org
X-Gm-Message-State: AOJu0YzfUHLS2V+KZ3ukMnYvoo9Cz4QkTYj4d39d1i0LJAU/hFjJmf8Z
	VUEthW4VUHDbIGEu9dWj7kCP1rfKRkIMPgiIIVtluQT5YoncDLycAz6DYE19CzpTK3qJ7vTbZVQ
	s7GID7MfWyPpitmXcoaiZz2xMpUSHTDXYngQop4pyNEbk6fwHgIYUy6p75wLifzZElGUF
X-Gm-Gg: AfdE7ckJh0JMqEYjlZp/pYf7q/IqFZhSWJIFpaRdCx58wXXRVOlV9/+wNKfuieOvBpj
	pzwllKqTgaMK9bATpGlBkLwKLzBRzLD54P3+u5o/Xd7SE7yrZslTq3WRlq6x5RHXx/dI1DC6xqI
	nKYKauoxgzcRp4uZnwcNTqyGd8Gkfz6DEt/R3LqukXUhRZiRyEcVUbF/4tqkyeZ9fMr60gODhys
	YtHxho0W5HcCFx3pMc5qgF+ASRouLYqbGencaTpd0sDBeN+YRprob2pGxUiFyg2MYs3kleiP/IR
	QzhJlMTmkuvyRnQFInOWGGCWnqp3JtjKt+DRI3WMgSwBGC3+JlxikCm8GYFLZG9K6Qr705TmNmK
	VvRDoGn0BMoqgPPiCvecdeAAM/rLbBS+iYvCGryYn
X-Received: by 2002:a4a:e90a:0:b0:69e:3c9e:5e82 with SMTP id 006d021491bc7-6a39a6e0605mr5301028eaf.42.1783947727354;
        Mon, 13 Jul 2026 06:02:07 -0700 (PDT)
X-Received: by 2002:a4a:e90a:0:b0:69e:3c9e:5e82 with SMTP id 006d021491bc7-6a39a6e0605mr5300958eaf.42.1783947726554;
        Mon, 13 Jul 2026 06:02:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:02:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:13 +0200
Subject: [PATCH v21 12/14] crypto: qce - Map crypto memory for DMA
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-12-bc2583e18475@oss.qualcomm.com>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zV1OR5DiqlcnDzl6TeLEQ0wLAWkLclKWK2ow4Gd4Hb0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGg2k4Aqdj6ExXfrGYi33qNB2cF3TtdSmBxG
 ZEWkJ3G2I6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThoAAKCRAFnS7L/zaE
 w83CD/9adnWfXDogBIuVxqsFAK0DlbB+A8nFLQfV7/YceIQyAioQNgoRNTzD9KdUS6Belq9lDMB
 JiHASqWZlwv1Vq8vH1IIPhN4y9XkIHPJlQ2bm3wpIQYURD8QnlWRS4DWPWy8+J/nMJzHrd8xjW3
 rdoT9t8ATGSYLtYUCS2rJb9S5NTihi/e3AFGH2uCWgI/2VvHspDZEP6MwNeqrAt1It1AvNP4hyR
 e1lhSUNlAviaKAzRFOgtXZfd/TTsuDkAS5CZIuSTF1RKMP80YA6Z6Z9TMVJ+eti37tJg9p1YGyt
 4cXWOfxgVQz3wVaTaQQAd2mbR35B5jlt9wYR+g8hdH7CkOCj9+dSFYYftu6bmoH+kAhoGx3d9fV
 1BjqKYPJyp+ysTK3HlmGWhLddnAw1rpipDBfD6+rcs1tjSTKU7U43Hn9Gw3uBpISSd9lvwbIAp8
 bHrmffTHYd51PVA+50Amcmd4VbFhfSsf0jKvACSdewmtmg1r/Aub3HZ7fWkDniExLIh1u4I2uqO
 8iT4g0LSaZMgPBw87KUt/kymxHHjembekUq8KVN/FJgniWx+qUvEyQNLlm4XW97RSlRkxC+jhBK
 4SE7efnWclviV9PmijiUX3dkn/mXjyX0MJfAhr5V+oGpJ3FcjXlv0AJFWBvshQzPxIlZIcYiWsm
 /Y6B4Il3X+fkQ3Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: hHgxUhCf8_l4rJjNvdCNHASJXIlMhwvl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX+ggygy60TaEI
 CFxRUlBens10UQHsVQhCKamoO5C0nJUCqI4cgYlnir+5iQ3n4+trCb8Y6ejB2SC/nCuVN8I10wA
 ML1laKIXwd38hiGodf0L5A0E1iicuAM70ozHYG4/Dn2Q+p9dlK3byzN4I/kvY6SalG6+6hMHETU
 h2PkkbJnc3oHMI+Q6oJS8PbN+A9nXxuE817dqlhKdnG9EJvx5qHp0QWMc+fH9QzhDrcjcROg4g+
 KYKjqFVSn8dFJ2rJmMfkhHaDGMiztIV22TeFIyx8sjscgSA1YCQ0N0H/X+zypWZGmHVJn2i4unb
 sACx2xvXXQlwynH8hkFZ3esV1CYaUDbfZa5ZGw5U1Y8LwIRPX0HyC0RtMJQPrGjKBnFsPHxjLVX
 OJrRY8o248TiPGYV5Ge6hnpdiI109ByppbyLI2PCDi/Iul3BWFDNACO6hVuC3IkPUW4Sj2k9SBo
 7ivo3o8voaB/HF2MVfA==
X-Proofpoint-GUID: hHgxUhCf8_l4rJjNvdCNHASJXIlMhwvl
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54e1d0 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tNk7rGwWxUH_P3zroIA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX2/5LTL1VazhB
 0ooZfo3nFksqYxcKmZ/Q7k+5RzpOM+huWkUGeGQxKznFI/FVQ6K5h4BUMpDc2x5B/1X5CyipkLE
 TtljKtCGNCWc3VgexfOD+IMP+f6pYyM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118782-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:corbet@lwn.net,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:quic_utiwari@quicinc.com,m:mdalam@qti.qualcomm.com,m:lumag@kernel.org,m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:peter.ujfalusi@gmail.com,m:michal.simek@amd.com,m:Frank.Li@kernel.org,m:agross@codeaurora.org,m:neil.armstrong@linaro.org,m:dmaengine@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brgl@kernel.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:tharagopinath@gmail.com,m:peterujfalusi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 8CF4474B540

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in converting the driver to using DMA for register
I/O, let's map the crypto memory range.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 23 ++++++++++++++++++++++-
 drivers/crypto/qce/core.h |  6 ++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index aa4a0b17749081f1ad653424bc265ee81e348e15..4031b4516d6519fc5024bbbcc439500a7b3314b2 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -191,10 +191,19 @@ static void qce_cancel_work(void *data)
 	cancel_work_sync(work);
 }
 
+static void qce_crypto_unmap_dma(void *data)
+{
+	struct qce_device *qce = data;
+
+	dma_unmap_resource(qce->dev, qce->base_dma, qce->dma_size,
+			   DMA_BIDIRECTIONAL, 0);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qce_device *qce;
+	struct resource *res;
 	int ret;
 
 	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
@@ -204,7 +213,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -254,6 +263,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	qce->base_phys = res->start;
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
+	if (ret)
+		return ret;
+
 	return devm_qce_register_algs(qce);
 }
 
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index f092ce2d3b04a936a37805c20ac5ba78d8fdd2df..a80e12eac6c87e5321cce16c56a4bf5003474ef0 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -27,6 +27,9 @@
  * @dma: pointer to dma data
  * @burst_size: the crypto burst size
  * @pipe_pair_id: which pipe pair id the device using
+ * @base_dma: base DMA address
+ * @base_phys: base physical address
+ * @dma_size: size of memory mapped for DMA
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -43,6 +46,9 @@ struct qce_device {
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
+	dma_addr_t base_dma;
+	phys_addr_t base_phys;
+	size_t dma_size;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);

-- 
2.47.3


