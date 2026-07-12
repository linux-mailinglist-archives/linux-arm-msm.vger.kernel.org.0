Return-Path: <linux-arm-msm+bounces-118538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cgR9DNk3U2q7YwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 08:44:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6242F743FF9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 08:44:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kX6VRgrb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JMqfN979;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118538-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118538-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC9683005D06
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 06:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A233E366831;
	Sun, 12 Jul 2026 06:44:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC1B36DA13
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 06:44:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783838677; cv=none; b=Gve+eldsietlsPb3DG2pLTQU6zTiDt7rdVQnANQpqW2rF6xKfPKC+vHV05mYNPXVnL2YMBDAFmZt63a2dolgjNN/+rj9vBMS48UaJ9xFg+5IqHzv8uJB2O38WBHuleg3fzmA3zVWNQy0odzXk28AOodmKtJjsW+gGNZ/JSv/n1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783838677; c=relaxed/simple;
	bh=K+KhjlKpEQaSBSeWKaWZOuXn7jb+3z6ScwiGkkbU8/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sU5SsdWkCcOdnoljA4P3FzEcMt48dbBrGNMN43mLFow+Os8IKYmZN4WA23XWCAmIBUaDjJAnji57iyduhVgRu7du1LYKA2mwGjIPnYA7phOL62gnF2yBovyBlNn4wdil75f4wYq9cX7Q0Rgd7I8m2ZBXc4tYOIgcuWjgqFtvqcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kX6VRgrb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JMqfN979; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66C3wtKK1434838
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 06:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8MFG9unhRrvg7GeuVPVdKkz/kvu28Nz5klqNArkBW8o=; b=kX6VRgrbnvyE/nP2
	Ym2FoYZa5ksphGrGd8OnsONEmCUl8IQJACEwkBRDQbYYoye8OdSu86PcrQhy5mj2
	MhWL6klBCMIUwrfFaqidVoP5yqba3SFa/XHY2S+P0K0+Zh2T6fasnvhJcnw+SFaJ
	UkenkM9BQEcGj/4S95BIZ0xXdLNsMmGBhRJvxMIGRldKYZnfHCQZna7vmY7RjJ6X
	01vKAuRQ3oDYDS6d+SkTPdBgmOIFT2BARqZfnYBJV9tX/IO0/5jUTP45XzvIN29n
	mLho94y21EzhWRrX+Ek58w52dytAKjk+dRy2hFQOk3GDdMhbLaeZMb0x3ZKovEdE
	gQbj1Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekcj990-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 06:44:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38db4fa2e25so2459681a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 23:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783838672; x=1784443472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8MFG9unhRrvg7GeuVPVdKkz/kvu28Nz5klqNArkBW8o=;
        b=JMqfN979jXoUnaNbQLTMs+YPPLY1+i8hUN43kv6sic2TFskyK2KqFW4+JCsurhzce7
         53aX+iBXU/CZHRWaVFHY6Nx5t/AFrmxtO4y0VrOd5t1QqHcmFADjve33vVH+GMjVlc2J
         1vo2QPdxpiio2r4zrmojvmJ7Vh/Gwu5jSkwmWobPVsCuPYDmmKlpL/hB6SDFKsJyH2fR
         DZKkWXO5lEL895RyadcaePvRdwigxn0TH6WHr+4nmIjlpp1t6SfQj+8fgorqQFK1Wphg
         Nxu1qWC+3CVf0lU9HC0dDem40CMCjAvD3tzBBtqKbJclpfhSzJ1VwmW3JvtJlwMZnvYG
         bu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783838672; x=1784443472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8MFG9unhRrvg7GeuVPVdKkz/kvu28Nz5klqNArkBW8o=;
        b=mHK27asE4kUccwyz0SNuWqCNT84rIQm5QVpIq0ClNPsRD/Be0cw9wFePcegvLT5OO3
         Tvikbbj7ObceXaAyaR6AnN872G8yyuriNnhpdldpOY45os6QtHIeIy3wezHPzsaCtkz0
         ID3hj8B98lzOIa991D8yuAAL7mI6yJLWxWkePJcx1lQwfLRvauNA3KPx0hl1/PLPldDJ
         pOd/XC5nNHNITcWqgJPptWLPmev8fbUHA5U+BCL/x3XVP1CTCnZiOBSRjTYvlK3Zmp0W
         RpOC5Wmgu6CP5W6daZBjn/mE58QHWYXEn9t5UgJXqV9uhKFz52HyQ64kFdTuIqSrD/ZO
         zMFw==
