Return-Path: <linux-arm-msm+bounces-75463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE8ABA803B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 07:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B879C3B40D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 05:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79FE29D270;
	Mon, 29 Sep 2025 05:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIHEcR5x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1230517597
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 05:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759124644; cv=none; b=r4B4XY+hEWqthNa2T5bNre0Yy2k9/sj5EGBjYP5Hc0+DACRKJ4D8mOir5SbydY96EJmaaaL76X1TwAo8KOprzvclWwJY0jKoS/EflTt+0LJVJ7CWMP2GPRGgDyRcC/aafQeK0rc/MyOwtBDl1qyYsbrxVtWyMkau2R0kGnhkjes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759124644; c=relaxed/simple;
	bh=HNiufS4QgvTOpQO6FbL535zp3vDJ1un9gKIOCDv3sjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+ft2NWpenQszDVvlW4EO8mZpuls9K4BZDz3dNQLg61HU7UkaeiIciE42Lb/S/WvqP7mTqVKQwMjlcXS556Twlaknf3bQDDWv+ndTnQcfdndJNjBaZ/x8+WSt6IRhkbHDZ1kilGZzR0T85DtcBrzXHp4uu+q97v8bCBJlzs1sAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIHEcR5x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SMaK1r012802
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 05:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0shxXdl1M5m67yzuv0GXcdasQMNMQSFmS4e9Kkqn+q0=; b=TIHEcR5xYDni68va
	mvFrbiD3QDfdFSWmiApYHdvRZVAKo3xoMvn7BRgUZyj96EoyHLHafET5Jk1vWyiz
	j8Kiw9bRu4abl1Cd4hFfMrUIwujTUOOz4xgETwjcb3bYRxze4ZzcStp6VEJbBGTZ
	3w15+a4okVTN5AN1oWwH91AV193U8Q3+UIyr3yLd9mrVdcganr+AxTWfKebM/RlZ
	uwUyHsq7fNC4TJVow/cGF47G5uyHUAgt2MoTORl3TvCE+gsLXDoX3hLJ72u0jL+U
	Pvt7hjNYdqpXx/yePxgZbNcnYkES/Q9mG79E7vUFuFl21W3v/HHZD3xbVdPBYluZ
	AeNgJw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tkyk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 05:44:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-277f0ea6ee6so52124865ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 22:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759124640; x=1759729440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0shxXdl1M5m67yzuv0GXcdasQMNMQSFmS4e9Kkqn+q0=;
        b=OqTUQj8UT6LSZJAgLYkSGThqMmx5D5WAwWZbfU1FMOwaqlijfwGJKL+JX0s/iY8jZk
         O/Lj92BXTsMIHoKuIHViBbo2k1XHqPVG9p826Eup+h/H+N5EZEDxATSs3xd2gKTzUkqQ
         kYpMKIlIF2zQSrdUh9yLHCsbtSHXoch78n7wq1ZcKPSftYiHJM5yavArsrV4DjWEOdGD
         PEYWSjqbOsSRccAlLFQ5tCSOSoPtt7V1LjJddcykDVH7Rg9aQk9phjp2WyyhrK2+PGt/
         NEBTTEniwk68tx28mh2Atavb/9cT38XoqlPd2XK5H91DG1hM0F7U6yc+GDmkKGBCE8tn
         U/TA==
X-Forwarded-Encrypted: i=1; AJvYcCVK7+rSLVdeKWZU2bqP7Nco3gMBIujrc2bCKv33FBqVUAToDXC7ezcQLDWyQa9V7HRCpQG/dPX0gDPlAlmx@vger.kernel.org
X-Gm-Message-State: AOJu0YzVTNiNEb/J9RlcyXyqoXwSJc/0M4luaJ7y2rcgnch3RA4fwse/
	PWU0C+FKIxdapwEn8/n6KAkeq0Ck0dmTnoWGFTk2lhL4i/aUYEc0FvAk9ND0lmKVUAy3p0/FP8q
	QMTlnSelNTFvySDoW3CzRfBYVTiLufnHL2emuvf+lC/XdGN64inlUaKA3na6xdCXoV/xS
