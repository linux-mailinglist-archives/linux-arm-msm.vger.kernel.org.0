Return-Path: <linux-arm-msm+bounces-64536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16871B018EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 11:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D48A93A643C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6FA27F74E;
	Fri, 11 Jul 2025 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/9TXDuB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F7F27E7FC
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 09:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752227831; cv=none; b=NJwJzj2kVfMzC0Lzqtdh1tuf6ba+9V8OQBltkvK7A12e3zkQgBFgXVlGclDl6chY/CMAfvi4vQijh0DtK/eOSHKxdgntWsD7Fw/i80SWxNUVW1qlPH2+g+TLenoTn9dfp9YaAMFz3MFg6dsPydkzSdZp5v4GtnFSUh4gcjLjPis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752227831; c=relaxed/simple;
	bh=enbfKkLsSZBEWGR0TQ1aBR/Caf7pFGAF+OXo++3GrIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lz6h9OkcZChys54dpDdLSLkDHOppEpaCRdwpZ1Mel1JUuay09TcPo0+n/IGX+zybsQGbSE6PKQbOT2Q0EftiWEX/98rFRe0LHZ/C3YiIWAzdx4JJ+eZXDsszkUgc3cTd4eB/vDAzRG/+xt6eiFCQRX2tyFHecpbeub/0KBROGx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/9TXDuB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1XFdF012193
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 09:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4oAm1F+mw0qWWBJIzHoogPbCCFnCCeogdv2Fm/i06c=; b=Z/9TXDuBX6DLWExy
	amIfnDq2nwAGxAmsKPGGMdV1zGp7rbIEd36Bcke7MdK/kpAls3A8j9AK+sroPED4
	w4Iy1/Pw2QG213/xbqAiXRDZ9WLaukhJc4mOGYo4DILOLcYOgBh0ktLoU61Pm4vr
	cDcI8ngeNVKeOqESAJ8aEWAOjCWNdyzzBpeaWTCsAb9HofRYBDYBjkDxBov5otr9
	boPqlh2/MuAeirb9RSiw2dqsNhc8OM7T7lO3jZPTGrNHHFl8YB0EuD8KLKLjWc7e
	waCZn6tFiQKk93dNh99sR0ScI93DWdOgFI+WEpHFfdPgQig7diPREBRYq+gNU7Rn
	D0tVxQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafr04a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 09:57:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7deca3ef277so17182685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 02:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752227827; x=1752832627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4oAm1F+mw0qWWBJIzHoogPbCCFnCCeogdv2Fm/i06c=;
        b=a7yMnCkw7l1mc/B9paXj5ajqX+t1QBpeUyyGb7WcSsYzy5EgD2Y7KMDiTKlMWyQysr
         4uRWNl7HVKmj1A7gNhpmEfVZ+IwexDMLpD3rJadOL6JMPIcZe6QVQEc66VI0wgOUE8j1
         jL8NQYFYYel6dkYtMHQdMozjkJzdkZ5XeMiE+dS5I6oQz9PXgRSDZF7vf1yy4eqfo8cf
         9wkbOJZrDeydyWx4KrfIrghL511eWV61FslK9OWENVPsfZ8WC2kwTBM7Ve/zRCO3f8Ap
         He4PJejT/igoXJwxyil8MRtUNa37h8HQxKx/k/eQd7sZKrdS/ik7oJVq3z+Twmk0j6Td
         Rv4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3aesITyfe2pCq4xVayEyx/kg/N5fTgRgLDFFB/4pry65ErtQhjDqu8/7FwE7VD/hChU9ZYw4FQH1E7eCr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2EgnIHv2ARcpnv1mbQt6JW+9OKJ2H4MVw802sT7p94kTw9ok+
	uQzFax+b7EuCIEyyvPI5iMHw/zcjpCHa39oaqZs9mrHFtVO7l65OeWwopLEps/Wn19Q/opsamd3
	UhDUsbyIMV4YhbQUHQRm+fSe4EsJTHTE2qf05nUKRat1P3/XxREzEJXKjDXRgqV2fedy9
X-Gm-Gg: ASbGncvqsJ+EfR8TXTvdglaalM3galiPk/GSN8ODl4zRr1+FnKmhFsPKX0ic4GESqyQ
	wTVzdwNI7VyPDmfNTu01bAjhllxO7Hr2hnzSWh1FWX1gL7BOsEb7rDUOI07zV6Cneg4GagjyPnr
	ABquXQaG1IlwEEj260uEwg6hQbTQo0ESQhtqmevObi73dRZg9rxzG40moY9B0gCUR9s53w7Oodc
	JoUD++8uvfFpT55afzp5JjvKMo7UohzS3P4XIjEE5UNhLLk2qkq0n4ARvmYK5OuipXLwN31Sm+H
	xHoUJIDh98ZTPRpOLZ43z3b8VIMSG2XeyDeYZ27z03hcNhyUOneuv0otw9P/qZwesx/mOymi1Yk
	yb8w791JGcuUX5jiuIwLV
