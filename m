Return-Path: <linux-arm-msm+bounces-99295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULBpMQNSwWn+SAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:45:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4240B2F51E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9E603287099
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7BB1E5B88;
	Mon, 23 Mar 2026 14:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3fBvCUF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eKGwUH7l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1C91A6808
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275526; cv=none; b=GA3AntC1r18jw14sMmLH247VUyFicsX22nof24YuKSGzo1MvGhChlSxra9ocGkHhQu4XFXow5/FxW1wZXNqe7U3zwIkXHiRAtC8qx169o8Ej9X9OeacI12UjGVhqOshch1NG0IrUw11rvoJMOWQsPB6FbthRd3WtWTJS36/hNVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275526; c=relaxed/simple;
	bh=4pJ5vtbkOdwfvHYelgkp86SMhQ1DS8/JkJaKzY6Cfs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gnnFGr23Db7wXwgHEmpomt0jVGdq7NN927a0S4riMxUP2vJx999Qcpr87y9IBKSZi+1H1hGXKGCq3Pm8SSTdeqsqHiWuuzvCacU8ShdfcPXBSt/PpH8QKzrUfqDd+K0feXM4g7Ie2PgD6NTkncP5yYHZXXP5C6B/2/acYtHwuFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3fBvCUF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eKGwUH7l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N9YXv73737936
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kplTETujYsicfTISPD+Y0TxBbeNRe8EKpDvZR0VPp9U=; b=l3fBvCUFxRzWls4q
	US5zzSBnulhtUiYSI6XLdXDvbResiL+19tC0jfo5m5xoTvCFwR+cMmXrxt5CjcFK
	8p8jwF13iXko6cFxtx7FBoDO4Yd6tXHOEYLlBryXnt1OfIB2OuRQB2zkxsT2+iQi
	dpFVwi+tk/Fynlh5FzGydjjiKCCYvLxtM1Uu/RkbPGKR9nyxp0FAC4i7S3q1Yn2P
	tYfT/1/rcNvHxYPG/cxEV9xW/TLCIBLsu7kIUlCVs0VJXN67R9l5PriSpo+6JOPm
	RUiGAIadwW/l4ewTlSGMMMVs7X8AppiRIAUsIN0JIgg5QRJkNXBQ4BkH4BIIBMWZ
	FLsd5Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghdmvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:18:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829a655f5e4so1656764b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774275524; x=1774880324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kplTETujYsicfTISPD+Y0TxBbeNRe8EKpDvZR0VPp9U=;
        b=eKGwUH7lifnGm0k+D91c1M7SZpXMxFNxqDHhViaZ9RLRGr9MWCmUvcubevCsxh+wJj
         TTRriT/19T4SI8T3+583aru97iO2k9Ms4/iqqcwcU9CDTHxpuXbAZOvBpQt9ddodER9X
         1ESAFsIsoxz2MGgLbhhgmokazlmJBrXzrTKO4Eq+QxFNtedBf7YqclJTmXFWr8w7/Qub
         mwJWpMR3HEUjLhEYjrXYze2mezosq0XFDGCco72FVAYXOEzP3WnZgldrfONIF4fJ10RK
         9mliOB4HjmTIJbdIx4UlL0AW9wXG0VHJF2CoRPpBqhyTMgssJoe3pt9F6PBOURGPfSlw
         hnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774275524; x=1774880324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kplTETujYsicfTISPD+Y0TxBbeNRe8EKpDvZR0VPp9U=;
        b=UjxuF7IPZFT3FvYD8Gcbxogsv6yofb8y96kmkK1O5MzPKK/ZiRdhCOc8sVbsMQuCBR
         Xe9FuwV2fFJIgcaXClQJXEFTXJp2g3Fmj7/Qy1Z+aiWj4ZwdkTxoYvOTodWrFcdw1d2K
         GRmovEpTQzFZxTr+ORjKusRoUgoZEZeqr8G9+W3UJg6eG/p6Q11wbQ6YScKj3KfTpsta
         DaNGJWsbXcYracpOYOZbu4yTV/P3Osoxc/VGjyKVBVeQnQin0xXUlSTsZHtPUDtNMYJD
         GwCJc36Zq+M6SPE5O7GM7BRhOAezvvAChnUz7m3aL5/yGXXoRf8kllyOvYWFPgkPlNs1
         16Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXM8WlADQO3j403a2hCvQm1/5uFKfeZ5dYJrCAEk/S9r0s478J515cCca/UlkrDH21mlH6BnLYJA+ZvDLfy@vger.kernel.org
X-Gm-Message-State: AOJu0YwyskKTtUZ0HnBjGc3KUl62eQAZZr1i4dfGKaZQ22gSsQ3GToP9
	RVi09mpnfnPPoIFlsreT0Kyqkf0VrHIp3/VdyDXKP+koQVUpHpkIJTbgonpl0ZyF1Ar3gARgfOb
	hVcwSQw8MzlPGVmCI/gmkibwVMdDOmsqLTaacRQ+p/p1Sa4x02qKnTmCYu3nPopJZIzOO
X-Gm-Gg: ATEYQzy4jnrOm3i96Z7melI4lzqhlgA7dzRoFqeM2RJptI2gJMLDFXXrXkqLY2kwIi2
	x8MDnXC6bg7Gf6YCdn13PHYGOhKwBLkjznc882ILiL2ek7YSzzdKZXdaOlRl0eTNRbgPt+kMajW
	dcSbvCNvwyPPKF8Jytcvs215TPFYXCXzigLJ1SL57IgPcN2CtYJZFDjpsYIh9XlLo8/FT/piEqE
	cg7Xj6ruRAVG7lg4xATIZvOmP83Uj6gle11TN/DWDFmcwpJeBAIeLvbGmdl4Yja60sU25tuvKlA
	vfYRWBkXToL3YXxXdaV7wQyNzHKTspapEgZl9N8+f+O5TUpUzOvV1tEbwV24HRdCetFFSicinb7
	UljtdoBTm4VpNLGT8F6VSvaEPS/JfJC0WonFAyxlFq/up8Zsup3VM2G701KEVVuipShxfWWGJZB
	3W4oauoc4a
