Return-Path: <linux-arm-msm+bounces-113967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id izapGxQQOWrUmAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 12:36:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D63266AEBE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 12:36:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oLd6LJM3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=emIBGMPj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113967-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113967-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88E66300D924
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 10:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6325370D7D;
	Mon, 22 Jun 2026 10:35:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71494365A0F
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 10:35:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782124540; cv=none; b=PTCG9fYMBZUFJI7lP160aieY7MdJGC8vScJ1zdltPgYU+UVwdwtZAwS9ZB9RStxYsKp+VoPGv/cj+SvU/WsOG3+sFLVRHy+DzXmjFOvB1E8Nu+fqKd76C/AUdN7gXviONkSRQzDllOJZqYY5ydJLPGU45x2g2pTe7m96K4SYJQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782124540; c=relaxed/simple;
	bh=ybDbDgEQCbGWYNmT77Qma+WdCRNJi0V6KPZ3tEaEJbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShzMPBPf2vmjJGkj/uiCm1Kn7BUhXa2+2la/sD9xE4joLKKZgZ9PvC5g5NnnH6u65oBGdYbzW3xQOSkqmkukLLgdiY8j2zONdO7C9mjK9MNgIKl93cStepJG/y1i5wa6K94KvLyt1OXcFbmcTuN9nRF2K2Jc5M2ssTqRYnjYZ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oLd6LJM3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=emIBGMPj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAW600435442
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 10:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wz5cN6jsiGUIDg9U9pmEbpCmOQJeHcDs24G2sv2VOWQ=; b=oLd6LJM3VldlGuv6
	d8+AcPSPM05BCJCXWdUSrOj4HMxM+PDx6LLKmsjBygdd+zbKpFLaoQpgQSCfBRfr
	GTUTKvY7leVtifj4Jb9pSetTqXqPaaaWC1eWcJIFd2u+5aKMUBU5gXRst5COtamj
	ARTC8zvolVkLqi+lrdxJtdk3dsjnwfIlJYHTxA6yQlITkxbCxIXo43d4Whtopj3G
	Y3BwNh+in/bDdrS1dYBMg1NScYHIzKxkWfDVC8v/0sAaiDzX11iSq8hCdLpBh0Kb
	MkahxDYlNdMWS2846ZYezemeBdP95AIX112BZIQwROHwLxJxf7skoHQ7Xo3hkKKN
	z+oexQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3cq00gf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 10:35:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8dd70b510a3so9559206d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 03:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782124538; x=1782729338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wz5cN6jsiGUIDg9U9pmEbpCmOQJeHcDs24G2sv2VOWQ=;
        b=emIBGMPjZmbenD83TcVzT+LkCb9G7vlE8HXYnZghi2oJTApW3gEHpWzd8bBpWxXCbg
         r6/dYIZ6c6qEDEAtNTQOLYS3rEq1i/ecoATejwNcATfCWd7A/wGad5hZrTCDUah71gmO
         MRdx+L7OiItik77/eONQH5XtzbVBnqcSYg+WMTCUvPtXFI6q+LvUD4C9wX1Vra+bCpzO
         QTpQfI6IADow5fKlDp6pH7DwgLfvxTAmhb9bTkAT9BdZrOckieVEsKWHlpO3wn3+cuLd
         gcULcBN0PRYIIPH+ij4+eXl2zYf7jh01ERijLQr4pz8upgHsMmrxrj0YZfuahbgUQ28N
         nrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782124538; x=1782729338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wz5cN6jsiGUIDg9U9pmEbpCmOQJeHcDs24G2sv2VOWQ=;
        b=oELl7KPaEjbgJbX6Z+8MQGanrWBGXSGsQsqGtiFl3NLSHlzuxyg4btauiM+97Ut0Hi
         nSo9xrxDf/4av1KTm1W/RkfHH5yv4DSml1lwc+GSVWVoGGKIJBkmtkZaxf1utQALmRCk
         uR2rhdAbHIyVirYrwOe89tviXyWZ4AuNmGTGggiwnKN2Gw8zWaFEI2ki91QDjZXP8/6X
         6kgk/AnGe70eLGsLFaM0ZQuh3soRWdTKgmC7Apgi35S/MvYPjWUj/ILqgr7UCj/46LPA
         Ecqkt+n8iIKbVWSUe4pckuMPAR90gv0DmVraI66x/DZ4y0zrzn0rYSXRnmdg5124zmLb
         hdEA==
