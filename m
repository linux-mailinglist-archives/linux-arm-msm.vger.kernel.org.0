Return-Path: <linux-arm-msm+bounces-107806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCbHHtgCB2qVqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:26:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB13154E641
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAAAA309E36E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC99846AF25;
	Fri, 15 May 2026 10:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OcNUlfFs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dmHU3NrW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD13B46AF06
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842436; cv=none; b=PUtHfVDqpwRD12xgQHisv2A7SYI8zPFg+HHFN4dsCCUEi59S/Ps3ARccNiMVx5X862BGtz3Yca3tVd8LH0/FrA1xdcGJwiFPjfo0xeZgQbi3oOSpNTT3L70yygCNX0b/R8TQtLO5mmy1w6W8kSrOAwh2g48Rpf/oc9kGylLYZf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842436; c=relaxed/simple;
	bh=P7+2xwoQIbHA946IMLaU3RvFr4k+V5jtaFqys75Nr9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o+Kmn9RWbW0+ZYws9QEVdmJhARYvMJEXH6Q3DKXvw1LKdQSClLgZsMYz2r2lW7aT5XuhqIk1TUf01owi5y8398TzlgF5GzROnfTylQVEteBKI/7xdAhb7m4Kq3mKOmnTF08v2psgO5H64eMm4fDcpuphgdndRPbcw2dJNGkh+k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OcNUlfFs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dmHU3NrW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5KbQ53199802
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qV9wsZl8WKrBHBkTAdbssnMUVospcGITV573zzUgjjc=; b=OcNUlfFsgC+0coGK
	IKaI+HdvKzg197ZJNGAMN5TLxwl83HjLJEq6XyutSYPHTtuy0oeXZKQpBpPfVWVe
	h0RIuyWKWfwU/4OoZ0wpOCjjpIGcRAgYfjhFuMPjUMq7RQZYOLzmKEbC0pVdVpx+
	IAf5fIkC3Czr7CEdc0FdYn+zFlmR0JmcdsO/x3LJYuq4C2oWeSBfFfXUx6zKa3PP
	8O2HbZp5vxPQtaO63dSx3ZLgg+E3M9+Y80f9adMWrLTjrSD0X5rllBJD/FlzW3BH
	Iwf9TbjVDUXSJkH8xGb2WYfyPFraxH1VmWjbmDyasT2t93sPFnTsnyIl0i8x0ebx
	smOmFw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qtvh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:53:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83f24cd00f8so1071141b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842434; x=1779447234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qV9wsZl8WKrBHBkTAdbssnMUVospcGITV573zzUgjjc=;
        b=dmHU3NrW/VLoSrixteiqmPuC4myDYxEm3shl1WilxyWbKCvyz6tuSaeJG5Z2mIz83C
         NGNAP7keHf3jyCcMm3l5TOzX6NtIgT62unKUqCcH5nUOhyNwGHmE06Ym3qnTIFwsKjaz
         xzLJGiedYLruV/MbRMZJE/6gkVtPJPWccg/MeEbaZGz0fiKTNeduSG7l7SeLdRIBX0rt
         baez1yn5Q0G3xV6j7mBHOX4F2bc2c8dwThFxNteHpR3o5ACXHOIX/azqoj4VZvB+Hjb/
         bI9qGS+kigHWK925JLEsY/zpWrSbw+EG4UOl2OH+IurxNu9lOrEcgk8AoE+6Sup66VZD
         eU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842434; x=1779447234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qV9wsZl8WKrBHBkTAdbssnMUVospcGITV573zzUgjjc=;
        b=dWGrN8kSrflvY+Yuh6Dh6IIL1ROPDzDW9iV7W7x77BXc8iW7zp3uk+zMiVM+mJSakG
         4gAT0gJGKqqKKSbzaofl8CifcTli2jliqAwaZvrJlystNrT9NP/9ovSL2XhGGnv5FWcW
         UUAwlTO/1+ZxWzqVOfPqcWg3w+1vdPexIWvGwdzrYnnoppE8zJkkF0NKDRoE9NlPPymX
         1VK5V6l2FFT1Tlib+aos4pSdTW6INcGGe5NwL+TTtoLGvqTwwdNeLnLyyaWFLX8Cegnk
         ZFXd8FJ1oGmMZGK8F+zyNtT75dqLxrQXZNiFwpPx7Z0nzs1ZwWd/aLjN4L3YMNL1MQfb
         Hydg==
X-Gm-Message-State: AOJu0Yz1rDHR+Hu4tlPGf4y9ekY0SrmvWWZoxAWVvYuY64bLtR4y9LV6
	RROVwoBAbClh9+0+oSls9f9GcHGHu4aBKJtWnEGIofI+Y2J7BT5aZv6rZ2yh6nKhcOC4UiUf/pJ
	4quZJJTZiwEA2ZbWJNbh8RhUwFl3c2n6SoYg5pgUjtpAl2gEv5wPSugSJAkqFy8VzQqV6
