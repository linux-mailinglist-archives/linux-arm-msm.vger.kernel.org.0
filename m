Return-Path: <linux-arm-msm+bounces-59326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A047AC34CF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 15:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BDF23B63F7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 13:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5F715E97;
	Sun, 25 May 2025 13:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OLgpCq28"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F57E1F4174
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 13:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748178735; cv=none; b=ACEu59OFW56p5TMyZyaLuXvHst/6/Y/C1YIgSS4gju9/Q3qMVmzONbWP6NVMpqSicTw98PBw6tGzL3VHKP7gRshjtXeryMW6fFcC2aHq/kWdYOYrv8NLLxFLszFZWC9IW9z1YtRh4rFB9wPGY+7NtvOm8oGqzan8irl19z7E8xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748178735; c=relaxed/simple;
	bh=9afdt9XquDSwp/1PeoneJpIywM3KCPpFlvrwSvjQxAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqbRb0pbqdhRwIRGdTXi704oMiWPQXLBZi7VfJ8Q8QO8RRdaFgr9XteIf2udUHH23+2BdQx1XepdAxXcZmplPuTWeQ1O4lpyRQCSQ9mIkWWpb6CJpyZPGav/U1/5CBhYIpKYWnqyuroFP127rc0ILnFoKIJXEsemV/8cTJr0dcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLgpCq28; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54P9K2Ll029643
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 13:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lWdWTxtQQCsM3ToQIOThbNHc
	7ZxqMbOaTeWQgLNVDZ8=; b=OLgpCq286nT5LTrCcjWejIklmZqSy6pfIv+FYXFd
	ekPP1/9kOX7Deh1hBv74x8jn4i8ygDtoW+xqNa0Q0xOhavU9P7TMVkuqlYmJsgMx
	6gqhfPwH88renWLcdaAwC+odxrZlSXCrymuFg/Vnxtc9+O741ofLUfcvTZdw5jN6
	EUCi9AQq7tmf2kgGQPzIcsxRX39/daPDPuZxLUnxf1XMUj//HX6+YDyJNdcEaryM
	G532LE7ntXjnX6+Cu9GFTbktiXaMiWYbf2k9HTiYRrwLyrauuNCc+LiHeSfZyU9s
	0jXz+OPLzpdcN5an8wqpZchQ+G65EjDfPndKMEKXrVTmQA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66w9yh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 13:12:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c955be751aso251795885a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 06:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748178726; x=1748783526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWdWTxtQQCsM3ToQIOThbNHc7ZxqMbOaTeWQgLNVDZ8=;
        b=kcjGGl0auKP5kM0+yBzcDl27TrAJsp1vZkpSBcr3tUU7ICV0AmRIDHnprUo3B99mIZ
         mICYj98kRSVuKAfRzKDVv8XxrO8o7FhB5642IVZYYkc5GsCYAA4P7K+w7O/2aLx5UZAH
         OKxrvsYj7gHjLY1rK5p0pH6Lag/cIa7NbvZ/q5pCQ3NlNUH8HaPVFyBuem9kINvOrej4
         KaFiIgIq1cRc5guAKNIwQcCZ0E1uSzX2kONbqM+lo512iuhFh+opvmyORCSUjM3rp8ws
         G8xdiqEcdWKZWBXhb7JIdeLSapNqE9TQ+xHcixZfA7nzAJpFaJFM4wfdk2l4/oc/qjIe
         VDKg==
X-Forwarded-Encrypted: i=1; AJvYcCVxwN3vUgiALD+Xr1ypuqHR9SqJoY2VAghsYsUT2zdE7VG7KCw8db0sCQbOrwcKN0QKNwk9iTCVWkVuy1+j@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5pOfp2S8PVO643DQm+kKCAJlTVHALresPhMYb7So5cROj/nfB
	d3pTRE7Z0OQxLRh7PY/qmT1/7+BJIlbt1iEArLwr1tzge2jITz7WUI4lNW7GGbbqSehnJdIdIvv
	PHT//3btsHw7uqhLvT9mPAq/H2zBU2p2KIoPyLjrzThu1Ut2QSEUkGqBuLvNMxiFCHLiq
