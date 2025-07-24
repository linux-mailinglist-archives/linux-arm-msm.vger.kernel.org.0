Return-Path: <linux-arm-msm+bounces-66477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC84B10703
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 11:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E762A188368B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 09:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B75255E20;
	Thu, 24 Jul 2025 09:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwvQs+l5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4694255240
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753350658; cv=none; b=dobXCFlGxMhcUdB8UTVJMaBy+49Hb2j07/8fkkSf12j1282H3fXmAaUuSR/5HXcxww9BHO6imxEgE3YF0ZJS7agMJnKd5L3RG6kV0XdFsDWCwTyveyH/eLu4qhERieBzbKgMgGjm6K0TkJEAeJdhtBh77uqAoXCjD3hNF0gWDW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753350658; c=relaxed/simple;
	bh=4wvMik73OSV2CEqOTXqPlx9t14lnBK/J7SXVWLD539I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VTYFyOm08Eur7ZdkF2DezN63VVsq4Y8mmgH/3Voe4wkbkP1wRgmlJeAw8iVDCQArBfk7AyMiGiGebp/akyu1oergjvnZreH7pBI3AS0y9yN2EqTg4mYmYhiIpao4Y3PUkoxGRTHZf1Wc97hc6mbIpFT7cnxcQ/vGCwXMd1vXLCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwvQs+l5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9XFQt012641
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xNeKHGonkT5h2RvkiyvQ4JGa2uJGQzDvErKLXyO9F9g=; b=fwvQs+l5P2btGpdw
	iLMWuGSpy1E0KkFb2i1nVW38Zr86RgUNMiC2DJvbiHW1cr5BUMNtyodt7qpPxo+q
	1xbOmVC1+Nk/G+YdBv7IbUukxxTGKMspp0Wm3rWXZWsRS7muA4UG/M798IQQotTJ
	UYF/ZMJnxmXhq7ekU5rmoYr9xasTo2pHvMylLcx7Qol9esFf2ntuzCCyhal0l0fu
	ugS44uzpZhqD6yNd3pUkR43L/AjcHjcVRxdmStRqX49WMMKNoSdUZdLZP7z7XNE3
	V6oOHFTDGDcYWOxGu1RJN0j7GUYZ5lbrWekWStTahQgugQT/n3hTPZOCNLVSXpvP
	zRrTng==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hx9mn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:50:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-702b5e87d98so14467746d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 02:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753350654; x=1753955454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNeKHGonkT5h2RvkiyvQ4JGa2uJGQzDvErKLXyO9F9g=;
        b=QWv+27KrN9j+aUy6+svlfuETVn5omVuUF9qBc+ZygdfL526XWIlzK90AoSRX72T+Tn
         2d7N5q99FE/vkNTPxHxN80hWx+6/dkOwKggvlg2AyOIIp4o0K2xqW8wR0gYFy9c+Q/G8
         k9KwyhE7JvtgEOk3Aw2/gLCxRGD7/As9pT50HZcaZLhKJAStT8utHFyWgqyg90RWA9Kw
         AR0CNjqlZiD6w11AaKlkD2HXeY72bDu7m8lLLWUUNb3GecAMQ3IuPfRUf37VQC8ZlGxS
         bQI9DGYmrrU9O+pYSD6+1OAQc8ArkMkPiPhQtuP62iOKLFdRP3Glb7BivXhbKN8o746d
         71/g==
X-Forwarded-Encrypted: i=1; AJvYcCXpTVM2njiN/LyYLZxp1LE6GeiMIeX85dwQIix5nisnhUh16jYWDU5lq/q1upEoKzN7jE2a4rAgTdIDYPbe@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo3O8ucV5W+iUy1kNW2uIcE0PZZkE8F7lNN3zXCTaCBM6nuIZ2
	aHhgjvcSSoVIb8CEvB4rm0XwJW+s36jYSWnG0Wf/u3ewOxmlKyFzhKuoUF4AlrHEpUoYmuPiViP
	pNrHIlMqIxUdjJLhCGyP46n7A+B5ov0gWk2Rt2R1WuZ6uQDNBSb+EXU15bPdsnT64js22e8qS0y
	sN
