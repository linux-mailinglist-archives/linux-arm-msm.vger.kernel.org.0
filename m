Return-Path: <linux-arm-msm+bounces-76216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B5333BC18E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 15:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9EBE64F65E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 13:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C598E2E11C6;
	Tue,  7 Oct 2025 13:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9JgE6P4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BB938DEC
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 13:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759844794; cv=none; b=k73kvRxHziStLc0kad6kvFDZXp/VnVVLhLwzp2P0iIoUOUVc10CHx1s3Ai/TUnoS0lS1aiOi6V9xgstuMB4KgeMJDbjJhJvk70/KaHFyzz7al1yyOez+sZ3CAl74nB3S/MtzCy4bXB+kUAvaI9ywn8JWzfHr6YdKTS1oRHc5rl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759844794; c=relaxed/simple;
	bh=3lZ6UknrUZZp3tKa2loAmoYm234VuiXYoihS9yGbQBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tvhUQPlIIDWdF4O1s/37AtzWCjJz8L1dAcZZkKYMoPwNNXwXytIKd2kebwMOPWwLvGvVNODUvCYwi+b/1HK1HGOesYob26Tyv6GeyNOWFvnpB8Qadw7k3+lUQ5ozE3X37OypNVBfavwsGk9Klot8Mme3iJ4ns8FSlwDB8/a9w5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9JgE6P4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597Bw4vt023118
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 13:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s7CUkY7mH78KwOEvSRjDxBNTwXfK/qejz2A+Lc8hlKo=; b=I9JgE6P4BzU9cS2i
	aYUkLxuo2pVVtSjvX/uBAUJoO3l07Cif096zbdf62t9OiJl805yT8K2KEiLzcB3d
	XVpSTiPDwANk/R5jCW8TRVxQftnWqvtx1PYNxiQCQoF4HnaVBnPCl0m5Qiz1JCfk
	zp8WmBflyOFFUwO4f5OYJya9KMI82++I3Be8ZWeM0GrkCYOKc4plAl3rwAZnMxA6
	MxVde2/LDqxtUpEL4BdEDf2zbJgchtio9PheWNZT48E/jTODUrx877oEEFrgss0G
	sT53XGKGkblwlGvFCKOm9qCBkSyO4VsHF4YLyuYkfVkDLAgucDCBBjANzqReydPo
	+8vPYA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgqdq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 13:46:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-879e3de728aso126385285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 06:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759844790; x=1760449590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s7CUkY7mH78KwOEvSRjDxBNTwXfK/qejz2A+Lc8hlKo=;
        b=jAYQZjBpAHeK4QAQ2ZWNV+7AG4r02djPniPx5+QVrvX5fsXOnxTyfPw0ZzTJpL9mkt
         875zjseA9pCgE/0K7h9z3NCnwAOQ7xfa4ux4KCI4w91Nmzg6CULU7gE7wNXGFjFt3pgP
         MIbph54Y/XDjSDJBI4DlP0Nc/NabQBsf1m4wiwmVyYJhRjoP0mw6srUgsuUqtZ3VuTe4
         S9y0thg+/ydzsfww/iSU0Ste4jINCkePo9K5l8XszVpsOTuKbFFeH8ZKybo5httKqyVD
         4S2cZ1armtJLXuDomYotfw8pgIp3gM8FC0X10F+Gko6D7M/NVzV6UubnQZZ/8LKAf68X
         tYHg==
X-Forwarded-Encrypted: i=1; AJvYcCXAt2Pfx7ewoTGpgMxHa8wB4G75DdlcGPR1rskil7d82J+JkrOFVr6xjPHsobnwGDTxYLQHBT5QkUoG/gb4@vger.kernel.org
X-Gm-Message-State: AOJu0YyulslDC393cGkSpwor0nGLjZH95/8wHrV6ZlRfdtiz/fB/1Rtk
	CYZI7+p1+hUZqPwhScLL6NQqWIJnRU/MyjOShJJwAYBv73PwV0in36QeZWP3hjVv5z+mLU0n4W4
	qKL8PzF5LOZji74vUNS0yLaAXgbcz7Tz5wQxyJq+FYMIMrfGoCTlKkosy3Ro6c2tAlXEx
