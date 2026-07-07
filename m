Return-Path: <linux-arm-msm+bounces-117124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wp1XLfuNTGqfmAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:26:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1550C717737
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:26:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="G7G/OMB3";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="jwaXSAG/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117124-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117124-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B478301913A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 05:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7130F384CD3;
	Tue,  7 Jul 2026 05:26:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2876D3845BD
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 05:26:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401977; cv=none; b=dRKYjOH3pu9aZiTy/eW2vqI8m79fJtOvNQV94TcJcNGn5y2loAmcAbyf8UQpTzENuH7B/97DZ3KiTvruDw1LaIgAHy8UcAr1p84FodKLqqIRTS9FZs2I4KwytoMAkBSy+CuwGR/P1mZpQXXcngLa7eweoumDoxIro9r00CE0QHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401977; c=relaxed/simple;
	bh=tBLWUS0p+78feSlx7wJb1JVcWhYam+OtpokhW8l1Alc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Afo2DZr8mBlHl7Z8fLbALUULw0kt2sWq2JgHVr/NS7CLfHpRE5Gd6ZHEAP2umviohB01pvNtbpFRfQHeiaPutjVu2TTWWN5PW4Mfen3+PRkyL4VFC8QJmKirMZKU6QnGxX/FjZEPwveqxO1/j318wpkrOHr0igpMdCRNC1Q7zRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G7G/OMB3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jwaXSAG/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667495RC2498892
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 05:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bjSimyuCuoTARy8j7fWODIz6FAefwaPOvzjZM+C/y7w=; b=G7G/OMB3L1aCJ2Zc
	Vz0oJOUHdL6jBM4/RnhTo/xIh4i8cBshI+tCi8b3NOVuWAwiK+Fs8Ifhu4CYn2Ii
	vHAVg71HmTgx6QBuPvlj8W5zpHDx2JiV+S51cNMI0LRpoJPWn1+NF9ItNwj4+Uyl
	HT8mrsCB1xOvLD/jZ1ofSEiUU3ckMnz5lurARS11UDI4Sd1l1ASrRIoBPbp2eq9w
	5jQ1jLW0ep7xQDiREzXCoKrWV1RLt3d56D0OkyW+vE538tNHBvADjTmjW6efMopU
	o8Zrl0OC9p4KsQ4gsUbCuOBSKcTAnBGx+M3vI3v9orocYQezEdtzH/febBRj0ub9
	qyofzQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hscqrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:26:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37e24235ce1so5730587a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 22:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783401974; x=1784006774; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bjSimyuCuoTARy8j7fWODIz6FAefwaPOvzjZM+C/y7w=;
        b=jwaXSAG/FYPsDz8AfIzg7h9HtHVtcw6zOtfGPhQxdbJjGcgtXOO5EWwqLf22b/OEFB
         f4eduxaQ76tNXCUpiF2ybgWalHoe3fzOOcMYsBu4zkJOQHFeKG4Zw0eduAG733ZlJEcP
         VSrLkIkKS/OtHAITHt735SpExQzX6G7zEyS4geGgyNCpQ0oqTy+Dlls7wUDPrF1SegN5
         bQ5Ca8qbjGy8lMMmIQrZPAN4L1om7neKr7hF2cuuPb4Ddyko5OfrIIz4dYX9a2tn4R+x
         4QjwTvFxTHnJbooI72tiQPzbiF2glE/NnkGHW7UUXuN+6yWAC2ywtGl4a0VguLG4KRhB
         TH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401974; x=1784006774;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bjSimyuCuoTARy8j7fWODIz6FAefwaPOvzjZM+C/y7w=;
        b=T92MGcm/Y/+y0+6wRVWxh6Oi9U669g590vvjBq9vJiPJ/02hCDHJsjlQ7DRihSTT1Y
         Q7ex/8T1dSRicKkR2QGCtTGIZtOWmO6gxYQIMOtKavKdsciZZkC8P1jLoXvH8gTLgWPb
         rxCO/SJILw0T3QoQRMZg12i1ARe+fEdR8eZkekJ+kolRENAgTs06kcGs6WvNjSF03h4O
         03mrjRdgrbrR5ver48Fj3nnSbhrSPNpKtOUCyM722lUPgSxIFwww3B7oEvy/x6eL+wCQ
         GLeAgc/5Br8OAzYBw3E9hF5eXRf3vUt5A9buc/HpFmkLmi21yNvU5Om0L/J2DSeZJho6
         XdMg==
X-Gm-Message-State: AOJu0YyQ0F3oj+IN9y/F+4SOHQzdJKgUlQtEYOmjhcZNhmsRap6zuu2k
	aWvvoHRwJmit3NfpzvriVEejRUJPSIhG7wpTjLONz8yP7VM2jFryqkqOxKh+5wkHVqWlJLHHC+q
	Xw5uVCY3lykzDxUVPUk8RDcDJDq9mZTE4qs5Sp/o6+EBurrWt6SjgWNtwfQXf2CONgQWc