X-Gm-Gg: ASbGncu1cSXR0MnCLlkNZ9j5HJ6wr7Q/uKjDa0bAlruX3iwi3IMQxXo1FMDmwoK2B4w
	MN7p5f5CCGbPYfDEdKCO7lYS+rX+ZTvK9eR2MGwdTiZLFedWhvkDbHPiVupZyd2RYcHyP6Iw14I
	PUSUPapFX3Q6sihc9HXIW/sGtCiunglf005dOEjY59SQObeBWMI6KVxWc4fDPLNajw08pIA+s+O
	G6ocLAF/qpXf4GMcqeBB7Peb39md2BCXdZFg2NM0MjDcs+Ijf04hkKxsbXoAdPiuhsEADSxRrT2
	IcxF5V9Za2tKu/PaO7dhO+KU4TnQ5Yl9sRq+PmUm6N/cecND7DF8NIUKjGV3a3eZQYoAFzFbkic
	=
X-Received: by 2002:a05:620a:2a07:b0:7ce:d351:4688 with SMTP id af79cd13be357-7ceecb8d0b2mr832716585a.7.1748178725947;
        Sun, 25 May 2025 06:12:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGox5XUTq0Y+PQEwqub3dPrfJg6yHxT2mMhtNWUJEHc7a5Xl35HgZXjOF0i2CAt3xfr+iGaRQ==
X-Received: by 2002:a05:620a:2a07:b0:7ce:d351:4688 with SMTP id af79cd13be357-7ceecb8d0b2mr832713685a.7.1748178725611;
        Sun, 25 May 2025 06:12:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017f2esm4678580e87.122.2025.05.25.06.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 06:12:04 -0700 (PDT)
Date: Sun, 25 May 2025 16:12:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] firmware: qcom: scm: Allow QSEECOM on Dell Latitude
 7455
Message-ID: <ipliw7uuuah25xyylecd5qgk6qehgcswusem4cl4i4y4jhjwyv@7dk6glqklyrt>
References: <20250525095341.12462-2-val@packett.cool>
 <20250525095341.12462-5-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250525095341.12462-5-val@packett.cool>
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=68331726 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=jijYm72WxJQj5CxCk9kA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=kKjS7uazQ_Tg1-MhlKGG:22
X-Proofpoint-ORIG-GUID: ycowhHVJ5s_4OXMNVr6HB5MlHiBgjvvH
X-Proofpoint-GUID: ycowhHVJ5s_4OXMNVr6HB5MlHiBgjvvH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDEyMiBTYWx0ZWRfX6DyoDt5/1p5W
 zFGwNkIdZZKyyVc/XZbEUXVwT5UWVwAIjLmfTPnQ4xJS012S/C+dSSLOsiU9dmGZWcN+cL1o4T5
 cSZPja1JnocSf13JwMq2WoUYrRrWmLy/YhihLiWP/dBtAw5k8dtiv9HzJ98mIhuBlw8b2NLcU8N
 X6zv4rDDRyQ2jDvJM4G0vwj7PagssfJlInQ1h7IbMP2A9FsE5P7bqD98wYZh9oWSqc54iXqBLLE
 YErvJQrYIdK2elirnmgrjX5JbJ5PBOU3rAniNDr5taI1dqyVJE1io924z0fBp6w+bY0BdoKMM7+
 1Hb/JFbdvHQuP9PBN55Qr8vdYRKJovXgwTciU4ZtAHVvvj5/M5jBLA+mcG3a/f22BPlgrY8K9TS
 avQhLKmLWmBFlQAdWtUOBkDx+YIV5kI5KUGeJxZH2VbwE23snsSNZC3yX7DeeVDK0gU1yglJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505250122

On Sun, May 25, 2025 at 06:53:35AM -0300, Val Packett wrote:
> Allow this machine to access efivars through qseecom/uefisecapp.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

