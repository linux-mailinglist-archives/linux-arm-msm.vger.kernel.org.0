Return-Path: <linux-arm-msm+bounces-96494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLlCOBeor2l2bQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 06:11:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 628E224568D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 06:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 520BA3037F24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1334E3CB2D1;
	Tue, 10 Mar 2026 05:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyUvaech";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kl8l+eUq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2833A1A2D
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773119509; cv=none; b=sEn9I+nQbgUivbZ1wMgqhtKP31QiG5OhXriU8Rl2MA+FicXx7ruHBhSj272Ev51ou4zlKyAqa1otZTCJYIsMauMfQwrgCTiPx1kTzYtSMmGKPqnm8wgsq6n7Bt/vKHm8fqnsomaqbrd8EHUaA9TgHtadTPxATFm7KTPOVrnnCys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773119509; c=relaxed/simple;
	bh=49k2JYtsnf7ziSsTGGdu59UmXoZUmrnDgr6atmQpXuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KBWg4YGQs6X4ZP7gp4dIbjL5NlpCmfrW8vYJrWy8KsgEd30FwpZ7Ed6xnHjjJ/qhoB0r2dQv1kYPqC397bRrHzMQP8GGAIG4770Hvv25O8H7ZuXZmfnsg/4EzAiIq1p3UpFQTlcN+KwXAe9h3Ep884y1vIKXPsbcdBZF1nXbBSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyUvaech; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kl8l+eUq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EVo22373298
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NkGARjqj+Jeqme41PH+6ixPQqQXLr2hQRuQP+hpKLGU=; b=eyUvaechvDNubcme
	mKaJLCyl34W69xqMkLKGHNn81ToTCEedkPxGAUJw9zw4X9kI54sGabOiHjZ9Us6R
	qRjTnn/ZBN0pcuW4+RHw5gzP9VCBKx6LwxRCYYUmM+63sS3FH2+0BDD+q4wghAt9
	+MbdxUYOe3B/XynoCt/gz8c116gHUMupguO+XTTzttzNcfZXHdM/bJqVTquNkKqB
	kRUchOPZM7zzpbSrs/miVx0RZQBj4misrhQKPjuVj3cP3aOwgXv1zUtbiUA6v3hl
	2HXT0eOpSfx8O+rUuzeWDKI5wvWaRDpmm+oB4wp7FUvyzK4fZumFCWseWoTEvs5c
	lVWApg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkk05t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:11:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8298c733f52so2011250b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 22:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773119506; x=1773724306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NkGARjqj+Jeqme41PH+6ixPQqQXLr2hQRuQP+hpKLGU=;
        b=kl8l+eUqtXU6PDI/zjNYvzGjEkpz2jc1zy+033VL8tD3DncSXa5NJXC3NxLkTwdwgN
         InFqdG7FfNGtHB3HA3bgYfK/13lSAtqqdq91lCNtNuOlCMpOMW1L6lJ4aTOaMxqgtR7r
         IoF914qL55s8Br0keu/NEUGrIikR+O0Vq53WhrXEcsPwCUHHRsNdEr4kv/f/QCgrXQTg
         jeqrAWvg0Uq2NYtAZ3Mnp1tx5kA5w/zrH1sKnoUa2A9bBSiW/jqh7aESIPNq3E/BiBv2
         IvvhrP6syHjiZEZj4dEJTVUjAhMZkwAr6MiLdYjsBdfVdeUuvB18eTNEt3qh/BmCVehM
         kLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773119506; x=1773724306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkGARjqj+Jeqme41PH+6ixPQqQXLr2hQRuQP+hpKLGU=;
        b=kaEkcQV1RWS9Q9v/cAy/gDrGXlZbZjDiqKTV6vuxduXdGyWvEmLP40GrtHfCZnMVld
         1X6CKjFsYgvdR3Ve2t5WMAWq9CFF8RR8VskdzMnnD+Qh2FQHwxOGzPDR0W4gUgr0Zt9T
         IvTWisvPe8sGkRy58Jv4hK6ZKjRlK5IN/XUGdGTZvSuyjZNzFhrm63I01fyPw23HT8S9
         jlpUJsrDMeYopenUmOhnCEM0aErRBUtO8aPR4N+FUYu6r4aOkskP+mHQixZUMZ46HkuT
         7Auc9h8GoesywEGWQs9gvXWTvs5Dps/Umx0WwAuS+T9U9XZiim2q39oBBB3ezX5RkQe6
         hblw==
