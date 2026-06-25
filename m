Return-Path: <linux-arm-msm+bounces-114431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jp7cNjCBPGpVowgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 03:15:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 416476C2185
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 03:15:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KF+eD7jD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dtOROqZM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114431-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114431-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 066EE30325B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 01:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F292369D73;
	Thu, 25 Jun 2026 01:14:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F8D3612F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 01:14:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782350090; cv=none; b=jSW8nNRsTkqxdd2DmKEWETjAo1LgYpg4qID8CYJe+Mf0NoJviNlNRPo3bCouqWZ5GdblvujOaBSzk7LqIWsQ9/OfkuR3akxtWIMlObMPmf8ZQ781bmtJJKouHcHAk9hnIseD/BG4+Vk749kKpAOYt+jzOw8yUhPj8+CPlSA+yD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782350090; c=relaxed/simple;
	bh=CISY4UQP+z7PqN8AZdD6Qaz4dG0qqWxFgMBTel2BPy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/3WaZxAyomWmX3DHHzf7fpPXjUOm3tHMq6xXwnk448f5EV5etfMidsLYi/n9FzbQOqEAnSi5h2nyiNH6UXalq4gZxkh3QxFoo+wn3/qy2S4l1++q/yLv6RTp5WX/7AuvvXgFcdXfhrwpsP5a5R0Lahcvmh2kjWgli/NzXGgbWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KF+eD7jD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dtOROqZM; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OLqh3k366711
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 01:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AipFGjYh8Cvc0+Iuc+GbopNsXObtl5GIW33Z8XQPoL8=; b=KF+eD7jD4v0Kdcxw
	MyTtQr4wuFrnp1ECw6RKkz2YBsk6Rm8/CYlWuiVXo1zMQcaukyHCEL+vTGBRjrzV
	FRyd6oG0YcF+sO/lB1O4zsdV/Q6bT0mBuntUUlwdur9sUb3dsKotjEgXi3yCjJ6q
	ZEBOXTopSc7DpAhclh/oZwF43eDoYUnxROn9aDZjpk9ns9X2HqTz3vcGht8s3VqJ
	yVvg+k96tVd8iQI0Xg53cZSk1jFuLMs0/npQSfQfvkA387VwFcYDKucFAI5Dnp2y
	REd2IMeqDUvpKtrRaiFAVeXfZG390RwB0NblsJxi5E/dZ8j8RxYMffGeAkOwJnFY
	eAyIOA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ar4vgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 01:14:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6af282daaso23374505ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 18:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782350087; x=1782954887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AipFGjYh8Cvc0+Iuc+GbopNsXObtl5GIW33Z8XQPoL8=;
        b=dtOROqZMIqGnY+fqZmbSSCOhTJWxCSfQOyjTO+SAfBMmHtd6siOLyPYVtiD6vKFrHU
         f+QDaxysK23zXPoPnq47/hRNSMUEKLWO+MLxVuVbL+ZTs4sP4ENBmPzz1LMyVtku8k7c
         CByH++KPVdtZ8pDONi7rX9FnAgdyM9fNDmtiJvI79iN5P5H7yN4HKFxDNjddBFyGM3nt
         UctvaDslSk66bsP+h22fZG3kvAPctqXZIbDZJCzJd+3V4UaRziuPibrS7N2QZ9wU0I1k
         q4FHiNiHfda44ZMoafQ5RxpBTSNoOZt76zh0nidQATnLdj74w2ln/0AbUN8zZQ78T5jz
         TDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782350087; x=1782954887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AipFGjYh8Cvc0+Iuc+GbopNsXObtl5GIW33Z8XQPoL8=;
        b=UbBzSM7CCHY7nsWq5AwsxuDNDup8pFV0x2hmu1bzvIIPwR6FJODYzfqNLE7cO9tJdH
         OkOeJPVEmc8sU+CgSaZFR8E3OdIrAIt5mLD8bYVk6olMeOawhCvibFEaRp2688zoL9SF
         GvuzntXuPt4Vf9ulHTkq3xG3s3ggC747nSSbfmlEArUU6T8sAsWb5IVU9Q1seTDzWzwW
         zbFOsvaB9d1EERZokLsi3OWeptd9bd8e+uUALkUyzsalnO+iLJ9K0fCRNEDK283cgV0f
         vq164lx5wB6PVIuql3hamDtO6TvEUUXEiWzTiRbc3dBBS3KLq5/X8WrHhQnlWB471h+d
         5zSA==
