Return-Path: <linux-arm-msm+bounces-91461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP9DFph5gGne8gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:16:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D23CABA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 040DC30558C8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B4535771F;
	Mon,  2 Feb 2026 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjI4TeuJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFRhmYGm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F6930C60B
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 10:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026877; cv=none; b=Q8eR5b0yMUcT2s0PeJz8NZKwMFvFq0qlemME/K7PXdLLZVohLZrGpjXxWjb02mquX8okeSh+ka49prT6WVPSJNhzyhKqURBN+zJicoHrcPm/FDoC+cJFsdx3sXaq88c98waCgpcwZZg0qoW9DfaCFRUShkXxQ8Gmm5RqVvkbz4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026877; c=relaxed/simple;
	bh=q3JaYDRlGftnLJOlP1bnLCR8rpRNimUz9APehgOhwOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cAe4QyECS+hpE1gS6ljEdGEAVwbMQHF2VrGX/bv4dxL3vb4acr+styk5Np0TM53UrcmTzJIQrPp8G5uCnACKP4GnRtuoqOhIurORbhCHlwIG8M2t/v8X5ZnkFRVY32n00OvkO5mfEGl857BiOt5pFo+J4kfFy6LmJLOXLmy2r14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjI4TeuJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFRhmYGm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127mbh91181011
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 10:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CqHE2GDZe1zyJo4ZPrRbK6NLScmcoInrwgQz0HIxVJc=; b=TjI4TeuJh+/ZJDvt
	p60NfU3wG5wVtGy2uL5ldZlv6P8axolCiy2PiutSf9zDrIkh9XItcCaJZ2OgjdBP
	2F/zYNFzCpFf3L+n49TBRcC3pTkI7PidXyEIxMhwVlCVruleI8+D/CoST+WmXBG0
	r0UzgeyoxFSiveWhg9DS/awlj7la9jfxzytSPzJ4CL6/+Fi9KWjPWSS+PfyuuYtj
	OVVBQSxeYrrIkEDfLmwxfLzc5YGSnYDKD2gO8x6Lws+v+1AlHemYL0sXS/lxa1Dt
	o5kl3jDRDj+P5uUaclvX23OlZ1FVhgl36z0R6k4wW4DupFJ+VDnQ8WrStiTbnN97
	Og/Dow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1arrvy1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:07:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a182d4e1so71887685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770026873; x=1770631673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CqHE2GDZe1zyJo4ZPrRbK6NLScmcoInrwgQz0HIxVJc=;
        b=WFRhmYGmKbgmSnL/dMru58unSTCmcpJTaJCVz/rA3LqejNcRCX3qE6oE/bschLqdoD
         OE2LcjxHMWDMxZFo2rIEd+jeyvBaPA5xi4Mout7DSdh9NS+CaoQkggDcJF8SUb20VjAE
         FhgI3OANJx1y6jn2SKO6ARPCAuuts1Je7Rsneqlatyu3OAI8ukjAlSwk2Gg5arPu/SyS
         QeJc+45ru/PBd3Yx3dPy2u8ZdgOTmmQLbbLicE+2Cewvo/e5eWmLvApKScpBtDVkFZmr
         O3Q8wqlljkyP5YitvWTRpf3lV+WsQ8CYoVHj2QkQroFGQ0Io4KTAgI+60sRJwY4tcgaF
         vEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026873; x=1770631673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqHE2GDZe1zyJo4ZPrRbK6NLScmcoInrwgQz0HIxVJc=;
        b=lrDmU2MNUwFq/Zl+bTHNHInENFdkOqGJcf19NHx7R2LgkFPxCgRz4iBPSJlhBW5Mx8
         dnZT9jwOP4zCenGUB6mJuBe6QUJKA9WpziiqTIwRu4iEUKt3ujYz/6osKDn/vriBUIun
         KLP9YNT/iMsh7Az+igSxtJdtzCFkfV2fuCHVtPdIkpXl4Kfo8AyPo/BFZ/tMLhiI7vYo
         7dgB9jYI1NG6GIquu1Nld7ke9rW28I4MKwRopfnCf/r7QkbkfieCoWcKIQNwfi8kemQ/
         ZV6E4cmQcC4lb6sl6yvp8sXTT4MSvlkmYj4G1Gler6s+bG30xgxO4aobSaH8fDT0Pb1e
         +0kg==