X-Forwarded-Encrypted: i=1; AHgh+Rpn+ShlKkUtRcrcNqQTDNS6JC//X5SezPhI40w1c+Z9KQIwVt0jkW9DxGuxwCktHz/geY8Z6B+qdXJFrmSz@vger.kernel.org
X-Gm-Message-State: AOJu0YxR8Ysw9LuDGzgd67fElH2/DwZe/+64oX1KybFwna6Dv3y07oWv
	gowqLsshQGwoHHGeP6uwwOVAt8rLSGt26rbiTICVroTTFcEWi7aKnAEHp2KeJ6rT+jvjRiMSVNN
	a6/RKZ+ZCe9VLQN6Ip6P3nMTT7LnTWI7P5g+Pl4jAmYEgrgqbea36SjMbNwBinkzCFLPt
X-Gm-Gg: AfdE7clcMaz0c+mMNTdmvg3PZyJZADUDiQuwkxSbpXKUuRYc9tL2FK9lek3ORP4ZHNu
	pTYqNrbuPqSrVq8/o/3ZSn2SFNnAQFMExMyleFIu/V/V15Wgg/MS97xK+bRKjZExgBOihml0cVF
	AySwK9XzN6nm6C2prVfYcrpgPnETf4IDew1w7EBjiQLowpXR6virXYd87ATKUXrsVkXW1jHX+fd
	2by7XS6NlcmGtOvLEy1clqv2I+/3ItRGA2OgUK/aWYj12KK7i7ZvoSyDaKMtCw/QmvLIq0ED7XS
	X+dVOZ/6ML/Y9Ont5L/rg9fWlUibhF02Dh508rHN0FLQtJegCQJ/QwmQPWxceSOVVBIFmTOzcjk
	Al11GUFfl1EWHLdUsFHcReQZORzcUFM0vXI3RWZqqoBHRvGkZbA==
X-Received: by 2002:a17:90b:53c6:b0:381:fa5:521f with SMTP id 98e67ed59e1d1-38dc74b9530mr4799484a91.3.1783838672268;
        Sat, 11 Jul 2026 23:44:32 -0700 (PDT)
X-Received: by 2002:a17:90b:53c6:b0:381:fa5:521f with SMTP id 98e67ed59e1d1-38dc74b9530mr4799475a91.3.1783838671780;
        Sat, 11 Jul 2026 23:44:31 -0700 (PDT)
