Return-Path: <linux-arm-msm+bounces-97114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBKAGr8osmnlIwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:45:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DC39B26C653
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:45:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D02413011794
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 02:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F023803EF;
	Thu, 12 Mar 2026 02:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e6k5neuy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikmRculT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4317537F000
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773283517; cv=none; b=aokmU876SO3ekPD/oZyjD1gLC98hFMS/GC9Pai1/9jux+OuDMiMjJzbuBGtTyyUaB2A4RKOO9kEQfOfYMPj7T2c9zNwBzze//wre2KpATWl5UnPCMA+cw1by839Kj3iM/uc/6IllfdQxLQ5GgLx0Xa500zKko0pE3HNjQfdFVRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773283517; c=relaxed/simple;
	bh=jAs54Ca8GJ7r/A0R/a9D2iqsFwlLxaOvqHYkHziVzBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NdDDR/WWvYXRM/WiJ/hPME79RTVYVEH3sBX3r+h84P6WsmdBXwrJbDACb/+Rcbfzc7qdhSY0dQo3dJzVP/Wqf4gF1IJeGWI15jUcUi6o1yEinUa9yuyptF1KaTs+clb9EU4wVcnbRfalyxX1v9sSbAyEbU+BUDFs2kNgGbrChwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e6k5neuy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikmRculT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMMpdm1922473
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ss1Bk5xEOyvfFXO0AttClrHW
	ulnGSLKespJtg9jgeOE=; b=e6k5neuyHiGb7BCFzKj9SqAOuF1RCswKgi+Bjl6V
	MVHVn6JLfoC4R1jZVbDASwXyfdcK4rY47N6fM3fokNW/YhPr1ZB0nOxiVJSkmqX4
	SeeObDPMlAcbWJ3cUBLQMk6WnosuGFYX0f3Nz9Tzzu7ZCofDN73TVrgPpTaY4Wef
	PhSQJ0BnTuAXBXnqF93ErN9k2NdVHrDPUo3aT/W96N1xxSru5XuQCK0Hs3dmBSdW
	AAyLILh7SRW/gpv0W6kf8XM4VhTO6/qds5jb4BNSJJbiIha8e5+/1vOUhMdiG4bX
	EtE9MZV03XRdfukjCrpf+eOYU0JX5ooRAgEbr1WHXcWvpQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wrmcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:45:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd91c0262fso368521185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 19:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773283514; x=1773888314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ss1Bk5xEOyvfFXO0AttClrHWulnGSLKespJtg9jgeOE=;
        b=ikmRculTyCDZwTPEOLe+HBZcH4R2b8TnNklWdMcsJ/afmSTNzvRvlwCYNOi2P7HEZy
         cJDbDDkiF3zN5aJ96km6b48mftToe0L0scSwccHYR65dWWS298omk2YDrxMiwvR82Ud/
         hn6inRsPR6sD8CQr+PIH6hrlVr6ujRYp6qSaPRAiq5Kk94rP7PRhgP15ukFQiEVjs5QJ
         znKgP/94d/vk/UlDd9dno3JAZCIAqpm0S7jD2z11I2My8KIo4p6cacKPY7erf5Mm55yz
         N0ETJlHH98ohbxANtdW21UMXp5h+wc164OB9gGAZBcgIFpgaxinz0SNCl5aGJ58pQVwL
         SZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773283514; x=1773888314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ss1Bk5xEOyvfFXO0AttClrHWulnGSLKespJtg9jgeOE=;
        b=WrxWCSpL/kD92Gq0TDGThIjyUUEMc/8EO0H+b5jj+bpb4Bpvhxz+ORmaInrUBJkHkw
         S67dJwvRIyVEbIH9Q0iJy8cTZz6tF3SHWeM83Tcdm5pSgB1dgUEF9TTDW623XO5KSgbY
         cI4feyHNe36pN9d7QIHLSNfH0LEhF5nZH3Es4jlOjxxo0i6h2dSTlEmrLor0p3cFPTsD
         0FMhUYTngwM6gEwpeKihK8ySz5lQw7zIgpXy49NND9rvSNgbxL8FwDhYTd0STe5IIyxV
         xJ4jOUFB5PLGB3ThMc8uX0onwgxbUwmX7y39XODjKEe6VPv/qnZx1653z6mTyJxRfPcB
         BHOA==
X-Forwarded-Encrypted: i=1; AJvYcCUg8xRezJ/XnrgMRKsY23WzeLmhGDmLRq6pzkzre6T+D8yhpvl1uTeJXHCrlmH9HEawh9Z4Tkpo9XIpZ8eh@vger.kernel.org
X-Gm-Message-State: AOJu0YyKQ/RzfKttGM8yk+Sy8X8iEBUOGAhD7yVsShyc2pazk8lIhM1j
	kBFevOnvEygbhlfWmPcfH7oVpKOqNSEYkILhcXY/8N+ywTHTWQrG3i+ZrCB2ma6uS/0VwqAQ/bn
	tmNZ7G5KC9yQmtpWQVgif4sYCtm/i0bUbP7MyfCMpL+Fp+lyZUHFNvWb6iIR6WVm+QAIQ
