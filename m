Return-Path: <linux-arm-msm+bounces-80299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B3813C31143
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 13:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 19CA24F8B13
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 12:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF24C2D2387;
	Tue,  4 Nov 2025 12:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1ajb7Lz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M2iOnrkE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD8F2EDD41
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 12:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762260714; cv=none; b=QvFBgQNS0tC+0edJQ2Lbv6IwTZDnCTrJn/xQevvz2+/YQ2ZobO1mx9QSAPVjq1kqzX71Mbvg88dIQRsO45DJ2AONTVeS3okoyqjfJeW97Lms6aaQdO5ved9v3KgVbyDw30tivdtrXMwtmWRbuzrj8bmNkoqDaCAvTmYgN5JTOGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762260714; c=relaxed/simple;
	bh=3GxJQierKYpfNjMAZtePaH/hGr/R23DzRiCAO2a8Wlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UqBe+TnqOo7gBO1E4vwBGBVrzdz27g+bjOn4h+MGIc4DaFTiNoHnUkHU7ODVCToSxDvb9SDYMax32FACJoxwf1gv5hO3eenvx/RCJEAmcsJKVd1Gr0N2JEArxrE7dJmNZZ8MWvNJ4ymPsitDnk9HUixy4YyEdEm1rZmbgagK+MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1ajb7Lz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2iOnrkE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4CfhGh1987842
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 12:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nGMcEo5N0s57f7TFRVnqDseGGUisgNaE71hwEncLIRY=; b=I1ajb7LzVcNvA2Cb
	UNR20zxCt9nk8RxZKs6m4YLUTJSyS/wzfd9E/47jDt6J8yjSjqy8+MA8Q4CG+hlS
	KyxK/SknUpMmefNvjOBrB74MFkZJNUeTxFKpLTnuhargptacmW3AIvPFD2NT40TK
	PdbByGBjPf5Ib+hEJ75zwzNRYrcmEYfv7FMExCAr6CsjWqh61Z41wfCTBKYCg+Xv
	bqGVgSlZ3ZdrMo7bi7qJ+9vq8EndXWBNlaztBmkV6Brm3vZn8jq+CWDMyRVC837q
	GxCInT1XSOeWkRkLHylu7kSahwVkXMx4ASevvJdbe8csWpnpqp0r+T0NruEV/6zk
	IFF7qA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7hbjr2p2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 12:51:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eb86039d9aso15844721cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 04:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762260711; x=1762865511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nGMcEo5N0s57f7TFRVnqDseGGUisgNaE71hwEncLIRY=;
        b=M2iOnrkEoNVIkrNqyonMOy+9yjxo2zHM4imrwXq9BN1fqu1n9+QvkRm+3XXe/7WhCZ
         VEWz0ljjsnAMVVXD01515Ze86AZIApFB7zuI3vJH+OGs0LtqdAOMmnHcWmUykLxwNM7w
         71hOuLEqdlAl9GRUsDAU2PGQr/qmyWDTZLT5u96OJWbcKQMcI9kKtIWr++6ggaMED0lA
         U7UikAcuc7Ol3I/YJ39hKl2UndQD+N4N6f+dV6XPqUEA+VAQI+W+gZ1zWqpXJ1xeGOPX
         9ZDWeLKnkSTV7rBqCrZI5d1vT5pwaE0kLS7jJHqdQT+sq2zbf6KgYdmw1iXuYmfoV4HL
         k3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762260711; x=1762865511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nGMcEo5N0s57f7TFRVnqDseGGUisgNaE71hwEncLIRY=;
        b=OFBXzwN1ZzX55LeOzX1mT/obcOBHZBj4utlVL4NWghUuOPCOFtm/MXpVKwVzWT7gIf
         53EQv1VFZZLknrEECk6fnTcKAChjpKRlohqosBBXmTMTIdgBsJkMdMnbO0BY4ZRhrxTY
         38jYO6QH1lRO6zRTgAbpHrJXSq6pwEnY5xlOz+PGod38PdrNIoA4+eopWXqWg9w9XE9g
         I5HcJKRHBho1W37xWDdfx2Tak85e3oPTHu0i5TWOA80J0MBxI7n3Gh2CIv7ftYIDlRv+
         WP31nxOT4XfZHEygFoJLmQQmvNVLiTJiRrExIa5waohA2vBUhIQiQ/3Wdq4pNG0ZJH+l
         qHGA==
X-Forwarded-Encrypted: i=1; AJvYcCWe8Ult9nhqDjThb02Pnnm2iKxNRAkMGnQ0PRsiINkI1kwzsgSNrfChJRbFszdFNafuGun3LmTHqEFgQrjz@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ06iaRUp2YTGZ+hcOMgXMuxens0HUd7XnMX8TNrOxvoOZ7+nz
	Eg/q6vzAaPH/YU5h4bCW4xqym2Ck8/wz81pi/TK2JW1VSQGKfWhnVsmjDWlXGQ6234F4jm0oZGX
	P+BJmvgjcAz03EXEBXLrCZk2LtX6XzVox7ImN1ty5+t1ABkqy8TlKYfWZodHbhyp6NtRt
