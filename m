Return-Path: <linux-arm-msm+bounces-102266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMinOHIE1mnbAQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 09:32:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C673B83DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 09:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9259230C9F8F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 07:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DEDC386426;
	Wed,  8 Apr 2026 07:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5g2CpXR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWgc/Uv9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAABF38BF94
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 07:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633197; cv=none; b=lM32jF/nN5K3CEc8pRPHtGlH+iIazrBWhVrB6zUtsXTUdiFIbY1mTO7CJGOPoUimeCTgeXdA1n7wBfaF85GwsxYhKf2asx+CeQYj+TJAXkxoS+sm+umka/0+7zQeYLoI8EaKrdzLwTSDXGa/S2BGeRilc8MoFtA9+LuKknnxbN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633197; c=relaxed/simple;
	bh=Ybsw/1t2E37KzSsbUyVwYRciOKqxI4UFk66cbCzpYzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uIX31Gf/oFKKvyfKWUPrE+LijcsqCVtrxEMbZhG7lfIKZlROku0za2KWv2lNItfD1wkovDujoRhRrBIORhKwtAe/BKweh2/pQmkhHpyo6Sdn9EqGnYu9iQSBtV4lu/GA0lUFJ5XLhZytREzpQx7utSqc42zqxhcSwieA6/qSoj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D5g2CpXR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWgc/Uv9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387K0op2451717
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 07:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NHy+iMr3Xqnr1XEITbbqSi8Jils/yDblCvPpvjVgONo=; b=D5g2CpXREiB8xYvp
	gQYIZLSZAb4UPRwCpFw07wMuDmOY4Y47vWCtOtPVzhoYS0AcFT6MXfCbGec4BNvO
	lEOfSfzOOvtn0UnrJ/SGp18CRgthWEiZIt/5cv6BBybRtlCObEfh7I9eJA+lR6t/
	aBtzO/8RQ9c403MUYNlT1JnfUGniPelMZcMbj5h5ZTLDyQzQxWpq5rkdnqIJDXO/
	xdU1bM8N3ny2tcQ7swPECrcLEjv6qvCxBkxNu7D0P+eud+mT3YhrKGN25vjLK2KF
	P/OToiPeQOIhO4QdyRTm9iWzKyhmAetkoW7zfSb41t+069PJr66EW52b2oFrJAYf
	P+3gsw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddae69hcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 07:26:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82cd9fa609aso3652665b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 00:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775633193; x=1776237993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NHy+iMr3Xqnr1XEITbbqSi8Jils/yDblCvPpvjVgONo=;
        b=bWgc/Uv9/3RcDRzO7xr3V3/UicsGvx8gTEpN9l3hGWtokkSG3EJ7s28UrRg9yfdqJo
         rTnc/qCi4arSBLCD3O+UizluJDcAENZFQWNOVMMjYXaukU0TrDX/28QeimgI3ke+YPsr
         6HT667iZcPiSHX54iu9VCaGXNMMZmQiErMfgkZS0t8sR6tRlGKJXfldIxLDJkWYRLFxb
         qLEO7vrLM8Jph1PTjaa5oVztu/onO1C2XpzOBDvEViLJ6/HxdIIUUqcthfBM0ZsbAOd+
         v+vLziophKe2ZvfM7ZHCuI/iaFCQGaCTRIhcOVAiiIdlC8nWXXBowkeAVRCYIE1V9zJz
         Nr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775633193; x=1776237993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NHy+iMr3Xqnr1XEITbbqSi8Jils/yDblCvPpvjVgONo=;
        b=RLpGe3209Tel2Cyf0MJB3T2Dr5J9+z02k0UGjpW7gqdAVY4efptD1n5nr6Fj8b4NbC
         mIYTz8FCObSGgj/dc9SMRYTnKnxB6jSjb+zqOQ8LLSluQWNvRzcr4k8A9/QG42HqdCIP
         ZdFAbPNKHvxZWzBA9SwDfYdQmpKlMSK9BVBVWaLD+EaaL7JgEmUbQ2PCH/htT7GM6Gb/
         kL2C9gij2NBn43JPMsYnzwvXGYPASQR8bkm4xbOjih0XOk6kFXWrpG5dGyfQ6OumIzQ3
         ADE80AqMGkn1ACMtnRxJGwWjPYmhaymorc7HHhsKQGgvbb6gxJC1Ya1jDXjx7mrrw6/N
         oR2A==
X-Forwarded-Encrypted: i=1; AJvYcCUbMFlL6TaKncRY7t2teGTGWrw1p+wKcgkEhP6WAF1tHUiXdR4vOa0wZEhJyID5Dk+TEmcxISOoNaHSlZPI@vger.kernel.org
X-Gm-Message-State: AOJu0YxbWdN+EGLndiWgkuV3icCzrE/JyG2SWbOeSzqtFKE8gzdJWWYK
	9/Zw5USj/TBODc/npT4hzmXIXRoVfljbdExO+fTz6R3fii2BuCkMvWYbsYA9EPRrOWqN9krfrJ1
	znhr26Q/bcnNXsQgOqnCWaDrREnnUlcsLPF4bTfcuO6QUFN2qZj329n6lep5GV0zmJpj5
