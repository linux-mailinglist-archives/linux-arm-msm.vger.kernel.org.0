Return-Path: <linux-arm-msm+bounces-104750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOiAFxp172kcBgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 16:39:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A424748B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 16:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 465CA303AB59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E00A2DEA61;
	Mon, 27 Apr 2026 14:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UcbvvKZU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jchMWZoH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C822D3A7B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777300412; cv=none; b=o3X447zgU9Vb+sFsxVc36J7x4uCBa51o9AtmbCgur/OY2STLSmb9SDT+Cx+QCkk4hXVZkEAWUUHtIRpt+amO5u/L2w2UwNKT9KAfw0hLe8SBMQcDio5P2WN9Wmw8NjXbAc7lsJdWbgbEZqQ269hspQaIuH8WeQ2UHHeIbqsGtMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777300412; c=relaxed/simple;
	bh=JuemiLqBRwrioORUP3apGn8ByH6NxlePrkE7q19s2hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWyVe3G6H90gyGJcw7CsgtJOeYzH5AFEc7owaQKfCOu3tfG+/4WE/42Z8SPkHIVX+nRSAiGDNkCLgIHs1I5WwBKRHND5rDsEjGHsHj5wee7lgkQQfExYqk1nCGlfM07/UuuEPtgEYeu+3diDUb3tL8aCWHkuFOd04jDW/aaLLG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UcbvvKZU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jchMWZoH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RB738o1237224
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ENCWJ3tXp/MAXnI+GiSGkpNUCG5d+RbFUTi1THpaXuI=; b=UcbvvKZUpaOzhqw2
	NUml43E5SDcN3UyHwHQVXIXCKe61TK4I2ZMzZubZF3ca2Ike2vKVRwZoh0yVWcwu
	0zOdfCjXlvOjAfW2SOlwvuUuKYchDtGXy3Z91ROX7qo082RMzia44i6KiHM/1flr
	6LJjZlzy2Xd1ZnIEA4zcGgL+O+SaxedUk1iy2THwfOch/E0e7YI4nGctFhnV927l
	rk52EBs2y6zFs5NSjTT3zqkIOZL3egwRajwm8/50kBooy+k3WzQYPxYlTbhRfsvj
	2heS28hxJcbmwvQictJCipujz2roMN4+v2kpnQdbLLPXkTkfkVzPmVx1Ec30X9iu
	V1KUwQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt6n4gqp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:33:26 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95687296dbcso460864241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777300406; x=1777905206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ENCWJ3tXp/MAXnI+GiSGkpNUCG5d+RbFUTi1THpaXuI=;
        b=jchMWZoHLSXby5wK+UNZtr//qetH7TMzaPvJ5GZNZI+Q9weTKkF9otRBEf+DLmv852
         UwG2KQrs8Rh9AvjkKQYSjaSBbREJ+a1vSQb6I0vDCjJeo7yC5FSdHMsrd6rMmiK8pSOw
         Accqh1OXm15V/WKS/mKJ5GsXf6H/w9cucXzAzoL2jB6unjUKaCKYfCRzmhs8W24sphVY
         +AZ+Ld0CRnq38KQGhHFN/quJ0kuQIO8tuqJh7incfCeMCR0vCpp+YBNaBlSZUCRXdT48
         CSzco7VJjsRnqGkaEwBpw48S/MdK6ZzeBSAhZ7UwWebPxdhuJk0fmVy6eikNfG9fFFer
         jfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777300406; x=1777905206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENCWJ3tXp/MAXnI+GiSGkpNUCG5d+RbFUTi1THpaXuI=;
        b=W43PNZ5MqmVmaWBBeyNBnD7WpSNu1rjdPN6H/tJuN/Zzs4LeIkNa2PNa0dCfdZ9Z7X
         Kg5nT84WZV/H6o/QXeskN1mB3xUPg4EOFYGOXggWiHfb0hVLjq6RSkhwf6n7RKri/XdX
         dAb1hiFERFAK9iqfxyFMPJmzB4X8c7ydOEeeDD/1mZvNf2cw3lU+Sp60w7yXajNp8oE3
         NvQhqGsGssjSReSfRZ7DrrGpE4erR4suc3oi+CzQjgnacx+THFEizQ4tKr4hUTZNWFHh
         pSIEdJWSMuHnTB/f2kkRHALxjC7cGCmwNMbxnFwwyNknx+wKhZk4iFbF71nQVYVfGYVL
         AKWA==
X-Gm-Message-State: AOJu0YywSVeBKuD2D0PMr0F5XYbnh3W+hHTxrIz5pLcU/ja2akyU9Bk6
	26Gs/bbjmENocVp6VHL659ry+w88DFh+yhx3PNWsk0Mzkg3OVsQ2SSqXCZncaQvExF01TNdAf4o
	ifOCXHE2IYmMW6hJNxnkWBbyvDRjn4TLKBiZMRqVsfJFSYLgObPWfjbZs4DeIU+uqDInC
