Return-Path: <linux-arm-msm+bounces-91829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VjPoNYR7g2lQnwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:01:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BC7EAB49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8C8A306BD35
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 16:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C028733F365;
	Wed,  4 Feb 2026 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bZ5Sj4Td";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RhlFMEg0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E93233E37B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770224167; cv=none; b=qOQ5Ml+J3tav/3g2tJvOHlJRDGolPZOr8zwOU7otBD3nNw1PdU7XuU7zqXCWOWAmvwEn9M+YkF0wlYrR63y8GF0Ecf1D0sFq5Lp59lFVNHWKRTUQ2a5FhK9fbMDv7dE6BefPeigCQ4+J8xyO4u43OEtRjsIQLNaDnBwUjA1SNUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770224167; c=relaxed/simple;
	bh=gic3rOmdvD+fIkZwf6ImOgaQ7ET4HTPv929Vj/LuWpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmfZ1P9gCWqRfKrnQmiY7dhtkg9yZfxhAdLzBHfCoq8CVrrbtlNCGIpda4gajTqObZ0gCCp8lx4DOj4iktuPMH2Hfbh5JFBomkrcS1TNPivfClrQ5NLpsiFehygvFg2Zt0I9T5+SqmMRiPTq8LVKqgYXX/+4YditoSQEVc6j2i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bZ5Sj4Td; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RhlFMEg0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIObY1032392
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 16:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ctaa6AYEkIPAmYh0W1CZ50hHg8Ta3lIzdnbrnHLrXyA=; b=bZ5Sj4TdQmTOlyUz
	yMPYlVHZax92tMA+0oDPugZR9tYFiPucZ4wTuVydWtRkwImTu2ivUL0VBLkQJVEX
	CPQ/gfoeK1esYbjHd+Y9XUUhUvuPvh93fkl8mPc8jhjI+UnwxwcHrl4IzNoLAm2X
	aFQonjsIOd3o9J4/of8Q4R+KxppJXUrfJgroq9FcfNt88DacP2HnzO4N22DCgLuG
	KM2rkHwtPI/Mp1DKlyaxduBl7OGnHeVyPMdQvRV1srpvUKzzo1R+SCvBM8TCKG/H
	5OC14l8RfErhzB0piFjOOUE3WYhcvvFKVGlpJhBdk8dPkcqAPP3o9A6AxSx0ZyV7
	MnlXiw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3ne7v412-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 16:56:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70c91c8b0so208249585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 08:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770224166; x=1770828966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ctaa6AYEkIPAmYh0W1CZ50hHg8Ta3lIzdnbrnHLrXyA=;
        b=RhlFMEg0I24E3vPx2RgH1yc72ojKOOGJEA/DPRegd66OqlCO7EwdP0hj/o5j5t3nYK
         9For4895fzY1WAeO3i1VcJnIEakfQXz1cQr/d4F9OsdtwVeOHguA7UeOZNO0Mty6lxQW
         OP8QwqvmQ1NNTta1GXFguHopeClX+b0lebJet8tP+Q1iIUpLuJ66gWdNEnGSf0nGVvUx
         EpsDULOUpIlqscrfbqG8VxYfSzkFTN8WmhKLTN80gbyY30pKImOhP+AgrNJbe/syYXDk
         YEaxSlEhAssRBqOb5zJ8nvhsNI9cGgK8Ra+PslmbmBBXHp9L15NgiiH+7YDrwqkYbo1Q
         +tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770224166; x=1770828966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ctaa6AYEkIPAmYh0W1CZ50hHg8Ta3lIzdnbrnHLrXyA=;
        b=weQPGkTeegUDuqVrO+atWRfxogei5uCaQRyd1RM56j9j7P6jwMl4NyDg3nPUeQWFO1
         +WcStzahURFbSrX7XZuklAtc/bXNSmvklx/gsdmtgMsX909jnMtig6FiZ2j6y0Ozfafl
         PTsORvY0Ke/RFx1tgLb7KGwdu5/vr33Ft0Qz1PzUeVla43GUa/XGSCkZdLt8MlABPjFW
         +T+fO/TRSgdBamZ9Rj6wWut0+FCfp5t24B/BE/5Z0fp0hJyE2g5Wz/XLqK8uvTmqeKTm
         HLjp4wImOY4w2RGFEG5SLQifeDoRIhAS1Sl97iOgJGPpjMKnZV6TpxhbyStlYtXUMNNL
         NzLA==
X-Gm-Message-State: AOJu0YzC12qLOCfLjIrHb7u9pQMflUMr888KJN3Sq1zJ6WKu8xApy+MU
	p3h1A4O43OY7f7WsjCr5l7bqGaVqARA2viOrtgt3ZTTx6uf8LQ72jwnZQ2IAiTKCtHhrMINOkpE
	mLiOuyu/IhkoJyQajRBaBfwidwbep2YLSDI7haaL7MZUA4qL8C2c/KdK1+285wvTfYWzQ/05RJ9
	z5
