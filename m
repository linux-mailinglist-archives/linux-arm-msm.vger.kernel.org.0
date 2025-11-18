Return-Path: <linux-arm-msm+bounces-82226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EE7C688AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:31:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id B4DC62A605
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 09:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD6330506C;
	Tue, 18 Nov 2025 09:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jujc6rAS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ui+NQNNQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8798930EF94
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 09:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763458302; cv=none; b=HsfmmNaqp64rokH42UtYuHfaKcj/ppzN0IqmMQ9CTM289bSPmdWcrKFeB2sPXqRp4mLyxp2Yo+XuwojvljBx7QypoTgfC56AUOk45qSDSAcE7+VAE5xBuKFTpnItK8TkJuJ2SutUUqMP0JCYDvBrnko+fUm1DD4RRruZzv3Bzbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763458302; c=relaxed/simple;
	bh=xg6g+TbBMP5QZ25O5n98VNRNHQwYlKa+V80ixpW+TF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sBj9en1AgIuhcAXddyDdrUF8i1YxCW2wT7Frw+By8+ZIfK5VeUu5x5J27vLeoG6qUE2SLQbavJ9cObdK4Tebaplh5C0oTdZW7vSvfWsSzy9tAbxokHOoMK+P2k416w4SKFqbtRSwuwRF7luntbVYFhzC23AB2GlL4isWysYLKBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jujc6rAS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ui+NQNNQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI9RleM4168202
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 09:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iHouQDBsurKtZ9RdklN/mtoaAV1IQOKsjLV5itJo+Vg=; b=Jujc6rAS0CjIDNnc
	4sDCoMOwgc9I2ihYd2cA6SGgYPEhxL9a/QfPQza//+VTgcJvJ/5pcBhvlieilUfM
	gakIcNvSZ+CgyQHxkRrhTcyeYZBlhEOoChEq71BP4AdDxgpxTUH9Q9ARa6mxiLhY
	LocIZdshHyygTvjhLyYBVjuGJSoHfS0ofGTRnoRk1wWINX+/HqegBcajTbzcuFyb
	Ysnxzl3LDrPqPzTLC1QqB3wDQjMpUS6q6AwD4S7xkHZmhjASRBuKJHgtN7TOp2c6
	WTFtVFZBEbUO1sH2FNkGfj54BVTdAo6I/oJh7mo/+SV6yY9I3BGHuR3T3QZRNmED
	1gVnTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag593u0aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 09:31:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b10c2ea0b5so217041985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 01:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763458299; x=1764063099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iHouQDBsurKtZ9RdklN/mtoaAV1IQOKsjLV5itJo+Vg=;
        b=Ui+NQNNQCq5IHPA08YzlXS2LGRH+L70xUD+vhIEruqLa+iBmqJPj63lsWxtDilDjEj
         WRPKJ5d2vzKbES3D/TZMeyoM0Fyhh9KE0oa0NLYd+3Y87pXNMbHBPqFa8fFT8PeE0XsW
         cm7JxjLeSuqNcEqlyDJyxYV1t2DmqA5RIdR1mRcMcPvCmSz4sab2zDQP7D3ozUkVRlG8
         5LNbO9Qs7po99spP7dt4TNNRyjHDrHRPT+uM2VV0iCqRbeN3Fz0z94dhTy30UOAEBkRV
         i5eTmswSqCUOurEsrO7upZ/2EYlWNJzhgSL5EVoXc0G4BEkqjQ3Q3nHMdv1EUijj5bZw
         my6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763458299; x=1764063099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHouQDBsurKtZ9RdklN/mtoaAV1IQOKsjLV5itJo+Vg=;
        b=vnZWzIyD2F4AlMu1vbFkJ6sDxXGJnhuROeNsI8zz1RsXK2wzkO/cMo/DKLIGCSd1mM
         w1sBgQ+qS6a3VAXu/xEt8ILyky/Upb0F66hTrL2lXbF7fMiTWk7S2Jllnpg2DyFySl5m
         JjnpOGwjSLFNFOaC+cIRI4ZiohYelv9XSnfI7uf58Aok4K8R7gP6licbsRwGJqIfF0mS
         DSDWLsx/aT74wxZbHVml37Q/ms37rmFiZotlAZBkwxeZUw90bHsQ4Dc71tYZiyCzge5q
         6K55dGp2BYcIWCAGihObPksMgdjd2N4HQq/aw0GSldiWRHfyZtZgC4O8SvO0E8Dy8rBa
         Vodw==
X-Forwarded-Encrypted: i=1; AJvYcCXmdz5ZaOojfVThKJHbF6SwnvAeSZbSgAw++nnYA3DnZ1pkqkv2/qtqt6sOmfRbC0oVpT09C+FATqQ1Z4JU@vger.kernel.org
X-Gm-Message-State: AOJu0YyG7UpAUfKczC1ATOcijYYUyquXS9b71k4l34Gw06Zt5ylUX1z2
	ElEydrHKhjisRxP77mgaZEkh7Md5rnDrhEDFa84ueWFyOgeCxrYOhgZXAUIo6LYJGrvzRrc9t/J
	Hh6dRgPR+MC/RF+fb0uLJkGIXSH1pK56T+5b+F+88kG1L25wrlymtq8bXjepe/XUXC+59
