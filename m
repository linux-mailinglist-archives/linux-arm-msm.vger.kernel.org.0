Return-Path: <linux-arm-msm+bounces-97978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOdEOaUVuGl/YwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:37:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2161B29B82C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9F633035ABB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD621E511;
	Mon, 16 Mar 2026 14:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fqBcGXJ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="il/HCTXH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0FF28B4FA
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671706; cv=none; b=Tw+biTLEo8NNNRkSY0UQWJDdNCniJfoBny3/E/A2pFmlr4ZAZ9PK7kbZW/QRJ+AIcBKlAvCz6rU1xaWMVVZgPbgvVr14qAVBVmlMDlBx3zhGEMFQ6pTkpmgjsEVvqi9kkb8XixaLPfr7u+fqwGirBthGPw7kAVHTspbjits+sZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671706; c=relaxed/simple;
	bh=RzcUKKThV24VYYhOUtSCqR8y1wrm+x+IfKPzNInqHu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fyowNzCcyTwE9XD4OvrEHYT4wLYaFzZEyvh9iRwbee87D2pvynTUvbORumpgksKm4JKJrZIBxHNtKy/KpCo61YiMuP7+r4AwEdJMl+I6vmsY4rTgkY9k8FTKAVlEnlCL004S5QvZDMaPa31fjlbdgTHXQDIaWFuM4bSI6r1e1R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fqBcGXJ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=il/HCTXH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GA46qc3124533
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XBIUg40/M7vmcxFLi5vD+zxo1ud6+bCfvOq5RZgwjA4=; b=fqBcGXJ9G8NakXev
	3B/lHvsfDxv2HxZP/QCxDBAixJsPxLBqEsVOQfVRxas+Fy053n0T1i6F+y47xVrC
	P1mefjk+BuLBtKYWC5Ynq24xxqe1H+ewGtfE2qjv0Ee33KvgmLwoscJrDRkvVyG6
	1ysGs/b+YOm0WtsDT76fladma5rdPhHcGS8sQ7N3496H2kFr68+jgyemxONPekox
	4YHEDXrxjpESlrCdEC6eBQYpKMiBB7E0DEmh7Kz0pPOGHvZJ55tYvHQ6T4nfpcpI
	3PXIc76yBW0yVR0wUvk7bmK1zqA+nfp5KuRwZcl88wPmGxqW7OB1k2gVoxm8ZjyZ
	lWAbIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmgybp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:35:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8e89d19bso312545985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 07:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773671703; x=1774276503; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XBIUg40/M7vmcxFLi5vD+zxo1ud6+bCfvOq5RZgwjA4=;
        b=il/HCTXHHj4ZxKimUs0JicgImHa+S5W3AhwcyLjTZNgRlvCl89OazbAE8ozAtYEFM0
         qLseMGp51dLTmF/aUlFZsO588+/huRJl3GqC96FUX8lbdFtCWHjDDJPoBruqogOZnfXi
         tJyJpJyQBnoUTGOFjDt0XoXs5KIk22z0LFsrGTivU/IEE9tUWbfyzxhdzgEk301Q5UlL
         TQPQjjE847drdCpQjE/LNJKH4al2sEKo/ftZWif4JESTp7BJtAgGwLFjhlbuhWMY4Ab2
         +GOlPbi0nrXBRK4EmpAvwV6L2Pn80Kq2boctTylNzGY/7CjZ79ibvAJi1W6/Xuecpooi
         qPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773671703; x=1774276503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBIUg40/M7vmcxFLi5vD+zxo1ud6+bCfvOq5RZgwjA4=;
        b=SqgYopGk/Qezypa8lXx99mhvbNuxYMYg0GgHAUc7cyWGe0o3FRKX54h8xoZtuYsQQE
         E8nN3jSWDWi0W80cwRWIcAdbqeGRxV7RaJWB7wzMUPuDTgJI5S+hpy2AMg0OjshXFblP
         PR6xe8SLRPhXfilCPiQbyRt5xh+dIMavEtW1jqjeZrUAD6byn9ZT9lt9AvoEvM2RsVTT
         Vhx5EV+XUUTs8AjjKPrf4/V/zMlVdWbu/Po29UTkktu6GACrgu7UUBienJiyJu6Anv5o
         3TX4JrzfvsK/TOS6CFZm24ImpropTsEw/VQokIarglz+dMbcbpM7+qJ7gRcMPuM31c+A
         /tLw==
X-Forwarded-Encrypted: i=1; AJvYcCUwhYTDcgFt6S16NKrzUZDXGzme7OdaOemBcyt8N6XI9IUo/EY4DVtiVRMPcDxcoKcCBu1pmPClC/jWtL3q@vger.kernel.org
X-Gm-Message-State: AOJu0YydxuB0dD6c/FVs664SxtU5DnXpwoFTwZL3EW/u0DJBxZqPihJ+
	VqHQKp5K5fTqS66G1gqy+iXNkKa5waIn1n6T48x9fMj9aFUrBNseZj7zClw/xbgqIbQHoa+lCBW
	HkPmVOKqtYQPKK9BvVd4YmS54ey1jT65gTorb9/vCwggdP1p6/ivVva4ENv4i1tdl19ua
