Return-Path: <linux-arm-msm+bounces-91606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJsWLKeagWl/HAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:50:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D79B1D575C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 81E363098D7D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 06:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B3B37D12E;
	Tue,  3 Feb 2026 06:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mneahL2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JXXUUHNA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E9437C11C
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 06:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770100503; cv=none; b=EAiXklFnla75HmJtXgtrrTelJLi/of3ff+3I3JO6FSXBPTjDIRQE/aEqogSkEjbDG7GuwQ4vItMWTR8guFGmT05cfRy91nxhS93SFO7y9kEGNQG2ZsXi6tO83/Me4NSDrDz8StRz9u1nhy0VpY2zICaHpZvNTPtumWTJ0PFWV90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770100503; c=relaxed/simple;
	bh=kLo42nC/CMQkUpDuTBBs9hDRkHwvEJGAXbbpyQn7dOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VulAkKlO/QW/m9U8/YxOTTsxvetg8rpazMDR6gIyl/Rm4NLmFV2iWpDLkMgu56gUWprBZ9bz5MICreGUU35F84TPKymRrWe8LSc31TFPxzKz+6qNq15KaJLlTdAyN2GJb7UbfH88jBho3VnshhHAEUTPu7lkcDEidM/hwqEDGAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mneahL2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JXXUUHNA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612LSY6h2884535
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 06:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AkE8KznTRdzwXfvi+uNmFo4jp4JAIhjKU2Tihz5DhE0=; b=mneahL2sZfFHGpdx
	rrWFIRmSI8DZtoLczj27kES5jlLLMU4MY652aQJ3odnUG1JNbulHZFCHAijdQL1k
	Q6ozoweJOptPfITqqkFlm6btrAYjV/ioYkJz2cZKXY3SNIM1DD0U/z9ZpCZXo+Hd
	aRkdWITkS9/nBBYWxrJiz8QvVfW6q1h+HhhgtlNrg8c8mz+KtrbK+RXUBUEimoft
	C6JX0OrHdPkUY4Qj4hPRsrFzDAKHzyyhk034KeO0zMM0Ia1vA2eGfBlOf4Wb6kIA
	zrIa4ougxJxEHhx5jupWyeUKtpG+B93/2YeG5rZK90kIX0ZbXw72fhypGmnfySZF
	P0DdFQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2uu3k0mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 06:35:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81eef665b49so12721112b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 22:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770100501; x=1770705301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AkE8KznTRdzwXfvi+uNmFo4jp4JAIhjKU2Tihz5DhE0=;
        b=JXXUUHNAWgI2cDdN3jR/UxqGYa0boaEB1J3a47Q2ku4mAz1RMpoD1o8Lh0nuIDDAw2
         hDmXTOQOXx8mZR2MG8pic9eKyX6SfGw/LENoeLdGRRGuT6UW+s899oDo4a5qo+WTwurT
         k/X10rL/M7adr9QNRe8XjgyiiAo5PnXf1NhJOyeDdO5bWXccSMZKNt+2E+kNLwoTxbdl
         bUnNHaCGW1jYEAzzCs3T9jmH6Pnhg4UTOa7SR2kprYEc8VYql0UByNOp9rVRo1/i96Qu
         IvMjx9N4Aqt1QY5JEtdv1QOQoSfvhO+w42E/rFe1Pd3X83Nr6+TceTRA7oSJYaGuy30b
         njbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770100501; x=1770705301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AkE8KznTRdzwXfvi+uNmFo4jp4JAIhjKU2Tihz5DhE0=;
        b=M2MqKGMKCoYlekifVw0pY1a0kFTIm8iEa5LH0mYBFJvFVPS2uwjdCmdekhPdxXmpok
         XTUye71MtcCE2wJ5OdZUadX1Z2qsvaLkEnO8LmXTDXjIgjLiKrEwfaSRdQVVTDszuL6n
         rrOEVZE5D6l8p4/Yhcke98tS0tffihG3tXsDsotp2yV0Vda8UbshU9zopOG0vvf5TEw6
         cVjbO01o+ZmMWxRj9UlGILh+R+a0dsanYo6HaxBGHUHFo4YCkQuWCUc9qX7VYtIoVspj
         vIcFoKiIiE/s8SLlZX0UY78mlNo/ugU135NbphcsaR7l0pQkB800KTnnt6G4UdJaocU+
         Eu8A==
