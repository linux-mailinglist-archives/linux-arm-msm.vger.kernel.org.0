Return-Path: <linux-arm-msm+bounces-63691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 04744AF91D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 13:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 522D77BBC15
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 11:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062BB2D5408;
	Fri,  4 Jul 2025 11:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4d3ecNn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701502D46D1
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629792; cv=none; b=kYVUVlyLxk+fgSrr1tY4ZXul+f2YveDJNhPB1rcAb7YcTt+5BUr6CT2wE7LuJrOdCyU8pP1QqTNmyqiuvK/vMl8fbvMkqNjh9n/YPzDlFVST7NZemszVD6OsuB6THpEonef7Jg+avtt0DQhqRWorovJTTyaD5IwqbB+JvMJ1NA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629792; c=relaxed/simple;
	bh=NGP/PxsNGeZTUuNXz8VGwxDIzM6lHBs55ktSaJciH38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+gO19k+Z4OgdIWEvrJ2XAGPHLGybfjbyN8mvG1iPfodKFjRtTxsbXJXuBabFwa7ax7CQBT8IEFkYH5osbXI+qLWuGLC4LcFWjcVnRG9Az5er4dTOztJqVM3CO1qUhWYE8ETC5BYP+t6QqQa538wS3E2fPgbhhrzoJGFBscyM9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4d3ecNn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5649Oqrv025086
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 11:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	laCGrQ9GAdMtdm/7wwEuGkeVS0NvClUE8xbKk5q6Ipc=; b=A4d3ecNnXnHFTbMQ
	IyQgaLylzchlIfHifaweut8ZRDoJMoL8+WaisvwpaXQclkNOFwJ3UalZOdgY88qa
	4uSR0/9nnZhFNKGbvez0EbHo5SovfXOdTqg74BxuxBhDWtH/tcpT45x1/nENzvM2
	R0PN43TEcrIpguUcF8PyQQg7yilzUH7P0ngKeh0Qe9yykSjDI2B2mkRp42hl52Nz
	LdRtIeLWo9O9fu+rhELjYpgUFFAkE0UaIj3Pv8Yj0cSLrZhB/bMiD0kbPNM7n0Ly
	bM0bSmTbpuOtyX3QNZmmgosTZAdjiHfU76hLSZ1KRrU5Pyu/vZV+40IqnwGvJnTs
	ehr8Gg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j802bj32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 11:49:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6facbe71504so2630086d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 04:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751629789; x=1752234589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=laCGrQ9GAdMtdm/7wwEuGkeVS0NvClUE8xbKk5q6Ipc=;
        b=E/Wv373jZxgS9glJA2ww6KEpF2JDV/GL+umLA/Vbv5O9v2/y2gfqqAfEzwhFMafbVf
         /VBlUOurppYRxXUZf+hmpykwyM6rEG4a/PrIHn21VJCulSonXOsXdhy6kpWrsZwv/Ype
         qon3IEM7h+LrNitOLMakuARujgqRzXhKGUgUZLINuTxu6BkNIKqCbGV4vv8S7iTfBWEh
         4RmW4WQZE9nOXc6May41bDA0sBkpRS3efiUyMcDWQZqujk+EJWoD/UwXTS3+N+oxWlVq
         nxaHw1dwhsfLi+RsQjx7mnRqL/Zhdt+mV21z/NZvU3CAVIqwVGw1pGsSt8PJXhCUIUw/
         kWkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv+JqSPynHtUfYHGnKvVyYSK36MbJC2BqVabYZhlUXBtCpiu1MljOYKoN1S/g+10JXKbj8+IZ3WXHKpLQJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6mmQQFWPeo43A6iAQEa8gsxdPs7/dZ+6K2ZHHL4NGoAeHePEV
	OjBZJCLbvbd0wgr8Zfy4dohma1KH4NXkcB3/njg6I17+eWH31aS/IoCwplXVceBAI8o1ooMeSLH
	HtMDY1A06epj9x3rS5xOZ/GJh75qx9TaSlWT3lVnwc/35cvgKawYI9VEsk/qzOBccf7hro9JxLs
	/z
X-Gm-Gg: ASbGncvc6lKUO+IGiDxP18//s0Wsfykr8HmdzQndZ7USROktQe0HRuykDmEY9k/sCi5
	vi/XfKqb9SmglgrkTTMv3orAe6L3xoST3Zq45ofVeOJK1Pex10ecLR98OvbiXeYDKYN1uBRqlVF
	ecsLrs+VeGA0PNffQaYryk0CqP3YtZndV25yV8sCGbCmXuN0KhGnd+0oDRax3EKy1CLvJXwaqDO
	//waFrQ3hudHetZ0iacMnRZKsvqYz2BXIldzl/7Uvo+d7n5QgCthsl49VS3K0bVxzfz824FncAg
	gKPvmSdy29hgNz6ErcCbVwHJvwjUXgdVmjZAWgLFjvidFEoVD8TzJN/ZU1tRJMQHiEC/Xn8ZfV2
	YSbszog==
X-Received: by 2002:a05:620a:8806:b0:7d3:cf9b:511f with SMTP id af79cd13be357-7d5ddb72782mr92365385a.5.1751629789214;
        Fri, 04 Jul 2025 04:49:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiAjmWRPkiKpR+S4VHXoZ42jF+KSMtl9uggu35JvLmzo6Fa35B6gQezEkVOBYqn83TEjdRAw==
X-Received: by 2002:a05:620a:8806:b0:7d3:cf9b:511f with SMTP id af79cd13be357-7d5ddb72782mr92363685a.5.1751629788540;
        Fri, 04 Jul 2025 04:49:48 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac5f37sm156568266b.87.2025.07.04.04.49.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:49:48 -0700 (PDT)
Message-ID: <1ac0c729-0e6e-4004-a8fd-f58644b7682b@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 13:49:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: spmi-pmic: add more PMIC SUBTYPE IDs
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
References: <20250704113036.1627695-1-rakesh.kota@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704113036.1627695-1-rakesh.kota@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZsZetEOPAKBl5cBAZvnXoS366fWinnzM
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6867bfde cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=HFKg1oX6Bv6CssycSbcA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: ZsZetEOPAKBl5cBAZvnXoS366fWinnzM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MCBTYWx0ZWRfX8psB0G8KZeYq
 jqoDunnx/vatiEdCRqAgpltSmb6GPGAE/+kMqNZQHsP7SZ5eA2jr9yiqyOliJS2s3Ff2EfcXlva
 FKu4xRUV76yOlaMOFqpvGCa8TiwZ9098H+6k57YAtIcmaY7oeET6AnvY8uobqr7MhTih2hJuNwl
 sAgKCi2UHn1gPmjK1uYlr/Io4DBx03753F+XP1B3NoDqhIGqeoc3yQQdjmVTxcpkV3UyD/Grhh+
 e4KYwUe9syQMGfdCvYPXit/wnO11JW1VkECADUVy9u5QggZ/jLrcIckeN/mSd6dfxqwamHWmfCP
 Z4za2oAC/87ndgShw935vsClFWYeDKxIOdFP45jegsG0dq39eb6fMzB/B0noOiLekheHfTB/mWT
 AQV2ka9K2C8lLMW+qRE7i1ua2qb/NADbBxQDe+dPT18AEAUsceTa1z/8WLFOw1/WHAFfS2D7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=590 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040090



On 04-Jul-25 13:30, Rakesh Kota wrote:
> Add the PMM8650AU and PMM8650AU_PSAIL PMIC SUBTYPE IDs and
> These PMICs are used by the qcs8300 and qcs9100 platforms.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---

As different as the second one is, seems like this is its actual name

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

