Return-Path: <linux-arm-msm+bounces-96975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 15m/DoJksWkZuwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:48:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87243263D4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B0A2E3009390
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 12:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB0327A476;
	Wed, 11 Mar 2026 12:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CEFaIkWP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HvwrFhwK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9753626D4C3
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773233276; cv=none; b=P/5smc60ZUpMENLYoljIDb7gO35eWiulEJ6pZbltqgiQWb85Mr4NDBVPk8M2gOlaMbz7vXbLaAOyGp0Qzj5ZebkqNH58QCYU1oGPel7469ZLrlRdunNRVv+HQdVNtk9bHpZSNa2jpg8rgr/mLYfHNtgxq0aNY7aqnbfhuSeqiN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773233276; c=relaxed/simple;
	bh=1Psjk2nRaHfHDd8xvc4KgUjjkgHuvgedYWJ7MpRosLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nXRAl6/gngE3scMu4xd+DIs6cs7z6/oRikkW9EODVVp+K5tsbwj//noF6EsdKi/mKaxkRYQshsdWm6PkIwHtA5iMN6qNjrJ/VI/VPm6JEEQjml4pJ8O+Ax9cA9H5WHeJ3kTr+F92xa+pWOxPnc0mlAr83YpZOl9/siqG8aCDWjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CEFaIkWP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvwrFhwK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9x4A92179348
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Y2CHFwj1sgN4QWWRsY4MppwS3vloHKyBvjpPhe1hYQ=; b=CEFaIkWPEoRifqNS
	H8nTnMFU+83FdF3a/oOL7udbSYymg9pyZTKcOXbMqnAenMnvQOf6vbNXhV2FSapA
	FN7o+TGY2AjtS4rQ85WOsf6sMb/CqWiwsUwxlsfjFEul/cGbf71PXxhllDcrZFsE
	SURVgac13cHiBsPJIIkKafEMzzqGU2Z/g8ewsQYvtBwEGPDmN3fsoEqcbpy7IEfS
	ovg4vBcKoTeHKka9Ih778yij9Nu/fJkzEC0VqqOwrFyO117mg7J0UFQFkidtiLTq
	KYOEd/dNDQgDT5WIxR2FrAU/YHYT1yoBlIUXnE/ncSSNLjDSAT4DFWyLdGCiZp2T
	NTPsXw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqvsujfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:47:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a086578c5so62301306d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773233273; x=1773838073; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Y2CHFwj1sgN4QWWRsY4MppwS3vloHKyBvjpPhe1hYQ=;
        b=HvwrFhwKCEIfZayOZYk9VLoFFHo564YYR/NzsxxrVVmBk40vXjVirdk+yQlZMIg0yk
         joajnVzrAabbD4vBFGGIvvfkr+4zps2KQqrXloLKVW4EiMDuBTMbfYZL4jddNYs95HqI
         lEkWdjFTGOH5hnAaCTBL6SqxZm1QhZagJLfSXwooPOZMmvwqm+3GYZXHkz9xiIECvLbD
         HECStBrCB9sbJDTOiJMDqwS/7AP5MidVuR8XvWw+uPnVm6U378MFe+fLIn7i6ufFbwBx
         mJi8INeMBNbBvLgMzOmQ0L/bvq471WJAT68md3BAOaCiED3T3nE8cfqCRw+PIetFQsSR
         42FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773233273; x=1773838073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Y2CHFwj1sgN4QWWRsY4MppwS3vloHKyBvjpPhe1hYQ=;
        b=tJb2debYcUO1/WKOdoosUgZO/Euit0C4EAcrtmQ9+gLSSYJ4lCNkd/bZlKw/kDkPXy
         h1l/lGmo1oNcPz+a6wSneU7EDFtJPw5PqrqlTtaOaUuKOo2mxhK6Nsf1TG+WxspCfqGX
         bdb5+fkbmgVeRF7L2ncYX6ieQuRmgNDcIS4YIbQtPkPSQ87NsqoP2SlG6Skt16j+bor/
         LzzJXWd5gCZe8SK2sNnqYWHu4nseaLsU8ov/0U9EqBf3uKJSMBI8k40bdMTGQhhBFqQw
         A3mK29SbHu2EF+q385Az92sNCup3TmMPLwWoMPUoLKmBpeUqzNrwJ0Lei+B66TaDNAfp
         on3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsK6UKSUIpthvIOhlPFSpfO1dRwXL15ZOUOxYYHtjx6BYzPpyZUnat2WOYimOJis5DpHdtlNtpPsYOmgFk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj1mpk1B/7rSoVSB2vPXwSBTYu32KJT2Ogg4zDpMMBtxec1X55
	Tu6hE0kDbySwSBIhr+nLi+INBSuXjEcFxpMEEeQvF4QEBSL9Z83SlEvscmLD5+4NScfeE+CiEEB
	dLPpUeO+F28PVi+5FeCZSK9tC9lVOWVfq+e4RGsCwPkudLWcDed84rOVm2PRYEvqjaKML
