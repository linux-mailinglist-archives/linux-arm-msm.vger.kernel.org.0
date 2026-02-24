Return-Path: <linux-arm-msm+bounces-93995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAGjGE6onWmgQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 14:31:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF2B187B84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 14:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A549302A554
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8F039E184;
	Tue, 24 Feb 2026 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qafm+dss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xa8UzC5A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AB136CDF4
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939912; cv=none; b=Ya0c/7PJIwngTBo51VBJHe90cUDahOricdIz26q+JJDo9EgQ6zShGyyJ1SPm1sQy/SMvycG/RInZpvTkqwA7ht9uRat/Xo2gp7GT3c6PHuevCfu7ISBdmmjLCLzqR3yv5mL/ZsK5KdSVarTT1cIap8oBtuV0/pNkt7nMoSQLKKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939912; c=relaxed/simple;
	bh=CyXybCP2CIrZVrNr/6Av/CKn/Tkw5kvvtvSdn1OVQfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UAAFRcc8OtsOH30nC19yGNa2GqIs/Fc2s+dOYhBv7CeOx10RGrFHXqvvK8/hel15w5zMVzOnW4+0mZih4lD9bv5xcz7DWbXG6zSvCq60CVpG8+PAz/NHZe8khGJMN5epL5kreLVypy+8nrt1Tjy24FFTerjay46vDtvFVtyuUi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qafm+dss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xa8UzC5A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFSho1446364
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gBLQ8De82Wd4XTyosqLd7sRYfu8OUMzWZSMfRzba/Sc=; b=Qafm+dssDOA9e77r
	RCmSPAPd7B86iAhjvAPwtiXfQqXkUbWo36P+TyOjY1zZmBt7NplA/2a22wv2lftp
	VB5x9cv4kVYAO2cLvFV0RSAeIUOrhPtHC7G5gTPnsvH5Axfj6pMIcEzJAQnRe+o2
	ix9+LCzgQOjUr7UZwd+Kbijzr2kwt1ecSidZ7CYzsAvn9Hn6mqVaAj+r/A5VtXG6
	lh6esIMnmd2HdbUTAxTEEC1ZSlmQplPRmad+NdignJxmK1XBgbJg2zGHTWRmCI+h
	cBHsMZYEpXPLdLY3ys1WuWTuVYEmR6z5vGAm41hi2E9LcvW0C1TTdnU6yKCjqiuf
	j1hGSg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtv9u87w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:31:50 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5fd4945a471so1164711137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 05:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771939909; x=1772544709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gBLQ8De82Wd4XTyosqLd7sRYfu8OUMzWZSMfRzba/Sc=;
        b=Xa8UzC5AU6kNMCbiB5blOeipvCZ83WDftz9/DInzu2R00qeMJf4XFLcI6oRmspV+lF
         WmIDpr2uilwd9QVgttVF1WgsBJW6OSGhn42VDpRvsC/MhhjDjm5umy3zRD6hL7hOY/W2
         1FO81mgkMxUzHazcfKO2rT+qPNkaBhWSkoqeSLtQuHtRm6nbNUpv+zAwgjGrMgsWSBda
         o3muM8fS/22c7AKa9T2/VyTNQuKEcLANKfIyImvtPW46cuTzdcvXd48fjFXRW6Xksutg
         +S0O4Zk3Vqlw0m2VtWTZx+ywvgv9GuDIvV5fL14mylKfqEFHQd58nyhIgHmXqE2TkfgT
         xyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771939909; x=1772544709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBLQ8De82Wd4XTyosqLd7sRYfu8OUMzWZSMfRzba/Sc=;
        b=tBhYYoMT8d5U5AdI21ftnJ3PcY4j5pN1g2TrRhESS1gR1LtjzaDdkm6n8fNMrAfTAO
         hcxvQYrHDjGNS5Q3PT8j2thvqf2fF+rdEvURZL/H7mFH5sPz/tmiwTFePB6vT4v08rBS
         3mKTlRx6pe5j621/36L5wbLa9+TqajKnwzzhxpLTxCQDoDLxCTjSio8ZbTVDvsieKRlM
         ehLe0nmBiuPcYcnDYFPcn0R5tmgOlcSt2TTm6Nc0BYCvWTq9FKodcYj4n6gF7hdnPpiU
         w00fK+0T9oe6OlBoBT9i+Af4gCl6eqgaLmlbgmm4O3mo3afKIAfodi23yzziN5wmVOGE
         cvEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGKCaaMVMA7oUsRjVJsxNfdVu14B90SbnQaAsl1QTL3l7amlldUdrLDaDJ/tOGJNqGrXFFtnTpgF/yg9+b@vger.kernel.org
