Return-Path: <linux-arm-msm+bounces-103146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kM9xBhNO3mndqAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:24:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E06E3FB1EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A4D1630235A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4593E6DC1;
	Tue, 14 Apr 2026 14:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cuNWqQaZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M0aYQI+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0514F3E717D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176607; cv=none; b=TJgugelLI39X7EkUHrf4JH2mOmmfck1UH/hff6FuVmJ4lnJhpaSqjpaVFlFRQDUZhoLNayaK2TbWOxaPMCIm0R2Mot1Vq91uLgdrAST4RYybaE3w+qhmft7n+TgKbrLsx+giKijl1vYbToVGolz7oI+r8xLyoMJZsstzOHg2A18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176607; c=relaxed/simple;
	bh=jisglxMDGeqtIx9ICqQRVctPhRxrvVjbOhHljvb5nXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iqJQk43ZwcNd9iQcomhkUTiyJB3M9kmqgUo/lA5Kd9Y6L050pGM4leRl0wq44JMXOajJrS8ZZcFjdXFVBZHqBVNjnVCz6KYZZ6xSS4/m+mfXnN2CRnqF4t0SGd36ahYEmHnvrHRTbJUSrC84AIA0fdXxUxv9tqULGmSd8BucaAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cuNWqQaZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M0aYQI+x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EB0sUe3426105
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sLvdqakjvhjZspo80osPg3QWx7e/vaJVprphVoJc/zc=; b=cuNWqQaZ/3VSN4zt
	w5CqmpH93jbEC2l9n3Ca5OLx82e/EuAxShtJ1HU5/0kbccas2rSgAlQa6a2Vx8V4
	stn57V8bC23VudyMs2cuM/5dDq3eF+DpiD38gggqI2W3qT4ASQw1WY1lQUnG+7dT
	tIbGapBdjOBArcXki865hsmXyRc6uu4d8GW4rAd46yRqMVYKJDOHqLlvBMowuI4I
	/OGqO7VZi+rJm2aIE4eM9VwhhdGAMwfrHN4GHf3Y9tfgeLxJ8mUI/Y9duOkBggAy
	cwADcq9M1s6L0LBDzzH7HBjc8ukxYu80HnmrwfsdQ4l4DEM6oQz1Pfq3dFEJrrFw
	5CI0yw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87fb2a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:23:25 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f71af9dddso142721e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 07:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776176604; x=1776781404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sLvdqakjvhjZspo80osPg3QWx7e/vaJVprphVoJc/zc=;
        b=M0aYQI+xXiE6qp92syAz6/F2U/7cDzEKK9IjpG+ntabjS5cmgmhn+J/kEonB28KrIq
         zNDjLoqWHg95dY8zHEU947AnI14cS/0DYbrkeTicmBv7VOuvwQXYCIGh/ovarl4+45M4
         seV/P9qGN6b6jHo6z4yzRyrU92T+ju18jSRT9B3yEcfxuS0vz4HWweYI07FX+UeTEqmJ
         p55Qcys8gPOhZhhUeau9jOqLMLwX1colQJHWxsKgMOYeFUItA+R8ym5QC/dUpQZRiI79
         at9pmVbmIf1aDVXz8ePOllcm1zAZXKpDVqbXknNxVtsdb5bZX2+jZXYAh6oAkaaLVOsD
         61nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776176604; x=1776781404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLvdqakjvhjZspo80osPg3QWx7e/vaJVprphVoJc/zc=;
        b=F+FRSCFTks+5hENlAtmEQoXvEToPsCC0cBpG3G5tpZcpy6WrzNbIpdERCKWu/eqVId
         1PdmSw21NjrgygE3v1Flt5WyM1XboUbCj8l2uv1dw+Nml0ZbNg8sMMGAedb69vtPP0zS
         JEuO1XCL9rrN7kwwgg+u7Kv9PPTpsnM6v4iBF+RUkfS00YW9qKBQnX/rxQXpVCn4OzXN
         XdVkAjjRcwFs/gYlbT68e+5ECl1JUp9sooq6zF2dGNYAD41zWFpgIvspfywOOzCU8JKi
         FCvMwhUI/LtZD/cAA6Vv3RvUMp6NHQlbMnzYCoQ3uY4lpn4UUdTqUkn3bDF/W9x6Kvz3
         5A9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/dAmqeTjwBOBdnSPFTDM3KKpWdwFVdbP0mjg5z84qPDRxYhQ9M3mRuN85cgHmajAwJ/Rm75IPuTIS7UgYl@vger.kernel.org
X-Gm-Message-State: AOJu0YwKODUzQZC/K7Y5e4QMVdyFe3hsbNyizLsAniyUDXKnWOgpf1Y3
	wiwVtLe+IDVxseK94SaX8w+BgenQsS3fl5HT8j/9spAh2eXskan2D42fZEQT4N64qmWsKll36nR
	hN9voiFwKbzqMBQkdnf3q3KXGVNVvBMkUia57WBF+69eW4WkFOLaS2UOXOqumscVylnnu