X-Gm-Gg: ATEYQzyTc0OdmMMcUlu57C9z8xgqO7+AYhxtUEppet7hU8eCNWJfNG8/YV5y3fO4tvG
	rUhbt88bJl5mjbVvthkH1iqkCKZhiwVq6KAH0dTkvNH6ZdXLfYB02Vd9ZWN657qWNJkbt8AFMBc
	c8P4OlIBrxfW0tVw+eMgXWTZV832654935ikVYWEaATHIq0QY9zwpnCLmAPjBdqCU+WA2Hjw1LJ
	e7bwfMfYLECwJjdLRb9068QBHJNyQg54c8no1Ay/kpJ+txeoi0h32JT9kim6ZlhA/QnEvS3Xupk
	PiWuhOcgWhMZhIv/rAWqBTCy/3ks+IjjljKv50Wy2s0EhxVIVmK9ZCvV4c9JccITuRwrnS/1ctT
	q3BQVrEqGtJppk0P2jbDaUoHSS8v4Yohcf4dQ5ePogTwce2Mannw39Kaz7nx77ByZjhI24zVFni
	Bwv9WGXksQA/LXSK6YpvhJUWnDneisCK4lu+A=
X-Received: by 2002:a05:620a:1929:b0:8cd:99de:6b5d with SMTP id af79cd13be357-8cda1ad6b11mr607902185a.75.1773283514563;
        Wed, 11 Mar 2026 19:45:14 -0700 (PDT)
X-Received: by 2002:a05:620a:1929:b0:8cd:99de:6b5d with SMTP id af79cd13be357-8cda1ad6b11mr607900385a.75.1773283514118;
        Wed, 11 Mar 2026 19:45:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156374286sm682727e87.87.2026.03.11.19.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 19:45:11 -0700 (PDT)
Date: Thu, 12 Mar 2026 04:45:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/hdmi: Fix wrong CTRL1 register used in writing
 info frames
Message-ID: <o2tdppb32d4ekqtylxzwppqljv2c3bxeaesmoduvlyh7ifz6ah@6k774jbwndq5>
References: <20260311191620.245394-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311191620.245394-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GcoaXAXL c=1 sm=1 tr=0 ts=69b228bb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4RWvjT-ast3oIKXtKOcA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: yEk23CLxwJkhYRg7jUQtCqVetRPxRsc5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAyMCBTYWx0ZWRfX10/BZiaX0Z+f
 ARdpbX53JCfdlvLhgQX4Hxu+9Bazi0LfIK/5xtKd5gkxZZSbhnD8KiSt47bJIgB6tQZItD4zePt
 KAoxxH9XiqTBycIwZaT++eqLykG4WlnGOGAdnH2sL304+idoL1dIqla7zIbX1mJr/Hvm44ALFaD
 jJpvFA6UeSNZo4kkESvO/RhcHQOJlUv3gkcfGSUOzQefffZM8BZ4pZ/pc9lPfDp4MEGmWv+ugAg
 UB3ouXI5twOVzIC1veVlV5f5CpQOG8Bz6CR78vHqS260bGqb+K+WqiNxpt99HNHZfQ+7CYlusaw
 KPMrfcePsdySo7PeZpoP4Z53r1IW3+PdFfk4KEkG2dUr7qIDY54G7wBT8cjCViqA2doFafDmSMY
 tyo16NBHFHGi9MUqX2/AKjDx+AcMhVlG2923B6eA/ce30qcDPhz9ymzL+IC47F7cwEA5wOSop0f
 knMAp3gojzHieJLB1EA==
X-Proofpoint-ORIG-GUID: yEk23CLxwJkhYRg7jUQtCqVetRPxRsc5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120020
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97114-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC39B26C653
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 08:16:21PM +0100, Krzysztof Kozlowski wrote:
> Commit 384d2b03d0a1 ("drm/msm/hdmi: make use of the drm_connector_hdmi
> framework") changed the unconditional register writes in few places to
> updates: read, apply mask, write.  The new code reads
> REG_HDMI_INFOFRAME_CTRL1 register, applies fields/mask for
> HDMI_INFOFRAME_CTRL0 register and finally writes to
> HDMI_INFOFRAME_CTRL0.  This difference between CTRL1 and CTRL0 looks
> unintended and may result in wrong data being written to HDMI bridge
> registers.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 384d2b03d0a1 ("drm/msm/hdmi: make use of the drm_connector_hdmi framework")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

