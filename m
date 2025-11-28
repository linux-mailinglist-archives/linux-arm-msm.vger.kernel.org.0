Return-Path: <linux-arm-msm+bounces-83746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AE710C91C2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 475524E1A06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5A53093AD;
	Fri, 28 Nov 2025 11:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aF3sATIw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bk4zcnV8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B749D30276A
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764328349; cv=none; b=sahXy6X3sAu2vdsXtZUvMC7YnS7unsxnp5KNnNwVSOOMm4VhUgqKiVZYMj8gWgfn/lr+GUc9516g5P3fZCYAFSsqeEjFzXj50k5Sk31RBZsBh0W0Lwfw8gDRRzrK8J4oJbQddGoeESmmy1pSYgQMzrPLdlL6sw9nLvX5F7XKMy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764328349; c=relaxed/simple;
	bh=6V53LQzTUU+X52oe/f37VikA45bAYlnugVS4uwIn2Oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hmGXRkz30wCybPuWPS7paDJ5mxI9sDUqqpERtv3nx4njgzIo3RNEtZhc6U3NibdiPpiuq0dOD7jiS29ZhLrJWcScmAKB8ioutqG7a1fAKAtMAczuQ5oAuDLL6z7qQVkZJtQgpkK2xAldoZVqrH2noEPWDEnQWO/LSQhHbehhus8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aF3sATIw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bk4zcnV8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8PYlm3797569
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zlsWn4kiZBm5gf5wTx9LDTRp/oeUmOFgghiippIY6YU=; b=aF3sATIwIS7lYVd6
	hTWR4SEHWUEDWhpp5NYQltkhVOWsbBEGpVNbFgsG9RZmHq5DNyrOk5U1a7+rXu8V
	3Fypd1OYQ89aJcGNK0zcZkmYgpZblMZVzpF5PHEqyOzZ5TTQgETsVniz4j97hM+P
	ryq2+IL1aDmQrsiaUDr84ZlvpdBBxLkdeqneVRU2UWeqob24m4g8OcV+o+LWJANx
	7IQuh7+0Q1AGTsATTKIeYvU4Cpqr/xecuSS+fNbQwNTlJvHogJnQ/lcBL/lh+l0N
	1+yAFSbwIcm9cQYudw62OUR/S1Pl62zx4GKAEb5GeUpEhzuwpMiASFEXfi03fNp9
	UpSm2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apnudax9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:12:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b222111167so30960285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 03:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764328346; x=1764933146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zlsWn4kiZBm5gf5wTx9LDTRp/oeUmOFgghiippIY6YU=;
        b=Bk4zcnV8CS6SWjatBzfAdGePUCws6skCJ2+YcR1tB9q4QjIIV8C1oS0gtnjEW54zkb
         xWUfDiKkKH3bNX14k1WswoZnWFi3OG3C1n3cXqqECFEBnIZ8qvApUXWznSxfUkFA5n+B
         HbYigNMArsCIX0Qe89JrYJtCoxwUCg91+VnJJuQlQkehUghoYrmSJTwcLBFDAO2BK7Wq
         oCpEu+qrdBcWBVTgM+X4uQKtuc4W4uuN5TY0R+nzDLtEJBZGaYkfVdYxDV/Rv9XqESg+
         dMfiIF8bgQBcXlRhlujAUhQsBMN0+lS77knvUf0wRk7nlICCy+XKNkpDe5+aFybgmoO8
         vOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764328346; x=1764933146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlsWn4kiZBm5gf5wTx9LDTRp/oeUmOFgghiippIY6YU=;
        b=I931N+PhDZ2CdnchJcMec9oyUMQUK2u3VrrNqlrQC84Rqt4hqrWR8Scx2F7J3hirDN
         hU0QZiUWXIcQO7qxhm8JSOr3CmJ7fVTv/6NQNeHuhCRJSoOYEn16PIkkWTpjDr3dEO8F
         e14/kH//xBafIBi4FVqqXruTiMulbnE1WFraJrcD+cse7tnM50H7N383dy8JTu0lvbT+
         OoC/Ch67Zl7+EbDyp0MpqEQPjeCU3s0guGYiI0wbDuVmDcaX6Am0qq9ChcPJQ6nUk/bq
         t0cVZ4JNBUKx1Un9fphTIdiF+O7QkA7vqSsZQXqHED9EWgcWP/xIwhF6bPbZlpFk6TYr
         QZPQ==
X-Gm-Message-State: AOJu0YyLzpiah7NK6NsB8Gxzv89Rc8hkBKFK7z7oe/4WbYr0iwBMTi62
	biDutUxjrL/uoYaYaRhSTXykjpEPqA7ieVeBE82/zUt1YbNU9Fzk3UDcu9+2qjsdKCYUj8nhcCR
	EJrlak6I541xIHy0vyXzIcif5LdEEXNK9TDixMCHEd2O5S9jRwn6g6HI9Ndoa+ZwZArm2
