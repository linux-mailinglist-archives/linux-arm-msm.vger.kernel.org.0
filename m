Return-Path: <linux-arm-msm+bounces-102810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLMPCZCN2mkc3wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 20:06:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 921D13E1353
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 20:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 765263078AEA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 18:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8DA33ADAD;
	Sat, 11 Apr 2026 18:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j6FWnChg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QHvjZ8V+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034033115A5
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 18:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775930665; cv=none; b=UYBf6r3SZnw8djAt1ra77sBPB3/JEkvMRH+hsG0xvdpblHxVb0vwyRW1Q8TnEwqg5Z5cYIm1fvo/7Kb1FSpR2f71zsZLG+TtBK3kK/aV2HHyC3WTWn4HRzR/+t+im11//OtIhb2EC19qB7NlAylTjvRX20VMMMO3UcNxGx5xQ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775930665; c=relaxed/simple;
	bh=Dpw1x4PPPKzJt6tNdNe/k+zvMXwBPxMMh2C2yMU/q3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OEhZBFmmCGfju3pGr6oSqgK53TxC6zxXL0lX5pYH2hINlfrS4au1Y7MZXx71o0+UUKAm7yxRGejajmiTI7NnH1NPvj0O3ADcD2EPpD8GL2hkeRid0a7Hq1jai3o41Cay6ADIEDEQNFrIrPPVIF7Y+pl0cV4xEveAMS6NUv62J/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j6FWnChg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QHvjZ8V+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B43QB5621302
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 18:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IXF+ZYDY+njOzNrPh688DcH3
	uDbEYAIr/6wHxBHBDFM=; b=j6FWnChg5jqghWxdFlNpxybU/IEWqN/8+0gGsf2j
	/sBgRv4RKs2bzW1WKkcBxlkVCWmh6NoBK2gmwJ2SCwgD/o18+bPUV3939/7xgw4C
	zMUYZ63THeFzyGSyUs2hz7Fs2ZVW7ngxvJEAcx6S3SqKJaoH00J48oe+RsQoXNHJ
	UANVY32qvsWButxUuUXXYFSBpA7XZS8lRtkBp3fGG57d8AHWeC62Oi4mawgDLHtJ
	ewcbbhQgfeLM/VQIfa6oryyf9Zu998DuJS9fu8pCZgvwnz0v59GRUXo0TA4W4AoW
	myKS9cKRduptQJWZgJjEGGIZAuYd8n2YNkwFYZXarumCwA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfs68d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 18:04:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50da31af14cso30324171cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 11:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775930662; x=1776535462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IXF+ZYDY+njOzNrPh688DcH3uDbEYAIr/6wHxBHBDFM=;
        b=QHvjZ8V+1zL25tpHl4amoEodaY/qjfJq6ZfrkjF4dzeQVKaPlyn2TOP9kZu2L5VS0e
         /msqPP4uB7hrSmfjkZgumSpv43Fp3J0nUTWt1hE8ylfgR77eaUK3iqrOGfDBy9gAXOn3
         /KwnItt3z8QtJqQUDyGxRQlLQnUAuZoumuvC3isnK+70RAyV1yUexT113KXykMOsudAL
         D4RrNUUxtzZZEHOkk0eSec75cybBTyRbODcQchEdf+qty78V4ngbQV4nVOSkAHakUtIh
         WpTFS5cFsYtv6Q3egAbAzPVtCoKXlYmruXfpYb+fp0ZAqF5MHv0fErsFcr+yX5Hpn+3P
         Bj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775930662; x=1776535462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXF+ZYDY+njOzNrPh688DcH3uDbEYAIr/6wHxBHBDFM=;
        b=LD17VxGfRZDG8db4jWsbgYfOY5yUQ7kLV4ZatYRU6SsgRuas6ykBWZwRa8jzVZesPi
         K0c9PIVlwPxACiSyIHrfACIIiuzX51MFBkEh1m5dRwz1NjdQZ2fba4vq+UfRWfnvQmuN
         t4lvo0AN0rnZAGciI8UYZpNeREHkDccG6kV/rallIZXgOJeXMIH6n9o/t3cS5Rb/zb7T
         uS/ZZSv3gYSh4XwacD+bOdmeR5vT2yr+AwNDSsoAl8ucH4pm6nrIAJc9+R6Gte1cP2Ae
         lvTYndPGuxsW/8df3nZGgbhwNeBroaE086FNVC5zF33KOa5BuyG073XZtsL1F7xSWk2/
         mb0w==
X-Forwarded-Encrypted: i=1; AJvYcCW9W08WSIb74VBdFqUK+iWpwU2CzTaNt0A98JcVxY/JVs/DvvaOdPkiyMJxAA12GwrBZn+CPtfq8xaVEtn3@vger.kernel.org
X-Gm-Message-State: AOJu0YybNO5EL9O2wUr0oY6OZudEasseIX1CToDerpMBZ66pp6rfIcrM
	g9WmV0DvzMGOFxAmnBkvpAgIDf797MdglQz1bn7g2Aaj1tpgzgLhhDhsQ6YXLcIIQhNC6RwG+0g
	188xKsYmdM+gT0ZwNL5T3MUWJGzLGDFAjIBPUxWJ1dyOwpP0xY1wJPy7tSxOVhd+b1F9P
