Return-Path: <linux-arm-msm+bounces-84328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6215FCA2F6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 10:23:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5C1130989F4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 09:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F3027FB3E;
	Thu,  4 Dec 2025 09:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnL96wqU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KP+DhpPh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F09322C97
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 09:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764839828; cv=none; b=SBif3r+mRQSg0C/d1ofYQqCSiQPg79sqTEb/qyZpjYO3qN7/VdBw2veslpzQ5gd38CrfxCohu9Dmtl2qBAXPQV2keoWQSJEVaC8owQJS3lPuV+Ty4npc7l6D0tSMFsFeWl4cpwIDtIjY0yMb//wHi0ufVuRfAeqb1hF4Hqz2Xss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764839828; c=relaxed/simple;
	bh=SMUsPkXRZIEHqd9ZQP6HWjjeIV6tB257Bo2GR1en/kQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TxqcMC9oEt5IEyl8M9OWkG+6wj5btgik2xUytGCgDXVN9yFaHIEvNEMtlGbDQCNKaKCZd5/Rs4ZWeuirmIqInqhRXDrXpbssf2TCgiGQU/X85EftQYb1mUTebyZOD+E6cIS1wPTbJsZNSpDCJah3jc4ojJpKxIUE+5BDlCdZOgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hnL96wqU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KP+DhpPh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B468hmP560135
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 09:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0U9QIgJeX+XL1L7BzeMqcqfG+cdlqZzZuVJJDQreQ80=; b=hnL96wqUN829L2zt
	aeSg04edaoGf/6r41/ZSCLRUlTAHDDKjurAOwRnz8My/48G0NdCESRAjG0+AF+wV
	XfDAiqXGZ+vDOPay1/bp/obTP2panak0PSc3z9+NYthhUHMuloN3aRLQaq7rIque
	0r56LG6P54HNJAtbFhCwx4s3QjXjwo5qa6f9dd4MK+K0SPqPB+xJi71yVB675cEz
	VlaGWNGCc28oPkUn5jhoOpQUbhNhhehdOK255IZQKAiHRVLOmDE6rHn+gr4Rm6aF
	L6PZxb5L1GR6jxMxJpZXl6VydvCY1r+s8qsDyT0+2oFxgsocyYv94vDDifztbpTI
	myuK2A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4attmha8a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 09:17:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso1010471cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 01:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764839825; x=1765444625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0U9QIgJeX+XL1L7BzeMqcqfG+cdlqZzZuVJJDQreQ80=;
        b=KP+DhpPh9Ep0YK9HWklaUAuM1Auxcjj7vDQmlSoBGw4/XSBl7I3xBB113gi/NgkAMy
         4SKFpXSXgFtoarEYaljJtxU66oAnFs8s7TRLGUMsBSaHe871yJIm186HO4RXOD5jqD2x
         oOqAChvf+0kw/KX4Zb3pM2XINJsAoOva4c5uwfTyiCyatbAnnuWoeVvmyvFatBEDkT/e
         gcUBmO9MIIddAYEqqn2ruhYXt9IYXCxR2sM3+ua2AzpJ0TAgpE8CKp8urpy9/wi/eJ51
         fclOcpjfh6dRWu6SIYGDdHhBVUygDVXiGyO5czNawBihwUa25QNRaGdGpERrukiEhGQ3
         Bfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764839825; x=1765444625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0U9QIgJeX+XL1L7BzeMqcqfG+cdlqZzZuVJJDQreQ80=;
        b=DAxY/SMPhaQE2cM+JdaG9LeIs30637y6oGrODaQ3fI//+4XF76GEcAq35iO2NS/Z1T
         wan72HccjaFQppI9cHmSGuYl8W9+ECADENQUtfA5D5hTiNEvelW2ugSLHm1ObrO9XH98
         Se1fA7cU4jUpdEvRc5mNG/hOFYczMmbne92bXFMIInqZH3J9e+Uj41dHcks9Kn0cv15B
         F7933SqgSKuWO5NHyldVjO0x8D1qQq+Df4cOlIV4WIww9K3hjeZ214iuS/UDpY0+T/w7
         oqtwkcci4wcjN9bFPVUERkvwE1aHZycS35tXvrdy6aus2SXAZa0Dhzk4EY7NgKQkOU6I
         mEVQ==
X-Gm-Message-State: AOJu0Yz9+flzo4E6p53My3VW+N4HGcfZOQ0IFvwzQPydwf3/dzXxgzdF
	Ejsh7+czxmuOTNasQds933hYjFMYpoHJm2Xwiu3Trmwb4t3wZsn+PX3BSlsxg9P0BzRyZlY2RDG
	iP98CtSpC7F50GfgNXAkdhCLz7W0WtSyZ4HpHTfDRBpKL9tGfAPJu76bwn4hekNavtgZ+
