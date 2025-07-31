Return-Path: <linux-arm-msm+bounces-67236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD55DB16E71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 11:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0138718940DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 09:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA5E1F4616;
	Thu, 31 Jul 2025 09:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9/WzznN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ED329DB81
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753953691; cv=none; b=nc1FEIGKQx0BL5yJm/8JNihJZSl5aGa/3OaNs6kimTjDuqKEKZscve+EG6iMw/Hm9IS4CskeuxF6NKn4RD9VxBJsAq16uF4rpdagnN9aNIZb3EavRibCMJWkQjj0r0O66re/4UobCh0uDdPW3/pWX7oIM3ChdGysvsWk/SOsJRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753953691; c=relaxed/simple;
	bh=xpQ/EETidjPmojALdAWFIu2//pYT8zpUgRj3ZDR0V2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=razXs2m8jM30UMdCkhigb6Bv/fvd+IleqIN1EByeRn+NH/B5fTGKEtTbp5O5xN/na6CBPGzZvZitn2USUeU4Zr2czz5gRd98epTz1PqG34ba3xR124zPADF2clFsnavpnwTEfDgw3wtnsqhP1NweVZl7X2KKwCum1/Mimh1znP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9/WzznN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V1fUsc013527
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 09:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YKaZRpzTXWacG09Osv90jCxKbdHhzZHJjXyXniyeau8=; b=W9/WzznNX7wf3bVn
	78X4fDfQWP+G4fVjX5RCjLLMJDMwYF4oThT6Dw1aFomF3a4dw96Dw0bhCC1qWO7d
	4ZRyIkPpan7q654q4SyCbxCzfrRUUYLH0BVjKGuFoh6JVMZSeFC9YleYNCEEHb3/
	W6xjDHor/kEBI7SeO+m/ch4PzErSvcaq4xhg1EzYvFhz76odXn9nadDYjcW0H66F
	GFKLMett4EVPpMiLM6M3abB5/7VK/LvvizszwxxNJz+yw4R0tmhNvyZlAVw8vMcH
	psHHoLtx+gdjjdp1nZ1+FZBTFMyf4/IV5PDzK1ElfU44LBg4N5gvPdh3e/JtvhSV
	WJWocw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qy6pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 09:21:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e33e133f42so23949985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 02:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753953687; x=1754558487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YKaZRpzTXWacG09Osv90jCxKbdHhzZHJjXyXniyeau8=;
        b=WJR22bvOGbeA+haswI5F/xC7mVxQN0rq1elmGi9XDfX5fht9OBU5GtlNzs+dzXU7U4
         +tLx2UIbt/bF4uSFiyrohkoYP5FKETks9CMbeEekfvZ7Dhc5p9nZp62y2M4F0cIda3v3
         +rRw7fmkHgIlLBZrrXyKwGWMG8MslSCkhqQVq9GGa8opM78GJNof1Xlxz7no2NNgRoil
         BIW2yz3GGeAFqHcAu9fXsmxxVYGBlhuXpnHRmAhl5h0D95ABCi0OIdTUKOYCWTR+AkHw
         4kIMChIr7WiqtBK8FWpc6hhuIPiUQAoF0GBsepnCY28WHdoacCn8+37SJKxtVrmknUat
         pzTA==
X-Forwarded-Encrypted: i=1; AJvYcCXnXivcBrFcubG3T3oqZSeS/ofSud+2YLsg/gFvZSHjCM+HxPxROoPzBsXvnnKpJqE4iAMbraS/sC6fhRmN@vger.kernel.org
X-Gm-Message-State: AOJu0YxVGReyIL18ewxAw+LIs2X3PhinoDUj5VUuiSO4Vp3Og0KodHUF
	xROEIhZZL69/3nOq1NltYdeZ32K0KioHJZj/Qbpxrv8B7/pvtu+ekuletwjVXXnlAciL+7o/w7n
	AVvFhpf7ZFufnF2fYEf6WKvvIgfxMlVCVgVV8W1A4wXLv5/rLMNzyPQ37NYIvKTI2/JWa
