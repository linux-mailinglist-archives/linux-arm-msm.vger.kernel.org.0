Return-Path: <linux-arm-msm+bounces-74994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 758F4B9DE04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2093216F5F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 07:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0CF2E7186;
	Thu, 25 Sep 2025 07:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="foX1dx3h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B182512FF
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758785994; cv=none; b=RCxfkSrkgpDbu6UDhhvi04LbWj0ewLQfoTb1/2DcJv0k6w3l3xu8nAEtMbD4mUGHGiVt3I4aCMxMwXAVMV0r+f+PAmGyynwn6lW7b4slgxkhHj7lZNsxdhETazUdw7SM3CqgoDzGmDEF+iQeSv7s7BLe+HR4Go4a7PMOeJJ2RNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758785994; c=relaxed/simple;
	bh=Y9R4WNRvvyMtAtnRGIuMD3fCanjscQi1bqGGZ2aeKWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ax0uXQmJ8ieCmj7WylaR3ueBxbADltylXp4kkKvM8XfPe1WP7Jmhc6ZDovK2909sVHKVDY6XQ2dwmudgCmg9cXdT75617wduRW8EiXf4UIyYaLbEGYu6s2dNnxfWQnJunCjs0WoB0S/GoJbKQh6vfQdf23J2KE4BlZHYP5qpA0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=foX1dx3h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONH7VJ025243
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yHIf/aik58qJgO9OuFWD/cF/4E9ijlyj+qHMJjR5MNk=; b=foX1dx3h1cpwyoT8
	tEOb31eyOlz9jz3GG9xLSirs8wrysbaR6a/zUkPR3X//siefgOLbh9Ofwepac2bA
	QSfgRUu6YoUj7c/ZtQTkjvY4Ml0oXgCgxAplEYDUC5WLaYbDkzIHF3aGPutpJVsU
	EgMNhr7k3b+7Jh88eKfi+b0w3y3UUxEwMEX0pT3wQqKrtw4ysznKOqdlKmLFVDQz
	EegQC4hNtdVAj52cPkUWM9xDM1umxJeg4yw64zPn0hQxTiHlOF7NUlL2vIqRndum
	4b82pV4N6rRbGgp9w5zJGl1If8/pSxWCgllQAggzfHC6RjvhE8k5GX3qOoZDdYel
	hVni7w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv1788m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:39:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eddb7bad7so195489a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758785991; x=1759390791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yHIf/aik58qJgO9OuFWD/cF/4E9ijlyj+qHMJjR5MNk=;
        b=ikn38dV/X7zsAu9MGnl3k4F7YB2DfIKepf1h127z1nsT+eX5x9Z2AV4k4ps4jFXr+5
         mVAUzSoqbP6EnvtRgeAgX/+bk+snP8f2LkIqO2RL5h0b8iS/zPr7K2UsIyT+29RdUoEn
         GnC0+zP/zpp0VnOm+wHmYAHHv4mYWP5yW6igz1Gn40f1RJ0JUM88bsgy34NkUytmFNCd
         Ui94zRp1NGdoSARnnq1sz+dOyQD7mfoSOcH5QtCx2flqiGTfAIXN1L+r1RM3vkmZYvxt
         xPjHx4VWEiGxpCAzIXFz0tJb6m325lVSK0limvCVrmqMc6Z4OGBJisXV9XM/5yWTzhYm
         av9g==
X-Forwarded-Encrypted: i=1; AJvYcCXqVhWuIPkMEypej/hu9sFeufMDtDP/JvbIKliY3LUVdheTpdH8yc7UACD1XojPpBS+QXXNhaCuoun/yBNF@vger.kernel.org
X-Gm-Message-State: AOJu0YwcxKfiK4XwE+/KIfseyKQdBikKrUkOqtYm4e8ncf2mppdyzS2j
	BcR8jDVEi9CP64iwkqb/RVWgOdycjLmPTFjgWx7noIqXIBZBiBWuq7s2XSzcJbbCbcnz12pIAjD
	5n8hEJe4XJ+lw9apXy+wfZvYytgcp08mC/A3Ig+W2AftuOhizF82fHLb0FmHfgafGdYb7
X-Gm-Gg: ASbGnctCjx9meA+4jDk1LaTOiH2XyWhnh0ACDi1D8ilBlih4EDJSNsinlfO/s2l/fB4
	bycu/I13g+DEzw/4rqrLrzsO/4YpfNlVKuWLe6+FSea6wNdxvJIeuzaAQoufv9E7f0q1ybO+Fhw
	unvZDbm7TFB1PXQpM4yIOO/qByidX/pPqVyhydyKeEV1mfq0DUtEMDJRrRO7iN3jtRMZDCWBawr
	uEZPuptV0cf05vOEhGTeMiCJw8Pq8a/jdVDsngwVS3H4Juw6IGFzYSkF2FNBCk4yJrCsx/bGlaU
	bsHI8wwSB9Se6LaJcJhasKbQ1kzkQkSkGkw6jLntrEgJ3geq7XOoo4gwuQoF0mfFEpJ61Ou7+Yn
	afH6FoJWbXsW2cV9K3KgeuRsDCYYrS7Y=
