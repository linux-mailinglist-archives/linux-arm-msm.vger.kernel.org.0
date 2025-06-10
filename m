Return-Path: <linux-arm-msm+bounces-60763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 100F1AD349E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 13:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D675C3A9AA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 11:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B26A28DF37;
	Tue, 10 Jun 2025 11:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzjaTMyk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7A128C2C2
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553825; cv=none; b=gqvKsQza7t/imN/XkoH/vXG3UGDKeeFmmvT5AwLTaOgq4L/X91lDSUzsNK1WR/6n0hj0nXIF741vqnV1byw9xk22S42KCe9+wIRHtVI2Qs5AkpKzaT1HjWUodAeE3uIhLjZooJaKTt0KGnVcJ53buuTDm78mVnxNGqcdy1sgloA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553825; c=relaxed/simple;
	bh=r4xPlsKaOiVx9NhoF1ofQO6ILdX1exjn3Eiq1JZUm44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NaFcn0J+FWy0QDvPVum51mgK9ZDosndfuvRLDo63hgpnG7moY1PBpf0BEOLnJ4Q1n1rL5wB/BCDWL79iIu74fcp/fCv4wxyOjkT7H6puHJCsTefyesL+yCEtD1+Z9261KVPBOj0/5+bqHCxj1G341v/l3ymQPwX/HEhV38UldDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzjaTMyk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AADD50011182
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hpn/4tPOJNmUak+UQiHyAmjZ
	rWIWVGOHrxMVzXs3PzU=; b=bzjaTMykLG9/dqIxVoTS8I8xZkxlVSxASHjQY0Ki
	DkZ6JRTnFZNakFEVYHaIZUXcH5l5bv1qSht6YxuWMsld9i/YCRnvlw1BA9bEXhfj
	RA1E67McNeZ0EeOZkII/DKRAcQnbphqo59YyRVgcf/w6HO65KDxCIlLB4ytqTaGm
	yap4p0p+0STBaLTWXph8xGkQFalZ1GlUNLiv9RBO4x6OHTRDHYZiQJrcdQ55wbQc
	cgW82MmAmVXnG6cr71QgzJzqI9hcp7GZi/F8h/WgJ/8XjXR+uEAAwyUhaAC7R78r
	ZEqgznH0fXmsJzK2YP1oPWlJkJk+kxlLilEQP1ctGNQ4Rg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrh85j6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:10:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5d608e703so1029118685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 04:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749553822; x=1750158622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpn/4tPOJNmUak+UQiHyAmjZrWIWVGOHrxMVzXs3PzU=;
        b=KSPT0kP+L9lxbYT0Z1QnsP4cdIy25MYFenA0LbWld6CbkuBgtNyqMAgzzMZOJ7lW4S
         tN2bRShb3jBqvnC1VedhTcv85ImPu3wLQaodYBPpDfPYkAAz2V75SX0fjhLpqL36YYRE
         Y3ZMZZVhu3jijUi9EA7XgP4H4dj6t0KupEh1Pfk2gNtKyNM+8MU6D0f6BkULqU3VCezK
         pLrYAKwj2I0uZ712MPtOHlGRm48XRuaBboNJ9VEzMoZ0UFWPdz38FD81Y0JinB+JQLDn
         GDcrjYLKFEBZCtsYjOveRbV6vrL14YpYpQ09ios/hVmExfpY4xJc8KRiOVxDSnF/FKBI
         C9YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmKR296jaxpfQVH6rgBC53+wg1ZeC+Q7YTCcjN6tggMPG6w2eiqLW5XouuMQvu782DcEOxeRoLqqEKdafF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx98zNps3j7MSXmbwVh5P9iOmTso0DRTyuzT5ouQWpccmi+etYJ
	5VLtNWxbnDy1VYJObFgQmwg54fTMejTRFRv5f6BqKD5cR4haepnEIkQDYyqs9+QsH5+V/oJZNm7
	Z46LKFplgZSzZOVmnjI0BFpRc5YbY4unCevLvO4mtRdy7AlN7rFbdvhfnIja3KliO+iq6
X-Gm-Gg: ASbGnctczQXHXyCR7mRKZf44GGO5eBRIsj9IYLgkgp9ZbGRAZt14k/yofZlmodjbOvA
	J8qQCLyZ6sKvysUd9D75t7EqetwuZxjeefvcQ4pLe69EiA8hHcEq99/VXy/K1ypJww9N4BTum7m
	hRWDKDvlXfcyyV5+ENW/196BooQ0h8pJbCv3e6NhziN+oKk7CpLfeshCoC4Yk6vKilg4KI9HCTU
	U24NFr9vQ1u4Cm2yZTK/8bCAam1dMY8cisold1dhVkRZo07CfNMj0PL5jpNAjTrdddOGsv0+Auz
	pXg+o2Uixh/12uGgsr3TLrpzEkKQ63E8UG7mVwKrAhcooK/u4Xghn3owWvZJ3h3N3OYko53T7RM
	ErwxR7WuDYUpxEhV50lsoYITCFkBr2gvdJcI=
