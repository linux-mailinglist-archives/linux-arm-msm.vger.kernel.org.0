Return-Path: <linux-arm-msm+bounces-113312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id //MmEwqgMGpGVgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:59:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0EC68B20D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:59:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="LA9/oC2S";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JSK099So;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113312-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113312-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE6173007368
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3638A261B8D;
	Tue, 16 Jun 2026 00:57:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C961DF254
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:56:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781571421; cv=none; b=oND2stAY23uzF+EjM8iSS7krTZM2uXelRss3zRgJ0ECkV0QKala5LOpJFotp1Dfb7TUKGKE3zgIGaGXl5WxTFmwq08CM0pWyjxBNwzIyKSMuiEC6DiGdRUdWTTk+ImPhdc9Baa8XQIc83zajeonxb6LKHPCST7nMDjpVlfIeYeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781571421; c=relaxed/simple;
	bh=eSV9WPMekMGnDs84RVMY+Sp8QhufZfVIYVV6rqC3r7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQE9ZWwh046/4Mj+BFL4G+hrAX0QLLCquKnc/9tXd/4tCl8CRtsf3UbuZq/zjwD7ZjZlKy8AXMM6vaTV3D6yguAH0iRynQZ0aT+o1YDLKhaPEDk8zIS5oCuyxGSQilCKbCunEJdDimigXi78MwxBvpXtZzVJdMZGEwIBIYZyUyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LA9/oC2S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JSK099So; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0OYCU2131398
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1kbaM76E9XIMD3rRvXUXjCdg
	vz/AxED9u3Llq8yAVaY=; b=LA9/oC2SG+bp/2vSC+T5fzx9421r2DAAaLl7vYxz
	5gVHBtNNd61dUXxs+P2hgXdQKwhII/PoVX9+LOmFK2TACn0bv3phWGb9O2G1tSFu
	0XKm98eBi5wBxbGMv8NnmJcXsN/FCMmNEKxK9jKd+qjreQJ6IIhL8nRbon8fvdvz
	FWtK6yg1qIIDlB1xOI4IxB0u6/I/Jdjna/QcrjRtOlui2t0vwfV+S429YTzNiiuK
	tGPx/9CgYRamLstltjtBA6crY3Wi+5zdSqF5fDk0OJwD9wEZxer6xX6WR26ZUnDH
	SWkQO5fvFF2aqg/RGrVZXaDVR5kKdPPLVw1GdMniOg+o9A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etgvhkday-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:56:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157f1be083so681826085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781571418; x=1782176218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1kbaM76E9XIMD3rRvXUXjCdgvz/AxED9u3Llq8yAVaY=;
        b=JSK099Sou/sSGXzx0lCtyUjiaErAGSnGBztsi7jyOxvA7TNRFp0URpPT9I/dIOGzN2
         Tp6LttvLDTHnOU0gmZ+8eVhjdssHcQNaJD+wc7RKTxgjliNJXWheti9d4Gi4O72khdZw
         8BeRaUKTm2mVaKK0cHQIedBmVYQ2J+/UCyQBV9545NSD+lVntReuQ3Y/0xOoP0AVy7OH
         hFGq167XojUz/BnlQdFsPjxEtIrru9Nk+3zT+dYIcbdRoDgbAhTvNoBAZYvrpZXr/M67
         01LByxgkfLr0M8KkJWC3XrwxknJYy48beyUId1/E/jPPaV0VFYDa+vP+LX7+GRDD0s4u
         QgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781571418; x=1782176218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1kbaM76E9XIMD3rRvXUXjCdgvz/AxED9u3Llq8yAVaY=;
        b=gz0mw1L/PwXbsqSB82uw/jbObMBhqBgLGJDJFv1aC7it0Qi3NzFc527sAvNkcSyUEU
         C6oufomNgfnY5fzhncff+W1Y0QiPQJKJD0QzLI633Ixl+xYaViR7uuBqYHknFANECSz5
         l0gaRk6nL3iwlFu7jl/iHPswkW8JpCymciRx0EFPt0BhIqFEMjLXaYoNbr22GsUrU8FH
         6t0uVF4zIlgEWRSd6HvhjoWmsELTnrTrmpFa74/eapq6ZMfkRTrcjDbfqo95qc3gLH7K
         JtrOZWCHIBK/67AJoX9J3GojbUcXHh5uKPDXE9F+S3hzgCN5KmH3k4vV/8zI687b0TaM
         DnyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Dg5cLI5oDvw+hg+VB9YDKbO+ptd7AFTSSFo+bm5uWAxHAPNC/vfBDIqYuzc4cT8BJgtRAOz16NidZxmxg@vger.kernel.org
