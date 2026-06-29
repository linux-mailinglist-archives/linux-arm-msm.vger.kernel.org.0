Return-Path: <linux-arm-msm+bounces-114927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZqGMAwk6QmoC2QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:25:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 988C06D8257
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:25:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="KW1/mpbs";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WdwDDuQy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114927-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114927-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2C9C9304312C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5273FAE02;
	Mon, 29 Jun 2026 09:15:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19265BE63
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:15:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724530; cv=none; b=LfDgkOrj0IFwsQzafprxd4CbDwP/EJ8zbT+lFjR7xHR/BA5P7o4IbD190bzxHDc5BBtXixEltvtM8iTl/3T/a4jMqp+jzdCUDqiYEZe+QWkfQDVOw18lWklVQpakGjtM2OxNp98xE13Vr4YL2ZaH73nR7l6IW5wZfSSl3EZFIJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724530; c=relaxed/simple;
	bh=qCFQKNYCOzLkdrHwzK/PD74pzbWUzqmtD7UHeLqErD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JvQQW/jCWsst1QK0Trb6NH6QcCqzqqAGtlSCr4zpeIOYZ8bNvuR1Nr/loz8kQ9N+aiAJTspfETPAo7h6v9BR/fRLn+1VI7SnK0ihUM/dX3YH1L2ms+8ooHvDgDbWu4FyX+vp/nWHaYgayP/Ied9l9NOQS58Lc60oEUYZ19Iikz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KW1/mpbs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WdwDDuQy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T72bnL2163943
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ZkUgMVQuey59o9ZIrC3KxpAQsMzBQOEA3dXXM+SDDU=; b=KW1/mpbsVoUGfOO9
	flQFbOExCFpR5OxrDV1OwrvM3by6HTv/Uyi4PR6z0eqmD7q8IbeSMS0KGM8s/JPO
	AD5TDpzW3vFX9NogGjm3X6mtAWfocdbmDwzYcoTUXgFYmXvzyFENubf79+rUPz+6
	jmbB+FahVJFc1W+945JoaZS/6GrObo0YK9fK5NCknqQnFAlmmoBp5ykP1w+vWe/n
	3owUaE48FlzsyxGfhL3sjtucRXW36ImzcadiiervcrsB92syT8VbNIt/PnsnhSxo
	Zmi3DiuPebj84+dJ1Ld1+xnePRdr1sEUjU1+8YtyARhLsn6y+6R2fMaATGEfuxxS
	2Axs1Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjghrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:15:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92daa1a0f7eso57667285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724527; x=1783329327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZkUgMVQuey59o9ZIrC3KxpAQsMzBQOEA3dXXM+SDDU=;
        b=WdwDDuQy2C1s76PncfYmem+b2GrlYUbswpQD8fnKds/JcaUQCBJengA/3LQFdpKdHb
         f+dEdHMZkz49WVO7dT5UTlFnjvhey3BgEqiGEANerlxuCf/KmNna0sMtjdSvFp49Y14z
         sBlevf64x2vybxorHjETvKgYv/C3sd6TfED0iWUfmrMAoaazTaMi4dwvMfOsG6Juar5Z
         AFZCXZWi10VEsA9EGEoOXU9rVniffOXC0b5NZnvMo+3uqYu8gh7giG13hGhnfU/lSg3s
         v9cjeHr+VfOdxvesoxGLZ/HZHhhmA03z60bQyh5DLpUv4qevOkg0PXHtJPsovLdd/TKA
         clrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724527; x=1783329327;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZkUgMVQuey59o9ZIrC3KxpAQsMzBQOEA3dXXM+SDDU=;
        b=ik3UZLopux3qp6eipxUQXS2Sd76yTEaHVJNVnCkz5UAy6wN7APBwI0LFBYEwxmrOQa
         VWhcu+JyQYUkOxtBKNcbAc1QLWEOuU/R2P+3yOUUDGXGvR5bLLKol3S5vhnf7oqem3mQ
         kgfSfaFjaQKAIbRz7BojPCasROiCBDbju/235F2vJUyPNhYvrIJ2F7ABMDG+sik6PF/f
         ZOybS7rbHLpclLkEjLINXvsbJDQFPJ+M9hlkafcmE6qUzB+kEwpYMXzpPbDYXAq7t3ki
         UARabFm7OVGFGS/1TDeidKEjhAJMpxx7mnghWDckgqhrbpD606rHsA8eY89perccWo22
         L34w==
X-Forwarded-Encrypted: i=1; AFNElJ9nhZeIuhL6X3V1ehSMPXjpCldlAiHjAYD7+8FDBqBptSEB5MK9bg6Mdx4tF0PS0JXY+KK/lA7B8sZdob/c@vger.kernel.org
X-Gm-Message-State: AOJu0YyqSfG8u64vEwVVY7Sjztllz4cyxBEbjIdR1rIFFdor1VZAg9sY
	Krl2c4lBWueRVR0EyLOoS6k8PP27gB/75Db4gYani+Bf9YipJWM3S5HAKBobXCXAxAdNnV0XY+W
	Xc+in4o6TcePYAYMLHDJ1mw97+SbbXPquI+9g1IvkAp4yWRplhzkCv2vn5LIDuEuO98kI
