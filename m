Return-Path: <linux-arm-msm+bounces-116084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mKroCEmoRmqObAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:04:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A8D6FBD37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:04:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IrK+m0Ax;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="WS/0xfJR";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116084-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116084-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 938D33261689
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 17:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB73331EB9;
	Thu,  2 Jul 2026 17:05:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8624E310779
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 17:04:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783011900; cv=none; b=oKgHkwpITwhqOnsoEa8brzIJnGZkmaks01shxStdZVuwOTgXbEK6uhmUfssxXC/jh5yC1AEN1+/vbFgDFfX+nlH2qpkey5z6aXgxQuLvkR+/8h1hZmxXbW8ROD543id0qo2rk49zyAkdIrVyjhbikbs7FRc0il6/ROGMduq08j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783011900; c=relaxed/simple;
	bh=9tuRvVLOkJDkdB2TUNh8MQAFyNvpa/qW/IXJzIeBcH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eKefeYb9/2EH1j44lDOOow/tr6oOI29dhJ75LnFclfJ2C4zW5XfnxCYRh/usq60aMDc9iwFAC3bOc/wC/uYYQvWTXfljB72GAlS+tC6zSqKihCovq/PlU+ryq/hQZ5dnsUaMSSi2LOhndMyUgw6RPH6KSZiLMU+yKK4ajXrEDsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IrK+m0Ax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WS/0xfJR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E39lZ661156
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 17:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1aKxFR/CdIjnlCVHU4kiwY3NDA03NMLY1DVMh4+N76g=; b=IrK+m0Axi+P5tcqx
	4GG5YONU96qyKpeLs0k9AqbX9rhrxn5z+drnF83+NmF67IpeQlIbry/nZOxm5xBn
	oQ9W1RF8OkplTXRINFAlLrSdrkGXPgtArg4TaJZZdtg9Q2caUTVToWU2W5N1ragb
	QQYFQIlAyEhZiO7TUWv7cDKvuNkrXVNfvTb5YzbGStXbUl3F4Q5wjNvhXMh6O13N
	NaYJ0Vp1nhrZqypgN0s4SvvQNzF4Zle9RrHHZ7LjP1gHLpXZFPMoZL31SVwrHQRV
	pUA0chwM2VaNjf2+65xDhZxsrP6tL5PcJUsh+rYtCWAZSdxQMgBw07JsFPcUE7E+
	9swOYA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qfc1fy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 17:04:58 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8478ff5d801so2911919b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783011898; x=1783616698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1aKxFR/CdIjnlCVHU4kiwY3NDA03NMLY1DVMh4+N76g=;
        b=WS/0xfJR/3LVvK8mbNWrBHYVimpaOldoODMXnl3BcU8ZMxI7qpnfXKvswRsT9F2a12
         D5IiQ7hPe74XCu3ZKvjrE+Zab5dCx1/RvFPQVXPjlCwW029pcJiWMrrejSR/OUQbAN7B
         xB5nYaDKGfscNFtWtpC1aSuvMHEsSLbap7n8rB1xiYMF4eGwYCk8hA4x3XxFv1O6suNt
         dSBrYgvy6op/0iiGSvTs9asploj8kP5vs93SzTiz1UZA5xIzACdmjOZYaiJEqJKaHWbe
         AeZ7BEMQyhHZ92SymqpUxEH9y71Vd98eio8Ur8IjhL+l+zG9mRP3rm95qLhEsi8++S1R
         GO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783011898; x=1783616698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1aKxFR/CdIjnlCVHU4kiwY3NDA03NMLY1DVMh4+N76g=;
        b=F16kABq8360VI4PWeyNYNJkkI/vyA/B7PkMlIYOTvH+5u1O/ZSz4zCUxFKd+8y3kNx
         KFVLzVmBaukoKtixILgjZ6cGH1O2UvdQmxzQ3cBBKgeCFFd98PmzZ4rXwsTJtIyqLuEu
         ml1mi7V6DUru48bITGJbRtqYRS/poKzgZz4sTiMdrjqlMa9xnyh3KL8/Rz7cU+m3YysS
         CKZB55EKWQj3dthkNe5+16Q/NM5CgZ6MxXGDig2xSKPLh4Hb8zHeHvs+7wRti0fMQOXB
         HwqKWwRfEZNTXNB2XmwdfigEbjehuqqqmp6X7LPHlTobUZ6VvVX78QGSsvvKRqjOcAcT
         fr6g==
