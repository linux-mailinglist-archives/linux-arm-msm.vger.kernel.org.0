Return-Path: <linux-arm-msm+bounces-111331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id karAC3KHImr3ZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 10:23:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B126465BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 10:23:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kTyf2l1H;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=csnnT1TO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111331-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111331-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7AFD3017512
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 08:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C7447B436;
	Fri,  5 Jun 2026 08:13:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A433ACA45
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 08:13:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780647233; cv=none; b=nxY1BHBNj/SJ7IqVqB6oXa/DDZZGBJxg2Q+aHrrLTpR7NRNk2fd0z4vJ+CKvAXJ+vfavMpuAhoYJ2yiDkxc911tcI/DtNypnJXGmrRLIcIlmrKjBaywaX22Db6lC153b3pJXAG/O5VTu46gMIHF5JKmttKoYTI3Zgl055ihiwgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780647233; c=relaxed/simple;
	bh=oRAjiGpD7P1Ud6ErzTaM6Xngz8vzwGWWetH1gEJyS/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=no11RqbRqIi5ztQmuF9ZCEwSCkr8RsA8ECU82usb2F7Kb9u31jDkrthVarufGIP25Imxfv+W++GxDtAUiMsbEnQOXGIJ1ww7vv0KzhbmijRd8MTLTIbgm7NlBmUBpqeSztCHhmLQypP8q29f6XqRWsdkA312Dmg8LTrLI8UvvGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTyf2l1H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csnnT1TO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65575VaS1501876
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 08:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2knAYQo8qTsSztcnLRKd5OpNfUB7oMRepo81yAe0UA=; b=kTyf2l1Ha3Q6YYnx
	tuzE3guEt2Ge86yi81CMWmmJzaDj0oGajfhciwNwcDTevtXuc2RJv6D87upb/oan
	0LANEcgHF/igs+WtMFv/Ykf4C8ZpcymxFPe3v3sxrZ+rmgNd66XMxivT2G+a5QNq
	O0qvRcozl07d4o1N2CCfyjNmn6ST9wf+iJ6yzS+q1el8arMYNiPWYfjoh01O8osL
	U1w3cHZM4xSbonHjbBywyOt36ZQY8m9+RAIPYRnKq/eXKWzlIoRw5nTM4GLkcVjp
	kJoSf88YzYwZ2vDYefKHXYw0vzOmLMimtih//LxY13087v7LHv7MOOIeVF4sYE0x
	75Y+lQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eksrwr84m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 08:13:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423970cb30so1068037b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 01:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780647231; x=1781252031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A2knAYQo8qTsSztcnLRKd5OpNfUB7oMRepo81yAe0UA=;
        b=csnnT1TONy7LtQcmovamyPuL46NmZv1iGD905mVtaJjZ2+2Qk8G3+hqCfe7j//RY2H
         kvQp1b70LWZA820fa6eRIcimBIeR81QAOMsy0GUIKNA99Ok+7/V4aVWav/6gVN0ccD0t
         Y25ESC8qZdFvpgEt7F9D1uDOvqPuq9pcSsjJ222OzvuaqbeWzp4trmDWCa4KC6atO3hx
         1iNGrew2EaXYc85Q5dqFniw8BohPp5gjlo7GHYzdK9XhSLebfnKQ8q2mgkW9rvNxQzXm
         JLAsxz0rzePUiswz1pAbee/ihsppSG1QwTpmwlylKsxrkCu0ZuQEzjNLzyT2+aRu+QgW
         tEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780647231; x=1781252031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2knAYQo8qTsSztcnLRKd5OpNfUB7oMRepo81yAe0UA=;
        b=GtPA86YmhW8doAxYhFzivuhclkOD3c9xK2t5osqVCBnzcOUZBJJ5HH+COLKdHTxOxf
         1m/8JnFG7kjUExmtqIDLQzfSLJS82/YkVc9vaj1Goqxa+tiJDG/8NzAOS6/tUwqak+6G
         4YtiaNr8J7NCcTaPIJJZlt1ZjBLqO2eP1jpNtjl9/h4rv61DVJhIRmVbfSe8f0+RFXw1
         1Im8WPsFmCHRCVk6wje9m6kn2omFrCl4CK4SJGbLbn5yWN7TRezLEJcXRpOqojus4EKO
         Yp8Oxh1MRs4+caFD9+hM9dDaXMz7hWl/OLaLD8990JJihiz/IPSdlG0v1e01PuCpbdML
         YseQ==
X-Gm-Message-State: AOJu0YzVEtp7HJxGlfPkvW6FFVB/4B3zLzTR1FzIOoW35BUafLA/g/vl
	5oEesw0v3v22kiE7Z8lOVh5MKWMEyugz07OrHvHNYsKLsaEf4KfBZg7XOekLySS5efYSlfc8UV/
	3D3QtEaoBe/P4sFCoo4f0lPgmt793gPApmTs+qU2F9YXII19bEoX2NzNoz+gISHjgkjlU
