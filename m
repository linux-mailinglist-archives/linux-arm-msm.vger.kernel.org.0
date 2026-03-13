Return-Path: <linux-arm-msm+bounces-97390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLL7CM/ds2ktcQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:50:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6369280CA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC7953032067
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596653563EF;
	Fri, 13 Mar 2026 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HPsUIKkz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BBF381AF2
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773395368; cv=none; b=AFCSRcCcMZRreec4JQuwnYq/VZZsLlW2Msg0F9XM5hcsgCPCS90qVdB52PtAVS44ffWZl4u6iqMjWbZ+PR7jdUKDrXNDnQryN56LOgLtp9kGnpX+oGdkRCpBBFjOr6V/xOecn1q3awyyCmMHi/JUUQF+xcH/d9qvlsjfILJBj/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773395368; c=relaxed/simple;
	bh=IwcaY8eaggeIn6MMtHGJ1IROj49OmXUpwa6sUyG68vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VycadYxwsSTLP3N+VV6o8D64u8smkTLFf3hwJRNKD53TQJ8+H7oCjx63cziYjEBWPATaxattSumPMUmDbicOWPn6Coo1OARH5BK/WG7/sS8qkk/nelxhdrVbPUFQf1h1w2m2XGqothwhDeAUPjaedHs6d4T3Wcnzy8jVApQ/VRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HPsUIKkz; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-661b08b04deso2201529a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773395365; x=1774000165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M8FS5yYGjX67AwqiomjlT3iHM2nG+cI6PJzSIUbSTVE=;
        b=HPsUIKkzS5xXndD/Mu6md4Myn8EJoc55Ws3BZlogUARhzhof1toQw+RAjE3ZVjb8cb
         tF87CBbgITMEEB48oxjljByJND1a2aOJbrYKHiDRQOsfPAmsYptw4oqpSwZkyt05W3RM
         DbgwGRkiX/Y+Q/o4trKFnRCbGGTo2xFPEQyW4gcxup8lby4mx3HPNi9Z8TOPiQaeb3JZ
         kyG3AeV+SflD+56TSLJxHY5F/5+KUGTCQBQ45+NxmahqUCsgoFSFdxzx+d9CbogbDfR8
         FLED8HhCVNTZpwEVappKHYmvCuTkxqVij6aA7E5VyM80MiNugQj1S73LZsa0VXvOo45B
         PjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773395365; x=1774000165;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M8FS5yYGjX67AwqiomjlT3iHM2nG+cI6PJzSIUbSTVE=;
        b=Ho5TbzwVMgNbkNhYVvQDFtj8L8SXgkRBYJtOu75b1prX1ys/vddR/8OuVCi7nYfauz
         jxr//HG6Cf9fA2M8v0Pi9VaJGSrJ1YHkCYC9qvxuXil1Ojm3uZYOSRCOILe/XzAkp1Rc
         eDpDlAlfXnqQGuMrEl6IusNKCz3HO1c2KacQMEh8XzBfjhf8U82QfvBOcLzaefr1gyfb
         SQ1/yc79P5Vfo4X77B8tnikAi/8mfeU6os/5xESkvuEPg506BlQsXTMW0pxGM19KS5h3
         zcf4ypY4whggEhNKDLk4ZhgoZuwTiKkbOTZOZDFyvJNMDDhyJEkOh/S1BdWV5xISGL6r
         LsRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSLOEyz8ClSHWCba26Ddf4DqfJ8/Gd+IPCcGe9P0FhHFPfMTLXHckVJA46UqISSG/99qiMhu4rbFDwvrtS@vger.kernel.org
X-Gm-Message-State: AOJu0YwJeS0u4GggGYr4KDFHvIgz7Vf675rKUiqt2r5vMqq0PIBrc45d
	OvVX7ER93nmKD2nNHifEqgl+XI6eMK93AMq1jxiauKSEIc7mumkj9bhJTz4hFKkaReszjqiNeHZ
	M8Bo1Af0=
X-Gm-Gg: ATEYQzyvr9bVjod+OLHgO+uuFfb44hyTW9fN9Q83HYYtpxgyrmT4MDCjqynXfxrjRN/
	t6HNZ/ojXV8dmJKMjkbRYNi6fXbCqRGx4ZMsWrULLL6MWaxLD4bfCjdPcBU8LmNalcX6A8yPlds
	mF1vt7/Ny5UC9bnGn5GY13YPdFdM8HTIBVHhjDBsJ2vW0T17p48UqTzhsaZ3781WD9w5MscyGOF
	E55ehMiFEWILOMJf6Es2IThvtJsraQD6wdbAqTn++U+yNn5EkjouENEb9QXAJ1s0+5NS+JISQXV
	m4gkekrbgeQo3ktUyTTQ+0FaNPgBaOuIFKzZtAAua0uFL+9cf/WQSnfnFFEhgJ06GTPPSSRVsw2
	5pAwgtD+4Ie6NRYmlqHUh3jVL70hxGcMfwwLqQfIXXimDL3C3oLIJcrDlZtwj+Myb2Bu1W1Oq6s
	mcM2swE4In/zo7qIVLTG3fH3ZcFEZEJRi/qDht
