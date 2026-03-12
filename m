Return-Path: <linux-arm-msm+bounces-97131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF82FXRKsml6LQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 06:09:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBD026D49C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 06:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64EF8302B220
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 05:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26793890FD;
	Thu, 12 Mar 2026 05:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0oDS4fI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3D435Zh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A75A1DDC28
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 05:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773292144; cv=none; b=hmu05gcDt/AAhVu2bTWIKmwgK9DzNT5cUMECKDk8nKMg0HhKtOy+J5cpDtkSSaE6dC/mUOEDeeW1KPi+fk6uwRNGzVca7fssl+oJrOuDplqLQFGdKtAIzng3yKNjQNQZCGX1ODFoUQ21XtIYJgFdgK9GHW9FA7ha4nB8MfnpOwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773292144; c=relaxed/simple;
	bh=4Ay4KeZS4eXiEtPSt3mPLhTBLJ4FTaJyxiRcarfn/Dk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sA9HxOvTMRS5VT+tr83ux74cxi9P7lzY1Q4CpLD9GDlFqMD4Ph0bslgxCpLelsh4Lt+NG2nfw2eg/oAwUn/oyw069+kwUOLVz0CSaE9aEisblPerbsnboZBNElLKsc0s8wT+r69ifwt4ttiqImYj0kKi/rUIy2JChn7JCAUc+k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0oDS4fI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3D435Zh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMNQo03536246
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 05:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pcFgAgSj0aOkBEs+7jgzkhJuc3AVXnxT2g+3Gs2tM68=; b=Z0oDS4fInFmkWLVR
	uiHyH6EZJyTGhTrt6iqX4LQ9iM+SFlMPNoLa5b0cysVgm7e85L9o+LynrQo32rUQ
	EJKj8ZAwDjLf0wW+4wRhEVicc5DXjL4KhMjvqN6dA11yNVxNeA5njDRRjT1UpREb
	dxHI+fsQqDa0P45GJVBoT5iUP9ld7n+vtnWAiGhLlUFXOT//WkVWEs+0xk+FbkRF
	M3cJxLC8LySdP8r4KXR5cfhryWFtDtUim8/nsiO6Ju6hoi4aGPaIsL1775W37vOf
	tJULbeuPh/22PZf7g3D969FLc4kA6uxiiDMFaq0XIu9BTLH6wPZEwf9Dy6le6N2g
	ZdvLGA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54rxyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 05:09:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35a0b5cf34dso601520a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 22:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773292141; x=1773896941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pcFgAgSj0aOkBEs+7jgzkhJuc3AVXnxT2g+3Gs2tM68=;
        b=L3D435ZhsuPgUlwDq3I6yoWBmGsPE9gFRubm7gxtIdm0L3VbIde98gJavTNU6SGBVL
         cw+NWhGq0+qVdglgialfYqgqh5Syno+lfh3tfjN5vvYmeL4jwibSfk3NGTqLdUx7MqnK
         HFQeiNVpEAsFn2aeiQT6eDQMeW3FALjkQTHmt2vt17eU/v7eAJ4FCMwLibQmQ2enHnCI
         v34okndM2dzTg5yaadWE6Cx00i/gLp6uCNAerRFbvo7Pki/AEqP/xjebURM/j1kjt6T5
         skdTsUTO7WtgQlFRuO91BRWE2vgTPYuAlrl6u3ymUyhKdagBNYDxutkuaKx/IK9Dfwtm
         KMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773292141; x=1773896941;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pcFgAgSj0aOkBEs+7jgzkhJuc3AVXnxT2g+3Gs2tM68=;
        b=LNiELnvbDGk610DS2b8SZymep173/rkRvXyTsQkUvCkwh1eqMMlyJqp8mWy9TEnD0J
         eIG/TJPQqf7hcANICbUf/j8IPl4nU4N+M9Kfa5zOaBjyOk3U6XaRDFjlRSLRbGlN4Y+T
         nk++/xwkcJRgN1cGfpOxflzb65JoqGx+SCQ96VCc/iDwPNqqu9GJF2Pk6Cnl6lsUNiQv
         zPMt4tCHTDx0+YQVgKqC5sv8dDwlR1y28srA4W0BVlTgoJ5vvCYH+XA15bhrQvJ/vaGv
         BmbjpSogzswVwF83wlVJtCV0fhmsZJebeYIqg+jcfDcyf3tWvhYAiHMYW7r9q06W4R9p
         A2NA==
