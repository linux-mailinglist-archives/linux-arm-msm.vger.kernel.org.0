Return-Path: <linux-arm-msm+bounces-109514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDlRGy5HE2pz9wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 20:45:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 959645C36F5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 20:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 072033009502
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 18:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F8E3438A3;
	Sun, 24 May 2026 18:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HKReN7M5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NXwtot7O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6976309DCF
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 18:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779648294; cv=none; b=elmEO2ipyqumr3EC7fcW9dgobO4Vt45jzC1KQuIVC12eoTUrJFjUA2XrlnUSvRulhtvi4I7sYwbTMc0K3kxCLlrM7jeIgMu/yUXu3nMHlzu2gYhjUqSBVVbPJwlDIWAytG+Slhcb8X0BlxqOKwD6rQa+8RxKmUzfD1rT1bZEhYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779648294; c=relaxed/simple;
	bh=HfPJ6WVT2txT3snCLHytxgQt6a74/qAqmSTcEbxxwpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gq4Qdzn0USeKYhvMP2kiS7iI7MWZO70KpWr3OqvB5EYWaP8Ei3rSgjt7gridECHBvePEXtU5KjckooOCX/7IdTXv+74XajIza9DcWoLmNqAvK4By4ZRCaT/+mjyfGFsRudVJz+zJ+XLH8VlgYiP8KDmSuNtQIE2np3J7TK/c3uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HKReN7M5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NXwtot7O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64NLaIxd2801844
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 18:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4DTHtE1JKwREv05zt0FTUjVFjlnvXiHherii1MzyhU=; b=HKReN7M5un+B4Gm1
	POzvedoR5K4EqGYImuq6A0IJDwFGDeBm0DZw5YeL3OZvk3+9D7EDtZH35BPEjj7G
	rVIzylQC9FYDys1Zpbg5wPWeXu1NctbYMz7CKDXgpBqj1Kn+aJ2XCoXqTPgRfiUy
	vvddPgkzG86GitwOaA726bUangkLmnuyquoWvZaIkM+RCGVXQMPJ2w2q8sEdd+rc
	8IsfsoWl/xsx5XLpFsmYgX55YkOrxEqkcwIGfS3Lkt2Kq4xBtPL0ndMVdzXLDizo
	Hyn5uGFKnRwtLGgVjpe5Bd6c8uzB/nIhKEU4fsl5hr6e8+OH4akyP4LLE1LNJW//
	AHAbsw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb1kmm6rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 18:44:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9b8137828so89871015ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 11:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779648291; x=1780253091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h4DTHtE1JKwREv05zt0FTUjVFjlnvXiHherii1MzyhU=;
        b=NXwtot7O7xp7BrVa9pm/4sFNw8CERuc1kLUdrPR7/BiPVMfZ4Hp9jcWF/MtcKA/NII
         Y7X5AoqOPpd4ffiDL4nwr9X1ZiOAUxTTIwSRo1Rn3/891VZSvz1mauiYjeSY/elgkHVi
         tNnW0YpmZ+H2iLKLiVRu5fqvG8bWhI+G9Udd9xItdHlUz32ucwQ5bMOkNTpnIeuRq+H6
         VdFMxT2yNozOZuR/kTUoG5EO95xaF9WwgSJ77+oiyyGpsE//JmGl7BqBae+mSd0dE/Vk
         RQIaQOiIrt+JsfrjjZIigfD9asrKeYOSYbJYwNI7ZE4Se7KUsZflB6I2n5KZ094YDiGu
         ljmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779648291; x=1780253091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4DTHtE1JKwREv05zt0FTUjVFjlnvXiHherii1MzyhU=;
        b=VeVhLdBqA2+q00S7pgXS4l0mS8yuBAMSJzL/WvuYJfisOAf4kb3mnZpWbzhObsCjTK
         hdiWeiV1bbvKKSuCBKW9hEUbx0TdNPhm1EvMKGCEqnz+aSY7fp2YGI8rNdq3DBuSceJC
         VWwgXcWseUXZsGgDlUnjLsL165wOv1IXKTNQ3U0uYIuXBOlJQtFJ378CwtPtCFRvmvKE
         CeadCc0beXYq5IcWyu4PCBpT0x8fcvYRrsV2DinKYV++DWZxmP0zC25wS8AeNAh/k+Kv
         9rBV/3JCnNf4ZAy0oTzIo6Vjn3gII0pUeqQxWl3a/7fZYCImdOGC0AkPnxF41V36rGN9
         jdsg==
