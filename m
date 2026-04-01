Return-Path: <linux-arm-msm+bounces-101353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIB1J38jzWnOaAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 15:54:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AD637BA1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 15:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8492730C3C3A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 13:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0B73D4120;
	Wed,  1 Apr 2026 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HaRbwsA9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FlELJEXO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26472C21DF
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 13:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050466; cv=none; b=b9TwRvy9vc2NRHha3vnC6ZQH7s4NWfDZujmCfz7sZejLEv8CLf9cOvLISow0dio/1nTO7k2hy9fPoyOXBAqQTSmkwEUnCJYyAvFGEnwcEpKJjLNSR1EDsPeZ44fBpv3Oq5hufZMA1gUGH0GoYGOCvL3j9rFHK+QLT+XfadH5kiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050466; c=relaxed/simple;
	bh=kjBuFtSmTQKymqjdsLBcLS3k+9y7bSIc4IA9L9bYLps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eQxcYDZir0Mck2DycXcyAJFLsVez+rpZfrtWLWCWkA8CqA1Zg9PC5rizGu+v+48cI4i7MG39LaJQzOls78jq0G9Kr3Fc5UxXAW4lsM7H8T8h3i5UB+aq12UacYiVmBaWAX6nV+tPcFlVQ1cdpRqp+VLH1OEDxvDxNiXKZT2c6RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HaRbwsA9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FlELJEXO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63182dcT719319
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 13:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oUAsPqKJi8o/QNgAhqgHHlu6CHFNY+OVldJYYmN8WmE=; b=HaRbwsA9zcvj5hnu
	FSfUQ4P7CBk4VkzpCyYHXq2JYa7oZJzTqdbHosRUqEfH8ETOFCtLdj7w9HPZGH9w
	yKuKfjbn/6SYYdz0AwLOoYWNUOtb63EUW/rCYXPgVwruZFYuVdhe1AAcqpWJEtfU
	nhfcRUHwhdZrbO34byZ+8HmC4i1wnFol/zQtKmf/aAfpHNLIY0fLNi7RdwDBOHlj
	PIYymzyUBj5u/Rsl/DYlLWN+lsZ3O9j7SVoGaHx9d4Fb1OsS8pI5NCFVxi4RoCLm
	IUn916gYb29ZcIsndOk6a8SciOcD0E0jD6VDwloKkvw4GXOSwhCruhBuZNAeh6lh
	3kSnUA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kcsv9xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 13:34:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da09e73d5so1272381a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 06:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775050463; x=1775655263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oUAsPqKJi8o/QNgAhqgHHlu6CHFNY+OVldJYYmN8WmE=;
        b=FlELJEXOpAP16MkUtgH4kCKlNpx+WWKfZKZcbCYDfKHpe2U3dUdYrLi462xL+/OZdK
         Zlk30206T6B1kjKzCEQZkcHyskCMkxH6iF8oe/3uGNplzzXNM5AE/3DQ9ysgp4RbXfFn
         uAPU8u1/JI/2sXe3Hi5oHyx3aq0gU0AxyhVtLL2d3avsHi+F1wgeLryQaWmBsAuSGaNU
         eRIXq6M9xYsX6WUSnkUJeYlSSAQrdPmtnHMYalwxRCyX03IRXKQZPFbhoqyxr9Xzd2wq
         Rs2v94BrxTTDHYjqfHDrCHSJK4a/vXqPs3elW2MHCkk1WhJLhhExWHxarjs2tr3b9HaH
         MWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050463; x=1775655263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUAsPqKJi8o/QNgAhqgHHlu6CHFNY+OVldJYYmN8WmE=;
        b=gUvnvFxdjWT8dYXktL5t0xoweLvfRHilg20MBfdXXxig5JP0bXajIoM66mlF36IE1d
         wyL6veTe9IKKSIqPdQjnDvhhrUX5NQlZi8kguApJvcT1CzfrYu+KGtTZcfE5ZBDE17/t
         /J62omTfAKl+gWF7VkZGi0qmoVwmWVrSPUQGCGdx95FRE/KnpYlaKsCIj4tQ/e12oiWI
         F65BhHkqNjeQrJUwZz9Ztkr4r10oAmBC2Tg3isS1d/OTQTyfz/PCvpcNyVobUfxKc3ZM
         a/x9dK4Tzu0auwWbe3TjLNJoWardZINwx3uFsa2LSxqIrF8OVI39Vb/DeyuWtXQbIM5n
         qeVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4/IAR/vDVgm0MlHl2psGBeIqHZLszyYQ9S7y9buwdAtRPyVjlu/JlvrKJMuBwZ/n4aDVc2pJujd+Vsygr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy66nMqTr105t1V2IRb9p2Mm624I9wOVZRg8rgTIt51dBo/AomV
	QGrL7AW/KwVIvviDG68OE/8yLJ2E+11Ltc8AHEuB15Nzb41muU/YqcoQUDvJccjQCptHjw6RAnY
	ZJHdcAcSwZ/eoAqrcvIYcpRkv5W2Yf2wx6EyTS/wdN8q9oWn2VOaWeSHR869SFagB1vW7
