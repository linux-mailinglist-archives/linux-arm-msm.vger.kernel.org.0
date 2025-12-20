Return-Path: <linux-arm-msm+bounces-86053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7C9CD35BD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 19:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A2E6300E03E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 18:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164BF30EF9A;
	Sat, 20 Dec 2025 18:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PaCAqTIs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UxIzEFC1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA93191F98
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 18:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766256991; cv=none; b=C2brB5tqB4LgogjowVBEY9oorM6VxHbVnOmkn7hB6Lphg1CZL9Fpqs4XxbiZ+VPvnoOa5BGtqcySP6ub4ck80tvLHRj7Z4USO/FROGd9Ru+htuj/s1W+LHHJEbptQKT9GTW9UfguOJ/1PHNLltlJ94luwhMnX9r11cOp+z4qe7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766256991; c=relaxed/simple;
	bh=gpwOqwf2/gavlVg3ZgQ1B7lKVXuDeUkUMUNtlQnTYUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccQi0LiR9ePNoS9XGJgVy4AGi/zZ2U7tDGkWGfQr/3ZMWh3MXFrkscfUfXWfdUENFMzGuxesG+7PqWSLFGXh57ZamjCSodR5ZZDiczC4xcbiIANKRkgEH2897KLpwG4Q8KNyKSysmVUHIVQDT0yzZmcCNvGkCUp82ondzlUa+6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PaCAqTIs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UxIzEFC1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBOmWh3644715
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 18:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GJ/BFR0XoVWccgk2a3ghRJ4G
	HS1MnzeM2O8g4YdDhlo=; b=PaCAqTIskI7MidZhosWYswEjxJ8gtu7OGe3Lz+6E
	QpEtkrRfAdMarv5JHw4IRnh0qO5024EHKuZq7vgUFgLXzw/K0j/FgNUcv3J0lFZX
	Lc4XxBRoZn6JYPddnqhIc+OZSpthCuvOBvClsPiHIR8QJ6iTgr75qnZPsOv/rVn2
	YrYfnXYnM1o7aOP8zrmN38jtgWKvrvb1G3IqGuysxCCbbWhhA74TYaMcGHQYYvAv
	XmdBFcpE2pNc/YkAmaf9aml0lYheg2ZlPT1f6rdXYmOX0uQnHVWuFMjlrWo9RONV
	FSpHUoSYCQdBKmTeZwuA0klQ3m+s6ezFAlQATw97MhiHtA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrws5g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 18:56:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a3a4af701so67327546d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 10:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766256987; x=1766861787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GJ/BFR0XoVWccgk2a3ghRJ4GHS1MnzeM2O8g4YdDhlo=;
        b=UxIzEFC1id9a1y7WJhgL3Ug/W6MeSRS8hI0sotNEjNfgD9pUq9qcRDXQLv18/gyVWE
         MOuFMmOfJd4bxdUhGrT27TjrDVIKnFl5M4otbnbatCfLFCrviyV73U43YsZzH83O1xE9
         aavMRC3V0fpgybbwH0CTPPY0LVg6c2r/Q8faCtlxrAW3UQQ3/M/2NFB88dChT/RIpyrN
         JusX5t0S27hY8Lhuc0IERVFY4UzFpPMTqqupzoF2D0gWlObJjYvnT27dbsL4gDB+rsu2
         Sl61MsqvKfSgIHvYuf7VGH2kDF80Xwpbe4JHn7KStI2OiaeJbD2y9cxr8gxbr4Q1lmmc
         y6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766256987; x=1766861787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJ/BFR0XoVWccgk2a3ghRJ4GHS1MnzeM2O8g4YdDhlo=;
        b=DCdQrbYXED5gJwvpppH46eP7VoF3bJJyJhckFMkoeVR6QiRtOVbsQ+RD5yh5EbSApf
         fhgjO6ph/lG9ApCnDUCVgE49wvj8oUbg7IDVDPEHWRzpnUOEGhwSHA/QsmTYPh68M/Gx
         tAlFp/DaNzMzCBLr/FNf2zl4POhoigeqb3jm2wDokf5X5z1dD3t/oMAkzbuzF/4kKlYB
         PxdbMELODhiNLStrK3Dpa/tBJH6kYM3VlR4+iIBjWP8KLi6N8MjOOuCDc3Z7Z+Lsuts6
         Uk0gQC5AxCvocIZ0IHhBT+GyAQ1RvhytDXN/QRO5KYXIR1Rmey/etO6/GJQxSVmgpWB1
         wwlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYymuhgos4KcKACmi3oxQWK3MZ+XAmJfdgRWvpoDfwrPKTuSODx+aX+lDWY60kzBQ+xD7hY7xZXaaTe+Mu@vger.kernel.org
