Return-Path: <linux-arm-msm+bounces-102064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFYpLnup1GmkwAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 08:51:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 179B23AA7C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 08:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06CB1307922D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 06:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D842B24EAB1;
	Tue,  7 Apr 2026 06:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ihi1kN25";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PF4+rytI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702B438B151
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 06:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775544560; cv=none; b=cemziSFYYmn/Vt01L/zuoByIqjjhJ9EGeSDi8ia2uTUbWItUrWoYnch7UWBuZPJOGjk2rDfyksJ5OFh9f4M4Jr2tJrKggBdsShdH6dKcivZyQjS5iZ9PUwJRiD/Fw9fX/8kyiMUMxycw9JzR1Bjd1+Lr5IjJUNXAv+GFWtN416k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775544560; c=relaxed/simple;
	bh=ElB9Q6wjeKkH5o3t3M5qORJdH/927KhFCKLUC8zpLfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aK3ZuD09/qmheLPrqhA3V0k3xrxUZk5pHl0VHFHBbRoUbYfEqXZS25CChSo/xaYOZ7pKTQApDRCAPyWoxx3gVfvMba9buGmvYHWIct4tyfShxgUib7gad1bhhkl80f8/+sj5fj+7j8jQhCCbw8IWArk0U/f9XsEI63TYhIu6V5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ihi1kN25; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PF4+rytI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376YreE1405987
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 06:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTTq1wh4HXvCWB55XG0GY/u8L0iiLNeuQjUXCQfwBBs=; b=ihi1kN25R9yZbXx9
	Ne5xjUfbiLZxb7S/6U+mA9WwKVe2KS75q3ID2pFrBQRJdp55/OPo4UYtK3DfX7ke
	Lj+CRyuXGb+jaCxyODagBIigcOHAQxkh3NNLdzAbC7N/TVuYIyFEroke8B/m+pNn
	hqnYLOVe22nwoquBITPt0HoedbbVwZ6GWc/aztPKeE9XgDZO1hPmNQqliDg50DCb
	xo3OeLhlZQaO20/X1vCKN42GdBfp9Kf+ZDfnuLkfiB0scq2ocA6N+xSuFhK2fank
	xkda9SC/hS5sTUdEzqLOPK01DFx2gRCqdGFOy5pb3hkohOkMVDtAuYZ8+u8Nn1zR
	U4T47A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrasf33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 06:49:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da5ffe960so1181517a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 23:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775544558; x=1776149358; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gTTq1wh4HXvCWB55XG0GY/u8L0iiLNeuQjUXCQfwBBs=;
        b=PF4+rytIVzc6Tp/rIN5DaPOlDRVwrDfLSdd5A3Ir4cKj7XV6AJncQAUoaDBPTI5IPm
         HCAtD/o6uMmQ1aWoa7p+3LFBrsWNU5rtKxVD5aANJSb+dqUG34DDLTr7x7odEoTj11h9
         4Q4d6xb0/KG4pFyhc1OAdCNyjA6NIY/5GbiYyXT7cj3PHlEN+ZuxLUCALuoZkzMkEes3
         bfi7VnbDQntB7kxCKzDBzUGGqcpIsJGUyvE9IT1VDo6FF8+oxZW0yKZnBkzuXnOoM2Oz
         b1Uau9Xicf4gbOKV1u4qvRfBNnOfVKkgkKM9qb8JlciOBdQ1V78xSRLXtneTIeghwcyR
         4V6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775544558; x=1776149358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTTq1wh4HXvCWB55XG0GY/u8L0iiLNeuQjUXCQfwBBs=;
        b=g/qtrC7OzfGMqlJ1EPPgtG+XOINVlcfgeA2PwKTgrkcOd0nA6r/ok/3v1xxyC2lxXP
         LpB/2TrbrlUqLn8r6CSTeGNFvf0tdeyC3MHCt9xbvLagnLuD3fthpY9mtSbSu2FTS3L6
         s3bAlizw0TbsnTiGqMWFPX7Erna0B3itxJ0r8r2w5SsVJ+vL6eGxGP3UI6jvBi2DLigF
         gIsKhG3GCI4VXREhBV5BBO2LAFJsNNo5fxpO0J1DUTASsGLyXQEbhXAiWKCjo4z5p7z0
         8bBZcnxJY4RTvPdxdjkEVx/+/QR6wxwDKGvZAk1YHwdHhFExOV1BwW3NAE8VNgjlOYIx
         W4zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV2E9CVekdWdy2cWkCFMAfqBWE49J6QL6rNJDi2gj/GBdJUuixmrI+4DBw0/SdRjvYdfvhxDcVn4LsU1Uz@vger.kernel.org
