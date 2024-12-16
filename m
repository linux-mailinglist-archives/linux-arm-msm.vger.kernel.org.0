Return-Path: <linux-arm-msm+bounces-42341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 141389F316E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 14:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 488487A129A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 13:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5DE205513;
	Mon, 16 Dec 2024 13:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPW5b/Y/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6EB2054EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 13:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734355485; cv=none; b=cbuHo+AI5NyWEwxjrNIWbz/9yyliYTNmacNbCC+L4Sm72xfL1V+YdLwRMxDO8r45FLvZrVkA9lLoLzGsHvjg4OWoP35NrcckjBfp8rE8SuTO0CTnb0e1LCQZvKWzJhzVsVgHsHEodjWxS/QiircLj3T1vRPBglAAE7XeDkoFH4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734355485; c=relaxed/simple;
	bh=bzqmNQfWCCzPErXOsUzKJkneJr987eONxj/xWuXvctc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=npgHXhoHcUZw6U5So+4+9Y6k2Drk+OFtLZllAom28PBiSGKcHjUvmTWW3Z+C6fI3VStT4F8mzUQ1+odkWuAe6HCChaINdWJ4MgxeMzkum6k+NtxJQUVy1C7GlHbE8LYgE7JnB1KZMYfcVzeFw9w7Bh9b5Vrb1e6q4MkvPAr0EPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPW5b/Y/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG86YMY000795
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 13:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ddJJvcV6JfmZR8EvhLTE3jz8GYYGpgaSZHvZTGAa840=; b=CPW5b/Y/DTSNOqWs
	XmRFYsJqRRy2pGwxT4cLmXhW2FS6lj7cQF47Sk2ZY/ZyBn9fXDSJ8YaqyXz4kYny
	SHcQm84TsiaHUvsXKp1N2Oqnh865vXB0346nvCjBpUCofxQMyUzCw9KWtTcYVLoe
	YWZPRvsiXHf4ZOW/l1R/LAE1zK9xGUtrWo2pv+dKkemFswpElhkV38wVoAqaYrEm
	hALn4sOD5dpCyS3fJJWw6jeZ7BVlpJ+sTVCzT/n4uZpZzgxgrOCNBuGJIfxMp6r4
	NKD+Bl9TtEV2xWpNYml1CTijN94TcVEmp2PXi97O7ljR5hfSPTUc/jaQ4qkq1E9p
	V+dfhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jgdhgv2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 13:24:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-46792962c90so6409041cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 05:24:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734355481; x=1734960281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddJJvcV6JfmZR8EvhLTE3jz8GYYGpgaSZHvZTGAa840=;
        b=fhsSmALv0J9Fy092cUxh8YSCMgsW5Zi9V4dP7s96Wb1r0+OABy0bnxhuWsE3Yc3eQY
         7gikMpUFLpsUAfs4kfeHXEGNBamM3kL0opXiArfzmDtHHGj8JTD5qVCN1GCoyA85i6N4
         m87rMSU90ccMzz2REij556qWfinb6gn0oVsayUV9HIDUXsW4GSu6B2Ygb74hRLDBXYM+
         DykTioNUSK7PQdNk0h8ozjwKBNHNCMwvyK7p68ppuBQld7feGYXcSQQ3n8aKH4MO0OE5
         vp8orp2sQFq2oJUoNiiM3M+dE89nxo9KMXHRT8Q3kUVeqs0xLYO3i/L4UKMgIswTHuTi
         wqpw==
X-Gm-Message-State: AOJu0YxNylo85VgjrwxG04Ip1dFKLF9bfbiEopT8qx1+cjT6wyg+X0hy
	9ZBNiek6cN11/P0jlWzETrw+3TTB85zUr+Qkf10Dt0w+F0MgdWTW3x+idbcjql52e8Yz7biA7jA
	tka1wCzMocpstD8GFAhtGBPFqqmFu9n0fIe25BxGUFy5iAJE7HYwrs4np2Yn5MzWw
X-Gm-Gg: ASbGncs06e57/XX654z3ccusa4hvC5iu+XyG79JS85KS02+L9WoXZOg0FHu4wud3HMi
	k4j3roWhYrUwAZZqD8mHFqhWMBNE1gQhoxrcitDh+U18AxQxl20gsP00F87yE/P+gSzHPNh5PNa
	Ss7586Q0SgxiVtoHB8jh6sl2DZlJfOWq03faOvPBihUoFzhGUHMjHxuTqyuw+HYI5D15ucT7aEF
	/bL0AMnwhSNGbjSnzmX8+jS8dcBy63wlql2TunLXCiudmJx/e81Itet0RyqBuLNRNXiohoYlO/k
	tK/FWCd+6rGTw+Dl+r2DzE8S5AtDQ+RzzTo=
X-Received: by 2002:a05:620a:2a16:b0:7b6:6765:4ca2 with SMTP id af79cd13be357-7b6fbf41a43mr826587385a.13.1734355480839;
        Mon, 16 Dec 2024 05:24:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETNA10NH7CEL6e1jIBbcYdjpx9fqxYSa/P7akVHgXDcrLHEht2gl2CopgvQyQyU2eyAfemZw==
X-Received: by 2002:a05:620a:2a16:b0:7b6:6765:4ca2 with SMTP id af79cd13be357-7b6fbf41a43mr826585585a.13.1734355480470;
        Mon, 16 Dec 2024 05:24:40 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab95d813afsm333044166b.0.2024.12.16.05.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 05:24:40 -0800 (PST)
Message-ID: <04018ad9-f3ee-45bd-9d4a-be3d52f38b51@oss.qualcomm.com>
Date: Mon, 16 Dec 2024 14:24:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: sa8775p-ride: Enable Display
 Port
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_vproddut@quicinc.com, quic_abhinavk@quicinc.com
References: <20241125105747.6595-1-quic_mukhopad@quicinc.com>
 <20241125105747.6595-3-quic_mukhopad@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241125105747.6595-3-quic_mukhopad@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5Z0V85wQo5FNNakX8SkmwSKcRmDdyZwr
X-Proofpoint-ORIG-GUID: 5Z0V85wQo5FNNakX8SkmwSKcRmDdyZwr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=994 mlxscore=0
 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160113

On 25.11.2024 11:57 AM, Soutrik Mukhopadhyay wrote:
> The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
> for each mdss. edp0 and edp1 correspond to the DP controllers of
> mdss0, whereas edp2 and edp3 correspond to the DP controllers of
> mdss1. This change enables only the DP controllers, DPTX0 and DPTX1
> alongside their corresponding PHYs of mdss0, which have been
> validated.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

