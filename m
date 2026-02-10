Return-Path: <linux-arm-msm+bounces-92451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +L1xMnX6imlBPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:29:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CACF118E28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0C54303DD06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D771B340DB9;
	Tue, 10 Feb 2026 09:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HiltLSRT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T49nrh2u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB29F33F8B8
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770715762; cv=none; b=H0gLhg6KmwH0OYP44jB6qaXLxJCc9vRfYC9FF5AsmBwMeWrNKV1OZ9n4RavEhOgkzkM3s90lBAeobnh5AkTT0tr47OBWhUOjEKak3mm/QKWeEfB38gSLR2hlmLMeVj93ou8XiylE9V8ly8sewuONWiXKTsLttwqi3kwC+OBrW+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770715762; c=relaxed/simple;
	bh=QvntMn497LfFsUrqq65yPqcryCLs23OW53tvsa+NmpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EydYts896hzLD0BCyUT5naHO5t42xdRFiSMG/auRMABDOuUlP42pXvFwM3gabP3rTiHbx2VWeu2pC802QK1DyncbyPIekh9qElx33jzjHApCAAXVB8Gla/+vqSM783EXSkiRYyToeEGsH88MBpt1tjbNpSnMIFjaKjpTdatBdwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HiltLSRT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T49nrh2u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A9BR7F1231751
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BBY82H8wZEfYTqntgYYfhM5uKxNwefjfp1Be4nGEVuI=; b=HiltLSRTAaJiOOLH
	E534QgnoPUn22qck3zHk5v4nZ1TqyKd2y/I0ElMat5Nx1/ZvHgn88V6xxusKZiw8
	C7APBJKlOHXuRyybkc7XIpCWctNCq5yLzsd5LEnPEbvRuGCpawxfdTqrBHLgUKfc
	5zzQwq/Tw47vfcmLE5OHO5gwcwnePUzrstOlhvyK5cfx/5cY5kYCLfelm6MVAH/5
	sdY18BQA6xKKGs/mHCfK52NRm/lzjJRyNBaDLxa49Ri3Ek3B8x8D2MLu+XF2se55
	VeLRboWAL19YSbLQu6evQp5hNqlTE5GWsIslpaTjh+M4yjOztyFkWxyRvFgAz4s5
	MEcmRg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7uv598xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:29:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb10b964e6so84932785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770715760; x=1771320560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BBY82H8wZEfYTqntgYYfhM5uKxNwefjfp1Be4nGEVuI=;
        b=T49nrh2uUF5XkpJ951f3AHafCk7US4tvpUgzz+PrH+In81eiMJZqP87ZmiLWd8y1NP
         E3M1jDxZnGG2y2nYq+KZIj2Iefoti+usnGlw1mHUYqRdCR4SsSyOU+2KpmCm0d1kU1wa
         Kkjm2zXJWwa8DK7x6b/N9SoDB12Ijh17BKEeIadZTicR4tPEmzjWXG0/7RIpU7FEMR3x
         iCf8dSWIiXAObG9CIvMgmQn5XEZ8jkR76gdWXNopPtNy4aCCum00Y0I7cxbr33YrOBBX
         ovelrMMes9rUYLJTUqgLDxA/3va88s7EHGIA/C/CJEO/BE9JZPpdd4mG1d0cHTHjPFj0
         gpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770715760; x=1771320560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBY82H8wZEfYTqntgYYfhM5uKxNwefjfp1Be4nGEVuI=;
        b=Y7bgrPTGyGeLf6p5R7V689IULJbxfp6C4/4x/D81g2HfOhWLjNroWIqhZfJC+lsS0V
         h2QENbCCw1f7hYqTASWeCUInDuztSDmxALbcLK4PdBv0A77aLXY/LrL7TX7yroXg3PNH
         +w/5xnWKa5O6mHk/DVrh9DihtM6tFuNHo4hFqLBZ3DFXvktIZYXxHmRBAqC43InlW2Xy
         IKALL7D20wfHI5Dsq+T6zFXCRHdDErBy8Z8wJFOrDUg0UXa5sYBcnmQLEDaBgbl8tkpA
         k8S6YvuYexdHkBOIFE2Xl5j8AO+dSGAAPZzjlyzI/WQZ8Eu7jXYFLFdOAV3urxpZRaLQ
         aW2w==
