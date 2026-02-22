Return-Path: <linux-arm-msm+bounces-93567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DauEaV4m2mzzwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 22:44:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 787ED17081F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 22:44:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1542F300721F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 21:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070D335C1B0;
	Sun, 22 Feb 2026 21:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g/IZBxhF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iXWjofQz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C970735C18D
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 21:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771796639; cv=none; b=jv/L0r/H239m1htcycYS4auLUf1SnsRBWqUYYHo5ychg7hAsY6TXXC8DwPE1zLIBF4XAGlekM2E3N5WcQhsgtIboGLAtJK3paoi5ByUghNiN021SDc62ZjDLq1USYj9ynpXWxxYXasUyxOIqKxUmiAGlrA2LHRv26/+3DbSZcd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771796639; c=relaxed/simple;
	bh=TvDpJfVR5FseYEsaNyhFIvxHeQEM27+Sn6CedJvqSO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lahO92leXZgdkmkVsqgcZMrciUDa4rNx0JdwIvJAOY0NlrqL2m6WExlvybzIUNTrYyMybU8AJqGsC8c0MTcAJ5QoXIKgIo64J4lf0oxb9BKtdEFUU/YMu53kBsXHiscVbGyIIz/Vse6WUq3A8+is/Fgkzcb9CvuCEYlsKPBaL2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g/IZBxhF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iXWjofQz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MKfFcI3344952
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 21:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7H5eSQr8r5kRyCKi5QkW42yB
	FDpLQ6t0CNqhzTaChPc=; b=g/IZBxhFHZZjCC9gW+2xgDXCk0nKqNkf1G/4s3Jn
	6byuIfvgs/EpPPCUVbBIEgnJej37kY63AOFS1jeCF2E/oHzsLS5Yv61SNiSxp6un
	QO6DmM2XyFkkib20wiopoZ1qmtOliXjVkhonbVmUcMwpguojpq2SRkZ3gtPtl820
	IbO5R/iZeh8oJ0hoy+B6dBw80NrOHN49GQtkOg2DK1F4kvQsL/cPFk+EjWOwsnZy
	I1vgkFj//0sY7HNQYPREEHbOnIeKlkfwBZjqc+j1T4syb2CHgrZEFH9AP0Ib/q8j
	9lPLVsHkuvrRxew+45T48o0jB9HrieMxYKkw0PVEOaRZdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8jsa4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 21:43:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb413d0002so4366056485a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 13:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771796637; x=1772401437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7H5eSQr8r5kRyCKi5QkW42yBFDpLQ6t0CNqhzTaChPc=;
        b=iXWjofQz9zzSRsu/OgxC5ow4sMmRk1AlczfWYdBjs+gEqbEhv6poeLBZFrbGEz6Ext
         QrQSLNBb5eQr0ijYYggR08C9q8Kxybn1ocfo15rjrE8ix32VY+EjfJmnKeKvILIlU8aY
         uVYzJ9M51ZBmV1e1E2wy++9XUAKNFD6nQ9bLaAcRwKSixIwOu8vnlMCxJCk81SGp536D
         hHROhOkB03XBc6WKjS/W/jNicvDTlUvSjrqsU4xbFFPci4wt2vvWV8dUzSsEvOKFHfrD
         zR/ueUiSVa9F2KrZHx+ExPv2/5JGBqCdIL8H+eapU4+tWWEwsg52YMTDO6NlOm6ovVFJ
         OvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771796637; x=1772401437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7H5eSQr8r5kRyCKi5QkW42yBFDpLQ6t0CNqhzTaChPc=;
        b=hL7EQ2G6TBo2uAiawqsipJhcKrEGNEQGFg+TC532y887oAYNloRz08qX0PEtqnGgTm
         5uogZfJ4HFSYcbYjSexyOiipNHLjAyVXWalVNUN/VnMU/FFdJisz4a5LsoCwWKU3FpyU
         6PHVVfZl07Oyfg66tapxvjmlMk01qv8yvT2C/FCtG2OY1XEjbTDl3SuH3vmbc7NrbojB
         /gCv9FWMUyx3rGbVPPmwAWypCpC40/jsFiEgI4uQsBEyZzal4iqaORGPUgKartvS8djL
         KGMzQO/MHXv6YNfYeDvei5zSEJyUDGvjNZfk3NXwZZCFQF8htv/B7YDN0nLlYQwEamtF
         GY7A==
