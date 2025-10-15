Return-Path: <linux-arm-msm+bounces-77280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 224EBBDC48F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 05:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D05534E8427
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 03:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF9525487C;
	Wed, 15 Oct 2025 03:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVAN7RI/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1A41C5486
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760498115; cv=none; b=UPZrDfrBg/pPSsX8Fesii9OwMqARL45TIbrYEEjPVdSRFgM5qZK485qOQ2XkrZ3KFxm3GnaWwBEbwf0iQmmtxRTZx6Yp3aLUgX+ekwvD9aTo4Qhukjec+aeiW7zYf8dCpaFFndK3OO8LCICkTMUijsjlTzCrzPwpxvSuOFSVTGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760498115; c=relaxed/simple;
	bh=Z2EcDgOIRnYP1iO3bEVKH8ESk4H0ObpufOU6wembBn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xqui2O0VmJxgoq8H2BJSlObjErhDA2/V2hvFSZig5/r6I925XoM71v3lCl06OmmLdaol0qJvK1Swz0F8xftEQ9dNT7GvuOPggM/bOgEe0p28tEKerwMuIif45y7d5f6OrboO8lsNI5P308T9sYbsTQa21bxOJBq9bQvN5Tw0Bkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVAN7RI/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s5qq003381
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z2EcDgOIRnYP1iO3bEVKH8ESk4H0ObpufOU6wembBn0=; b=mVAN7RI/A06bfnIl
	1gCkbCZ8teDNzbQuKxj9nsliOeh1IhTBwdOOUxHbzZt/XdLIgTALZH5D2aZoPnco
	gGefSCpJVDANTSVFWyUSNo1LO2xe5vpFLU5De4UhpCoN6W9G/IWpIrCSVcuIzc+s
	d4WboTsmBRSafPpZKu9zmCbuybIOII8gwvloOob0ITam/t/U2PBDs46pgPdhNlH/
	ELdmmkZR0HgWh3vp/1fW6qk714ttANC+xN+tiknE9xAe1sGEahFbAxi8YAqeaHnd
	1zrucOPv/S0orQt47wnG0FkT+ZnfXAMVa6z5y2hmFO/OTTrnh7cE0R7YW/RnPjVZ
	Wzvq+w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8heb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:15:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-26985173d8eso197619245ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 20:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760498111; x=1761102911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2EcDgOIRnYP1iO3bEVKH8ESk4H0ObpufOU6wembBn0=;
        b=eLK24ttVs6iLFEdWgqJFB/CldYokQqak9Rjm6BTkBNxSAt3D3xGY3FqgXhgNgJTk54
         qj/VzQb4OsbQKL8uYUatQKXvpQ1mLhydF2R1EUvNNAiSpYGYM9efk4n0dj9OiG7TIqGT
         zS/Ob5TdE+G23IEuVoVUdvBk5zMZkDlt+nJsFG7oRNj9nQ+T23Xs11ZTezIhiIKRrPgW
         pV/ccvptsAEHCwLW7X2HYHbmMn/DD2MIwZuxrVLQV5SgTy9ni25rmm3Oog/HLuE47kOW
         c/vLF7vZ1YA266Ny6y7MZQcVEJjGFKB6npIynWSWDq27+DXC9FDasyUfey86gh6nuOvL
         bmXw==
X-Forwarded-Encrypted: i=1; AJvYcCWwncaqyBqX7WWi1aAEJyQmaOZiJmtVzaUsidWPV6JcYHctUMy4W5KXgnUabBTFhZh48Af8Tvdg9Gj6szCy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1ioeHKmckTg2xwi1wzKiJRJJcU403V8edMuRYICghuR+28JBO
	EdvZeuN3gg8w/macnz7jvsGktH//+nRUWHdGIDRQWt+HvAb3VwWiLjk/IJaoZvuUBz/tIHHc0rT
	Q3UATJXL/1ObWYC+KtKOt0tF/aXhGbZoQKnHxmGHTedHCrrEwepbuWfsaJphk6cnJ8oS9
