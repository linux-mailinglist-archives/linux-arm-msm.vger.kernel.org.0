Return-Path: <linux-arm-msm+bounces-89259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3229AD283D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 20:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9B58B300B34C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 19:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DCC2DCF67;
	Thu, 15 Jan 2026 19:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XUsztqgQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IXeQ7LH/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC8330B53B
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 19:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768506596; cv=none; b=IcfiA60o18JI6+bwK73F4m5GW7QwTV2Hiq78aa4N7DDKqgQoZF4Miu61nTywTfOBRiZZFwjQZz/E3AB4pafvX8jaGaXyugrXC0iCymPAMEeNt9kXajLwRVZ7y2j64ftArxUwhPDsln/15QAK3JKPw4ttitcIxSVzcVSo0WkcQmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768506596; c=relaxed/simple;
	bh=3T+dCHvAmbmc/P4p3inx2dFMkKkPNL/m8uObI81JOaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpDb80sfYrowWWG2v6Ufc5/I4Q3jgz8f4bIZ64VQJ7YtyWwIsHyiEcI2JqnA9aWyP3ul4/OyIGoI2hhv2nOzl7J+CvzYKra8GuHcj8VoIYrTWWDVcsVnPgDzkcwqydijk9DeOaNTlRB51A0suRTGkUVS8N0w18okQnSivf/jVGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XUsztqgQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXeQ7LH/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFY5C73202063
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 19:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vNyvDLfAN8WwlT6zHodw9UdF
	0NznYHtN6ODgBj8iUn8=; b=XUsztqgQbuqTtAauO4BbRi703m24+pKfKphDtgHJ
	yrnswfowqOsQGwwzimVC6p9+cCb22cHJsJBcVGJRjEKRxzCzR7OE+JX4Tjk/3k8r
	oZJ5Eqb/dEyP5YFDAtePk9fB5wCxmgqCjbz8pHVW1Phn5WkFmLRuvAt43UMt6jom
	8AYQUgvp2s3IvVcBFelprbnoHTLKa9/MhdCKCcxDsGJa+ZLp647w0BmxRQuBsvVh
	BG2eCkHtp3bKsxF3cRtFYwFYU9SCtt8cOGex39HIGHfuMXXHSsHXAedu/uf6aV6u
	5dV58bqsA3+rGIxb+bM4L7Jah2hTaUB3+G711eGzrz6ksw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpxhs9nbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 19:49:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bbe16e0a34so348360885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 11:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768506591; x=1769111391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vNyvDLfAN8WwlT6zHodw9UdF0NznYHtN6ODgBj8iUn8=;
        b=IXeQ7LH/iaCH+9thx/ueHiT//kHW7gZWfMvhUxdUk3604lGZgskQnPUe848bGZLi3m
         pyV9m2ZksSgCxQyuct7LwP/0zIMEi082rfBFoWPy4250mlJE9SroptxTsQuPAk7c5qLn
         80j6p3p7uc2lCv2KYv19iWSmUb8RGi002Tpw+FUgdU6vX38NeFE/ZFQAGsl+lc6wmtu4
         p1nDb6nlFqDVpW+AHCOk2HewQ58DCfIwFa8pypNxpk5QJBzcAevzLJvB/Ejd0V7o15Oq
         ycrdpngxpLxe5JWZclnx558e8nT/nQodZIT5ctgtv+rI7Zr4L+akUHr5d2XUou5IUzBm
         8sIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768506591; x=1769111391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNyvDLfAN8WwlT6zHodw9UdF0NznYHtN6ODgBj8iUn8=;
        b=i1KCO+47fgVcEZs0hDM7KFUv0Wzw7PuJcuyYIEGGYJcqaImZxurlTbUtlHbNZlPnNs
         7+IqDqKapN1Znf15DqPbVdqk+PL4QGhq7Y5f99t1RaBIccdN+ENiP+xDs7D8kk7hh1nQ
         mbM7go2mgy8GN7GaBlR9RQX5op+wHXZMUUrZin6ds89GXKg5z3b8gMoIkQNfW/kIUejV
         olXljq6Tva42lobXN/wJikctYuUO4vppD/Ln9TCQcjrYpCX4x8WLj5aC5G28Zbfz0RyP
         eG/XsHctwdENE/ky6D0vhpxAYp52nmTifa0kGyJlHiKuyv4/ANqu0NvHh3SWanuVv1eJ
         DNyg==
