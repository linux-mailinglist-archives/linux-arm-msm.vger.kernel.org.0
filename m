Return-Path: <linux-arm-msm+bounces-88426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 468E3D105CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 03:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09474300F5A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 02:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8508530499A;
	Mon, 12 Jan 2026 02:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R8kxaDwC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uh91lRM6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACB71E98FF
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768185474; cv=none; b=H370ZzRt5/Wblf0W2p49aTVMwLbOrxS+XzhFeQVY5NjbcGftElPbm9QALPfDETY6YcfK9YHqIq4PRicmKz+zjf9VfB1Z+PANVEijT+tFwnAxl1RVke2FC1DAzqOBRXheTsvWCfPwpM03rXpbbw1vxnmQC9asyo66X/CF9FtCLTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768185474; c=relaxed/simple;
	bh=bTDyglSQZ39rQJJlnNAabTDpaX6qLTgUp5EN0PnNB/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bsn9XHV7sAOpw0pynomOnnSb8cTQj2ayXwL5ud2cpAVGHaz7BV1nacTWauBx/cQaQscxP0IavqTBUAdvSHru7/HtLgUtFtWFlocZN/czLbRRCmKDztPp1n3+1DsMfZVZpbjuY8aUjFKmAtoXueA+bghWAJ7ki25b+0zGaS2M/sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R8kxaDwC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uh91lRM6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BMufjA3601338
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iU/qwLHfmO52wXYSMBbBnvy9
	EbxBlQWz8FMqeVwDo8o=; b=R8kxaDwCQqBqZ7VppWzfFWJuNG3jhX4gwNqzqxhc
	7tw2PaTH10ciV8q6SchZXwatkJqC/9PaBFIJXB2brXsMsrpSrtoa89YTLWZsgNyi
	WcY5b74ku/R0PFjuHlmHXRpn8dG04pKXEraqVsDyTVZi/KXujcpFW7v1OlMr8rfY
	HDIelE0jKUtcJ4+XyRHv0ZncYIlpdGR1gwaOMalk4WBRw17KDpb4+ej0qRbjs9/P
	Qo2NBoGxuRfjCltwntsvJvf33YgB6BeRrTgSyyBKnMabnbeqiWuOzXMpIA57z90v
	vFwC4jrgYzQujbBPIIWXo84zVuBfxFhX2kIPiTWNwQK2Jg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkjvxtvu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:37:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b234bae2a7so1704760685a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 18:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768185471; x=1768790271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iU/qwLHfmO52wXYSMBbBnvy9EbxBlQWz8FMqeVwDo8o=;
        b=Uh91lRM6dPQClg3Vj264SpTItT6NeomQf7UcyBD8a+ksheFjuTONEK34/T/ylkg9j/
         RQrdO5oIMfuKwtvlipgGkCKjMAGWi4TxmSLfddXv9Dg6SeM+BbbT+yJG/EcZOKosQKq9
         l8pNe+HsXf1W+TMYodTwRqtN2UjXP+ricdaEmxf/sEVie4kctv1ODmvCNomVbJ1kpe/T
         CEKo0lTNR+8a5ShKEDdB+J7REgKGAemLSmNymdfdx9FVRFVXMjH5B0bjL3uWgCo+hPmB
         tH/i2aoYNaxVaeAG6Epi02R/iKeWQn50wMVa4iZNtbTK+16y847qu7zhtKn3tpwC2j7d
         HG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768185471; x=1768790271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iU/qwLHfmO52wXYSMBbBnvy9EbxBlQWz8FMqeVwDo8o=;
        b=DUvnmv7kAOIP+oa6im/6TbmG3/NUbKPBz5ZilHjuDNZEQjgVpvdqsOSMZFRHNbh3qP
         +EKgujPF38cjboCr+NCyMEr6axiyE5ph8FD4aLbVPB1PVsw9KVqz7AlJvtqxvA/QLH8p
         dOALoFUi+OdECo2eIRHsOS/UO4iYz+sgY8BRBwzkMi/weFIN7JrwM1soOiWz2TEi79Lb
         F3L34Ny5Pv5uo4oOc0noMRnUh8+SdP3EdwVDbn1xNbq6BOv0LFssyQHmYzJ6d29qAt3q
         fwuo2HPlGAq0ZiH8lLLRhPGi2CIRJCnTcey725ELBLGQRHQiQtr2RXfOFkcHzp6Ct2R3
         Vfyw==
