Return-Path: <linux-arm-msm+bounces-112065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5m3nN83WJ2qo3AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:03:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 149A765E12D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:03:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LIyAsMac;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fn+MWOrz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112065-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112065-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B800F30D4042
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 08:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CD03EAC9B;
	Tue,  9 Jun 2026 08:53:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4C639F187
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 08:53:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995212; cv=none; b=iiTd+vQ5wHS2BtyQ0iTbtHcHluFM7jh8X/YydPPxEI1C1IfVAQ/pHsRONzZni0rxqLSLM8qOfebJgAjXdMrmDQOSG53/F9Noio5wfYS47WaWDf0gHpZmjuHQDQipT+12lqsSzjo82f9cf2UqTQAnglsOgnioXA422ND9Q6KNiBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995212; c=relaxed/simple;
	bh=/FSMGn29BC7ORLv22Sa7o74cNNiRrr9HIkI5/qYctTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fga58AfhwNX7G7oQH8YuOUepI7aEYZlWH49bJHkyZi+k3H8Udf5xTw4v8LM9r9EQeVapNR264TjBSoEYhOigdHtznay1fpujYfunnyzpwo7UPWTWAUK83LUkoShgdRZVFSc0uE8cHMKB46pmsXw+93bMDWgQJVpG3JkxKvCI7hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIyAsMac; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fn+MWOrz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rKoN1584064
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 08:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qxjGI4Ozh3EujmkmvmGGntYY6me51VER/HBizqF9uJk=; b=LIyAsMacW+rW/x2u
	estfjDemu1BZ42GBzSHJdqmU21fmxHPLGKjRC4SlLF7oQKWXf/yVujEvfu1jowFV
	cPdwzyXeSH7Kk9vJu82dszmJqiYdqCsIdJqau327Gw0YKbkCCcZS/OXOF4GEkvCB
	bYpOT3INz80BBdrBUPdM/HczOIv8K8CoPUVHf4XAIWvNUmSzkc6jrKnZKc6PBRUi
	y9+rIezfbIcJOQ6F5tLo2VEaseDgSRR1QQTnFmkxLTigtcRF7MUDEzPBWJzHHpfN
	5xHwoeGx3kbdeLFGfv2XpEFgMkGT+RkcZGizDszN3NReATOyOR00qrDtwXdByHJt
	jQr0Bg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeermyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:53:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51758177935so63775561cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 01:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780995210; x=1781600010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qxjGI4Ozh3EujmkmvmGGntYY6me51VER/HBizqF9uJk=;
        b=fn+MWOrzAX8wEczUz8gDPJJ4bugeZrcmYmS6v9FefDxPQJhjr2ZojenshNIPAwCKPV
         bWA1vP/YK8PxJRxo5QLSGe7mnHwCutV2gL13qXxY+5L7WdUyQUAYTMUfefsbn/bgTWsD
         gNs/GYKSQRjD0OTLteUDZSw/jJIXWD8Kryn0dVb7GAOYk/YJ7mf5gMZcnbOlhA7RQFkl
         i4vG8ueB7BroD42i7Yovo+c2VK7mhHA7V4SdVPNulOc21LGdtUNJG2wk8bMCQuG6lcxp
         YJdFV36AGq4Aphdn34M66GtSojd1K2R5MPj6BeUinUL7ryESJ49n7V6ygBLlUfdzdZEc
         Mejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995210; x=1781600010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxjGI4Ozh3EujmkmvmGGntYY6me51VER/HBizqF9uJk=;
        b=AWTzKpRB/ZYWSXqOFXOmjTQP3hv9DfylOBrbWZd58etGeaJhaZxSRUDfx9FFKVPgpY
         uSNVg7cV5mmKaF5rsxq+cDGfu3ZLiGhjsTYhVtWaddNcGoQnwIPvsIne05cVeCckajV/
         temGbetFlG9dg/c2a6MY1YJe3LwtX+yqtLO7ffVnBnkezsxPa5yZ+fe/fFpLmUy/79Nd
         dtdouQ1XVrd7i20kC1XIqOf8MJn2U0DtkN8H9I/SedVrJXl20yVeANExagHKHxfvm7iv
         nudgNH5VxqvCxoQVlM8FtB4QrFOq9/vilDdv84ZacpaBFhIlIfXpIlwQHKg7vnCdX8m7
         JCqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8WEIO1m4r1Ia+pqMSplroCtQMyqQXsQ/pqB8ZzR3T1MDmbOT3xrBjoTaUM4F26fsT8MSVJcuL6v3MVx31K@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf8XSUe2FyrIbTvsJr+r/BK8ZisNYzgk8/8qFRpwKF8ew33A1+
	BhsmJvlr/acwDkiUtPPqwkx57+/OsikErlhkmhMIrRySjZEbtacAzYa8CWiwVEX5FqY/lz/bNyf
	MNtKE677nJAfumfo3WCZYwQh/qM8rXx/8aNtU/gt4rCDEvEYVmgf4NsYJ9xaStWPy08M0
