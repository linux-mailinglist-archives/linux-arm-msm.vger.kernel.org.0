Return-Path: <linux-arm-msm+bounces-107917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJxHEhgjB2rasAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:43:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5096A550A8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 47C69308B135
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93532D63F8;
	Fri, 15 May 2026 12:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eZkJLlBl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RseFilte"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEE62D2385
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778849856; cv=none; b=bUgHMp3JaoUHUIwrNiywNga4oolPuweTW67gcBfqI8bl5o2UFk35giUj54SI4a6VarI6hrwnRq5gJ/9JPAYwP4/QUTz519jK963l2R/qqM7dTnzEnlQTJg118EyPGn9Lwk1K/cnA92NaR7uWLWqQxTHi1PPlgkqeP8w3vxc165c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778849856; c=relaxed/simple;
	bh=6jZeY3fFm/RWu46vschP8gHQy+Evtx8dFt3HodsRJEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sRshU1jIzk7vejiXfSrjdw03O8jDTSoUrq4ixLUjkgEhOeudzct5yQct9VoA+zctygiLqE+LR+Kt8Z5m9TIujq/2VFvCarOFVHBHb7uE5KRs0BG2nhJxNaMKRb5F/IEwJBDLhAj0MiaPrtTMioaVR2nEygSJiTKN8Ott3QykT0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eZkJLlBl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RseFilte; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBUdZ33797373
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PdkIR6RMfY5OxV5lPVO4LlZZZ2NLTbP3dRMQlqgS3FU=; b=eZkJLlBljMbyAyQr
	TgNgygTHkLS0ix+U9krjIhm/mFnhYTguxqxgyrQYUaEkPRS2woekwR1HkcueC2j3
	ru4Cb5g/HSqYHEao/G4OqUgZP9zbt3C+qc7SSyhwf9aFHRl19DzniO9OiSH+O9/t
	I9zsoCWL270oBXW0xi1n77WO6LUBmwNIF9pN00iVSajFd9Hcq5rMmty80ND5iJpd
	1bEw2A5mxrHSieHNylYINM0M5SU6BfQKFjK/mtAgBymSjC7KLa2M/H7C7j7KDPbz
	NKXcfUU+FmbYeI1JvyIA73CxX8B5k8GBIfbo4ny6zdfKTsQC7myuPDnv/UygjSWN
	XqPc5g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su8pj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:57:33 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-633dcda64cdso451267137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778849853; x=1779454653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PdkIR6RMfY5OxV5lPVO4LlZZZ2NLTbP3dRMQlqgS3FU=;
        b=RseFilteNn+qPff2YG/aUtw81drJSMqs+HSKFGoaf1GskyLuVnZXVsmTyyanQVDN4Q
         MdN/uAIv8mQEkZpB98Ej34zJuVQb99/fFpVN9Z9BnNLbVgGhSRFnvfRdT4BbQFBWWfL7
         nc025NMIsg5EBD4R9y0w0pNm0fVDw9ohdZYIjrpYvuGjLmksTz/KGsMottR5Egxgx6Zh
         T2ING6TTyqxhr/ic/YzfbEvQKBEH7Gb9M22cNN5gsMAVLknecNiYC5MpvrmMJ07MwcH/
         ELgCpWfOo8hBivm23WSRPa/MQGMITM19fpW4svLG2ZenpebxF9TFKTL5q59Il5unmdol
         8PhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778849853; x=1779454653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PdkIR6RMfY5OxV5lPVO4LlZZZ2NLTbP3dRMQlqgS3FU=;
        b=N+HxHxGop9+HOI52VoeGLboGvRPAPZ9tRqCsm+Av7StbT/R8YJ+Qn9oCUybathFsg+
         5k9imas3Hp0KpYAoGEf3+f53o26mnh2PzlT5LC+fvGHbF7037j8QCwhpERiy6oZEkYtZ
         cJJrpxKeG8bgvWuLHwJQW46ftbUrEPNiCK72uDQSRdEFxYK4OiJJOdX7JHzC6e7hIyBa
         xaUaB7pAViyizfN8FoBvYRVsQdjXj1TItLT3PSKwsNNARUrfM+iqafKRywbY5rh6Ar8C
         PH41Bqj6mOauBX8aRsmYBeq0KJmVhTKbySOcdPh4eMgUi/bXosxLCUrkO5EclQqIjEdc
         V4OQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PlHn9xa2TVIEg1L/OsjTw2o1PuCTFLfVcQGrfoX1S4UsIKCA/JdMBNU5/qtNzfaQp4LWCQ36DAq6z7Xo5@vger.kernel.org
