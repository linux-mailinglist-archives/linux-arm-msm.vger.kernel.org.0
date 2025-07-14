Return-Path: <linux-arm-msm+bounces-64812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7502B03EA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 14:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0D2A1894462
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 12:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C08C24728F;
	Mon, 14 Jul 2025 12:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iV0HXkOD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46B824729A
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 12:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752496045; cv=none; b=pW0rdQTW/uUNcC88rGPzT4f+3WcmeTqgSqjjkPiMcVU1eByZKMtRbu6W/exg1mY08TTcNtm4pwyMYexpTQOdloRfZ/DCsh02VHXbn4nn48q9N8Mo0djQsJkIP6jcAQJu8yJG1KXYzkkiXA3wmlTXaaMwXQwI2xRkH3eIpdvptxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752496045; c=relaxed/simple;
	bh=1L6R4wxjetxb/pWZk2A2ku+TcEAJsE2+TTcPhlpd8j8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PS2GH1KMr60gal8Nnn2Q409LN8Ui8coN2Mst9VAnfdc3dKUOSEGAYZ7JjKjmpuxTbOx7tMdVheK/xQla6znR+nGOZPuCAlF/yNYicNM76J+FtaJ6yIRKCNBvud6yn3GBSsR+Ql8tZIHdd9SHFQD4MYYdI8ly5cyCOrN5hOOpu6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iV0HXkOD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EA00fV011832
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 12:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6EgrQ6Evaclca/mv/a+/ccLx
	hAtqa936HRQUO/m+epI=; b=iV0HXkOD2VYKwXwBtVQRczeh4oiytnh9ytNquBSz
	x7n0Yh8bvnNPuGZPy28cMQ0sug9hN77RWUK6i7uHw6hEy9lwrEHYyVxjgxB+J1BA
	3HhiSlTLoetbOSZBja+g2C/hRrgykzfBtXgLb85ncyMlHhJ8gnRJQ8lA8rFE7DDf
	oFfOKQnx76lcX7jMZQ4dW5gV68AlN9sXSJW48UnR3unpSjC2gh9ip7TRceFaUNB+
	s/f+R7eomha1r4I5VpPkpfG9sJrvU5wms/ST0YtOA4SZY+EAtMGQ6s3TnksMubcP
	aFmdqiGz1gFuL6fml9c0XxAzp6hrfKgBC7IOis2uLjDIkA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut4kn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 12:27:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e237c2f4ddso208181085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 05:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752496042; x=1753100842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EgrQ6Evaclca/mv/a+/ccLxhAtqa936HRQUO/m+epI=;
        b=auYfYP+nzQx+tx+5ECw2lZmtnu7jpAq90wAGo4f2a/gUwLIYhWwv6Ey6t055uUPxge
         4kkQFq25sFHeDWqFc7xuLCbkubBQ4FARuHw3YK0XQlWNwN9e4ihN4dUa7wAneadFMP6V
         0bjsqWJ7tyUq7rzJLExB781ixztzcItYPH8YBQunBOrk4HHAGrUUoOz0WnjdOqtwki/3
         dmHpNjbTT59ijhuWjs/qbVQAhXJLRV92sekVnt//bqQR7mdhz/Nbsa18044J5/KJbMCg
         uOKerwVdSH91QUY3OohOFdNTSUDnPOshUxcAzF13J/Qpgez5X7jn/E6xxXVyBFJTFL08
         jvsg==
X-Forwarded-Encrypted: i=1; AJvYcCVidQXEdj7Sk8klDEw2CBpBCgjoE4P6vtaxkM1fOBsIrhjZtGtKSP87m65fRtKJoqCcfR3fyMa7qxYB6wjI@vger.kernel.org
X-Gm-Message-State: AOJu0YykBqn3pvA4mYukxSsVrlI3lHiqx7wEO4K1GQEyVIMVxfGMe7VX
	gYJ9EUwOHffCVAJJPhOpLpgYHfGx8ZloT0+gDQwjQ9zwXZC3yG+g1qDrT8gdlPhmts9RfmyVa8m
	S1N5tLtiB4rT3ISYGG0K6mUy2qATqWDMdJSUNX4dGmEvHr19mIHFANpTbNMKZjbg3V/0F