X-Gm-Gg: AfdE7ckatfD/q454FWfYk+d4icKYkdR2U2g7OVdwrLlPH6PKDgOvJUyZXspAt6lLbll
	H5k1x4DujUMxlsEX54R5tlMnCHQ6JLi+Lht/lHcdGTZYbYNwBHQgpPnmw6r/mRsJM+E+ViytPiB
	LQd76tMipOD9bVu0YCfHONVx0lxWYhpwm5mFTBBX4dY1ZId8F6bDTR0wS245jASOVb5O76cF0Rk
	jz9zNxcV6p5cVhnEXLDfiv9fPut5EGTGQs0M7lZNd1b8sDGiiT7WbBdB7owH2mmuDo4muYhthtu
	lVaBxI2nbzMx/wHvbQZ0gl4RIJX5bAVA6xV8hFP3x9a7cktWbP2F50TsiKK3/rckcSYtL1eDYse
	IDuLHXqdYXe3PSkkQU49Hp6c8l1GiQ8Ef9VVPz7FbWLtvFnYDglIc7NwD8IL9lPeR3GnFFGaLCU
	7dfhX3
X-Received: by 2002:a17:90b:5886:b0:36d:b9c5:e8f6 with SMTP id 98e67ed59e1d1-38758938d3bmr3634642a91.19.1783401974145;
        Mon, 06 Jul 2026 22:26:14 -0700 (PDT)
X-Received: by 2002:a17:90b:5886:b0:36d:b9c5:e8f6 with SMTP id 98e67ed59e1d1-38758938d3bmr3634604a91.19.1783401973687;
        Mon, 06 Jul 2026 22:26:13 -0700 (PDT)
Received: from ?IPV6:2405:201:c409:b03f:6d0b:bb83:7a67:4093? ([2405:201:c409:b03f:6d0b:bb83:7a67:4093])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d15f13f1sm429574a91.6.2026.07.06.22.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 22:26:13 -0700 (PDT)
Message-ID: <f0221345-e741-49b8-af7f-e0d7f8c973a4@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:56:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: PCI: Add bindings for endpoint gpios
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
 <20260701-shikra-upstream-v1-3-e1a721eb8943@oss.qualcomm.com>
 <59c96d6e-95f4-4b03-b1a7-21e7cf6ce43d@kernel.org>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <59c96d6e-95f4-4b03-b1a7-21e7cf6ce43d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -mjm0I0eK4fGyGWvMWu8HXvi4hqJHjpm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0OCBTYWx0ZWRfX3dRnANsYgGW7
 TNQmvp/3JNcJfZMJSWuMqqVZAh1f3NF5CzMqSUGxs9unFJhgSAGev/EE3KSvljsz1+MT1sL7Em0
 yI2uHFm/htKDlP4rwI9FVcwRjqzndXWRdMAfR9PEHwUr9DiP6hADVVbu9VNnsII9Lm4GFGYXyTF
 HBe+IBhv7S2bUxyEwdp/ZFNlAuUZXIOHrgxh2zXnEvDJNeX7cQ/OMfOZ17c/u7s+XX+XlwEtnq7
 KUEN82/yVkCZPbt9/MjiXrF2rNqkPLo87FK8X7C249jkleJi/3u9tOjsleG5Q0DHycs1dOBPqun
 ozTkACpKzGuA3YT/fLwHm3QVRxZDHkADpDVkm0ErmyJjv+gXLnGz5ZJ7IkX/cO3wFLuReajqrSF
 mbfVcDF/UdpuU5ELnOqRXQtDjUegOzqF+dnCWhMBhbBmVVjU+NjZbvWfWz+TVl5Fattjp6bcBzA
 O25LtSMA/pt9j36662A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0OCBTYWx0ZWRfX6qHu5T3WB6B3
 7tbpp4ZmGYS+ENwXW5qd9iPa0DF2siXlqqoIfsN1FvYo/Sk20AzKDP+GQu57dMzc7LVPmxIR0Sy
 8iE62AQ2zdh0AjWhWp7hixPsoON+msI=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4c8df7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=hW1Q8sUlsHAnT7hvDLMA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: -mjm0I0eK4fGyGWvMWu8HXvi4hqJHjpm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070048
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
	TAGGED_FROM(0.00)[bounces-117124-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1550C717737


On 7/1/2026 11:57 AM, Krzysztof Kozlowski wrote:
> On 30/06/2026 21:02, Sushrut Shree Trivedi wrote:
>>         toshiba,tx-amplitude-microvolt:
>>           description:
>>             Change Tx Margin setting for low power consumption.
>> @@ -104,7 +120,7 @@ examples:
>>           #address-cells = <3>;
>>           #size-cells = <2>;
>>   
>> -        pcie@0 {
>> +      tc9563: pcie@0 {
> And you change indentation because?
>
>
> Just like the other patch, this wasn't tested, right?
>
>
> Best regards,
> Krzysztof

That was a miss from my end, we only ran schema checks.
Will be fixed in v2.

Sushrut


