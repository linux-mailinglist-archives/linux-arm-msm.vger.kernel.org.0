Return-Path: <linux-arm-msm+bounces-113602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HW9aAZR9Mmr80gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:57:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CE7698BA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:57:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UylOKhJz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A3v9lY1t;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113602-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113602-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CB2230F09A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3104071CB;
	Wed, 17 Jun 2026 10:47:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEB3309F00
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:47:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781693246; cv=none; b=pxydHzMesk4NxV5h5/dz2mKqz4UruGJsiHepGd2QiREAykTpZSCkFFJpc5soI0JgjqZRf+nUxc/2qd7p+UKLs5hXj0N2jQsRtgsqu6joBcRHpdr1m8tZlOdhgI2bBVDaVHyApb8QE3LN5165jE3q5QqZjKIIw3eu6a+0GmVB1Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781693246; c=relaxed/simple;
	bh=3H7FmkjCkWwwgeEGWRP7x/C3R8Co3/Fe5TVbE2aRzZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fPboYRet6BRgIclOCf+7RKOMCQmU7SfvltKJoenahcvM1gV2FPVnWyGmvLqKsIjTYef7C95HJE9V44zR/ONmvlqoRf9ezjwuvqIe6BnzWC45j0mS+IVpIfsYjmF4S7q1BifjEb+tawGhNvpfBrbC1inYME0xHKPdocR6HHEXC84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UylOKhJz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A3v9lY1t; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UQDB1703248
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lGnwrht7Xh9Kn+cD9XO6GFVpkr4FiE5ro5RtFRSjrXc=; b=UylOKhJzUfSuFB2D
	tszaAHPBUP0fkjtDhquWDQBrzIBgBygm9V4IEiHWj5Ow7BuDFqdlgO9WOhdJ4dEG
	7kkPE1JL0AcUUSNhq7KXm87EYBFBry7NhbWIgMkteBvd8dzkGiCVE8wS0RtBEUPz
	QFcp7usEXQUbWr3jLTAkYUS2T+g5Bdj+rxNTSCbhJxM+k+sMqzP0ZpO8B14DnyZ4
	3a5maNV7yzeqsJqhkJws61J1Zr3WOvvmHc83fQsLW004Atli16FATFSY3gixzezU
	2bf1VCBiBq2l4023uX0FwaSWmeYpuu/0It97rRrGGBDMwxsrW8wfwF1Zj5g1IWcn
	rm0JkA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueet2n8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:47:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9158ecbfbc2so43535985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781693242; x=1782298042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lGnwrht7Xh9Kn+cD9XO6GFVpkr4FiE5ro5RtFRSjrXc=;
        b=A3v9lY1tVNqSS6ASn5fg//3hqxnzqfE7T+53vYsKTBsbFZpK46bcHf2VJ9rxvPignK
         kD1IaC4vfSWkbtiVrQiC4y3pqciL2PDi8fctHkPDqxxyxurDNyu/4d758TY7G2UWXldV
         wzEHUuTxaPg6jRe7BTA3Ecpk3wAqM0zt4W0IRCJVXJry7jIHTzlKY3RwLam26G7O2OwL
         SiggIlTh1Rz5RxHEI5FQc3xhgWULuTe3M8RQ+obLS86qxieh31I6z29+jKUyxsBJw/rU
         o4GRzkKi5vmEn4elkXiIVqsoU9UaioNLE/2DFAuMzVS9MHUmduUbdj3ht1bnva7teR2n
         wicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781693242; x=1782298042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGnwrht7Xh9Kn+cD9XO6GFVpkr4FiE5ro5RtFRSjrXc=;
        b=FWBxxFiobLo1Sn1ls93sLtUa4DooiKgygLij/yb7OOHHKH8MwT3nbp9jgePQ6dBYvF
         Xpq5GFnPUV2GgSW12lRejqrt28u9MPsEQQZCAqzFSc1paiNK7YwiPJdjH/yFBC3aYmT+
         kXxTY6wR3tTfoOY/BFWeecRu4NGaNSnHve0oLDIsoyYyJtwYXEiz/sP9qnvwrTCSu9wO
         //tCVBwodcLBkxzImQAmhPGtTJ7bL0dtf8Bk0aUK7k+AVib4f/sdg960OwYUU787QtAR
         5UuNC0k+ylEJF8XIMJZE85Y3gP5NJb58bIgFQSxJxpxRZwWG1TM+MI6nFv8+fBzhBDwx
         yftw==
X-Forwarded-Encrypted: i=1; AFNElJ8G9ulQuizBO/jayTSTXsSGUqWOoQXWHm/xmQwU7cWhGe3eS+w1VIvxdTmGmjOXhcaXzR0CWArz6f2L1WLI@vger.kernel.org
X-Gm-Message-State: AOJu0YwZJghWUn9uHvAatkfeCHmqDr6vqpbSZ+AqrA9ZQhGimdC5nyyY
	7jE25PTEKzVCWlHtq78AqfekqUb1cgC9erjk5sFleaYQPR4kWJGOhwfHBhC9LaRXjNGAfmF3/QG
	6PvdqdksicjaGMsiqIg/t4QJFTgtz/Q99TpOOZyybI++B0xsgYh4SRkeTdF28pMASaFAQ
