Return-Path: <linux-arm-msm+bounces-116753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jxFGDfqkS2qwXgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:52:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAD7710CB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:52:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nn1VysWg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gMfMZdJn;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116753-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116753-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 130FD305D800
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 10:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D903390CAD;
	Mon,  6 Jul 2026 10:58:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B243DFC6D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 10:58:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783335513; cv=none; b=SULIBts8tnyv4RX9bni2LfOu9kYnvqy304aqOAvFTuEKT2eHA0QU7VVqy2trOoc4bLEUXMkos4WLDeW43Z7PozZ1FTxmwKSbuys1bRdBe8MND8pfb/9lcn+mf5bwKjWMWQjV0kTyUTsy/q/0JOxaAXWBcDRtWRtb3CH1wbjwZwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783335513; c=relaxed/simple;
	bh=EKx2jOVEh7Yas0Q0NWiBgP6kO/9BGTfaMxWxpDPONsM=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=sIYJS7dr5Blqvt27YSXJDy8LMmxY4Eajl+7YhxqgXipmMCHgIgLf0cEIFp2FzqFuPG4a45v/D9bka4pjmNaTyBxJ4eaasV1U6eX6AY6GEerhox96bIHD7Tyf3tDagrLyKINuvs/1Z7kyu0SfKKficLiNJAp+iYE3+1vduJhn6Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nn1VysWg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMfMZdJn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693xaE109150
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 10:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KyyE6lR5rSBsyyF5dE8TRdQl
	TxO5jRvW8cHP2PRANNU=; b=nn1VysWgbcgyuRlQhU2A/K8Sukr7qkYLB+zcLIVc
	ydR0QksPSocjF495toWHGUuHIsMmK09b+iz6gaOk3QHOZEfwsXPShXXYX8BTd6q8
	ownauOKg11/+1SyoKkUwHAY+Nsgf7HANuaSueyZg7rxFD1BTPHT55k3iGShmoZ13
	/2xn7MjytThc+BXJNiv5m3LGscTvzdOije7hMv+pZJ9s2vUYZmUwhN5iPY0wgxKj
	y5nUR+bh1ZbUTfUSIIiqQAwBGp4onvrTY719IHt9OPXGTNs20CzXiHHzgyeTtjSR
	7x0g2i11XLOeUsRpg50wButpy5NT5ZCdPSpyqnt6dCld/Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h98ppq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 10:58:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ead919557cso10918816d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 03:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783335509; x=1783940309; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KyyE6lR5rSBsyyF5dE8TRdQlTxO5jRvW8cHP2PRANNU=;
        b=gMfMZdJnU6AEUPq2HKUFXfxOe9btbydb4FKj8BNuHOzQZL+c42o74ntNuF4xxicDg4
         dHfebi/w1vM2UNgbvnjJIDa70JdgDXq8wyRcO3g2bnZuBHQuovGp3Wn3AuH73z1gPvkT
         RRHGBczq1CspusxybaUxteVAeQ01VY7Pt+29qey7igkfMKPXw5rZIXtwKaFUHxVd3kw2
         SQdpHLQcwIjiBqicRFI7SVahcwuPAP5TXSvW5V/Kd+mG2uPX9KtifJ2LDeZFGPt6vpJx
         D6NBtSYO7p3/ccs1vlZ1i5aNcutdKf2246i0klX/ZF5GE6h2WABxQXOltMoCiTQFODT1
         0pBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783335509; x=1783940309;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KyyE6lR5rSBsyyF5dE8TRdQlTxO5jRvW8cHP2PRANNU=;
        b=P0rLD9+ZnKXvkBXeg2cH1Z4A4PJfWbmtH+naPqt5LGkCemNa+5mEsyunS6fvgXR2+Q
         AcJpF7ddoZS2OpWV+D0IMBXvPEyVb0OISGfACPvK5z/HFmmlttsnUdFsxGgdUVAqXA7r
         nE8pnrwll7/d1PjVZavLTgXpHaJpjZFSO/AzbLAlMOLwwo71LYwFy6Jno/DRqOaXsNlm
         Ixlw3nX4NEJWNZ8uD418mcT25/t4tj3Qy9T5hnND1EhQT1Q+1Upppv8Ou8TUliCOz3aE
         4iQ0GUAqnXGRMoEsrl/F7DhQQy0KaUUARzmh8Xb1R60Zfqb+JX+6DnKBQ5ASc/ec1Dfw
         V/pA==
