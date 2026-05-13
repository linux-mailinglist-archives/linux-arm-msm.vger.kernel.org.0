Return-Path: <linux-arm-msm+bounces-107407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yA2GA/m8BGrrNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:03:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3CE538874
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3EE0C3157423
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C653624C3;
	Wed, 13 May 2026 17:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oax177p8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hENag+1d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E353932A3DA
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778694861; cv=none; b=ZSIoB9iTWofQCvHwQ44vcBOSAoZzNqrbNRvyw+5JY7hDJUblSa/ddGzpVvsrnptarclq+XmEWFLeTColFykkBKotHkWvCFmY6OcAbgKWTJmNRdhaajmnnR7BgukZUUrX4zo7mr763DP2XZ798VatjYCL6oh6+zQmRoV1PeWcz7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778694861; c=relaxed/simple;
	bh=Ud6HHue5cUw0cb/NqF5AekrfW5/jUOz36GsfhRRCz/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRbTFj+2NV8BfO3heIG8wyKm5nFV2w/9vQCcKNCWAdKEsKHK/vgwCZs+lorZXMVobcWxIvKI9AlDEb53/4V3JU+2GFLhXHiAPNXXvKs4Aeo7lw415sofWueUxgQ4CeBVVM/wCbWgeCq+7IPz4nMSE6l+LfoY0nU79T/sXaNAB2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oax177p8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hENag+1d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DH6gUP2321285
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C04fNeLquaS7uemBA4+Am0E2
	khDbaAX+WsMNaX9Ovo8=; b=Oax177p8aI3km8LgiNOtkYjekiQ0Imsft1DerYtc
	jvtmBnrShmz7Nqzh6axl3hpXAgZxpyJBdlscrW7C8S8C22bKZYoE9ubyd/8mRFeQ
	lMVdLBKtUiLcrGcDJDEf18j0zGPgpTG0B+X/vMEv8epb/uJlcOCdX+oQtDr9xReP
	Z1IbFZODpZ6Lfk3aeaEROGwTglWx/gB4DEmgMteBfhQKrXDPuyyUb0TJxLVE3mhj
	eWjlze8sNV97zvqIGCwB5sZLKB2EjuzmKPZnpmxIgezOXo7I7c2Qmeh5N9B2ImHk
	0t6CuNQGNWf4w9c5ER0+puVu7hwxiVs3diiBTy9IE+PvBg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgub94y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:54:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb6d713ddso39664651cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778694856; x=1779299656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C04fNeLquaS7uemBA4+Am0E2khDbaAX+WsMNaX9Ovo8=;
        b=hENag+1ddsR98gzqNOZ6sZT3s1GBXQyMncS1tjyDb+A+Xcn61yLCbCmUCXYLfQuCAE
         hzTmk1USQLoErwelmew6iP5FI81TExJ1AMVxg4YLzZOEvs6k74hnvCN67EkCSv6d1pt6
         YjYzTf3qc2woqkIHdsDkmL2cq10eFl8Rrug8A8zQ0Qx6DcpSmDRzf1o0xgNRv6IPfSDt
         zmyDphmYLb/hD7ee3L5Gley3Ycckcp1ccT4urjon7yznADs/W+Hlz5pkglop7FXtcpTl
         TZezvDOqJR54eBH7sQDFcafTthvlm7s0Dr8SlhOv37X/iQ1E5yGRUQ3Z3pZKSt/f1Arx
         dgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778694856; x=1779299656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C04fNeLquaS7uemBA4+Am0E2khDbaAX+WsMNaX9Ovo8=;
        b=QDGzcjlMqKxrnTPl8Q+g+qIHGexhdfbopvsOhBQgGZOtkcfALnzNqovMz+bgFSqVgS
         8etSZS9pZmWv6K3AH+LbTm3Qublcl+dYAsDfovg9F+sbQgZkfBWH1AFBN/5C6wOM24Gn
         qXO5UrRRpIEESJ+1uL8sDZne9hptuOqJpxIixXcdz3H86AW2Ao6XtERavBoV9WHXDKSk
         b3fEgqE0nIp/EKfWjNPX5ynVbLrF8QzHB6NOXim9M2FOgqjBGMRRZCjgBWB63FFRtqzc
         aj8kb21gaG1v/ByE9sH0CaVNEDUIcHM/3CsTskfPwfLADQIKJn5UxsLQzAc9v0MXiJll
         TPtw==