X-Gm-Gg: ASbGncurzd+0/oGAkp4cF7vCnkCdWTG0MvugNrTywh0O7E8o+fP+JkC9aM8fXNIGg8v
	K6BPQkW+Xrb6O/aZr1Dr99JpO3FVq09hh2H4iscV0YsL37bkbvfXjec+U5FwzmuPdqUaonJ0ZpZ
	e4M9DE0qvm/+11+UAYqoLgzif2ekdsuFwZioSpPJw3WunJ9A0MfF6vCFP10q3+/DDqvFPsp0lxC
	Hy7QjR2bodyVs2RpoP5CNa/m1uNQS/lSjtEgW6mTRNefYiA1ZTJLDv/sVSogvM1SpnHxnZcxwCa
	DxXx3tcBcyVClhpf9L6tAovEVqhJaLyoJeKwB6AjJGOwsUh2oPXOPEQ9TocP7pHYUR22dL4l9MX
	XU5aoM1BnhoMymLm2mjCxfO/jUySKovP1d/4=
X-Received: by 2002:a17:902:d481:b0:24c:7bc6:7ac7 with SMTP id d9443c01a7336-2902723d3e5mr379806715ad.18.1760498111438;
        Tue, 14 Oct 2025 20:15:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp8mRCfk/F3vxmV+6b5oqRQLgmQBXREp84fmteVqzoMJJXI68+BftcVdGldgZVlfhqzx5J1Q==
X-Received: by 2002:a17:902:d481:b0:24c:7bc6:7ac7 with SMTP id d9443c01a7336-2902723d3e5mr379806135ad.18.1760498110835;
        Tue, 14 Oct 2025 20:15:10 -0700 (PDT)
Received: from [10.133.33.56] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678ddc9f8esm13665626a12.10.2025.10.14.20.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 20:15:10 -0700 (PDT)
Message-ID: <446fbe37-3bf0-4dae-bf7d-b863f7fa3b4e@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 11:15:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
 <20250924-knp-cam-v1-1-b72d6deea054@oss.qualcomm.com>
 <CAFEp6-38buo3WafiiXUEUs8n-=SKgacMD44gGAd1pnEDAsizCQ@mail.gmail.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <CAFEp6-38buo3WafiiXUEUs8n-=SKgacMD44gGAd1pnEDAsizCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hxSMb_0Z7INOQrJi2AmGY4f0eUj7Bo6W
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68ef11c0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=t5TqcTtw8i3Z0Z80VL0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX6LN4W/4w5j+a
 cwLuLbcz0ZBpdZkCbfk1mbGHONtXr02f8QuCwbvY6ywnYK30556Jucbj/91CET+icheq/PCOwt5
 odeNM/DUjeJrrBxWc6WHRvtrFQiT7myq44l+4zhRD3r+SezJtEm+guOTib2JRG8Dnxot5QXALHp
 PFPrUO+EUtWzTIcw6N4SmWOLf17ZqGWsZgbzobEHRfG+8l8/CD6rJKrOkzg48gIDQZLeUQSxdE2
 D7ce1kQNdqVR6IOQUlBJQ8wX4wy2cJ2/CySc9APwoRUU91N4Uhcz89nzyKPLbSwfvMxZqO28luL
 4iR0fz8fLobBih7DafRkhPdfc3oJCnPtfZNlfVHnSNr4ZMpnoIUdIuY8MD1NrG4NCNFRzBE0N54
 qcMCTkShnaJp9dihI8bbkP2N6WY7ng==
X-Proofpoint-ORIG-GUID: hxSMb_0Z7INOQrJi2AmGY4f0eUj7Bo6W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134

Ack

On 9/26/2025 3:32 AM, Loic Poulain wrote:
> On Thu, Sep 25, 2025 at 2:02 AM Jingyi Wang
> <jingyi.wang@oss.qualcomm.com> wrote:
>> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>
>> Add Kaanapali compatible consistent with CAMSS CCI interfaces. The list
>> of clocks for Kaanapali requires its own compat string and definition.
>> This changes the minimum number of `clocks` and `clock-names`.
>>
>> - const: cam_top_ahb
>> - const: cci
> The recently introduced qcom,qcm2290-cci has the same definition with
> two clocks, ahb, and cci.

