Return-Path: <linux-arm-msm+bounces-100030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PxdApLBxGku3QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 06:18:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAE332F4B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 06:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2A69304653B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090D9328260;
	Thu, 26 Mar 2026 05:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQ3A9Tl/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UN0wCaDI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4152257843
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 05:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774502155; cv=none; b=kn+Fr3XHEaJ4bMtROwtV5iTSofueUN+1n5EzgwjdPixdEtMxlsslwCDvzkitl17NV1ZsbXB1cXoow9Czr9dxnGRouKTcgQ0uatqT7RQXXP1wFDwko8TZJ07ebFU4F6I1/aTTctfgUrl4QRrv9gb4dsZsZjC1USPqpfYTmmEriWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774502155; c=relaxed/simple;
	bh=jIngtV7lw3vPEhiv+DRkYdMmvxbPvbNnD20qR2/tSR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WcnsSmhVhrSvEk1vHN2bvrnS3MArDwuQ6pND8jnx0xH0vxqKRLsHr/5kmaXXFGr3hzJ4N04Np8zRO+vxRvye2SHfSM/XUHmt3IsMoYBMmNjuGIOfiRNSZzuErESZdOhVOcDDr2QUZaeBNS7fwl3Ys8e5+G9I9PNezr0N7IzC3j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQ3A9Tl/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UN0wCaDI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q3aKvF4015732
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 05:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9+aohIFgcTJgc8zRGatBOt8jhkb+aMJkB0K86/2Xfvo=; b=CQ3A9Tl/XxcWHKAN
	SlGMI6cntLsZjD2CbAhVtLqxUppsjfgLV47sVhwAiNLlRLpcmpi9zizvir8vW9pf
	BN7vmnp0lldpLHimpg7O0lOM/n4VIS+aDaKeaidqJiymBTI3WeU3jo1ZEYt0E5oX
	198Km3pVGrQ7LxkduOyi0/YNnSy3S71xcsBHOQLzTn7XZRWl61h3+Mt9vVY7hJH5
	I0aLBxfKs8OmD/aso9v+LyeVQYHd/X4cTLFwkDALtgMvCSkPaimrNgTNT7AGdYrn
	4URML9ZPxNCRfFnY45t98B0BS2Nf+Loo8vFs7OueFUIj1hL8uny11Y9It8T+GmEM
	Ub6hQg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4w1q88bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 05:15:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6ea0e59784so94096a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774502153; x=1775106953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9+aohIFgcTJgc8zRGatBOt8jhkb+aMJkB0K86/2Xfvo=;
        b=UN0wCaDI92UyT41dWWR0AhpwXuiLcRjemg//2p1YXN2wbJIAXWD2wWvhCpWjz6Slsd
         /W1gRq/PX00ABuS8fGn6RZx+99ruP87YmbCXv2L7SeZa/PMPipyGGYRdII0Q5Dxu02Js
         YtDSt7L3S8h00Oe1BSnPre6sFZn/spNhBir694z53LdYm8W4Xoy2Z2vpZtQ69pwJie9a
         oS31nV/dflaGeHCGkMHP1RZ517OOW3HbLZV8d3G/XY3CuL3aveB1Rg1bzh4t6VlvL8uR
         wXGMOdHBY1g23CE9velvJYBC7LdkMVAgRAmE8vDCDaW70V4KUgkjOqZmhXBdnIiVwpbw
         gkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774502153; x=1775106953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+aohIFgcTJgc8zRGatBOt8jhkb+aMJkB0K86/2Xfvo=;
        b=tWmXOAZJSED759KjGBTeLkr8iOk4kjj4Zpddr/MuUH2SqebwgopaL+d+19fFltlGK5
         jnFzoN/peWSlZuqp0goHPR2wXg/De/jIIGuCiQAxkP5kXYx+AvZf2FygAriNhB4XRuGZ
         0NEql3unqHvCh6uBiGHL7g2DiyHfKjUKpo4ZlvJD9cefUsa81+M9n16SaahHKVbHILGW
         Y3BZoCXQLHIJBuRphG5NPjnq5maOKb7Y0Cih4fW5xrhBnoDhWAoEdJb3Sc7a8QzpKdUJ
         Hk/IWy7+U/4ItYoTLonBNM6qea3vvxLWxidn1Q0wcr+SBZxbNqx82MLObDlRqEsuPsNt
         zR/A==
X-Forwarded-Encrypted: i=1; AJvYcCVMgjGkecVNIQfZIdolFqZs8WF0J8ayYLCjzKDqEIkcEU1Efkr/oLcYwC9Retd9RvseMKmAZEil4rXheMDM@vger.kernel.org
X-Gm-Message-State: AOJu0YzPIy30aNLcH7EPio2T26El+othSytDGMkgF9pivWcGZVOkJ1AT
	0SrXeLKri0WP5KT6rEXAk64G08Ge1DbrFxR+ecRTWGsWfLCWAxi4pbntse43d6zClo1As5HnycO
	pGTibWk0R9wFeplU6pmI9or6gOSmeLS9pUmxu00zWeE3bPBj/TpAD497nysAiirtVSsn/B12JyD
	C30QU=
X-Gm-Gg: ATEYQzzo/qn3QZSKjEKC4rVlvefMFC2xxAT7Xg+VDiagsQgY7B7T99zIMC2BFXAzFf+
	i5uyeUOrGC0f7WHfxNvwvrU+zKi6dSEvs1w5v3MotdOwVuHXRtmIJkerpZPd/A8OSr74r8msmbg
	k2QX37pSGGtUGq6Ihxok6gRsyYgulbafM5n5ded5OkpZRYZcmC2He6Rv3ag+G5Z6l4QFhxidszR
	brlimiDUmeBAPG50JCQ3Jr8x5GAtBjK1jrIQKkpWfrGOiyNnbo1Dyws38W6VIbVs+hGbwPfitBI
	R8JnWZVA6BQ/GjIVcraLHCUES6pvUY66OQHf4SiHCzZDYdTydgXcLBwfmojeaneqoOfCYMpcCPk
	BLX3BWyktKzxyf6dSxaiU1RnnVzsAk0/8CHs51sGJEaca+g==
