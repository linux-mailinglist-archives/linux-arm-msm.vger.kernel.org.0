Return-Path: <linux-arm-msm+bounces-101819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMr2DxKJ0WmlKwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:56:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C4B39CAE1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 150B3300492A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 21:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0D035CB6F;
	Sat,  4 Apr 2026 21:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NpATHynp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/RPlTi0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBADB34AB1D
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 21:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775339791; cv=none; b=KOEcpm93QEkO34i3V+CxY0ODgtvbi1LwRFPvq9YzDKqit20PMFRVdzEsZZ8MkgpJcxNhbHqJrxAUtBuzP4KuFHOdJj5Gt1d/PWBSPXid8eO5LgMKQqoD3usIfdTCbiGl520TS1lCyX7etXKrKxHlf+xnsHNzXrf/038AupoQ2ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775339791; c=relaxed/simple;
	bh=b62OSHFpcjz1Ei4ofjanumrwYKdi5hKJWzoi2cvsCiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3GhDWI09pryJzLuSOCLmgkF/s6ihne+gWOpv6PicUeOk4V/AOUZXewhfZnz8WkoH0Ir2SnkHtGO0bwe/K0KwrxYf3Qc8MtXKOxaED+HonVQoLhezsF6wCycusAPaEwYxOp6xrF1W2agqHlB9i6GBK0Ir+20DUTrMUpKDCZXQ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NpATHynp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/RPlTi0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6343jWLD2867035
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 21:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NGMSDQdJuMlNNZWr6M+r+H+I
	QU1KOmisbC6o/fLIsiM=; b=NpATHynpDB8BqgBQvHtRn32wp6Nx8vR/xPFp9H4c
	4kj0W6hHBoEYKhYaFSem++lcw9s+KvX6CQP0zBdylCj5bgU9Sl+xRFwoe7uGPhRP
	PsbUisDDZF2QmH3ymBsJq2w9mnIE/1Y9I/0cdfkWKm7Rfp5KpgIl0TFTHzCabAqv
	8JEsufdbBENQ2AQatIpsn5ljF8lxmG3C3r1Kvghy9XmqDm/uc1thkw24WjPS5yof
	wRKXk2BFUA9q7M88wWLeWPj2VjOYVdOshTIkTkZ6D+3BQfxJvqAiXc2YZUNeMmNg
	V1f5Yp0uxuzJZJ43E5WuRF4KFLi+kTLYXE2ZDmIi3svHoQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dau14sh95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 21:56:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso74418001cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 14:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775339789; x=1775944589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NGMSDQdJuMlNNZWr6M+r+H+IQU1KOmisbC6o/fLIsiM=;
        b=W/RPlTi0xUxdJpEDHIsA9fegdE+MOlnslaOSSes0wajKchHU6zyynlhceVdHzq62De
         VWLQldSWoAbNvnO/a5w9v2/vt63aQlirUxihDtiPlYtusGQEdr9SBUVZLDErANd9HFR/
         gqzzfDrPKtcL5nS1IeD9MdwCy9ugdcmNl8p867Z/PwgOz7Xz3VQLiiNhbioH4ipFTuKf
         IKmR2QZILbDoyq8k89o67rJF50ag2jYSCq1Ow9bQVjxf1vWpLmxBwd8z8+FeJrDrrTW9
         R/2oI8djwvXNuh1mzhkULKE7nkKd4yleb8UcabGRMPLbPtjpGvfS/j8tUkT3kx8XyTJV
         9yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775339789; x=1775944589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGMSDQdJuMlNNZWr6M+r+H+IQU1KOmisbC6o/fLIsiM=;
        b=Cj9uFzymCgbdlCJvz9wKEoVrLTVIwdKDFOpPrDXNNqWDvU3v5ATbx1Vc6Kzd4YEHoW
         jlbvGocDj3dn8x8VkkhntikQXn/tWxKWiiYx5Tq0eyrZpQwxfrueP9ukSFnU7zBIY2ZL
         A4D2XzzNuGFN/2TklHRbMeRBRkwL3CIkvR7TbWAjo+0XazCRLBkdQzBxvoUIUPqho6u2
         /pxI+jNZQxV1LG4X+5cxbLbYlTwG0pc4cl4ciimBThNgSt27h0hRwxJhv7Zoi4raD94Z
         M7WI0/OKukrLHfuslIaQN+8+BmqStwjG6Mc0CbEsuuqKd+eiYczyd4De9P/Nq2isSTCB
         hk+g==