X-Forwarded-Encrypted: i=1; AJvYcCV+GnjJTCiaMVRVP/yqqggc/PSMfMBT1rWeh4DOhMUeGvjS8lucD9ckSAWRPMLJL1barm0/yKhqzEZNbKMs@vger.kernel.org
X-Gm-Message-State: AOJu0YwX/jPWPNhSxluyh71Zx3OClP+eqxogJmeZ0/aHldnTDdAqW9Hp
	md3SwOECNpOzFH5LrPgteWAvK/oHxorWtPmCsFLIz0i67g0aRXOanAV7L8CrZunUuU1FIPYSeIN
	1CXt8Yn4d5vd3wwELwqdJZwPLi+55se2Z6HQIUUxMXGFTY4N12hFDy2TmX39F5u/9EL0c
X-Gm-Gg: ATEYQzz9puSTpEuys3astczvYeFRsE/I0QK2xPZiotPr3yUWLmjLfAlQQfKlzd1vVi6
	N0DaW8ymANzFgSxmWRhiLdKN+eG27X+tXMqug4ubfYNQXgEda4n0BiifyyNVWPB1wikVl5zuR2b
	8ro9JsuVCFLTNi5CkDtT2LFh7VixoXYb60xbTarE8cVv/DGcCxFgfpBOq/vNcEhbQrDZwCVmoZN
	8bOKgf0pN/SC7jX126P3mBBaXw4G3a4fMOwgPEzHU5OPGyCzJHXLZwZEMXJimXbNTI8rRflxqY2
	GF7fzdNAtFLGp4nNnjTlRkXFD959OXuyJwsPDUJ1a79CgnCCY4ZPn3Qg/vXxp55Kjmibzk87tAd
	/qkpyHFWf23C6I7ZDLUq51N/hBA04k4m/S5ZY+W1RjTtC1HsisQ==
X-Received: by 2002:a17:90a:e7d2:b0:359:f43d:4a78 with SMTP id 98e67ed59e1d1-35a01284a88mr4358148a91.20.1773292141329;
        Wed, 11 Mar 2026 22:09:01 -0700 (PDT)
X-Received: by 2002:a17:90a:e7d2:b0:359:f43d:4a78 with SMTP id 98e67ed59e1d1-35a01284a88mr4358138a91.20.1773292140887;
        Wed, 11 Mar 2026 22:09:00 -0700 (PDT)
Received: from [10.231.216.91] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a00332df4sm2306112a91.1.2026.03.11.22.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 22:09:00 -0700 (PDT)
Message-ID: <f5758d4c-d3a0-470a-9dbd-0003684805de@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 13:08:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: disable WCN6750 and WPSS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260311023219.2284643-1-hangtian.zhu@oss.qualcomm.com>
 <20260311031145.2285056-1-hangtian.zhu@oss.qualcomm.com>
 <wy46mrybpvnicmv2aljkyh6lu2gnzz4axl66r2efmfy6pr55b2@phsj7pghzd7r>
 <7aff8a49-ac47-4d93-8028-2710ba4eb2d7@oss.qualcomm.com>
 <igjdwtp7ox244c4iqh6t3ilqvxrh6ann23m2lo5m7daxncyffa@e6a34rl74kln>
