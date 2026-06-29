Return-Path: <linux-arm-msm+bounces-115116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TfW6Jc13QmrM7wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:49:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0460B6DB84F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:49:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UvnZI2In;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JZIboC+b;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115116-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115116-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2ABB53026218
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124F62EEE99;
	Mon, 29 Jun 2026 13:47:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8BC2E7185
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:47:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740840; cv=none; b=esx6Ex3kIWoLGGotDsrG8K2V8JBDds7golOyUb+2yKLkuse7vDzoIDOY43NhU3kIi1DQLpB5sokRJ2Q4X1gpnBZrb9O+kNSc5t1jxwSc8bJQwb75qEVJQzzPdjIo77M/wr2k+1mbBWCJlXYrF+08z36FdHggXLFnaxYVQDwc/Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740840; c=relaxed/simple;
	bh=cWLGHl+YEJAm1rNw68MYlvwx1Sqs4J/IHHCWaT05NBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yl/xQIJ6tnj2anUC9arms04ScEe6jwNv0nbj3pD8Nr45emvO8g0PWtdNGFm6ivwsHp6OVOLHESO7XqnUs251ay1+GzezEiUJsVEAF9IwgTNc6RO36hnID+xmBTJui275VnYAxsTqBA6FSiCmDlpUaXc3mJCNSbRlLUKKyqzbgus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UvnZI2In; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZIboC+b; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASuue2640837
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ty5H6lwxHqC7d0OKhOvBgcwXdI83azrYSAb+xRBzZow=; b=UvnZI2In3GfAemsY
	O/sVXun6jAWn4X4HHgvgR/KJjR6zloJQip0NU8DhGsrgjBgfLjhqzNEYwW1VpgMY
	gtoJtMvxJauQHRdj9Fi7cqeHO8U2j9AVJuhmG8pwmiGZODliQDZbdYxMmOfhaior
	LJeywYaZy+DvJpleggIyFuJD5jbUBdxgPkCcUVft6Im0ZhVwDBqPovdTVQZhfI6V
	tUp22CO9M/LgWTvDF2lcFMD+3Mp1KiTF4D1z5AudUv+iyiPpxdyhsMXJdnqX2JsH
	w/ByA1iqVeyv4t67aOlfHV65T1R8zNPtaAt76D0n2RI/xb42UA9W3XxhvjSwiCDj
	go3REQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s18cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:47:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a89451078so3054921cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782740837; x=1783345637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ty5H6lwxHqC7d0OKhOvBgcwXdI83azrYSAb+xRBzZow=;
        b=JZIboC+bW+ZXdU0sKOWJomFPLYyhQH/sOUfYHobbj073cbMsDWApk8Opr4ANwWVgdm
         eFhgyUBYFsdc9hyr9gKCjVqogWzL1b5MRSLEB7mQP4CILBBWkGIHNXzcPz7b6xHWwL5F
         aOz/XgScZar5K6d9qWILXYlcSbG0U5DLEfW10M7cTy/hHcPYJ6Z/ORLqcyWT/2OWrHuE
         yNdQxy/lIicqx8YYR7k1fIezWT5hWcl3FruwRSPafG24QRnM/Sw2s5omB81j7xHhhRG9
         4Apu4Prh8gFAYOKRSVb/6gMiklF+hWBxa3A5fgaVxcdGitpLTS9tAdyKFff0GRgGgUpx
         cSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782740837; x=1783345637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ty5H6lwxHqC7d0OKhOvBgcwXdI83azrYSAb+xRBzZow=;
        b=gEORz7pZj8cZw2CsICawBvxjMUO9mLi+IVMFr64XERJZLQMZFxuP2td/IPOLN6hKac
         YLuqWgGZJuVjuxwwGsKdTmfahcR2CnHwi+qxavQioSXJ4Xxbo9ou5iiAroH36ygvh1Bj
         F8z2S1lQZtynksJtQjFNTS4esaqG0wRUSUMmN+tFm/Vq1sqOgEEwRy+mpT6nqhSygVF9
         RpJrbnC3d6OVBGBS83JQEswT3+4yATJDAxoS0R+S7eWPitD129HQCkK2q36Ulh5W2+Nr
         H1WI1oPVDG4ix0IYqmkNkKQDwBaBAGenT5syT8Q5mzkB5BApvwQKzcFL9yQBI4v3uWJK
         zlzA==
