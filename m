Return-Path: <linux-arm-msm+bounces-62901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6376AEC536
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 07:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F0144A4C36
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 05:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB2D21D3F3;
	Sat, 28 Jun 2025 05:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXtRKEP4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E4B21C185
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 05:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751089477; cv=none; b=pmUHOCh+UXYmd6JW98E0uPFvp/PPIbbVviHBFiy9pmiOyOCCUQmwZv2vVG/FzPbefPGQdK1D+WVjkgRpJDEiV8BPbmc5L6XYIKVLgJbJzqM0CVXY20FDH+I2PiqaLYhBhN0bXxGlNksEebradtJhSVyg/hZERTB8njBjbOxWfVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751089477; c=relaxed/simple;
	bh=LOCz/6CnC9GBhCIu9bdP8uuu8MSu0vaUQ3DB4qVBqGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INjVf9DxxRKH38MhEv45Fp0TQzCYZf1exzMDd3P2dNH9v6wGq7Bb1PmRCYlDEQ6jBW35dUFHM+yC6aRdYROmbRVf6QwVNH0w1KfD/Alk6FOvUZUoSY0Nsnp2SpoiceMYkrTMwm7nkVhffOFZPSxB7rZarmq2U42l3J42HnVmRwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXtRKEP4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S2Y6jV022697
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 05:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kUC7xBVH0d3kUt+KUxi0+JwN
	EOC+393WJOkT9pG6mLc=; b=aXtRKEP4TFKHtUmtBmzNy022mL9zBvLDkRb6DyTV
	czwJL78WCRXlIYiqSW4JEKUssrSAp2EdFvZepoEr8Nb5KLUBmEMws1xyq57kdBQ6
	q7OkNErXx7m+LzkI7r5zJlyf76RqClwyLwGPvmuly92V4jTr0mgccAOH5NboNibq
	Mn65mplKEY0MgP9z18zUHHvnmYUY+8xCD0XzALk0yS6BD4bNeonQQloU+O08uER5
	AOohXr8rQknvAUR3hL3h9S7Kaxgty7AgNf7CogJak24XjmPYdy4RVUcowB3CbbLM
	iNVAKqpUF+mcy/HkPgjdq/sG4H/p25oD8jNWV2q8HVvKdg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm06nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 05:44:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d4133a2081so406405185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 22:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751089474; x=1751694274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUC7xBVH0d3kUt+KUxi0+JwNEOC+393WJOkT9pG6mLc=;
        b=WpM7OhtIQ9AefKLY56D1CbC2V2e1FlEaNIejy8x65qWPZxop44BOZ0rgFxs0S9a92z
         mu9rGzF6irXnKL+kZ36iznqzx3S4nNhvclt2BfU66QKOOZt3fhb8rZVAPQNjkONPeEb6
         yzBZmpYtNag+MvB3bZs5ugs+lY5Tmj5BB01SQKoEpkoStkgmjJwwkOduq5RDw9ecUEWa
         69783UW3nt66uy+bI3n4/57X0vYciNIGABwxNdU6p+h5prJ6B9HSsxdAOOGgRCMpKzzW
         SyAxqOy51OYR2Al4fJ3t4E4uw24DLpZwvvc5nDAlECq7fIU5Ue792tW6VzAsQZq0hU75
         kpgw==
X-Forwarded-Encrypted: i=1; AJvYcCXrhEKZI0ly2fH2ADhyQMvla4jh2G8+5psituN+jDY4eSCu6wmirnPq0ADQyBhNWoySo0HoTXdmgU3YW8Td@vger.kernel.org
X-Gm-Message-State: AOJu0YwbV8CybMlxQ7IFtvPMqioyTAVsO38Ir19NQWcmfk20kcJUagjl
	35vElcDvXr8V4l/JSoDF/m8Fw/i6NhDH8egcWlw6lmJsRmussb0Q+CoNd32XvPqCSlFRnZ+/y5a
	eqPgs+NUN0xlWvyjbl3mLZ4yRftqqyFhNNrqIkou7UBNC0S/2ziMMWn43LYww4Vzynav4
