Return-Path: <linux-arm-msm+bounces-89983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BY2JseycGndZAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:04:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4B955ADE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B72F48E82CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81821481FC3;
	Wed, 21 Jan 2026 10:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3G1l1Zb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LX35PPgN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0349B47B425
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990890; cv=none; b=RyRPnZ/zQup8U+JetY9QFIcJ3pMNi18uIA+a4GflOJ8yfEssxUiPTwXG80IVjftMvmOnuSXaKN3A3KjmU5aNtCQWDUDZMD2udfz+rqnKnyqTYqasmdUYkNEjyZnWDuId73qZB3I0PyC2ctIv6TA4QRrnhLHwFbqriXUYB6wYPuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990890; c=relaxed/simple;
	bh=uYxNW2Lns6okZ2c2uf4mlp7Tz+RdKXIkytf+9fjxIaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=behAWq/ne9PYBbpTuak0TFpeJvIGZZPXTgfRnZolIgXxHRiBr5MmXUER40SBAiFU17bqYgo8ki8Lcvi/lRnLCTx3lYPDiUxes6AjPcjxStLxmFH2n20SC/Jje6bDCv+BkQFVyAlcA/KpYkLV0acs0aTuqvLmbdSJKcQv/Y0Jqbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3G1l1Zb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LX35PPgN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9iUpP3481408
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V/YGjOa5xxVPrcdBiB2BIK8n5bGPdJoVpsazA00txKE=; b=Y3G1l1ZbiEkczCnt
	k3iKfe0Et2VHA2E/Bvct+NdRwiYUlpfCMB9sPCnnMDMYOYYWk4YxKfF1+VuSKGJw
	s8Z3hudT2NicDifn2ANsJHtYhWa9DYZ2X//v9ipYncQH78jOBXDybCi6LaNqFQLk
	ic1KT6qtsWdEl1Rvc6DyXUMc3X2Qm9fNM0HU+L0NeReWACgliTAN7ahs2ha+ucZx
	OZJsYycPWLDcCr8ngW3OfTPeH8MfOyvDZMd8BQnMOcQufFmk4ltQyHjNbfBm+Ao1
	pRyJSRMrFW/dGjjkwgFFHbbfrHy9MHbnHU5V/wMi4L/DT2NUtSNapdpXaoaeo6+k
	Nw4sZA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btvef06jy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:21:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a76b0673dcso14087175ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 02:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768990884; x=1769595684; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V/YGjOa5xxVPrcdBiB2BIK8n5bGPdJoVpsazA00txKE=;
        b=LX35PPgNaJ1PF9jhy9Z0l5WQxrqErzzT/tm0+2fw68ko9wxXviEXNjOLtAXIRcZHKt
         Fc3slWvf45rgyWVdaEwWl1LIbs9f5SO3mTeSAsyBy1VcqvLvUKBvPbvGWnVyE0M3pLk/
         tnpKXUtvR+jhZwaWDNVDisdklJX2M5iOcZ2aqEferI4PDFMj8FU8eH20FTLdE20j5rvc
         wAFEgbg0oWs2GsWjIlkRZnVsbEcbk2DQPP5oc7M3ywS28GC7sSiAGhGpyGaHnDTld/at
         IuFTlkTRggtya8GXfi5XgQArKCgWWAHIVphJOJ+D2E9vmnlgweB5Bq2V0iU/1VOZnWII
         RS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768990884; x=1769595684;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/YGjOa5xxVPrcdBiB2BIK8n5bGPdJoVpsazA00txKE=;
        b=cdHHCgxNCMTlsUDsxouRhKTzYJ9J/TavZV4+A8QLeoIiw3a7Uo7/Bxm+/DtmkPa1hD
         Qew6lrJq4d7aAYdrxLyBetO6WBstFdupiXKYfEb5hUvQsbMPWDO9vAHlTxOHeyNs4qYu
         9LldjZNjBnGRFJJJP6aayeXZLQTCs9MTU/FznK3cOashJ3wah3+s12gB26VwTqcWMLcI
         i3I7GaJE9KEVzma9L9G3G3mrhJ3p6pN0yFvgHFK8TTx5UsKeOzoKoI0rcd5vqi4XrHIh
         T2sEIV0ZI4EVBFrxj7K64Sd7Wy/Txc5wwHp+hmwGSboq1GtNqQrJk3GC8PH626Dw2vJt
         BZXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCvjmsSOv7hVCvkeAQKK6Gdiu0C2//n77hUhZOxeQlYRFjAp9cc/Wkbob3wUarufCw1VJ1BqcO7u42OZsX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Jydau1qSfUHDS7c5Nm/4tthASThxUuPXOAOzO1Qgc8mOQJtx
	jNfMokiKhYL3iLVXoCyqMp2nMXiNK1J0Z/zy+rkjhEBiBq/1c0J9Xf2Bmd2wN48/4mQLLdCwdMi
	IBHyqA+ZhrzxbI/eeCYH+QPFe60JmTUQkyI20SHpjDoXZF8D0xutQjVQKfJ9CJ/9pmYrG
