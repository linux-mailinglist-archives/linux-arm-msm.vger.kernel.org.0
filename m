Return-Path: <linux-arm-msm+bounces-100723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJeYG9tFymm/7AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:43:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B1535866E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5302130AB8F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E203B52E0;
	Mon, 30 Mar 2026 09:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpSMTQL0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ip7Kmp5i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5613B47F5
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863417; cv=none; b=CQAslKOkU5Ea7xpzRlhjc5RuE63eBc1chifED1J+UyjXffODpaGTPI+9hW5PU1wCBOHh8ipK3+AdZ6ZlslEnILhyqzNwUB+IXCD6sjRS8VSvZGcI659yQyP11taexpZ/gb4xFCDadxv79/ZM8+NVKncASA+6RWyqOsmD8n+2I+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863417; c=relaxed/simple;
	bh=ow+j/FbhJNpyJ4jd32OsvrK0BH4YUa2nELDDf6A2lz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U2Ih4/71mKZBa3c1AnMakdZDVTG3oUGxxelhe7Ecc/ztOJzbBtZzYKDe8lFIw3HYjOlSZrnTq39oYYtpMNHn8F6K6/8t1NgiWXEhiZTxja/esZrg6wu7HYZY/8MyNZxmaw6WjLIgu3E56ZEnuPTK16wn8jD/DZqftV9NdarKyqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpSMTQL0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ip7Kmp5i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4VBOm201855
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y829VMWcjmy2e+KlsWr0uhjRtCYBw0ZDjtDzMWwnIiE=; b=GpSMTQL0MDvPBO1w
	Qo0d8XFfBeVfuOcVtzpwHNSz/Np6+C2puYTJNBy+u5/iSoppkEx8AMwgsrT5nUjF
	ZJvRfgw0fsBkZRDBsNmajUvjpnaWYEkEBZMh13YNnv8/39NLdSYS+V2PT17fjU5X
	MacRQRfcPXbbT+RQSp5oaVwjagF8Ps4nEG2VlN7gsxnh44g2ikrtlSP+8jOvM9IK
	ABI6Drhu5NfRINiPiPmYS4XCS8IWPhQ2w+c1p9KDMD1xV6XAP70Ipj7HTJYJoWS9
	nL5hvTD2SOebM/XTXrxYj8qtgl9encn2YPpchgWANayA66drgVbediT6CLIjuDjU
	c/cg1A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66jwnk03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:36:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3586513febcso1487776a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774863414; x=1775468214; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y829VMWcjmy2e+KlsWr0uhjRtCYBw0ZDjtDzMWwnIiE=;
        b=Ip7Kmp5iHHOUNF+CNEQHpcDNN5+C5Z+uJiU0qmA7Th2NnRoCVjRU5mciRYHK3zArP8
         kVPnmrf9gyUfSLW/h4BaajOTFDNLIs5T8OqgsB+SUpXmu0fH0ClbKCF7lY9AF2KkiX9X
         rRBwJ86hMe40EuWOGh7CPMiM2Etgn95oqzO2Ixso/+IJw00SO79noDBXKmq2fU0p8BBN
         qUR+u+cuepoWXboED/qshXXDEvXEHTZZEJlSmoz4dTbzp8DLRQC4E88tnETa0i6pkoQ+
         AcyC/zIXlpKLilE7uBZcvs4Te9VN4/Fftufds1YnTVnq+jB389WBkrWa0SShK9ZSOo3b
         QqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863414; x=1775468214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y829VMWcjmy2e+KlsWr0uhjRtCYBw0ZDjtDzMWwnIiE=;
        b=GJbd0P+wFJMj0MDY9J0LTiyk6qGd0zxQoonh5VaHxcKY8+xedu6TsP5CdETQic0tf7
         dzJTI0+R3mSaQLOZ6aeTUva0MZqxjfVqkQzlBdFDgMPMuAzRDs2q3qF1Hf662ss9jnTf
         mdhf3rNtgPI+hJc73ZbeaUoJYUIY/HFfmg6XV3MnkGqpZ/QGuybEF+5+UjZeId5dmdZ0
         uThQXDomxHH0KDgW20kMfxGYWOmxBplRxPnZvsvAxwx/2orJ/OFJwvY+oDE2Ytfxl1uD
         kvjzTA2kec6wBSxCU1PFus33T54YAB2tjHmkydCwWi1tmDnEqN8BIlpF82kXt8DteiJN
         a4+A==
X-Forwarded-Encrypted: i=1; AJvYcCWyIUJGTYEwI0APYO+ZdwUucEoI33+qP3UDeX2IT7sqOTF5pOySxGR2BUO2IQNxkr6tH9fM18n3zm/40Gyv@vger.kernel.org
X-Gm-Message-State: AOJu0YwSyhAfnPUsl1llG4q2beKI4S/Tc6ZFaJshm0+QUTTgFmTJ2BFN
	4qMBQ+gV+kfFxqSUrjbSRKq+6JFHB+iU+U/KpmsxV0U3cj7GXjQz0AkhiSviAZzfMi/iPfG4I2E
	V3ckwxeiisSU0jpXAhHm8RdM9dD7cwvPLSkICqjkuvR4yqLg+xKG2KVq2JjYpiBh8ivgV