X-Gm-Gg: Acq92OEaDh7a3saQ9cPku2PzW6gaTcpS3EaFPclz5HBpuhall6l961M5ALl6RXVNoPs
	UK6US88ApLcx5YW3FdOAnEYOZ/SQB9A4brbpo/AySlk7Nimi9DWZodpheip1ckaccdw9RdTf5ho
	MsNDQC0egDF7lpbA+lRMloI3xPPz3uzmDGF+a8ss66/ta/YzSLFVEQHGjdkXAVgL44XkXht0ODf
	oDbWf1r3xwRr9Dlmr7V3tJ6LorBH8+pugDPA30XpmS8Ustf9fe0wNwPB09PKmLPJwwRuPe39EJf
	i0HHcCo+GQurTSdXxYSmU0JyR7wUcQuhcClH2DpPbj/6ZBPCraqLueZc/s8n5rjbPEzz4GdKZSa
	lNbp2x8wPPx8RHCjAntWaT0s6z6MFmm8byfj+l7VMgOlYVuMESsTlefPeMKAaHQU6S6iSh/HUvx
	MDOg==
X-Received: by 2002:a05:6a00:4c0a:b0:83e:b443:965e with SMTP id d2e1a72fcca58-842b0e2f87fmr2314749b3a.3.1780647230661;
        Fri, 05 Jun 2026 01:13:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c0a:b0:83e:b443:965e with SMTP id d2e1a72fcca58-842b0e2f87fmr2314711b3a.3.1780647230199;
        Fri, 05 Jun 2026 01:13:50 -0700 (PDT)
Received: from [10.152.203.161] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221d1absm10011448b3a.9.2026.06.05.01.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 01:13:49 -0700 (PDT)
Message-ID: <4e50e30e-e9dc-40b0-bf6c-f0642ed44b9b@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 13:43:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] regulator: dt-bindings: qcom,sdm845-refgen-regulator:
 Document IPQ9650
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
 <20260602-ipq9650_refgen-v1-1-55e2afa5ff64@oss.qualcomm.com>
 <b8758150-00a8-4d6e-bd2d-c1985d70ceac@kernel.org>
 <d24238d5-7b71-40e6-b6dd-c2f1aa150d77@oss.qualcomm.com>
 <926487d1-d949-4516-b906-892d46cb956c@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <926487d1-d949-4516-b906-892d46cb956c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=L5ktheT8 c=1 sm=1 tr=0 ts=6a22853f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Dzw-2j_16JttndEX2SAA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA3OCBTYWx0ZWRfXwSKwtttVKfq+
 /3CClKCtFsbKbOFEqkZ26JPEUBN7c51/9upSJvYFQmTPkhIN1stx1RWNEl37QmDnRQYbfxnM1Pd
 RP7sGOD2gqnwNsC20JAYZa769Fii67DL4GGgwzVhEq9NctD5e9g7L+5Lf2+X41TjAzy5dW7jHwU
 FsVqOlaX7ft0mOGe17a0kZijl57rHmUvIyC7o7OGC0X4JGFvdaHXQe81oMzGfPFLVznXBjOyXpR
 Gp49MEl1M3Mp6HbHB7Lb2uoqbo8vSR6yyDTTU01zakQBChayaX6hlB17zRXDSH6YjMXu4ew0df8
 ReBviaQTIGQojXn6j6k/PQkEwpubK0XicdHp063hj5DEI5NMfFj5RvA6v4RiVom0GROlpc3ZJU/
 ZAylLwdrjBrIlRmWoJtz/RVnRV+ccVzmLmAj7d5mfWiMwEEFlWn1XxX3+Tn61jIrMACAbXysvPc
 3GrI4pGShVgTDfDOU0A==
X-Proofpoint-ORIG-GUID: VRLsdCh7EWDYX0-HI7BDSA5t1gyOqANX
X-Proofpoint-GUID: VRLsdCh7EWDYX0-HI7BDSA5t1gyOqANX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111331-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0B126465BC


On 6/5/2026 1:33 PM, Krzysztof Kozlowski wrote:
> On 05/06/2026 08:51, Kathiravan Thirumoorthy wrote:
>
>>>>    
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: Core reference clock
>>>> +      - description: AHB interface clock
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: core
>>>> +      - const: hclk
>>> You just added clocks to each variant, which is not explained in commit
>>> msg. And it would be a separate commit anyway. Probably you wanted to
>>> add proper constraints (:false).
>> Ack, will make the change to define the clock and clock-names only for
>> IPQ9650 compatible under the allOf block.
>
> No, That;s not what I said. That definition is fine, but you miss
> constraints. See example-schema.

Thanks.. Let me add the constraints with the else block.

>
>
> Best regards,
> Krzysztof