X-Gm-Gg: ASbGncuEx+z5SEBl2O+XfgCP1xX5+MSfOPg/E8o13syVgg7Jq+xMLWhU8W8f7db+XrK
	+EhMe1OkRDf/wxw7lKeP0dsfJc8CzmM/d5E6ebRWuIsLpUig3Ymu3NKhPlnQYa58QL3Fb5yYtn9
	W6I+QZmZrGF1sbdLoev1FE8YQad4PRoH/VfqUPFixYKdJLsBAYRTXbozaogawIJJWgVJqyfJ8bo
	iKRgzM+EjHrNLDyyTqvAZdNr7K0nNr7WuCX3lXy8Px+9W0kpjFIN3Vfcx0wpKxUXifSK+RMCecq
	Rbondg080cW9JRwMxwTLo3vAo/Y/rcn7pFgYwJ/0l6L7dnLEpOJkfglokRmazUQhWi0=
X-Received: by 2002:a05:6214:767:b0:6fd:cfe:ebab with SMTP id 6a1803df08f44-7070058cc6dmr90659736d6.7.1753350654276;
        Thu, 24 Jul 2025 02:50:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeU31vHKHIOSi63Yzpx4a6r6m3m24wxg9LNxc881kubkz6Bhs1a8eXFJj6MAXrH+z9RIoqcg==
X-Received: by 2002:a05:6214:767:b0:6fd:cfe:ebab with SMTP id 6a1803df08f44-7070058cc6dmr90659306d6.7.1753350653677;
        Thu, 24 Jul 2025 02:50:53 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-458705c4d91sm14456695e9.23.2025.07.24.02.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 02:50:53 -0700 (PDT)
Message-ID: <d0fd03c2-141b-47f5-8133-1b09d40d082c@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 10:50:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/23] arm64: dts: qcom: x1e80100: move dsp audio nodes to
 dedicated dts
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250723222737.35561-2-srinivas.kandagatla@oss.qualcomm.com>
 <aIHfPZaRmTjI7w8D@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aIHfPZaRmTjI7w8D@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=688201ff cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=7Qcv1IfLpfmIBQ-b970A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA3MiBTYWx0ZWRfX/btNA328ivh+
 8S6SPyERe+6EDI7tlhYq2Jqn7zCZVoO1i9lJ9iN2ymCvKUJomy1SLFDv0tOakCD9x4IhW5gPB7M
 a9fEjt04fvghss7aN36gfXHmhfDN//e59a06K/tRn+NvvAo1804T63bFhHIQiT18Kq6GfzcI22B
 Z6fhtHUvJTHEwQBQu38BMK17/mrYmfg9UHTGaoAW5o2PaVu1Kx7yJFu8aah5bd7xw59dje0dn+g
 IyyQcNXaC1Oubz7StkrndmZzjoNi+TN5PvMFWQY9KpSFLy1MStGfXkIdu1pDBd+Pp+SVVyBzj47
 wy4IpZkmhovP4uPkyyyHDokMlas98T4OunlA16bj6NOZPZjyUenTvWzTuJyXkBFjlwYFvKyN+cB
 SCTz5ihXp9qT6SBxtQm7nDr6zyB+CO2izspy+wCcp9Ua2JIzuINjl9OqtJT/FvEFHLYkQ0mk
X-Proofpoint-GUID: HjIgKTeIFULzPmjcA_iObXKI54G7ShuK
X-Proofpoint-ORIG-GUID: HjIgKTeIFULzPmjcA_iObXKI54G7ShuK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=678 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240072