X-Gm-Gg: Acq92OEHIXdqA44eo7haMvtcEBuzioX5azNbuRTH/tIWYSia95+OeeBRLWtSFNJkr8K
	rzYoZtQddAwcZd/BKFYoyAz1ACgUrN3e6QDx5s+xYI6DEuttb1Y+RME1s6JrWnqzw/Icyx8Kyuz
	rAt3XF2VubpV4B+LzQOG0074Q7YNBxk590iqLSmtokIXGVel88kAaacpdEBJE4F/HUi6pnSy4nN
	dHkOlTXhFzDq/HBAo5fEEVYkVxexyjBJyDcyefgtMhP38TawyMyNsqxa3Iflzm8xAIKfhifPFoE
	6slaMY072oBJhM126QKgNOhyXCJHx74a5rvbBZmwLXzmr79QSo3AE1icQGT0dnmbV4EG0o88j+I
	DWMjKj0BcC7qdRQ+FD5Pz5pq/pUNQEvPJRui+JTZ7YRUB5VQ0QpaV/9enonc=
X-Received: by 2002:a05:622a:2489:b0:50d:66b6:1564 with SMTP id d75a77b69052e-51795b8650fmr177165251cf.14.1780995209401;
        Tue, 09 Jun 2026 01:53:29 -0700 (PDT)
X-Received: by 2002:a05:622a:2489:b0:50d:66b6:1564 with SMTP id d75a77b69052e-51795b8650fmr177164921cf.14.1780995208906;
        Tue, 09 Jun 2026 01:53:28 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6912365bd3fsm4736019a12.5.2026.06.09.01.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:53:27 -0700 (PDT)
Message-ID: <314beaa0-3dc4-4cba-a37f-c358532e90dd@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 09:53:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] soundwire: qcom: add EE-aware register layout and
 cpu selection
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608175345.3118060-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260608175345.3118060-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a27d48a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nzkHmdKqgOy-9w5VjhwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4MiBTYWx0ZWRfXz1La7EJ0fnWZ
 eUP3CvsUqDfn8KeJM3feanEUhTpGS6CJ/swb3uwHOp5nwdCKhLD9claOtEZOqsVQGqinmG1ECp7
 +G00GmEnuxqNTCqbQApBKpqbyo7UAIdIrMpCWVvPimC5l2qVl4wrdHd9lwbNuGYlXi9gO38dEuC
 lTFAk5xZ8jK8F5KrGNDeWVt8Dtc7LDAXmcoeDUNrTz6QXSctuJA+wN85G8ZBAf9zg3kqb646sEs
 H8KoERL3/HdeWJkx0mTLBCLDE0MWGdkzn343UFsIU5KftyspNX0W+oGz9oBzGklD91n1p7xHXbI
 jXEuq1zFA6CPNIKoC+d27Yw/9Qm7F6kDA+6IpQTg3AYj88fLQ5px44zJyvxHb663FI1DnmRHzLc
 wEyaDflk1We8mP1vMs98LpYN75Prl58jxELGEgO/wNhu11JFXixlpN7oy2tQAHjW+vRbAXDOC/C
 pYcjNvJem9mFa/jBWVg==
