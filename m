Return-Path: <linux-arm-msm+bounces-118615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rYdXAtkqVGoHjAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 02:01:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A0C7464F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 02:01:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AAWPE8h6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EkbdYdbO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118615-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118615-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2F13300B116
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 00:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EAA317736;
	Mon, 13 Jul 2026 00:01:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE7A322A
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:01:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783900886; cv=none; b=GHvwJbcQfsppzr9kwdS08kW+rz6257gdUsefl65Qp37tEgucJoSf8IBZLx8ww/ka7t3lTKZ6kcOouxOHUpi1SGbUMo54N6PRKp/s5gOQcZ3aYV/yXwiwkFJF1oedHelc/VWoaHH0j3khc/dJ9koEqKfT10z36tI3F+WiIJD9qlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783900886; c=relaxed/simple;
	bh=GulJv0oav/MDL5OmYF28pqpKNnYpoDcIKDkZ5qAwWS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IBgqmdLuqvONm+XJlFBax2NVbEuiwS9ymBDfyyHESerk5eiDLxP9yJzJn0ugUMldp1DuD1D5Yq5Jr4qB0y7yjAs6Lb/Rl25dGnwo2Ud2a9slor6nP+tXN3wOjA5nxR4HVnz+rjMwnHibGQy6+kSU9jlgl5a4PQgIroYUwRtesG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AAWPE8h6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EkbdYdbO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CNWEBl3963999
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HAb8Upwmrk7LAt8tz3SMF0TU
	5cLVuPTANU39n3y2qgA=; b=AAWPE8h6GhRnojFn4dLLX+rkHCJ9lmKeqZ9QtcZv
	DSJYE0aa8/y9INRQt+wDBAguCCUbTr50Cg9klM+NoDG/xP1F3nrqWyExx17bKByZ
	DwC4++0JMjV6+nd2DftwZrMTHAiATBVrHCf400WnEBVcUxiu2MqA2vci8ciBCDYV
	4RcySD1bL5o0an8LTdcyKOayM3qgqB3RHT+1aRzFKXthSMWudjYi+qEzx+zx9ACw
	Sa7UWsqIdtre6/q+5pfAiRbBNqRQMrmIEo4bkqGW/v8Yx146MVz8S24r3TEheCZe
	C6i14gFgNz3xSzOBo7YG6VqX4j3VTGyV4bqH9LzuR0/WTQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm06k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:01:24 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737f1f1e1bbso912706137.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 17:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783900883; x=1784505683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HAb8Upwmrk7LAt8tz3SMF0TU5cLVuPTANU39n3y2qgA=;
        b=EkbdYdbObC3q/bl7XNvROWs+6J/NIpodCoeVyNxmz8EBZULnzQbg4EX0A65IdKRrn4
         Ke3XvP8clknBD/BWgQsNKPbpybtJ0IFCxyg90+/eep4xsOzq0ttR64QWl+CC1JwYxvb4
         g7hrs0GYbJ+/QRjvsSMOq4UiEoedlR4NPRxJa8TweZxbleB6bXz68Vh5Z9qHLILXNhMu
         LHr/EHWUOIrRe/pCZnkEbdZRYKcNaUw+Nraz303we67VTtrjoVAgL2EmbJtgz5yabHMt
         cevkT+DZJSyyAYb5U95vQoz7rDYgZXdb8kpaNyf1BVtTNDNgSyjYCNxcHab8PzlDoAoK
         6xvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783900883; x=1784505683;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAb8Upwmrk7LAt8tz3SMF0TU5cLVuPTANU39n3y2qgA=;
        b=QHMRc96VKEB5mD8vSxiWwvvhyHof/ji3MXXNvIyYoOqZqY/JEjU6DDigYbndrcj4Wc
         YyAY0lFYRPSSQ4na1nRbmF+e37FYWjKilwnmG9wB4uddfgB4jp5vLrE+gFRfu4rsxdr8
         FtbdwJyiG9Q9EZo1cbYg0c6shj0htdoAp50XOjYeFt/CivWP3gGXoDlg5WBM+ChVyvXt
         Xp9801HqqXUuwrpyxqU2ftXblAG7+dxb+6EjESTh7F4McEl48EIvPzMXKLoWUkkIwl27
         ppbxkLXlzRW/HIxhKVofuGxpAu9j0JGvqZQwd5k40kwaTabz/hjm8Teb44oYrSfm1OAq
         MwSQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKnHxs7zrqwe7P0hoCW2YI7SknucmHW6gKPlx41IRVbipfmLlQ5WfWRX43EZHTHC6UhS6q5BvdfCxO1gcZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwFIUomBtSdJAWUhhN4k+aRDAfL/03JBwpXscr39K6FnvkGVaQA
	61mcgzLPNoU1VabrjXXY72j+cWvd3HiJlU50am2SK+hQ5pZcybuALoEnrRdMb/h1locHY0Zj/7C
	hkqUNVXSRebbOd5xehpMS4Txmaac4gepLamC5HYZ4SjQrfbzS6RsvTlSKZWQMRs9/Je3o
