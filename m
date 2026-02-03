Return-Path: <linux-arm-msm+bounces-91649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eH4/KafGgWk0JwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:57:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C279D731F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 140DE30929C9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 09:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB18939A806;
	Tue,  3 Feb 2026 09:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4r37RkW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eJSHnMhi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0A139A7F3
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770112476; cv=none; b=XyuUBrN/JBBQMnMlA2e5c9x38nQ4gF0haVbceUPyrncDxdrjIsC54ylbCVNJar1a1fSpWZ9t0aej2+1s/E1JfQbMW6jGrEwL9iALO4z3QNuoPkziQ/b7emAa3izszYOc212/GVX0fJY/FLhIa2W+i5xTEtj0MEGq3qTnMDKgUXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770112476; c=relaxed/simple;
	bh=5tvxKqUmCoKZCwGOWAtxl9+5Tq8Hqu+dk+QpEm31eOI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=vF24qeLu63mAo/QkDHHrp07sKkkfsn9psibeipwukWOsIuJyMdmyqiVy5Ze3x9dNF5QzIGcShr8+f59RAvRVjj6QQvzZiDRkZ1hjgQUVJvB15aByn4838gQWBIFtVMn0no//0T5lCgsiskwcgy8n0wL1kpkedRt5evKqTvSH6i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4r37RkW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eJSHnMhi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6135kn8F3459143
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 09:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QDpwGXgpKN7H7soFlm5TbR7WhswDKwPckmbYGm3s39o=; b=g4r37RkWWiBZHXqa
	jtqOVFY4ZkpccAZi5NDvXtKF7rvAz474aybRy76srEHChmZDD+fcgrrm7BxjsEeY
	ZK9+jAwJxXzQYSFq7N3ujtCEkNopgG5bblrCvguQTYti1LI9+2x4P43p8d2Bpzl5
	bjzb8/ez8+ztSAFOcNxz/cmSxmCJDkp4wqN/XKY+MLiEdgx1xDdDKr17kQvL/rF2
	KzZANABQ22IQtgLl2jkMu/4XtUCDT0OsfWognrE7LoaU1Kv2TIpLMUn67bWmx+m1
	RcSkZEVXY8pyNX/kP1KmKNbynv13XVDa7h0+ItyNnfrZ6z36QRsPZVNyD71LjSR3
	SUm5tw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbkspt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:54:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c629a3276e9so9531617a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 01:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770112473; x=1770717273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QDpwGXgpKN7H7soFlm5TbR7WhswDKwPckmbYGm3s39o=;
        b=eJSHnMhiaByHaNGbGU3eXVpEn7D8F/RZVC1f52G3y2b90ve/FUCPSM+Sx73SeFumsv
         tZCMkQZYrp63A9oBE6VFJWmuo8/KI332WqaBjHzqf7A2rPisqA97uHgjSMdYrKYNYvZx
         tdy7t5VmYStbyILidAyJgYBd2Lle0fKsZUjl3X16m+emDZwT4PY/gZK7zavivjaRZ2gS
         bTwB43HhX05p9a2XyrUKwIQKOgnAUlynWY5Z78YcGVTQoOmdispD5Zr057yn1byUHTYn
         KmTrwrJQ1ivG8hg6Q/p3A2vDWbxkD0PAP2p9h1S+zwmtFoGYd/P3MNvw3foR6OjkT85e
         mWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770112473; x=1770717273;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QDpwGXgpKN7H7soFlm5TbR7WhswDKwPckmbYGm3s39o=;
        b=UUmna1g0NdPRX6eIsHENMxn+W/tHfTsvdeUKs4sxz2JawWTIMMqfsEFmiKVOApKy9I
         26Q1uXlDFDHI9DtG58B2ZYJ2Xt7sLJI3rN1Kvq1TY6ZjJHF3wnZuvf2tdg3wyRWTgDq1
         PfVhXp2TCKFe+s19oH+0/VDuQ17ciPn5cuWmGl6wbnMFg0/+Vj6ck+EmkMgGpJuZsz/N
         hQQDFsQuphEjb6nIHRz+7Y+7Wx8f5WCWQfO9j90bk974659iSqK2Gui/4lKo31vW6yK/
         b9avrbE4PH5ZpKED7DQtbB5RqocZiG3H5SUYvQRwuQ0b7oM6xZmJ1LUbXDkx4FTs1W6N
         kcAA==
X-Forwarded-Encrypted: i=1; AJvYcCUO7WVVW7i0QwNhy2cG2NGzgBQY0VuI8lbA4s34BeNVBbKZ/tG1fDQJ4xTAfuxvCHoYyF1zB6YniKzzjvWz@vger.kernel.org
X-Gm-Message-State: AOJu0YxAcGp6kl+K8UpB1UnnQs0ar44XhtAHQhW9AUwN79o8OusnrP1r
	7812rgQyLLaNIf3p55R0i1VViV8XZjD41w5UxpfBNw3ihWVRzTeLfPMwCOC8FEl9t5o4PyQOLdb
	p5hdaX5gC1PpioDgCx9KzkzU3ZTHDSmNrGUKVLRPjSdOIHSM+cNeyrKIU0O9MRmslcY+6/uoXp9
	Wx
