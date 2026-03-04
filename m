Return-Path: <linux-arm-msm+bounces-95328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFCWLjE1qGm+pQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:35:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B34B2200818
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9295B3006917
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66B01F4176;
	Wed,  4 Mar 2026 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJsYsb/2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="blXXh+Zb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E93E390C88
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 13:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772631340; cv=none; b=hI6NKw78hh/xn/z012+w3J368c7/6YuwAV5CRaeNoAonZSGUb+VYPHYzFP/LknLzn5B+asx6pnEbmIYhruEw5xHAbb3yQYMbRAHNgbJXZ1JKsal7AzsFIlcM5lriQsLizukfzjP337l9C5nRykxZij8M2Ne2IbBYxjm/dPzowOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772631340; c=relaxed/simple;
	bh=Bc60Ce5RAVxeMqV5F3Hw8I4j0mmAfOiRf0KEGpNL4HQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kjHq8BFpL6pTzjuYLbKMrXhyAu/E3rF0kemV1apGCDQZ6ywrk7o0kYfwbVaOyg9eqMN9xLG5qqLStOkaspZOUvmrrKNjHqlOmeY48EKqZgWNtZwB7Rw6noZZrQpbT52cWbWe9uaXtQb58K9withSQZLHJUT66tVlyTkOuu0oLkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJsYsb/2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=blXXh+Zb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624Cu9mR1421894
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 13:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HHFSyLWU+Oy7MJVGltMtPHpNmUOfcwnnSnJ2aE5TD9U=; b=VJsYsb/2vSUGtnPX
	iAmIkOgQTRoD/pXdcxv1p9Ch0KCg8y24kjy3jAWP4wTumPB6ms0CkgQw/LwXj4ft
	jP5S7gacgbggk+5rn5iq5pzem1VogAAJ4ZV6zmZ5+gpii9RmVKti/zw6QSyShX3y
	XHUCT9i7mQKRxa7HMw2lvXY1bUYLjYVqTpsDua7MZbX9AAaV/tbsPOYIlxXFbCM2
	gsWcrtBwC/BRN9c/dDXdPZHguTytvXTGXHySYLjjGWCtO2VwqlPEZ5k5hQPO3QG6
	bQk4G3Mxuyr7yhbli8QeIIutffjrcG3TXMi87c2vzO1hS/4vkK/RJwSFiam8i/Rp
	pF3uSg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u1j3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 13:35:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb5a76f13eso390326385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 05:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772631338; x=1773236138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HHFSyLWU+Oy7MJVGltMtPHpNmUOfcwnnSnJ2aE5TD9U=;
        b=blXXh+ZbKAIc3nZIfgu6I/SjlvYXjzkLc49OiXq1hZMYtrJ6YNu/0PcmNGik1KAQS4
         suOVGhcAsruQFGGMdWXZncJ2Joyy54dLKzA05R0Xx3VOHSsw30L09gtLoxdpU9G9Tn32
         KdELdRAhj53614MsHviV/WLR71zFgKcD9U37gRAOBVqhTwZdzcC4VTcSM9apvgrMShVx
         o+aNPvd+8XZC2dmmJoZ/SE1L9VN5M0/Fr8T5gQjXB9bFUZTr9xTdeiaY3tvdA5rtlXOo
         r9OofF1WiF2DB31wvwlElMUJ142wB3S30ydD2WmyrBwsmbIMriIZATYnxR8PF1/xOT4p
         ta8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772631338; x=1773236138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHFSyLWU+Oy7MJVGltMtPHpNmUOfcwnnSnJ2aE5TD9U=;
        b=OfHVqH8cI2heMfyXCq8hk6VadchJzdnzDOeh6YVEGd252FJvjeQtHpqzxS9M4TSVkn
         B3HHspBQCF5LkzK1Rx6BIqZHnM3iDo4fKEY5pfK4t38OcSAy5jOzEbtKw0COxS3ovho3
         tkj7CkWv+NdU4UEDW8btbt8LKCC9fj/W8Zlyu3BXLon4Rpv+ve+jdJYauDb+BMsUr3CV
         xcSTUV7+8H/iHGK7w4k0p51yvTvdp8l5rKT959cWJItIdXHuvb3MPxTRmb3zpHd5rVv4
         HfzdrCvT2axLPf7ruVysvOiI5j5kux8kVzQpKkql/8T9SaPXqeprK7XU2sGsRwW5o0fa
         tw2w==
