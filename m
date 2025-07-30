Return-Path: <linux-arm-msm+bounces-67199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FB0B1681A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 23:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 521D97A8C7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 21:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7E322156F;
	Wed, 30 Jul 2025 21:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nogoDOgd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C728173
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 21:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753910024; cv=none; b=QjUAbqnX08b3kBYZqmIZXYEFpJKzfO6C7WFujCRxzoQBRro8kIqCDJnX+tyz/zRZ53E5RS4iWbNm1Ds/Yr3ZtoCuQ36fWpnaoSNoNnFPQZdvomzJDydqWVnOkuhZWMtcUFNcA5ZQJGjImlOtyDzTo06+wg0RE0UOaCqXD3Hc+Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753910024; c=relaxed/simple;
	bh=1LcPcxbhZM4yOkaYvP1O9+mZX0u6/JWqhX3oLAYGDfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSzQtaTGLgc3/jVdSB8WDEVtkYSzPW9RjTiGw/q7EntnMAQK3L2ISCMp16HeJhemAN+U+jCcPMwpyHjG66Sk8vppKaXD0vNIROqXowKpqlcFCWRJ/FE7MSZc43JRPCgS2i0eTnlzD2sLQrbhqwJvUVd4f/YK+8QvnvDdLtwoa3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nogoDOgd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbbnW010220
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 21:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fXtpTkNa9ixIqMihCOW6HnG0
	oh1UILRjnqAgqagtS2E=; b=nogoDOgd8yykYGOh+cM0k7HaETFlhODxZGksPPgE
	5DQDp8LJJKMOBbouCRwZixr6XWytKlHOB2jKosoAAd7Mz7eVHTgZQCX7BPhTpZ5g
	3KBKy/I6QhXTrvpiaQFQd35TiRXnjJMaaEGao9KSqk45/GaPj4MBOzH+nRf0UV6C
	xpvV1GYYKkY1dch2GMA53I7jB3gz99irod6ycw3duu8nC6BkJUlZO7O4SAjTC2vP
	xhwm6+eLeP+QGBAVDq3Uw2OMNYoycy6Z2GmWXI5qEE3xSCsC0cCExJ4OF4Sl4sJF
	4yCAv+unYOZCLLHMMXXUILbJfssbx1ePQrVlaML5IwvExw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4860ep2qh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 21:13:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70743a15d33so4103466d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 14:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753910021; x=1754514821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXtpTkNa9ixIqMihCOW6HnG0oh1UILRjnqAgqagtS2E=;
        b=ZQ8yZhlcOJYc9RLfskHYkO635fU7dIFCa7n8kIis31XUuxRQDo1805T0vQJrXC6238
         J5xZ67Y4mqH0F9GxJbV49mRWZMoXZ5ao+mi4QIveoImn5dxR+z8aAX7MxkYApZgZ6ltR
         xwXOccdsXdluNIv08eyvVLSvu9lXcYDIuyYzqdUFdY7CytoxcpGxccGjOAZfY+knb5i5
         MnSXK2JenJqrTkYMhfFHJ02cuZmIHXT6eX72MfT5NTmAkLH3Yhd73TlmWL0hoK97AKJy
         6l1Lcen70RYTr6QSZgnTNS5+yYKIA6yOiN2EFwysizBoTnnfyvbB89RtWigUaVOtNLer
         W+KA==
X-Forwarded-Encrypted: i=1; AJvYcCXPX83C/hR56RgI7vuDHCabR8N49qoYHFqcr7ivP2VV5bjuMyuYqFnJw0m1LeMZr28dpAQthOD9e56+xg90@vger.kernel.org
X-Gm-Message-State: AOJu0YzgrjVwcM8Lnhyl4OeksiOScZSBi2+5hXQEMrqoiN1LezKobM/5
	xAjnDtiSXzTsPS3DBfGkjSLj6JlOHz7eeq8xuswsaObnJj7hMVunMjqbhW/Rqmb8hHmSEdtimFt
	C8KnVgnNlNG8YD9Qmr4KzlClRzpK0mzhjXYh9loGKItOJ6LhHYJDvEszNURtY1Ue/frgZ
