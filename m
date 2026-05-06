Return-Path: <linux-arm-msm+bounces-106129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFxJJoxb+2mUaAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 17:17:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB954DD013
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 17:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F13830185B4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 15:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DBD48BD30;
	Wed,  6 May 2026 15:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/VwO3gu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a76mmv1j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707EE477982
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 15:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080551; cv=none; b=q8nVVSy23emR6iGEhaLBbFfnRCC/GXHhNwyIJWbyzIWUoBoLrTLvw0PSaRM+cAp7fFZCPWIACiqXqR8QBrR3xw0pruneBMfxyLjY5TqS600cvvh+W2NWm7pV9uvZvPEfIsvY+RxMXa5QBgM/lrSsnDsyC9wuWEdQcjXraPR5TaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080551; c=relaxed/simple;
	bh=RhXRCgMNScIf77wnkS151xUmWJL1ppbZupG/e8th0Wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+GtOOI/npRBGKqKbYS2dnIeASMWhRNA9sss0awBa8WtgTXd7pA1ckugcACD3sastQ8bEAqzstMI0nHshBKhYUtdmIkKUGRoLFawwicTm01TUyNTRwKoh76c7N/AaNSu8+gt9Vixw+76H9I77tS/KKtcdcfRhAhpv3gLlygBkk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/VwO3gu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a76mmv1j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646A3Ys31953179
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 15:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l/4qDhc3xqA5oi78owxsgPypqoMvOhzYxv2FjuGz/0A=; b=n/VwO3guoR+gbKM1
	vb0fnDr6mJk5eh7Iu4Pb2rehc1/6B0SVyZwPzmokdVjmrT8XUkkGo1LD2LUHZ04Q
	tG22UnrMqoEzNOZApoH3mapGqv5Hwee9CyqQpytgakTfwbG0E+whoET0gqlMKs3s
	mO4SRSIPPrKdkw7EbeZRx3Ux744J6zKBgWNIqNq1/QTcrvDfBQ8+NCukHkeiGaIT
	kTCgHg/Gxc0+jtAASUiSJaDqXNiCYxQTu1P8B6VDmSyD/TRPbwHzl5OjVx1oSLlr
	dLOwLeqlm3Wa3ldEbRcqqdmHu5amea0mG1rREAEc3q+ePIZY7VH0yw+/+5839/Md
	Oly30Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03jc14yn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 15:15:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35e56ed5d5bso1332669a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 08:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778080548; x=1778685348; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l/4qDhc3xqA5oi78owxsgPypqoMvOhzYxv2FjuGz/0A=;
        b=a76mmv1jqYRv5tEMLtRZgwP+sEyFnT7uag5eD3+TVweFMbOY0KF+rsNiRNHpBrJdqS
         0gpwXmiqj+M0RZqMTbsQYILISJxR4cgkZw+t7bQ8tn2Ys34RtklFZhu2dDEzLKaetXnh
         9OZ4+EtlRQekqgbNVJ1Wb3SXTaGmbWo+O9RGpRZ+95Ti7ZeqpAIePL0cqA7ZGHnjRN7r
         INehhDIqrWhIOE1pjnUZSusm06H1U7Ew9ATFpm1CBucCqkPwGWK+7v/10JOl2aNNK0wx
         5cOIqqUsHsG051Bl+/JvufEKcjAVu6TM6w1zfEw2ocwXdFRnrqrwY7wfufeXMMPO2d6n
         3qNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778080548; x=1778685348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/4qDhc3xqA5oi78owxsgPypqoMvOhzYxv2FjuGz/0A=;
        b=fXPKGSCBGQumhY8I0mEMt5erBs5E226QaAwMWupJP/ZBGfAcb1bAHw2H8vmWa+SQfU
         9FZvDe5rDkpedd9Wu8bZFdxxWsrnSGCi23xLmLF9mNu3Sq8ePz87S0N1oSRvvEzU3f86
         8KCczT+582Zj9BLE4ePqQ4j++qZWkKY0GwR1gYjGcrP95KOEt9Y2KA6uuAfEOB13EhSc
         o4nCVwfkn+jc1LrssETSiHrGPmOaHZNXN0hceGe0wLLlYi+V/vJaU1eYKSZa+o+TZx9z
         oy+DBqIehGtjPzc7sMoyZn4c5exph8ZYRl5w6Ab07d4y7r/L+yl2keYljmuvCDnmBDfq
         /5vQ==
X-Forwarded-Encrypted: i=1; AFNElJ+k0ymUKCtA044Q0YmbjoKRLKpNVXm+AUcpt2OsyCSAUqdIrrGwzUMalabcm9vpT2eLu94BDmVwJTK73nVl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6WMh6Mqnx9l1tmfgZnN6BNs+qL7UiLbj1TZn3iTAFDzzcoDgk
	QbrFvAhF2o3UYy9HO2gGU30lH+2muIwxyvTuD9dFSj8Ew6zWXgzyEKVCTZ9TB2YRU8N2fif/sCI
	c6BIj/1yV9WxEpi1+NoyQ5axCyhI8hq0yOq1OijzvQVz+EvRZgOi79joyH0owq4kDY1ZG