X-Gm-Gg: AeBDietmVvAzKIvv39McS2J8jFy4ShYZNRw3ZCfXJD6HXGSteWwqBQ/Tp/Dkg6AhcCe
	CMUajPQ3t43lROcs+pakD8EN5Z9k0y/ZRMgiF7EqgPpyiFl0DnGr5uWqRdzeIKS6cAKINNRPs75
	cKeoM9zrCKQ5m13yDOFaMXFEFNhg231uwT6p9nrSoXUUzu2XCcDUG2d8PmWSB9fCoewI2DqhkN3
	8Gz0DKPvg7xze++TaTXhD+w95L0hrr40xE7cZRNeDhTze60UgNAePZW49iN92QVz4311uS/YEk4
	X7w8EVkOLbqB8N94RJSRhGPEkmk4iBKyYCSjd2TZE/hzMWzV4GgsrrIXsuQNBqThYur2Pui8K13
	VCT2oBR4o4S+7w0N7mjbs6Ymprq/nhEZMNp7LXUrehceHjKXY01qQQfyTuoMDzeiVcR+S4gEUpC
	WpYGyeo4OzDmcLqA==
X-Received: by 2002:a05:6102:292a:b0:602:7589:6536 with SMTP id ada2fe7eead31-616f4c5b722mr8288173137.2.1777300405894;
        Mon, 27 Apr 2026 07:33:25 -0700 (PDT)
X-Received: by 2002:a05:6102:292a:b0:602:7589:6536 with SMTP id ada2fe7eead31-616f4c5b722mr8288147137.2.1777300405231;
        Mon, 27 Apr 2026 07:33:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451be2c9bsm1156735666b.23.2026.04.27.07.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 07:33:24 -0700 (PDT)
Message-ID: <db6bfee6-6b80-47ed-a29d-1f894008a346@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 16:33:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: add the TLMM driver for the Nord
 platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260427-nord-tlmm-v2-0-ade8e0f3d803@oss.qualcomm.com>
 <20260427-nord-tlmm-v2-2-ade8e0f3d803@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-nord-tlmm-v2-2-ade8e0f3d803@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a_kvHoScms_QlUVMI6xvPBxEoEF_Li7V
X-Authority-Analysis: v=2.4 cv=Xba5Co55 c=1 sm=1 tr=0 ts=69ef73b6 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JsCFQBrew_vequdH2koA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: a_kvHoScms_QlUVMI6xvPBxEoEF_Li7V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE1NSBTYWx0ZWRfX9psXX/TG0aWK
 BZyIkMeVKYNIGX7xQB5fJaM0gvvE22A6GoJvCqdGpAEYvD7dc4TBP5TdIvSm4NGpk+Cnmzx6gaq
 +5CAslyk8WXbqnqfNZMuso9/NaD3rBQcOeAO0t6Apx9mR3cQpM02Em2FbqFPS9oeI4NAnQP7kAU
 0mh4SrGoeIwYoKrzs8cR8Bj2EnYGxQX/q1bMm0XyBGOz8dvbQyCtigKt+qDyPTPbEHSnVoX0l/y
 CTag3bOykn7sXtEzuPPKNYTUN6Exbex3uzOuTGDkWNQDXXq+n5eiz3uPVMqUpc68C1JzK7j+paR
 etMmu3Px6OUdb28HFGv91jtnJ4Ry7dSUdw6JLTghyI9SMU9DmuMQ/xF4QJw1tsKOGO6lqrWwu00
 Z7xdgKAAsqefZcrZBLpcw6I5eNvdOxgVkTiqXzKspvLSc5W8FOTcg6k4sfWHaLeY/yC76Z9ja2s
 1VPJp/MOYY0FgEUZ+eA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270155
X-Rspamd-Queue-Id: F1A424748B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104750-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 4:00 PM, Bartosz Golaszewski wrote:
> Add support for the TLMM controller on the Qualcomm Nord platform.
> 
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

[...]

> +	[177] = PINGROUP(177, ccu_async_in1, atest_char0, _, _, _, _, _, _, _, _, _),
> +	[178] = PINGROUP(178, ccu_async_in2, atest_char1, _, _, _, _, _, _, _, _, _),
> +	[179] = PINGROUP(179, ccu_async_in3, atest_char2, _, _, _, _, _, _, _, _, _),
> +	[180] = PINGROUP(180, ccu_async_in4, atest_char3, _, _, _, _, _, _, _, _, _),
> +	[181] = UFS_RESET(ufs_reset, 0xBD004),

lowercase hex, please

You'll also need to alter the macro definition - the CTL reg is where
you suggest, but the IO reg is at +0xbe000

Konrad

