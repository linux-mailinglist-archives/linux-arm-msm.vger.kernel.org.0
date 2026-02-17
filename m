Return-Path: <linux-arm-msm+bounces-93118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHeWF35JlGmZCAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:57:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE35414B0DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D2613012C7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A8532BF25;
	Tue, 17 Feb 2026 10:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ma1/YQ3q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbnpS7jO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D3832B9AA
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771325819; cv=none; b=icC0mWMPFcKjdCjMAIuRac5xA4vT6em0v21RF7Xo96fjK+u2heeyQKG3/Y9LUiqo2aHi70G9cO3zcPfi+LwQZh4IwQi+Tf3APjoJatbmCeMJv5YYxmThS3lAXPswiGiY/L7ewvRzXzTmB8WaU2vLVQ+guKfMHdbGs9Sme8d3xaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771325819; c=relaxed/simple;
	bh=QZYHUupLS+Gm1n7arQxFjLloO9nF/zVi5QNMJK3LqvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MKCwuGSFNbqSG1cWCH/R6zArjsQ2+fgM+YKOSVeSyUJuUkMagvidZSEmtjBxI7VYAqeC4heq0I+y/IFue5yQLnRxiaMY6t3AVa4otSqfxg/6FVX/vwZbSqG+VL90Knw0UnlytetIbweXLLGoVbFsiH/DAtIC1D2DlZQrwJKwIv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ma1/YQ3q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbnpS7jO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H9Wc82985284
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JYcB9AdgA1egVr3whC72OpIrj1LCjITZa85dHRBu664=; b=Ma1/YQ3qmY3TLf18
	Gn+ErqDVtxERXfRJJViNqAP7tkcxRsnJgztNrpkLr14TzOKO3ZzORJe2mhTvUXMO
	wY5pmJRjcc8jRqZrDlxAwuCr/GqWjZd+OPT8vZK59HX+qfDBKWiZaSYDYNiE7V/1
	1QfU4be1dRBRH9nHxTlpKe8wC0W0pCkoIxCjx/ziTXuPmebhLeTc5Oj1BSpsQ/PT
	AMqQdC5TJWNkJxv3Pkv0WDCETx515kzPgzmcgbKXe+7b5v3gLBfbcyf4QDMipIZh
	NItSFYh1ju8Uu5e+egRt2i849Bkc4f+dnQYX+xWTicbIZ5lHKmzwx8BNARJ0SL/7
	xdYcKw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap1wma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:56:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8954a05270eso25142176d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 02:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771325817; x=1771930617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JYcB9AdgA1egVr3whC72OpIrj1LCjITZa85dHRBu664=;
        b=bbnpS7jOJGn9mnXhKKMpJakeWJtcQYVEXWAfDiXehibY+gUg+0aCWtgmVbR88ZzVz6
         CcwKtgdWMTgsuzcQ+MojkSMp3xpFm26KMaIyFU7qLokShBQ0H02b2Dm4YhbimSElwyZG
         vtdcWR8/IOokfMAu4RppWMOnUTSceGittctao+OHwjbCFa+QMYDBEqnOfLYMhMA361jq
         IwhXDeUni9OjZsEpwtwH4ZuCf6Wk6tZHIl0W6H/uwZpt6rFf8BPP+/LzW/3xjRapHjsl
         3WABec4Bhnxq6mmTB4XkVt2knQa3VJG9lcibApT9jmTHoD7Xyd/z9gDvlKyz+2VVJHFN
         XpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771325817; x=1771930617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYcB9AdgA1egVr3whC72OpIrj1LCjITZa85dHRBu664=;
        b=YBX1MckseDAj6csmCDTvy13F+NEway8TwmiZGmiOeb5TiIZrJS1UuK3c4DC14mOy0E
         1y13jAz1z4WilfX4n/MxdNzhBwDttEY9wRY0nLhGP/dyReGoNV1ctpunHch6Y0AvGCjl
         xKewM0/H+bRJm16C3OKNRFaQZeCjlIH7RPPvVBDgR47JyyqwX30SEU9HXDYaWSPpKxT9
         ipqz3U6SCPs5wez2V8UY9SRt2yb5ZXFyEyOV8OWwIyf27K8cP/RbIw70bGZd8ijCYyif
         Ws4JrEdo41Vq/fmIB3KCQ8jZyX/TOr35uCGU00pSPedY5arDW4ImBgfu9KohhZonzLfV
         Bfow==
X-Forwarded-Encrypted: i=1; AJvYcCXCg3uNxukBw2qrq7t0aUExUI61Xc+IK0LqMOdI7ZyBX1ij4aX2ea8qL+rRhUNyOsB/vTq6ELg8ZMUFoqfA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6YxGvFBSO5QYB6VFxpqb5Dr3ZRO2QhJ9sMoVnqHfGd8acjc9i
	ppIE/czX3WoXDrgV6pC0qfn5PcpfJZCcw6f+05JaELDKtx33mBhengeg7F1wVReL3pjPh4+mZex
	KhNuaW/K6GZu6aN84bZtDJml70qtxSCfYSiCUYq7RRog4ZfysQcIAiEh7eLN6jKJE1vzU