X-Gm-Message-State: AOJu0YwLi0OiyHOWMG8AjJB1ZDNmq/u5Dp6lcAZzNSDinR5bm27WXu1P
	C9BG9b3LAHKVjV6SjdzqAQlp0xNPxfmF//3Fh5ewMN5I30pQv4I800e5c5CJLWOmNoSm+2RIwgn
	Mhfix+amNYzqvj/m5g+wNNGZPQX5Ej8KzviQw1Ur/RcJGkWjV1dj/0Ons/kFkE2Q8Ahj0
X-Gm-Gg: Acq92OEJBFQInTN9v5VrSSlEsVHjgrGDYrqbL9V8FaNorvk4f4zYKjKzz7pz2iZ+F7v
	GnQjOWi47Cfk3f20Vpq63GwT7V7JMj4LqGPjCpZ2v4UVfjEY9abWBq6tSF+HayZxJ4aAq8S2XBX
	WnKMN/bunsjRWWOv16tISx2us/MP9rZwB7d3xv1UJ6xbrlVA6GW42uo682iDhryl1eNSx6dJf+d
	Vb3uBqtCKKugA/ut6sgoMnFnxe6yki0wkixA7ilEmKYcqiwFWn2aNeRlXsXCWQoLp0PuFtkanqV
	NN8U2xjkL8o2GF9q27inW07+fyyh+dXor3PDQ4vf9KDvmEfZ8oxfAuiMNJlK+iFWpJup7LNopKC
	mifwgm2/ieogRmSqOav5g+l0uZ1Kh8Dej4I7PAuMsRkqLDyjYNe5oPBHMDcljJ05gyeB5nsREds
	KesCcs6fDWCmAZRKIqzI1617BKdv6ptD78Ews=
X-Received: by 2002:a05:620a:258f:b0:915:d5cd:8ce5 with SMTP id af79cd13be357-91c24579d0cmr350394785a.20.1781571418328;
        Mon, 15 Jun 2026 17:56:58 -0700 (PDT)
X-Received: by 2002:a05:620a:258f:b0:915:d5cd:8ce5 with SMTP id af79cd13be357-91c24579d0cmr350389685a.20.1781571417856;
        Mon, 15 Jun 2026 17:56:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad3d51f20fsm925671e87.61.2026.06.15.17.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:56:55 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:56:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] drm/msm/adreno: Add support for A704 GPU
Message-ID: <yldxcxtrdgsh7c5s5llnoobdmgnass6spyty6mg6yfvcrype7j@xhgga6vafd7n>
References: <20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com>
 <20260615-shikra-gpu-v2-2-2f2d1347c3fb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-shikra-gpu-v2-2-2f2d1347c3fb@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX3WPyDtjKzkeY
 IPkWOsTGllZKdvDPQxwgAnipxpOCN9v3wQdmFJW0zqkDSz1r52Mr0IQhQgNvE5q4gDBmRkWQruR
 vI4Cs2Uo7P9NkXdqep59UoALInIaU0s=
X-Authority-Analysis: v=2.4 cv=Zqnd7d7G c=1 sm=1 tr=0 ts=6a309f5a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=EcFSykfY_HSBU6426B8A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: _z9TUcjEWYwXOwJE52vJqccUrqCSaflT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX/QGXvElI4oHf
 CU7HVc191u0G+Fmmuo0XWg1IcdsDsfP8rP/XRcnI+Zie7IroFFFZVijEGl50kHFsMuaS4Z6c+pi
 DpGov5Ds5Y/pGWij6EkxVcXP8x/M8WaINdGLw4J12pbvbco7nDZGVGVf/d2J2HkUhGm/eZD5MqA
 YwtZglMG/77QrsusTJfdMmyGvtNm0O1TgBLwk7EZ0DLlltJuzrsVk2YD5LzVOqLHS5wcAlnYoiu
 ZkiXwbKOLLxtf+ByT6Q65i+szvsG2MRM3g1w3FzIO/sPBiP4eyOMA5PNSCkEYK8pJDmfrQ2LUOH
 gskbPQZ0EftKQcRhEUAD4yFPmeXohhOnedoLyngBv8Kz30bVMGu9j5+KDKDwzEjmQpxq6wnpscy
 O+6GKQqgCKUE0m0yA+LFnw7ZxuTIIXxw2O5/kQ8rr+DkkLdP6M+BM2sj0ZMpnsS66nYdkcRnCac
 hj+VS+6meje1XRkZGrg==
X-Proofpoint-ORIG-GUID: _z9TUcjEWYwXOwJE52vJqccUrqCSaflT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160006
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113312-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:asherawa@qti.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,qti.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,xhgga6vafd7n:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B0EC68B20D

On Mon, Jun 15, 2026 at 03:02:58AM +0530, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very
> minimal changes. The only KMD facing difference is the chipid and the
> zap firmware which is specified via devicetree.
> 
> Just add the new chipid to enable support for A704 GPU in Shikra.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

