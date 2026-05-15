Return-Path: <linux-arm-msm+bounces-107828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEATJ7YEB2okqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:34:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0528D54E8A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86A9D30CE0C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1DF3D1AA6;
	Fri, 15 May 2026 11:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z3OZMR/x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MuoCk2Av"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46773E9F9A
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843378; cv=none; b=TDEtJVAEhol5uMqUtAfWmYO3j+Y209U7tD2zceMS/u+BoHmDc85VKrJMbmWnLYcF46RuD5auTlhBfH4+k3naqX2Ug2caRz9Z26aZhwshz1z+G8nVBXndypD1QAmXizmZb1gjZav/4HT9uOfqVen7lD8z8OJ185g8erLsh8TbHqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843378; c=relaxed/simple;
	bh=drOaZU4ycDJzaI5EMDnNtFwnSocXqA53ZlNwvBAN9IA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Al/6yqxEPIpgSK9WJWktbu+ja/NPQjFuqn47k4NIKEJTd6H4ZNZ+PXVn4rXxSKAiiHHwrZKeaXTCgqlAbq1jxHQQZ7IrSC4ksffUBU3RNvB8YVM7eAvCuPmT4lKuBLsXyH2qDT9dqZq/yWqKSG1elUE++RI7IDCy/OWiNe0xtjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z3OZMR/x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MuoCk2Av; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F59I4c3797495
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	smHaQRf2PotzKGQNp55ek4h21N45u+3lfeYBM6Exau8=; b=Z3OZMR/x3B6wBihE
	vzFeZiurGmbf9kf4QbAYq0mLvtmYfmWm2RyE8l4vpLlkipQXLRrqJseYwDMv1jsj
	qtM5pUK8qbIT3W3s9O+HjRJZ2wTnlbQ+6ONpHPYwc2Wn2/aZ9Vs4OQK7OuoGRlGh
	6NmM+j9Cv1V2KP+95QLXjkpljRhOcxlPZee4sLGiiOaL2u3Pfzir2O5oOGPdMLPT
	Yw/0CMPfjz0wmiPKVrmqhN8Weky5je10FkeihosAok5LVF5kpcu7nd4VHtk+ieXE
	YkuVXNMmtmGhkUzO8qRCMG9ZaAi3SpFdmK3guHQSmErx/8ebHQYD8kH9TA67NhI/
	y/0hfg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stx2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:09:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51009190feeso192373921cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778843375; x=1779448175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=smHaQRf2PotzKGQNp55ek4h21N45u+3lfeYBM6Exau8=;
        b=MuoCk2AvOU8MUjItVtNXC8IUL3F9Wu39rjRVLqqnewbLCQiM+y52ksHx59VoH4BtEm
         C0SqcN0X3AC8K0JN0NL+okGbOoKJP2GCCAGoxlJ9ScZ+xINEMOX7v/2NgTO3CpbClCFz
         OppNN9Wvip1yUX5W1a6FmLteIGwHPfT5Sl1Ownx8Y6F5oilklf0wUvEElHwC5wlSKxpR
         ex50nf3UW4ov7crawFe5RbzweEKfkSY71XhA8v1mgDKr51NIITUqEBz5Ztvoc9PWPcgk
         pAo9rBUOyJxQF9y3qtYh219iWFP/S2W1+KcX4Q9pCJDcsrCcQTf5p+9eJ6vuYJZCZZn5
         puDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778843375; x=1779448175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smHaQRf2PotzKGQNp55ek4h21N45u+3lfeYBM6Exau8=;
        b=nV2u6UJeAwqinvEroUAHnssMJh2Wafw7lxopudOpRuAgEFg297d/JrVzT7BZulstiL
         rOY1Zt2/pYWt39gNbOetPp4Ajm7yM94b4LU68kqX4m5UDBsrpcdXFRld8v7iZtXHBpDP
         udxVGnj7xnKMTnvjGI1jVAg7crQPxSU47na1+cAvnKHR+E7k/Y9ZcJrH3FzFh4YYZEXs
         v0nlSyhB2noFu3v4bjoKklpiYosKCWLYqEVxQhXM6OLogS+RrrDU2QTs2sNFR7BPamsj
         GlIbwrhr6gVqXrcjMN0ABtQ5CyXGs+Evg7xibCX2uaiG5aGzcSE7kz9NlQ0yR0JIsQ1A
         2I7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8B8eR1Rx+UqZfbDf9EyR+F2aKmseULuXg/1o4swXmo799SoQcauUZ0I1Vv/6WPtNqNpeQ0FRmJsfAJ9c9V@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3eFI/N37xLIa4oXxu5+jsOvEGugBzSsCn8Eb0IaaArrVxvC9y
	tRLSNFWRna9+BvOXdSDTrdVJvokOw9CN3Fnpk72sqyIF+6KsXuPp4kF/TxbTFAFtekb5ci+MYi+
	7DDKzLkwIhsER1xOJZiARb711SWl5aV27/RbfU0DdzTDCox15v3I6+yWRkNHtewOXUIr8
