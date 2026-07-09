Return-Path: <linux-arm-msm+bounces-118051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +9b0EBLAT2pAnwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 17:36:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E3D732FDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 17:36:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SehCyFsV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JLp7HaVU;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118051-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118051-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A82E3048386
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 15:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF5240E8F1;
	Thu,  9 Jul 2026 15:31:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C153F9278
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 15:31:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783611116; cv=none; b=e7reNsx+KNVmW/wJBeraGilWCQC3ToKM78w3lmimqdJqut1Zv15I1HAfc4kcNYmh8w0Ox0JfpNsX/LnKM2zPawJKE8AdKA9aQ2uGGq1YomPOP4Q+QWh2rW+Uk6LZZC93IQ+QvgU0HdraIZ7G8T1VrtgkE6uDb/7jvaJ5wjBOFGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783611116; c=relaxed/simple;
	bh=1ehDfQJBh0FS9IAclGtzErnOur6nf/KYHvnI6lTssXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j6/9wC1GSqKBdi3ZRUWo7gkQ1Sp838HU7ZSfWsXmOiWya2Rt+6MASqwbOFw7S7ybTkAUcDOwFPPxxxuKKV4iM4oI1LJCH1rNmuqFBISLiFmFPjE363eeWpb/50RakIasY8BEoQ7uyU6PhH++n3hUMSFo9SqjnLZAZjvSPeEbiFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SehCyFsV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JLp7HaVU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669DwPNe2014470
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 15:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fVI01ZrLuwrtc4F+2tgqOhoc+wCEuLJiM7EUlhKpy5E=; b=SehCyFsVIdLx3JSV
	nkvpnEud9xfKUQ1o4juo5u3APxObdxSXOBevSWq0cq9mYKfk6o3jecUULm9z28hW
	MIFQVuzsn4w2zXCjb9RQefcW1mtKpO03EjQVRyYQA1mAPGQudraShZgpuR6GJJ6v
	47OnmqsVKHd90S6axqKxAjVA7mNrdwtmN1XZ3zzNbnj9dj2hllTp/BAuIMhlCTy3
	kT4TmIe/+bzbjgDdAt3hsjWqSixYHTf0sj6S0s6nFD7ZHvZ0LHr6cerq8cJUS+y7
	ife9DcvDiNiXpZcL/r/uljhqa6nWl8dOmEH59t3fC5URrtty1S9t7OjRLG/hmwNC
	Zcsb/A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6mkaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 15:31:52 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737ddaf8c57so36682137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783611111; x=1784215911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVI01ZrLuwrtc4F+2tgqOhoc+wCEuLJiM7EUlhKpy5E=;
        b=JLp7HaVUEN4k3uv32MJuiUGk6Bm7VckhYJdls59nKafNnjTbTqX0vSrqfwaDSwtV6h
         vHPkDBQ0OwE1nmWGf/u6FYyx9Uz5QR4LLNaifEqXXITy1Lisk5layU6lgeG4ot4h8sFz
         8L+Xh3DwdVX/1Ur4ecSBGxNKksntFIX0yAREFM6/Sz5UKagzHoUQHruJYNPDYN9lDLoA
         VsXClx6l2IRoaHdfd8Mfwrj0zu70UjQIOCnWWnmsCIjah5xxDdaRuIF1qOWmhUuwJ9WO
         pQYtdy0alwmjmZMLbmBtM3uoy4Vy8xkCg9DfDxTZ9Ul3I4JuSts1wSB7TVv7p0LGctGG
         Uj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783611111; x=1784215911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVI01ZrLuwrtc4F+2tgqOhoc+wCEuLJiM7EUlhKpy5E=;
        b=gwnHLlu96BcU6Faj+4P5WSe/3qkJbwDnkECLYJbFmFG2/EhsfvLdFwEhiUj65wCRnY
         PpjYRMJTdOMq5+0ydg1+qtR95xX2QvkOhY8uRo6DBwITjg7l290YgpCO3ixhS5RjaWiU
         DnOHG0bnJdnWcQPVYISDHOV0g8GPH58ql1g6LqcfVp2jis5LFPqEjBHhEK5Trd2SXPi6
         b5LXCff3/YSSfbO5rENXruU2T/iOsqZpV6VXvaCJLWj0wWSnTHXi2ePCqa2STSohc+fl
         I7f1n68Yo3PaXYpFlgmn/d4H3YAWQZbWXS1IEVadk3ZFWS4ehfzGMbK/eKCpi3qloPB4
         PY9Q==
X-Forwarded-Encrypted: i=1; AHgh+RpAf2DMhvb/TqgAK5NpyMZsA3Dl90l+Damrm6fquFOntxLXOOab2tCb4wAeMGdeUlWZVGnJEGIgCqUPtGUx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzknzr4WU4OuzFzE9jSwAj89KnET12arKeKPCsrxQG5AC9AyWOu
	iEi35FPPFLPcelm+uTGfTq+OAnblNHKp8lxAqChQTcgLqGPymR1t2ppN+u+Z+NBbNaVv4IycT0h
	kEE/lWQx87qFc41cs2bcgzQROAVC7J8afTTiNxKoieKqRqFZEPrhRRA3269D3k9z4Ivnu
