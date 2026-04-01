Return-Path: <linux-arm-msm+bounces-101344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CETGEKAbzWnOaAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 15:20:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2AF37B1DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 15:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB4D43004F43
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 12:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E273440629F;
	Wed,  1 Apr 2026 12:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JmsBfoVj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SBPGut4P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1A14035C2
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 12:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047238; cv=none; b=grr8q05NJYGoDkjsQ/ORM+oSPwXgUHyp7VgzCcUi/T4Tcq3c9I0UMlGjMlCKbnieMMN4uN2RaSTqQWXnCQpYkChhqhcd513vmSVvkp2qs1pIfnDTJXm8adJNyO03qXMDhXVwoKFNRz6Y0ZSmkLR6SDhOFd9gR60WELFeyzvZ5HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047238; c=relaxed/simple;
	bh=pCYih/oK/2RpG31ixyLNP23iZnCS12q1PlSLVHTVdsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PDyhPsikdjKhs/8aMoAmcktmEzfVLOnakY5wfQJlxKQO/f6ttCjHTYSog5hGIQieoLIN2uMfcRcDSVpH+HIqwOT0Yt7bzkMksdwiz+zzkh/QrQ1wMQeb3hK3j69TBMfTwjWaFdre8mdhTZZriAKZbuxQGIrLKYj6UtL7CZYvRZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JmsBfoVj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SBPGut4P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631AveTj1562598
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 12:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dpdvjhENMHaBsfW18sHT3qfrexDaEtdrwVO2ppsUuwQ=; b=JmsBfoVjjYTAMq+3
	D1Zx8DNKNQD7CROg4QMH2+s2hhl1AgEpOAekHwa++0J7SJjDHEJUM7R76K3DFCd1
	6/L8Kd9rjF+Gh2uSb4va2MbVByJwT/QQDxJLcN9MYI4+noJhOEmswgvy1jeyNlBy
	qnN1I2eh6i3ZMRe5aAapCW7vNIVVJIRk/uzqyS9pRUr52gU4DPij12+YxqcPSRuw
	Bs/jv9YmMrgS6wds2PDUbhAjHonxyNChJ5+dnYsQtcJlo8//LJVpkqWPeEYlAGNi
	4cS2aJqvPDs+7kpBLk0K2nYi1E2XmHYqwGYFFrDZZElVGL9tjAZijCqMONu3wfAe
	okdcBQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8va3sxhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 12:40:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2471321dcso139420835ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 05:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775047235; x=1775652035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpdvjhENMHaBsfW18sHT3qfrexDaEtdrwVO2ppsUuwQ=;
        b=SBPGut4P3MfKLvFazoMheZZ3a+Hq1A/d1zAsbIaIg+ZJQRewjnan0tbcGoS4x17YjI
         Jswr8pWkYMTbbJVKjXll7M54Terx+hI/7nom3mBdli0jfdGFY8pWMECjqoXoj4Bh2BQk
         yincNs4xGE8AQubMnRU/+OYLzlYCwT/afT1KRjCHaFgEwsLK9J40QeLMfmUSTvstw8sb
         YF3hB1LxcmpE8N/EG9WWXkeUMYT6fXCMUSStPj+pafTt3p+qihbmAgg6oJYZNvcw/NE2
         6rXAqyKy2WxNTKIuTqpVS5+uJxB9zhtqNaRhKjj0Uty4z1HstBN0FuEg8T1em79L1Gqp
         uFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047235; x=1775652035;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpdvjhENMHaBsfW18sHT3qfrexDaEtdrwVO2ppsUuwQ=;
        b=h24cFP+EFbagLWxpyrFrBn2uJeVRlY4e3c5K3x6U8RhJzW0JRkT4R3A8u21MDUSriC
         /aqYN1I34enskN85TuiL5Bd3ePy5/r/xze3PMYs9SPqiJ46nzeoROrJGfGH9MdGyfS1s
         FkkAvf0ccXK6PkkkqP7b5ZRf+0jWNPscRpo1V39t2W/1fubrKClxMXaZo/YTH/rnuDhQ
         2xmqeNKfdKiSw4lDNi5bJIbCRZEg+RYhkQ8zDOTMdKxrOFO2PKMgAqWnXQ7jxgoKvNzK
         Izv1kjGFYa2kMS1u1k5Cym1/y8RK+TokvIWeEBS0diNCfJGtCmEi93Fl1Rp795qOkymz
         GChg==