X-Forwarded-Encrypted: i=1; AJvYcCUmqtMhipaHdyDlNcyEUHi3nsQYkmgCShXqoBGSVCk3CyxtS5bEwAOjtf34BI2q1wTVdoBR+M0M88TaIpBt@vger.kernel.org
X-Gm-Message-State: AOJu0YxAKZbpucIuP4n41OZHM2Vk/tdAHkTEE6i7ql+rYuWlfLkQC+10
	o1ad/g24K2X4UISRC362UZItQ8wdJZUX4jFMBiuHPPLYnV2GpFePX/L4JtT+fjHJXukko8KPvPd
	+57+SSSR2pPf7Ppi3SDHb5XivJOp30A0zW5+dEJTucMuIA7t9YUDkdY99nA9yfV0w8JCg
X-Gm-Gg: AZuq6aJw6/NHeXboTOkB09rdqzFXs9cVPXSWZTa2CeZk3KGWlyJRxa6JSZg+UfHvbkV
	Nk7CWYD2DMB0AzObXTcbYFxfz0m6dLt5CFrZaJex6vXcTvRIhBZU86BTPoo3MUmmhkW0F0b8QfM
	DJ/L/jrEHEsLPG3jtBGM7bndFcajtHu2GbkZWjDYtnHRqL7StiIVjzjh/esl0Gj7OjNpV7atprY
	h0kwy23TAO638c6W6PpaEgvOjbqhqVOhBFKKdf/kaBfpsRCI5gI4PZPgOHAn2q1aaihnJg6nIeb
	piav5tE1L996NC0deOx7JmYTCyvyqK1gfQdUiD4p4UojxlxRynN+dIl9RxLYqBfTkTxcmP9kgUh
	v2LzMg0jUNGqbq30UFxOKXHa2ARaeu0adE9i5gnXpjA==
X-Received: by 2002:a05:6a00:39a1:b0:7ff:d378:98f with SMTP id d2e1a72fcca58-823ab748a35mr13943112b3a.37.1770100500696;
        Mon, 02 Feb 2026 22:35:00 -0800 (PST)
X-Received: by 2002:a05:6a00:39a1:b0:7ff:d378:98f with SMTP id d2e1a72fcca58-823ab748a35mr13943093b3a.37.1770100500252;
        Mon, 02 Feb 2026 22:35:00 -0800 (PST)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b1ee43sm21812210b3a.4.2026.02.02.22.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 22:34:59 -0800 (PST)
Message-ID: <f4420072-4540-4e90-a22d-02b79784c3cb@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 12:04:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Questions About SM8550 Support
To: Aaron Kling <webgeek1234@gmail.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <4d73907d-9915-44a7-99c7-2294c4be01b7@oss.qualcomm.com>
 <60c970dc-141c-4a2e-aaee-719786371eee@oss.qualcomm.com>
 <CALHNRZ-3nr+EF_m3UpLHRfv3bpOdzzxSZfnnk99xH87MM8WiSg@mail.gmail.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <CALHNRZ-3nr+EF_m3UpLHRfv3bpOdzzxSZfnnk99xH87MM8WiSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mk-Bp4KKAOLiQsT3-6nbl5ZkavXLLGrT
X-Authority-Analysis: v=2.4 cv=OrRCCi/t c=1 sm=1 tr=0 ts=69819715 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OeuxIFDhAAAA:8 a=Oh2cFVv5AAAA:8 a=EUspDBNiAAAA:8
 a=NN72JZ1ADLJeXdnlg3gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=USl8sPKdY6I_7jokSFGp:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-GUID: mk-Bp4KKAOLiQsT3-6nbl5ZkavXLLGrT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA1MCBTYWx0ZWRfX8LJFXayQTzYi
 wGjAGtY1ndbPB+57yrHPGD0wXSsFQZiF7kgMfG6tzqlVebVCU6o2xJHJpfp1GcfcN+BCi/SbBrm
 kleD0fPf7rmlLOaz38mkaefixym+oWeEZoQOT41XRffD6wnFFZa6dhGUouJd48NCdOXRtAuGQXR
 ktHKBtrxaGicnedJup4VKx5n4LKYIC6Zxe3dckHmX38TJbzPYfNEUOwgSR/+S1JQMeaNuZvUEeJ
 QK2k/eDJJ1ZrG+Jyv4RbjrggNyQz2nF/Acip5M547nqsBn8XlaVNRuzwpNdy+qwJt6e0zz75WD5
 Mc1+xqyEl0Nq49IiIzwEVwLeWY6XDGpmyEeiSMKrWhEI3ZkWloxALFNa1Pszwi/wGAxQk2LWAb+
 SfX4qcjf45CKjisdVQUp/FhNgNxZwkmnFK43Ou9FWdYqpmzU7UYh4FgA0eG/+W0JAa0+zkkRu6i
 OtiGMbyNm/ZaFqnbD0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91606-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D79B1D575C
