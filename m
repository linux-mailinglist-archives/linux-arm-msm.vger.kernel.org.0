Return-Path: <linux-arm-msm+bounces-73451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEC4B56D1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 02:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D4A9163A4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 00:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DDB4C97;
	Mon, 15 Sep 2025 00:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FIYNwaEN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC83E4A35
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757894782; cv=none; b=FaknMDrdZ+4Vzabp9bV6e93fekDoOEWMdussn1wSsQ5PPd+dSq32nFbmJ19xts6/JtvK27/h67sbSbM3t39nAJZOIy2oyDwVc54eYl3jyy663g0yWSA1PhGbzreAw+FuCv6s6uhws87dLvMn7iphxoGbAh9aaDTOyjVq19z9KIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757894782; c=relaxed/simple;
	bh=Dqe1Cg5giHlE8FfDPw1ihTTHUPS9HmWkI+UbpNJRTT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVpQIRCcTQgND/T8bce0GMvUTLlqZZvlNmATPK//6ZjiVAnaDiMm7c1iqcILCkn67/Kqtew5Iyry/jHX4qmAkr/KRFXnXcuqrC5w1iHLqSvqjRnpYj1kBsp2nghr2adfZa5MSvhy1xBNLdqWR1eKih3UM0iZ7ooJQsNmY0m4CPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FIYNwaEN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EMULIF009635
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rUWfnCXYMbvlNnNtwmtXfPa3
	/YiLs33rLe2Pfq0TGqI=; b=FIYNwaENPjay8cpa9Q8tvr2UrM6XKJ18/sFEd6tQ
	8Yq96zPOV24iGah4DnF2UCsXQYO9eZtvkPad6Q6eBgATIWg9M0eWOYwvAM/dgCcc
	z9C6DmLd+WrRgNNlkAj3BjLZErAVVE+/FHxfRnCn0CShijIp+qJzVOmJrhSRvkq1
	+YqwYwv07aXuSwH2p57y7iKkeli/2PVWnCcSp1b70kRr9mN/BxYaCw1wV0FBcLtV
	Tmwoo+4Kg8OIjGkQPb+K+eJY/7QcRqTFfTsH0PP3SbKy1wymyZNy/8+STgEQCxKj
	yti1DpSGM2g1DhhsxNsS/nCA83fVT2IMR91u7iJ9iPdJMA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yxkayb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:06:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b78fb758e9so24769841cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 17:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757894773; x=1758499573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUWfnCXYMbvlNnNtwmtXfPa3/YiLs33rLe2Pfq0TGqI=;
        b=KlRL68aInvJid+MAxmJJvYNiMkNEDRSQufx1/aYnzHYcB8ALyyNdz1x4WOIEl0ra/7
         gMekqVhdGmNhDI5pJPhHANQsib5Cb1NTvG7WoJzjkmoz4iqebxf7+WOhUIudjz6VUy+5
         W+YHkaqypTFQRQr1Oc8SmLVpwwMUD6d0DqDwPOxN0lSCAJvg6J2XFtlZYVwcvuUs2DTJ
         r8h9Dwf+cqXcjXeC8o1BWZXXy6j9hvt43sEghscNTAjjl+/mkvpFWASlPyFIGgWH9jv1
         X8RMy9Pw22m+HDYJtFs0QI25yBUjcqai94ROK+PApAvW61+V8oxsvqNPnKr8buPeCbp5
         NGGg==
X-Forwarded-Encrypted: i=1; AJvYcCXsHs9HBJ4IpUUJ1odCIz5tR16JjZAEs0ZcmtLFTpRWshOwInhn3gs7WG/dqsJhzo8/ZUgOZaXqpzaSuWDZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxADr8Pb1OZueAB5RL+4rU7iCOq3JU5S3NISn2QlrGXHwQ5X8rA
	4D9io4Vbi8ae0ylWNIR9seqlUo3ri69ET+f9oaCOK3RKF46s0ct7QT0izVJjnLf5LuhzvxSanyG
	oBQdqQgmv3WCN05KHKj81bhZZ2foBNq0qw7l2C4CJofsWVEDZGLSW8T4rtVT+eObiqKSS
