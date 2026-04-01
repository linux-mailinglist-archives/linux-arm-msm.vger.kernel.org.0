Return-Path: <linux-arm-msm+bounces-101278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMUVCn3lzGnuXgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:29:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFA83779CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC965318A0CA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 09:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6553CF025;
	Wed,  1 Apr 2026 09:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VhrPv9Ky";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBWJpMS3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C5D3C9442
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 09:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035255; cv=none; b=D0nmsLyXGvUK4q7JoC0Td6mLCbQSYNzb8+6Gj/XTGBiD9JFcLE1Kna5G3SUDIRXdSXbc8QKBvmjqeGpC5y4WDtgLoa5piEpza1+fKif93r2n1hzbkz897Tgusi8GN9UasSx4lGUWzR13pF/FE1A0N+dwnZjV/+8I3hj7RfTWsRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035255; c=relaxed/simple;
	bh=DGtvIpbiWD7ytTqar1h4W/k/GUYAQhsU+yvPvBppFgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iEPVvaNg/5CR2hS3n7Q7rOjVKvCbXsP5f+Q+1jxDzuv31tSvMx5ofua0neTSAW4SroU7QCRQjv0KPM/m9m7UvPO416rX96uA5LoiEdJh37Y2A0lETYgXa/89P34k8ylms1YufvRntuD7GVYBdurAxKHzLCCdz2cL3PjXgUJaqyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VhrPv9Ky; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBWJpMS3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317Gq2i3103831
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 09:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rd6i6PS13zNbPN8wfoARw23Hz+l/0tkOZmobKVqMN0M=; b=VhrPv9Ky/buoEFuf
	vjdJOy0Z0aAS90fBmY/VcagFtYl4sj3rcq3R0A/FNIf3X0JHVudK+b2YPftaqLrR
	ZZ6td5Vfk1QkvRaExzvXiK2BwY1/G7HdV5gEOKLJOUafkSQqEgXZYCf9kB3HbaG8
	wY2HsuahYCqEn8t0QlWGDYBl+8dgeLPchC7JsJgglGtMuU22swLI/M2v90AjweGO
	aphOSNAhrEt9TaVGMbubpzJnydinZLq/x5HSKHUfsY9FtuK2gMMzWp2Ls1GLqDEq
	I5DEdnhuJbmQsxBlbEsrR0nmXK8BTUNmmb8AN3UvItkb94XjUarCHT3H/GKN3pFJ
	3YsY9w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js23jwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 09:20:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89f48d009c8so13698546d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 02:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775035253; x=1775640053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rd6i6PS13zNbPN8wfoARw23Hz+l/0tkOZmobKVqMN0M=;
        b=TBWJpMS3Hd7tSdnrENgWimGBOEkGbGXScDfEPP0Mr1RB1EEKFQRgaZb9rOzX/h41TX
         oNciIIlODAMQQEPEuw1zYMHXR2mClh2IZHcVvgutR64kNqH+k0SR5czIIJB8kHgExlyO
         7TifclXBXaWQ9JzJrgt35P33ODjEN0SpNCUY0PMfDq0yY9XCp1CJ+QYm1OWtGzeQ/kUx
         742+Q27dlSUGQaxeDQtWfDhOC5tBrTecLo1B+WdcVYVgJYMIU218z5CMbgsdKiPAYGqw
         oTyuYptMTR0az/SxOS/GGXEqGo/jFitRemq9GJgh7FPVwNHcjqFWsO4z6MpVOB41Vydy
         KV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035253; x=1775640053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rd6i6PS13zNbPN8wfoARw23Hz+l/0tkOZmobKVqMN0M=;
        b=T8U8R/RxMvf3r8ZWiPJMLOfmNnZ0Dvaq0qggv8965o4I/e86SGxMt31KpMIil1tw0F
         EapwLphQN0VgFn49Tc5wGrBHm5YvqaRlxGp6y1ndi5YcLJCe7mpUBM37P0Of4hN4yXKk
         mp0WtoRgmm3OgSINYn6fzAtUKw1ee6ooPJ7q7XslRPQCopn7ndcT6vBgVSkZE21qPCFX
         dLRT0dNrt7S/QgM7xxYk86IFyyvYWaYGoM/DYPdHA0y7BXfa2tQvbG5PWXY4hzmZHmrz
         1tz0g9/MqQOwA2UW1Hz+iEiNfxvBZIANcrDM/DD7iQmeQ0z3D51/s1W2qTUJcBtRf9gi
         1qfQ==
X-Gm-Message-State: AOJu0Yz4I2LryYvKeZ1g3+5BHBjw37yNPL/U5UNo0Fute6T1Fhn67D+R
	rfNmE/wfHoXrC9jTl/qg5rOjCmcPgRAsc40qZ+WKhTAZFORk+rzfsMdh9DfTjga4hSKpHWcNBHC
	NOLu2tTeUxyDl7OGrZeI4KgF5IX+rnZJEUHUxTCnT+sD2LUHGmwk5IzY5KIBIV8gBJAZi
