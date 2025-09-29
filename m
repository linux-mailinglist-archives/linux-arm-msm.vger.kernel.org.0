Return-Path: <linux-arm-msm+bounces-75469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEFDBA80C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 08:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37BA97A7817
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 06:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C9121930A;
	Mon, 29 Sep 2025 06:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QvCqcVRQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57D6335C7
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759125762; cv=none; b=COgmoLW3dR6NYhHKni3cQqhpN6/OceRySigXDC0I0z2vnCB19jM1JI8wzEdKW5fCkwFH9NmNySWvX61mPAmxh5G1J917T5OLyEAzxUIl0qs1TjileTYS4TYQw8qDLr2bScTnJYy9ZtXWM/a3InELFXzxpCR151CDcMt1V+ByYuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759125762; c=relaxed/simple;
	bh=EVwKZ9ffdaADDxMp/oxfmX/duyCcrAcbHorH6J6Cjhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tr1ccbKu1Fbe4uxUdBD2do2okeo5Qk6LIxuVmFs9PfsqaKCxBODolEatQMJ3XSkhd7eqNPUoz/rQK5tCg/M4knAytJWvh/DygRgVvF0R2UMHpJC4NvtZq8sk8Q4Ip74c8Sy+NpE7AVfLPqKw6+ugyjYf5m5k/m4a/+JPpq9gtVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QvCqcVRQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58T09U42027076
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c84sJy294lRAsvdayLiR1jZLIpH9uaxLIGDdgwQe68o=; b=QvCqcVRQzLPsbawx
	s58RDUfGswe4txwaxDvqG8Rr0YstVhEvzpYtaw18yl+ljSv2A9AFa+gnvXerbPVS
	ogWP0HXpP7HPbpUieUNh6Fr4CpTbyPcOCEuFz9yaBW4x4p8QZkOIZ3koQlXRHJ5l
	GL5Du2iVZS81Q83/tq3gTb750URX8G/4dBtel4uNq4cCcU1aQMYq0GxPZ4oVqLgX
	ALSGbfLHApjQdhNXVCwzfiqgeFjX7OPYH/a3gIYtz6m4cfWVNQrdEtJeoIicJac3
	eY/HKQ0sUMxNTXEbjEYnCkGBpA6EFKdigFb3vR//5y6WNkOnLEYuOEXkW2avFOiT
	HDiHwA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hbty9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:02:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b59682541d5so3179828a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 23:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759125759; x=1759730559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c84sJy294lRAsvdayLiR1jZLIpH9uaxLIGDdgwQe68o=;
        b=icbBdEB+yWOJgs/oWV3o5xVAdMF6TfwcZyngIXmYMABI3Z5/gkd3k8dvuKbdWaQtzi
         CLAwCcr+SXXQSPy2EQ9sWlF/CYGYgAG4SkjHale1lXqiqOshNGmZU4ipEiXCt4JaqeWy
         uQhNq0G7mHz6YoySegEDmhXAJzNyaOraX3qhErKlHeOXPCuJAMPNZqNhu/ovsONwTleX
         5l3jH4j5Coad6xiRIPFOWo0ItQGOYl1tS/PN3ZsU4s1QtQJAW+aiOeo+hlEsuSWXmury
         W3NpEcIxLYvFx6s0GfFR8ES9hCiydDIEyQ4M+gusCpxlHJB+XYMOjuqzVTS4eGu0BMs0
         cqdg==
X-Forwarded-Encrypted: i=1; AJvYcCVP2Dqp4SLC6GCy8jcj6N5Vw/ADM+JmnX0bZD9a7s9xSpANmg9YGeACdOvK2WV9ar5UcbKeQTlaSY+EYyPt@vger.kernel.org
X-Gm-Message-State: AOJu0YyvliTKZ+izhimpuEWSFE7cGNDyBvqJ2QNwS2HdE6gSXwfeW+fq
	OUZKv1cd9er1WNWY3PRFr+h4zfLrBBgeZKfet+C8MNblOnWxBMXkG2vxoh7Sus19aQmRHUUFfUW
	bjYEGSA24YTKom87VC1RiUDWESbAK/kSfMZ3Ypr51ZbrLW//gqrTcMjSpmnwZFMjj6pRk