X-Gm-Gg: AfdE7cnLAgmM9eCNFGCbdSWhUda6EyaHIMDwZFLwDnuC0a/NCI4HTfQJ9rWzHxMAKNT
	B5X/bcFbns62V0JdFXAm5S4p2LOgWnSONn7GpyPW14K3SP50pNimvz0rSuk0RokfxU7fHwTXntW
	Gs3pVt55VN44sfave627L/J4Meu/MJZp9oQck4TdwRRk3b+8aDPZmQm6czWcm7HFC8mBtNgOQHB
	Nv3nfwv2ysvu/qjP+c4cEdqrChD4DrOUY6oW3t+r7rbw/SP3RIRPbAwtlM8qOik5YBRaWqd64IS
	+SN/8EILbJoAfhvNOJpF7MyUWyOlQqW+tPQxqwH2HN7GPpYqQo706bVHpc2BWWxi5llyscFKjeB
	rciHKba06QT9LKyhpRI45yCwhsdbV7YFXcVzWt9UfRU8RxRp5BEmJqmtiV7SzVvM44MpAubxhU7
	IO7mgB1lEB2AjkGN5ph9OSW94r
X-Received: by 2002:a05:6122:35ca:b0:5bf:d2c7:c481 with SMTP id 71dfb90a1353d-5bfd2c7c633mr2128256e0c.7.1783900883347;
        Sun, 12 Jul 2026 17:01:23 -0700 (PDT)
X-Received: by 2002:a05:6122:35ca:b0:5bf:d2c7:c481 with SMTP id 71dfb90a1353d-5bfd2c7c633mr2128231e0c.7.1783900882802;
        Sun, 12 Jul 2026 17:01:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b1c943sm22431121fa.18.2026.07.12.17.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 17:01:21 -0700 (PDT)
Date: Mon, 13 Jul 2026 03:01:17 +0300
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
Subject: Re: [PATCH RESEND v5 20/25] drm/msm/dpu: expose dpu_encoder ops for
 DP MST reuse
Message-ID: <uja44sqcdoegy4lm6hmd2eoqmpdtai4bdbndlgtgw7w4k6lah2@hw4etqvmcj3v>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-20-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-mst-v5-20-2ed6aee1867a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ZxM4BZ5At8azXQecRWKk_JId2mcOLKpf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDI2MCBTYWx0ZWRfX3bZDod2ZpiAs
 rxFxprHtrwh8mI0J2aOSNfLgwJEt0eG0JjC1yI4qVZb0dtnGevdS9fPyT6D8/4P5GiQ8RHbwBLz
 yfP2guwbtAKGpIlZSeaDZisGUkg1QTF5nvZJ6HQu08z4yQL6L2Ff6v9A9LR7X5/uratPXohxPBU
 oCQN2BeK3zpjdem3J5+vwcePF71MIHTmv5hfXdlJBZLns5I3gKkh+Q4WazaLShSqpGW/ITq328Y
 da1PC52qGPdFLI1iK7IpQbISYMBJ79J6GvGkIaK4gZ0nolMXW4bxnzYyzwuWifPOC+erAQjqWnT
 MJWbWRtyb15i968gyApcQTxnoKI/1ghUnK/HBCOPJYIZxwXjptwIHvMGmup8lJElP1CYHiqHHWb
 aFiFyim+e9Ei2BojhQruIvfrmIGBelwI8t9+ESthyzZpj0w+zrD5LM+4Sk+o7OKbXEnSGaEOr4K
 ZlMISMJDAWsIEzX0njA==
X-Proofpoint-GUID: ZxM4BZ5At8azXQecRWKk_JId2mcOLKpf
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a542ad4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=zSW4VIRgNx-_4IL8-IQA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDI2MCBTYWx0ZWRfX1SQnzBKNdwhG
 h8jEmcMnehon/Wgpa/GC1DU4FmW4pdAIHh2Pc9Ys6aw4gZiKQSm5+Npn3xaLgXlovBybwrnzv9a
 4JzrT39jeta3Ikr/x+71KOGPO/te80A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_08,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607120260
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118615-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,hw4etqvmcj3v:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40A0C7464F0

On Mon, Jun 29, 2026 at 10:14:41PM +0800, Yongxing Mou wrote:
> Export dpu_encoder_atomic_mode_set, dpu_encoder_phys_enable and
> dpu_encoder_phys_disable so MST encoder helper funcs can reuse them.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 ++++++++++----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  6 ++++++
>  2 files changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 778e231d4967..1c74ff6f0dbd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1149,9 +1149,9 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
>  	}
>  }
>  
> -static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> -					     struct drm_crtc_state *crtc_state,
> -					     struct drm_connector_state *conn_state)
> +void dpu_encoder_atomic_mode_set(struct drm_encoder *drm_enc,
> +				 struct drm_crtc_state *crtc_state,
> +				 struct drm_connector_state *conn_state)

The commit message says nothing about renaming the functions. Why are
they being renamed?

>  {
>  	struct dpu_encoder_virt *dpu_enc;
>  	struct msm_drm_private *priv;

-- 
With best wishes
Dmitry