X-Gm-Gg: ASbGncvLmt6vWLvl9oKnESA/ctihkjhFOP5JCUX1Xseyi8nSGU2DnKVI1KceB2GviKJ
	8ZxFBVnevjAu1vkHz2B3C1e2CCJX7S9b6Fpd2VAndSnbLUk1zRboGuQHjnKxGQh7aSl7aKcxfeR
	gfbHimk/F6lBjM558McWWa47pWlwAFwm5UY6SS4HZ645AUo5KTrAGdARZ5Van84xJUQ3yNzHnXb
	0TWc+QtszoHYdhjGbD7hgO8tHGwbGz1Ho2diHlRDDFg99Pz3rdEAbjK0frL7LDT7mIokiphsHw/
	CDU2ujip7LHxU5aYrlD4l84NStTpQt1M/rop/pZwADu3MVe+Dh8InakMaiWk7IkDkEbCiUmmycG
	Foxl8rrOZNZeE4cs15vc+z27V2YlnO9tnD+PnJtRYULF7tVJZJFRW
X-Received: by 2002:a05:6214:234e:b0:707:1b24:f305 with SMTP id 6a1803df08f44-70766de7f4cmr84934276d6.18.1753910020782;
        Wed, 30 Jul 2025 14:13:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWB8L182re/bULdoRULiJTw6vJ/ov9hLNcga+nSA0chZ9lErd2CZL8T8na4vtzKQPA8PNdHw==
X-Received: by 2002:a05:6214:234e:b0:707:1b24:f305 with SMTP id 6a1803df08f44-70766de7f4cmr84933856d6.18.1753910020278;
        Wed, 30 Jul 2025 14:13:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332383c7ec5sm60931fa.35.2025.07.30.14.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 14:13:39 -0700 (PDT)
Date: Thu, 31 Jul 2025 00:13:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] soc: qcom: mdt_loader: Deal with zero e_shentsize
Message-ID: <if2ttmi4v7erdlqihsjk73vmzfurkadk7jb7fg5x3zjvns4tpw@ghoglmrjl2vw>
References: <20250730-mdt-loader-shentsize-zero-v1-1-04f43186229c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730-mdt-loader-shentsize-zero-v1-1-04f43186229c@oss.qualcomm.com>
X-Proofpoint-GUID: L4Br_SDJ1Bvfvpre19GeDpzB_IRjkY7t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDE1NiBTYWx0ZWRfX3h5hrPTSxXKt
 08gtnC4iPpYe27R6QVQN9L0j4HsMLwcmq/GBl2MBr4UlMJWk4yuinC8vZsq6A/fX5dCxOLZweQJ
 RYz8ERCIbGeKE5VtFhK9llJD6ExZ3GmgF0aYwC+R8OOP7XEiMnJCOnTePKa79a+Q7gwM313Tdek
 O9zOgQxeopGOJQ21PmooAqFTpBaKvab7eoiPnCLAZDHPMFDeM1S77EIoyI2WVUyRlgNOdd0yQ0b
 7z8v+q+fiH2cm9IBaJyvxVZ6YasKqcAISkjAJ31Mh6qztaJ/HsactsIGdszH8EkiO8hyNSWfxuh
 F7IeZisrqTxsVhldpnWX2+Q3ArxrjCH9wd2Ll1hqHeDrBO6/LAyuG/rVuao95JeLKvRvT/W0Ida
 HA8vhalD7SYENTpq8+4ApESSnueuxJnmC1yCIlOrwws7XQHP20fxZQOtSH2lUT/mi6twzjte
X-Authority-Analysis: v=2.4 cv=DIWP4zNb c=1 sm=1 tr=0 ts=688a8b06 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=2EBCKPX80TafROE6MdgA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: L4Br_SDJ1Bvfvpre19GeDpzB_IRjkY7t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_06,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=756
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300156

On Wed, Jul 30, 2025 at 03:51:51PM -0500, Bjorn Andersson wrote:
> Firmware that doesn't provide section headers leave both e_shentsize and
> e_shnum 0, which obvious isn't compatible with the newly introduced
> stricter checks.
> 
> Make the section-related checks conditional on either of these values
> being non-zero.
> 
> Fixes: 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read past the ELF header")
> Reported-by: Val Packett <val@packett.cool>
> Closes: https://lore.kernel.org/all/ece307c3-7d65-440f-babd-88cf9705b908@packett.cool/
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Closes: https://lore.kernel.org/all/aec9cd03-6fc2-4dc8-b937-8b7cf7bf4128@linaro.org/
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

