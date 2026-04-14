Return-Path: <linux-arm-msm+bounces-103074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7ce0Ct/83WlLmAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:37:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C04A43F76D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D4B7B3007BA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2713B4EBD;
	Tue, 14 Apr 2026 08:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rcr1JUQn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AYkwNYnp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02DA3B47C5
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155868; cv=none; b=oUtPnvGyuM9nt3NMhKPMIcoBjaIHxHhepVfG+CiO2qsuEWxrRouTeGli3+URCPsxO7u6c2y7/YAIwIXKPJOihUGa8hPm6Oc5yqgxQxqUt+2BeLdNrsV2RHQkSng/umKmhrZT9RXd/SDj0BT0ayh6DsTtCzxOi1X3gtb7FEymnss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155868; c=relaxed/simple;
	bh=X8lFaRFuQvTjjfOP0wHXGXx2yw6hqUgyHUYrHGhj5nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBIAKiAdEDCkhXC2OWk76gMm92ECwL7AxpI+AMuCS+N4QCClf23xlBPlVazRtaA0gf1YaUMkGi3QjPBJ3eyAvb+2MxMGXJYt3NVkTctuaLpt8DT52KGfOtdVENOFlr36xuokjW3WrmmOgQxguCisgyq65SJTGlbdCQ9ImhlAu10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rcr1JUQn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AYkwNYnp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6JAi83425651
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOa8dsm5vN52AnGgckPTFkRysjqvS9wIZbizCzelXdg=; b=Rcr1JUQnKfCoDY1m
	1K47TRpqSOR8AzQvXZsm7Y+UIv492lxqbIUMTaIjfvd/XZDAz5R+QlvIs17qfh63
	3mvb8S1YU0EAnEY/4VF6Eqpppb85kME0ENTAlwVM6khPyg+kgWzTXvgeyOHGmfpn
	QfjvYFIZej8THMJMjh2qrzgsosXHRAeDv82IVqiFxLBIBES4nofzEEKgFeoT6aml
	Y4+gM1otkD9WwtUSQFnZx9wT2/WK2VnUjCGHFUVJJZ7cSrUnLadvcXd8rmpuV648
	tR0hwYWgkYX8cndZW6PoeZeK+YxpySLfBH0kiNJtAe+87lK3cDGq+qj4PwYKpk6g
	iG5IyA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87f9u25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:37:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8acb4b340f4so5052426d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 01:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776155866; x=1776760666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OOa8dsm5vN52AnGgckPTFkRysjqvS9wIZbizCzelXdg=;
        b=AYkwNYnp+sUxrO74cc/s+84EKB/ZFTR0qIfgZySEyViWsqKn1uZKEozppDztneZWyL
         xrYP9iFJWe5jpfsJbHn7c91mUsn5IIxFlc8KUZ/x6A68jyQo3kNONawW00tppi+C0HKo
         Ar+U5fzUEmNbl+I7lG16xi9X6VJY2Sy0yun/HTnoAG0WiFZNrVuVlbAgIHlF/BxS0VlL
         SemivLUuUp16L+ofjuVCy6+PRs2cXZCOQrlA6fHUfzKEzyVwhhwv8O0lk6zkZi0gvyFL
         OD2s1A82LNxkBk85c1xfEg1C06IzkihqAUw3o6LEohHwObd4TDuJLMl2PXqWW3Nvz5Hk
         bGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776155866; x=1776760666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOa8dsm5vN52AnGgckPTFkRysjqvS9wIZbizCzelXdg=;
        b=kdNSkelZFV/BKUH3QquVDQZA5dxDPCyABk16Ite3kWB6BS7tx+DEQcBTkfGUxtZ/Ij
         1cwocenPB+Id/xsjqA/eQ//FpR55OQIllMAk6dyck8Mnk9oRljq7LbGl3n5jJ6JMsBML
         5tsR7ZbIOripxaPm4jtOs6vmOVpLUn7Te+dHy/FOqQX0YP+Yoe+TENxkS/vBu2LvU1+Y
         sTIjj2vnRrnyGdpgVN6hyxHNoiHQ6LdpCvCPS4u+iJdTUbZFYx5wvPxdjBzxxBI1q62+
         IXpgziKo+nw4hUGuNaw6KuRGtJXascfvh5cBzk28ILyKCpny5kFT7eftISRsUtvAEAkS
         Zcsg==
X-Gm-Message-State: AOJu0YyRT5mN3b4TOeKh7OWC0y9pWXNgKO8I4PITkjxrxgoKTFJVacgy
	FVuT7srFa538xeiiemF0PWskD9qnnsmNkG449UPySNYb3ESMDGUqLB3onRogBgH4T8IvTsJv7F/
	vEVh4ro7AOGU6bVNh/qlk3EqVSX9D2Ou2BIiukOCognBgsBHM3hRWYtEltfie7Jn8/NtS
