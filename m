Return-Path: <linux-arm-msm+bounces-115065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2/EGHGBoQmoS6gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:43:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE736DA6D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:43:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Wo+z5gOY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=H46L2LRp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115065-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115065-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6DC22304970E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46D7401A3C;
	Mon, 29 Jun 2026 12:25:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432D1382299
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:25:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735937; cv=none; b=W8hRZSAkC0d4EtU4eiHgnA5I0OA1nkE3Pbjz2rFaTSr3sR8sjfnqRHJGXz4o1CDkAKLpjn61PSiW/zKsrWL4zTI0VkGo+7d/HbZNxGiPrI2yYXXdFeOzixt74gsVcucJ0oawo+ipu60/jbn7MM1wUoINBU7CC7sfS3K+li9l0Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735937; c=relaxed/simple;
	bh=uajltYhiMvusyvh+KCcSZfqXGw6iS9PcZKLJJkUndEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=erzjQCoJhLEcSq5CaayitEpEHrjuzSO27GBECpW4VkaE7//aZI81f83hFNbI7r0JCczq/uNOKPjELi172QPOawoF0RTw6jOB9S6k3mfgRmqElIAdCQ+5xY40XA92xbjabAUoGQBJxsIcBUq4cDBGECjATF/5LIENS4fZGjM228g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wo+z5gOY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H46L2LRp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATEGa2579138
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R/gDFeWX25oeLKFNlAnH1g6BTev6I4bSVAzgfKi7gk4=; b=Wo+z5gOYrS0vd62c
	zTV/FZNjbV4MKJE690kAo6uKKQAOcZv9NmX0GbBaXuwAqFb/5HIdzljlpZhbMicZ
	qe+muqU7FUOQx5fQKXtRJ018+laghoGdIRD3qD/tYmzkuEgvs1MvPlydlu525DXG
	hutBvy0EJQ8Xhwp1HdMbnnvXHAaJAidRrMC5QjarNmlyguGpduTGdr/CnP5e379J
	1nw+KyD6et14B1j/YyLkubLmMIhFqKYRheHLchnfMImdyYKI5gYieYXET+47tQgV
	Uu19J6fgarmjK66cVGj4SkRVbVTBWAO2WRkPETkW9crDWnIt68JMusM2wECjOFGp
	2UhnDw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7h9wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:25:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfd1772d8so1803631cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782735934; x=1783340734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R/gDFeWX25oeLKFNlAnH1g6BTev6I4bSVAzgfKi7gk4=;
        b=H46L2LRpPNKkv/6oAPN6xgp94w+L8RlGH1k579larV17ihmBWL8fiEuhXFha1+zZbJ
         GZ1Djw8a/j6q27lzXiUv6o4634ML0kaiCSTMM6C+AzmDDW50WWbX3pQNq3pKeMn47tsZ
         WM9QqThTmLlIIDs823SLIYU+GUcZJMbGFSCG5F0OpkEb6GQVqmsz64gai/ykAROSSbUd
         tErQy9KXwBB3b5tvhE4TjqSYz2IKNoRUeYu7j48GSVZlIwGbvfst0wB36037BQIs8h8D
         oduorUJz1b+WdQWPgJEVQaQKJLvo6LQlxqIqCVDcL8YmZuPvwO25jL158t0Cxzffnbns
         vzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735934; x=1783340734;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/gDFeWX25oeLKFNlAnH1g6BTev6I4bSVAzgfKi7gk4=;
        b=clwSIiqwMVmmJThveHLnSAXArusd1Xymrben2RkdqpGPH0T80u/I01DMestqnm6M0T
         h70SFoHaG3I1In4aUzxuZOK/Hu4atZt+zXzCdvcjgg96dRm9OSWQ/T+HShKhqn3RUKew
         FdZ0uRNqpTpISMHgyP8c2GejIl8I8L+hquGTLLlRNgbu1BsKH8BS+lsf/PlRLeldL+u9
         qSAauP5j7Gp94RKOXwft6uwy9emGlvlqVyuvuQOluj4+Igbhxww1HKs0LvCdcNZca1XT
         sxWI5OtNlpIsgxbWNfMjhLzRdblQLtXGc3SyR+3KNufXnNYf20uZ1NZLjoWW3Ya3Dbes
         VKRw==
X-Forwarded-Encrypted: i=1; AFNElJ85WwRuHeiHBq4D65QhWS8MXXOTC9JBvwxKQKBmh85LQLKvbaekaM9s1ANatJ+75kSwSn1M4xNq7chJuEgm@vger.kernel.org
X-Gm-Message-State: AOJu0YyoP1tKPPUDgO5hHGmbiu5D8J/UJS8NMcEYWrBuEVTXQo9ezk6H
	Z150oEyk444JUig14HktG0vQUuxLuVhAGCYI9HucZwYCW+2kPkF/Z0QmB2T2N2TKYiKo/97H7Y1
	SyBRn2qqmIOkuM0CWQmCrQwEJ/OlI1SJLear3YUpkvQUrBgpC/ce0IRyUWQgJZWPgO68R
X-Gm-Gg: AfdE7cko1nLHaiLsX4yIRj8ikXhnU15gdl2tyCvCAuxAkr9ssTj6KlPKDa2WKS6lC+/
	CHs7iejUK6N+kzW3HVHXb/9MkifSrW7uiS/KWMSjgauSPO9CkYDN62GIRDuJrldavQ1kJGr1S/V
	Jl5gzluKLqrZyaxhILAWv5qRg9eX6rt3NwyM1aK+aoEewhlSn0D0a4niQ+YkZS3W0IotEc9wwMO
	VnuzF7Nk08hgz0xCMvVi6VbnLbTBd71bXNJzUIc2b3vb6PvmoncchsI3OVKKozPCJ+YDkOANY03
	d1nePypKYFVz9CF14H0pN8xU3LW+00lrrmg4xKAkiS+L8vu9PwsEDjxg8VhzlU19PEW5YiTdIuH
	+1O7Guw9OIrYzmKUlcBKWbAEg4tF0y4BhlNU=
