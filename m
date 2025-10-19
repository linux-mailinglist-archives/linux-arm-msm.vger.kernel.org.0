Return-Path: <linux-arm-msm+bounces-77904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B76FBEE3D8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 13:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55DEE3B9892
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 11:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051282DFF04;
	Sun, 19 Oct 2025 11:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUezUlfR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F107C204F8B
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 11:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760874669; cv=none; b=kcvm4QhMqemwqM6DsP1ZexiLWjCkEP9a9+87lGHl80PKSDut7eyJLiIsWnSi7+OpH8BUM9FMG4xC7hRxm8TN9j1W5lhYNJOlDo3drn+g5AQVd5yjG+evYXcU2v6M+Ni1VvmxYX94S/lnGMOnoBpWcElt1c2IzQlsj7AmmSevJdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760874669; c=relaxed/simple;
	bh=cmumtuKzBnfg2R1nIGcWe4yYElE6S/ZvHRF/dQ/LS5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpDLBmigHOsRQH4DHOIM40fee4RFUGNQmUgJiUZmdEzn87j2UkNHOGe2oYtIhTDkHSY/XLWv0NQPbiHAP+X8y7ca1d/TF7R6yczsvFrEyJ2Rjz9a6IEA7i4CSDDSC4USuTo2iOGfGiiW3isDYHfdTABzXDlrEWrri2ZL26MBObM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUezUlfR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J2vbrx002927
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 11:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZUjoE3uaWfMa6VH/+WLd4NQm
	IGTWDScX0pmR3W98/kk=; b=LUezUlfRYlu8wvFCX5Lj1l8JwQrbeh73JWCNQM0c
	5198Ja6mfMrbyT9ZQc+sWzpP58F6J14h/S/3t4Y8QblivBNLOlvi36UQdOYKPsbg
	cLpY1TjVgklpexitsLdLW6HX0+rZ/AuknKlY2yGahp/ElKvO7RL+UgEVHwktr/wq
	rB9RdJO1o2xtZJ1tm0U+6LSAyfXzpxLAjFvTbeu/flu9SlsvF/F+oCqZcXpQnAbr
	L1le/fCVBjWy9RHzC00da/PuvuKf83CRxDKmfkvGgSva7CPZBcHu7/KKt1aK88nI
	6Rc8yUbikL8h4uF7+9kXiWJb5Zi70EjGdOi0sPwrigHaNw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v0kfajx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 11:51:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7a758650abdso145728356d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 04:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760874665; x=1761479465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUjoE3uaWfMa6VH/+WLd4NQmIGTWDScX0pmR3W98/kk=;
        b=DiFYrhevHljU3CJSETbTdKRvHblVgchWHHXm1hNk523nTnp4vXjiY3rkcdZZiERybK
         uguu9Rv0F6OTiWoaVAUtIxJj8SgSVNRYDqn15OTFV8SgxldCztVhHLwrHgZ3w/sVTCVO
         hj9o/9rBIepvSetIdi3iKUNIrgrDG7oV/ZfV7ublhAsm88RCzSBch8TU92wCmPUv5u3f
         sJYTlYRu0TIC1Jz6oJftKduFmDbGaFG8J0iR/0VZZz/rk5Rq7+cNhgF5v5phQ7MR+0ee
         +4sjLqH0kfewWvukAi7VlkAy7pGfs8LjN2efwdLC6m6ak+P/dISM3XMPrIv90jZ5J11K
         yaLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAqmokZv7GQzpCkzHpffgtFMoevQXFuS7xcYEmbBx4BJUwq6/oaJd4HjjiZA4fgTedBuYdfRs+6dn4egUM@vger.kernel.org
X-Gm-Message-State: AOJu0YzL+aaG4NUDJo1jgJ0l2QX9jSolX44pDQmIo4kvhKMr1jlz9KmG
	lSiD7qKIv7tV3vtGJt4acllcJMz4rUlkwi3nA1pbu6ud4UWGn/ciTl0/qTURhy+Xg3TcclPvh5j
	x2XNHnkKT3f2Yy53uv3LVEOAcCG9kUJ/bJWZkWuTVu3byfd/3HZMYh8xJ70/dgbh1RbLZ
X-Gm-Gg: ASbGncs4fiDYQhGBZkZtmZO00d4XGrvFw75e/7gMnzMFxMroyt4TxoN4wPN1pTudYVZ
	McFLotL5+Xc7eD7dD/jj9G28pP1iVTADGre5WmoevLg4gH4j0kqhUr50g0qxxPP2BvVE75EImSl
	qIQ5tO0jw5jEe2hgVxsH831Pz+eoYTzHJ7E/M5YDchh9U4/jH1mQE4qL1Zj3iKeHzGqX2Bb1pgg
	6ZU7LzeOeJxGw3Ing6acIA7ETBLF/fqYzLZaj3Rts3jUaFoUkwIEH7lBGr/1Fe6/dgKzL/EHKKQ
	SPAt0xk9UOCDM7FbEM0j3q3kuUm6s8WbqupK3N+BHLwCNXDQq4roaKpw/bplE20hggjhf/PuJV5
	uElywyhQ17/J0Fp2RalEElH0pxC3M7E1tNJ1xQC1NJys7greGGQ3uPmRDOnDpz1TpCt/a0cUNt2
	1BXK+wBbSaYLQ=
