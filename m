Return-Path: <linux-arm-msm+bounces-102498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6H2YBgy012kORggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 16:13:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D33A53CBD09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 16:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1AB173002B1D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 14:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360462E7623;
	Thu,  9 Apr 2026 14:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ezfnK4pB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EP1skste"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EC72D8382
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 14:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775744010; cv=none; b=T85D1WpD6FGtf1/gdWbv5Qd5Qws/8HF5e/g4nugUkFOxXZRHa0JbEzxw7C4Vbxei6eBWZdU8c8xOJQXbEH4LOqil53lt09v1893zcabYfF8p1QVNpvfsT1ekn9YpwARFlWl2Wr8QjcajyIusWAWygNDZqiNgxrEnm0Pd0n5CN3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775744010; c=relaxed/simple;
	bh=Qx25gSPIzxzX0vePxlCxas81vpL4zfmLpnTAD+bm9Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8LNqTtO+kdoYFiB0r0zjxhMv4ZCybYLCWvmV3aiuHl/E/eceBnAc+zHJzui5BMrhbbhLKfHwPoTplfP7F2moN14iC4s5xsdRBbJdljbCxLYBHKevHRyFPaQTsJiKDRtZLlAvTo0ftKW49DsnTfMe9hT2WghckDmLDqtodiiEqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ezfnK4pB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EP1skste; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639Ddhc82813070
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 14:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SUiCVgOWHvBBOrrdz7pA0iDj
	gBsstSlgoVOzC5ll9m8=; b=ezfnK4pBiJ2fC0cutjXd8+5yYoQoWeQUUGQ5ufYj
	B94/Qq05FgNUav39KuyAi0/rSVXYx4eFusunqJLQFaUpMXnsX7p95L8BpQPtAYnn
	FwqI/N6V8jsXDo3mFmozroSlMTnUdkdZuQ92RZhbqz30ko1ZdbetznB/+hSlRKSC
	DdD3VCPBMkmRZDy/M3gRAlsF+ljpN1Y1XlXiAqmmXf0IHgGhkTuzgbz2evGEGFbl
	ULnAg4IcntcqWoBZ1SHgw1rL7Tc5Ts8IxRIwmEIUN/MyKk1kovcb6GgEK9xsMEty
	72MwnvnCMJlRXGYKapaJFfhRXsHFijF88RmtDSGX5vhaeA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded6h8471-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 14:13:28 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6055537ee98so228231137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 07:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775744007; x=1776348807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SUiCVgOWHvBBOrrdz7pA0iDjgBsstSlgoVOzC5ll9m8=;
        b=EP1skstedsuP/iWVGqKEb6fRQ1fG19VGADDUxkHgApYoFDu2UulAc1iuzWTDMJgAEf
         l3I5VAoQnsTbCVjyltwPirztlnRbNvCuxY75vpzZIon8QVwnIvVWA2kMPWV2RGvtNEwQ
         OVZKq5ObGBE7msso7GPK6ZvvgrhB0FnxSZhb5bEfJrSKlEysjUqz9fzj+EUu4e0gnJSu
         6jWA4Y1V2hXjqW+KPa/FRBe42aiswEgVsry4I8Doy56U/FlLc4dj2IbcJXkjpBN2jvi9
         CBPY+wEhnZUuk+vsTV64a1bQTq/QD5vJVqRvAsh/9Fg2Ly4CFgmvBr524YP78WIuPPbE
         pRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775744007; x=1776348807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUiCVgOWHvBBOrrdz7pA0iDjgBsstSlgoVOzC5ll9m8=;
        b=BuCfYrjlaULjJZYdpvE4zt8rJ2JUXU4Av0Tz+ZnflUIOB7tvWDX73Oj8UwtMjj6e3J
         4jPtM6gLnYYVoPanqUzi0WWw4CtpO9oijEgTQrRdytfEAtcwBpx2jGv05qhzSoXOKunn
         LFQH6KHgbvbFcFb7+gyWW8oh22ykHfa8IsdUAFrIN3OBhXca6qBJ0QM2mmhSFSrzdojM
         9OYaTUSNMPFFF7+mnZFDxIHrlxmNNtpxD15Q8WnMAxST3QZWJFiyf9Z41t1qiGGxBtAO
         hxeUm5FcnxCP+QqqUFTlGgq+7OKIi+yVB5hX24kWSRrzIN4obbVa5Q70nAvwIj8R4Nmw
         RnlA==
X-Forwarded-Encrypted: i=1; AJvYcCXiesAscXNWZc6a+3v4OTpun+MKRfDAOPqUjKvRP4r/4y8LZoA9ad3dfCEZ85AqSvCS7ViOR+02lSPbxqAo@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ7hAeJb2OSDzLMl8czbeyYpKzyALW3Lnt5Iccx3ffQZ+XxB3R
	PmyNG3e07+JwX/RnvNGtBy5lWsw8pnPgFrvoEOFMKn6jalb5nbXdCFnuMxn5kTLKamFrAafas9X
	FfQOlRZxdcpOiaUhSt+wxMXLLiuYbPx2HRhDd0x85B2w/1O1KjhqHJgfxm1gOMQGBa15f
