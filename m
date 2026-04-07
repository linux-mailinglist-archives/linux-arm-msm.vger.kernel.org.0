Return-Path: <linux-arm-msm+bounces-102149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI0OK7rq1GlPywcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:30:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B11A83ADB1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9EC3C3006038
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 11:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37283ACEF0;
	Tue,  7 Apr 2026 11:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DAzk4miI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hy9gRrPj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBE13A2543
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 11:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775561397; cv=none; b=bXLmzdL84WEepGk1XsYLw0uGE7OuxFXKMlexKtRKdcgdTqkezN0R4A0b121w3WMQmdM1++bj37qhTwf1oBQ3HUAds8ESqvH/x83q8NjOx6fB1zO7MPtPbzwL4vDENCaESO2hhreWy0ByeDjivaDgV1RAnh4CD2Ty8IbmU6fmZs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775561397; c=relaxed/simple;
	bh=r12oPXmQbt+wakmkFLl5TlvZwD43YhlBp2O2/AMD3q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WBwZxhJGi/GZ2zai9ASH4t/6RZnvbJvd/XVx3FgXO3khxBoKiHgpqPYA5q7Kx5/qk42QCoJcxNaP7iQ4Gkjha2Q/q3FbFXEGSy91OUDA173aWuJvGafxn6WirSfA4tBZPOIPRIdlRG7AJfEMI5rlJyhgHKJm0NecVv0rQXwOwiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DAzk4miI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hy9gRrPj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Da6h3815649
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 11:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RT/YMykjz7y8qLINEn2TgQMrKn6NhuK5gzEeRKqvkL0=; b=DAzk4miI6YyESJLv
	vG/jqUE0QvZ1K2bIW1DuxpNejt9SWRH3yM8LrqLrNeNRO3Hyl50mpjgO8DyNiCZe
	82Yt2cHDod3LyovwLPJbzVHGSDLXcoeAx3gHhiohUTBlZJaCNi6IlSfs+nNEHRS8
	a5ls4W1ydLCj6EB1gOF0jhW5GSASYaf78Hy27vH4QSlZOsAzOMxd37M/WszN695R
	X3Jof/L+lnZ3ZJhaBVbdPwizr/ihQWie8mRbFsreL/RCNf5jd8I6M1DTRPVC1/yx
	j4haDunQOf2HDANUEKkiAPixTHViR4nsvjsokkcN8IevdNo4VdiNqqEsZHy4cSeo
	DIvBvA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4tgq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 11:29:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89f548d0872so16625816d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775561395; x=1776166195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RT/YMykjz7y8qLINEn2TgQMrKn6NhuK5gzEeRKqvkL0=;
        b=Hy9gRrPjU4B4aGEkz+KkDQQwUE0xEnp2BUkmQEGMGl77AFDnqGH17gKjIAHCUL0W6V
         opEgyBojjgXrjZdreE6E/ETha1tXycx6feecTZPIN23K7CXzDGx6PcfnhtbqdlFUjKgh
         8bE8tHu4oFhYtUsNk3E35rqGsTjT9QhRbCEqXyfTIxU5eCycM8K6jb66Ar9OwssVqXBF
         kJU+9g93zozTQPqTcjsBrKHrcVpteFR8PRal/Tjn7eaBc55MmP/2RxS6XNMQU/Ou/DRn
         ahtRrb3CLw4Etm+tmjkQHhzn3JU9giIeORPLyk5B3qjFUoXQKNZdC+mvCutbHpwIIMUS
         KAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561395; x=1776166195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RT/YMykjz7y8qLINEn2TgQMrKn6NhuK5gzEeRKqvkL0=;
        b=inti1tqyYeWRgTHH6yDD9UGb459C3YsP8z/unBO7Ngi1GUNjQrHoTjzRHEj2563e1n
         LOI8q3kN2FTg55tqcekvPzI5YD48fxPhqw6xSP9ze0ESwPutQA/PTykUFUiTYRKnwuH7
         S2gnJZU87uibnBqTOIq51+VVPC+wcIc/e5SSQPxGPGFyBxpG8uw9Bzjb97MZ2tR1AxB2
         zcjpGSlZwXk5w/kL2LEf+4yATF5og7zJS+x+Iz4Myc3TSuzb9Pv/DVJ0BmCYSX+AbDIS
         uPduYSz6k4gIFLDyOH45+m3E/pNBmNYeLGwdO0JtJfzM334sr8KaSZ8k8/oEddU4WSyf
         pikQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXsK95Ln2UXnDFODTgls7umjQTjVPSrfaI/vBpqVKtgSuIoEpjeFkGuPzN70rR8+Xs8CtDQgMZtdd9ekvX@vger.kernel.org
X-Gm-Message-State: AOJu0YzDFdbTfT+bSvraSOox5Df7WG8rDP3//HviB/EAc4YeuFH8dJDC
	ENOjAKv7SvyzlsC/bnFLKyq1nPxqbjHkavl0HSFKfErq8wQk91XiyYemauby+FBQhHdIrPPCYVv
	dc11o+rTDLqm+Gy5f3dVrqtQggHDU6FAK73RRCxzHyr6AgnBFaZiFlArYnd1oVY0Itp7t
