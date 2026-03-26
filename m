Return-Path: <linux-arm-msm+bounces-100065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOheHAX7xGny5QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:23:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE9033238B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:23:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 814A930FC7FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 09:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0243BB9FE;
	Thu, 26 Mar 2026 09:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cM7llEjV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Th6M0IGS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AB93BAD9B
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774516068; cv=none; b=lksGpRGKw4nZaF6z1ba6E3Oc79vmfMyMBmrZeZkaJnyD6wTf4P2dWrltd2Z92S+V1e4ZdiScNs1jHyeEQ4DhaXJjyERrl8k4MvbhkVL1IPEu6CDHbCPIMLD6we+1Jzbi71KcW3x/yb8JMKxEc2LZGI8OjmFgmUDXt1YLeYbsSlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774516068; c=relaxed/simple;
	bh=nApw0kQWc810vBzMMiVPM+TGaNIYxGfE/VG104jP+ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f+dca/oolIVaP4BeWLPXQimVSpDqH5RCi/fCrVcE/+TFIuxGqszYWOjt0siiICMtC2iGAykuFH5XQ78yMJaGvaXkh1PH4khimt72FfCTE2D4+RMOK0IoDhPvS7yM0c+OD7f+UFCbBCDGFobIWPnZbJbi+Njc1YTOVVhsSpjiT8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cM7llEjV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Th6M0IGS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q8Ui0S1811858
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bPOQVGT19JgyNGrZiOTEkpfw4lSjz21DJ8/El5Wk6Dc=; b=cM7llEjV9Pqx/Ofs
	yztUbSsV+3CYEZ4anEKerucU+EooHmf2IqFcBpQscjxmHMeK3drUYBDe6e88CMuQ
	6vGwGVLNpgxCBcj7FUlyije4c1RGDZbqBuQy0f6s7YC5xriDEnfc7/mPV2SI4Bwx
	RoB6bIwV7tZAl0osH51K7m7gI7QGkxYD66tzM3gfNbHcUkMOzffMoYU7tAA5ySmD
	sCZNqMHX3fNwjrK/UfqNxjKgMAIq4gzDibkVHG3Tyk2XTrkY+dK0uqenGDVt7aKQ
	wH/x7OhTS/vC3JclQucsnUllpEe/qSPv2Q+6lLwW5js6kl6KpHS2UFECFrC2qSoG
	XEpLMw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tkn1gbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:07:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b2d15c360so2274601cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 02:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774516065; x=1775120865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bPOQVGT19JgyNGrZiOTEkpfw4lSjz21DJ8/El5Wk6Dc=;
        b=Th6M0IGSxfKCwj3AeOokEgNVcgEsAVLWAbuWESX4TO7tRr4c4aSCPrw9VITye77Q5x
         oHWpHO8fBebn6CVNGMJ4xaK5QhPaUh5+e9q3ptZSP8gOHI8Do/bhxLIPodA4mxnMdZN7
         oQM371W8R/theUvRczXfGShToe92JV2QV0UrYQc3I40f2uiXnxDv+yAegYyGy1n++4Zv
         yi5ts6idO+xVEAUDXo1TtZnjL3/rU2O39U1tAX05Z5wJriX62uZuwCRCHdFBOkViLHOj
         /RfyshjpitppwW7yFXa2rS0uZ44sQt6JuDWeU6pfwQy6xUzdx1DXPJMA+XJgDAmZnorB
         j7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774516065; x=1775120865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPOQVGT19JgyNGrZiOTEkpfw4lSjz21DJ8/El5Wk6Dc=;
        b=tNalK8aOzo0Rau+8w38gkMxnUap3mVt+lDd8vTUunNnIsUoUOJSOaG8Clw0jhPYiA9
         jDMxLYjt9i+clmZNqenK2w9Wv4cIo7K8CVnOue28452S2+5NwJhoT+7qBW9UkiJswIOh
         Qhhz8zfhPATru7/wsyDQJ7z3xcIHnvymEswhRukMgc2slaLdR0Mu+yRuiGDhKvI5ANnE
         kmAH7GZz7CwGaHpfA1yIk54OCzryII03SGS8yx3pqItkTbWQU0QwdpJM6AP72TCW3//f
         BYM+clB35BZY1FMQiRDRTh00I7+OB+oC2YOvZQ03H+0FIthjGmPx+cRphO8xkTQNl6yr
         v+xw==
X-Forwarded-Encrypted: i=1; AJvYcCVlK8l+f4AEOi7+cKoZdUOabrXtwwMeEOze3rqMHfROck45yS2VQcu14gqssqwdJo/uhEDAu9GHUQWk+2PU@vger.kernel.org
X-Gm-Message-State: AOJu0YyGVLDUguBgL/zd5q1NjAGaktAFGKEuDPUqCrlbqcx/wHo7RsPC
	SZ2X56Ih1sP5AJr267cDzpBXAzh1DcP5SW2xlim32xmrSx2tjdN7b2ho+WTB5e+BuEnBB/nj+9B
	hZhspG/KPEaJO6e5PZE8LkP5ySQkSzW83iZRc2+3FGzSKPdPxRnlt3cnygKBMsFVuWJ68