X-Forwarded-Encrypted: i=1; AHgh+RrNxENgkD1HQ9vjQem84xiF4ze8VSYnKurJ0EPU13rHeqFeqBpDVFjmh6Y3UVrcHbMvEfVBn+5UnEwz9zIm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq4uQxoUiiTpLXgWm4nBizmKldif0ZLFknFRCQ4wDwJSAr9XPk
	VExrEj15V34o6ZTcAJLStKGZZ57WvgJXpIRPV4F0VXa0sHLIzRAncH7Xons1whOhHzEgrE3avDl
	GDmca38L38dt9D95MIuf01u/DdTVeZrkeQhgKopckeahYs5gFi0EefsQvwKVS3TeMA36d
X-Gm-Gg: AfdE7clRQWNjbs00lzf1sPpS4Z/uYJZBpnZcK/D/dix3BaUwleBHH1fqx2tIKA18cI8
	A8J9Rzimwg32o6MUe0ufndpTM1mkIZvyuBqOPECXCCFb58dOs70Vb5BQ9SvLe+slx/nEqFTYi2u
	2Woom10vjO44KPzEhsBGjwGiGgNLZbDoeXj4PZZm9NKVjVz/bRnXHkJ5jTJtxosxotnzmHiyQrk
	B8LPLeLyZcwQcWjov/cqE6LhE43WuC2+3Lb0bfdCcMK2hLXFDzGSC3hngi76mSDCIjtMwIKyDfa
	l0DWZFIAC4PxpelKRPYcDWIYJZz9Uz3LMgxS2Loe8DATM0+728GUigsLbuuukm/muIJv6iUNsX4
	ajeDFULvemQu7gv2SAvBeN2e46lINv3c++kg=
X-Received: by 2002:a05:6214:6004:b0:8e0:c7de:1a38 with SMTP id 6a1803df08f44-8e0c7ed60eamr62570706d6.4.1782124537641;
        Mon, 22 Jun 2026 03:35:37 -0700 (PDT)
X-Received: by 2002:a05:6214:6004:b0:8e0:c7de:1a38 with SMTP id 6a1803df08f44-8e0c7ed60eamr62570296d6.4.1782124537229;
        Mon, 22 Jun 2026 03:35:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be49b7asm2835424a12.21.2026.06.22.03.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 03:35:35 -0700 (PDT)
Message-ID: <4d25f656-1372-4ddb-9e52-8f381700abed@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 12:35:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] clk: implement sync_state support
To: Brian Masney <bmasney@redhat.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
 <20260616-clk-sync-state-v2-5-15f82c64d95c@redhat.com>
 <CAPx+jO9JiV16ePLk59hTQzEMnA96Va6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com>
 <ajK29WcueJ1wLCLQ@redhat.com>
 <CAPx+jO-tHYUa5oYEjuCdgF440viiR=Q6O-X6q=JNGwLgS_stsA@mail.gmail.com>
 <ajRfSbkAYusH5H9H@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajRfSbkAYusH5H9H@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 35PVxkLwA69WG_78NRz3ZBI9jlZn7ZqF
X-Authority-Analysis: v=2.4 cv=VKXtWdPX c=1 sm=1 tr=0 ts=6a390ffa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=20KFwNOVAAAA:8 a=ndTenVKbHRbPZtASR5oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 35PVxkLwA69WG_78NRz3ZBI9jlZn7ZqF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEwMyBTYWx0ZWRfX3QGPVagx/kr4
 OsucK2M/ZZpOX6cNOVyAEKuD5scotFRUCqV3ODoBFD3Tbn6xhxJcHx4t4NBFTS/bdci/KVdAcqt
 j+zPAnH1/wiC9Yw3POPP9qhxUQwJl/hXFEQPOVp6fXsnt5c9c1IaUwqokQuSYIN6ATuwgvD9paN
 UsYdEjgxa1Xjz0jAPFQwETaD8tY7ETLa2T6DjfsZF2htyUf9r30kYd8+Nacdv9xnThcfQ1qHMPQ
 Pb2jdddZsNO4mJdd20F+v/YNiJtax/4ZnlDH+gBVmagxWLCPjwbakmDHzSEBk0UQj5vRQWfGOE0
 VJm7ZH9f2aiLJcrpb/YssYGbpQp4GYQaHXQqg4vk+13l/DYsTdVJUorTIFdnIZR53dLrdmSVsTn
 y+aJ1Aw0Kzi2YShK5Qo0xlPG4C9aDTt/FDSAaaIT8qdEM746xyIf8MpADw78kyxESuhbrCiIJwy
 LjUw3ZRoa7OQFM4wDsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEwMyBTYWx0ZWRfXxJmVbqeoOQGb
 sXRi72suG6THY0278g2hEhVaEe35O6C4E+758cwROQOyCbk7Mh/6Vz5KolEZMzkJKUXmlpYmBzm
 ulp9xH1Vk5MpF594wgBUgxEU4QSO7Yw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113967-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:ulf.hansson@oss.qualcomm.com,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jens.glathe@oldschoolsolutions.biz,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D63266AEBE2

