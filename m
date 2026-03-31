Return-Path: <linux-arm-msm+bounces-100926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GahC8EZy2lrDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 02:48:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B9C362D2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 02:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EE393047A6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 00:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664F23019BA;
	Tue, 31 Mar 2026 00:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tplk1dNF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FoKmcM8v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2737D2FD1C2
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774918062; cv=none; b=JKfLMlcWFIGhnK0F+ih9P01unBY+F2QhclyD3yJ08SuOxudVRyPpnrsehwhpExdVAK//4243GsMne/6nBUbr7E1v8pbEkTfTpDBJHC7KgYtJiO8j6aAMpPMMoWYlgNuO7RGyz7GS7a3NjIDwjpDxsXpGK9G3LmaVRR0cjx4Mg1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774918062; c=relaxed/simple;
	bh=UkRdJUdZpZZHT4v9BpxTkD73SSfqTtiXvqdqJgtaJlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1XoIyHhm7/UTrhitVIPaQCIBfvIAPa5Vf3sqVB6AE3zg21R979zzvI6sWY6C8MMa71gf3UBOZox4izQTrh6RA9C35eb8ec5Er5CAJPMFQU4WJmM0VGigV5UjK0aARAPDpvLkpEV4OhqC7JRB5tqvcMNGyiw1pomXhj1Y76qNJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tplk1dNF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FoKmcM8v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UMfsKX2391396
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0ks5/MECiU+6M8bwHy2sQ/Az
	zteX/sEkGMHcLgyfLDw=; b=Tplk1dNF1X+HKHFLmV7EUninlPstXsnxOpF6LC2H
	XxNbSUAD478CTzLS5wmU/Y7+/FRKRneuACXgqb4wGYEA4XbDHyEAu4IYQ/Px9Pv/
	UABgHZNBfYxWNm3LYYYJf1PpyLIIgeU+T/IsKT+B/fM8QgvjO+P8yJ1SGWBsF18/
	EIzCJMllYxhzsovUuHFNQ/aVXTWkQAPHhlJT4Z0xO++FaRsLEFcAp/YthaBKzOYZ
	arotXznbVbZLVKQAkYPdlDYVUOFosANeDM4dRm0QX1ZowzCk894rXaVoPNupfTNk
	VVD6H05kLwHXu911I61/ElF2QGBaPrUoY7wQ/TB1Txllbg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7hyqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:47:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50937cf66b5so265325301cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 17:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774918059; x=1775522859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ks5/MECiU+6M8bwHy2sQ/AzzteX/sEkGMHcLgyfLDw=;
        b=FoKmcM8v3GOsSdqNbiUYhm3NOvqpVp2OnRdNK1tMu3MMg7ujma3IhoElSkyE8pewB+
         qfufnhg5YXNhEGHLU3EWvxX3Lk6aRdf9JhFn5udh2F+LCUQpcx0kKLz/SaJhiJ8uYFFW
         zHQJrJbfFRl7bI/POdFhwn4UR42xZfrjO7vgF7hFpKinsHKLfvkgH5H6A+xBD9HSr+U1
         AEF9BTM4BK8nhl+ZGCkdSb/V5/C1OzvZ/I35UhFt48HFfsiM1W86CaMmawv6mLi+BOeA
         WS1Y5ywGMcY4P+1fz8JlFkwj7geuNA3ZR+BfFWAKLZbc3KLAvyJAxsTkmC07fHxWxWfe
         bAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774918059; x=1775522859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ks5/MECiU+6M8bwHy2sQ/AzzteX/sEkGMHcLgyfLDw=;
        b=cB9jM1LzwkqxICTuMeXOVXUxkYHKwzyoDp/O2xB0o6Tyef+oneikPaVtG8MVJVXTzA
         aAX2la/5PiDhWMgWYCicOgKFGQD2DGzYIwRa7PXvD1pdy+JWF6xGzRMm4hZK9ulwfbCR
         2mUaKW8BpViYjCQ3oFMjklUu4eee7JhCL5pj9MvXBaILoyXIpoxIekZ+dyoIYmQyQ2jZ
         c5L/Tal2fDrel5mSimHDcRAN6HnGu6y+qqA6uVsdRo1whTOZ2wFktClYOUtIDPShHrgb
         HeVGmXu3ZtKxovi3WyFbCq+gnrxAKTBVxXiSDGbEagI2cQ0csAcmcuUNt8CrydA+vBmz
         gFiw==
