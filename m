Return-Path: <linux-arm-msm+bounces-99585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OjMDoBbwmnQbwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:38:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93802305B5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF543321E453
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAAE235AC0F;
	Tue, 24 Mar 2026 09:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Usl+ED/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ucz8CoUZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEBC3DE433
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774344279; cv=none; b=L/LHtbJ1TXmw5R70MAZ7wC5bfcNLR5Q+lNDABuv1dF8Drz/lHSElHzvLn3op+Ii6hx8KIHdbyoBU8Ie49GOR/a2A9/F+ZEHfpnJ0/khkcSykOLBUmA8oTvsMef02y0l2JcSW4eYrtvA9vggaum5FG1jvZcYX+/vup07N29fTtuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774344279; c=relaxed/simple;
	bh=AP19JN9q7Q9WqUAkwPBBf8tkeOsZC0sQYFAG3lntLXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SdFfr2XbwBgXFiI1SA/pksIJmt0cekzaiWz4txt21Sxuy7yuDepzUMdG/WeJOvrLCVQH+vNiwHkqfYcyPrQH3ftMfGSTW2pJ4rur8ZvTAc3V3UmKGfEPKRlndh2PmBLCvnkhB0r5mbZz5vhaLh0WDBaX46ftZdZ+5YBqtvbZdG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Usl+ED/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ucz8CoUZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3WO0o3903834
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NdbF+WHqgSviT1YzQoCcqfQyKyiKQ0l649deTJeEwOI=; b=Usl+ED/lN93wur68
	RSovohK1kYxaz6Ndh0gD6bGpjRjIj8YdHynHf8cGjDHelZPzUTyTlr1qM+MR7+bL
	T46/i/XP8NCSK4GkRjMATB4reGu+cXOeqFwrz6A1WuVmqJhoZtLXplQnymd2Z53y
	oePS3oZnkcGcI/FmqoAjX9W8IRsJ4BF6LaXtHh+10YLPBuhibxxs4cTRriY4LGzx
	Rkr+evDJI/ghJahQ+DASc0P+n4uXDLz21D32kGEvZsPUOZ6whGXSTnGF6YwlEZ1N
	j8vHU5id4TbIARITWxPDkL8SDjD3rMLKGhjERYs1/V3yqzPPNAoKMPT7CVLIwxJp
	KnvyDA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0h60f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:24:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aec8d85199so54156765ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774344266; x=1774949066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NdbF+WHqgSviT1YzQoCcqfQyKyiKQ0l649deTJeEwOI=;
        b=Ucz8CoUZluriAEmByv0VczTsHxxTPNO6+hh5w0cPopyt4vEUcQrShECk8zMQexBVWu
         J51rDO8W59ENtTzzpC60RCJ3OPTx8LnhU7ljiVq9Rkoym0j1ntbGxQElL69lItDGYbk0
         K2XY4Ccc04R8dcBQdWMtNRSp/PWcFFtBuNzg2w4J2zcPxvABZLvj0qkpVk2NoQD7fVDY
         HbbQu3ZFkKWhjMie0L57h6dGMwqr1tnj1Zgyl527aSmqDL7AMB+u3/PNIQVI/UisRhm3
         627wM1K0KFH2MIIuMTE6yqo5coePzKTzOYx69We94znZnPRbjJlnIhenbHaiwuGXA7Iv
         p0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774344266; x=1774949066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdbF+WHqgSviT1YzQoCcqfQyKyiKQ0l649deTJeEwOI=;
        b=O6gjhG0wJYwyohchGbNtyw3z6HGXhQp7De8M35h4dhmpyMbWytDatkeoycP9Fsg3Q3
         gmMw4PsZvDWw4RhplroKywkfgq8ypEZ9m96VekRb4Iu8Hvtiutx0I+4gwsLVLij9K1/+
         lBv7kwCnE6Fqki4+R7K2TnjWUa68b3DHCgJVxlT4in5ygS+W+Uo7Fmwv0wblm8t/Ztjv
         GAycIF1FFiAvFhI17uHKcVKzVRAm1cGVa4JStlEt79sUuB1JB0I5pCTHxhvwbFOqLfY6
         Ozs9WtQx5UcMpVvwz5TA8+4ZoKvmxMlfvjNlX7q1fcLZQ/6hpC4e1TElG83Ee2GEkLDE
         1MdQ==