X-Gm-Gg: AZuq6aKQJCV7uYybGdTI6SidCsbC6nhcEkD8KQ3F0k4IBh9FmjqoO4YUR0sRDdVQooV
	a+WQq+UnFN+/NYnsm4lKh4+w1BKEtR//jDgYJ3uv/KP4Zv2n3saOQd+AiwlIzJkggZjAloAbbWZ
	tEgH+YqyHmto8JQOqU4+oT0kdNtcmVmTa8wiyKAxR+NSmlcRYKgOn4KMkqcEDCzY7haPjiIfWe8
	6Yn4vaJ03Y0nG4MreHEZuT/Ag6JjYNVKdKzui46M6qW/giU/y1FS/T6woAXuI7EX9RkT8X+FIV8
	fo6GpT8SDqbH6NAuTPzDkSp9Hz+XBgDfkfNMvijxZDcKyizmSLkI2L0gA0gNkB3ngifOueLXAwL
	VTwq7IbbbMoJ++E0Sg3fomiavQFGXRXHngXHw+X5wQrumKEsoubsiz2bvAfXw91BrqUg=
X-Received: by 2002:a05:620a:1a20:b0:8b2:df32:b900 with SMTP id af79cd13be357-8ca2f845a45mr350580485a.4.1770224165738;
        Wed, 04 Feb 2026 08:56:05 -0800 (PST)
X-Received: by 2002:a05:620a:1a20:b0:8b2:df32:b900 with SMTP id af79cd13be357-8ca2f845a45mr350577785a.4.1770224165260;
        Wed, 04 Feb 2026 08:56:05 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65949ed6b7esm1362084a12.11.2026.02.04.08.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 08:56:04 -0800 (PST)
Message-ID: <1ddd2441-cad1-4927-b0bb-cba06f8bf084@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 17:56:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sdm845: Introduce camera master
 clock pinctrl
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260114-sdm845-mclk-v3-1-c9351deaf4f2@ixit.cz>
 <3b27d707-c4d4-4cc7-94f7-f29c2466ff19@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3b27d707-c4d4-4cc7-94f7-f29c2466ff19@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uL44vKqvugWcbcRg1nhcyn9U0R02GbYl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEyOSBTYWx0ZWRfXwwAbjYY3Iq9Y
 huaEsWExDbHiLpWLD0a+IhKSl9tWJd3ljs7sA5rctmRwzlm1uZS0yOfjEd1PdxRJlVCOlCOhdBF
 VncQCVRph7gB3BcEn/RDJqwULfIzmECdvLIXsP5C4ezEpT9ssrgqLdUUi7B7tESdRCleOhOSMuE
 pVqj/z0HFvF7joFEgs70wIuPWGMNVmJEdonMxj5n+xcFstumQu1bf519vRoqCKRWcpclF8A6dry
 g1d12HM1VQe6R8QZ+PbovZnm9uf29UqB+snRyKvXuT/NaRRIkGk+UpRQlQv9stp51YVYjAHS0cQ
 +urXKzk2mkhK4CPsE4V8FMNK2GX0SP7t6ORUMAOfR56e1HdRrrVGwOYfnwJNi5k0i71Fdssnkq9
 SUmGbOaIDyh76i/R0PDtKpd/t66L4pTNtnMBUm+Aw50g8IBaILtN1EastHrxl91CsIjF00XVdJj
 K1pfLSbcqazRBmBY1ig==
X-Authority-Analysis: v=2.4 cv=TZmbdBQh c=1 sm=1 tr=0 ts=69837a26 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=EV1nOL3jx1njoq2n4ikA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: uL44vKqvugWcbcRg1nhcyn9U0R02GbYl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040129
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,ixit.cz:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91829-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D9BC7EAB49
X-Rspamd-Action: no action

On 2/4/26 5:53 PM, David Heidelberg wrote:
> On 14/01/2026 11:08, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> Put clock pins configuration for camera master clock into the dtsi.
>>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>> Inspired by Richard's patch set for SDM670, I noticed that SDM845
>> follows the same pattern. This change prepares for enabling
>> additional cameras.
>>
>> These pinctrl settings have been verified against the downstream
>> SDM845 kernel.
>>
>> Since most of these are not yet used in mainline, testing was done
>> on sdm845-next using OnePlus 6 cameras with downstream drivers.
>>
>> Thank you
>> David
>> ---
>> Changes in v3:
>> - Dropped 2nd patch
>>    ("arm64: dts: qcom: sdm845-db845c: Use pad fn instead of defining own")
>>    as there is no documentation or people who can answer questions for
>>    now, so we can move forward with the main camera work.
>> - Link to v2: https://lore.kernel.org/r/20251217-sdm845-mclk-v2-0-7028c2d09145@ixit.cz
>>
>> Changes in v2:
>> - Added mclk3. (Vladimir)
>> - Reword commit messages.
>> - Corrected commit msg name. (Konrad)
>> - Link to v1: https://lore.kernel.org/r/20251213-sdm845-mclk-v1-0-197bc947d4c6@ixit.cz
>> ---
>>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 56 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 56 insertions(+)
>>
> 
> Hello, reminder this lovely patch exist :)

We can only follow it up with a reminder of the kernel dev cycle..

The "merge window" as confusingly as it's named, is for Linus to merge
patches from maintainers downstream of him. New features will be accepted
after rc1 drops (circa 3 weeks)

Konrad

