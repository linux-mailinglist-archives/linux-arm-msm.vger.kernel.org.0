Return-Path: <linux-arm-msm+bounces-118082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AeimBhnrT2r3qAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:40:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A46F97345A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:40:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="WrPTS+/o";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VLhdYCId;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118082-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118082-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 39D04303B695
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 18:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA684DBD7E;
	Thu,  9 Jul 2026 18:40:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F964E379B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 18:40:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622412; cv=none; b=uIpbnA5p3RJhpzQ4D5/n1HQyVCLQKm1YXoehHbi918dLj0E+h4bsOrWjgIqBU0/H+UTFLFKCG8UJhkVi/PWCksUHOWQNmdJXGTXC12iTT/cinfuNEqpFuXjWWp/X8M4JQmK8DGSneC2ri774dTIrvrd7IEUU8LzS3LGIBcjq498=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622412; c=relaxed/simple;
	bh=WoPszd7Zul2Xee86XmDdTUW/wVdb33H/coSaa6iqWK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGl62sUw93rB6/9z5d8v8ZLOJ+h2vrq3R1txRmndgt+Lfa1hFXqY029FxLdnyn5Umv+F0srzmIQygoYRMDGkry9euhyltvQsS1VfoqsnAy4XRr42BqXDEdBuLbwQ6rMedtWv3fVss0RG9YjxCSu0eHQrAPRM1iEvVZXYIMppFx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WrPTS+/o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLhdYCId; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HWsqX2563432
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 18:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TvK2VkyfSoUSm5eKmSxUVkwHEdBJLPuUeqmWYrwjAH8=; b=WrPTS+/oAADzAmil
	SMnElwQCyzkotcOL+CyukSHrM2kCzCrEH9g7N5OQFQYsib2gnAGsetKWWbJNhn7i
	5c6gFEo+M9mNEqtPA/TA9/PZV2+8XD3wjMOj6oMoQQZ2CY8l7PetlPSfI7MrKvxU
	2R0Yq2kYvoAPiOrwVlQ7P8dHozT22Jwb7FBL8tr/UW47wfj9PKrx8hOH4CPzLTTU
	bXZOhL6KhVcncjEKNjzPyzpKJGOFLQxVKmuVpioohh1bkaI51Cck/Z+mCdGdGfYy
	fXsD8W+/F5goe6542LcbxLbSF2e1NHQ4QLCYjGFExQM3ghFaBAjrZYAxtnpQk5lO
	gpwcTw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3gwqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 18:40:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c9e97b626so284741cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 11:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622409; x=1784227209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TvK2VkyfSoUSm5eKmSxUVkwHEdBJLPuUeqmWYrwjAH8=;
        b=VLhdYCIdb7n3v8Q0PGPZjDktoFymWlco3rbquHsfn1oWpQyu2LIx9gc6Kk6obtJUMs
         ic60yVjLwfiMfj9fjc2GPxEqCOzixr4amFiXYvxV8wiYrwNcW7KoxJttfcUKSxwYXwQ8
         tzfv4FYoePnpzxn0DfdlZdSyaYOOvfZ+zACJwLtxIpg6ryHkLLCHOIcASQuOr8cKmO1X
         wW7zzwp1xSi7dI7AMvBwSm5SzjgQdYSoApcEc4hl6kNDDtI1qqJcKeY84XfzVQFJRmRS
         90Iy5iKKmUS4ZYAGQxdZO2gEu07AykBYN7LTQbA4Q8lHizp6l11cUqVrznQK83CkWoUB
         9lKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622409; x=1784227209;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TvK2VkyfSoUSm5eKmSxUVkwHEdBJLPuUeqmWYrwjAH8=;
        b=FiQp8ABnI8g1d7+JAAytCgAseniF8e5JfI+qTvupWQSaJ/okZYBEiTbKuF/4XRDOJg
         mYK9ttgnosALhPAuseZ8bWlibF4SA5LkCtkPXZd0+Y7tauJZLG0xvPeRNkm+HXGmv6IB
         ZA4/Kxw6nZeizDzbQizm6oAcJ+siRC90olQfjDbft7FBAyIsCWmC9x42G6YOM2lxQ9m7
         DEALMgzoCLDITFOzwAciaqc+H/FPxWaudiQMwZUBGUXOOG80lBw2IYrgI3XUUyoliOfK
         OUX1qWcjnUKu+1ejkFfNYGGoDE7bdRhyIPY5V2iWMVMG43mx6z0HEq2XtYi20rlTPaR4
         bydw==
X-Gm-Message-State: AOJu0Yx6tp98dmgmjxl5Gd6nJbgEAH2I8Wrs5sAIwOk3FlF4ojq6KsfV
	2QNePLUzx3FjU5NFh7geyHWbq1mS+jLE6aae/koEmLs3vYsHAVgK/39yeOj3/rIh2FK4h1e1PTF
	CIrnfY1rLdr0OBNVKm8hZu/ErnNL1lZgEsuX5NYSmk0QyzzFLhZV6nNRMWwsmINfs3zh0
