Return-Path: <linux-arm-msm+bounces-69867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C70AB2D3F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 08:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E69A1C22797
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 06:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D0F235C1E;
	Wed, 20 Aug 2025 06:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GG5buEa9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FB619047F
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 06:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755670618; cv=none; b=iuSpl5LYQ3erhiQUIGJSgM/L/8msHMgK6uD+++ZQQZxPkv7PQqXrXKbK5i2ub/P8ZFoTHRqN+BMMfqDTF6zEcM77VzlKnqx5cjbpZwPLqO+jcpxqa1ZnUdGdom+CWUE7M0M9iFSQ5i3PSNBLhpEs9o6rndiB+DIo/uVGW3DeDbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755670618; c=relaxed/simple;
	bh=BkNEtWfHC0W481jdirYIhyOmkfVe/vp4DlWZgEyrPcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uhB3I1hX9hpb9x1vwH6oBG9AzchE081iOTZl3K1byXX7Q9/QXxm0tjoJ/9G4F6yJ48NExrD32YbFHgq2E5TDr9hajUFHoCQ+ljqhKtVPwWLhzHd5fXdagd/HXHt+qKe8Xjsi3jscybTEEsEs76p8BBGEhGLgmDojMFWc6wJOR8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GG5buEa9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1osqZ024847
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 06:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zo+qBFSuOCOdT4196vaFitQ277UyoAlgWb0yHJHAlaY=; b=GG5buEa9LEnTmScR
	pHefOJkgG5kNp36UZ+Bu4OR5AavLXm2tVsKFDlurPDgcHmpNNoJEgBiRu5T0exaE
	TK8tc+EDTmo1O62xXCyeZ5cwzsrUVO8GI0RJ+GS1MIZgOYuv0WfvnfG+F42ctT7N
	5OCNa9Vs/tkI588n7pD8jpAR+C9UaLhs9N6y4Aup5R9DidI7OuI3+t4GMFdUFay6
	Ru1APe1uTqzv71Qj9G9lJgk00kvYA8gFRP8kOiGxeriwnkW/EQvESROxmf0Q58ke
	AfhqOV+GY4aibLmLu3J3L1RwRZDEoJT6uEvdHo+EV8d+OHEnEbfx5UKaMPEU4UVh
	Knqlgg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5290m0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 06:16:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b471757d82fso4906404a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 23:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755670616; x=1756275416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zo+qBFSuOCOdT4196vaFitQ277UyoAlgWb0yHJHAlaY=;
        b=o4tuyq8gg3xAjaivFyg19K1lDM2y4gxAAZLc29a757JMB2tAF897+vt5HfaDVjTWUH
         byj2/ENuElT7wlc+RYZVJm80uYcy8rn1PcDXIp3CpHUynvcVzPd3WnuM/jbFDySFf74n
         QY0BlDy6PpAk9PnywUkeTeVB6F+qTbE9iBu+PyhygQM/hSNx/pXxAG4MIUgn9Od/+731
         HCAp/07LgxjgG5N7lG5SyJcs7MUGrGCo+6h7+NnYpz8DFsYAkVMgku188Wnrdar+2ZEN
         XndnjCZOwVdYNKuUNvSqvC4FUFd6Ig++WJH3RIJi1ggE06GHQJmEQnPbsIpT9mumuDp/
         ANEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlCSTqNdhJO4WSJxcdiBaCLzuHKjVY6YJSODliv8bFnE7VQ3ZiZOWYfjjxgvqs/1pDrcHY0iJ+XR4SP2gj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxooua790usMUD1zGdrZltMST+4tYhWeRp9l3BjVlg2+r75b9Gg
	zUa6YpcdzPnrcuolCJyICTSwJHpY9H4qF894aIuDcrU9s03IC11bboKXcpCMnbfwSCu97pKnfUo
	/l1G/LVGOuUAlldhXhP+KgoioNf7tbH4uIPJyrmRrAdOlbLRrySbXqk3g5ZMr3w5kK+te