X-Forwarded-Encrypted: i=1; AFNElJ/iAVXqb1KZgTuc8COQDFBpJp0mKjjA0t+un7ut5MkCkOhIEa11zTgcrC3vuH92L/4iAXZ9OVOnA+Oodfgh@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvjx39fqLXdJqhZIN1epcw6QEm1/KwpAYvPQ5Qt5qZ75zl9zr8
	fsLN2XGAWZeBpnVB28liObtm8u5iT61PhpHzDv49Oq0BwWYEbOVzTZH0vtPUcfk4asnRtuCwd3O
	Ni8IgYZe4dPTT9tBjyRxfncaM9C12ZbFanxAjW02XewRnuEtdxrhU0TWQVxhTREca1lP0
X-Gm-Gg: Acq92OGs+KFYd/8pAgK/HCVMUD7Y9G3rl7X4EphxAbbs5rorPQ7PdBPAwFvTXfFuBQK
	/64t7oS5CuLM+nJEyP8iMDOWLE1z3Vm1kUmjDdlOF+2QtYF8xXYMDq6qKos8l9ToUyllgbTylBg
	UXd6He4c27uKZmju4FjqIsnFetrAnBYAMci71kkPW1+AhuQJ7VfNLYEi7Ez1Un/ro/TkdQI29AW
	kBQbPVzO/ms+a8VIwhhPcz4DVN7OSFTat3s1KwowZSRlUzRUmMPHwTCwu6t8igl2e7AQHHZYww6
	5RamKYKtkyIm3pn1TZWHrEk5vatLyZLJaRgHAw4/rF1RO2QOoKZ1gt/V4gpEZPWC7LG2j/8C7or
	W+rFyPa7rT/RLqYOBqkTWEjaXbaXqFN9hgvQdyqmvValcq4ntzsS/PFi/qhS7IpXbBXSuzSjs8A
	YzliQ6XYPYBM88gDaA4VUkfrLm5qWiQOk/9UY=
X-Received: by 2002:a05:622a:1a97:b0:510:138e:b83c with SMTP id d75a77b69052e-5162f58ae21mr59840031cf.33.1778694856285;
        Wed, 13 May 2026 10:54:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1a97:b0:510:138e:b83c with SMTP id d75a77b69052e-5162f58ae21mr59839211cf.33.1778694855776;
        Wed, 13 May 2026 10:54:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945c8de83bsm187021fa.15.2026.05.13.10.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:54:14 -0700 (PDT)
Date: Wed, 13 May 2026 20:54:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 8/8] arm64: dts: qcom: kaanapali-qrd: Enable GPU
Message-ID: <t5kgyoudahhrii4x3i5eufl5rqdzrcaid2n4yfx5kixm2xrzqo@3sfbgdenehnu>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-8-13e1c07c2050@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-kaana-gpu-dt-v1-8-13e1c07c2050@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a04bac9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=zfO1FHEroGhDxMXjEocA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 5GI3EPZdyqizjVkJEZqNcxl7MixkUnl1
X-Proofpoint-ORIG-GUID: 5GI3EPZdyqizjVkJEZqNcxl7MixkUnl1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3OSBTYWx0ZWRfX/io+/VKfEQHP
 hYfWOyZ4yLnrCT6IynInsxlZFyFRcB7fFfGgfpge/0msuatde+BdZ3ASbPG4shlaz3b74CLUZo4
 TVWTKSxOfPPfmYJkdH6Pf/PTdWwjeg4wMvzrVQjul/Fr0efkwDeAzqP+FqWr6rlqoYis/MoeGbU
 k1dOMloyQsYRvr5iDfhe2rfmNpsZN1aIxy4j1EnPfM5w1djiTzjq2ER7GFgV3V5o7dFVD+8kRBs
 Pqn7OhK4wY+6gaCL65PcmJSFhUzWUpyo+rVaM/NG//V41FOdUf26FlG+jA4oWtSu+BooFBHGqMz
 Os5VQQ0Kq23z1y6WgR/qKCHGrGRu6Nu+hAb/5gTaFTbsn7+7MpC5X5X8aQ+O/mFgAeLhSEjtsuV
 S2w+bE0WkRuug/LfKzKh7ciMiN9mLizRHhcT/XO9/kCfmteyZAp//+wNT+spK5v+Dw6E/we/k3J
 hUFpGgftvsyVC/8kpNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130179
X-Rspamd-Queue-Id: 8B3CE538874
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107407-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch,poorly.run,lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 03:53:22AM +0530, Akhil P Oommen wrote:
> Add the secure firmware name property and enable GPU support on
> Kaanapali QRD device.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

