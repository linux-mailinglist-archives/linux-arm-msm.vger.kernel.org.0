Return-Path: <linux-arm-msm+bounces-87107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF076CEBEF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 13:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E471530382B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 12:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3A230FC2C;
	Wed, 31 Dec 2025 12:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YStJLcQ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dqeetFvo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761BB2DF12F
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767183478; cv=none; b=l1NPvnmLVkHQroovwjjiYvvq/0BSymq6qzUrtA4QEN5Fb5DAiOyOVS+HnfB2qg4usRZKAYefd+eb6Yf4hGQjyoBs9zrPwBQYfrzgAr6L5imTwXrx73sG4bf8vyXUisS1tLc8/XpcgF1sGCdYYD7EiOESJAEot0Tj7BdKK1o7fwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767183478; c=relaxed/simple;
	bh=gcWjQ0ei8NJ5xBZ0hZlXZvs27R2RGWslCP9YD3TTtLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMZXj4VaC6whcCnL0G8t5LAvxNQKefJ1Luyhua/BIKo75n6GIxei0ouFkmwwpMNXkN4PCI8ONO+SAujPFBJ6qjQ+K5nxh9WHvOq90bos0SKrue3Rc63Xe9aO8alIHOAg5ffgnAlqj4BUv3zN3xh62Elb0FMFEA9tndkvPnoP884=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YStJLcQ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dqeetFvo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUNkbvF1752031
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ew+Mk6K5YGioVRYwAsfxjNNsouazMty9EXE0iT6bafo=; b=YStJLcQ/1gj1QPk6
	WGuc2zuuj9YusxG62FdQwA7h0YomzJC5GzziFKj+hKRHqULsP+Cw5zcTarpWCnFz
	uRnUn/5lykugUEgRu5XmtjAksJR3U2c+z53bM5DR7d1zWAjx2PLSJp+ERoSKFk9C
	mNFvcxyXdmKNaKuxlpl0ui4VrF8IxGvRGxIu01R1Y4/UXmnL2UTGncDDRAkcNpQU
	cRqjlMk9n/qmplXKUrRptyC9CM80vtB92iB7N/CVmey1F1Lg3nhvr9bsdeOaRgQI
	2PY+g1zVKxP2t/2nVpb05a5Wa0Z3x7VWztkqmz4ZCaAKgcV0FHdSiyFGL/pH3lAy
	mZVfSQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0sgv9t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:17:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f34b9ab702so28139251cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767183472; x=1767788272; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ew+Mk6K5YGioVRYwAsfxjNNsouazMty9EXE0iT6bafo=;
        b=dqeetFvoKH4HrRlWz45xfpVyz95h8QBhoCFjhirTtobQ3rki4o6z5WTQvFzsgS8Hlc
         ZB7JwPh1nz0GVYWvSRinbQWcvWlMczehNqRDrPpC7refHPnkQExQkTwu8SOiEFsR6MER
         lPtG/k16XnJ0cgG8X+6Sqt5IOmMymbDU2rCwkJSilqswuJewYJ8W0QT4V9x9sniPBRVH
         PinZLxa2Opwf1pnIe55ynpgD2/IqIHPVpbAU49YgIGcqkrg3dM2cDAJqf2Vmxi65lZwN
         I/3sC/fTqRc9HedaURC8ylQbDln5tY4zd6w/APmQo3eMtTC2os9mkw5qZjeJjN+15lFI
         lB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767183472; x=1767788272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ew+Mk6K5YGioVRYwAsfxjNNsouazMty9EXE0iT6bafo=;
        b=n+tSjffH41QkyHGg+Li7dDkuLFrHD2+iIRzIuXDDqXaGoFiR3bx9h9UhUDVRFIf7Qg
         UHXxUmztC6GhcAQCjZ3XWR6IOyQleqoeGmMS2EJfprnwbNMd9DVpnGdV7Wd0+TI9C/ty
         s2uJA2S1mGHpfbsp8RBCtmwBCOomvqPHYpgUzNPyP/dNjcLmkGlyhGcBfuJFJpfeJwB5
         eAa/CGSJaXDEWgv2kKj/bifFXT9jIl3naJnxg1A0qFzIhI1/j5rIxcUUu5KdT9S70SW3
         yypg8sVzg23cKeTCxSZtmeGttsVLCNHRBrrl6PvGWsZPvtHiCjTGRMKcCyaikCsY8SaT
         fRvQ==