Received: from [192.168.1.5] ([122.164.92.133])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm38644234eec.22.2026.07.11.23.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 23:44:30 -0700 (PDT)
Message-ID: <6438237f-ccb4-4143-9ac7-43f5dcca955b@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 12:14:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260711125740.3083236-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260711-mauve-skunk-of-contentment-f51be0@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260711-mauve-skunk-of-contentment-f51be0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDA2NyBTYWx0ZWRfXyV0oEGxbFeQ2
 /v7lDOdUsEwnagg3SSQBv65MBlIX3v/79/phWOcqDpVJ11vKceCyIEITurqMx4d995obeUJXy8T
 cmSeeLrmwAy/m0Xet9e196QLslYBfq390nzxx7T2XeFLdtjOhd68juy8CzriF4IJJUgAkTZIKTw
 IBCXyWI1kQDXsIQ6QtMkEj8bo+05u3XBrNoLi/KlKSVkglvd2GgaffSpm0PLL2oEaRZR/BZN8Pr
 tqGlVSxtHNAeiEnMaUAXo/7UtqmbPvnmkoGIB0YLhRsaa4hwJNJG71slQM4dOciFNNAU8NkWwSw
 7RVM480Z6RBiW2Il+dGP2NR3uVj5cF0qDIBjnHRN5DUIZdMQJ5oQQvTHdBPr2oLOISY4qkNwMLD
 jEWjJUUVaAqUQNMgHoKd/NQ102FaNmv6Ve+iJmpRgcPv47IBh+sWfLYGQ45KTXbEh0qHHtyS0wL
 rav2x8kZ0x5GNmMCI+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDA2NyBTYWx0ZWRfXzk0Hqx04Aq73
 bRJG4Y7o7nHB9sW+Klr7DwsSrumMRhZdGo+Xx7KKBNwKe/GlB/W5k21oJL+obL7ojjDlS3N3jo6
 ftNg4fg5LMntgMN40ezc9RChY7ctcac=
X-Proofpoint-GUID: IUTnqVrQ5iQLLzEdkLnGUc11HtITLP6i
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a5337d1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=tlK9sNgGSfv7srgBb5RqhA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=LJDSKmyOq5XDa4FDNxEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: IUTnqVrQ5iQLLzEdkLnGUc11HtITLP6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-118538-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6242F743FF9



On 7/11/2026 8:41 PM, Krzysztof Kozlowski wrote:
> On Sat, Jul 11, 2026 at 06:27:38PM +0530, Mohammad Rafi Shaik wrote:
>> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
>> describe Digital Audio Interface (DAI) child nodes.
>>
>> Add #address-cells and #size-cells to allow representation of multiple
>> DAI instances as child nodes, and define a dai@<id> pattern to document
>> per-DAI properties such as the interface ID and associated clocks.
>>
>> On platforms such as Monaco and Lemans, third-party codecs are hardware
>> wired to the SoC and do not always have an in-tree codec driver to manage
>> their clocks. For these designs, clock line enablement must be driven
>> from the platform side, and this series provides the necessary support
>> for that.
>>
>> On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
>> I2S MCLK and BCLK has moved from the DSP to the kernel. This series
>> introduces the required device tree binding support to represent and
>> vote for these clocks from the kernel.
>>
>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Drop my tag, you made a important change to ABI.
> 

Ack

>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Drop, you cannot test a binding (in the meaning of Tested-by tag).

Ack, will drop Tested-by tag.

> 
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 58 +++++++++++++++++++
>>   1 file changed, 58 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> index 2fb95544db8b..f3a8b12d7fc8 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> @@ -21,6 +21,49 @@ properties:
>>     '#sound-dai-cells':
>>       const: 1
>>   
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +# Digital Audio Interfaces
>> +patternProperties:
>> +  '^dai@[0-9a-f]+$':
>> +    type: object
>> +    description:
>> +      Q6DSP Digital Audio Interfaces.
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +        description:
>> +          Digital Audio Interface ID
>> +
>> +      clocks:
>> +        minItems: 1
>> +        items:
>> +          - description: MI2S master clock
>> +          - description: MI2S bit clock
>> +          - description: MI2S external bit clock
>> +
>> +      clock-names:
>> +        minItems: 1
>> +        maxItems: 3
>> +        items:
>> +          enum:
> 
> That wasn't here and that's also not correct, usually. Especially that
> it does not fit your clocks property.
> 

The reason for changing this to enum was that some hardware may expose 
only a single clock, which can be bclk or eclk instead of mclk. With the 
previous positional const definition, such configurations fail schema 
validation because the first entry is always expected to be mclk.

I agree that using enum makes the validation less strict and does not 
ensure the correct clocks and clock-names mapping.

I'll check this and look for a better solution.

Thanks & Regards,
Rafi.

> Best regards,
> Krzysztof
> 


