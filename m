Return-Path: <linux-arm-msm+bounces-72290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4139DB458A1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAFA11C885CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 13:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76A534A336;
	Fri,  5 Sep 2025 13:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSBe4BfI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1842D6E62
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 13:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757078375; cv=none; b=ClcA6SvbAijQFOzhZkoV1HZTyM3Y4yLThST48tKrAIhoR58y8rSuz0TGlx/yoZlEc8Hshq1jeUXsuv1YonTVrfMVzohpi61QKPlx9yapgybecw29Ll7narZ9onAdpoEgFauXOOpStHySPCPevFkAJXpuhCfQWiwlDYEIMFQgbB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757078375; c=relaxed/simple;
	bh=f9dg9f79cEQYwrNo5ZvWpn7K6mPR3qTgf9FIhmyJUKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DDhtLm+kulp9htID2C7bcAE53p2KQTzWLSG/6IlIkWX5oTQOp+yhWgH2bGpUsnJ6XKlc2wtJz4yYl/WV+CIdCgkXsdF2id55scJbzyrtnpmqMaA2oIbvfGQnq9bb6X2QpQZYC8sNUoG8R9hO7buWKM+Mn6iBVG9IeE7NYILsBCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kSBe4BfI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58557JFV017818
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 13:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0Bhjhxk+tpvajQc7hWGH3X0z8vhyfUm5KLA3GKOkgE=; b=kSBe4BfIxrRDISVO
	fFe1nqQ9zNjhlm6th8gyoWVyI7V85NuzBr3Vm5oSs7ci1nl/zp7b5t4tYmZFJDUL
	a3K4lGv5PTGcaztAUitXrmzCXGVQXcFERsolprSG64IGIdwzjdx4f4ZlPA+q0gpN
	m4Sf6SyfcUCG1dmW4os9pGizcTIcWDwthvm+8W7EAW+CKGIyLmb5GdIuu4ETcxJO
	/tIlmoZv+U/vhOVBpHEM5TVsE03LxGC2sZQQFKK6qpT5OI6BfMOxSOk8pmKFPHej
	aSAMk81jLkrNyekRvUCxSjZQiQXD2liJdo4FRBTOsQ2lfOzWWtdO6pASOUY9qwi2
	uYoZTg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48yebuu40h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 13:19:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b3387c826eso8577821cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 06:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757078372; x=1757683172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U0Bhjhxk+tpvajQc7hWGH3X0z8vhyfUm5KLA3GKOkgE=;
        b=aqHa0R1qTHgnq4nlVtN3eOdlEgjIgrIRq5sBtUr6A1jUUsq9x/NaxXHjYaSxrVLeU7
         J25h6YZunOG4muLahv8vJLBhvaCTkE3Toy+ezvBYGy8fMIP7EdetaY0JtsX4VqN1YGO5
         pa8PQSIe82CLY+iktk4wVQsiCwms6/lQ9lpP6JAyCnW+rUw9uRa6MRJ/q5IypvQ3aLYm
         YTP+00zMgs/pIgQ9GHwpEFqT5ITkFSLpV5Hz0DoktnNkX0nFuXApdMgv5P+Ibd5wOoTT
         Ma6F35qzs6Pea8+PyvVxk0yu4xOtk5qgS8fVKCJZzbkEoJPBNIu5sKmr8Obtr0VkcLK2
         IDNw==
X-Gm-Message-State: AOJu0YwnzO8+/CKoihfwfbr3L+ZtjhBeB2HUz1J2rV/qA9I14Bnv6JgT
	sS0JzVIh4njDgoxkZGXOhhefSJ0csHggkydMqM5OVp+jBEDiDR/bk5A8RMj8VAOEPnsM23ySEL3
	5drAeoa4ctyMYAIFuWzh054s9urhOphuLC7VEwBeJh6R87c+MIKXoM8qb/2gJXg5Ybvt4