X-Gm-Message-State: AOJu0Ywm9iUzuBXCeegtSmPJQqyl843Bbdd0dI4H7Si16YTRwigRC8hh
	JUc4qFPNR9Rs/ao137U+WsvzaqMcvzYGsdXgol+bStvpd9pVpXj8b4XfRPidQ28K8KCXDz6LIrC
	ZiHOpmbYq8eyZKZTpKt1t/h1FjeiIpPTYad2wvFcbXjGw5bf3+EZtOTCpj/Ock+7uanr8
X-Gm-Gg: AfdE7cnW+NwqmSrNJtEkEuDRuaZjk9U/38kWT+vWohiNFVOhABtQcZsWrB3zGaBIzqM
	VP0POcDBSQzscdZZVlRmhC2JyOSQVbTEx/Axm8TJF9YEvBOWjtnOrOuiF7u7kaivhoyeG6fAb9m
	mZz0h9LtPJ3yqZsexaHCNCO30qJ9wg+NnD6t0XIOYwFSHag2d04DPCQ7ZJNzFjwueIjQOwvcdsn
	HZ+Ac2fZfNbWrVetnFYKi+votKHpJvznxNANb1T657TCOXq69gks4hdQv+b9rzNTy3J3eP1vhRy
	TGNPzS88zm3+qjTlHR2U5Fg/QUQvJh+i7fVdwJ7lntQtWAwuVSIlOkcaXW3sPheK9YnPwEATR77
	hJNqthieKXY8K3dM6hg4V6xQQi0pcAzEcmPNd6z8loyU68z5AJKtQu8wZeazl8Fu20y8Subt/4r
	obdUV91GY=
X-Received: by 2002:a17:902:e847:b0:2bf:281f:19ec with SMTP id d9443c01a7336-2c7fc6f498cmr5814145ad.24.1782350086722;
        Wed, 24 Jun 2026 18:14:46 -0700 (PDT)
X-Received: by 2002:a17:902:e847:b0:2bf:281f:19ec with SMTP id d9443c01a7336-2c7fc6f498cmr5813875ad.24.1782350086168;
        Wed, 24 Jun 2026 18:14:46 -0700 (PDT)
Received: from [10.133.33.196] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63b2e18sm8071305ad.41.2026.06.24.18.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 18:14:45 -0700 (PDT)
Message-ID: <8fbfa82f-aae7-48d6-9406-d04e719f028d@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 09:14:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] arm64: dts: qcom: kodiak: Add EL2 overlay
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ePsyr0JCtwAlnAnMO_rbMiXCP9SPPnKj
X-Authority-Analysis: v=2.4 cv=EuLiaycA c=1 sm=1 tr=0 ts=6a3c8107 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=FWf3DjJPLhuRtTups_oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDAwOCBTYWx0ZWRfX8N4cmhuIhIZD
 EPNs/bj+kZhGm2KWv+YR4dUCFF74gnghqb4aDGfvCjaRSziY0rnELnSZYdKGdjE8b56rFQHP2Q7
 flQ2bGgb7OllnY72oRrEZxL/pR59KMI=
