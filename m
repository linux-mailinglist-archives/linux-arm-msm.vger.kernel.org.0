Return-Path: <linux-arm-msm+bounces-53662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B23CA8295E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 17:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B0991886D8F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 15:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B7626B2A7;
	Wed,  9 Apr 2025 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmByAWa+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8291A26B0A0
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 14:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210456; cv=none; b=oJ84iwzmb/CNt3VgaGmVFMLKvrdsRnzaB+n1iiiVsVBYwg/5bYHPI76auM+Zj2uCRg3tzRvUr4SxIZ7oiqCkKgtyxRQdvreMu+LoxTdnMvsUTnDWYC4EJ7FdDzwUxxHbEYoEhDpVa65ja4n8JwbhPrTrU0zdrx3Z2wjfcAEVGrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210456; c=relaxed/simple;
	bh=6g0TfWDuvigbnJLDqJYb2R4PL8SRBJ82ihr5x2bmHek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwYT4g/mA++HOdSrQ0ofxKvsFy7CqkzgrNKWzoVZa+0oQ/Pjq6AdrNiUKKD68DDSyNERSS3Ld1WXjB5btS/4giq0QMp+lAFX8IiBzd5OdP2exlbUrrSAt0Pfza66WLgNxUVYQSvMbxRgnK+bNb06uZq+uoJMgiHMkW2J+Pe8tl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SmByAWa+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398iLI2029024
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Apr 2025 14:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2e+zhortkq1PPVBPRYcJak6GvfMLkq1x12up5ZcdsG0=; b=SmByAWa+1AfXtVKW
	kW7NxtxG4xNKWwjKtwsoXDRknfKrd0cOocRlx/ZRWIKIALZyUZO6ev74eZtaEz8J
	xHSw3qj7m0wyc2QaL/KMHZaTzMiFg321kMfnnwqPqJ1IGG51YE58+cc1wNmdTfGR
	3ZBCbW/h9f00z2qK+UwPzT1U+8vG0Rf2WiVQkTuv3IoCenouGJOdl9V5rAX5MvlP
	H/f99YsjRpjz6r971m7juzNyEPQ23qICulBfVU/MiiR/gvvzT+CgrOSrySFjEJWy
	bNHaAzU8A1uKsKhT8Q18IiX3YOzn8gHx5Jh6SZbXnNjJiMv6CesYI4A+qjc60OZD
	MfNUUA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmbmsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 14:54:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53d5f85c9so162292385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 07:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744210452; x=1744815252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2e+zhortkq1PPVBPRYcJak6GvfMLkq1x12up5ZcdsG0=;
        b=t0UIQEutOLjCAqo+3gl+FvmLl1UHepwe7EyQx6yN256dG3rY+ZmM3RDhpkApGoMbpy
         AJ1sZjYrjwK+ytEJAkS1LhvLoZkftSmGkkb9NLJzxbJf7vLsQT7Qv/ihwriEss12SqUY
         wL5XtQsY19ktLCXOxeloP3/WgUmufekYshcXRX5eO2QuNe9GHqupJCm6D7X+24s7BWe0
         L/4gFCIUglxsBTTD7wPARAlB1GuGsLNYMzQ5hur80t00Zipgbwl9d977r73ozf6lUEbu
         eA/t6f/lycZuQN2+MayfCxwmZNtj139BOh/GQHsCwiE+HJi+djG4QohXM8cSVsgEhwY5
         Oneg==
X-Forwarded-Encrypted: i=1; AJvYcCVy0gqaKimJIvqZC3Fw5zVDshc/qwmsdBVpPl5MhboN39FSrDMKBnKNex0uIXvqm9UVTW7/cRH1SJHf8oZr@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq1BD/+uiWtqnD1F35oHybwrfKABgI0Tsve9eWAMD1TXwEwm5+
	UqgyVD2aWXZc6+SUiJBP7MnJer+ds0Ot1K1w9+hEO7H5cjU2NcUFUHEh6bUdPtzI9fi01QwpwkQ
	7rhpQ14aQ7kXDLaK+XBmYi+GJmpjSls1cq5BwWZj0lGQSrh/q0eiSJQrEXyntuZln
X-Gm-Gg: ASbGncszdzNbKeUCC9Xd/BAREFIXi4fCzpe7zw5iHh6j4wL0mDX2RHZ7hbX8JXuO1sx
	uMRh19yN9k1UZSm/npXI4bKJKJcyg22frETdyOOW/LeRqG+4suxPHSMNj0ZYmEH7K3SN1TS85mA
	2XRW2b5QdN5DW0DG/e1RqgYcEOKOxkHWqhWHkz9+04su0dXmPsZZnHkFGKzAtFjgstacZXGStZk
	/nyCdWFjGG/EMz+GYk0Y6ewfwfZhlE1Qt94mInE2Pdpu2GZU/19OXaArX53vu+GqJi4pOwU8ynG
	bk4+kAVvKcvJYR4U4CtmZa+hIo59SitPG6N4Brr94py4bo/c7kuq5XSHbiToPMBk1Q==