X-Forwarded-Encrypted: i=1; AHgh+RqIwcLuB7W0Z3/0Vg+uO/zckXH2Eba/TZvmVOohINGQwjoL2KF6aFddj3gMwyeE9K9Bbf6HKFc5XbWJDW/V@vger.kernel.org
X-Gm-Message-State: AOJu0Yx368ks/V2ddN6xOR1L5HDOtKHvZ7iaWQgg+UPeAOv+KX1kcwOJ
	10rHo2nBTbzd85xX/E9WgugQm7I1MTZ9Pn/CfSdUZqZEtxI4EwmM7wzHNnogIgNoIeqW+gNJ0Ik
	JMvnT7RIyk2Q2Au56tvWGpifcuJjo+2bIZXCrpRukquLhmikxHaZYle430DGjuYL0Jo21
X-Gm-Gg: AfdE7cmXXbPJ1Dh1qbVnvWnKRiYXqwKUV/A9XqpxYLWph2+WF0IVqh8zkneBBqkqebc
	ogYEYoR/VNoqiu82Is8hG/RIE/f7MYhHSm5P45dnS5F6NIdb9xZC+E3fqeKgmm9aJbC6+aX+Qxt
	VjpjCg9+L2HmUi8KAKdI8ML+o6gQNu1RrGV/ZyGyWiCONaC9lK2CaGBSeCHum1KKzV906OsI22K
	v7sSRG/0RXUsnIybRbsjLHJnrPwjEStBtsKsBwoo9zknoMRx55bEzQv7erbpimNFy+PsswALPKz
	REMs6jXMNA9R5B1aXnHX4Yn+d3T/QlH0LjHt74xhjpF5RXBIotmcIwZzxT/JzkfNWx+KAjWsSGn
	sL5ee3fcASZgmGpmMu9ySRH7peD6P9PsEo9s=
X-Received: by 2002:ac8:7f85:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c4bed68bamr96136161cf.8.1783335509124;
        Mon, 06 Jul 2026 03:58:29 -0700 (PDT)
X-Received: by 2002:ac8:7f85:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c4bed68bamr96135961cf.8.1783335508649;
        Mon, 06 Jul 2026 03:58:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f3b40sm718125066b.56.2026.07.06.03.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:58:27 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------WrS03HCPds46SoHgGJvJqrD1"
Message-ID: <48a406d4-0033-4538-a9bb-75ccc4897a3a@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:58:24 +0200
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
 <89c53cb1-3804-4dfe-8d93-e27e31bc2254@oss.qualcomm.com>
 <42fa946b-43f7-4f8a-a349-f8509daab749@smankusors.com>
 <e129178c-6079-4538-89a2-247185dd0ce7@oss.qualcomm.com>
 <f1749c0a-bb54-4ddd-94cb-75af9386a47a@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f1749c0a-bb54-4ddd-94cb-75af9386a47a@smankusors.com>
