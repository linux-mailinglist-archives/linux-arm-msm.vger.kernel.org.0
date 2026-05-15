Return-Path: <linux-arm-msm+bounces-107833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMfzH/oHB2qNqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:48:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 870DD54EBE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B0DE430429BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B521A478E36;
	Fri, 15 May 2026 11:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BwAAgG6+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hrzy/XzK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E659478843
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843641; cv=none; b=P1sycnpfotrUhXBiu/riBKKEaSmcUmdu56RipA9sWKGmAde6w948mSJHVBTy9k6tkgmS3b1d2+sLH9fbmzS16UlexqsKdN97JHtbUXKYFzX6MSYlEG9SFqoBppy+lr59sKDnYuMc1kII9UDCpJWrzb0vIX18VB9bUwObexZ2xEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843641; c=relaxed/simple;
	bh=b6fAS5R0MZdbkQE4ZTU8n250+XpH81ELy6U2EHe4pjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PleGY0MesIMkgei+TLiXwIIUv0AaGXt8wL8dbXoMy1aMu56lLmrus1hIrZfhwrTiplgFdI+csp7Od+gQEtn6TK/q3qF/E13KfFlBqq/BQiWomttCplh+ZDK12evJsPiv3Lhc5fIOSrFUPSHM79x2lhkuVtS8HfuXH3FZm2XszM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BwAAgG6+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hrzy/XzK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5N19g655050
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qcnnBtD0bTocfS/XZzFNZ3R4W0jt7W/pmdR8q1gCj88=; b=BwAAgG6+1Z5S2VM3
	HE74i5ymWDPszaEmGAMUGFOKIxIk0RXFIHG/yIYTe4J1NatFGfPzJnOZ7WPZaACq
	JOn+l5YLuwUV8U0oaqj2KURGtfAWk7Z7XThmr74utk5v1TV7agetVXdWs4MYM8JD
	IZKYWFkrVHR6oNuwbto5YgzgwiQwsgT1bbOMJ42a49U3dW+93/GAzvFjoWeYFk8E
	hdPZDHL4Qm48KhvYd1uAGf4t7CQfEhiPE+0ewAoHD6ri2A8dwfz0YwSMzwj01Ikc
	UciyrMV1V5a9Ot2gUFS2gHe3V/sfSY+QJNM9qBfQP50e8Bglreu43tUXAufmCuu8
	mEAtlQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1pu1ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:13:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e62562b6aso23784431cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778843639; x=1779448439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qcnnBtD0bTocfS/XZzFNZ3R4W0jt7W/pmdR8q1gCj88=;
        b=hrzy/XzKGChT6hZDggt2xYZA9gEdESkE6af5S+tpl5Hxs0sKmUzsbN/alZoT1acELn
         PJULN9c0UZrvOkmMYDKcCUZnc0gpdkbzG/6AEwJRp7Fyod9SG4Y5jtxcI2kWtHOWY2DP
         jaG/yU6wSDkMrLK0IMbmiDkb+dvTFDleY0YOnFMwySv19fBdFt6f+6ymubhCm+Kg0OTN
         G6Dgf8BgbNjxVwtnQx9ACC1LhM4VmzKyY6t563Rz825JhVnSpC/OgSL+xOymYbRgdhXm
         287/0MQptNxio7JprU6RAoqu0G7F7eq8tK4sL7Q/hcmfN5uze7vzWvcB+3IFHRERJJkV
         87CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778843639; x=1779448439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qcnnBtD0bTocfS/XZzFNZ3R4W0jt7W/pmdR8q1gCj88=;
        b=f2NKPjebChqWoIjzRgI6AfhKIaTSWSzFP+o44KTlEeeRSGBSu2aACcxsiDvUbLnsc9
         QXd93bgs7+rfY8dsW3NNvNSO0PIqs9poJ5/m4XUO6b0Cb1RipnSMmINNuohLb/ou+uyc
         dxfrsT8aHSal6YvIInpNcjnjOwdKB3ZM6lQST3/prkNqR+JgienVQ/iTTFvb8XQ8APdR
         fIbDieWDKKG0G6irRebSbH+XnDdwsSF1+OBV4ufZEAxOtlXsQ11gVaZQOiP2m5Ngl6H7
         m72VRqdWP5P60+NSw6My+DvsiaA3jNImfcJVEdl4owfKR7e5bnLNVcPGY6NDysOMfjYA
         z0vw==
X-Forwarded-Encrypted: i=1; AFNElJ/NzSgbs0rRfuDEowCrO43RXXkivcAdDQVuOqskbW2oIHF3ruf3jbeMTY2xsZlpYilKtR8y9rCNz5yCow/l@vger.kernel.org
X-Gm-Message-State: AOJu0YzmZw+/C9YmZoAlhVAvOmAVJdDesA3pRGmxAkcmXTkyfMEQJ85W
	Q38JbbLTRhEYoja5lDs3hRoZ1YLHI04INwoujNby62cPYDNHe/ByR66OJ3cb4z0g43MUc5G8B6i
	9bFAMX77fO8l/dzz9HfSC3Z7b95qg+ZUTPOG9Kw5/eBpYspp+lMMAzsb0ZLTB8VKOELpn
