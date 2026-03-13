Return-Path: <linux-arm-msm+bounces-97286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL3OCg9gs2lcVgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 01:53:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3180A27C09B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 01:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4C3C4300D540
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 00:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E02130BF4E;
	Fri, 13 Mar 2026 00:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9ofmUeH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YrsHomiS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BCC313E2B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 00:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773362938; cv=none; b=QH3zgj0zBklLBlETYqs0IkCBBbu5/7tW8fDbW8I80YU8/rAZ5uFYmrPunCNMk+7eE7OG9/4hqYEXKURZgjgkoNfKXEysjiXujCqvmuz55ir8F7t+hUGSH3dUUoPG8sQaCyJ9fW+6yBcJMBG2pS1/7aIpgbZvH94LzU8QWf+Puso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773362938; c=relaxed/simple;
	bh=1Ae5+QpYMiXoaNFQ4ETCxw2sSdMHxDIatv1/Gzljdg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h96sdDnS2B5RcDxsGmUOrg8ODiacxfdchjzkEmdUDZdkm5Canu1asoBhzyY3w53D3PoY4Cilj5/Xu3Z8No2PxOwU2mOqDGtbc4ofSfKwAtRazpGXOzc+6dyTzU6rKIoQyv8cjp/moUDc3p9fbtH6Wy9l4C7wBLyFvLUZcAtXlKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9ofmUeH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YrsHomiS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CJHGF04027299
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 00:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bVVvC3z9iWF1NoMxk2yYgr/D
	MqbMXcwjDRsqtMtqWB0=; b=O9ofmUeHlTLxPt1VrAPhCetnxcrk18ZDB2BWcBo5
	PxtQw8hgcsbx6jP+twwG0gVwrRdUAglNel/ujdp58Nchy0VoD4KfToJAusYdfdHh
	0z1sW9CjF35YXhnEn8vxZImCsW4E8lAe8wv7MxKdxMTZXlAKMFZO02qdZz7JR5Wk
	ZP1uB3u8lq8nyl3NxXQVykLiUUbGhEmYiAt+7DxFHtxe64yoS1cYbHqWJi3rcFlN
	8eHlGqAj9aHUQuIRXgIF9Xix2MequAM6729/+4ZyoYgdbAqGXrS/StsLlrKLGx5X
	AEF8He9pQyohcroJsWzoHTV45nV8uyj9AM37InDe6hEy8g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54uvfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 00:48:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd849cd562so1021039685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 17:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773362933; x=1773967733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bVVvC3z9iWF1NoMxk2yYgr/DMqbMXcwjDRsqtMtqWB0=;
        b=YrsHomiS2LQj3z17kuqpPeQhDbjjLTmp6fOzEb5W28xOaBddnYbsVsi882rWvRUpgt
         SQo3y2IS8+flVF6OJAecviZ3zcLfFA+jqCdL8n/CqMBnpxiYYjdmVUnIBRrhSSysMrDw
         OUvay8ESa65GaTWJFB6D1qsD885Hai6biERdvycFnt9ye2K+UBUysQhmlmLmIVpZc/v6
         9JrfCtFz7HWxe87R6yJrEs+MMjvQSU3cSaIg8rqJlQqdv1HqyzYr+Ei08d7JJ8qP3/8v
         coucGEFP3nYoiZqa5O/RMB8xq/IZ/y43kC0w6ZCCqTAYAaNJzGCtThQEW+o2Oc23WNE3
         2pkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773362933; x=1773967733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVVvC3z9iWF1NoMxk2yYgr/DMqbMXcwjDRsqtMtqWB0=;
        b=PJ7uYtNhLW8QcMUvl9kbRORZXc2KZ7U1TVeyxzKVTJhtkdqAEFjrGGIe+QDIFhvLBg
         ElBN+Pw9d4XBkFPtrB+iXf1KC0WPe5/ibZ1jkvhaw8kKe/QjrNsvPpQvQ74izdKKXc4b
         BFGgAtRX6CoLySEXTCs10/YTBgfAY1nP8D3u/Ip8ZnM0pGw8vv+Msg3omrAKPWOvAdTF
         oMWCaal1LFsMRCY7HRbsP5kLxgk5hRDdF6GpgeUJgJbJdeP7oN+tbknHnQ31SLfg8c0n
         e2MHgpvU+PGx7diVttUN2LenWo7JGdch2yZiHhP/oLeeAmszIqtchNvSZ4tbGQ6b6o9+
         huNw==
X-Forwarded-Encrypted: i=1; AJvYcCUMUxVyRRV3nty4KO74ymLne7EXuaPa+PybtrWbUTpA8rZ9kpSTV2d723+pAZqR3N4Sf1m5aydOdxyqbw7n@vger.kernel.org
X-Gm-Message-State: AOJu0Ywml5RZr2rO90OkNCRjlevtyNWdbyCBiYOiFf9gnAn1s+9FfivX
	DdLRFtXl8HSSPs0W/KdpFHWN78/Ph5sR1Dy9kMPjWoqLUb/k9FGzlXTivPalbRltZpnP+aDQLOZ
	rhGXm+7PRrPu96xpz1DtTwincuxpGoU4mltTefmQuR78+6gyF+LTIRCxdgHS9MdEPZwCL