X-Received: by 2002:a05:6300:95:b0:39b:8b59:4ec9 with SMTP id adf61e73a8af0-39c4a794ecamr4511565637.0.1774502152915;
        Wed, 25 Mar 2026 22:15:52 -0700 (PDT)
X-Received: by 2002:a05:6300:95:b0:39b:8b59:4ec9 with SMTP id adf61e73a8af0-39c4a794ecamr4511539637.0.1774502152377;
        Wed, 25 Mar 2026 22:15:52 -0700 (PDT)
Received: from [10.231.195.100] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d388f92sm1630877b3a.38.2026.03.25.22.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 22:15:51 -0700 (PDT)
Message-ID: <ed5a18f8-04f9-4c4f-b4a8-9fc2a277ac40@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 13:15:44 +0800
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
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
 <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
 <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
 <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
 <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
 <c46islnlfzdawtw4o3holunf2a6rvfs7h5dznaggzptatdlqc6@7pjbwcqdtccl>
 <0279f334-95ed-4df8-9e42-749fd854c551@oss.qualcomm.com>
 <3xb6ya4zxhmaode3u3al5r4g3rfzlq2ifbyodvwtr3qgt34pwc@ia2xqfaeufd2>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <3xb6ya4zxhmaode3u3al5r4g3rfzlq2ifbyodvwtr3qgt34pwc@ia2xqfaeufd2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nTmv4roRUhwT8Nj4aTowlbfBErzk_NS4
X-Authority-Analysis: v=2.4 cv=HvV72kTS c=1 sm=1 tr=0 ts=69c4c10a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=1mDv_yBIlbhTikghve4A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzOCBTYWx0ZWRfX0Wxgeu8zYSQ6
 JU1NPIZr4SpbLHkoQ12Wl9tqMi9NrU72ZaRwwUkLIFFb8gl2PuaU1NI2f3DaCOAQISX/UhQo1yk
 AcjVuHbNB7jf79e5ED4NNNsoax4hyiBLFds9TqCC7409Y+3MU9tN/HyyMXNFOiFUvrol+CHa4GX
 mXpIjV/Y3Mp3qi04qmrimkhWheuJg4hOJs5Xcse6Je93fXc/7oNZTJpS7b/wXp/5Mwrk4qJhMSG
 R6ZBGaz9WcrInqz6dGxn91ypjmpcjpkEN3xkmNlufFJ+/WLL4NZyEl05Ln9xEOsZPviZr+c3DdG
 cAbGtlP0DQNlKNLVpTLa2PxP7aR0yIpdOQH6I6zqUKPhzF4qkB03HCubQMLZ0+Il9IkvqK5lwJ+
 62jTpyfTVdQK+K1VWDuTwhTws2BE1sLjToG7UWpqVdtQfDpIlK8SP7fQGYY433frfzdPpciPl7u
 4shWLjgvEyhT/TocLFw==
X-Proofpoint-GUID: nTmv4roRUhwT8Nj4aTowlbfBErzk_NS4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260038
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-100030-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5DAE332F4B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/2026 12:10 PM, Dmitry Baryshkov wrote:
>> 3/25/2026 7:40 PM, Dmitry Baryshkov wrote:
>>>> On 3/25/2026 3:08 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Mar 25, 2026 at 02:40:19PM +0800, Zijun Hu wrote:
>>>>>> On 3/24/2026 9:16 AM, Dmitry Baryshkov wrote:
>>>>>>>> +
>>>>>>>> +	wcn7850-pmu {
>>>>>>>> +		compatible = "qcom,wcn7850-pmu";
>>>>>>>> +
>>>>>>>> +		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
>>>>>>>> +		pinctrl-names = "default";
>>>>>>>> +
>>>>>>>> +		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
>>>>>>>> +		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
>>>>>>> swctrl-gpios?
>>>>>> it is '<&sw_ctrl_default>' within 'pinctrl-0' above.
>>>>>> the input pin is not used by power sequencing driver.
>>>>>> just give it some default configurations here.
>>>>> Please don't mix hardware description and the driver. If the pin is
>>>>> wired, let's describe it in DT.
>>>>>
>>>> give comments about that pin in this dts file ?
>>>> or give a seperated patch to describe the pin in DT binding schema of "qcom,wcn7850-pmu"?
>>> It is there, as far as I remember.
>>>
>>> $ grep swctrl Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
>>>   swctrl-gpios:
>> swctrl-gpios may be not applicable for 'qcom,wcn7850-pmu' since there is no 'qcom,wcn7850-pmu' node
>> which configures 'swctrl-gpios' within upstream DT tree.
> It's a wrong way to check it.
> Instead follow these steps:
> - Is the pin defined in the datasheet?
datasheet define this pin SW_CTRL with description 
"Switch request to the external PMU between active and sleep mode"

> - Is the pin defined in the schema?

schema define property 'swctrl-gpios' with description
"GPIO line indicating the state of the clock supply to the BT module"

> - Is the pin wired in the hardware?
pin SW_CTRL is wired in hardware.

i have below confusions about 'swctrl-gpios' of 'qcom,wcn7850-pmu'
which WCN7850 pin is 'swctrl-gpios' mean for ?
Why to introduce 'swctrl-gpios' ?
what problem does it solve ?
how to solve the problem ?