X-Forwarded-Encrypted: i=1; AJvYcCVtcRRfKU9aZI99/nke9c4aYk0bo57gU3Bl30dz66Nh4NxCB9IInl+nxA0qs3O656sTO4Dp4+pHU2ZIfl7P@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz3rXBXDL9KfwfK1R3YMkOuNet5g9D9YB0zcYnfLjucA7yWLjA
	G4sT4jcDey4flFlKciYl9QkaunaPObsTQfKWVHoxtXVanDqQlokRaZIxoyxFz0x2cqCcBshS4Hz
	p2rU0as1UzzoCMwdBrzQFUmM4IaiMdXAOIfgFjMxDNJt+WcAGkoMFEuelgFjCZDQNmIDZ
X-Gm-Gg: ATEYQzy+A49yrtGHPfOMHQw2ddQ6juUR0ry4TVMiVtFLjQ0JG3B6pplpfMXjPfUqnko
	n549FTA7vtuoemwQd7G32/nAMqFT39J1OkyVc0+PKluFm1aPCtSqsXbdFYfsgShzD5YMMo+NHo1
	Ae+aOkgy47UYyFmvooTBsei7GfmweG8zu7cqsf8xime/3WilGBU+1bt8PL4aGAeKouCXZfStyPz
	xX3KWL3tmbZjpQpRLUKxRNZVmPXlbhx8M9uK/27VM3vbrCgFrmZYHzl+nFb8lOFlKp4FWI11qvj
	N2IAYI67dpg1WA/kDq4aW0eMzD5eHlrcWt9gAlmwvydk0NHvDwMltdygH22ww8CX/jYBmLRtIQe
	BOBwToHSQzs26mGGmocbBMldQOt4Ix+lShPaiKrDS8nrZ+YPhIcg18uMU8czXGwpFYRKhWdt/wm
	dFpLVm7vc+ivOdBmovXVV873bTQ1lsMHidciQ=
X-Received: by 2002:ac8:5f13:0:b0:509:3940:30ea with SMTP id d75a77b69052e-50ba391e97dmr194703451cf.55.1774918059514;
        Mon, 30 Mar 2026 17:47:39 -0700 (PDT)
X-Received: by 2002:ac8:5f13:0:b0:509:3940:30ea with SMTP id d75a77b69052e-50ba391e97dmr194702741cf.55.1774918057633;
        Mon, 30 Mar 2026 17:47:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2bc25ad35sm157626e87.20.2026.03.30.17.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:47:35 -0700 (PDT)
Date: Tue, 31 Mar 2026 03:47:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] interconnect: qcom: add Hawi interconnect provider
 driver
Message-ID: <3jsmcfrpmjapron5jc65ueiz4jwunfss5r2saarsfzebex3bf2@mase353jnpgw>
References: <20260330-icc-hawi-v1-0-4b54a9e7d38c@oss.qualcomm.com>
 <20260330-icc-hawi-v1-2-4b54a9e7d38c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330-icc-hawi-v1-2-4b54a9e7d38c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwNCBTYWx0ZWRfX8y/P3fYOKFEi
 U8r6yaqOq0OMd3wBRO2uP7Sjg0i9B2P4gC/IyPx4M5iQcjDJ0G0VvWX2hSbLEvMH7a+RQEScR4U
 F9hEyDacnZYdpuOCr0mTHxUC4pVUoYTM/ZncrFAE+yr3s2A5/PhnPAT4XHi1Q8L94n4Qn8Kg1DK
 i1rmnRoN6628pd0h6IoE5C97houBPQ9/CE28zUnXc0tUh8G9wVanoXAzD0JUssRV3P7LPctTS0E
 Y+x1gLhLAbvYoL8js7yoQ/NDWV0j/dp7MDoMWmT7wRZ4x3+88BZGoy0JCUDnDLXvYrU86PN6/6r
 klBM+BJLP1rq3963+e3R/S6j/dHMpR/ibaVww50nYBdVtocQPEVyePCiEaZd0kvQfzej/ngfk8k
 Gm5SSFGmyXU0mZWBWIKVtGp6ZWyrlcCcLmbzgFG4tcWEMU18ldeEMGWwxcXWGvq8lnTWMy4TWv2
 MljlqmjYN1hPT3gnJ3Q==
X-Proofpoint-GUID: AYcNYvEIwn4F0DQaanYxvtdfQTx01Sir
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cb19ac cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=X2bA-DTC1ecWuKQBpGMA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: AYcNYvEIwn4F0DQaanYxvtdfQTx01Sir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310004
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100926-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 98B9C362D2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 05:40:01PM -0700, Vivek Aknurwar wrote:
> Add driver for the Qualcomm interconnect buses found in Hawi
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pairs.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/Kconfig  |    9 +
>  drivers/interconnect/qcom/Makefile |    2 +
>  drivers/interconnect/qcom/hawi.c   | 2021 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 2032 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