X-Received: by 2002:ac8:7f13:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51a8c9b95eemr96932671cf.9.1782735934330;
        Mon, 29 Jun 2026 05:25:34 -0700 (PDT)
X-Received: by 2002:ac8:7f13:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51a8c9b95eemr96932421cf.9.1782735933791;
        Mon, 29 Jun 2026 05:25:33 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbe8118sm768760066b.24.2026.06.29.05.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 05:25:32 -0700 (PDT)
Message-ID: <103bb3bd-7099-46d0-b0ad-baec1493d742@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 14:25:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
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
 <20260621-tcsr_qref_0622-v6-7-c939c22ded0c@oss.qualcomm.com>
 <e6c0971b-ec41-4914-aa34-6caef51d2327@oss.qualcomm.com>
 <ajk5KE/fEDDU9W3V@hu-qianyu-lv.qualcomm.com>
 <8e4ea76e-f1c0-4dfd-8477-35e01ac0ba0d@oss.qualcomm.com>
 <akJjrh5z+IVvdRVp@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akJjrh5z+IVvdRVp@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMiBTYWx0ZWRfX9Y5eYep0EDvi
 kIp1jE1quo3ss9ao0wxxQriCklwC5gPpkIab8aXMygonqHTLqxaZsF0VlKMyp8x5P2u5QLYOk2M
 LLsu03E4FFUXNlwyCXZ4kpWkFNHGRgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMiBTYWx0ZWRfXwVXRSA2+/XW4
 zxzU8XW7wmciAkW8YQcEKOnF/6AWevVykSOvd9eCbw6fBako8HeO5BnMLjvDOel5Kpnlu9e6ZFe
 YuYPMvoONhJcBR6aYo/o6GS3nuUlimrJYX84iwUnZzhgVvLPEIO8GK2Nd7FfEjATOXOgdgVjRKz
 Dn3lIjGjkW5N2McFdP0mQ1QvUAjkT2cxFZZYRSeNs2YjrgZQLVTbm4PzXLhdgbTmVaER4wNiVzv
 ictMrnIgYYZmVPNUecq5e1Pa07/auw1XJ+ozfcQ4KDr4qUpUo0hWojr+2V8SoP2JjLQeP2WDrLk
 hV4oPpj7oc3i8kvZGQLEB8usEBV8bRizx5Ix0FsS6dN8p9HlCx9QKuxqzJledTKjs8Q5+ITjZyI
 eXbm68ASZFJEROy1VHdBd3zJLbQr+nHq77zhYtyxrqofvtSGrNv2RxrQ4vl4M8LzAigawcvLLLb
 C/TjZY7KWS4y+I1g2VQ==
X-Proofpoint-ORIG-GUID: p2c0btyfiqkabt5k9x-XpA_nI7v-71uT
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a42643f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=sBmxciXZafjqAzqtsYoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: p2c0btyfiqkabt5k9x-XpA_nI7v-71uT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290102
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115065-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 2AE736DA6D4

On 6/29/26 2:23 PM, Qiang Yu wrote:
> On Mon, Jun 29, 2026 at 12:34:10PM +0200, Konrad Dybcio wrote:
>> On 6/22/26 3:31 PM, Qiang Yu wrote:
>>> On Mon, Jun 22, 2026 at 02:18:54PM +0200, Konrad Dybcio wrote:
>>>> On 6/22/26 7:11 AM, Qiang Yu wrote:
>>>>> Mahua has a different PCIe QREF topology from glymur. Override the TCSR
>>>>> compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
>>>>> LDO supplies for the PCIe clkref paths on the CRD board.
>>>>>
>>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/mahua-crd.dts | 15 +++++++++++++++
>>>>>  arch/arm64/boot/dts/qcom/mahua.dtsi    |  4 ++++
>>>>>  2 files changed, 19 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
>>>>> index 9c8244e892dd..8b42f5174b31 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
>>>>> @@ -19,3 +19,18 @@ / {
>>>>>  	model = "Qualcomm Technologies, Inc. Mahua CRD";
>>>>>  	compatible = "qcom,mahua-crd", "qcom,mahua";
>>>>>  };
>>>>> +
>>>>> +&tcsr {
>>>>> +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
>>>>> +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
>>>>> +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
>>>>> +	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
>>>>> +	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
>>>>> +	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
>>>>> +	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
>>>>> +	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
>>>>> +	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
>>>>> +	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
>>>>> +	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
>>>>> +	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
>>>>
>>>> The supplies are correct, but QREF uses refgen4 on Mahua
>>>>
>>>
>>> The instance is REFGEN4, but its regulator name is refgen3_xxx. Do you
>>> think rename the supplies as vdda-refgen4-0p9-supply is better?
>>
>> Ah, I overlooked this. Maybe 4 could be better here, since the supplies
>> that end up being assigned there match what we call refgen4 on Glymur.
>>
>> But there's no good answer, both options are terrible. Let's add a
>> comment somewhere (in bindings?) describing this mess, perhaps like:
>>
>> # On Mahua, the REFGEN4 block is supplied through pads named REFGEN3
> 
> Okay, it's better to metion this in commit msg.

Doing so in both is good too!

Konrad

