Return-Path: <linux-arm-msm+bounces-78354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B281BFCCEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08DFC3A0606
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 15:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4447333C53F;
	Wed, 22 Oct 2025 15:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PlhLj2+9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710A334BA40
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761145915; cv=none; b=NEkmcGuOtk2EoZBhrv0sZLV4xOrikAQskFqZr6x19MSaZrDVJkglyh3zVXjb5AC8yPL+uTIb10UAewivjkoviJlElGPKbrDP4BKcEnNTIhts4qqXjhJ25TYTadnfhmtqwm4i22lnBq278kydhNFFLiY8Ke5l/epWhPHXLT0OBl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761145915; c=relaxed/simple;
	bh=kJKt8lgz3AINCzfVP+bT0fSkZSZDADfgsy7cFW+DHYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPcx1aOIX3Cc8miJ7USKL3I0pe2+1WKJWKTtTWTWCuzhYu2VpEZk9kKJ9mq1mfskGUv2Qu9NLvSZ9OHigjrn5+tJM6CQW2O3Zo4H54+THCwHZCvRlHY+5P4BvVqkedQpIUYXKp2lQIGF5bBoUgrKnxjDsaBevAdFYdDEEukcMzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PlhLj2+9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MCDeUM029853
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6hiZwjXaqgofJGS5eH3n4ygeKuepcGSGKuVfiI1deRk=; b=PlhLj2+9VFyDqWm6
	7WNuEHGEGIx+6UOPFojVVXYucQmPh4VT4vy+PO41KygDzqRXRAWlOT30xcwZvI79
	JjHP/jOMc52vGcwFTTXwYVGUYDXp2zFVBGA+ueJ2zLjfRXYh7/hHUEo3c6APsiAo
	zKCkxU7vTd2NKn8nLWCstG3dQqfGfS8z3Hxwtn+mk6VJsz7h+bqhIJtTf4yRFMNN
	pZNi2Wu4jMsn0iR8eKVCWMIdrbUr8VKlTgApP8P5aCi5DqSiyPzmUBSrveWb5h/s
	h2+8DsAvUtbJmbDO600uU8A4g7RILGKnn/UnRoUtAzTHT9Ez1s9fh6a6Rt+H18Id
	xThydA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge52ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:11:51 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-55230b223b5so15816244e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761145911; x=1761750711;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6hiZwjXaqgofJGS5eH3n4ygeKuepcGSGKuVfiI1deRk=;
        b=ko7sxyrT1pC/XqlSc3RNEhwpJLSYygS3QPAPMoL+eqnIa4k2Jnh7JXyO0EQEREhPaL
         ioupkuOfODfdklqp5sfH43GtVxxdV7TcECvxU4j0QV3ECiKGb+BdyFeH10P0oiDEik25
         OLMVJmPt9lRVPfCg/bqoHfYAW72uYDcvoQh0nc3x2o4f9R4vre43XbExekIclg8UsSPj
         uVLtFsWSnGQyiinQ6R8iF/OVdKNSSG8S6AQ+W/2AebnXO7jphQ35DmSYqYOekcusc4Lu
         Wxai0aMBX0JbsDgxK0x2dkvAtrs+Ere5Pf0x17iaMmFJsvpuaJeMDl1viEFh8tL9VeYF
         6Vrg==
X-Forwarded-Encrypted: i=1; AJvYcCVvpNHgob1FzdMlFgNT3UqdqnNew6nza6jpFPWfjn2IwBAxH6CLyqYScx22DHSQ8HAwMr2JuPb0pSF8Hmfd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx14hR3ItIYKPCKhEdDe8b4tCIt7XhW/ldG6uNsyHMDig3UYtIl
	cPlgpc0U6WisrU4/vs5YpaJwFMg1G99hv9c08hHekeoOt6xdui0edYHeg7LEiwD63T6A6XeqHjt
	9WC4bPOyg/ab8l7gsrI72lDlthcTL2DqFuMmhcrwz5h6+cM7zw71mrE8MHGU34U6vPFQl
