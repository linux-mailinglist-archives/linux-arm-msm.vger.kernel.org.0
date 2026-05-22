Return-Path: <linux-arm-msm+bounces-109295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLDlOH5IEGrzVgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:13:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 702AA5B3AB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A035310DC15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4192C376BEA;
	Fri, 22 May 2026 12:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ohkY18Z0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XBPaI7uk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC20C371895
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451346; cv=none; b=ERB+1E6PPQIpItVgSINU8RykuNNjnrd1hqoPzHqrow4uirtdcr5yGhfoneELsKhM5l+I5GGXVVz46MhRQn9bo5X35ipVCONCqrgqlaS8c6IHxRwTcam8FvHrs7I4/BtdJzg5unyZNH1hbnMBpaBb33Mn9kmeoYwvxJ9wbGM+P7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451346; c=relaxed/simple;
	bh=NP5rUxQg3wK67YLeRFTJSeVRIKgTlayYowAx46bKNDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjIOA7werzosginMBkCM7Uy82xr/V1/2tQnf6vb9g6raCq13l+XDuZeD5kdmPhubx5v6l5kRgsGdp3gYGMtXCi1ZAzdj4Ys+8myLNCMd/qI54LxhLobZULwh8G8bNwU1GlnAjsNYpG1yR28Nlm3XFwu5o1sBAgMXDhwd1YSjBHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ohkY18Z0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XBPaI7uk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6Y47P1298124
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nD/+j47ehtNUQ8oIwVeJc0d2
	qj5C600OVqEc0s7ltxQ=; b=ohkY18Z0WezjbpkdT78t2TuKtVLmjZyFnnUyDgDo
	tngXsI/TaofkXV0ySgyE9z6qu1+tHj6EM2SJ2Vh2nr8rOKZDshm4nAb3TO5sD5aQ
	2HN9dFcUd/eTSrdBuKP9Vyqc+LCUjQbV2E0ub+3GWCAomY3YqxMtccjTP8tB0uER
	7cWDpDE+kEKafq757ATvM/dKs52z1f5OBKkU4muub5lJqcOTuiYAop/L/30woMdK
	rEi7KGO4zA9GwiCgF/7fcGtCxBdIalPeC/d1ZqlfWsjNqSe6jXyqCEPS/1KGmGui
	DdYqy8HY/5JkL4KjmlCYlWjZxPZe385QU6Ew9WdIo9mm0Q==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah0atmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:02:24 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7dcc9e6b772so21066626a34.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 05:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779451343; x=1780056143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nD/+j47ehtNUQ8oIwVeJc0d2qj5C600OVqEc0s7ltxQ=;
        b=XBPaI7ukykAazUgaPU/JiSSeY7fR70D997zVRUuVTrLbCnZUL+XuycdTwEAaR3s8Zw
         oOLBltIux8dSuNoJ3v3o7/5PxcGC+Fcin1lDXwSHcus/u6In5o0MOO/OU+Feg0+8yug0
         iBs7Uh56Tn3TkqFYz6prOBfbo2EdkHs13MfHoXH9+w3ScoIBcP3hDi8ns9krQFtrhQeW
         vZa1fcXG96I960UBvzLG1/LrapjtKHt/jT4yoRnsH0DLKLL5vGNtSgaxjqUg7yaHE+jZ
         ynYXSuNA+k7EgQ9Q2xRp5lHnJxP2OYenG4eGu5eh89MHflNPdz70xIcvFy1ZVAJsRD5E
         YNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779451343; x=1780056143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nD/+j47ehtNUQ8oIwVeJc0d2qj5C600OVqEc0s7ltxQ=;
        b=C0Y22YaN4aCd2OFOfLiYUDxehXGZgr6N4tcwWZdfTx2IQ7kZIY/1ES8LCS8pSSVqOt
         dFCSdMGok5abbzm6PTk4naAqofyypidoO9IHNtzpf/QtPF32/IJZ8mVhdTdyGbWs7Utu
         jAejNYHuKEH0EbSYZT8vivPQZqT1W/JSlgUHgnqKRslZHW2xiqyQhiPJ9R4tcNvForzL
         9CDElP3SCABDIuJicrCvkjmTxKjcYWOAEn4fLeA5+kBH4ep20hG2PayvBc+d2FcuujIv
         45yfiVjtxgHmqg4UPfNLbZEvV5ZpMzW8nR0lYVUB9hcBtqD4oXAumq42RPaQBWKKXW9Z
         SnMg==
X-Forwarded-Encrypted: i=1; AFNElJ+wwa9KonjLQ7gA3qpCQ8URz6t8u3HtOiKhi9meJ2VLlKyd0LvIQ9046vnwSp1UX2MRNmdaynNdM+vKUxmL@vger.kernel.org
X-Gm-Message-State: AOJu0YxmDZp05mTzwdbRt4QjHqRcD8iwYjwNQHk+yta0kTgrDHUveH6T
	lW4uDaC2lX3sB6AZbQAWCO57HYsm1Ae5kW23iSo+UuirFNFCjaTTCy/Laf0k2YGQPTMIVK/CRgE
	gHIC1/BHxcXg2rC5sTtAd+g+xgDJc2TpE784ij+M/b9RKYyTFBQQg+ZP80whYkzFMn88g
