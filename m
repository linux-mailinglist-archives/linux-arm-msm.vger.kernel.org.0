Return-Path: <linux-arm-msm+bounces-62239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF091AE7134
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 23:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20EBF7A1B6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 21:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415B123909F;
	Tue, 24 Jun 2025 21:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xle/3ZVb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759043074B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 21:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750799027; cv=none; b=uI1rjOB9U4MWD7x7TY7rX91JX8PuG6JrQaCQljkcsZFviqejJe8M8HxD9Qv0n5avL6v08mrqsV+Fbj381r8jeMZBuIsgyKUQROM9W6W4oNIN0xFg3tnoab4onHihSJeKr+J2433ASrNZK49T8yjHAl+tEfy/YSbe30eCJeSppWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750799027; c=relaxed/simple;
	bh=kRy3R7VfGoc1bssAiwrUHSgpndwIcCOFEjYQX7QEk9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QEanvJpRMHKkSF40J8DcftGq9+jOjwMwyVJel8nHNzmE09wkruvnb/S7o+KVd3emDdoXtPlj6KyfwuYEqEfjykApdLmV8H1380dTzkGF52P05SKdxPTNvakbSgYNXnkByyduqrDRXpzmFIj3S5y31BIcsAIWJgbyC5pRnMiwvpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xle/3ZVb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OElXIK026798
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 21:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mVJI6aOBGl4t4VmrNckaYkNqLm0/IYYdUwHHZ9TzyaQ=; b=Xle/3ZVbKSl5LU4M
	NV2lwkFhV3XkKoPWc3beKvEv09ETVlRI5aKyLx/HxgVDGiHRJqwwfGeX/8gi+cAF
	ZjCk6iLcelFOcSbr9WuliGdEsTxvg/gQxe5hnDeJB+riplD+KSHRisE7jcA4/j33
	WhW0C2JQEiaKHw4CEeqfzqjbALT3RRcKfQjxPHIOYX+WzJFyThBwcsP1/eDiwd1C
	ETBh5F853UjwHP16GZhTQDO/0pktcgmY8lD7i/Mgi73QOVXevmAaoK1KS8S3cttB
	3WeeQu4U+LNVEtxHfauN+NVJ852kzgURb1fhNHTUAYM4dk/IVCNXbljwh4nrjIeO
	TDaYwA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqm441-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 21:03:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d413a10b4cso128459785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 14:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750799023; x=1751403823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mVJI6aOBGl4t4VmrNckaYkNqLm0/IYYdUwHHZ9TzyaQ=;
        b=dlRk5o/Fjp3N04SdeMO7UsayqqZPpNIxrzefZoqcnEOijAJUolhdrVlFVmAPBxZfjn
         4GPpT3BnTaYDiwpHFl/OJqWBZycqmYTGLeEz86L4ikQ3cuJqGrCAMrHPKLD+WG78v3Qr
         UW7ChMuqhR8WSkgiO5TBeLkG69MT0t0jtlDEuqWpgQ4u7fqRUwEgfCZZaZBgcxKGPSL4
         f2IzeUYVZXik0cNkWQ4qBJRKsdiIygoyRHlh4Ml16VM0h14N/KpM7FPlSsU/WQhSjDgo
         IrK02tMR0ttFwHNE7U+ofOXfXvZ/NJQIg4t9uVop2ACXouqO5Frn3vYVuYVgF3HyL3y7
         BJpw==
X-Forwarded-Encrypted: i=1; AJvYcCVUft6GBmvWqXflkR54FI5mLGapFuwZTtHOUiWUkQQ4VsLSIkkzp/I2Thrb0LbBuw3T7SyNsu79E1VeSOFm@vger.kernel.org
X-Gm-Message-State: AOJu0YyeIjJWi40lQ6BU/JndFs4D4zAGWsHuhRiVElVbvI/Ggkq9mCbB
	pkjdiamvytg1QIcwWRDszanKDaiUR4QeyThgPfM4lI9QlZnq797ZXn9JtkFKlnSNNeKk2C/j1kE
	T2g73aPqX0XRsQXW1MsZh7aPEgvDD8qymYQKaF+r89855h+xY42U8OpBweXjbGVkR1CGw
X-Gm-Gg: ASbGncs/+8twQZwTnWfBn5hRbd9u/0YTZ92WK7Dp5F4end30SlHPe0z2yJFqZn0fSDH
	AoTvTonail9DqGp+xVGnb93DgTKPdwgW0ImaXonL0xfAhJ3PoinKnKrdB0mvfIj/dS3gVmenrs4
	9NlphT4o69kg3scnMFd3KQ0F/qOB5wU3MtR4SDp8B6Jyy2OkJqf/r+oZ137ZnFYsaGuIC2ojNok
	No6ZzZ4TZFUIWBqFpXfLuR/a3QAedKibWoTyA9v9r3rwdpGug1kqkQUXtY4qB6mI1q4rUoAX2Dd
	AmHBRLPxMU5PpFApzIIhLVSFeu/BFRjb/yCsEa3HAxPprrczk5z4u0BO2kUIbxyngrQ9J1ArPCt
	4fq3Nzx2lc2Qx4dhNfFk2f4vI
X-Received: by 2002:a05:620a:4053:b0:7d3:8a1a:9a03 with SMTP id af79cd13be357-7d42965f652mr79133885a.14.1750799023326;
        Tue, 24 Jun 2025 14:03:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdXH0d1f6aDkKnx6CCNg4hy12ddxcs0mjWOfhKxBZypB1VzHs0Gz8oM9mgx/g5oqmSwc4ULw==
