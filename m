Return-Path: <linux-arm-msm+bounces-35186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0969A5FF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 11:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B942C1C21568
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1031E1E377E;
	Mon, 21 Oct 2024 09:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhG13dJu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B61B1E32B6
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 09:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729502716; cv=none; b=LRbcKWMRbFJwnsganNnGJQQqpckE3DgbCSwteZprLFAp+cQPXqPzDmZoBLGeVMyndz5KGkhH76DNCUY4Hl/9rnnPNvPP2bVeFzuTAZtcCjxn77Ft1Qvq47RGYCXM5e6v8i2PblRs6ny+zJdhSK8iRcrbL86ZqlAYaGzDhcDvBBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729502716; c=relaxed/simple;
	bh=EtuV9/jHij7aoyayGj5hcfybcaleJ0r/sGhTb3vNyDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A/G1O5lPpEJA03pL7aiYHmL8aPXnts9on7/6aYpns0nYMQxojbjpaJkJdZUstb2DrvqUPWAHvNCejvRETdUDC7iX4cfnc4Fh/7bPz4GOeARtLTOnKQIxQAGxwI5Wif/m+ZHIvV6h4alZrhtTjMG20xo5VF7jmd9FzfmaBsoVaAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhG13dJu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49KNdnxs006185
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 09:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eg8XkOpXVTvLkV/iPFRm0ycvFdz7OglLtrvA8E3sVyc=; b=WhG13dJu0OvVlw+M
	eVj4G8tCxj492MAA3bjBifO9Nza9SIq/P9VpL81Ou6JDRgsyXgxSxAdAOfJKrOlA
	elA9CuXmR00Ti/ZkOEMLvn9vExpzRLRxRf3b9t6ftrH0FElqbQexUDjPluVOgiHd
	Ex0+GvOA2tVKZygxghIO+jtqHlGwmHw6tl2RFdz5Eyr3novnjHvloYB+yiGaczoJ
	NQSmIqUmca18oUDYiWs0P4rhlJ6MWK2XzXZERA1CW+V5DRRI2jRHZM775ajS8wio
	jobxSvn6Xm7vy9Uf+4S8yX88f48/wKz98z2t75+hQEYPg8v7Xf57gX9wtFD9axMF
	vhfuww==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6w1m11m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 09:25:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6cbf4770c18so13919286d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 02:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729502711; x=1730107511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eg8XkOpXVTvLkV/iPFRm0ycvFdz7OglLtrvA8E3sVyc=;
        b=ZT2kZ4ZRUnMB5AJrUyytYb+SUtTpU+u/vv4NmsalpvNzNL6snggzbZf0EyXKtVh0Mp
         erySWh+OQKdFC2o21zObsknEp/xtE6DPm4pval+Ke1hnKR4Z8jdAWGMALf3eBRSNVQb9
         bj5695kNiCDlohG03BRQ0wp6oRHAc6eAImL1aXyCvv1/gfFMwuY0cGOFNza3s7J02aMv
         tkf/36/8V4FB2iWvHKAT26up8dGXkuNttV+1QBL4ehXvMuYIIWnrj7aveS9uqUYMCQZ6
         6s3sIYfllYRSUaTxUwkTKu0xUfd6g2SxA6LiHXFMnHkMXXyjuiV8iUqnFP3bn050CwsY
         RtmQ==
X-Gm-Message-State: AOJu0Yw1yYGQWWVfbbYUq56HQLt+Mg2xr3yeDPwvIP9YAeji4hRkrGL5
	+3z2QMwGAzArmJhmzN8I24UaNUyFN8swx/JibUVZnjCqGXbIvfJ034LIygQO2B9Y/XVtvIN0SKS
	kagI5X2R1gQx1DKO3k4OsqesVtYY2wqH8kw8oajmhiskZ/s80CVvvPl3tfq9Bu8a7
X-Received: by 2002:a05:6214:21e9:b0:6c3:6282:8d69 with SMTP id 6a1803df08f44-6cde152d510mr72527916d6.4.1729502711416;
        Mon, 21 Oct 2024 02:25:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX6CpoovgzlnEXpRgSYRd+pLRs1f0mwFPuBaCCHWLbVAhA89siqtnJ6zvcrC6DZKbOu4mPzQ==
X-Received: by 2002:a05:6214:21e9:b0:6c3:6282:8d69 with SMTP id 6a1803df08f44-6cde152d510mr72527816d6.4.1729502711061;
        Mon, 21 Oct 2024 02:25:11 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b668sm1711060a12.11.2024.10.21.02.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 02:25:10 -0700 (PDT)
Message-ID: <35b3d954-1891-4a41-8ed8-a4d175bc7288@oss.qualcomm.com>
Date: Mon, 21 Oct 2024 11:25:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-crd Rename "Twitter" to
 "Tweeter"
To: Maya Matuszczyk <maccraft123mc@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241019190214.3337-2-maccraft123mc@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241019190214.3337-2-maccraft123mc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gS-DC1KOKpY0MspIhdQSq85SXfQ6OxlS
X-Proofpoint-ORIG-GUID: gS-DC1KOKpY0MspIhdQSq85SXfQ6OxlS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=888 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210067

On 19.10.2024 9:02 PM, Maya Matuszczyk wrote:
> This makes the name consistent with both other x1e80100 devices and the
> dictionary. A UCM fix was merged already and is required in order for
> sound to work after this commit.
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