X-Gm-Gg: ASbGnctAfzjCDaVZwh7U4oy7ybsjqanPPYli27WecWQal5nXA6MZqydhUEXeGSCPPAq
	0jwwJeyr5W44pYE/CaFsv2jGJZeymos5py4Jjayk2+MgGM4metNflB87Wh85W/+bc/H9lmuGldm
	Q0FSX/PYO6cd+Z/0XhJSVm/k/s7d5rhEIhdVn0PV7ceZ+zNGpfYmbwny/apNQhBj2cOY7r2/BNN
	jN2mw/FVtRLSqzqCmrCOKT2ryietuleXczh0qRLv1jUobKQempfKgHE521L0a2akp+5vVO+hZdX
	HNe2MRccPFSM1oidSol5yv+66JU42k7C+qfCZx67Lej8UGBBq946qZ7qcZgisuS68WArU5LYIY0
	MnooTGTH+m4ZOw014vo4qpEkRWSjYpTE3SqiOslm88yTMRqPxtJn+JWIAcbdp+bTMO8U=
X-Received: by 2002:a05:620a:450a:b0:86b:12e2:28d1 with SMTP id af79cd13be357-8b305fac515mr156397285a.7.1763458298679;
        Tue, 18 Nov 2025 01:31:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8nb3LT3weyuRb37e8MaLCm5BKsmAFnUzg93HHxx6UWJRPrTTzKCAEqVFZQawQy9xkQSkOkw==
X-Received: by 2002:a05:620a:450a:b0:86b:12e2:28d1 with SMTP id af79cd13be357-8b305fac515mr156394285a.7.1763458298043;
        Tue, 18 Nov 2025 01:31:38 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed80f0sm1308651066b.66.2025.11.18.01.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:31:35 -0800 (PST)
Message-ID: <92165785-c03f-4507-96d0-10442b67691f@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 10:31:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add support for Pixel 3 and
 Pixel 3 XL
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>,
        Sumit Semwal <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <20251030-pixel-3-v2-0-8caddbe072c9@ixit.cz>
 <20251030-pixel-3-v2-2-8caddbe072c9@ixit.cz>
 <8d32460d-894b-472a-a262-4c6a60fbcef1@oss.qualcomm.com>
 <7f686f1b-7cc7-428d-941d-82883decee49@ixit.cz>
 <259477b9-0e14-4785-91d4-67c5a94331eb@oss.qualcomm.com>
 <f15c4ed1-5997-48a1-a0a1-1b0113645517@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f15c4ed1-5997-48a1-a0a1-1b0113645517@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=691c3cfb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gDn4PdyuB1kJIsieQ0wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3NSBTYWx0ZWRfX2yoC3AwiAMhs
 NK0HiqifKT7bLSYIDx7/awjifyzYHd8sF2YWrWf3Nghs4zPcfSaPnpdJ30958jChuQ3cjOuoadj
 L/TrURChZqUg32++km+xhjL6o57gk67GjE2u7bNbv9qJN6txJdKLZhdiHdUUy5cBOhuwd5Cu+OK
 vi5Fve+hxUrU+dpV2c4yTlB5zQSWi7ZNnps2YTKEhYz2QFZLH1+OQeCxspQfnFJjZVxSlsUli1z
 Dmpby9iutjUs3rDuPuIEMpVJd08fhcRpfHCPlP0FfRhCQgeY+3ZeAc4803+NP63QNvi1OgECNIY
 De1hwmk02HAQpqdNShgBKT5m+fw4w1tcLq/2YB5e1N4hRXXhzEuTN1qs5NUkrnk1jbLeFBr2ya/
 uAnG9n7/tf3SiOnAxpEav4THm9wDTw==
X-Proofpoint-ORIG-GUID: rsmPHDsmOD-AldwlbhA-Cmw3HVOcSi4x
X-Proofpoint-GUID: rsmPHDsmOD-AldwlbhA-Cmw3HVOcSi4x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180075

On 11/17/25 7:35 PM, David Heidelberg wrote:
> On 30/10/2025 13:10, Konrad Dybcio wrote:
>> On 10/30/25 1:03 PM, David Heidelberg wrote:
>>> On 30/10/2025 12:32, Konrad Dybcio wrote:
>>>> On 10/30/25 8:24 AM, David Heidelberg via B4 Relay wrote:
>>>>> From: David Heidelberg <david@ixit.cz>
>>
>> [...]
>>
>>>>> +    battery: battery {
>>>>> +        compatible = "simple-battery";
>>>>> +
>>>>> +        status = "disabled";
>>>>
>>>> You added support for both non-proto boards based on this platform,
>>>> there is no usecase for you to disable the battery, remove this line
>>>
>>> Should I keep the status = "okay" in the board files or drop it too?
>>
>> Drop it, nodes are enabled unless they're explicitly disabled
>>
>> [...]
>>
>>>>> +&tlmm {
>>>>> +    gpio-reserved-ranges = <0 4>, <81 4>;
>>>>
>>>> Could you add a comment (like in x1-crd.dtsi) mentioning what these
>>>> pins correspond to? Usually it's a fingerprint scanner or things like
>>>> that
>>>
>>> Sure, I looked into it, but I haven't found (so far) information about the assigned blocks. In next revision it'll be addressed :)>
>>
>> Thanks, you can usually correlate them to a QUP instance based on the pinctrl
> 
> For now I verified that 0 - 4 is SPI (Intel MNH Pixel Visual Core), but 81 - 84 is at best educated guess SPI (Fingerprint Cards FPC1075).

Fingerprint readers aren't usually wireless, so that's a good bet

Konrad

