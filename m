Return-Path: <linux-arm-msm+bounces-79271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F35C16AC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 20:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B6BCF4EC8AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 19:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FE42BEFE5;
	Tue, 28 Oct 2025 19:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbeHfU3J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZGwyuja"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3C223D297
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 19:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761681155; cv=none; b=kJbmHZoUzp6A3c4GsjVLr+MQWmo6IVSig57pqWpXzSTfJykY09M+vsI4qzc9qbhq4+fYdkzggVxqWG9xErPvf7Ok1+gfo7zQAA8FUihIiz5/p+XomgW05QKLCSddZ4EfXA9bQq8h48v7azokRDLqr7jlzCdEF9ppkaFgSG6Zy3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761681155; c=relaxed/simple;
	bh=hCdmMYQdl7Bq1AVpiscrBlBESr4As8wc/YnOagesyLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8elUPPXM5piUkeE6K99HJVNFs6Esfx/Kn28wls/Qsr9gm69iOvRxjOgrevKxddk+5uKUiAf6acyp9QRL4XqXDsRwjhjI8kkFM0P0AE8dClzonDt/L8OQWToY09B55SscwClV/Q+XK9FFCim09GZyZsruS39jGnZlyJJviWZxRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KbeHfU3J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZGwyuja; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlNEP2523760
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 19:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YT9nBxzRwOGhdaFlMTQmBnzt
	oTUtZuh0+unpXnt98jU=; b=KbeHfU3JRqpFXUFIctk/erizrZMhz7eVjxQGiE9A
	bvCzEwUSm7lB1OBjphhTzRDHqidu+X0ysM8A4tysMURANiUt9yeQD09CqD24KnxM
	O3z/YNg+OKIb6LcK6BJFaO2Da8sqS54QVK3T7mIpKATTCeugFYpq35EUOb180KGI
	cmUNOHi8c0ZjgRZ9IjEbOS1EAdjQ0A+aqgb1026JNLsk8UxQitR4I+DeLUbb7iv8
	raPIwJSINHg61113g31llPbN6tWm//wTSire9HoemHL29OvtDDuf5no9qBZZlU5Q
	0s1K6e8VrUXG+fyb12VV7FL0Gb5F4Wx7ruvnHxU56PjSqQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1r0b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 19:52:32 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87bf4ed75beso141738946d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 12:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761681151; x=1762285951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YT9nBxzRwOGhdaFlMTQmBnztoTUtZuh0+unpXnt98jU=;
        b=MZGwyujaTyzS7qIEZLRKYxlPKnDO1dxKdZWIitgedkLiJYwt+eVvOIRsgoZaYDRDYr
         iEGRcdeVloDJd093ALpKY6aT1jMQ0CK9MOn4DvlUDg4XbiYtJUuchjfbBClW69t9JPvG
         8seMoEr4v81KdBZ99tVkJkm0bvT2DkpMNDzCWBJMrnvwCQI7kQJseRsRlQaPNI2+CzsW
         RP8lykm59yh5tc2VPe6e44W0g3bz2YE44HICLawTfIgSTmZGkaY9RDC+oa+LZlrymNxS
         3bcTATUywskmEwO9M3okn2HisYeGSkgpLDE25LLBga+avsZEfn3zJvO8AUtUOmaKADse
         WoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761681151; x=1762285951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YT9nBxzRwOGhdaFlMTQmBnztoTUtZuh0+unpXnt98jU=;
        b=cz4+w6q5wiLegSzGILWvtnGopjmzbsZ/QcX3MeRi69r3H/ostzw0YfApg3FF7Etok/
         N22bUTL5Z39upprXS2KXrG2XWrlS9S6d8H9vtVTFYdIhlMBcBsyk9gYD6igBNK45bAac
         fGpxOxf+mmLI0IWCSlHwInObMgKln2uu5bVf0flh7LbuduzPGMeeIRBp3BeR0IxKEsQt
         fshrOLZUZvm1S3ss2ImtqgBi5U+LB5EOeuyeXfOIYOhcyw6k3keAMj7a7s3p4tD5zJtG
         GUvMValT5BvthCXjAcoyHme0QrCDVyWjoLLQvFxaQgfdjh7V3vkxTCWFl7iYJvSGCnCB
         rWbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ6TbkiWN6oh796pXbynN0uBWoIIsXcys1ss08ctYSax9+FN/MWjxGa6tk1uLNCH4sKWB4g1V2Djwn9jhk@vger.kernel.org
X-Gm-Message-State: AOJu0YzZISuWAMIw8EaireygAd2zmIYMtRpkPN00SPBUaeXzjCN+kDwQ
	pmeowu7ZnAz8jiVqhW2MVqLt3Ph3xoabhSg6Jxd8gJod390in+ZcytqXkWDu5tp7DTWWC1v9iv1
	394kVt9xHY9UVIC2BoDFU79pgK9DNtx54V2eXe+r66wVsFPjSR2mqlnJbNn29FIoEH5Fc