X-Proofpoint-ORIG-GUID: b6bt6h3Mhdxd0Z3RaAAznGTXlnDE2p3m
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMCBTYWx0ZWRfXyA059jA8jg/G
 rHfrjLUifgpmqtl8uWFMSMao+gaUD1R81Hl9bwVv9wN+Rtyk0FfFnGT3nShq76i1E7uw3k2iye1
 N4KSTkFVPKhvPu+Jn1llBE5wHaRzokE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMCBTYWx0ZWRfX1tbhjJ5o4W7v
 4/c/nitA0cak/8h4KHI/V9dg1npvPpYeali8T2Jn9cqeHT88STUG2o7ExzWg1N38kUm+MXevnoP
 XJotT7ie5p0k1felmpXrTNZD+HNegAHd1TS7pPPVgDZeO4F7d4i943fhZX+N+m/g//72mLdzNU0
 sGdJyld7XRyzF8UsbyEF/C0OG0wEzcOzFSA4o7GoQqsGLXJEMPuy9y9ztU2eV9zUDZJHG4nF0NT
 Uvc240qg5wk8WuUsuzPi852ukWYA0k2TjrYG7WMr9fMM2pXERZYEeuHj21g5kJTlhw3YQJTxjb+
 RXebBewwVjEM9N0kh37Rqnr/EsIgEZRqToA4H3e4PGU8s/OEHWm+BDr2mkK7c2vizt5VxoqpMQD
 e9DQrAPAjDr7FTY2NAzPC830bo7G4n5dWbdmUcav2Btu9qs3X6NabBQAzlUo9iLUwdZNYo2IpEF
 n0/hxAdCOqZoJd1HdMw==