X-Gm-Gg: ASbGnct9NyrBL0jf97ndqzxhzHs0tTetD1+2nk7rKkh5DI0JaSohRp99Bn+l4WUregl
	UHVNJdWK+GRUBowvM6ivp9iklpikjF/efLGjSC5VjfelDvnw54M+EGCArCvoOOkIabaAunqr2Ay
	W5mkvds/W8AyZE8HC+10cEJAs0E+zjK571U0d2Y+uPWYYjTmdFPErAS+sB0K5+rcdc4G/3qehos
	ynhFxVz/TpR/t01wyB0O3WH4fIwLAOkx2/sbyc67GGUdBnQxnS0IMz/mHUSvdxwbN3mrr4Cs7s8
	JWQcHGbSRxIndKhbhqDYAYWD9ZWpu9rE3CyZE+8814njpYZ+5sXDc3YU3GTMNW5SaV8S6r13i2M
	/jx5ogtuMregFqg/bc8BPgOK3a1RbTPWUoqBipx8RyIWsL33Zm+iiFqnyP91wZxDQOE4eAOpUSB
	grWkoKbSgmob8=
X-Received: by 2002:a05:6122:469d:b0:554:afe3:1fc4 with SMTP id 71dfb90a1353d-5564ef30a63mr6957797e0c.9.1761145910996;
        Wed, 22 Oct 2025 08:11:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPhrVnG/2oMiJ4rqpCF4qpoLZDW95Sa1i4rJVKxuoxAgakl581z6U7Bbttq6QPtplgJNJpDw==
X-Received: by 2002:a05:6122:469d:b0:554:afe3:1fc4 with SMTP id 71dfb90a1353d-5564ef30a63mr6957774e0c.9.1761145910557;
        Wed, 22 Oct 2025 08:11:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def1b2e9sm4789860e87.86.2025.10.22.08.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 08:11:48 -0700 (PDT)
Date: Wed, 22 Oct 2025 18:11:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] regulator: rpmh-regulator: Fix PMIC5 BOB bypass
 mode handling
Message-ID: <xlki5jwurnixdxaph5mtxg7sfks2cww3xbswgtf6dbn2z72o2r@smx5hxo6obxj>
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-1-5c7a8e4df601@oss.qualcomm.com>
 <on4zcfs5qdaekc7teo2iq6vpw7o2mp6yiqjkbznxo7wcxgutj3@nb35f55fkugv>
 <61c299af-c4f8-47a0-8803-306c08792b17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61c299af-c4f8-47a0-8803-306c08792b17@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX0ga//ninFusA
 Q5kihsWg+5mkVQQ+qDQELDgdwl06JisGgjUt30ptiCYGiPoOIAc5+Dh+Qk4jQ+bXVhu8n33p4Tw
 5naXoLvQVKNEKRyAfU+LiBO3tf4uiXPJu8Fof7LGyzKWmKSnz4Zpoc2l7aZwPLAX9PCwR9sRZod
 wKcx7R9V9QUK7CPDsrbIekVnmcEkIkxHVSi6gKg1u3BTfrmAHI5OafR11BkKj/o2T8xMJggcktr
 J/zAN6ePxQTOtWrhuWl27IgTG9Qk2Rr2lY8Kb4Mo+lMpu3tPZ2bZQ3ngJMiCXnTh1Sfv2gtv6Im
 fGcxjixOwM0QISbZhboNPMWiGX/ZHh23Tx1puzDlLe5+eesLb8hr3Z2+3yi3IpzPfVdMNbJHiGZ
 IsocQQENr1vEKH6jTcuoVxT1dkWLIw==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f8f437 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=FG6qvep-uaCpXJXLnlYA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: Sdm9UPqcKeqIMBS2ejLhAbci4-YURn9R
X-Proofpoint-ORIG-GUID: Sdm9UPqcKeqIMBS2ejLhAbci4-YURn9R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

On Wed, Oct 22, 2025 at 04:58:15PM +0200, Konrad Dybcio wrote:
> On 10/22/25 12:23 AM, Dmitry Baryshkov wrote:
> > On Wed, Oct 22, 2025 at 02:38:53AM +0530, Kamal Wadhwa wrote:
> >> Currently, when `rpmh_regulator_set_mode_bypass()` helper function
> >> is called to set bypass mode, it sends PMIC4's BOB bypass mode
> >> value for even if its a PMIC5 BOB.
> > 
> > The universe will end, the Sun will explode and Ragnarök will be upon
> > us. Please describe the issue, why sending bypass value is bad.
> 
> I think you misread, it sends the magic value which corresponds
> to BYPASS, but one that worked for the previous generation

I just wanted to point out that the commit message makes a statement
that it sends some value. It should document, why the sent value is bad.

-- 
With best wishes
Dmitry