X-Gm-Gg: ATEYQzwbZOVC1nyxbie4OZeq6ZS4C5DR9PEX/0IAILO1bY4RPh6tiT7Wt6lZL4a/fF0
	Vm1D4Pl9A6JHhob7qgklAct7m7mEUel2dNWZxGFncVYY5hdZzWHpcm55I9z9l1eI7pEhG26DS6j
	fTsPSkYq53+J20WuuNSdkLg/hsBZglXToXRCn6B6et0tpi7prtFVxgTkuorue/JuJbsRfk7urEH
	wUeor18vhSm2rbAk0Ik2CwOiBENVUjjPdUJ3Y3B4C2yH6htO62bu/ueq2fDM6SP5IlRGv71GG7y
	/sJ4ubXtKIBkMULw47bew+81QuaA6A4+FRAyrOJh1YIvC/cGsoT4duOF3F/UayQXKR7b3xPTUAd
	HmEn4eylIgyNz7kd7TjAnRxVriSekkn2/2ns2w05EgUFZN1qR1dDtWVZAg7VUwXEnRShWNthtnF
	xff+I=
X-Received: by 2002:a05:620a:29d4:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cdb5a7e0f1mr1248987685a.3.1773671703430;
        Mon, 16 Mar 2026 07:35:03 -0700 (PDT)
X-Received: by 2002:a05:620a:29d4:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cdb5a7e0f1mr1248984385a.3.1773671702884;
        Mon, 16 Mar 2026 07:35:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66350d80771sm5027648a12.31.2026.03.16.07.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 07:35:02 -0700 (PDT)
Message-ID: <7c862b46-1d8b-4c93-b675-20f735915bb3@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 15:34:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix GMEM_BASE for A650
To: rob.clark@oss.qualcomm.com
Cc: Alexander Koskovich <akoskovich@pm.me>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260314-fix-gmem-base-a650-v1-1-3308f60cf74c@pm.me>
 <2938aa01-cc1b-4dd8-a4af-45ff8354a061@oss.qualcomm.com>
 <CACSVV00HQY6OfWRSWDcv4KnpwhTO+aLpTXLoQuGutvTTmgJFnw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV00HQY6OfWRSWDcv4KnpwhTO+aLpTXLoQuGutvTTmgJFnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwOCBTYWx0ZWRfX7sR88qTfH5A+
 HDT0DLAdYkaC7ooy6DL0+AOJL52lke4GPl8T0amp2+zwoOlzaRmC8nqKUogzU6o28Zc6kRCZnal
 +TSVY45CxSWJ35hWqQaxxjHzFl1EoH4vbsIKPLY6fIytUu9HQuoKVDTUYXmiPU5ZEmV2FYG8hGz
 ymnoiJQBBMLsTNUDbb69LlL/sUR/Cx5OoSqmf7k5smGd6vdBFtqHAYrweOzOBU9GMSy7tooEfbB
 Mv92toJDfqaswmT8CGgrxJgPu6hVdNG7+iFLnEZD952yw7YJE9hP9nWYZzbCNbAZNR9KWOprNIp
 f83f4fKqseOjosTyPG1ePeUx97OgwY2kLWqAgF2Si24HoefclFcxnJqJS9MafW9O4hG/TaXDzm8
 lUtcEwapJR5WAM/zD0wnRdgFjPTepE3ljqKNjEUYRBldc3SyS+xVQDzpQUJLhVO1nAFncXSA9Ie
 nSi6hze4CfycjS0TLBw==
X-Proofpoint-GUID: f68b_lt-kaYKXCxtbL9g0Ms7iAItmGm1
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b81518 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=5SlpSpXkIfRf2ii1CfEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: f68b_lt-kaYKXCxtbL9g0Ms7iAItmGm1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160108
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[pm.me,poorly.run,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-97978-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2161B29B82C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 3:31 PM, Rob Clark wrote:
> On Mon, Mar 16, 2026 at 2:22 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 3/14/26 5:14 AM, Alexander Koskovich wrote:
>>> Commit dc220915ddb2 ("drm/msm: Fix GMEM_BASE for gen8") changed the
>>> GMEM_BASE check from adreno_is_a650_family() & adreno_is_a740_family()
>>> to family >= ADRENO_6XX_GEN4.
>>>
>>> This inadvertently excluded A650 (ADRENO_6XX_GEN3), causing it to report
>>> an incorrect GMEM_BASE which results in severe rendering corruption.
>>>
>>> Update check to also include ADRENO_6XX_GEN3 to fix A650.
>>>
>>> Fixes: dc220915ddb2 ("drm/msm: Fix GMEM_BASE for gen8")
>>
>> Hm, that commit also changed the value for A730 - Akhil/Rob, should
>> that be changed back?
> 
> No, it was incorrect before my patch.  The only problem was the change
> happened in a6xx_gen3, not a6xx_gen4.  So this patch is correct.

OK, thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