X-Gm-Gg: AZuq6aLVulv3F8b+aO5Lwngx35z9cuaj39a7bSG2E2MLfl0OKAScLNFOrpnaxdjvdE0
	y++4HE/c724K+X/3TkVRMZXYbnQcQUiHAadFz24BhUAgC5t21b0IMHw372Z02s+K3/T4O/7jCbn
	u19uLbsulNJDHX34jD9DSVnKl/GXhdWrgVobo44NVM9jkU2HCKUCSK6M8AzKooMjd3f/qrWO95V
	rMUDadDomEiRjTNP1ZSuhhnEzs3zQdRDNMLifYh+Rbdm2tD4Y7zqMj0EevRHoHcE2YnswD9H+CI
	eD9S2kBTJONNQ/pKGTPR9DAYm/9J9oNqx3++U+s6vHTxj+HetsFYc/CPNZref08Nm3+0htFw4tF
	tdkwaJMfqLeua2UydrrwMvH+43rR6PAarcG0vY6ahMQ==
X-Received: by 2002:a17:903:1aa8:b0:2a7:8bf3:5677 with SMTP id d9443c01a7336-2a78bf35a7fmr29420305ad.59.1768990884308;
        Wed, 21 Jan 2026 02:21:24 -0800 (PST)
X-Received: by 2002:a17:903:1aa8:b0:2a7:8bf3:5677 with SMTP id d9443c01a7336-2a78bf35a7fmr29420145ad.59.1768990883774;
        Wed, 21 Jan 2026 02:21:23 -0800 (PST)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190aa334sm96168515ad.5.2026.01.21.02.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 02:21:23 -0800 (PST)
Message-ID: <274e2140-606b-47d8-8ba3-b848658ea5e3@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 15:51:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] i2c: qcom-geni: Enable I2C on SA8255p Qualcomm
 platforms
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
 <20260112104722.591521-13-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <20260112104722.591521-13-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZDkrbxFfBfFZ5TxVvbYpmOVQbS6pJ7Zq
X-Proofpoint-ORIG-GUID: ZDkrbxFfBfFZ5TxVvbYpmOVQbS6pJ7Zq
X-Authority-Analysis: v=2.4 cv=CYgFJbrl c=1 sm=1 tr=0 ts=6970a8a5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=isDHjFI0VZuljSFwwbQA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4NiBTYWx0ZWRfX+Y9w2/fKxPx6
 sulOo99/Gs5U7DN0oSoxIWXIW4uQWGD7wL0IqrWGuBVFVBPYZUUdaYCVzoWP+FPcpVb8EqUW71m
 d6CWAutX8IA4E6B0BR4+/973OtLdhH1RwZt1dsyw3sa2zk5qfSR4cC3Tb3nxmchiPKZtrr/yNOQ
 jeyj/Zc8D9nMXk7zm2WaM3Anst8uVh05/43sjeLkWBwAh3s+0vD9FWvAgYfdJsLnmsLTSXXqSgu
 WB9s1KfU5kO0KLtEvuaYedlJXWwqAdDLSwOW2Eefs+qjOk1eJlryDdsOKWdRW+TKhNgNkdovAp+
 BSRVqnG0dWGFqWK8QmiaTrRBZh8QpGZmKQB/IfehTOKgmn5CyX3R80DuEOM2gN1jSJaDbmNJq3O
 6HPB8X9bTqu7RluSkqFC2UnmrYr02zKY1Wv4vw7SH/7sQ4rLEFxsCyoUCBTcUmfh+frEsDATrvW
 5JnEwHjCw2nwYCaMB3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210086
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89983-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0B4B955ADE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

