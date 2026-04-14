Return-Path: <linux-arm-msm+bounces-103198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA71M+Z/3mm/EwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:56:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CC93FD593
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0A8230394D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20A0318ED2;
	Tue, 14 Apr 2026 17:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GzUm+MIW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZEon/SXH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE932F0680
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189411; cv=none; b=Y2S2/ewDQbN/IwP0ypxlslq9m2NA/RdqWvnaGHk3e53G2X/RAaH+UPFPSo4PbRx5uBeBrDsy2y6m9amkPx5ONjStxDepSXjYfk0mutppy6iobACQlTkOYzzzopN6v0eNtNDOoR57udBRZn3zQHV1rGeNR3hVFmqlxLQU2yKm5wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189411; c=relaxed/simple;
	bh=JmUYA7u8bI0rqP02NiojMw1xs0wci/dwdBfsc+8gJ+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgDtEk1W4+Eme18i0OYKz/7WVS7LV/onIbJjgIBX+Pw36ndjgtPPm7UEuggV3MTvlTVXvj6n+F7TnYi2ZOEFFBSMpvWQGX8fLjU80bP10eEiHYbs/comlLnetDvtpYLYZrB4vaiGL5nq9r3ESdanESTgDFdmjuYJi3f9a1DjiHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GzUm+MIW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZEon/SXH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHbZrH3126672
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AlzvqUTo0KAH/PWsQIWJ5c+0
	+dLQFWbDd3Pk+ohC/e4=; b=GzUm+MIWYgZ6YRdYmsStqnh9YgsukUiCmZOc62iH
	Vx+zFFhkTNddEa6fXOP9zBp4/osK5ey5+j4dUhj6hfG5PVmEV7AqTbbjY5lJ1sZs
	pJPHmcqnuRPFjwsUJtK3e1RzmQe3gCJmWO0FZh29hk1F1jyqp5iNkHDmnzQXAmkI
	A7P6A1vp91GR9c3pl7bPpuTsGVOqzr9FJtq4wNambHry4W+IExetaEpxXaJKjzaz
	RSXaXVynuNGfndwuh7NweXCPpgsbX58HB1EffhPUoDtnbU9QGl9tQ1dMOra9yKVN
	uVjdT7yOX93VHFlGwYyKHWaqQF19IjMFoohgnKrm6xZ18g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56r2c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:56:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d63962d83so138215251cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776189405; x=1776794205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AlzvqUTo0KAH/PWsQIWJ5c+0+dLQFWbDd3Pk+ohC/e4=;
        b=ZEon/SXHdQseNT8LAIh8mMYeyBAvYgs36NtwxW+AgWR4yNUAVZG6T+hn3Pj6fobr/V
         I3p90DEPnZfCQRgqyaP16Xa2yAl25dhQTFJxnZrHohzWNJyl9lgKKK5BcNRjprDMYKqy
         kZKNBp2v8slGUArKXOJagZ7Ss4F963MXNLsbrJzmtIQl4TktBRtbQUzLX9Gg1DjdTpwB
         SotvTqU52Sk7EbWFus1iScRtazHIdZzkXeOUToPxMdqqpdyFLtr/iLZG6zW3ex/bLx48
         pxPeycXJ+dwY1ubjv3kkrBdO78UMz0wIGUuCYwnTEHcEVsKWsaP/odpj77hB+meyWRoI
         oP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776189405; x=1776794205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlzvqUTo0KAH/PWsQIWJ5c+0+dLQFWbDd3Pk+ohC/e4=;
        b=gHV++5cd2/kiYrlxY2wNDFseFdosxCtjMFmtbBUWxVdVDH6l/lYdQo6N9q4LzxqILM
         VOdSH1GA+vWv8DpTe7oMPbF27ab9tdkZYSWh+pFYE8OuEa9YHXCPo+ThVRaZ0obGpzKQ
         0r8RlHXDWe1QMcVgQ9YL7bGwSV0bH+ehhT0l7qTXCXhbSXMNDfCx/g3LOx2ymPMzzVxZ
         iCqX3eqA91zXpbmrYxIXpnXvwXEcOal+iRDioXQj5V+m7fYNiphv/B1NNbIK5eR96W1G
         PlasVfEQ9werd3vABTTmCyd3JTdw3Le8TmcGfN+hknpgVH+o13C5XLrCzFnVJPNSOtnF
         IQkg==
X-Forwarded-Encrypted: i=1; AFNElJ+CBVUFlpHHGcgD7tnyhvogkSYrd8diNQ2OCHL0CtK4i3JLpEhSPgEF+E2qPxI38rHcNsRHHn7vTeYlFzGT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz34qQUP1g4xXDbefGguxqA9LjYFmW1o3S3zDX98Yx/HC7U68KK
	OQPU3bRaS5/oYhbEs2ZifuvuSD7ldZdSP5I/NGhFuarYpOeTd2sOVVXIROqK7NCCqBilTJUAfHX
	10hLGR7pnBotZY+ox4XRZdDD2nPj10G4WA8h0B1/4iHF7jr+DoiNUkReWbz8hD3IK07Ud