X-Received: by 2002:a05:622a:138a:b0:4e8:947e:16ef with SMTP id d75a77b69052e-4e89d265f9fmr131268661cf.21.1760874664671;
        Sun, 19 Oct 2025 04:51:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgCwcuy4yEvCapeP0Dbyy4Hf4Bworm1xv+SK2OWkHb6v+nDIhLoR9n9zwArGAv5qtBmdl5lA==
X-Received: by 2002:a05:622a:138a:b0:4e8:947e:16ef with SMTP id d75a77b69052e-4e89d265f9fmr131268391cf.21.1760874664134;
        Sun, 19 Oct 2025 04:51:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377aa5cb527sm12977911fa.3.2025.10.19.04.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 04:51:02 -0700 (PDT)
Date: Sun, 19 Oct 2025 14:51:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Amit Pundir <amit.pundir@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>,
        Sumit Semwal <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for Pixel 3 and Pixel
 3 XL
Message-ID: <st7oizyyih3fnsi7jgcp47pl7s6n3gz2rdcv7iryftol3bqvxk@buam77hiqnl6>
References: <20251005-pixel-3-v1-0-ab8b85f6133f@ixit.cz>
 <20251005-pixel-3-v1-2-ab8b85f6133f@ixit.cz>
 <n4xims4y5sssqxkchg2tikc7idkzds5ru7ayidcgxdfx77je2d@qo34qucbebnn>
 <a5da8d40-f194-4fed-9118-037bd39ebe2e@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5da8d40-f194-4fed-9118-037bd39ebe2e@ixit.cz>
X-Authority-Analysis: v=2.4 cv=E6LAZKdl c=1 sm=1 tr=0 ts=68f4d0aa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=viK3g_hdjgQu3jI_W3oA:9 a=CjuIK1q_8ugA:10 a=dK5gKXOJidcA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 8dQeHaf24uyivPcsvgJQeaq13C0UPzny
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMiBTYWx0ZWRfXywfp1Me32uYQ
 9E1/IhyI7j7wA7N9V5469z25vV8YZvL0wdSwEXKhrV+A6isK0av7eLj1uJzEF8ElVcoIQRo5GI9
 2jQtlxgeFrZm68tZw9g/X9N60cTUr/8bHMYZUvzg2azJQaYB2bIv9jJ87Wvtc6xsJ49eyuEHR+3
 /Ap2ytGLpEXv4t1/vJW++PeAFbffInn61gpRpNAUdC4iIFwyG7ydZ3k/yyaImheKIRcwLwi27V9
 INMAehB0WSnXkqGiJ/A+xtOyPHczfx7xAVsCGBnqgPR78jz8r1cAbGwSIcKM+aKiGOyvya5JR/t
 UtnpCYQBf3fOsIkdhSnVt9b/RUPzYrm2ER+BRbv4sGfiBevHzOLjp+8X2AV2uyU5sJj6Vr3Ti5e
 uSSTasKFSPlGaUl2GcFUsa7unK+EyA==
X-Proofpoint-GUID: 8dQeHaf24uyivPcsvgJQeaq13C0UPzny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180002

On Fri, Oct 17, 2025 at 06:59:14PM +0200, David Heidelberg wrote:
> On 06/10/2025 00:03, Dmitry Baryshkov wrote:
> > On Sun, Oct 05, 2025 at 03:16:29PM +0200, David Heidelberg via B4 Relay wrote:
> > > From: David Heidelberg <david@ixit.cz>
> > > 
> > > This adds initial device tree support for the following phones:
> > > 
> > >   - Google Pixel 3 (blueline)
> > >   - Google Pixel 3 XL (crosshatch)
> > 
> > Great to finally see it being submitted!
> > 
> > > 
> > > Both phone boards use the same identifiers and differ only slightly
> > > in their connected peripherals.
> > > 
> > > Supported functionality includes:
> > >   - Debug UART
> > >   - UFS
> > >   - Charger
> > >   - USB-C (peripheral mode)
> > >   - Display (Pixel 3 only)
> > 
> > No remoteprocs / IPA / GPU / Venus / WiFi / BT? The firmware is
> > accessible to download from Google and it can be further repackaged (but
> > not redistributed). See [1], [2].
> > 
> > The phones share all firmware except for the bdwlan, so hopefully you
> > can add 'Google/blueline/foo.mbn' to the common file.
> 
> Would it be acceptable to use path format qcom/sdm845/$codename/ e.g.
> qcom/sdm845/blueline as it's used elsewhere?

We have settled on qcom/SoC/Vendor/device/ long ago. Could you please
follow? All upstream Qualcomm devices follow this approach.

bdwlan should be sent to ath10k ML:
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html

> As I'm looking at the Google scripts, I assume both blueline/crosshatch use
> same firmware (which makes sense, as only the battery and display is
> different).
> 
> David
> 

-- 
With best wishes
Dmitry

