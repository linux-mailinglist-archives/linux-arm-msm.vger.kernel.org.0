Return-Path: <linux-arm-msm+bounces-101814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKyLJwaB0WlAKgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:22:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 600D739C96A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CD78300DA4E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 21:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58EA34E744;
	Sat,  4 Apr 2026 21:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B67aOBwu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M4ANGaK8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AE634D4DE
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 21:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775337724; cv=none; b=XdN5B7nb2nxVi53tX1nQj86tP0u+FgVv7mQHW9Z2ZCfgH10XbP7KXgaes8yBhU/83sLS5t7kizqwwKBVENObgworvwSXfPAcF/d0qii/wX3+tifiSH0Xc//2YmtKTzKui2wr6YM1sjQT/q1euMvYmjrfYbjwPA6QtbKfu90f7bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775337724; c=relaxed/simple;
	bh=MK3v7W9Af1w4gsAZjeHQ5Iw1wUJ2VsjJxLx16zxA8Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uanRCPQ5973Y7Q8yR3+Ib82FZQcYa7T5eikt8oaUpXtOEpxWuNPUXeOoD5a+0UvxECNOWcPWsy1HsdauNW4Uv3yjB5J21FMc2Ol1Xq9M29IRicFvq6UhJ/kZKL6xPDe+6l5iHcskToKDkX/Av/HXJFIFuG4E+Y/VoMInZChP4RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B67aOBwu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M4ANGaK8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6343jWKQ2867035
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 21:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jAmb2DJFQpjhoL8lvIGCkQkm
	M7lGqiPcwTOeSmd23U8=; b=B67aOBwuiQxLzL456Kyv5iF3uUZHrZ7/YuIWWwBW
	cCnHIxDaZFbLXD8RpY+R7dmqyhD5M3THOZtWIun0cSoeWL0oJLfPWRijIVtFVFhK
	0KjFBD9G1YwyRJQ8O2BoeAxo7HzNIayIHPwHDJgMuIS6+IzUUokRp4AeKuazoBtJ
	19qx8vXiGR3WGxMNg0Yl0ou04xGIeXCW1aq4G6FOZu9nDAV1dl8639vt0SYO7wUu
	KW9g6CB0yCxPfDxZ65gtlUUYK0IPhNuRAdr/gWCV7tbYEOEpAHRbC+a1MkWxeDBI
	c5LZdORIKPdwvDHb8tmbSjWEY+VooQCgdw0kgPFkzRYFbQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dau14sg5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 21:22:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d76f460b2so30045231cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 14:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775337721; x=1775942521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jAmb2DJFQpjhoL8lvIGCkQkmM7lGqiPcwTOeSmd23U8=;
        b=M4ANGaK8wkvzvCF7VjQBrSHVCoqRDqA7XjbVORUywmwfBgBUCI3f1QgO3DmXZd5LBW
         InCVrZ+8bSoqBwhZh6gKd5Gty8+vDgDO9xZJvwjy80sm2QtbAM6lbLpwV1XewD/k714v
         Jz4z83aeLxiJBzXJpU6gDrCsAZ7toCYRgMeomgHdBKjC57GVCbKfXz6kJg6oGl9nG5Pt
         ht5wcEPb5zATTZCCFzUp1hK7sxoT0nWswuk1xq/zfjyagIJl7sgITwGrc9i6rlFfiZdm
         FiPVslxmm2ZC6xfuN/tFHmNKpL/R4HVAV78iqrg3jhW+PUz5udH5HZJvyaFW32vi3w8W
         NIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775337721; x=1775942521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAmb2DJFQpjhoL8lvIGCkQkmM7lGqiPcwTOeSmd23U8=;
        b=ILZ7rrRv6PMrBCRFJRNQmM3f0VCznCtkL4WRkD1UvKkmDas7xEJrGzNSqn1xLjiNCr
         j7M2BOyZPFloXcoDQDxZ9KMWxRzmo/z3004PteHvBPWWyU7aFVUneDGow98LLZz2oIM9
         LGBhTyg6jMFp5xkODSABNCA89sC+13BJSWLkEM6oe4nbbZe4/M9Or6wv2QpQDcSyXfyx
         GjmOYMMcSC00eTt+fgbmOvEm/HDx9zgOMsVVovDpJmDDG/rIqSzMn4VSch4o09lCzE41
         a3Kg02vyKNRzBzyQqiZht3vAqwq9Plkq0k0DqXlUaZmtR8FKRdIDm6TTMGyVDa6MhIam
         J2jg==
