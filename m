Return-Path: <linux-arm-msm+bounces-58462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A7BABBF40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 15:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE0AF188A670
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 13:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF39198845;
	Mon, 19 May 2025 13:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1NtbhJ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD4619B3CB
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661660; cv=none; b=ua2P4pH7JAQE1bAPCLbiLj/bA1tRD9OBTCazb0jPLA5+qEgC1asg8kS++38bVCSVkCQVwE0fB6S8EmfxhyAE7BUzjrXuU1INBUF0Ti8ARSZieq+J4/SOqYFudRptlsNSmKBYhSnLvYFiJMPDFfbSPyOxH+ffELsFKY7wejW0nsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661660; c=relaxed/simple;
	bh=kB4yL39ixK2E/W6GBCz5xywTTmFgLjwXfZpiDkAKENE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSGaDH9cXWHofJLQR5gxab60PMDQXZwabgjIZOPT0DuK6WStuhzZLe2H3xHFcqbyvCbwMSPaNjiKaI6e4KbNzwL6aripA4ORR1u3GVn6gczYn9dLWHVrieDN3eO+k9nZiGQuLVBajmVXPVmSDh9J/Q2/AdVsfTXuIxWqb0KGb80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1NtbhJ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9HDm1003280
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 13:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xpmZsdGXKdiDzFuBCCBP+7+8
	PxMeQZauDmsiloV3TR8=; b=O1NtbhJ/GamIerrMd57QzpuD9042qlBgDo7/1kzz
	+CansZR7/m8qmUEUuG4zbrstnGg2HTZoxpq6wuwePFsUmhOUJgkADAaiovVCHgm4
	AKOM9yvbv96aITgFZ1jtoUgxanO32fQjl8ahQ1LqR5wdRwoS0uW0S1cB/cpBLW/d
	QXmZJdyDxnzxjTecFkYNyGixuQPIngctCCt8dcouIKi6SREUaR5w/VQjfFlrzt9Y
	JsQmNG5m41PiDS2jiwnBFhjDSjQ3gZjBWReKWJn96tPmcLpNHPXcytBURly3Gphg
	7uvK141Fv/8rDGkLT0EJVQt0tsvAlwkhrXXQ/8YUtw4+Og==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkymkf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 13:34:18 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3dbc890aa0bso31804205ab.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 06:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747661657; x=1748266457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpmZsdGXKdiDzFuBCCBP+7+8PxMeQZauDmsiloV3TR8=;
        b=c+uEiWdl6r8Gt/1fUIF+kFpmVgLn4ZgdrRrfD7pqFWeu2uxPozdr4PH8NzN6HQc8Su
         vsaFQMJCqjIHec2Ks9JObJCqFkrwykc9ELZoSFeDJK+d8VLa9jCqWX6HEjzNzFBWW5Ml
         0iMCpoTYCfTeMIfEzGDvtoPYLIHpu8ZxLDMOzINpHRL7fDU8lfIwM42+DOabnbOxnzte
         g6q+SUyOI9PIH/aNQslB6a0/20e/lb0XvhmjkGnvbKmnGl+p8hOAga88kgid91TXgU21
         8RS4/Cz5JUdZS/3/IcOu7fQ/XqRNaIuxZ0jOllqHNYgMd0/j2/BgS4NXilicAxPl58Zw
         OlAw==
X-Forwarded-Encrypted: i=1; AJvYcCX4b8sJLS+IA3lfHNWyx1ZZRgzzdKYEnmrjHX3hxDDWeVbVRzrLBLtvB+iea9eStiv22gLgl+a1SB9sLnye@vger.kernel.org
X-Gm-Message-State: AOJu0YwzsO1dAolXy1RTtCNdF2X5H9zQvYe6I+QSycRcktDFzXzQVW9k
	XIUrXigDL9b1AAWwVPVG8APzE0GSUAiPinHCW1eNiRXYr2ARQcXq1YjAV1qfZHX2x1fBEA2fni4
	vogvxa1rw6AQpDcmhDPx1j1SiYlH8uYtY6Gb61Y/yDuOm+rY2jjbJXWxiUXXo+GGLcvnk