X-Forwarded-Encrypted: i=1; AFNElJ9A/dWvL+ut8J4GBDqgcVSgR42HO2JOfOur1vZgNiFoTjr/p7HDsqKVDhJskYjTIHB1XmAIrP89jwQoBC5V@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdj8xLZFsOLzB6s2VBn4S9/Zg+BZwF0yo9y9WszPKymcfNmx20
	RMYeCzwSevRxB6Ij1TmBVXEXUINrGCVgVl1kZGHsvzs1a2gcTTjxWbQDzXu8YOaEtpvQNXI/tKi
	nf1nlmLlWZwxnsr/vfU4hzRqXpsCbXdtWhjkAEoyBTnfiakSAaeEJewDx3Q5NPEHDyjVH
X-Gm-Gg: Acq92OFeQ9sWbcnM5iauAswSWOIoQRKOf66OZwWTGTWkaQcwBj5TGImCBh32A1SIsoz
	Yk0sJ3HTR9nG9geMQfeOqRkobqXUkSS3N+4odE8PxRihmO678QpJx+AkXywTPJST1WdHqQ25UI0
	DFRtt7O74yMtEeZNJCWZdB5hUFx96yYh1/DMj2L+YCClkOv6S+kOX5wlg+mHXK9IWs/xWnviZ85
	+PuMSrJZ0nnryQ39UiAFymbXM0M2d8jMdqX9dT3jh0cy8bfnHV5K7KP4qzqRy7u39pyZBvb6I0Q
	x+MJSA19SvORUbG32n6mQzpBxKM0Pzg9R0evcvVRmbT6u5PWYpQHXlZ6wpJb1F3VTrvJRDLjNyX
	ArTaVinqzG5i2c69JcitIUVdyqvnTM6Yi/tJNlPD7PFg6wdE9NB1Fk1KbpWLitLkggctPTpCjdg
	==
X-Received: by 2002:a17:903:3c0c:b0:2bd:612b:912d with SMTP id d9443c01a7336-2beb05e2d23mr121490565ad.14.1779648290697;
        Sun, 24 May 2026 11:44:50 -0700 (PDT)
X-Received: by 2002:a17:903:3c0c:b0:2bd:612b:912d with SMTP id d9443c01a7336-2beb05e2d23mr121490445ad.14.1779648290191;
        Sun, 24 May 2026 11:44:50 -0700 (PDT)
