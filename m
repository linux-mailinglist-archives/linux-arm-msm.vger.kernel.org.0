Return-Path: <linux-arm-msm+bounces-105280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HDBA8Le8mmHvAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 06:46:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A235049D599
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 06:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73D99300E73D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 04:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069F2367F53;
	Thu, 30 Apr 2026 04:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pauSl8Ye";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YMG2rh5d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E046362138
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 04:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777524402; cv=none; b=W2fz0ij6U6S6vDS6YXYppf3YYhbswwY+rpr3sBGqJYG1T9mVHHu8WmIElpxFv3PHMElP1KCB8DBVHpFEExL3JKf5HnwlJEN0GK3X2Rw3UpDUGhpZeRE5Bl1oLBI9Y2a7yrQ3RLyZKIxRarWeXyZSyFkFAMPEcEPQwF3QKnf39jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777524402; c=relaxed/simple;
	bh=ERhZOvBPJGPRGOnygQd9Z24lOzXG4tJMtlhFjmEopLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LD8ZGWxWHMAptJf2SNv9VHm/6xTOkkBpKTon+BUGuyavacJjRPtDYlHJ4rcTuZZfGD7GVb5cXiaJQn4kwD5NW+XfzI7YLPtqEXPtpDwA9S4HTNqM9KWwgB1UPj9wuaN2j7mAH/88jRU5/ozkn8rvFzU1BkTw2WdbY0eMcPKOKjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pauSl8Ye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YMG2rh5d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TKbJWO255379
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 04:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UHHyy1jhBLSCQLkczwQR9iTY7y+sVIfuoEj3zUQPDRo=; b=pauSl8YeBI7B11Tk
	8T2OP/Hl1HpR7rcTTzMTrL1rTlJe9v8o7NIHtPxoea5QcSJKKdnlXICKsB+Qv8DZ
	aH+7M/YUFBQV5bs4rIvJW1CjtXdPdt5rV02NAxCIeFY3FqBI+pzjCkYlzmVnUzba
	0Xw1o76B1sF5pQqXv4RpKTQSKKo6N+Bdho7VKA4A4kGFWxlX5HRaTaC6icD2zova
	4/UO99JL5/xl/QtaiS4of+V90FgMNuHNWrHMRJHymUvWD6pcN1xtI1KJCFZHwM+S
	ubSH4GxZejEzCzGk3fZG4EAxBgCFuLG2JDnGcBqUstmp+7nc5/Q1qJhPKlnDi7zV
	YMB5AQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dun71ja1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 04:46:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35e59791605so554125a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 21:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777524400; x=1778129200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UHHyy1jhBLSCQLkczwQR9iTY7y+sVIfuoEj3zUQPDRo=;
        b=YMG2rh5dHnf4LkrK2VObCBcugfclPfBmIO6klmm7fDOAIQjPNvxX2NzflnYitMQMJU
         HFm+meHBGSxtmNfTc6eTfSKBD7HWqqbBj6wahVIH5TmtrAlG5vfru+HEaIeIR/4tRuZ4
         MLr7Xt01i2Svlnjbx1QC+lI5Lqs0QOv8bcHjQFagRqXBw5cdorfTFp2cKr0HQqXPm8Wk
         WmRx2LpOCgVV1Kl22znFphTjcjZ3YypAgkdE3XrWTovOsaItyzcSqcdX6CdKK7JfqIH2
         YeiXZjxGzyPIcY/dR3+CekZLKfPKeHIavI2lNeRA4xmskBFC96CdEYN92/PDwN4YADvb
         8JZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777524400; x=1778129200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHHyy1jhBLSCQLkczwQR9iTY7y+sVIfuoEj3zUQPDRo=;
        b=GOHbhEvvVNE25paX6woRMq4Rt57+98XI/hRn4Q5gj77bw8EVRAUSVp86u92Ip5UYzG
         pzq6xsTyARWRdblItzoHPVSJ/V8KV9DY0q7xVt+awCTpWdtZXUBR6zmaednmH7P/+nx5
         hcs6eiANj33UTY+d6UfiPaKAdSWY7fQ6FxjwBDBkYliAMJ2rHsM1DxUJvyhOhP3gEL3D
         IijIcyG8d2Y+CaMITHb/i6CW9G77/ZUaFVAa6rpgGH2HnBktOnpgHBJaxIQRePMsEGPx
         oAjOgHdRwq0yX6NdRCVdewGvJEzxcvp4n8I81rq0D+T2HC0o51eVKvKeJFPeUQdmLyuI
         FJog==
X-Gm-Message-State: AOJu0YxH85bzzbDm/lhvgTaEoGtQs2QcZRGVfv7LGkE2ovhnoUovFyQD
	ikEVKSulvscLDcEz+CW1UQiMJphnh0qHgYD1aDTnOChPEy8BN6O9+GbSAG81fUz1HXVOluK1N19
	gHydkDzAc+C4W6XufPCeDppA+ryrIH+K7qQerPVvfH+N2bGGLrwuhE7CeriFTsqBWwyZL