X-Forwarded-Encrypted: i=1; AJvYcCUitFMgDf/D7C/CJ+luRIEGfZH04k9zqi925lDi4WnLTDebPwXuc5KBN8CHwXL4mJEOGXxtztu+iIxYQD27@vger.kernel.org
X-Gm-Message-State: AOJu0YzMtG2iXQ8fvEWn0HeFdB8WXaWsx6Z6BdDxJqVoHBI7QLXenHct
	17sboYyLyE+wAqobUU4aKdn6IW4jRijubIgxbMSZKAV0oMO88k0xesdM3eJKUSi1EiE9AbOrLWq
	Qr57dvtdnWPOuDPBWRSYw0lvs52YX4NvNdtQ3iL6/k7bmrvhky/WvMyfeZW5ZrQIX0jDb
X-Gm-Gg: ATEYQzzzWvJo3mHWzL9n/3Tgsy78Bvm6S9EcB5LEh4P4+hnnSoafnGE/EZVEy2jsb1R
	qtXjNxddKxcRcwfNXuFx71ZtRm2t1TXem78MOonCpojOZkVaj7YPcLgYyiXUGG2Qou3Ws1Ya81+
	eUM9vqBaNAxMiB2hBEbL9egADAYKB4QjFD34K499UzmiyXsBDj09bfkigZmB0cLq3Q+CAnNKbG0
	R8I9WRXYwKwM/d0s84bg3H0IaUaUOWB4Jxmt2cVjIBFlj4B8F6lGy0WhYZRYD5WdHN5P5iqhH5W
	nfRiRDSJrhleWU0NKVrQL0F7A8nGkvoacQpuvqa2+T3kc2MbyPnMtGBzk+E0Qdk1YKwjcWgLIrV
	9M5lA7jeJoaiIXo04lVkFE9HZKe85N9t/PyieYKEV9ZNHcaLfo83vkA==
X-Received: by 2002:a17:903:384d:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2b269ade166mr38668355ad.9.1775047234936;
        Wed, 01 Apr 2026 05:40:34 -0700 (PDT)
X-Received: by 2002:a17:903:384d:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2b269ade166mr38667965ad.9.1775047234424;
        Wed, 01 Apr 2026 05:40:34 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427663acsm147974705ad.46.2026.04.01.05.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 05:40:34 -0700 (PDT)