X-Gm-Gg: AeBDievQva3E5h0MFt2ZjyCCr68PHo6DYXFZC0zxXyNpIiwuBFclcS36GPQSmHGYnM/
	V6at+3lREFCMEHcL2nogK07LUayCkgzbX+QvBMcFETb12tGNcTpB2GqIL4CZyQga/D9pzpo6D5Y
	xup/14vLR5H4TpU7A/VJkOpZkmCHThFOPej+CISwyIApvR6kjH0cukkhDLh0aar7xJvBPnYT5cR
	Yfy1fVpJAwoEO6nKlvhX0GqarL/gYDkdaarmPRBNboT0ZaWIkKdVxY68VtucYr2/fGat8ECLAID
	5PiI2ef2o4hWlIHGyQ381DohlaI2HSQTu7zYdtuY9bAch2iPy7qjgxikqxj2sQySEcwynPy8zX5
	ix0GxnxhN5ha8FXmZ6ec5LA4XmaRgv66dJZkwG3e0WPHzvv2tbQO1mpSiFTR362QacoFlujiaMT
	mz58UIi/rrdv1yAQ==
X-Received: by 2002:a05:6122:25db:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-56f3bd2bb38mr2929647e0c.3.1776176604312;
        Tue, 14 Apr 2026 07:23:24 -0700 (PDT)
X-Received: by 2002:a05:6122:25db:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-56f3bd2bb38mr2929614e0c.3.1776176603819;
        Tue, 14 Apr 2026 07:23:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670703f1340sm3272004a12.10.2026.04.14.07.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:23:22 -0700 (PDT)
Message-ID: <4f335d60-1cae-4027-9e87-b1212e01772e@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:23:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] clk: qcom: gdsc: Add custom disable callback for GX
 GDSC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-1-4bb5583a5054@oss.qualcomm.com>
 <6149513e-2c0f-4f01-a467-b4a213d65609@oss.qualcomm.com>
 <404ca234-1bab-4094-b7dc-c4d0b072d929@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <404ca234-1bab-4094-b7dc-c4d0b072d929@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzNSBTYWx0ZWRfX7uYusR4akwRx
 23OFudqHpna2qQZL8SkgSZQ4qHa+cFmdbaA7LPYsOgBuayMJDqIpd3IjUM69wKN2VNzJ9GkAGgU
 N5dmjGzWpRJTNCjffzbzPWnj41t2AdL2ydIuDVCGoJ/OAVOcUZ0gh3RVB2Hi2q+ioHgLxG0jFbx
 CL+UzX/d5tgMT9/+Gto96DuYb6czybTdr6z6fHKfAoViASfwDoSEXkPZ08PHen2TwRqrEPb5CSH
 snFfMsOoZZ1rQ+a9o10ykWdaRm7trum8KdLCcn3i8S3qTJGQ5e6WQb4B/gVsEJvvA5ekGRZQZD5
 1+Yj1kwF65iz6OR3NGiFhmweL/m5/Aw3zxqzYlV2YRTaEq7xnT3jdGlNo4aCoSoRhN5u9Rq1vzF
 gwUxmy16Wu3DTYBBiVhb0mGXfxjKcE2AmxGVOWHMjtq6eiTOHJzQw9IYzOnmDES8nG2Aep/txeq
 uKzIkGihSEqN8Q6ywjw==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69de4ddd cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=LiNkUCdodsQKAq62uNgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: wVeKe0h9-Arz0EQX81gsZmydg00b_wrJ
X-Proofpoint-ORIG-GUID: wVeKe0h9-Arz0EQX81gsZmydg00b_wrJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140135
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103146-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E06E3FB1EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/8/26 9:26 AM, Taniya Das wrote:
> 
> 
> On 4/7/2026 4:26 PM, Konrad Dybcio wrote:
>>> @@ -675,3 +675,25 @@ int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
>>>  	return ret;
>>>  }
>>>  EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
>>> +
>>> +/*
>>> + * GX GDSC is a special power domain. Normally, its disable sequence
>>> + * is managed by the GMU firmware, and high level OS must not attempt
>> nit: "and high level OS must not attempt" -> "and the OS must not attempt"
>>
> 
> Sure, will update in the next patch.
> 
>>
>>> + * to disable it. The only exception is during GMU recovery, where the
>>> + * GMU driver can set GenPD’s synced_poweroff flag to allow explicitly
>>> + * disable GX GDSC in hardware.
>>> + */
>>> +int gdsc_gx_disable(struct generic_pm_domain *domain)
>>> +{
>>> +	struct gdsc *sc = domain_to_gdsc(domain);
>>> +
>>> +	if (domain->synced_poweroff)
>>> +		return gdsc_disable(domain);
>> Can we use this version to replace gdsc_gx_do_nothing_enable() too?
> 
> No, Konrad, the enable should be always a no-op in every scenario.
> synced_poweroff can't be used to handle enable of GDSC.

You're right, I completely glanced over the fact that one is an enable
function and the other's a disable..

Konrad