X-Gm-Gg: Acq92OGoNKw03G0FM74VFuY5bdVSgvjmalVkWdzAEjN5K1YHerbZcq3GIMm50dMgf9Y
	wWs8rQFz8fQgjRBx+jzM5asgUFn5w/X0oioxIRFaD9euYzkmSs3Ssr6hRbkeTlsJDrmA1+yMk68
	exqncFd8kiZd8tZl/NW+eGWyGDrQnUMH3mm0zdueSN8grPZIa+/vKXwk34MuzuyhZLw7UfCzjLO
	eMCbBmf/KIB5yZNzXTZ/EB4DmHcphQdMR0LvyWFn5Oq85buphz0LpQVl7DumdRn/MsQNKB4fd7J
	4Vr1jaCK6dN6rSdeZtGh2raUNYFnWLhyl/2bSxaTNopi4u/WeM/M5oa6TDGXBe2dWZEl5kvPrty
	ybQamIVHOK9xsTHJ05+EznBgtwPi1BqGFUuhGaMt0+YVkOdxyy9+3cvhZeh2bMPZhUV8=
X-Received: by 2002:a05:6a00:e11:b0:82c:f035:6748 with SMTP id d2e1a72fcca58-83f33d8092cmr3886835b3a.42.1778842434240;
        Fri, 15 May 2026 03:53:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:e11:b0:82c:f035:6748 with SMTP id d2e1a72fcca58-83f33d8092cmr3886800b3a.42.1778842433785;
        Fri, 15 May 2026 03:53:53 -0700 (PDT)
Received: from [10.152.203.161] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f24cd0422sm6601508b3a.18.2026.05.15.03.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:53:53 -0700 (PDT)
Message-ID: <3a6f613b-07ff-4efb-8bf5-71e397b15876@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:23:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5210: add watchdog node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-ipq5210_wdt-v1-1-870c4b7f77b6@oss.qualcomm.com>
 <1b741127-18ef-41f8-b645-707083d7a921@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <1b741127-18ef-41f8-b645-707083d7a921@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a06fb42 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=cp6o2u_hlgqnvGeBYv8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: MY1afYris4lp7GNRKraR9OV2iKe8-C1m
X-Proofpoint-ORIG-GUID: MY1afYris4lp7GNRKraR9OV2iKe8-C1m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfXwEOz7m2gK+Hv
 wnPbNSOrQsNo3xmkl98m38ogeVuIsF6y7o3m4sOg2+ccVTo113e0eFfyQ97JUo05EktFt7cbmRS
 +4ffmIXVy+5jHsSUseKG2jJeDCcAeT6RZAwC9w1l8dZ3NAFLg0Y7/+anWQKFVyO3v5pA5Js1L7J
 oWUEN79Y/ID6fFFXBlgTvJ5TVie5ckb7N4S29x2Xyip3w3U385qaLeYoed2y2U9IWJ4Xhvjr+Pj
 8xO0U2MXVuwLX0JvhZeXRFpqkQa+9cEQUY6Bhfs11mH2go5+S6GISNWbpuF+NEW0sOfLxeQXBya
 9/Rs76wXGhHrUbFPZMdockcjVFVoIsvm4DEO8J3voNLDJJG1YEQSV8xqg1LmZUJkgL96I6J0mA8
 DsXNzoZCwz2vwgULSrM4OiuokUtapWBdkGXjhZ2iWAAlY92jYk1OwoJchy5j+Wm2CWyXPabUac+
 eoYAFPg/fKthjcJcfBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110
X-Rspamd-Queue-Id: EB13154E641
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,b017000:email,0.0.7.208:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107806-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/15/2026 4:20 PM, Konrad Dybcio wrote:
> On 5/11/26 12:56 PM, Kathiravan Thirumoorthy wrote:
>> Add the watchdog device node for IPQ5210 SoC.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq5210.dtsi | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>> index 3761eb03ab24..2cdc10529c48 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>> @@ -236,6 +236,13 @@ v2m2: v2m@2000 {
>>   			};
>>   		};
>>   
>> +		watchdog@b017000 {
>> +			compatible = "qcom,apss-wdt-ipq5210", "qcom,kpss-wdt";
>> +			reg = <0x0 0x0b017000 0x0 0x1000>;
>> +			interrupts = <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>;
> Are you sure about the interrupt no?

Yes. If you are referring to HW doc, it is incorrect. We are working 
with the HW folks to update it.

>
> Konrad