X-Gm-Gg: AeBDietlBDWtRQMzCTJ6dKVMZMN5T9LdNuGJFTnIKUu5leI0rDaers4t0lPl7WmgDUP
	WO7xpF0lEDQH5NW6bEb7sH+7Le2co9fp0crqwd12F9p3vlO/k/bNnCz9LPoer+ntY5rtXSq1Fo9
	oYpfJn/anBZVheGgMxTCbobf/PFG1BzCMKkSPnYP40V8UAw62JETuuzzthHf9urY3Z11L9kGB9J
	h1ztpK+6LPXoNgVjv58vw4BsP9h8sPqOiUVOyEw/cxSnpOOxLoGMXxqFBCGrZyzb0Q9raU8jTYu
	XpxAdYLqawj4dZPPhzOdsYzsbmNIs06Ho+h8eXJXphvnD7r6wmWhHegdzHjBozAnekTbTAjnosT
	GulPaRV7ZTAlL3lYAbXN0krbMaIq7M+refmRnrEBXqEiVZQ5bJ81e5NCTVmYtCzTk
X-Received: by 2002:a17:90a:e7d1:b0:35f:bc9f:e1b6 with SMTP id 98e67ed59e1d1-365a96b6eb6mr2734357a91.1.1778080547409;
        Wed, 06 May 2026 08:15:47 -0700 (PDT)
X-Received: by 2002:a17:90a:e7d1:b0:35f:bc9f:e1b6 with SMTP id 98e67ed59e1d1-365a96b6eb6mr2734310a91.1.1778080546676;
        Wed, 06 May 2026 08:15:46 -0700 (PDT)
Received: from [10.204.101.47] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4f70e8asm4011790a91.11.2026.05.06.08.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:15:46 -0700 (PDT)
Message-ID: <734e8ad0-54e0-4fcd-a3b4-8e99fb521ea1@oss.qualcomm.com>
Date: Wed, 6 May 2026 20:45:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/13] media: iris: Add power sequence for Glymur
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
 <20260505-glymur-v4-10-17571dbd1caa@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-10-17571dbd1caa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE1MCBTYWx0ZWRfX080P6mvvdkLy
 b4SW+NVZ2tM8y20n2gJxujYX5hytCxnPeBclaGCy01RuxG63l6e+FrNNG0bxwg0XkZrB78GR7O4
 vvZs3ELhug87lzyIpLsWNMl2CwU436ITzgmneilTX4se+3DrE8gqxKPneu+t5IsbTxYkTqce3Wa
 z1emW4+RRsqRI1+UieTXq2eZLq72eNVkGiQ5uEhl8BshqQUmb0io46SZBAxbY3lLx6Kgo3Goq82
 UYbghJqRMQhS829T34oAUrktr1wHFjHG9kw2Mq6Xf+7BWrdJV36wifBj9MXaWAkyvGE/HSXCOyE
 VTuBXwldWuotrLiAU/+7uBJK0mthtSagH1iQv5XB2Q6jqOFTWDWexPWmByWT6y9V0Nb6U9Wxhp5
 6T/E03oNN5CvoFpM12AcU8MvyhcHQgGniDnL+4cDj1gM/EbvX2Np24gXhp9ZN/CiHsdrsmCxQpD
 BXqEG9iMnlhouC7NM9g==
X-Proofpoint-ORIG-GUID: fae6Op5sjBdi9vdlJXVVEQCOBPkBLph6
X-Proofpoint-GUID: fae6Op5sjBdi9vdlJXVVEQCOBPkBLph6
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69fb5b24 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4ZKAssT4AknkAVwkBooA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060150
X-Rspamd-Queue-Id: 0BB954DD013
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106129-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 5/5/2026 12:29 PM, Vishnu Reddy wrote:
> Glymur has a secondary video codec core (vcodec1), equivalent to the
> primary core (vcodec0), but with independent power domains, clocks,
> and reset lines. Reuse the existing code wherever possible and add
> power sequence for vcodec1.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   .../platform/qcom/iris/iris_platform_common.h      |   4 +
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 137 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>   .../platform/qcom/iris/iris_vpu_register_defines.h |   7 ++
>   4 files changed, 149 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 7d59e6364e9d..8995136ad29e 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -61,6 +61,9 @@ enum platform_clk_type {
>   	IRIS_VPP0_HW_CLK,
>   	IRIS_VPP1_HW_CLK,
>   	IRIS_APV_HW_CLK,
> +	IRIS_AXI_VCODEC1_CLK,
> +	IRIS_VCODEC1_CLK,
> +	IRIS_VCODEC1_FREERUN_CLK,
>   };
>   
>   struct platform_clk_data {
> @@ -210,6 +213,7 @@ enum platform_pm_domain_type {
>   	IRIS_VPP0_HW_POWER_DOMAIN,
>   	IRIS_VPP1_HW_POWER_DOMAIN,
>   	IRIS_APV_HW_POWER_DOMAIN,
> +	IRIS_VCODEC1_POWER_DOMAIN,
>   };
>   
>   struct platform_pd_data {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 13fbb21c2182..0d0a239f9feb 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -27,6 +27,16 @@ static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
>   	return pwr_status ? false : true;
>   }
>   
> +static bool iris_vpu36_hw1_power_collapsed(struct iris_core *core)
> +{
> +	u32 value, pwr_status;
> +
> +	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> +	pwr_status = value & BIT(4);

define these bits position

#define VCODEC0_POWER_STATUS BIT(1)
#define VCODEC1_POWER_STATUS BIT(4)

with this,

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

