Return-Path: <linux-arm-msm+bounces-102808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZM/kHTKL2mnY3ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:56:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D547B3E1250
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 910853019100
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 17:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4A82E5B2A;
	Sat, 11 Apr 2026 17:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fciAvYDa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kXSFeYYy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1429C271468
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775930159; cv=none; b=ekjpJIdCO81/kJ1Y/V5CO6p6cxezzbwpaYMNnEdtmCODiTaiSs58PRRuXsQRK1LXQgFpfCH91kDO8rFazEVKUmWJlrxXhueVHCvq/xLlNrSvStUe4PmMQy5/48sMKwT3L0oh1mAJ7zxvjl0aPpH0Fk05ktZsd6P03TR+jEZ0RTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775930159; c=relaxed/simple;
	bh=kD4Ba98wDqOb/kk95Py0BhXYJ0uusOnLSAMt9pr3ZtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2eORzM3cVLB86KpfJo6dUC9SfhMvZGuUdf5Y/XTR4Q6c2u/XoOBGNBteEXO8N6OzOWyEV3+L6A1kswBLPPt3pVgGmp0wsHQPnKk8I2jFgxUNzrwzZK3Icq2ZPbhzO5iPnFW1LhbwrG7enzt9NCQtuJWsgwucSgRsGKSp7HDtYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fciAvYDa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kXSFeYYy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BHfrgd201292
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3EpLe1bigpIp0uweD8x8d34d
	Vgkxj8tPhHlBc6q0pWk=; b=fciAvYDa7yQzIDZ2+Zp5mCc/KNSHyDKycCAxLDBe
	L5Q2eN36CNfdmc34UyPTmEwT12uUCTswrMF+7yjirIPNgJ3EX+A0rYhNdalrgCIU
	Q5WA8C2DABt6FvvEWbARIK6f22Lg7zf4FrLvNJZW99q038OB4GwdA98nVumlZw7O
	CJ0XcL968e/t5KGkVoKSljTlr8Erxxkv0CRFPkG7sE28AAY3AwlfXPkQp6S4JtGX
	pQ2pYA8z+YTnTxwb73PyIHC71IzepDWxZWMJXbyC5FH7kcfEfDYQEsusXgNXq9B7
	IVP9V8B/+AS25bGCnXB0y7pdHwH7CPnmVfPHm15OrgJklg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexcs5hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:55:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4076dc16so50418051cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 10:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775930156; x=1776534956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3EpLe1bigpIp0uweD8x8d34dVgkxj8tPhHlBc6q0pWk=;
        b=kXSFeYYydw1iHhPJ+ZmBfYfIIqxapxXuyFi9M9EFcchZHaXBm3Px77D0dRvIFjqjC8
         dfJdS7zmCqFzQLjmPSG0VE2VL61SXAP34HMiRh4BtbBhD27Mdgb8jcxz2y5fFQK4kSmt
         wHl1MW1U7+B0ofEEsXywCRSP42hD2MQXomcV8B9ceFaDm35RN261PPCGpDPM/GjS1gx6
         Nh3Fi5SFyz6vEZ+9yhU/j7u9YZh8C8XmdxHoxAQ3ZPFZJR9S7ZVTN8pgD+N/Hvr3jYO0
         ac4K2sCvfrFtg15ispYlGEOtHJ/WdeSPL4xPE4YO05h5Wq6Lwz6fohC8ULkwyEyq4QmD
         zyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775930156; x=1776534956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EpLe1bigpIp0uweD8x8d34dVgkxj8tPhHlBc6q0pWk=;
        b=A+ewV5MCDqfJcYtQX6q1HWU9+TlTOPT8BUN00YDSMDzLhXHbRHw9FawHiiFe8PkxSg
         vaLI9KsEJdDBp+boPZKOJZKCXYeGyouIrxuPM8G98O7ysgxoWhhdVBTw8CpAdlQBEcrm
         b7Tf5qF1OfTHr5cHz6cMqK6KvM+YHI63HDajoCvFkmCwCzApxr0+l+JuFSXkfCtt/ZVy
         tKJCJhbjRDBkrnNWtHnUnz4nvJawyQjJ13e/E4qdcQH5IT/ZAm5yZFPKVIqm6q/V8nis
         CGjYbffAGSTn66oyvLHFkf7D/5PusxoyX/KfnHW621Ym2CQrnlCLcCVwZrgh0kILGmn5
         VF7A==
X-Forwarded-Encrypted: i=1; AJvYcCWD++YdjpajvsZkggpiRZQWT9CXb5n2DckZybFJvjgWElYJstX2fomWpHScSi0tgHsgH0E/ya3/VGjeDhxm@vger.kernel.org
X-Gm-Message-State: AOJu0YxMy9o3YsCYhQThe2RphM0Jlkvxvs9qIxfleyBJTKA/n1P2Fss0
	G3RdbBcugCG26evAXX3R4WBPY1Qq4MyGT3a2k7OVDPsR3pNCQPKmahvBgcmkPtPR4nNNoUlkrnz
	288+QLAUT2/znACLgEP4QH3L3fACFcZh1JG+yo9qmqqH6cw5GJveFE8ThPc2py3sJdCZ6
