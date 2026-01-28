Return-Path: <linux-arm-msm+bounces-90948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHwPIabneWkG1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:40:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BC79F9B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8CD73008D01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 10:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306912FB0BA;
	Wed, 28 Jan 2026 10:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqIhipHO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4TFVlws"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0F32F1FD7
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769596830; cv=none; b=K7EjKl4ylX+NydxnNVkqIfY4OcEbe/f88Z0p/Zi8rrv6kkYUow8zxyTE3edTmLjFm7ejsvdH//CwaoLmWQiur253rMSpkoxX/4NSrbSGP3M8J+SaOHIaAYrboTvmvW8T6PtkqGKSZhSD+jZXHXilRwdRf/uJZ9BjeRjC5qnEO0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769596830; c=relaxed/simple;
	bh=xNCuBjdzS4goBIvwhhXFzsi0BmxhT/kaPlm/aIO1PAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzkxXKskOxDXDeVScyX/XYqGbxES+fEnZ9mIUfKBN6heXE6gf3+btNoJUxv/zFp63mYItlwNAEStBISaxxnNDmJ8a4Vw8hvcA6nBKFIuUGnrzZEmHuLpZ4ER4tx+zzt2uMvihbkfpW98rHdsjgbep/QECwIdrOqKn2V6gI1UM1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqIhipHO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4TFVlws; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92TjV3907679
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1RUTm2rK9W/8H1oDMERwWFJFkerUpB49X4+1zNyNLdg=; b=AqIhipHOFcS5YYms
	Ihh397u3CjD7BEppLGJPviyIAi+6GM9de3mLm9ohtwmi9rgf0K5M2XxpZEQdO06s
	02+Rs6dN6q5IiQdj1xnYdZao9go27AcRf2f0eWCqioJHwi/uCVRJy+1r/xRfagM9
	5KL2sHOpLuhhbhfjl/X5Qozauf/ByloxLgSSmX/MiPSlTWxTRs9wRKCyF7XfMHlT
	3ClKI4ld2ex0rXJLRWSf/Ks4i0YZ6igG5z/xnHlItgKkQFAZtu6rKYfKbE4Qk0iy
	tlnC/yqAdcdKxuSLvHbUL++8ENzXhw0WwoEXO4RmaSPbHdOG3eBbv+DRUPr02IJs
	Ar74zQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by0g0be6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:40:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c709a3a56dso54837785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 02:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769596827; x=1770201627; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1RUTm2rK9W/8H1oDMERwWFJFkerUpB49X4+1zNyNLdg=;
        b=a4TFVlws40h7o8i7rn9Ae8WmpSMM8JPGIVNfb2VKRhb6hsdb1JMgb+vrmKKLs9Q/zc
         IBolZS2c7PDpHBfwTCgeS/uFtCb2HKGqmONlxo//2bJ1u3JzuEcvLwEfEFqtuGPufQTw
         mbdB0HtIw6vJEoTSn15SCE4OG/4Ff3MiP2+b/+ROtu4qYstx8eHpjVp26JNdBpfhBcvQ
         Pmz/dhHKrMZ9MLfmGTl2Ejx2wvBuvehp3uKAvJe6ZkQz3bJodXoGpbqZR2+hx76DxSu0
         Hkm1CiQ8D23pvg/r1gdc3ZP24iBVCE8/nC1eVa/EtPovdnWY8YJ3wfOsaWT/MLm9+cR0
         cfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769596827; x=1770201627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1RUTm2rK9W/8H1oDMERwWFJFkerUpB49X4+1zNyNLdg=;
        b=u1rcwKBbdgi1ODona7Pi+t1AORnweGjI98QNkITbLf+PMxW6KbXQWmyeRX35yIXhy2
         KD0OHrBx0VvR8k39RvXSTkF+U/5PDomfelY0PMdeG/4uYaauC0549jmYnivEQxUgUFXC
         lJ3BQnIegBaLbAWNz0iBjlPmEUFCt5TmYb+AhRt6kr2TJ3NyRzqw1kCC+9o2fpfk/Doz
         qeQ9ZnrUfluWSUSW9jvElHGp/S82RdzTjI9q+Cg8wNv58Ryo1YVovJEJUvHNpJzkdHvz
         6XpXh5NLCL4aTzC9dxZBPJ9Xj9WDASYFeMImgTCaoDNOvihkNjSCf5ZSUxMRnvVcG62L
         HQ3w==