X-Gm-Message-State: AOJu0YxXeZSr2RccdBUP5cI6TWGL10dcTmv05puJtKCitp1Ot9AxEisE
	hjTWYOo4bAyPYc4yU4DeKhWs+MHIE04pa/YR52UpOd9liCo0OFBm6Db0YEzUoMaNvSvwOuzbWk9
	JCfv/AxSMcgcHiOOyQiZHagnxBXeKTqdytzUKzim3DM96CLvUMeG2ryNj+NtbcAEY9Vnb
X-Gm-Gg: AY/fxX7o0HMMTn+mprA77DGSiOpt/6z39q25Ui1ZGYv9CTObyDxeHU5CRWYTFa5mpYp
	ob9nlKTsLRnHrRzaPn/zBjk0Ec6tQJ/Y+eKWQeKYWY3uxz+8jS2anBsyGmTcUgDTPtEGiUA7zvJ
	hmvgdbFAoxQVzv+hiN7L7vAN37f7umeNqzs6oVglVoVCc92WP/jb0/WAzTfd82N5EPWJAf6Hfzt
	Y2RFSs3I/DEdSUU7EtuNnDY2xJCGSUatQiVzbsjSr3F8SHzAhFlnKS+aJr7SlnWPRb2r4Ypu0pA
	hWyEIxLrGVekk61Amjlzh+nmESwQFgpR3fTWhbEZmPE2P8xhPRxU4JYRsRy9AoNmHpGhuIj5kxM
	fKp5YKycVjDREIgO36G+n/qIxjHHuqHWEIB1X63pr913r7hdwMytJ23AgQc9dRARCLw==
X-Received: by 2002:ac8:5fcf:0:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4f4abde8fb1mr390251391cf.9.1767183472200;
        Wed, 31 Dec 2025 04:17:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH957KOviLl3ff9m92xdS8YGRjjD8sUTjMZEhIjpCXfBub9SZDcdgZ+jloiUSvjwXkZhRj+kA==
X-Received: by 2002:ac8:5fcf:0:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4f4abde8fb1mr390251091cf.9.1767183471721;
        Wed, 31 Dec 2025 04:17:51 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f4ef1fsm4017817466b.64.2025.12.31.04.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:17:51 -0800 (PST)
Message-ID: <604f92a7-580c-4bef-9d13-707f6b1c7105@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:17:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] arm64: dts: qcom: qrb2210-rb1: describe WiFi/BT
 properly
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-10-1ff4d6028ad5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-10-1ff4d6028ad5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwOCBTYWx0ZWRfX1JWtqQXQeVCP
 8/AiVZjRmaII2D1GF9wwISnyhELNdeVSKLwtb0E3YvIiEWuGddKDLoB6NC9rZQqBkF9neDmGJ7r
 cGvVLECenF1/ekJmndzArfwZCjmOho28C9MkNxo7w9ou5RLad3KO5X7LsdKi5FqOycS0cpXmMq8
 ranvTGO3dPO58ilLdejbYd5E50vwN7QNYnOocF1a5QbxvmGd1Mn4lhBT3cpgKzN9ULl52Enpsz/
 XwXDM1czovyXGNk0fcM2oKdhnEQs49UU1y3KpK4hHoyC+WZiaWog1un+TMfHHwWEohfBp0apBwo
 x8yMcFLoAKJFAI0dCQsc9VAwTXfU8gxw6TBmXmc92jrvuo0Kt9jJx57BgWoFrqQLX+LcgM1uFd7
 qu/5KU9cGJvwwxNqWHuUTrMGi62Vo07hdCPrw24hqEoLsYTe7/MC5cIAp2qeWncKJM7JajLO1TL
 c/Dzendw6h2Mp3TPLjQ==
X-Proofpoint-GUID: RrQunNsc6uS5bHvf8nr7WCqyPeisn4OH
X-Proofpoint-ORIG-GUID: RrQunNsc6uS5bHvf8nr7WCqyPeisn4OH
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=69551470 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YN4nVyxdPvXl5XCbABQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310108

On 12/31/25 12:36 AM, Dmitry Baryshkov wrote:
> The onboard WiFi / BT device, WCN3950, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