X-Gm-Message-State: AOJu0Yw6D47VUEZvLlhGozBuiY3otujv1VNRR3ZGPR9XkNVGJ5/3IujO
	5XCCd3XDB8R/JfvngTQI24z1ex76YPW3muqkiku5aar7ouGnxztjL0WYMa0jS7qJDSa12EPqdwN
	7bWl6iDAmlZ2HL2ebuZRJDfNFHtXxHE2mY9fdf+VDGa+wf4e/qHzVG/AfoahOlrhTdY4r
X-Gm-Gg: AZuq6aLl9Ub/caiLNe1br/RCiugQozmpCLe2wyz5k0cIm8ITHlWgJuakGAcXSyDzAYD
	zN6jjYyr0qs2LTILQLFyu5IXLkKemvPsZV/pzrzKyc0gfsii9mwlUi6N4U8cSThigfNOfsvXrSc
	0bEng7+x47q+nzXyKG6eYlJ1M263br10Ps7r8w4LDRpqxm42RU8rtmyfq3g3q43wd+fkn7S1Dzy
	AZWnKOI/bE/MlQ4uQCcA3EjyT4Krcrc/Lozt39Q/vOsf6HEHcYGn0gYNsxVnieRav/aaEt+Ste5
	4bzcFVKEMcrUVhv0n72oUPxrvJIavJJSpSv/ztbMbpMNJl4imRXgYx3ErJiRsFRE08IPgMKwiN4
	1k20fBW/bE9USzQ6iQgX+nk1PJTJIehBJByL6xVsKscH1AvLu5XXaQWfDvCPAYxyFLyI=
X-Received: by 2002:a05:620a:45a6:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c9eb229dc6mr1175774785a.1.1770026873263;
        Mon, 02 Feb 2026 02:07:53 -0800 (PST)
X-Received: by 2002:a05:620a:45a6:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c9eb229dc6mr1175771985a.1.1770026872726;
        Mon, 02 Feb 2026 02:07:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeff5629sm856529566b.27.2026.02.02.02.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:07:51 -0800 (PST)
Message-ID: <95977a30-616c-44af-ac93-90bae2bed298@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:07:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] media: iris: scale MMCX power domain on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-4-6f40d2605c89@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-4-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IaAnMH5WZh8UpmZ0XPFKlZyj_snBZ1up
X-Authority-Analysis: v=2.4 cv=FNYWBuos c=1 sm=1 tr=0 ts=69807779 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=R0B0fMNruX7Akzlv-IwA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfX8i67ff3JyK0i
 tevg6ajmmp7lm5jyJabnbF6zInHK2TD2aFjNFIpjc2CLTwYkgh42CRVl9l8as1C+blSIHXrWl6U
 lQUcZCDpCF9AGz4ORzq1rEshS7XpszCgW5T95/pABZxPcbISN/k5/Lic+F5GnFGu592g0TIhg5Q
 UjxYNGbPHzsZTPm7Vf9fx/kLWhxIGiMIx8dFgdunebWHw8WOefCxjgKsg7D17IlZLcRHsSZ0KiN
 Cx09mWgMVBEDt4F8ofiNbdlP774OG7dKZXdJcdqK/E9BzoKqwPHOCX3E51CU+frV9qh2ZrZqd6L
 5A5sQ7Eys4bDBQOULX+Azx1bK320dKEJk+jtDSDkq/eEb9c7JAhIr5K6AKEv7mdrqwqJBjooMGe
 IZPoquC3J7UAddrr1hR8U8RwYnciSa480+icJFFwZ3fRrszBUbOjSgGHl2pJI3oITQBdQbQsrxR
 SeRkTf9S9N/Cl16mk2g==
X-Proofpoint-GUID: IaAnMH5WZh8UpmZ0XPFKlZyj_snBZ1up
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91461-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 18D23CABA8
X-Rspamd-Action: no action

On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
> On SM8250 most of the video clocks are powered by the MMCX domain, while
> the PLL it powered on by the MX domain. Extend the driver to support
> scaling both power domains, while keeping compatibitility with the
> existing DTs, which define only the MX domain.
> 
> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index df8e6bf9430e..aa71f7f53ee3 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
>  
>  static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
>  
> -static const char * const sm8250_opp_pd_table[] = { "mx" };
> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
>  
>  static const struct platform_clk_data sm8250_clk_table[] = {
>  	{IRIS_AXI_CLK,  "iface"        },
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 7b612ad37e4f..74ec81e3d622 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
>  		return ret;
>  
>  	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
> +	/* backwards compatibility for incomplete ABI SM8250 */
> +	if (ret == -ENODEV &&
> +	    of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
> +		iris_opp_pd_data.num_pd_names--;

You're decrementing 1 to 0 @ this point in the series

Konrad

