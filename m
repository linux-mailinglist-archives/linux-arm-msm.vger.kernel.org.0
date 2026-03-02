Return-Path: <linux-arm-msm+bounces-94921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CqqIAGKpWmWDQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:00:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 386991D9595
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16AFB304F31B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53DDD3ACA60;
	Mon,  2 Mar 2026 12:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mnkQCPdu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jacippW5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E0E3AE6E4
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455950; cv=none; b=W2HpqxQ30707bkUxTZ2okKiKMc2ONXifqsBVfBGEWbCCmHASnS4tkouxQmmntommtLCEZZe3TWc6IaNmrvFpq4JxWY9aqPcnlpOOdcq/vO5dW3xKemAjwSTnAlxpD2h+3hzVtsyXlB/XHcBk46ZsKlE4i8Z0MtAdOGYntq2hqI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455950; c=relaxed/simple;
	bh=AsaeDS74R/JFp4YIUk5iJfvaOzHrLeRsx7CnHW9lSC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=arxuM6zHKHAmt0PxT5KI/kTq156upjR8KXbCoRd1WToPTp9nag6a/LOei80SfbTa4U+4eDMiK2Ver750U7BIlTv7JAO8imlIAtNiJPOOC6ZD7fUxbQBeDhFYqTINnSNv7eADnO5y+nff6TBlSDotaAyEv2LLiI5yIaE/dn/Bl+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mnkQCPdu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jacippW5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294kp11291355
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 12:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PY/aFPmpxL1Cv4MW6Rp2db4i
	u890188ul3o8vC4hqY8=; b=mnkQCPdudJNKqTfUxFZZ1006pFADQe1v2eS+r1Sr
	eEDZq7uwdqOp4QB86aw4pG3nLQw6RvSg24FaCfalrErpQatqxPiDQeNWJ11SMSo1
	39dFnWArmrkn9wAzK25dKvgp/s1SbzK+h839axGgvFvsC9+TsqtqjZwcJpsgiK7Q
	0U7S9T1U7zz4l2PizQUql+TH+UScuKznJcr1c0E467qEo3f5UzaqWMKgm6G3WBis
	E0TcBgdokfoX2N7/ET7YubNLQCaaVujcR9cqAFRgyA+R1q7CHcB8knRzjqBDSHpr
	wxVoE0yq0WWC57v0m2c3O902lUBKaly/HDXH9SPbQ7gCAw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7ku0qyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 12:52:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ed6c849so3392854885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772455947; x=1773060747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PY/aFPmpxL1Cv4MW6Rp2db4iu890188ul3o8vC4hqY8=;
        b=jacippW5Yu4tqmtQLJijWgoBXkBRSGBiiinK/m+v2zHeAE26D+yOXDdMIWqZIGQNNi
         +bxZzaXDTg987ikiWzvV85kMfFR2eHVDGbpdLuxRgm5jcZMhSYUkzjDacaUwd/OI6Xtt
         b7OLM4zi2GrKTYLbVOXGSi9B2N9f+emSwlrF8O/yJ29eV/RF/3RdcIRFDfqj93aDPXdz
         G1HB5zNmLA8+30DAj84iU28u7wM4v6+byVuQEUsy5LA/S7WYIKWIvBBHQKIZsvtKNNQQ
         +luMX3T4ac+ySKRdVE+1A9N+YG7VLNeWbK3EfIZxDDJuPMIJn1wjBHWVunW9y9MXewl/
         VOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455947; x=1773060747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PY/aFPmpxL1Cv4MW6Rp2db4iu890188ul3o8vC4hqY8=;
        b=GbSj9lZnNz81wvZtNo6rk0+lGPrx8a+HzBQPFlPQHeknq9zdW9F2dsqgye+HaQVmZ6
         Dyyu1DBIudwPF+rfUV+wpqD2I1WryNJG1vPdHiSLZyGI+E6qDPF9W3ATvmRmzZBOOhVf
         AbTbuGD4L7lPL7J4GUlV8AB9Z1SdtwsFYzohUpKFT/IMBKJBVSSbtwm5MDhn7vNy3p1X
         TZr1wQro7sNRLNc4iI/2ThY9uWqr7EC3KkXTOlXcRoL9bk7JT00pgBIOpV1c+Ob5qq5Z
         +wyVEvkgmVLiTAe3hSRQz0LUdctNoy/VOFlMyXQjM5RBk0OltfRGvoHOtNCDEzv/7QuL
         +MMA==
X-Forwarded-Encrypted: i=1; AJvYcCX7KBkblPvCpuWRt25vkysyClmfujD2fr0smtXbMdraZjYcySBUEAF7EhfsjU8fYYeunhAXWEWv7QDleTGP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+4oeE9P8Om3nw3WdhHZvQPcWOzYD7axIwjTYWCB+ZU/t2/xGf
	Z1TsQx0CEImnHJZZl6tMyjyt5LftepSaCkjSlGDxmj91SK6ehNOYY7yeYvlLUlMFjJ0x2xhbiXv
	sB8eADhDzOLqipuuvkQnKhLFdJnLrDy7gE87eedXhkGxqs7Dl/rmKKe4sgxF7UZS78dyQ
