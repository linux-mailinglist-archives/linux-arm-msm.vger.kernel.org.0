Return-Path: <linux-arm-msm+bounces-85138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5343FCBA503
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 06:11:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7750F30012C3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 05:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78889182D2;
	Sat, 13 Dec 2025 05:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6GAvZBX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dad6rnze"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC741E22E9
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 05:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765602705; cv=none; b=erEoA7WNIWJ6HpfjqyUlcWpChCoY2K54mns/uOR7zQBhvX4lMONmasy6uuB6e8WmHKgBnI5LDMUKj1bIWFwsINCXsy/K/cXIwi/NMmbPnK/L3WZiFN8q4uOjziQSZybko8vOU/HrYucvyJw3cHvB8B4whojLrVlM9axZDgpuvk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765602705; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Message-ID:Date:MIME-Version:To:From:Content-Type; b=NKkovefBGt44h/JY4p1I+OKjr2DzA0ZloV4KkaH+pmGj3DMJyabcgi2+bP4lQYPMWdwcURU+sLa2fKr+oGynZ1iKUu32JUI5rawRO4kVhXxfYXj6Eaey4uzW5eJMSwlM78F17+Q1Z5enyqqMCQqOblZVf5StA5O6A3WgTvpZkpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6GAvZBX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dad6rnze; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BD4h9p82038632
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 05:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:to; s=qcppdkim1; bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5
	NMpJWZG3hSuFU=; b=a6GAvZBXmBCO1JPWHWCx4f+gnYExK4KFqisJ3LkPDD+53V
	cQYKNyt+WynsTcolzg9Jt77t9Pp2n6PEtZ1TD/SIdzAWtr7qde2IR8FTpdMH76nY
	vthEeCw39dSeVqEBnBobggIGRklr0WxCky6xIY9JHXHxRFuBrMq3oZf4M2AzJCbC
	HhY/xWXxobsVGE93nAiI8V5lVwfhUrUAbxYNNvFPc6ByX1lHwX18WIFqNLUroEr1
	rl+2SI7GNhxoDM2UQh76qMv89ZBT59AsJQdWGTkoxqQrzyDrerLy+M/Rl+wDfjGk
	tUP6LoKUt/ek/hDYoc5ZfLHC5BrxL4RLEoi4Kr9Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11c6g10k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 05:11:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7bb2303fe94so2097508b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 21:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765602702; x=1766207502; darn=vger.kernel.org;
        h=content-transfer-encoding:from:to:content-language:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=dad6rnzemifhaStrkqRaM+6UO8vKyTorwwo4hLO/j09gMdD/ajC1KPpLF1YIzeyb9r
         q3TGUqnlnqv/B8rEZ23iw+3D+i8gvw4tNkv5qCcFgyXodkj1RIPi9+YmgTOmcPSe+x/r
         HCGR9dKc1uesx7Q6q/rKwRNr4nNiquEKbjJ06vSW3ZCbvWnCY7eKcoCTG5AlGSHuxTRJ
         HJ/Vew164Maj4qRZiO6SyGTP+3wick2s8BGkOfra7TimvBTElbE5elTkDirSYoTHo2Ki
         6lKIKVErZbI35gY58TcdVpzQKSKPqye27IdBjwC2HMIaP+APTIlXJKhZ8tezGtUzqljC
         1fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765602702; x=1766207502;
        h=content-transfer-encoding:from:to:content-language:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=fMHoVAardTbS2qV49vJT54UigCrUdBHiEMmN2n2zUWPF7+BgB4JlWR70GvX8y9tGfF
         gxfZuDl/N80vEaNxqYFTGL17atBYRQSgHRIo9zQ0wy5SVHkyxKJDHjbTM4sXJLPsIARn
         4GuR5DCICZ7wkw2gluaz2j554zDAbBvPAABJCPw84/to8zCr0eit08CYxW6r7tXOVjPO
         J/yf0egDJSJhRtjUctvFKWhH4FV/Bkq+ukwH0CClEpjIV4FjqUCluSbkjn3D22GrN+Xb
         b56YBhfjXPMogTCXr8A3SPXoR42g55HZPiF4R06OaHXK5LUx2GTob2PrmhTXh3WiiY/y
         aQ4A==