X-Gm-Gg: ASbGncvnTVoRjBF5It4op2Ssj70KeqWWFxNQSxHeOJUILpF4kMlwdG5z/5f6lAvHBpe
	ZgwcNESuOfz+Ewt4Pk5I/C0MdHE67oMrwRg3g3cB1IGKeTspmqmID/ZVhRQBgWeSp/4sWWqgbT7
	MeF7pPkwuk0GT2QAqCqqoxE71P7edKf20817o7S5DsVV8M1GpsuZzGz0DITgDyRCuC068ZrgMao
	E9SmGPyzAs/Z2WReyh9GJhrdJEXC5jX7rRqjOP0AEKurSOo56Qz0ZdYjA7jCbyE2soRjnM0r2YK
	ekKcE6v/Q7/AmJhBFlBGVToC5+XStNJcTB3UlbsrDGU415rgrlny25pdLCPX6UplZDhXUK/DhDN
	WGw6SvMgJ3wvL77PpW8W8wTqQGMO/MP+u
X-Received: by 2002:a05:6300:210d:b0:23f:f659:a0ef with SMTP id adf61e73a8af0-2431b884c06mr2689095637.25.1755670615713;
        Tue, 19 Aug 2025 23:16:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkuHrM5J+SA+TshY0ZVvPXqmiE0Q5IAuZ5MDZKibUhiwTCZup0o87PAGsuKT1kaJi+7h4VLw==
X-Received: by 2002:a05:6300:210d:b0:23f:f659:a0ef with SMTP id adf61e73a8af0-2431b884c06mr2689069637.25.1755670615271;
        Tue, 19 Aug 2025 23:16:55 -0700 (PDT)
Received: from [10.133.33.73] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fbe626sm1356125a12.6.2025.08.19.23.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 23:16:54 -0700 (PDT)
Message-ID: <45bad7a0-119a-4375-887d-28aed2b0ee20@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 14:16:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Coresight Interconnect
 TNOC
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: James Clark <james.clark@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
        kernel@oss.qualcomm.com
References: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
 <20250819-itnoc-v2-1-2d0e6be44e2f@oss.qualcomm.com>
 <175560674472.26193.14154235220441518996.robh@kernel.org>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <175560674472.26193.14154235220441518996.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a56858 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=voM4FWlXAAAA:8 a=EUspDBNiAAAA:8
 a=SdGosrV6Qt3YffhYJa8A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: aSVLnswycPdw21Tvu_RJ2UUjJd7ChXAG
X-Proofpoint-GUID: aSVLnswycPdw21Tvu_RJ2UUjJd7ChXAG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX7EYY5a5q/FA7
 X88YEI/cvpvSJYaJILjKoVId+0TlZqZGrpA6QxwDpZebU5faLtJy98LqvGuH5g4IWMQaY4xHBXx
 XC8Z+hk0Zdv15fWBg34xoesSTjVDV4HUusm2xMvYWSZvIRV1Cctg8e9VjJXFH1chn7adkZ2bwPE
 6g/JODa5o+dJ3oDaNMA1qhaPusG40KSdxHGp08r3UF8ieHg9lEVqw8wKT4Hd7fm6fAfzDXpM6fv
 +ENMfwtPzFzdYT/k09L2ALlenH67gaicOjje+mFODUUJLy8PlqhN7ADpytsX5zFiCsxKfJ5Ognf
 ZwU7n8v2jdgR+9pjhPxOt29knoPyn1AylmnXEqp2rstApAUNUUou8X3EPJu2qK5s/u7mgWXx5N7
 eHXKeRwM7+9tyL9lOBANuZxY/02c0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 8/19/2025 8:32 PM, Rob Herring (Arm) wrote:
> 
> On Tue, 19 Aug 2025 03:27:43 -0700, Yuanfang Zhang wrote:
>> Add device tree binding for Qualcomm Coresight Interconnect Trace
>> Network On Chip (ITNOC). This TNOC acts as a CoreSight
>> graph link that forwards trace data from a subsystem to the
>> Aggregator TNOC, without aggregation or ATID functionality.
>>
>> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>> ---
>>  .../bindings/arm/qcom,coresight-itnoc.yaml         | 96 ++++++++++++++++++++++
>>  1 file changed, 96 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> 
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819-itnoc-v2-1-2d0e6be44e2f@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 


Below is my dtschema and yamllint version, They should already be the latest version.
Name: dtschema
Version: 2025.8

Name: yamllint
Version: 1.37.1

I ran below 'make dt_binding_check', don't get any error/warnings.
make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml



