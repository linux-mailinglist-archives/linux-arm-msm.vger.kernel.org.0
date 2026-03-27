Return-Path: <linux-arm-msm+bounces-100299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GlJJIN8xmnwKgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:48:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 963AE34488B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9DF233010212
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14953A9623;
	Fri, 27 Mar 2026 12:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p83FsuCh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TjD+9plg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991C6386C09
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615676; cv=none; b=agPWXD/yL1A/Ar7FYoMSDsNAi/5uFuOwN/D3dWF0Lc90W4XecrtVYxjNaLoUxyfThfybt3PuwQn0quc+7ixpkN2N7xjBWxXE76jVkkhUFs9uINe521k1GE//8ebrLEWllHXM4z+3ouy0UFY3HzEJErzFOyRBERHdFx7wXfE1jeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615676; c=relaxed/simple;
	bh=vA3uN2ML7GJtaLvb/dMgvC7ai+cMTjDlNlylEH6lWrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y3eQyQ8pQOUr8WG357AILuzwYjO5OWQTDGLvB/HUHD+EWDouErJFz6KkByFZLqh/NGTmKHxcRzZ5Icoyv82QEf9AQH3lmdpgX/DiT0y7PnEZ8GdQ1KvtXBTxue2rXaX0Nen+A9jw89WY7ClOM7UBUTbWluCLy4L9HPASH+FZTw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p83FsuCh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TjD+9plg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wH172538712
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3WKEUDRkSeItXtXpqPiTHpqAYgm/9B9D7SnPy3ACdn0=; b=p83FsuCh5RKXu+ba
	WXmOcvqyHEoR8zESFxFo2DdKsMoIHBZPYf2WtMBKJ/jrwxkDQu47tkyxSZ2miQqC
	WYNmrdz+5GRO3gAtjsxud4Vb577CulPsLB5zGBk545pq4TUjGsG2zQdJCNm9vTul
	7mduuZZqyxi+Ioyc3iR3YKaRt18rgdnGsDpXSMFrKevpbuB1i61InjKSLcTv4qEY
	F90XvaxqrszDYSXf5Eb+FHEVpkqXlhiKiu3c8IJ6e75LtjLcgciXd0hJTtMeIalK
	+TH6I7igcCfRiTxkYGr2lcePK+VdtSoYA4hIDbhfP8zAS+Lw1YKL87DnqjQ9EzzF
	sIayVA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5883m01s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:47:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b33a19837so7736841cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 05:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774615674; x=1775220474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3WKEUDRkSeItXtXpqPiTHpqAYgm/9B9D7SnPy3ACdn0=;
        b=TjD+9plgX71qnNdHaNpJO45u0mOaPXm+FwoFkOHViUYWxXAliQ6PbAL/eNyPZQjEwV
         cT3Y9g/WIS+L2SiUM/5XwwzANOl0wRVhXjdoA8JLftkoWlmcKIrWVMEy7lCyihNeZW5a
         QzorXckmMhppYrvFUb1kguuwoHSoAGSvQvd72LAcB/NA8nfu/iys7P8kkEu53FBB47In
         9IOvRuKRB5MBkIsDwAIwZ6InBm5FjYaYbV9k8r1YPJej6RoTrBUE+2JcKZFLUOEixB0d
         6AU9rr1GbBIlmRJIczuBPzt2gvZytdH4nNBmjqX0DI7sdGFxwDMLop6VhTqr6fZgFDFG
         2DSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774615674; x=1775220474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WKEUDRkSeItXtXpqPiTHpqAYgm/9B9D7SnPy3ACdn0=;
        b=ExZ6DHpu5XGl17Uf2d4lykqXvUoxLvQO+Yix3KEr5P4fGa/vW1EifHFPWaFDMFsM1t
         MYsmS6H+JXWbulj7lZgo4ZtqRa0zoZSyiiFYjoWKxY89MR77NL4KY6Pechx0lmKnXt31
         pkzVIwRnsMRGUZWb6zdA5hi1Y1FvdRLQ2+W5Suailyjm8kAgX6anp5iLbQMSdBgSC5Iu
         f84Ww9O3/iaU8MmXIvIxdrsTPa9YnNEAreGXLQPXqzmkTBS7ynbxOJyrFPtZ6PnUvakT
         XezTCqqFgYKdRHVI11Oq+FYi5kAL14lXgyy7z6LoMbIWrYXXvFpQ0uAM1z/ptQNa54yH
         daWw==
X-Gm-Message-State: AOJu0Yzfp1r1iNHVix8VCJgB9WELuTaiOcz25Avefdir0DHCSp9MUAfY
	Hzv/iKe5M0gDI5DYuZLfEpOIsJByu4WBGOJw32hlE/fdFcL8jpE+J+rbESn4tPnYf4GbqgyDXIy
	bR86rRbZLg4vKcIoHJFt/K9E9JJasI0n66N7dlgVhA32Lc7FnGBAg5EkDQ3CgG6CHpz9M
X-Gm-Gg: ATEYQzy0KNwe1qnGxQA+Tn6dX381fb4tAOEAjdmDGZ2T/tjU+948LCyC94xzxMyEXiD
	FKvY4yM9iO0VTw00PQIZyZosFYe4VRkAALiaBQgbv07CyPG7cnU/gEDoyTo6/AKJmTJ9Ed7r+6F
	W8opOTeLP1EIXXQjks1Bh1k5MmS+ftBlJyKukIm50jQIVXIY+cGcwmxPQqUFLtBLWrCxaTm9s9b
	znTq53yiLbS+GhgnbLzC9gJnK8lp5H4l02g0vlQjYJu7TyKI+FLIDe/uD5bO2xpZ5QI/JqwDEbI
	8pBp4SaBYryu+MoPBiTs1uPC+KbKHB/wAoZEkT+QhDib5DKHOJjE1mwp5Fx7yr5A/Yz2W0U+C7p
	fR7ci/9KaXJhzeOPlyIAdWyWN/wML+jferAKIFyYjd4cU5ObEOrSkslkpTIXcoJ9vk/1bYqFko0
	8wLaA=