X-Forwarded-Encrypted: i=1; AJvYcCWPV3PsCQAYsQfqUp5a7R6IwJN0ZoWcipdNkBU1nzug+cNKNi7ayLC6wS0cCuq88mwTkhu74yngs6I/Uxet@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg3NAx2Ohs/BKMaJv4e7ish7FY08Kt8ciTmcqFs9XPmHOhMdht
	pxaTd7JjBYjSqWOqRsWcY5fBEXkAi3CpmGQBiH7QfRMzH3raZEqQcm8nCxWpyo+ZVhHe5j6ymEo
	7LBeIOVEhNikqaJ+Jp1XiFk8LtB2xMZgCyrp8aQti2Td6TG7uIMPj3ToV83eEuuxZK56c
X-Gm-Gg: AY/fxX5YK5Fmghp+CmUkKSNPjIqEUJBVkQR00zA59mpywoYozWrloEH8tptTcRDFlnK
	4HDJuTr9SXTSDVprn38DQ0+WROOzdpvEEojI+kRGO7h6dqBvAQXwPl75oLFg0Dv7GuwvgtuRZnR
	pKCas8PbE+j9wIzk3dC5sFeSYR3PTzktwFyh2nvIPrwoYR7/HaBZ5D1P9B813zXHNZ/QOMkLDr3
	KMSpYnnXit61fuHBLqhn/3Cf9zXuQX7RrrCu8rdvwzrUaLG2JMJPSgVncZorbY//hgJcdf7rCcw
	ih0xtTaAJn41kytqzffszdzmOFsxxRFsa36vfg/TTsfIsvsOXd+eKUpXbczS7BuJreczT00gHjM
	55RKsVVBTUwerutF5E2F08S1LdAMW3dwK8hGNAjRv3G/SnPPKaP/7VyEm5wCeQElDvNDxFoNjOH
	65HJo+hJPvYaC6LTVTD68wqy4=
X-Received: by 2002:a05:620a:1a23:b0:8c6:a522:14a2 with SMTP id af79cd13be357-8c6a5221655mr223789985a.35.1768506590631;
        Thu, 15 Jan 2026 11:49:50 -0800 (PST)
X-Received: by 2002:a05:620a:1a23:b0:8c6:a522:14a2 with SMTP id af79cd13be357-8c6a5221655mr223785885a.35.1768506590140;
        Thu, 15 Jan 2026 11:49:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39c150sm102366e87.78.2026.01.15.11.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:49:49 -0800 (PST)
Date: Thu, 15 Jan 2026 21:49:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v6 10/12] drm/msm/dpu: Add Kaanapali SSPP sub-block
 support
Message-ID: <izgoqm4e2ydqrelg4sxc5a4ggnqzqei66m55ds5wvvfbhkgyat@trzbm74n6ctm>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
 <20260115092749.533-11-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115092749.533-11-yuanjie.yang@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FI4WBuos c=1 sm=1 tr=0 ts=696944df cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4dFScLpsznfeEuoa3zcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Vi0_Tnnt5uz9Os5QRsGxQNx5pQsCROg9
X-Proofpoint-ORIG-GUID: Vi0_Tnnt5uz9Os5QRsGxQNx5pQsCROg9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1NCBTYWx0ZWRfX/utcCpLVSdl8
 mTB+vgkXavt+y7VU4xwX3K0E8Y77BkTKW73AI30axhj4Q/mzu49cgLxvIEWxpggOJ2ax3WckSAj
 BIUR9z+aynfxaKTCJAiwl1uZ9R9Go5e1mz9c3QLEfkmORk8CtrgQdx8y4Sq19QR9707BbeCp1jH
 6JP9pyCzghv3bEPvWqVIcoRomd6NZkNXzF9OSmaiMqfYxLjZNJ/9fkWYyMRPvtjWftwhxNJAMeI
 rbK5SCGxoaiSt9dWghsoV4hRbeONJ/5VoaScoAIzGqLWv1pwYLemxi4+2nGtQ4iP7UGvAFDVmCf
 k98fr0fyMOvLc2keQhgqM9iosGndioG0WsiIMIQ99y35N1Vpcwwn1hYJ/Loqz9NYormRvwPU8GY
 VIbjwoWVPPoL22JcXOmDpuWVteb1erBYOUEcdHPU6kL9k4gazIZhFEAUl1/H9Uq45CZQP5QrB1l
 VkKPI5/u5hRpr/nkSQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150154

On Thu, Jan 15, 2026 at 05:27:47PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add support for Kaanapali platform SSPP sub-blocks, which
> introduce structural changes including register additions,
> removals, and relocations. Add the new common and rectangle
> blocks, and update register definitions and handling to
> ensure compatibility with DPU v13.0.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Makefile                  |   1 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  14 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
>  7 files changed, 371 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