X-Received: by 2002:a17:90b:1e0d:b0:32d:e71d:743e with SMTP id 98e67ed59e1d1-3342a2df3camr1263925a91.5.1758785990804;
        Thu, 25 Sep 2025 00:39:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPMQLLZLbgPWPx8Cf/VV7OVsL2aUE3K8upcbyu4SvZDDclh+hBTJvNPsepYgjFfqtBwtGnDQ==
X-Received: by 2002:a17:90b:1e0d:b0:32d:e71d:743e with SMTP id 98e67ed59e1d1-3342a2df3camr1263903a91.5.1758785990305;
        Thu, 25 Sep 2025 00:39:50 -0700 (PDT)
Received: from [10.133.33.140] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be36bdesm4757664a91.24.2025.09.25.00.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 00:39:49 -0700 (PDT)
Message-ID: <53d63dd6-a022-4e80-a317-3218976a7474@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:39:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/20] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-6-3fdbc4b9e1b1@oss.qualcomm.com>
 <CAJKOXPcbJY4JEjfZLvOAXEWCTYFpe7En+Riis2t3K5fWJgNU5A@mail.gmail.com>
Content-Language: en-US
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
In-Reply-To: <CAJKOXPcbJY4JEjfZLvOAXEWCTYFpe7En+Riis2t3K5fWJgNU5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mF65Qe6seapOb1XR2AVoklw2Q64p8Xc6
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d4f1c8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_8C6HiND3MtPFSYwXacA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX0FDp3ctKwJ32
 DhHMk4iLqT+MFSIPFeAgAqHx+6WeN3r6Zr2Gu6bRPqzTjRsgy/hzBBNblVmdc2v/jB4CwwejDkp
 oeqcc7Z3SHsreUGXbgMu7s22D3ilaYEup3mjWucXYQUOPLT8GBosSTQ/f0/7KFyA2g9VTyGHDc6
 yXIcpsZ1rOQs6O5UBwFzQ5eQyQxH93NFiyEyWMw0rKjFFiziwKZhnqlhojlprvPGnKEt6UJsQXH
 2nIBp9S8G+CFsHufx+ytRMCoUMyhPsfKbokwKEy3/i4KsN+jgyABGf56/Bv+y7CHsFoy4LSpbwj
 J5odAdvIz6NdTGHshIJCKD+285hNPnRFdT2SYfsrxkKleq0j0F8WhmGVyeoXk5wWwPtwTY9n1wu
 Jz6W5XQe
X-Proofpoint-ORIG-GUID: mF65Qe6seapOb1XR2AVoklw2Q64p8Xc6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

On 9/25/2025 9:50 AM, Krzysztof Kozłowski wrote:
> On Thu, 25 Sept 2025 at 09:17, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>>
>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>
>> Add the base USB devicetree definitions for Kaanapali platform. The overall
>> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
>> (rev. v8) and M31 eUSB2 PHY.
>>
>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 155 ++++++++++++++++++++++++++++++++
>>  1 file changed, 155 insertions(+)
>>
> 
> 
> Second try, without HTML:
> 
> I really don't understand why you created such huge patchset. Year
> ago, two years ago, we were discussing it already and explained that's
> just inflating the patchset without reason.
> 
> New Soc is one logical change. Maybe two. Not 18!

It was previously squashed into the base soc dtsi patch and mark like:
Written with help from Jyothi Kumar Seerapu(added bus), Ronak Raheja
(added USB), Manish Pandey(added SDHCI), Gaurav Kashyap(added crypto),
Manaf Meethalavalappu Pallikunhi(added tsens), Qiang Yu(added PCIE) and
Jinlong Mao(added coresight).

While it is over 4000+ lines when we squash it together.
Also as offline reviewed with Bjorn, he suggested us to split out the
USB and other parts.

> 
> Not one patch per node or feature.
> 
> This hides big picture, makes difficult to review everything,
> difficult to test. Your patch count for LWN stats doesn't matter to
> us.

With the current splitting, the different author as each co-developer
can get the meaningful LWN stats.>
> NAK and I'm really disappointed I have to repeat the same review .
Currently, there are 10 SoC DTSI patches sent, structured as follows:

SoC initial
Base MTP board
SoC PCIe0
SoC SDC2
SoC USB
SoC remoteproc
SoC SPMI bus, TSENS, RNG, QCrypto, and Coresight
SoC additional features
SoC audio
SoC CAMSS
SoC video

Which parts would you prefer to squash into pls?

-- 
Thx and BRs,
Aiqun(Maria) Yu