X-Gm-Message-State: AOJu0YzMVVXiOewsmlOw/6OGVqB0H1+dzdvAD9iPSldEzzTeUFZQIU4U
	V9zAlRqZH9iDHIh1k8i3/G8svL33CXbxhISTXo3aWJIUuWGUorLaGIzGkfS/zsCKaC4VTqsUqVG
	21UOzDt/j17ANCFMyN2VW/DA9YA2eaWFVt4eRwG8AyAmnZO89LCt2mqg0BXsfBrK4fSZX
X-Gm-Gg: Acq92OEj1YbVTo4Vm8+Si3+AOEvi1cHDhpRfP49y7s9kIs35ykPNxgDJIXVi6GD3O/6
	m/0CIEDsjyfmLNq5B0MmPhhIUvvC31JRlUmoOop0mrLfCp2pne6z6QiH1cwazTIo94mcmz1ENfj
	kPZEzzzTP0wYTAtE9GovgLd/OEXyjjgPT8yWeVpfWDe27PhsaAPknFpftNEIe2tX6pD7TMWPLeX
	NIo23yhVHFZ96EEiq0bNaGaCqmFtNDuuvuOW9wRNVWJ9fzDd/FVQiAxVpZ2oSjzJTanibAWTTyr
	Q/ZtmoIPFNlTaRMUkTw/zml52K3NRUhpAWU9id/zOlkO0+MBiaBp7gr2bKg6zVVXTVNU+oQm6VL
	oe/lTI6llGyOXihqEXbLuuYgXcP5ehLOi/RiRqnRboybeFuwxA6TrZ7HQcwb9lNMZe7H3kKDYAn
	Wcsp0=
X-Received: by 2002:a05:6102:126b:b0:632:5db8:f656 with SMTP id ada2fe7eead31-63c002c3749mr339397137.4.1778849853063;
        Fri, 15 May 2026 05:57:33 -0700 (PDT)
X-Received: by 2002:a05:6102:126b:b0:632:5db8:f656 with SMTP id ada2fe7eead31-63c002c3749mr339390137.4.1778849852436;
        Fri, 15 May 2026 05:57:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4dea93dsm221177266b.38.2026.05.15.05.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 05:57:31 -0700 (PDT)
Message-ID: <bd4e93dd-5293-4cbc-bfbe-314b3f348d31@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:57:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-10-f430e7485009@oss.qualcomm.com>
 <aead10a8-45be-4f7a-ac6c-35a99a716b3c@oss.qualcomm.com>
 <CAFEp6-38=hcUOvW1yd+hRZ2nHV8sLxiLeB18uu-au=LgA2bQTw@mail.gmail.com>
 <0c6c9366-a190-4143-a0fb-2aff38ed8804@oss.qualcomm.com>
 <CAFEp6-1uDO7UzYm+5ejRH0fCtnFZSA3z_Xa+4ibDEbXBh38ueA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1uDO7UzYm+5ejRH0fCtnFZSA3z_Xa+4ibDEbXBh38ueA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEzMSBTYWx0ZWRfX+imlakrHq9V4
 mmAYbXWYjLOBoAJauTfiVRZOMNYgWWUBGA2b8jApUvgYvsDsyCsXofm5Li6djVnw8Kid88c51sC
 iYVsWGDdLM8PMf/G3bKTx7qrXDdcAdryrESJKFxYFS33QwWrzNt/KV3JjBa4hUM+PgGo1/iFdBK
 iuilkaT9zjPitI4hajsHm7Lrmj9cj0WAr86aZSXz+dq+T9YsBlh4kdzztGebELSZ0daiaWlFHEB
 xVjUZv4sPM51VL9ykXiaeXWU0PyOXz1fjI9Xock487OAkfPezIqgZpu61v/FNACZmydgs24XLjS
 xroZshycuQcQomg4QWHWiAOxRZWeiD+FJcKqXfJsngpTf8VgwZBnytS3RsUR+mG5rx+3jtbsxjx
 t/c5UDcu2ZgTwQ+ibUDrLrdRmAO4v6jzrHzXm8XEhpFdG+aX/rtWJCor4PeUVm3+CvI8KuavlFd
 Jdj9B7lLrmFQnyPC86Q==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a07183d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=MDVsdYFiAoUeNHFhHhoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: Kf7OwBaAZkcheKj93m7SV3WkgavgGooo
