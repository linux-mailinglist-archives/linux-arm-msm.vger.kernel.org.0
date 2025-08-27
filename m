Return-Path: <linux-arm-msm+bounces-70961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72030B376B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 03:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C53A1B66599
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 01:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883CA1C6BE;
	Wed, 27 Aug 2025 01:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aUJYYuwf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDAE10A1E
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756257522; cv=none; b=RvVE9jey3+o6Q8zmaGoK3g2Qt9I381102k2biihDJiu4sWbG7WFcx2WyvVQo+wH3z5CTFMmbOomR/jxEkaKCGAGTJiGjEupZ4mqCgJH5I2CbRP1/4rR9EFtZKvIfcRCVgXljPRZNxc7p5oDp3XiHntSHyjxxM236l8X1Ttl9/IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756257522; c=relaxed/simple;
	bh=fHA3mzUAXqJvLfjfjKK/r45B7b0zgHidGy9xFM6J7NM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2UCBVvTqrELGvWlbF0KcJBZorqd5V8k5y9DYZOhuLMS5wJFrXBGyr3LHVjlMOWax6IeJgWSO3YO0WnsA37v/dkeZ79ceA39GS72B2RoTVmR6m44Nrae1RRB+1VfSBZCneASVep9v2FfAtovqUoTuTSgL6Em/eIj+QUdyxIFKnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aUJYYuwf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QJVskS012652
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bx+duUP1GALERBeSBTVPOrXM
	scOH+ezdQWGpYAtJpSQ=; b=aUJYYuwfAjFvp98BcSfP9wgOvviNGgAb3iP/Uyeh
	bBZajVeViijgS9PvK0tayRC8E663JaLFc1TW2wc9yW9NTzWdct/Ktwu3WYaahJ7a
	CvaB67tBd/ERl/Q5BxfuMavD009wwGPSnkVDuyQAEB9IukNJsbkOWYv0z4LUo4r/
	ETVF0iTRrWZ5FJN0tPoYoVPgJdCXJyerzFruYWehFJaX+uj+qX7sNb+RplTrQFic
	qgBjzpoA0uHMBSZbp4yLslNTFpbAYK6w2WN0hkhTWxz6T2mLvvPUmO+v+GsPw6NM
	mNcQd+1Wq4b0NXFQCZ0JtdXRj8rd1v5wi+Zek7+UNZDhLg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpu2h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:18:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109765d3fso9641111cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756257519; x=1756862319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bx+duUP1GALERBeSBTVPOrXMscOH+ezdQWGpYAtJpSQ=;
        b=E4ASVZFCYAbLFPIOMneMiIfZ3y+nv7tuO6QyydiYGdfCpi5QMN/eWimTKsIYhQxdyg
         km3XoR71RufNeXFmyzHuWZ13/NH9UqDHnntmexwQafljvXjmTlJIDgAlThCOvu+gjGeO
         0v7mtwcjSzYMyn4ZL8ixVuPhnCmQpvyIAtHa5tuLCvnQLfrnW9nK4qNH0v/8k+Bzt57V
         yUVJ1Il0keR5qMdSGElRImxnIUeDgWEqtp9KnCv/SEWjFlssH9rPW2q89137TpCpSfox
         CgeW6gQWDi/yGGGhAY1IO/w2sOSBbuhYOJN9N2dZQixpdEfVdiN+sWbrzpnzpp14CxG2
         wzuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPFd4HMwC8ApTHCOEd31Kss039JI/poaGG378pYIhYv8JXdP1hW9IaCTaT8vbRrRAgvgEVKvZGua9Sj1wV@vger.kernel.org
X-Gm-Message-State: AOJu0YyPn0JWWDH3gftNEI/b2RTiN0a3AVPMP8ZYv6xo/fqzfWYTl1QW
	J0ccWHX+eX52gaf+1zZS8Z309Xc9+wqQAcyUk1BubZRma2QyPBjKPAO8/komaNEC6M7UKhp3Rqg
	a5VzY3s8qrPrzguviUFiRZppRsKZU+GQTMc9dUmgWBnlP9KFbLpWJBmPU4nVH4o0GJKYh