X-Gm-Message-State: AOJu0Yww3do03xz/2rVNUL4SSp4YbGsTIXsKDEa/jtYE1EexL8QEPRgD
	xEIRUrBZB9xq2GbSjR0Nu67nSdywe6juUhhQnteUuTxsgviiOPvV0quB0/9iUmtZLqeg9pUXTFS
	ioVVXE+hqTXT4LomDq9I78LHo1iuKlJwLqjfKgJ6oKWN2Z22VUoAu2PB674J52CLWcooc
X-Gm-Gg: ATEYQzybiLHVs02aFE0DC/ojGkCtFyG7RrNtiQbDRUUWLhdT2cZTnsjTRC34v3WkoSm
	905kLwmU9+DuCWUwaMjA3S/M1GC7x5Ui5elRmGfmyf3dLnH1Q0zNFZMnBXrC+w3d/cXJfPIBeGS
	rgXvCAX3osN03I3taAfcZqwAIRnzXfqTc039vJi+ptg3XXuoRylzAH3286jYfTnE2DhXZLvnU7A
	f8Pmc695FBFMt78haswtsL2HTkoz/Q9zcOyMHGbpjXi/hhR80nu2O4bjY806iFEAw2F7B7FMMht
	Aa40M6544VQihUg6rMjqbWXtPTCvDnCAvBOtpbuiztHpuOvkDIlqb4itBHIfFuluHazJY8tXEad
	P8urBH40d5tV3DV1+W/1FxLuREXAZPEBMU7xoweAgxU4YNwvkYou5ABENDPrI8fzEXoGVnmqs++
	nsK5c=
X-Received: by 2002:a05:6102:50a7:b0:5eb:fc32:9361 with SMTP id ada2fe7eead31-5feb2c1c2bamr2329989137.0.1771939909173;
        Tue, 24 Feb 2026 05:31:49 -0800 (PST)
X-Received: by 2002:a05:6102:50a7:b0:5eb:fc32:9361 with SMTP id ada2fe7eead31-5feb2c1c2bamr2329968137.0.1771939908693;
        Tue, 24 Feb 2026 05:31:48 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084c5dcb2sm424792266b.6.2026.02.24.05.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 05:31:47 -0800 (PST)
Message-ID: <4bcf1512-a567-44a9-8a38-8976f65c00fa@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 14:31:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
References: <20260211-enable-ufs-ice-clock-scaling-v5-0-221c520a1f2e@oss.qualcomm.com>
 <20260211-enable-ufs-ice-clock-scaling-v5-2-221c520a1f2e@oss.qualcomm.com>
 <bfbe04db-bf64-418b-a75a-88879bf0bf2d@oss.qualcomm.com>
 <aY7MidG/Kcrs83O9@hu-arakshit-hyd.qualcomm.com>
 <3ecb8d08-64cb-4fe1-bebd-1532dc5a86af@oss.qualcomm.com>
 <aZYMwyEQD9RPQnjs@hu-arakshit-hyd.qualcomm.com>
 <6d2c99c4-3fe0-4e79-94e8-98b752158bd6@oss.qualcomm.com>
 <aZgOUv+QweA7vE1W@hu-arakshit-hyd.qualcomm.com>
 <5bf31bf9-835b-4b87-a4d0-8452d516f13c@oss.qualcomm.com>
 <aZhCWMTi3seAbXo5@hu-arakshit-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aZhCWMTi3seAbXo5@hu-arakshit-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vaf6/Vp9 c=1 sm=1 tr=0 ts=699da846 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=zMuZoWC4Nr6WuNNbOkAA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEwNyBTYWx0ZWRfX/adiDWJQvITT
 bnNNYuh9FhQFLh+T9AZnAO9R1gjNjuTlyFAY4OFJEUTtGF4mUpGhpzi6ty6UA5IQiLG2N2+EqSN
 KiywyOW68V2CCDfLQ0B+/u8wbc8gvTnKzHFyzSKR8qJ0dPQRX0qEcyEiSJJZnFPXREn288QlGEE
 q7dUJm7VtOwc7cEnYTsZiB8KG2A9UXy1gcN+G4+sUl9aNO+YWUV1dFApeurJU4i81Xd245yL8xO
 8gwAmLAWSCbfm2giQ+UbYBN/9RQ0td/LoKB9oPBkIlhL64otmscwYWsLWvUAHIsOkWsL9YWJDB3
 +04DYBmpkGCJ9Jd2U6NZSdzXM+Y/Ju782hLiv1bNUvurm9D3yVciNfUcaMfGuC3T1uBwgMxFjyP
 MYjWeKNwfsckZKazmCt+AjYYJA/i1buFe+OD9iZlvN/F2CFso5R2uUGjgLy9iH+CDfziuXEM6sT
 wKwsugVxZj3DxaQtzrw==