X-Forwarded-Encrypted: i=1; AHgh+RphKDB92fEoLOP2mWtQ9066DTnMZAc7sCdeDUAe3Du7nAHCVbsyXirMISzIYQlUx0vuqS4NvsAn2BXyZCfI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/i6xz+lzIJSt4+Y36uU9m4+eyzfmemyiS4v0g8HWX8XRvBYAi
	cIHGEhxL75CXwbqT4INA5SdfaH5vysPLMZY2kQTI1OaaDFKJkQIepUjiflPq+8klXUeC7o/0/0/
	Ss7yHjwzOO+5gjZ98dtBTZ330ZKlryAcNSj0NE/n6zCUBKIUO3H7bTOIVgVqnsHF1oTv9
X-Gm-Gg: AfdE7cnqohdTl3Su0EFYw4mlR3j7KWmcyR1zSip3pvs7Js3ZV2g/PGhZoc+2FX/XdSZ
	qMgHdqtInBhiXH+icOvf0DttiQ+H05HQKR56dVIdgq95Lv/bpD6Myvs/StwfuTAM2jx/VqXKThi
	VGMHR4Yt+Dlf05N9ZvH2qgio0RHtMvNSOhB56Y0ZpOIHiYC+FeHU9oNqk/TdzRH4nU0Yp/WAGYD
	N+a4uZlPjGjJagSgYpm74gjits3kd7wKUW7RXPmcnuAn0Jm1IKydwft51xhwg+BNnEj3h+MRq2Y
	dMahKHLplLE8DNsTod7NxqND3AW3v7dcILWJ8zQmKcbPFRUosEjifqgKrF6ln40ez64VUl2y/jp
	BdN6vzS50PYQZSicMbnYckWq+ea2MW3Zjs+xWFg7hVhmN3w==
X-Received: by 2002:a05:6a00:4b12:b0:845:c5d5:3743 with SMTP id d2e1a72fcca58-847c0878290mr6759863b3a.28.1783011898014;
        Thu, 02 Jul 2026 10:04:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b12:b0:845:c5d5:3743 with SMTP id d2e1a72fcca58-847c0878290mr6759816b3a.28.1783011897290;
        Thu, 02 Jul 2026 10:04:57 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.232.144])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb79b9adsm1729818b3a.27.2026.07.02.10.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 10:04:56 -0700 (PDT)
Message-ID: <94956a19-153f-4bce-a824-7608bbffc98a@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 22:34:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <c29776b4-04b8-4c59-8f1e-d766bf982a2f@oss.qualcomm.com>
 <CAH2e8h75xeRVvo+jOjRuFaBko5NNCnBX0dawFFsWBaiTwNd4Xw@mail.gmail.com>
 <99eaf1d1-fbf9-4336-a13c-ae8ab789cc99@oss.qualcomm.com>
 <CAH2e8h6aWW_=pD6JAuFB-VqEZDj9x8gZVh9TdvTCRQakKzm3pA@mail.gmail.com>
 <c3922558-dead-48b9-a49c-7d0d6a2dde7c@oss.qualcomm.com>
 <6fbc4521-15d3-40c7-89b3-ee15ad673ff8@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <6fbc4521-15d3-40c7-89b3-ee15ad673ff8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bS_86aaVrWvlKaC5I5Eq6xukma5CE0Ff
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE3OSBTYWx0ZWRfXy66eB6QZam3M
 qDyiT65rwchUB+gD1XlFQkNBKcU+S8+mXkQ/vAlhl4fmfBXUrIkuJBJxGldxvikh7fKFnXsO99X
 ziPRDSBWv6m42MTNe+elvEBTQ7LRLxEbIDryW/JBArMle9sY7A0Gswe1s3BBbzRraHUyfASDF3T
 5e99b42r2gwXlNN/GLDgMtkEfWnEHFFo7bsQP2pd4szZzlEAfmcsC80Sd1NbyXS8F8pyu7Xyqum
 X9cZjw2VbD88a3tmLjefpF3qDFGYVcUncp4N7Zb5NTUPLxcNB+NoVTjew905Gb09SvHep71+rQc
 C2OZAMtvUZPeIAItdn80P1yRD1rgp8kjm9NqzPXlHD8HtCrhfZH5EBfnlACwgWW0uq6qYXFDlLX
 3u9nT7UZjn/qLFO4cvTpe/IeZ4usxGR+GTMMPpALheJ5Uf1sCeYq8TUPvktPFM15fXEyCFZrDsW
 JYBEDKNkkakXJ3jxZ/w==
