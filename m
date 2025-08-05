Return-Path: <linux-arm-msm+bounces-67762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C104B1B180
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 11:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3D533ABAAE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 09:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F4B264A97;
	Tue,  5 Aug 2025 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kLixXKiv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9318F1AA782
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 09:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754387620; cv=none; b=YPO0inoCAXQzGayqO8f4eRznZjOo8SzzvZ1phqWZ/VhmDtaoEuWA08Rdkbg6rGCSYDHb1ROyyFowz7mBufKs09AIi5asfMTJWaP0XR+o8fCUet2Wr86AJ+Nh8yqnWAgF46Y21N9QJB/UcBp9/IGAKChgdUzqiiUQeezp5OElLX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754387620; c=relaxed/simple;
	bh=xHMmS79EOwNX1obgsyb4BRfFjPuIg0OMEA7/lejHYS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXTVDxNYlGJopCEbry6m/FMRXLTgH71UJxZ3HzoYebLsUHSmgtimVvD65qyuAKo2wJmfZZi9ObVXbnTYVnYMvTwPnmyvQWjpJ/JiNmxophzfp5uJzQivdpWwSOSvJMr6xxeOj6vnvTtf8wjcZQKo+wvnY7U0nlvQjc6WB2zdxaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kLixXKiv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575748Xb005163
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 09:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6YWPtWFX3lxz3vDOMkYD5yx/
	64V35Kn7WOYr3KL9B5U=; b=kLixXKivEbIXqovRV+tfp5F6v5v1VfLTts5HGL3h
	E7gERMpO7CDcvPP9CzI/X0D4Ubdtd/qrbXtCuihA1Heh8VD+NfyJPTV1r5rHYBwa
	XcmpRIVo+tA9AfTbbrKMMCSkIxj04ktu67vqkCAokbEBntApFqhGPRYEeKEDeOoV
	BpxVSadjzqqXhnojVqnydYcNO17Uk4/E6HTpWHVD9ldRQk7+E4JFu1esk0yYZD/9
	0RkyS4wofxX4AeA29ysDYOBV0WzuKdDaWm5ChqaDB5w8xrRGwWMkSAhE3YYttloz
	UeXFJjIkRjEDhtgSUQ5Db49usgrFNdCLRzZ9f99eBX68pQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48b3j3sxaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 09:53:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7072ed70a37so123485396d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 02:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754387616; x=1754992416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YWPtWFX3lxz3vDOMkYD5yx/64V35Kn7WOYr3KL9B5U=;
        b=MQfrI2DsXmGFlklRnsxBPZjqdMXgl7z13Ew2SccZIxDZeFPsknNmkBUWvJr30RTY3y
         e/MpMHtd3eznLyQqYwgNKP08xh+TmxudwfVPlaZT+91iF+1L2Jw6MiW1Vjh/9jyhOP7l
         teQy4GH2Hc1b95y2ENwaccA7pnuUKLEiLHuqDmP/KJtmseMK6zGSwoTs7pb6ofjWLpaB
         0WjYa4uo+IQe9uYG2jxnVniMdJt+u+wZbOrIjZ7gRqxoCsqEkVL+putjvbr/+MYedAxb
         xOvIljlDECbJ0IbLRryr3S+sWz0XHHTblM82CTyy+GKYvH43XgXe+Y2Iwu0icKAcEwOO
         N6kA==
X-Forwarded-Encrypted: i=1; AJvYcCV8qTRpgZOWcBFdBCO4l7jUfOXjilIdPe/TJHxLtzhmBXAtaNIiJioSxcbjjJOBzAsfsABx4ojSqLTfvMSs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz52mlgO1OXjtUS7QHNNpu7g2uACRcIeCUQw8/s8Pqyb+JBdrhd
	E8Wb4xQdEKfa3OvCXOsgWkU23gaIm0vGT0WS8hrjWBN5nWcRSKjPenO4R/ZB4docbXglbhUFNrE
	o1ihCp/aVxyneIGOWU34CkU9BTgy94rJg2nuQk9z5pqvg7DPiWMCaUvYwL1LETsnwIIGN
