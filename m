Return-Path: <linux-arm-msm+bounces-113386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id snpPGYY0MWrmdwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:33:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D06B468ED01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:33:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lg0171m7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FW5uTkmm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113386-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113386-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A38DC301876D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF51349B19;
	Tue, 16 Jun 2026 11:33:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978553043C8
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:33:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781609604; cv=none; b=jhZXXRT1uEyipuGxrN/QWTiUSbtHYvDlZJpq5+GGUCeZWTjTkdaLFKSNEuBIp86qePmDqVkDkWEy+PgdKuftgqh8NLcS2hbYC03e0kykbECOJ1wVXAaCL2mKCayezZYFIweGcgdhgfwxB2yQl2OL0u0K2M0+eI4aIiTbrYqm37s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781609604; c=relaxed/simple;
	bh=5b1lKuxonwsyguS5/PT+2GHd9Md2CWtz5U0lmjoy4Uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wl6KjYmXKhigJm3KA6A6vhAXajl5HSNVVfqi6N8BTYF/st4DCQ+PngrX1ODwM3s7dLYDyrtEphXp0pWT/dTGzFF4Go3OP2dKE+l5RurkTxsbdYjI4uTCWN38J0TL//VW2j+2j+E/0hN320k9N0bTL5212GBCTW3Mmevevz4dvao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lg0171m7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FW5uTkmm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9C9i248207
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0/KTaSvmO54QFHOUc2TftcdK+IfM7e3ZkvKmUPM3sXs=; b=lg0171m76ElWYK2Q
	JlwlcM8T+lWWeyKSN9LNT5yvG8HtX9W8OhlrwwVXe8mxTN2Ow0uslcH/OaabOiHw
	0ekpZ/qI0ZlYK1c2lVnslf1FM5ikPLTsVqCwgs2IeFTxsi4DElcy719QPzxfGnIw
	rHBaftju01GI/pPdB/G8aGPoCweVQ+V8SZGITJhyGRchpMurusD0Y2E5wqho+gTs
	MoKK6iyJyE7li2MiGDARkITFlW7FnNt4y88eCLqY4I6babIThW5oc3DQfDQH2SGv
	14tAgkfT5fOcK/LztEmHrXsTmzZoikecV3Z+IcHCn/UzilbZml6BuhgOa2Z+ncSF
	P4tS2A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xs8shm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:33:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51968526a68so6303941cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 04:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781609601; x=1782214401; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0/KTaSvmO54QFHOUc2TftcdK+IfM7e3ZkvKmUPM3sXs=;
        b=FW5uTkmmycknUMwDvo7pj615DLCsN0STPsxkOsIVTe1TMmzbjyV4p7xTi6HMrpytyB
         nAjQ7nSsjA2ho6/HzSuoQH59b3JxFc+kX1catZ4tjxSgcz9mFZMr+cvtV7uP7CKs4XPa
         TyE40vQzntkp5GEaaW0FxIj//qzBO7s5V6dgUtkfRMSaR81md9hwNBopB8v1KDkDofYN
         g4GuA5r3cGVNwBUF8bkHwMwe/o9ej1YVRwHCEOMcXZjvbusBrEd+ytKrn/ndQUU8CPg2
         IRqYOPQNBU8gtrllIeujrVe8QlN5S9MjYwnVkBvcXpIfKhF6J4X8vI9s+XUZzCb9m/un
         Q3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781609601; x=1782214401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/KTaSvmO54QFHOUc2TftcdK+IfM7e3ZkvKmUPM3sXs=;
        b=G9fO2KAVLm1XTAF+Ho2i8KPVEFaA+dXEHM6iq4nVHRTl8tgwfQzNrtGzBs5vBaFAO9
         Xje8g6JIwKRX24kDkvSTSRHXRWRJJqGADKSfbzs+diiYClc0BzibQNT8TTdIxH91CCsa
         IIEC5cpvaPlRYykZe+AUqY73iKJWT5jIC3DBkyxFs0DVIKfxmxfSxCZRuBrnWKNBBcXx
         G1PI/142Au71xi2IswMVPcnzF3+k6ilGupnLXc0PrJUnUvj92rHRWCKEtAW1Kjh9uAQu
         M3YBKMBQO2OR0oGgBlJE0HNrsUtIlZBFo1vSuV32tatLPsu59h7tH9KRwJcY44mq1my2
         vq/w==