X-Gm-Message-State: AOJu0YymmECdzKbhZ0HNI/ay4Qr2hyl/XZhysT6r1YIaiJ+Qr5pakcWk
	fVYPj5XLaigbUoE6ua5XJsaEdH3d6jc7k0Un3jlOy1Cgafdg3X1Ff9Ta86Ebq9R8xYvWNOsE6rV
	ukP/v5jAh13nnR7DZ1eEdR0nEZbuwAEG65xq5tH+oWn+FzEPu98xIzD+ODikISNnk78Ru
X-Gm-Gg: AZuq6aLsS8iEALqJMzHIqspxpAklici4OQVZvoXjckPsGdJoRX3EHGoqL/kngcsjQDh
	czaGtAxhsLoIyfud/ks9lxrmmnKEW1d3DCWVpuQXumtXDhHBhsTCevqNcVkOlpmhdazsl7zVM5m
	XoDLAleMLhwYXuGTDv/R51f8USIJTG89ZZ7bKh7PuN8EpSMJIHQF+C+NuObycLpx2gVQZS5AAda
	adbseviY464eTRUbKvjnP3k4K2g1ogLYWrlyHkPu4bNLli8rRb5MNeaeIhPNmo06007EXf7Hn7X
	EzIQ5xpxjFT/EM4nc6TqJQv+lGImzmyb7jSBqX60PSYCZ3KkNb5gdsFZIBBrHi4pNpkDYkKjdVN
	pPEduZPUj3lzOpJFPlmC9NeB+IbBjm4mfzP8LLygaVIW+MZWvv5MQ5t3COYbaqBr09t0=
X-Received: by 2002:a05:620a:1aa0:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c714b481bfmr123926385a.2.1769596826925;
        Wed, 28 Jan 2026 02:40:26 -0800 (PST)
X-Received: by 2002:a05:620a:1aa0:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c714b481bfmr123923185a.2.1769596826370;
        Wed, 28 Jan 2026 02:40:26 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeffed15sm109656966b.31.2026.01.28.02.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 02:40:25 -0800 (PST)
Message-ID: <734ae332-e1c6-49d8-9f10-a68e84360ab7@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 11:40:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-4-ccee9438b5c8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-eliza-clocks-v2-4-ccee9438b5c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5XOt_l56rfbbUDxVp8EjQ2OtROLRiQ9Q
X-Proofpoint-GUID: 5XOt_l56rfbbUDxVp8EjQ2OtROLRiQ9Q
X-Authority-Analysis: v=2.4 cv=UPXQ3Sfy c=1 sm=1 tr=0 ts=6979e79b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yZxmAL73Vz1KKP0sLwcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA4NyBTYWx0ZWRfX8HUIKKqPh8d1
 OZCDpgyVzuJ78oA2JQGsTX16QdLnDraV+r2AEn06EZhDRhAWBmcbnPe/CxrBDGloKXpxw5S5ewW
 Z7qlhT27KF/6lV3/hStT+J6G6opGdoPy37WiF7imMtzt+P+VHF6lToXvGD5Uk4H2/DFOmm/H4En
 d77iwarTqcoj2DPVS18hsVvS/HtKvwo+rPqK2dMydRljfcs/UAKA8zlqqB2hQc4K08/GudTnx9f
 ywlkQZI5kBATnoVydPW7nIWNT6XB/3ZxVMnGC+9ENwGmsgys5sWGkyYC/ZepqTiL63nWcTcrG0K
 CNDp+ej7fxQQaR7C0qRwJ8A7f6ztmlkgoQiq54n4i7C4RJ3hwZNj13isPCe1B4CE19JAKINUPaV
 GqrqmsWtot3+IUUEB0XPZYKUw8Bk7YR6ah8A7aIhTKJyz7AJE72eyGc9wQjAow2UFMY3NoxHQAO
 geFvdMPx3AD/ME5AXFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90948-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D9BC79F9B5
X-Rspamd-Action: no action

On 1/27/26 4:03 PM, Abel Vesa wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add the RPMH clocks present in Eliza SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 547729b1a8ee..cf46a6585174 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -940,6 +940,25 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
>  	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
>  };
>  
> +static struct clk_hw *eliza_rpmh_clocks[] = {
> +	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,

I see that downstream also has LN_BB_CLK2 (clka7_a2) and RF_CLK3-5

Konrad

