Return-Path: <linux-arm-msm+bounces-56585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 908FDAA7BB1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 23:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 377F8189EAEC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 21:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F4B20E33F;
	Fri,  2 May 2025 21:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eg4EGt4k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095721E5B62
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 21:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746222877; cv=none; b=c2ZrSJHCcvkmeGNKpPkh0TVs/5e4pkvVV0yTnM3KrE2iJMP6ewGedvuMEbDZWrlDcSdYQojCbOPY8/kDjNQuXwpZ+XjubsCwQ1ublAuCSZmcxgnewKWiPAcW+vn912zi3BCYrVuh6h0tUp5ywAkQUM0EvVLtKf3YdcKGnLQ9dgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746222877; c=relaxed/simple;
	bh=oI4I5d86txGEHxjAucxL/FgAlbfH0MXGR4BoOjHGxWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPQWIRa5ZRfCwChzzJT8SA8547FIM/0fGWOf01PNxEHV419W7q1EreRzXEuPhzH3qjYVZycpAOmtdS11xGN4yBds/VipbSkzmxqAsdX33G4b22gEfbNXYr6/0iBy+zcb+IwUKGC+cu4No0PozhS6J3D7urXlE2fhHZ4/15fADqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eg4EGt4k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KB0rd002502
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 21:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZvmUzQIOGUeAfMrPOeRpQnnw
	QcRiuGrm59juc7Vfi40=; b=Eg4EGt4kWmq/sSzh+ivYS2g7zy0H+y6Eu7n+/YwW
	gjOpWPeoF5bsEi1BVvb8/R41phFmNbOEvPO9l2GwXtfJzCYqwDx9RMJisk/+QYPX
	j0f49tBT/JNTYPBOJ8BT+E1F/nryzMMmCxEu/QGyrOzlmqdYrgpk+Mhz4VGK+f3u
	Trp8+kxg+tpGKayKtk9uIkuzqKRS4JiH6Fon0Lhjj+GikjNYy5QlgAx4AS9jZoqT
	ZIzktF1PyUXW8zqN9NEgCACo+bRKo9o4xLU78T3j/wkGwkgoeZDUgtOXoGyGSKgw
	2NEJqxHeDVMW1IVpKfMlKLbpY6H7tk1dLWQf6lP91mM9ZQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ua1c59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 21:54:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47693206d3bso63765271cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 14:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746222874; x=1746827674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvmUzQIOGUeAfMrPOeRpQnnwQcRiuGrm59juc7Vfi40=;
        b=AUqAq75Dos6YGKTNimL9ccxKdiqq6JJyCJYbUBhGVRhurVBh/kFAcZkCH4CYeX2d6y
         dtlpRgSzIeqBXQ6PGHFxOKP2WqDS2ps/1CKDPW9/k2BvIEa7NS2TKnjOrDlNjkkkUXId
         seKoDmHJWFzOUNLTGCvFMIxHMt9JrKr298pvXtWG3mnUYHRJOwz79RhgZ+OVc0QjqPrK
         B9p02PGjA2eAD5HjPSB1suPoeQAbsIXVCZQDbpMf4yKtYWDCJ+Zv00b8wSlWmlwk03OY
         J9enD3VKilhgHkTrZWRoNlq/3fSp2MudU/p85J7/QWf46gm527AC6/MjBUvAdUuzG1J8
         OM6w==
X-Forwarded-Encrypted: i=1; AJvYcCUdveX7iHjF/hWkkWjY725RpdDMIAKXEcNq3WVNeQXuTOHo4aWd/qhxNjLymBinYgeZB2OsPR1zUalSmIR2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp2wYKEHjtqh7JfCyoVVqL1OoOeL3qIZFrwYqIyt0a3ViQLQSK
	iXQvja+NwAMIsYcUqxD7GWl5mJy0nYKlJF5YAcwnUqbi0rPE4eyrPTyNZA6x7Eu8PuzapWL/EwH
	OAd1VUz3gvW8wFlR7MItlDrJN5jpQBiviKt52Mh9z9MsbhDprS4c1H7bKk8rLygAk
