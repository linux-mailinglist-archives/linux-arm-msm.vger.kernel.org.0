Return-Path: <linux-arm-msm+bounces-77087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F78BD7607
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 07:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B102318A7DAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 05:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AC525C80D;
	Tue, 14 Oct 2025 05:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/9jFdlN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6DB2609DC
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760418827; cv=none; b=PsCabFkAUFxavOHfEcGbiiuxARedIZ98ks7YBZTmvez8pwProQJTEhQHcEceq4wWSJoK8+GWfw1LTU/Xs0P0jC3tg57JEINWhP3FLRU/e68K0+jOTg8elTxQhggANoQTSA7mXBNMI08t0fTZtXN8m0QmXizS5P/DUDbDNhT1q0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760418827; c=relaxed/simple;
	bh=bg2eUKmsZctaIiMpNyHeUX3SYQYKQEYGpTMYvlqyEHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQfvlS7TZk9o0HPamGDJ7v0rO9C9BX6oFMiOiuZz00iDVfCeuXdozdfggR7pIFUDZ8NBEBqQmxE70hFEK52FCpuBl2UiV2YjeC+rt/R7b1XXBWTvE+vlf/2fAAFPRyGmP+ld6wx2PJWrMq2UJXFunjTQWHfdNazD6oat/WSDZz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/9jFdlN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHD99s008110
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+r0How+FgbvW7VMlqsJ4Gwuo804o+0P5HhOrz8Iggic=; b=E/9jFdlNSvFvItD7
	Qgq0RBSkVGdOZfLgEObr0J86FI+KK26fpJjhYxtVY8tgCnqNlvNRbjRMkzRqt6JQ
	ArDaXV8CMspBS5tFtbXimHIzyQJyATNXeZA2R3kqOzMIVd7B3b44IdRFc/HVKLkz
	QQoCed0JcovfJ7mfl1h+rC0NhybFtR4eQmc9wdmDWqxNARoLM+0LWxfkK7LpamYh
	JaU62yc0RAd3qFQvM0UgHTVMuHb3RZnBpFgxjhTTEs2nWWoV7UC2jLs7KDGqG8FK
	VTAEKQdlmMTO07Wp05ypqYmmTaJ/HJrcq25nUXpiINH0UmD3tAwIYF5XG8vhcQ1+
	7/ekVw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt40ky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:13:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-286a252bfc2so84268005ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 22:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760418823; x=1761023623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+r0How+FgbvW7VMlqsJ4Gwuo804o+0P5HhOrz8Iggic=;
        b=tgrGOJjICrkL729a1HP7n+5DBsNxVLH6flbV1oCl1ozdhaxyiHInSJ5vAwEwp1mgX4
         Cq7SjenyN0YF02sA08IOEKjDaqCjaeY0BhVOjEb2q1xboqjGeXvuMzsrVCXwLXGjRftE
         oKScKwh9+gmHWWrKLnWVYLQRhxMfMHgztHNCxpOtOxlXZHoqF4jHLykkvB0NXEGhRGYU
         WQezdt2z3N/40sxi+TEUiLdeIVMNiP7AtznrUItSz3BaPCAFR7nXSVi4Zr7wzaZxzH0i
         4XmDKjpMyzI+TKytfrqBAE72l+3KUdE5nPfSyIP87BukadtP4TXDOD7IimzwRntOawrE
         Rh+A==
X-Gm-Message-State: AOJu0YzRy/EkNRQdhJodyU4VjRv/9wce7ghj6+iUirQN4SQOLaqx7KLb
	xers9toywcUnEAYwPgLEfqDhjlePtAEFB+s5yECmgicROhCPWCbptFjDFCsYijsXzvV/Dfa57Dv
	z/uVKtZsCpbOviy5Mdd6F6gONoL0P8YRLxbICW2hloQqxMMU1viFqlgSSCQzstxhhdFkGjZyZKU
	eNSx8=
X-Gm-Gg: ASbGncv/ic31XP79Ay5lqp/+o5Q8HUw5TF83B0oJRDNK94Bo5+QBhySMAUMwwuwg/bO
	UHXKaZIYoce4Nm3LL9B7+Qns+zyvTnfDA98QAUEVMYfxQL1IK97jwNndUkyJya7Wy6/vepl3rNm
	rizYI2YlxdFDN+//LFpfL6DCHpOf6OUIiDlDB6wgSt7nBJImzLypxXQD9pt42z6qudA64tsj4L/
	a95OJBWmjNvwpM9S1LEEGPUfPizETOERS380OJYRQCG/9jfrrsYD/EKmMeppLA1cY+uvZ7avAkc
	O9RPBBv23Yr9+hKZsa3B0IbzM4kMJ4+xnVonl50to2Szt6tmG8fb+VXicVURXzPVnOALas2QW7e
	uPli1c90j4gQQoJ0HvmHX3S2n3nj1NLd1YhA=