X-Received: by 2002:a05:620a:198e:b0:7c5:5670:bd6f with SMTP id af79cd13be357-7d2299025edmr2630761185a.53.1749553822357;
        Tue, 10 Jun 2025 04:10:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuXICBhdrwFurksQR6OS+y4QHN0UrTWRMmZU5j8Di3gdH7KR6uSaZW6QrdFBs18kU8wa1rVA==
X-Received: by 2002:a05:620a:198e:b0:7c5:5670:bd6f with SMTP id af79cd13be357-7d2299025edmr2630757285a.53.1749553821987;
        Tue, 10 Jun 2025 04:10:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d00c0sm1512628e87.22.2025.06.10.04.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:10:21 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:10:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: sm8450: Enable retention for usb controller
 gdsc
Message-ID: <20250610111019.osnrknvff7tlvrfz@umbar.lan>
References: <20250610092253.2998351-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610092253.2998351-1-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=6848129f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1kStAPyy7fiUOHsjtOQA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: W3-ZllCJk_WbTNOv2uVU69XWaBDPeVJM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4NiBTYWx0ZWRfX3LeupMlbCnpI
 T5hxoGlwoGlVL3ZWqOjsSnqQ8tA0gIkG6eaX5oQwXAtPaRC/7FusByhnGtYdtAeDH6s1/VqqW61
 lAOAaw1zFycFKM0F5PVKQpTRI1n74AFC9t6dGKz35+VRJ8Fmi7LbasPWwbebETY7kgy84wKPNXE
 kMmFZzDV9K/RYmMyfNKPEYlp2odom0eDfT/mtWj/rPmkc6CQAKl3sTkcKiq3M8F2Hvb72aeKoDJ
 s7KoSwHSUbS5GIGQWjgEaeDL0yNj2Uvb96cO4yoaIgirksgQcYGGZPXrk5XP2gLATRsXkXiRbct
 4dwRPTc9guZyzKAXlWe4SIGs+F6QHlv3NDjeKEpUobOKKUWGHQIY3TYZnlZ7TnWLEmwii0sd0CT
 U+TlJ1rbrWoIoRwjBzOqhod8CeFHIs/bEuyJtLJ74lRuQ3voCrYZJWlYk7rmotmWnlAOycx5
X-Proofpoint-GUID: W3-ZllCJk_WbTNOv2uVU69XWaBDPeVJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100086

On Tue, Jun 10, 2025 at 02:52:53PM +0530, Krishna Kurapati wrote:
> When USB controller enters runtime suspend while operating in host
> mode, then wakeup because of cable disconnect or a button press of
> a headset causes the following kind of errors:
> 
> Error after button press on a connected headset :
> 
> [  355.309260] usb 1-1: reset full-speed USB device number 2 using xhci-hcd
> [  355.725844] usb 1-1: device not accepting address 2, error -108
> 
> Error on removal of headset device from usb port:
> 
> [  157.563136] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402
> ,iova=0xd65504710, fsynr=0x100011, cbfrsynra=0x0, cb=6
> [  157.574842] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF],
> SID=0x0
> [  157.582181] arm-smmu 15000000.iommu: FSYNR0 = 00100011 [S1CBNDX=16 WNR
> PLVL=1]
> [  157.589610] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
> [  157.596197] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
> 
> Enabling retention on usb controller GDSC fixes the above issues.

Could you please clarify, if there are other platforms which need this
change? Is there a chance of switching all of them in one patch set?

> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> 
> Note:
> The above mentioned issues pop up after I enabled runtime suspend after
> applying [1].
> [1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/
> 
>  drivers/clk/qcom/gcc-sm8450.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
> index 65d7d52bce03..f94da4a1c921 100644
> --- a/drivers/clk/qcom/gcc-sm8450.c
> +++ b/drivers/clk/qcom/gcc-sm8450.c
> @@ -3141,7 +3141,7 @@ static struct gdsc usb30_prim_gdsc = {
>  	.pd = {
>  		.name = "usb30_prim_gdsc",
>  	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>  };
>  
>  static struct clk_regmap *gcc_sm8450_clocks[] = {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

