Return-Path: <linux-arm-msm+bounces-89862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GlhIBvIb2mgMQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:23:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BDE49625
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 299F996DC83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 16:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60F6342CB0;
	Tue, 20 Jan 2026 16:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X6Q6Q7Na";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AAhfZGfB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14D834404F
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 16:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768928041; cv=none; b=BESSIgzu244ZCn5itQsuvVhL/rg6w9U9NTAc047PJOJhn/2moh6Cb/4qP7nJhDMgJKAT36kuIF9b0jDo743vmbejW97Ihr9j3e+YgSGZCJIggqcd/xkBKPdrkzdM8OaZ16WhFBfZkqLH/i9t8FSvJkp3xxnn7SYxDcVRmP8+Zs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768928041; c=relaxed/simple;
	bh=Xh5NhbusMKugFJN+jyX+RAwANK94Y1YcdWvZxclernI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wxz1VAQUoVlaGSJI+o190B+/ukVVRxLXGiKBMad9YtjlvKlqcuQQjhhAd0cuzwb/rzDo6rDDkP2qNxICN1JWuS1j0xXftQGh1urgZyVgSANlk192tK4AUa3rFZJXmy913u4IzzEIJNvw58bWRCfNtzvcmeSYSeQHpLzk6RaHpuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X6Q6Q7Na; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AAhfZGfB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KELOou3155027
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 16:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQH8/RM6VC8rU1HZ+RTjzOS2KZDYo8OMBNTFVGcVfA8=; b=X6Q6Q7NaIlQVfsHh
	/4tut6VsbqZpTQhdn3jj/OmDh3yV8kGy/XhZH46s2QicIaNam1nw/o+vWtyZ3GEL
	V6rpT/5EtG3tE/xkn1hj0bCQVJlp6s2io+TjSUYM7Dq25gijNu/F1jVi36eq++S8
	Ozf0S9E5A/eNn2EB2FePe2yl6Bn1DPmRW9i2i1IcWkPel3lQThZkVtc22Zw3CtgP
	GfIA+b/J9eoW/d4JvodzpUyXWB9KbyGZEcbVDzFQ9/lI0e29GsGnwVwMg3aXKKOi
	y7TXhgfkqYT3BOv1SdnGGESyodm2cq081htQR1mHbAOadr/1YDsJlltI0a79TYEN
	GZDIQg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4q51v15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 16:53:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81f3fe5ca8eso4922630b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 08:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768928036; x=1769532836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQH8/RM6VC8rU1HZ+RTjzOS2KZDYo8OMBNTFVGcVfA8=;
        b=AAhfZGfBxbVhKViqcGjguptC2WH34uD9P4wwWB9WxgGk2/4W0dMjqLsSou9nLkuuNh
         kZJnrjow7d9xupDvzE28dO7loA21VXf/4oQ2mOQYB6E0rcshPOl5gO3oeT0cOjAJVORr
         swvQkCui1uksLGOaCV/io0CjvJNhHzYYUTneu0rau1FJG2qBLA4lzWUt2lWLSEO/9C4b
         dVImJRlZleNBCKrZ/HHMNZfdfAQyg4fYHcGzFer5GOrvf09v82XzqUCvMlWuxPBlhqfM
         uc9rO4SF0JqJD8Pb+7CtLD2fUWNDOTFroBgp9u1NLKK8Cp1RDoIjw7b3xL/dDCJPl7tx
         J2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768928036; x=1769532836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQH8/RM6VC8rU1HZ+RTjzOS2KZDYo8OMBNTFVGcVfA8=;
        b=PS/Ju2Wi72fyXtRR6Gm5W80tC2Ks3lJu83AgqeqFYAEtq5A+LvrK8AZEbQPdG9qXPG
         jxETXoX6cmro0RUzV0iazkJl5uh52h7/RGNbmlshZY6sJiATy64oMqWp10ylef6RU6uJ
         J8Mvr5qyU48jzc86/TEk9m78oevZkhWquJJcofFVD3c6+qXLXaUYS0a03VAWjBMVhUak
         gxtR4exWHl7JSTO2eIvXnXB56pJR9skbXxxeygHpIGBfOk+0YuJx02EFyS7cnn6jNQu+
         2mwsJuAGoqcKN7H01MlUovBk+GYV7dgUynapiPb2HEZDEjrlAAspNIEmorpji5Zn5f0s
         hIEg==
X-Gm-Message-State: AOJu0YxV+GQN/VcYivLpESEMTF38AG5LMBG/3l9mEc9mCU2IzQiumyEQ
	kotM01k80g7u5qeC8s8HMrlF653p+/++v5UgPHGI2Jv5iPdq/Ii0w2mpvLX9nz6yJQieDG/6FPa
	0KUt10gKEZcDiavc8/WLqPyeYGZPrPTkCOwJPR7oFteLh3AGMKquwaS4cAkOP575D9+AT
