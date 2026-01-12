Return-Path: <linux-arm-msm+bounces-88542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9CCD122F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 12:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DE8430657B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF338355800;
	Mon, 12 Jan 2026 11:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A0ECFRkf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yd0eAeqw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5972355806
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768216035; cv=none; b=EKvugvAD0xHuxDCWTAJZEgxmt8rFRoF+D8QnyF+9dY7g9e78ZSOT1uS7fv9oLu+yxiEveLqilE+bNt5dc7TQoad86PF3jQWaq1GB6bpkip8vE9dRynL2hrDJsLwMBlE4xbLiX/xlP33j3pFqGFR4tvy4AE4rMYw2bV44vQvd3SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768216035; c=relaxed/simple;
	bh=ttRq3EIRIZYlO0QVYLhCDFcObVhsZ+Odd3rWoH7N9HU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g7aiPxm7TSrvTNm+0HYoS6b1zxKBNyEPg+F2bVdEiOSooG2eLqdZYl8n38Gra62uhEMQE3/KrWzEmSTCmg9L09qy9pmNJ/QCtQcRWR8kZY1RF3w6d/6qGzS8vAJ9ajTTdgBJ9ujSRfAdmvyvDixVUJhNghMtJb8XHtg7HO2fQOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A0ECFRkf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yd0eAeqw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C83IdZ2829404
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=; b=A0ECFRkfnPl0dXD/
	5Ee5jZF6mLYqlKbtPDk/brg8Cfrf1nuCvdXom+4ieEfcwaL/XlTsA44i/rYUTKxH
	T3b8fzAjPG2wY9onrDFkz0uYHbByeMphgdQay1Aty7/Y5+5zB+qj8poPo5xRGkzZ
	/lNnpEuljiGIe9Zt7uc/063Ho6hsBMXjJmCMUcYDP3RKgUGcU/4zC2e1M4EDVXlP
	KaHOHNrQHDG7AaVdqve52k5sjHy4/xWkjef3HbveDEvqtQpBsLqZZb62fOmLgAAi
	14qVbUK1ZY3KQAmSG9jJ4hYCHqaR+Tcq9ZOJK+WXXb/U4AdTrepsc4x+2JWM1mO6
	RxFYEg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmkk41w5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:07:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f3564e2321so11805931cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768216031; x=1768820831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=;
        b=Yd0eAeqwbLUz4PFRkcuJPsmkxw17mWeSxymAtqhGtEJJOo/tt/XsrQfAr9VTYjFiaR
         56W9pcVYlAB28p83nBDQnYQJiG03BNaI+LYFN31wyslEhJEvTIyFSG7bvvG+uNohYN0g
         8ioPEdtMf8XDzVVahbB3GQEmU8fXpDHcsFQrNdzHfZJDqPHkPQqMvTEfb0queTXFKX2K
         QNn5V5TQw7umjjm/+8TkrN1IfgH9MNAuFy742cO0+P+V7Ho6m0wRD/PDR4zRpRmSAOGU
         sCpQXEAOQCoeCRklaJz/BiU9kZPyinQSWcCfEMqCaMzSVCEhhtaJb/rCmWD6IsFw6nJY
         lpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216031; x=1768820831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=;
        b=iehMMDOI9TnapjdRwd3Ze/zev6Bwt9v+kAVNBmxDV/0p1C/swoxyOzaMQy1yOKm/2q
         pF1/iQ/1pGgSDROQD4hKIBpj63jLEUUYUAbvqh2VYgelmv4lHMmSAe/VY/iinOQOt8pb
         fgi+xV42AHXl/m+VTHY2KHSbuDdrzLqko3xjOho15EZEfGH9jI722whT5somYyk9Kq29
         6b7lW/Ic7bObeUKMjo0r+SacGWKtz0rtbyYm0BF7DncrPli22UW6j+J1n3D2X25QJYb9
         66bjAb9R2q4AF1LaEyYyWt0ZE9wLpHG4YFWii64hvFg7YR8DMQwSpXfx7DIbpPipwj1u
         eMHA==