X-Gm-Gg: AeBDiesZ+BGFE9Khwsm8NT3FpW0EHUZ26LyKj8eay6+nE6X6QnKw4Xby8IzynPIEKdK
	eWx6HeJL6Zrpb+P0H5GBnMEcMKQhQDbFDLtmWtuJvpSS2EbzPI8V8VDP3s2PJTsdRbsvGprTzD+
	at43Nspf+MU4XFclUlhvHc4Dbr9GWtwn1HHUokOM0heEGSD6TUb+TVWu/mArvVC03fFy0r39kxj
	DMzQ8/ROpNN6gvQBrfFNKxRo49zWcTJKnzvoTjEgVRlwx+XQhcxBS58mfAqCMLux5EqwQ5jreOz
	O9Lf9rDAioE0mr7EbtmoTQxwz0jdQSIyOYHtB3+PN4QKRymjkhFmKf55OWfiEHjlk8ltoGSCbiK
	VXhXPS8Zv2WNIStVrd4A1SGn6MIzHnTmLOFGxr8Ouddc6VwPMGla4bmdNCCvyf06ovdmm+vnA5l
	7LME7yrxDDB0TQ5oR9/AieQEi4R7PKcWCOwxg=
X-Received: by 2002:a05:622a:51:b0:50b:37d5:67a4 with SMTP id d75a77b69052e-50dd5c01968mr116910271cf.27.1775930155768;
        Sat, 11 Apr 2026 10:55:55 -0700 (PDT)
X-Received: by 2002:a05:622a:51:b0:50b:37d5:67a4 with SMTP id d75a77b69052e-50dd5c01968mr116910121cf.27.1775930155220;
        Sat, 11 Apr 2026 10:55:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeefbb1csm1497199e87.63.2026.04.11.10.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 10:55:54 -0700 (PDT)
Date: Sat, 11 Apr 2026 20:55:52 +0300
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
Message-ID: <nzouhzeoimf32nwbm2qjecopildvmlay4t4xxshufsjaydmwlc@bnfom377r5b2>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE1OSBTYWx0ZWRfXzxN2V14jFIz/
 5ybjJSDftINwY8dO0heNrgYYatagX4/WDRBVxVPj6+d2YbG35BW7xmlExoir2ZCBGfVsC4LzjV7
 0QgKvJjL4drcF2JJSLp+deUpZarLtp33irdzKUcAQ26wwYW1mdt16qoWqEVGxigJJjKFJLXDcHo
 FLHZ2QmAU78D1Fw67I89owK6fR7Nk10seQXTUd/1OtvWPhBt+tKMQjJe5jvDayhTzCNDBc5UiHW
 hC0Ol+dN6WTUAdn5medoRFnyQcXl/7srP45RKqpMEJIsptI2J/ZgtJ5i/C6g623uH0PeFqDY4wK
 1jtfnuB2rgZIeEAPBPZfs6Wwj8o6FEXxkDZcBFSZDoHbt9d/3o+d/tPE7asN40ipT662Oz2TAC4
 FZ0lp4FfvES6HAvcUCLqXO8f7vme68mNP65Fsg3Etgt4kVoFaDubwE531VAtS8i6eSpvuiAoDzK
 4OiPMYW0162RS5+Klvw==
X-Proofpoint-GUID: zYyOvA50mOVe94OKn-tWZ-qS8Jsq1A82
X-Authority-Analysis: v=2.4 cv=MqliLWae c=1 sm=1 tr=0 ts=69da8b2c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=lDrsiWV98Tgi0JVLTm0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zYyOvA50mOVe94OKn-tWZ-qS8Jsq1A82
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110159
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102808-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: D547B3E1250
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

Please mention that panels are going to be dynamically assigned to
actual stream IDs.

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
>  };
>  
>  static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
> @@ -2176,39 +2176,40 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
>  	return success;
>  }
>  
> -static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
> +static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate,
> +				    enum msm_dp_stream_id stream_id)
>  {
>  	int ret;
>  
> -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> +	ret = clk_set_rate(ctrl->pixel_clk[stream_id], pixel_rate * 1000);
>  	if (ret) {
>  		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
>  		return ret;
>  	}
>  
> -	if (ctrl->stream_clks_on) {
> +	if (ctrl->stream_clks_on[stream_id]) {
>  		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
>  	} else {
> -		ret = clk_prepare_enable(ctrl->pixel_clk);
> +		ret = clk_prepare_enable(ctrl->pixel_clk[stream_id]);
>  		if (ret) {
>  			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
>  			return ret;
>  		}
> -		ctrl->stream_clks_on = true;
> +		ctrl->stream_clks_on[stream_id] = true;
>  	}
>  
>  	return ret;
>  }
>  
> -void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
> +void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id)
>  {
>  	struct msm_dp_ctrl_private *ctrl;
>  
>  	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>  
> -	if (ctrl->stream_clks_on) {
> -		clk_disable_unprepare(ctrl->pixel_clk);
> -		ctrl->stream_clks_on = false;
> +	if (ctrl->stream_clks_on[stream_id]) {
> +		clk_disable_unprepare(ctrl->pixel_clk[stream_id]);
> +		ctrl->stream_clks_on[stream_id] = false;
>  	}
>  }
>  
> @@ -2228,7 +2229,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>  	 * running. Add the global reset just before disabling the
>  	 * link clocks and core clocks.
>  	 */
> -	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl);
> +	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl, ctrl->panel->stream_id);

Why are we using ctrl->panel again here for the stream-related
functions? Didn't you got rid of its usage few patches ago?

>  	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
>  
>  	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
> @@ -2238,7 +2239,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>  	}
>  
>  	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
> -	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
> +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate, ctrl->panel->stream_id);

And here...

>  
>  	msm_dp_ctrl_send_phy_test_pattern(ctrl);
>  
> @@ -1451,6 +1469,8 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> +	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0);

DP_STREAM_0

> +
>  	rc = msm_dp_display_enable(dp);
>  	if (rc)
>  		DRM_ERROR("DP display enable failed, rc=%d\n", rc);

-- 
With best wishes
Dmitry