X-Gm-Gg: AeBDietJmSlr69YBxZqgo1Fn/Pwe+L0P5EKjN1yn8cUxQe4zzaulEE6IthH7Sm10NV1
	wQQcoALrjWy++QLRO9J3yET9a06uCadAsXkzIQoE6gVMJIQ39c0Z37XGRpiXjBdNLLCqb8RIn8J
	uKe8Hvg6eCxRdUKiQEbiqdoz88catfIVE26ThNVYfkLPuMcMJ4pqXpolDsIBIT9x+VIKF2PjrV8
	JhVdRHLY3CDXiAULR6F1Sl7TfGSnWhMHFGvAFeKsq0dYXt1UKvhXjHuNQ+7nmU2JuESvmVKpLmH
	cdBhknNxisFIuzdFsRJyHPhkMunK1OApVDaIiVthkAqh/AdfxTCpLfH4QhZNeOKVfkiI866OHEL
	VlqjXPkd3ezz8huOGno7EUo6j0veDs+EJmPlR2prvYlpnhiFfUapaVDajxZKEhKv574Qe71+olS
	lEgxw=
X-Received: by 2002:a05:6214:4113:b0:89c:5285:200e with SMTP id 6a1803df08f44-8a7046ddb0emr200475466d6.4.1775561394691;
        Tue, 07 Apr 2026 04:29:54 -0700 (PDT)
X-Received: by 2002:a05:6214:4113:b0:89c:5285:200e with SMTP id 6a1803df08f44-8a7046ddb0emr200475226d6.4.1775561394274;
        Tue, 07 Apr 2026 04:29:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99ec7csm541081366b.14.2026.04.07.04.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:29:53 -0700 (PDT)
Message-ID: <73196147-0133-4646-927d-dbe93c254286@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:29:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: gxclkctl: Remove GX/GMxC rail votes to
 align with IFPC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-4-4bb5583a5054@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-gfx-clk-fixes-v1-4-4bb5583a5054@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d4eab3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ObXhwGULgzmC2I4GqhAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: ehwgwE_-1gHQ49u3eFRtHya-e592_hhC
X-Proofpoint-ORIG-GUID: ehwgwE_-1gHQ49u3eFRtHya-e592_hhC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNyBTYWx0ZWRfX3cgvLtDfgWiL
 TK8o0W9IVVXQBrY/Uqut4Qej6c8GP0SwKABuFD7flMQXl5sepGvZqdnxEbtZfViDYC+z3qe+8hd
 PJwcjRueJZxglyJgkSrPG7kGiD6b+NNZCrc44uyKzJlKoWqjA4wzlJCRUU49lJsh2HOL8XCDg7L
 qS6na2vFiGFWGbzHHKV1GUCZpLGXi8nJOFc053FTlKeXMlCATaPaPllv1EYrSAOxF7SXMS6Ij9O
 sRXoVDEkBvXE1/dkdh+gmsQdWoVb+rbePotUDWZtzgQ49qWdemvYEYFejMbs2NoK+9mzzLpe6Uc
 vVdAnhdy4LxDVruxw4p2KisUxyUXMnAukciKqigN4TsEHtumPHoJ1KP1lEu8Yk2UGVYQ7zsZpL7
 Pl4pMbakDFyjEWVSPPabAPzDt8Pd51EdUvw3x3S8JOwjJIu8whbtsrbWTkXjErp4A3+RMBrtegs
 Xmso6YFsx2kZY/zJoMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102149-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B11A83ADB1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 11:30 AM, Taniya Das wrote:
> The GX GDSC control is handled through a dedicated clock controller,
> and the enable/disable sequencing depends on correct rail voting.
> The driver votes for the GX/GMxC rails and CX GDSC before toggling
> the GX GDSC. Currently, during GMU runtime PM resume, rails remain
> enabled due to upstream votes propagated via RPM-enabled devlinks
> and explicit pm_runtime votes on GX GDSC.
> 
> This is not an expected behaviour of IFPC(Inter Frame Power Collapse)
> requirements of GPU as GMU firmware is expected to control these rails,
> except during the GPU/GMU recovery via the OS and that is where the GX
> GDSC should be voting for the rails (GX/GMxC and CX GDSC) before
> toggling the GX GDSC.
> 
> Thus, disable runtime PM after successfully registering the clock
> controller.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gxclkctl-kaanapali.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
> index d7cf6834dd77c2a5320ffb8548cdb515be237bdc..d470ade11b0d11eb40843fe84c809e71646dce27 100644
> --- a/drivers/clk/qcom/gxclkctl-kaanapali.c
> +++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
> @@ -7,6 +7,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  
>  #include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
> @@ -61,7 +62,15 @@ MODULE_DEVICE_TABLE(of, gx_clkctl_kaanapali_match_table);
>  
>  static int gx_clkctl_kaanapali_probe(struct platform_device *pdev)
>  {
> -	return qcom_cc_probe(pdev, &gx_clkctl_kaanapali_desc);
> +	int ret;
> +
> +	ret = qcom_cc_probe(pdev, &gx_clkctl_kaanapali_desc);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_disable(&pdev->dev);

My understanding is that this works because we have more than one domain
associated with the nod (so the generic code that would otherwise enable a
single one so long as the device is resumed doesn't apply) and your previous
patch ensures that after probe, the clock controller is being put to sleep,
right before pm_runtime_disable() executes.

Is that right?

Konrad