X-Received: by 2002:a05:6a00:8017:b0:82c:24a6:2e41 with SMTP id d2e1a72fcca58-82c24a6300emr8008692b3a.21.1774275524026;
        Mon, 23 Mar 2026 07:18:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:8017:b0:82c:24a6:2e41 with SMTP id d2e1a72fcca58-82c24a6300emr8008656b3a.21.1774275523410;
        Mon, 23 Mar 2026 07:18:43 -0700 (PDT)
Received: from [10.133.33.6] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bbeff2sm9798291b3a.20.2026.03.23.07.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:18:42 -0700 (PDT)
Message-ID: <8529bd5e-0a93-4d53-b6b3-e7dd2135cfb1@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 22:18:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: add coresight nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com>
 <ef89e328-fda6-43f4-b40c-8834d16e2cfd@oss.qualcomm.com>
 <7972211e-d735-4401-ada9-b83c7b96b612@oss.qualcomm.com>
 <a73af369-b122-43d2-b28f-e97ab33352c9@oss.qualcomm.com>
 <f28fe058-d1b7-4d4f-8751-54117aba95f8@oss.qualcomm.com>
 <acFGhpVWaHZtiyTq@baldur>
 <d8ab2410-8d67-41c2-9a11-384f4a6a8f07@oss.qualcomm.com>
 <7993130c-5de0-439b-9263-69d6f327f5ab@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <7993130c-5de0-439b-9263-69d6f327f5ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c14bc4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=25pNCHLBOcfxwS3ibeIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 7xc7qiCYyc77sCtcmuUeWy1fqxJ8JZti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExMCBTYWx0ZWRfX94rW+Y/raQxL
 NDTAXB+ZYlv6s7MMFg2kr56eNe7FOCQ3By31sdNhXmeuzWagk7YXRVu0iS+p+SuPMZSAOthVQvn
 Uy69kE1VvHZTU5g7Cs9TNy+DWVdOjX0ghwQT3/yaf3cmu5e+EWw7IDg/Jfm3myPuQbOTOYT5VXn
 jMkKDZGOGGNSC0Jr15ycmL0mZUalh+JvowetcKp9mVV4Y9ExHrF1X0aCga1OoUKqkIGSiTbGwHI
 iXFJ4UMGhM4BFE9qOTe1F/YUagDhqDXJCQzd9FzdMBuVoYufZ9WEosDhAffEKbTCvwP+dtXG8nS
 6sP1eMba4LYW0V36Un6gudUbxTbpjMLtbBLo+Kt53XhIuwVbGX9a+6cXTxNNyxjpk7Dbx5KgkwT
 ZQWgbk8jjyqYovpmdZtMKop1bJ8j3hAq3k0tb8FFha7mfOAxe9US0gRlplHyOjMa5Yen2ZrYM1U
 TR2UWcdJ2O9FSg5rrCA==
X-Proofpoint-GUID: 7xc7qiCYyc77sCtcmuUeWy1fqxJ8JZti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230110
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99295-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4240B2F51E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 10:12 PM, Konrad Dybcio wrote:
> On 3/23/26 3:09 PM, Jie Gan wrote:
>>
>>
>> On 3/23/2026 10:03 PM, Bjorn Andersson wrote:
>>> On Mon, Mar 23, 2026 at 09:27:41PM +0800, Jie Gan wrote:
>>>>
>>>>
>>>> On 3/23/2026 9:02 PM, Konrad Dybcio wrote:
>>>>> On 3/23/26 1:30 PM, Jie Gan wrote:
>>>>>>
>>>>>>
>>>>>> On 3/23/2026 7:05 PM, Konrad Dybcio wrote:
>>>>>>> On 3/18/26 12:42 PM, Jie Gan wrote:
>>>>>>>> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
>>>>>>>> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
>>>>>>>> some small subsystems, such as GCC, IPCC, PMU and so on.
>>>>>>>>
>>>>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>> Changes in V2:
>>>>>>>> 1. removed two cti devices due to GFX block is down
>>>>>>>
>>>>>>> i.e. "because GPU is not yet enabled"?
>>>>>>
>>>>>> Yeah, these CTI devices have clock issue for enabling due to the GPU block is not yet enabled.
>>>>>
>>>>> Do they need the GPU to be online, or a clock from GPU_CC, or
>>>>> maybe something else?
>>>>
>>>> We need a specific debug clock inside the GPU block. The debug clock only
>>>> can be enabled while GPU is online.
>>>
>>> What happens once GPU has been delivered, but for some reason is
>>> inactive and we try to use this CTI device?
>>
>> We will check these devices again once GPU is available. We also will cross check with AOP team if there is a clock enable/disable requirement with the specific debug clock.
> 
> +Akhil for awareness, this is probably a solved problem downstream, but
> I suppose this may be non-trivial with IFPC at play

BTW, the debug team is working with the hardware/AOP team to enable 
certain TPDM devices that have clock-related issues. Typically, we do 
not enable devices with known issues on platforms until those issues are 
resolved (e.g., TPDM DCC).

Thanks,
Jie

> 
> Konrad