X-Gm-Gg: AfdE7cl6fp+h5XWnMVZMi5OrY/mNfY0Kg83x/bgghb8DRoqE5i5ulKT8ZHwsFO/3Fya
	MzaSyep0+8jiwBuvQ6lzvk9dMg2Y8mfFrMRgbY5yZUbNana8STqb8Hdh9llxLQcSVkMZydx+7NU
	A9Wr2XudXQrx01rAEfLUmsAQs3xHSKiFL9Xb8E/c4kHJ9z+JsD5ZVyofMgEJIvK/UcSWSjevZfQ
	FFbmBUwjtsHRjxnm8UsS/5totrrYPKhGrDWYNsTgLKFB4Pf7Wc0i/amHMuu5v8DT1fLe0Y/2CKr
	gsX/gm9RstGNick8cOpBNnNl2sQBgtyp43b+UNBL0ABgcMe37HRfrj3ZxYfWCRMbsMCBVUgB2lH
	sa/64SgZ2I8Jshp5PyzOZEELTD8GOg1+tqBo=
X-Received: by 2002:ac8:7dd2:0:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c967ad1c5mr45702691cf.6.1783622409216;
        Thu, 09 Jul 2026 11:40:09 -0700 (PDT)
X-Received: by 2002:ac8:7dd2:0:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c967ad1c5mr45702321cf.6.1783622408743;
        Thu, 09 Jul 2026 11:40:08 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d026a479sm312642766b.18.2026.07.09.11.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 11:40:07 -0700 (PDT)
Message-ID: <fab734fd-adfe-45b6-a10f-a8a25f7affb1@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 20:40:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: ipq5018: add node required for
 Bluetooth support
To: George Moussalem <george.moussalem@outlook.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
 <20260709-ipq5018-bluetooth-v5-5-e476c41f03b8@outlook.com>
 <11796dd7-11c8-45e3-8f9e-1dc27da0b229@oss.qualcomm.com>
 <SN7PR19MB673648D6C15A8E15D35F1E5E9DFE2@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SN7PR19MB673648D6C15A8E15D35F1E5E9DFE2@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NCBTYWx0ZWRfX032pak4U4Pi7
 nYa/UQeoTkav9Uep1s/GAvNobqzn1ciVwGzxeK/ATZTnH9LNtneEzCHKdcdfjU2nSweAydigaad
 NvIV3SaiVV6IjmYMsQMvpkeBsWA/eki4gtZSNz1S6Nejn9QZ6DftB19FOnRZMAIL9o52QsMkYMJ
 ryvrOTGKJneElYMNFg7UI6YGmELJgh+nVec+Px1/27/+iy8WLDXZcw2nHZR7zuK7a499rybAJL3
 x+Hmiu2Bd+lzDDGyrK+vXTu4xjgjcIgxx+C7VlbUUqATxvGRXZ8JCkOtTkNlxxm64X7JVUA12zM
 hp48M2sTobENf2VmegJUKQdBta5DmnzRKVb/1x3YNef3paDsP7P/BvybPy7P8E+n1DVn1ab8Ceg
 mQwqqCHRHZEX6GM4KiWgzBmwGRhjaJcV/NiSlKnKhKTZxmJqKBwJfpxIwakQQfL3QWlxNQI0JPX
 kPdFvHloOU8lQp5RIEQ==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a4feb0a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=u0gBZgl664NcPZBul88A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NCBTYWx0ZWRfX/RZp5Ivl1fIc
 o75FhZNV5CL1c0/LQhXXc08B4z8VJNDnwUldZwrfpKOZC9gqm76GYw8ixV4xG5dNW+H3B9jEmTP
 pA4qg/0cuWa0v67V/+TM+qyzp2hfcoA=
X-Proofpoint-GUID: 12psDNFoZDrpGXXPt6nbSWXRT-pNzy2W
X-Proofpoint-ORIG-GUID: 12psDNFoZDrpGXXPt6nbSWXRT-pNzy2W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090184
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118082-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com,kernel.org,holtmann.org,gmail.com,pengutronix.de,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:jeff.johnson@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,outlook.com:email,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A46F97345A2

On 7/9/26 8:25 PM, George Moussalem wrote:
> On 7/9/26 22:17, Konrad Dybcio wrote:
>> On 7/9/26 11:18 AM, George Moussalem via B4 Relay wrote:
>>> From: George Moussalem <george.moussalem@outlook.com>
>>>
>>> Add node to enable Bluetooth support on the IPQ5018 platform.
>>>
>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>> index 6f8004a22a1f..8c252fa3ff5b 100644
>>> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>> @@ -453,6 +453,22 @@ tcsr: syscon@1937000 {
>>>  			reg = <0x01937000 0x21000>;
>>>  		};
>>>  
>>> +		bluetooth: bluetooth@7000000 {
>>> +			compatible = "qcom,ipq5018-bt";
>>> +			reg = <0x07000000 0x58000>;
>>> +
>>> +			firmware-name = "qca/bt_fw_patch.mbn";
>>
>> Hm, rethinking this, it must have ipq5018 somewhere in the name
> 
> I agree but all QCA BT firmware and rampatches are published in the
> /lib/firmware/qca directory, see:
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git/tree/qca

+Jeff, Bartosz?

Konrad