On 7/24/25 8:23 AM, Stephan Gerhold wrote:
> On Wed, Jul 23, 2025 at 11:27:15PM +0100,
> srinivas.kandagatla@oss.qualcomm.com wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> All the device tree nodes for audioreach dsp are duplicated across all
>> the SoC dtsi files, Move this to a dedicated dtsi file so to remove some
>> duplication, make it consistent across all device trees and also make it
>> easy for new SoC's to add audio support.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  .../arm64/boot/dts/qcom/audioreach-audio.dtsi | 45 +++++++++++++++++++
>>  .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    |  1 +
>>  arch/arm64/boot/dts/qcom/x1-crd.dtsi          |  1 +
>>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  |  1 +
>>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  1 +
>>  .../dts/qcom/x1e80100-asus-vivobook-s15.dts   |  1 +
>>  arch/arm64/boot/dts/qcom/x1e80100-audio.dtsi  |  6 +++
>>  .../dts/qcom/x1e80100-dell-xps13-9345.dts     |  1 +
>>  .../dts/qcom/x1e80100-hp-omnibook-x14.dts     |  1 +
>>  .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  1 +
>>  .../dts/qcom/x1e80100-microsoft-romulus.dtsi  |  1 +
>>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts     |  1 +
>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi        | 43 ++----------------
>>  13 files changed, 64 insertions(+), 40 deletions(-)
>>  create mode 100644 arch/arm64/boot/dts/qcom/audioreach-audio.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-audio.dtsi
>>
>> [...]
>> diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
>> index c771fd1d8029..1d8a75fba301 100644
>> --- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
>> @@ -11,6 +11,7 @@
>>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>  
>> +#include "x1e80100-audio.dtsi"
>>  #include "x1e80100-pmics.dtsi"
>>  
>>  / {
>> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>> index c9f0d5052670..19b993fdd17f 100644
>> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>> @@ -9,6 +9,7 @@
>>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>  
>> +#include "x1e80100-audio.dtsi"
>>  #include "x1e80100-pmics.dtsi"
>>  
>>  / {
>> diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
>> index 2d9627e6c798..6df3ee553bc7 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
>> @@ -10,6 +10,7 @@
>>  
>>  #include "x1e80100.dtsi"
>>  #include "x1e80100-pmics.dtsi"
>> +#include "x1e80100-audio.dtsi"
>>  
>>  / {
>>  	model = "Qualcomm Technologies, Inc. X1E001DE Snapdragon Devkit for Windows";
>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> index ac1dddf27da3..cf2cf3e520fa 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> @@ -13,6 +13,7 @@
>>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>  
>>  #include "x1e80100.dtsi"
>> +#include "x1e80100-audio.dtsi"
>>  #include "x1e80100-pmics.dtsi"
>>  
>>  / {
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
>> index 71b2cc6c392f..82b08350da17 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
>> @@ -13,6 +13,7 @@
>>  
>>  #include "x1e80100.dtsi"
>>  #include "x1e80100-pmics.dtsi"
>> +#include "x1e80100-audio.dtsi"
>>  
>>  / {
>>  	model = "ASUS Vivobook S 15";
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-audio.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-audio.dtsi
>> new file mode 100644
>> index 000000000000..e03441bb2a79
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-audio.dtsi
>> @@ -0,0 +1,6 @@
>> +#include "audioreach-audio.dtsi"
>> +
>> +&q6apmdai{
>> +	iommus = <&apps_smmu 0x1001 0x80>,
>> +		 <&apps_smmu 0x1061 0x0>;
>> +};
> 
> I think you should inline this into x1e80100.dtsi and drop the extra
> #include from all the device DTs. x1e80100.dtsi already references
> audioreach nodes, so it's not possible to build without including
> x1e80100-audio.dtsi anyway:
thanks Stephan,

Yes, we can not build it without audio.dtsi, as suggested inlining this
in to end of SoC dtsi should help.

--srini

> 
> ../arch/arm64/boot/dts/qcom/x1e80100.dtsi:4098.34-4114.5: ERROR (phandle_references): /soc@0/codec@6aa0000: Reference to non-existent node or label "q6prmcc"
> ../arch/arm64/boot/dts/qcom/x1e80100.dtsi:4320.31-4436.5: ERROR (phandle_references): /soc@0/pinctrl@6e80000: Reference to non-existent node or label "q6prmcc"
> 
> Thanks,
> Stephan