X-Received: by 2002:a17:903:903:b0:24b:270e:56d4 with SMTP id d9443c01a7336-29027e60bf1mr282984295ad.4.1760418823187;
        Mon, 13 Oct 2025 22:13:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdt4dMK4a+NhzHfqRnuUEGX/Ugq/RdZkYVruAOzFTYYwT1X0g3D1TkCwSDZGCJIPwCSD702A==
X-Received: by 2002:a17:903:903:b0:24b:270e:56d4 with SMTP id d9443c01a7336-29027e60bf1mr282984085ad.4.1760418822759;
        Mon, 13 Oct 2025 22:13:42 -0700 (PDT)
Received: from [10.133.33.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1cc8bsm150928265ad.38.2025.10.13.22.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 22:13:42 -0700 (PDT)
Message-ID: <6e21173e-dee8-4c0c-ac80-db53be92fe4a@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 13:13:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/20] dt-bindings: arm: qcom: Document Kaanapali SoC and
 its reference boards
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-1-3fdbc4b9e1b1@oss.qualcomm.com>
 <c2112d37-c937-4132-b9e8-e46b1fcd0516@kernel.org>
 <1b4979e5-0491-4f4c-8c0c-b7d519dbf54a@kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <1b4979e5-0491-4f4c-8c0c-b7d519dbf54a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: M1vxXL7EpRQt7-z2inWjQBUJmPWM4P2q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX1BWPQFiu0AsR
 j7MKjulXqRKABwfMzBkRUHlAlgBjEhnua/y4/IBSOPh0M0Sb4YRQt5YkdW6rsJsoH+t2v6OIMDu
 fnTR/wbtZKMKQOSoWjuhfu5QBIOq4iajaJz6+BBRB0EohzRT5IczQWvpW05ri3zc2oy6D+h5x0L
 rFpWEw+tA4MpB5b2ekS6I1uPqsuP8MuTBnKBqhKQeg3scIAJieqsgQh6I4rOpXAj8Pos5ucxOji
 MygA/vBvnbGBNac1HnW6pddLrzgLv0QAQdwH1lUmLHJfqVGbbSt4KNpK1TCSlYdkLHWop0wFelK
 q3XBSI8rTte8X1MnqUk7sU88C8oqmTehEk+IyDKMnBxuT5DDLCmn7mkWZd8QcL0Mx3ScKAucGVW
 R5pIS6zsRwbox7fkMjTPEDU8liJnpQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68eddc08 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=chr4P-twNQjDrvfbXYUA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: M1vxXL7EpRQt7-z2inWjQBUJmPWM4P2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_09,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022



On 10/6/2025 6:24 PM, Krzysztof Kozlowski wrote:
> On 06/10/2025 18:54, Krzysztof Kozlowski wrote:
>> On 25/09/2025 09:17, Jingyi Wang wrote:
>>> Document the Kaanapali SoC binding and the boards which use it.
>>>
>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>> ---
>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>> index 838e3d4bb24a..0e84220e835c 100644
>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>> @@ -321,6 +321,12 @@ properties:
>>>                - qcom,ipq9574-ap-al02-c9
>>>            - const: qcom,ipq9574
>>>  
>>> +      - items:
>>> +          - enum:
>>> +              - qcom,kaanapali-mtp
>>> +              - qcom,kaanapali-qrd
>>> +          - const: qcom,kaanapali
>>
>> This will fail testing, just like Glymur did. I fixed up Glymur, but it
>> was rather one time.
> 
> 
> Ah, this will not fail testing because Qualcomm switched to code names
> from obvious model names, making existing patterns non-effective.
> 
> Not sure if this can be reliably improved now, ehh....
> 
> Best regards,
> Krzysztof

yes. I didn't find it fail the test. However, do you need me add patch like this?
https://lore.kernel.org/all/20250716162412.27471-2-krzysztof.kozlowski@linaro.org/

Thanks,
Jingyi