X-Gm-Gg: ASbGncuLnfQNtTAuYuMlP4B03jgAuoQckyP7CEg7DR+0F9WXjIwRv9W2gBdRnjcXhih
	C4cDlOSDQPGGxZ4rtWcZe7L2X/kYl4EQhD2zy5GUuCHuh/5FJjILGwgzDvX56Nw0cgQSkpXWKs1
	LEKqs31xHvTjo6pEypYROP1kDEVw5r8+D2CsoBoi9Xctz8viseDOiqCCwCniuu0njBbB56SuPJh
	WMoifgW/f7sBfZ7CycJ4m14N5NIu2NXBd1bT3xX5kNMCtVJZnhBWgXGvFm2EiXCm39sP+t38AvW
	YyHx8TYc37RchWuDKFRM0VfU2krGNCGrpnIif/UZiHngcUn3G6B/64ukFgNej6cv3GGFca7xmwf
	9eXH6LVHjLIRuirHr758w2SkV0Qnv1qb2rVo=
X-Received: by 2002:a17:90b:3852:b0:32e:24cf:e658 with SMTP id 98e67ed59e1d1-3342a22cdc9mr16537628a91.3.1759124640441;
        Sun, 28 Sep 2025 22:44:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl7IE2Pt6RQ3vYJq5zb9BDkApqE/UvUl6n0SAk0jFAYj2ocsRLqMrO3x/ZsK3UmEKV+StagQ==
X-Received: by 2002:a17:90b:3852:b0:32e:24cf:e658 with SMTP id 98e67ed59e1d1-3342a22cdc9mr16537609a91.3.1759124639982;
        Sun, 28 Sep 2025 22:43:59 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33435b4f180sm6031452a91.4.2025.09.28.22.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 22:43:59 -0700 (PDT)
Message-ID: <65338db5-d255-498f-96cf-bd037aedcc36@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 13:43:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ASoC: codecs: va-macro: Rework version checking
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
References: <20250924-knp-audio-v1-1-5afa926b567c@oss.qualcomm.com>
 <202509261315.O9CiiXjb-lkp@intel.com>
 <e7843f88-71d5-4f7e-9f99-df06630e02fa@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <e7843f88-71d5-4f7e-9f99-df06630e02fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX72m5zKPiPf4L
 BdytnK3StXv5NH0dz5ZBgg3AmsNmkyJWCUoYh+X8rWN9waPgg6lStF8mYsDj+3rNxwWT6carJKF
 LrJy4TmtqOa+PL2yQ68DUrftZWdwhr1/21OaWMkWZC2azOUoKlWRqaaOPms5YYNhxavcP+Tn/kH
 lSTOeWMCXTS4urWQazIWtCP7Uqdul8TQxwuND+wterO/gU4hFfJgNGp9IkVs0H8PL1vERv8IBI+
 ayFDTEENjFlvhZI8gbfdh1bN46j8+KqBhy2v+GloooKcy68W7iiZtP/FXNZ8T5+137SGvhCVoDf
 NQC1VYHq+7BbnFAYny0ngIRJX+SVXFdeGOzPr2cVFrw4QNxqs++7d34+W1Yc8wproOCMvkM/phu
 pP3A80GkdpErgK6vsTo03rDAFaVWXA==
X-Proofpoint-GUID: fvjdQjR04pi00-yDRmtEUbSN8HP50XSb
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68da1ca1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=H6HILBvNmDOxdPU26TMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: fvjdQjR04pi00-yDRmtEUbSN8HP50XSb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029



On 9/26/2025 4:50 PM, Konrad Dybcio wrote:
> On 9/26/25 7:36 AM, kernel test robot wrote:
>> Hi Jingyi,
>>
>> kernel test robot noticed the following build errors:
>>
>> [auto build test ERROR on ae2d20002576d2893ecaff25db3d7ef9190ac0b6]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Jingyi-Wang/ASoC-codecs-va-macro-Rework-version-checking/20250925-080338
>> base:   ae2d20002576d2893ecaff25db3d7ef9190ac0b6
>> patch link:    https://lore.kernel.org/r/20250924-knp-audio-v1-1-5afa926b567c%40oss.qualcomm.com
>> patch subject: [PATCH 1/5] ASoC: codecs: va-macro: Rework version checking
>> config: i386-buildonly-randconfig-001-20250926 (https://download.01.org/0day-ci/archive/20250926/202509261315.O9CiiXjb-lkp@intel.com/config)
>> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509261315.O9CiiXjb-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202509261315.O9CiiXjb-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> sound/soc/codecs/lpass-va-macro.c:1479:8: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>     1479 |         maj = FIELD_GET(CORE_ID_0_REV_MAJ, val);
> 
> Jingyi, could you please add:
> 
> #include <linux/bitfield.h>
> 
> when resending?
> 
> Konrad

Will add in next version.

Thanks,
Jingyi


