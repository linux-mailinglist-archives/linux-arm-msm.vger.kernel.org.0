Return-Path: <linux-arm-msm+bounces-99981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIQtBR2RxGnH0gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 02:51:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8168B32E0A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 02:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F4B5315569E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 01:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7FE38F95B;
	Thu, 26 Mar 2026 01:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SlstX98P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JKQCdlfL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D2138F65A
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489481; cv=none; b=EL8gUFGReQQ7uecpDK/VsyJ/VddW5E1BhjHAsn8HcgUbC689yq09rApdFN7//fTkgV6xMw3iab7PalAdKf45XajMrkqkW/dp8rO/j0KXnKkZZcAazatmNaZoUCA+wEZk5nhtPEOXQdr0TRVevFHkDuev8g1g4Is9k7XX6CZqIcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489481; c=relaxed/simple;
	bh=l7f97CKt2YtMqwewMmAG7iRRlNaG2imV8RvlA0oPPB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ppF+k/5tW080mjimD9bwk9Oe19+AEb9yzYEwXZ3hDw1Zc3rh5ZqFyIv00wI31j0Q2u8Jbhk3hHmxaA+k9MZt1CuBNG/hSqkLjlekbYi59ukTYa11AGPaIeZGceCyGJpPUjXB/fFT2VUTWeC18hAvAzDR3uufPLT1mSP+KBXKmkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SlstX98P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JKQCdlfL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q0op3h1432757
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m6ez9EuGU+IEwV61QCocA0qqKSX45fjlTOqhijiaG7o=; b=SlstX98PkxclghRJ
	KvzNI9KeZdcrUZldgm7xtqeaqqlJd18rE1tVTE0HMpLWP9GZ5H06AxfNIH0AuJx6
	Zv3V1aHGHspE4HSiCAzCOKsERYMlt+UKUL2g0YSOoKimBCLgxvnKVYWe5OzgILUG
	Qf9p6zZLRFwwPHGxHal8NaxIlylseRbdei8+fcnM2yT4dJMU5hz4NuZz4BN9+XAM
	YhqICRZn1HDZTo4pgV3UwE5G0Kw2TvAmbPw/1SjVXw0M5cWGYWXiDIDxSRL97olw
	A86I9LpLVF3NVYTgLy1AVLP2A6gJucQasO9qaWpBI1QGyf3gI8jsTCXYfOCTznPc
	KTykEA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4jc51wfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:44:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c1596fabb6so2294021eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774489478; x=1775094278; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m6ez9EuGU+IEwV61QCocA0qqKSX45fjlTOqhijiaG7o=;
        b=JKQCdlfLtKnixx2JK/T3o57zl9QB8zjZr+Jac8fS2Khzfkduy5tvLhW/O9PU/DFDyK
         i11r86n2gkqZgkZiCQQ/tsUry5etgYlpL+8Wy68uxTJZs6BUh9/c2AGQ7qw48IRWaouG
         1YsNCOeMQCaQe1o2xvGuptw0OzycIjBsnYRAEoZYImt3oL1diiR4L1eBInG0f+LOZCa7
         zjGOvvRP/NM/VREoEbrkIHob7pjuua1XalZVuyXcmFQkWiqjOgxIMgOdal7nWNdc27Ao
         c0L6nltabvugGMaX6kstkfdmjaTCjCYFdqvzivCLlw3WnaR4yp1PhBT8+nUmuSGeWwGu
         keqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774489478; x=1775094278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6ez9EuGU+IEwV61QCocA0qqKSX45fjlTOqhijiaG7o=;
        b=GWKZG6UICR6ds/71VhVjnzewKCUbw/qhCgNwMIIjOCVobRj3QC1z8PGm/unMXR+QH1
         pc87MbBN1nir49HkM1ZnTKEfVyGzNZbs10OzdjK0qAA3um2Bx1gyNubclpPJwxr0hvpL
         OuRTkBZQAD+Cw7pV7t3pcQdGv2TAKpW9xUaIYNIp8Es4SxXiB/Hf6usELnesPin7Nd0W
         Oe0hz6diFnxUDB06WSm5FiyVf87P/DH3197gHJMYG1p7awC89mScRK3IBCLTDWfmqKYg
         hmpFQb78HcSA3v4stXtMPN0a4ZrJrzCkvVtA4yAKX15OSBFYCgg2MTrj83Esl1D07cuz
         LTSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8VtSUeUN2B3pVhHo97UnqAC8RvfeRnIyihrHIML4oHRtzJ9o421EEzwGQ7xUm31r4Wy183Nr/qPUiIRDP@vger.kernel.org