X-Gm-Gg: ASbGncst7kHrVz1FF6jvI/qMd91QujNcAISXZHdnmqmPjKLakK/Q+cR5lzGgE7gtrUb
	z4CaUl+ZwiZpegr6u4UiyGqma97SBp9VduoaIlAvMNcg2dnrn4OWs2Cxb1CTXFnurq7W4wHvl0R
	ofDF0L027iekWrgX1HQKA23V29Q5fZniB7WxlT7Ya8HuFPhR4BMvEj863ruPAqahloxvxtS7BJI
	RAck5OOADXcS7C/NnqB9V9BKq0Hppil3CXVx6XygPVv3CYxhEo5VMyRc+8Wbc92yK31KKeVQbYj
	bO47xZ03FOoQW8doaRMphd8vHlANxB1Ykj3tYtGr2DgF/ZdpCijvwRvvP4Ow0zLptO2fuEn2y8F
	6pP+3APnYnuhtCgm6dXYW/wcfPocTaiBt0dSSJyChEPp1/pMHCoVsAMM7vNiI+Yk0Pg==
X-Received: by 2002:ac8:5a06:0:b0:4ee:2bff:2d5b with SMTP id d75a77b69052e-4f01b14cf83mr50517491cf.5.1764839825328;
        Thu, 04 Dec 2025 01:17:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQLbXFzWb9OJZU94vVBhRpTXcpQzIV1HSqq5xzJ0QE2TLlv6RKK34659GBcDvh4F14hpF4ZQ==
X-Received: by 2002:ac8:5a06:0:b0:4ee:2bff:2d5b with SMTP id d75a77b69052e-4f01b14cf83mr50517271cf.5.1764839824823;
        Thu, 04 Dec 2025 01:17:04 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec2ff8sm796987a12.7.2025.12.04.01.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 01:17:04 -0800 (PST)
Message-ID: <d8a3a30a-d627-4085-bab0-b73a2eeaa12b@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:17:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/12] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-9-a5a60500b267@postmarketos.org>
 <62ce91326c0e1d5aef1ad5ecad9b99695f983347@postmarketos.org>
 <863db415-51e0-4c54-85bf-ac6a168758e0@oss.qualcomm.com>
 <9cdccbb5a3fb10a2d7de1e1d17d36018f40b18a1@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9cdccbb5a3fb10a2d7de1e1d17d36018f40b18a1@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: j032-2MoVXgcSjvq9FaF5s0AJaef63jF
X-Authority-Analysis: v=2.4 cv=NcTrFmD4 c=1 sm=1 tr=0 ts=69315191 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ubcZd0e3b_FObW4-F2kA:9
 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3NSBTYWx0ZWRfXztshLcnM1ZXG
 bWji5xF7lIVhXJHWxC0aqMgO+iA15MEhGAlBb1T3fKAgiNvwTpN9b9vYwIwG7ZqeTY4Q/XA3Loz
 vrIOycK1YiN6VCCdsQMEstbwe4UjHl5kO5B6H5xcXRKpqCnOzkBYLW+MyryTTEg5mKFlb7Xitf9
 SEyAFLO9aHanQWnLq5qsr1hgPrlw8lE1Ryhm7+xdO64sPRLE5/SCAuO4eatW273pzbau5g6GVD5
 fG8u2HDmU92rwdFhUKc55WvaHEvmgyfUBylvFVEMQW+G3T7aPq5VGxcbbAnZgcE+zRqCRbIIyn/
 JmUJcxPvivB7dkoHs/LslqnPN3P5TFvnM/gEgRXDsnYBUI4sl7GlQCQ93hiIE2nY3RFXj6o7Eln
 BvWUKf3SdWiH3R1CTGUK7izrQu4rWA==
X-Proofpoint-ORIG-GUID: j032-2MoVXgcSjvq9FaF5s0AJaef63jF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040075

On 12/3/25 10:27 AM, Paul Sajna wrote:
> linux-postmarketos-qcom-sdm845-6.16.7_p20251203010632-r0.apk
> 
> 
> December 1, 2025 at 11:42 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> 
> 
>>
>> On 11/28/25 9:20 PM, Paul Sajna wrote:
>>
>>>
>>> I did more testing on this, and the led only comes on if it's brightness is set to approx 150/255 or lower. In that case, should I set led-max-microamp to 60mA?
>>>
>> FWIW your downstream kernel sets up channels 0 and 1, here you only
>> enabled 1. Taking a look at a picture of the phone, I only see a single
>> LED on the back, so perhaps you're (over)driving a single power line?
>>
>> I'm not a milion percent sure, but I would assume the current draw
>> *limiting* register applies to the sum of the current going through
>> the three channels because there's only a single instance of it.
>>
>> Konrad
>>
> 
> I tried setting up both, but only the one that was mapped as `led-sources = <2>` seemed to have any effect. Also it would confuse userspace flashlight apps if there were two I think. So I'll push v5 with just the one that does anything.

led-sources is parsed into a bitmap and written into REG_MODULE_EN,
this doesn't translate into anything that's userspace-visible

That would instead be the case if you defined a pair of LEDs under
the device node (which is valid if there's two separate ones, such
as for some phones with a back and front LED flash)

Konrad