Received: from [192.168.29.125] ([49.43.232.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56e090fsm80802325ad.34.2026.05.24.11.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 11:44:49 -0700 (PDT)
Message-ID: <07a55b72-eeac-4a38-b226-df8836faa145@oss.qualcomm.com>
Date: Mon, 25 May 2026 00:14:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: qcom,x1e80100-rpmh: add
 clocks property to enable QoS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
 <20260422-x1e80100_qos-v1-1-bcc2afe4cc78@oss.qualcomm.com>
 <20260423-thick-beneficial-capuchin-e4aaad@quoll>
 <99830e85-5837-4ed5-8f89-fea5d3e632f8@kernel.org>
 <c583a03f-381d-4af9-acb0-ac47a1e35b47@kernel.org>
 <7oador7jxw443astffc6hjuf3gots64fqmvsjdsshfhhonc2l7@2unu723p2orx>
 <12e149c4-60f9-4ffb-b066-7611bdd15786@kernel.org>
 <nr62mvz6qrpb6moqyasniqcqtfltsx4qtr3lteeixwutindqri@5joujdvn4r3q>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <nr62mvz6qrpb6moqyasniqcqtfltsx4qtr3lteeixwutindqri@5joujdvn4r3q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE4OCBTYWx0ZWRfX/uFBQKes5bon
 FhhiSKAddMVF6vV+4+HYwJSOk44Ux+uDrkRScuDi8iE6Z2GYV12uv/M6S6+jz3X0RqqDF63wf/9
 RETs1F8QjGHNuEXZusqYEmaIVrmNa79DajrMspZThk0d6WmHeJ/WZulftgjoH0ShL3soZX1AXkg
 GelxNjy2XY+QJcMtv5tYbdhihyGwsjxE7OdJDYGiUXKujmHVOMfVLGEX0VXKBkQCpPkpQbRPJIZ
 CNg6Mb01M+JZP2k7X6ZeAZwlXV+dA74xB06uEQc9IAgTKISVe8X7vsUqfd/jLFxszH4fM+quCzZ
 M74KO5dVd8QwsK2ARf6IF/Eym+ZBsm+Dq/ikB3FlyxHLsi3qPf2Uj6CHwGTxdna31OvCd1o9w1J
 u/TyNxu09To/JfZV1p4C/JcZ6ZmxZfA14LkWJiECVTnCq51IriJ85BV5vxd9feLLO2ZgXdioxo/
 HJ7jSLttXOcug8/k5FA==
X-Proofpoint-ORIG-GUID: ISUPG_Cjz_1AOFU6IeqZ1Q2tUcnHKtmJ
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a134723 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Np7tGMHckr7TqWT9mUvMjQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Qe6B47XUAAAA:8 a=EUspDBNiAAAA:8 a=9WfpK7l04UvUAjPDmO8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=QWPKR-PWjQKaio0naagv:22
X-Proofpoint-GUID: ISUPG_Cjz_1AOFU6IeqZ1Q2tUcnHKtmJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240188
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109514-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 959645C36F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/21/2026 5:26 AM, Dmitry Baryshkov wrote:
> On Wed, May 20, 2026 at 09:33:52PM +0200, Krzysztof Kozlowski wrote:
>> On 20/05/2026 21:27, Dmitry Baryshkov wrote:
>>> On Wed, May 20, 2026 at 10:11:47PM +0300, Georgi Djakov wrote:
>>>> On 5/20/26 9:51 PM, Krzysztof Kozlowski wrote:
>>>>> On 23/04/2026 10:38, Krzysztof Kozlowski wrote:
>>>>>> On Wed, Apr 22, 2026 at 02:05:11AM +0000, Raviteja Laggyshetty wrote:
>>>>>>> Some interconnect nodes on X1E80100 have QoS registers located inside
>>>>>>> a block whose interface is clock-gated. For those nodes, driver
>>>>>>> must enable the corresponding clock(s) before accessing the
>>>>>>> registers. Add the 'clocks' property so the driver can obtain
>>>>>>> and enable the required clock(s).
>>>>>>>
>>>>>>> Only interconnects that have clock-gated QoS register interface
>>>>>>> use this property; it is not applicable to all interconnect nodes.
>>>>>>>
>>>>>>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>   .../bindings/interconnect/qcom,x1e80100-rpmh.yaml  | 62 ++++++++++++++++++++++
>>>>>>>   1 file changed, 62 insertions(+)
>>>>>>
>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>
>>>>> And unreviewed as it breaks users:
>>>>> https://krzk.eu/#/builders/102/builds/70/steps/23/logs/warnings__3_
>>>>>
>>>>
>>>> I will just drop these patches for now, i have put them in a separate branch anyway.
>>>
>>> I think, dropping 'required' clause would be the easiest fix. Or just
>>> wait for Bjorn to pick up the DT changes.
>>
>> Could be, initially I thought this is actual impact on users, but indeed
>> now I recall that driver prints "info" message and continues. So the
>> binding is not correct.
> 
> I'd say, the binding was not correct: the hardware has the clocks and
> the requires them to function completely correctly. I think, the problem
> is that we allowed incomplete drivers and incomplete bindings (Without
> QoS support).
> 

Thanks for pointing this out, and sorry for the breakage caused.

This is one of the earlier targets where interconnect support was
upstreamed without QoS support. Making the `clocks` property required broke
existing DTs for that target, if the corresponding DT changes are not 
picked.

For newer targets, this should not be an issue as QoS support is introduced
along with interconnect.

I will respin the patch following commit  
e07f3b8c9e1c ("dt-bindings: interconnect: qcom,qcs615-rpmh: add clocks 
property to enable QoS"),  
keeping the QoS-related clocks optional to maintain backward compatibility.

Thanks,
Raviteja.