X-Gm-Gg: ASbGncuA7Xh9VjT53+h/tDchUT7v8GN9GiEfs4zfsr/gIWUtJQ9RU4dgU2gCvY3QrJc
	JJRxOu0YkVv70BRf06tqKzZIWZmd0FyfflniXACUm6+fRGvkn67ojpzve/Q06CfVT6SYYtIlrNl
	KSVYHthRX00qSXpQH7vOpM+7YMQQx1Z9Ni7omSOX9YWrLxd2FlpvLluRFOygS/y9f6W5LJaMTn8
	EYw5yI5lLCRU2AZ+LhiKsbRa6IR86Mj4LVh+LYZ6+jft6VoyZfhWG9uuAjOYbQsmLd5XXIk+ZyB
	1lZ67GvoYKiIN/3mrCu6ZDFPClg03DZxMWlECDUfcmpu1b9wcUCkb+O5UgP77C4uDnhE/tkvM1g
	CSdAKe+IDuFBQvXZckWIahVIJOnK5cKRkV4StOI3FjhQQFkMMuH9X
X-Received: by 2002:a05:620a:3704:b0:7d0:9782:9b05 with SMTP id af79cd13be357-7ddea81b3ccmr2041494785a.25.1752496041900;
        Mon, 14 Jul 2025 05:27:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/DL8IYvSTdgwjCn0jn6ALMNC2tGNJGfPy5aqEL2dhHJ1me0Kau9nI8+0T6UE91J0zx/Y4eQ==
X-Received: by 2002:a05:620a:3704:b0:7d0:9782:9b05 with SMTP id af79cd13be357-7ddea81b3ccmr2041490285a.25.1752496041286;
        Mon, 14 Jul 2025 05:27:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b6b821sm1945844e87.182.2025.07.14.05.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 05:27:20 -0700 (PDT)
Date: Mon, 14 Jul 2025 15:27:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 04/19] drm/msm/dp: replace ST_DISPLAY_OFF with power_on
 in msm_dp_hpd_unplug_handle()
Message-ID: <rmlgjr3fzb7dmnwmthf5bj67wb6fkcksmn3ouchzsvhhgxiv7h@vwcieejcufr7>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-4-33cbac823f34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-hpd-refactor-v1-4-33cbac823f34@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=6874f7aa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=JFUgQLFdXU3b13EZuZoA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uPe2eSxkRWMjo2jk6G__QZUw77rmEtvD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA3MyBTYWx0ZWRfX0pP7fohH8Byo
 ufuPtqz4K7WIITy4WGjw3st5Gp5X7aVJEH9EYW6ZtxH1N/G4GB4hVxKUNm+oucIfzIO/5V4T1x/
 39cQnHyhahhhqk2rNifykClwy7YyoqbN6FPvizvQL6iAEi9eQZexue8ZFtsnZjnkY2QzWFjx+RO
 BomQOx75FULP8G+H85mAX761F/cUbW+6opd+si7EB6QRB+vf5dKGg0nIjnPmG67E7gIRXVPhqlY
 iqLdooSxS8JenM+UM+QxmLO5JMlR7FAJ/n4qZJDlx80EC30qrISZuC7Z9BSDvJriBBHSZ4Ye6R8
 5vZu1g8uDv7yN9s2d41nuXEC/6m15UcjfdK9tV3ESnibB5BKf+Wu29C31W/p8jDXO6cZEMwkUZv
 +qoYrkkw+tB5o6vgR1c1cOxYQBswTR/oM2xTiqs4QXt0SJ8tyCfVCIAhKzcJXH95UXg2q0KH
X-Proofpoint-ORIG-GUID: uPe2eSxkRWMjo2jk6G__QZUw77rmEtvD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=679 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140073

On Fri, Jul 11, 2025 at 05:58:09PM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> msm_dp_hpd_unplug_handle() checks if the display was already disabled and
> if so does not transition to ST_DISCONNECT_PENDING state and goes directly
> to ST_DISCONNECTED. The same result can be achieved with the !power_on
> check.
> 
> Replace ST_DISPLAY_OFF with !power_on to achieve the same outcome.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
> Note: Taken from https://patchwork.freedesktop.org/series/142010/
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Please squash all state-related patches into a single one. It would make
it easier to review and more logical.

-- 
With best wishes
Dmitry