X-Rspamd-Action: no action



On 2/3/2026 4:31 AM, Aaron Kling wrote:
> On Mon, Feb 2, 2026 at 3:35 AM Taniya Das <taniya.das@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 1/28/2026 7:33 PM, Konrad Dybcio wrote:
>>> On 1/27/26 11:48 PM, Aaron Kling wrote:
>>>> I am working on the AYN Odin 2 qcs8550 series of devices, specifically
>>>> for Android, using mainline kernel drivers. I have come across some
>>>> missing functionality and failures that I would like to inquire about.
>>>
>>> [...]
>>>
>>>> * Some gpu related clocks complain about being stuck off during boot,
>>>> causing stack traces, but the gpu does work. I tried to do some
>>>> research into this, but quickly got lost in the weeds and I have no
>>>> idea where to even look.
>>>> [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
>>>> [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
>>>> [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
>>>> [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'
>>>
>>
>> Aaron, if you could share the boot up logs or stack traces it would be
>> helpful to see what is leading to stuck at 'off'.
> 
> Sure. Here [0] is a kernel boot log booting to Android launcher.
> 
> Aaron
> 
> [0]  http://0x0.st/PbLh.txt

Thanks Aaron for sharing the logs!

This warnings seems to be due to below ACK change which tries to proxy vote on
the boot time enabled clocks. And the same change is not part of Linux mainline.

https://android-review.googlesource.com/c/kernel/common/+/1164507

Can you please see if dropping above change is helping to avoid the warnings? or
please apply below patch and see if helps to avoid the warnings.

diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index f27140c649f5..55dee8a96e74 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -825,7 +825,7 @@ static struct clk_branch disp_cc_mdss_ahb1_clk = {
                                &disp_cc_mdss_ahb_clk_src.clkr.hw,
                        },
                        .num_parents = 1,
-                       .flags = CLK_SET_RATE_PARENT,
+                       .flags = CLK_SET_RATE_PARENT | CLK_DONT_HOLD_STATE,
                        .ops = &clk_branch2_ops,
                },
        },
diff --git a/drivers/clk/qcom/gpucc-sm8550.c b/drivers/clk/qcom/gpucc-sm8550.c
index 7486edf56160..2cd27cb835f9 100644
--- a/drivers/clk/qcom/gpucc-sm8550.c
+++ b/drivers/clk/qcom/gpucc-sm8550.c
@@ -330,7 +330,7 @@ static struct clk_branch gpu_cc_cx_gmu_clk = {
                                &gpu_cc_gmu_clk_src.clkr.hw,
                        },
                        .num_parents = 1,
-                       .flags = CLK_SET_RATE_PARENT,
+                       .flags = CLK_SET_RATE_PARENT | CLK_DONT_HOLD_STATE,
                        .ops = &clk_branch2_aon_ops,
                },
        },
@@ -348,7 +348,7 @@ static struct clk_branch gpu_cc_cxo_clk = {
                                &gpu_cc_xo_clk_src.clkr.hw,
                        },
                        .num_parents = 1,
-                       .flags = CLK_SET_RATE_PARENT,
+                       .flags = CLK_SET_RATE_PARENT | CLK_DONT_HOLD_STATE,
                        .ops = &clk_branch2_ops,
                },
        },
@@ -415,7 +415,7 @@ static struct clk_branch gpu_cc_hub_cx_int_clk = {
                                &gpu_cc_hub_clk_src.clkr.hw,
                        },
                        .num_parents = 1,
-                       .flags = CLK_SET_RATE_PARENT,
+                       .flags = CLK_SET_RATE_PARENT | CLK_DONT_HOLD_STATE,
                        .ops = &clk_branch2_aon_ops,
                },
        },

Thanks,
Jagadeesh 