X-Gm-Gg: ATEYQzx/yXhYuMKquTBlNUV/jqWbU7G+e25p+W/t+pgb7hN2+3bUUKwI0mrY2qjGqz+
	7cLXvNbbP4u1NT+kruzbZ0tjncYxhPj/ggdQUmkQeAsxPMBr6ABytfHc/gnv+ausdflpk4prg0m
	W6WwWCjNM9r5Lj1zjckOzFHw1UmkI8RZe+A0V0bzAhhGzritXjW8brYmG0REzpx36pFegaDgtQh
	aqGI3NJK1ct90eL5lAdcfmpRfcANckPSCW6j1iP/wShkdbEdlcGir6whf24HkC3HV5pilejo82E
	0eJN+/lkU9mWOCV2xiD3Ybnym8CzDn9C0SdC69LJY8AbR4PwtxPuVO2LGhJPTLTm1I4es1nIP7p
	8vRUZ4KDotAucmVu1WVbqz7FPVJVQctm4F+TWJ4KDoaXqx2mHRXnIgDSgUtETDtB6gjogIRmxzh
	k6DF9Vd2N01jRHyui3prEpXIAOBI8UMnoBH7c=
X-Received: by 2002:a05:620a:4691:b0:8cd:8f04:50ec with SMTP id af79cd13be357-8cdb5a5479cmr238145185a.2.1773362933454;
        Thu, 12 Mar 2026 17:48:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4691:b0:8cd:8f04:50ec with SMTP id af79cd13be357-8cdb5a5479cmr238143185a.2.1773362932953;
        Thu, 12 Mar 2026 17:48:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33cbesm1227741e87.9.2026.03.12.17.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 17:48:51 -0700 (PDT)
Date: Fri, 13 Mar 2026 02:48:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] drm/msm/hdmi: Simplify with dev_of_node()
Message-ID: <6dvv4px4yinuppwcxzkyhzbdfq76c2xh4is4xlx7srogd55qcq@tf23oqxqimz3>
References: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
 <20260311-drm-msm-hdmi-cleanup-v1-1-c5535245f6de@oss.qualcomm.com>
 <hg2icue2e4oyr2pu2osjlbbcv5g2q6golwoabe3oy2bxhvhb6r@ku7aqp5jdovb>
 <e1a5bc39-fabd-451c-b480-03ac9bf2720c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1a5bc39-fabd-451c-b480-03ac9bf2720c@oss.qualcomm.com>
X-Proofpoint-GUID: TTDUc1m-s9U3f_1MLpe_AdQ5hEwU-qdh
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b35ef6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=5gE0ENHsfxdwuEGK4QIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: TTDUc1m-s9U3f_1MLpe_AdQ5hEwU-qdh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAwNSBTYWx0ZWRfX0D9p8UPha59X
 J+3hB9kxbOQtelQcHUtbFUbx8QLswVrjItdRrgjJuyZOOp+pgdF2DxEarZvXmNKJlLqt6kckgPi
 LOjXoSGLVM1xnYLU6A+RNKmGxfQTNnjQ1cy7NUHrwwSvY9xNgqQQW9sU8NVeiY+1mYtk6m+WmE1
 7pcCOZYT3SGxgGBKypu4IBA5Fm0ZA/i4FcIJ8rAI/T1jhvHaDYGxXkWCFOpMXaf0KOwjQ/YGQCo
 NvxeqnaDvQNX5E8KBGimBiwTokrv6r8zdJFAxrIQY/pyMt+5cgO1Ded1REq1TXaRmycOFMgO4fN
 CNE5ZtOm9g/xHeEH0jH30RPSI4OC7AFLS0tuVWdjmW9ULMMLx1zKA6+HHkckCa1fu1n0NwqrdTF
 /kk+ilyErqLnqwXZzFSmhJavDXtqV8gfcUm5C099mLSu8JQ7dp8QerrSdkPRbRbeMZ0MwEFr+ta
 ePHPbgwwf/g4z+yRGCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130005
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97286-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3180A27C09B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 05:32:02PM +0100, Krzysztof Kozlowski wrote:
> On 12/03/2026 03:41, Dmitry Baryshkov wrote:
> > On Wed, Mar 11, 2026 at 09:17:25PM +0100, Krzysztof Kozlowski wrote:
> >> Simplify chain of pointer dereferences with dev_of_node() which also
> >> checks if 'dev' argument is non-NULL.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >> ---
> >>  drivers/gpu/drm/msm/hdmi/hdmi.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> >> index 5afac09c0d33..b1db1b597901 100644
> >> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> >> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> >> @@ -91,7 +91,7 @@ static int msm_hdmi_get_phy(struct hdmi *hdmi)
> >>  	struct platform_device *phy_pdev;
> >>  	struct device_node *phy_node;
> >>  
> >> -	phy_node = of_parse_phandle(pdev->dev.of_node, "phys", 0);
> >> +	phy_node = of_parse_phandle(dev_of_node(&pdev->dev), "phys", 0);
> >>  	if (!phy_node) {
> >>  		DRM_DEV_ERROR(&pdev->dev, "cannot find phy device\n");
> >>  		return -ENXIO;
> >> @@ -287,7 +287,7 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
> >>  	spin_lock_init(&hdmi->reg_lock);
> >>  	mutex_init(&hdmi->state_mutex);
> >>  
> >> -	ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, 0, NULL, &hdmi->next_bridge);
> >> +	ret = drm_of_find_panel_or_bridge(dev_of_node(dev), 1, 0, NULL, &hdmi->next_bridge);
> > 
> > dev_of_node(&pdev->dev)?
> 
> Why? dev is already simpler.

... and there is no struct device *dev in msm_hdmi_get_phy().


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

