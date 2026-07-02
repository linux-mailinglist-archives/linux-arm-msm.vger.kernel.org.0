Return-Path: <linux-arm-msm+bounces-115818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SNAPH7fpRWpfGgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 06:31:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6686F36B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 06:31:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FuH34gzm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LeRqJwfm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115818-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115818-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38C4D302F24A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 04:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD8D363C40;
	Thu,  2 Jul 2026 04:31:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EE92AD37
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 04:31:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782966692; cv=none; b=cUE6BP5yYzTIzymmFlml9utKkBI0eSSNnl/nLe0ASpaWdflC964OFlqwQZho2iGpbC+GprJvGNO3EaglAw+51VVVsN/o4uhSCP4DSwXekjKHEKKu7wV+ua0EqufZdyDLetwp4CmwoD1vC7sBWNOFSqbm6hvlf78ryR+OxiUrkqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782966692; c=relaxed/simple;
	bh=vE7Hjf+MLc8902/ktwRaxiqP0uFvZ89u+t9/5HuFbB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OOmEdbz8RJtOWAMmrLm7E1b2tRp3gNiVCTDRqheyrRhDbZ2Y6PQolfo2blWLVY5kRKecdaPqf+X2PhtzXzpv0mDnnDRudHf6cWSqiQFlsVYEwjD+kbiY0+8UQ6T+BNfPg6NzQYOEHwRPC4FcrNyvXT3n61AuS3qkOn8IDL6mYP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuH34gzm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LeRqJwfm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KWlx2917542
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 04:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9z14DdaScwvuUkS9S1aCzsy5HUZXH5Z2PoiV67T14h4=; b=FuH34gzmOQltaLm8
	w2azdXwGaNSljN1NZWl5tRrWFe4uA2HTLHGrtEZeDI6F1NSElZalItaY1rlfDQlp
	mh5DFLLg5Hyn8aWsWD6t12SIIPtapo88esXUFpiTA+s5i0D/JyJJeodFEBtrPM1R
	BlMIOGSoTA8QdLgw4mL/D5sudvPCrug6FFhasCnx93V01qqK+qAEnGnq6iHfreuT
	0WsyMdQjStUadCy53dK/6CAqZF//MWsHmkFLjBVGCI25dWSpa1b6Q28VSv0FWPTM
	IFASBpqdwFQNtPbe8oSp4zMrK3ixrBnWFguc4JNFV2FRS5IzPFpEWcus+1oZQTAA
	DTbTpg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q0b2np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 04:31:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c894391f000so2600475a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 21:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782966688; x=1783571488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9z14DdaScwvuUkS9S1aCzsy5HUZXH5Z2PoiV67T14h4=;
        b=LeRqJwfmaFAYcxhH2QOlcCYDqA30P6E0mh63YJNmYTq1i6sHlk0RgdyPmOzJ3khnBG
         ihBLBWrr+YbPNh8kYGGt4MyXFYSL7LwWbouNiJ8k5Wo1XpnXydOLskIzQMinAbUXXFS/
         VECkcZB6G+DI+yeO2OY5m/EV9Sjmmy7cUAsg5Vv9AulAEtjxWuG6ihpVJsROc5PAlRFI
         2cHgp2XXZmbhGeKKnLIiPKA0x+b+tQSwrFq5HHEwQODRCntxU1kYJkPZTxsdC7DRH+3G
         QrOyLasxLofgP5unOLMZjf50XGaN0QhXGdqNw6l6NwmwffXOn4Sgd41UzwuljpYY5K6w
         qo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782966688; x=1783571488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9z14DdaScwvuUkS9S1aCzsy5HUZXH5Z2PoiV67T14h4=;
        b=jwo3ZP94WdqVzBZXblp3IyCGmvHtOShXg1Xz2mzLX1ndfLvlCqArvu74AiAnblFrnX
         2YP2c9HNt0A4WnQRN/OTz2wJcYKOqX2IUX8wU8OSWJx79oTxngErvdPrQWPrkUwhUmUH
         n4F5V4CsifCHbNGqLcfVzsxqOvDJa1ieZbwLmMe8l1tQU+wZ8yY0e//CZzLPSTWXSmb2
         CWyGRsFa3LsOxQOlcE11PMCzQay+pq3VWaw0cFLtkqOG6Tjh/BJIjtzXImyuCntqYVLX
         cpv/qA8kJ/zVx0gGnDmldyCGb7NlFHEUZo6W5s38E3SXSN+WxEGLtEsdKmotDYGaKz8X
         V0hw==