X-Gm-Gg: ASbGnctByrpicXxoTgEBpmJrnY6roJBqBPhbZrGDKKpESe/NpWnI90ae8Lzn+LH3tGi
	62JR6gEqETwHk8pgVnzqUHJ4CXgLi7offjyuVl7uyhpGBJDpQatT734ufAlk3iiLyUOu9+jlBYk
	QnY5/ZkjEUuKBrOlhvHUXfG+U60Xp3gjIx/8G0/P9MV4fNIXzj1DLW5CvUvIZP+VI4vLy1RJvg9
	n0gT9xgxLZid9KOo9Sp9qYacV8os4PC8VtrTF9N2cmaU5MwLK524UDqLEAxL+l8QhrOyZRe+TtL
	MyBk7sc2trhxuotqHwBarU+RUbp1hXVklzJTGS0eKFqtYZo/3IyWizTxxByAd8t2WBbzkGmLXZz
	HA6dAkgF+CZh6sOPs5WhiVZzQFetA3QHEc1MpE4n5snJsNVw5lk10
X-Received: by 2002:a05:6214:ac4:b0:707:68f2:3275 with SMTP id 6a1803df08f44-7093670cbadmr173938916d6.24.1754387616067;
        Tue, 05 Aug 2025 02:53:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9JEfjsVXaezVAyd43S9MWYHyWsnb91oC1bbzdUBcv5zD2HV26tmbdacPK/T/W+n9iEvwA0Q==
X-Received: by 2002:a05:6214:ac4:b0:707:68f2:3275 with SMTP id 6a1803df08f44-7093670cbadmr173938696d6.24.1754387615571;
        Tue, 05 Aug 2025 02:53:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238272963sm18810621fa.14.2025.08.05.02.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 02:53:34 -0700 (PDT)
Date: Tue, 5 Aug 2025 12:53:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: mdt_loader: Allow empty section headers in
 mdt_header_valid()
Message-ID: <5hss454btv4w7n6yj2z5fsxufn35xgtjcc4dnaopjwul57bdag@w6qxobezqowq>
References: <cover.1754385120.git.dan.carpenter@linaro.org>
 <5d392867c81da4b667f61430d3aa7065f61b7096.1754385120.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d392867c81da4b667f61430d3aa7065f61b7096.1754385120.git.dan.carpenter@linaro.org>
X-Proofpoint-GUID: Q_OYJCO4PZ_OE5cQnA1AcNigreec1LdH
X-Authority-Analysis: v=2.4 cv=TZ+WtQQh c=1 sm=1 tr=0 ts=6891d4a1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=s473dRPoAqI_VoMXqr8A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA3MCBTYWx0ZWRfX0hutZjZoTs1X
 CrDdEnl8aIBiXhA6VE7GpdOXsjH8+APJPGHLIYTdorFmVa1vRpr6ION96NY21WVUJPW1M88dE+2
 +Q51LAJ65iaKWEH1NRnYyE6mxDVdTC8bE6XcsXshxY3ghAIYoyP9HaPscmwgEfI1tQmMbTTE2ET
 TQJVY13mgwwxsoJ9RXiAGauotkfLInKbSWVBKY4tqfT/6416HMkUCNbniNKce28ZBLzjbW2Im/p
 yRGJPRN24mh0UzY0+2xuXTrL5qv92m45aYB6hGFX04qGd1c19n1tx9sioXGNJRs5NmknVK2zonS
 eqK62rbluzJLjuJd5F8xGUCqOIhpgJevBkHVTvfWUEyk7FBFtl3vnZi4dReOKOFkv9uIhbZ5htj
 EhmioRx5foeXj+PbT7kK0RIq//jaxXPPbCVSV0kPVJBwiDRQ9cr7kFOtU40dsoI/sdp6+eUH
X-Proofpoint-ORIG-GUID: Q_OYJCO4PZ_OE5cQnA1AcNigreec1LdH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=936
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050070

On Tue, Aug 05, 2025 at 12:29:00PM +0300, Dan Carpenter wrote:
> The mdt_header_valid() function checks all the members for the elf
> header to ensure that reading the firmware doesn't lead to a buffer
> overflow or an integer overflow.  However it has a bug, in that it
> doesn't allow for firmware with no section headers and this prevents
> the firmware from loading.
> 
> I know from bug reports that there are firmwares which have zero
> section headers, but the same logic applies to program headers.  An
> empty program header won't lead to a buffer overflow so it's safe to
> allow it.
> 
> Fixes: 9f35ab0e53cc ("soc: qcom: mdt_loader: Fix error return values in mdt_header_valid()")
> Cc: stable@vger.kernel.org
> Reported-by: Val Packett <val@packett.cool>
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/soc/qcom/mdt_loader.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

There was a patch posted by Mukesh: [1]

[1] https://lore.kernel.org/linux-arm-msm/20250804-mdtloader-changes-v1-3-5e74629a2241@oss.qualcomm.com/


-- 
With best wishes
Dmitry

