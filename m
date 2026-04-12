Return-Path: <linux-arm-msm+bounces-102831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IX2BM3h2mnA6wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:05:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4623E209A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50864301E23F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 00:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00C5189B84;
	Sun, 12 Apr 2026 00:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AjYI4fzg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G86acQjg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA45478F26
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775952251; cv=none; b=WO9B52v1VX4Ut2iQnV1Zn8T89/jpo6z/zSbCE8WsvJl4krfyIMTfpr5pyAKneBbN9D6r3Pz/GIdtT/bLFxQa8GvzTQLp8+0ccpJw6kQaOtHmK88R2UglkyxxjEvZxu8AaAX7bvHZtbAzWjgPoRQeklniluxF2cSrPfua2dSwZak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775952251; c=relaxed/simple;
	bh=QMNsUBF1IOL6K5WyYeeMz1WgkITH6M/FHv3Use5lhz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwGuKzvnja5BOdTeYaaRsZwzHexorZsHRgxZOBFOdGCESTjvf6kWQ3Gr2wrf1ffo5/C+XAlwZxMneV87LeNh31VTR+avPja+tAOiCqom5mpMlD/DfdstK7YjR7ZqLvFGTvyWjc6tUBPzcq8SdiX28WLQAS9ef1KAP6KzhBi/USo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AjYI4fzg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G86acQjg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BKLktg405797
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4bBhn8y5QoX8YFD0onDk9WKnGAIfy83P1OsGlUnrCOQ=; b=AjYI4fzgpQYs8gZD
	TFvkAz41eDAdG/a8MFChS6Wnzj7VlqamxIW2VNXKOXYyPvLH/h8GG5AiRzuMKp5o
	oytOQoDk25YdQJXDo+fQw5S7KfBOrt6qdZvkZnB6wTcUGrZutrZIPwEPPclvRP/p
	CWnjGf3zm4F5FFrAluDjs+6adWYnzXxz9BchavmkL3WN3BhBNKA3spIZtlVq6YJ3
	pF6h6MY7fRUhpVA0CyStDWmH4ZmXO5zqImTBQVASD6/W7nyu+Eedr0MhtxuM5n4c
	KtLZBR2sR3cJ7HO5TflfqVNic78uHShXsg0lkiQupSPz4CmwuXly3ik1YylH1rdO
	+wg4BA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfeyysj0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:04:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8e4c29caso81712381cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775952248; x=1776557048; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4bBhn8y5QoX8YFD0onDk9WKnGAIfy83P1OsGlUnrCOQ=;
        b=G86acQjgxvgd3OqybcWM2IBQJ9c5ACOGbaVn6QgZctaaICQ6m5rtGTCI3NZbv6E1AX
         G2HlZ/wmjxot99KqfXv3a8xyXivf2vHl1kCvAwnr/txXrUCT1MdgP0cn/qEFDzOVKDy1
         ajd2e8u9GuUb56dypbUXxsDOZrvSwRDDSFPqfunldpUAf8KNfOnRLV5YoxgoHUUO4b9W
         KiOmniigQ33//rQe+wYhasPsuYfHE1zXr2oS+Cv6C6YFQl+z65gIBPZ7RUKzAo58j+ds
         DPegsSNw93yb+MhUwU4U7LuEKzG0kIWekr7MhUF9RWmVJ8d0sxa50FsERKju4Nwpbq/l
         2UNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775952248; x=1776557048;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4bBhn8y5QoX8YFD0onDk9WKnGAIfy83P1OsGlUnrCOQ=;
        b=m63Iefuu8f+KOLF+HCKsKAqOe82rrKPguWCsAobSEG4MfUtXFos/r8MYLKxLIMexOn
         ErMuBLd+1Dug1THalswL3XorW+r+4/YIWv94gwj9E0jecSEdt4wXsKIB3zSX8LN2gwS7
         8r6QbRH+VM/KPx5FH+y69uljTTMO4JzsW6mTGYyBYKsBQBK/CfML65cyjo4M/Ey4VGnD
         mAQ8em+jIS+xdChC+2lBkoLcaewod8Jo9w0e1cEvfcxGxHFNbqjK3iHBygh4XfiAcT2r
         fI0p8DRDZPAL/P+1fb3y/ALhM5BZpLlCT8rLNTL/K80l7EKI2rc4ewPFyYTj/2DMV5ho
         EfQw==
X-Forwarded-Encrypted: i=1; AJvYcCX2CSwWY8WmYFibptc9lQE5svoRv5z7Jaf8FNaNGRdV7FdWriNyqqjlqFFtxWn3inwN9fjCxgobL4GUEGTG@vger.kernel.org
X-Gm-Message-State: AOJu0YyHEb8bpib4hDLUxpWSduUeUc604G2QF3o10kUESbulW3Ig7PIt
	ttuVziwqGWJv4XTTLC2FfwNuD3kuSJEoCU0TPRd/FS2rYU9cWy47wXDmWnHxEQXAxReCu2f/Byt
	cUUb8f0OmSzuHf89lgZIZDy0kFjEJyrDGkzfZeYxMxtncMniSoLe078Zh/f2ct1V6t0K2