X-Forwarded-Encrypted: i=1; AJvYcCWvDCVTDT1wwfz1M+rxtrXmRSRUc5xmwFPwVzPjT6k6x0xcUEYpkWK+ia5k6uoZkeszn0y+NyUQWExMajVv@vger.kernel.org
X-Gm-Message-State: AOJu0YxNgaurIcC1Jv3eVL4CH6V2o1wa8DhwuD+llN1NQ6oCB78DBVMV
	iRWoBaPgFw21O/XKNwwYqymQ2u6+CdeI4jkFXMoynAzn3atqr33PIeret5YT/hyEFdNkzmrw9Cp
	1ly7GhjDofHRtrYv9VlLA7LY+N7byePpBlFzJ1rDEWp8T+HcIthj761q+lZWnxGiRuxwG
X-Gm-Gg: AZuq6aLVRjhnZzbqQEQGdUXoZT3gLAU0iZa3OfuAYBagG/nbHu8D8NFP6CY4Nu4BK9X
	/hQV9Xe0YCbt0TBnAlY1n/nLpx6Uo4ihJhs2vHNeFS4CAYMgthWq17WPLUyh23dwCl1482Mqs1x
	7Fnx6pFBUFLHAESiomtdHHXowUVv8NrfPZmSDJ93pyA3WxshWsZC48tdbhXD1/w/zTRtdCKcvtc
	scbgCuSCwT6qj06w9BlS8uezKxS8xM9ea9BHegAyNhvzeOvtq3GJl2n1lyq5D+2Qbz87T56VJNE
	JS8zWmmIw9eKGhvWC465hTDnfDkyf8OY01iJaHnYt6ejQxMWaZ5CxhudvcGW0TDrCwQnjKcb8Pz
	GyPdlO9UxYUjbwsL/n8dHKeZhfvKVCfIKxYDQz+0GdNqv2nTyAZo6VFbIdLqwdANdt4JhJQZ5UT
	25kRYcLLx9JbvCe73Mzsgz6kiOHEZTZeJnU1w=
X-Received: by 2002:a05:620a:29c6:b0:8c7:1b49:bd5c with SMTP id af79cd13be357-8cb7bffe8c3mr1385478685a.37.1771796637115;
        Sun, 22 Feb 2026 13:43:57 -0800 (PST)
X-Received: by 2002:a05:620a:29c6:b0:8c7:1b49:bd5c with SMTP id af79cd13be357-8cb7bffe8c3mr1385477085a.37.1771796636624;
        Sun, 22 Feb 2026 13:43:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb3eb07sm1175763e87.47.2026.02.22.13.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 13:43:54 -0800 (PST)
Date: Sun, 22 Feb 2026 23:43:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable SM8750 clock controllers
Message-ID: <tzg2k7fctu3cp6afpdw2zel74rlnwjrbggtu6vdls7ialuzhch@ryreoyyc6lm4>
References: <20260220-sm8750_defconfig_cc-v1-1-666aa922b392@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220-sm8750_defconfig_cc-v1-1-666aa922b392@oss.qualcomm.com>
X-Proofpoint-GUID: 3qDgPNGP8WlMuhEXieIF6hoLXQ8X-FdZ
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699b789d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=yJCgwIvMylydyFC0Ev4A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 3qDgPNGP8WlMuhEXieIF6hoLXQ8X-FdZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDIwOSBTYWx0ZWRfX5lk7p91vA76N
 ti8lDcAN/NIQ9UiAFLRiTLBwoJwAHTNMeCYhb53lnW9REWP41ur1jz2BPaOrQQyNp8dm2gOgEHl
 5QUl8ExGDRMNMwafVJPolVViaU/0SM95ZIZSdTXwNJVDLZ0ZtIH0xXXK553lUYyZs3cNImtiV+r
 ffHRSBv3cuGZDNEU42D/S6y1/RkvrTRoYpvAO4ScSy08ecd58XwXmrVRRyXl8xO56NvK7B/o9Cd
 5KpvfRayto6uuG+FObee/D9YNAfhZ/UOToq0w1xvlXGyambJu20Yr0JNrACE46t9vdAWHGiA/3A
 U2eeEKgsk+R0OMyfbw6cEaZD2lLtaLJu8eo+2Ux0YeYYeXuHqZoPdwyvUs+zC8pRvbzv0XQpINc
 t//flfkUZIGwJc/7vtqqGFbJp7QtOww+Df22q85TFQiEjB9odCU7iCnpMUIFZwjzxyC40ccz21N
 g2bVA0og6ur77OhfsoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_05,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602220209
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93567-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 787ED17081F
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 11:55:08AM +0530, Taniya Das wrote:
> Enable the SM8750 video, camera and gpu clock controller for their
> respective functionalities on the Qualcomm SM8750 MTP boards.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