X-Received: by 2002:a05:620a:4053:b0:7d3:8a1a:9a03 with SMTP id af79cd13be357-7d42965f652mr79129285a.14.1750799022848;
        Tue, 24 Jun 2025 14:03:42 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980f0800sm17872221fa.114.2025.06.24.14.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 14:03:41 -0700 (PDT)
Message-ID: <225b94a0-eea5-4061-aebd-da497d349527@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 00:03:40 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Start using rpmpd for power domains on MSM8974
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <amfgwjgstu4hoxz4lo7fqrqz5fqtf3r7o6wqvrrjkcfubwrjyz@5i75peprq3wn>
 <841c41cc-e44d-40c7-9431-a77feaa49b05@lucaweiss.eu>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <841c41cc-e44d-40c7-9431-a77feaa49b05@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YD4JIZuU-cIAOQaoLBgucUPMN3WMH4Qt
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685b12b0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=dlmhaOwlAAAA:8 a=6ZqSrkSmcNyY40qCGO8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: YD4JIZuU-cIAOQaoLBgucUPMN3WMH4Qt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE2NyBTYWx0ZWRfX8MfHyRnq3xbh
 8qc8/WCjR/KZoGiYucBX8y7d5jEGVCrTSXwrqIas/lo5Pn1BkoUausXogpV6urg2BdAkFcjhRtQ
 rjwXwdtfKDwlU/kYFPagBn3XgkvrVcEFtFGqLai8w02PRot9hYX699uHVE8uvEmH3q1AOw1UHb6
 OY83uTJWLWzW6W1XoNgv0KT8zGuHRik/98iKh8bZQMWkgMH4tSWHoCT1PdP0PlDjXONsAAZ5aWW
 dvG/nXVeYa/bdLU8isKpxTMQ44dnSYlUtOF45EaBAsahNFMqZepmfh2Yavhv8IMrZ/TR3La5n6I
 s7NO4k9sDvNCAKTZfwF577+E9QpWaoX8C85ZQXVfnhuFNhyXU3kiMCCV3k+W9bzAkb9Rx94ErF0
 K7cVL8bJtMhWmSLsatTvgGarGDPW69tgfbBbk3ilKScvj2GIGx7RSVXr3mC8tMb/GG0cHpft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240167

On 24/06/2025 21:46, Luca Weiss wrote:
> Hi Dmitry,
> 
> On 24-06-2025 2:59 a.m., Dmitry Baryshkov wrote:
>> On Sat, Jun 21, 2025 at 03:19:55PM +0200, Luca Weiss wrote:
>>> Switch over the ADSP PIL to use power-domains instead of a regulator,
>>> and have one commit switching over the MSM8974 SoC plus all the devices
>>> to use power-domains.
>>>
>>> Note, that I'm aware that these changes are not backwards compatible and
>>> not really bisectable, but since it only affects the ADSP on these
>>
>> Why? The cx-supply is handled unconditionally. A single-domain usecase
>> is also handled via a special code path. I think this might be
>> backwards-compatible, by the pure luck.
> 
> Honestly I have not tried and not looked much. I mostly added this 
> paragraph to avoid the response that this change might break and is not 
> really backwards compatible. If it does (by accident) work with the 
> updated dts without the driver and the other way around, then even better.

I think it's worth checking that new kernel works with older DTS (that's 
the usual rule). The platform doesn't have many users upstream, but I 
think it has been used by some PmOS users, which might mean 
not-yet-upstreamed DT.

> 
> Regards
> Luca
> 
>>
>>> pretty old boards, I say it's fine to have this. Get all the patches
>>> into the same release (6.17?) and then we're good again.
>>>
>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>> ---
>>> Luca Weiss (4):
>>>        dt-bindings: remoteproc: qcom,adsp: Make msm8974 use CX as 
>>> power domain
>>>        remoteproc: qcom_q6v5_pas: Use resource with CX PD for MSM8974
>>>        ARM: dts: qcom: msm8974: Sort header includes alphabetically
>>>        ARM: dts: qcom: msm8974: Start using rpmpd for power domains
>>>
>>>   .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 18 ++------
>>>   .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts | 13 ------
>>>   .../qcom/qcom-msm8974-lge-nexus5-hammerhead.dts    | 12 ------
>>>   .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    | 12 ------
>>>   .../dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi   | 12 ------
>>>   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           | 50 +++++++++++ 
>>> +++++++++--
>>>   .../dts/qcom/qcom-msm8974pro-fairphone-fp2.dts     |  8 ----
>>>   arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts  | 11 -----
>>>   .../dts/qcom/qcom-msm8974pro-oneplus-bacon.dts     |  9 ----
>>>   .../qcom/qcom-msm8974pro-samsung-klte-common.dtsi  | 11 ++---
>>>   ...qcom-msm8974pro-sony-xperia-shinano-common.dtsi | 12 ------
>>>   drivers/remoteproc/qcom_q6v5_pas.c                 |  2 +-
>>>   12 files changed, 56 insertions(+), 114 deletions(-)
>>> ---
>>> base-commit: 7fa2fb97cd28e1d9670da538095565b6fba83977
>>> change-id: 20250621-msm8974-rpmpd-switch-b19b166c02be
>>>
>>> Best regards,
>>> -- 
>>> Luca Weiss <luca@lucaweiss.eu>
>>>
>>
> 


-- 
With best wishes
Dmitry

