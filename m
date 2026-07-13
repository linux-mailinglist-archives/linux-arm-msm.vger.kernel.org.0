Return-Path: <linux-arm-msm+bounces-118772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tBofBiTjVGoGggAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:07:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8141F74B4E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:07:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=As319bkH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j9OevBXq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118772-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118772-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 426C2338297A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0799441735D;
	Mon, 13 Jul 2026 13:01:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF374414DE4
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:01:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947699; cv=none; b=kfOQ++yHdcf7T2nyYiXx9QPE6w6DLOxsGMvJt2xuiMwEz5MrupZYbnOdD0p3BlkAzuNeIxLZdWgrpc+eoPnguE8vaxVdi3AbZOCVp0xfCreP9FhYhphRCIqKvJTc2SjrCzInciqE0zxFKiMvoCvr0ZfAwVIXM3XupFmxo3Hj9F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947699; c=relaxed/simple;
	bh=wCpLSEqzl6yoBDde9p+VABZfQUJK0dP0DnJmF5kRzKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uMr0mrobGKn2g/xJjYFE49ZMql87L1/6J7iditvqGQ0ncFc0/5vO3lomrk4MPIDO417+x2GWN69RVfQUti0szUXvvWAg6RtbBp1iWAMYOBbkICZ5oUM7HJJjJWdrLI2o+RhMNCKpt9I43jbZ47dvXHiVt1qx0ySlXolsD0mMGT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=As319bkH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j9OevBXq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEGS81516541
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=; b=As319bkHmB2MPCD2
	hVjsqzb/0oNnhssWoqFyIUeaZrYkdhwxn+OQ85KeMoE/K+8tSovvuYCrh/Jrrjo7
	aQpJUhvTmDJsFFFCG+CL80mbt0+G0F+3OY0Ulf3Bq0izs/3L8GU/s1kIVGWjVkU/
	xsOxCeLDTwyUqE8E5fEdEuVyb/6kWLeayDVkudLc1axFCx+dhXQnU9Nwfq0/HEcl
	Y8bUd9y0cXKCli1rBJbsIjdkA98Djd+R9eTNHFY9E2/hUFvlxzrvwp+FTFtQj2Rj
	T2Iv6tueOC/iAwkRoBLfrEa2VmYzy33vVuricBtYNx2GKBVUpfe8Xh4ugw6SROnm
	KwkwXA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubss95c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:01:36 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a1240143d0so3982939eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947696; x=1784552496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=j9OevBXqCEPzEELW1yF6BR6QPIbOovqZ09VdoxPvr/868unUJw6twdG+Mj5i/g1LhZ
         ih9OFEStud4Yl4BZz0hTwXUk+u013kBwYatr9th3mL+dkf3od0IjfM2pPMHZELySVGs9
         RmLRaAJtuZShw5XGZHp/U8oh/E2Zvhfs67tHOdAezi8XjEc+vwQtiq1xX5CpUBCiZY1V
         jR30QjV9UpdB9bd+2MbxSRDynmdYtW0EZYb5Em5r/tO957thipjQb1FrfUrcc2QA2Jrx
         4mpwoMMHztFetNh9SZnjEgyizSrYlQ33p6jDl1OsdUQaBXFZUdzA43zxoosD5n34PVi3
         7VWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947696; x=1784552496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=iiAU/l2VVWEAehVvkibax+WCMcRRgYGPfY7t5nGwXv/nQAvEtmDrLX0TGigDTtWGs+
         c3fjuFtqWUm21Sie35aBB5XLdfaJPaZ8/jHQf1Rum/TEduibGuElWox2JF5jL64Xm+TC
         IxplOv7RJqWuVZk9gQFhowRxDb/VRwfAiq1ARRwM+PZuw143Hla9FO2MoIqcSXiIzEsT
         8hA5VChRB7TduuDRlmBmmxskJ+ZTC+PQZfNLuuppkWTUPfkddguCP5ka17MqxGzW/LZN
         XND8TdDO7AiIWXuQt9ZgnZaGmYsu0eDr9OdPhFM/Ax+i8MYPeeN7zgMMGxBFtMMUYbuW
         iVlQ==
X-Forwarded-Encrypted: i=1; AFNElJ9C7x9x6OTmB475RvEG3o02/hAKPQ2euz+nVkU1nhgsJeeFwAY4stu0Rf9X1W68nWuWegQeLxiZu5h0zH7X@vger.kernel.org
X-Gm-Message-State: AOJu0YxOogLLEa3DOQO6m5PZruMkRp+Dzecmo0ULjeagz4gf46v3GXSD
	kEAF3qrKqaxsVxflXEscu1xz4LxyjQasyPBgoMqItw9tHDJCvMBwP+FoG8+0Xf/+gXsyeQe//M9
	M8tDbwnwyywCW6nbZvD+H7FF6M6bW62tt0+0rPPd5dtr7XfesCXPYL1ho9RPLocAbfExk