X-Forwarded-Encrypted: i=1; AFNElJ+0O6uYyMldBbMdKvKp2YjyVL+y+ChBivooNB+4TS8vW/Zr+6YUDmVf4F1uHkQ8GcfqmRezI8IGR+iacy7e@vger.kernel.org
X-Gm-Message-State: AOJu0Yxox71RHq43NA3BpIiMFrpGkRPR+1u2MQq7xof8IW5P1IuUESL6
	Pudg6J0eRXaBbLra+TTldoDo6FzP62wTfVQGXB/z+pRhFkBZIxxI9zhCSWMRjvc85AwGYRzyeM8
	aE8grjZlFyluTJTxYMIZ/WuSyTxBSEFY7yhjKIdgvqy+5+n/YC8HbdpxH8rGu5tNE2Gfi
X-Gm-Gg: AfdE7ck1D/Zn+yXKhFFKUvypfUl+4AHWCJtJv+rzdaxWOUEdCUreQodlnQRqz8INTi0
	DymbAxuYV6T5MuIN0n360QfJao+3tTNu3zcLnsAd/00Yg36ZkN7ySdrcZwWpKciDvZZMS62VS4k
	S1terFO4hfPitVZI1LwhRpatB3tI56qchwtEOqYddocZEbdaoiAzmVu1CYxFIO5zVq602UI70pm
	/sqVm8Y/c3LqeoUtc3eEgep1xYa6UWgybeXqQ+eOEl4lxNDrrrLx75J9j1bFi0DXzhWE5dJWIJr
	ywik/KEjdG/a/JPrrF1QFgn9gXoumjdlZr6Svieh2uF7Psp2BqXMmky7+ynGLBvloyJUAtAde6X
	OjegG70V/867GYQmyimiGQ5A05UQmFP1U4bUl8LWWgHs=
X-Received: by 2002:a05:6a20:918b:b0:3b4:7e2d:a3bc with SMTP id adf61e73a8af0-3bff3c31bd9mr4183271637.0.1782966688028;
        Wed, 01 Jul 2026 21:31:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:918b:b0:3b4:7e2d:a3bc with SMTP id adf61e73a8af0-3bff3c31bd9mr4183227637.0.1782966687526;
        Wed, 01 Jul 2026 21:31:27 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb84366sm5441204eec.16.2026.07.01.21.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 21:31:27 -0700 (PDT)
Message-ID: <bb0904d0-81f0-4575-aa17-007aa88f9942@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 10:01:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] bus: mhi: pci_generic: fix Rolling Wireless
 RW135R-GL and RW151 support
To: zwq2226404116@163.com, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org
Cc: mani@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
        andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
        Wanquan Zhong <wanquan.zhong@fibocom.com>
