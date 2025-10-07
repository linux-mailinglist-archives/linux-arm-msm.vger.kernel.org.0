Return-Path: <linux-arm-msm+bounces-76219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C82BC195C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 15:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85D1D3AA0FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 13:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D492DAFA4;
	Tue,  7 Oct 2025 13:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rv9836Hx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456952D94A3
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 13:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759845342; cv=none; b=ghCURYpIjMpINsoAQMJEVOSA2W/GWd3ub7wyhLRJpYG4AgNvTrOq2/Knb+RQvhVaxpbqhTABe5/8uumdLM9JhHVW/Sv/fiaJDecC8tQU3y0+8myklCAY+pUfWbtlms3eYoqS+DNE/v9X4a907SJg6/g+Rgpvlhne/c2qUvFHiIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759845342; c=relaxed/simple;
	bh=N9qdfaqqehWWuUI73ra8Uu9gFKR3Pihqz6Oy79KUWl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fVZLVgeBXZ4AkrO4UzlvJCXNiiFCZ+lMg+0dr+zTlNPQzDHXRUP1sLwi71auBRq1hG9LvZpnkMwxJpQ1g2ydoffWjfzIO2XKZsEAu9pTyRQYJ1mnMEpcmwiLrrtmj7r2ck/lDNm/U0tGtIDWQ1BGdNz7Dgw9yS4+uAct8bTw3u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rv9836Hx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597D1Waf017137
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 13:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZawunH39fsjLdjYkyzjOOeRauXShTP9A+eqv2749nhA=; b=Rv9836HxAh0K16UA
	RT5Fg1NE5UBd4f7azIwbcPwjlzC3WLWStME7D3uRAHaX3QqU1BzQ4GACSY5quRW9
	txeNwzrePS+NA58J713RFPUXKbQ7Awfhra33g9I9UFf9NroG2gCs/QnVHkjTmFY0
	dyp+wwytoYY4zwKiXtTN0vMThKT+3s+TjBc43sw+Yku82WIIpgdPNdwQBjyYFoWL
	p0/gYITcccsdudY6YY/Zb/V4wBw5D5s/PVBYtmF1JQCldKkdws3+wLdIoAh3Lq8m
	K0wTjIkHXyUDW4KPvYi9uHcgrBMw/pqLkn+ZLJ6OlEQFNZ2gxa4TM5uLPtpxGz5F
	tfaB5g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk6yemj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 13:55:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ddf2a2d95fso22098121cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 06:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759845339; x=1760450139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZawunH39fsjLdjYkyzjOOeRauXShTP9A+eqv2749nhA=;
        b=iqEToKs3OvI014ENfh6lyKs1nDcJdMO+npdAMYuUSzl6JjGPTcL0iw7wzWP0rAmmek
         D1qW+gcFF2W9YP/3DdMNA97h+v/C9StYnGt8ohz9o2PCE7qEJLx0W2/FnmB5z4rjiMO7
         Z1sep+ZSgbHS+oZ3Sbvu3YEKBeOekOszqx03Fd/yzRVcqSX/pRVlxZYaEfJKTJVIpk7W
         aWVCk4eh1VCKRw28MRfwVXy1/+ob4g2WAAuGt+RSCgVUIVWd3lgcO3kYCODRFLZjFMpu
         lSgVk9HxJSegSf21pNza8aUgMIasmDPsQ6bGdFrZlHWv+lOBVPErYDYycItthW/BGsOC
         4RTw==
X-Gm-Message-State: AOJu0Yzgjx1g01Ro7ocaNiBNX32Ds71O4zQzQCYIG/xUHUsym3+KHEkG
	YscLJaflX+b+y8skTjlBSPMyD/Enp0kpv2ZWgChGIwoTDCgeaetl7Xc7UIcnuE33nZAcAzonHX0
	dEFt1YwUVUMIstt7E9XIulVyNhsqOWwFvH8/QS9AUcKZRA0yNkJwo5JlOFx0M0nmFyuec
X-Gm-Gg: ASbGnctZuou2thog+rGOilzdorFlLzYGb0xEcsFzs2hGzmRMDgSvgbozMSL1gDflhIV
	CsA14FcL6LAOnABfaM/5TKxf6kO7OItJ40X9gCX4GxZQlFq7aD6RprEo1s0Bc/5i7gL0lYTsiQk
	7n9TU7BSYgvxXLXdFVeues+3CF5PouTSWJaOPB2tMdM8lnjLDPjz9vZfqfA+OGPHilxLLJvWcpT
	xBPkcg8hxAVNtVxEzRh1fGDwmXOzs46jg6+p7/mRS7cIKekr/pK08NKCXT+MJUSeFWHfPe+ky4c
	AQ6lDUQXSQXqUqiCKCCTMipv9Im+kdjDL3u5rbAgsTCtLPICKHMcUAmwsJE18tfCKVyd7k0b77P
	HwthSR8OqVLYTMXX0jN41rlKNUQQ=
X-Received: by 2002:ac8:5a96:0:b0:4d2:c24f:8495 with SMTP id d75a77b69052e-4e576ab6f37mr148761041cf.10.1759845339093;
        Tue, 07 Oct 2025 06:55:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/aNH7N1c2ZiYNPq20l0pNGWjN0O/b0Y5a0V5Yj5aczYTN0tC9/XNNjnxTio4u3+gGdP2blA==