X-Gm-Message-State: AOJu0YzigQDYGcvDCyKrE6/HgQg/TvSnhUZOWEFQh50KLJ1IZRtdIzsP
	zLEvFZ0ObVArXwn1FGcMXh0iRZdI+V+yccrReIqw4fq4mFgF2LqfqeS++M9fVgXk3cCqQLLEEFx
	KA+Bwetiz45rD7L+9Sv7Tgwd+/DSP8HUHSdIpBNLWw6DEyul8rrVSCJREyfD8ZHbUCcceEZBhJU
	h2
X-Gm-Gg: ATEYQzxsI2HaJDmN25HHsdzfZZ3MrSb+WyxnbTkBiXOyfQwczwT99Nj2vxRv/cGfK9V
	z6tT9nAXqJy4U0xgGCal0fcefbbzW+SbblWHWhjOLTGb5f8lS4x+ZTASO9zd8d45GOPPPKTi/9b
	WCtxIAZRJDL8DB34vg4PoL65PbLp6ldduawUCbAjL7c8sfD6lDzkvxCJHkvKJG7I8/ReVqXmEUZ
	WZkpoRvFNjjqfgEjxrtbajgbQJKS6qSKmOVby1D0vGhpRR4Pri+AUBO2RtUDuv6Vw0QOkSjT/4I
	ppp96rjb2Xw6ukQL37mmRxB4+TOc7UdwYpKpjOFSwG3JqiYadsH+zGzzqR7upeZvZERdV13mXxP
	GkLlqmRA4Hl7BaxTGLh0IrF+EMtMqGmFxxZkO1zNo8AesvrlJ4T4=
X-Received: by 2002:a05:7300:cd8a:b0:2c1:27c:75a0 with SMTP id 5a478bee46e88-2c15d340c05mr3216057eec.9.1774489477958;
        Wed, 25 Mar 2026 18:44:37 -0700 (PDT)
X-Received: by 2002:a05:7300:cd8a:b0:2c1:27c:75a0 with SMTP id 5a478bee46e88-2c15d340c05mr3216033eec.9.1774489477341;
        Wed, 25 Mar 2026 18:44:37 -0700 (PDT)
Received: from [192.168.1.132] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec277edsm2104460eec.3.2026.03.25.18.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 18:44:36 -0700 (PDT)
Message-ID: <28c9c2b5-feeb-49ae-9d4c-51ac571ad8a1@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 18:44:35 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2_0/1=5D_dt-bindings=3A_connector=3A_Add_?=
 =?UTF-8?Q?role=E2=80=91switch_provider_phandle?=
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260324172916.804229-1-elson.serrao@oss.qualcomm.com>
 <CAO9ioeUhkwCPsjS4Pm5DKHZdQjLxvfy=fkcJfbF2hsgq9Ljqww@mail.gmail.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUhkwCPsjS4Pm5DKHZdQjLxvfy=fkcJfbF2hsgq9Ljqww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: asTb06XVUnAKJ3KX7rM3dyhEtnbPTGtK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAxMSBTYWx0ZWRfX0pm47uWhY2IK
 PPPMaAlq/9UyB9XSlB/6CU8VC/LnxkRM7RXNuWhGqVJC7dXH8/fF1RiQ8gE5cE3fl+FYEfN30uo
 JVkIOszeSDouxqMi0+ZRQe7bjzbYCHVI3Dht3vbHweU4MdoUM78P4vM/+L7anBZzZ0e5pAxTyi2
 Nbv2mPT6gxlmmixcAvQGFpcOXaRVlZtqsi66K1zw6Iet2VAw04ukuOEI0h1/sh/IvkygOr6aJQ3
 VPJo7NUrD1p2RgApSNqqGKvIuIllOTcsw5wRxhj9iMz6W8xt6+rrG8XDb5N+QyoW81PluoDWRwz
 /BMD1hruugiKmWireojcp9bt68vdrAzsVP2zzKKoR58XCH1woQilSBJEinuz4zTw3crMmlicHi5
 qxCCR2jX7Q8l5/K36jhsQZCi7pYaZzg+7OR8d/6Mws5TnG6GIHMlzqE4VXOTgh+Pjc0HVDH/QQl
 bCjaZR/7bSojJu7mr5A==