X-Gm-Gg: ASbGncs9WlWb70FDlJ/Mqt41mcCnMBG7P4svtWJY9AWuZ4xbnuYXNGye1w6Turwdhwy
	w48XCuPYMRMxVx6sMrN0WQ976PMYQjjze9STBJLfhQgScZtmzgIDIOYMPhaq9ohmIbxFPYDzIgA
	umvVy3RtWD/FD38TcHuXROqnlP1Hxa4doAfwlrayafc3b304EAgvm4/3QwcP+TWlf5R+fbjPrdE
	+RI+E3Htxzqz5nQYSN+ubN+SzKsOZK4ZMW6thB0kbhWivgeJOwKACR1UHlqiqgZImJJOVJI5jci
	XdaLND1H6qWnQ+Ly7yERsCCvGugjLUroF649Na4aa1i5fJNCqagFtSQg75NLdWaphJKhr9kVOtM
	m1lfPqazRzZ5rghueYT7u9Tn62xzpXjxY8ZhZGNLPb/wxSuPqHMjz2QOzlSdPEPNFvxJxA8wFYN
	gwZ2qJhP27L73K
X-Received: by 2002:a05:622a:418e:b0:4d8:afdb:1283 with SMTP id d75a77b69052e-4ed15c47484mr6705151cf.66.1761681151368;
        Tue, 28 Oct 2025 12:52:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+B3fkJotoYf8TZDvTT6DmG2RnwhQUDzDxIYeTjOWl0E+DhG6+DrycpxzJ9puTyhByx5+Rvg==
X-Received: by 2002:a05:622a:418e:b0:4d8:afdb:1283 with SMTP id d75a77b69052e-4ed15c47484mr6704761cf.66.1761681150785;
        Tue, 28 Oct 2025 12:52:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f6856fsm3240936e87.68.2025.10.28.12.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 12:52:28 -0700 (PDT)
Date: Tue, 28 Oct 2025 21:52:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
Message-ID: <da56lghirjcwesz4usdlfpttwcmvoql2h6bvjommoyfskjdkgk@hrlgx4ukt4aa>
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
 <6381550a-4c1a-429d-b6c1-8c7ae77bf325@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6381550a-4c1a-429d-b6c1-8c7ae77bf325@linaro.org>
X-Proofpoint-GUID: NTb0eTZR_Jg43ThxGc4ogDA2r10CiYgw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NyBTYWx0ZWRfX6i0cxbdSWZPF
 QYYqemSTKQdAsgZ4RjLOmfe1AYv3BONbMEYViEi6iME9dPFg3UAyZX823K1xOcH4JhrqpAIECAd
 4AoLTcelEoSvinUj0iw+OjR7BKhiNWTfW1dkKGryqWlTorRvvSo92Euq6jrELwufgaTREHnRLrN
 YmW7dB8VLbOYpFyIbGorMOv5b09gPzext6J8wZhOsL20xQfkqQ110oH245kYGjs14uWQPl6huFN
 flYRZfEX5ZtZE3eVZGNl+yDV5A1t2T6dFr15AtBFsnxLK4Kfcv331H5okG/EFvXAQcD26F7hRmj
 T6NARlkj7WoSFB6bX6LDVnXQExDtU5ULJaD9QhKSFQ88ikDXULHBpFQYukptQ2MHxpZ1U1ou25R
 o/tZXv18/MRrAJxn8zW90jnaUm7VbQ==
X-Proofpoint-ORIG-GUID: NTb0eTZR_Jg43ThxGc4ogDA2r10CiYgw
X-Authority-Analysis: v=2.4 cv=UObQ3Sfy c=1 sm=1 tr=0 ts=69011f00 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=VtADSE1--9cgGQuNLtQA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280167

On Tue, Oct 28, 2025 at 09:42:57AM +0100, neil.armstrong@linaro.org wrote:
> On 5/7/25 03:38, Jessica Zhang wrote:
> > Filter out modes that have a clock rate greater than the max core clock
> > rate when adjusted for the perf clock factor
> > 
> > This is especially important for chipsets such as QCS615 that have lower
> > limits for the MDP max core clock.
> > 
> > Since the core CRTC clock is at least the mode clock (adjusted for the
> > perf clock factor) [1], the modes supported by the driver should be less
> > than the max core clock rate.
> > 
> > [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - *crtc_clock -> *mode_clock (Dmitry)
> > - Changed adjusted_mode_clk check to use multiplication (Dmitry)
> > - Switch from quic_* email to OSS email
> > - Link to v1: https://lore.kernel.org/lkml/20241212-filter-mode-clock-v1-1-f4441988d6aa@quicinc.com/
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 35 ++++++++++++++++++---------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 +++++++++
> >   3 files changed, 39 insertions(+), 11 deletions(-)
> > 
> 
> This test doesn't take in account if the mode is for a bonded DSI mode, which
> is the same mode on 2 interfaces doubled, but it's valid since we could literally
> set both modes separately. In bonded DSI this mode_clk must be again divided bv 2
> in addition to the fix:
> https://lore.kernel.org/linux-arm-msm/20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com/

From the docs:

         * Since this function is both called from the check phase of an atomic
         * commit, and the mode validation in the probe paths it is not allowed
         * to look at anything else but the passed-in mode, and validate it
         * against configuration-invariant hardware constraints. Any further
         * limits which depend upon the configuration can only be checked in
         * @mode_fixup or @atomic_check.

Additionally, I don't think it is correct to divide mode_clk by two. In
the end, the DPU processes the mode in a single pass, so the perf
constrains applies as is, without additional dividers.


> I'm trying to find a correct way to handle that, I have tried that:
> ===========================><========================================
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 48c3aef1cfc2..6aa5db1996e3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c

-- 
With best wishes
Dmitry