X-Gm-Gg: ATEYQzzO7TaffBSbBToesAE7jdZ2PXo9WfxsHlbXqbtpgLv/XLwJ84230WV9O2PY095
	rRcXT3Mk34pzdTDpTp5xaqKz92o4UBl0mU8vj3OY7rSihH2ezM2BzWyWiesWfnohbbFInyKNhOJ
	gyG/XvMZN+Izx/6If6AFNI+2/gfDXLNHAaoLNX+LdJQsvCkXdoJmMsRZmx4gQou1fielFYTpRHZ
	lKcghpVwHyfRyr0/cIdpaIw8j685x1MnKcW78ixxrdfIk3t6i4o7Y8BnHDPq3OP3mnJaM0fjlre
	gQquJ6TMZNtZBiyROFPrr/Q9G/MxpbHU17Tx+KL/rFAuDAtyQM1yMvJMNFlQiWM5izKY5Emma6G
	Qse6n8q98+rlSaNjhLHHZ09jjnYkBX24RV1QkQUCU+5K+Q1uq3Gc7YSY/FO2BbRfLn73HOgsZsf
	vBxR8=
X-Received: by 2002:a05:6214:c2c:b0:89a:575e:ec01 with SMTP id 6a1803df08f44-8a436d10877mr30371066d6.1.1775035252933;
        Wed, 01 Apr 2026 02:20:52 -0700 (PDT)
X-Received: by 2002:a05:6214:c2c:b0:89a:575e:ec01 with SMTP id 6a1803df08f44-8a436d10877mr30370816d6.1.1775035252445;
        Wed, 01 Apr 2026 02:20:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae51ef5sm491498966b.18.2026.04.01.02.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:20:51 -0700 (PDT)
Message-ID: <e9826e27-da9e-4cd5-b368-be3e56f62072@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:20:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: x1e80100-dell-xps13-9345: introduce
 EC
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>
References: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com>
 <20260401-dell-xps-9345-ec-v1-4-afa5cacd49be@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-dell-xps-9345-ec-v1-4-afa5cacd49be@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Nr31kpg1GSxsfd9uO-P-fpPGKA4tQXcn
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69cce375 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=I76Qk8w-AAAA:8 a=JKr7C61JAH-ZL2TGNHYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MiBTYWx0ZWRfX8zLPyDjHMiIY
 I4kKMv8I7CKoMdLv92hequ+l+pcxHt0UAJyShY+H+4T39JF9N0eQtJj1k/XdmlYvQSP/yQJPM2r
 xDo3HPzYbvWxQCC2mnwxynq3PDXzjdm6zOslbvuCpy3jbmu5CydSxqc6FqALdxWClh5OZWDoi7s
 rbCG6TyK+JrdlfptZ+i37bQbODoQ9XEPTvwngZYFO1Wvf4x3w/rIEzOR570bs5D1jXLivCRAo6E
 yqJIfBsImqiOVom7VcSyLzegWmHv5Wt5fKGjG2MkR5UaiCSwZ1EcwXKOrIrQ2W2OcJP2nx7qute
 l3BHN9u0P5iSWTREHLb+0jMLwaulqTgSN5tnzJNlEVHFcvh4gsSdJi3TxJ0AJdTNswGiIkRWFKU
 uxpxX7V1El9J3glG6TtP4cl24rKF4yCA0e0d/AE30vd+UGgEeOqc02gBqqD4pnM1q2Hx3jVbMnQ
 Sw7TZK3Bz7gQyH4+T1w==
X-Proofpoint-GUID: Nr31kpg1GSxsfd9uO-P-fpPGKA4tQXcn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101278-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,vinarskis.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8FFA83779CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 9:33 AM, Aleksandrs Vinarskis wrote:
> Describe embedded controller, its interrupt and required thermal zones.
> Add EC's reset GPIO to reserved range, as triggering it during device
> operation leads to unrecoverable and unusable state.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

[...]

> +		io-channels = <&pmk8550_vadc PM8350_ADC7_GPIO3_100K_PU(1)>,
> +			      <&pmk8550_vadc PM8350_ADC7_GPIO4_100K_PU(1)>,
> +			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM1_100K_PU(1)>,
> +			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM2_100K_PU(1)>,
> +			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM3_100K_PU(1)>,
> +			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM4_100K_PU(1)>,
> +			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
> +
> +		io-channel-names = "sys_therm0", "sys_therm1", "sys_therm2",
> +				   "sys_therm3", "sys_therm4", "sys_therm5",
> +				   "sys_therm6";

nit: one a line please, without a separating \n between x and x-names

[...]

> +&pmk8550_vadc {
> +	/* sys_therm0, around DRAM */

another nit: I think repeating the name set in the label in each comment
is a little excessive

[...]

>  &tlmm {
>  	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
> +			       <65 1>,  /* EC Reset */

Is that a "this may not be accessed" or rather "you can, but it has dire
consequences"?

Would the EC driver/binding benefit from having a reference to that pin?

Konrad