References: <20260701095344.309409-1-zwq2226404116@163.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260701095344.309409-1-zwq2226404116@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a45e9a0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Byx-y9mGAAAA:8 a=6GUwiT5CAAAA:8 a=nWUtx5Q0ph_BRYhHASsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=tp1klI1xYmtLYojU9LVd:22
X-Proofpoint-ORIG-GUID: xQGpZI5Z4j2mtFEcHfXQ8OKkiQnpnKJt
X-Proofpoint-GUID: xQGpZI5Z4j2mtFEcHfXQ8OKkiQnpnKJt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA0MCBTYWx0ZWRfXwNJlbzUeWfrm
 XCE83nz5GVsXquyD68eVfMU+a0snbfcsaMri3tgYJtYfBNlBJAEYe5Hef7xJbPTm/kRV6N7yrr3
 eaacrYPVA9OBE3+ENfIKRn/uYF3rwwrBD7nBGq88NP9rqW3mXP/OEALc6baTH2m+S2ziU4ngxj6
 5164Lu0iKJC7/3hDqGEKrwvvjrjlD6y9WzKHLLixwTYfk6ZIiW8eoOWgE10DZYtEN5Luye+SzpC
 bOviEuJSZ5q78ebaAL49zQMtrKIPk/3brdrAztFj3Y6f60ECBbrh3Lt5mHDHzCQc+d/zd9mpliw
 n3OKunCxC201LqddZjhAI+/Vj14txiqRDobKIw4Tma8XlydC4gaDHAcotFOyRLb+rYordY+Jk4l
 GDCXat8QlJp/ymoOsC+aeSB0tOR8Lye9j4QCC2wybB8sJSn+dWyj2Dk6cTFZfGK3S39G8XrMZ0i
 lXuVB2IUAi+hwfJeb3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA0MCBTYWx0ZWRfXwGFVtQV4mv2X
 e8Y+Skn30SM7+vNK2UH+P0yrbHD/fy3BWG6EPUo6zythRXWUy+nzL5IIozuMQ6FI0tCjPHz1N94
 keehdfBVKAySyvQM5l6BwjWJKFpDhUI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020040
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,gmail.com,lunn.ch,davemloft.net,fibocom.com];
	TAGGED_FROM(0.00)[bounces-115818-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zwq2226404116@163.com,m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:mani@kernel.org,m:loic.poulain@oss.qualcomm.com,m:ryazanov.s.a@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:kuba@kernel.org,m:wanquan.zhong@fibocom.com,m:ryazanovsa@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com,lists.linux.dev,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF6686F36B8



On 7/1/2026 3:23 PM, zwq2226404116@163.com wrote:
> From: Wanquan Zhong <wanquan.zhong@fibocom.com>
>
> bus: mhi: pci_generic: fix Rolling Wireless RW135R-GL and RW151 support
>
> - Increase RW151 MBIM channel ring size from 4 to 32
>
> On HP and Lenovo laptop platforms the device probes successfully and
> WWAN ports are created, but pci_generic enables runtime autosuspend
> (PCI D3hot/M3) after a short idle period. Resume from runtime PM leaves
> the modem in MHI SYS ERROR; driver recovery (reset) fails and the device
> becomes inaccessible (PCIe config space reads as 0x7f). The failure is not
> self-recoverable while runtime PM remains enabled; keeping power/control=on
> avoids the issue.
This might not be MHI issue, as the endpoint supports both D3hot and M3.
After runtime suspend check what does your platform is doing as part of runtime
suspend. It is more like a platform issue not a mhi issue.

The change is like workaround on platform problem. so for the change
no_m3 = true is not correct.

- Krishna Chaitanya.
>
> Set no_m3 on RW135R-GL and RW151 so probe does not enable runtime M3
> autosuspend for these modules.
>
> Power management testing (separate from runtime PM above):
> - Suspend-to-RAM (S3/mem): tested on RW135R-GL and RW151; MHI/MBIM/wwan
>   function after wake.
> - Suspend-to-disk (hibernate): not available on the test platforms
>   (/sys/power/state lacks "disk", ENODEV).
>
> Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>
>
> ---
> v2 -> v3: RW151 MBIM ring size 32; disable runtime M3 (no_m3)
>  drivers/bus/mhi/host/pci_generic.c | 4 +++-
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index d598bb3b3981..d0fee7e3ba3a 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -942,6 +942,7 @@ static const struct mhi_pci_dev_info mhi_rolling_rw135r_info = {
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
>  	.sideband_wake = false,
> +	.no_m3 = true,
>  	.mru_default = 32768,
>  	.edl_trigger = true,
>  };
> @@ -949,8 +950,8 @@ static const struct mhi_pci_dev_info mhi_rolling_rw135r_info = {
>  static const struct mhi_channel_config mhi_rolling_rw151_channels[] = {
>  	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
>  	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
> -	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 4, 0),
> -	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 4, 0),
> +	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
>  	MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 0),
>  	MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 0),
>  	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> @@ -986,6 +987,7 @@ static const struct mhi_pci_dev_info mhi_rolling_rw151_info = {
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
>  	.sideband_wake = false,
> +	.no_m3 = true,
>  	.mru_default = 32768,
>  	.edl_trigger = true,
>  };
>
> --
> 2.50.0
>
>


