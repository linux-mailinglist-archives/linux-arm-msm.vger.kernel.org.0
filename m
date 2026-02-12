Return-Path: <linux-arm-msm+bounces-92688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDwQHDPBjWlt6gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:01:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D32812D3BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4455130523E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157ED356A07;
	Thu, 12 Feb 2026 12:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LJe4Pums";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NVuvDCpO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D4B346779
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770897654; cv=none; b=O6wcRnldlK9+Zu86k523Q6xP/0u9ayM02NsrrggztvpzhJzp/HC/0s6xPDl7jsYmrMU1fk7X8XoqM5pnCrkhwDb0ROTkGAlOpahba4yBAaIKHac2jg97JIAlm2A184WvS9N3UJ6HIxLdzyOYiWVJYwGugsshi1zT2Io3p1j21Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770897654; c=relaxed/simple;
	bh=OWZENebKCTjSmzhqII3y6zKPVBx69Nli1I6HnMPTS+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bRO2chrbZFqlPd77WJ589i1vPViNQmf4qA109PNswEbfmFO0XQPzSWq2oypmrt1PjjC0NcKVljKgcwQAVpW8CcTHEMMZgiY3f4u+ZvGFcGjsuSjaYjZGzGgf8e0Jtdebf3Mfu9RuAXAA4xt+q8Fyn31QcovoTCweDsljfF5vhv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LJe4Pums; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NVuvDCpO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAIfKs658569
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rY3BcqGcx+HKrGNujocQj7i6AL6VD8HyW3fcDxd7ptg=; b=LJe4PumsDlTG1WFY
	VCTSPEmcYXocjplNMVdm4b0OL1P3KZlsXUKQWrnhNG4DM40qzTQJD2NOjwoEmf2o
	FM6Tfe7aBZy4QDbB6i6xFSNziHwM5G/bhdyO8VYTA686A49n2TQyZxZmW3jSbRBK
	MgC7ASy5zXauKTWzu5sEJLdgyRrCCgqDGulAcLi+qiUIS5IzhNDzX6+DE8pmttgZ
	ujxzCg/HWHBlN0MRP91+ucSwP7BLQalprVhhVXeQAAQR0TBkRbxWkYSVMXqP5vvI
	ExwuM/sY/MkcIrOBHvcRzCwEXHRioR+JHE4dYqSTQvTVlFq+IXLIL6cuyxCHsLmI
	cAJVIQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9d09g99x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:00:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50335116a0aso29412951cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 04:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770897651; x=1771502451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rY3BcqGcx+HKrGNujocQj7i6AL6VD8HyW3fcDxd7ptg=;
        b=NVuvDCpOf2lnvq7/ZE5GERi3lVUqRQwQZCdpzyFR7DTwrSz7gmnn5ZxObiA9PndtOP
         C175B4AnVq3eKEdn8RfCPUUZqfpuEw/eO8joby/3c/EpMrV0WRYe3piAFzKAFlLhxzD+
         kNvR1yoaeia3VDm2Xf4mXnc/D72OiHojTwkSrYVzNToQz46Y0yiorMM0G+NxsDK/KlfM
         J8dzbunLN8tS6dUKQR4XMBdOluhUZLGnTZgh45isD55zLLRQp0j8x6f4DbW/a7iXMujL
         6qs52py/leaLJsbj25jGjguq+Pc3y4wJ/y3LlQTBUZIV2mjnVwOhyaM6/aNP3JaF58nP
         kBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770897651; x=1771502451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rY3BcqGcx+HKrGNujocQj7i6AL6VD8HyW3fcDxd7ptg=;
        b=hoa++RpY4KETd1uG9z07sj4T36dbkhKtaN++wp0e345nQeEijothjsAq84MJmrU84+
         1OEWlh2GU4BkS2PQCHf1SKYpq1liP9Rp5e11951JPBPDtDZ0gSrFgoD2o+wzuFJMg+Pd
         fj1NJ/GC/4sMsd+niyDvrCw6Z0VJjZo2HTM9UR+fFt7AzF5pZ2NiYA1/wALADsrtsBSA
         n5nO0jHZY/hBAjaK2rI622Vp4AeznDHR8T/c+L+/tJrow7r6cuqzmGfVDYvEjlAs/e9j
         L4LJsm4mTWrDnbIjv9Ux7EP+h45T4QCdth1ktnHzfEDACeOS/je+Qzdd+lxELrA7FL4T
         N8lw==
X-Gm-Message-State: AOJu0Yx4CJZUz1nitkm+SgI+nicV+oJwZMoU/iJv2q6UVgn/ilyCU8Ed
	CUdYp/hf6rm5/+Dq9ZNXbtWtXcxQxEdWgU4W2ah4oAk6DPCftzOT1w5Al8m15I+M3751b4KWnJl
	oJIJQNwjrFtOpus/J2RMSVGIrGA3IQnXavJif1tw2m2IAaoLuDCQQ8v5Mb0irrMsu54fu
