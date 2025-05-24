Return-Path: <linux-arm-msm+bounces-59284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A50A1AC2EEC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 12:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95D4DA212BA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 10:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C62B1C5486;
	Sat, 24 May 2025 10:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SnSmAJoN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A21196C7C
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 10:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748082937; cv=none; b=l+Ormo7uMPKQFD4T9sgx59gsJS+hIa3/Fcb6S7xbXiKzvcH8zVHd+kMFl9gCi8kYRN658+a2uYi+bF5Q4Pfnur+jDps/IoJzBvi4PZdcwu/BceR0AhFKVPKN3wCT0Q8y/EG4mzyTyAdRPJoy/UGhIuDp6bkwJhBBoZsKjvlzXGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748082937; c=relaxed/simple;
	bh=OZhl91a07hOgsA4p0hKb14Ewboy7ZEblmiWBpURg4R0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCiqhuvwM3CIBh3c/8OzA1qDA5CmN3o29eiWjr9xrmGYCzln0D+SEg4BZ96Q3t1H7+4RghBH6CuAY+swttGozyVBhDuiVidpITHemtTON9YRmRNqD6QRiEOtf9kYrsmPSYe+BUHhxBLw91CG1xfAO6iH37yAKE0S1OH7BEugstQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnSmAJoN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O9hTIc012075
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 10:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s910d4t3uAcCDBtNH1k1u5wo
	FuAjdXlwK36avK/w0QE=; b=SnSmAJoNNsjvO6NakI9HPPKSqEqdridWQV5jIiC2
	ORl5w7Q1iF8vf4CXqpri7jEMa2iXqduQxmH0c4hRVci49LPmSPhWsDQO+qME/EBj
	IoXOuyQiPOZovAGKmeobFqbmHySlpsYdqjiWheCOyMA3wCIc9gbi60rDOeJzH1Xx
	EmtoSbUOJx9gGIErhfnn6AfgnhAXUPVbbzMHjkFNjLAm1Q80BEN8QTay3kHgcV4v
	awXnnKhDVlrtkuOKkRYNJ9Ek50eaJgX7DSqbZTwScIduGHDDqYheiL4n7C9sju4Y
	IULBTLKS2ldAmkYzGnD5+nUhaWhmWOyZBXNp5upfhnGYYg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3thrq3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 10:35:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e28d0cc0so110361785a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 03:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748082933; x=1748687733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s910d4t3uAcCDBtNH1k1u5woFuAjdXlwK36avK/w0QE=;
        b=prePlCAnObJVH/kTpkuQXzryxHNKoiTyElNUirxSQwYV2bUGHkGpP2xz0b7SFhaJ7b
         1R+C0fhL2696dSp7eAjKvwzrdvbuDLRchu1nssZnElWAtWkQYvvL6JYn1jv/8AEBq1kT
         4HS3iaJrKzVldL9Jqs8vsHARIzAb1mV+hUb2itqkOX0s1zrl6NM2OhCAclIYNAQihuUN
         IG4RVoq4ZiXHyae6L9tnbV6GCcNsrXy3pxVrWVPANNNYDSDMgeZdw1E6L8FqQWwxYKkW
         JFBYx3RAVGsd6hv5Yi24AV3K4Td4SfuwOX6/LAqP+jt3ORGAhTROBjIWaMVIYyhy4h7f
         TpCA==
X-Forwarded-Encrypted: i=1; AJvYcCVyMpZLA51XGSE5Rz1Gw2TBko6OJNpnHHkF5BGzB1wDnaYuTgmTm1lHiFIjvjut/Nj1VfJDmKm1fBcIvN0P@vger.kernel.org
X-Gm-Message-State: AOJu0YyjZukDBBnQGARduIM4VYUovF0fCh2rX8MYSNanemFYg+L1P4yP
	dFuOBejpzhwJ7L4WfDGe8kh6qrN3MxmjJkkmg8IorVUAm9Nk02kKmjtgdO68mSXnFE1cpCls9Jg
	Ai9t+6A4A+ArzYrtHI9YGtsm9TCFZJpV9wGyjLRY8HVF1sWiUN0qF3QutinHKpYoKqD+t