X-Gm-Gg: ASbGnctdYwwgW831ragP7ge9vexHlZACMBaIbZ0Bi5rA5qM/iSjRf+chWplrzqI0O87
	qKt+CZ0+MPMYtj/iLuEz6ATypRIIWs7Lq0LSWLikkVbPmp7Nrfz9XsYkjYW/vvWrjhOxAgDlyTj
	3ftRQNXNBK4Hu30tNPDRq4QR4qtPEgIr297w9Bjzebm1KzoP4OpfKtSx7hN2m4G4S5vkNFYBw4L
	P6HDYKLDLERJe3gmRCo3pHnJalOJ+S7ziks4fwi9VWEGhwuGevYxEA36zIFhERhqILK/RTgMSl2
	pyKL0JMOJ39HawUZRYy95kyhiqZ2ZmbHkC/FHpKY1VlAy7ZpbDIu313Kv1y9QSxXbjN2jQoztAQ
	=
X-Received: by 2002:a05:622a:420e:b0:476:95dd:521c with SMTP id d75a77b69052e-48c32ec38d4mr68552111cf.45.1746222873833;
        Fri, 02 May 2025 14:54:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED/TtnQQiE5a9O3NSnNygm7M9WTJF7VaWZyyflCze2xLDga0nyVzzBO+XVlYwZOulERcJxtQ==
X-Received: by 2002:a05:622a:420e:b0:476:95dd:521c with SMTP id d75a77b69052e-48c32ec38d4mr68551741cf.45.1746222873418;
        Fri, 02 May 2025 14:54:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94bf00dsm503653e87.65.2025.05.02.14.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 14:54:32 -0700 (PDT)
Date: Sat, 3 May 2025 00:54:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4 1/4] drm/msm/dp: Fix support of LTTPR initialization
Message-ID: <bax6ropbymr2jqwlqvvmetgvsh35s7veevtj4sdwoh5jqghdwb@yrikyb5z3dkn>
References: <20250430001330.265970-1-alex.vinarskis@gmail.com>
 <20250430001330.265970-2-alex.vinarskis@gmail.com>
 <de448e66-01c7-498c-b5ea-d3592ac4b40f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de448e66-01c7-498c-b5ea-d3592ac4b40f@quicinc.com>
X-Proofpoint-GUID: cJeJyTZZFxjhBbM-dkKCpR8yOSIMFLko
X-Proofpoint-ORIG-GUID: cJeJyTZZFxjhBbM-dkKCpR8yOSIMFLko
X-Authority-Analysis: v=2.4 cv=UZZRSLSN c=1 sm=1 tr=0 ts=68153f1a cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KlA0SorxOHKmT8hRjgwA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE3OCBTYWx0ZWRfX3C7xmMqm/C8l 7vbCrMTHne+OTRnN27OhZH5uoxtpiPst8LescK6tb9FA9rZdkrlayoPr0GJcX3ixomrWoaaCM4w DD/RNvwMXQY7E0Hj9NOhyXdO/pk4CwDDSBenvdOHAA7kweAu2Qf55vRi6duS2g/a1bqe/4kYvc1
 xDYrn85jE/Se8PPONh3fN8JK+qfBCLwCM0SYPm29BLnKxQaXWQoIsNcQ18Ulzx/Uc7ecRzYf3qZ l/YAx+83vEgB0Uw1zw25cHfVprCfMFSEApcjfLVcXsx3KjU1GazgcdoKGYg7VF8NQbLgCC6A0Gi zOHaMkNLkYgesxsaFzEda2SqWbZhgt0/CTQbqvsSrj+SzlsZokjfh+YhZAo3acEwOLGW3DanKL6
 Q9Y9ab5ASd2usDOixPrC3Qd/JvqpTZj75RYY/fF72t0P6+JAqx0HhcJLoTy0OuOQ+eYwHhcB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=993 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020178

On Fri, May 02, 2025 at 10:41:41AM -0700, Jessica Zhang wrote:
> 
> 
> On 4/29/2025 5:09 PM, Aleksandrs Vinarskis wrote:
> > Initialize LTTPR before msm_dp_panel_read_sink_caps, as DPTX shall
> > (re)read DPRX caps after LTTPR detection, as required by DP 2.1,
> > Section 3.6.7.6.1.
> > 
> > Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > Tested-by: Rob Clark <robdclark@gmail.com>
> 
> Hi Aleksandrs,
> 
> For this patch and the rest of the series:
> 
> Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # SA8775P

Were you testing in a setup with LTTPRs?

-- 
With best wishes
Dmitry