X-Gm-Gg: ASbGncuchgAnJ4RNP98bpRG/Dzb4iuRW8IUKdYgRdlZdgPw5KUki6Ei4rmbjFZCmCTV
	AjU02KrCKNlYXJgXQyNflFKOacC9+KnkURpi0UFSks08YViz29+5AmexChwGltubccTJ/i7AUIp
	luyFtTufXL0c2zsHIygTWQBuAdyaKAfQfF1IZ9vlHviL8tzyaJPNH6iAtW/H6b905JCCBa0Ay8q
	5Kn+BjZ+LGc0V1vFKFZvTg5oG4Mg4UfZzIy3UdD6e5uIcD3bz8IYkEEBIjeHO4B1AVVoA7z+Eo3
	RD73ptPgaek21c1ZOkrELbI/GbPrWcZbNQD3s5HOzc3kECWWnHZNOUStl7+nu2yTqgbRuCoE7+3
	gP3Ks5gj7sodZiTwQUA==
X-Received: by 2002:a05:620a:2546:b0:7e6:39a2:3ebe with SMTP id af79cd13be357-7e66ef831b1mr477644985a.1.1753953687528;
        Thu, 31 Jul 2025 02:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEalnbAwcLIJLmez0p2ygenNgK4rxww+Q/pnP8/kWW85eDmOZo38Kalj+JOb4MmxyAgyaqYWA==
X-Received: by 2002:a05:620a:2546:b0:7e6:39a2:3ebe with SMTP id af79cd13be357-7e66ef831b1mr477642985a.1.1753953687115;
        Thu, 31 Jul 2025 02:21:27 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a14a0sm79370966b.33.2025.07.31.02.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 02:21:26 -0700 (PDT)
Message-ID: <b34ae465-c227-41eb-8492-4a2e761cb3f3@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 11:21:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2][next] drm/msm: replace minor->dev->dev with dev->dev
To: Colin Ian King <colin.i.king@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250731081854.2120404-1-colin.i.king@gmail.com>
 <20250731081854.2120404-3-colin.i.king@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250731081854.2120404-3-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA2MyBTYWx0ZWRfX4dL5G2fEZfP+
 dD6jU6BaJv9SC6LXJ9yngImcz2QcwwpdaOluZn7xsdRpxH/eK8dgmQFtHeepCwIUlxnSsPMaG4d
 qzqWBhzcbfbXFHIFhA6o5VlUsO0JBMR/0cWb8xXjB2GQk6PKTq/8uCii+Nr1dYjGzDRXBRUIM2j
 k8JEzmdmRu5oHTI4cb8FcNbu5Fow0xqjCrHRjCEgRLGCYGyfR52V3cHM96APBTSXoJKCS8Nh9IL
 5ANAd0FQjtaHXwvSLG9cskszkjnEhY3J7Q0OYS7IqaZapM0he1qlFn6AfLs6llD2UwugP8iOwgr
 UybygDLtq5irAn/jAusJUD2TMTI1cD4O1Jfvn2JoalCkaxgVOEMGhmINoqlr0+zmVlb+Yj9Hryp
 dq+hdZeauRddbfbP+xtpyv+9y3oDkzQyILXtWiowF1SiMECa8L/4gZN9TE4y40kfKihlF/tq
X-Proofpoint-ORIG-GUID: eQl8tzrmTX0ZpXzoy0z-U35oNLsZguhL
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=688b3598 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=fM4dGe8XGJNefiYG4oUA:9 a=QEXdDO2ut3YA:10 a=LXDWoPVop_EA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: eQl8tzrmTX0ZpXzoy0z-U35oNLsZguhL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=673 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507310063

On 7/31/25 10:18 AM, Colin Ian King wrote:
> The pointer dev has been set to minor->dev, so replace minor->dev->dev
> with dev->dev in the DRM_DEV_ERROR messages.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

