Return-Path: <linux-arm-msm+bounces-113042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V+h4JLKeLmpT0gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 14:29:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AA9681047
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 14:29:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iskren.info header.s=purelymail3 header.b=ZSydUS+S;
	dkim=pass header.d=purelymail.com header.s=purelymail3 header.b=LDs6mJtg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113042-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113042-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iskren.info;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 86D0E3002310
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 12:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2075931A556;
	Sun, 14 Jun 2026 12:29:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8892030E859
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 12:29:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781440175; cv=none; b=AP2pfEtJy+cwLRdJr/ibixuhBcLkxZdcfbN1k1lq8fd6U+lfLAdbEpIKtbydLty607Vn9Jm9sPzaT52NYd2JD3bf4zvF4t2KCPS2bWQ/u8ZOrUfI1/h/BAtzxy9cQll70q0j1iYr7AdMXP8qS58IWP+A9M/qCwFQB9MhIOxNl0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781440175; c=relaxed/simple;
	bh=IQSjTyjS8hNRnK0DIocyeVZNIoUq+jWIAPq7VzDKUBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+NHEYByDuVnUZc/uvilewlsaQTa5fhA7VjVcnvbHrBRjWs5K9B0fcJCVvAurxRS5tjw3ScWkjE8j6mo2Kmy2VAe6SsIzTY8Tg838BucE5nXTAdaft+P2ru6YuFUr8hpY/+BO0OBhVGoHMYuhmeSFFEEFbbVWKoUhHqZWUlzg7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iskren.info; spf=pass smtp.mailfrom=iskren.info; dkim=pass (2048-bit key) header.d=iskren.info header.i=@iskren.info header.b=ZSydUS+S; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=LDs6mJtg; arc=none smtp.client-ip=34.202.193.197
DKIM-Signature: a=rsa-sha256; b=ZSydUS+Sxie6wgLyavL9/rY2x92XkLI3EbPlJg5Cngk1W+nE0fsSiX/N1hr3/+UkE/ben6P39PwFQqdRJZWjPjjZl4YqwSplchi6Mc0JUE42c0lrJ3uegEMuvqe3R+yDyol+PnzbtaZzK5Wku7PL4P5iWkVKVXqAWCM1onSUFUnj4tryl3y8f9EfZ16G3n1lkYPZ5Iq+uA0dvkkB1EjWlbFBGsVyxkIHuNUQJiKiFKcWH8qWMh1luf4ZAV16VmoSG0RhR/koEj3svakZBPS7s69hL+yDQUKqfVHaeJ5rb/aKQzlHocvNCgC5qzAencLqKeCkPOdl3MsRhBr8TTFZyg==; s=purelymail3; d=iskren.info; v=1; bh=IQSjTyjS8hNRnK0DIocyeVZNIoUq+jWIAPq7VzDKUBw=; h=Received:Date:Subject:To:From;
DKIM-Signature: a=rsa-sha256; b=LDs6mJtg4ZpamSh30QeGss5dT/n2Kxd13MjMHysYnhchh/ISMmgxnS3rd69WxYLnmTIljo1+uVQuuXxQa6Nyxgk9kUcbt1rD6v832bI6n9EGSEsQ38Yypnb7ZfQkABFuYEnCYSQzt0lh0B3DV5oEkA/G41cMP2VjLoettsadc8R6wydcttNAs0HudfiVWnBvZpo+tq4U52/3WIqx3vtkzmOLBx/IL65QX5kE0iNt8lLIowkSD81iwfMmcC9aPejYXRyTZJkfB9W8nZPi4sIk+tO6ynpeMqgeM5EK1ipu28TsATz/GacRJttZQuIauoMFaNrkvEqKS0ku4VeL+erLLA==; s=purelymail3; d=purelymail.com; v=1; bh=IQSjTyjS8hNRnK0DIocyeVZNIoUq+jWIAPq7VzDKUBw=; h=Feedback-ID:Received:Date:Subject:To:From;
Feedback-ID: 10275:2339:null:purelymail
X-Pm-Original-To: linux-arm-msm@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1565696518;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 14 Jun 2026 12:29:11 +0000 (UTC)
Message-ID: <5b474af3-f651-4a64-a5b9-c18136e589eb@iskren.info>
Date: Sun, 14 Jun 2026 15:29:08 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] phy: qcom-qusb2: Fix SM6115 init sequence
To: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <20260610-topic-8996_61x5_qusb2phy-v1-2-d7135980e78f@oss.qualcomm.com>
Content-Language: en-US
From: Iskren Chernev <me@iskren.info>
In-Reply-To: <20260610-topic-8996_61x5_qusb2phy-v1-2-d7135980e78f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[iskren.info,reject];
	R_DKIM_ALLOW(-0.20)[iskren.info:s=purelymail3,purelymail.com:s=purelymail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113042-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[me@iskren.info,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[iskren.info:+,purelymail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@iskren.info,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_WP_URI(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26AA9681047



On 6/10/26 3:04 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> I don't know where the existing one came from, but it's apparently
> wrong, according to both docs and a downstream DT [1]. Fix it up.

They came from DTB extracted from a running billie2 (OnePlus Nord N100):
[1] 
https://mainlining.dev/wp-content/uploads/2021/02/03_dtbdump_Qualcomm_Technologies_Inc._Bengal_SoC.dts 


The phone was bough early after launch, so it could have been 
wrong/updated later.

> The updated values also happen to match SM6125, which will allow us
> to fix that platform too.
> 
> [1] https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/bengal-usb.dtsi#145
> Fixes: 7756f1d6369e ("phy: qcom-qusb2: Add configuration for SM4250 and SM6115")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index eb93015be841..c304ccd9f31f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -233,9 +233,9 @@ static const struct qusb2_phy_init_tbl msm8998_init_tbl[] = {
>   
>   static const struct qusb2_phy_init_tbl sm6115_init_tbl[] = {
>   	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0xf8),
> -	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0x53),
> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0xb3),
>   	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE3, 0x81),
> -	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0x17),
> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0xc0),
>   
>   	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TUNE, 0x30),
>   	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL1, 0x79),
> 