X-Gm-Gg: ATEYQzy5OtqN3eP+lNuzwe6Y/ethVBOocS7iz5S7sYWUCI6x5SZo5mw0dVNQ0jzTETL
	oky09D250YB7D0/mf34GwdQwJgaj8UFqhTqba7P3IAvSIkGlH25RJQaj2NIdVKc/4v8t/cGnvBL
	oTNlNIpbPjwmDlWaf1cE/q4I3q1wANi+BS4CG1i1AOaMI6A+sDbG2z+OFKonHxjHGaeIwKwHpCU
	2FZrWdyA+8sgdCukjGDhzjVJAkCoeaAbfo97xCnkQpgYslBaS1VSuuFf6Hcwho6K7mTewmT2myW
	AKuXVuT59PqsyJ77DrxhwkR6xkc5/xtCo0jE8noT1VzwjPmSM7tFvjEX+g3jigk8jzg8qUelKRH
	xU835f1WYW0qBbspmUZVxulAaFbmb9Htium3X1sN3JgrKZIbthqkBiQW4Kxn3BzSQnoks7QvR6Z
	Sx14KYkQKlDrbH
X-Received: by 2002:a17:90b:3952:b0:35b:90e7:c450 with SMTP id 98e67ed59e1d1-35dc6e770f8mr2198542a91.1.1775050462899;
        Wed, 01 Apr 2026 06:34:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3952:b0:35b:90e7:c450 with SMTP id 98e67ed59e1d1-35dc6e770f8mr2198508a91.1.1775050462395;
        Wed, 01 Apr 2026 06:34:22 -0700 (PDT)
Received: from [10.133.33.205] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76b986ec97sm3472440a12.30.2026.04.01.06.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 06:34:21 -0700 (PDT)
Message-ID: <4a3887f7-9445-4d46-b250-5fb160c9795b@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 21:34:16 +0800
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
References: <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
 <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
 <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
 <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
 <c46islnlfzdawtw4o3holunf2a6rvfs7h5dznaggzptatdlqc6@7pjbwcqdtccl>
 <0279f334-95ed-4df8-9e42-749fd854c551@oss.qualcomm.com>
 <3xb6ya4zxhmaode3u3al5r4g3rfzlq2ifbyodvwtr3qgt34pwc@ia2xqfaeufd2>
 <ed5a18f8-04f9-4c4f-b4a8-9fc2a277ac40@oss.qualcomm.com>
 <ohg7jn4lozqw3lhwmhpx7qyiuw2pmjl7zwv6cbbjmbr2vnnw2e@qz6wbrjynbta>
 <bf1df5d9-787c-40e9-93db-536612982427@oss.qualcomm.com>
 <vxps2mbj572en5yjickrfdeebdjmk33olxdw6qd7vpfsye4x2d@xrgbjahhgdrz>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <vxps2mbj572en5yjickrfdeebdjmk33olxdw6qd7vpfsye4x2d@xrgbjahhgdrz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEyNSBTYWx0ZWRfX8rkHtvlR1w4D
 1oMHDdA/8YmXbxVi3ndHZB6uYkEpEWSXZVf+K6i1MLYM46/HrZj+6tYtnRO/iJMDRR6PEM9v3vn
 TtQXsKzU+5SStTDnswVZfPfKNf8y6aspc46q0K4b27tzFE9+kAlLksoWWfeq1SG4Nn9S2PaxZUQ
 UcgDkPD5t2PKcGfmF80H2esGkAiqTSCUKGkGnEOM1bAAD1LWbKV8Ea1Dhmnm8ehJp0z7LpHgcHB
 79c/YCFrvkRxQ5rx7ScfOTdLKnYxvcACePJJsMe3uGJgN01pIVHyyB7wFXpWzjMSfxQtfPJBAxX
 Um+cmi8Ml+EqKuC/rpxq0bpw6UOCHhcEYr01gjsx/Rv/islky2sSHZFZ9pq06PnaWmV/3l/Wfci
 L9V6f+j1lkgLOJJ2vB7hHZOZ6JpngAJwoyvXBF3a7vUSnzovHoEXFEtPG7emX9cJKrwEu3RThuL
 xx98eEbimYKvglUs9kA==
