Return-Path: <linux-arm-msm+bounces-98911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5znvMWAqvWmI7QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:07:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE12D2D94AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 738203023503
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 11:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88262E4274;
	Fri, 20 Mar 2026 11:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+GKJHgY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LkMaIp++"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895423624A7
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774004829; cv=none; b=E4WksRm5K3/x5nMVDJFKfYUxt9P9gU/FHrpgspW9G+MDOTQnDImR3+q/KgmosLL4BNpCjgJe620sp7CMWwcpY3OEh3rdpfJYjztjz69hGlX6WAGqbRtlk235iRaoRkQOZmZ0AWA74SW5ab+wGAuHtGnCgKkCASqVfysDR/Nwydc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774004829; c=relaxed/simple;
	bh=B55hUfkFveMT32Ta80Cl8dAPy1ySrGpel4O4Bo+6YkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=acqkH7r+S40qwgP2yJAkiM14iFWhPmURS7g+Noa2ySg2fKZRUB79Qat/YGRMG+j9Wkz8XgQbfdXm32qaJW8HcIVONMLM6nIn6u+mqyJ9epIDVFyD/ClwKx2rLSo/vZ2XiRw1j4ljQZKVJyUGK5/0PWzsYyQopPB6pbNFOjpiMiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+GKJHgY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LkMaIp++; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2XihB3557545
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7xvazqXNDyIbT1hLpYtPJSBPiuK8QomKnXv/8SY/5TM=; b=C+GKJHgY1InXzQ4i
	Dilt54RZIqkiFcFgrQCqcd+7JttxpnTHO62IVgQPCaJelvyf2s7dgQUhz5j2i9OW
	HBlHv5rPxhJkylWnvIjorNJtL88oHOHtgn/CVo3XyoAATrWAYpYaA4QjfTePLGWH
	ZZwu0Uj0cX+gj+Y10rUkvJfXho3kvEd2svVBlqBXOYYwyv3ffP5BQuVhxRQyzLvU
	4Ta4R8ApzHJP7gv5Yiltl+tln2bMhFzA/Se9bwTLu1aq4y4BQIb8GiOI1sZ5TedE
	YsATdZZ15U+fSV6lWHtKh2QJH1R2r/jPkVJF0BFDu+9OgUMWFmK9qZ4TC5Lj2bFm
	zfU0fg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0r1gsxrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:07:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a0686edbcso1070634b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774004826; x=1774609626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7xvazqXNDyIbT1hLpYtPJSBPiuK8QomKnXv/8SY/5TM=;
        b=LkMaIp++G/MD9Ex43cVKR5ByhOPNn4FWwSISpam241xLbA2v29n4oouWx75YGJDcyL
         OohWF92NQLQryYPYVqyl5MuiiTCUNjXdB1xj2+IwgDMp43l449tFn+Cx6Ub5PZdse23x
         caOzMGCofbi51RSrBP6lzRPJwu3/hv8K6gVZE4LYsIObstxOXCL5l4Zu9/Co3jDgJ0QS
         yBabh51zxu0ovZxa/4FEXSH1USKKqmy4DwynBm7TF/b+4PlPBvm1HdcOm372KL5OhxHD
         BPg1+Np6O26GUAFaS/ImY9ktIKnbMXIKcZ7aG6CGI4OBQtqMzNCK06qp2w+eDHCLCugI
         JHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774004826; x=1774609626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xvazqXNDyIbT1hLpYtPJSBPiuK8QomKnXv/8SY/5TM=;
        b=mPLxcCq4eAUyI1Sz0HMXpWPG2KwTHGhkbmRNcCt4k4EmN7kOKdI6BqwNoJbOseaKLx
         /vBk969VcRCmfxCF8MeMyBdWAAaWl6h0itxHpzIkZya6oya+qmaKKPxsEPI22+CTRf8S
         OVgMvLWJhzd1j0CabBLuwJBvLRVXw6OK0QH7eM6G5BeDidjMlE9VukFQS0N7B+UYcwPI
         y7Q0LGO1BreFw+USM6JfSu2eav34V+1c7lBEkhftzuw6czemJdQ7NVcb1yGiLRGU/LZm
         1T1jasO+f0meuVJ5s1j69HhamTYC4rsci8u1ijoB2/iNY7jq4b8lDregzUYOxKK7M4Ap
         Cl5A==