X-Gm-Gg: ASbGnctiIeLHewvbTZ9oF/5WEpuUj4jjgA+2ev+KgR0+qrayw29Or1BrFwDvwfZrjwn
	Ywjspl9C7Vhd0EkPzoPf4aB98R0khwNYZYUxA4wHUkoAlsRoFWuX43aMjEEkUvmP+n1W1oZH/GT
	fgop4Zyu3xZTvdcUP6lfGyTSP7iRtqcZVcIl+o5BpinkAMrCxSfv2fK3hBX4/trAZcy+dI4MxbQ
	nGiWC4Epsa58dCb/YQ8lhIibfDXEApRgqg4XTRjnsj7+awnmPngj1dWgnDqj8lxIHjwcP/Z8W8N
	xzMCBl07BKCCnGw1p+9ScwYmXmcMRmrk67fyJQRRpKHwdrBZAU3JGXYW/Ww4TjaC0T8eFa4Y+p+
	7N0dpElG1l+PcW4wqKUshrQy6j2dIa7xmaQnA+V0bhM3cP1tV0oS2N6HZ
X-Received: by 2002:ac8:7dd6:0:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4ed6e12f871mr3017471cf.8.1762260710926;
        Tue, 04 Nov 2025 04:51:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEU6St66hSeD14z+3rWOf4yGnqadyqQ8nRKgxFwlsUiVhjRLriVfJzPhJf5CQWAyyU+q101PA==
X-Received: by 2002:ac8:7dd6:0:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4ed6e12f871mr3017131cf.8.1762260710357;
        Tue, 04 Nov 2025 04:51:50 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723f6e26adsm205948866b.43.2025.11.04.04.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 04:51:49 -0800 (PST)
Message-ID: <19ee7cf6-8b92-4221-b450-75b3e3d66e8b@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 13:51:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: qcom: Add qcom,kaanapali-imem
 compatible
To: Bjorn Andersson <andersson@kernel.org>,
        "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Eugen Hristev <eugen.hristev@linaro.org>
References: <20251022-knp-soc-binding-v2-0-3cd3f390f3e2@oss.qualcomm.com>
 <20251022-knp-soc-binding-v2-1-3cd3f390f3e2@oss.qualcomm.com>
 <g2iviaqetgxf5ycz2otzkpmmc4goo7xuyjmttuu254bfzqqvkf@4vybjh4eghpm>
 <4eebcb7d-1eca-4914-915a-d42232233f9f@oss.qualcomm.com>
 <dwfvko3hszsoh4ihnz3qdpsugmocbkrbhosijdw5q3bxh64kuo@o74as2li74px>
 <lz4sbvzfiij3qsa4d7jeblmi2vfubc4ltf435sh6tcs53l6fbq@7f3tfm7yiyjc>
 <mwin3lfvpcwxxhsub2whcpibuayk36f4ljrodvithfygqad5w4@cg4h6peh4v4a>
 <ygqgzflpavwgd43e5zedgcijm3lz27nqlzprttalgcroedz45u@ztqkppajpyry>
 <a7cdd2b3-6097-4a8c-a639-af974292cc8b@oss.qualcomm.com>
 <x4rzktpij4ggnbvnuyoli65gugymli5acrmrlovglttpakaauw@o3vu23bjedul>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <x4rzktpij4ggnbvnuyoli65gugymli5acrmrlovglttpakaauw@o3vu23bjedul>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Uv5u9uwB c=1 sm=1 tr=0 ts=6909f6e8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=yiTxRK5lG8Kk4Q43fuEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ajIiavAUhcx7bVrxBhOjcM-FEqgm4Uzu
X-Proofpoint-GUID: ajIiavAUhcx7bVrxBhOjcM-FEqgm4Uzu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEwNyBTYWx0ZWRfX05zU0lrx4xxN
 RupnlVbdW9uGnVOL2z6GVEZeyQAf40Zeg4qkzHgryvoWeL9i6hCPuf84MOs6NEKCoMWuoBYwtvc
 US3wOm9y7hxRuZEaWclyOkvuPJXN9qn+wstwgfOdAdCtF38Qa+sPWwOmqq9E96qbU+Ps2MZ5/lK
 EtozEWYSp7jp/gJpVvpA3vtX3KKp4tlwBHj81CcuUstmj9NBY7I0wJG5eKlZ43IPSPPYjJ4RCDI
 UokccJhp/P6eoYOyZIP5ynOv+Fbfa8WFS9bDUsI/leWItG6HHEu9FK7bEfIUpFoC9RclsWq/CS6
 vo+gN9CyacW1Mfp/hk12kt8RFf0oVOMG5biMbtoH+BP0uVHjg0lP9EIpip6rboON/WOD/XLzgxG
 KqHPfNrm3C4c9At0V9tErhDjTxzVPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040107