X-Gm-Gg: Acq92OHF7WjJsIJo/W+FRhFOwKkV7xYN1wYclXr/Wi7ftBtFR0tRm8efaGEXQgUihu8
	EvKN+5QuMe7T97c1uCV/RqU4u1PwWn8QoDDd9Whzswwz7MIVIdVj4dLLl4cHWmm/Glcjefi5045
	+PY9mqyZD5munThES4dPwiLHyQNGt7p7hq4abRDXA/aiOG+PExyXyYO918qiEF+e4gj5nu0K9x+
	Xiix2g/rexCYsHSmvzlIM6FKdPc4V4lguja5WlOmlWeY3k4uU+tq5hcWF8QbHb0VyX2zLi340hI
	nJFHtW+rhpRPSOfn3Xj5vJ4jkILznoM+MT2FrAJ4hnOucEZW01RyPWNmXxodotUEWTqHkt11MT9
	/jd9ozImMeAJjRb+6enq6C6T0Lp+uC6NVMCw=
X-Received: by 2002:a05:620a:31a3:b0:902:daaf:22cd with SMTP id af79cd13be357-91d876acd3bmr318135785a.0.1781693242444;
        Wed, 17 Jun 2026 03:47:22 -0700 (PDT)
X-Received: by 2002:a05:620a:31a3:b0:902:daaf:22cd with SMTP id af79cd13be357-91d876acd3bmr318132985a.0.1781693241992;
        Wed, 17 Jun 2026 03:47:21 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c06d0179a52sm8349166b.42.2026.06.17.03.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:47:21 -0700 (PDT)
Message-ID: <f5fd3f31-9e7f-4f49-93c5-b0a6dec9f4cb@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:47:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5210: Enable PCIe support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
 <20260514-pci-ipq5210-v1-2-a09436200b35@oss.qualcomm.com>
 <dc7cb371-e94e-4f42-87d6-70f0f94d0d49@oss.qualcomm.com>
 <aiFhZsaZJoXzuMSk@hu-varada-blr.qualcomm.com>
 <d291cd03-ffd1-43a0-b4bd-bbad6a4fcec0@oss.qualcomm.com>
 <aifGReQQ12BdgCMb@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aifGReQQ12BdgCMb@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LEEmAHx6nlTnACO2gtNmleFM0quGRqL2
X-Authority-Analysis: v=2.4 cv=JufBas4C c=1 sm=1 tr=0 ts=6a327b3b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=MZvN4AuqtkzAMa8ueUYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: LEEmAHx6nlTnACO2gtNmleFM0quGRqL2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwMCBTYWx0ZWRfX4JBap6hMl3Nl
 QRYU63j3Zgf9/hgBPhbAkrXWZK/0tDpLq76/SpGOo9gYR6F4pMUic/b5kaBqOROegC0DMsqa1iA
 AVc0we4JMy90bRnThKmZAxIgUfMzX7EUL4HsIk1fI6c1ciqSUPWQ2XHSowoqwSk9fK6HKLdJJH7
 0yWYjG9Sqzle7J0jZq5gUpquEazlRogmvt5EEWGqfLlYHrFVB8EAvdxhEzV6/qVsL8I5yaCsQOI
 k6uEtpbMc6R0GhzHraiuILUA0H8RTTBWTqRuImiATkzYLwBLy/0kGKxUU2Wx6E4La4ohA/UNkDQ
 q0uZygYiNnpzcBomiA0yz2rf8G+3c3jwknHM28a/OADxCMMI+rFr+AJOTEKb7zwtYKaNUdK5D/G
 4zlTZIVE0EiPYnC1big0DLKI4hByWG9MuDEgV088RYzCJoLsQh95cYrKfzzIwKvoAf/0nvv/cOZ
 3N/pQpjOt07et374luw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwMCBTYWx0ZWRfX9rlIjPaW2AR4
 uuVu+LZB3gu1GmFK8TMfX3DOuzuhIcpqcjtfAJlL/KGlaYoo23GwRHuXSMQfhY10IZe9EeiAYQA
 8AUrTTfnfPj+EABqdfLM/O+HrBjPll8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113602-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:varadarajan.narayanan@oss.qualcomm.com,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 94CE7698BA0

On 6/9/26 9:52 AM, Varadarajan Narayanan wrote:
> On Mon, Jun 08, 2026 at 11:44:56AM +0200, Konrad Dybcio wrote:
>> On 6/4/26 1:28 PM, Varadarajan Narayanan wrote:
>>> On Fri, May 22, 2026 at 02:24:45PM +0200, Konrad Dybcio wrote:
>>>> On 5/14/26 6:13 AM, Varadarajan Narayanan wrote:
>>>>> Add DT entries to enable the PCIe controllers found in ipq5210.
>>>>>
>>>>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>>>>> ---
>>
>> [...]
>>
>>>>> +
>>>>> +			resets = <&gcc GCC_PCIE0_PHY_BCR>,
>>>>> +				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
>>>>> +			reset-names = "phy", "common";
>>>>> +
>>>>> +			#clock-cells = <0>;
>>>>> +			clock-output-names = "gcc_pcie0_pipe_clk_src";
>>>>
>>>> Having a gcc_ prefix here smells fishy..
>>>
>>> Followed what was used in ipq9574, ipq5424 etc. Will remove gcc_ & _src.
>>
>> What is the name of the PHY's output in the clock plan? I would assume
>> it doesn't have gcc_, but it may end in _src..
> 
> In the clock plan it is called as gcc_pcie0_pipe_clk_src and
> gcc_pcie1_pipe_clk_src.

Let's follow prior art (glymur.dtsi) and call it pcie<N>_pipe_clk

Konrad