X-Gm-Gg: ASbGncskayezbaPESkSeT+rswquZ2G57OSmPiSBLeUqYX7LfnpH8rxEQUlOQO8j2lLu
	7ypaGNH6hAWfaCCavwIMa/zu3DmRsGYXtMMPFBKTyODqt5JxtrhBSNXWDlKwqGjM+47qaLlXhis
	faYiKXGJT0ZRHuuyOG6XsC7G0HJq0Lv64gaB9NOHKGc1IkYZvIcGP02S6YKhjT60R4E3V/LrjzW
	Bsn4YZMkZSYE2RZwpk6G7CSOEaNO8Vc4eeou8M867mTd22hRQVGBUyarZtDg2pycSv/sBF8NAOM
	icu1rLS1KojYW7bpB60xSJqtA39mLs4LVNRlk4pAmFbal3pD7YCdl6NUZeh+nWk1IUqQlQqUS5e
	eVtP0VurfLM4+HpdD9CNvQg==
X-Received: by 2002:a05:622a:1a1e:b0:4b5:eb40:b1c4 with SMTP id d75a77b69052e-4b5eb40b475mr15321811cf.10.1757078371970;
        Fri, 05 Sep 2025 06:19:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuoHXh+KD08XcnAE/jgm1vEO0s+IDJTiD+07YDOxNry7G/om/NzxaG8um/RprAJT1rWU9rbA==
X-Received: by 2002:a05:622a:1a1e:b0:4b5:eb40:b1c4 with SMTP id d75a77b69052e-4b5eb40b475mr15321611cf.10.1757078371453;
        Fri, 05 Sep 2025 06:19:31 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc5306e6sm16320205a12.47.2025.09.05.06.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 06:19:30 -0700 (PDT)
Message-ID: <91fd1e35-7e3c-44ca-9ffa-9393dc9e904e@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 15:19:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8953-xiaomi-daisy: fix cd-gpios
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alejandro Tafalla <atafalla@dnyon.com>, Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250903-daisy-sd-fix-v2-1-e08c50f3be57@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903-daisy-sd-fix-v2-1-e08c50f3be57@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -cD-dLQQPe4kC7uU9rA4m8AOEHFs86Ns
X-Authority-Analysis: v=2.4 cv=X+ZSKHTe c=1 sm=1 tr=0 ts=68bae365 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=P2Z3rHzvZxtGOU_tVGkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE2MyBTYWx0ZWRfXwPjaw+cHlsN9
 ZPNqplgO5SEqQW+v4IB7+1m1Rt9Wiz7yEw76AttK18c+qz2efQtIPNg3Hh3/ZKHg87MTmjEAkKV
 badXyMIUIfbK83GZ/ZwcucXdhRI0MdrcG/KcDaygxXV/Sv7946KzN5C+oj93WifIexy5qL+NFPb
 h832nkOy3QE1aw/R5BRANu/LUN4Mb/K5wgHSolpuYsg4zc8Rs/8TEl4KbDylSOX2nEUdpXhHeVO
 Gq6/lPmh8rz3esw3ZRFyAI3zDNExlqNRmaTDJ3Nm313Y/d68FUgwN9mJ2yhsAxWK1tsvtf9FoPi
 nfP61cXdLbYYbGQTR4BMuq3dmJqxq4NyFu4oNMkDYeKy0EMjfy81adv1nnzigO6e69iKKzNBOgi
 H+AlxQhY
X-Proofpoint-ORIG-GUID: -cD-dLQQPe4kC7uU9rA4m8AOEHFs86Ns
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509040163

On 9/3/25 11:27 PM, Barnabás Czémán wrote:
> SD detection was not working because cd-gpios flag
> was wrongly configured, according to downstream sources
> device is using GPIO_ACTIVE_HIGH.
> Fix SD detection with change cd-gpios from GPIO_ACTIVE_LOW
> to GPIO_ACTIVE_HIGH.
> 
> Fixes: 38d779c26395 ("arm64: dts: qcom: msm8953: Add device tree for Xiaomi Mi A2 Lite")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

That's better, one can now reason that the change actually works and
is not only made to make the DT inline with downstream

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

