Return-Path: <linux-arm-msm+bounces-84627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30113CAC1A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 06:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A84E8302068B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 05:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37682417E6;
	Mon,  8 Dec 2025 05:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cq55h9an";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dl82SHY+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8A820E023
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 05:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765173285; cv=none; b=LcgOiNTpU9Fg9kJpjFL65kAHCGh/ubT7zxpwdlb9Oi4oa5WTYttvvgnAWIiwyxPW01csZwdrHfcTIHrsdJcvhI7SmZZZ3ENpJMgzDicQQUG1CCmXsyTOWplLGsG1CIbF3r0pzKExm2BMQRHB6RTg6wCbX8A/RjbhnbdftWx+BLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765173285; c=relaxed/simple;
	bh=/WWMpezjV5Pgz7E3uVx20lE736UJAlNqJQnCoSVvM9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oJxqDp134Xq9Ufms2Ao27NJhzEGigMXLqoq+svZbSfNxUopchfC8NzGUaKKcAA+o93OAWmokfUJPcfwsQ87UUeErIVrm4vj5pLqXHFTpuakhshuwvWxusHwWjABJMBxJdugUFQa7vIxaO/4prXFLlshtX1cknenRYpguvEfPbSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cq55h9an; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dl82SHY+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7N0nde2557820
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 05:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3wD/BJFgxMe+BkwnDetf26Pp1/8Rqa78VQzELU8Kbog=; b=Cq55h9anVNkkE+dJ
	xSskG0/86S9KkzSXoy5yo+M/25Ukk5wLLS1TpQ+W7RPm+5VQdogubYAMnaNa0QKt
	vyLaO+8Z9zkP6a1slT6nlSCOs9rwDpIFEy3TH2ATfprVjz4zkUXX+9XLhX/eYK2Z
	6yd1Fov647gkC0AftOHGlJK2bi7s4QjlbvYIgOaIpNrR9io4aeSyJ1GPfA/T8pMJ
	tI8YE7m7N6R77OLFCG/Wzzb/dsx1rUUM2A6GBGvP6O5YBXCUzmjB/MLNd97wjgRq
	pHQBoD1VblNf5jI7PZxUR/yA/FbH2hx4U1V4kudzugbi2HZQqAp0t46uZ/ZydrKX
	ghIscA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awha1gsqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 05:54:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340c261fb38so7090541a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Dec 2025 21:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765173283; x=1765778083; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3wD/BJFgxMe+BkwnDetf26Pp1/8Rqa78VQzELU8Kbog=;
        b=dl82SHY+w7AGWCa68WXeIhMseIg9bAtaRp3f8g9ZElLtlABK3X+5Y05HnWVtEFKx9G
         8oNF/7SgD6oNO1dwnI8Y2GOT0L3ANzEto5DADmghI8CFiswXNlPIICTQ9zAvSCfoMh0+
         NPXgSBuDzlfg/NxhO7MfAD4bQNc3RKOzWOIhB0byPDUKuSF6gmTb9TIp/HoIsg1V3uXW
         LK63gtsfekH03nnQZ06ChaUKbhfG9RPvBWgkDyJ26eG3k0OLCusEW3XnmPPVsXgubEBA
         eQvQQWWRdTIKtJPZkWAB1wT65LoWnbMmskdpVNJ6GvZn+hj53ibPK1weMQ/Tax0JjYkF
         M/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765173283; x=1765778083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3wD/BJFgxMe+BkwnDetf26Pp1/8Rqa78VQzELU8Kbog=;
        b=uIHIXfSr3h05IQQGoItYcERRk29NhzmvU2DCXSAzrMKzSsqeKV+pCskEbDTJbsujxk
         PZe9Q2YfB7xS5IGwYA/7LeTOtnY9F/BDEJdYGqbECvYGApiXr6rWoWVbqGQYPeKM8VCz
         RJiDeH20bvVlTU9Qag0wQcKDlGRVVBA5POnDOewZNNJLWTgUaok169NoN290BdqFbb+J
         ujECEhSqMNtNURB1NAxbAetWhIbL+7SbKUnM21d6FM1iXs69yGDEzgmtK7N3F3waOICM
         ebQu6DeiBTC1KKMyvz43Fe3kpe9CgLjU31fLzqzvhgz7maghOG7+lQ+fQzJzVapn9u/7
         V/LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwWcu1h2Aov4w+nGLnt/wQU8ocef6I52iOs8URuMqUX6MIPyk5lJObo135L/bZbudp/6CEdZMo+ppz8vM/@vger.kernel.org
X-Gm-Message-State: AOJu0YyBtQGYjgpTi6W8AYjFCjpmZIksT4SyoRjPTopJMdl89OIAD9ne
	nJFfntTHJNOhw3llrzpVDHr7sWszI8cP14pMT92Wl7PH4LLeb0hQizTU/ES7x4+1F264InZPCF4
	sn5O5bYvD+rAmiIGi897B6ELjHiYYZ5jHqK3zxh2wMfHQU1h8a2acn7k86J6fhDmYNEgE