X-Gm-Message-State: AOJu0Yx9Llg0G703IFfBuG7zCztf5JPZ0rnrTKEuPd+tKOXZCyjrJTbS
	EeeiCbkecVaFnBnlVj0gGQGpPR0oyktFIVFT/hDTcS7pnDJoQr1VXTwqDd37IF8k43dQbmmuOpz
	8/R+U9JiNjRapXFLGJ4fV9eNrSFkpBawrqbFmM3FP0pBVwqFoLGPNkj7mmv2nAtc60U0X
X-Gm-Gg: ATEYQzxoGskoOmRXO2bC/v5BzCRJZr43nCMPYaoIdOAVf1jPreMTAqEfK1WirHxZKv6
	di+AJqqUS4wPKVippj13oOpF1/e39thrMVOxyaGxgeh1DgPf3lwhTyiijPOlQMwM6wPesdb3W5t
	fx7Omzcl6VJ5P0IR4QZAapH6jI3faOz36inZMSLPIo7RZ/RTJYvFtGJOYg0hKMKEJ4p39tNPrw9
	uKt4IhAlcOfx6FCtuIXm5fGx/4b1zAiC6DMjLT7grU7Fc3SmmIx68vbT6Lunqr/8ZyUVx3zbH5G
	7fIpY7mRb5JsuaUHHU8iW2bmQpoRqDtHm3qoKfHBqWo5tK4i7feNcD4mFcfDnglCUByB2F+oYtJ
	sLXg8YekmSCa64nWOKDfkwHw0w0nTkVeTgdcxiCpUaakNUe9w2g==
X-Received: by 2002:a17:902:ea11:b0:2ae:cdf7:4740 with SMTP id d9443c01a7336-2b0a4e0f94fmr26117995ad.17.1774344265934;
        Tue, 24 Mar 2026 02:24:25 -0700 (PDT)
X-Received: by 2002:a17:902:ea11:b0:2ae:cdf7:4740 with SMTP id d9443c01a7336-2b0a4e0f94fmr26117725ad.17.1774344265439;
        Tue, 24 Mar 2026 02:24:25 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836556desm184335405ad.47.2026.03.24.02.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:24:25 -0700 (PDT)
Message-ID: <d3327948-97c2-4e6d-b7f1-623edf8f3991@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 14:54:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Enable FORCE_MEM_CORE_ON for UFS
 AXI PHY clock
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
References: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Rq-nU8KFVcqUZXhQTom9nABwM8uihjNF
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c2584b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HlnE6ubiEgjjOAmxyvYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Rq-nU8KFVcqUZXhQTom9nABwM8uihjNF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NCBTYWx0ZWRfXyIBe6M2icb+f
 479yMs8G0nubxV9kElsPvsHRebGBMI23Kt6Rc8V/bd3QhUKjYXX0ssKZGeW5231ifVJfG2rbEeu
 qK3Cfjj1nok75HxUTuSrqda2wyytUdLdYnYLtCXcLgZwW3chWq4tvTn/KhY+0Mj3ZhzKQ1LYfqs
 4SZMMzMwoQcsX+aNyCmi9D3AFhatGkljG4OhHiHdUEghIyiJhTEDBVaWhc1Bpyz8IfI4H5WihzU
 4LAwRUmW9uLcom5DjRj2fkH806PzD6eX3aWIngHLpf+/P4GlJ4TpKLktjKtZ/nf7fr0PpjERKx/
 /pM+MbQFDW5wl/V+Z2cOykCPtHjn6JAAabfif1Pu751M0ic2Mp4lTw8yxPY16DgwSmRmMjZheeI
 3mglQZg+tqjQhCImr+noBECP4yzeVKdYM5IuA2xlKWApfQdaWr7d/ltPla/lkiQqximEiXWdikb
 LPuyyR+Vo1vMr0xsG/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99585-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 93802305B5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/24/2026 12:27 AM, Abel Vesa wrote:
> diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
> index 06ee1469badd..338494385752 100644
> --- a/drivers/clk/qcom/gcc-eliza.c
> +++ b/drivers/clk/qcom/gcc-eliza.c
> @@ -3046,8 +3046,9 @@ static const struct regmap_config gcc_eliza_regmap_config = {
>  
>  static void clk_eliza_regs_configure(struct device *dev, struct regmap *regmap)
>  {
> -	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
> +	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks  */
>  	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
> +	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
>  }
>  
>  static struct qcom_cc_driver_data gcc_eliza_driver_data = {
> 
> ---
> base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
> change-id: 20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-2ef9984ed022

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


