Return-Path: <linux-arm-msm+bounces-37596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D129C56E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 12:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47ABDB3BE30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 11:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5A220E307;
	Tue, 12 Nov 2024 11:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDVYOCMl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A07217645
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 11:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731409892; cv=none; b=PzIzpTg2YT70PrggbZ+YCA8SdzJZELWEAHkh71nnyyCncRgf10qhmtMoiQVxIalE2xZl60/10KGe1lFU9CMbu/+Z4ogaElSmtx0SRYfkEVqoO7WT/95eL7Ofpw84BoSRHfycEVUHm1P6F45ygPRWDZjLhc2+Pj3VQ1CqQ0Fa+cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731409892; c=relaxed/simple;
	bh=ywR85OiWuzWlgWAd2eNOPKgqgkUU3b/hcNQah1GT2Oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u7NN4cFRh4UP6nkmDyWXXVr4I7j62+0gsAihHCvG/B6wW6ZH0fmmqCC8CMiHGZzvR+4vlX5IIDXu5egqazllg2vwv4yGCe5G8Hm+SPx9VZFAnUlpD8z1PAz7WRWTMZiVHtIPbpFbhqmmtY7FDZpzxlMCrLcFVRcieEYNtvydYpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDVYOCMl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC1ulMo004729
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 11:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h5t7dc7G/jjBr8WlAlwPdc9LxkWltx2aKpkt9Hv6dQE=; b=hDVYOCMljcutU6aD
	8Gb/mUCrLbmjZiCK842u2yTxArjKNi46LwoR9896VHV3ouz8NuH0ywr116Yj+w/E
	8L1lAzvMd/qUNEJWFAY/ryzqU5X61MkrQRRnKHfMTyzFeXTOcsLIxJO5PEiTqhe4
	4YeFX7B+enlqVqUZgzIrBBTiKiTWSwEScXAplLJfwVOGk+RrkP7Nj37H8dbxLrwA
	lE7N27biVnwatQZPY1HM2oO6xDtk8MyE1o02DLpI5lHGFPeSY+GfUNV53vxum6sK
	piMKpWMB9mQxQZRdHl881BBuNyFdirgyKyTdnksfOAFPebxKZHHY5hg4nvywq5h+
	GDD6Rw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42uwt5h7th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 11:11:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-462c15afdb6so1757051cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 03:11:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731409881; x=1732014681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h5t7dc7G/jjBr8WlAlwPdc9LxkWltx2aKpkt9Hv6dQE=;
        b=k31Zb4W475kgbB2UyYX71gluKu+M6SWeEAmiSL9zynoWo3ZAHF8TEufIZg+vNcALce
         fZTed3pFavUNaFPjAn3oH82qH5PBf7AkdtEPQq+FslgSi4LpaYXPmh1kQ5tFM68AOjJp
         vALr4lAhQM0vzGfItXlygUEGW27ImwGCXYid6B2S7X6PHti96yaw4jwkEugRgVYHaG1l
         QS5csMQzr1UhFZuuEl7cxXtD+e9WlPC5SYo47ZZ3mvFNG7NF31CkC543luMitrSwGemN
         CHMOwn4f5IpG0db2IlYzkDgnt5ZmkDPM2YJd3EeojRJa3DgFFF7pjmbpZ+PxYENcYniz
         rZ+g==
X-Forwarded-Encrypted: i=1; AJvYcCXeGrsGfVPE5CcYSN55QX+YgOOIQ97Q2vpSYj6i1+90Gx4+l4STIwrEZJU27EPrsVDgA92ow6Kwevu4xdMO@vger.kernel.org
X-Gm-Message-State: AOJu0YxgiSr/7p5QEOe4cHO+hWdKW0OD8kczKAsOUx0msKjWT70mEc9k
	r/5vL6ylQYX43GDbwLZEn6wvmbz4VDb4T3Gz/JHC5TkHov1gG9DVXLkeOmUkEA00AFeNKmUSXWn
	X2Ae/5CM5UKBG0ZugbZR4DaUHuh87s9TS/cr3hNv2ridOmeIadTopUytUjWluJMGs
X-Received: by 2002:a05:620a:24c5:b0:7a9:a632:3fdf with SMTP id af79cd13be357-7b331e616abmr930877685a.13.1731409881281;
        Tue, 12 Nov 2024 03:11:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECna4oHPwSQGVlcKMRTsp1CXWFFwVbPJfw844hm3cc6KdClilnMMxBnVcLsnfGr7SMHpmrpA==
X-Received: by 2002:a05:620a:24c5:b0:7a9:a632:3fdf with SMTP id af79cd13be357-7b331e616abmr930875985a.13.1731409880912;
        Tue, 12 Nov 2024 03:11:20 -0800 (PST)
Received: from [192.168.123.190] (public-gprs527294.centertel.pl. [31.61.178.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0def4b5sm710246366b.146.2024.11.12.03.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 03:11:20 -0800 (PST)
Message-ID: <a10193c1-a89f-45ed-afbf-ab75b3a4ba43@oss.qualcomm.com>
Date: Tue, 12 Nov 2024 12:11:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom-qmp: Fix register name in RX Lane config of
 SC8280XP
To: Krishna Kurapati <quic_kriskura@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Mantas Pucka <mantas@8devices.com>, Abel Vesa <abel.vesa@linaro.org>,
        Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, quic_ppratap@quicinc.com,
        quic_jackp@quicinc.com, stable@vger.kernel.org
References: <20241112092831.4110942-1-quic_kriskura@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241112092831.4110942-1-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WQip48QgBfTIxFcFVA-HGDsGy7QF1oqe
X-Proofpoint-ORIG-GUID: WQip48QgBfTIxFcFVA-HGDsGy7QF1oqe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=604
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120091



On 12-Nov-24 10:28, Krishna Kurapati wrote:
> In RX Lane configuration sequence of SC8280XP, the register
> V5_RX_UCDR_FO_GAIN is incorrectly spelled as RX_UCDR_SO_GAIN and
> hence the programming sequence is wrong. Fix the register sequence
> accordingly to avoid any compliance failures. This has been tested
> on SA8775P by checking device mode enumeration in SuperSpeed.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: c0c7769cdae2 ("phy: qcom-qmp: Add SC8280XP USB3 UNI phy")
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---

Good catch!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

