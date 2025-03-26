Return-Path: <linux-arm-msm+bounces-52538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B28A2A71895
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 15:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 613C23AD764
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 14:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6E21EE01B;
	Wed, 26 Mar 2025 14:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0tNZeYy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3BA26AD0
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 14:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742999695; cv=none; b=WYo6tOjTmizu5EsgnsiQkKCYZJ+aCaH4MU8M8lFguesQK4je/cP9M9D3gdO3wZgZI0dRiAeI5P5X7By26pq5/yUT7jriZMszivFXGHpZTHwXnp+I44IonVN8zBn5dW335Swv/kVSrkMu0YLMOONSrQBtGcCEiA1RxgY7O8pUhgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742999695; c=relaxed/simple;
	bh=hkLjxtxFnMmcf7k1i8SOyChknKCe/QRI3dgsGv5WSxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQvE9ifqTetM5NV1Vc3z0/1GNkH8kEg/QT2Z/fCNOYS8KdPO3nl0oQ86Z3ZcNWD4WOo3w2llJlMZupA/bWVFXronx2gOSpbVbMlcEuHCZwF2WA5zVpOPt3GNspz8PG9HZn8V2okftaAWPFgX+1Nd6pV4Ojd5LPJlhBE1uLM49eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0tNZeYy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q738iH000415
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 14:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K5UW1TpqjCGvrPnveaTgtYvQ
	tV0bgWt6Sykm0ALy02I=; b=D0tNZeYyFJbFtiM4PHdeRq8/xvxhJFt9q3LjRoGI
	qCYyk8YXXRzw9BdRBCoXWddTiSoo7tP2KdjrurKIU4BZNZXai6kRsWZd5z2+Xgva
	S33oIx7imlZpn7mA6hLpTzoCl5mKmOOhkquuSqtDtVwy2MNZQrwYbbxSSnG7mfe5
	+1219HKMLdv90lWsjnujskR2kuQ6QyauNRvf2vTA7phhgZ2wsul96OClxr8GvxWh
	4qPOnU5103GqFN6BgfSjTZKHanZTyS3U9AD36f9aWdJpVE0V/IE3OIBh7pZsuWhK
	R0a86WYE1B3codWlm33OHWZ31F6hwp0qbkDXcreWXFdUfQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kypsb3p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 14:34:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c593ce5e2eso1469517185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 07:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742999692; x=1743604492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5UW1TpqjCGvrPnveaTgtYvQtV0bgWt6Sykm0ALy02I=;
        b=nuJXmJrBnePJzxaRPwSTljRwDhno/sYXMUfr6N+S8dlV6smukZOlRJpnaqRL9fWyj2
         c6wWEaibwZ52Gyig+Ps/E98jY6dhfHr4dW2MdAfeDiaI8oqord/rbqqVAPfoni0gtZBd
         x3gGLWtRWkjRBMNO500Nd58YpLcinBznunQ1kO/HGQnxp2fx7ZRFwaJQpDYIAdiJbNaV
         zQj3+D2lm8gxTug9ZYdPHemkCp0Ve1hzgX2Sszy0zQhIclU5WOFcR4o9y4fFT8a8jn6b
         6QyOZe4IMf4Srx6YEzM0imcpQ6bj4oZQaEDJPJX6rgBM7RvenNRynEQQQ1NamOArphjp
         tQeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEO57rhGU/qO5iyx5HDipz4U1LIHw4O5YZ7cah/GEwGDf0YHhDnzCVyTq86U4wop2jnnKGkr7fVF8SM6bt@vger.kernel.org
X-Gm-Message-State: AOJu0YxetAdZ4N2zUHVA1zaDLRsRCWYR7YF1kAQ24AMO7HCmD1H5dehe
	U4ZIh6W32XKjHZ9KJFPb5wKeuZ1ii34gHwcgpWqwL09gEk854Omk8AuNJZsS6Rs03glATb2W02q
	+POVyP2roaehKPxXML7sKrQqy8IyWkvdVjQmnLv3cbw1HgJuB+YEhVoXk+enqK4em
X-Gm-Gg: ASbGncv/HCBZ1K88vZ1X+bY7oIKwYWL1Hpy7Txn/Oh3QF2dpblt4uXP0j0hm3760TGh
	85Tqi6NGcoNzUyAtL/7h5FzXgP5/9hkAwGL7ZBAW5yIxRL0qNTu2PZ2Xy52zfHv68JyM5olohkj
	7bLlItr2gvnvONGAPEEWmKVVw/le9lNoHEkdWy+nFV/Fv2R4Jc41OKiDnALypdulHreT2/z0o9E
	8rxibjmOMsjIXVFGGOxH49vEDv8BmrI3mWhBTrJ5O6GQZ0xewueyfPTNEoKSP13F0agi4ya/GbL
	i+XEwM1hg8iSJCJiNY21IdgMB8LZ2H1JBQyeP81y60qIrMxy+R6gydDnqM76LGof79M1a1jMouu
	apXc=
X-Received: by 2002:a05:620a:2845:b0:7c5:4949:23ea with SMTP id af79cd13be357-7c5ba202c38mr3617211785a.47.1742999692211;
        Wed, 26 Mar 2025 07:34:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6PU+LTOnwomkjsF37We9FDJ5iV3bcXRlbHabhUpTUBXDD4TQ1EGPyPBf1OZiZ8+Pj6q0efQ==
X-Received: by 2002:a05:620a:2845:b0:7c5:4949:23ea with SMTP id af79cd13be357-7c5ba202c38mr3617205385a.47.1742999691684;
        Wed, 26 Mar 2025 07:34:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d8f38a4sm21948831fa.83.2025.03.26.07.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:34:50 -0700 (PDT)
Date: Wed, 26 Mar 2025 16:34:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH] soc: qcom: pmic_glink: enable UCSI on sc8280xp
Message-ID: <e4fjkl4ame46l4gguxa4cjans3w4evgcjksrcqpzdijdeam3ue@z3ydgfslr7su>
References: <20250326124944.6338-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326124944.6338-1-johan+linaro@kernel.org>
X-Proofpoint-ORIG-GUID: jLC8tyICttK4LpdMnEjaBP568zGJqfqb
X-Authority-Analysis: v=2.4 cv=fIA53Yae c=1 sm=1 tr=0 ts=67e4108d cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=R4_Tb_Y2wpFPbI5QzzAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jLC8tyICttK4LpdMnEjaBP568zGJqfqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_07,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260088

On Wed, Mar 26, 2025 at 01:49:44PM +0100, Johan Hovold wrote:
> Commit ad3dd9592b2a ("soc: qcom: pmic_glink: disable UCSI on sc8280xp")
> disabled UCSI shortly after it had been enabled to fix a regression that
> was observed on the Lenovo ThinkPad X13s.
> 
> Specifically, disconnecting an external display would trigger a system
> error and hypervisor reset but no one cared enough to track down the bug
> at the time.
> 
> The same issue was recently observed on X Elite machines, and commit
> f47eba045e6c ("usb: typec: ucsi: Set orientation as none when connector
> is unplugged") worked around the underlying issue by setting the
> connector orientation to 'none' on disconnect events to avoid having the
> PHY driver crash the machine in one orientation.
> 
> Enable UCSI support also on sc8280xp now that the DisplayPort disconnect
> crashes are gone.
> 
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/soc/qcom/pmic_glink.c | 4 ----
>  1 file changed, 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

