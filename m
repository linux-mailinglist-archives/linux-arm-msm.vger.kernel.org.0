Return-Path: <linux-arm-msm+bounces-75278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1DCBA3029
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 10:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67CF01C002A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 08:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BBB29ACF0;
	Fri, 26 Sep 2025 08:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQeg2Vsp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C277329B205
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 08:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758876618; cv=none; b=Bj9VAZxgIFjkiUX7wCWh9zJNcwY7laeap7PICgy6xBy5WezaSUhBb1+ZCy5nnX26ApAkV3SAVWS7aosNPV8RQZbE5nhKd/KJ96xrHsn4uB9TH2rgiatudVWCHUzpQcWOQonnuCt6/LBiltcwtXDD7USxZj3f86N9K7yxAKDW+PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758876618; c=relaxed/simple;
	bh=DW5PR20rrpRjozhjmQF7SX9wg6GFQc9bhuXeEh/lm7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXPVBZIp4b7PnZ758PsreJKxmDcESuNRr04+sDrhCQfv/Dp3bl8/Eek7YRlmP92JeJUZxNyy9W/6DlYD3uyO8ImCzT0bXuFpHLOlGHO5XebwquZIu3pDHpS77JrLI+hePPye+eSPd80t9w22MAWMEaug6dQCdPC0hdhZGUQIt08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQeg2Vsp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q79Lxe007999
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 08:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hAvJmzrwoSb3evK5QrOHasbm0i6ySDURtAIAeME4WEE=; b=KQeg2Vsp8pY7kAkX
	m6rMUbmJSMEIKwgoIERa7LulLjSLELt8hiu1+IYMv00GPc5ieNf3NAF40MP3wS7w
	dTFRo4CgdmzXsaN/3r68cQKzeMyrViYEqU69TrIrqEfIVUDA2OAk9PvPSV75/YRC
	js4NLs2Wi36DbK7EtFjIBXupnVnxtU8IQYHl38HwRIw7hdltPcaksqAF7ahiRnCi
	EPee4tLw52eu2eNitIONh6+DOvniIs5W/h75KjX5gpG5M48EDuJhD6DgXuOwz9qI
	7emCJKiJNJ7AllZQPh2QgkIEm+OEcpYWj/Mw8OXl9VgTZ2Nf8iDDHcAYpx9M3uXD
	KVLVdg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0vt5wq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 08:50:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-85db8cb38ccso38685985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 01:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758876606; x=1759481406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hAvJmzrwoSb3evK5QrOHasbm0i6ySDURtAIAeME4WEE=;
        b=Jv8STQWmfvGndm8F/q6f13S4iIyVedOSV4T5sy3rsnmKBwronOY4gkFj0/H+qcdfjW
         tXo09eLNdyxbGtvz/1Qgzsi+2CHynQdfUAKoKhZM8RDCxhWSodXS5MogKdpRUeV3eApJ
         6LJRpqRyZWMiFnXM1IuZhE/ZI/gsSX7Qr5DaVyeWqggM3QXrouBh5MMmdaG/JJQxtmXn
         2FdtOQZPAF+lF6nuR/HcTV7T6z+FXKpdacuQzo7SgSDSotSU8K3Zj4kK0MxUr7iC7cWD
         IOdNBKzVMFOvxglUP0EQCSc/2fyda6vrgpnlgiOXDfvycsyWFtw1gSFrTZO2OFR++/eK
         u3Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVLiBBHfnwMTa5ABygi6Vpg9ZUwVLjoOA/sP8LBcFeURGpJIz7F+Ynd39X0+zVrUCY4losfMb4chR/NhSvU@vger.kernel.org
X-Gm-Message-State: AOJu0YxABksOJ1puLP7OlginKepTWaE0UFJznd3TIh4p16Ly0vNmgnSE
	7pYqC9+6hnsBwiINsJc8AFM5Ot4vcCG9/X8ZNqy4nfg3qLWpJBtSXrfamaV8w0VmFOLjSjyV6IX
	1OJtdBxG5HjqMtyTyheM+Tsd/Mz58KlkXq8QIgVJlavftK0nt+0UHLh4SBNW3QioQ1DYJ
