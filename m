Return-Path: <linux-arm-msm+bounces-117798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bSEwAritTmoYSQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 22:06:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF5472A16B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 22:06:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ieee.org header.s=google header.b=dMpcp9H3;
	dmarc=pass (policy=reject) header.from=ieee.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117798-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117798-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B4F23035173
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 20:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD8D3E0235;
	Wed,  8 Jul 2026 20:06:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1B9396D1C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 20:06:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783541171; cv=none; b=guaJyRnFN+XSggE977Rn9teciJpgSeHjL3Z8FZBZXOGuVkuB/t4pznPZwbx+6jeYSh1KlY3ap354T0dpecEEIkpgdp0CetSore24ZsjccFhvSJrjjG8PsOrsXK4KAxogGZ58RN0NOoqwzquGPW+8VUUDmUNHQndeYD+/M09ik+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783541171; c=relaxed/simple;
	bh=10bevXObiMTqkCsW5npB4KvOjMgk/AtfBmXN9oCZhjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLGTXQI2M3sRuq6gtXqquKtJOWKqHZ8kKPE2EnZEQiDH5sPwzgnIOdnHnityQQ7RrT4Th42P0HxPQmUt/MB8br8vHjXrCLTSvLLSQlTjfjwXKKzmGDG5xCXt2R8Th2N+fuqrmBlFO+SxqOkY1iuZFuCBzG8trzp5hZE1EdGTdPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=dMpcp9H3; arc=none smtp.client-ip=209.85.222.175
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-920f33347f5so59513885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 13:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1783541168; x=1784145968; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pRWa9iMqypNRz6lCByjP7aDHCvn8i9o4BkJQoVsXA7g=;
        b=dMpcp9H3KqMD2nib5rL9Gp6H+NeYXHG3Y2yltldpmM31t3LXU14V51DVA+lEfNo+rh
         TfOhMNE9Bfy5AkTGoYxK4tjXmdN/vaQTu2P9t9KTAZP+OllAVTF5L09diqdAtxpnCSG+
         YwGZ8ye2s3CHOE3qLmlimU8CTOwU3M7tEalAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783541168; x=1784145968;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRWa9iMqypNRz6lCByjP7aDHCvn8i9o4BkJQoVsXA7g=;
        b=stc8haVyxSXWwlfdRnT99PsFida4Lhf9RPfZZxHznzuuPXj/WoRsSbUSUC4Nvmpr+p
         k7HDdvNgLCXU4LLDLoUFDH6SD8JrVhJbu95cFvYY5oBbz5LcdKJ7uJbhfJSADjJ4m6SR
         kxoZucCw4ZW6mINDLJno5IIMun8UPlJPTZqdodOcPIIIHOCVBUEEIG/iVe9Dmvkj0ntg
         nekUA7ZILbdKUFDTW2WM8xM+6BlVHNdQhqwDoEtWl4o/mQoUsspizg+0lDHMK6BtmJY0
         IEWVsslZhat3501kuLKonb4vYQGNmx0fI4G4ex8v/GLvlkNLfNR7h4HW3QDWk48itTt1
         pm7Q==
X-Gm-Message-State: AOJu0YzN9rFtS+XoWh/MbMRh01kRq2t3/UHMsJWab5+y9SrmZ2c3l5+i
	ovq4MbIrDO+1vDMEGt3wiQ1yZSSDP1BgEKbu4Q4bs5vj3N3icCEWZ+P+RCXm1FBpUA==
X-Gm-Gg: AfdE7clRkLOvXMngD1dkGM2ALgpJuTO6Vjmm1wy36HpyqNcbotjBuj6d65NuBL+BAoZ
	LN0H4iflEwuZQakz5HdI5FCFbRVh8eZPzvaHmVJkCEhkWXZnR6iej60BHF8U/mlSrUdO+hFwLuN
	6aPAgRWacsN5Y3AxmK70ysiKxs0AYEb8FH3FxwKH2mAqLrJ8KVgOOre5D6769/LWR+OG2nywYB6
	Y/K3lSBsuwkyLNSoVThxnOwi7++3kFR7/18U6zeDqpA9SKvkbIK/IiNEuqNGOBk+e75BkXQzvbS
	nAkLLk+U56Atm+8765W8mvkJl12R9E5bc1ZugeLqtMs7+jRRY7pYvokzkGzVSXzYBi/jpMTwzZa
	2XeMo8E2QLZfc6OMTZz91cjC88DRGPFfMl7CSsyazneSUDXZJbJhjBOmXqoYwmKqsRldYQ1hg2H
	kUo1SVP+o=
X-Received: by 2002:a05:620a:84c1:b0:915:cda5:27fa with SMTP id af79cd13be357-92ecf8ead95mr410140085a.58.1783541167220;
        Wed, 08 Jul 2026 13:06:07 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-92e90cfe34dsm1532151985a.46.2026.07.08.13.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 13:06:05 -0700 (PDT)