X-Gm-Gg: AZuq6aK1dSMEyvZ9nAsla/Uwl1cYOJqREmDLNl+p3jWbRNoGbqtV7U5LTsf3ZMQKrsG
	T/pGJMErrBhEp3H91t1qq05FJMUOcK3f+Xr5G3lNSaZICXWuc4+MMWy0Pqd7dWaIoyQhdFdQwkY
	Nm/5dy5Yd8pvC3f2rP83dZmFmWMB3bDIA3vrW2bHgsGPYhoTyQXeXLeZaWX4W9nzsLiXFTLBj+s
	K162VwBVl+OTlOZitnq/Mqoz9MCHJ+4HdfAJcvNce1xzi7jF27cLmjxFiAmjxY9H22G1OWPlBEQ
	cD4FDOiWefwW3+zHzqnVYzf209xEv2+okgg12RmppaHkQjy0RzU5v2hqb/za5htJFI4JnOwojTW
	bs0+VjSYZYDdmFSowgEdfT8obXThecyF5hY12gCrxz+fhbQoaEO4Zts3IPXu2BKotpci8M4bQoL
	4lBHc=
X-Received: by 2002:ac8:5d87:0:b0:501:46db:6b18 with SMTP id d75a77b69052e-506919f7801mr28295721cf.2.1770897650768;
        Thu, 12 Feb 2026 04:00:50 -0800 (PST)
X-Received: by 2002:ac8:5d87:0:b0:501:46db:6b18 with SMTP id d75a77b69052e-506919f7801mr28294871cf.2.1770897650036;
        Thu, 12 Feb 2026 04:00:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ecadb32sm153793766b.64.2026.02.12.04.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 04:00:48 -0800 (PST)
Message-ID: <fb7028cc-f27f-4a4a-8001-f862a55ea528@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 13:00:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: arduino-imola: fix faulty spidev node
To: Riccardo Mereu <r.mereu.kernel@arduino.cc>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        srinivas.kandagatla@oss.qualcomm.com, m.facchin@arduino.cc,
        Riccardo Mereu <r.mereu@arduino.cc>
References: <20260210103933.27228-1-r.mereu.kernel@arduino.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210103933.27228-1-r.mereu.kernel@arduino.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA4OSBTYWx0ZWRfXzM0pIrk51IAz
 re5xef9P1G81jippnCHt75BoUc9M3+pE8qSXmWGWLYhj1galnY5H01moE6k4kKQIYrDojXhvwi5
 T8HQbMnXmusnauhSuxs0EDARXUJ2CAKKCsCmRKXgFlfB9h+xyKjPNZAt0YnXOa9ybR/1jayxfkb
 Az1qTsiHHoSuTVjj6yqfMFWYukYVT2A5fV48SNNxr/6aM+dWLRpU/ssX//mbDApIAIhVhvmh9JN
 HvWUIkJACW9WjpOsUPHI2pPyLmv0q/74sWmyCB64+LIF7T4omGoTlLo1H3xXNEW1Xc72QbT/tPi
 bVoz7fXABdMqA6x3vJEJdOvGXYKaCw0VAstww8yDCLZLSHd7WuNYxVjFoCDjeSLtpreDh1noAs4
 NcaH39iN4vPlpLv//hje7ii1sU/MsW+LF7mplb5n0JVISUjKekfchiSI93S+utX4e0THYS6GJ5t
 6aYuWd2wJDEEU55kqMg==
X-Proofpoint-GUID: XsDe2XKxLf9B9i8CYiHoIekvlZg8RyEr
X-Authority-Analysis: v=2.4 cv=Y6j1cxeN c=1 sm=1 tr=0 ts=698dc0f4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=-2c-_QecJCVN0InAuo8A:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: XsDe2XKxLf9B9i8CYiHoIekvlZg8RyEr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92688-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arduino.cc:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[r.mereu.arduino.cc:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1D32812D3BE
X-Rspamd-Action: no action

On 2/10/26 11:39 AM, Riccardo Mereu wrote:
> From: Riccardo Mereu <r.mereu@arduino.cc>
> 
> CS pin added on pinctrl0 property is causing spidev to return -ENODEV
> since that GPIO is already part of spi5 pinmuxing.
> 
> Fixes: 3f745bc0f11f ("arm64: dts: qcom: qrb2210: add dts for Arduino unoq")
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---
>  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> index 197ab6eb1666..d2c3359dd814 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> @@ -328,18 +328,11 @@ &spi5 {
>  	spidev@0 {
>  		reg = <0>;
>  		compatible = "arduino,unoq-mcu";
> -		pinctrl-0 = <&spidev_cs>;
>  		pinctrl-names = "default";

You should delete this line too

Konrad