X-Gm-Gg: ATEYQzywV6debMyGrX4/CnyfAJMYGkZV4aSOnYzvQ2WrU2CfogCqJ7M0hek2YFnA4V6
	cc7+lVp4G9kZo8s1pzPVvEoY44tl7bzt7zJCyiUyKskaf6OGhFUCt/joXXTz6v0o27EcTTHf7Rd
	QSst2rA0JkRnai6yAh81LUlvn/XBe7xFEILB4gnqEYZGdeyZM/HXWBwKAdkrPHP9uFApCvodLV6
	MOLxIgFSZ0nsZOVxDvgtnAAvJxE3TRTbNhSgb1hywLZfpE9Cm+f9oxkMaM6Qs3vf4o/ZrwCINu3
	+BaWI0HUPyIkjnVIaBfyxUvXAqMbiQChvk941m8wssP/87y0uWpylsczTGUNwsHjFqB91eOz7Pb
	EmcoJP/PYd9MV4159kkFeEJKNovdnnAV0jByY23QwYiGSZOKZMTJXFKAdBc6FqKsdQSnm2f6q2u
	yRjjg=
X-Received: by 2002:a05:622a:6209:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50b80ccc148mr66925211cf.2.1774516064746;
        Thu, 26 Mar 2026 02:07:44 -0700 (PDT)
X-Received: by 2002:a05:622a:6209:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50b80ccc148mr66925031cf.2.1774516064301;
        Thu, 26 Mar 2026 02:07:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad5e3bb1csm770802a12.4.2026.03.26.02.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:07:43 -0700 (PDT)
Message-ID: <0c3c0d7d-b108-4295-96da-a261e65cd16e@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:07:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] spi: dt-bindings: qcom-qspi: Add QCS615 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-1-3efe59c1c119@oss.qualcomm.com>
 <20260325-vehement-bronze-manul-ce6bcb@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-vehement-bronze-manul-ce6bcb@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2NiBTYWx0ZWRfXwQPZZmy1B+ni
 9sODhHf+QNJonrbeEnMdrQmElcZbatmt7GNhXua33jXZFtWcJeBjp+x5WHruzehwCWgAf8I8Qcx
 mbX+hiP0tt5Oz8NeiiN2XcVc50G7tIWgfDFyPjRsEMvLAZ8Pp4HWhnv7ZA6fV8b7JviWdD36KYf
 YJYjT0U4vCUd41qQKIH7i3RAdIkxece5OTioKLQ7F8GfuUY51Cbsx3rxl0E1LQ73ka8l556wj9R
 8/5KnriROUdDQyC5P1r/2vU22x/VvqHChB/e0ikqsl51brfBMyMxRAN2prfiq2Pt6WenXvKoxel
 ZbdW4uo8z6XLfKiwnsYnnxVmLwtp8j/odtZdj3AZZyWEdyC/vFFqCePcg6BL5J9yS1Gye5ZFAd2
 hWTTsewxPVKnJzfm9sIS7eKMLJZv7Aw7vdUVGiisPq8y0l8/jJBku60nhqmeW2shuyh05xFynoI
 vxeQNlO3L+OwB43t0Qg==
X-Authority-Analysis: v=2.4 cv=It8Tsb/g c=1 sm=1 tr=0 ts=69c4f761 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-OTHMHjyIvLZNMc1xfQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: lsYgYoWfvWDo3mrmv8CJTxqq1vfSvay2
X-Proofpoint-ORIG-GUID: lsYgYoWfvWDo3mrmv8CJTxqq1vfSvay2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260066
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100065-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BFE9033238B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 12:12 PM, Krzysztof Kozlowski wrote:
> On Tue, Mar 24, 2026 at 06:43:18PM +0530, Viken Dadhaniya wrote:
>> Add the "qcom,qcs615-qspi" compatible string to the Qualcomm QSPI device-
>> tree binding
> 
> ^^ Full stop
> 
>> to enable QCS615-based platforms to use the existing QSPI
>> controller binding.
> 
> That's obvious, no need to state it. Writing longer texts without actual
> useful message is not helpful.
> 
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
>> index 1696ac46a660..d9aac33b695b 100644
>> --- a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
>> @@ -20,6 +20,7 @@ properties:
>>    compatible:
>>      items:
>>        - enum:
>> +          - qcom,qcs615-qspi
> 
> Existing bindings allow flexible interconnects, but it should be
> constrained. At least for new variants. Please move allOf: to the bottom
> (after required:) and add there if:then: requiring min two interconnects
> for qcs615.

FWIW they should have never been flexible on any platform

Konrad