X-Gm-Gg: ASbGncucnoKP7iVbzsQaK/s3AKJDr8VU4+Bpm4sOD9tIagK58PyWYAmuNe172tHjW2v
	7puWaqno+l9m90LPdg73U5ixfh5Cvs3BL6GuGf3F7CjuKuzwtuaAHPX9DT4Hrl5J67YCaixkhO5
	mdbbLQRTWHYZe4sNtCnS2OSVcUpsym5+ZRbWKGsUJohid8Gy6smSt6MZwRKZ3wYV9sIFUpkruZ6
	ZuJJqPGY9kDgRHK/Slc4C03A00X643SJL7fJDmEwJpJMywP9LjtVjQtu/8f4v2XuIiPSl1BqLy+
	AdmHDrxybvXg5T+4SisV6LZjZ83jOBWU9Gk7q2vgno6z1LXGA1QGyhQsUezmyrEUiDKv3TIIDOj
	cGD9Yt1Jbhb3Td060Rp25fRbrJyobalfRCu/XZ1Ag+NZl4v7nrHVp
X-Received: by 2002:a05:622a:1984:b0:4b3:1861:f0d3 with SMTP id d75a77b69052e-4b6346900aemr188109871cf.5.1757894772765;
        Sun, 14 Sep 2025 17:06:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3PRvVn7znJ9Xl7ejGe09TyXRJjYQjtDCuH7AaFTaz9V7/sVQErN8Kn5Nv/AADIuzWW/vSKg==
X-Received: by 2002:a05:622a:1984:b0:4b3:1861:f0d3 with SMTP id d75a77b69052e-4b6346900aemr188109491cf.5.1757894772290;
        Sun, 14 Sep 2025 17:06:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57108354ab0sm2485995e87.152.2025.09.14.17.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 17:06:11 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:06:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-gpio@vger.kernel.org, David Heidelberg <david@ixit.cz>,
        Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>,
        Shinjo Park <peremen@gmail.com>
Subject: Re: [PATCH 3/6] ARM: dts: qcom: msm8960: add I2C nodes for gsbi10
 and gsbi12
Message-ID: <5fai4wijjgka6gb7b7svqrcicq6amn56mhuxqozoozdpv2njhc@miynx5iswfet>
References: <20250915-msm8960-reorder-v1-0-84cadcd7c6e3@smankusors.com>
 <20250915-msm8960-reorder-v1-3-84cadcd7c6e3@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-msm8960-reorder-v1-3-84cadcd7c6e3@smankusors.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyMiBTYWx0ZWRfX6exbiZT+Z4S0
 Gs3CMFnblGYzuqz/56r9VEqv0IaxfLHZ4fFZ9mQGUkokw8e9iO6sY5JOmm9tCiNcpE3+9dVzEdD
 wgzFEhlua0mU3Ka/ay6TCjdpswyMj3BDhmnmhr/DwcY7y4n5IS90+sM7Rclqhm1tkiCjhwfLxGo
 Yvx/Wl8Q5R1dcPWztFFr2wPM4zFTeCEA6t765ITrNnMY/2W7GvtY/RrX1lFXKU9/nNxoyXM+6LU
 0MSs9JVnJaAAB0jX+QyXnOzHj5Y44mz4+Uj9RQXXleJvVsu1pWDcgWOH3+ATIjUBemaONLb+p3W
 xy94ho+5+4nk7fn7w1Hl1f09QaRim77krzuMgagsyq/AhZMw1d4Jfv8aPWSfiBvuuIM39wpbKsg
 DXss9tEM
X-Proofpoint-ORIG-GUID: VYo-UheLUqpqAqvXI6GeTo5vpatXcOgI
X-Authority-Analysis: v=2.4 cv=KfjSsRYD c=1 sm=1 tr=0 ts=68c75875 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8 a=yphT_XpnuJS82ywStm4A:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: VYo-UheLUqpqAqvXI6GeTo5vpatXcOgI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130022

On Sun, Sep 14, 2025 at 06:34:51PM +0000, Antony Kurniawan Soemardi wrote:
> These are present on msm8960 and are required for devices such as the
> Sony Xperia SP, which has NFC wired to gsbi10 and various motion
> sensors wired to gsbi12.
> 
> The nodes are added disabled by default.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 94 ++++++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