X-Gm-Gg: ASbGncs/kcE2rkLDGNdtZfNG6u3SNeiHF1Ov9vuB8yO+cT1zgT2PCgXI6kERHcGfOk3
	qq5Af+JLijzPrm4/0qQ5HKIHU2comeZ+SHDv8Y1qIavM/OfP1iItnp02pmIgPTXJv6+JrXNAGD1
	d5EXKRGAUsuStKZBKtiC4utioduqWlZqDqLO4Gk31Zl+bp20KO0u5lKogveyzJ6JytqQcJY0BYE
	ou1083U/1t+cxM5pSEgkmPA0ftl1C1u0axDREVOOp+eIBqcPskGhZZoUDYcIU2PZSTS2sBlvbMd
	LrB80+Z4KYvaayJ8kQtk2AY35fldfk3fjOB9fANIbfzCkFBndmqAFOP6uyv8qzBKrSHwM/Y7sG0
	xhsUkwvvHYqUJ87CrVcrpaFHK536BnTBxYtQ=
X-Received: by 2002:a05:620a:284b:b0:7d4:27ff:b7a7 with SMTP id af79cd13be357-7d443993447mr967061385a.48.1751089473628;
        Fri, 27 Jun 2025 22:44:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVAxxSrkbOEBKx3cz0+IPQ2g/5OlD0DOAiPlEbJLOnN3L2vQlF5ZPs5hb6q+9b3wUtWW6npQ==
X-Received: by 2002:a05:620a:284b:b0:7d4:27ff:b7a7 with SMTP id af79cd13be357-7d443993447mr967059185a.48.1751089473192;
        Fri, 27 Jun 2025 22:44:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d1b2csm685996e87.194.2025.06.27.22.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 22:44:32 -0700 (PDT)
Date: Sat, 28 Jun 2025 08:44:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
Message-ID: <b7mv4u2parcyzrm67yufuor3cwx265kaoae23rksbbuu4aaayl@7a6xxfmganof>
References: <20250627125131.27606-1-komal.bajaj@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627125131.27606-1-komal.bajaj@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=685f8142 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=6MIUTFbEWCSSVVwswsMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bSJOYQyYoTAtnHkr2oUfC7fsy93nBjDj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDA0NCBTYWx0ZWRfX+QkaqShDlpYq
 cn2EazPOYEgVWwB/QxJQlPB9hR+I2viTHQUbYBwljkDf/RA8hq9IB8eWZC4PFabZnv1/CIqCOpm
 f25hitmtuZQzBzWJnuPQcqpv8LH9rcnHO3ETHguKB/0Z32nUQuZ9jVbm79guDvLLvSS483413NG
 3WK9WIJ5bywNUBE+SJMR/2AgGWubw3Kd/IPxP3vn7OXugXMF9e3qfTf0YizlNi6TuW06SNwFQzt
 O4lp61t+cH7LqRgKnO4ZVDmJLZkSP1MeRVtF29QoVLqkyzf0a6Bc67/OlQFxxlm92LSyjKINlp5
 iMNzk+YX2buibicvb9dvCumRUcFrIGdHKzdvqEguDKka58f2XzbIL8Z1+Ouu8Yg0P//O050BwRT
 MDwLM+ljw8cJF2b05bRLP1AvRTtlnL5chFwm0mfVKSvScSJ+Y2QNO4Mmm3tHi6iXU2a1UUCE
X-Proofpoint-GUID: bSJOYQyYoTAtnHkr2oUfC7fsy93nBjDj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280044

On Fri, Jun 27, 2025 at 06:21:31PM +0530, Komal Bajaj wrote:
> EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> as read-only for HLOS, enforcing access restrictions that prohibit
> direct memory-mapped writes via writel().
> 
> Attempts to write to this region from HLOS can result in silent failures
> or memory access violations, particularly when toggling EUD (Embedded
> USB Debugger) state. To ensure secure register access, modify the driver
> to use qcom_scm_io_writel(), which routes the write operation to Qualcomm
> Secure Channel Monitor (SCM). SCM has the necessary permissions to access
> protected memory regions, enabling reliable control over EUD state.
> 
> SC7280, the only user of EUD is also affected, indicating that this could
> never have worked on a properly fused device.

Most likely SC7280 Chrome platforms were fused differently or used a
different configuration of the TZ.

The question is whether there can be other platforms (e.g. SC7180 Chrome
or SDM845 Cheeza prototypes) which should use direct register access
instead of going through the SCM.

> 
> Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v2:
> * Drop separate compatible to be added for secure eud
> * Use secure call to access EUD mode manager register
> * Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_molvera@quicinc.com/
> 
>  drivers/usb/misc/qcom_eud.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 

-- 
With best wishes
Dmitry