On 6/18/26 11:12 PM, Brian Masney wrote:
> Hi Ulf,
> 
> On Wed, Jun 17, 2026 at 05:29:51PM +0200, Ulf Hansson wrote:
>> On Wed, Jun 17, 2026 at 5:02 PM Brian Masney <bmasney@redhat.com> wrote:
>>> On Wed, Jun 17, 2026 at 04:24:05PM +0200, Ulf Hansson wrote:
>>>> On Tue, Jun 16, 2026 at 11:09 PM Brian Masney <bmasney@redhat.com> wrote:
>>>>> @@ -4345,8 +4382,17 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
>>>>>         core->dev = dev;
>>>>>         clk_pm_runtime_init(core);
>>>>>         core->of_node = np;
>>>>> -       if (dev && dev->driver)
>>>>> +       if (dev && dev->driver) {
>>>>>                 core->owner = dev->driver->owner;
>>>>> +
>>>>> +               /*
>>>>> +                * If a clk provider sets their own sync_state, then it needs to
>>>>> +                * also call clk_sync_state(). dev_set_drv_sync_state() won't
>>>>> +                * overwrite the sync_state callback, and this call will fail
>>>>> +                * with -EBUSY.
>>>>> +                */
>>>>> +               dev_set_drv_sync_state(dev, clk_sync_state);
>>>>
>>>> We have cases where a device node represents a provider for multiple
>>>> types of resources, like clocks, power-domains (genpds), resets, etc,
>>>> as in the qcom case, for example.
>>>>
>>>> For power-domain provider drivers (genpd) we also try to assign the
>>>> ->sync_state() callback, see of_genpd_add_provider_simple() and
>>>> of_genpd_add_provider_simple(). This means the above doesn't play well
>>>> with how genpd behaves, so we need to figure out a way to manage these
>>>> cases.
>>>>
>>>> In this regard, we also have of_genpd_sync_state(), which allows a
>>>> genpd provider driver to explicitly call genpd's sync state function,
>>>> if/when needed.
>>>>
>>>> Unfortunately I am not able to suggest a detailed solution for how to
>>>> move this forward at this point, as it requires some more thinking and
>>>> I am heading for some vacation very soon.
>>>
>>> One approach I initially considered was to make it so that we can have a
>>> list of sync_state callbacks that can be added to. I already did some
>>> work on this, but I didn't think it was worth it for just the QC clk
>>> drivers in isolation, but it would address the concern here.
>>
>> Right, maybe that would work.
>>
>> One more thing to somewhat consider, is the problem I have been trying
>> to address for power-domains providers [1]. At least for genpd
>> providers, we need a more fine grained sync state solution, which also
>> must be able to co-exists with other subsystems sync state support. I
>> am not sure if something like this is needed for clocks too?
>>
>> [1]
>> https://lore.kernel.org/all/20260508123910.114273-1-ulf.hansson@linaro.org/
> 
> I am not aware of any clks setup that way but that's not to say they don't
> exist. Stephen, and/or some of the folks from QC would know better.

I'm not sure I'm following, but we do have this bit

qcom_cc_probe()
 -> qcom_cc_really_probe()
    -> gdsc_register()
      -> of_genpd_add_provider_onecell()
        -> dev_set_drv_sync_state()

and this patch calls dev_set_drv_sync_state() again in __clk_register()

Konrad


