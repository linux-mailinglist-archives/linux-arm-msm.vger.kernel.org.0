Return-Path: <linux-arm-msm+bounces-116491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5qRMFb3NSGr+twAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 11:09:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A365470731C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 11:09:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=smankusors.com header.s=hostingermail-a header.b=guiUHmMU;
	dmarc=pass (policy=none) header.from=smankusors.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116491-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116491-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99BC5301A148
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 09:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77BD3921CD;
	Sat,  4 Jul 2026 09:09:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from toucan.tulip.relay.mailchannels.net (toucan.tulip.relay.mailchannels.net [23.83.218.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5850334C39;
	Sat,  4 Jul 2026 09:09:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783156153; cv=none; b=dzb/bb7pudIhiHxnxtIvJ+UuyT34hBAOqwRm3Z7TTwZj65puAv8mIVuIIPvytrSx8JtJ4lbnDccsmig0QRDXEnOENga9Lrrqd4UB/Y2MPLFrKpjPJggoYdJLmDDe5QjTHgDiS437z4oVa4Fbfjoez3HjIXxJo76VHPc2Q3riTMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783156153; c=relaxed/simple;
	bh=v4mMZ46MIeihKrAlJScf4TpBLX/AgDDm1zkc1myckMM=;
	h=Message-ID:MIME-Version:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=KJGKE5L3ViulySD8Eh4IbA/ShVx299OF+eqgQ/YH3ZEk2Ygj8F6I7vXN5RDYxS4eb9O+Vz8+zbrcJ/pRDqDjqHYX+GGpRQQt3QdEEEBc+A+JfTxBUFT+IAGXARKCJiw/eFpgWhkL/5U1vdU+Wx5Pru69WNfUm9i/UgwqSqpaoho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=guiUHmMU; arc=none smtp.client-ip=23.83.218.254
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 13FB9382387;
	Sat, 04 Jul 2026 09:02:50 +0000 (UTC)
Received: from fr-int-smtpout29.hostinger.io (100-99-245-61.trex-nlb.outbound.svc.cluster.local [100.99.245.61])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 8C813382384;
	Sat, 04 Jul 2026 09:02:46 +0000 (UTC)
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Arch-Drop: 263943132682c5a9_1783155769915_1954679418
X-MC-Loop-Signature: 1783155769915:2001952177
X-MC-Ingress-Time: 1783155769914
Received: from fr-int-smtpout29.hostinger.io (fr-int-smtpout29.hostinger.io
 [148.222.54.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.245.61 (trex/8.0.2);
	Sat, 04 Jul 2026 09:02:49 +0000
Received: from [192.168.1.100] (unknown [180.247.178.47])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4gsl4y2RGyz32DG;
	Sat,  4 Jul 2026 09:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1783155764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5uAPwddbcsVqjTN7KfKSFX1l/DpceKdnZHuhocuiH7I=;
	b=guiUHmMUMZ2XFDIeKnGIAM41pRx58QMGrRvHUOs86MOFSnOqePZ6vdPb0mS7sOzV1YTxuK
	U7dNTjlQPf/3Z+yISXf/6Cc68xGZcsO3yBrynm8NijFOX6reIHTmb82dAjiGvirGhVelo0
	CyXY5ebI0d0c1EfwiBTEwZ45uyRHhIoQVVZNT9Ls8GUrz7prkZq8BJheVzrz/bFxKutDkb
	Vg5R9ujvnBrw8hfIdAdIBITcaBg7eZ7cmyTJPTWNj6k2UQRmzmXu+3wGdseDHiq8A2G3Tv
	gcmKkR7eKIx6trFcaEZVe4PTFhENAVW+RmYnnVyBqsLqceZcisx5LzyLpml4tA==
Message-ID: <f1749c0a-bb54-4ddd-94cb-75af9386a47a@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: qcom: hfpll: return lock timeout from enable
 paths
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Herman van Hazendonk <github.com@herrie.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260623060517.10889-1-pengpeng@iscas.ac.cn>
 <8e7a4cd1-ff17-4052-938b-5cb2ee8576f0@oss.qualcomm.com>
 <36f37fa0-94f3-498b-86ca-b431436750e1@smankusors.com>
 <198ad9ab-6e8e-4c67-afc2-01962ea12dde@oss.qualcomm.com>
 <5c374231-33dc-4082-95c1-1046286fbb13@smankusors.com>
 <89c53cb1-3804-4dfe-8d93-e27e31bc2254@oss.qualcomm.com>
 <42fa946b-43f7-4f8a-a349-f8509daab749@smankusors.com>
 <e129178c-6079-4538-89a2-247185dd0ce7@oss.qualcomm.com>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <e129178c-6079-4538-89a2-247185dd0ce7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Sat,  4 Jul 2026 09:02:42 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=BvrPwpX5 c=1 sm=1 tr=0 ts=6a48cc34 a=wcdSEg5z0Ek8dsFYb0grdQ==:117 a=wcdSEg5z0Ek8dsFYb0grdQ==:17 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=6pUSk3Kk9M1ibPHMJV8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfMotcKL6x3ZvdgxyZQKXmmKp8kIlcthje7VjLjQ1CbqJ2gDUW8gSLdNW+0Dy1CO9AJXSrh26pWoxvFaLDndbFEfJH6/llfcMqb26zBNMo8uBN1Tx/WX0 ePM0vA5hVi5gr5QfZlQQF+ZuPl2ASJLyD3Gni7KCJiPoYx0rC2P3J4XiwB170KTA1LQAAsBQqyaDZ9tVdlESYwyCbQAfgVH83LuOYmbZU0CwyF+f4SOpOnv6 62+rzj+GPshl7DLuvd5CzKUvuGnmutxF/RO2JAHhNMJ9VAKyXxxMEkY9EZVcAhEMHAgc41fal0teJy1nqlj2Eku7I/1Idhf60Psh6Hdb68dcquz0PRA249un Yd87xMtuwgtfrVZQrWFEt3XJNAx04pm3sO1FQt6RduENoieOfVvxgA0muEev0WgUJb1N0dlf/45RD7XXR5HnCGVBF2R7zNn/YbBq6FLwPbGHRRI60PPGECsl XUNvOTjKwKrVvwkV2ZNia2d1wko+6mRqzpmvKPUHSMz+zT0NcKConJjnmpLqJixXQ/UTr0osrIfzYBkQ62MNObsg6Fy/e9NBdu575A==
X-AuthUser: linux@smankusors.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[smankusors.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116491-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:pengpeng@iscas.ac.cn,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:github.com@herrie.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,iscas.ac.cn:email,clk.name:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A365470731C

On 7/1/2026 7:11 PM, Konrad Dybcio wrote:
> On 6/29/26 5:14 PM, Antony Kurniawan Soemardi wrote:
>> On 6/29/2026 4:15 PM, Konrad Dybcio wrote:
>>> On 6/28/26 8:07 PM, Antony Kurniawan Soemardi wrote:
>>>> On 6/24/2026 2:39 PM, Konrad Dybcio wrote:
>>>>> On 6/24/26 3:57 AM, Antony Kurniawan Soemardi wrote:
>>>>>> On 6/23/2026 4:43 PM, Konrad Dybcio wrote:
>>>>>>> On 6/23/26 8:05 AM, Pengpeng Hou wrote:
>>>>>>>> The HFPLL enable helper waits for the lock bit but ignores the
>>>>>>>> regmap_read_poll_timeout() result. The polling condition is also
>>>>>>>> inconsistent with clk_hfpll_init(), which treats the lock bit being set
>>>>>>>> as the locked state.
>>>>>>>>
>>>>>>>> Wait for the lock bit to become set, return timeout errors from the
>>>>>>>> helper, and propagate those errors through clk_hfpll_enable() and
>>>>>>>> clk_hfpll_set_rate() instead of enabling the output unconditionally.
>>>>>>>>
>>>>>>>> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
>>>>>>>> ---
>>>>>>>
>>>>>>> This looks good on the surface..
>>>>>>>
>>>>>>> +Herman, Anthony, Dmitry could you please give this a spin on 8x60?
>>>>>>>
>>>>>>> Konrad
>>>>>>
>>>>>> Just to clarify, this patch impacts cpufreq and gpufreq for Qualcomm
>>>>>> Krait era, is that correct?
>>>>>
>>>>> Seems that way - cpu, L2, and GPU, maybe others
>>>>
>>>> nope, tested on Sony Xperia SP (MSM8960T), the phone hangs
>>>
>>> [...]
>>>
>>>> [    2.679716] L2 @ Undefined rate. Forcing new rate
>>>
>>> This seems odd. What's the reported rate there?
>>
>> if you're asking clk_get_rate(clks[l2_mux]), it's 0 Hz.
> 
> Hm, are the parents registered?

pardon me for stupid question, but how do I verify the parent
registration?

> I see:
> 
> p_data[0].fw_name = hfpll_name; // "hfpll_l2" lookup via clock-names
> p_data[0].name = hfpll_name; // legacy global clk lookup for
> 			     // clk.name == 'hfpll_l2'	
> 			     // (registered in gcc-msm8960.c)
> 
> p_data[1].hw = hfpll_div; // sourced from "hfpllN"
> p_data[2].hw = sec_mux; // sourced from "acpuN_aux"
> 
> There's a fw_devlink between kraitcc and gcc already, since you
> specify all the clocks (minus hfpll_l2):
> 
> https://lore.kernel.org/linux-arm-msm/20260514-expressatt_cpufreq-v1-3-487fd2d78859@gmail.com/
> 
> so it must have probed beforehand (unless you disable fw_devlink?)

I removed the fw_devlink kernel arg, the kraitcc is probed much later,
but still stuck with the same "L2 @ undefined rate"
> Can you do `cat /sys/kernel/debug/clk/clk_summary` on a running system?

below is the mainline kernel, with cpufreq patch

sony-huashan:/home/user# cat /sys/kernel/debug/clk/clk_summary
                                  enable  prepare  protect 
                  duty  hardware                            connection
    clock                          count    count    count        rate 
accuracy phase  cycle    enable   consumer                         id
---------------------------------------------------------------------------------------------------------------------------------------------
  qsb                                 0       0        0        1 
    0          0     50000      Y   deviceless 
no_connection_id
[...]
  pxo_board                           4       4        1        27000000 
    0          0     50000      Y   deviceless 
no_connection_id
[...]
     hfpll_l2                         1       1        0 
783000000   0          0     50000      Y      deviceless 
       no_connection_id
        hfpll_l2_div                  3       3        0 
391500000   0          0     50000      Y         deviceless 
          no_connection_id
           krait_l2_pri_mux           2       2        0 
391500000   0          0     50000      Y            deviceless 
             no_connection_id
     hfpll1                           1       1        0 
783000000   0          0     50000      Y      deviceless 
       no_connection_id
        hfpll1_div                    2       2        0 
391500000   0          0     50000      Y         deviceless 
          no_connection_id
           krait1_pri_mux             1       1        0 
391500000   0          0     50000      Y            cpu1 
             no_connection_id
  
                                             cpu1 
     no_connection_id
  
                                             deviceless 
     no_connection_id
     hfpll0                           2       2        0 
1512000000  0          0     50000      Y      deviceless 
       no_connection_id
        krait0_pri_mux                1       1        0 
1512000000  0          0     50000      Y         cpu0 
          no_connection_id
  
                                          cpu0 
  no_connection_id
  
                                          deviceless 
  no_connection_id
        hfpll0_div                    1       1        0 
756000000   0          0     50000      Y         deviceless 
          no_connection_id
[...]
  krait_l2_sec_mux                    2       2        0        0 
    0          0     50000      Y   deviceless 
no_connection_id
  krait1_sec_mux                      1       1        0        0 
    0          0     50000      Y   deviceless 
no_connection_id
  krait0_sec_mux                      1       1        0        0 
    0          0     50000      Y   deviceless 
no_connection_id
  pll4_vote                           0       0        0        0 
    0          0     50000      ?   deviceless 
no_connection_id

below is the mainline kernel, without cpufreq patch

sony-huashan:/home/user# cat /sys/kernel/debug/clk/clk_summary
                                  enable  prepare  protect 
                  duty  hardware                            connection
    clock                          count    count    count        rate 
accuracy phase  cycle    enable   consumer                         id
---------------------------------------------------------------------------------------------------------------------------------------------
[...]
  pxo_board                           1       1        1        27000000 
    0          0     50000      Y   deviceless 
no_connection_id
[...]
     hfpll_l2                         0       0        0        0 
    0          0     50000      N      deviceless 
no_connection_id
     hfpll1                           0       0        0 
918000000   0          0     50000      N      deviceless 
       no_connection_id
     hfpll0                           0       0        0 
918000000   0          0     50000      Y      deviceless 
       no_connection_id
[...]
  pll4_vote                           0       0        0        0 
    0          0     50000      ?   deviceless 
no_connection_id


Do you have other idea how to solve this? I added some pr_err if the
read poll is timeout:

[   11.164436] [pmOS-rd]:   ❬❬ PMOS STAGE 2 ❭❭
[   20.400232] krait_add_pri_mux: krait0_pri_mux, hfpll_name: hfpll0
[   20.400793] Enabling HFPLL hfpll1
[   20.455491] krait_add_pri_mux: krait1_pri_mux, hfpll_name: hfpll1
[   20.456081] Enabling HFPLL hfpll_l2
[   20.560623] HFPLL hfpll_l2 failed to lock (val=0x6, ret=-110, 
hd->lock_bit=0)
[   20.758961] krait_add_pri_mux: krait_l2_pri_mux, hfpll_name: hfpll_l2
[   20.759339] L2 @ 0 KHz. Forcing new rate.
[   20.764520] L2 @ Undefined rate. Forcing new rate.

-- 
Thanks,
Antony K. S.

