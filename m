Return-Path: <linux-arm-msm+bounces-99737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M37Fgf7wmlXngQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:58:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F9531C9A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92AD03053BC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 20:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84EDB3590AE;
	Tue, 24 Mar 2026 20:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AcNIreDC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B33kGQwq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6449B2D5432
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385923; cv=none; b=mH3jivrvuFCIk9CtXQK/IlG5vUCT8z8dlHnqZ4ebccehRdN9mGD+wZauoc+Fwkw/h5fuk+pGDrNCQRb/BHxfq0ZVHCMqueCdhfMyE5VzNY/nccGRXo+FWIIpzyBbL+udGryjOU8Pk2UkfY9SS7wx/BoA2NPZ37G50E2Sm7wtuHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385923; c=relaxed/simple;
	bh=1iWxZYMdT7WZki3cVU/4IqF0Xz4RsVOvzqZA6BYw0dE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xc0OhHjexg23MgPgPe7uElcLV9/3MEpvWuwrJ5+wx99zQ2tIZA88nylv5ckJoLtznrUPvhB3gJKqy1gaMur0IZkeBbAQUFztcV2tcFvv/UIAK6Ky+WgpI+D3KrjHs1eQQ0Lchdhd9AYEqNaHSctt5OsV8wMSWdR+T46oALZJp44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AcNIreDC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B33kGQwq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCi08907716
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dObdCUPKJb2zp1nx9CXg4NlS
	qmz3OxTlGvy/tRkBBn4=; b=AcNIreDCN0pEvFBQgTEgj+QyXg/iL5U4cPVlj69p
	GwuYBhRy7yGuofsG/8HE4YfcUWWW8hoHay27nUR6v32GtDOoVsHUrUaUZoiwfVmF
	vcz9OUUy09gPf+N1/o2bglx2v88Ui02am2ZYPGsjSSz1Rtcu2IkQgpY7tEdPGrUp
	m0FNZBixfTaDlwKBXDQGqOjSMkfQcdqwgY2P2iEy96hIf/RB1rTPDWmKKFjalWyy
	hyTtp79RTEQLsMOSilLHrfOm1/7X4BGETtW2BdWmjPni7GMs0iq6zfiDVMkIqUzB
	NwPOkOGxh0TmkTehz4poUINP7zjeoeC8Fx9yVvsoQDdpJQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3ukm9nt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:58:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b802961ecso6926921cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774385920; x=1774990720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dObdCUPKJb2zp1nx9CXg4NlSqmz3OxTlGvy/tRkBBn4=;
        b=B33kGQwqen8rtsWLhbUAmFVDcVrPxmV2A+j8rzL3ire20lYWzhsWVhqGu3TleoVPdS
         0BW1+gSBfY8j+weSpTvArlCDQlIIkHgRZnX50gRXvr0fkDalQKSx0qQ4hC4UFzacPDzg
         oc/PCQi1VycEtPWIcvlIOW2gJiKnQ3ZPAlrA3K6SEHZqbbjeOJfqjK/bQgSADYfMmo3t
         K8U2RvjsyZ2EwiVJGkYnZVYPxm9ATRgHg1xdQzi8NwsHzaJ89ANMQJmyujMcPOD6K38b
         1J3UlrQc+H/dpiEDsZ/sw9OTCPPoh6z14IlTwMNlht8RdafiSe/cQUeZMf3nm2IjGaOT
         torA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385920; x=1774990720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dObdCUPKJb2zp1nx9CXg4NlSqmz3OxTlGvy/tRkBBn4=;
        b=CzSy//GEH8shos0ap2b7pk0+rCKFvVzrlAvk6HrRJBPRalx6Md+j+tgKNyrtOnMJLB
         B5fPgKhy3uibgSgHrCGst4S7mpFhT+jyh7KqPSMxmd/Xv7VwK9Sssm2Myrht9YvWS0t6
         HJJ/IUOboDXACe8xG8WYjh+0oUY1tN0oYo9p2bjrICDgNnWNJHXxqJiSO+0XG3PiUoc9
         8igTbnFH8uVMVfsrBLQnKlxfELUMKrm+O3yzfV838TycUY0Ex07pJj/PTZwm1eJE6Chk
         g0fZDysGZyJbALiHqNmTQWWCpcTtekiUYoeC+U28UQkWIR10ZQF1yBLiDqQCfjumSEeW
         Z1xw==