X-Gm-Gg: Acq92OFRLpM9hhh2TKX5mq+qrAGsUTSuE9kPTh8RnpBYFdND5PGcl/AreAbwlzCAAPN
	qh3cTrbul/3Lf4RJ0nmB1Pc2dApkvduFnIJQwIb0wknMoNFTxL9tq01hbdlDE0nVk4EC2itxDzE
	7aTFF1DftyD5mLOmEHs1OUonYr+87IUh3q+c+TjN9glBLexv2o7rIPJfDLJ1DHq8Sd3x87Y6ql7
	5fPWzUwDJaYs/eLZ/WQJEnwlf6scqtYQaRRE4Yp3Fs7kO1J+uNKmUfYRSoEa1uDw3EnTz3g9A/6
	bUZHEbH+OhaHEF4qi7en3ckf0pqgQLAruwG7ZkNoFSTpqKXtbr8cUremZAQMnICxFMjEvSSUE/i
	HObAnvITBGoV9ePGiz6IWQ+j6Eky3JQpP67cIwZa2TTDuL78RF5Boi7oIU6aNc8DW8lz35pK8U+
	RtuVY=
X-Received: by 2002:ac8:594d:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-5165a26c9fbmr34330241cf.8.1778843638644;
        Fri, 15 May 2026 04:13:58 -0700 (PDT)
X-Received: by 2002:ac8:594d:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-5165a26c9fbmr34329941cf.8.1778843638214;
        Fri, 15 May 2026 04:13:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6831197bf00sm1883505a12.31.2026.05.15.04.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:13:56 -0700 (PDT)
Message-ID: <574a1ab4-293e-4daf-bad5-8dd886a8178b@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:13:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
 <57696ca6-42ce-46d6-9b30-cd5ad4378e25@oss.qualcomm.com>
 <d10fa5ef-4d2d-4fa8-938c-6ec74a823bba@oss.qualcomm.com>
 <e2c54638-2849-40dc-9c68-636c04719814@oss.qualcomm.com>
 <dc88df0c-0be0-4a29-9893-032d6c65a45e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dc88df0c-0be0-4a29-9893-032d6c65a45e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: e6dDQcKC-b82W612ab1OoJVTfl_kC7bT
X-Proofpoint-ORIG-GUID: e6dDQcKC-b82W612ab1OoJVTfl_kC7bT
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a06fff7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DpYfqt6cvqRt1CeACwAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMyBTYWx0ZWRfX7cTr5HZufyeS
 3kciD4VMI/dXNMUcn3b59T6uP+Itnxc1L2k/wD0fcqlL6w75h3wqHJuRsA7hJIHz7MVFJHoenwj
 fKH5gTz/9lbaAqxlPb9Id+uJMkDIRIU7scoiKxwCsircnXOFfLx54mbzg1YQGli/yYISaCqs/aQ
 Ky2sownKBODvDTtKz4+VfxsRR4R9awhS8ETkTAVNOoPWTxgz8H6Aa22uiFrg9XueQGZQ4+Ex/CK
 v/CTjWWnt3vL3GxVCYlR5BHerkzdD5a3NulL9q1HGxRrV7mKFjIIV3cR+5JqTHOICvsfiotsjmx
 OZmr+uQozMvj8YfDx00kNLUKW4yWk564poelGPENaI81P7F0+vvCQALsKTkkEbeQ00mIdVRFNch
 kRC5yWRfk1YAiBMbjmE57k+IFzqJ57abJpdYyFh7SgcEaao/zNFLRajiOpPyfkVPP9faCXYKUkX
 A5QTpcl7ov8+/bTZ5ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150113
X-Rspamd-Queue-Id: 870DD54EBE1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107833-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 1:09 PM, Dmitry Baryshkov wrote:
> On 15/05/2026 14:03, Konrad Dybcio wrote:
>> On 5/15/26 1:01 PM, Dmitry Baryshkov wrote:
>>> On 15/05/2026 14:00, Konrad Dybcio wrote:
>>>> On 4/28/26 9:36 PM, Dmitry Baryshkov wrote:
>>>>> With the default PSCI suspend value for cluster idle state Lenovo Yoga
>>>>> C630 isn't stable enough. For example it might reset if display device
>>>>> isn't probed early enough. Drop one of the bits from the PSCI suspend
>>>>> value to make C630 work in stable way.
>>>>>
>>>>> Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
>>>>>    1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>>> index e41200839dbe..e6c67016552a 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>>> @@ -347,6 +347,10 @@ &cdsp_pas {
>>>>>        status = "okay";
>>>>>    };
>>>>>    +&cluster_sleep_0 {
>>>>> +    arm,psci-suspend-param = <0x41003244>;
>>>>> +};
>>>>
>>>> Is it better if you do hack in a
>>>>
>>>> qmp_send(qmp, "{class: cx_mol, res: cx, val: mol}");
>>>
>>> Any clarification? Then I can try hacking it in.
>>
>> This will send a message to AOSS to intrusct it to prevent CX from
>> collapsing
> 
> This sounds like a dirty hack. I think, hacking psci-suspend-param is a lesser evil.

Yes, that dirty hack is supposed to help us understand why this is an issue
in the first place. Especially since it only came around at some point
(although I suppose you're not really happy with spending a day bisecting
when exactly)

> I know that we should spend time on understanding, what should vote on CX instead, but having the issue only on C630 doesn't really help. Maybe it will go away once I can sort out the gcc / dispcc / mdss issue on SDM845 & SM8150.

If it's a "not enough votes" type issue, it can vary from device to
device, from unit to unit, depending on your luck in the silicon
lottery

Konrad