X-Gm-Gg: AeBDievAOo6MAI8jOVOyR+E9vyuE7bIQsbrL1mnVsCu4+6BmgRMZ+nV4NDSDjbSeZ86
	CY9aXGwbEGFsBucl0y4ysLRUVonnLYg82BgqAGY06pUe6ZRoaH3LIw2vZoQqxMl8OMzoT4jdDGp
	IfCHLJt7ry1Jbj+8TaiNtQucDeqNWyia6zMk+4UEfm+EwQPZKExLt7Nb7Oof45+F6fm26mCuQSR
	CmUdPmHSDriaR5srTNZJTcubPk6cNEkrwaRj19AVMb25914FwCZKOQTVa9NqIajrZL16L998nGO
	6v9LgHnL6WzBenynei4MJB1z1x0WA0ibYHD40yL27rlsleUbRp2iGruHUKd5opW0+omO8q4B68a
	XtCmMrsEiPwSJYATWtx5Ky1njRaHuJWq9DLJxCmB6y3NdC/+NBN6loXmACJqy41oUQMc5kiBmeU
	3FCAEfuAJOA8fMwmV8E6xtjDoporilTQtLz0HmFYMZsqycMA==
X-Received: by 2002:a05:622a:40cd:b0:50b:509e:790e with SMTP id d75a77b69052e-50dd5b3466amr274414821cf.10.1776189405204;
        Tue, 14 Apr 2026 10:56:45 -0700 (PDT)
X-Received: by 2002:a05:622a:40cd:b0:50b:509e:790e with SMTP id d75a77b69052e-50dd5b3466amr274414431cf.10.1776189404687;
        Tue, 14 Apr 2026 10:56:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e4926fc89sm32608971fa.4.2026.04.14.10.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:56:43 -0700 (PDT)
Date: Tue, 14 Apr 2026 20:56:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: qcom: clk-rpmh: Make all VRMs optional
Message-ID: <ui474rbttwjwvbbs2mcn6b5fh5h5ah2mj3xi64chtzp7y2m4fx@74w3au7l4oxv>
References: <20260414-clk-rpmh-vrm-opt-v3-1-8ca21469ffbc@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-clk-rpmh-vrm-opt-v3-1-8ca21469ffbc@pm.me>
X-Authority-Analysis: v=2.4 cv=LuiiDHdc c=1 sm=1 tr=0 ts=69de7fdd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=hEP6UMytxTtgw7GBnusA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2NyBTYWx0ZWRfX+X8ZUBigsmyh
 pXGCDRbJrOuFD2rkz30Kq8piu8HTGuuy50CcolebGWdtOw6wbUIirDjTGj6fN1p2fUrm069rHHt
 JEt5EefyBdDyc+6YK5lO9kErr5opxu1TZAYM4COjoCZo68qQeF7K4RV8qTwKFLJ0jCFW/IPOSxD
 WBdRxm/ShPUhtWMmqp7dUrrBoJ4EWCMB00bG4e0uuWNJY0ZeDOp0CRggTI1/giq7F4P+kgUON7U
 9Uwfaz8F6GWdfAy90Jg1m0REgSYXFRYubcJLDvieuYtPmpjnBvfr1QZWpyxyKQltPqs6XZeWG3r
 YoqmayU/YzSgO+zcP3V+UJ06MZF6u3qpLigyJTgej+M83F+24L7KLsPYBdwg4jCUGnXN+EbRDE8
 Op6ya7/8c647klko1+mNpxlasOEaRlUTX+HF/oEvjPG3pgLvAPaXSivXDmHNOQetf47FsFqiXgO
 X2YlCQVGRFK3H2Uc/GQ==
X-Proofpoint-ORIG-GUID: riV09QCMnzIL2V1WggmssgtRSEWkxnjW
X-Proofpoint-GUID: riV09QCMnzIL2V1WggmssgtRSEWkxnjW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140167
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103198-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pm.me:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41CC93FD593
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 05:34:28PM +0000, Alexander Koskovich wrote:
> Some VRMs aren't present on all boards, so mark them as optional. This
> prevents probe failures on boards where not all VRMs are present.
> 
> This resolves an issue seen on the Nothing Phone (4a) Pro (Eliza) where
> probe fails due to RPMH_RF_CLK5 not being present on the board, this is
> due to this device having a slightly different PMIC configuration from
> the Eliza MTP.
> 
> This matches the downstream approach of marking all VRMs as optional
> and makes the previous clka_optional handling redundant.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
> Changes in v3:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