X-Forwarded-Encrypted: i=1; AJvYcCXV1e8gWJkATg+uXXfcRkOI66cBxDHwdDkc1FQgrSA/RRVCEAYGXhxartjM1is8KLnNcvYRBUHAx0lNTZfp@vger.kernel.org
X-Gm-Message-State: AOJu0YyPVadP+YUlMzwD/ffi1EvbX91tLqwutJOLgADqN+kMGuhTvwDD
	ikGvpKNdEsYs20IGttqcx7nvN3ap0/rZntqy9pR+QOe2PDAgiGKWlpjYK6haknVaFhyBvdui+qA
	WYgpRNvCMY+mLH5N3Wl05kdTo5rEIdjoqZW0IBQJPkM30x+oiy5KnAUGMhZvCgkL5HaNI
X-Gm-Gg: ATEYQzzuzAV6LpPIesr94ma1wkwmd48fyItVTkWycFyqs0cxilbLw/aiCYqnp0rMzj+
	EMhIQwYWH/qTmXzLeOj/HSnDvzqK7aK+nXAuCTzzn7hxOQfw94EucsldBNNU3koJxHIVTiybny4
	VTToINgT5LWh/A22EiQaP6tuDt97qF9get5bWyRXWwnZpatruz2gZMTEpBaa7bC/VRu6mGrO/kG
	qwliZniVnJQNVdKSqMw5wD+s7ChNNuA/Ef0/mXonEbO7sV3Gwible72jvyK8F1GyEJkMYqewtcd
	IJoi2u92JzzQTAZLc1WqxzDQuIkLbo0Vk7Oqvg6fpjMyS/vlCf/XLNp+wFNnHs13spOGp3DQwSO
	Xd4wlyLsjNjYByItVA+LWyGzKey0jN+v+22KcjI3RpTgHUR2zM7f8uI+EqbPtqsdi62EHXbQPOh
	bXlN4L0q8TU7hnr38GVWDOrae98jClBhIjbIw=
X-Received: by 2002:a05:622a:607:b0:50b:49b2:7bf with SMTP id d75a77b69052e-50b80cac0e9mr18078591cf.12.1774385919715;
        Tue, 24 Mar 2026 13:58:39 -0700 (PDT)
X-Received: by 2002:a05:622a:607:b0:50b:49b2:7bf with SMTP id d75a77b69052e-50b80cac0e9mr18078231cf.12.1774385919201;
        Tue, 24 Mar 2026 13:58:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9ae8570sm32544541fa.42.2026.03.24.13.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:58:38 -0700 (PDT)
Date: Tue, 24 Mar 2026 22:58:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 08/15] arm64: dts: qcom: sdm845-lg-judyln: Add display
 panel
Message-ID: <zcysysph3ouvxmfusit6jakrebxc2me2gcs7ltgypejmgv2axt@hm7ayaaqmsvt>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-8-29d70ca1651c@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-judyln-dts-v6-8-29d70ca1651c@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69c2fb00 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Gbw9aFdXAAAA:8 a=CIaC5ZaqQcpxzUOrIL0A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: buKNmXPI71V_IJQ4V1gGohTCK9U6nnMe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MiBTYWx0ZWRfX1afy/ZHwQ1xS
 Fcq5+kiqGWNvzjH5HVXHUqHlNdO1LttGwXGcMHWuY7gkq0PoVuHZqCkyZVnelWUW/q3tdhVtYtG
 34E2Ib0J2FjIBQgXlNBUuVCQdkgWfcrAl+t4OVuf9NGstD4MzuJXrF+Wm6ga8A/NxxGedaNnv/j
 vI7dgRq+XxNzrbdZ0qEx9vLZoaFIeUKe02sTXIcTwutQhXwpJErqpX+nLIh5VxiMLEyEVpRoMSU
 rY1kM7Zygeq2KELEpVQBGorIlhsi2x/XwjhWCiC2tlo2Smi0SJrJ24oiYvsEfu0IDagBwbERoxh
 f33ceyqhcYM3h1AEN5Wq1XBA2ZiktcY8bNPyHWPbVnUBAfXWNsVNJ9Id80lJ/uW4QJQNcPtjZ2W
 3bKJqk1bE5jI3CzodzlajB6mZPQYdIIacQSVRenR4gwpwvE/dOu502pxMCMwz/gBiC/xu0zmDEF
 Fz6QZSyv275U5u2045w==
X-Proofpoint-GUID: buKNmXPI71V_IJQ4V1gGohTCK9U6nnMe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240162
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
	TAGGED_FROM(0.00)[bounces-99737-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,postmarketos.org:email,tuta.io:email];
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
X-Rspamd-Queue-Id: C8F9531C9A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 07:06:38PM -0700, Paul Sajna wrote:
> Also include other supporting msm drm nodes, gpio and backlight
> 
> Co-developed-by: Amir Dahan <system64fumo@tuta.io>
> Signed-off-by: Amir Dahan <system64fumo@tuta.io>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 13 +++--
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 68 +++++++++++++++++++++++++-
>  2 files changed, 75 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

