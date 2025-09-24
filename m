Return-Path: <linux-arm-msm+bounces-74578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFFCB996E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 12:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D491E18962CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 10:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F251F2C327E;
	Wed, 24 Sep 2025 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDs3QR4+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E032DD61E
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 10:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758709756; cv=none; b=omFMfbjKO2Q7WVGnD00Bv1ZquBg8Sr8KmI/XxttmYodLj8j6CtVvDIlX0O8Y8KLVDnH7+Gc5y3DAnjZXecmiZ6B3FTn1LwTi78hukuxskVhr/M3iu9Y9z0Kh/fg3vYfVEx9EofBSxXdNbtIXLuhlImFbeMO1DYkU+x8yqW0//BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758709756; c=relaxed/simple;
	bh=/9hL9612Gn0CJSgidmnFRkESRP8UBsfv5LMScs4CM38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vdw1g+vV5PJldJBqJBeI5uLAaLj3619JGOUgdt4Ge1T4/LpQi0jLBcZcKsN51EgDq1cyuCn9SjKacNybAC+pj6X6J5d4iK4CEG9EGBQMHkk76ukVY76dfhI+c4dSzaGlDC+lFg9X/8FgBMGGNHVSj8SPtb4m1flVBymBL6Wz1fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDs3QR4+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iKCJ027915
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 10:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zjk1j5ULWEzsfJ1pudMsCTDGZ9oTBcQfVxDwzmzjuXI=; b=lDs3QR4+DKETWGb+
	Qf5XIKiPb7zV6rCF4dM9vt4xj8iNGH7wINBX+P/09KvG1bm124czm9571qRlr9Ih
	ueZfE6/WbZE1ldWRvafRBpExP1cTZSwlIJHsH8F9g60JsTUZqQhj2B69EC2JDcho
	He1T5vH4dpfxZ2pxE6s9KJPjvpXkP6SGGCYuNs0oL6JEvouD9nNy9UK3jZsz+6zT
	d2HPJGI18CVTFAofx3b+5R3iRza3HGK90RGM7kbV7iqMQDNIm7O38mZo43pS3il4
	0ps2uaawxqUT/4uYIXlEp2carI+LTFCaZUXkOHCnL04PzQy652nzhYoi8eRUx8Jo
	0C8+Cw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnv9qh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 10:29:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-82b15c1dca8so258096085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 03:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758709749; x=1759314549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zjk1j5ULWEzsfJ1pudMsCTDGZ9oTBcQfVxDwzmzjuXI=;
        b=s7rl6UsIgFxZRghWEESrdiQ35drnreKoAB+V0eAWinqWxnGoQC+q48hsRKPSc62O8N
         AYGFO7wjvH6g0VqSB5L68yATS4GaUaH6NwDgFgpyAcD4DiMyJh3zlRhz1er2YLZJ5bsb
         duKoeRe17LiSfFq2R3Hk9IG4J4YPpCTnzKpStz5nzBu7YgH1E7aZgXYNC7MbaWf07yEZ
         H4WqMVGrAxfMCgWNhSa8KMlZoN3FheVZgnbNMqplurAi9uTqvCD35068Wm/BAqFVOVtW
         xGw5VcX+suwP/+QhWHLI9u7520+VgFGD3n9ttu60n4HoayYtPegjdLwqTjg4gHkrDkWT
         NA/w==
X-Forwarded-Encrypted: i=1; AJvYcCWpLxJH/9oR4MRIQPoyorgzicRY09eMhL3241cZTuSY5TeTy5hHvjctmGBPJWhqxwKDHahAXj2cU9mxSP72@vger.kernel.org
X-Gm-Message-State: AOJu0YzCQ/ZlV+VKDyAks3AqaK14TOqGnsJl3wbQuFVgB4CyXPqI9CCM
	v8v/Sv3vZhrzidF8/OLtA/m9qdbSilJP+piYBMPHyu7EruigLibyfpOVRITXurpM5uYUJxRQ1x2
	VB6HRgATGU0C0VrLWvZ+HDSDhDZcJn9k0n1MbhmzqeM54e0viq107LLmrLYufp0xdBC9e
X-Gm-Gg: ASbGncvM37hpR8ptl5v+QhP9j26tBE5rbemTsw/Sr2cXj8IIn1+JjxLMbY+/kRjUFzt
	4w6krq95xWcWRay7J89QdP72zKlkCOPWs0XhOl4cWnHmtogfYwbOpLIK5Df36xY5JiH9XvqaUrD
	1o9rdIRyTPFEAmB54vj65KfTS3XK8yW1OPPAsUqb9IhKuoVHSDFBz1d8/MvwDw5W9Rkz6DG/T04
	erk9ggQtF4oJ4m78QgRkc84aNEUsrcHxyu5w/3FKbEzbr0MtXxMseM8YUAUqUP9EpNpvkVGVBZw
	dTlWDA1IgiO5mIBGcCqI/PHd94Lg2JTjTG4UYa87uZKjAPteRr+QAjxJFUyQdUB1e6m3F2ytq9P
	Qw7ctRdcaAj/mBDhzcDr+Rw==
X-Received: by 2002:a05:620a:9444:b0:851:b083:37e9 with SMTP id af79cd13be357-851b0833b27mr305214485a.7.1758709749070;
        Wed, 24 Sep 2025 03:29:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRzIWeKgyhxXr/t44Dh/z5B9dbWTC8JKuLuTfE3DKhzEiNCFnlBYfyCkI4J25I5SqB0lq0GQ==
X-Received: by 2002:a05:620a:9444:b0:851:b083:37e9 with SMTP id af79cd13be357-851b0833b27mr305212485a.7.1758709748562;
        Wed, 24 Sep 2025 03:29:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b290caba5a6sm935424766b.65.2025.09.24.03.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 03:29:08 -0700 (PDT)
Message-ID: <9edd7057-8330-4d1a-97c6-e9bf05dbb722@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 12:29:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: dispcc-sm6350: Add MDSS_CORE & MDSS_RSCC
 resets
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
 <20250919-sm6350-mdss-reset-v1-2-48dcac917c73@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250919-sm6350-mdss-reset-v1-2-48dcac917c73@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d3c7f5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: xZIg1jo-bJo1LWTyS-5EKNq3lzgZTVn1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfXzjx71ENZYbro
 wuzYXTOzkiOSqWZPC/qaFqgK3Q8Xj3cB/Q8ywFosTIRmae47m7ac/TL7QTQAkF8Kh937aEYxTZQ
 2jEnNzaD1iWQJF/z1aE74TgTn2wS4ry8NGw+TTM6o4A2LXCyf76ehCdLDuAEDmvbh5pyou1+OX6
 UsoZn67SShYDAu8kgFuclD/wOCG/+kg8trQ5mGgN6TfchNrseJC90xat2/g372398rWjuMCvPJ9
 nwYmXCRTXBklXNx3YSwtkF4lvE797t2bX8dzDveVKAddk6ueSbuJJgzIcT+MM1Jtsfi+c9cJiYT
 a1LXpaKo8SyWkJdQagK+Uz4G7/pwCidrkm+mLLf6lSY6Nm6CCgY0upFwOizd4AcNdh/l8L8iAAL
 KVEHfmJN
X-Proofpoint-GUID: xZIg1jo-bJo1LWTyS-5EKNq3lzgZTVn1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

On 9/19/25 11:57 AM, Luca Weiss wrote:
> Add the offsets for two resets inside the dispcc on SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