X-Received: by 2002:ac8:58d4:0:b0:4a7:4eed:2582 with SMTP id d75a77b69052e-4aa35db7dcamr13443471cf.4.1752227827433;
        Fri, 11 Jul 2025 02:57:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYKec4bEyWI8YGiR6x1O+xUwfyU3XWv0u55EjX9PHiUbFeje3VltrjTPWAUpQi1AAK/4AayA==
X-Received: by 2002:ac8:58d4:0:b0:4a7:4eed:2582 with SMTP id d75a77b69052e-4aa35db7dcamr13443241cf.4.1752227826920;
        Fri, 11 Jul 2025 02:57:06 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e910f3sm273314866b.31.2025.07.11.02.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 02:57:05 -0700 (PDT)
Message-ID: <465f4136-418e-48b8-93f4-e384244cb913@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 11:57:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: PCI: qcom,pcie-sa8775p: document
 link_down reset
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, jingoohan1@gmail.com,
        mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
        bhelgaas@google.com, johan+linaro@kernel.org, vkoul@kernel.org,
        kishon@kernel.org, neil.armstrong@linaro.org, abel.vesa@linaro.org,
        kw@linux.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_krichai@quicinc.com,
        quic_vbadigan@quicinc.com
References: <20250625090048.624399-1-quic_ziyuzhan@quicinc.com>
 <20250625090048.624399-3-quic_ziyuzhan@quicinc.com>
 <20250627-flashy-flounder-of-hurricane-d4c8d8@krzk-bin>
 <ff2fb737-a833-474d-b402-120d4ed68d39@quicinc.com>
 <1606591b-5707-48bf-8f60-44063ecf8f1a@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1606591b-5707-48bf-8f60-44063ecf8f1a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=6870dff4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=00NdyYYEmPKBbhCvcP8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: zpUA92C6BYSClQmG_gl-NezZxhSQGVSa
X-Proofpoint-GUID: zpUA92C6BYSClQmG_gl-NezZxhSQGVSa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MCBTYWx0ZWRfX5fAb87/DGNCo
 NvIcs7JZutIE3/9F/6UMqCihPFyBgH7Zh/kC5XieR9FT8t7hH+LlTB91lh8rsALTgc6AY6qGDP+
 ou+HEr9mP/4pdkYtPUOLGhC9GEbdcXfwHchnsTnSM54ZdHBhQEXfUwNYQ9LHVwDbCiarD8b57eH
 1KxRnw14bI3Pdq2Ib+8pns+QMe439XaI2JSRxE2b3QDd9ped7JVOL9eJdWkhcqFUEq0JJGJ4DZ2
 75PABleMKzPPNZ1xkZw6kY7wuoaVhPpnacNvsbXtpnepNNja+DM0Hp3OjRGMkJYrcemb5rMP3/s
 CuwzhEwYR1I2Q1fK+EDUJ4tdfOKXJeIjiE1AAQF0E+CQyF1kw4tz3LPHKo30q8L3RL8p9A0Ewkc
 LgW/hJ0b2Pcxtq1t5UNzQsOwyg5Rb+QZ5sQAzNuLs8Z7U0CID3i9cJz6cYnZeHqth2uq95XY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=512 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110070

On 7/11/25 10:44 AM, Krzysztof Kozlowski wrote:
> On 11/07/2025 10:26, Ziyue Zhang wrote:
>>
>> On 6/27/2025 3:08 PM, Krzysztof Kozlowski wrote:
>>> On Wed, Jun 25, 2025 at 05:00:46PM +0800, Ziyue Zhang wrote:
>>>> Each PCIe controller on sa8775p includes 'link_down'reset on hardware,
>>>> document it.
>>> This is an ABI break, so you need to clearly express it and explain the
>>> impact. Following previous Qualcomm feedback we cannot give review to
>>> imperfect commits, because this would be precedent to accept such
>>> imperfectness in the future.
>>>
>>> Therefore follow all standard rules about ABI.
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Hi Krzysztof
>>
>>
>> This does not break the ABI. In the Qualcomm PCIe driver, we use the APIs
>> devm_reset_control_array_get_exclusive, reset_control_assert, and
> 
> I see in the binding requirement of 1 reset before and after your patch:
> requirement of two reset lines.
> 
> This is an ABI change. My entire comment stays valid, so don't just
> deflect it but resolve it.

Ziyue, the change is good, but it needs a better explanation.

Try something like:

SA8775P PCIe RCs include two reset lines: a core one ("pci") used
to reset most of the block, and a "link_down" one, used to ABCDXYZ.

As the latter was omitted with the initial submisison, describe it.
Because ABCDXYZ is not required for most of the block's functionality,
devicetrees lacking it will not see much of a difference - it is
however required to ensure maximum robustness when shutting down the
core.

----

Note that there are physically more reset lines going to/near the RC,
but many of them are either inaccessible to the OS, or very much
should never ever be. This is the case with most hw blocks, so don't
be surprised if you see a list with more than these two. I believe
"pci" and "link_down" are the only ones intended for OS consumption.

You can see some of that bleeding out to Linux on e.g. some IPQ
platforms that don't have a separate MCU (some flavor of RPM) that
would do the bus management.

Konrad

