Return-Path: <linux-arm-msm+bounces-85885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6CACD0023
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F91B3042496
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E9B2FF172;
	Fri, 19 Dec 2025 13:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFED5coV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j893d/Uk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2C82C21FC
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766149973; cv=none; b=S6XBcFG8subyQ4fKJvCjVl6veRYUbOYnVUTL6qaQbY6Ov8gc5atxr1ziYIoyYGm923+vlEIcK8cDBonVQlFl2VFfAARXdFGNBUMhktudZW+8/jRrLYNBcKaMbUpjUJeLCQ8BT34y2tq62BRapbBpN9jNTp8SUQcJFVe0a5Zl210=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766149973; c=relaxed/simple;
	bh=GWy94Vf+wzIukMEl87VxJY8ixIuVBKH8iYhMGLG5GQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UreO3wXvRvLacA31lIcvG9y0WLpvkzo3BKxGkfuH28Q56uscs9yVoDeSg7Ahv2AA/V4AmL0kmBA4yUowILE8Or1FbRCRMBdRG//wAXo18GYtI1JH0aDlxJyUGndbx6Gm5dEiJ9cDUJfcvk8r9UnJn7/6odf/zxbnW0/rVfotWpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFED5coV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j893d/Uk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBlapL3700746
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K36NBtDXtxR21RNLQDO+6cgR
	yGPnsAcmZtcmCarY0nQ=; b=oFED5coV8gDXLiaiMsXVcQOpkJQHcR4BXnIxAYdd
	iXbZFbIjLYP0trBL/pTfsniAqpU8BY5LzMxyPEOsFy+rfjbrLhewOqUUbi1UpbqG
	a9t4+lg3G505ynNVWUZdmcBDPjAhO9wPBCi/2U7wmqGAWJVbE1Q+BpR5Krwn1eRN
	TZHzMTnQRDo/3T+k0RQ7/iQqSwAlKAvcc9+nltPBds8kyTKKRybQMa0PRO6KDLSK
	l7oZsLY22Vwxww5cAWPqzO9SOZHkXVg4WgQ7J1TKP7DulkPSjkdK30ndU9CmYzHk
	qGZPRKH87pctsblrSPLVFRhBIhi9b9TV3wO15Nc2N4rZdQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ejp3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:12:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7ab60fec3bcso570274b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 05:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766149970; x=1766754770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K36NBtDXtxR21RNLQDO+6cgRyGPnsAcmZtcmCarY0nQ=;
        b=j893d/UkOwmspquEGaiLpssy49Ca5rw/LffuCA7FBLg3XPPQ8Jvdt5724EPEvy+42Y
         Q1n8zw0hYYm5mBsC/FWoH/S01hNqemkTyq9x3444ZNSny2h5ofLcJ4FgfhoQvI63CPV0
         gVZyHIRUY7yUYTLz6hA9YSjw/xeAGxRetqtMw6Vp9KGiocbZuLeke09CX/IGfZ6PYDwp
         MPk9J3TXt7/K5CaHp78c0zB7+kT4XxN1158i24Io9ojsdKw6dvqsqvX8ceL1v+Qks8/1
         WSHaGeeTFwxjDtHddcYEX6wiV2i/75PbvSK791sudFJArticjZFDjpyTuo3IsYLnw7X+
         DOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766149970; x=1766754770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K36NBtDXtxR21RNLQDO+6cgRyGPnsAcmZtcmCarY0nQ=;
        b=fvhPSjnJXF7LQYJZ38ioMiXQhojvr5KbRRl4r8Y/OEkNflr7AREgSnxxIsfDpX62EB
         mFhyx97i3WpDvIS+nm+iaNjJLGfBDO/LpyQmVHNVftwWrwer+J4jVTfGyy4kUaSN+pWH
         v4y/0/9JVf4PEZD02LCO4vp7T9YxsUwsMphU0h7mvAqwj9FeIyoQHxdxmb5J0xl0kbd5
         6TLd9lWcEjPEwjLucnbX16wGI/9JqitzGOT/DqiU6C3e0dvB/Ar4TXH8LLtCXzoKwSRK
         xgqrAe+pAY4uOzea3J6Y5PpF8w9Eqvm4yII2rZO9oAeWc1T4xSFUQv9dY7gSs/MBMbNJ
         jR/g==
X-Forwarded-Encrypted: i=1; AJvYcCWEAzu8pGyrtFaU1Ck7BECvQ+Onz0CmhK8b+6UNijvTZEhNVNe3JMFqFr4jnRtyVVRjxkTNNQKz4TGe3YBI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8laDH63f1JZ+0NCfDMgv/R5CCD/YQsKiZuy0rVqLF8vvehSxT
	hCK3Z+ugogs06DkDrCrfvqZ2Z3gpL5246EypIi3YLEl2w84f5oZhme2QddRN9JuFN81DKWmOSNT
	znS0NWjSlW1q/JmeE18EzWfbNU98x3zxz0hXjpbkASDG5GLrP3PAPAY3HpJ5f+fAVz+bnONHLva
	QD