X-Gm-Message-State: AOJu0YzG/x6vNFtldKn8as7LUkS0DkvykaOskATFShqqN1FHVw7i/VCQ
	aEB46ucQMt6LJ+BJjWGOURPfjiB5H6VZYnAmHEi8TgcVasStQ0/kO8MvipwCa/kUglVz5rCAADv
	HyobLEbULZ1PCLnB3ZCjeUnsPrB030g6NWhxrGc0WJ7xLVzVKsONqTFJLDrQSKqkwJyW8
X-Gm-Gg: AeBDiev8mbAUtXDwyjv6Ws7p+CvCdtRYDUhqyxMNW/P56NI8nl2Tr73VNTNc5wyenlg
	wgGxUTCXN28S7f6Ob37MdulViBWilzY6L2PuZ4/wCKuHXxAw2KvIqMDyGhrpdkBBxUhSiXZVu8D
	ftOJqG9cvjCu+aRsIBcA5VW9hP7XZDFyQ+8e0D37Kh7EFjAqePJQgWUjk+nPsk4IKuyEV2x3//2
	TO8tc06VO1bd9cMplVgiXjC0nyqWxVRJBQzNjsuB+ucjVK56HUkyr2tCsSpLQ5eEKoAx+nK89NA
	ezoOUCEy0AA2Y7kxIgIeBjjjjyL08hrmC0fTk7mWXKRBqSlLCMmBcE8B83EcuPQfaRzpK3fK1YL
	xkMips/62xppSVjMKJljyPvWLGoS8JykqOuWPNRZmV0HVnw==
X-Received: by 2002:a17:90b:2fc4:b0:35d:9d38:5375 with SMTP id 98e67ed59e1d1-35de6809efemr8591982a91.1.1775544558010;
        Mon, 06 Apr 2026 23:49:18 -0700 (PDT)
X-Received: by 2002:a17:90b:2fc4:b0:35d:9d38:5375 with SMTP id 98e67ed59e1d1-35de6809efemr8591964a91.1.1775544557452;
        Mon, 06 Apr 2026 23:49:17 -0700 (PDT)
Received: from [10.231.195.100] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9709b8sm19867415a91.16.2026.04.06.23.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 23:49:16 -0700 (PDT)
Message-ID: <e4ddeada-1da4-4795-995c-ea4386918898@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 14:49:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth and
 Wifi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
References: <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
 <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
 <c46islnlfzdawtw4o3holunf2a6rvfs7h5dznaggzptatdlqc6@7pjbwcqdtccl>
 <0279f334-95ed-4df8-9e42-749fd854c551@oss.qualcomm.com>
 <3xb6ya4zxhmaode3u3al5r4g3rfzlq2ifbyodvwtr3qgt34pwc@ia2xqfaeufd2>
 <ed5a18f8-04f9-4c4f-b4a8-9fc2a277ac40@oss.qualcomm.com>
 <ohg7jn4lozqw3lhwmhpx7qyiuw2pmjl7zwv6cbbjmbr2vnnw2e@qz6wbrjynbta>
 <bf1df5d9-787c-40e9-93db-536612982427@oss.qualcomm.com>
 <vxps2mbj572en5yjickrfdeebdjmk33olxdw6qd7vpfsye4x2d@xrgbjahhgdrz>
 <4a3887f7-9445-4d46-b250-5fb160c9795b@oss.qualcomm.com>
 <crlrsxrpzqad2oj7u7sjdtpdxnbdjjfw7kogughydgnlatw7m7@qpytwjgmrzke>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <crlrsxrpzqad2oj7u7sjdtpdxnbdjjfw7kogughydgnlatw7m7@qpytwjgmrzke>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sVr_Dau8eHPTKxPF_HJ0Ttnq5fwIQDHC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA2MSBTYWx0ZWRfXym/OXWLiAsjR
 O4SotisEG6pRJ1sXXuZPBsQrCxPmJ22lXvhvcN4prwkuA6NUl+pWXYAIvUpGODPfQDeuFcJAFk/
 SXlvmy7vOgp2txCqWJWkrmXMjoEE93INITzyPI6VsrgOR5IZDNigpKEFaZWlbdeQsFDqWuK7ejK
 8DG5l+/Jdoxb/++G135dojVXcpO3y3wNF7bp5HTw7Di1+jWOwMl/o0WOX4j19rRF5ePDLjpJq13
 +w67fRs1VUNWJHihAC8LPsrWQl+WZmNpGPixGim2SH3omtX46agHNwyUdMtjjRhULNZQIwM1jdR
 lW/5i0XSQd1jBCuj+B3qbJKl5W8xncdjQs2gqKV8uzVo7SinxjZPjA4OitmpaYOizpcfdnSIxKp
 GK/QF+If8jFvY8VYqb+NuJmsvr2RAIUyQmrhx40pJgPce9ZBAFTFJ8yMUPqv/5O33ch3TkMvVCE
 iSQOyak5juaUSuEJwEg==