X-Gm-Gg: ATEYQzwSocJ9cr0iCIisu3W8YuV2ZmwOqDk1aAetwUtTWK24a1Vkyr56dLPMvQzcMFn
	6XW0u0inH5X96wExT5jIvHg9Uz7Yb40wQuwSUYSsMJOKKX1tr3+n7re7lSb4PPOn2mE/45Xvxe9
	UoADF2WlExCukr2n8jtTXROzABV0z3h2QNgSgUskIna/9BjreffkHq0LUD/ywnNZjAXy9Ahuz3I
	jefrVagwfCxUmyFAYAEXhZGtEub1dUyoXKKBTIKdPZdLb23tjl9mWLAGpKO2+N7C6yP5cXkzIXL
	AgjO7T4JCGwN9IHpMUAeJ0OpElTIiO52emdFitPcYXI1mLgf1cSTYfyc/+QsvoLLT86LpEUMkM7
	M1YDenAX+I9eGEfLiYZjXlDjHp15GpdhKowBjXDh1b4AFL+ADCf/1I3r+pwNlvLaa077r1cwZPV
	QQVvt6r1ABTCc884xxfoeQnQ3rOmF6RfaqVwo=
X-Received: by 2002:a05:620a:4041:b0:8c6:a723:77c with SMTP id af79cd13be357-8cbc8e2ce2emr1527900985a.60.1772455947260;
        Mon, 02 Mar 2026 04:52:27 -0800 (PST)
X-Received: by 2002:a05:620a:4041:b0:8c6:a723:77c with SMTP id af79cd13be357-8cbc8e2ce2emr1527897585a.60.1772455946843;
        Mon, 02 Mar 2026 04:52:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a11c857c5bsm921805e87.62.2026.03.02.04.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 04:52:26 -0800 (PST)
Date: Mon, 2 Mar 2026 14:52:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] drm/msm/dpu: simplify VBIF handling
Message-ID: <lpydx2i46dqbawmbm6pgst4bc5gg433xgdsfm2f7zdpdn43lil@jeuavkqivp6l>
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <ae03232a-49da-431e-baad-c5ae7b85eccd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae03232a-49da-431e-baad-c5ae7b85eccd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=69a5880b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=xMFMbcVZH8Q603apdYEA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: KzjwFqLGtR02rOMmvgoOopafCJbS6O9u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwOCBTYWx0ZWRfX6sdu4TjvH1oU
 ZUeESqmiTejfhbbyz7OSSxLU8xec4AZQzYSjxk5ICzCgpxajWWbAeC9yrTZYs8c0kyWZHkAxts3
 R+kPCJXxr0rMj8MXBpTMn8UYmz4ArH7KfBJX/Eenofe6ukjik4okT9+owlb68SXzD/5/GEQlex8
 qW33ESagwN4XETSGr7kMj+0muGwj0B6r44FU3pl/0r+2PLSvFZosv2gSQoVGGK/E8BpiaHKy7YA
 Oy4XnYm4/NB6g3I66JrW9aFbv7Ix5zVCy88tspjIr5EQNTxxDv6qbi9aBk1U/BZLHB16L69m4xf
 9nhX00ILUoR0DVcsaHOMISQ2b0fHw+wF/i1bC0+pJEKhQDfruRH1AOZrcg0TNt4uv3oS+DWkEDL
 3Ho1Cpy768GX07VphlVYcomAU13HzGV7sViDcEHk3DotDPnWPWDxRTpxBa8AdoDs8TaEzOalJs9
 VkYSr9HZNM9kMm2HmZw==
X-Proofpoint-ORIG-GUID: KzjwFqLGtR02rOMmvgoOopafCJbS6O9u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020108
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94921-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 386991D9595
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 01:45:39PM +0100, Konrad Dybcio wrote:
> On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> > Once Konrad asked, what is the use for VBIF_NRT. Answering to his
> > question revealed that it's not actually used by the DPU driver.
> > 
> > There are two VBIF interfaces two memory, VBIF_RT and VBIF_NRT with
> > VBIF_NRT being used only for the offscreen rotator, a separate block
> > performing writeback operation with the optional 90 degree rotation.
> > This block will require a separate isntance of the DPU driver, and it is
> > not supported at this point.
> > 
> > The only exception to that rule is MSM8996, where VBIF_NRT has also been
> > used for outputting all writeback data. The DPU driver don't support WB
> > on that platform and most likely will not in the close feature.
> > 
> > The missing features don't match the extra complexity required to
> > support two VBIF interfaces, so drop the second one and all the options
> > to support it.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> This leaves a trailing 'bool is_rt' in struct dpu_vbif_set_qos_params.
> 
> I'm not sure whether/if we're going to use that specific set of functions
> with rotator support, but we should probably retain (and at some point
> recheck) the dpu_vbif_cfg->qos_nrt_tbl data that the catalog houses

is_rt and qos_nrt_tbl are related to the WB support, so they can't go
away.

> 
> Konrad

-- 
With best wishes
Dmitry