X-Gm-Message-State: AOJu0Yy9ntiegFL1uCC8p59juhboeds+S14MVR8b6eoRORMtnn36YK1R
	XXP7ifucfBGKQI70Bvi69FVxWgEMmhQmLwyURGt+iHJW1I2wRtZDVWALik2ripi6IP7lL4Y1ogN
	atvaFQvWDBgN/TyTSsO2pU24GGJsauzU1H+F+qy5hmF/lbvL8b9kkvoBTkJ6Kkr2+Pcfm
X-Gm-Gg: ATEYQzwcQlNiISV7b7b5by72xwruAanQlLBHiXHZ4eIAS6wWlbmW2pnWVaymnb2x9Hg
	Txd8HkWFWtpfebnbcPHdGkrI1LGjwMLHjI7qMzyKerZnq/xaAulgC6crK8BTQiry/RaUC3NAjkv
	jEY5lhnSj/uiZX+aq2OalZi8nsnY6D7s9eFm9p9f46WzS9tSdYBmLXb35U21QACGl76hi33BCbl
	KFeUnLP2q1GCesulJjwR7dchp4lHKkRrRgM1NcNvb6ZVcm4ZORzWDNZyZS+dNAJeaXDL3bslCbW
	1YJ6UuH+0RxDDzYchrinuUkawfpKznmWBE864FxnqwUcJCj6MRfoUnGlqoeFgl7z//GolBJdwh/
	KXaDvSfNUO5XlaNDxZDEcPuiceGlLNSus3nDyh84xqWRUfiqumKxDCqIENdFYwRuJMbxNtuf85h
	7fRfI=
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cd5afcdcfbmr175281785a.9.1772631337979;
        Wed, 04 Mar 2026 05:35:37 -0800 (PST)
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cd5afcdcfbmr175276685a.9.1772631337417;
        Wed, 04 Mar 2026 05:35:37 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660b5df4bf9sm1505895a12.29.2026.03.04.05.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 05:35:36 -0800 (PST)
Message-ID: <7e092c9d-ccc9-4084-91a8-7ddb063a904d@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 14:35:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] soc: qcom: ubwc: Add configuration Eliza SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
 <20260304-drm-display-eliza-v2-6-ea0579f62358@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304-drm-display-eliza-v2-6-ea0579f62358@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uH7-0nOy8nFBJyCrqLhSeRymcFbd_fJM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwOSBTYWx0ZWRfXzplf7pRX/O9x
 ilfv0ROI4LM7MFxQEOJu65igQhNPLMmFsVIyIFNQ/jwMs3E7BatLCTGD8CNqdx3bVsrO5k7cxfl
 1+bxaCYhCY1EMrqnrv1AAOh4wRN3NMEikDla8GzO7t3MldUiNdANsoPOSJgNMadubhdAyNAL0X8
 KP5E99+n3R1kZwVslAr4p9MK1vkbOol4WlgTVvEY53WLoqLduSHTWHzLXpmAoNKxxq8OIlBhpMm
 amRo0MDmeM3rRoVOFPD2KrXaqTMw/e2ACqzfaYJdcMaSRa60wVjepxifPJzFZoC4jsgVUIKvk/j
 n9Na4+YWTbhIUhC4ebhFWczC7Qw5PDcbGWBPDSSIe7ok4hF6hi+oAEqGXdoVg0Q1PFunEI44yRz
 EJ/R5KLHqWHLfUNmhto+is5zn9TZygLUaYWnZv4bYXEmvVOeUg4Kz9go9NOdNILcC6jr7Uxywc/
 O4W9MRYR7jv3QcjPRcQ==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a8352a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ofcykXZfb13_7XvavCoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: uH7-0nOy8nFBJyCrqLhSeRymcFbd_fJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040109
X-Rspamd-Queue-Id: B34B2200818
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95328-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Action: no action

On 3/4/26 1:58 PM, Krzysztof Kozlowski wrote:
> Add configuration data and an entry to OF table for matching the Eliza
> SoC.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Use data from manual (UBWC v5 as pointed out by Dmitry, but different
>    highest bank bits).
> ---
>  drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 1c25aaf55e52..633d1efa0883 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -16,6 +16,16 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
>  	/* no UBWC, no HBB */
>  };
>  
> +static const struct qcom_ubwc_cfg_data eliza_data = {
> +	.ubwc_enc_version = UBWC_5_0,
> +	.ubwc_dec_version = UBWC_5_0,
> +	.ubwc_swizzle = 6,

 = UBWC_SWIZZLE_ENABLE_LVL2 | UBWC_SWIZZLE_ENABLE_LVL3

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