X-Authority-Analysis: v=2.4 cv=KNlXzVFo c=1 sm=1 tr=0 ts=69cd1edf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=UxcVjGXgwavKz8fSHwIA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: sdp-KjR_j01fR9o4hnvTlDuaLWDbvh4H
X-Proofpoint-GUID: sdp-KjR_j01fR9o4hnvTlDuaLWDbvh4H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010125
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101353-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 00AD637BA1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/2026 7:08 PM, Dmitry Baryshkov wrote:
>>>>> - Is the pin wired in the hardware?
>>>> pin SW_CTRL is wired in hardware.
>>> Granted your three answers, it can and should be described in the DT.
>>>
>>>> i have below confusions about 'swctrl-gpios' of 'qcom,wcn7850-pmu'
>>>> which WCN7850 pin is 'swctrl-gpios' mean for ?
>>>> Why to introduce 'swctrl-gpios' ?
>>>> what problem does it solve ?
>>>> how to solve the problem ?
>>> Please descibe the hardware in the DT. Problem solving belongs to the
>>> driver.
>> sorry for not agreeing with your points here.
>>
>> it is better to correct or remove 'swctrl-gpios' within DT binding spec at least
>> for 'qcom,wcn7850-pmu' with below reasons:
>>
>> 1) provided that 'swctrl-gpios' is for pin SW_CTRL of datasheet, binding spec's
>>    both description and its expected usage are wrong.
> Please correct it.
> 
>> 2) its driver does not parse and use the property 'swctrl-gpios', moreover, the
>>    property have no user within upstream DT tree.
> There is no "driver" in the "DT bindings"
> 

'its driver' i mean here is the driver which drives the device which is generated
by this DT node 'qcom,wcn7850-pmu'.
source code of the driver is drivers/power/sequencing/pwrseq-qcom-wcn.c

>> 3) the property is not mandatory based on binding spec.
> Which is expected, because on some platforms it might be not wired up
> and on the other platforms the pin to which it is wired to might be
> unknown (think about all the phones for which the community doesn't have
> schematics).
> 

got your points and will explain mine at below 2) together.

>> 4) upstream DT tree have had many such usages as mine which just set default pin
>>    configuration and not specify 'swctrl-gpios' explicitly.
> I don't understand this part.
> 

For DT node 'qcom,wcn7850-pmu' of products identified by the following dts file at least:

wcn7850-pmu {
	compatible = "qcom,wcn7850-pmu";

        pinctrl-names = "default";   // config SW_CTRL pin default settings, but
        pinctrl-0 = ....;            // this DT node does not specify property 'swctrl-gpios'.
	....		
}


grep -l -r "qcom,wcn7850-pmu" arch/arm64/boot/dts/qcom/ | xargs grep -l -r "sw[_-]ctrl"
arch/arm64/boot/dts/qcom/sm8550-hdk.dts
arch/arm64/boot/dts/qcom/sm8650-qrd.dts
arch/arm64/boot/dts/qcom/sm8750-mtp.dts
arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
arch/arm64/boot/dts/qcom/sm8550-qrd.dts
arch/arm64/boot/dts/qcom/sm8650-hdk.dts


>> 5) kaanapali-mtp is originally preinstalled with android OS which supports some
>>    qualcomm specific feature which have not been supported by up-stream kernel.
>>    so kaanapali-mtp H/W has some wired pins which is not used by up-stream 
>>    kernel sometimes
> Again, what does that have to do with the hardware description?

kaanapali-mtp hardware supports the feature pin SW_CTRL involved, but we can decide
not to enable the feature based on requirements.

any advise about how to correct DTS to not enable the feature SW_CTRL involved ?