X-Gm-Gg: AeBDiesi4OjMFx3rxvWjUCM2ZqK4Bkp2SmJcU1fbf+xc86koa3BCUibAg8LPL7+RUKr
	Ae1F8isysrypW/1EnwjRHTV2gKXJv0eImRF/yscQ2mV9PeLWZ3yvRJzmO2pPOuI1eFj36zKsJxr
	zAYpX6XMQ0jq3kk54x/Wh4CVrqxJUKPaDtBt0+bLzEgRB/IcwyAhQc9YQPOnZbTL2v/mUzCp3h+
	3sCZ9tSYgMGk1eoY5n/rxtcRGijJ16hSKLlbnHEOKJInGCC/ZBhUtGkrhCWhz77LvoCd8Bh7Hq4
	HxjO3au1j/UrkREBW1yT90jUUJ+fRE4oGE6IlG55R6kAXjDCn/ut9KwVuxBis4RDSsDTRCVLMtk
	UCUNzr8CjF0NOqagT82epjVjWyce8uL78cvwNp6ArOMIffuaq9HDvt7VXDWlFQmAci/Nxa8nCrE
	qZCMXRIVPAPr1C/3anMqZLjFHaJSzrNBiHqLg=
X-Received: by 2002:a05:622a:6183:b0:50b:4d80:ccbf with SMTP id d75a77b69052e-50dd5b77576mr128422421cf.21.1775952247963;
        Sat, 11 Apr 2026 17:04:07 -0700 (PDT)
X-Received: by 2002:a05:622a:6183:b0:50b:4d80:ccbf with SMTP id d75a77b69052e-50dd5b77576mr128421981cf.21.1775952247488;
        Sat, 11 Apr 2026 17:04:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeefb849sm1659077e87.60.2026.04.11.17.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 17:04:06 -0700 (PDT)
Date: Sun, 12 Apr 2026 03:04:02 +0300
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
Message-ID: <mswfgwuu3x42s7edcyk2vunc2bsmqciam47nunwv3r4uylx57y@wwufxwng3v5d>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-13-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260410-msm-dp-mst-v4-13-b20518dea8de@oss.qualcomm.com>
X-Proofpoint-GUID: 07Pd3IBmVX56G-xeklr5ltWFGF6dR-9x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDIyMCBTYWx0ZWRfX1rELd7Jpzz3l
 2fDbzKP7mCIaiimBp8Pm5m3nBpKtPPNypC5+wHSBgNnSBXYUlSiLsFZSlUIADU6syg3Bw4dzHIC
 itKd9J85wuUAkfqrO0RGcDgtTZ/7D7RAJvab+RnZDAwIZg/fdC/ZLaNgaSqa/vOTYwNVfxURiCv
 +yXCdcWsAC17++qMTssq2OuIXctY7mWcuE06+Aid5REmt6PicvR8swYsXz808mZZqsiZRb+Zgl6
 FwY3oUkngSNeMss9uAASDsmUe8zZug6tG+OmlW9HV4cu9xcxUUxiE2aXg/71AuepyNJsiV7zBtO
 jgZh9oZcBlfWqpkQuvwmlY/h0c7MbSVM/FLyd2E/lDwh+F08SJJYF+JD4bqO7HptaK+J9UQomMG
 blqIgWWVCz0UP7fPbXPona6A3xk+jcwcTsAECuUotpVm+fQYWXHlRsY7SGf9gne5jm3v4zCmUob
 5vr6DfJcKdWTzmy325Q==
X-Authority-Analysis: v=2.4 cv=FPQrAeos c=1 sm=1 tr=0 ts=69dae179 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=_QCUP834chF64JV95vUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 07Pd3IBmVX56G-xeklr5ltWFGF6dR-9x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110220
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102831-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A4623E209A
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
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 120ec00884e5..fb6396727628 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -127,7 +127,7 @@ struct msm_dp_ctrl_private {
>  	unsigned int num_link_clks;
>  	struct clk_bulk_data *link_clks;
>  
> -	struct clk *pixel_clk;
> +	struct clk *pixel_clk[DP_STREAM_MAX];
>  
>  	union phy_configure_opts phy_opts;
>  
> @@ -139,7 +139,7 @@ struct msm_dp_ctrl_private {
>  
>  	bool core_clks_on;
>  	bool link_clks_on;
> -	bool stream_clks_on;
> +	bool stream_clks_on[DP_STREAM_MAX];

drivers/gpu/drm/msm/dp/dp_ctrl.c: In function ‘msm_dp_ctrl_core_clk_enable’:
drivers/gpu/drm/msm/dp/dp_ctrl.c:1937:9: warning: the comparison will always evaluate as ‘true’ for the address of ‘stream_clks_on’ will never be NULL [-Waddress]
 1937 |         drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
      |         ^~~~~~~~~~


-- 
With best wishes
Dmitry

