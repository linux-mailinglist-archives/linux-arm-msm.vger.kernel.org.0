Return-Path: <linux-arm-msm+bounces-76352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D1EBC426E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 11:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 16FC94E546E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 09:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1292F549C;
	Wed,  8 Oct 2025 09:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jpRRGqoT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4955B2F546E
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 09:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759915507; cv=none; b=tJbNakgIzUCE76KXLTZHfJRnAVqSwDwBfHf6QIozPMdFI0rFAUtbOdAEkekOJKbcbqiuXvQXe7/QIpbSxGQF0Yc9CLDsrYIwTu80Lw33JU2pxTuSMQS73pnUw0rr+EhkERK8HtkFo9KzSe/cm/lH4OsoV3wel63RJEy9xEidBeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759915507; c=relaxed/simple;
	bh=O6qH37oakVwtaoNReKarYY9VZ2pTe8/oJBJaPMHF0Y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IAwNet8KuHNdnHMSWHAW8IWZSQFKQTRldfpgVna8/+gzgL1wCPWvCzAImIiePw7QXWIfmj7uPcv24iJcNYt8JiOqYmfDSVbnwlspURtObgSZl/P/Gy/Io1MdYkD3wg67R/+gEsTazSFS4qOgc/xull6nU/B1acFxw+qGcUeHAEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jpRRGqoT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890N0j022712
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 09:25:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L95f1zinJTN+46hqsd1dIKLTDhMuPjf5VhEFjeoH9Bg=; b=jpRRGqoT+H5Qg8hL
	VuAWX6QnpzDcT893J3lXgIrEKENzGBhotyOouVCNa+2GJXL48gLRDJE1oQ06WQuq
	7Ht/XRo5owi7cUcxKA5eV3vrc6SHRO5i2QHNyPRTvGwHMQdXnRB4xex97oSE9JFD
	7aKb1YB4LiftcCLZRSP0oebgOiZP6klRFRMHNjM/5r+GFPQLgqLzNK0wJIx34x3Y
	DmqGnTxTLY3j4zEGVpLDrFdKfDP3yMDjupGMWEO8rz50BEqPfmjDxcS84UIYZBCG
	KPm+lTGDrxhhpoGNPH68PBsMpradQjquN1s3mllqSP9RIgk8DWg1gldvljnOIVb7
	JZsaeg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n4wktd7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 09:25:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-84fb3e80002so17208166d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 02:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759915502; x=1760520302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L95f1zinJTN+46hqsd1dIKLTDhMuPjf5VhEFjeoH9Bg=;
        b=TBGLEU9sWInKMGPL/treYmtXxlbJ9j86MIIf0oHwQLWN24fw/DO30t+FmTAWCMI+tQ
         9LIi8EXSnGXkoyzkTyXPso5VlHkZTRILVvk5BCqFeCV8buV8uW2+bC8eArYuVfEt8N8t
         V5AidyJjGi/KsZwO9+LKRYj3aNhSlSrFVoeQjir73xFt+aV9hxsltFzIxtOZOLj5Vga7
         QLk3I65y+23/7az2+QETGG6YkzPXScMzEXi2DLga9ZvBXt1Rhn+syNJ0hBNv7pwmnhhH
         vJA3MwvSoGpK6nO4F7+Oz1qpovWB9l7O9FerElCxABcYjmTCaBmHO7MhDWMqPqshq2Mg
         ol6g==
X-Gm-Message-State: AOJu0YwFlJzgvul+hvouZEic65dGCM/gGiwnFUqlilzZWx06YTT7SBhR
	NZe0kjVNiZHQVH2Z6oRUjB632xnQwXl4zbfB4ZWqI4ZkL7cp3Yal8a9JuKBm9LIdzI6rOeWgZwl
	+HjCjhra+W6Jkd6mMaz5WEob53cXgW4eObd3VRCIyr0WkgpwK9GXQkb3TM+SiOZcuJxxE
X-Gm-Gg: ASbGncvTnSRrR40tXqWNLuE5WDCBCyzc5/vAWBZ+EtNSUbAMhkMmAaLBkiyocAk4GVo
	9mFcI8DBXYogtmrCZshegYLi02Zy9uGa50heL+bMiv3BPK8VMJYbGVLUTg1pzVam/UFrY3Wvntz
	N7CbAIBVc086OrJL3IU3BGWupi+/iF+jczVD5dF27hyvsa8VzEKurchUQGMgBykxES+zuFROO5S
	rL7Z9zRgx5k+doxgRtPiRJBNFF73z/rfsHsZou0oog1I5AtLLds4Ijom0boi8rHJ1uDyjacbPEI
	exPGRtDLjhse08BimumaYOoBnv7G5ygruU/Iol8r77yopyxQIofyjuVQg6KDzFBzmh7LRsLpSy3
	5G4qSJqc3Jr5SFmLwcyLDNrJUkkA=
