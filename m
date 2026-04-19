Return-Path: <linux-arm-msm+bounces-103629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mC6DKTTX5GnZagEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 15:23:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 043B342420F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 15:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC283300DE0B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 13:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B5837C91B;
	Sun, 19 Apr 2026 13:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="eGMkwv8z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from dog.elm.relay.mailchannels.net (dog.elm.relay.mailchannels.net [23.83.212.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87E1378D84;
	Sun, 19 Apr 2026 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776604954; cv=pass; b=Oy74I+3M94YoRHEs9bCwuPggycT9Gi5DYua4uGh6vPENcLOR97xdhjBC8t1OSK1KTDhwRJmTGo1yyPLC4ZlTn28h2I1Aapr6OngZZppDPcS+Hgru6yfJE/h13icxAvzbB1/+QG6jfuU12YYOKlhEH4j1mpZmM4It1ORz87KuxeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776604954; c=relaxed/simple;
	bh=kbdezKdy9n1Z+EmrfrTSzAuisz3gfPItrQLUQdy4kJA=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=jl2NiDi5WaRJf9zawJzqmue8VdFsvOY2RIc9dfBoCGPd29uqr1ie4ry7/qhRbQEPPwO+cF2BXebv+VpAyLtbtrpakq19Buzz5W9diucWym36oEPai4VSfSdMyhNkcuGj4ijxp324Ok7/aWUIruZuiLVshh/9zF8vj0JY43aUTj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=eGMkwv8z; arc=pass smtp.client-ip=23.83.212.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 338CB4400CB;
	Sun, 19 Apr 2026 13:02:51 +0000 (UTC)
Received: from de-fra-smtpout1.hostinger.io (100-101-167-79.trex-nlb.outbound.svc.cluster.local [100.101.167.79])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 9AC8A441FCD;
	Sun, 19 Apr 2026 13:02:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1776603770;
	b=lVBn1Oh+I7baBLfIeuk1MJKM8Cb60BWIeADYIUEVdTUw7Larh4hMX9Z9JTUk/1ObtIj7uc
	9YL9CWXWZNeJbDQFUTD2AwPCjry6bLOG5A9jbmPVlcs0kyKdgM6+7EBd87fLbA3mKaJuZE
	LpZN4/b0dmIj9MSUs4P6BsFOmteY3Z0jvltv2E7z2O2QWJFeUN6KJ6jUcHCvdZdTp3u3eh
	e5vYrpG75FS3+ODxJRY4YJ4BlUkIlxotJedXxJKGLqHEPouuvAHERfScB+TeufGZykJ0z5
	JOb85KuFgfYVoneyq4RaLqHq3k2tmmrH3b0lAGGagzA3wDUNW0niPzaC5z+HlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1776603770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=4X91Jm71JdGFejxNB2NzaiAeGdnRYzhGzaEASuCVPCc=;
	b=cShFOz7ViomBwkjxfM7AKzxxOqLGX+ITnWXwWiokRNcIbo2AilFY3/GIPCgsVfl3uTFQzw
	RPLkUb3JjExBDwAs8hF3YOxfZiL8LtZl5Ss7tW9uyhrXgeZhIPNNMIgoAD60d7+vDY/e8/
	+dyIXEbX/ImxgZcuI/Dcz4bQGdlzwj/4L/1fei7FufxTbwyPTvp6ibGkbdoii9oK7w6OFf
	Biet27ykwH5JXc726xUkyzAHUp2RHzODgyH/LJAHzTr7BhKiMhtqmqFJLGN2e2hZZpllp9
	OSZ7jSUmpj1jPTw1MK+OaDgSAu7YdgHuvzq1SXKOjM4OLnVPkOQlHOsVZLs0BQ==
ARC-Authentication-Results: i=1;
	rspamd-5895b9784c-2s8zv;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Tart-Spill: 0cb3a38d61e2caa1_1776603770916_1766329072