X-Gm-Gg: Acq92OHQnel2ZG5M2oSc96UyKMjgIDD/Cbf8SIB6ZLSaLKFCjm3jZ5fk6ylSpqwmU0t
	f0o3SAOzPXmm/miK9QCqX1Aea61nQulPmYqIQeN+FFU7Zkw8mpZfBYYwX+Gf9nc6fexcmZnQcH0
	N0MfZm2rIbbbY4RGMklMJ8/SHBS8ov0w0iI02Nl6d/gi6KlCEcZWIYzWdmCJNmzPXo06gB9sepf
	+w33jIM4+2pi7aSFR+qCcRYzZ1FYwDXc3pXD/sin+V2fsHQFRRSjN2XGnmmgYm18AaJNniiYIFo
	u6V7XpmeoBgrkM3vXus6YAHWY7SCExb6ctdF2RrmXGkGQPndce3xLC83jfeOiaHq9GBc5PFzKZJ
	r6YSfzCJl5pJBEjBwxm3l+jmSCyGp1Kug1k23bnAon5zj4JTagYgg0eLA7qeE0SnupAF9jjUkb9
	ymfw9J+1s2IXUdHBa10KltXe7ZlEvwohnBuuMQZF2CdjlMYtX0vhPbDlpz5j5UX06bF5Hlxqpox
	ag=
X-Received: by 2002:a05:622a:480b:b0:50e:df54:c36d with SMTP id d75a77b69052e-5165a057fd4mr44963291cf.18.1778843374910;
        Fri, 15 May 2026 04:09:34 -0700 (PDT)
X-Received: by 2002:a05:622a:480b:b0:50e:df54:c36d with SMTP id d75a77b69052e-5165a057fd4mr44962671cf.18.1778843374442;
        Fri, 15 May 2026 04:09:34 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c6:df5c:d8ed:c370:3eee:b864? (2001-14bb-c6-df5c-d8ed-c370-3eee-b864.rev.dnainternet.fi. [2001:14bb:c6:df5c:d8ed:c370:3eee:b864])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945c8c8415sm14724911fa.11.2026.05.15.04.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:09:33 -0700 (PDT)