Message-ID: <b810c574-0f60-4d3d-ad5a-4205a119fe00@ieee.org>
Date: Wed, 8 Jul 2026 15:06:04 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] net: ipa: Add IPA v5.1 data
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me>
 <20260622-sm8450-ipa-v1-3-532f0299f96e@proton.me>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20260622-sm8450-ipa-v1-3-532f0299f96e@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,reject];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117798-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[elder@ieee.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:elder@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ieee.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@ieee.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,proton.me:email,codelinaro.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ieee.org:from_mime,ieee.org:dkim,ieee.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ADF5472A16B

On 6/22/26 8:44 PM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Add the required ipa_data-v5.1.c file for IPA v5.1 along with changes
> that declare IPA v5.1 support.
> This version of IPA is used in both SM8450 and SM8475 SoCs.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>

OK I'm finally reviewing this.  Thank you again for sharing links to
the resources you used and developed while doing this work.


For the most part this looks entirely correct.  There is one
pair of memory table entries that I think should not be there,
otherwise everything looks just about perfect.

I'm not totally sure that reducing the SMEM size will work
correctly.


I'm taking this opportunity to explain a LOT of things about
IPA and the driver code.  It's much more than what's typical
for a review, but I thought this provided a good chance to
explain some things in context.  You can add it to your notes
file if you like...

> ---
>   drivers/net/ipa/Makefile             |   2 +-
>   drivers/net/ipa/data/ipa_data-v5.1.c | 477 +++++++++++++++++++++++++++++++++++
>   drivers/net/ipa/gsi_reg.c            |   1 +
>   drivers/net/ipa/ipa_data.h           |   1 +
>   drivers/net/ipa/ipa_main.c           |   4 +
>   drivers/net/ipa/ipa_reg.c            |   1 +
>   6 files changed, 485 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ipa/Makefile b/drivers/net/ipa/Makefile
> index e148ec3c1a10..d4995c2e8ca0 100644
> --- a/drivers/net/ipa/Makefile
> +++ b/drivers/net/ipa/Makefile
> @@ -7,7 +7,7 @@ IPA_REG_VERSIONS	:=	3.1 3.5.1 4.2 4.5 4.7 4.9 4.11 5.0 5.5
>   # Some IPA versions can reuse another set of GSI register definitions.
>   GSI_REG_VERSIONS	:=	3.1 3.5.1 4.0 4.5 4.9 4.11 5.0
>   
> -IPA_DATA_VERSIONS	:=	3.1 3.5.1 4.2 4.5 4.7 4.9 4.11 5.0 5.2 5.5
> +IPA_DATA_VERSIONS	:=	3.1 3.5.1 4.2 4.5 4.7 4.9 4.11 5.0 5.1 5.2 5.5
>   
>   obj-$(CONFIG_QCOM_IPA)	+=	ipa.o
>   
> diff --git a/drivers/net/ipa/data/ipa_data-v5.1.c b/drivers/net/ipa/data/ipa_data-v5.1.c
> new file mode 100644
> index 000000000000..85b21efa1224
> --- /dev/null
> +++ b/drivers/net/ipa/data/ipa_data-v5.1.c
> @@ -0,0 +1,477 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/* Copyright (C) 2023-2024 Linaro Ltd. */
> +/* Copyright (C) 2026 Esteban Urrutia <esteuwu@proton.me> */
> +
> +#include <linux/array_size.h>
> +#include <linux/log2.h>
> +
> +#include "../ipa_data.h"
> +#include "../ipa_endpoint.h"
> +#include "../ipa_mem.h"
> +#include "../ipa_version.h"
> +
> +/** enum ipa_resource_type - IPA resource types for an SoC having IPA v5.1 */
> +enum ipa_resource_type {
> +	/* Source resource types; first must have value 0 */
> +	IPA_RESOURCE_TYPE_SRC_PKT_CONTEXTS		= 0,
> +	IPA_RESOURCE_TYPE_SRC_DESCRIPTOR_LISTS,
> +	IPA_RESOURCE_TYPE_SRC_DESCRIPTOR_BUFF,
> +	IPA_RESOURCE_TYPE_SRC_HPS_DMARS,
> +	IPA_RESOURCE_TYPE_SRC_ACK_ENTRIES,
> +
> +	/* Destination resource types; first must have value 0 */
> +	IPA_RESOURCE_TYPE_DST_DATA_SECTORS		= 0,
> +	IPA_RESOURCE_TYPE_DST_DPS_DMARS,
> +	IPA_RESOURCE_TYPE_DST_ULSO_SEGMENTS,
> +};

The above looks correct to me.  They come from downstream
"ipa_utils.c", in the ipa3_rsrc_src_grp_config[IPA_5_1][][]
array and the ipa3_rsrc_dst_grp_config[IPA_5_1][][] array.

The *_SRC_* symbols are the index values used in the
ipa_resource_src[] array upstream, and the *_DST_* symbols
are indexes in the upstream ipa_resource_dst[] array.

> +/* Resource groups used for an SoC having IPA v5.1 */
> +enum ipa_rsrc_group_id {
> +	/* Source resource group identifiers */
> +	IPA_RSRC_GROUP_SRC_UL				= 0,
> +	IPA_RSRC_GROUP_SRC_DL,
> +	IPA_RSRC_GROUP_SRC_UNUSED_2,
> +	IPA_RSRC_GROUP_SRC_UNUSED_3,
> +	IPA_RSRC_GROUP_SRC_URLLC,
> +	IPA_RSRC_GROUP_SRC_U_RX_QC,
> +	IPA_RSRC_GROUP_SRC_COUNT,	/* Last in set; not a source group */
> +
> +	/* Destination resource group identifiers */
> +	IPA_RSRC_GROUP_DST_UL				= 0,
> +	IPA_RSRC_GROUP_DST_DL,
> +	IPA_RSRC_GROUP_DST_UNUSED_2,
> +	IPA_RSRC_GROUP_DST_UNUSED_3,
> +	IPA_RSRC_GROUP_DST_UNUSED_4,
> +	IPA_RSRC_GROUP_DST_UC,
> +	IPA_RSRC_GROUP_DST_DRB_IP,
> +	IPA_RSRC_GROUP_DST_COUNT,	/* Last; not a destination group */
> +};

These look correct.  They correspond to the second index values
in the downstream arrays mentioned earlier, and are used as
indexes into the limits[] array within an ipa_resource structure.

As you probably now know, the symbols correspond to these comments
in the downstream code:
                 /* UL  DL  unused  unused  URLLC UC_RX_Q N/A */
                 /* UL  DL  unused  unused unused  UC_RX_Q DRBIP N/A */
> +/* QSB configuration data for an SoC having IPA v5.1 */
> +static const struct ipa_qsb_data ipa_qsb_data[] = {
> +	[IPA_QSB_MASTER_DDR] = {
> +		.max_writes		= 0,
> +		.max_reads		= 0,	/* no limit (hardware max) */
> +		.max_reads_beats	= 0,
> +	},
> +	[IPA_QSB_MASTER_PCIE] = {
> +		.max_writes		= 0,
> +		.max_reads		= 0,	/* no limit (hardware max) */
> +		.max_reads_beats	= 0,
> +	},
> +};

I think the DDR values might be wrong, but it's difficult to be
sure.  In some cases, in arrays like this in the downstream code,
if there is no entry found in an array, the *earlier* version
values should be used.  (Unless someone better informed states
that this is wrong, I think it's fine as-is.)

This information is found in the ipa3_qmb_outstanding[IPA_5_1][]
array in the downstream code.  However there is no entry for that
version.  Given that, all zeroes (as you have it) makes sense.
But it's possible this applies instead:

         [IPA_5_0][IPA_QMB_INSTANCE_DDR]         = {12, 12, 0},
         [IPA_5_0][IPA_QMB_INSTANCE_PCIE]        = {0, 0, 0},

I have no way of knowing; perhaps someone from Qualcomm can
get confirmation that all zeroes is correct.

(Note the order of values presented in the downstream code
differs from upstream.)



Most of the information in the structure below comes from the
ipa3_ep_mapping[IPA_V5_1][] array in the downstream code.
Many of the entries in that array are unused in the upstream
code, because we only use a small subset of the available
endpoints.

> +/* Endpoint configuration data for an SoC having IPA v5.1 */
> +static const struct ipa_gsi_endpoint_data ipa_gsi_endpoint_data[] = {
> +	[IPA_ENDPOINT_AP_COMMAND_TX] = {

IPA_ENDPOINT_AP_COMMAND_TX corresponds to IPA_CLIENT_APPS_CMD_PROD
in the downstream code.  The downstream code doesn't label the
assignments within the ipa3_ep_mapping[][] array, so I think it's
a little harder to understand.  Anyway I'll show how they map
between downstream and upstream below.

The downstream structure is named ipa_ep_configuration.  The
upstream structure is named ipa_gsi_endpoint_data.

struct ipa_ep_configuration {
         bool valid;
         int group_num;
         bool support_flt;
         int sequencer_type;
         u8 qmb_master_sel;
         struct ipa_gsi_ep_config ipa_gsi_ep_info;
         u8 tx_instance;
};

And although ipa_gsi_ep_config is not defined in this code
base, here is what it looks like:

struct ipa_gsi_ep_config {
         int ipa_ep_num;
         int ipa_gsi_chan_num;
         int ipa_if_tlv;
         int ipa_if_aos;
         int ee;
         enum gsi_prefetch_mode prefetch_mode;
         uint8_t prefetch_threshold;
};

This might not be current; I'm using code found here:
   https://git.codelinaro.org/clo/la/kernel/msm-5.15.git


Here is the upstream structure, and I indicate where the
information comes from in the downstream code:

struct ipa_gsi_endpoint_data {
         u8 ee_id;	/* ipa_ep_configuration->ee */
         u8 channel_id;  /* ipa_ep_configuration->ipa_gsi_chan_num */
         u8 endpoint_id;	/* ipa_ep_configuration->ipa_ep_num */
         bool toward_ipa;

         struct gsi_channel_data channel;
         struct ipa_endpoint_data endpoint;
};

And here is the first sub-structure:

struct gsi_channel_data {
         u16 tre_count;	/* Computed based on other code (see below) */
         u16 event_count;
         u8 tlv_count;	/* ipa_ep_configuration->ipa_if_tlv */
};

> +		.ee_id		= GSI_EE_AP,

This is the "execution environment" that the endpoint is
associated with.  For upstream, that's either the AP or
the modem.  The "_AP_" sitting where it does in the
IPA_ENDPOINT_AP_COMMAND_TX endpoint ID also indicates
this is an AP endpoint.  It also matches what's seen
in the downstream ipa_gsi_ep_config->ee field.

> +		.channel_id	= 12,
> +		.endpoint_id	= 14,
> +		.toward_ipa	= true,
> +		.channel = {
> +			.tre_count	= 256,
> +			.event_count	= 256,
> +			.tlv_count	= 20,

The tre_count number was derived from code in ipa3_setup_apps_pipes()
in downstream "ipa/ipa_v3/ipa.c".  There a ipa_sys_connect_params
structure contains a field desc_fifo_size, which is the size in bytes
of the transfer ring buffer.  The tre_count in upsteram code is in
units of a TRE (transfer ring element), i.e. it's the number of such
entries (that fit in that number of bytes).

The downstream IPA_CLIENT_APPS_CMD_PROD corresponds to upstream
IPA_ENDPOINT_AP_COMMAND_TX (the array entry we're in the middle
of here), and the downstream size is IPA_SYS_DESC_FIFO_SZ, or
0x800=2048 bytes.  Each TRE (struct gsi_tre) is 16 bytes.

In the downstream code--confusingly--ipa_gsi_setup_channel()
doubles the desc_fifo_sz value (for GSI, versus the older BAM
interface).  So the ring size becomes 4096 bytes, and that
works out to 256 16-byte GSI TRE entries.  I'm not sure why
512 is used for IPA v3.5.1, but it probably just means it's
bigger than it needs to be.

The event_count should be the same as the tre_count.  Again
I no longer know why that's not the case for IPA v3.5.1.


> +		},

Below is the second sub-structure in the upstream structure
ipa_gsi_endpoint_data, and the other structures it
incorporates.

struct ipa_endpoint_data {
         bool filter_support;
         struct ipa_endpoint_config config;
};

struct ipa_endpoint_config {
         u32 resource_group;
         bool checksum;
         bool qmap;
         bool aggregation;
         bool status_enable;
         bool dma_mode;
         enum ipa_endpoint_name dma_endpoint;
         union {
                 struct ipa_endpoint_tx tx;
                 struct ipa_endpoint_rx rx;
         };
};

struct ipa_endpoint_tx {
         enum ipa_seq_type seq_type;
         enum ipa_seq_rep_type seq_rep_type;
         enum ipa_endpoint_name status_endpoint;
};

struct ipa_endpoint_rx {
         u32 buffer_size;
         u32 pad_align;
         u32 aggr_time_limit;
         bool aggr_hard_limit;
         bool aggr_close_eof;
         bool holb_drop;
};

> +		.endpoint = {
> +			.config = {
> +				.resource_group	= IPA_RSRC_GROUP_SRC_UL,

This resource group corresponds to IPA_v5_0_GROUP_UL in
the downstream code.

> +				.dma_mode	= true,

The dma_mode is always true for the AP->IPA command TX
endpoint, false for others.

> +				.dma_endpoint	= IPA_ENDPOINT_AP_LAN_RX,

This is always the DMA endpoint id for the command
endpoint. I think it's where the status messages
related to transmitted commands get sent.  The AP<-LAN
(RX) endpoint is the "default" endpoint.

> +				.tx = {
> +					.seq_type = IPA_SEQ_DMA,

This is the sequencer type, always DMA for the command
endpoint.  The sequencer types are set based on what the
downstream code does.

> +				},
> +			},
> +		},
> +	},
> +	[IPA_ENDPOINT_AP_LAN_RX] = {

This is the default RX endpoint on the AP.  If a LAN
interface were supported it would also be the RX
endpoint for the LAN.  This corresponds to
IPA_CLIENT_APPS_LAN_CONS

> +		.ee_id		= GSI_EE_AP,
> +		.channel_id	= 13,
> +		.endpoint_id	= 16,
> +		.toward_ipa	= false,
> +		.channel = {
> +			.tre_count	= 256,
> +			.event_count	= 256,
> +			.tlv_count	= 9,
> +		},
> +		.endpoint = {
> +			.config = {
> +				.resource_group	= IPA_RSRC_GROUP_DST_UL,
> +				.aggregation	= true,

Aggregation enabled means multiple received messages will
be placed by the IPA hardware into a single receive buffer
before forwarding the buffer to the host for processing.

> +				.status_enable	= true,

This setting means every transfer causes a status header to be
generated for each received message.  ipa_endpoint_status_parse()
splits them apart using information in the status header and
hands each de-aggregated message to the network stack.

> +				.rx = {
> +					.buffer_size	= 8192,

Each receive buffer is this big (in bytes).

> +					.pad_align	= ilog2(sizeof(u32)),

Before a received message is placed in the receive buffer,
IPA updates current buffer pointer to be aligned to this
boundary (in this case, 2^2 bytes).

> +					.aggr_time_limit = 500,

If aggregation hasn't exhausted the receive buffer in this many
microseconds, it forwards the buffer to the host anyway.

The time limit comes from IPA_GENERIC_AGGR_TIME_LIMIT in the
downstream code.

> +				},
> +			},
> +		},
> +	},
> +	[IPA_ENDPOINT_AP_MODEM_TX] = {

The AP_MODEM_TX here says that this is an AP endpoint,
whose destination is the modem (WAN in the downstream
code), and it is a TX endpoint (from the AP to the modem).
This corresponds to IPA_CLIENT_APPS_WAN_PROD.

> +		.ee_id		= GSI_EE_AP,
> +		.channel_id	= 11,
> +		.endpoint_id	= 2,
> +		.toward_ipa	= true,
> +		.channel = {
> +			.tre_count	= 512,
> +			.event_count	= 512,
> +			.tlv_count	= 25,
> +		},
> +		.endpoint = {
> +			.filter_support	= true,
> +			.config = {
> +				.resource_group	= IPA_RSRC_GROUP_SRC_UL,
> +				.checksum       = true,

The checksum true flag means IPA performs checksumming
on messages being sent (so the host doesn't have to).

> +				.qmap		= true,

The qmap true flag says that this channel uses QMAP
protocol (ETH_P_MAP).  A single message contains one
or more QMAP messages, which multiplexes multiple
logical channels over a single connection.

> +				.status_enable	= true,
> +				.tx = {
> +					.seq_type = IPA_SEQ_2_PASS_SKIP_LAST_UC,
> +					.status_endpoint =
> +						IPA_ENDPOINT_MODEM_AP_RX,

This says that status messages generated as a result
of messages received on this channel (i.e., using
this endpoint) are delivered to the *modem* endpoint
that recieves data from the AP.

> +				},
> +			},
> +		},
> +	},
> +	[IPA_ENDPOINT_AP_MODEM_RX] = {

AP endpoint, *from* the modem.  This corresponds to
IPA_CLIENT_APPS_WAN_CONS.

> +		.ee_id		= GSI_EE_AP,
> +		.channel_id	= 1,
> +		.endpoint_id	= 23,
> +		.toward_ipa	= false,
> +		.channel = {
> +			.tre_count	= 256,
> +			.event_count	= 256,
> +			.tlv_count	= 9,
> +		},
> +		.endpoint = {
> +			.config = {
> +				.resource_group	= IPA_RSRC_GROUP_DST_UL,
> +				.checksum       = true,
> +				.qmap		= true,
> +				.aggregation	= true,
> +				.rx = {
> +					.buffer_size	= 8192,
> +					.aggr_time_limit = 500,
> +					.aggr_close_eof	= true,

The aggr_close_eof flag determines which of two ways
aggregation in a receive buffer "closes".  (Closing
means th receive buffer is delivered to the host for
processing, and a new receive buffer begins to be
used.)

One policy closes aggregation when there is not enough
space left to hold an entire incoming message in the
buffer.  The other policy closes aggregation when the
data from a received message crosses a certain mark
(byte count) in the receive buffer.  (I no longer
recall which is which.)

> +				},
> +			},
> +		},
> +	},
> +	[IPA_ENDPOINT_MODEM_AP_TX] = {

Modem endpoint, transmitting (from the modem) *to* the AP.
Downstream calls the modem "Q6".  Configuring these endpoints
is the modem's responsibility, but the AP IPA driver needs
to be aware of these, so they're included in this data.
(I don't remember why; maybe it's to ensure endpoints and
channels are accounted for, and/or not reused?)

This endpoint id corresponds to IPA_CLIENT_Q6_WAN_CONS.

> +		.ee_id		= GSI_EE_MODEM,
> +		.channel_id	= 0,
> +		.endpoint_id	= 12,
> +		.toward_ipa	= true,
> +		.endpoint = {
> +			.filter_support	= true,
> +		},
> +	},
> +	[IPA_ENDPOINT_MODEM_AP_RX] = {

This corresponds to IPA_CLIENT_Q6_WAN_CONS.

> +		.ee_id		= GSI_EE_MODEM,
> +		.channel_id	= 7,
> +		.endpoint_id	= 21,
> +		.toward_ipa	= false,
> +	},
> +	[IPA_ENDPOINT_MODEM_DL_NLO_TX] = {

This has to do with a feature we don't use, but we still
need to configure it (I think so we take into account that
it implements filtering).  This endpoint corresponds to
IPA_CLIENT_Q6_DL_NLO_DATA_PROD.

> +		.ee_id		= GSI_EE_MODEM,
> +		.channel_id	= 2,
> +		.endpoint_id	= 15,
> +		.toward_ipa	= true,
> +		.endpoint = {
> +			.filter_support	= true,
> +		},
> +	},
> +};
"Resources" are data structures managed by the IPA/GSI
firmware.  We must configure these at initialization
time, and once configured, that firmware operates
using these resources.  I don't know much more than
that, and basically we just configure things the way
the downstream code does.

> +
> +/* Source resource configuration data for an SoC having IPA v5.1 */
> +static const struct ipa_resource ipa_resource_src[] = {

Again, this array is filled with information that comes from the
ipa3_rsrc_src_grp_config[IPA_5_1][][] array in the downstream
code, in "ipa_utils.c".  Everything you have here looks correct.

> +	[IPA_RESOURCE_TYPE_SRC_PKT_CONTEXTS] = {
> +		.limits[IPA_RSRC_GROUP_SRC_UL] = {
> +			.min = 7,	.max = 12,
> +		},
> +		.limits[IPA_RSRC_GROUP_SRC_URLLC] = {
> +			.min = 1,	.max = 63,
> +		},
> +		.limits[IPA_RSRC_GROUP_SRC_U_RX_QC] = {
> +			.min = 0,	.max = 63,
> +		},
> +	},
> +	[IPA_RESOURCE_TYPE_SRC_DESCRIPTOR_LISTS] = {
> +		.limits[IPA_RSRC_GROUP_SRC_UL] = {
> +			.min = 21,	.max = 21,
> +		},
> +		.limits[IPA_RSRC_GROUP_SRC_URLLC] = {
> +			.min = 10,	.max = 10,
> +		},
> +	},
> +	[IPA_RESOURCE_TYPE_SRC_DESCRIPTOR_BUFF] = {
> +		.limits[IPA_RSRC_GROUP_SRC_UL] = {
> +			.min = 33,	.max = 33,
> +		},
> +		.limits[IPA_RSRC_GROUP_SRC_URLLC] = {
> +			.min = 20,	.max = 20,
> +		},
> +	},
> +	[IPA_RESOURCE_TYPE_SRC_HPS_DMARS] = {
> +		.limits[IPA_RSRC_GROUP_SRC_UL] = {
> +			.min = 0,	.max = 63,
> +		},
> +		.limits[IPA_RSRC_GROUP_SRC_URLLC] = {
> +			.min = 1,	.max = 63,
> +		},
> +		.limits[IPA_RSRC_GROUP_SRC_U_RX_QC] = {
> +			.min = 0,	.max = 63,
> +		},
> +	},
> +	[IPA_RESOURCE_TYPE_SRC_ACK_ENTRIES] = {
> +		.limits[IPA_RSRC_GROUP_SRC_UL] = {
> +			.min = 38,	.max = 38,
> +		},
> +		.limits[IPA_RSRC_GROUP_SRC_URLLC] = {
> +			.min = 16,	.max = 16,
> +		},
> +	},
> +};
> +
> +/* Destination resource configuration data for an SoC having IPA v5.1 */
> +static const struct ipa_resource ipa_resource_dst[] = {

And the content of this array comes from ipa3_rsrc_dst_grp_config[][].
Everything you have here looks correct as well.

> +	[IPA_RESOURCE_TYPE_DST_DATA_SECTORS] = {
> +		.limits[IPA_RSRC_GROUP_DST_UL] = {
> +			.min = 6,	.max = 6,
> +		},
> +		.limits[IPA_RSRC_GROUP_DST_DL] = {
> +			.min = 5,	.max = 5,
> +		},
> +		.limits[IPA_RSRC_GROUP_DST_DRB_IP] = {
> +			.min = 39,	.max = 39,
> +		},
> +	},
> +	[IPA_RESOURCE_TYPE_DST_DPS_DMARS] = {
> +		.limits[IPA_RSRC_GROUP_DST_UL] = {
> +			.min = 0,	.max = 3,
> +		},
> +		.limits[IPA_RSRC_GROUP_DST_DL] = {
> +			.min = 0,	.max = 3,
> +		},
> +	},
> +	[IPA_RESOURCE_TYPE_DST_ULSO_SEGMENTS] = {
> +		.limits[IPA_RSRC_GROUP_DST_UL] = {
> +			.min = 0,	.max = 63,
> +		},
> +		.limits[IPA_RSRC_GROUP_DST_DL] = {
> +			.min = 0,	.max = 63,
> +		},
> +	},
> +};
> +
> +/* Resource configuration data for an SoC having IPA v5.1 */
> +static const struct ipa_resource_data ipa_resource_data = {
> +	.rsrc_group_dst_count	= IPA_RSRC_GROUP_DST_COUNT,
> +	.rsrc_group_src_count	= IPA_RSRC_GROUP_SRC_COUNT,
> +	.resource_src_count	= ARRAY_SIZE(ipa_resource_src),
> +	.resource_src		= ipa_resource_src,
> +	.resource_dst_count	= ARRAY_SIZE(ipa_resource_dst),
> +	.resource_dst		= ipa_resource_dst,
> +};
> +
> +/* IPA-resident memory region data for an SoC having IPA v5.1 */

Memory regions are sort of similar to resources, in that
there are ranges of available (IPA-local) memory that are
used by IPA for various purposes.  We need to configure
these, and this configuration (base and size of various
memory regions) is shared with the modem via a QMI message
exchange during initialization.

> +static const struct ipa_mem ipa_mem_local_data[] = {

IPA has local memory that is partitioned as defined by this
array.  The regions are used by IPA/GSI firmware and/or
hardware.  The configuration defined here is sent to
the modem in an ipa_init_modem_driver_req QMI message
so both the modem and AP have a consistent view of
how the memory is used.

Many memory regions are preceded by 0-2 "canaries", which
are 32-byte values initialized to IPA_MEM_CANARY_VAL.

In the downstream code there is structure ipa3_mem_partition
that defines these things, and structures of this type are
defined in "ipa_utils.c".  For IPA v5.1, ipa_5_1_mem_part
defines them all.  The mapping between downstream and
upstream is not trivial and direct, but it should be
obvious how they get translated.


With two exceptions, what I see here looks like you
correctly transferred everything.  (The two exceptions
are entries that from what I can tell, should not be
present.)

> +	{
> +		.id		= IPA_MEM_UC_EVENT_RING,
> +		.offset		= 0x0000,
> +		.size		= 0x1000,
> +		.canary_count	= 0,
> +	},
> +	{
> +		.id		= IPA_MEM_UC_SHARED,
> +		.offset		= 0x1000,
> +		.size		= 0x0080,
> +		.canary_count	= 0,
> +	},
> +	{
> +		.id		= IPA_MEM_UC_INFO,
> +		.offset		= 0x1080,
> +		.size		= 0x0200,
> +		.canary_count	= 0,
> +	},
> +	{
> +		.id		= IPA_MEM_V4_FILTER_HASHED,
> +		.offset		= 0x1288,
> +		.size		= 0x0078,
> +		.canary_count	= 2,
> +	},
> +	{
> +		.id		= IPA_MEM_V4_FILTER,
> +		.offset		= 0x1308,
> +		.size		= 0x0078,
> +		.canary_count	= 2,
> +	},
> +	{
> +		.id		= IPA_MEM_V6_FILTER_HASHED,
> +		.offset		= 0x1388,
> +		.size		= 0x0078,
> +		.canary_count	= 2,
> +	},
> +	{
> +		.id		= IPA_MEM_V6_FILTER,
> +		.offset		= 0x1408,
> +		.size		= 0x0078,
> +		.canary_count	= 2,
> +	},
> +	{
> +		.id		= IPA_MEM_V4_ROUTE_HASHED,
> +		.offset		= 0x1488,
> +		.size		= 0x0098,
> +		.canary_count	= 2,
> +	},
> +	{
> +		.id		= IPA_MEM_V4_ROUTE,
> +		.offset		= 0x1528,
> +		.size		= 0x0098,
> +		.canary_count	= 2,
> +	},
> +	{
> +		.id		= IPA_MEM_V6_ROUTE_HASHED,
> +		.offset		= 0x15c8,
> +		.size		= 0x0098,
> +		.canary_count	= 2,
> +	},
> +	{
> +		.id		= IPA_MEM_V6_ROUTE,
> +		.offset		= 0x1668,
> +		.size		= 0x0098,
> +		.canary_count	= 2,
> +	},
> +	{
> +		.id		= IPA_MEM_MODEM_HEADER,
> +		.offset		= 0x1708,
> +		.size		= 0x0240,
> +		.canary_count	= 2,
> +	},
> +	{
> +		.id		= IPA_MEM_AP_HEADER,
> +		.offset		= 0x1948,
> +		.size		= 0x01e0,
> +		.canary_count	= 0,
> +	},
> +	{
> +		.id		= IPA_MEM_MODEM_PROC_CTX,
> +		.offset		= 0x1b40,
> +		.size		= 0x0b20,
> +		.canary_count	= 2,
> +	},
> +	{
> +		.id		= IPA_MEM_AP_PROC_CTX,
> +		.offset		= 0x2660,
> +		.size		= 0x0200,
> +		.canary_count	= 0,
> +	},
> +	{
> +		.id		= IPA_MEM_STATS_QUOTA_MODEM,
> +		.offset		= 0x2868,
> +		.size		= 0x0060,
> +		.canary_count	= 2,
> +	},
> +	{
> +		.id		= IPA_MEM_STATS_QUOTA_AP,
> +		.offset		= 0x28c8,
> +		.size		= 0x0048,
> +		.canary_count	= 0,
> +	},
> +	{
> +		.id		= IPA_MEM_STATS_TETHERING,
> +		.offset		= 0x2910,
> +		.size		= 0x03c0,
> +		.canary_count	= 0,
> +	},

The next two entries look wrong to me.  Can you explain where
you got these offsets and sizes?  Is it from "ipa_data-v5.0.c"?

Here are the relevant entries I see in ipa_5_1_mem_part
in the downstream code:
         .stats_flt_v4_ofst = 0,
         .stats_flt_v4_size = 0,
         .stats_flt_v6_ofst = 0,
         .stats_flt_v6_size = 0,
         .stats_rt_v4_ofst = 0,
         .stats_rt_v4_size = 0,
         .stats_rt_v6_ofst = 0,
         .stats_rt_v6_size = 0,
(Since their size is zero, their entries can be omitted.)

> +	{
> +		.id		= IPA_MEM_AP_V4_FILTER,
> +		.offset		= 0x29b8,
> +		.size		= 0x0188,
> +		.canary_count	= 2,
> +	},
> +	{
> +		.id		= IPA_MEM_AP_V6_FILTER,
> +		.offset		= 0x2b40,
> +		.size		= 0x0228,
> +		.canary_count	= 0,
> +	},

The remaining entries (below) look good.

> +	{
> +		.id		= IPA_MEM_STATS_FILTER_ROUTE,
> +		.offset		= 0x2cd0,
> +		.size		= 0x0ba0,
> +		.canary_count	= 2,
> +	},
> +	{
> +		.id		= IPA_MEM_STATS_DROP,
> +		.offset		= 0x3870,
> +		.size		= 0x0020,
> +		.canary_count	= 0,
> +	},
> +	{
> +		.id		= IPA_MEM_MODEM,
> +		.offset		= 0x3898,
> +		.size		= 0x0d48,
> +		.canary_count	= 2,
> +	},
> +	{
> +		.id		= IPA_MEM_NAT_TABLE,
> +		.offset		= 0x45e0,
> +		.size		= 0x0900,
> +		.canary_count	= 0,
> +	},
> +	{
> +		.id		= IPA_MEM_PDN_CONFIG,
> +		.offset		= 0x4ee8,
> +		.size		= 0x0100,
> +		.canary_count	= 2,
> +	},
> +};
> +
> +/* Memory configuration data for an SoC having IPA v5.1 */
> +static const struct ipa_mem_data ipa_mem_data = {
> +	.local_count	= ARRAY_SIZE(ipa_mem_local_data),
> +	.local		= ipa_mem_local_data,
> +	.imem_addr	= 0x146a8000,

I think I needed to look up the imem offset value
in Qualcomm documentation I no longer have access
to.  Perhaps someone from there could confirm you
are using the right values here.

> +	.imem_size	= 0x00002000,
> +	/*
> +	 * While this value is 0xb000 on SM8450 and 0x9000 on SM8475,
> +	 * it has been left set to 0x9000 for compatibility with SM8475
> +	 */

As I said earlier, I'm not completely sure this will still
work on the SM8450.  Someone should confirm this, and it
really ought to be tested somehow.

> +	.smem_size	= 0x00009000,
> +};
> +
> +/* Interconnect rates are in 1000 byte/second units */
> +static const struct ipa_interconnect_data ipa_interconnect_data[] = {
> +	{
> +		.name			= "memory",
> +		.peak_bandwidth		= 1900000,	/* 1.9 GBps */
> +		.average_bandwidth	= 590000,	/* 590 MBps */

I no longer recall where to get these bandwidth values
for the interconnects.  Perhaps someone from Qualcomm
can find this out/confirm what you have.

Really nice work figuring out all this stuff...

					-Alex

> +	},
> +	/* Average rate is unused for the next interconnect */
> +	{
> +		.name			= "config",
> +		.peak_bandwidth		= 76800,	/* 76.8 MBps */
> +		.average_bandwidth	= 0,		/* unused */
> +	},
> +};
> +
> +/* Clock and interconnect configuration data for an SoC having IPA v5.1 */
> +static const struct ipa_power_data ipa_power_data = {
> +	.core_clock_rate	= 120 * 1000 * 1000,	/* Hz */
> +	.interconnect_count	= ARRAY_SIZE(ipa_interconnect_data),
> +	.interconnect_data	= ipa_interconnect_data,
> +};
> +
> +/* Configuration data for an SoC having IPA v5.1. */
> +const struct ipa_data ipa_data_v5_1 = {
> +	.version		= IPA_VERSION_5_1,
> +	.qsb_count		= ARRAY_SIZE(ipa_qsb_data),
> +	.qsb_data		= ipa_qsb_data,
> +	.modem_route_count	= 11,
> +	.endpoint_count		= ARRAY_SIZE(ipa_gsi_endpoint_data),
> +	.endpoint_data		= ipa_gsi_endpoint_data,
> +	.resource_data		= &ipa_resource_data,
> +	.mem_data		= &ipa_mem_data,
> +	.power_data		= &ipa_power_data,
> +};
> diff --git a/drivers/net/ipa/gsi_reg.c b/drivers/net/ipa/gsi_reg.c
> index e13cf835a013..a57072ba4bef 100644
> --- a/drivers/net/ipa/gsi_reg.c
> +++ b/drivers/net/ipa/gsi_reg.c
> @@ -110,6 +110,7 @@ static const struct regs *gsi_regs(struct gsi *gsi)
>   		return &gsi_regs_v4_11;
>   
>   	case IPA_VERSION_5_0:
> +	case IPA_VERSION_5_1:
>   	case IPA_VERSION_5_2:
>   	case IPA_VERSION_5_5:
>   		return &gsi_regs_v5_0;
> diff --git a/drivers/net/ipa/ipa_data.h b/drivers/net/ipa/ipa_data.h
> index 3eb9dc2ce339..fe6f7d5bfe88 100644
> --- a/drivers/net/ipa/ipa_data.h
> +++ b/drivers/net/ipa/ipa_data.h
> @@ -253,6 +253,7 @@ extern const struct ipa_data ipa_data_v4_7;
>   extern const struct ipa_data ipa_data_v4_9;
>   extern const struct ipa_data ipa_data_v4_11;
>   extern const struct ipa_data ipa_data_v5_0;
> +extern const struct ipa_data ipa_data_v5_1;
>   extern const struct ipa_data ipa_data_v5_2;
>   extern const struct ipa_data ipa_data_v5_5;
>   
> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> index 788dd99af2a4..6c449032ae45 100644
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c
> @@ -669,6 +669,10 @@ static const struct of_device_id ipa_match[] = {
>   		.compatible	= "qcom,sdx65-ipa",
>   		.data		= &ipa_data_v5_0,
>   	},
> +	{
> +		.compatible	= "qcom,sm8450-ipa",
> +		.data		= &ipa_data_v5_1,
> +	},
>   	{
>   		.compatible	= "qcom,milos-ipa",
>   		.data		= &ipa_data_v5_2,
> diff --git a/drivers/net/ipa/ipa_reg.c b/drivers/net/ipa/ipa_reg.c
> index 30bd69f4c147..5f22ca6295b1 100644
> --- a/drivers/net/ipa/ipa_reg.c
> +++ b/drivers/net/ipa/ipa_reg.c
> @@ -125,6 +125,7 @@ static const struct regs *ipa_regs(enum ipa_version version)
>   	case IPA_VERSION_4_11:
>   		return &ipa_regs_v4_11;
>   	case IPA_VERSION_5_0:
> +	case IPA_VERSION_5_1:
>   	case IPA_VERSION_5_2:
>   		return &ipa_regs_v5_0;
>   	case IPA_VERSION_5_5:
> 