X-Proofpoint-ORIG-GUID: 0wqhNec4AV4ndAmt-RSHTxUEFwKM4epd
X-Proofpoint-GUID: 0wqhNec4AV4ndAmt-RSHTxUEFwKM4epd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112065-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:mohammad.rafi.shaik@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:srini@kernel.org,m:vkoul@kernel.org,m:yung-chuan.liao@linux.intel.com,m:quic_srivasam@quicinc.com,m:pierre-louis.bossart@linux.dev,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 149A765E12D



On 6/8/26 6:53 PM, Mohammad Rafi Shaik wrote:
> Some Qualcomm SoundWire masters expose interrupt, FIFO and status
> registers in EE-specific register windows on v2.0 and newer hardware.
> 
> Add support for selecting the SoundWire execution environment from DT
> and use it to program the correct register window for the active EE.

So this is integration details, which can be derived dynamically based
on version or compatible.


> The driver now reads the EE value from the new
> qcom,swr-master-ee-val property, with qcom,ee as a fallback for
> backward compatibility.

> 
> For v2.0+ hardware, the IRQ/FIFO/status register layout is adjusted by
Which exact version, do we have minor or step values for this?

> the EE window stride so the driver programs the correct bank for the
> selected EE. The interrupt enable path is also updated to always use
> the selected EE window.
> 
> This change allows SoundWire interrupt routing and register accesses to
> work correctly on platforms where the master is not mapped to the
> default EE1 window.
> 
> In Shikra, the soundwire execution environment is set to 0 unlike other
> Qualcomm boards.
> 

Can we get this integration details dynamically.
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  drivers/soundwire/qcom.c | 78 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 65 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 3d8f5a81e..f4b8ff77b 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -26,6 +26,7 @@
>  #define SWRM_COMP_STATUS					0x014
>  #define SWRM_LINK_MANAGER_EE					0x018
>  #define SWRM_EE_CPU						1
> +#define SWRM_MAX_EE						1

Can we not make the EE_CPU dynamic and everything should fall in place?
isn't?

Is the register layout changed?

>  #define SWRM_FRM_GEN_ENABLED					BIT(0)
>  #define SWRM_VERSION_1_3_0					0x01030000
>  #define SWRM_VERSION_1_5_1					0x01050001
> @@ -118,6 +119,7 @@
>  #define SWRM_V2_0_CLK_CTRL					0x5060
>  #define SWRM_V2_0_CLK_CTRL_CLK_START				BIT(0)
>  #define SWRM_V2_0_LINK_STATUS					0x5064
> +#define SWRM_V2_REG_EE_STRIDE					0x1000
>  
>  #define SWRM_DP_PORT_CTRL_EN_CHAN_SHFT				0x18
>  #define SWRM_DP_PORT_CTRL_OFFSET2_SHFT				0x10
> @@ -202,6 +204,7 @@ struct qcom_swrm_ctrl {
>  	struct mutex port_lock;
>  	struct clk *hclk;
>  	int irq;
> +	u32 ee;
>  	unsigned int version;
>  	int wake_irq;
>  	int num_din_ports;
> @@ -222,6 +225,7 @@ struct qcom_swrm_ctrl {
>  	u32 slave_status;
>  	u32 wr_fifo_depth;
>  	bool clock_stop_not_supported;
> +	unsigned int reg_layout_local[SWRM_OFFSET_DP_SAMPLECTRL2_BANK + 1];
>  };
>  
>  struct qcom_swrm_data {
> @@ -328,6 +332,36 @@ static const struct qcom_swrm_data swrm_v3_0_data = {
>  };
>  #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
>  
> +static void qcom_swrm_set_ee_register_layout(struct qcom_swrm_ctrl *ctrl,
> +					     const struct qcom_swrm_data *data)
> +{
> +	int ee_offset;
> +
> +	memcpy(ctrl->reg_layout_local, data->reg_layout,
> +	       sizeof(ctrl->reg_layout_local));
> +	ctrl->reg_layout = ctrl->reg_layout_local;
> +
> +	if (ctrl->version < SWRM_VERSION_2_0_0)
> +		return;
> +
> +	/*
> +	 * Current register constants map EE1. For EE0, use the EE register
> +	 * window stride to access status/IRQ/FIFO registers.
> +	 */
> +	ee_offset = ((int)ctrl->ee - SWRM_EE_CPU) * SWRM_V2_REG_EE_STRIDE;
> +	if (!ee_offset)
> +		return;
> +
> +	ctrl->reg_layout_local[SWRM_REG_FRAME_GEN_ENABLED] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_STATUS] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_CLEAR] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_CPU_EN] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_WR_CMD] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_RD_CMD] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_STATUS] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_RD_FIFO_ADDR] += ee_offset;