X-Gm-Gg: AY/fxX52gymzsrLMbFMUza1KUxEUolLrPjJlAj4CzjpeYXx9zNvO1kt7CJLKku9VpHe
	+9XCvFLuiafmTS7z0ze+aHnmnpovoA7g7kEJfT9SMY3stie4h5ne10zGsrxwYNXFQURFMbHFJBO
	nRJOSDD5DAOAmkyPp4WeSh1WPJ/IA7yfnl8lG3NATPnts89517MW5Ca8SC6Yh1N7QfgJLOoaROe
	SYv6qWNcuHAmrVeTg0MTTVocwHNfhsKb3CJfnAG8Tbrj/mQtQ6ja5Q2X6G20dZT7xHYWJUv1e7B
	cZRE+j28YZdoYLIniMYstAfCrQrTXdjsGe7rw3SU1oyc27t7tZSfC4Zccw1jadV1BiwUPVYu5aw
	lYAXc+n1Z85tp70LKj0mwSfSRtrZXqugM75JCAw==
X-Received: by 2002:a05:6a20:d81a:b0:38d:ec2d:80e5 with SMTP id adf61e73a8af0-38dfe71dccfmr14976999637.45.1768928036283;
        Tue, 20 Jan 2026 08:53:56 -0800 (PST)
X-Received: by 2002:a05:6a20:d81a:b0:38d:ec2d:80e5 with SMTP id adf61e73a8af0-38dfe71dccfmr14976971637.45.1768928035633;
        Tue, 20 Jan 2026 08:53:55 -0800 (PST)
Received: from [192.168.0.195] ([49.204.25.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190eee4fsm127957315ad.42.2026.01.20.08.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 08:53:55 -0800 (PST)
Message-ID: <edb23628-8f07-4332-8a85-2b4a22a1e1a0@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 22:23:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: dispcc-sc7180: Add missing MDSS resets
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        cros-qcom-dts-watchers@chromium.org,
        Kalyan Thota
 <quic_kalyant@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Harigovindan P <harigovi@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
 <20260120-topic-7180_dispcc_bcr-v1-2-0b1b442156c3@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260120-topic-7180_dispcc_bcr-v1-2-0b1b442156c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0MCBTYWx0ZWRfX1TSjVdLC/v4c
 6m2YcDLeT0O5p1CTgom1Tk3QI8zvdlXuUcA8hC7LcLPFvvfWuwBbc6B2UogpN0XYEkmJMnzgN7q
 RMC0RYJX43q+OVYUjEzgShmAXhaN+JP/T97bXBDzXilrHNT36BX8QV1Gk/KFAxRrNxXwkBRoDqS
 1fPNxhMOEsszIQN85VjVIjuevNAqieAcHo8rfd/0/nwc4EIqiGTU4a3vS2SPvdDgZMkR69qAbPF
 ph37magsPPzIT/APIEj+zyVTdNN5rpfJDxrdLHI7G80i50Ndm7MPMxEE3m6C1PITsYeqpddJY/k
 5rYSBEbeB7t7cbd0O0r+/+stWHgXmQARpYDo/Kk8gYO7uN6D4hwX9OchazKqoEu4O/E3d+jj+4n
 evZsIIZ3beoNiC6yc3tM9YDcnSxFMN6qk6hv7rdD5hrf3KYqkXPGdaViRHs5BtNalCvml2ovad5
 6MLDVLgonowj+qQzpXQ==
X-Proofpoint-GUID: N7UUGuRNjwHH9uADVC6M9NcNyfIQpSD7
X-Proofpoint-ORIG-GUID: N7UUGuRNjwHH9uADVC6M9NcNyfIQpSD7
X-Authority-Analysis: v=2.4 cv=MNFtWcZl c=1 sm=1 tr=0 ts=696fb325 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=NUZ/Q5sP+scsJfd5oYcUKA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EEUffno1QXpLnStXY5cA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200140
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89862-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C4BDE49625
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 1/20/2026 4:49 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The MDSS resets have so far been left undescribed. Fix that.
> 
> Fixes: dd3d06622138 ("clk: qcom: Add display clock controller driver for SC7180")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-sc7180.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
> index ab1a8d419863..d7e37fbbe87e 100644
> --- a/drivers/clk/qcom/dispcc-sc7180.c
> +++ b/drivers/clk/qcom/dispcc-sc7180.c
> @@ -17,6 +17,7 @@
>  #include "clk-regmap-divider.h"
>  #include "common.h"
>  #include "gdsc.h"
> +#include "reset.h"
>  
>  enum {
>  	P_BI_TCXO,
> @@ -636,6 +637,11 @@ static struct gdsc mdss_gdsc = {
>  	.flags = HW_CTRL,
>  };
>  
> +static const struct qcom_reset_map disp_cc_sc7180_resets[] = {
> +	[DISP_CC_MDSS_CORE_BCR] = { 0x2000 },
> +	[DISP_CC_MDSS_RSCC_BCR] = { 0x4000 },
> +};
> +
>  static struct gdsc *disp_cc_sc7180_gdscs[] = {
>  	[MDSS_GDSC] = &mdss_gdsc,
>  };
> @@ -687,6 +693,8 @@ static const struct qcom_cc_desc disp_cc_sc7180_desc = {
>  	.config = &disp_cc_sc7180_regmap_config,
>  	.clks = disp_cc_sc7180_clocks,
>  	.num_clks = ARRAY_SIZE(disp_cc_sc7180_clocks),
> +	.resets = disp_cc_sc7180_resets,
> +	.num_resets = ARRAY_SIZE(disp_cc_sc7180_resets),
>  	.gdscs = disp_cc_sc7180_gdscs,
>  	.num_gdscs = ARRAY_SIZE(disp_cc_sc7180_gdscs),
>  };
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