X-Received: by 2002:a17:907:7294:b0:b8a:f61a:edf2 with SMTP id a640c23a62f3a-b9765352458mr149879066b.50.1773395364637;
        Fri, 13 Mar 2026 02:49:24 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.176.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976d0b7722sm32825966b.66.2026.03.13.02.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 02:49:23 -0700 (PDT)
Message-ID: <e29545a0-ea31-446c-abec-866e3572c91b@linaro.org>
Date: Fri, 13 Mar 2026 09:49:22 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: qcom: camss: Add missing clocks for VFE lite
 on 8775p
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260313-vfelite_fix-v1-0-2ee7de00dee7@oss.qualcomm.com>
 <20260313-vfelite_fix-v1-2-2ee7de00dee7@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260313-vfelite_fix-v1-2-2ee7de00dee7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97390-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: B6369280CA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 09:42, Wenmeng Liu wrote:
> Add missing required clocks (cpas_ahb and camnoc_axi) for VFE lite
> instances on 8775p platform. These clocks are necessary for proper
> VFE lite operation:
> 
> Fixes: e7b59e1d06fb ("media: qcom: camss: Add support for VFE 690")
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 40 +++++++++++++++++++------------
>   1 file changed, 25 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 4a0bf8acd7645f8cd8c1b4cb9b6ff6f3a54d42e8..d325539defbecc7f4fbcb9d20fb69884e109a459 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3746,15 +3746,17 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
>   	/* VFE2 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
>   			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> -			   "vfe_lite"},
> +			   "vfe_lite", "camnoc_axi"},
>   		.clock_rate = {
> -			{ 0, 0, 0, 0  },
> +			{ 0 },
> +			{ 0 },
>   			{ 300000000, 400000000, 400000000, 400000000 },
>   			{ 400000000, 400000000, 400000000, 400000000 },
>   			{ 400000000, 400000000, 400000000, 400000000 },
>   			{ 480000000, 600000000, 600000000, 600000000 },
> +			{ 400000000 },
>   		},
>   		.reg = { "vfe_lite0" },
>   		.interrupt = { "vfe_lite0" },
> @@ -3769,15 +3771,17 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
>   	/* VFE3 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
>   			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> -			   "vfe_lite"},
> +			   "vfe_lite", "camnoc_axi"},
>   		.clock_rate = {
> -			{ 0, 0, 0, 0  },
> +			{ 0 },
> +			{ 0 },
>   			{ 300000000, 400000000, 400000000, 400000000 },
>   			{ 400000000, 400000000, 400000000, 400000000 },
>   			{ 400000000, 400000000, 400000000, 400000000 },
>   			{ 480000000, 600000000, 600000000, 600000000 },
> +			{ 400000000 },
>   		},
>   		.reg = { "vfe_lite1" },
>   		.interrupt = { "vfe_lite1" },
> @@ -3792,15 +3796,17 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
>   	/* VFE4 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
>   			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> -			   "vfe_lite"},
> +			   "vfe_lite", "camnoc_axi"},
>   		.clock_rate = {
> -			{ 0, 0, 0, 0  },
> +			{ 0 },
> +			{ 0 },
>   			{ 300000000, 400000000, 400000000, 400000000 },
>   			{ 400000000, 400000000, 400000000, 400000000 },
>   			{ 400000000, 400000000, 400000000, 400000000 },
>   			{ 480000000, 600000000, 600000000, 600000000 },
> +			{ 400000000 },
>   		},
>   		.reg = { "vfe_lite2" },
>   		.interrupt = { "vfe_lite2" },
> @@ -3815,15 +3821,17 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
>   	/* VFE5 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
>   			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> -			   "vfe_lite"},
> +			   "vfe_lite", "camnoc_axi"},
>   		.clock_rate = {
> -			{ 0, 0, 0, 0  },
> +			{ 0 },
> +			{ 0 },
>   			{ 300000000, 400000000, 400000000, 400000000 },
>   			{ 400000000, 400000000, 400000000, 400000000 },
>   			{ 400000000, 400000000, 400000000, 400000000 },
>   			{ 480000000, 600000000, 600000000, 600000000 },
> +			{ 400000000 },
>   		},
>   		.reg = { "vfe_lite3" },
>   		.interrupt = { "vfe_lite3" },
> @@ -3838,15 +3846,17 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
>   	/* VFE6 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
>   			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> -			   "vfe_lite"},
> +			   "vfe_lite", "camnoc_axi"},
>   		.clock_rate = {
> -			{ 0, 0, 0, 0  },
> +			{ 0 },
> +			{ 0 },
>   			{ 300000000, 400000000, 400000000, 400000000 },
>   			{ 400000000, 400000000, 400000000, 400000000 },
>   			{ 400000000, 400000000, 400000000, 400000000 },
>   			{ 480000000, 600000000, 600000000, 600000000 },
> +			{ 400000000 },
>   		},
>   		.reg = { "vfe_lite4" },
>   		.interrupt = { "vfe_lite4" },
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