X-Proofpoint-ORIG-GUID: UjY2SwETHxXVjW1bKDX3p3zhmlQhKyGv
X-Proofpoint-GUID: UjY2SwETHxXVjW1bKDX3p3zhmlQhKyGv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240107
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93995-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ADF2B187B84
X-Rspamd-Action: no action

On 2/20/26 12:15 PM, Abhinaba Rakshit wrote:
> On Fri, Feb 20, 2026 at 10:42:58AM +0100, Konrad Dybcio wrote:
>> On 2/20/26 8:33 AM, Abhinaba Rakshit wrote:
>>> On Thu, Feb 19, 2026 at 03:20:31PM +0100, Konrad Dybcio wrote:
>>>> On 2/18/26 8:02 PM, Abhinaba Rakshit wrote:
>>>>> On Mon, Feb 16, 2026 at 01:18:57PM +0100, Konrad Dybcio wrote:
>>>>>> On 2/13/26 8:02 AM, Abhinaba Rakshit wrote:
>>>>>>> On Thu, Feb 12, 2026 at 12:30:00PM +0100, Konrad Dybcio wrote:
>>>>>>>> On 2/11/26 10:47 AM, Abhinaba Rakshit wrote:
>>>>>>>>> Register optional operation-points-v2 table for ICE device
>>>>>>>>> and aquire its minimum and maximum frequency during ICE
>>>>>>>>> device probe.
>>>>
>>>> [...]
>>>>
>>>>>>> However, my main concern was for the corner cases, where:
>>>>>>> (target_freq > max && ROUND_CEIL)
>>>>>>> and
>>>>>>> (target_freq < min && ROUND_FLOOR)
>>>>>>> In both the cases, the OPP APIs will fail and the clock remains unchanged.
>>>>>>
>>>>>> I would argue that's expected behavior, if the requested rate can not
>>>>>> be achieved, the "set_rate"-like function should fail
>>>>>>
>>>>>>> Hence, I added the checks to make the API as generic/robust as possible.
>>>>>>
>>>>>> AFAICT we generally set storage_ctrl_rate == ice_clk_rate with some slight
>>>>>> play, but the latter never goes above the FMAX of the former
>>>>>>
>>>>>> For the second case, I'm not sure it's valid. For "find lowest rate" I would
>>>>>> expect find_freq_*ceil*(rate=0). For other cases of scale-down I would expect
>>>>>> that we want to keep the clock at >= (or ideally == )storage_ctrl_clk anyway
>>>>>> so I'm not sure _floor() is useful
>>>>>
>>>>> Clear, I guess, the idea is to ensure ice-clk <= storage-clk in case of scale_up
>>>>> and ice-clk >= storage-clk in case of scale_down.
>>>>
>>>> I don't quite understand the first case (ice <= storage for scale_up), could you
>>>> please elaborate?
>>>
>>> Here I basically mean to say is that, as you mentioned "we generally set
>>> storage_ctrl_rate == ice_clk_rate, but latter never goes above the FMAX of the former".
>>> I guess, the ideal way to handle this is to ensure using _floor when we want to scale_up.
>>> This ensures the ice_clk does not vote for more that what storage_ctrl is running on.
>>
>> Right, but what I was asking specifically is why we don't want that to happen
> 
> I would argue saying that, having ice_clk higher than storage_ctrl_clk does
> not makes sense, as it will not improve the throughput since the controller
> clock rate will still be a bottle-neck and it will surely drain more power.

Got it

Konrad