X-Gm-Gg: ASbGncv8xCs1zci5KcPXAMqyKF22LRXKolVFPXfFZLbf2xkwK8hFeBBQaQ2VVRtf5zw
	8hvvF9O/Fa6FOLvOnLNM9aohxFDVllyz/B876l6168QDRLtnI8vTu68Pz/8rna6dDjhOy9n7Y7c
	iko8KYvK/Bnn+58GkbBKckutXJRm9DFXSowQXHV1sFvMVI5h5l6uSMb4WDFSVj0gxxtV6ltaaGo
	tzV1ZoUBxuyVlV2kDnpziwstR8p/iYLDGMFxku4Pt5/Ndv5KqJRCCp2EaapzvNywGsB6JdA9nL+
	NQuESqpejzjDxMz6Wf9a7RCbjHmIuub/pI2LpOCgHQOb07Wro87pCwoFySXAythin5aX5iBzXKs
	ZleBIBys7BPyCdg1jifDFlvgdGjM=
X-Received: by 2002:a05:622a:4f8a:b0:4c7:e39a:38a6 with SMTP id d75a77b69052e-4e576a2e65bmr125015811cf.2.1759844790350;
        Tue, 07 Oct 2025 06:46:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMMuzgbdK3DGk8z54m0Z+WLLqxl6a+HKbK9xOp9p+K9sQwGuQ9spnb3O8fDu1XDavgAEg67g==
X-Received: by 2002:a05:622a:4f8a:b0:4c7:e39a:38a6 with SMTP id d75a77b69052e-4e576a2e65bmr125015241cf.2.1759844789676;
        Tue, 07 Oct 2025 06:46:29 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9ff0sm1396244066b.5.2025.10.07.06.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 06:46:29 -0700 (PDT)
Message-ID: <a349dcce-030b-47f5-9644-047e5b060cfe@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 15:46:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8939: Add camss and cci
To: git@apitzsch.eu, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vincent Knecht <vincent.knecht@mailoo.org>
References: <20250908-camss-8x39-vbif-v1-0-f198c9fd0d4d@apitzsch.eu>
 <20250908-camss-8x39-vbif-v1-4-f198c9fd0d4d@apitzsch.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908-camss-8x39-vbif-v1-4-f198c9fd0d4d@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX3XbxLOkpCzbS
 w2KEIDy8WzIM38nkzk110nvr9NL3R3u3agn/RJcZ7LGLKL2Xmtx9tb3A512urIkqDdCNzEaln6G
 77tAfj+wzS+tTNTILSiirMe8yCewYTQG2afUD6LU6/IHYumop63jO0XGTSORpNmjiDRPV8bnLdK
 21y7nK+vhwE1UQOXDJ2se23ZPYOSN4i8ETp20MkBN6vR6j5e7sdUUGrZ3WWjZLkpMcqvml0ihWX
 zsYV/CaVANlgphtI5U8nO/cUYBUxp6nHHiroq73ADFjCqjtc7FBDmPBjwDxgm4vClcSBMYoIq48
 AuQWcBqY6coFYjigwIgKw8QBodziy8aFP+T08NhRpYNlgsM1d+0mCicau8tg8UYyiXWwSEWP6P2
 lAXJNWEUKfcrjU8ROshbGJlGb4MgBQ==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e519b7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=TqukyxIwAAAA:8 a=HDjIzE35AAAA:8
 a=EUspDBNiAAAA:8 a=PM9i-VSbYM6VvaBKnRMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=e_wvXvRcY2B3oMitRgDS:22 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-GUID: Mft0Ls7QQXqfFj3D0Y0GR41Z9R6cw5GX
X-Proofpoint-ORIG-GUID: Mft0Ls7QQXqfFj3D0Y0GR41Z9R6cw5GX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

On 9/8/25 12:04 AM, André Apitzsch via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 615.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> [André: Make order of items the same as in 8916]
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

