Return-Path: <linux-arm-msm+bounces-84548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 468B5CA9FE1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 04:49:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40E33304F105
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 03:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34731487F6;
	Sat,  6 Dec 2025 03:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqUKy4KO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ay+Pb9Yt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313D927707
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 03:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764992939; cv=none; b=hXNvvQRtXSf2nNK+QluZ3xLoqo9PRbowf4m5IKpIWZB2hWv6dhffYzpJd8hDJ+WpXmy0qEK6VVKgrm8/lAgmpBlfgDjnj1TEUO08qsZ5z5kvyu5zFdln48wmzQU2aa+/LeaSfsdvvcPI0TW+ll312wgkyoT9lKpipWBpJ3yUT5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764992939; c=relaxed/simple;
	bh=x+9cqPLCKW4K0GKwhFelsaYmydnMqWc0ZhRT9opzhR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PR5zW7z99LKaKJtb3wZkz1pG/O1xVXmVenYOVuzjL9ZM0Hi2tR5R0nayxiHtvzZ8NRgLYZ50W5QZEQ+AQM4irk//zZ6m70bTYdNOlVyhK+DEvzpPSX3QRYr5SRmmnHygpDBEzhckmIwYGVAARGUMM0glsW4CgiUiLRbwjWQSr1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqUKy4KO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ay+Pb9Yt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B60gx561692220
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 03:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=05nIEVTH/I6ehlNORXgT9VtO
	AtvZr13dqFzv01ipRhM=; b=LqUKy4KOWAcy1a7ncySj2gSHLMiHssL0R6GVAo9r
	Gl18qZ2MnTMNwsfMlcRvi3OQfQDt94CSHmqi1g40BwAws5OhgbnPWXyk2gTTetBH
	nWuMwYfDv65V+faGua8rQmW2SE2NRJHCEfq4BISKIeCVlW/D3Fygcb/dBp7BMzST
	zVUjX0LJpXtWb6TQKtt34w38FPX5xfg5szSHi7FqZ+8KaVTk1+IXmDu80JDWL6ZT
	X0s8d1sHuhjFZJ4F2GAH9RCfkq8cwdMowXdv7a+c2eoO1lrln9ykGqqu6m2c1SfG
	H78zvnnyh2iDCWNqil3r5VfCd4xOvN1bo14IqgM7bt5OnA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ava6f88xg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 03:48:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2217a9c60so407540285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 19:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764992936; x=1765597736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=05nIEVTH/I6ehlNORXgT9VtOAtvZr13dqFzv01ipRhM=;
        b=ay+Pb9YtJ54e1Rl1XcIhYpatSVZWPITICMnHrdu+s6Y9P0kE77BreJ/0E/Sd6Xkrlz
         M/nI2b5Jss3sobCi6b9sQi6LLmYi5p2fwGSafqWpwAE6xPj4R0Cgoxu7WmdBR4P9bCea
         vEUxyLBRi0kGpv1Iw4tyg5oVHzOaVUuz0YwJtC6qIHhq5vW3ZkNiEbQp0Oxm6LdulAR0
         RGXooVOtsMV4eZQ4d7IbvcG99PFN6AriViKhTKy8DloITHjKV2ES+v3IXToqbMG13rvQ
         AhRCuoM4KZjpE8WBNeHuwZgH1oGCFssIbV40wkkCc2dUQ51eenYC+qA0Ng2mS2wjCwcL
         et7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764992936; x=1765597736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05nIEVTH/I6ehlNORXgT9VtOAtvZr13dqFzv01ipRhM=;
        b=SaP4L3DW51MGVaMCzy/5tqUNkgXzaK1J2MrJ1Cf9jZsPAX4XL4rX/Agd7YBUeQ6eCv
         s7ivKQnNWXWu3J0jIU58S5dyrhIiMlXM7d6jA7+bedcLh3nP/oF9eJ29bUgcHtBAS0g4
         pGL4IHKV33Hs2yneE1weVr3xy/LI69PBgHVt9M2VB4dnwxiA6j95W3mXYDLi6/tjV7jd
         GhiD4UDZQgm/xL/P4UrazxqspXj2YERZHI0WfzBTxrNM4DBJmoNRG8IH9rB0j3TBAXkH
         4HI+wrjCobqQTz7D51L9H4y14Ub8JMSLU8ot80DBrd0hFY6YHzXjKWKmD6B70D+TCtnZ
         HaCw==
X-Forwarded-Encrypted: i=1; AJvYcCX6EHnanYAbkWhc6e3ssR8Nj3cDhoWtCG+ezrfAny9Mp+DkZqicD7x9swVh6hA1n1CIoaARTnmU1XrbqnvV@vger.kernel.org
X-Gm-Message-State: AOJu0YxwgL9SgDir+jkFZ0dUzq5x1iIoeGDc8pycS9NY4ZSndYpHeLps
	0ouJPjxjUmJ6m2+piNKjdFZ/Kl861qcHt5udg81KgrTRylf+LFUL1tbhSR8fctc5Ym4IeLknA3v
	Rf1f9oJUHvsc/Si9sRxnO3ZMWGtKGofHLsR53S48G84yu/qklfj+cQpMQtxdoHkwLeAqz
