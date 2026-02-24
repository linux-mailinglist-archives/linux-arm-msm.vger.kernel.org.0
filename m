Return-Path: <linux-arm-msm+bounces-93984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sG1qEy+YnWnwQgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:23:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B734D186E30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF020305D2B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21876396B97;
	Tue, 24 Feb 2026 12:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N80Ongis";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNIv06LR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2C1396B91
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935645; cv=none; b=QA2iQfR4q8wM5597G849LdC5mAXLUY47XCHyQaNiRR2lkSLMxerLRq6UmQGIhKjMnGII2QIKGup68nlNgOsVjPqLqrfls45/xHBPqf2IhhK7UTy7JVyl9/j0rmyIiS/13IsQ11orHdDjzwYWSOgPybKY3XlT1zB2SEQyQpiSPsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935645; c=relaxed/simple;
	bh=SOQJDg8sFUhM8+VsFIcMB2KmfAEWI59OoNlz44cqRWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyarcBj/rAY5ZX3auI9bvb/AiRrWQwgOYkduiLf2iw/B5IbHzO97BqaXUhFb0+jQa3tEyzJIXNGD9/KtPCfDwQtytJKZdC5q0aFx/YuAkxSTBBD6U1j6uppfhAmhUmpbew07vfn2aELedhadvn2B+YmRMgjdnRPQHr7azA5qmSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N80Ongis; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNIv06LR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFKLH057136
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FU/aNNjxt/IN4iVWVTZoosiC/J4FxqYyMmMiYQMpZPE=; b=N80OngisMezb6JZx
	W42IMbsfiuCWN3CzOY290DV18i1qojO2FN4YZvnecfodupsYpkRbX8dbBgGuSBAy
	FmYCDokMLvjQtvCy/XWMzXkRa7wYkkdP26qAhXf9o4CTmwaxmrQdS7IYqh3eWbnU
	TrzZje1alg+1WeJbN+Sh6JHTd5YK/21Wbo+l3txZH0aFn8NO+QwgPVQP2RqRbqvd
	SzA0zUOg98gQFwBewbSmPaFKYjQz5+sn8o2lhmnFchGYwA47EkqmFVMdVeesPS3b
	KgdXKvJSDKT3gN86iXAIIB+nL86kurZ/vdH7LmAO+59AceFzdo2P9lKleLWpELbO
	qaa0mQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch9sa8bwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:20:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-894a207e7cdso49704026d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771935642; x=1772540442; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FU/aNNjxt/IN4iVWVTZoosiC/J4FxqYyMmMiYQMpZPE=;
        b=DNIv06LREGUpiLhFWqZuuxGiptADPRZ3o1UIAU5DnSOCDDXjKHdWe3QVynpCrXooyM
         vySzLjn9KiSy/11QVS8PUh9jQNDPeXToWT3nO8y6MvNO3inZg6DYHIeWQxNy20Q4mqEs
         +gbRHekw7pObUfJtISPeniAa3DHlM1PfGziMofEn5KCe0GeKn9i/RSxjpt/QjktbxNpm
         nZ8KpZO0YfnkWLkruErh1YOGF8Vao9q7cf16U201Lm/Vq/GEdL59BTcg/XmQk28WSSpx
         G8tLLwtuL+R72iwPfostPVB+7tkyGPeIREy+ZHu/odRboCNEDQgCuDmE9G/KB37RwN9I
         92tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771935642; x=1772540442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FU/aNNjxt/IN4iVWVTZoosiC/J4FxqYyMmMiYQMpZPE=;
        b=JuBNzjhUdCv+dZV8VJbPUkfFjpgLL8UWIyrBJsAiizATFH3tf8DkXJ+leY/R073FZO
         QyRrNbTTDbtJXCdL6mCmiap+Kh6ESnGKhL5xzJmKAHVY85JRLqq+4789QKYiWLLZc+jt
         pviQnT6g0B5uvKz7tRWOR1ZsSiPZxVVJaC9oLIG0zMuA8RJOxR60xDepcQ0lQm4d8NWe
         /OsRu9PCVtVyWEooHmlWQBQieNh1/CRX5gPJoUKjXrbiVGMeiN9x5H6B4Tb+uvx6Z3He
         s3GeoG5Nu2Y76pXNAQ/dVJFZdM2ji4UhN3P/7unsP2U6fCwbHmspeCPxf6m2Ax/LYFJ/
         RSrA==
X-Gm-Message-State: AOJu0Yx/BwK+JIZ0B8pfsf+A5DGi0U9YHFiygQS7P1y3bqsnYXZaddAH
	2XYHXCURbexUVrl+IyGZhtuugWirAYirDhON+otMiVTDcdCZU/RVISM2rPn6xREnrsxQS5Zwdkx
	dF3JOnjHkW+cD884h6rzG25nJmBgDRrDcUMuOSXR42opXTViGsxaHoiB8LleOsOJYLcrc
X-Gm-Gg: ATEYQzzuAH207S3zcCX2ErknsbQJw01dJ3FtFr2YLy12wwAVTHEBKPzyCXwISNF6cCD
	nFgjLiuJAYwf9FnyifbUdE8C/1S0Rz/SZiqVAm1EeX4xjPZHwmHufiRWX8SZLnjcgGiBF7U+u6K
	3ofgLj9JdOM6urP9KDgYwIk5FtxLliq0xiley2XslXLS7gpyeeJ1DU04k1QkJGmrRL3lWUM+nmy
	atlTCaT2XkXdrH/n/forwDRkGvU5Kks5Wfdk7L1hP0JGBFcNYQladNvqPofleCPYfOh0snZzYvL
	2khG46GGbC/qK3vDGoPkTZ9VJtwZ0kMALTzzfATbwIjfOB/871vRghlil5N0XaInDexADT422B1
	WUqHzURV1g6/jJ5cpWToRZXMWhjKB8F+lHfzdkM7Dzx+Xg5Pajm+/J0qUnB7hjlmyuwsFRUOBX2
	cVfKg=