X-Gm-Gg: AeBDietYc4o1ToalarGFY6GHY1mv2vAPYZ0E4l4zVAwZCzEO1mQgCES/VVeaVFylaHn
	vUcMdDRTiJwsk70dsysEexaqyguXQjmHSwgdeJfvgQj5vwJ327CWcPay4Hl7vUJ6AND6p4asCe+
	4bJB2dTJlTnbdoGQFz87J06lGq15+zaITD7G4ny7/ladnRQyTbJzLYnSYHZ5Y6yVVqFdUKaWrk6
	iw6stI4e36Yc3PnIwZMdC/D5bU3Hu07vE0WlzE8NO/15bOt/DLcSOZMPMYnCLno772tbD22dwyV
	ctdYtc9+xB+U1CQPYwYKVmKE5Glc5fTZGsHa8H9GhwgG4R8iwMYNQ1BQyIPUywQH6th9KWhlnIt
	kfnUpBfIRqsa9bxVWWQ6IfLk4OwTTa7jY/XWHUfi6MehCtejIiw==
X-Received: by 2002:a05:6a00:ad08:b0:82c:77cd:50e1 with SMTP id d2e1a72fcca58-82d0da993b4mr19225539b3a.20.1775633193559;
        Wed, 08 Apr 2026 00:26:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad08:b0:82c:77cd:50e1 with SMTP id d2e1a72fcca58-82d0da993b4mr19225502b3a.20.1775633193088;
        Wed, 08 Apr 2026 00:26:33 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c68273sm24431255b3a.41.2026.04.08.00.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 00:26:32 -0700 (PDT)
Message-ID: <404ca234-1bab-4094-b7dc-c4d0b072d929@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 12:56:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] clk: qcom: gdsc: Add custom disable callback for GX
 GDSC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <6149513e-2c0f-4f01-a467-b4a213d65609@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA2NiBTYWx0ZWRfXwETIFF8qcDVp
 AKKTrqGbCdxFnRHwbhDsvK5uMyBPiEI3vPmuRUfgMKjQ2zOueR0wpq8IO3qiBlA+0oGQE9JJg57
 SDH3pV6nDGAGvCzevbv4Srn7D3j1z26tt15mkpto6GbAnc8lRzCCRCfD82bTfKC+TDdz9UcqPO9
 H7A5JhC+oJH4t/2Xw5PKbahjca3qWfij47ysa4dCYenLUNV+0FnfY39JkKojT9CZ8lKlWV+/nfv
 VYijo7/WSMj4CA/J8OqSNV/xSXpf5MJnzol7YVqoS3hoyoGinbLkwvGPBo71F3dJTlmuAb6YkFN
 AnnLzmlod//AmIB0D71cXzcHgoV7D5+i1PCzIx3qVL9aeWb+LSCz1exyMFh+VltSXBPw/5jLtOO
 LRu4PYnD2rwhVe2MdxVC2PUgntaBiileC3kmn9pwHtgo6niEQMMhK2IPwnl3R4e/1kq65RdvTJv
 It+4oHAwJmpFsw7M2gQ==
X-Proofpoint-GUID: CrUnc5A02NgNRblwecKobvY4vtbiCQXi
X-Proofpoint-ORIG-GUID: CrUnc5A02NgNRblwecKobvY4vtbiCQXi
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69d6032a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=RnFGxym7J1TeeuKG4B0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080066
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102266-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 57C673B83DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/7/2026 4:26 PM, Konrad Dybcio wrote:
>> @@ -675,3 +675,25 @@ int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
>>  	return ret;
>>  }
>>  EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
>> +
>> +/*
>> + * GX GDSC is a special power domain. Normally, its disable sequence
>> + * is managed by the GMU firmware, and high level OS must not attempt
> nit: "and high level OS must not attempt" -> "and the OS must not attempt"
> 

Sure, will update in the next patch.

> 
>> + * to disable it. The only exception is during GMU recovery, where the
>> + * GMU driver can set GenPD’s synced_poweroff flag to allow explicitly
>> + * disable GX GDSC in hardware.
>> + */
>> +int gdsc_gx_disable(struct generic_pm_domain *domain)
>> +{
>> +	struct gdsc *sc = domain_to_gdsc(domain);
>> +
>> +	if (domain->synced_poweroff)
>> +		return gdsc_disable(domain);
> Can we use this version to replace gdsc_gx_do_nothing_enable() too?

No, Konrad, the enable should be always a no-op in every scenario.
synced_poweroff can't be used to handle enable of GDSC.


-- 
Thanks,
Taniya Das