X-Proofpoint-ORIG-GUID: Kf7OwBaAZkcheKj93m7SV3WkgavgGooo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150131
X-Rspamd-Queue-Id: 5096A550A8F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-107917-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/5/26 3:16 PM, Loic Poulain wrote:
> On Tue, Apr 28, 2026 at 12:16 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/27/26 10:33 PM, Loic Poulain wrote:
>>> On Mon, Apr 27, 2026 at 4:22 PM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 4/27/26 2:43 PM, Loic Poulain wrote:
>>>>> Add Devicetree binding documentation for the Qualcomm Camera Subsystem
>>>>> Offline Processing Engine (OPE) found on platforms such as Agatti.
>>>>> The OPE is a memory-to-memory image processing block which operates
>>>>> on frames read from and written back to system memory.
>>>>>
>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +        clocks = <&gcc GCC_CAMSS_OPE_CLK>,
>>>>> +                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
>>>>> +                 <&gcc GCC_CAMSS_NRT_AXI_CLK>;
>>>>
>>>> Should the two AXI clocks be aggregated by camss-top instead?
>>>>
>>>> Otherwise we run the risk of the OPE driver setting a rate of A
>>>> and another sub-device setting a rate of B
>>>
>>> On qcm2290, OPE appears to be the only consumer of the NRT AXI clock,
>>> while the capture path (VFE/TFE) relies on the RT AXI clock. That
>>> said, this may not always be the case and these clocks (AXI / NRT‑AXI
>>> / RT‑AXI) seem like they could reasonably be managed at the
>>> camss-bus/top level.
>>>
>>> The open question is how the NRT AXI clock should be enabled when
>>> required? enabling them unconditionally (similar to other camss PM
>>> clocks), introducing a dedicated CAMSS top‑level interface for voting,
>>> or leveraging an existing framework to handle this?
>>
>> So, interconnect, or some internal, smaller version of it?
> 
> Downstream, there is a CPAS driver that handles these clocks in
> conjunction with the internal CAMNOC block. Dmitry also mentioned the
> existing icc_clock mechanism, but we likely need to investigate this
> further to support proper dynamic scaling of the required clocks.
> However, I don’t plan to address this as part of the current series,
> as it would significantly increase its scope.
>
> I believe the current approach is acceptable for now because:
> - This NRT clock is required by this specific sub-block, but not by
> all CAMSS sub-blocks (unlike, for example, camss-ahb), so referencing
> it makes sense here.
> - At the moment, the OPE only enables this clock without setting its
> rate (i.e., it uses the default), so this should not conflict with
> introducing a more complete scaling framework later.
> 
> Does this sound good?

Depends how you're going to want to tackle this debt in the future.
If you go through the icc framework, you'll end up needing to alter
the DT

If you bake in something internal to the camss family, say
camss_foo_bar_request_bandwidth(u32 val), you may get it done
without that. But I don't know what practical challenges that will
entail

Konrad