X-Proofpoint-ORIG-GUID: asTb06XVUnAKJ3KX7rM3dyhEtnbPTGtK
X-Authority-Analysis: v=2.4 cv=KaLfcAYD c=1 sm=1 tr=0 ts=69c48f87 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FUNPCKqUHVlFUV5SY1YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260011
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99981-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8168B32E0A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/24/2026 10:46 AM, Dmitry Baryshkov wrote:
> Hello,
> 
> On Tue, 24 Mar 2026 at 19:29, Elson Serrao
> <elson.serrao@oss.qualcomm.com> wrote:
>>
>> Hi all,
>>
>> This patch proposes a generic Devicetree mechanism for a USB connector to
>> reference the USB role‑switch provider when there is an intermediate,
>> block between the connector and the controller in the OF graph.
> 
> Please, don't describe what the patch or the change does, see
> Documentation/processes/submitting-patches.rst.
> 
>>
>> Problem
>> =======
>> OF‑graph links are strictly point‑to‑point via remote-endpoint, so a
>> consumer can only discover its immediate neighbor in the graph. When an
>> intermediate node sits between the USB connector and the controller, the
>> connector cannot identify the controller (the role‑switch provider) from
>> the graph alone.
> 
> DT is a hardware description. Here you are trying to describe the
> software behaviour. Please don't mix those.
> 
> [skipped diagrams]
> 
>>
>> From the OF‑graph structure alone, Conn‑0 cannot determine that
>> USBCtrl‑0 (and not USBCtrl‑1) is the correct role‑switch provider.
>>
>> Proposal
>> ========
>> Add an optional consumer→provider phandle on the connector:
>>
>>     usb-role-switch = <&controller>;
> 
> An alternative proposal: let EUD register as a role-switch and then
> retranslate usb-role-switch events. This is how it is handled by the
> Type-C-related objects (muxes and orientation switches).
> 

Hi Dmitry,

Thank you for the review and suggestions.

To better understand the intended model: are you proposing that the EUD
register a separate usb‑role‑switch instance per connector → controller
relationship, or a single role‑switch instance representing the EUD as a
whole?

I understand the analogy with Type‑C muxes and orientation switches, which
are typically modeled on a per‑connector basis. In contrast, the EUD hardware
block spans multiple connectors and controllers and can carry traffic from
multiple independent USB connections concurrently.
For example:
  - Connector0 operating in host mode (connected to Controller0)
  - Connector1 operating in device mode (connected to Controller1)
  - Both active at the same time

In such a scenario, a single role‑switch instance representing both
connectors appears ambiguous, as different roles may be active
simultaneously on different ports.

Registering multiple role‑switch instances—one per connector/controller
pair—would avoid that ambiguity. However, this would imply a single EUD
device registering multiple role‑switch instances associated with the same
firmware node. As the USB role‑switch framework currently assumes a 1:1
relationship between a firmware node and its role‑switch instance, this
would likely require non‑trivial changes to USB role switch framework on
how role‑switch instances are represented and managed.

Thanks,
Elson