X-Forwarded-Encrypted: i=1; AFNElJ8XGJnhXAl7l+LYIv0p0uEUBpB3YANo02GVW0agi7aggOtM/2wM7x6ocWfCQtQmqRfIqT6tvPbzfwytKOM5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp/KQH7+UvN4j7oaPZqr9gQq496a3qRU78iuEj2tsNyo1TtPP8
	6ohBBB5GOZX5kuMVk9lPYlZk8wTY3KJ+4s1yGBxUXcEL/L9RX+ETeDaBGD6NNXYkWM2nyy3EI+k
	h3r6CrNaBv/tb6oCykuxkjr1LtX+0a1HtGJX4TEdh1qtpNRadqlby0cWw1AnsjQh9pk+e
X-Gm-Gg: AfdE7cli1sZT1sczKclfyhgtMLULpksq6FHET9ks67XZiDjciIeXwNXzx279w1h79y8
	ZEFS1zyHQ+rg5Uw3SnYv2gXTxL/uSCU3c7FYuAQ7OVAgNnXIqMzfkcf8aVcRqNEKPmMRX+qsxyT
	ZBPgM3NuLTf9StQ/aFDmbYfaroNX1NuD6KA/igXLSjqLYfiXDGjjhLPBVNk6kwngpY8OCQs7QFE
	0jlkr/1GCSqTCMm8RNs03EdFUxYfjbxBWN3rhR24sy/5wMPBydyP6CMkRAcWMptrJiyLAYu23RC
	u+P6tolFF+TKPc3/DA+C2eJ5spH0PDJlekfLVchyM0fsOmxNn0+8wBNjmccwVPCDiiEmSpg76Al
	rk2Fjy7n39Dx27pma7LDc3YGvFc2ZulEdfzU=
X-Received: by 2002:ac8:7f13:0:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51a8c9b9539mr97100251cf.9.1782740836925;
        Mon, 29 Jun 2026 06:47:16 -0700 (PDT)
X-Received: by 2002:ac8:7f13:0:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51a8c9b9539mr97099261cf.9.1782740835898;
        Mon, 29 Jun 2026 06:47:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbec37dfsm785750166b.56.2026.06.29.06.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:47:14 -0700 (PDT)
Message-ID: <d54dcae1-00de-48ff-b6ec-f57da28c4adb@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:47:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
 <5f32d4c2-f90d-4f66-96b1-c9c7987ac18e@oss.qualcomm.com>
 <ajkvV28hEWFfnwa6@hu-qianyu-lv.qualcomm.com>
 <cd7619b6-a428-4ad3-9926-52b846953634@oss.qualcomm.com>
 <aj33ujz1m9qYOcRs@hu-qianyu-lv.qualcomm.com>
 <c6df90d1-bb3f-426f-806b-9f31840126b5@oss.qualcomm.com>
 <akJz2xNeuzIiE3Vc@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akJz2xNeuzIiE3Vc@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExNCBTYWx0ZWRfXyRCFTqQ0ECbN
 5xSr+hZm+v23Gj+2t/S0/8eQwIMmRnvsUlRo9zcjWKzSLcCnp3no0mqjsV1WrYCTuO1mYukbw/m
 5Av8CpwTw8a7vp6L0sP9OARbeVIn3Bo=
X-Proofpoint-ORIG-GUID: nozehsEFcdtDOjsXrsYxDkfvS32Nn9J1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExNCBTYWx0ZWRfX3uYJXxKJyQgu
 MVRSpSzpiT2GGibczCpoVFklA8Adqv4ZKfRa9VDNCZcAShLucbGBkQ84GGwkHz7twUHfqLCtpJx
 98tqG/HDZB3DiF8X8CAMHEf499So126UNyYpunEj0VqrvetNH/O17Zvad90DdLRfDT8OuD7T8l3
 z4b8OWMrkBjPvP5QRxHe1iy+E7bceLzj1lDG+GuOPFUKTvFiwI22c3d1COW6vRqVL/mk1K3GaGu
 DuNbh9ZHTaVuDIvUY5r5SruXNWI9/rsNNJ+gBE2kIOPx/hTJ8f4mwcAqkecbUaCZGd4vfdnpkB9
 MwtJ7DG+U1HvwnDP0bu9+zPSiq8T3fDhg0jPIt0ZlN9W2Gzq/j1sCsAitVyAHncZA5N1x8Xow3L
 XVu/Z3ULbbn7IKq38aB/ykcFrMETzFTnxE9fwGcgRpLJBL3jFP186JvJsu4WpsEzj4C/JtSq5eL
 2vjsIAdPQCPG//SHzSg==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a427765 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ffaXYdf2Q3_1duncg2EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: nozehsEFcdtDOjsXrsYxDkfvS32Nn9J1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115116-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0460B6DB84F