X-Proofpoint-GUID: b6bt6h3Mhdxd0Z3RaAAznGTXlnDE2p3m
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4b8a55 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=r77TgQKjGQsHNAKrUKIA:9
 a=dLaTv87jCI_4qPz01CEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tUYcLeRNXNVrObFpOFIA:9 a=B2y7HmGcmWMA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.06 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116753-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:linux@smankusors.com,m:pengpeng@iscas.ac.cn,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:github.com@herrie.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	HAS_ATTACHMENT(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FAD7710CB8

This is a multi-part message in MIME format.
--------------WrS03HCPds46SoHgGJvJqrD1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/4/26 11:02 AM, Antony Kurniawan Soemardi wrote:

[...]

>>>>>> Seems that way - cpu, L2, and GPU, maybe others
>>>>>
>>>>> nope, tested on Sony Xperia SP (MSM8960T), the phone hangs
>>>>
>>>> [...]
>>>>
>>>>> [    2.679716] L2 @ Undefined rate. Forcing new rate
>>>>
>>>> This seems odd. What's the reported rate there?
>>>
>>> if you're asking clk_get_rate(clks[l2_mux]), it's 0 Hz.
>>
>> Hm, are the parents registered?
> 
> pardon me for stupid question, but how do I verify the parent
> registration?

Parents are just other locks that happen to be specified in the
parent_data/parent_names field of this L2 clock.

For checking if they're registered at all, you can check if they're
present in the debugfs summary I mentioned (they would also have their
own directory in /sys/kernel/debug/clk). For checking if they're
registered at some specific point in time, you could hack in a
clk_get() and null-check it

[...]

> Do you have other idea how to solve this? I added some pr_err if the
> read poll is timeout:
> 
> [   11.164436] [pmOS-rd]:   ❬❬ PMOS STAGE 2 ❭❭
> [   20.400232] krait_add_pri_mux: krait0_pri_mux, hfpll_name: hfpll0
> [   20.400793] Enabling HFPLL hfpll1
> [   20.455491] krait_add_pri_mux: krait1_pri_mux, hfpll_name: hfpll1
> [   20.456081] Enabling HFPLL hfpll_l2
> [   20.560623] HFPLL hfpll_l2 failed to lock (val=0x6, ret=-110, hd->lock_bit=0)
> [   20.758961] krait_add_pri_mux: krait_l2_pri_mux, hfpll_name: hfpll_l2

I noticed a bug (patch attached) in the enable function. I then realized
the patch from the OP also fixes it.

I then tried to validate that the code we have in Linux even checks the
right register.. Unfortunately because this SoC is so old, it's difficult
for me to find docs for it (and the register layout I have at hand isn't
itself enough to deduce some things), so that's inconclusive.

I then took to msm-3.x and lk sources, but they simply never check the
value of the status register, they just call udelay(60) with presumably
very high hopes and a lot of prayers..

Can you check the state of the gcc_base+0x3420 register before and after
the /* De-assert active-low PLL reset. */ line?

Konrad
--------------WrS03HCPds46SoHgGJvJqrD1
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-clk-qcom-clk-hfpll-Fix-inverted-break-condition-in-..patch"
Content-Disposition: attachment;
 filename*0="0001-clk-qcom-clk-hfpll-Fix-inverted-break-condition-in-..pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA1YzY1YjI3OWFmY2M1M2E3YWZiZDYzZDc0M2UwNTZjYTAwYjI5OWEwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lvQG9z
cy5xdWFsY29tbS5jb20+CkRhdGU6IE1vbiwgNiBKdWwgMjAyNiAxMjo0NjoyNCArMDIwMApT
dWJqZWN0OiBbUEFUQ0hdIGNsazogcWNvbTogY2xrLWhmcGxsOiBGaXggaW52ZXJ0ZWQgYnJl
YWsgY29uZGl0aW9uIGluIC5lbmFibGUKClRoZSBjb21taXQgcmVmZXJlbmNlZCBpbiB0aGUg
Rml4ZXMgdGFnIGRpZCBhd2F5IHdpdGggYW4gb3Blbi1jb2RlZAp3aGlsZS1sb29wLCByZXBs
YWNpbmcgaXQgd2l0aCBhIG5pY2VyIHdyYXBwZXIuCgpUaGUgc3ludGF4IG9mIHRoYXQgd3Jh
cHBlciBob3dldmVyLCBpbmNsdWRlcyBhICdicmVhayBjb25kaXRpb24nLApjb250cmFyeSB0
byB0aGUgd2hpbGUtbG9vcCB3aGljaCBleHBlY3RzIGEgJ2tlZXAgZ29pbmcgY29uZGl0aW9u
Jy4KCkFzIGEgcmVzdWx0LCByZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQoKSBpcyBsb29raW5n
IGZvciB0aGUgb3Bwb3NpdGUgb2YKdGhlIGRlc2lyZWQgY29uZGl0aW9uLiBGaXggdGhhdC4K
CkZpeGVzOiBmY2ZiZmUzNzNkNDEgKCJjbGs6IHFjb206IGNsay1oZnBsbDogdXNlIHBvbGxf
dGltZW91dCBtYWNybyIpClNpZ25lZC1vZmYtYnk6IEtvbnJhZCBEeWJjaW8gPGtvbnJhZC5k
eWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4KLS0tCiBkcml2ZXJzL2Nsay9xY29tL2Nsay1oZnBs
bC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvcWNvbS9jbGstaGZwbGwuYyBiL2RyaXZl
cnMvY2xrL3Fjb20vY2xrLWhmcGxsLmMKaW5kZXggNzA1MzUyYWZmMDY3Li42MmZiZjUxMTAw
M2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL3Fjb20vY2xrLWhmcGxsLmMKKysrIGIvZHJp
dmVycy9jbGsvcWNvbS9jbGstaGZwbGwuYwpAQCAtODIsNyArODIsNyBAQCBzdGF0aWMgdm9p
ZCBfX2Nsa19oZnBsbF9lbmFibGUoc3RydWN0IGNsa19odyAqaHcpCiAJCSAqIHByZXZlbnQg
YW55IHNvcnQgb2Ygc3RhbGwuCiAJCSAqLwogCQlyZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQo
cmVnbWFwLCBoZC0+c3RhdHVzX3JlZywgdmFsLAotCQkJCQkgISh2YWwgJiBCSVQoaGQtPmxv
Y2tfYml0KSksIDAsCisJCQkJCSB2YWwgJiBCSVQoaGQtPmxvY2tfYml0KSwgMCwKIAkJCQkJ
IDEwMCAqIFVTRUNfUEVSX01TRUMpOwogCWVsc2UKIAkJdWRlbGF5KDYwKTsKLS0gCjIuNTQu
MAoK

--------------WrS03HCPds46SoHgGJvJqrD1--