X-Gm-Gg: AeBDietT0SrkQ8yhr8ne0taqXXYi84HkN1QniVlx0Gxuhzi7Ny6dPZ54EwTRIAo6lXe
	ALJXuRBFixo9Dzrh0BhZBG6F0m4Z9r7ARpLMGTDS+O8RRDZp2EQ34PFsNJenfaCFdybr1Pyf7gW
	W/T+i8rYZWjQaiqgnnVmAYquklHv3obEwlis9V5qSWHLLWDHF7/mRvh/+nkwLd1Ql35Ihwos5vq
	KfY/KBX0951TrWUMHJ3+tEh9AbJ+1QJ9Aa8wjdiWJ5DCBzAWcAj6xf5AMZEW4F+8N2/uBYN1NSz
	maUKKjDNDAKUzNd5uZYhXqUgI4QRuXHzLt0gKb4HwwT4fEVH9+7EcRMniUKhRPCt3EYtR+FScme
	q2k+HAjc6qNgOinYxNWCtRftb1EXgtI/vJuBA1lhB0/M9FFnIxxi5SRESODVC0PtwQON85T5eTa
	FIfjhGpkYHez0WcG1XMHon1tTXgOp7YxFNINs=
X-Received: by 2002:a05:6102:2b97:b0:608:706b:b346 with SMTP id ada2fe7eead31-608706bba83mr1416927137.20.1775744007314;
        Thu, 09 Apr 2026 07:13:27 -0700 (PDT)
X-Received: by 2002:a05:6102:2b97:b0:608:706b:b346 with SMTP id ada2fe7eead31-608706bba83mr1416870137.20.1775744006833;
        Thu, 09 Apr 2026 07:13:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd2108a4fsm50745461fa.23.2026.04.09.07.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 07:13:25 -0700 (PDT)
Date: Thu, 9 Apr 2026 17:13:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 28/38] drm/msm/dp: add dp_mst_drm to manage DP MST
 bridge operations
Message-ID: <4hsivepf5wc7m25njjcwdns426k7otjywke3r5bfsskccl2esn@cy6hvs2ercgd>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-28-01faacfcdedd@oss.qualcomm.com>
 <h22zh2zcgdcv2k3mxc5rslpfd3xnerjfailehtaw3wbtpnisy3@s56vudwvoh4q>
 <cda87928-c2e2-4f75-ade1-5a4ae49c4399@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cda87928-c2e2-4f75-ade1-5a4ae49c4399@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RfCgzVtv c=1 sm=1 tr=0 ts=69d7b408 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=uH1RIaAHKDEITSwYPBYA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: _P_Wb4Fdjrc35NdTKfQKA2S_mA9lrZDS
X-Proofpoint-ORIG-GUID: _P_Wb4Fdjrc35NdTKfQKA2S_mA9lrZDS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEyOSBTYWx0ZWRfXz5A2NtDc/0cn
 0xZAR4nK8jnY7F+fNla9ZXc448UIcAbPUL2kcgPK/nhJ24AgSFj1z1fDF4Uu0aBdwIUi2eog5Fw
 IE8TSfAqVug8YVZM3dBt0cs+wyuvaQopsmUaQ1sBWP5rWsoxiKEIFLc9Ukq9wtLXnkTIE3DLoq0
 pwxhrnW8oINs/F+Y1a3F3MXLlp/jWa35bmPLE2Emzxr3WbS4bbgVu9ckh58s6osRSO9nj6YvXSt
 eiRtBW1nJSWBwAxxMGeiFJvcWsM8NgEJEavPFM0IqKYwzI8zoG/MhrJqfVR0cwxm/C84+SlIQ1X
 AUe28bHjSqypeMZEDpNEdfrF942DHJKGwuEemrfxttso0vrwE2A5taLYDcs8+Psw7hwEh9T6yU1
 D4WkOizvuKUAmFauIgwj2yoK8dcbLlOa5hQI8hDeAPEPcnZaaT75IbESsx4vWRPF1L7WRQWFh/G
 DAHOpaSGVsflQfRtevg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090129
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102498-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D33A53CBD09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 03:42:34PM +0800, Yongxing Mou wrote:
> 
> 
> On 8/27/2025 1:36 AM, Dmitry Baryshkov wrote:
> > On Mon, Aug 25, 2025 at 10:16:14PM +0800, Yongxing Mou wrote:
> > > +	struct msm_dp_panel *msm_dp_panel;
> > > +};
> > > +
> > > +struct msm_dp_mst_bridge_state {
> > > +	struct drm_private_state base;
> > > +	struct drm_connector *connector;
> > > +	struct msm_dp_panel *msm_dp_panel;
> > > +
> > > +	int vcpi;
> > > +	int pbn;
> > > +	int num_slots;
> > > +	int start_slot;
> > 
> > I'd definitely prefer to have payload pointer here, if that's also a
> > part of the state.
> > 
> Here if we not need pbn/vcpi/slots/start_slot in bridge state, can we delete
> whole bridge state and move connector/dp_panel to bridge?

Where is dp_panel identified / assigned? If it is not atomic_check(),
then you can move it away from the bridge state. The same applied to
connector.


-- 
With best wishes
Dmitry

