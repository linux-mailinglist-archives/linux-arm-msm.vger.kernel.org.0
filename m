Return-Path: <linux-arm-msm+bounces-108670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEx0AfKGDWp4ygUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:03:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A35058B4A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1547A3001853
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751B63CBE75;
	Wed, 20 May 2026 09:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QmIpiuwF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TkqenTBp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330A736E467
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271122; cv=none; b=JpTvMN6h9VOMIGmeTyn1JbKMAlxBSQ9A+sVzIzYg9otiiMCOB+loAyYmhY9HxNhgZWwy07lw+35wRwcSlyptN7Y4j1DgZuae24iDB6UtbN/PoiZ1UzB4o5i70LtuuqPi+MYqcPsvJdUFEh0s8wGsZlccyW/Rw5+iqOl3qh/EoPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271122; c=relaxed/simple;
	bh=hmLDbygDqrx/H+6yKwQRIUJ+JZCAtJqQABrx9xS5MN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnKuLJr7rr33ZTazsyl5qBgrd1d1sVEdyyYNO+5VLOdBgiMUwAauEAwzp0SgvKsIIhwHh57Mihpe59L6v8/Kpwy5Pn0NGFXo/DkoaKGIeydffiBemv5EX09AkSsvKuSEJQ+KFv5RniSnmUYLGuqnplp14Aof2Hg0Q50EFtUD0YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QmIpiuwF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TkqenTBp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K72adF1725708
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Pf0gedsRxrFiXV+UE6fRj3+
	QtQSo8ONOS+Y9OgCYsY=; b=QmIpiuwFg1CehI3C9Zv5/hR06A2jwXZoN2Fp7nsz
	XVeaipdBhNThQY6OZhBYPy58m95M+5PE/+XQD1XzT/+pz1PJqs0Ne2DAV4/KcsfM
	rB8zQbpFBiXisYbMVfB433qtN+BzKE32r5E62M+a0nsfOU9t/K7BIrwMWPUHRYqb
	CN6jIhLelvTVPN5Lh1JkrvvTAa8DA2Ztyh4skqvR9zlVtkQaHNMBb7Z0aE6WTV2H
	hNxjh3A4jlOmizGNMP06pmrzC8mJRfh8A1OudhZIQNINEBKm3WOjH+cRd3H1ywcQ
	Xe9+5s0bIFJ7JBpDBmr0NWu3EWeZnHsqpRtXXDI8HG0wjA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qm6c8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:58:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5162ee45a77so122178301cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271119; x=1779875919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Pf0gedsRxrFiXV+UE6fRj3+QtQSo8ONOS+Y9OgCYsY=;
        b=TkqenTBpsZBRiXF65Afc80PsS1RjTe7JOT7czCphRU2G995JYTpLB7++8kxBNn9khq
         GI/WC6cUB11EMKYDDATGTHgN8m74hMBw7WaEWUcKIRWxjSh+xHe8oxR0stk6IJkS2lEX
         pbV1zDIj3qnYL/OY0tct4utM77d2s7k4ORygWQj/k2dILIBpgZs5T+QXmIBUIoLwe2RA
         zdwV8m6Z0TaSx+Q+5zqIsyjWtzWbz8NQZleac0m17VvwsATaH+yiPXoacWb9RzbOITMX
         AXYQ4mQ043h04EB9kDiB4/C/vKPhg27DvPhlssAr1f3bMgWLwC52LegvBb6Anw+AWYyc
         RSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271119; x=1779875919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Pf0gedsRxrFiXV+UE6fRj3+QtQSo8ONOS+Y9OgCYsY=;
        b=b9znPd0HOmEiN9mMZnyRVizZXMNXN90fEwL7I7Yxhg1joSLgbouzUCe67DdICku74e
         ZtLcho2AgiocPsqxdEpq6PKbd6tfV1wasVBumAkPlGJx83D1xUBc2/nmrQwQTGxXQLpE
         L2+kUC+agzv9jIkzZSNxYPkDqwNipkTHo+kRMFrbCC5I909zxg9Ho1FiSv9rquxpd5Un
         ebgg41AEUoHiPVcZHaP78ls4r104k+NZL/BjQQz4E1vAE4+OL+r5++KgUr4PRREPGUxk
         EuQV8Y5y7TajL+nvuMgtOIuXttyVDftUwDZddcPgPNxSDtkgBtfQ0J2JMFfx1VyFo39G
         dT6A==
X-Forwarded-Encrypted: i=1; AFNElJ81HGuQAAzgr5Tzc19KtN8XS6XRdzel/Q/qDXjjxyWHDdC9wiT/zG1NagEPXqFWMEOzDm1naGk9sG2Vnl7X@vger.kernel.org
X-Gm-Message-State: AOJu0YyPi6ETGxwhlAFvcvwcz+caWsJAIFol6Gy2wZ3H7dySk1hJ4fij
	L9CLo3YSHJZ05vlRYaoeuFezF4NXsx8FMAZPOaxtcsbfIDpfSuyLSvJjTfzRivXKhxMcgPK69Ax
	fet8x1bSWsgVJ1cSRhsePHP8icoNujmqzSVZb+Wp0RAgdxlPGrmMK7lfzrtjH3eX1gB4L