Message-ID: <437123c2-35af-227c-3fe1-7d45ea1243da@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 18:10:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 3/5] media: iris: Add platform data for X1P42100
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-3-ca784552a3e9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260401-enable_iris_on_purwa-v4-3-ca784552a3e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Pu-Lbbiv6wdYt8LkUMHKDGUFp22xKVlA
X-Proofpoint-ORIG-GUID: Pu-Lbbiv6wdYt8LkUMHKDGUFp22xKVlA
X-Authority-Analysis: v=2.4 cv=B/C0EetM c=1 sm=1 tr=0 ts=69cd1244 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=5/Y9Gi2N1OwmQbPtUd2E/A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=glT4pT81iDO7b4vcCO8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDExNSBTYWx0ZWRfX73nFTLxJ1/aG
 otK+8AMr6KceppysdFOYTZizDUBGJ7BBVCqmBUL76BKXmCAYtPdk16UUFwy5aJnkFFo1HIU3ocv
 AX1ifZ27P7notENiyg25FjKdGXfGWxGaiEIWOnmiOo1L3iV81OCdjFWQG6GTgzsuR1bDc9C1Kui
 HRGnUAVmrmhG7tfBbcbiFrdiMUbg1j3cNl6rZP9a7Ro2In2EZmL7ObO8kPurYDw3Kwzd0174hpl
 BGK6FESeZu26yzhPbhBO/pJQ4BJlZ5EKsg7u8qY/WYnLy3GpEmi0wDwHLGSlZumpt1nfu09Vtmk
 hhYfKEhhqgR5JXSbRllVIstADgC2P9KRtiMNYE+gCPzHx/x8FnnuQ4vQZKausmBoeMA8PpZ2rhG
 omI3joz8dfFN1tP+mvjYz+qWYCZWCOgqXNoDV7qluq+LeM9VxirTGMEUZWXjoCUu5xcIDO8VOA6
 DaV1p0djzSFf58MxeWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010115
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-101344-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9B2AF37B1DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/2026 3:54 PM, Wangao Wang wrote:
> Introduce platform data for X1P42100, derived from SM8550 but using a
> different clock configuration and a dedicated OPP setup.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 97 ++++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_x1p42100.h    | 22 +++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
>  4 files changed, 124 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5a489917580eb10022fdcb52f7321a915e8b239d..2e97360ddcd56a4b61fb296782b0c914b6154784 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -47,6 +47,7 @@ extern const struct iris_platform_data sm8250_data;
>  extern const struct iris_platform_data sm8550_data;
>  extern const struct iris_platform_data sm8650_data;
>  extern const struct iris_platform_data sm8750_data;
> +extern const struct iris_platform_data x1p42100_data;
>  
>  enum platform_clk_type {
>  	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..aac72900c0292040500ec4dcde9bd6e7da225fd4 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -15,6 +15,7 @@
>  #include "iris_platform_qcs8300.h"
>  #include "iris_platform_sm8650.h"
>  #include "iris_platform_sm8750.h"
> +#include "iris_platform_x1p42100.h"
>  
>  #define VIDEO_ARCH_LX 1
>  #define BITRATE_MAX				245000000
> @@ -1317,3 +1318,99 @@ const struct iris_platform_data qcs8300_data = {
>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
> +
> +const struct iris_platform_data x1p42100_data = {
> +	.get_instance = iris_hfi_gen2_get_instance,
> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,

this needs a rebase on latest platform rework series.

Thanks,
Dikshita

> +	.vpu_ops = &iris_vpu3_purwa_ops,
> +	.set_preset_registers = iris_set_sm8550_preset_registers,
> +	.icc_tbl = sm8550_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> +	.clk_rst_tbl = sm8550_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
> +	.bw_tbl_dec = sm8550_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> +	.pmdomain_tbl = sm8550_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> +	.opp_pd_tbl = sm8550_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> +	.clk_tbl = x1p42100_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(x1p42100_clk_table),
> +	.opp_clk_tbl = x1p42100_opp_clk_table,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu30_p4.mbn",
> +	.pas_id = IRIS_PAS_ID,
> +	.inst_iris_fmts = platform_fmts_sm8550_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
> +	.inst_caps = &platform_inst_cap_sm8550,
> +	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
> +	.tz_cp_config_data = tz_cp_config_sm8550,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
> +	.core_arch = VIDEO_ARCH_LX,
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.ubwc_config = &ubwc_config_sm8550,
> +	.num_vpp_pipe = 1,
> +	.max_session_count = 16,
> +	.max_core_mbpf = NUM_MBS_8K * 2,
> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> +	.dec_input_config_params_default =
> +		sm8550_vdec_input_config_params_default,
> +	.dec_input_config_params_default_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
> +	.dec_input_config_params_hevc =
> +		sm8550_vdec_input_config_param_hevc,
> +	.dec_input_config_params_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
> +	.dec_input_config_params_vp9 =
> +		sm8550_vdec_input_config_param_vp9,
> +	.dec_input_config_params_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
> +	.dec_input_config_params_av1 =
> +		sm8550_vdec_input_config_param_av1,
> +	.dec_input_config_params_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
> +	.dec_output_config_params =
> +		sm8550_vdec_output_config_params,
> +	.dec_output_config_params_size =
> +		ARRAY_SIZE(sm8550_vdec_output_config_params),
> +
> +	.enc_input_config_params =
> +		sm8550_venc_input_config_params,
> +	.enc_input_config_params_size =
> +		ARRAY_SIZE(sm8550_venc_input_config_params),
> +	.enc_output_config_params =
> +		sm8550_venc_output_config_params,
> +	.enc_output_config_params_size =
> +		ARRAY_SIZE(sm8550_venc_output_config_params),
> +
> +	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
> +	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
> +	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
> +	.dec_output_prop_avc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
> +	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
> +	.dec_output_prop_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
> +	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
> +	.dec_output_prop_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
> +	.dec_output_prop_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
> +
> +	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> +
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
> +	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
> +	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h b/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..d89acfbc1233dad0692f6c13c3fc22b10e5bdd80
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __IRIS_PLATFORM_X1P42100_H__
> +#define __IRIS_PLATFORM_X1P42100_H__
> +
> +static const struct platform_clk_data x1p42100_clk_table[] = {
> +	{IRIS_AXI_CLK,		"iface"			},
> +	{IRIS_CTRL_CLK,		"core"			},
> +	{IRIS_HW_CLK,		"vcodec0_core"		},
> +	{IRIS_BSE_HW_CLK,	"vcodec0_bse"		},
> +};
> +
> +static const char *const x1p42100_opp_clk_table[] = {
> +	"vcodec0_core",
> +	"vcodec0_bse",
> +	NULL,
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index ddaacda523ecb9990af0dd0640196223fbcc2cab..287f615dfa6479964ed68649f2829b5bbeed6cd6 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -374,6 +374,10 @@ static const struct of_device_id iris_dt_match[] = {
>  		.compatible = "qcom,sm8750-iris",
>  		.data = &sm8750_data,
>  	},
> +	{
> +		.compatible = "qcom,x1p42100-iris",
> +		.data = &x1p42100_data,
> +	},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, iris_dt_match);
> 