X-Forwarded-Encrypted: i=1; AJvYcCWy5LwB8oSNYrhBPDExLxPdl3EaYgEW6FVjx+tvczHYMVIakC4L85CTJWVyTqSWuDpT+kaDj+HQEOyIllQj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw5hUAeWzIrZyhw/Y17YuKwx5RvwB9/hMihzHjs1N1CQIEM6PV
	xtOAMj84Yd2nkFviyqp7ne0YOtAN/tmKbQ5ts4s/TD1rYonKIsB76wDGxREqVVDCv2A/z9v9hWe
	MqmHyj2L97ZURP0mmkEesQfcorWcgLjCOqqOHO1Q8jLBjmZTdmfkSiSwWLrlXMbpwjcoP
X-Gm-Gg: AY/fxX4EOm4yX6VWe0Re0E4E6JajU7+Dk7zjm7iW4xX81JA3cfnSiG2dB/by/VMYkHk
	8tfCbAcO2IxZF8GFja0app75I9NTKS+VeQPoPyLvIaAv7kIazKS6ENvrAM5ct3lUyBSAcP3mEj9
	Y6RqUFfwOafCzLBHESt4Fb6nSxPNJ0q3YGTwjugl2zVvMSQ702tQJvxcLsGVVOBZL+MshquGsHB
	oKceAGpTpkafG0D3GyUkb+Mbwk/lZ4Yx1dhuRdf9T4awMU+8J6C6B3O+ykTL+uJ0SQUHu4SUEmk
	/yThWvBaRoUNMo7nDPzqe6cg84IdA+DiIGmpaha3y92bLz7JYXofTJu7X858PoCl8U7KMdlOliU
	B/7TscxhfBjrLOF6As+EjLRrVcO4HJXdr3ppRHW/iNgm3NsmhC+Ee2tIlUxSxJn4zGcNFabiIKK
	cu2mAG89wLGgx5x7BUFrItVtY=
X-Received: by 2002:a05:620a:1791:b0:8c3:7ec3:4bab with SMTP id af79cd13be357-8c38940319bmr2179321185a.68.1768185470847;
        Sun, 11 Jan 2026 18:37:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmQaXbfmnleizxVozhvqVXaWGY6YDbXSxnvQ6ZoqoB8xbMjSUP9xoP+727vHQgt/c4xLi+hw==
X-Received: by 2002:a05:620a:1791:b0:8c3:7ec3:4bab with SMTP id af79cd13be357-8c38940319bmr2179319585a.68.1768185470331;
        Sun, 11 Jan 2026 18:37:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b7b8210ccsm2497226e87.48.2026.01.11.18.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 18:37:49 -0800 (PST)
Date: Mon, 12 Jan 2026 04:37:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
        patches@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/msm/dp: Avoid division by zero in
 msm_dp_ctrl_config_msa()
Message-ID: <zmfgq5d2gwrxgvr4eh4th2gjef76gpbv54kz2myvfnqgpor4dn@7qjr262yryap>
References: <20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org>
 <ca851614-2804-4029-9799-19e71dd73414@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca851614-2804-4029-9799-19e71dd73414@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wrsm8Nfv c=1 sm=1 tr=0 ts=69645e7f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=LpQP-O61AAAA:8
 a=tB0veDu0MfDHHowGF4QA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: YbGgH5zm8LlRMaAcJoYrOPPojKyYLde1
X-Proofpoint-ORIG-GUID: YbGgH5zm8LlRMaAcJoYrOPPojKyYLde1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyMCBTYWx0ZWRfX6wDmy9awbiQq
 E7zar/a3HkVAwxd1eJirF0n9/bP8vqUaU5rWrpH0JGuPvr2BP3slZMjpEf1RXsiDyRHYS6aLEWS
 ohuFUulu2vNQqS2BBLW7lo9WldbLDkLypSd08MBsnuT1hXOEDLeqVHnynk5vTYFssXWny8nckoY
 x8AayB1ew1JA3BwMB1gUO9A6gv4RvuSv5F9cyajrsRWrngxjfbbHgPrYlH6/ZIAjfzkXPj57VTT
 qSxxMXz38dvt4jUOR2mLvOtkX8574Eyqf4Uab7nS7+gRxTJucvvVVdSWoO0M3DwVmqycJ6sTRpb
 1aPApoOx16Y343ql/xll9bhlsTahylWId72TkPlGpR1FMSsUcaZ88oRazEj1olQbhDW1vH2fngq
 ocjimGuVpPAAk1p27r37bmGBoqQMvYZWUzwRI4MQZmFYSyr6QGhxdZuV2hQHDqzqq3RRn1SmW6T
 N30pR249sH7zJzBiJmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120020