X-MC-Loop-Signature: 1776603770916:2376270110
X-MC-Ingress-Time: 1776603770915
Received: from de-fra-smtpout1.hostinger.io (de-fra-smtpout1.hostinger.io
 [148.222.55.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.101.167.79 (trex/7.1.5);
	Sun, 19 Apr 2026 13:02:50 +0000
Received: from [IPV6:2001:448a:c020:c3c:d097:d42a:836e:79a] (unknown [IPv6:2001:448a:c020:c3c:d097:d42a:836e:79a])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fz80y17vPz405x;
	Sun, 19 Apr 2026 13:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1776603765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4X91Jm71JdGFejxNB2NzaiAeGdnRYzhGzaEASuCVPCc=;
	b=eGMkwv8zL5UPQ0kcFH3PZhVyRaJOUB3P9n0U8ucRzhWtr0wLfnDQdgg9+oIzyrGIhUVzH1
	+5VAeieEtqkNQ9D6ldHZ4mK73A2xXW0bGoqDU7OrStfQxR8Dtn8NyJ/sEGyPcHD0yW7Ofx
	r5sfr+f15nFfNzlQZRfPlWGrywalteiiWHypnrlq6Riqq+xPIqBbZacAhqkiAbEv0Zc92w
	XeaxB8LyTElxIjdgYzGLm+hQJ+JkNiXA9HG/SkuBYZOWhkQn7KjCmPIOb84t4Tufmoy4by
	x/Tr2hABuPX71H6nZiuLUIyn4FwczBEHhs/ZW2AbQalxwytMyqBJX3FYUeumbA==
Message-ID: <c3219cad-8563-4bb4-b1f7-94b8db54c09e@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
 <c63abc0e-e060-4825-b595-a46ddf262673@oss.qualcomm.com>
 <caa589af-f026-4664-8fb9-6b23b0e087f9@oss.qualcomm.com>
 <71751331-651d-43aa-b30f-135cc62e8915@smankusors.com>
 <00e40481-9e62-437e-ac75-a04594ef6879@oss.qualcomm.com>
 <rnpbdbjlpx6wemeuzsm33njmnihhli6mvjzhwu4m64vpgbxait@7pnk2rdt2djk>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <rnpbdbjlpx6wemeuzsm33njmnihhli6mvjzhwu4m64vpgbxait@7pnk2rdt2djk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Sun, 19 Apr 2026 13:02:41 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=ALriHGRn c=1 sm=1 tr=0 ts=69e4d275 a=q8XfeKLTkGORBkIvkVRlwA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=mUryVpMS6HeJfSHEwLcA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfFupofheZFz+YPyWAx2XbSBOcml5hGXAcuqP7Qlv8ZpSvWhMTH4OaBnQ2Ey/IuTBdQEN341kxCGMpgoRBE8/Duv9Fe/chU7wXiyxYVcuR4QeMVT3KwKG q6B7rrdXdRXGM6j9U8LZ3W+tfo7R+ObirFS8amb0aey40YBHo4ApTXnDJbTTVRO2H2/1hL8tBUgADtVunkVbuhkrlG0wEswvMJhVQQjaBRJzI0ztUOa2ZOu/ rNA1HMxUxih/MGOOrzx6LXk0hgZ7R9ypLj4nXElYTlfNt+TPKd7iExrNa7Ye7LrQiG93L1jv/m7L/ZexF9vaof8tHsq3L9GX6U+8y9Z04hpDmtJ5DNbcMF/r nfrIpKL66g1WHkgPPEOt10cdkEenPz7ai5pDooNVmpWBo47ybZTRRweloOcZhlwYDuW56FBHpytQrMNafta1U6nwNJHWfVH7unPUUHyhIyHeyTYV8hGHn/sA ixvbQjiv0O3cuAP5oP3UWanKh6sh1/OIuqt+M0HpOU372YX5rM3SUER54VGhu+ZkAai26a13RJ/02jqyAbX8DPybjY6xmDh78fObWiIWzMngbua4PHgms9G1 nlh2GhomazVVrSvUfMjWD+3SNd9LzCa27txBcpfMBiJERZdncJALmJ8Io6TigVYN5IXutF+tL1feLCFcBH9wnoXfR0eS1d6kHPN6krwOkV3scwvhBRBtjOCe kHo+orO3CDSMD/SbfZjbPZjLkWEBpMMQ22OfKs4gZga6pewx20PxLX8k7FrjWhgQju/Qco8cFXrue6a2pGQIXEkI0F311k77nh+lrtO0+Xts4wBMIL6+RJnC 99ohA5DWH8yt6B3cH44=
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-103629-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:email,smankusors.com:dkim,smankusors.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[smankusors.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 043B342420F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/18/2026 11:11 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 16, 2026 at 03:49:33PM +0200, Konrad Dybcio wrote:
>> On 4/15/26 5:20 PM, Antony Kurniawan Soemardi wrote:
>>> On 4/14/2026 3:07 PM, Konrad Dybcio wrote:
>>>> On 4/14/26 10:06 AM, Konrad Dybcio wrote:
>>>>> On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
>>>>>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>>>>>>
>>>>>> msm8960 uses the same clock descriptor as apq8064 but lacked the
>>>>>
>>>>> This doesn't quite seem to be the case, some fields differ and
>>>>> apq8064 additionally has:
>>>>>
>>>>> QCOM_RPM_PM8821_SMPS1
>>>>> QCOM_RPM_PM8821_SMPS2
>>>>> QCOM_RPM_PM8821_LDO1
>>>>> QCOM_RPM_VDDMIN_GPIO
>>>>
>>>> Ah hmm, the MFD driver seems to provide *all* RPM resources..
>>>
>>> What I meant by "clock descriptor" in the commit message was
>>> specifically the subset corresponding to RPM managed clocks. From what I
>>> can tell based on downstream code, msm8960 and apq8064 seem to share the
>>> same set of RPM clocks, even though the overall resource lists differ.
>>>
>>> Is that understanding correct?
>>
>> If that's struct msm_rpm_map_data on msm-3.x, then I see that 8x60 has:
>>
>> +MSM_RPM_MAP(PLL_4, PLL_4, 1),
>> +MSM_RPM_MAP(SMI_CLK, SMI_CLK, 1),
>>
>> While 8960 has:
>> -MSM_RPM_MAP(QDSS_CLK, QDSS_CLK, 1),
> 
> You are comparing 8x60 to 8960, while it should be 8960 to 8064.
> 
> I see that there are differences, but the QDSS is the same.

I'm looking at downstream code from my Sony Xperia SP (based on
android-msm-mako-3.4 for LG Nexus 4 / APQ8064). Both apq8064 and msm8960
uses the same clock-8960.c file in that tree, including the RPM clock
descriptions, so I assumed their RPM clock sets were identical.

That's why later commit 1da13533627d ("clk: qcom: clk-rpm: add msm8960
compatible") reuses rpm_clk_apq8064 for qcom,rpmcc-msm8960 compatible.
But the problem is rpm_clk_apq8064 includes QDSS, which is not yet
present on msm8960_rpm_resource_table, causing rpmcc init to fail, hence
this patch.

That said, I agree with Dmitry on the other email reply. I will update
the commit message to match with android-msm-mako-3.4 downstream code
instead of claiming both SoC has the same clock descriptions.

-- 
Thanks,
Antony K. S.