X-Forwarded-Encrypted: i=1; AJvYcCUyOymk3boC38tHZqNh8n711wr+YO9e9G0VjlFD0mQnn6vZGa1/Bk4WCtdWVz8xKKaj/Wb1X/1oYAublP4y@vger.kernel.org
X-Gm-Message-State: AOJu0YzW+NTcqwQgk79FI9/BLDdKOALUYLdInITjsaZCdzQni/eq6T+u
	T+Gv0vJkQa+gjEaSBMdMNqYa6/GW6gZNAAFoqBRFJ3YPbbyW+Z8oblR/nl8+G9mwIfADAcVX3Sf
	uRoMdpCOghpTfc/nkvjh+hZqUsnh2F6Y0TbfjUNEe2Yu+1Hfreb5qFV6Gm0KUZmh0728L
X-Gm-Gg: ATEYQzxdvEQhMFg30VN3f1CtBLVPSzkqeCdx+j1IlhmynmgZIHtlt76LZKtwCREhH5x
	YXVj/GSNjnQdY0Dj/gQeKFwOxIFpKvsBGafusX4bbitNGvJ+iTi98/BSWABbAAVApHgXRKNw4Co
	TZ9Wk6zA/P5H6b+qF/0Cl4aGa87ZD4VQtChVZko5qgtQ8chDVudD207bkJvuF1QUpqe+X9bHI69
	/JL4jOCrk6nineDOJBj44CSN5RMbZCDS37kesYkoFfmxdPF7JZcM/QknMQWiFN0tNiRjt5TaA3O
	7//5nOk1xxWsgnsVexHzp9/dfGDRZiMyC0Avtcs6xT+XfHVPmhbp7dF28tQrCroTMoGOQ/T5Qhy
	FK2dPKD/JnYsOvQ68EURehKDbTn4ZS8K9nKERKEwYz57JxGzkVZA=
X-Received: by 2002:aa7:8891:0:b0:7a9:d8a8:992a with SMTP id d2e1a72fcca58-829e3f527c0mr1668960b3a.13.1773119505483;
        Mon, 09 Mar 2026 22:11:45 -0700 (PDT)
X-Received: by 2002:aa7:8891:0:b0:7a9:d8a8:992a with SMTP id d2e1a72fcca58-829e3f527c0mr1668939b3a.13.1773119505023;
        Mon, 09 Mar 2026 22:11:45 -0700 (PDT)