X-Forwarded-Encrypted: i=1; AJvYcCVAIOvqo2TozneuuYb6Ln6X01FqF+xYlFZdeXmSebpI//ceC9j9fEF6LdcLVMPYJgfGmoBmXhnMZiFU6KPD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3n0E2u+dSMQBxZToWPsBpBGxrinQH4i75CraEsrIq3d9g40E9
	lt+r618XH9y0z9Id/ZWVC4XzoDa3+ods1QOqegAMHBP96LHx7bWSSyVNDU/ZP15X1Og3EeY/UY0
	I+szEGHWWRecXqhG5/9XmCELHN00ZItKzHNu0JFzbeaJHTDCIkE/jPXtjcIdm05bMkvdp
X-Gm-Gg: AeBDiesot4fmF6xKcNLoEtYxC8EGn07tHvFrQBLfOUBeq8JJpTPhLBAY7vTH+jEOL0K
	EeOgmzcWAMV+jHiM+hZ67CcoRtDe98Bur0DpE0Z92XH/xqUajAX9X5A4khddexXaCg7Ndtu0vIc
	jmLglCMuUgjMNRt57suXN43Aizfhvgh7IeTDAgfeDeMhO3yEHTHZ9/KHOIjo7OUsypvOX4115ZH
	BFgd2OazUUVxaIGLKie7hMz7d3lsPcOsPfRn8VlHuIJED0qiIcu3rXNTWTpHcdQx3KRe/E4L+Y2
	9+A70YkhLyNZR07fJdukn+n3BHNz9aTG6OVByZfTRcoGaKrQHiSmcDrRgeAyx9rCqcJihSaLFhE
	iDyVWhpWkjIazv55gvDgdt6TPk/WQSD3M0/JiNQEVqB875iTQQcarAZwyrE5ZFJwyS7hJWr+LEU
	Xycr4ug0lnLSCTXwOOBp5xZezVQDZqMEN+yfk=
X-Received: by 2002:a05:622a:40ca:b0:509:26f4:64f5 with SMTP id d75a77b69052e-50d62a8d633mr123568361cf.48.1775337720809;
        Sat, 04 Apr 2026 14:22:00 -0700 (PDT)
X-Received: by 2002:a05:622a:40ca:b0:509:26f4:64f5 with SMTP id d75a77b69052e-50d62a8d633mr123567911cf.48.1775337720381;
        Sat, 04 Apr 2026 14:22:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd2187070sm20755501fa.42.2026.04.04.14.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:21:59 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:21:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
Subject: Re: [PATCH RFC 2/4] arm64: dts: qcom: glymur: Add GPU smmu node
Message-ID: <uuub6ue4yvirtlg5fzgzobc6y4of7ipud5xt7enmifpnbhjjxo@7gsmb4nrjr4i>
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
 <20260405-glymur-gpu-dt-v1-2-2135eb11c562@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-glymur-gpu-dt-v1-2-2135eb11c562@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMiBTYWx0ZWRfX/ksLjRolLBFw
 7EH+Wz7K2OeNkTDomiB4CTy24km+4dVZQ0okm8Mtam4Th/99CAjmixhSIforryF4HOVfvSiuIHP
 htoeggWs7NKPTQjsll/XsGb/OlI3OCjF9pdCylr1SUtGdUF2iZN2tuPTU3KpxaStLd4Da39kxlI
 Eibac/nzcmbHSDccJUY0OVEavVGKDCO5zsv7zyx3dB841NVwE0xKed5Fb8VZjhZEulXRGXSz2mH
 JccxQfKUYZ/9PnKlMHTnVRlxJ7qgBRPuYp6HYCID5jWSHJOCGyKZyRy9zzEfoovRTJdwI9+gpG/
 x0xBRu7wiMFGnbJ7o9TZnqe+r7SHVFCNnEw/iDVG3JYjCYowxJc113eXjnbrD9D8s4vhoyKIs8H
 /KS40nuELab5Gdx5fAdF7AyFp6akzQZQRVVLL92sjBpTXN+NmdpQPU4vuONILtxGO960w1PsofM
 v9w7m3O1mUTO9qPK3Hw==
X-Proofpoint-ORIG-GUID: 2hT1Srwt0M4Ei1uTZ9OJe5VEpVuq8gkm
X-Proofpoint-GUID: 2hT1Srwt0M4Ei1uTZ9OJe5VEpVuq8gkm
X-Authority-Analysis: v=2.4 cv=Q9HfIo2a c=1 sm=1 tr=0 ts=69d180f9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040202
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101814-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 600D739C96A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 02:33:15AM +0530, Akhil P Oommen wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> Add the nodes to describe the GPU SMMU node.
> 
> Signed-off-by: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 40 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