X-Received: by 2002:a05:6214:8013:b0:897:430:df71 with SMTP id 6a1803df08f44-89979dbb183mr112360726d6.4.1771935641985;
        Tue, 24 Feb 2026 04:20:41 -0800 (PST)
X-Received: by 2002:a05:6214:8013:b0:897:430:df71 with SMTP id 6a1803df08f44-89979dbb183mr112360426d6.4.1771935641582;
        Tue, 24 Feb 2026 04:20:41 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b91dacfcf77sm65761166b.13.2026.02.24.04.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 04:20:41 -0800 (PST)
Message-ID: <f2819156-a1e9-4159-973e-3e3db5c20cbb@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 13:20:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] clk: qcom: fix SM6115 lpasscc register offset
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kenrel.org
References: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223133950.221234-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260223133950.221234-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEwMCBTYWx0ZWRfXyrsqkTcbfy5M
 KeAGxIbgz/iMDfoMPwgJcA5WashGoZWZdt5Zem9lMylfSsOsH3mSG7K+2LHxe4OSbRJwXPE1z+7
 XlWUH6P3eDvLa1pTdoWiQMY+rgkx3eYHisizkrGP2Vas51U8JyqXZAhrX//RgM5ogXZ+Ue5ueDH
 Oa5UlFPdjvaygG64RB/5FDX2DvMQeAlb2u0DQaVEu4wUcSgoS23QgSLKgNx2NNsX0yXtUBpSv0R
 h0lWbg22AK/Smhp+74TCy8j7BdvnDUTSSTtw73YaI568dWTFk8q3cwJl+2lTYEu0rK1Kdq46MZy
 +kE2Yd3AJzufc7fvs9986ky2Q/hiSkafBenQLUDPy2pXQEtjmqJQXeMpB0YWbKQH7+aHR5ZRwz0
 6376uFWIfxr+RGVnRO6nj3j+1QOGtG2/igF+GAQsW7gqEY7W0/6rUBNbzwg6kO6ZkObDo1hsd6k
 KX9PRSbyjXES9utSYrw==
X-Proofpoint-ORIG-GUID: tJ2tG43VVG82fWrw2Tm5_VD4GrnYC0_C
X-Authority-Analysis: v=2.4 cv=e7ELiKp/ c=1 sm=1 tr=0 ts=699d979b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Z76uCUixtZHKFt9jzIIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: tJ2tG43VVG82fWrw2Tm5_VD4GrnYC0_C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240100
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93984-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B734D186E30
X-Rspamd-Action: no action

On 2/23/26 2:39 PM, Srinivas Kandagatla wrote:
> For some reason we ended with incorrect register offset for soundwire tx
> controller reset and the regmap register max was also incorrect it was
> 0x1000 instead of 0x12000 which is full register range for this IP.
> 
> This was somehow compenseated in DT reg property which got it working so
> far.
> 
> Fix this by correcting the actual offset and max registers as per SoC
> documentation.
> 
> Fixes: b076b995e225 ("clk: qcom: Add SM6115 LPASSCC")
> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/lpasscc-sm6115.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/lpasscc-sm6115.c b/drivers/clk/qcom/lpasscc-sm6115.c
> index ac6d219233b4..47adf4de2cca 100644
> --- a/drivers/clk/qcom/lpasscc-sm6115.c
> +++ b/drivers/clk/qcom/lpasscc-sm6115.c
> @@ -35,7 +35,7 @@ static const struct qcom_cc_desc lpass_audiocc_sm6115_reset_desc = {
>  };
>  
>  static const struct qcom_reset_map lpasscc_sm6115_resets[] = {
> -	[LPASS_SWR_TX_CONFIG_CGCR] = { .reg = 0x100, .bit = 1, .udelay = 500 },
> +	[LPASS_SWR_TX_CONFIG_CGCR] = { .reg = 0xc100, .bit = 1, .udelay = 500 },

So after taking a deeper dive, we currently define CGCR "resets" with bit(1)

The CGCRs ("Clock Gating Control Registers") have:

BIT(1) HW_CTL
BIT(0) CLK_ENABLE

so by ""asserting"" the resets, we really put the *clocks* in HW CTL mode
(that's why drivers/soundwire/qcom.c only ever calls reset_control_reset()
and during "configure"-type sequences)

I think for not making a mess out of backwards compatiblity, we could stay
with this model, but we should def write it down somewhere..

I don't know if we ever need to manually assert CLK_ENABLE from Linux.


Now, interestingly, msm-4.19 techpack/audio has this hunk:

/* SW workaround to gate hw_ctl for SWR version >=1.6 */
if (swrm->version >= SWRM_VERSION_1_6) {
        if (swrm->swrm_hctl_reg) {
                temp = ioread32(swrm->swrm_hctl_reg);
                temp &= 0xFFFFFFFD;
                iowrite32(temp, swrm->swrm_hctl_reg);
                usleep_range(500, 505);
                temp = ioread32(swrm->swrm_hctl_reg);
                dev_dbg(swrm->dev, "%s: hctl_reg val: 0x%x\n",
                        __func__, temp);
        }
}

which clears that hw_ctl bit

Konrad