Message-ID: <dc88df0c-0be0-4a29-9893-032d6c65a45e@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:09:31 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
 <57696ca6-42ce-46d6-9b30-cd5ad4378e25@oss.qualcomm.com>
 <d10fa5ef-4d2d-4fa8-938c-6ec74a823bba@oss.qualcomm.com>
 <e2c54638-2849-40dc-9c68-636c04719814@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <e2c54638-2849-40dc-9c68-636c04719814@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMiBTYWx0ZWRfXxVnZLWsDGuEp
 aWpIEu2q+8Dhid4dCoxQ/NgEg1Nh7hMIJOIBQchCRIzOjpqc8uG5tDM2LVCTNnBdxB8JQ8TkTMD
 x+zpjPtqZD20qGlJFho9+4WN6DfxPC3Q4xh5mfwiSxCMUcOxenSVnJS0wgKURga6KrvQP0rflik
 q9/a0IRVsjONNeV78m+G8gWTu55GYulgkrqVyBDvURuv83jZ9nZDbbwQENeHsZY/Jl/oL/HK/pW
 9ObK4eLgUp5G7GyTBqO1YyBgJ0bjS0/gB/LJMRoTglAJ3Q8abo55lFXa+xTNVwdh/vA4NlXfUOr
 xlE04GTRXiacCAuFcBnpGhMfSyOyhX95dVu0Hmq3xo3XfeagwlOmikqbWvOKRW8Bejyljmqn3j1
 hA3n3gdpXDTDAP4ctuvxWkzJ/f24xmG2kxgsiIODjWaY9gHNjVEAqheInSR7Py8Ec94PsMtp00i
 eG5OjEghI7YRQWDKAog==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a06feef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=pouD296ARJvTD37ZcawA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: _YWE7zwyREUv60yRtJ8OO0hEejZ9NR3I
X-Proofpoint-ORIG-GUID: _YWE7zwyREUv60yRtJ8OO0hEejZ9NR3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150112
X-Rspamd-Queue-Id: 0528D54E8A5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107828-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 15/05/2026 14:03, Konrad Dybcio wrote:
> On 5/15/26 1:01 PM, Dmitry Baryshkov wrote:
>> On 15/05/2026 14:00, Konrad Dybcio wrote:
>>> On 4/28/26 9:36 PM, Dmitry Baryshkov wrote:
>>>> With the default PSCI suspend value for cluster idle state Lenovo Yoga
>>>> C630 isn't stable enough. For example it might reset if display device
>>>> isn't probed early enough. Drop one of the bits from the PSCI suspend
>>>> value to make C630 work in stable way.
>>>>
>>>> Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>> index e41200839dbe..e6c67016552a 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>> @@ -347,6 +347,10 @@ &cdsp_pas {
>>>>        status = "okay";
>>>>    };
>>>>    +&cluster_sleep_0 {
>>>> +    arm,psci-suspend-param = <0x41003244>;
>>>> +};
>>>
>>> Is it better if you do hack in a
>>>
>>> qmp_send(qmp, "{class: cx_mol, res: cx, val: mol}");
>>
>> Any clarification? Then I can try hacking it in.
> 
> This will send a message to AOSS to intrusct it to prevent CX from
> collapsing

This sounds like a dirty hack. I think, hacking psci-suspend-param is a 
lesser evil.

I know that we should spend time on understanding, what should vote on 
CX instead, but having the issue only on C630 doesn't really help. Maybe 
it will go away once I can sort out the gcc / dispcc / mdss issue on 
SDM845 & SM8150.

> 
> You'd need this somewhere early enough so as not to crash
> 
> alternatively, the good ol'
> 
> diff --git a/drivers/interconnect/qcom/sdm845.c b/drivers/interconnect/qcom/sdm845.c
> index 6d5bbeda0689..2fea94618839 100644
> --- a/drivers/interconnect/qcom/sdm845.c
> +++ b/drivers/interconnect/qcom/sdm845.c
> @@ -1786,7 +1786,7 @@ static struct platform_driver qnoc_driver = {
>          .driver = {
>                  .name = "qnoc-sdm845",
>                  .of_match_table = qnoc_of_match,
> -               .sync_state = icc_sync_state,
> +               //.sync_state = icc_sync_state,
>          },
>   };
>   module_platform_driver(qnoc_driver);
> 
> 
> should give you a similar result
> 
> Konrad


-- 
With best wishes
Dmitry