X-Received: by 2002:ac8:5a96:0:b0:4d2:c24f:8495 with SMTP id d75a77b69052e-4e576ab6f37mr148760601cf.10.1759845338476;
        Tue, 07 Oct 2025 06:55:38 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970a4bdsm1403765466b.49.2025.10.07.06.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 06:55:37 -0700 (PDT)
Message-ID: <e58978d6-dc6a-468f-91d5-29d7b0755e79@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 15:55:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] arm64: dts: qcom: sdm845-lg-judyln: Add fb_panel
 dimensions
To: Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-9-5e16e60263af@postmarketos.org>
 <de1a7ecb-924d-4ed2-8034-721b8dce69d4@oss.qualcomm.com>
 <ac2d419d-a1b4-4b3f-a07a-4f5d047901aa@minlexx.ru>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ac2d419d-a1b4-4b3f-a07a-4f5d047901aa@minlexx.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX/F7vctPhSIjx
 ZiPcLerq+aps71ZmCcDHsQcfcWicHl9rkc4opP+a0RGLxkJGLGU8MvuGQStOnGkCQ3uJiIUkrBc
 nhB0ygWWU8eR+vMuqsNP0Nc6C6J1IjcIBv0If6+mFBZfqf/qbFhkv/GW6Ie03GvPKj9/ebCd/Nu
 l2b1gfLieTWifZ5ICiR5uCxiCnrmj7ohRSs5LIFib1syVaaq8HPKowkYASeRktDpajrXDkHi3k3
 a3GcFxgI4hYzNcR8/REAS68JOsnCICqQuuJ06vQ9RZveDopV+656uVFQqaW5CjV0grt6MOnBPrv
 N99U6geAWw5q7IJWrVf/966oqtnIs31tnpzm+gkA1Y9SIQFgL0V2JJvy1ZF6jPdv70ghsdz8bsW
 IWfci7/6ZKkOYf7XR5M4afwgz028lA==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e51bdc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=Gbw9aFdXAAAA:8 a=k_tMZpwa-Rke7L9fme8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: btAqu70bFIEy09XhQHSFFcg7g8Y_Px1x
X-Proofpoint-ORIG-GUID: btAqu70bFIEy09XhQHSFFcg7g8Y_Px1x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

On 9/17/25 4:54 PM, Alexey Minnekhanov wrote:
> On 17.09.2025 16:59, Konrad Dybcio wrote:
>> On 9/17/25 3:09 AM, Paul Sajna wrote:
>>> Add display dimensions for proper scaling
>>>
>>> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
>>> index e84b45ed82fd13850ea7ec1f34ddac5b59fc1434..8c1692f86e6ceea7b718361965e78f95d39373bb 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
>>> @@ -23,6 +23,13 @@ framebuffer@9d400000 {
>>>               format = "a8r8g8b8";
>>>               lab-supply = <&lab>;
>>>               ibb-supply = <&ibb>;
>>> +
>>> +            panel = <&fb_panel>;
>>> +
>>> +            fb_panel: fb-panel {
>>> +                width-mm = <65>;
>>> +                height-mm = <140>;
>>
>> It'd be nicer if you moved these properties to the actual panel
>> node (the DSI one) and referenced that one instead (I think that
>> should work)
>>
>> Konrad
>>
> 
> Hi!
> 
> First of all this code doesn't work well for upstream, because it causes
> errors with dtbs checks like:
> 
>   framebuffer@9d400000 (simple-framebuffer): 'fb-panel' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
> 
> ^^ The subnode is not allowed by bindings.
> 
> The whole reasoning for this little hack is that the upstream
> recommended approach to solve the "unknown DPI" for framebuffer issue
> is to put width-mm, height-mm into real panel node and and reference it
> in simple-fb node - sonds very nice in theory, but also doesn't work
> well in practice, and explanation why will take a bit longer, please
> bear with me for a minute.
> 
> If we do as recommended, device tree structure will look like this:
> 
>  framebuffer@9d400000 {
>      ...
>      panel = <&display_panel>;
>  };
> 
>  soc@0 {
>      ....
> 
>      mdss {
>          ...
>          dsi0 {
>              ...
>              display_panel: panel@0 {
>                  reg = <0>;
>                  compatible = "lg,sw49410";
>                  ...
>                  width-mm = <65>;
>                  height-mm = <140>;
>              };
>          ...
> 
> Then, to my understanding, due to how fw-devlink works, the panel=<&..>
> link from simplefb node to display_panel node creates a probe-time
> dependency, so that the whole display stack probes first: MDSS, DSI
> controller, maybe even Adreno GPU, *AND* panel all probe first, thus
> making the mere existence of simple-framebuffer pointless.
> 
> Additionally, simple-framebuffer probes succesfully after that,
> creating "second GPU" entry in as /dev/dri/card1 making it look like
> system has 2 GPUS, which confuses almost every window manager in
> userspace later. Normally, if simplefb probes first, it gets unloaded
> and replaced by MDSS and does not cause any chaos. In the end the whole
> situation looks even more silly than the fake panel subnode hack.
> 
> Therefore for upstream I'd recommend to just drop any fb-panel hacks and
> to not use panel=<&...> with reference to real panel either.
> 
> It would all be much much easier if we could just specify width-mm/
> height-mm directly in simplefb node, but DT maintainers rejected that idea.

Would adding post-init-providers = <&real_panel> help?

Konrad