On Fri, Jan 09, 2026 at 10:06:29AM +0100, Konrad Dybcio wrote:
> On 1/9/26 12:29 AM, Nathan Chancellor wrote:
> > An (admittedly problematic) optimization change in LLVM 20 [1] turns
> > known division by zero into the equivalent of __builtin_unreachable(),
> > which invokes undefined behavior if it is encountered in a control flow
> > graph, destroying code generation. When compile testing for x86_64,
> > objtool flags an instance of this optimization triggering in
> > msm_dp_ctrl_config_msa(), inlined into msm_dp_ctrl_on_stream():
> > 
> >   drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_ctrl_on_stream(): unexpected end of section .text.msm_dp_ctrl_on_stream
> > 
> > The zero division happens if the else branch in the first if statement
> > in msm_dp_ctrl_config_msa() is taken because pixel_div is initialized to
> > zero and it is not possible for LLVM to eliminate the else branch since
> > rate is still not known after inlining into msm_dp_ctrl_on_stream().
> > Change pixel_div to one to make the division well defined in the
> > presence of an unsupported rate, relying on the DRM_ERROR print to
> > indicate the error to the user.
> > 
> > Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> > Link: https://github.com/llvm/llvm-project/commit/37932643abab699e8bb1def08b7eb4eae7ff1448 [1]
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202601081959.9UVJEOfP-lkp@intel.com/
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > index cbcc7c2f0ffc..e4731c059ed8 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > @@ -2395,7 +2395,7 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
> >  			       bool is_ycbcr_420)
> >  {
> >  	u32 pixel_m, pixel_n;
> > -	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
> > +	u32 mvid, nvid, pixel_div = 1, dispcc_input_rate;
> >  	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
> >  	u32 const link_rate_hbr2 = 540000;
> >  	u32 const link_rate_hbr3 = 810000;
> > 
> > ---
> > base-commit: 66691e272e40c91305f1704695e0cb340cd162ff
> > change-id: 20260108-drm-msm-dp_ctrl-avoid-zero-div-be5dc40cbc18
> 
> Dmitry, would it be beneficial to throw an actual error when the rate is
> is mangled? i.e.
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index aa2303d0e148..4f710b8e6bc6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2404,9 +2404,9 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
>         return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
>  }
>  
> -static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
> -                              u32 rate, u32 stream_rate_khz,
> -                              bool is_ycbcr_420)
> +static int msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
> +                                 u32 rate, u32 stream_rate_khz,
> +                                 bool is_ycbcr_420)
>  {
>         u32 pixel_m, pixel_n;
>         u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
> @@ -2415,14 +2415,21 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>         u32 const link_rate_hbr3 = 810000;
>         unsigned long den, num;
>  
> -       if (rate == link_rate_hbr3)
> +       switch (rate) {
> +       case link_rate_hbr3:
>                 pixel_div = 6;
> -       else if (rate == 162000 || rate == 270000)
> -               pixel_div = 2;
> -       else if (rate == link_rate_hbr2)
> +               break;
> +       case link_rate_hbr2:
>                 pixel_div = 4;
> -       else
> +               break;
> +       case 270000:
> +       case 162000:
> +               pixel_div = 2;
> +               break;
> +       default:
>                 DRM_ERROR("Invalid pixel mux divider\n");
> +               return -EINVAL;

Well... In the ideal world, we can't end up here, PHY's
configure_dp_clocks (or qcom_edp_set_vco_div()) will fail if the link
rate is is invalid here. I think, we should return an error here, but
there is no need to propagate it further.

See the discussion at https://lore.kernel.org/dri-devel/f2ce6ae51c50b0d2e57b905c63b43413@codeaurora.org/

> +       }
>  
>         dispcc_input_rate = (rate * 10) / pixel_div;
>  
> @@ -2458,6 +2465,8 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>         drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
>         msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID, mvid);
>         msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
> +
> +       return 0;
>  }
>  
>  int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
> @@ -2525,10 +2534,11 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
>  
>         msm_dp_ctrl_configure_source_params(ctrl);
>  
> -       msm_dp_ctrl_config_msa(ctrl,
> -               ctrl->link->link_params.rate,
> -               pixel_rate_orig,
> -               ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
> +       ret = msm_dp_ctrl_config_msa(ctrl, ctrl->link->link_params.rate,
> +                                    pixel_rate_orig,
> +                                    ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
> +       if (ret)
> +               return ret;
>  
>         msm_dp_panel_clear_dsc_dto(ctrl->panel);
>  
> 
> 
> Konrad

-- 
With best wishes
Dmitry