X-Received: by 2002:a05:622a:1386:b0:50b:92cc:f879 with SMTP id d75a77b69052e-50ba39655dcmr21840461cf.7.1774615673875;
        Fri, 27 Mar 2026 05:47:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1386:b0:50b:92cc:f879 with SMTP id d75a77b69052e-50ba39655dcmr21840131cf.7.1774615673384;
        Fri, 27 Mar 2026 05:47:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b0e41fbbesm1568517a12.11.2026.03.27.05.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:47:52 -0700 (PDT)
Message-ID: <e1228e6b-64c3-46f0-9087-81bfac4aecae@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 13:47:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add ov02c10 RGB sensor on CSIPHY4
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
 <20260316-x1e-camss-csi2-phy-dtsi-v2-10-859f3fa55790@linaro.org>
 <b8d00023-ebe1-4abe-82ef-c8dc20f333dc@linaro.org>
 <f5c0c9e0-78c4-4c54-be10-c252715c36dc@linaro.org>
 <85483caa-5e62-4c66-b3a9-23ff7fc16f98@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <85483caa-5e62-4c66-b3a9-23ff7fc16f98@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZzZbVV1W1E8bkZJ01HES9JVOcx6sH7h_
X-Authority-Analysis: v=2.4 cv=bopBxUai c=1 sm=1 tr=0 ts=69c67c7a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=-UYcpfoDvQNaV7eXuvMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ZzZbVV1W1E8bkZJ01HES9JVOcx6sH7h_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4NyBTYWx0ZWRfX8MpG8e1ES0my
 ngegODL56rY9uVCbniHiPa/LiAIoNOMFSWozmGDUVgVO9ZqaNqvivuADbOr7FJ/cwNowf17x3js
 StiqO+wPF3+x7MC5QMrp3z10b3zi9f4Ah0+by9IjvBMhQsCclBnD8k2qka3d0tuUpQq2lrt6wKz
 +UcR/ksGV5w/coWpohl1eToT57dcRAAGVOiaBMsgmc8yoBfHDY8hT/6UjnNd8eDt4El8mQ4iAZq
 LlEOYuwN2hHJF/ikjzni1NRD2OXabVFTrJ0cpUd7c03sE3DGthu9WQgszQXrZSuKh5ZpmfhisrI
 lIaKzV+MQRFjzG55ryfXsq4+5nbpRUOFZvmsKrqx9MbIAWT0mGX1w0O8xOmQm7SQgaKHroV13Ls
 TxKD/tsP4NnKfa4AKTV7P5/WzkcKUYlzzHap/WPCEEGZGeOWfbBzqZ8vEGgj1gGeRu/mYxYJ0+b
 yUd+R8y1mprBW5mLNKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100299-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,x:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 963AE34488B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 10:26 AM, Neil Armstrong wrote:
> On 3/16/26 12:46, Bryan O'Donoghue wrote:
>> On 16/03/2026 08:28, Neil Armstrong wrote:
>>>> +    ports {
>>>> +        /*
>>>> +         * port0 => csiphy0
>>>> +         * port1 => csiphy1
>>>> +         * port2 => csiphy2
>>>> +         * port3 => csiphy4
>>>> +         */
>>
>> Hi.
>>
>> Thanks for the review.
>>
>> I think the above comment probably isn't making this very clear.
>>
>> port0 => csiphy0 => msm_csiphy0 in the media-graph.
>>
>>>> +        port@3 {
>>>> +            camss_csiphy4_inep0: endpoint@0 {
>>>> +                clock-lanes = <7>;
>>>> +                data-lanes = <0 1>;
>>>> +                remote-endpoint = <&ov02c10_ep>;
>>>
>>> This is quite wrong, with the PHY in a separate node, the lanes layout has nothing
>>> to do in the "controller" ports since the sensor is connected to the the PHY which
>>> configures the lanes functions.
>>>
>>> The PHY should be a media element in a port/endpoint chain to properly describe the
>>> data flow from the sensor to the controller.
>>
>> If I am reading your comment right, we are already defining the data-lanes where you've said they should be msm_csiphyX below port@X here maps to msm_csiphyX in the media graph.
>>
>> So for example here is how we configure this before and after the changes in this series
>>
>> media-ctl -v -d /dev/media0 -V '"ov08x40 '2-0036'":0[fmt:SGRBG10/3856x2416 field:none]'
>> media-ctl -V '"msm_csiphy4":0[fmt:SGRBG10/3856x2416]'
>> media-ctl -V '"msm_csid0":0[fmt:SGRBG10/3856x2416]'
>> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGRBG10/3856x2416]'
>> media-ctl -l '"msm_csiphy4":1->"msm_csid0":0[1]'
>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>> media-ctl -d /dev/media0 -p
> 
> So a csiphy is a media element here, so why implement it as a PHY ? and there's a data link with CSID with should represented with a port/endpoint relationship...

Does it need to be a media element in the first place?

If it's just about configuration, then we can (?) make an assumption
that the PHY is hardwired to the sensor, and if we want/need to mux
CSIDn to the sensor device, which would then trigger a change in the
PHY (if the PHY even needs to know it's being remuxed?)

i.e.

the above sequence would have:

media-ctl -l '"ov08x40 '2-0036'":1->"msm_csid0":0[1]'

Konrad