X-Gm-Gg: AZuq6aLJmn9ZtPjXisRpqO/NQ1ztpXe+xaAaXFYjw+QfpPhrf1SInWdsEhssYKQ2O+I
	Qa5M0qpjtw/NIcWTQUlAsYmht4CMpujx4t0BM+dMafFZce1s43Bjcp5XlOA6p2T3J8oEo020hbV
	YM5V8U5G37AuC17m2BjmgjWM83Vv+etAx9aSlmDUfKQzpskTSEFp98Xfu0Uraxlvwl4V1xE4dGU
	tWQIPiBidb7Jqs+o+kNcWZCsj5xNzzx4mSbg+lfMJ/uY2KDMWMtyqvfIUojw9HmMYhfsEBIzgkG
	ORiPhiOpFFn9ieWdUmyeyPJ5/GvEsTHIh8GTVtcn0GG+OAFZZPICbRE+XPr5NCgYOh+lGX/u3aP
	9b9urTz7/8/VwHlStsft+AOFicNb9S93pM5GDCeDK8g17Xy6sCZ+cG0V9CU0GHjlqdbfa1jPPXQ
	==
X-Received: by 2002:a05:6a21:e8a:b0:38d:edd4:2fc6 with SMTP id adf61e73a8af0-392e018fd07mr13913223637.70.1770112472966;
        Tue, 03 Feb 2026 01:54:32 -0800 (PST)
X-Received: by 2002:a05:6a21:e8a:b0:38d:edd4:2fc6 with SMTP id adf61e73a8af0-392e018fd07mr13913197637.70.1770112472533;
        Tue, 03 Feb 2026 01:54:32 -0800 (PST)
Received: from [10.133.33.97] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b415b01sm168462075ad.40.2026.02.03.01.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:54:32 -0800 (PST)
Message-ID: <178f868a-a152-4f2e-87a1-b83b7870777a@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 17:54:27 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: hamoa: enable ETR and CTCU
 devices
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v2-2-aacc7bd7eccb@oss.qualcomm.com>
 <c739da90-de92-4d84-bb5a-e653a9fbdcef@oss.qualcomm.com>
 <c14ba722-5195-472b-a4d6-3b8f6421df7b@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c14ba722-5195-472b-a4d6-3b8f6421df7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XzAMIW0QqhUHOlx4i9t-RdjnWlK1Cf3B
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=6981c5da cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WGD1OUi62yeOWj14Vj4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: XzAMIW0QqhUHOlx4i9t-RdjnWlK1Cf3B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3OCBTYWx0ZWRfX45al81S37pJs
 SWF8BBhYkhvfSGMV0fF7FZBvxMNIJ/JtJowCQA0S6+AERVKKJyz2EVG/kKyYqu7bldZvqi4oY7I
 IY3sZHLCvdKaUix7L4UNc4qf1owbEd1zFQAZx9ge4/eBWA16/dDqxNxEv88CRaJtS2nInqzQNZw
 Hd7T3zlncrgXz2MmwSgTeqoLCWAQPyggccmdlh83cq3PYApvfRTzilsqjwUKTxYb6IMD2S0RIAR
 /ENhNUwTSeh1+/uFv5QFMHEzW1lYjceTBma4yo0xHGm48x9tIY8MgpIBMFZ5MdUrW8BfTo9qaKa
 jHR5e1YbzZ+yxh2z5BA23U8YXubXcGeGvVcqzqiym905NPKHqcBE//fNL0Gauoi6bK2yji8nTwo
 iEVxB6Ro3fNUQG9jK7j897Ivi+XQ1/nNS5VpI7MJWmkkebiHns7zrJLT4Itc7Orsa6yGmbN6RaB
 XnS3mKUdLZtmNFg3EYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91649-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.152.154.104:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5C279D731F
X-Rspamd-Action: no action



On 2/3/2026 5:50 PM, Jie Gan wrote:
> 
> 
> On 2/3/2026 5:44 PM, Konrad Dybcio wrote:
>> On 2/3/26 10:32 AM, Jie Gan wrote:
>>> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
>>> tracing data from source device.
>>>
>>> The CTCU serves as the control unit for the ETR device, managing its
>>> behavior to determine how trace data is collected.
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++ 
>>> ++++++++++-
>>>   1 file changed, 159 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/ 
>>> dts/qcom/hamoa.dtsi
>>> index db65c392e618..88ec29446ba1 100644
>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> @@ -6771,6 +6771,35 @@ data-pins {
>>>               };
>>>           };
>>> +        ctcu@10001000 {
>>> +            compatible = "qcom,hamoa-ctcu", "qcom,sa8775p-ctcu";
>>
>> Sorry for not pointing that out explicitly the previous time around,
>> but 'hamoa' also falls under the "had numerical compatibles" category
> 
> I saw the dtsi is renamed to hamoa.dtsi but we still need to use 
> qcom,x1e80100 for hamoa?
> 

I think I was misunderstanding here.

Just checked the compatible for hamoa:
compatible = "qcom,hamoa-iot-evk", "qcom,hamoa-iot-som", "qcom,x1e80100";

I will change it to qcom,x1e80100-ctcu.

Thanks,
Jie

> Thanks,
> Jie
> 
>> (you'll see the only hits for "qcom,hamoa" are "qcom,hamoa-iot-evk"
>> which is a board name)
>>
>> Glymur and Kaanapali are, understandably, Glymur and Kaanapali
>> respectively
>>
>> Konrad
> 