X-Gm-Gg: AeBDiet+/UMiFnNt4e5uTfjwUUCObP270e1dQhdZ1Ad4F4hF77a6KnHiQx2B2jfKQOL
	N1b28NbAB0a9u+SnRT2dqBuqYgOtBuCgbgFc28uZfxAYXtLBP2bkH7fXYskoKiMIRiALZtfsIkt
	8U2LY7S+XeWMZAwaMS/gh5ETL69hFRbR85QKQxNVCfFKUpnrFAIyM/5dhTt3vUR7Ftj8kwj3q6A
	Wtj/9CB5VxDfvNOIIZk1vDNQNocygh8Jja+EFccf1rdD55OI4ceIj0EUNS8SfzJwe3u/w8Q833h
	V7rrpsocrynVZ1ljs37GJ9rqC5VmeBEnHSSsBaIARieCaIIz2c77bQ2Kc3xjHD0XxDKfw/hwfOb
	hj2dDewI85XybMkGO9dv9xdeMxQWEbWz5m0E54/t4oCD+F6cwnuYDWBroCq/KgXCG31hnOU+Lgf
	uDOeppEQ1VKgZOig==
X-Received: by 2002:a05:6214:258f:b0:89c:d639:e7be with SMTP id 6a1803df08f44-8ac874bf3c6mr177289996d6.5.1776155865892;
        Tue, 14 Apr 2026 01:37:45 -0700 (PDT)
X-Received: by 2002:a05:6214:258f:b0:89c:d639:e7be with SMTP id 6a1803df08f44-8ac874bf3c6mr177289786d6.5.1776155865476;
        Tue, 14 Apr 2026 01:37:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8492sm383732966b.47.2026.04.14.01.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:37:44 -0700 (PDT)
Message-ID: <0975d136-0013-425b-a465-08f07efcefc7@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:37:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
 <20260413122233.375945-2-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413122233.375945-2-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3OSBTYWx0ZWRfX9u487zbsrtYw
 zJiuekwl3yeMp8YEqgja412trUhJfRo68LEfZc0kfyjkyry9/vHi+DASyqB+CXFDha6tlJwUfne
 kSUEQlAuHbIQQcJv0oHHfWer18mCLfVTEBL6M7o86uhzcgW+DQB5F2B7la4qvwg8xLLyRY+BaxU
 0/U+4CTmkHrvXSQsFDU34q2yCzhUO+AP7wegJSH44fcHlER/y41fz2ZDLZNYg07dlTr9Ig6T4DR
 ZbtGwZuhWcnRS8NpCELXuqtdsRpr42VY34+JYu1l8h8HwL4UDIUFP4yNqQQ5xes4syBwRrakVmd
 qkAACOLRW1kMDf4wEi1EKTNuFt4kOuuM+I5ek2/KmaTES12giZcv81/V49kYUGmUj3HJkGrTG5Q
 4HPBLxv9LrbQbbACGSsG0qmV91oQiz4LN2gQaAEB4Mewy+IFCjTTNoRmmrIyHj6zpXgoLsDFgQT
 JE60Edy/jE9cHYbjS6A==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69ddfcdb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=geYgjXO_D7EpWZfwOI0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: f-q3GUQl0IzL2l7UAZQAohBGYykzw1f6
X-Proofpoint-ORIG-GUID: f-q3GUQl0IzL2l7UAZQAohBGYykzw1f6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103074-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C04A43F76D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 2:22 PM, Ajay Kumar Nandam wrote:
> Convert the LPASS LPI pinctrl driver to use the PM clock framework for
> runtime power management.
> 
> This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
> improves power efficiency on platforms using LPASS LPI island mode, and
> aligns the driver with common runtime PM patterns used across Qualcomm
> LPASS subsystems.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 36 +++++++++++++------
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.h      |  2 ++
>  .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |  5 +++
>  3 files changed, 32 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 76aed3296..6d50e06ef 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -14,15 +14,16 @@
>  
>  #include <linux/pinctrl/pinconf-generic.h>
>  #include <linux/pinctrl/pinconf.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/pinctrl/pinmux.h>
>  
>  #include "../pinctrl-utils.h"
>  
>  #include "pinctrl-lpass-lpi.h"
> +#include <linux/pm_clock.h>

Please move it up, together with other non-local includes

[...]

> +	pm_runtime_set_autosuspend_delay(dev, 100);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_enable(dev);

devm_pm_runtime_enable() will let you drop the manual disablement below and
in .remove()

>  
>  	pctrl->desc.pctlops = &lpi_gpio_pinctrl_ops;
>  	pctrl->desc.pmxops = &lpi_gpio_pinmux_ops;
> @@ -539,20 +540,33 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_pinctrl:
> +	pm_runtime_disable(dev);
>  	mutex_destroy(&pctrl->lock);
> -	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
>  
>  	return ret;
>  }

[...]

> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> @@ -139,10 +139,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>  
> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
> +	RUNTIME_PM_OPS(lpi_pinctrl_runtime_suspend, lpi_pinctrl_runtime_resume, NULL)
> +};
> +
>  static struct platform_driver lpi_pinctrl_driver = {
>  	.driver = {
>  		   .name = "qcom-sc7280-lpass-lpi-pinctrl",
>  		   .of_match_table = lpi_pinctrl_of_match,
> +		   .pm = pm_ptr(&lpi_pinctrl_pm_ops),

I believe SoCs other than kodiak also require this change to avoid
regressions.

Konrad