On 1/12/2026 4:17 PM, Praveen Talari wrote:
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power
> and performance protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power on/off.
> 
> The SCMI performance protocol manages I2C frequency, with each
> frequency rate represented by a performance level. The driver uses
> geni_se_set_perf_opp() API to request the desired frequency rate..
> 
> As part of geni_se_set_perf_opp(), the OPP for the requested frequency
> is obtained using dev_pm_opp_find_freq_floor() and the performance
> level is set using dev_pm_opp_set_opp().
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
> V1->v2:
> From kernel test robot:
> - Initialized ret to "0" in resume/suspend callbacks.
> 
> Bjorn:
> - Used seperate APIs for the resouces enable/disable.
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 53 ++++++++++++++++++++++--------
>  1 file changed, 40 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 1c9356e13b97..72457b98f155 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -82,6 +82,10 @@ struct geni_i2c_desc {
>  	char *icc_ddr;
>  	bool no_dma_support;
>  	unsigned int tx_fifo_depth;
> +	int (*resources_init)(struct geni_se *se);
> +	int (*set_rate)(struct geni_se *se, unsigned long freq);
> +	int (*power_on)(struct geni_se *se);
> +	int (*power_off)(struct geni_se *se);
>  };
>  
>  #define QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC	2
> @@ -203,8 +207,9 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>  	return -EINVAL;
>  }
>  
> -static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
> +static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
>  {
> +	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
>  	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>  	u32 val;
>  
> @@ -217,6 +222,7 @@ static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
>  	val |= itr->t_low_cnt << LOW_COUNTER_SHFT;
>  	val |= itr->t_cycle_cnt;
>  	writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
> +	return 0;
>  }
>  
>  static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
> @@ -908,7 +914,9 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>  		return ret;
>  	}
>  
> -	qcom_geni_i2c_conf(gi2c);
> +	ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
> +	if (ret)
> +		return ret;
>  
>  	if (gi2c->gpi_mode)
>  		ret = geni_i2c_gpi_xfer(gi2c, msgs, num);
> @@ -1041,8 +1049,9 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>  	return ret;
>  }
>  
> -static int geni_i2c_resources_init(struct geni_i2c_dev *gi2c)
> +static int geni_i2c_resources_init(struct geni_se *se)
>  {
> +	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
>  	int ret;
>  
>  	ret = geni_se_resources_init(&gi2c->se);
> @@ -1095,7 +1104,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	spin_lock_init(&gi2c->lock);
>  	platform_set_drvdata(pdev, gi2c);
>  
> -	ret = geni_i2c_resources_init(gi2c);
> +	ret = gi2c->dev_data->resources_init(&gi2c->se);
>  	if (ret)
>  		return ret;
>  
> @@ -1154,15 +1163,17 @@ static void geni_i2c_shutdown(struct platform_device *pdev)
>  
>  static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>  {
> -	int ret;
> +	int ret = 0;
>  	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>  
>  	disable_irq(gi2c->irq);
>  
> -	ret = geni_se_resources_deactivate(&gi2c->se);
> -	if (ret) {
> -		enable_irq(gi2c->irq);
> -		return ret;
> +	if (gi2c->dev_data->power_off) {
> +		ret = gi2c->dev_data->power_off(&gi2c->se);
> +		if (ret) {
> +			enable_irq(gi2c->irq);
> +			return ret;
> +		}
>  	}
>  
>  	gi2c->suspended = 1;
> @@ -1171,12 +1182,14 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>  
>  static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>  {
> -	int ret;
> +	int ret = 0;
>  	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>  
> -	ret = geni_se_resources_activate(&gi2c->se);
> -	if (ret)
> -		return ret;
> +	if (gi2c->dev_data->power_on) {
> +		ret = gi2c->dev_data->power_on(&gi2c->se);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	enable_irq(gi2c->irq);
>  	gi2c->suspended = 0;
> @@ -1215,6 +1228,10 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
>  
>  static const struct geni_i2c_desc geni_i2c = {
>  	.icc_ddr = "qup-memory",
> +	.resources_init = geni_i2c_resources_init,
> +	.set_rate = qcom_geni_i2c_conf,
> +	.power_on = geni_se_resources_activate,
> +	.power_off = geni_se_resources_deactivate,
>  };
>  
>  static const struct geni_i2c_desc i2c_master_hub = {
> @@ -1222,11 +1239,21 @@ static const struct geni_i2c_desc i2c_master_hub = {
>  	.icc_ddr = NULL,
>  	.no_dma_support = true,
>  	.tx_fifo_depth = 16,
> +	.resources_init = geni_i2c_resources_init,
> +	.set_rate = qcom_geni_i2c_conf,
> +	.power_on = geni_se_resources_activate,
> +	.power_off = geni_se_resources_deactivate,
> +};
> +
> +static const struct geni_i2c_desc sa8255p_geni_i2c = {
> +	.resources_init = geni_se_domain_attach,
> +	.set_rate = geni_se_set_perf_opp,
>  };
>  
>  static const struct of_device_id geni_i2c_dt_match[] = {
>  	{ .compatible = "qcom,geni-i2c", .data = &geni_i2c },
>  	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
> +	{ .compatible = "qcom,sa8255p-geni-i2c", .data = &sa8255p_geni_i2c },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);