X-Gm-Gg: ASbGnctQMG8A/43umX1kAhzZi6e8sA+W2fhbgpy3UnStLEpLnRlMex28DEQAMhfMyuI
	Mb0PO99plgGLNsuFlvAvWRNJ7IW8PxSA9tqHHvY0EzKJxSHxvxyIbTZ/rXF09ajzkSdkWhjaKgd
	W+VGSaG/lNYYmxQ4mXoGhY9tVMiLFg+4bmaMqf4kSK+Sg+CoEHdQ6endOcjAKqkvqlMAmzkUlKN
	v3NKcoGPFh0Y1wk78EZMBtcgrc+Pb9BJ5VZsE6D/D5qBsRw1RA7hNg6jodK4JDI7EGPwTLtH7+M
	ZlISaIIhbEGx56plpBlAq+wngMvvkFLmXs5BYS9TTv07L8n3Eq6thD/DAhBU9Xj8hp304sbXG2h
	nirLtVGKrAjAZwAxAn47apUI/YoP4pri4uCPgqaO97YsrH6eFBvll
X-Received: by 2002:a05:622a:5c0e:b0:4b2:9b79:e6ff with SMTP id d75a77b69052e-4b2e76f6c24mr36188161cf.7.1756257518812;
        Tue, 26 Aug 2025 18:18:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlWgyLt/FiqiOWOJS0LqGdTAYap/k8kB9YXuoapGqnOCEle6fLztfOxdXwebefsByFu+0ZLg==
X-Received: by 2002:a05:622a:5c0e:b0:4b2:9b79:e6ff with SMTP id d75a77b69052e-4b2e76f6c24mr36188011cf.7.1756257518351;
        Tue, 26 Aug 2025 18:18:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c02020sm2529995e87.29.2025.08.26.18.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 18:18:37 -0700 (PDT)
Date: Wed, 27 Aug 2025 04:18:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 37/38] drm/msm/dp: fix the intf_type of MST interfaces
Message-ID: <pp7s4wyvchoe2en6xqtow7cw3wfjfgnb5lu2l4f26azwssolpk@ydjm2ezqumu5>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ae5cf0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ELchz9PJ39Up9ouDmgAA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _ImsvALy3PZPr32mX-nhoslqKDiBv0YT
X-Proofpoint-ORIG-GUID: _ImsvALy3PZPr32mX-nhoslqKDiBv0YT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXyy6sc31QcNoe
 PnbZuJeWj24C7xYmnV7E0XCtS06eh705Kcb/oH0Vri1mFatEtfUBTrUN9436eOz8GB+cA5UrDNe
 l8CJuV772jcLkyzp2/3AEbGWAER310rA1O2ZfX6H2s/JDd/y+KwxTnQfh/gx6BxisHGrWe4PZoD
 56d+Ck25SRtmAB+tSRzIMGLoiLN8WKWPTWjRGJMjU4j6JcyumrfQQIu5XRaP2a3I0lL59l36peU
 MiufUU0LKc3QayC3oY4ym/V3ei/b8JIYZT93fzATF053L7AyHgQgRpZKlAn3nJTgKbDWVpWzNFQ
 C7M/XXi7xdil+1K1Wz60oKc1rvYqxUo8OoyJc0mXwos90bxoHE/8DueNgF1gtU5+OoE74lqexOq
 zfPLr4GX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

On Mon, Aug 25, 2025 at 10:16:23PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Interface type of MST interfaces is currently INTF_NONE. Update this to
> INTF_DP. And correct the intf_6 intr_underrun/intr_vsync index for
> dpu_8_4_sa8775p.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---

Also, as far as I remember, INTF_3 is not a DP1, but DP0 MST on the following platforms:
- 4.0, SDM845
- 5.0, SM8150
- 5.2, SM7150
- 5.3, SM6150
- 6.0, SM8250
- 7.0, SM8350
- 8.1, SM8450
- 9.0, SM8550
- 9.1, SAR2130P
- 10.0, SM8650

Please update them them as a separate patch.

For this patch:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

