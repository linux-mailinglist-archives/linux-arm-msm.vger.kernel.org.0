Return-Path: <linux-arm-msm+bounces-92341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFRTINoUimlrGAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 18:09:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ED6112E25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 18:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64E5F3019F2A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 17:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E795F3859EA;
	Mon,  9 Feb 2026 17:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nGaEvK5K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LZKmeVq8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33AA28E571
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 17:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770656792; cv=none; b=OdU72bCt+0TrXpBTNPJzmAIgx6e5CecknYdW9yQKtfuPY0xOh0FKQUfJcNl/BczPqma0oGwXz1XNp5HUEp2g1+vSVXI4/ocwhILOYXppA/yXrxg/KoVW4LnshAPMMGxo/D24XehUkOCCk15+klmB3uIEgM2DuQjw/5QsDb5Ctb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770656792; c=relaxed/simple;
	bh=UAQVw0p7nIQKtlUlnpqKnYWhhx8/FRQv7+nacN3pa8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLwulLOQLSI81p9/h0YnpLYWhi3/YKjZeDUuMiurEAcyrTzyrUqqdCD2XWGEFqAQDh3x7wTY3PyK+oVDsXjBlVaIJcj2eYRk+vQyXoTbHsiqKeMeOFsuN4fUMUNPuml9SMxB2HzQ2Poc/MKblDL6eKwZNWns3mhQ/O4zsWoA/vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nGaEvK5K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LZKmeVq8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619DF7pA857025
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 17:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gOOfRo18YOQA6z+N+sJl7m96yfWTbsEAzU89XIpFLrw=; b=nGaEvK5Ke+BSYPqn
	oVQYnadxPC+6rVkkHAnSAanFIfrr9ltkW1Y5wWnIrn0lnQLZ3eCkMj9FP0+m2HNf
	UvxYvi3ySndHTS6mLvGieUb7qpDoRh5jr5+iR1R+/CHlSRlDopah64ow95tZvoMx
	Ypbe1oxlxZ80UCSjwK6LMjgL/VKEWK3SzeT11XgVoeXJElhyTx7i8tcv3jor78Hd
	RIGk6UAzPQBx/MU0QxeD7fTj7wLRuMfjqEHapuXrh9fC40gY0/2G76BHqONuxISQ
	55lERUOQ8AlGohi0f45aQbLVC/O3lu5+Pa3AQRqMwR0OdnfrsDoz9NXg9NAz3saW
	1Q6XJA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7ga60s0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 17:06:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba7719ba86so4062421eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 09:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770656791; x=1771261591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gOOfRo18YOQA6z+N+sJl7m96yfWTbsEAzU89XIpFLrw=;
        b=LZKmeVq89aMlAlOW/ErqH6e3oDUMxqRZX9kKCiFu62A6+iQIPcWv6BXaZMY+fmH2q1
         wxj1Pj7GeMfpOUyYvr0aalVDjSnjQl4AyUZkbqMtCpc0iNNKo3C/z0B4UCryfVUNTdnz
         JiboM5feHg0hn6YllEUtNdolGSw8ppdYMLNyhtB6JSpaR+6uM1gsBHn/IpDV3tVP4V84
         Rq7pI2maI0eb/LW8s09dcRSrTNx3mAYhiLt++WTxwwhje+GbGrX7Uy5R8+1OeE5Kkdb2
         B6aWn6i+iBBtwtiRne+u7c5IVR4vTcgRQ2x7275g/DOUhfRad4WrXjSqKxkeox8F+aNK
         b8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770656791; x=1771261591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOOfRo18YOQA6z+N+sJl7m96yfWTbsEAzU89XIpFLrw=;
        b=WxXXoBx857io057ONE5J4mGE0QGoQd6cUWnGnJdZ+fjM4iHkvcc4H3BrDiC1v8V/U/
         +jZCEmkMRjHStYsEDTPNpX+gzpZHuxC/m0qCZztfSrD15lhMIThtfAak9sdA2wmP4c8T
         cG1gptAeAtNDx3BtlBIyxRHrPkAHWMaZhiqmz/Zqq7VGGDsuzqaJNVuQd4T7EzPzNUdW
         AoQZeKYarGLUcadfGtlAiRabHfPhbyd8k5/kz8Hfv0B5kAe9rW2Yo2TyH5kz+BZv+Zk0
         Uea4Hco/wtmv+4TBg3JayQzc5NDoQxQMEGRpIlW8vKBVfvwOnLtTYArBuMO6RQ0NkUfJ
         +cNA==
X-Gm-Message-State: AOJu0Yw7zpno22/nUUjIjALlzJoqKnDXdxoZtF+qZ2QU9TSnQ7TSI5rS
	M85lEslD5P3eOWlVv/QBFN4FxabTvUbWAEsUMvOiHxfO24TUpqY+WgW1Jyz7uOHwjMPJvMNNZFL
	uyp+4vGuMjAxoG0caguo6pUoLnc05H1aISun/H0WblhTzTac/96+Wg/5zgZmR35pSk5jA