X-Forwarded-Encrypted: i=1; AJvYcCVQV2wM5xmwCWb89GvjKJVQ56JJi58R1llhoJrfge7eBcae4MFpcEmOGIMC2h/SlVL8gUz/XkszoK1nE41b@vger.kernel.org
X-Gm-Message-State: AOJu0YxjWp0dmByvHLmFsbCyAmYCeZXqS85hcJbBdU1HC06F7ccYbf+T
	FfrV5v96hFumbbMx1E1svaxr4Iu+KvCX9eq3Rjc+xqFMIRa49I8sEaVTdliKWcvcLLLLBENLEds
	5wm+POy4jIMTIhc6hC24nbdpcB02zTaXfLENgOHqWD/uX78SvBefOF5ovGxxRWketbEiAwJZ4Y8
	wl
X-Gm-Gg: AZuq6aIYlAvPTByjbJpYR+sLFJbeRIcLZ8tpKb4rqQ9JA6oM98eXd8NkeVo2DZTJD4u
	l01Aw0DIU5xH+w6m09nmb7NWPysaEYlWVrENglQW44PKE0X/sUzCCI62GUngat8IVskohyNl6eU
	H8X/43y4OdhHf49ExYlSsy77ZRkbiz9qjXTA2zFsOHk6ejsJhL2/hgiJixBfSlsqyrEOduUwBVK
	S9o4NXg+q+SYT6NYGobqP7KAGa6hMCyqiPpe+A08CMhLdfguj7snE5wHfF8wbBS1Q7xLQBEba2f
	yZEWUU4E/FCIdxOOWNnlJK0bAAtPKc33hMqqzXrs0AGw6LJCe+5/GWKtbgm1/5mQK5OXpjFPrYu
	j71p14FUKd7+uShImPLSa80GTSQ/otzrH7FrYiBkeKUyaYJ3aWQHXZD0+qRs5zW5wM61HKJStT6
	SRV48=
X-Received: by 2002:a05:620a:470e:b0:8cb:1c3a:90f7 with SMTP id af79cd13be357-8cb1ffab4demr96740785a.11.1770715760013;
        Tue, 10 Feb 2026 01:29:20 -0800 (PST)
X-Received: by 2002:a05:620a:470e:b0:8cb:1c3a:90f7 with SMTP id af79cd13be357-8cb1ffab4demr96739385a.11.1770715759567;
        Tue, 10 Feb 2026 01:29:19 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65983eb68cfsm3710658a12.12.2026.02.10.01.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:29:18 -0800 (PST)
Message-ID: <e35d7795-cca2-402d-8179-8214d81ff9d2@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:29:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: llcc: Add configuration data for SDM670
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260210021957.13357-1-mailingradian@gmail.com>
 <20260210021957.13357-3-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210021957.13357-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA3OSBTYWx0ZWRfX9PHTYv3BeBnD
 bAOaqx6ofQxGNYaccf9PMy3gSSZpwcwrIGRJRO9X05xpHkDGKOjy/xFowpL2oLQHJDSdEsah0iM
 zGu7x4zKAMFHMfGqdRWR+QsthYWXqBLRzoH75TyFlBirkrtT40ivDLCXlRCpdzHOzWzvZOb+uyo
 4D8srdncjl4hZnTFuOTVO/3m5mpnGRKVpeu0IRP7BVhBjbJG0Fl5yGSb8nHgpWMVWXEBTmUyfpO
 z29PLPvOHYblzCwqVq1bipMuIG9mdUJueGJmM2n8wpj3+mshYxWcRJPEfC2eE3CdXJZFYUEXW+y
 9jEgGo4nDJiOqM0/OQTOitqMIjxuCWt2//aq14Dw2xEEU+jy/Am2ce5Qa4hnOim4MKrKKqdxkYw
 zExuZ2r9V1xLjvQm/1QZXZXUseOe/VXsEO4VaWpysmH2cvmuolAF2sH5EAnE3RAn6yBQBUmckmZ
 7/ZJsVtGHWTXQI+pc9g==
X-Authority-Analysis: v=2.4 cv=P+Q3RyAu c=1 sm=1 tr=0 ts=698afa70 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=z8cJk1-d-abATlfEAfoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: afdMdHAdLWWPCAmElc83RVYDpRIPuJeH
X-Proofpoint-GUID: afdMdHAdLWWPCAmElc83RVYDpRIPuJeH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,huawei.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-92451-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2CACF118E28
X-Rspamd-Action: no action

On 2/10/26 3:19 AM, Richard Acayan wrote:
> Add system cache table and configs for the SDM670 SoC.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

> +static const struct qcom_llcc_config sdm670_cfg[] = {
> +	{
> +		.sct_data	= sdm670_data,
> +		.size		= ARRAY_SIZE(sdm670_data),
> +		.skip_llcc_cfg	= true,
> +		.reg_offset	= llcc_v1_reg_offset,
> +		.edac_reg_offset = &llcc_v1_edac_reg_offset,
> +		.no_edac	= true,

Does the EDAC driver crash the device?

Konrad