X-Gm-Gg: ATEYQzxig6baFLxCREpOqqJ506OxcFafXbnoqeNcEmUoja8Jxa5MkScGSRWXi6d0v6E
	PGY98GqtUMIw/dZ9txUlDSgTGB3xP4uf8Pp7T3MtLCM8MXpOsIi/BZ6AOT/XyQNJnp9p94c0Md8
	DendQ2s/vq7sOP60LczXkIo775yH2VMcTlKHznUxKp8xYwnmmfkgqlEUOanR1gfvMempMupHAJU
	xIg5pXNEx1C26uMdZvlc4YPUF49n5Edn6FUFFu9q/vnXDWq/bqbhTD4cVCLZOxfR27h/okbj97T
	OOoOMKYiu5tQ+/7i1JbUSD5iN4jP3ReVy4ioCVL+an2EzW0UcbulvgbqyN3Yj0/ZylyV/ZlmeKR
	go59W7jr1irZ0yV7EkQZybacBBMweFPUMV4ufxpYBrr3KwAU13PdeDeDSeLKIUW42W10Wm8f0lU
	jqWEw=
X-Received: by 2002:a05:6214:4c47:b0:89a:5129:510f with SMTP id 6a1803df08f44-89a668804b8mr20351676d6.0.1773233272920;
        Wed, 11 Mar 2026 05:47:52 -0700 (PDT)
X-Received: by 2002:a05:6214:4c47:b0:89a:5129:510f with SMTP id 6a1803df08f44-89a668804b8mr20351296d6.0.1773233272292;
        Wed, 11 Mar 2026 05:47:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de4795asm53950266b.18.2026.03.11.05.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 05:47:51 -0700 (PDT)
Message-ID: <c58b9a2a-8de4-4831-be69-33b158052f54@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 13:47:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 touchscreen
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: cristian_ci@protonmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-5-aa2c330572c0@protonmail.com>
 <f6029a8f-07d7-4872-813a-ff98fd11b5af@oss.qualcomm.com>
 <6ddgxby2wzaa7mfbc64a4ld2rdbo6427csw6blzg5alstvkfv3@usfqftgctnzs>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6ddgxby2wzaa7mfbc64a4ld2rdbo6427csw6blzg5alstvkfv3@usfqftgctnzs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEwOCBTYWx0ZWRfX/GEzM3uhZgOp
 wrPI8vB18z8DJkwVNvneAOJFk/RnsOSEVkqsN7nTWD2M+eOjTnBungMMZsVa2llq9QWm1Fp7krd
 FF6jDA4JLH2F4OSpCKRPWaUf/xaQqVzn6porbOzTEW+24b0qEMrxHo4Wya/mq7EcgO1l/L2C67X
 ooA30396wp82KPN2cgAvxD7lNXYmUb2xk8Y6UjoTOzSahu6Weu8yJCOrjy2FVKbPIKTa/V/X1XA
 WA9MORtVqDN/td5vvDzoDpw4Ox6+6qc8u01Yghd3c1A0OT8WcslqVTKcFMQtoc3A90ryoZSPf2X
 +M7DGcfIN/bXC3/SfsPTDAFl67jdtFShHMQ4aMU/YAFR2h4rLB9vTltllTC7OFroRnEv78ZVr9C
 mCjJgZP+tXKnOMomF5hcCWCFUuvX/KexE92DHboIKcmzddGI39k4SplREmgpgWjc8sxaoohenK3
 0HBZA9EidF94C2FkBvQ==
X-Proofpoint-ORIG-GUID: 7wKlzvFOWY6X2V3IOds_M2mC8GS-9et0
X-Authority-Analysis: v=2.4 cv=Lo2fC3dc c=1 sm=1 tr=0 ts=69b16479 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=sfOm8-O8AAAA:8 a=Qi8LA-PbnRB-KSu4gE4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: 7wKlzvFOWY6X2V3IOds_M2mC8GS-9et0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110108
X-Rspamd-Queue-Id: 87243263D4C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[protonmail.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	TAGGED_FROM(0.00)[bounces-96975-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,protonmail.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/10/26 11:49 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 10, 2026 at 02:08:40PM +0100, Konrad Dybcio wrote:
>> On 3/8/26 4:52 PM, Cristian Cozzolino via B4 Relay wrote:
>>> From: Cristian Cozzolino <cristian_ci@protonmail.com>
>>>
>>> This device uses a Goodix GT5688 touch controller, connected to i2c_3.
>>> Add it to the device tree.
>>>
>>> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
>>> ---
>>>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 32 ++++++++++++++++++++++
>>>  1 file changed, 32 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
>>> index 7b2849405462..709ea6fc9fbb 100644
>>> --- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
>>> +++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
>>> @@ -94,6 +94,31 @@ &hsusb_phy {
>>>  	status = "okay";
>>>  };
>>>  
>>> +&i2c_3 {
>>> +	status = "okay";
>>> +
>>> +	touchscreen@5d {
>>> +		compatible = "goodix,gt5688";
>>> +		reg = <0x5d>;
>>> +
>>> +		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
>>
>> interrupts *and* irq-gpios sounds wrong.. and I think the driver doesn't
>> even consume the former. Trying to read through some of that, I think
> 
> I think you need both, take a look, there are enough users of
> ts->gpiod_int.

I said irq-gpios was necessary, interrupts is not. The only retrieval
happens through:

if (soc_intel_is_cht() && ts->gpio_count == 2 && ts->gpio_int_idx != -1) {
	irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev), 0);
	if (irq > 0 && irq != ts->client->irq) {
		dev_warn(dev, "Overriding IRQ %d -> %d\n", ts->client->irq, irq);
		ts->client->irq = irq;
	}
}

Konrad