X-Gm-Gg: AY/fxX7zR2kQPisXnEGd7K8ml2gODQ07Fqia4Qb8Rb7Br0h889VG6wPU1iJPkDyp0kf
	zeCT1xXwM0IrHJuSbW+24vYqWakOofJPUopDs6x3YKC0YhOJo9QUv+vRN9njpscs5CtwS6QpyAd
	p4oOtOWsoYQAfNNTe5tD8mUKp0O+wjTa+S0zojBq3IR2xB/XT1w+PDlLYwr0WVe+RUbjru53wgy
	lYoQVht+OfgYbQkzgVUxCfbycBlKaWc0dpJiRwK50+tk5CLKaCawlMoH+A4upSZoX1VrpgBZ6UJ
	BANc7xKori5I1piVCwgJBBYh/KMeOw4FPxhjpY5clX6XNL9AbmxcKXtxrtEvtnD8yzVrOjCiTg5
	QAxSpTLbyRbystvQTNdUpYav1ZChq5I/KCi0qKDu7Y9uMhxwQWh9VmyrLjQhZTMJrK8/Ca04NQ/
	Pu1U9d1okPT4CCfNcJEyK3+XqpDbmpcw==
X-Received: by 2002:a05:6a00:4b4e:b0:7a2:864b:9c8e with SMTP id d2e1a72fcca58-7ff66484275mr2119834b3a.3.1766149970119;
        Fri, 19 Dec 2025 05:12:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+1piXvSsDrzO4it1QCN+OIrZs0rknwUkCTR+8uEjKh6uPPQZfesIuir1im7uRYWrjw8MqQQ==
X-Received: by 2002:a05:6a00:4b4e:b0:7a2:864b:9c8e with SMTP id d2e1a72fcca58-7ff66484275mr2119813b3a.3.1766149969626;
        Fri, 19 Dec 2025 05:12:49 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm2427868b3a.39.2025.12.19.05.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 05:12:48 -0800 (PST)
Date: Fri, 19 Dec 2025 18:42:43 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge
 with displayport
Message-ID: <aUVPSyoDE35eL4iQ@hu-vishsain-blr.qualcomm.com>
References: <20251219-lt8713sx-bridge-linux-for-next-v2-0-2e53f5490eb9@oss.qualcomm.com>
 <20251219-lt8713sx-bridge-linux-for-next-v2-1-2e53f5490eb9@oss.qualcomm.com>
 <a9b29be9-e0d2-4643-a84a-55f565bf08bc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9b29be9-e0d2-4643-a84a-55f565bf08bc@kernel.org>
X-Proofpoint-GUID: xK2y8RUQX6bbskApjJlej2DApsvh7chX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDExMCBTYWx0ZWRfXykZREmW7yiYY
 Kn/Vx+P8i8BLqHfQTJEd2ArxM/We1Ws8Wjx8T7fsgixMlZDIVGt5f+KGfZvrCJKvzxowXP/bYO6
 sJj7l3cTG0qK9heVsDNC7nkhfBbgc6lZgYHhw3cOwVL8q88mvX1iOiQu/d/INokpbVwLLOfvZCQ
 vGDCvLZvcpLC/Y05xskUiMk6ENJ8lNC4in19bHQV+O3ivV72OC/DIDj6vbyYGTd+qDH0I095pR1
 6rXY3JXKAb7tuo/3wAeRP11xQvxsGM1OfLo4ATf+PXeZG0cq3KRWbCbdbobvg22x93okQrdQr+P
 /h70aMolbkCG1duzHurE1LmWRSBf5CSr+swpvb018cbuEnMPUw50z61nHMjQvdQ/3RE8qDKVaNr
 qaKed3cLh3AH9tWKH8gR3v0GrozhfTZjoCjQalmTwgzRfAnzh8j+bh9p/4//lZ/VcDqkNmAp7zc
 /NN+5ADz3CebcY6U/Uw==
X-Proofpoint-ORIG-GUID: xK2y8RUQX6bbskApjJlej2DApsvh7chX
X-Authority-Analysis: v=2.4 cv=EabFgfmC c=1 sm=1 tr=0 ts=69454f53 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=X3cKLD2pE83tf_RQVeAA:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190110

On Fri, Dec 19, 2025 at 01:16:41PM +0100, Krzysztof Kozlowski wrote:
> On 19/12/2025 12:32, Vishnu Saini wrote:
> > Monaco-evk has LT8713sx which act as DP to 3 DP output
> > converter. Edp PHY from monaco soc is connected to lt8713sx
> > as input and output of lt8713sx is connected to 3 mini DP ports.
> > 
> > Two ports are available in mainboard and one port
> > is available on Mezz board.
> > 
> > lt8713sx is connected to soc over i2c0 and with reset gpio
> > connected to pin6 of ioexpander5.
> > 
> > Enable the edp nodes from monaco and enable lontium lt8713sx
> > bridge node.
> 
> 
> And how much time did you give to maintainers to respond to your
> comments before sending v2?
> 
> You gave yourself 1 month. To the community you give 7 minutes.
> 
> That's just unacceptable.
Apologies again maintainers, i will be more careful next time.

 
> NAK.
> 
> Best regards,
> Krzysztof