X-Gm-Gg: AfdE7ckXRE4ysL080gQV4PEs7RoPztE0aO2fvqHKiKCOUBjiAOuTxOxC1rgWLjSGB9g
	eIKnEf9YrORHOM2WzJSbF7CubMSphq1K1IQTshqQJFWtd2Rjq0N+So5vEbl7EviBA9SjuhNx1Xe
	96mB/bQAGmUZe1NwNDV9W5gYypSkgJ+v1fAv/CoqIxJbT25nTW3+WpNTYTIIaZIeuXkc99wC5bV
	zKpIfg+t8BoXLsrHt3LW2f8so3dc4X9TDlWkVXWQ2G+DYSXV1axYl5FdHyiJGxkXKhFYFu27Sam
	+9AGmA3BSOAjUin/2wrkxgFwJseGFQ1LvNLhBpSBXUFVbw9kRKHlIniH83/9MDJ/3W0AEeQB7Yf
	hgq44egBTdISjOVqVEjVh0FmoQ4J6kACcE6c=
X-Received: by 2002:a05:620a:8907:b0:92c:b769:ad1f with SMTP id af79cd13be357-92cb769b027mr681019285a.6.1782724527196;
        Mon, 29 Jun 2026 02:15:27 -0700 (PDT)
X-Received: by 2002:a05:620a:8907:b0:92c:b769:ad1f with SMTP id af79cd13be357-92cb769b027mr681016485a.6.1782724526745;
        Mon, 29 Jun 2026 02:15:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1276093d8fsm52611566b.13.2026.06.29.02.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:15:25 -0700 (PDT)
Message-ID: <89c53cb1-3804-4dfe-8d93-e27e31bc2254@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:15:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: qcom: hfpll: return lock timeout from enable
 paths
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Herman van Hazendonk <github.com@herrie.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260623060517.10889-1-pengpeng@iscas.ac.cn>
 <8e7a4cd1-ff17-4052-938b-5cb2ee8576f0@oss.qualcomm.com>
 <36f37fa0-94f3-498b-86ca-b431436750e1@smankusors.com>
 <198ad9ab-6e8e-4c67-afc2-01962ea12dde@oss.qualcomm.com>
 <5c374231-33dc-4082-95c1-1046286fbb13@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5c374231-33dc-4082-95c1-1046286fbb13@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: O5hTHoNZC0l93UkOLNdZqiBYu-leYMjL
X-Proofpoint-ORIG-GUID: O5hTHoNZC0l93UkOLNdZqiBYu-leYMjL
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a4237af cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=OLjij_zqaC7basKHGfEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX2YQkukQGm63M
 zCY+rqHy8+uPVXcAfyqcwTFs2jtwIgoE1FbsfAv+G4vSQfEAML72eGHoT7bQhsQeytencWNV0kX
 B2fKMfZaVYD9aBeFiK3HLMV2Ngfxs4c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfXzIwvjitMvZ8c
 D9aaAOhcTlq+tBAxvw3vhwDWdryi9zhv7r4Gmpnz60chvDCD7lScCxBqlF5l5wzBDKGiD+eWiVa
 bgTbf1WEAkz0ERUj2bm2TlDHVVMeyIEdaWhm5cq14OTEW7bH27dI/28FX1k026u/OdX40lw7Iat
 TGZbHKN6Mc0SCYxvrX/S30ovEYqdO+Rdd2gYwzqMEg302I8CL26XEo5sYjtoVqrOJu8tjmwsRaW
 7VnYlg6oRpPMmaPrGfj5xtibGoKFUy822cbkhkib5AF5uLTMlxUUUpmHTjs3tE3dGMvLCgsTkjz
 1OxICMc+QJlgs0F/0138n6MvaUlUT/hxkhic4W5gNGEErx7L0REJHAcgTKBo+IiygiTWD7EEHq8
 BJRHhknffdlgkBA3U/eiIpvw77pqn7dw4AvSmNTTeaK5TqnG8GKjPjdzsx7JmaCbdAtaWaoKtgj
 3M2h8jUz631cnk8mqXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114927-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux@smankusors.com,m:pengpeng@iscas.ac.cn,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:github.com@herrie.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,iscas.ac.cn:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 988C06D8257

On 6/28/26 8:07 PM, Antony Kurniawan Soemardi wrote:
> On 6/24/2026 2:39 PM, Konrad Dybcio wrote:
>> On 6/24/26 3:57 AM, Antony Kurniawan Soemardi wrote:
>>> On 6/23/2026 4:43 PM, Konrad Dybcio wrote:
>>>> On 6/23/26 8:05 AM, Pengpeng Hou wrote:
>>>>> The HFPLL enable helper waits for the lock bit but ignores the
>>>>> regmap_read_poll_timeout() result. The polling condition is also
>>>>> inconsistent with clk_hfpll_init(), which treats the lock bit being set
>>>>> as the locked state.
>>>>>
>>>>> Wait for the lock bit to become set, return timeout errors from the
>>>>> helper, and propagate those errors through clk_hfpll_enable() and
>>>>> clk_hfpll_set_rate() instead of enabling the output unconditionally.
>>>>>
>>>>> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
>>>>> ---
>>>>
>>>> This looks good on the surface..
>>>>
>>>> +Herman, Anthony, Dmitry could you please give this a spin on 8x60?
>>>>
>>>> Konrad
>>>
>>> Just to clarify, this patch impacts cpufreq and gpufreq for Qualcomm
>>> Krait era, is that correct?
>>
>> Seems that way - cpu, L2, and GPU, maybe others
> 
> nope, tested on Sony Xperia SP (MSM8960T), the phone hangs

[...]

> [    2.679716] L2 @ Undefined rate. Forcing new rate

This seems odd. What's the reported rate there?

Konrad