X-Received: by 2002:ac8:5991:0:b0:4dd:1a2f:4881 with SMTP id d75a77b69052e-4e6eacb81b2mr24861941cf.6.1759915501942;
        Wed, 08 Oct 2025 02:25:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcl92uBxojrfpj2u3iG0FrNl5442DC039WyNm1j68+Zrj+5/i7kVxlNXd9GuFYpT6YjzjlSw==
X-Received: by 2002:ac8:5991:0:b0:4dd:1a2f:4881 with SMTP id d75a77b69052e-4e6eacb81b2mr24861671cf.6.1759915501248;
        Wed, 08 Oct 2025 02:25:01 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3b8df3sm14262621a12.13.2025.10.08.02.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 02:25:00 -0700 (PDT)
Message-ID: <6e5f63d1-8e07-45dd-8e98-6d843246ac59@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 11:24:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add support for Huawei MateBook
 E 2019
To: Jingzhou Zhu <newwheatzjz@zohomail.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251008015404.4906-1-newwheatzjz@zohomail.com>
 <20251008015404.4906-3-newwheatzjz@zohomail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008015404.4906-3-newwheatzjz@zohomail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDExNyBTYWx0ZWRfX9gGkugn2VeWF
 7KungFO2ZwG6VRyupfqcOqAbXByfoUbXvTCq6CkHz1KVPjiW/vp2RMgENWLnvEK9jVLSyQwzVpq
 5kCJUFLq0WbbiNIaQ5ZDsqB9/VFteRVhBrdWmmFmNGmCIkm9Kz+eU2HxPVvwPc6kU6Xa+7Cnnv5
 4XK/m/LrKlYAZUbbBgMPT3koaKWJY+6JZqNb3U11qEzMPSYFGUrHwH8vaPB0mMxstPePkFPVKkl
 eWoWbucYdb42+WJr+fkLJhtZWXkXWeYtJBwq2dtkzR/foCemuXMlZI+qQ90B4qrWe1+KclrRz8f
 FimimEBZI8kVShj1dngxLpusavihFLHhaYoc2AdgQLXRWlYP5WXaE1J7IHpZi9I16KwC+YDjzY+
 BayyuIOCt91Gprld0gq39GX3U3yitA==
X-Authority-Analysis: v=2.4 cv=BP2+bVQG c=1 sm=1 tr=0 ts=68e62def cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=-X776dc9t37Bx4c3_TkA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: GMrLJLQWqvGf3wzwiDXyc4lCPCEIfqGf
X-Proofpoint-ORIG-GUID: GMrLJLQWqvGf3wzwiDXyc4lCPCEIfqGf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070117

On 10/8/25 3:54 AM, Jingzhou Zhu wrote:
> Add device tree for Huawei MateBook E 2019, which is a 2-in-1 tablet based
> on Qualcomm's sdm850 platform.
> 
> Supported features:
>  - ADSP, CDSP and SLPI
>  - Volume Key
>  - Power Key
>  - Tablet Mode Switching
>  - Display
>  - Touchscreen
>  - Stylus
>  - WiFi [1]
>  - Bluetooth [2]
>  - GPU
>  - USB
>  - Keyboard
>  - Touchpad
>  - UFS
>  - SD Card
>  - Audio (right internal mic and headphone mic not working)
>  - Mobile Network

Just some cosmetic notes

[...]

> +&pm8998_gpios {
> +	sw_edp_1p2_en: sw-edp-1p2-en-state {
> +		pins = "gpio9";
> +		function = "normal";
> +
> +		bias-disable;

odd \n-s inbetween

[...]

> +	mm1-dai-link {
> +		link-name = "MultiMedia1";
> +		cpu {

a \n between the last property and the subsequent subnode is customary

[...]

> +	slim-dai-link {
> +		link-name = "SLIM Playback";
> +		cpu {
> +			sound-dai = <&q6afedai SLIMBUS_0_RX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +
> +		codec {
> +			sound-dai = <&left_spkr>, <&right_spkr>, <&swm 0>, <&wcd9340 AIF1_PB>;
> +		};

'co'dec < 'cp'u < 'p'latform

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <0 4>, <81 4>;

Would you happen to know what these correspond to? See e.g. x1-crd.dtsi

> +
> +	cam_indicator_en: cam-indicator-en-state {
> +		pins = "gpio12";
> +		function = "gpio";
> +
> +		drive-strength = <2>;

strange separatory \n-s here too


lgtm otherwise

Konrad