X-Gm-Gg: AfdE7ckhqAnlVvTaY5Avv7arAcKYHplh4d18DaDywsY93iAq8vdsw98FWh8THEWy0wX
	UspeLUAJojqRyI8xmy63eeiJx9JiiK1cqjCDFVQ+wo5kyJstZCFjfDuuq3Y0jFuMeKQH4nQ+ziw
	L+fuailPWd0RlvMNSbDfO9kmhL2RylczTTFRQCSx77elOtCujx03mu+vwkMJzZCdfebyhWxh77N
	wxZUvt80cG1qia2PGNFqYrqSaEjPP0g6U0CyXuJhNVpfp8FLVkvIcjW5rU3z8VUu/YwX4MP27Ts
	GkbBGd+jvjuCcwSe5A9I6lx0PS5GGEswX3h7Hd/lkVUtM44YMbJVBphHGml7+MagQTLgBZGDg3g
	tfoakr5pRwQUhdgRijZS6qMHO6aNUlDWLnlo=
X-Received: by 2002:a05:6102:8017:b0:631:267d:157b with SMTP id ada2fe7eead31-744f0b10493mr1234355137.5.1783611111502;
        Thu, 09 Jul 2026 08:31:51 -0700 (PDT)
X-Received: by 2002:a05:6102:8017:b0:631:267d:157b with SMTP id ada2fe7eead31-744f0b10493mr1234326137.5.1783611111076;
        Thu, 09 Jul 2026 08:31:51 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69aa805105bsm3783376a12.21.2026.07.09.08.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 08:31:49 -0700 (PDT)
Message-ID: <5bb37e44-060e-4b49-8bf8-1d5393f86a39@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 17:31:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Enable first QUPv3 wrapper by
 default
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260709-dts-qcom-eliza-enable-qupv3-1st-v1-1-e9a6904d0dea@oss.qualcomm.com>
 <6f2b72ca-8560-4e69-b971-afdd9e2a7a28@oss.qualcomm.com>
 <tm4tyrsmzhbirfgywc5dpqzea5t5emnmyamp6l626mfaxtejsp@slgppnnsj464>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tm4tyrsmzhbirfgywc5dpqzea5t5emnmyamp6l626mfaxtejsp@slgppnnsj464>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE1MiBTYWx0ZWRfX0kUmZXJiZ0C0
 WsM8zjW64k3F3XqDLEt26FWN7LamiyYrmb0vj2vws1Vc6Vjkr5d2Muw69UDX/T0A+kOZKlcaWON
 6HVtM3KSGOnsiVDNYxzUl7qKmfqVKug=
X-Proofpoint-GUID: lOc_UEIvkWyezl7jg8fMYaqew62J-Zg1
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4fbee8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-LomneP8efBk18w0HY8A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: lOc_UEIvkWyezl7jg8fMYaqew62J-Zg1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE1MiBTYWx0ZWRfX9EwN0ONV+jaQ
 fbWNpntbQTNER6UGIw9eyGLIAfduH5ndZT5RvrpC2AzadTIfrX8cCTrL+yUTZ96ofWWJJba0Ofz
 9aE8GDlJaAIVSQQ7Z2M9ktcsjfeWblqRQPs/ScB4vihdjHor9tvuV+TWWNuJ+uRRyUkOWI1wTaY
 YG41h3XNg8gBovQpR2S5uQbEA61cGrl3TIKhJwHuKbJaYmUXXzJvkd/a8ikA5f7cxr9/GaF+WPp
 Zb7iNNuOHt7O4zsuVI7Mfq2Oh1VjjPEYcIJyGj8ebm1s9PIzM2Y+9w9s0P1anecW1+UyX7I4D6x
 fO9xaH3Nvxy6NBNZK7xv7YB8O2Hrr48v++qW2mA5I/edUobA9Sd1KNFDRDr30N2t5qFfbWAVHC6
 tZ4VmoNZBOHHnNSAp6I8jiZmTVXsWAeY1Hw8Aos7qt2/9fgdeAwcaI9DbPbBhQKGS4KexGKcJvr
 hs1JOodDCkwhSDQIVdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090152
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118051-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:abel.vesa@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3E3D732FDE

On 7/9/26 4:07 PM, Abel Vesa wrote:
> On 26-07-09 15:08:09, Konrad Dybcio wrote:
>> On 7/9/26 11:12 AM, Abel Vesa wrote:
>>> Since each serial engine will be enabled as needed in each board dts,
>>> there is no point of disabling the first QUPv3 wrapper in SoC dtsi.
>>>
>>> So enable it by default. This is also now in line with the other SoCs, and
>>> also with the second QUPv3 wrapper.
>>>
>>> Fixes: 844807e1f89d ("arm64: dts: qcom: eliza: Add QUPv3, GPI DMA, SDHCI and LLCC nodes")
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>
>> Go ahead and enable both QUP wrappers and both DMA controllers,
>> a subset of both is assigned to HLOS by default by the tz config
> 
> But the other QUP and both DMA controllers are already enabled by
> default.

OK good, thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