X-Gm-Gg: ASbGncshxTJS3da61vMeju8K/luWO1qnELgnjVN2ag4L/EZ6WHqY0GgfOzgY4lpnUSd
	nUD3mKA3zaRgf/VV7wenhcsR2/tSaaDqyVtJkoNxFuIYx00fzj5gs8/pR+L8y00uQEo2ER+EEt2
	m70T6x65qQAzfnfMQSPjMk/BkR6KGoEX3XQOBGDXzET9bXqyrM25s0SbDPgqB8HkzsVsUQTHKLQ
	1IMM7qordTFfzI4gNxSM4DSXb5WkUBW/TpBMXhzNlU7WvwJVTdSFd/jqXqnpkY0aaiP8gacitpZ
	o/TpHKiyZChQCrd1P04ltF70UdSth5t2ittEOoMOyDoQm4s4b1TZkVTWorL9J7L234yc9y/dbX4
	=
X-Received: by 2002:a05:620a:a488:b0:7ce:ed86:3c53 with SMTP id af79cd13be357-7ceed863eaemr218620085a.29.1748082933587;
        Sat, 24 May 2025 03:35:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF54RXqasfEVT4XH9aPqai1f84axB6EddNRJRvq+B+ZJJBfE+JCiW7NP+emGbbWXvQuq8YXA==
X-Received: by 2002:a05:620a:a488:b0:7ce:ed86:3c53 with SMTP id af79cd13be357-7ceed863eaemr218617985a.29.1748082933254;
        Sat, 24 May 2025 03:35:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2fbf4sm4280072e87.70.2025.05.24.03.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 03:35:31 -0700 (PDT)
Date: Sat, 24 May 2025 13:35:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/6] firmware: qcom: scm: Allow QSEECOM on Lenovo
 Thinkbook 16
Message-ID: <5dkielul5ere6rgzog3kch2gtccejrrom5obujnfm7uop3czcz@kyppckmrlqny>
References: <20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz>
 <20250524-tb16-dt-v3-4-17e26d935e73@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-tb16-dt-v3-4-17e26d935e73@oldschoolsolutions.biz>
X-Proofpoint-ORIG-GUID: 3gfzzZ8Fntb_YOfbf0v4I3TyXH7NOIqu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDA5NiBTYWx0ZWRfXyLz9WZvDsjul
 Ks7GV9AzSjXtUS1iLXYXrc0M6FwCbwcpD1J2dkzdsYoBElHopEbbKOnAJje4SJpYTve+pTWgmcx
 E2mamaM5yxtPzoEVju6LTN2Y1iYMMCyGRrdr0h9322Z8gq1HEhU5oRoLtSg2nVcV2xox516sDhn
 EWdWERKNz6x+DhU1xsNFcRnaLqPLWbKkB/ISSs9Qww06YXipDFNf1vM7PJ7jgWcq7S0gu4Q8JNv
 s0YZ/oVXtP1O6k4qm6c0oZPlTb0s58uEHu2mgUkJJ0IqJMmh9STvzujtFklp+bZGAiAX81m9X6Z
 NCpv60Zc5SwtK6pV2doIlmVS+dBl7D1HqPlp5mZUEZiinjSKv1MRRE54hB7OCdzocC9u6twXAy9
 gf3cPanE+SYXcemu3bDPT8XXIo/IbmK0SiL1qMgBQFKfsz2tkiJWavtRVd+WK/fKkwhLjKO/
X-Authority-Analysis: v=2.4 cv=e94GSbp/ c=1 sm=1 tr=0 ts=6831a0f6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=GTs9I9JaY0s41QFpxpIA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: 3gfzzZ8Fntb_YOfbf0v4I3TyXH7NOIqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=844 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505240096

On Sat, May 24, 2025 at 11:19:11AM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Allow particular machine accessing eg. efivars.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