X-Gm-Message-State: AOJu0YzhAxBke4NtCk9oAxNvK4/Tkip+M5YIvdQVJjRfkpse6nVfCTY/
	O8hQ/9bnXF8Wq82AOu3FF8XCJMrpKi7nfKzyfjAyppadi54BiiabD++MpkofKTib7k3UGFPOpAM
	/K0mgoIPgvDRun7yUdQXPURzgv8GzrukXpMUjeC2VJg6xrsccGNHLK1oyQl1qCYM2wn1xqVPyVG
	ZP
X-Gm-Gg: AY/fxX4CxtryeOUJxfT80xXj9TTGuB8dfw3XTPKP8sn3zyswNep3oknh6MR8AN01Dvk
	/RQ7JrNLgJ3fymNpIytbFOO9OnkCsYQvuoV5EZn1qbBjWneHcIPQHvQ8qPOwjA6V/rTwkW+5iBX
	QtgoJN6VDwXRfWZW6Dm+VJUgIZVoGBBVLMLWibE9++hEbrAtd1xUSt2XYYM2YC92O51RHiPhov0
	kl5pDDFREvmAJC79O3fGeACSHdktd9X6hhcQHRZ8/wnfk/UyJSLuFZ0k0MNRE/IwTP4wKfMYV6Q
	WpmkWeYUANSJ83mhhmXyaQvYjlXO47+LWZjYWeSYNwxTY/vhY0g8nj1n348bmp3UGme8G+geUXY
	fGAo5slqkJ1ssRegSyckPbPaIAO2eJbuiVGDfYwV2u8qJ/OAqR1rmpMZiB3TtLMpHKAqyeclYQS
	uBJy2tBuNSUfkmeRBuc9ky/AI=
X-Received: by 2002:a05:622a:15cf:b0:4ed:b2da:966f with SMTP id d75a77b69052e-4f4abd0e694mr107830191cf.31.1766256987329;
        Sat, 20 Dec 2025 10:56:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsQdO7CAECz5sdl0VvSxhuLEKamLp7NsQ5QxyBOQTaa5yTgWuCscNBtptTtJ3fr8X1C3WEBA==
X-Received: by 2002:a05:622a:15cf:b0:4ed:b2da:966f with SMTP id d75a77b69052e-4f4abd0e694mr107829941cf.31.1766256986864;
        Sat, 20 Dec 2025 10:56:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861f477sm1699483e87.71.2025.12.20.10.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 10:56:24 -0800 (PST)
Date: Sat, 20 Dec 2025 20:56:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ASoC: drop bogus container_of() error handling
Message-ID: <iub7k2kwm3uibvwjhtlyxpeugig2jbhsodwuqaq7hvxalka4jn@kefgsuiwqgqn>
References: <20251219142715.19254-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219142715.19254-1-johan@kernel.org>
X-Proofpoint-GUID: QOo81kC6obhPLASHWCOfIRLNZ96Wkwwg
X-Authority-Analysis: v=2.4 cv=R+UO2NRX c=1 sm=1 tr=0 ts=6946f15c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=r5afS2MLfkluYLZWxBIA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE2NyBTYWx0ZWRfX1UXW/SksZmQZ
 AQPbVv8bnyqN9kuypAlxTqkex7uNooxHcp3EupSPngGq03DmIYFprgtDgAQuioLxrT5VXumhdRB
 XsECkoDboddrhYYQKan44Ygv2/rhJvZNn8KjaWlM/7ZrZVMxw/NO7+MkWGTf0zzWz9wFfCvWT+8
 LVTkfT7AwGOyGeHNQruJITV569ONUB56PBJ/z7l7gjoNQ+9e4jvVZBTwVGfYkP/TW0u1xPEKHaQ
 la9+99n9sxOwFZoYbbysMvDdedbCpGpNfe1gWRJDRuvZqvU76blQD1p1jxuYSbsq2f2FNHfjvRY
 1AG7IOjs87dFAdS0m1lt6XGwLPt7fUH3+3Bo0u5u7z4/7/QZL8noPCYPoLTggLo5n3NKYFcOJOl
 qhx2xC2w0v3ujLPGluP6zJKzrWHgMS8ZT275f1oaMBsjWVxf9xPd4r2ISQ5zs3Cnozeih4yTMuf
 Yo4CaaNegWTKhiZBBkg==
X-Proofpoint-ORIG-GUID: QOo81kC6obhPLASHWCOfIRLNZ96Wkwwg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_04,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200167

On Fri, Dec 19, 2025 at 03:27:12PM +0100, Johan Hovold wrote:
> The dev_to_sdw_dev() helper uses container_of() to return the containing
> soundwire device structure of its pointer argument and will never
> return NULL.
> 
> Johan
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