X-Gm-Gg: AeBDieuExOB36ZjxaBD5KinPQnxGiZfObY8ULsY5+mehbRbv6y3SGvYtFEj7KbaUjK6
	u9nZnBu6hc5Ms1GaNjuH9tJhgtTPQneIGxzuqutK6rXqajejRjusoJ7Dti67ovNGFwogc/pPdyT
	FrOM4HgBjP8qkBX4mgmVyVu9ysMvphHrfIUh2/svffk7y7tqngcI8c9sMtjYhVXyTWfSb+YW9pK
	/KZChZqP8P+iJFsieL7EHvReIBYA/K9U3tLCsrWTFQxqlTaEMxs0PnocF9c4j7Bbdc8zjgoiWnl
	x7vBhsvt2OIjlFckVhVU2t9FE68wDum5jnf1/1YadGSNAFg0E7wbjBDMCZojArc41h4IJOIrOhZ
	ktbHWJ1bUuVBKFYZgByBo54nCQgv44kBo+kVjwbpaZSxbdTtIL3eV440xX7hFnKjO0SbLM1/rsa
	HpkElch8b6f3xYDA0cp88ZQdwNoxpA540JQ0k=
X-Received: by 2002:a05:622a:834f:b0:50d:aa99:7bbf with SMTP id d75a77b69052e-50dd5c0be6bmr97373401cf.43.1775930662282;
        Sat, 11 Apr 2026 11:04:22 -0700 (PDT)
X-Received: by 2002:a05:622a:834f:b0:50d:aa99:7bbf with SMTP id d75a77b69052e-50dd5c0be6bmr97373051cf.43.1775930661871;
        Sat, 11 Apr 2026 11:04:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee11f6sm1535434e87.44.2026.04.11.11.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 11:04:20 -0700 (PDT)
Date: Sat, 11 Apr 2026 21:04:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 13/39] drm/msm/dp: introduce stream_id for each DP
 panel
Message-ID: <4z23aj2mzpgvaoqodncmi47uhydgtrzagh4j7uog565qm2t4in@mrkummd4vp6q>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-13-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-13-b20518dea8de@oss.qualcomm.com>
X-Proofpoint-GUID: YH5zTyJtVPCFyvgh2GQFOhlOr8ObsoZq
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69da8d26 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=F6drfhpXLueasqm-KwwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: YH5zTyJtVPCFyvgh2GQFOhlOr8ObsoZq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE2MCBTYWx0ZWRfX/xtp4+EY9sAr
 XMc1lnFr3LI3EvH1svgYxewMpEic7b8OpwYvQJj2f5bBf/kO2opSj5XxYkUGTm+RBwmyZCed8nx
 P9p4aLMDCxMKSh9YjWSPz412lgRXFVU4PR0fW+f3JvPgQITie55/NSinLrMNivc0Y80IXavNYVp
 s6/z5Bj4Gq6+n7I4LbQIowMEVf16EF6Z5KvHhmWnbH6CWsqzaJzdRL3YDDJF/QlUW5XtojoxQ0C
 +h19KK6hmDi2U9ge1t0VJDIwoEzlOcy0Aj5OJ/f77Y6Xxv6vzD/3BtztipLh3Og3FzbpGP4V8o8
 2uOuqMgtcaQxFm2L+NeG2sJ9Tq2xM4PVkl33TGcC6sp1UTl2gf0uW3qwI1qKrtUnnG3YRb7S1/5
 XkLKQXoJlF/tt7ZvFMIXuFqCT5Qo/e0TPLrHHrFyJ8dUBdlrBuotE72PPWqShoSZBe/l48nbzcx
 VaDDxrntDWG63bwSY7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110160
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102810-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 921D13E1353
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:33:48PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> With MST, each DP controller can handle multiple streams.
> There shall be one dp_panel for each stream but the dp_display
> object shall be shared among them. To represent this abstraction,
> create a stream_id for each DP panel which shall be set by the
> MST stream. For SST, default this to stream 0.
> 
> Use the stream ID to control the pixel clock of that respective
> stream by extending the clock handles and state tracking of the
> DP pixel clock to an array of max supported streams. The maximum
> streams currently is 4.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 57 +++++++++++++++++++++++--------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 24 ++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
>  drivers/gpu/drm/msm/dp/dp_panel.h   | 11 +++++++
>  5 files changed, 71 insertions(+), 25 deletions(-)
> @@ -2735,9 +2740,17 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
>  	if (rc)
>  		return rc;
>  
> -	ctrl->pixel_clk = devm_clk_get(dev, "stream_pixel");
> -	if (IS_ERR(ctrl->pixel_clk))
> -		return PTR_ERR(ctrl->pixel_clk);
> +	for (i = DP_STREAM_0; i < DP_STREAM_MAX; i++) {
> +		ctrl->pixel_clk[i] = devm_clk_get(dev, pixel_clks[i]);
> +
> +		if (i == 0 && IS_ERR(ctrl->pixel_clk[i]))
> +			return PTR_ERR(ctrl->pixel_clk[i]);
> +
> +		if (IS_ERR(ctrl->pixel_clk[i])) {
> +			DRM_DEBUG_DP("stream %d pixel clock not exist", i);
> +			break;
> +		}

Almost missed it. If it is -EPROBE_DEFER, we must return an error. In
fact, I'd rather check for -ENOENT (or is it -ENODEV?) and pass all
other errors to the caller.

> +	}
>  
>  	return 0;
>  }

-- 
With best wishes
Dmitry