X-Gm-Gg: AfdE7ckFrn0+fHvGAbkmtwME79vsmw+TXriczPnXOtilvoIcjsVCJroPKdo2UDpAUOU
	0xpV7XMMuQtr+iZcCA2qZ9F6VhcfPbLv6GiAhSN/KYQUlQbqYKI5E0IFEudH3FS0i5splvnGBxk
	MozZr0KjxyoIyT6aGynLdut3ax45SYCbRNWho5WUddAhl1G3E/Q6ljMT2IOfKGWTO+x/sgNblAq
	5AI9jMZkWz3b6Dnl2+m7v5pNU5Poaic3Wxhqfo+5WARxRVNibFQXXQZ9hlWsNkMuBLm8OWPFDBf
	NUsiblr6LhOlACkOLFaYQOLMYFlQXTZ7zvWXs8KNeAk5KJC7rfan2UtKuzlSj+bYKKFZT/kaRcC
	qUSUIuvwovfpP6aWLq7Rl0Y8nTU0xGUO50gDtr864
X-Received: by 2002:a05:6820:2081:b0:6a3:955b:846e with SMTP id 006d021491bc7-6a39a6e469dmr5625849eaf.34.1783947695730;
        Mon, 13 Jul 2026 06:01:35 -0700 (PDT)
X-Received: by 2002:a05:6820:2081:b0:6a3:955b:846e with SMTP id 006d021491bc7-6a39a6e469dmr5625784eaf.34.1783947695041;
        Mon, 13 Jul 2026 06:01:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:01:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:04 +0200
Subject: [PATCH v21 03/14] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-3-bc2583e18475@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wCpLSEqzl6yoBDde9p+VABZfQUJK0dP0DnJmF5kRzKI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGX/Y8gCg+vNlb9b8QC+y2NfOdxPRPOTVCmq
 xAw/gdxeH6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThlwAKCRAFnS7L/zaE
 wxhED/4n1veWAxQWpeJS2JF4WMRXE7Qvtg/6vxq21gYhDGmSsHSQgS2lLYK0DMGm3oqm2Ft3zsf
 sZQtzaxhO1DLE79xiBvNcVoZ7R61pPwrxOisq7pviB95rRCoxwmUXppCWgpQTTnAdMQ3ubwLAKZ
 uGHGu0lUlsSPutnLVQEqCrF4Y3/j0wm9Bc4WCw3+YU5tYXUr8LYkxzF4lGwOqK1igDU9xGxC2vT
 nh5+aKVbKrDN7kOLGFRXwf5TnvqK7JsecA3krD/0SOuKTrV1sHI2tnDhm2/VEc/JeYBokhT3U9h
 Uph0Nh6JK6419lTFFTBt65ASG77FNh1NfPs8gIeCi4VGAZVtkJHOyGsafxbFWz5EJ6sZhGjmQWM
 A0ijR2UslRW8F8q65YwAggdfUKLCPnZBMmMBi9FgxpJvzccZvK7bwnbI/tEcGQOxu0xXOsny/o/
 62SJZxyiSKAJmZ0ki3ku+nmOKed2WhouprsvaIYUslRMsUj+BiD/JQ6lczGOyw/1PRYwqXFomlF
 gWxQnJMPfFwtGRssFRfGtlcopFYECP2rHBuYi9eqohJ6xvDzFD+h/M61zMmqIUdoLijMLLmFaeS
 XcNPtsA148e2Ij3mjmX/uC0Xf/wqcEjBdAzRs8VkI9Fgs6QXrOGA3JadnwSaX4B/r/ts3Xq/PMc
 Wz2+SMMC9BOM69Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54e1b0 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: pU6zXnTI5l3PJ2u1ewvBjYZh_14mo7yq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfXxFTMPbRGGUeo
 PuiL2MXGcJA7meqih1XjzkVKJRxU5Fmmncj7icSMy4bdStLRYsxBZsNdMQ1q7y2hh7E1edcNIDP
 qPNFqs+ZGGqAXhGBY+4pcgSZLOE5dNY=