X-Forwarded-Encrypted: i=1; AJvYcCXruYCJ6odHYH4WoVLZhwPpOZCMR8cdYNxnyiSYzuYI2GanaaDwF6iu0ja1cv9kizTwrvP+U8GoKBRpXYg+@vger.kernel.org
X-Gm-Message-State: AOJu0YyZJW1y7g0HwyOkPeR0H4BofYWuSKmQ2aYdWXte4APoPa0ZUIus
	O8nN7F+7x5+ewtttFpKZbWyoBUTavpmeV2YXbWw1mQapXR5AwHcV0KtjOuA7byrKbdw5Rrb7Nuu
	QgvJZ+zJXqv7QrBBhapS4U/0akPspCNsQ4o/eaSU7mhr03yGLttAeozTWqOSrLmcwhFlY
X-Gm-Gg: AeBDiesbovl9T7if5+fwVzIBDYKHcTF8+mSC/Ncxp9Al5BSnwqv16rs6aPvuCUDzP9d
	93bzssDcImddg8EyLQMTD4l6f5cq4Jih16bWnhvVeTitk8jDYqMADVK05DW5muhvycBk/wFiy+U
	NeE5Bzj/MbQLLsaZ5XyKWXmp0g92UIiZEupCKUDRBSj72mTO22wbABUfAkziNAdxkdrIf8qSuO3
	h4GX8QnLbEVA4AXoTiwqriH8QF8FVYCzGOKswkhd+mLPFTfeexzLKb34hqD8hMEsDPqAvxHXlUd
	SgQgHp8H9xsK99rsw6ZMKH8CqN3vTFSHmiP8AsdjGrbJt286/vHERZbEe92Jipzihk+jh6tYNif
	1PcB39y8BJW9tggnCbkpSiQxhmrDfdfK9j28WHTkmVqYxRaPh8kHLb5qMPfYc+jky325xOqThwM
	OIhmgNu6NcEIMTlSFCWQqyTMLhRdD6giV2OLs=
X-Received: by 2002:a05:622a:1a85:b0:509:144a:43bd with SMTP id d75a77b69052e-50d4fa36996mr128377441cf.3.1775339789217;
        Sat, 04 Apr 2026 14:56:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1a85:b0:509:144a:43bd with SMTP id d75a77b69052e-50d4fa36996mr128377191cf.3.1775339788772;
        Sat, 04 Apr 2026 14:56:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd6bfasm2297420e87.82.2026.04.04.14.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:56:27 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:56:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH v2 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8.5
Message-ID: <kxqy224zsvmwzbuw7gxaeni6hxa4gyjej254xi44mtienew77a@5glf7k3xawtq>
References: <20260402-hawi-spmi-v2-0-0bbe811fe3f4@oss.qualcomm.com>
 <20260402-hawi-spmi-v2-2-0bbe811fe3f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-hawi-spmi-v2-2-0bbe811fe3f4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIxMCBTYWx0ZWRfX9nAdhj2WL+fl
 NKE7KQik7ENSC8EtnXAf/uMW2Ojt471B06mMUZINqisw7jdfWnGG5V7j3oCuB/CeGRosL6Z71Ce
 WlaU963+n+ZnjyUuEdF13BntLZWSc4/jns6OHY1MFL0MM12mngXs4+k8w7HYq7fCmpeL9H5gy+T
 H8a9xYREROFyis/iNNlhKlNbzUh+EQ+LTiERaCExiCOwsSCjwgpB6umCzD6dhxCpOemA+wLJdQL
 a7LgCkfhfKNmo77t+2ungMPJIzeUWHHurm8Mw1YfwF3Njl/KZa9g/jOPnXi/+X4X/S2bjUY3A+s
 V7fM+anoo1em7/VsKLDclKMASVbwYiVOHOGGaubxlZoBnMkEc+5aLiPxLRwbq5y5shLAbx5Dl9r
 zyKA9mf9rsdT5F71RmvrfgPsRAfJliNefqRnVAVYEXyQgpnlpp35LZ7pRhMxaJo5s1VipNQOi+x
 OOM6ypSbnQuHyD+myKQ==
X-Proofpoint-ORIG-GUID: 7sTYb5Buw5a8aztRu8RGhLpXiRcGTtpX
X-Proofpoint-GUID: 7sTYb5Buw5a8aztRu8RGhLpXiRcGTtpX
X-Authority-Analysis: v=2.4 cv=Q9HfIo2a c=1 sm=1 tr=0 ts=69d1890d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=4h3_F-PqDEY_y8xvUNAA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040210
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101819-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5C4B39CAE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 05:55:12PM -0700, Fenglin Wu wrote:
> PMIC arbiter v8.5 is an extension of PMIC arbiter v8 that updated
> the definition of the channel status register bit fields. Add support
> to handle this difference.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/spmi/spmi-pmic-arb.c | 69 ++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 60 insertions(+), 9 deletions(-)
> 

Please leave at least some time between replying to previous comments
and posting new series. Let's continue discussion in v1 first.

-- 
With best wishes
Dmitry