X-Forwarded-Encrypted: i=1; AFNElJ9cnFBLThVTsEnSF3lMx7YC86cj24TvRTGjlUgj61/tSIDdKOSoZlZohbaEwewbnoGd3jxc4n7+WSvCiUvi@vger.kernel.org
X-Gm-Message-State: AOJu0YyjIyprOqXW36DMLDd98IQBLbkSEGq06syvmiT9rBQmPZVqzhEq
	XCmwa8EdZrbSPhRlj38vEnlvo2Keevls+HbfIJpG6gi1B1wIwpKgeHiMTy+5fjEjIbqpjZNsMJE
	LcLvhXdmcD/ueDGIWgQbzugVO7jFxxLgQPkMuzvXCUpT0h8H2t785KwvARvfzJCLYO+Qs
X-Gm-Gg: Acq92OH8J7eaRt624nRGfyYEIqhE4qyiRLptnvHvrSp5GktYBldGfbTipKUYb3N6DTi
	q1L7v7M2LGTsq/0rDGE665lLROAKS673zBs5EVlwqNJ6+JL80WrddGdT9ou8Vkz7FktCbKoHynl
	J+UYX6yo3CwV6ueLVNyUqUMLUuk29ybWABbM6AzfRiMJBCM8PjaPUSNpN61AjgONX4cekRETnza
	feiwNOJxVykxobVStmVL4PoHtLYc7tQs0NiuOhTdH1UTN0vMz9U18p1Avp0zQ70RukqIiKceePs
	wwXUrJwSfXQT4J4lacV3YcQSBLtuZuageKJtBK8BTLaaWUZ+MJQZDGA4ePFpNQrZWyjWH75uE+i
	yLeo9l0wpVmWN1WtVIa69UackJneHIaEQXaAonfvSH6p+sQ==
X-Received: by 2002:a05:620a:2729:b0:911:dfb8:37c9 with SMTP id af79cd13be357-9161bc7409cmr343129185a.3.1781609600850;
        Tue, 16 Jun 2026 04:33:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2729:b0:911:dfb8:37c9 with SMTP id af79cd13be357-9161bc7409cmr343124285a.3.1781609600316;
        Tue, 16 Jun 2026 04:33:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6e6c9sm639951166b.39.2026.06.16.04.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:33:19 -0700 (PDT)
Message-ID: <f9511ec8-be32-4232-9168-00f967c29508@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:33:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-9-val@packett.cool>
 <CGME20260320113219eucas1p1bc2f238b689c55ba256c4694eb067d35@eucas1p1.samsung.com>
 <2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6wyhZ0p97HId68VK2eRQEJlYrrNSTdF7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExNyBTYWx0ZWRfX0KRcW4h2RGyi
 vIQ0MPsKP7+D3ToUnpvLId0aQ0yy5nkLmeRuzrNe0UOI3dxo/vqwZFqGD0Ibp/jTn5v2/WvXRJr
 IJX11C5sOsA3HeS7V4zWTtGGKFYpzFAWMVu34XfMttwLxH76YP3akM4uclzDHdr+ooP+92lHSUV
 VdgYRFFkiscGIk9w2df1pNHhp5dtSkrZyyxvoBc4Ii3gV/uP1/2ScHz9YgU28MGG7KgUTeA956g
 pC7jR74XSVvkB6SAXZSvGcMBASUMhf8jpQqgavZhLz5THqgO/5INCqoi3e1JRqK7FzGFJEftLN2
 GmHBeG8fZ5juwdV1Z4tAhrz1rDcVSrCzH7DmrJWQGVai6jrRsVQ8h+M94X8madPmPCZ37rhpYsv
 fYeiwFxw8W7v6wJlORy4Jwn5rapFxPRqiCwXzU0CpgSSOjA/yBBE3P74tZ61kZbDWFFKXllFoAd
 bymh1Zuu7erlQnV51Wg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExNyBTYWx0ZWRfX28BsWoE27hlE
 6cBgooF8K6Eo4IlqwSvYBDlqPNgrnXW7iOcnExjXvtaYaPKlMR4N8CuZrJrwZcpIL5QYI5Q8dwo
 ChEef00JfhHHVz+eaq8O2vYl0fFpiwg=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a313481 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=iR95WtxUERvl_OCU54AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 6wyhZ0p97HId68VK2eRQEJlYrrNSTdF7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-113386-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:m.szyprowski@samsung.com,m:val@packett.cool,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:jonathan@marek.ca,m:konradybcio@kernel.org,m:johan+linaro@kernel.org,m:mani@kernel.org,m:lumag@kernel.org,m:luzmaximilian@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,packett.cool:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D06B468ED01