X-Gm-Gg: ASbGncuFLcQKQqv2ZXwTknNixmVg3H2boF4u+uYhA2ZhtWeuyeODfcqVZuAcd/Z7nz7
	WKKo1kMbsNWL4x4k3wh4uVP8lkb/nLrPYckUUmjlxA59CqHyuQoGlf1WxQDbS+cI8KLN63N78Ic
	IekRzdAK85m+K4YgO7SXE76tMEemPnb1Lzwht5Gr364SnYrYeykbq7ju9Zv/URC/EQuzl7uWOFJ
	O/XQfnXtsnbAVaR2dpacF5cXPgPYt6QarPF8UpFBbULNwp1R/Mu9rKZkQ5tjs9ERUUbLoiTLE+Z
	rfS48Pzj/kH7teOv0aNir2MbgYyhIFFKfLAAFhFZPyGsyP2PxrOz6oE//kAVjWiYwm+9fPOPtsW
	QjkFPiJyErP2QTI7TPl3i18jdPPCJm+rtGjF0pAUvVFmeHrA5dkpdlSFsPuVUOHYyFHM37pk4+6
	+ZD5Sx
X-Received: by 2002:a05:6a21:6daa:b0:351:118a:62b0 with SMTP id adf61e73a8af0-36617e8324bmr6655612637.17.1765173282534;
        Sun, 07 Dec 2025 21:54:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/pTf+vF9S+v114mdfDcgTZFB5uGyJc2+8RBnjY+XXWLcd3wvj1h3eLAn5alGD+kpoMS6r5Q==
X-Received: by 2002:a05:6a21:6daa:b0:351:118a:62b0 with SMTP id adf61e73a8af0-36617e8324bmr6655587637.17.1765173282067;
        Sun, 07 Dec 2025 21:54:42 -0800 (PST)
Received: from [10.133.33.182] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf817c3e6c3sm10165705a12.17.2025.12.07.21.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 21:54:41 -0800 (PST)
Message-ID: <88f1b733-ffb6-4381-bef5-37f2c89c2db4@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 13:54:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: kaanapali: Add base MTP board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20251204-knp-dts-v2-0-596d8398c6d3@oss.qualcomm.com>
 <20251204-knp-dts-v2-4-596d8398c6d3@oss.qualcomm.com>
 <dzi353lv54eusahl5wyjlvinuzhn4eujxilksnz63urooskgrs@fxo4ancdzcmd>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <dzi353lv54eusahl5wyjlvinuzhn4eujxilksnz63urooskgrs@fxo4ancdzcmd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b6q/I9Gx c=1 sm=1 tr=0 ts=69366823 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AOF791r3BhuZRYR_rnUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: icy2DBDwAgMfYEyXl5eSzx7nIlmZVgYN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA0OCBTYWx0ZWRfX8EjiqSkCPzHJ
 mWPREE3XpuM+RYy1zbU/Rtqfcrq7WITIkDg8Npgv+143NAl30Us8dqpmd5x9CZbIHrmFD1vnnQn
 PdLtOGgYYKNExdd4V7eCwoSHiHeKNZbTZAVsjM9wKzBeGKOijV9ygr/w6THRBTZJREBn7+LTNRr
 pklZBp8CA1yarK+HL8gEKjKcZ4zOLum9ddw3iiNNPFsZyC+NxaUr1v7h30XARC2CLNIOqzXvYgq
 /nWlXYmXME9CNO/FSEyXWOjuj4Md4EY7IhAiYgdC0gclDiJt5wZTBBmHWcPcc4m3871tRHBcFr3
 EAtyKDO89Xw8gK32aglgGiiA0Urjtr7BEjfmDdNG7NqZtoecTgDW2qTO9X4epPlP4rie49Dggvi
 3VnpHogTp0h73hwvnYp47uYINa2lQg==
X-Proofpoint-ORIG-GUID: icy2DBDwAgMfYEyXl5eSzx7nIlmZVgYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080048



On 12/6/2025 10:42 AM, Dmitry Baryshkov wrote:
> On Thu, Dec 04, 2025 at 10:31:22PM -0800, Jingyi Wang wrote:
>> Add initial support for Qualcomm Kaanapali MTP board which enables PCIe,
>> SD Card, UFS and booting to shell with UART console.
>>
>> Written with help from Jishnu Prakash (added RPMhPD nodes), Nitin Rawat
>> (added UFS), Manish Pandey (added SD Card) and Qiang Yu (added PCIe).
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile          |   1 +
>>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 754 +++++++++++++++++++++++++++++
>>  2 files changed, 755 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 6f34d5ed331c..ac6c0178aae4 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -30,6 +30,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
>>  
>>  lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
>> new file mode 100644
>> index 000000000000..32a082598434
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
>> @@ -0,0 +1,754 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +#include "kaanapali.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. Kaanapali MTP";
>> +	compatible = "qcom,kaanapali-mtp", "qcom,kaanapali";
>> +	chassis-type = "handset";
>> +
>> +	aliases {
>> +		serial0 = &uart7;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +
>> +	clocks {
>> +		xo_board: xo-board {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <76800000>;
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		sleep_clk: sleep-clk {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <32764>;
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		bi_tcxo_div2: bi-tcxo-div2-clk {
>> +			compatible = "fixed-factor-clock";
>> +			#clock-cells = <0>;
>> +
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
>> +			clock-mult = <1>;
>> +			clock-div = <2>;
>> +		};
>> +
>> +		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
> 
> If you are defining the AO clk, why is it not linked to gcc (in the
> previous patch)?
> 

Have checked with Taniya, we will add it to gcc in next version.

Thanks,
Jingyi

> For this one:
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
> 
>> +			compatible = "fixed-factor-clock";
>> +			#clock-cells = <0>;
>> +
>> +			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
>> +			clock-mult = <1>;
>> +			clock-div = <2>;
>> +		};
>> +	};
>> +};
>> +
> 