X-Forwarded-Encrypted: i=1; AJvYcCU5ux+h+BE2vWhT9r4nbGBWvFuUuXSMGhKc/hq7hE6KU6IFLzTUZqiDldlYournARQV/63+ecumaVjSdQvU@vger.kernel.org
X-Gm-Message-State: AOJu0YzfCyTeBNohroPY1JRjfK2p7DSCO/SvmCPbGnzya08uAgaVq7A7
	Ht/i7cS7gB9fJ55k9xdkkR2AokKTTv44Tm1+v8Xpw7k/Xr2h7Eyo29l7+KSX+hbcqmI7F1sD5jJ
	jyafcLYW3K8yN2v0E0vDjFWxdyos+UmeZU28c45+Zrc/PUS/WPYaPJ0u8Q66aSZ9IW5SO
X-Gm-Gg: ATEYQzx5+bm3JjLy66iySLJOsiQySuPoui2XCdZ8FX7daDD//xrtg8SSPQAf/kwWp1b
	2u5aA+LDSkr0qMxVz0CzcyvLIUxLzGq30ZRraPauV08FpLsslXcxGSQ4b2cyx4+j3zxy01Xz87/
	bsTPY7s0LJLF4twhvx8j5yJ+GOIYS3B/2gabqhoMMPdM55szN78wNyR3lKS/oz5mPTv3GIO49lx
	eUt+3Ea8C6Z06sQagTPlCPE0LA0AJxrQaAoL0BVfJzsFnjUyJahtXFZ690WbWARbstveSNDPohE
	dZwBlicTpQyUNqTzsyLK18m9tXLcEVxg7CfKYtHkZ37X4iBh4DD4CwQtE6uyn3OgPswRVlHNkaX
	Or2vYC9teddoAgh5j0WMqXbhs2ls0CDx7U/iwU27qjR5IFeSjLbd7GHCh
X-Received: by 2002:a05:6a00:3017:b0:82a:5ef0:210b with SMTP id d2e1a72fcca58-82a8c278b4amr1939144b3a.15.1774004826520;
        Fri, 20 Mar 2026 04:07:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:3017:b0:82a:5ef0:210b with SMTP id d2e1a72fcca58-82a8c278b4amr1939116b3a.15.1774004825817;
        Fri, 20 Mar 2026 04:07:05 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410b1bdsm2258389b3a.57.2026.03.20.04.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 04:07:05 -0700 (PDT)
Message-ID: <aaeda234-3f14-4007-b0af-e876c064796e@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 16:36:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] can: mcp251xfd: add support for XSTBYEN
 transceiver standby control
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: mani@kernel.org, thomas.kopp@microchip.com, mailhol@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
References: <20260316131950.859748-1-viken.dadhaniya@oss.qualcomm.com>
 <20260316131950.859748-3-viken.dadhaniya@oss.qualcomm.com>
 <20260316-fossa-of-extreme-cookies-9c5c40-mkl@pengutronix.de>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <20260316-fossa-of-extreme-cookies-9c5c40-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA4NSBTYWx0ZWRfX7Tv/5DM2lP/b
 UDj91MzdDDXmtCt0TxzSW3mlwdARY4QMvM7nUA94GKGZl5/ipu6d1kFY3OoVtOBysHLUNi+BiZc
 oEop8LLihGkkfEUFQ8egXXEuYZoxkiXhPil8FevcmGgA9OIzgYo6XqqpirWSWsEJWaNkZZdp0X6
 uGm2qludNFyovaxuM9evCRYgJT+4Ik/cA+j8GKUDOAbmGwecj73JW4AoU5B7yU/HvoZwPlOEABf
 Qc9ix7zv62KP3NEegU3ZUCkEyCjMY2kC5sUnN88dAYwo8XDyEEYVaHxpzKW7C54wfP6lGnLxrbT
 jgBRwTEYqHkTZYpnyZz3AyxhyfdcB1CMmNmwWIj2jPa5+5hB749lUVu3cSZE/LW7sY3VF/HeGFi
 HBPvKrbSVfixYmahNnZiPtsGCQieS8jBeKqn6+NhXIjiIyqm9gnhELUppThENRxTvIkc+yP1gk2
 cNv2o01j0ZkeQW8SfBA==