Content-Language: en-GB
In-Reply-To: <igjdwtp7ox244c4iqh6t3ilqvxrh6ann23m2lo5m7daxncyffa@e6a34rl74kln>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAzOCBTYWx0ZWRfX40CFX1kLMZVk
 f/aKw1Qr3ziuQAdrQy+Mac80LS7TBrWnmdToVc7SrsLB6rgiAiYF/4GbA3nbdcET7G6veb+HuxR
 F+H+DN6ABreEEtaoNdF+NHfjMgKyqhQGNKudB29D8P2CNxNXM2+rzI1huG1pBkdszNoXxMV6OA+
 W/wqHpHcByNn5IOVYUPLMiVsnZU/ASRaoq72YFaDcuYoRM5fcJ0I8ynpa7s2enUEyX4ynCe+yCx
 TLEu4qeCUDZUnHsKsXUglWn95uNEWvoG5IfM02UotSe289uLAFaEZizMuaZYRIEzJMvImAO1E75
 +IWc+RY0q36nlcRAOndJDA2RkJ/HssRW0d7sxj9zoDJv9oyLxTrfycsqB3biZJ/WCtPzz9btEgB
 9Te1G0w26bVbLqHtxI4rTQqMWOICW5NboJOjbiV9RNYB5ZKCgdCvkGRYiUTqAaCWR/BWeorDNNa
 pYWgrROTMMe4oGxyD2w==
X-Authority-Analysis: v=2.4 cv=YbiwJgRf c=1 sm=1 tr=0 ts=69b24a6e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wsJMvZlqpbo_sQjfH0EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: gKaxJWM-O8XOrbQx4Ph77jgxyWbUGvMe
X-Proofpoint-ORIG-GUID: gKaxJWM-O8XOrbQx4Ph77jgxyWbUGvMe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120038
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97131-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[hangtian.zhu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BCBD026D49C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/12/2026 11:04, Dmitry Baryshkov wrote:
> On Wed, Mar 11, 2026 at 03:06:08PM +0800, Hangtian Zhu wrote:
>>
>>
>> On 3/11/2026 12:34, Dmitry Baryshkov wrote:
>>> On Wed, Mar 11, 2026 at 11:11:45AM +0800, Hangtian Zhu wrote:
>>>> From: Hangtian Zhu <hangtian@oss.qualcomm.com>
>>>>
>>>> Disable WCN6750 and WPSS on industrial mezzanine. On RB3 Gen2 industrial
>>>
>>> You can't disable these devices on the mezzanine, they are not a part of
>>> it.
>>>
>>>> mezzanine platform, pcie0 lines are moved from WCN6750 to QPS615 pcie
>>>
>>> PCIe0. How re they moved? What triggers the move?
>> Please refer to: https://lore.kernel.org/all/20260305-industrial-mezzanine-pcie-v4-0-1f2c9d1344d7@oss.qualcomm.com/
>> On RB3 Gen2 industrial mezzanine, WCN6750 is not connected, instead TC9563 PCIe bridge is connected to PCIe0.
> 
> THis doesn't answer the question, what triggers the move? Is it done
> automatically? Is there a pin that is sourced by the carrier board?
> Is there something else?
It's the hardware design itself. Industrial mezzanine (should be called 'kit') is not a plugin device on top of core kit, but a non‑modular integrated device.
Hardware redesigned QCS6490 SOM and disconnected WCN6750 from PCIe0 for this device, PCIe0 connects TC9563 PCIe bridge.

> 
>>
>>>
>>>> bridge. Hence disable WPSS and WCN6750 nodes for industrial mezzanine
>>>> platform.
>>>>
>>>> Depends-on: https://lore.kernel.org/all/20260305-industrial-mezzanine-pcie-v4-2-1f2c9d1344d7@oss.qualcomm.com/
>>>
>>> NAK. Don't invent non-standard tags.
>>>
>>>>
>>>> Signed-off-by: Hangtian Zhu <hangtian@oss.qualcomm.com>
>>>> ---
>>>>  .../dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso    | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>
>>
> 


