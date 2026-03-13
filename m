Return-Path: <linux-arm-msm+bounces-97294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HUZJ6R6s2kZXAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 03:47:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6E827CE49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 03:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CB6D312EB19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 02:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301CD1C84D0;
	Fri, 13 Mar 2026 02:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="XEK9mfeo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m32107.qiye.163.com (mail-m32107.qiye.163.com [220.197.32.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4EA347BDB;
	Fri, 13 Mar 2026 02:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773369948; cv=none; b=m6M2Cj//Hzji9VaU8i34VNHsi8ptBBGFuEwsSp0X1popOckJdbA1Y5iSllO1MwIi05rwjR2Oj81wp/ojGzQs5bV0J7qAqKVDM+VPZbvjgqQ2ZktvMJibj0x1Us/OtQRpOt/Zk09iU8DPxP2CEBGoXuo9vmQe8FIp3L/z9MFPaOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773369948; c=relaxed/simple;
	bh=4oCoeZIKTmWM9r85FpxYxwRKMGZsI6PF3lSGn6GsxaQ=;
	h=Cc:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=FKMMqHN9lrPp8vxgscthiZo4nfDN09OwNF1ktJdeoxiICTpZ+d84PlFndYeLF+Uyhnz3z2Jb+ZdHKvTXStRH3983tQqLgqLg1X2OuccF44bq6Ar7Iy0AxvTzllwnIbD/DjpnSwteBenm8eAeC6O75oklaVGG9xvxxuarrQPwMVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=XEK9mfeo; arc=none smtp.client-ip=220.197.32.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 36c8f5110;
	Fri, 13 Mar 2026 10:45:35 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, linux-pci@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
 Manivannan Sadhasivam <mani@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kwilczynski@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Subject: Re: [PATCH v3 1/3] PCI/ASPM: Add helper to encode L1SS T_POWER_ON
 fields
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20260311-t_power_on_fux-v3-0-9b1f1d09c6f3@oss.qualcomm.com>
 <20260311-t_power_on_fux-v3-1-9b1f1d09c6f3@oss.qualcomm.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <00a5717e-9df3-0d50-c8f1-1da9165ff639@rock-chips.com>