X-Proofpoint-GUID: pU6zXnTI5l3PJ2u1ewvBjYZh_14mo7yq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfXxm38Wgl2aBJE
 Ua8rgTO0Xv2mmnyNeWw/eGiYj55QSRLlDWNPxYaZnYRa8QfcXUex09FRJaqeoRdTrJbi4yj7nbu
 Xx3LjALq/ZNWmQt0FSHUwQpvQuGM2XLujnCBBp+N0wrauw/rM3YJxOtaGb31QXzPRGc0NqaBpmj
 wwUipi0seaxiH6/LCnzYL/hJQisfv1IfifgX9vEue9iF2WFl5gHyqZI2eJBOvRBBwHnGFu/2NgQ
 XllYujDRC3cBB4NZLHo2ro+kEcEnWHYr3Gf04l+6RdaBcI9FtlASYBg0gubwdh1ah821zFVOvbP
 zqFxKKevxHuoClQsY5a+Tf9TjeJ0tYVvj8ywKwPdwNJK9rKINk/cOt9/zIbyS2oRhi7/Wg6g0JR
 LSTzLgWUVXnY2eLK8qHTV/xA36fxr+6MV53CFdvnqXvmat4Kp1NKQ1ESemXn74qVP0uxzs1JWpD
 S4J03malfxr3XtKT7YA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130135
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
	TAGGED_FROM(0.00)[bounces-118772-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:corbet@lwn.net,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:quic_utiwari@quicinc.com,m:mdalam@qti.qualcomm.com,m:lumag@kernel.org,m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:peter.ujfalusi@gmail.com,m:michal.simek@amd.com,m:Frank.Li@kernel.org,m:agross@codeaurora.org,m:neil.armstrong@linaro.org,m:dmaengine@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brgl@kernel.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:tharagopinath@gmail.com,m:peterujfalusi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 8141F74B4E8

BH workqueues are a modern mechanism, aiming to replace legacy tasklets.
Let's convert the BAM DMA driver to using the high-priority variant of
the BH workqueue.

[Vinod: suggested using the BG workqueue instead of the regular one
running in process context]

Suggested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index fc155e0d1870cbb7e099a2c4280f9f8fbdf6cf15..ea3df28e777f99c0532761b6aee6807ab23ab4ca 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -42,6 +42,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
 
 #include "../dmaengine.h"
 #include "../virt-dma.h"
@@ -426,8 +427,8 @@ struct bam_device {
 	struct clk *bamclk;
 	int irq;
 
-	/* dma start transaction tasklet */
-	struct tasklet_struct task;
+	/* dma start transaction workqueue */
+	struct work_struct work;
 };
 
 /**
@@ -892,7 +893,7 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 			/*
 			 * if complete, process cookie. Otherwise
 			 * push back to front of desc_issued so that
-			 * it gets restarted by the tasklet
+			 * it gets restarted by the work queue.
 			 */
 			if (!async_desc->num_desc) {
 				vchan_cookie_complete(&async_desc->vd);
@@ -922,9 +923,9 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
 
 	srcs |= process_channel_irqs(bdev);
 
-	/* kick off tasklet to start next dma transfer */
+	/* kick off the work queue to start next dma transfer */
 	if (srcs & P_IRQ)
-		tasklet_schedule(&bdev->task);
+		queue_work(system_bh_highpri_wq, &bdev->work);
 
 	ret = pm_runtime_get_sync(bdev->dev);
 	if (ret < 0)
@@ -1120,14 +1121,14 @@ static void bam_start_dma(struct bam_chan *bchan)
 }
 
 /**
- * dma_tasklet - DMA IRQ tasklet
- * @t: tasklet argument (bam controller structure)
+ * bam_dma_work() - DMA interrupt work queue callback
+ * @work: work queue struct embedded in the BAM controller device struct
  *
  * Sets up next DMA operation and then processes all completed transactions
  */
-static void dma_tasklet(struct tasklet_struct *t)
+static void bam_dma_work(struct work_struct *work)
 {
-	struct bam_device *bdev = from_tasklet(bdev, t, task);
+	struct bam_device *bdev = from_work(bdev, work, work);
 	struct bam_chan *bchan;
 	unsigned int i;
 
@@ -1140,14 +1141,13 @@ static void dma_tasklet(struct tasklet_struct *t)
 		if (!list_empty(&bchan->vc.desc_issued) && !IS_BUSY(bchan))
 			bam_start_dma(bchan);
 	}
-
 }
 
 /**
  * bam_issue_pending - starts pending transactions
  * @chan: dma channel
  *
- * Calls tasklet directly which in turn starts any pending transactions
+ * Calls work queue directly which in turn starts any pending transactions
  */
 static void bam_issue_pending(struct dma_chan *chan)
 {
@@ -1316,14 +1316,14 @@ static int bam_dma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_clk;
 
-	tasklet_setup(&bdev->task, dma_tasklet);
+	INIT_WORK(&bdev->work, bam_dma_work);
 
 	bdev->channels = devm_kcalloc(bdev->dev, bdev->num_channels,
 				sizeof(*bdev->channels), GFP_KERNEL);
 
 	if (!bdev->channels) {
 		ret = -ENOMEM;
-		goto err_tasklet_kill;
+		goto err_workqueue_cancel;
 	}
 
 	/* allocate and initialize channels */
@@ -1389,8 +1389,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
-err_tasklet_kill:
-	tasklet_kill(&bdev->task);
+err_workqueue_cancel:
+	cancel_work_sync(&bdev->work);
 err_disable_clk:
 	clk_disable_unprepare(bdev->bamclk);
 
@@ -1424,7 +1424,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 			    bdev->channels[i].fifo_phys);
 	}
 
-	tasklet_kill(&bdev->task);
+	cancel_work_sync(&bdev->work);
 
 	clk_disable_unprepare(bdev->bamclk);
 }

-- 
2.47.3


