Return-Path: <linux-arm-msm+bounces-76363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 367D9BC43F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 12:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 17ED84E4DEC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 10:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FAA92F5463;
	Wed,  8 Oct 2025 10:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evtrXyIj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA45D2F1FCD
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759917962; cv=none; b=Y2KO9nkGHELYyrRx3gA9f2uXTqKK73vTGUBw62dpM2RFAA/hCF5Cg6MSWtC8srlEopXjsClFe/EueNaHEr84Z9U5+IfkAhfoMVQdq04i1urAwYXNI4UNPRW1jQMfRztICwX327G4b90SNqtS/q1jseunTPUJJq7q71pBvCIroaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759917962; c=relaxed/simple;
	bh=3kZ1RI7mpcVgXocM/obd76KaEu7ky1UsfEMWceFJ9Mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=biGb7YF5m1La6qwcjX8w3ZoiZwDwgmtcu1oBB+ZgiZJ57wAMiPjgphpT1sg3+/bmNRiMyRNvhof6hNFimubtgjUx8+i7sF87h1Y2BA7AikIXYFdI/UX6zBqW7A5RRCMBFwq2MuJmr4GYZsKEuA688/f8oObmbHKE00U7783ZLSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evtrXyIj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890ore010212
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 10:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VD73KeU6YsLbMOihbyQybjjE88iJUkkFmX1D7MkH21c=; b=evtrXyIjqeAWuIJE
	al4HRRZ6PQJ8wbZV70ti49ewiXBqAMDQdyW3N9oqtD3MxoMI0SrTaLf6UJI2ImOp
	kahd/i6nyOVC7K6ZvWRSBy3iod5z0iFKTo9KRhN3TSMTDtaTedpqc9KAv4PbcSsd
	j5U+kw2C/yyMYZBMt2kPIg8VrAnYPS4D7H9XcjDfKyIsKLcXUuARtJ1DtFzqC66w
	745eCaVfMQ/QfDn35BX8zckOPGU/f0gWDNwtykyaq/225t/DFzlq+aBR8ATgng5E
	ZDuimuSy6u5Ceh7dYALXrPrcYcrqHM0y4y+fXguNJDrp1cz+M78eZTw00YbcEOYo
	T74B3w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junua2c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 10:05:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-853f011da26so239812885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 03:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759917959; x=1760522759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VD73KeU6YsLbMOihbyQybjjE88iJUkkFmX1D7MkH21c=;
        b=vI5cuY6rJLFK4g46JrWD62F+19F8K95arbPYnQHOFBjFNqzdW/3eVQztSh7e5UpEa5
         VQrVh2e7c5I7xNRmu7k7t+52pT+jYCPmNNhqhcz+z8s+vCKkp+vpVJMbSGpONyywUsvk
         UjRG0ApD/eMsQSmVlYRsAsD6XP5yUcTQ6uM/Hu2wVySyAyInNkE7Kfe5ckLJkxqTFkT+
         zxbVTtN0V9u4vYLjyTJoiuKIa8JEzjHOKkfdrCRgy1369gWsC2aWcpFgT5KR8Z97ynfx
         uRSO9Rj3DN4LwO/7IehFhqSxIlR/Kc67ARH3faz+pN3BG11d7g5T+bmZ1GUVCoEYuNC6
         Kf5w==
X-Forwarded-Encrypted: i=1; AJvYcCV/CGvt6qsYS04UmuDC/LNinCPVvNGg1/jsErU7TuZ51LyISXmujDGUoHInrsTv8qDh1VZSnlRajzMi24Kw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxydzk/sW6PKs3uZ4yrePk722IGulMyrv59xlhR2GYVZSn61joh
	kK8YV1PL4iwOy6b93QnYHgmploxJaJkMK0jBLYDCaucMbmL/4fFbzAJgNOE4auUAWopt2ut3K8L
	ylhIcBg5GuaBMkeBL74H0H1QgCDMpM1+x6mbE0TjoHj2JZq6Ju+fnwxKUPMq36vNYCArI