X-Proofpoint-GUID: sVr_Dau8eHPTKxPF_HJ0Ttnq5fwIQDHC
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d4a8ee cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=JdHaf1hwYJhrKAK1CHEA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070061
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-102064-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 179B23AA7C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/2026 10:07 PM, Dmitry Baryshkov wrote:
>>>> 2) its driver does not parse and use the property 'swctrl-gpios', moreover, the
>>>>    property have no user within upstream DT tree.
>>> There is no "driver" in the "DT bindings"
>>>
>> 'its driver' i mean here is the driver which drives the device which is generated
>> by this DT node 'qcom,wcn7850-pmu'.
>> source code of the driver is drivers/power/sequencing/pwrseq-qcom-wcn.c
> DT describes the hardware. The driver behaviour is not that relevant
> here.

agree with your opinion which is right (^^)

> 
>>>> 3) the property is not mandatory based on binding spec.
>>> Which is expected, because on some platforms it might be not wired up
>>> and on the other platforms the pin to which it is wired to might be
>>> unknown (think about all the phones for which the community doesn't have
>>> schematics).
>>>
>> got your points and will explain mine at below 2) together.
>>
>>>> 4) upstream DT tree have had many such usages as mine which just set default pin
>>>>    configuration and not specify 'swctrl-gpios' explicitly.
>>> I don't understand this part.
>>>
>> For DT node 'qcom,wcn7850-pmu' of products identified by the following dts file at least:
>>
>> wcn7850-pmu {
>> 	compatible = "qcom,wcn7850-pmu";
>>
>>         pinctrl-names = "default";   // config SW_CTRL pin default settings, but
>>         pinctrl-0 = ....;            // this DT node does not specify property 'swctrl-gpios'.
>> 	....		
>> }
>>
>>
>> grep -l -r "qcom,wcn7850-pmu" arch/arm64/boot/dts/qcom/ | xargs grep -l -r "sw[_-]ctrl"
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dts
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dts
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> So, let's fix them too.
> 
perhaps. also fix for kaanapali-mtp whose DT have gone into linux-next.
BTW, there may be other 'qcom,wcnxxxx-pmu' which have the same problem to fix besides
'qcom,wcn7850-pmu'.

>>>> 5) kaanapali-mtp is originally preinstalled with android OS which supports some
>>>>    qualcomm specific feature which have not been supported by up-stream kernel.
>>>>    so kaanapali-mtp H/W has some wired pins which is not used by up-stream 
>>>>    kernel sometimes
>>> Again, what does that have to do with the hardware description?
>> kaanapali-mtp hardware supports the feature pin SW_CTRL involved, but we can decide
>> not to enable the feature based on requirements.
>>
>> any advise about how to correct DTS to not enable the feature SW_CTRL involved ?
> You can enable or disable something in the driver. It doesn't change the
> way the chip is wired (that's what DT describes).

got it. thank you. (^^)