X-Gm-Gg: ASbGnctW6ZST5QyMvJIrGvyqAKk0xl9hJ6qdt2kSu6iSvCtSwuenVf+OnkDfL7LVwsG
	TfaDCJxmJ1nkrChSVUgSJt/C57XDHapZn94YKWjIx8CLGdYBGf4VDLJ9FIQPiKGF+TPujlDhuYy
	kEJFPSe7kicO17iaP12rRQOx8LqquZqUG5fLRfvpIwn92M/TJb6zwlHWqEcfmvO8l8fLIF629KG
	Lh8ZSQ1EFlthMNrlW5dgTG5PMw90Yjk92su5bEnl/GpS3t0MyqzNhMmH3G2ufggtZ97ZQLIIKm1
	zt5ZGyrJtQqyDadkw/2Q/15VNh2L35QHUwQfEu5t0O9W0PfiZ7yd6/4A48X3Qu8pK23HQuOI6aV
	xiNig+Pwtuih6ocT7SfnDR9j7POdg2n/6fvk=
X-Received: by 2002:a17:903:38cd:b0:27e:d4a8:56ad with SMTP id d9443c01a7336-27ed4a85a82mr165732325ad.61.1759125759079;
        Sun, 28 Sep 2025 23:02:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJ70u453/jxOUh+G0kG8uuIYknKfil7i8PuspUU15QgIdesSV8W24AVurbFTeHJcYwjL3wwA==
X-Received: by 2002:a17:903:38cd:b0:27e:d4a8:56ad with SMTP id d9443c01a7336-27ed4a85a82mr165732105ad.61.1759125758595;
        Sun, 28 Sep 2025 23:02:38 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6882133sm120557875ad.89.2025.09.28.23.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 23:02:38 -0700 (PDT)
Message-ID: <7f4bcb3e-2469-41d0-b3a7-392ffcbba515@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 14:02:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31
 eUSB2 PHY for Kaanapali
To: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Ronak Vijay Raheja <ronak.raheja@oss.qualcomm.com>
References: <20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com>
 <20250924-knp-usb-v1-2-48bf9fbcc546@oss.qualcomm.com>
 <CAJKOXPfVhixCk0_Xh=9XokjHObM=P+SP=itaXHv7xTr69pc3_Q@mail.gmail.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <CAJKOXPfVhixCk0_Xh=9XokjHObM=P+SP=itaXHv7xTr69pc3_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX/nKaFXX91I4G
 1Homs86bKanqURo7xjwoPDKdknxL3Ss7vChp+zUDtBB27EOVq0EyX2rL+zly9yHSGgwpjxQStjx
 oUCjI+mUyIAF6SRjFMFOqenzI5mELiQ6IUPlVixXvNc0ZCQNsnnlcgGJeHH9bNFw8k8tSEQCUcD
 5prl4LyWcVgLPUJbJ4kBLNtuXFc1TLyIJzAN+KUN2RuciNYREYzlL7XmaAEAbbll6IUGez3DYQr
 4KO5S/GRNPEG8MDB9VKAAAKeW+BrBgxJiZp3xTABR2FYMq/3RV+ciMS8RTjTpkt4DbHnMAdfLlB
 gJY7lEVQ3/aIA8GVAdya3n0wIk83Zimw4+qQkwZmtpbJ6lM1fArHXkWkzl+qWx9jHv4NfYc+IRx
 9fxHdrm7/gD8oxJI8rcidORaLpP0Cg==
X-Proofpoint-GUID: mScjtA6ABmRVU34616Q5BqDubo1TQMN_
X-Proofpoint-ORIG-GUID: mScjtA6ABmRVU34616Q5BqDubo1TQMN_
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68da2100 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=nQufxc_MvbZzznxDM0EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041



On 9/25/2025 9:46 AM, Krzysztof Kozłowski wrote:
> On Thu, 25 Sept 2025 at 08:35, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
> 
>>  Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
>> index c84c62d0e8cb..ab1cdedac05c 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
>> @@ -15,7 +15,11 @@ description:
>>
>>  properties:
>>    compatible:
>> -    items:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,kaanapali-m31-eusb2-phy
>> +          - const: qcom,sm8750-m31-eusb2-phy
> 
> This time maybe without HTML:
> 
> There's no such code AFAIK, because original work was never resent and
> never merged
> 
> You create some convoluted big dependency chain and I suggest first to
> finish upstreaming previous project, because otherwise it's difficult
> to review and impossible to apply.

The SM8750 USB support was partly merged,
The qcom,sm8750-m31-eusb2-phy binding was merged in commit 1166a2ca0900beafbe5b6d1bb357bc26a87490f1,
Link: https://lore.kernel.org/r/20250527-sm8750_usb_master-v6-2-d58de3b41d34@oss.qualcomm.com

Thanks,
Jingyi


