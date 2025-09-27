Return-Path: <linux-arm-msm+bounces-75383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5DFBA5F05
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 14:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 064AF3BA66A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 12:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DFC2E0410;
	Sat, 27 Sep 2025 12:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtAHyxdA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9C418C03F
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 12:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758975956; cv=none; b=JQ2W44MSdGsISNg/+VfgXOHbKApkaaGCa2/gmpHGQ140Gdol+unIbhnDUd7xKwGUzx6H7mJ08VfHhUleITwJT8Gha1fMUmQmYvRbkBeqUVp+JS86J8ReHfDsL6GIq3qVNoJodmcgnrmPzO8cnE7IRPFmeNV5n2e0eigD48IMMFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758975956; c=relaxed/simple;
	bh=8LxIxoEuK9oDbUJERTI0um1igrwtdtq0Mq737gi/9CI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sAGdULViZFQJp0YNOxVdXkIykplIu9QurcDFRpBwColci4ou3MVV8tdhduZXrNQA5j6nEUy6q9l3Ey3BbIwLUJQI0NiYBN+m3JGRheCmc+qWrAArg5V/ngnTyQpFhgFQjZWyd+Q00YKNTOVqic/pW+Kx1U/SgKoa5wdaRpxSGJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtAHyxdA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58RBJ0hP015935
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 12:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8HTZrkSYrqPPOE5aWwuZ/eo7FP1KIcHRJKoII1rHuug=; b=LtAHyxdAoERLVHjZ
	JbX115ejTnojvTKRZuUdPj0fYaO0C0eczNiv43mvnGuxSSJNaGnD1UyGLqOKGQZw
	G6Z8Q4wwd2Ef0gn5ZI/RYEX6KCE9ujwfgSiAauKN4FHhV1deKSpo5TxFND3UzPZe
	a/m22yMSkF1Y95uwOT82TntEsXDs0FDo4A7UtkQSo4Ffb/RAhRoAxf7UpC+Hejn9
	dBDqQ5oUq1zp2UGyeq8b/pdQaPlJDwifMdhRvfRmyj2zjLLzCq/bEqDqvYgL58gh
	0cxqGGcLeSDfy3a2BnH23sP6+bZyfHJCaPBgeMZiMsF9R+KK8+uRnuMOnBeresZY
	FVLe+A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977gkdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 12:25:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e8707701f2so104524485a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 05:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758975953; x=1759580753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8HTZrkSYrqPPOE5aWwuZ/eo7FP1KIcHRJKoII1rHuug=;
        b=YMjoy5ezZiSXXcVhMmEGAvFUaR5AcnM93a4HTpNGY/sUM/8XMdHJzJgmWxNS+mXVfl
         wsskzR7YA/SboocTL9qTc9lAJvWfExKbJ/qWI37TGT2FW4UNFrd98BJd4GNNdXoPqblR
         ilyPztTiezSt9yDKkTjnSKncWevhc09TfEEuarWFIonwSnMD7J9NSidxBnpQkU3xo1S+
         1oViU/SRx7BBhROAhvEh3ewZu6cVl/R+CJTQPi60XZAKVbbWYqDnThvTCE3xA9szJGtk
         Ev7faymW876NLWachSuFLrxqJOWpwkrIaMtk2Yiwhjx49io9upLfghaQ1tL6HvZAi8Rp
         oOfg==
X-Gm-Message-State: AOJu0YxAnjx/yl4K8USdLDlA7cHVxcxCKynozvetAvl/kbzYYpeRyQkn
	7GAc+A4y9BNS8R8vSsjgzG2RHDsHZwWLC4FPUgUL0HsmsgOc3rPDy8M72jRYDkB/zaaCvgEWtYf
	ze1AIAN/Xod51kqicar/Uh827BgAOXvvMREeAzvksTMYIhQ2SoFBt6kLGWJGzhU2ncvq2
X-Gm-Gg: ASbGnctXhYWa0ioIzb+0n8caSKwCiAxLfonzeTZMOfmH+RFs9Kr84szKBp/hQOVik3W
	xVGIOUqCQBzqa32/6RlIM9FLlDln7kF5/u3iu0bJZQI23ujSN9zdqtGiIvN5fGfSVaTn5e5wlTC
	C5uiII08+PXu+ibNImY/ompMzcizZ+tr5CXXoOu1tTJDcli0tZY45rYUBOuRzLmUJtaBU6bxWtm
	1TSNrzpYcpdQ0gU0pERNl79EcOTpwyhEZHDXe/TET1CSBUdB39M+Mdo8x44J8CzPlQvaNknSdnN
	yCzZQN72ujuEjdV5RGTz0AqsFb2XxeuQFoSYZ7+WqIzNB1OuqGRBpLoFEYd7fFHPvH/96q78CYH
	4T6bDW6owHJRvaoQJxWW0Uw==
X-Received: by 2002:a05:620a:3182:b0:812:81c6:266c with SMTP id af79cd13be357-85ae6d81db3mr926478485a.9.1758975952992;
        Sat, 27 Sep 2025 05:25:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCG2e/ZW9GFpuGzcSJqt6X2AuHy0M9fiQ/EEgWD1R6USyO/kkVUy9LiI1L21B8ibFVZJ2N8g==
X-Received: by 2002:a05:620a:3182:b0:812:81c6:266c with SMTP id af79cd13be357-85ae6d81db3mr926475985a.9.1758975952413;
        Sat, 27 Sep 2025 05:25:52 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353fa65a62sm554412366b.47.2025.09.27.05.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 05:25:51 -0700 (PDT)
Message-ID: <7cfa782b-07a5-4f0e-9151-44a42c77badc@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 14:25:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/14] phy: qcom: qmp-usbc: Add USB/DP exclude handling
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com,
        Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
 <20250926-add-displayport-support-for-qcs615-platform-v7-10-dc5edaac6c2b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250926-add-displayport-support-for-qcs615-platform-v7-10-dc5edaac6c2b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8rLbwiV5zxzWopJQLEfaxAT4kYEn3rRa
X-Proofpoint-ORIG-GUID: 8rLbwiV5zxzWopJQLEfaxAT4kYEn3rRa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX/Bd3KnbdbqSU
 XJ9gimmtmIV3ofwA617D3w7I0GN+m3qi7pko2qfo48PCXWH3AfPlJ2rA1mACMpPx2p7m0RRxzsB
 hxTI17y38a13afn+Dv5Ld+DHzHH8YYsXGMeLi+ixhJdsAv0WDMub87gs7uu+Rnr5QdluDJYIlhe
 LS+TCkxKO0SGnH1nY73ZVslWaiqS54dC6fdmdZVkCfhs78UcRPUzVK1o9+EEBbiE57oeTYzTIzN
 ORPVbQjpJ0o/XaaFHiiqVWS9iZkDngulCDF45Fqx26wYNusI0xcuR9DQnwY6j8d8jIHCsDjEgML
 7iMu9ihCR4uMJdqQ6OlLCOPaEVFj2hwFN0Rf/V0fn1DnArZ4Eu9h6WFD3kExFZS+1Cjeahqg0U9
 8fpfsVtXyBP19+0txbFrQXTKsCLdHA==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68d7d7d2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7a1U2GcbA96CJLvzQ6EA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-27_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043

On 9/26/25 9:25 AM, Xiangxu Yin wrote:
> When both USB and DP PHY modes are enabled simultaneously on the same
> QMP USBC PHY, it can lead to hardware misconfiguration and undefined
> behavior. This happens because the PHY resources are not designed to
> operate in both modes at the same time.
> 
> To prevent this, introduce a mutual exclusion check between USB and DP
> PHY modes.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