Date: Fri, 13 Mar 2026 10:45:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260311-t_power_on_fux-v3-1-9b1f1d09c6f3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ce515c44209cckunm3487bcb369734
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh1CS1ZDTh9JGhpIGR0YSxhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=XEK9mfeo+uZnXLRmqbsyayF1H6qs69GfrqGB8xr5wPM508RKAIkounL46lY3Ftp1wiAGS/CRWCe22uFNxF+3spjQxZQ5Y1cOV4X3nCliRUMKkoRC1SxIrrF+PWqP913VbvS9udysVJ+LUi7mpqPqyJt4jypwLQDkPJ42s8xTK4I=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Wa1TMR8yBAxPRA2CYaUYftzWlGwup5hwJtKQHVxsFaM=;
	h=date:mime-version:subject:message-id:from;
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97294-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[rock-chips.com,vger.kernel.org,oss.qualcomm.com,quicinc.com,kernel.org,google.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shawn.lin@rock-chips.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rock-chips.com:dkim,rock-chips.com:email,rock-chips.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 4A6E827CE49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

在 2026/03/11 星期三 20:40, Krishna Chaitanya Chundru 写道:
> Add a shared helper to encode the PCIe L1 PM Substates T_POWER_ON
> parameter into the T_POWER_ON_Scale and T_POWER_ON_Value fields.
> 
> This helper can be used by the controller drivers to change the
> default/wrong value of T_POWER_ON in L1ss capability register to
> avoid incorrect calculation of LTR_L1.2_THRESHOLD value.
> 
> The helper converts a T_POWER_ON time specified in microseconds into
> the appropriate scale/value encoding defined by the PCIe spec r7.0,
> sec 7.8.3.2. Values that exceed the maximum encodable range are clamped
> to the largest representable encoding.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

I've tested it on my end with different t_power_on values in DT, it
works as expected.

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> ---
>   drivers/pci/pci.h       |  2 ++
>   drivers/pci/pcie/aspm.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 45 insertions(+)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 13d998fbacce6698514d92500dfea03cc562cdc2..48964602d802e114a6a2481df3fb75d9e178a31b 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -1105,6 +1105,7 @@ void pcie_aspm_pm_state_change(struct pci_dev *pdev, bool locked);
>   void pcie_aspm_powersave_config_link(struct pci_dev *pdev);
>   void pci_configure_ltr(struct pci_dev *pdev);
>   void pci_bridge_reconfigure_ltr(struct pci_dev *pdev);
> +void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value);
>   #else
>   static inline void pcie_aspm_remove_cap(struct pci_dev *pdev, u32 lnkcap) { }
>   static inline void pcie_aspm_init_link_state(struct pci_dev *pdev) { }
> @@ -1113,6 +1114,7 @@ static inline void pcie_aspm_pm_state_change(struct pci_dev *pdev, bool locked)
>   static inline void pcie_aspm_powersave_config_link(struct pci_dev *pdev) { }
>   static inline void pci_configure_ltr(struct pci_dev *pdev) { }
>   static inline void pci_bridge_reconfigure_ltr(struct pci_dev *pdev) { }
> +static inline void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value) { }
>   #endif
>   
>   #ifdef CONFIG_PCIE_ECRC
> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> index 21f5d23e0b61bd7e1163cc869fe9356d1ab87b34..d7f9ae9e48c25dbc2d9b4887e2f74623688098e0 100644
> --- a/drivers/pci/pcie/aspm.c
> +++ b/drivers/pci/pcie/aspm.c
> @@ -525,6 +525,49 @@ static u32 calc_l12_pwron(struct pci_dev *pdev, u32 scale, u32 val)
>   	return 0;
>   }
>   
> +/**
> + * pcie_encode_t_power_on - Encode T_POWER_ON into scale and value fields
> + * @t_power_on_us: T_POWER_ON time in microseconds
> + * @scale: Encoded T_POWER_ON_Scale (0..2)
> + * @value: Encoded T_POWER_ON_Value
> + *
> + * T_POWER_ON is encoded as:
> + *   T_POWER_ON(us) = scale_unit(us) * value
> + *
> + * where scale_unit is selected by @scale:
> + *   0: 2us
> + *   1: 10us
> + *   2: 100us
> + *
> + * If @t_power_on_us exceeds the maximum representable value, the result
> + * is clamped to the largest encodable T_POWER_ON.
> + *
> + * See PCIe r7.0, sec 7.8.3.2.
> + */
> +void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value)
> +{
> +	u8 maxv = FIELD_MAX(PCI_L1SS_CTL2_T_PWR_ON_VALUE);
> +
> +	/*
> +	 * T_POWER_ON_Value ("value") is a 5-bit field with max
> +	 * value of 31.
> +	 */
> +	if (t_power_on_us <= 2 * maxv) {
> +		*scale = 0; /* Value times 2us */
> +		*value = DIV_ROUND_UP(t_power_on_us, 2);
> +	} else if (t_power_on_us <= 10 * maxv) {
> +		*scale = 1; /* Value times 10us */
> +		*value = DIV_ROUND_UP(t_power_on_us, 10);
> +	} else if (t_power_on_us <= 100 * maxv) {
> +		*scale = 2; /* value times 100us */
> +		*value = DIV_ROUND_UP(t_power_on_us, 100);
> +	} else {
> +		*scale = 2;
> +		*value = maxv;
> +	}
> +}
> +EXPORT_SYMBOL(pcie_encode_t_power_on);
> +
>   /*
>    * Encode an LTR_L1.2_THRESHOLD value for the L1 PM Substates Control 1
>    * register.  Ports enter L1.2 when the most recent LTR value is greater
> 