X-Gm-Gg: AZuq6aKp7eU10gsBMFyPjsHki+lEUqMqqco7AdS8oaSmPernm1P4mQQ5KEotq2baUVr
	AvU8yaCoxAVbNYI0PdnxKH1WksfgNubKVJrlRseGm1y4TYkByl2goPNn7qiBcji8lvcd+gSEIH4
	jyFtv+LL9pVN429youWPUxj/H1ei86c4GYL1Sk5eMbgRtOVEZCv5kSiGA22z/QiaweLyalEEPmo
	8pdt+7GTGvcANAWemsCSq6eAGBQu6jYmEI/YUUD+CGyHoX1L8k59kZEZkv50WKI/gN5tTD+/uPH
	IHTqEAds5oHIq3G+V4EH6v4HDJUVKUmbPup48nGiFgV3q4vdiww9Gp9EtxXGJq+RWxhEhSi/tbn
	AXCVOo+vaoVnloMa7oV2yyrqyHE4hEGDk2m0YHDg=
X-Received: by 2002:a05:693c:3114:b0:2b7:f522:9964 with SMTP id 5a478bee46e88-2b85642afb6mr5813790eec.7.1770656791140;
        Mon, 09 Feb 2026 09:06:31 -0800 (PST)
X-Received: by 2002:a05:693c:3114:b0:2b7:f522:9964 with SMTP id 5a478bee46e88-2b85642afb6mr5813766eec.7.1770656790491;
        Mon, 09 Feb 2026 09:06:30 -0800 (PST)
Received: from [192.168.1.133] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba6c85831asm3091367eec.11.2026.02.09.09.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 09:06:30 -0800 (PST)
Message-ID: <e8d9e822-0482-408d-aef7-ebdd3fc87d96@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 09:06:28 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] arm64: dts: qcom: qcs6490-rb3gen2: Enable EUD
 debug functionality
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
 <20260126233830.2193816-10-elson.serrao@oss.qualcomm.com>
 <ee0fe165-1764-460f-ad6a-9633b06776b2@oss.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <ee0fe165-1764-460f-ad6a-9633b06776b2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TpLLSM35-WpA2gF8cryZzqcv6oVDt4b4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE0NCBTYWx0ZWRfX275lUajj1uYq
 uxogfGm82qjq8GwmLjkPiyYz3fNGF/N87eh5xYFH3FDip5IbHriq89FvtpoHisJC3umiEdeH+wT
 6wrPUf3RZEh2judTw4HY0V37gYWQcLuT+orvfh/3sQxtSs9HSgKOTh4ETXX1YMdqikzpCa9vk9r
 Twn+9sKuLX/ip5EBUxMjpwvQzlWVPvsaRDaPyaZ18J3C3jZvi7KMkq7ZU7+1wCYlRsnfaLG/Fqv
 eni4dS2sQaLQf/TikhFwgCZTRE+Y/1mnNOcjcUxObddjPdRdZZOQ15f7Og47wV3kVcN9FYePZ+/
 MnmBJ2fEa7qhzDZ23uwpfrbow5YptDSR6O1/bMlm4iG/8EQ/IZJa+pqoSVPPgoX3Qf4TsYflHLX
 GQ6IEovKqCHhg8D2D7ZX2VGJFh+ePB/D6/ucqcQYJFXMvwm3ivxSmqtLVWe6lU1FjQ1kLUMu8AW
 jfu+x0NMB8q2NHBHGmA==
X-Authority-Analysis: v=2.4 cv=WK1yn3sR c=1 sm=1 tr=0 ts=698a1417 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=ZzF_L4zmYv5kpwg0Tc8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: TpLLSM35-WpA2gF8cryZzqcv6oVDt4b4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090144
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92341-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D1ED6112E25
X-Rspamd-Action: no action



On 2/3/2026 5:38 AM, Konrad Dybcio wrote:
> On 1/27/26 12:38 AM, Elson Serrao wrote:
>> On this board, EUD resides on the primary High-Speed USB data path between
>> the connector and the DWC3 controller. Update the device tree connections
>> to correctly map the connector and controller endpoints, and describe
>> role-switch capability on the EUD primary path.
>>
>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 20 ++++++++++++++++++--
>>  1 file changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index f29a352b0288..2fc2d0aed8dd 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -194,7 +194,7 @@ port@0 {
>>  					reg = <0>;
>>  
>>  					pmic_glink_hs_in: endpoint {
>> -						remote-endpoint = <&usb_1_dwc3_hs>;
>> +						remote-endpoint = <&eud_con0>;
>>  					};
>>  				};
>>  
>> @@ -1176,13 +1176,29 @@ &usb_1 {
>>  };
>>  
>>  &usb_1_dwc3_hs {
>> -	remote-endpoint = <&pmic_glink_hs_in>;
>> +	remote-endpoint = <&eud_usb0>;
>>  };
>>  
>>  &usb_1_dwc3_ss {
>>  	remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
> 
> The on-SoC links can be deferred to the common DTSI
> 
> 

Thanks Konrad for the detailed review.
I’ll defer the on‑SoC USB controller to EUD node mapping to the common DTSI.

>>  };
>>  
>> +&eud_con0 {
>> +	remote-endpoint = <&pmic_glink_hs_in>;
>> +};
>> +
>> +&eud_usb0 {
>> +	remote-endpoint = <&usb_1_dwc3_hs>;
>> +};
>> +
>> +&eud {
>> +	status = "okay";
> 
> And I think it should be okay to keep it enabled by default
> 
Ack

Thanks
Elson