X-Gm-Gg: ATEYQzyoYFEpv+RhxYZ6NiDlpWcpfbHw9uTX2/3Z+5rGo1+5dXH+ap3K1XJLGkoH95O
	uXKfdvPi6f1zNjpjVMhn9dyMItyuV5aYoZtHAAkAhxVPTHH1F+YCE6exw4w7wJ1bjOficLTvJL6
	cFuetBz/BbCr/zk/hXnF/87FBs3F4A3S7lb+xRq7eYQvuPCr4CF2pDIsAB4QOl9F9nu+IV1KHC+
	fheQL+/UaDsTogMvgvjxV6k+1mhFoQ9GIQxLSMhkf8CDMYfg0ccNBHBsMipEr/JWKfo/repgswg
	I8M179ap+T9upruc9gGJW5ronrtkHpTtj5h/FC8uSwpRs+UUCzTBwyMrJYaJiubwr6TkpqFQoKT
	AZvN+96k415gsyNLi8hCSYoRsm7lK3lNxQqhqycOY5RT2zemGOQ==
X-Received: by 2002:a17:90a:b396:b0:35d:92e4:c0aa with SMTP id 98e67ed59e1d1-35d92e4dc2dmr3259281a91.6.1774863413932;
        Mon, 30 Mar 2026 02:36:53 -0700 (PDT)
X-Received: by 2002:a17:90a:b396:b0:35d:92e4:c0aa with SMTP id 98e67ed59e1d1-35d92e4dc2dmr3259262a91.6.1774863413472;
        Mon, 30 Mar 2026 02:36:53 -0700 (PDT)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec27da0sm3709913a91.8.2026.03.30.02.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:36:52 -0700 (PDT)
Message-ID: <a39ca7b7-b277-4518-ad45-1f42506b615e@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 15:06:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac-sku support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com>
 <20260328-monaco-evk-ac-sku-v1-1-79d166fa5571@oss.qualcomm.com>
 <20260329-accelerated-pigeon-of-joy-c6c903@quoll>
 <f7e63fa7-2579-4dce-974a-8c81a1aee00f@oss.qualcomm.com>
 <7f5bfeb8-7d91-419b-981d-1f0f568f01d2@kernel.org>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <7f5bfeb8-7d91-419b-981d-1f0f568f01d2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I8dohdgg c=1 sm=1 tr=0 ts=69ca4436 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=TMvvwhOKWeLxbQ7R-5UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: UcBFApOZ2EiFudbcAQ6wUUsP69nEe_MN
X-Proofpoint-ORIG-GUID: UcBFApOZ2EiFudbcAQ6wUUsP69nEe_MN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NSBTYWx0ZWRfXyKpSjYYzeD0r
 6W6kB4VZcVO2sWig8CoabNtO626jTsvloYMFXBejNXQSFya8NO/mhARDPVuoTk8HIu7pgOIjpVU
 TgCnzYBKKqZzBQvQvVWJ7n3IInxMjSvT2WGNu39N7r/jXcARnhK/FFfmBIxQi7SnJleaUtJLbui
 V5rNZOJPtEgCc/2X33MdbshsJwtkjg6y5DJk2hVi3j7qKAvS4bbI9Zkk/FMWnNrKe3yGmMgPOPs
 K1zPjltgZnHMqdWPmlWoRa1h6E90EtdIXhLQWy+DQ2PxpLTwIv5ZYKKVL5WWCXX07gcNNT9Puhj
 wUeem+Pt8pHr7w4cZSsBNQId4ZZPAyvxIRD7e27MJcY1zSy6lyBTt9hnOOBvJHBw5ocGRkU6Agg
 08IINk2olUCZ4Pj6T3iwbCa2DQFlUQkRpH40NleskCCWDhhDU+RCda/P9r8ZsEy4BNSRZsJqe4N
 GM1BWjbtkth1X4ilNrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100723-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C5B1535866E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Krzysztof,

On 3/30/2026 12:24 PM, Krzysztof Kozlowski wrote:
> On 30/03/2026 08:50, Umang Chheda wrote:
>> Hello Krzysztof,
>>
>> On 3/29/2026 3:22 PM, Krzysztof Kozlowski wrote:
>>> On Sat, Mar 28, 2026 at 05:11:17PM +0530, Umang Chheda wrote:
>>>> Introduce new bindings for the monaco-evk-ac-sku,
>>>> an IoT board based on the QCS8300-AC variant SoC.
>>> Please wrap commit message according to Linux coding style / submission
>>> process (neither too early nor over the limit):
>>> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>>
>>
>> Ack
>>
>>>
>>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> index ca880c105f3b..07053cc2ac1c 100644
>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> @@ -918,6 +918,7 @@ properties:
>>>>            - enum:
>>>>                - arduino,monza
>>>>                - qcom,monaco-evk
>>>> +              - qcom,monaco-evk-ac-sku
>>> Why adding name 'sku' to the compatible? What's the meaning here?
>>
>>
>> Monaco SoC has 2 variants  - monaco-aa and monaco-ac -- "monaco-evk" board uses monaco-aa variant of SoC and this new
> 
> so ac? or ac-sku? Decide.
> 
>> introduced board uses the monaco-ac variant SoC. Hence added the compatible as "monaco-evk-ac-sku" to differentiate it from
>> monaco-evk board.
> 
> Wrap your emails.

Ack
> 
> "ac" differentiates. Why do you need to say that a variant is a
> "-variant"?
> 

The intent for using "-sku" here was to match the existing upstream
practice where boards that are otherwise identical but differ in H/W
configuration (SoC variant, storage etc) are represented as separate SKUs.

For Example:
  - sc7180-trogdor-*-sku.dtsi
  - sc7280-herobrine-*-sku.dtsi
  - mt8183-kukui-jacuzzi-*-sku.dts

Hence to follow the above convention and practice - Added "-sku" in the end.

Please let me know your preference ? if it is okay dropping "-sku" - I
will re-spin v2 with suggested changes.


> Best regards,
> Krzysztof

Thanks,
Umang