X-Gm-Gg: ASbGncuwe4NyXc3Nsmzu4DSicClRsWRI+GppwE7w4wbstVTgsnKcG/EZ/A1qfU4rlX1
	9IHB2Yu8089DF9IM5KCb9HCP/79+U+DOTLeKSb2P4dOdawIF/U8T4IRd1/RMCPw9997RapY+SSP
	O7WNvShniNakczW6qu+BEDrLRUprKRxBZGEbSgsd3bHAUm+pI909rX1IyqeyEONC9VSgbjUMn+X
	LlgqFLmu2RF2bMFgWWE9I0pGBXxVKsooJPuEQPBl8ROBsmj8Y19JWOO0q0wetQSJzWI7pxg81oG
	NGsyiZKvMcU6yXLICXZ6eaxok9UikMBnngwdMvGErae3NFMLmTnkD41n8DQmEam30NL8ze4meSE
	VwFZGDK890ZUzwmoX67eVyw==
X-Received: by 2002:a05:622a:1101:b0:4dc:fc58:c50c with SMTP id d75a77b69052e-4dcfc58c83bmr20483401cf.5.1758876606335;
        Fri, 26 Sep 2025 01:50:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEiWvsH3XhfOSeK3PolvaeTD1lJD0k/Gm0XDb40I/xEqlYRxnruYGzyeye0H22WTBm31aZrg==
X-Received: by 2002:a05:622a:1101:b0:4dc:fc58:c50c with SMTP id d75a77b69052e-4dcfc58c83bmr20483151cf.5.1758876605736;
        Fri, 26 Sep 2025 01:50:05 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f79besm326034066b.69.2025.09.26.01.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 01:50:05 -0700 (PDT)
Message-ID: <e7843f88-71d5-4f7e-9f99-df06630e02fa@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 10:50:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ASoC: codecs: va-macro: Rework version checking
To: kernel test robot <lkp@intel.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <202509261315.O9CiiXjb-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: l3yV-608Nw7MIAFCuchBOfpD8gH9faBB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX+SzSMbXwttfU
 4BGJqVXxt4JVly2MT6irQc10h941yjkDW9qeV9LBBtX2ELyX8Kj3CfjvJGZ7AD3oPGxr1uJ+6bY
 Z2k341cg9FIRqX7W+l2Vq8AbHQ7fmgZNLPPi+CO2j7x8gesVnSJxO0ioiKAjUfC/1l62jxhl14o
 4Vo7HTMzQBDSWCtikvSkQL8taxgkQwaTaV0nK+dduyRksodzsGN81pxnkhD4kFhGjBWyXfOgf/a
 yflIY6d6B5tcV/CHubwjNe+jGeGKTnGmRWc/SaycMxSobN3E3Le/qPCCIqngjKWImVBbs9iTt5x
 lPi7dM8O9NacoisTMgNflqWwkY/ZG8WS5RJKCPetdyaN0mbyfBADiQfBlgzZOWTyvRslDs6rQ5g
 lUj5iZAVj67v06382WGd+5WyC/YKzg==
X-Authority-Analysis: v=2.4 cv=OstCCi/t c=1 sm=1 tr=0 ts=68d653c7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=zXO_E9iLSFoZqPovHQIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: l3yV-608Nw7MIAFCuchBOfpD8gH9faBB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509250171

On 9/26/25 7:36 AM, kernel test robot wrote:
> Hi Jingyi,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on ae2d20002576d2893ecaff25db3d7ef9190ac0b6]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Jingyi-Wang/ASoC-codecs-va-macro-Rework-version-checking/20250925-080338
> base:   ae2d20002576d2893ecaff25db3d7ef9190ac0b6
> patch link:    https://lore.kernel.org/r/20250924-knp-audio-v1-1-5afa926b567c%40oss.qualcomm.com
> patch subject: [PATCH 1/5] ASoC: codecs: va-macro: Rework version checking
> config: i386-buildonly-randconfig-001-20250926 (https://download.01.org/0day-ci/archive/20250926/202509261315.O9CiiXjb-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509261315.O9CiiXjb-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509261315.O9CiiXjb-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> sound/soc/codecs/lpass-va-macro.c:1479:8: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>     1479 |         maj = FIELD_GET(CORE_ID_0_REV_MAJ, val);

Jingyi, could you please add:

#include <linux/bitfield.h>

when resending?

Konrad