X-Gm-Gg: ASbGncudIsUSgKEUCcKtgFx7vRRkIIPXD9Rhj7x1PMQHPGUeB8QwQjLE32c980Y5pWJ
	LB4crCYXFIeST0JZ1MG+RZ4It3RHehUoykMt7A+xpiJLThV+uLXuEJI+n5kQd7kB8fzlr02l24F
	z1BVZX/hrZXstw5jGJPIr5h6eZ5QFZdb11GXazwkuseRQYD7TSDHLdeDUgMM6dBVd95Zkqkudth
	6FtdGpyG9KRopFbGIcO4MRYhcOZrOVnrI/uRrv3j0wPrNVn6WjNqbWJ2rEUVawKpdEQgCmAjOG1
	DRRYLD4UUoRYFurT9bbWu28HUMDRgQRbCzHF9STl3touVTALF2KgiiINXt74ueP4ZuYycdrzibR
	A9CZEyobLtg3egFMuVk33eq2gJ7qeUF2BAV+fywYKZHsehsF/vVg5j4R1b0FJt3KaXAc=
X-Received: by 2002:a05:622a:211:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4ee5b7badc4mr261376571cf.11.1764328345963;
        Fri, 28 Nov 2025 03:12:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHqvqBrOff1aK+JlYStktskbnEDm1GLCLkvvwCtBUrTJjO3T+v+ULBjs4vCemVpI/N9uKzag==
X-Received: by 2002:a05:622a:211:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4ee5b7badc4mr261376251cf.11.1764328345544;
        Fri, 28 Nov 2025 03:12:25 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519d883sm421252166b.17.2025.11.28.03.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 03:12:25 -0800 (PST)
Message-ID: <812346db-d848-4470-ba46-0a52b2ac5d87@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 12:12:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: Add qcs6490-rubikpi3 board dts
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Roger Shimizu <rosh@debian.org>
References: <20251126-rubikpi-next-20251125-v7-0-e46095b80529@thundersoft.com>
 <20251126-rubikpi-next-20251125-v7-2-e46095b80529@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251126-rubikpi-next-20251125-v7-2-e46095b80529@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kb2rZaZdrM-kU1Mk54Z7ei0NQSSPKKCd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4MSBTYWx0ZWRfX/TU+W9ajACsH
 vZR8QDUeLAINfGuBvLVzbf0zZzxzQ4k2ISGZWMuhiSc0m1WcyH/j0tPNAToakiR1uVQcLjwiGra
 kmT1q7HxCE3oVPEsUB3Q8v/nD1jv2+5c6EtSUqHDjoEnSEP06p7c2SefxDXoza5I2G0exYV5u/M
 WXW3qibAJSoXZo0FrgUrv/SZ1akeuFQX+yW/r04OFmiP3V/82O+IquxpJDBevJGqXvUEzKE1C5Y
 Dw06XzdK2kzLKB4yhOAQD1u23/oqgR7nHOXkpetAaqAf9XA6ButHQUyws31xXg9MGpY85pj+zgf
 MrgsF9to28lzCZ9Dm4Ees7iYtOb2tmUwnIT5ekgbba5wcFoZWIGQRny+fqF/erCYWHPSAIEppVc
 dSP9sKIUXrH5Oh040raYjD9K08oySA==
X-Proofpoint-ORIG-GUID: kb2rZaZdrM-kU1Mk54Z7ei0NQSSPKKCd
X-Authority-Analysis: v=2.4 cv=MKNtWcZl c=1 sm=1 tr=0 ts=6929839a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Wdb1h0LgAAAA:8 a=xNf9USuDAAAA:8 a=EUspDBNiAAAA:8
 a=hFi1a12O9VuTv44D2lkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280081

On 11/25/25 5:07 PM, Hongyang Zhao wrote:
> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
> QCS6490 SoC.
> 
> Works:
> - Bluetooth (AP6256)
> - Wi-Fi (AP6256)
> - Ethernet (AX88179B connected to UPD720201)
> - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
> - USB Type-A 2.0 port
> - USB Type-C
> - M.2 M-Key 2280 PCIe 3.0
> - FAN
> - RTC
> - 40PIN: I2C x1, UART x1
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> Reviewed-by: Roger Shimizu <rosh@debian.org>
> ---

[...]

> +		sdm-skin-thermal {
> +			thermal-sensors = <&pmk8350_adc_tm 3>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +			};
> +		};

Toasty!

I suppose this can be further tuned down the line.. perhaps turned
into 'critical' too

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