X-Authority-Analysis: v=2.4 cv=dvXrzVg4 c=1 sm=1 tr=0 ts=6a469a3a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=1q2F+KrbvUZPNaeG7DbW0w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=CDJIOK5pyNGdDAhtdj0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: bS_86aaVrWvlKaC5I5Eq6xukma5CE0Ff
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE3OSBTYWx0ZWRfXzCM+Zytey/3q
 zqf0fLj/45v/3sQmft5EhP7buvr9VHWFcXed8ohHnbcMqoKSJr8j7jpKXuttiQFtS8x1E3CEqdY
 RtoakwIVCRRZldpdQ/O0u4kxBG47zs8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020179
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116084-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58A8D6FBD37

Hi Konrad,

On 7/2/2026 6:14 PM, Konrad Dybcio wrote:
> On 7/2/26 2:39 PM, Konrad Dybcio wrote:
>> On 6/30/26 12:06 PM, Pengyu Luo wrote:
>>> On Tue, Jun 30, 2026 at 5:52 PM Mukesh Savaliya
>>> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>>>
>>>>
>>>>
>>>> On 6/29/2026 1:33 PM, Pengyu Luo wrote:
>>>>> On Mon, Jun 29, 2026 at 1:36 PM Mukesh Savaliya
>>>>> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> Hi Pengyu,
>>>>>>
>>>>>> On 6/15/2026 2:48 AM, Dmitry Baryshkov wrote:
>>>>>>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
>>>>>>>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
>>>>>>>> driver to fallback to FIFO mode by default. However, these platforms
>>>>>>>> also support GSI mode, which is highly preferred for certain
>>>>>>>> peripherals like SPI touchscreens to improve performance.
>>>>>>>>
>>>>>>>> Introduce the "qcom,force-gsi-mode" device property to hint and force
>>>>>>>> the controller into GSI mode during initialization.
>>>>>> Why to force ? You can directly configure in GSI mode. Note there are
>>>>>> some configuration done prior to Linux bootup too.
>>>>>
>>>>> Sorry, I don't get it. how? I know there may be a qupfw, but it is
>>>>> impossible for a normal user like me to generate one with GSI
>>>>> preferred.
>>>>>
>>>> If firmware doesn't program in GSI, you can't have this working in GSI
>>>> mode, its going to fail (and work with fallback). if it's programmed in
>>>> GSI, anyway this will run in GSI mode. So why to add extra things
>>>> without any usage ?
>>>>
>>>
>>> What I can confirm is that fifo is not disabled on my device, and gsi
>>> is definitely enabled (under windows, check the register
>>> SE_GENI_DMA_MODE_EN), forcing the device to enable GSI mode on linux
>>> works well.
It may work, but it may fail too. We rather want to decide FIFO/DMA vs 
GSI based on fifo_disabled variable.
>>
>> What's the value of se->base + SE_DMA_IF_EN (+0x2004) on this SE?
> 
> I'm sorry, I read the first sentence only..
> 
> I think the enabling of DMA and the disabling of FIFO are technically
> disjoint operations, but shouldn't be. The programming guide mentions that
> FIFO_DISABLE=1 is set to prevent malicious software from snooping the data
> from the RX FIFO while the SE is operated through the GSI.
> 
> Mukesh, would it make sense to make to rework the checks this way:
> 
No, below actually completely makes things wrong.
Overall it's between GSI vs non GSI [i.e. FIFO/DMA]


fifo_disabled = 1 = GSI [Neither go for FIFO nor for DMA]

fifo_disabled = 0 = non GSI [Then Driver checks data transfer size, if 
<64 prefer FIFO else go for CPU DMA mode]

dma_enabled = 1 [fifo_disabled = 0] = FIFO OR DMA [Driver checks data 
size, if <64 prefer FIFO else go for CPU DMA mode]

let me know if there is still a confusion, we can discuss.

> if (dma_enabled)
> 	prefer GSI, try SE DMA otherwise
> else if (fifo_disabled)
> 	return error, misconfigured SE
> else
> 	fifo mode
> 
> ?
> 
> Konrad