On 3/20/26 12:32 PM, Marek Szyprowski wrote:
> Hi,
> 
> On 12.03.2026 12:12, Val Packett wrote:
>> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
>> clocks are enabled during clock operations, preventing potential
>> stability issues during display configuration.
>>
>> Fixes: 80a18f4a8567 ("clk: qcom: Add display clock controller driver for SM8150 and SM8250")
>> Signed-off-by: Val Packett <val@packett.cool>
> 
> This patch landed in yesterday's linux-next as commit. In my tests I 
> found that it triggers the following warning on RB5 board:

Hi, I was clearing out my inbox.. Is this still happening on the latest
next?

Konrad

> 
> ------------[ cut here ]------------
> dsi0_phy_pll_out_dsiclk already disabled
> WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0x1ac/0x1bc, CPU#1: 
> kworker/u32:6/120
> Modules linked in: ...
> CPU: 1 UID: 0 PID: 120 Comm: kworker/u32:6 Not tainted 7.0.0-rc1+ #12425 
> PREEMPT
> Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : clk_core_disable+0x1ac/0x1bc
> lr : clk_core_disable+0x1ac/0x1bc
> sp : ffff800081a2b990
> ...
> Call trace:
>   clk_core_disable+0x1ac/0x1bc (P)
>   __clk_set_parent_after+0x9c/0xf0
>   clk_core_set_parent_nolock+0x1f8/0x230
>   clk_set_parent+0x40/0x84
>   of_clk_set_defaults+0x130/0x4b8
>   platform_probe+0x38/0xac
>   really_probe+0xbc/0x298
>   __driver_probe_device+0x78/0x12c
>   driver_probe_device+0x40/0x164
>   __device_attach_driver+0xa4/0x148
>   bus_for_each_drv+0x80/0xdc
>   __device_attach+0xa8/0x1b0
>   device_initial_probe+0x50/0x54
>   bus_probe_device+0x38/0xa8
>   deferred_probe_work_func+0x8c/0xc8
>   process_one_work+0x20c/0x78c
>   worker_thread+0x244/0x388
>   kthread+0x140/0x14c
>   ret_from_fork+0x10/0x20
> irq event stamp: 336832
> hardirqs last  enabled at (336831): [<ffffad391268b854>] 
> _raw_spin_unlock_irqrestore+0x74/0x78
> hardirqs last disabled at (336832): [<ffffad3911b6d8b4>] 
> clk_enable_lock+0xcc/0x110
> softirqs last  enabled at (336804): [<ffffad391134b884>] 
> handle_softirqs+0x624/0x63c
> softirqs last disabled at (336793): [<ffffad3911290674>] 
> __do_softirq+0x14/0x20
> ---[ end trace 0000000000000000 ]---
> ------------[ cut here ]------------
> dsi0_phy_pll_out_dsiclk already unprepared
> WARNING: drivers/clk/clk.c:1047 at clk_core_unprepare+0x1f0/0x210, 
> CPU#6: kworker/u32:6/120
> 
> It looks like a bug in the code performing the default clocks 
> configuration though.
> 
>> ---
>>   drivers/clk/qcom/dispcc-sm8250.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
>> index cdfdb2cfb02b..e59cdadd5647 100644
>> --- a/drivers/clk/qcom/dispcc-sm8250.c
>> +++ b/drivers/clk/qcom/dispcc-sm8250.c
>> @@ -578,7 +578,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
>>   		.name = "disp_cc_mdss_pclk0_clk_src",
>>   		.parent_data = disp_cc_parent_data_6,
>>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
>> -		.flags = CLK_SET_RATE_PARENT,
>> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>>   		.ops = &clk_pixel_ops,
>>   	},
>>   };
>> @@ -592,7 +592,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
>>   		.name = "disp_cc_mdss_pclk1_clk_src",
>>   		.parent_data = disp_cc_parent_data_6,
>>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
>> -		.flags = CLK_SET_RATE_PARENT,
>> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>>   		.ops = &clk_pixel_ops,
>>   	},
>>   };
> 
> Best regards