Why not make these registers take the ee value rather then doing this way?


> +}
> +
>  static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
>  				  u32 *val)
>  {
> @@ -904,12 +938,13 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
>  
>  	if (ctrl->version == SWRM_VERSION_1_7_0) {
> -		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
> +		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
>  		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
> -				SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
> +				SWRM_MCP_BUS_CLK_START << ctrl->ee);
>  	} else if (ctrl->version >= SWRM_VERSION_2_0_0) {
> -		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
> -		ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL,
> +		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
> +		ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL +
> +				((int)ctrl->ee - SWRM_EE_CPU) * SWRM_V2_REG_EE_STRIDE,
>  				SWRM_V2_0_CLK_CTRL_CLK_START);
>  	} else {
>  		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
> @@ -935,11 +970,9 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
>  			0xFFFFFFFF);
>  
> -	/* enable CPU IRQs */
> -	if (ctrl->mmio) {
> -		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
> -				SWRM_INTERRUPT_STATUS_RMSK);
> -	}
> +	/* enable CPU IRQs for the selected EE window */
> +	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
> +			SWRM_INTERRUPT_STATUS_RMSK);
>  
>  	/* Set IRQ to PULSE */
>  	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
> @@ -1545,7 +1578,22 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	data = of_device_get_match_data(dev);
> +	ctrl->ee = SWRM_EE_CPU;
> +	ret = of_property_read_u32(dev->of_node, "qcom,swr-master-ee-val", &ctrl->ee);
> +	if (ret)
> +		ret = of_property_read_u32(dev->of_node, "qcom,ee", &ctrl->ee);
> +	if (ret)
> +		ctrl->ee = SWRM_EE_CPU;
> +	if (ctrl->ee > SWRM_MAX_EE) {
> +		dev_warn(dev, "invalid SoundWire EE %u, using EE%u\n",
> +			 ctrl->ee, SWRM_EE_CPU);
> +		ctrl->ee = SWRM_EE_CPU;
> +	}
>  	ctrl->max_reg = data->max_reg;
> +	/*
> +	 * Defer EE register window selection until HW version is known.
> +	 * For v2.0+ the IRQ/FIFO window is EE-banked.
> +	 */
>  	ctrl->reg_layout = data->reg_layout;
>  	ctrl->rows_index = sdw_find_row_index(data->default_rows);
>  	ctrl->cols_index = sdw_find_col_index(data->default_cols);
> @@ -1623,6 +1671,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	prop->default_row = data->default_rows;
>  
>  	ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &ctrl->version);
> +	qcom_swrm_set_ee_register_layout(ctrl, data);
>  
>  	ret = devm_request_threaded_irq(dev, ctrl->irq, NULL,
>  					qcom_swrm_irq_handler,
> @@ -1733,16 +1782,19 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
>  		reset_control_reset(ctrl->audio_cgcr);
>  
>  		if (ctrl->version == SWRM_VERSION_1_7_0) {
> -			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
> +			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
>  			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
> -					SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
> +					SWRM_MCP_BUS_CLK_START << ctrl->ee);
>  		} else if (ctrl->version >= SWRM_VERSION_2_0_0) {
> -			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
> -			ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL,
> +			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
> +			ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL +
> +					((int)ctrl->ee - SWRM_EE_CPU) *
> +					SWRM_V2_REG_EE_STRIDE,
>  					SWRM_V2_0_CLK_CTRL_CLK_START);
>  		} else {
>  			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
>  		}
> +
>  		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
>  			SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET);
>  