X-Proofpoint-GUID: ePsyr0JCtwAlnAnMO_rbMiXCP9SPPnKj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDAwOCBTYWx0ZWRfX+EDRIv0M0D5K
 OjoFmivVxjgIhIOMJ4BsJ3W3MXuI5zChhbjGeRwY1kPCqCS/2orSQjp652BIIPFKHTkROZwypn9
 uae/zzkGaYwUZQqFiA3Bbd28/R5q+M3EKjPCWi16UjwNREeR7V4CrWs3cAD5qdnLWd/poVXP2rM
 MWMhhGwtmMBHaugtrzV0r7AZqYxoKztM7YOzh5TlXUo9/ESwYjRNN6Of/QFupTlsRiRf40xxAC2
 lFIbvjngEV70LlsnXEcAQDHoQkcKtLyRQisBIzwG8AxoXtxKzpu+VqV+mYV61YtOAi22T5io0CU
 UKmoNhYXGPYu7hCxefGq2IexQDBIlUll0DKaW2/EbKB3/mc9WHojvVevMvyo6KuJ7FMkVFV8Jr+
 3Vxx5wWDBD/o/vv4mjB+q4NeY9HPyiwE3fv8NmsdCC0wTPzYzgox7XaoXmZERFgRwC+/qGwwBWZ
 u+KUsq/J+CQAnfiUWQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250008
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114431-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[miaoqing.pan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miaoqing.pan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 416476C2185



On 6/24/2026 2:39 PM, Mukesh Ojha wrote:
> All the existing variants Kodiak boards are using Gunyah hypervisor
> which means that, so far, Linux-based OS could only boot in EL1 on those
> devices.  However, it is possible for us to boot Linux at EL2 on these
> devices [1].
>
> When running under Gunyah, the remote processor firmware IOMMU
> streams are controlled by Gunyah. However, without Gunyah, the IOMMU is
> managed by the consumer of this DeviceTree. Therefore, describe the
> firmware streams for each remote processor.
>
> Add a EL2-specific DT overlay and apply it to Kodiak IOT variant
> devices to create -el2.dtb for each of them alongside "normal" dtb.
>
> Note that modem and media subsystems haven't been supported yet due
> to missing dependencies. For GPU to work, zap shader is disabled and
> in EL2 mode the kernel owns hardware watchdog which is enabled here.
> And for wifi to work wpss copy engine memory need to be mapped for
> WPSS firmware to work which is aligning with sc7280 chrome.
>
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
>
> Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v8: https://lore.kernel.org/lkml/20260522115936.201208-2-sumit.garg@kernel.org/
>   - Added a wpss copy engine memory similar to chrome for Wifi to work.
>   - WPSS does not have firmware Stream, so that was removed.
>   - Added wifi streams similar to chrome for wifi to work.
>   - Removed this patch from Generic Pas patch series, can be followed
>     separately.
>   - Moved Sumit as co-author as part of modification done to the patch
>     in the past.
>   - Added some more kodiak's board variants in the makefile.
>
> Changes in v1-v7:
>   - mpss was disabled and will be enabled once the dependencies patches
>    get merged.
>
>   arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++
>   arch/arm64/boot/dts/qcom/kodiak-el2.dtso | 52 ++++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/kodiak.dtsi     |  2 +-
>   3 files changed, 65 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6f33c4e2f09c..d2cee1190954 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -164,7 +164,11 @@ purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
>   
>   dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-el2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-fairphone-fp5.dtb
> +
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp.dtb
> +qcm6490-idp-el2-dtbs := qcm6490-idp.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp-el2.dtb
> +
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-particle-tachyon.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
> @@ -176,12 +180,20 @@ qcs615-ride-el2-dtbs := qcs615-ride.dtb talos-el2.dtbo
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride-el2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-radxa-dragon-q6a.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> +qcs6490-rb3gen2-el2-dtbs := qcs6490-rb3gen2.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-el2.dtb
>   
>   qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
>   qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
>   
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
> +qcs6490-rb3gen2-industrial-mezzanine-el2-dtbs := qcs6490-rb3gen2-industrial-mezzanine.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine-el2.dtb
> +
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
> +qcs6490-rb3gen2-vision-mezzanine-el2-dtbs := qcs6490-rb3gen2-vision-mezzanine.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine-el2.dtb
> +
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
> diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> new file mode 100644
> index 000000000000..91e4cda45b49
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Kodiak specific modifications required to boot in EL2.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&gpu_zap_shader {
> +	status = "disabled";
> +};
> +
> +&remoteproc_adsp {
> +	iommus = <&apps_smmu 0x1800 0x0>;
> +};
> +
> +&remoteproc_cdsp {
> +	iommus = <&apps_smmu 0x11a0 0x0400>;
> +};
> +
> +&remoteproc_mpss {
> +	status = "disabled";
> +};
> +
> +&reserved_memory {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	wlan_ce_mem: wlan-ce@4cd000 {
> +		no-map;
> +		reg = <0x0 0x004cd000 0x0 0x1000>;
> +	};
> +};
> +
Is it necessary to redefine |wlan_ce_mem|? Can we consider updating 
|qcs6490-rb3gen2.dts|?
I have verified that with the following changes, *NON-KVM works fine*, 
and |wlan_ce_mem| is only used by the WCN6750 firmware.

--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -26,7 +26,6 @@
/delete-node/ &adsp_mem;
/delete-node/ &cdsp_mem;
/delete-node/ &video_mem;
-/delete-node/ &wlan_ce_mem;
/delete-node/ &wpss_mem;
/delete-node/ &xbl_mem;

@@ -1686,7 +1685,6 @@ &venus {
};

&wifi {
-       memory-region = <&wlan_fw_mem>;
         qcom,calibration-variant = "Qualcomm_rb3gen2";


> +&venus {
> +	status = "disabled";
> +};
> +
> +&watchdog {
> +	status = "okay";
> +};
> +
> +&wifi {
> +	memory-region = <&wlan_fw_mem>, <&wlan_ce_mem>;
> +	status = "okay";
> +
> +	wifi-firmware {
> +		iommus = <&apps_smmu 0x1c02 0x1>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index fa540d8c2615..2486d15fa2ba 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -91,7 +91,7 @@ sleep_clk: sleep-clk {
>   		};
>   	};
>   
> -	reserved-memory {
> +	reserved_memory: reserved-memory {
>   		#address-cells = <2>;
>   		#size-cells = <2>;
>   		ranges;


