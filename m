Return-Path: <linux-arm-msm+bounces-55606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64314A9C54A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 12:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAACF4A2449
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 10:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146C023A566;
	Fri, 25 Apr 2025 10:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JMwybUwp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2B423A995
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576584; cv=none; b=LBGXgOxs/ZPxQb3SAtqOWc8QVMpLCw8OQ8LXP+NiVPhUUcN0TpR+qtE6k6iNtEHYnVdXm9MFe4i2qc68Mo6yQ7+vByT0gatAdWR6yiPZDvA7GiEuTFe4yn6xTjWsy33z9i0RzbYmi8ZZwirAf5HhjshmdAyS18d2vzVJFihesU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576584; c=relaxed/simple;
	bh=P9bo12OrecKrjN6mEf52NbCUzn7wxcs2GhFekAoyYQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FIkrhKSExMG+tUnEQnScsqKWgjHBb4/tWC3f1HWqlVTVTQ0iwJlBM00wmtRKJ2byTt1uSNdbYdV8YZJolZRr+L6DSI2ooE0Z6Ay8VVwceKyRTbnHgxcU7VK1PiRd727leEOyXpQgPpYcHlqbR5bch1rK3+091lJ1rwI8akXPttU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JMwybUwp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T7SP015438
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1igCRfVQGLQJpudpkgi6PdBXZlWbka929iUNJkPgh78=; b=JMwybUwp1KJ+ByIQ
	aGAGvjgeL8Om6a7lE1RsM/DvEmelbnmYongVRMpPDm43p43+IbVjpnkYTMbRO1eK
	5GMuqCPxOMOSs6Xu1ajBiLnel/K8rydEhiUbbpfZ6t/MGOtRSpSDGL2W0eanCV8O
	v+1hqh1eBnO7yHQQ0GH9OllvHuqU6vZ3eSSgYRGVBnfRBq/KvzsMunRg/uGYKkKB
	pnXTYvkia4eBMBOwjg14AECZmYRCV1SdCEyZdg/axjuulao8dRH+rvGA43HvfPq4
	sjTNIj0GPhZEXzZkeQAnlzonifaQp9ZssMGckLPEtY0n2Tg+HviMcujVNDqvDlrf
	gMSY8Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3gjp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:23:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6ece59c3108so4964786d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 03:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745576580; x=1746181380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1igCRfVQGLQJpudpkgi6PdBXZlWbka929iUNJkPgh78=;
        b=MfjMrKi5R3hQKTPERQlw0t2Eqs8TMRoETiWdFxwltVh4LUQ+c4tYSSXjIZppQbrPpc
         +7lAh30sH4yOqLXvVnrmN++j0irvf81Xx3CNBkmQkTF//f4bNMa02cBbX5klDqTPTTlL
         dsy/460uIdvMXWeKCwBhtFIkECcCG/N1dWMeeGnj5OXEbF+1bmFh93IRyc4Sbf6X0gNM
         aYA79wq26P9+5lqsBCB/2nkotCmmTkoLj0TCys9cVyRgtmalzzIU7iqaG1WMvhvgzXLD
         NKsRKyPd+ZD24n8tlh+W3G8LzEjahO2lrH2UT7pGBUi6ia6Sboz+UTy0pCgzU2mIr1W6
         hEVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFHjK7P8WcP8ypy4nY1TSOdx3tRYb5qoAIhcuyb3IKqwY6edI4tcAP8ruRmmL/J7tXQsfzlnd/SGTElHmB@vger.kernel.org
X-Gm-Message-State: AOJu0YxjyKN10axfrpqbI2OPfjQIiUD00W+lYtREabL0YAITQmlKXz5q
	d4/y2Gp5oUybPj/fLn4yfMqd8jguMWVvK3L8YAEbd/S160/c5DUc9jJFIvNjZ9ORK6QeSU+VRr3
	RcDK4JRst6oBGu7rjzXV5qC1hrw4FqH2g/0NMzl+znV6LHrQrjQJ6iVBOxSekXezh
X-Gm-Gg: ASbGncvRXvF4I/En2ild2UfYFQKAoL2b1womtp/m3atiHVRJbGhPucOw+CujTqG5wp5
	TLFSeCbNfJNJS+QJ/0ewCcBypUXtPXR469d1k6ArG+QdT+B4dExmjqc99dYtSC3MdMJLY+D5Bpw
	IhZ4eaLUYFnWq4IrHWecQzquKzMRmiQ8YqxSZ4Qm4ljl+10Jl56BUQIiyavgIDTaf7WD1FpD7aY
	fwkM1Eo3uP/BNjRucdy5mcKsJwNifcx1bCm4UmcMz56cOEjrgNAXoiInMvjaHknA/ba0BdUu1o5
	cDUsd6iXZDxnIbWQH50BdaPf3wW8bePLIVppTWduXopbMXyDQQCCYze015eHKU6P
X-Received: by 2002:a05:6214:e61:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6f4cb9af423mr12058366d6.2.1745576580202;
        Fri, 25 Apr 2025 03:23:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQHRUw0T1iKaDp55HxB6gYCPliox//7FFtFtFVjRAOfeqf2fXtnDneqIM45D/HHTkZv9xn8g==
X-Received: by 2002:a05:6214:e61:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6f4cb9af423mr12058106d6.2.1745576579842;
        Fri, 25 Apr 2025 03:22:59 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff45csm1082025a12.21.2025.04.25.03.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 03:22:59 -0700 (PDT)
Message-ID: <4bb58766-a080-4351-87f5-79a98219171c@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:22:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: x1e80100: add bus topology for
 PCIe domain 3
To: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-3-quic_wenbyao@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250425092955.4099677-3-quic_wenbyao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hnvep98vsMGTjy6t0pEFiQzimlEY6Y4b
X-Proofpoint-GUID: hnvep98vsMGTjy6t0pEFiQzimlEY6Y4b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3NSBTYWx0ZWRfX3R4ndvxd5DgA /cNMWEh6vvI/ND8bRgDhVDOQ/ZPlRO2lRhYIQ+pzJgNwVcj0Jtn8ns4xpZ6+rnPdgCp3/u1AevF ODaPu3NMACZLD2Hb7Fdcd2LJ/qu+0EBK7OhnLF7kZ3dV2fcJE1yuLLpsOm9sP2J9oXugrv0L6iP
 zwbf22tFo7qKv96BYUnQWlStxpgogniujDVUCCJzyVyadyLmOo+tmwf1MjZX/UVFz4UuaYneqQh uCsjVhg8+JAcN8PNATdATNuilJda0D58xowLHf+183OBtJTeyJ+vxR3kgigrWn6lh6dWcmg988o AcM7ImwmzzAqL+EzCqyegTEW8ukpPvsMx601Pv5E7cVEB6AOnYY4Fbfkuvwwrgm5YnJay7zTauE
 hnwLEPql8Bhl2pO+/jusfWZTOVWb00q1+Hk0QLnktK+fyWsVOTRZdamntzHmZoUyv6I2/C/1
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680b6285 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=xscrbkT6CZb1QQ6CF7AA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250075

On 4/25/25 11:29 AM, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
> voltage rails can be described under this node in the board's dts.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 46b79fce9..430f9d567 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3287,6 +3287,17 @@ opp-128000000 {
>  					opp-peak-kBps = <15753000 1>;
>  				};
>  			};
> +
> +			pcie3port: pcie@0 {

@0,0 for PCIe adressing (bus,device)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