X-Gm-Gg: ASbGnctMhznLlmf7b8d73fiv+8xqJxjiH30c8fNPmwwrgHg/zYLlELeeuKzuGx1JJcM
	8U63BVYmS46aysYUxu9hbcQYhWae4ChjxD/qQipnnM9NyH5VFFDWamC98YGsqY3UXysSJEqwjx4
	soqFx/8t0LuIZtqvxHJf89H1xj751p5exTTVcORgUdEw373mvyIRzIi2tyY+86IFMHOZm3DnT8J
	PobWxdUzI4AS81g0FfdDsq5V3oF3ELbpX7gfJiGjsY/jtsaqfuJM7gWREu9h+7a1dwrqi9rRYQo
	eAQkmYJUhbxPOxTpA7pXtxESRFdbj9Zia1/fGiIXFCHTdqiGIeF7Pi6bnn1t+eCbJbSaa7OeaaY
	=
X-Received: by 2002:a05:6e02:2407:b0:3d6:cd54:ba53 with SMTP id e9e14a558f8ab-3db857c0338mr107675135ab.22.1747661657366;
        Mon, 19 May 2025 06:34:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcs1xC9T+Wm6LLSGkClHv/8oharNk5wTXGyZpzjQtEoc2B8cCPX68CXbbZPZLfmwEF7MSPLQ==
X-Received: by 2002:a05:6e02:2407:b0:3d6:cd54:ba53 with SMTP id e9e14a558f8ab-3db857c0338mr107674705ab.22.1747661656964;
        Mon, 19 May 2025 06:34:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e701831bsm1869971e87.156.2025.05.19.06.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:34:16 -0700 (PDT)
Date: Mon, 19 May 2025 16:34:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
Message-ID: <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
 <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
X-Proofpoint-GUID: c1zjNTmnEVTa0_BdEkhxOOH3Sglmuagn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEyNiBTYWx0ZWRfXx8e09erTXEe7
 W90KZXFu96aBGEf9IfXJWJpI2GKTir+lSFUh7EmYJt1uwc7jkeep0QhAkKhu8T88prN743NHto1
 CQJtUz5IPQfRArcmtDVtdbdSnFmDPfbpOHpdKR2Z5XHucyqu+zYHDfxJps4Kq0t7BTgS5vjF7qQ
 mGpe0D8XNBQJe+CFitUjgWU/XThffg0fr6azv+dwntje65HYJwcuUXj+EJB+VdY87w8o4QD/olr
 7FSd7QmFF/Ak2Exm8Frk85jlKGOvdbH3gYot5J7P17vSJXMo0Y+m4tXGnusCncTLFPjrRXQg9l9
 e4oj13BQUOpUbJ5RfvqfDyVQipa10EE9Nis5TpcEKQYqjh4LMT38p0UwV/UQEz0EShkqUBoONnP
 JLRzOH42zh62t8xZEd27nn5bZpVHO+Vca+0PqMNQXHyy7A1d47IOiOFNXeP+ALLXB8tGbOA6
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682b335a cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jo6cr0NhVVvRSACVVboA:9
 a=CjuIK1q_8ugA:10 a=HaQ4K6lYObfyUnnIi04v:22
X-Proofpoint-ORIG-GUID: c1zjNTmnEVTa0_BdEkhxOOH3Sglmuagn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190126

On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
> 
> 
> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
> > On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
> >> User request for remote heap allocation is supported using ioctl
> >> interface but support for unmap is missing. This could result in
> >> memory leak issues. Add unmap user request support for remote heap.
> > Can this memory be in use by the remote proc?
> Remote heap allocation request is only intended for audioPD. Other PDs
> running on DSP are not intended to use this request.

'Intended'. That's fine. I asked a different question: _can_ it be in
use? What happens if userspace by mistake tries to unmap memory too
early? Or if it happens intentionally, at some specific time during
work.

> >
> >> Fixes: 532ad70c6d449 ("misc: fastrpc: Add mmap request assigning for static PD pool")
> >> Cc: stable@kernel.org
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 62 ++++++++++++++++++++++++++++++++++--------
> >>  1 file changed, 51 insertions(+), 11 deletions(-)
> >>
> 

-- 
With best wishes
Dmitry