X-Gm-Gg: ASbGncuX+kfKXqehQa0JZJdAt9/7RZOaVjGuWlO0mN645+5WO/HnnYPHemm68jtDRmN
	eR8lKeRcc5dK0RnIyOQzFQC03nE+wn1tP4hHj408yCxqxl4NYaxnc/SQ4tlORjeVFKWpb5pMqbQ
	iUPfib2qaNGtuoXmggeTuPk2hKSxTB1xOCOgM26qNrZBXBn1zU/wq2aBk+b8bpWVktnd788bRVt
	wzdojx0JvwUO9XqQvYSWTAY2lc1ihkyDz1mQac222lcf8SMZ0TFefV4uXl/EQP58HZqJpgi9q3d
	yTo3IzWnd75FxEcvnpHEq+UycGQG5ceL9niZaBnGiIy7fc3S/zru5GL3DKstWoqlW5/fHVB54X8
	vmhF7/N8Jnj9s8P/Ll1FR3NxTvZ3o2c3pqR62jU7R7czqKzL6H2VBl5St1dJPXkvJmuJNcCu3NC
	IYxv14P5d7h0t1f9pUuZ9wJ0Q=
X-Received: by 2002:a05:620a:4515:b0:8b2:e5da:d310 with SMTP id af79cd13be357-8b6a2332c66mr181348785a.9.1764992936315;
        Fri, 05 Dec 2025 19:48:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF93lWjddbirMGOfjDSwFVrDvnZOh98/DfM2siqrj7J5NATC0XYA3TxsVHkWUdjITrz5J/VKA==
X-Received: by 2002:a05:620a:4515:b0:8b2:e5da:d310 with SMTP id af79cd13be357-8b6a2332c66mr181347585a.9.1764992935876;
        Fri, 05 Dec 2025 19:48:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e6feab896sm18951691fa.17.2025.12.05.19.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 19:48:55 -0800 (PST)
Date: Sat, 6 Dec 2025 05:48:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vladimir.zapolskiy@linaro.org
Subject: Re: [PATCH v2] media: qcom: camss: csid-340: Fix unused variables
Message-ID: <o7i53tr4glcpahvinghklmltbeepqdpye47bfcwd32tltp36jp@nhnedmhdtnmv>
References: <20251204090325.82140-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204090325.82140-1-loic.poulain@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Bq0Ut6NZNSwI_CPcGuVkbzY3Y45jrVRO
X-Authority-Analysis: v=2.4 cv=NYXrFmD4 c=1 sm=1 tr=0 ts=6933a7a9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=a11_dG-raeqLMxrPIc4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Bq0Ut6NZNSwI_CPcGuVkbzY3Y45jrVRO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyOCBTYWx0ZWRfX6Zd8U3spoupm
 G/weS2QQ49d+DpcW/nyWMNqgIEasfzmkVAd0dcQJ69O/OPszef2bqu6k6Xa2JxeDOh2J5BghOPX
 yrU2YN+Npjdjo5PWA7Ky1m4/SB4xd/7l6tcAsRZpMsDP92B7gqYU0XLukmU+DKEumQhTa8+z3Fb
 2jAzHP5qa8au7Ygm+mkjPpxE5Wz3n7m5VbmEyrsZCBUBvnY69Pqj0KZkYVtA1ZdHftXB0m8p76S
 +uoOx9YyNrglm8rb1ype9+PvmeY/pp9piMCa4VKIl4p1s011/4+aLBsabqKwaauVg49MnhWjLrS
 wbQNNKuvj0jXgghbpSwyb2/VZoN1AMdHpyg4dW+kkIyUL81jAqbKD55ig71ZOfStf71I7H5aVyT
 NS6kGt+gZgPOy/o70UUkNLL63dUqhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060028

On Thu, Dec 04, 2025 at 10:03:25AM +0100, Loic Poulain wrote:
> The CSID driver has some unused variables and function parameters
> that are no longer needed (due to refactoring). This patch cleans

See Documentation/process/submitting-patches.rst, "This patch"

> up those unused elements:
> 
> - Removing the `vc` parameter from `__csid_configure_rx()`.
> - Dropping the unused `lane_cnt` variable.
> - Adjusting calls to `__csid_configure_rx()` accordingly.
> 
> Fixes: f0fc808a466a ("media: qcom: camss: Add CSID 340 support")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  v2: Correct the commit ID in the Fixes: tag
> 

-- 
With best wishes
Dmitry

