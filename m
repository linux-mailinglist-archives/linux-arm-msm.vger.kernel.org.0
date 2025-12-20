Return-Path: <linux-arm-msm+bounces-86044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19287CD3459
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 18:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7D26300DCBC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 17:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1DBC30EF77;
	Sat, 20 Dec 2025 17:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lX4wq6yF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOukJP2j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A322DC783
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 17:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766251032; cv=none; b=HmiSRSztJ95YfkykC6i/jCn07SBLCKoSudqJv78nlyfuH7XraOK9hUc2s8eMgVF4jc3aKXCoRGbEDwfhFyam+YBWD33zv3ks3kefjuezIkJMSL9zACfbJ3Q6GsIN+sOznrjwFE21wDlAAuwmvvEf7OWCFxx/u7rAksXVfRp8nAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766251032; c=relaxed/simple;
	bh=5tdI0L0c65S6XUPwkOxJysDmVKbdHm6RIEqdnFqYviY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjAHlbcuv0f/2QEubdIhHHoWd3Vjdg7wcivI8YQrRl+UcfAehcDttUYX5/eyPwbXwEuEv89FQXymnsirqKKjYV6ppHJ+nDjnW6PnUYQMDy84WR41uk6IuKUeBqe0ddJMmvQE5BpWgl24guta0DV8UcBdeSofhJLZULzo2bt8TGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lX4wq6yF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOukJP2j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBPMEh3197991
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 17:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=geJ5c5YXn+3HZREgB/Kj9BK3
	p9KA/0JxWVBfl8NvKhw=; b=lX4wq6yFh/ho+wKEbd/4VN07d132UNO7CEctKzBr
	VPg9j8dF/TqwdGX3ERgy4ly4NcUC2zhVa6ZrkQ8U83ld1tKlXAl/Dt/hjfxG4yJM
	gw1oSipvdAML2eXm0JfQ6UBVYaDvcR+ehRXps9Tm7CYgkikko7N8NEBoFF5zQWWY
	Sl2Ccgo6N7dJFzj4KOuP0d+U909DsGVO9kf8FJq06cKJFSStXTC5kpzH5jOcV7ys
	6DnYM8kUpACNPfVCmj0kHnnxkksqanHG96Jf8/noKqCe338ZN63RR5aN44EWazMm
	kwJ4PrunCcrWxGmMJGm6imsqKPezVHab3acv2Jllw7XSeg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5n36h0jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 17:17:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a366fa140so124690826d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 09:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766251030; x=1766855830; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=geJ5c5YXn+3HZREgB/Kj9BK3p9KA/0JxWVBfl8NvKhw=;
        b=iOukJP2jkVrx91q9AE3grdoAF1EQlGTXPzg6VTUYIkw1CGnTr3VABSy08e3j2fGeyR
         LPAlRNhaDlJomymsSRDZzjJTOJ+7oGJ1+VEfq5uozLAWuZTutP3Z2xKN2OzQ+BSvmNAk
         z55EOYaKrUIbLYZh6IOR/VORmEwzvbit0139pH7t8SJzFBnkT8no9pIVI5lv3xcYpD5u
         3wgwd5dr3edJfEEo3SemYQ9Hn9zY35fDGFUTNOEzw7/Ff7B+voTBeUL351iFMeoqrjkS
         ZXUZ9WMwx+CWCctdIAOmsvNWjVN45iH1Xe2T2f4ChE3zOw8nD0loMN7PFMtOYPVzq2Q/
         g78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766251030; x=1766855830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=geJ5c5YXn+3HZREgB/Kj9BK3p9KA/0JxWVBfl8NvKhw=;
        b=xKGBm4rw2QPVdtbow3auRvEY3/4SUG897W13QetdGpuGKMSS4FONaj00xfbR/KH0iV
         3u1BLPHufzflEoiZAaKWORmjXux2yRVBQ5VH455ax955dfnlADy9RD0rwTbOnHKLMpha
         TI52PHqg92MJUwMDKwWbvwJYuFcWFoZkla6PdmnFOMdh7vQr6Mk5GVitU313vc+UuCHP
         ITO+DMhtdRHIM2S/5WKziD+EAmAi1TXY8/7cobs0+CGddP0aYeWZ+9cJdvpMMnnOLlmc
         3IRNzND57ff1mtOggZJzk4ENWBskNpc9JmYhkTQPglgVzhHfbDW7sFkATkdCsO+paN0/
         0uzw==
X-Forwarded-Encrypted: i=1; AJvYcCX4O88VpsDf+BB9QcgYUscrDylFurDxi+F56IZFnWSS0cdux0w6BBAi8+Z56jDBrAcU2vofeeaig82IWJYU@vger.kernel.org
X-Gm-Message-State: AOJu0YxYxYSQwNaVa/alzMvJTW47sRov+M9fsOYxg4TmkhKHUXZK/8ep
	9xlx7jGEa7081Jh6LPu7mPEWYJIgDSgFelzVbdR/XqhvTTvKfHGK8h36T8wFd7FSRFJC8S6D83O
	6D2WlC1xlDN1JuM0sAopYBAtSVyw2+OA1zg4Oomey8cWpRrqpa/EhB1pp2mm0a/7lgs9C