On 10/29/25 4:37 PM, Bjorn Andersson wrote:
> On Wed, Oct 29, 2025 at 07:47:11PM +0800, Aiqun(Maria) Yu wrote:
>> On 10/28/2025 2:44 AM, Bjorn Andersson wrote:
>>> On Thu, Oct 23, 2025 at 03:06:00AM +0300, Dmitry Baryshkov wrote:
>>>> On Wed, Oct 22, 2025 at 05:42:58PM -0500, Bjorn Andersson wrote:
>>>>> On Wed, Oct 22, 2025 at 12:34:58PM +0300, Dmitry Baryshkov wrote:
>>>>>> On Wed, Oct 22, 2025 at 05:05:30PM +0800, Jingyi Wang wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 10/22/2025 4:49 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Wed, Oct 22, 2025 at 12:28:41AM -0700, Jingyi Wang wrote:
>>>>>>>>> Document qcom,kaanapali-imem compatible.
>>>>>>>>>
>>>>>>>>> Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>
>>>>>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
>>>>>>>>>  1 file changed, 1 insertion(+)
>>>>>>>>>
>>>>>>>>> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>>>>>>> index 6a627c57ae2f..1e29a8ff287f 100644
>>>>>>>>> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>>>>>>> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>>>>>>> @@ -19,6 +19,7 @@ properties:
>>>>>>>>>        - enum:
>>>>>>>>>            - qcom,apq8064-imem
>>>>>>>>>            - qcom,ipq5424-imem
>>>>>>>>> +          - qcom,kaanapali-imem
>>>>>>>>
>>>>>>>> Can you use mmio-sram instead?
>>>>>>>>
>>>>>>>
>>>>>>> Here is the node: 
>>>>>>>
>>>>>>> 		sram@14680000 {
>>>>>>> 			compatible = "qcom,kaanapali-imem", "syscon", "simple-mfd";
>>>>>>> 			reg = <0x0 0x14680000 0x0 0x1000>;
>>>>>>> 			ranges = <0 0 0x14680000 0x1000>;
>>>>>>>
>>>>>>> 			#address-cells = <1>;
>>>>>>> 			#size-cells = <1>;
>>>>>>>
>>>>>>> 			pil-reloc@94c {
>>>>>>> 				compatible = "qcom,pil-reloc-info";
>>>>>>> 				reg = <0x94c 0xc8>;
>>>>>>> 			};
>>>>>>> 		};
>>>>>>>
>>>>>>> other qualcomm are also using imem, could you please give more details on why
>>>>>>> we should use mmio-sram here?
>>>>>>
>>>>>> https://lore.kernel.org/linux-arm-msm/e4c5ecc3-fd97-4b13-a057-bb1a3b7f9207@kernel.org/
>>>>>>
>>>>>
>>>>> I considered exactly this when I wrote the binding back then...
>>>>>
>>>>> But the binding defines mmio-sram as "Simple IO memory regions to be
>>>>> managed by the genalloc API." and the Linux sram driver follows that and
>>>>> registers a gen_pool across the sram memory region.
>>>>>
>>>>> I believe IMEM is SRAM (it's at least not registers), but its memory
>>>>> layout is fixed, so it's not a pool in any form.
>>>>>
>>>>>
>>>>> What Krzysztof says makes sense, but rather than just throwing a yak at
>>>>> Jingyi, it would be nice if you provided some guidance on how you would
>>>>> like to see this turn out.
>>>>
>>>> I tested, pretty same approach seems to work:
>>>>
>>>
>>> Now you're shaving at random ;)
>>>
>>>> 	sram@14680000 {
>>>> 		compatible = "mmio-sram";
>>>
>>> You can put "pil-reloc-sram" wherever, because it will perform a
>>> of_find_compatible_node() to dig up some node with the compatible
>>> "qcom,pil-reloc-info" .
>>>
>>> In other words, this line created a genpool for something that really
>>> isn't a genpool, but luckily that didn't have any side effects.
>>>
>>>
>>> There are however other users of IMEM, such as the "reboot-mode", which
>>> relies on the "sram" device probing child devices, and is implemented by
>>> "syscon-reboot-mode".
>>>
>>> Perhaps the solution is to not support any new users of that?
>>>
>>>
>>> But no matter what, the definition "Simple IO memory regions to be
>>> managed by the genalloc API" will never be true for IMEM.
>>>
>>> And as this isn't a syscon, simple-mfd, or mmio-sram...how about making
>>> the fallback "qcom,imem" (in this same binding) and omitting any
>>> implementation until we need one)?
>>
>>
>> Totally agree. We can remove the "syscon" and "simple-mfd" compatibles
>> for Kaanapali.
>> For Kaanapali, the reboot reason does not rely on imem at all—it uses
>> nvmem cells instead.
>> Previously, the syscon-reboot-mode required "syscon" and "simple-mfd"
>> compatibles for older targets like APQ8064, which used imem as the
>> reboot mode solution.
>>
> 
> And there's
> https://lore.kernel.org/lkml/20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com/
> which Konrad pointed out, which would also work with this model
> (qcom,imem fallback but no implementation).

Hm sorry I skipped this thread and started repeating similar points
in v3.

Ultimately I don't really care either way (mmio-sram vs generic node
acted upon by different drivers), but I do care about closing this
discussion..

Konrad