X-Gm-Message-State: AOJu0Ywpb3biAPwfMgu/HB/FoxB+wIPip2ZPFTD0D6im15/4SAprEw5h
	ucw1q63LB02fqK4TTBR2yG/oVOhy67FbKY+pRLA2VDi1I2cjM7/2NK6rUdFsBmGoCRCHFFUd8Td
	pN767fAIfOe00P73oO+wg97bFcjxhXLaT8j+Ej6G2GI4WoD3ZahqmTH3OotXjICbx1wE1hL58A3
	tg
X-Gm-Gg: AY/fxX75j3KD0qt/T1zMYul9jBpSkEnpec1dkg6IjVBPEx3GhbMLAOCpZNx62rdabpH
	I3IUW1SE7A5wlkIVn1ilUrsV/Ec5tmnykVeFwBodTlSMT38BHTTkQHeM0CPQWjHhm+O6UfJB1WL
	VAil06zebESx3JixQjyoYBAmZGh22d9BF/1dt6JMFfiQ62K74mA4lcwkuLwyG72peRU2QucwqCU
	/BVF2NuoGBp7BtmnceDtzIovLBrrL3jpZGbXSGBiAOEJO401zkOrBbdbjh2dB743Md1HQsBHMZj
	xnUI7H3Pyub7HDw1pKwueSRAOjWrmDEU2EtRlq3UsxIHOh+jJYgv45Vzr2yIkyaVhUZMGTuP4wc
	RTWyShplA9muW6yAugG2CNitLc5ybFb1De+N2balqDV6W+rKl
X-Received: by 2002:a05:6a00:bc90:b0:7e8:4471:8c7 with SMTP id d2e1a72fcca58-7f6694aef80mr3822875b3a.40.1765602702167;
        Fri, 12 Dec 2025 21:11:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgi0pTSvPNtSUFmLKIYaUPA6HlehsXWR7oga5QTlHJzHTQA+C2tQv4k30cuFVvEbABdkScDg==
X-Received: by 2002:a05:6a00:bc90:b0:7e8:4471:8c7 with SMTP id d2e1a72fcca58-7f6694aef80mr3822858b3a.40.1765602701708;
        Fri, 12 Dec 2025 21:11:41 -0800 (PST)
Received: from [192.168.1.13] ([27.34.254.116])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c5093d5csm6640502b3a.49.2025.12.12.21.11.40
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 21:11:41 -0800 (PST)
Message-ID: <2ab1bb75-c2ec-4e72-96e1-6411005a9e21@oss.qualcomm.com>
Date: Sat, 13 Dec 2025 10:41:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-arm-msm@vger.kernel.org
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=actsXBot c=1 sm=1 tr=0 ts=693cf58f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=mQ3mVlFQv8SU7HNyWwWuZg==:17
 a=s5jvgZ67dGcA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tclcd6dtLQvEqt9_mmAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 0O0LCGChnI8En8jQfLJjeOrxZDGrxG4w
X-Proofpoint-GUID: 0O0LCGChnI8En8jQfLJjeOrxZDGrxG4w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDA0MCBTYWx0ZWRfXzPIPvdyLv9NJ
 4e2M9rbQ+uLf1owkbcMONXpwUj/r/vl5c6jsfXdCa6SMzebkp+4JZREmuKcfarTe/fndAkeg7gC
 CxKnN+WFzo9wJVavHsGpT5ZiDvMQgnLyvcW3uwviLRIbcohNDhTNvsp05qDlb89iJyeC/vYbl4H
 IUMt8pljZy7nbMD3vkU79uAEE/jd4VM7wcaEMqedqyi1c0rNpSRjBakgoR/lXzWc10PGYEAr7Vk
 ExU62xVqCvxJt9BL5fCEUyKLT/WG3eJBLhvnvBDoC1kqbDkX6sB7gXXlQneRUN440+/DaRv2NEa
 43ySf6Vbav5OZnX4zAknKxBBz8d1RO8hfK1gujreFCgMBHHNFgN7wMBEEfU3j0z/nvL2wYZ8419
 CPZKEiM9EpOmBj5GNxp+71sNUAQB6Q==
X-Proofpoint-Virus-Version: 
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512130040