X-Gm-Gg: Acq92OFA6rT40fKl09uSySoj4JOd2fDFXXcbabPmetYZdCwqvWoDHNhigAG01xhoLwn
	xtrui/I85a/pSDxy041b74iYsWyaRkb0au/Kwhhj4DmWEujnP2QnwWYvqPFLKcQ5h2gx1ScLfyk
	3TSGQWG4Rfj+cPzc2oGpQwwgQR+HBka/Ir26OW+a6HMZa3xansPSwP3yN4BpArsTDA/YgeR/8w4
	T0JsL96bbxO2rkgpaTsWocM9rzI8lzEs4TjuuQFd8VBGpcnLWEhr8l5BdANe/VzLTJIhACvvMkN
	xch6q3G/SyefHAseKS74oISDxaX7J36emjosgfX8XUXcTWmzRjMLQMGHNPNxt9lJXoOsDBsPfkf
	OdJ/i63oIQuMrVtYk4gPy8pLwnwh3qCU7ESAWCeiNdc2Ne/GatlIfWtI8TFcOh7ZGggoGrAiW3g
	t7csvg93loKC/RDmm+s8RgODrvP4Wpq6ReInW+UAUR8zWXKw==
X-Received: by 2002:a05:622a:4ace:b0:50e:614e:4433 with SMTP id d75a77b69052e-5165a1d9f06mr313060821cf.30.1779271119456;
        Wed, 20 May 2026 02:58:39 -0700 (PDT)
X-Received: by 2002:a05:622a:4ace:b0:50e:614e:4433 with SMTP id d75a77b69052e-5165a1d9f06mr313060571cf.30.1779271119038;
        Wed, 20 May 2026 02:58:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3958827ec4csm27285481fa.4.2026.05.20.02.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:58:36 -0700 (PDT)
Date: Wed, 20 May 2026 12:58:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: regulator: qcom,usb-vbus-regulator: add
 qcom,pm4125-vbus-reg
Message-ID: <wobourxqghhmi4htonf2ls24mcaeca7chytmyxihbxokc55cbc@jayo6u2azowq>
References: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
 <20260520-add_pm4125-vbus-reg-v1-1-f6d15d7dbbe8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-add_pm4125-vbus-reg-v1-1-f6d15d7dbbe8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NSBTYWx0ZWRfX/tVU/u4Fepma
 53wmwcglmUETreN1Dj5Hy2WV8ivHlfJ8oN7oC8uLRaln8evhtyg3BYk6V1TN/WQgxpe6AbRh5mG
 CMvuRtgiuMm8X8UGa5LKZrinKKt1LF8tcTiXA+PDy98NgU2OdPGIP+xF9wI45KqIdifpWlQtoMX
 H+gUgcQvcWh/udo1Piy+HEkYTuLcycHPPyg6wgAyw5mOoZAcG2stvgu8hUUixyH9PpOYIEBBt4+
 1ixfvvQQGGkLlIqdkAYxgC7/BV0Mrj/iJQT61GL5BmS75FI+WUO9963oAG8gXhE1KQ5hkY4xEea
 XDDXwH2d7hPwOh40/CM6u0aCHYGufjQNB3q9uuNssxvjU8+unxStftyic9BZWeiAsEnDQVwXaUA
 FjoADrYziTlmHf1CIq55GvYIRnkLIZFiUjZfD51FnR1PX5YahVG3pNscJ6Rny0njevx5xTMqnjp
 tUenAML+UpBBJ/lMQ6A==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0d85d0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=DFtQawWTd5gDQlrfFecA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 9-fwp9iTP6dWRG1nyCW_5kQQAItZPgzE
X-Proofpoint-ORIG-GUID: 9-fwp9iTP6dWRG1nyCW_5kQQAItZPgzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200095
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
	TAGGED_FROM(0.00)[bounces-108670-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 6A35058B4A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 02:37:11PM +0530, Rakesh Kota wrote:
> The pm4125 PMIC uses a different USB VBUS register layout than pm8150b.
> It uses a 2-bit VBOOST voltage selector supporting output voltages of
> 4.25 V, 4.5 V, 4.75 V and 5.0 V, instead of a current-limit selector.

Is it only PM4125? What about other PMICs which have the VBUS regulator
(e.g. PMI632)?

> 
> Move qcom,pm4125-vbus-reg from the pm8150b fallback items list into the
> standalone enum since the driver handles it with its own match-data and
> register layout.
> 
> Make regulator-min/max-microamp conditional so they are only required
> for current-limit variants (pm8150b, pm6150, pm7250b, pmi632). Add an
> if/then condition for qcom,pm4125-vbus-reg requiring regulator-min/
> max-microvolt instead, and update the pm4125 example accordingly.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  .../regulator/qcom,usb-vbus-regulator.yaml         | 50 +++++++++++++++++++---
>  1 file changed, 45 insertions(+), 5 deletions(-)
> 

-- 
With best wishes
Dmitry