X-Gm-Gg: ASbGnct6xFS6XI+W04QJTpl/J+hBq6led850bpCz2s1wKCU95m4KmOv2lAMm4HKNjDd
	GJWNXv38rzzTXwuWT3ehRiQ03ySDO5n3veo6LXnPRE5ISqHVsuUgiVpJgGJXnfaPmHbhWb0VASQ
	BlaWfR5VgKUo6oY4zzDEgYQKCHl1VZT478AjiexQMahs6x35b2tg20CEVZr3Jetu1ix2oXt4K1o
	lQSpD9KpQvhroHLwawyq6iZJt7If+L5mikWwTJ9JBRis3s5hjNT1jY5JhK0fG+BH54m+X91cMw9
	r605ZbDTAaIusBiMyk0aKQWg5U13oex+PsJrTfl1/Sx4dWclTxTg5piO5MbgBS3quLEQ/EL+W2l
	DHC00j63QZKRFQsss2zN47qxe0aw=
X-Received: by 2002:a05:6214:20e1:b0:798:f061:66bb with SMTP id 6a1803df08f44-87b20ff97f9mr22224776d6.1.1759917958777;
        Wed, 08 Oct 2025 03:05:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/rs0cV8BNd0GLjGsCk7lVd0vUWi2yqmE+iiQDi/3jhZyHFSQOH6EAqUJz+hGIgliiKwZdOw==
X-Received: by 2002:a05:6214:20e1:b0:798:f061:66bb with SMTP id 6a1803df08f44-87b20ff97f9mr22224486d6.1.1759917958192;
        Wed, 08 Oct 2025 03:05:58 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788111e1dsm14272683a12.40.2025.10.08.03.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 03:05:57 -0700 (PDT)
Message-ID: <95704b74-52e7-4831-bc93-d4d7aa32736f@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 12:05:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sdm670: remove camss endpoint
 nodes
To: Richard Acayan <mailingradian@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>
References: <20250905215516.289998-6-mailingradian@gmail.com>
 <20250905215516.289998-9-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250905215516.289998-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NkFhyqwC4DUqDUPmzDqJ7LnJP6OCVBSz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX16N4hYryGRpe
 k13rZUvWtb/cjMj+Z7Lxmm6+eSyOPia5DDzJZIz+SU7P0QdsB00Y4pASUBXwLEypRKpmxreUg8/
 J5vStjiBWF4f2ajZDT8up3uj4T5Wa2QNQFBOWvxO8ZtxncJORtOOBvnKggWL8a3t2xVUzRMBx3C
 2jVDa+UVDiE7EVIRHMu4mK3RTkzp4qusxbEDe4wDXpVO7uT3mfZnY91a80nIJtxC+bcaBrNQI5o
 0vh6RsEqvSpPlA8+BqHClm9/hQacWhcXC9DS3NeIriwAuCz7o7Tdw7Ba1AX4aMAM9rGGvjJF3UU
 KEMWuWMphvha24LBQJqaS3y9AgXORxMkAX56UeCDATpNLvkIkWi+M9t3hFsCruFszJIvjMnFq3K
 i8IGELQlA86NAHTmIm6W9CKhjCwg0Q==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e63787 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=aFP154w-NJnoEqO5TVwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NkFhyqwC4DUqDUPmzDqJ7LnJP6OCVBSz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

On 9/5/25 11:55 PM, Richard Acayan wrote:
> There is no need to add these by default for all of SDM670. Originally,
> they were added so there could be a label for each port. This is
> unnecessary if the endpoints are all added in a fixup to the camss node.
> 
> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Link: https://lore.kernel.org/r/488281f6-5e5d-4864-8220-63e2a0b2d7f2@linaro.org

my comment on that discussion is "????????"

referring to nodes by label is the least error-prone way

Konrad