X-Received: by 2002:a05:620a:d8d:b0:7c3:c814:591d with SMTP id af79cd13be357-7c79cbcad39mr181549385a.1.1744210451981;
        Wed, 09 Apr 2025 07:54:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkhEFX9jW2lxjwZtZRt5wSID+lKfDUWjDhK7POIeIFuD1YPW0A5mtnATcnc6+c78jlhAPyDg==
X-Received: by 2002:a05:620a:d8d:b0:7c3:c814:591d with SMTP id af79cd13be357-7c79cbcad39mr181545185a.1.1744210451558;
        Wed, 09 Apr 2025 07:54:11 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4142sm108209666b.101.2025.04.09.07.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 07:54:10 -0700 (PDT)
Message-ID: <fb61323b-aabd-4661-a202-02da7da557ea@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 16:54:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] net: qrtr: Define macro to convert QMI version and
 instance to QRTR instance
To: Yassine Oudjana <y.oudjana@protonmail.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Sean Nyekjaer <sean@geanix.com>,
        Javier Carrasco <javier.carrasco.cruz@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Antoniu Miclaus <antoniu.miclaus@analog.com>,
        Ramona Gradinariu <ramona.gradinariu@analog.com>,
        "Yo-Jung (Leo) Lin" <0xff07@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        Antoni Pokusinski <apokusinski01@gmail.com>,
        Vasileios Amoiridis <vassilisamir@gmail.com>,
        Petar Stoykov <pd.pstoykov@gmail.com>,
        shuaijie wang <wangshuaijie@awinic.com>,
        Yasin Lee <yasin.lee.x@gmail.com>,
        "Borislav Petkov (AMD)" <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Ingo Molnar <mingo@kernel.org>
Cc: Yassine Oudjana <yassine.oudjana@gmail.com>, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20250406140706.812425-1-y.oudjana@protonmail.com>
 <20250406140706.812425-3-y.oudjana@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250406140706.812425-3-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8W4g-4ThUKfs_xDPkecUb4-NJcBSf3Zr
X-Proofpoint-ORIG-GUID: 8W4g-4ThUKfs_xDPkecUb4-NJcBSf3Zr
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f68a15 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=sfOm8-O8AAAA:8 a=PIWKGJPQcB-H7wabpAUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090093

On 4/6/25 4:07 PM, Yassine Oudjana wrote:
> Move QRTR instance conversion from qmi_interface into a new macro in order
> to reuse it in QRTR device ID tables.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  drivers/soc/qcom/qmi_interface.c | 5 +++--
>  include/linux/soc/qcom/qrtr.h    | 2 ++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
> index bc6d6379d8b1..cb57b7e1f252 100644
> --- a/drivers/soc/qcom/qmi_interface.c
> +++ b/drivers/soc/qcom/qmi_interface.c
> @@ -14,6 +14,7 @@
>  #include <linux/workqueue.h>
>  #include <trace/events/sock.h>
>  #include <linux/soc/qcom/qmi.h>
> +#include <linux/soc/qcom/qrtr.h>
>  
>  static struct socket *qmi_sock_create(struct qmi_handle *qmi,
>  				      struct sockaddr_qrtr *sq);
> @@ -173,7 +174,7 @@ static void qmi_send_new_lookup(struct qmi_handle *qmi, struct qmi_service *svc)
>  	memset(&pkt, 0, sizeof(pkt));
>  	pkt.cmd = cpu_to_le32(QRTR_TYPE_NEW_LOOKUP);
>  	pkt.server.service = cpu_to_le32(svc->service);
> -	pkt.server.instance = cpu_to_le32(svc->version | svc->instance << 8);
> +	pkt.server.instance = cpu_to_le32(QRTR_INSTANCE(svc->version, svc->instance));
>  
>  	sq.sq_family = qmi->sq.sq_family;
>  	sq.sq_node = qmi->sq.sq_node;
> @@ -236,7 +237,7 @@ static void qmi_send_new_server(struct qmi_handle *qmi, struct qmi_service *svc)
>  	memset(&pkt, 0, sizeof(pkt));
>  	pkt.cmd = cpu_to_le32(QRTR_TYPE_NEW_SERVER);
>  	pkt.server.service = cpu_to_le32(svc->service);
> -	pkt.server.instance = cpu_to_le32(svc->version | svc->instance << 8);
> +	pkt.server.instance = cpu_to_le32(QRTR_INSTANCE(svc->version, svc->instance));
>  	pkt.server.node = cpu_to_le32(qmi->sq.sq_node);
>  	pkt.server.port = cpu_to_le32(qmi->sq.sq_port);
>  
> diff --git a/include/linux/soc/qcom/qrtr.h b/include/linux/soc/qcom/qrtr.h
> index 4d7f25c64c56..10c89a35cbb9 100644
> --- a/include/linux/soc/qcom/qrtr.h
> +++ b/include/linux/soc/qcom/qrtr.h
> @@ -13,6 +13,8 @@ struct qrtr_device {
>  
>  #define to_qrtr_device(d) container_of(d, struct qrtr_device, dev)
>  
> +#define QRTR_INSTANCE(qmi_version, qmi_instance) (qmi_version | qmi_instance << 8)

Please use FIELD_PREP + GENMASK to avoid potential overflows

Konrad