X-Gm-Gg: AY/fxX4oCiOxHLx9NlBsKkhrDQWVB3mUBJwxRoPDyHmmPC3qa2RwX9Qoy0WNVwHJRld
	tCdWdD2PHIQwmWWdRI3NGMEhS8rDx4xLRZW5QDZod7jDkIJKYZb4NUZJTa8VOUrF14srGLXqEcp
	EREJr0jCv/8qp45OhoEfmg+PViJ8mHMqR601NCgLiZXZ/V3Eu0JA9qVTxjmuH6FB4ufuuD8HM5c
	vX7M05WDQvnEW2WCA58JPpsPFC05FfPn2GjqhPPMoEVxwi/qLzFrvNjl+6xKcb++PlN3v6cwZjR
	fhm/a4rTpXrF9/lWpIamqFcA6jRROgadNv0zcy9vAVQXWlAaFpYW69/xvDz+ojQh9o1pOB7i9F5
	ynbM4buesgOxq/8zAm/9LY9HrD3ycvO9DX0hpBK1vJJPhGN7p0R/faEdA3BKhFK1ZSOvBJvgGJr
	n76zCrhNP087osrXSN5fQeO0I=
X-Received: by 2002:a05:6214:130d:b0:882:4632:cf7e with SMTP id 6a1803df08f44-88d81663907mr102671586d6.12.1766251029678;
        Sat, 20 Dec 2025 09:17:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdaTJQ/g2tFCyPrDnyETWdxiFt6DJBxQzQPzvm+bEwNppPpjgCw/1E6J6B+JSNV7tFdEegmQ==
X-Received: by 2002:a05:6214:130d:b0:882:4632:cf7e with SMTP id 6a1803df08f44-88d81663907mr102671206d6.12.1766251029242;
        Sat, 20 Dec 2025 09:17:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812262b307sm12467531fa.31.2025.12.20.09.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 09:17:07 -0800 (PST)
Date: Sat, 20 Dec 2025 19:17:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        rajendra.nayak@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com
Subject: Re: [PATCH v3 2/4] arm64: defconfig: Enable Glymur configs for boot
 to shell
Message-ID: <2iu6xuoeubohzsjfo46lxnxnzi7jdcqh6joxms6e5kcln52pr7@ewte5v4m2dmr>
References: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
 <20251219-upstream_v3_glymur_introduction-v3-2-32271f1f685d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-upstream_v3_glymur_introduction-v3-2-32271f1f685d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0OSBTYWx0ZWRfX559DejQZtv/Y
 zlzJlEZmtULD2qHfx12s8CZdBgCAR5LOcYHYQXDwfQBGyDsAQflLIahuVnfOzA2Haue3QIv7z/5
 H8wk2o7ueTd5mx+2kVcybDGqhgiCRLxDeysK9bohxxnpfXq+bcbkpzl7feqMq+RZWNb8/bvD22c
 64ccrtw4dYwvy0KV4fbs/aaqu8/6vuwCG4OuHN14xqalXeoW1SvE8wkmA/pB2uZc8m/899e/Adf
 oADYTM0zywJDoOQHD++3bM1Vxj9ax3wG/Ugs4poWzRKXsTfyeoJGSRK6LOCfl2UCiSYOWKjQCi6
 pcx9ZOp2bZ2gapfYz5EjnzF60y0TWkTyHSzw7HFv5grvX1/Q5Q/xi/Dr/lqxv8pg4hvJ/RDlStA
 yWu2QWq8G06HJmqzzWwd3UerrLYDbf6KX3OEfSp39cYFmPJtfjk/Zq8Vcssf01NjsvKZ9f5mv8p
 SZuw7IZAnWabVzx+1QA==
X-Proofpoint-GUID: D_wS9pMD3WCy6wk5jqWqQx2kyyxc09lr
X-Proofpoint-ORIG-GUID: D_wS9pMD3WCy6wk5jqWqQx2kyyxc09lr
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=6946da16 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=X6lb09SM9k0nLHDX1QgA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_04,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200149

On Fri, Dec 19, 2025 at 08:16:55PM +0530, Pankaj Patil wrote:
> The serial engine must be properly setup before kernel reaches
> "init",so UART driver and its dependencies needs to be built in.
> Enable its dependency clocks,interconnect and pinctrl as built-in
> to boot Glymur CRD board to UART console with rootfs on nvme storage.
> DISPCC enabled as module, used for display.
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> @@ -1425,6 +1426,9 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
>  CONFIG_COMMON_CLK_MT8192_VDECSYS=y
>  CONFIG_COMMON_CLK_MT8192_VENCSYS=y
>  CONFIG_COMMON_CLK_QCOM=y
> +CONFIG_CLK_GLYMUR_DISPCC=m
> +CONFIG_CLK_GLYMUR_GCC=y
> +CONFIG_CLK_GLYMUR_TCSRCC=y

Is TCSRCC also required for serial?

>  CONFIG_CLK_X1E80100_CAMCC=m
>  CONFIG_CLK_X1E80100_DISPCC=m
>  CONFIG_CLK_X1E80100_GCC=y

-- 
With best wishes
Dmitry