On 6/29/26 3:32 PM, Qiang Yu wrote:
> On Mon, Jun 29, 2026 at 12:30:37PM +0200, Konrad Dybcio wrote:
>> On 6/26/26 5:53 AM, Qiang Yu wrote:
>>> On Mon, Jun 22, 2026 at 03:03:39PM +0200, Konrad Dybcio wrote:
>>>> On 6/22/26 2:49 PM, Qiang Yu wrote:
>>>>> On Mon, Jun 22, 2026 at 01:35:45PM +0200, Konrad Dybcio wrote:
>>>>>> On 6/22/26 7:11 AM, Qiang Yu wrote:
>>>>>>> Mahua is based on Glymur but uses a different QREF topology, requiring
>>>>>>> distinct regulator lists and clock descriptors for its PCIe clock
>>>>>>> references.
>>>>>>>
>>>>>>> Add mahua-specific regulator arrays and clk descriptor table, and use
>>>>>>> match_data to select the correct descriptor table per compatible string at
>>>>>>> probe time.
>>>>>>>
>>>>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>>> You're also missing PCIe_1_CLKREF_EN (+0x48) (for PCIe5)
>>>>>> which goes through CXO1_>TX->RPT0->RPT1->RPT2->RX2
>>>>>
>>>>> I have removed PCIe_1_CLKREF_EN in dts node because PCIe5 PHY doesn't
>>>>> require QREF. So I didn't provide its structure here.
>>>>
>>>> I don't quite get what you mean. I see that it is there in the graph
>>>
>>> I double-checked with the HW team — QREF is not required for CXO0. In TCSR
>>> HPG, I think the QREF components you are seeing are in an old version
>>> diagram, but it says the QREF for CXO0 will be removed. In the updated
>>> diagram, PCIe5, USB2_0, USB2_1, USB4_0 and USB4_1 PHYs get refclk directly
>>> from CXO0.
>>>
>>> In theory, we don't need to vote clkref_en and QREF LDOs for these PHY
>>> instances, and I got confirmation from the PCIe HW team for PCIe5 PHY.
>>>
>>> I also compared the description of the TCSR_CLKREF_EN register between
>>> glymur and mahua on ipcatlog. Unfortunately, only
>>> TCSR_USB4_1_CLKREF_EN_USB4_ENABLE is marked as "not in use". I believe
>>> this is because these registers are not documented well in ipcatlog.
>>>
>>> So I think part of the regulator lists you commented for USB instances is
>>> not required, and their dts node also can to be changed to use CXO as
>>> refclk instead of TCSR_CLKREF_EN. But the mapping between the USB instance
>>> names in the QREF diagram and the TCSR_CLKREF_EN registers is not clear —
>>> I cannot find TCSR_USB4_0_CLKREF_EN_USB4_ENABLE, but there is a USB4_0 PHY
>>> in the diagram. Can we leave the USB regulator list as NULL or we just
>>> add them as it is harmless?
>>
>> I believe the internal discussions we had indeed point to the TX/RPT
>> elements having been removed somewhere in the chip dev process, so
>> the regulators can go, in my understanding.
>>
>> As for the refclk toggles themselves, my understanding is that they are
>> still meaningful. Although, we should be able to just smoketest that - set
>> all of these registers to 0 and see if the related IPs still work normally
>>
> 
> As internal discussion, the TCSR_USBn_CLKREF_EN to digram instance mapping
> is:
> 
> TCSR_USB2_1_CLKREF_EN -> usb2_hs
> TCSR_USB2_2_CLKREF_EN -> usb2_hs3
> TCSR_USB2_3_CLKREF_EN -> usb2_hs6
> TCSR_USB2_4_CLKREF_EN -> usb2_2
> TCSR_USB3_0_CLKREF_EN -> usb3_ss3
> TCSR_USB3_1_CLKREF_EN -> usb3_ss4
> TCSR_USB4_1_CLKREF_EN -> usb4_1
> TCSR_USB4_2_CLKREF_EN -> usb4_2
> 
> I will remove regulator list for TCSR_USB2_1_CLKREF_EN and
> TCSR_USB4_1_CLKREF_EN. For the registers, we can leave them in the clk
> array, the driver can still vote CXO as parent of tcsr_clkref_en and the
> register setting in enable/disable is just a no-op if they are really not
> required.

sgtm

Konrad