X-Gm-Gg: Acq92OFAmc8l5+KHL5neLWpUyk6WJnItxoKf3/Na2XpgEkO6GabFLDdICyrXx4fD3Iq
	8p2newm1mDlyGqIHpdLSvKdc+mgAFH+LSaamKRRoCvbVenztZ7GvpnhkenHsXvyLta8ECFNvv0Q
	w7On7OBDkexKfEDyDJwUx9Mo4O+QXT9zXmJJmsctAJ4VlDhG8LPuslbgcCbcIZD14nVYhNTK2tM
	JT+lB+StaiI8JLHwRZ3Kfg9u+umBvoJnoFxQSub8uz6TP+2hBW4roMlSTD3A9fCqUMpO3Ac/AUv
	4R75HyMLh/dHo/PqK7aTJHuPnaIEnYB1YWXpMyQxY8hKLdrAhwMj1nuCCapwqv+jAoeovHPf8EE
	WxIXnb3KKObgEueN/m+SsiQHH9c35TanlEUwJLvIgfE5d0mSZca5owtEa+mFNHRaWm2wLLqdRD4
	4YhIniP6gEoq6oPyi86PzKrYRX7GjPEJWjFEw=
X-Received: by 2002:a9d:6a50:0:b0:7de:cf3f:1b3d with SMTP id 46e09a7af769-7e5ea37d7c9mr2854536a34.7.1779451338566;
        Fri, 22 May 2026 05:02:18 -0700 (PDT)
X-Received: by 2002:a9d:6a50:0:b0:7de:cf3f:1b3d with SMTP id 46e09a7af769-7e5ea37d7c9mr2854502a34.7.1779451338149;
        Fri, 22 May 2026 05:02:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cb37ebsm386472e87.14.2026.05.22.05.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:02:16 -0700 (PDT)
Date: Fri, 22 May 2026 15:02:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 10/10] drm/msm/dp: clear EDID on display unplug
Message-ID: <kpx6hqics3odr66whpatyr4q3onj3sbm3bmoesr27u4up5wrcd@irdyyavhfvo5>
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <20260314-hpd-refactor-v5-10-0c8450737d64@oss.qualcomm.com>
 <93327e80-c4fa-464c-90d2-26a7b08b2ea9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93327e80-c4fa-464c-90d2-26a7b08b2ea9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExOSBTYWx0ZWRfXwATI75I6fiCE
 mhiZdFOCzGQ/g7ldXNtP8uQ9E8Ca8NEEgJaII/+z+8+uobb0ZpXqJ6Xip9/GoqIjodLrvpBuXHa
 P4LcMLeDHvjjow6GQIL0L97J7kSbKP7jvlCD5JW7wj4ORsgrNsM8SfuvrNwQ9OXYPtg1GRvSU01
 WzIMyYAv7Qq/1aiKn9DatellbynSSawotNKptjhP7i34EcyqBjW1GAd9yh1rETcTAwBmhy6i+8i
 abIBh7Cs6iuTReBC+4iYApOrw9WTbVom47XPMp739Qrsx0+7Bs6J63qOz8aapDt7suJud7/2A5N
 rK5X9coVvlzxjMYlVP44NVzWmyU5Nku4mR14QydIaUhxNcw0gfe2Vgg/MRi1rAStnICkKB8T8XL
 taxOZboJcRdwIgh5DKow8XXLtiWWB1uMw0k0P0DYq264nc+HMI/Wo58jgEXg7+4q9g7awP2A0sH
 RCoVlJsNwcJie6ZmtYA==
X-Proofpoint-GUID: H7T1XrCZR5nEtYOBaLi5uVwpItqFxLoD
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a1045d0 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Age3Ohp2d5d3-k_hZ18A:9 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: H7T1XrCZR5nEtYOBaLi5uVwpItqFxLoD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220119
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109295-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 702AA5B3AB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:49:50PM +0200, Konrad Dybcio wrote:
> On 3/14/26 2:09 AM, Dmitry Baryshkov wrote:
> > Currently the driver only updates the EDID when it detects a connected
> > monitor, which results in the connector still listing outdated modes
> > even after the display is unplugged. Set connector's EDID to NULL on
> > unplug to clear the list of modes.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
> >  drivers/gpu/drm/msm/dp/dp_panel.c   | 8 ++++++++
> >  drivers/gpu/drm/msm/dp/dp_panel.h   | 2 ++
> >  3 files changed, 14 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 0a38957ea901..5c6a24ec140d 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -447,6 +447,10 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
> >  		return 0;
> >  	}
> >  
> > +	/* Don't forget modes for eDP */
> > +	if (!dp->msm_dp_display.is_edp)
> > +		msm_dp_panel_unplugged(dp->panel, dp->msm_dp_display.connector);
> 
> Is there a change some ""funny"" panels decide to output a new EDID blob
> after a "proper"/custom reset sequence (e.g. to remove limitations
> presented to the DPTX at the UEFI display init stage?)

The panels don't know if it is a UEFI init or a normal reset. EDID
changes require a long HPD pulse anyway.

-- 
With best wishes
Dmitry