X-Gm-Gg: AZuq6aIyldXreoCq1C2Axmd9loiWdpvgPAh1VozQaqvj8y3hlYpZfP2benNgu1Wb9tx
	PLmMUmvChGKjtB6wrWx46mhxPJDhkNX7CEKMpAvpzR1iGR1KpYGx8JJltX9KOjVWyGtbjbmltUA
	n4EXkFe0bdprK6jK4EN/yQTsszUFMDRMvFlipZktVJAxDi5/MOcWU5lNm2vtI/tyVkeuro0rYCt
	1l4e9Esm4SmV5U7Mfq3DjbCZigon6FjaTWtZP7ZlU8XNXJTi02Wi+rCAKS4LLzpHhRsjFModKwd
	VfsdyLYsodmnedeo7xnRVttE2tlx2bxK/CDzQIw7cX4L84xtcNtPidJRmnjezKnI/zk4Sg0vVkd
	H44/odmIz1Vyg8ciOknkK79EskVEY/6ahrBan2qVZsZ+n75jusMgxkkvvGQg3Gi8ahFnert+qml
	jXbq8=
X-Received: by 2002:a05:6214:4f05:b0:897:12e:8e8b with SMTP id 6a1803df08f44-897347e287emr142266186d6.7.1771325816943;
        Tue, 17 Feb 2026 02:56:56 -0800 (PST)
X-Received: by 2002:a05:6214:4f05:b0:897:12e:8e8b with SMTP id 6a1803df08f44-897347e287emr142266076d6.7.1771325816453;
        Tue, 17 Feb 2026 02:56:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73860cesm334181066b.23.2026.02.17.02.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 02:56:56 -0800 (PST)
Message-ID: <218652d3-8b6b-45e3-ab42-93f83bf635dc@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 11:56:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-5-27b4fbb77e9c@fairphone.com>
 <300f3ceb-546b-4670-a0ae-4a6f451a7f4e@oss.qualcomm.com>
 <DGDWHX20052Z.C8JH4RXIPJCK@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DGDWHX20052Z.C8JH4RXIPJCK@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5MCBTYWx0ZWRfX/6xUqobfRZfo
 m0CtW1CfPY7uL3oyHdtJNIRPPLS0z2yPeVyztNMpWrrPVYcVAE/yQoPKrTsHRlN8Jc0ibxR8MOt
 aJSDVNgNlCdzzL527z+IJU7GUkisd48TwsxSxgIl0+g+Oime4t+ZoapiqC/WDqi0f9S2LF09Rnb
 iSEILzUFxKqe+5A0RPMHAHPtt8j6ziWfgppN4+P1fZmUBy5JD3JHA/EluWBEK3pq5rbLReKYm5e
 Nr1s4IXaVj918/OtWV1camrAqr9MpgiXdqigjCY3Sv8Yr9V3Xjrj1rlskXPNnKH27BiPcX4GiWz
 6wtJ+inVX6UtxFbXuaX+jChYoeCiVMthbjnSOJ04pRnkbEa79C9PK5cYiLZKLpF2ClUoErBw/iO
 1NkFVC4X7eYyMCYGIMiiLERzy4ZjEiv50vxIbEFn0XDg9fFgFZEG1ZEk9ShrkZbpAnBi3mfw/zt
 cmsusLxNovbKCYco8pA==
X-Proofpoint-ORIG-GUID: USpJY0HvboV2-BCEB1aqusBdsTZenmHq
X-Proofpoint-GUID: USpJY0HvboV2-BCEB1aqusBdsTZenmHq
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=69944979 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=duMsrziURTV0fy3IIjYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170090
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
	TAGGED_FROM(0.00)[bounces-93118-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AE35414B0DE
X-Rspamd-Action: no action

On 2/13/26 3:24 PM, Luca Weiss wrote:
> On Wed Jan 21, 2026 at 12:50 PM CET, Konrad Dybcio wrote:
>> On 1/16/26 3:50 PM, Luca Weiss wrote:
>>> Configure and enable the WiFi node, and add the required pinctrl to
>>> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
>>>
>>> Thanks to Alexander Koskovich for helping with the bringup, adding
>>> the missing pinctrl to make the WPSS stop crashing.
>>>
>>> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
>>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> index cbe1507b0aaa..75f2b3a3e572 100644
>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> @@ -232,7 +232,7 @@ wcn6750-pmu {
>>>  
>>>  		clocks = <&rpmhcc RPMH_RF_CLK1>;
>>>  
>>> -		pinctrl-0 = <&bluetooth_enable_default>;
>>> +		pinctrl-0 = <&bluetooth_enable_default>, <&pmk8550_sleep_clk_default>;
>>>  		pinctrl-names = "default";
>>>  
>>>  		regulators {
>>> @@ -704,6 +704,17 @@ &pmiv0104_eusb2_repeater {
>>>  	qcom,tune-usb2-preem = /bits/ 8 <0x6>;
>>>  };
>>>  
>>> +&pmk8550_gpios {
>>> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
>>> +		pins = "gpio5";
>>
>> I'm thinking how to best reflect that. Perhaps gpio-gate-clock which
>> would be consumed by the PMU?
> 
> This way of doing it already has a precedent with sm8550-hdk.dts and
> sm8550-qrd.dts at least.

OK I thought it was "new" (quotes because some wifi cards required this back
in the 8994 times).

Konrad