X-Proofpoint-GUID: x8ruDDbO7KTarKZnLnOWe2GWPSWICl1M
X-Proofpoint-ORIG-GUID: x8ruDDbO7KTarKZnLnOWe2GWPSWICl1M
X-Authority-Analysis: v=2.4 cv=Y/D1cxeN c=1 sm=1 tr=0 ts=69bd2a5b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=cGBE/nqsz5+qsjWdF/9VHQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=lHJVDBzvP0N_sG6QPz0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200085
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98911-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DE12D2D94AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/16/2026 7:21 PM, Marc Kleine-Budde wrote:
> On 16.03.2026 18:49:49, Viken Dadhaniya wrote:
>> The MCP251xFD has a dedicated transceiver standby control function on
>> the INT0/GPIO0/XSTBY pin, controlled by the XSTBYEN bit in IOCON.
> 
> Please add a check to mcp251xfd_gpio_request() that GPIO0 cannot be used
> with xstbyen.

Sure, Will update in next patch.

> 
>> When enabled, the hardware automatically manages the transceiver
>> standby state: the pin is driven low when the controller is active
>> and high when it enters Sleep mode.
>>
>> Enable this feature when the 'microchip,xstbyen' device tree property
>> is present.
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>  .../net/can/spi/mcp251xfd/mcp251xfd-core.c    | 30 +++++++++++++++++++
>>  drivers/net/can/spi/mcp251xfd/mcp251xfd.h     |  1 +
>>  2 files changed, 31 insertions(+)
>>
>> diff --git a/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c b/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c
>> index 9c86df08c2c5..7a152acf4931 100644
>> --- a/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c
>> +++ b/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c
>> @@ -764,6 +764,29 @@ static void mcp251xfd_chip_stop(struct mcp251xfd_priv *priv,
>>  	mcp251xfd_chip_set_mode(priv, MCP251XFD_REG_CON_MODE_CONFIG);
>>  }
>>
>> +static int mcp251xfd_chip_xstbyen_enable(const struct mcp251xfd_priv *priv)
>> +{
>> +	/* Configure the INT0/GPIO0/XSTBY pin as transceiver standby control:
>> +	 *
>> +	 * - XSTBYEN=1: route the pin to the transceiver standby function
>> +	 * - TRIS0=0:   set output direction; the reset default is 1 (input),
>> +	 *              which leaves the pin floating HIGH and keeps the
>> +	 *              transceiver in standby regardless of XSTBYEN
>> +	 * - LAT0=0:    drive pin LOW => transceiver active (not in standby)
>> +	 *
>> +	 * All three bits are included in the mask; only XSTBYEN is set in
>> +	 * val, so TRIS0 and LAT0 are cleared to 0 atomically.
>> +	 *
>> +	 * Once configured, the hardware automatically drives the pin HIGH
>> +	 * on Sleep mode entry and LOW on Sleep mode exit.
>> +	 */
> 
> What does the pin do in Config mode?

In Config mode, the pin is controlled by LAT0. Since we set LAT0=0,
the pin is LOW (transceiver active), ensuring the transceiver is
ready before entering Normal mode.

> 
>> +	return regmap_update_bits(priv->map_reg, MCP251XFD_REG_IOCON,
>> +				  MCP251XFD_REG_IOCON_XSTBYEN |
>> +				  MCP251XFD_REG_IOCON_TRIS0 |
>> +				  MCP251XFD_REG_IOCON_LAT0,
>> +				  MCP251XFD_REG_IOCON_XSTBYEN);
>> +}
>> +
>>  static int mcp251xfd_chip_start(struct mcp251xfd_priv *priv)
>>  {
>>  	int err;
>> @@ -800,6 +823,12 @@ static int mcp251xfd_chip_start(struct mcp251xfd_priv *priv)
>>  	if (err)
>>  		goto out_chip_stop;
>>
>> +	if (priv->xstbyen) {
>> +		err = mcp251xfd_chip_xstbyen_enable(priv);
>> +		if (err)
>> +			goto out_chip_stop;
>> +	}
>> +
> 
> You should configure the pin before bringing the controller into normale mode.

Sure, Will update in next patch.

> 
> regards,
> Marc
> 