Received: from [172.20.10.3] ([106.216.228.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48d6985sm12205366b3a.63.2026.03.09.22.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 22:11:44 -0700 (PDT)
Message-ID: <0a467462-eadd-4f7a-886a-d25aca26947e@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 10:41:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        bryan.odonoghue@linaro.org, ilpo.jarvinen@linux.intel.com,
        hansg@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-5-sibi.sankar@oss.qualcomm.com>
 <20260309-festive-prudent-ibex-f8b601@quoll>
 <ff241b01-c7f4-433b-a822-c5cd14e3e696@oss.qualcomm.com>
 <3eaceb96-003b-47d2-9ae5-bb676dde0240@kernel.org>
 <ad3485df-5570-4631-9d6e-2f0b90a47235@oss.qualcomm.com>
 <jcjspcef7v75btwnhjzgsqndw23j3k7jyhnacxzwridjdkyize@slpzcxwyntzd>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <jcjspcef7v75btwnhjzgsqndw23j3k7jyhnacxzwridjdkyize@slpzcxwyntzd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69afa812 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=8nKWbjjLc7jCNgWBIcU1Yw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JKISxpa1xdn5d-WQYaAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: FcGM1DHZlzQFQVJf0AkdRz_2XsKB46AQ
X-Proofpoint-GUID: FcGM1DHZlzQFQVJf0AkdRz_2XsKB46AQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA0MCBTYWx0ZWRfXzdVb+ByZHCpG
 KKaW4Qc164u98pCybmhYeAee+nUvEgpmRin5loeQUtlNlEcivbHthlq/X20k59eW5d7opYYb3ei
 /LicgFMqaVWa3WUcYVJP7+INqJkINdPnpdXsjs7/SFvecLN/NIfapQfuBp1KPZEUsmlFn5EPCRh
 CRedIFozgbj/6K2GQyVWp7w5TSVnuLnxfH9fJ5cp1gjJomQxk3CoSzCzj9uQQ53vgwCIf1SQq9Z
 oGcKhbPfKF3a0T42MBYcgKZ6n+gUSiwMBPI19U+xv4yKs+XE2TS75nsbtjl0xLLgP2YtNbsJ6bV
 pNPMFYB1BH2xnK7dug2EQrJBvSfqIoPugFxxEdaDeUKema72Ij9GnwIepNF0aM+hLhAQZzNJ2zU
 s9I9tdjAc7sbGv26j1eXm/1T/wiMf1ZMU9TtJYG5I5Zz0bdKp5nAsw5LBOis+fV914SESJTxckr
 haZmOMumFB5AfLnr5fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100040
X-Rspamd-Queue-Id: 628E224568D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96494-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,4f:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.76:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/10/2026 2:43 AM, Dmitry Baryshkov wrote:
> On Mon, Mar 09, 2026 at 04:21:50PM +0530, Sibi Sankar wrote:
>> On 3/9/2026 2:39 PM, Krzysztof Kozlowski wrote:
>>> On 09/03/2026 10:03, Sibi Sankar wrote:
>>>> On 3/9/2026 12:55 PM, Krzysztof Kozlowski wrote:
>>>>> On Mon, Mar 09, 2026 at 05:06:45AM +0530, Sibi Sankar wrote:
>>>>>> Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
>>>>>> temperature sensors, access to EC internal state changes and suspend
>>>>>> entry/exit notifications to the EC.
>>>>>>
>>>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
>>>>>>     1 file changed, 16 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>>> index ded96fb43489..29a1aeb98353 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>>> @@ -1042,6 +1042,16 @@ eusb6_repeater: redriver@4f {
>>>>>>     		#phy-cells = <0>;
>>>>>>     	};
>>>>>> +
>>>>>> +	embedded-controller@76 {
>>>>>> +		compatible = "qcom,hamoa-it8987-ec", "qcom,hamoa-ec";
>>>>> I don't see updates to other x1e boards, thus my arguments from v2 stay
>>>>> valid. It's wrong to call it "hamoa-ec" since only one Hamoa board has
>>>>> it. All of other Hamoa boards apparently do not have it.
>>>> Hey Krzysztof,
>>>> Thanks for taking time to review the series :)
>>>>
>>>> What other Hamoa boards are you referring to? The series
>>>> mentions that the driver and bindings is meant for Qualcomm
>>>> Hamoa/Purwa/Glymur "reference" devices, so it only covers
>>>> CRD and IOT-EVK. It definitely does not cover all Hamoa boards
>>>> boards like you are assuming.
>>> hamoa-ec compatible implies that and that's something I raised in v2
>>> already. You need a specific compatible.
>>
>> Hamoa/Glymur reference devices can have different EC MCUs
>> depending on the SKU. This introduces the need to deal with
>> possibility of quirks and bugs introduced by these differences.
>> Hamoa/Purwa CRDs and IOT EVK runs on IT8987, while Glymur
>> reference devices run on NPCX498/488. This pretty much was
>> the rationale to make the MCU part of the compatible. Anyway
>> I can keep it as qcom,hamoa-ec and qcom,glymur-ec for now
>> and add specific compatibles when we upstream those boards?
> Why do you need a generic compat at all? Glancing at the database, at
> least the following laptops seem to have similar protocol (I might be
> wrong, this is based on a very quick glance):
>
> acer-sfa14-11
> asus-vivobook-s-15
> asus-vivobook-s15-q5507
> asus-vivobook-s15-s5507
> honor-magicbook-art-14
> honor-mro-521
> hp-elitebook-6-g1q
> hp-omnibook-5-14-he0xxx
> lenovo-ideacentre-01q8x10
> lenovo-ideapad-slim3x-15q8x10-WCN7850
> lenovo-thinkpad-t14s-120hz-64gb
> lenovo-thinkpad-t14s
> lenovo-yoga-slim-7x
> medion-14-s1-elite-sprchrgd
> medion-14-s1-sprchrgd
> qualcomm-snapdragon-dev-kit
> tuxedo-elite-14-gen1
>
> I assume that some of them might be false positives and others will use
> vendor (or device) extensions to your protocol.
>
> I'd suggest implicitly using "qcom,hamoa-crd-ec" / "qcom,glymyr-crd-ec",
> because then we can use something like "asus,vivobook-s15-ec" to
> identify the EC on VivoBook S15.

Ack, this was the consensus reached as well.

>
>>>
>>> Best regards,
>>> Krzysztof