X-Gm-Message-State: AOJu0YxKQw503pZ6NUFzRaSHvxP48eS2b2QTdpHUB49r8hFay5skZw+k
	3O4VCSMZGslyUwojq5V/WDMiIP/Vhz7tscZOs5z71PoOw0GMXOjnDZzrH0tFzIS0hFDb5aPzeXR
	h8HuoIpoQyeZkVyJ50qg2sAZeXk8KXcgMuSND8P2hpzNF5RU5ij9pla7ISmSh2z6tg5cK
X-Gm-Gg: AY/fxX4agWrzykKSeT6NKUqLaxasEZYnh9nndDzY93ZVa9NtEddunojcX6gpa747B8b
	V73U+vZ7fCvlVXqK4/e+VxgonzZ5hgywXeGAe0WXla9NqzVymERvDMD7JTjg7XtOvE090Vt8GuU
	90QmhaDirk8KDhGkSrYY9EZff9Q3KOSSLNsQaVXE5q//QBGd68bw3rSTGmlRqMg9brlYxP70F+U
	FXXtnRdciAeEYqYWv14v6MHKVVBxg78Xds8jSg7g8jB3n4yawGTuSOQAJBiTJwGuG1376TF76cy
	i/nZ7hKPKH+MZR5HV13JvavOHZzboE0DhMc/HDMy53iJBREdyUw/jm0VZdzQZSonZgt2sVzSjrq
	GhGZzR8yCL8fPsJFYJBVUrEHfgefNhPgRm0p5QpcN1Hv0Szg/VyIG3D0RWvfHoEtu+Dk=
X-Received: by 2002:a05:622a:1391:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4ffb490058amr190474281cf.5.1768216031399;
        Mon, 12 Jan 2026 03:07:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8bZ9DLH4NWCdH7EePQEzlpw6QhI9kvYUV+M/ik2/g+M1Hc8pMsJCTVVcitzVSpTEcge8P7A==
X-Received: by 2002:a05:622a:1391:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4ffb490058amr190473951cf.5.1768216030771;
        Mon, 12 Jan 2026 03:07:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8706c2604bsm476444566b.16.2026.01.12.03.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:07:10 -0800 (PST)
Message-ID: <61ac4661-77ea-4696-bbc4-531f925d5fd3@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:07:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] drm/msm/a6xx: use new helper to set min_acc length
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-11-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-11-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0aT0MNeDOAIplDkCWVmcn7Yeh8GO9M5O
X-Proofpoint-ORIG-GUID: 0aT0MNeDOAIplDkCWVmcn7Yeh8GO9M5O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfXxKq075fFYIcq
 U1xq48pVuf9br8GfaatTtdfo5fUPfusZrDh/bqujp6s1eLQZ1jKwZz2BvkvqtbQ4PZTAcW96Usx
 2A7iebHJw54zdBaeM/xegA3kXFJN8wNAX2vC9PTjlzxIL+UT9vVv2OTzKI6M3bb7SssOL/laCA8
 Fsi5KYHycagHzmofP2sLh/uYvMo5RYuM8lmHeXT0xYftdCvLNBFav9Jna+3e0fgkWOlDBYZPWaf
 HsbsYTORZmXfe+i38ctWp7yJMbFQEvNCdcSZsOxf7w0I6RaMQgCdv7ybpqIT7EKGd0aPk6yVCrT
 sPhY2bpE/CIS2l/xMiF/X7mKRooBV9m3kVzaLOTv8LqlAnq8ikG0wjzSBkS8HoalpuRq1xtm8DA
 rXD49mUqmmqJfKluANqK1ugv1D7oN88XJFy8HpdM8CsVgIyr5S0HOgTbbrDZ80dZf/7DP06+VLO
 7YVvesXkzS1foQ7T6Og==
X-Authority-Analysis: v=2.4 cv=cs2WUl4i c=1 sm=1 tr=0 ts=6964d5df cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=su5gWXN3lQTy_5l37lIA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120088

On 1/10/26 8:38 PM, Dmitry Baryshkov wrote:
> Use freshly defined helper instead of hardcoding the checks in the
> driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