X-Gm-Gg: AeBDieuv6Yo5fx55PXRJ0ooNHc8XeUnjaHCRRBD9FzwaBbeqCI8saxWlvgFLOinCpgJ
	K83rtFa36uNBtNrpg35WVQBTZN6O3NBDqmqsM9Yb/Xu3VOvQNsN6Ic8RQbmHD3esP9UQkYs5ZXz
	RpacBJVFy05OZBxTRTmSwdinCzjhEwR0XC3Ee2vj7MjP3WHS8ELKi7jI+kXZv41qV9z3byX2Gnm
	OVXDS314pEpZq/W9siRqRcx7xqETEuOAUECoU51QUHALznaUtwgGQsaFXnnpKfMAjJ9ziukJ0iv
	09NnJjaomFRd1Xr0ohcDe6aCgHOrUo0GKurhjdXcWGy4iT7pjoWtUnRygkMkXDv2+bGIw8SOhju
	MPwV7k7CTB4e/JZFgDr59CCZiGYU6YmcYtuBElMc12ffJcATp6YgysmP/fECLgw==
X-Received: by 2002:a17:90b:4b8f:b0:35f:c729:de9f with SMTP id 98e67ed59e1d1-364c32cdbcdmr1280463a91.27.1777524399737;
        Wed, 29 Apr 2026 21:46:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4b8f:b0:35f:c729:de9f with SMTP id 98e67ed59e1d1-364c32cdbcdmr1280434a91.27.1777524399270;
        Wed, 29 Apr 2026 21:46:39 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364be044f23sm1211837a91.17.2026.04.29.21.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 21:46:38 -0700 (PDT)
Message-ID: <c058b0ce-08b7-44c6-8558-959711a6ddbb@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 10:16:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: add the TLMM driver for the Nord
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
References: <20260428-nord-tlmm-v3-0-f16f08d084cc@oss.qualcomm.com>
 <20260428-nord-tlmm-v3-2-f16f08d084cc@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260428-nord-tlmm-v3-2-f16f08d084cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hgJx5iB8lmUuKy9oNNsKQsRtRRCjA3WC
X-Proofpoint-ORIG-GUID: hgJx5iB8lmUuKy9oNNsKQsRtRRCjA3WC
X-Authority-Analysis: v=2.4 cv=TvHWQjXh c=1 sm=1 tr=0 ts=69f2deb0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=d8IIXGk-wedfOAHOyJQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA0NSBTYWx0ZWRfXzSZENF87h/N2
 uO/FvPD16lN1M9pkgoKhOhAYPDrWhc/limuH/PYqX7vaRgw9/jGPRqEVj1iygZ+ybE2rA+PS17H
 TT/2DadxQLyM1ushmTpRTAwrKaQpQ+jDcr0vnW4oD0jbJCglLBG+r31lZmJNBEXCWmfmqVC1ic9
 h7TgkziY9Zgo1vWsBxMcZJg4W92edN+5w4Doi7f977qgp1/fTMkK06CagiJeNvZbqDLQkKq7sM6
 WYLW+Stah8aq4zQjWT85mqm3Mo0mvkwimYg879eOJ/oOwrEkoLuwJkGAv/IIeHlDq+RPM08UghA
 AVPQ5mZ4c1Yfx2l9+AoGcEFcw4j0V0fjf1JbtICgmdU6Xt5NGlTQHhzRWfu+Dl+zzRffVCc5Z0e
 0zgw36wljjfT2iWkOmHmmkLbminUtNDkgniO0yoUABRPjdU6raORNt4DpY3Xpn/u1klCeB44DIE
 439iog1EpvDgu9EuSNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300045
X-Rspamd-Queue-Id: A235049D599
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105280-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/28/2026 7:18 PM, Bartosz Golaszewski wrote:
> Add support for the TLMM controller on the Qualcomm Nord platform.

> +
> +static const struct of_device_id nord_tlmm_of_match[] = {
> +	{ .compatible = "qcom,nord-tlmm", .data = &nord_tlmm },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, nord_tlmm_of_match);

[...]

MODULE_DEVICE_TABLE() seems to be kept as the last line in other pinctrl-<target> files.
if you are sending a new revision, better to keep at the end for uniformity.

> +

[...]

> +
> +MODULE_DESCRIPTION("Qualcomm Technologies Inc. Nordschleife TLMM driver");

Is Nordschleife expected name here or should it be just called Nord?

Also since all other pinctrl-<target> files have this description using "QTI <SoC> TLMM driver"
Do you need to replace Qualcomm Technologies Inc. with QTI to have uniformity across all SoCs?

Otherwise looks good to me,

Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Thanks,
Maulik

> +MODULE_LICENSE("GPL");
> 


