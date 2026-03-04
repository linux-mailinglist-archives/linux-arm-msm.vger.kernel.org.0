Return-Path: <linux-arm-msm+bounces-95345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EpqAFNGqGlOrwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:48:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FDE201E6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA04830BE541
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 14:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75638390C96;
	Wed,  4 Mar 2026 14:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="guvYIiBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/Zt4bpd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A07E2F6560
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 14:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634436; cv=none; b=d+XNFxegs1EkSvxp587CqW4bbUbLhUVWO1S9x+7+cFx3Im6v0fGtHTizvKKfXNrUHR55leTeYLVis4JP1xOqolnvyZoKSzZ8e8zprFq+8hrAUst52crL35RyRVHx6BbSa8HPo65Ks4YBMDCmsi/S6r+2Gw/mherpdIa+lD7+kRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634436; c=relaxed/simple;
	bh=AYtzeDqeV0zgh+xREkN56wB5I06MNwE75vd0KP/Vscg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+obms34b+HyxY0e8s7wtbGzMZTC3X9+ixlNLGscENoErzyCgMd9MwxXMIOPN0VxG+6HJk7NoQTiICzX+ZovCxyU26HXrmFaHtJIER4SSdvG6pu71D3oMhfeW7j/kLDnWMniU6PMbUV6kMnWioiTnmJqD1kjZlOsvh0L5FZ2XzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=guvYIiBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/Zt4bpd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CcrXA2275097
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 14:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OsXv7ufwdMilFRb6MU6fz/d4IdGrO64/6HMvep69cvk=; b=guvYIiBfmhrKPLdr
	YjTHWDM+zkQ+8/uo21bwiA1PF9ElHw2M+kqXeg7glmQVWEzN1bq3xgEe4Hk5QF75
	gX6sM2osGBVAo4rA4Y2NyR2D1hKb3w5KCSuSOUwI64gsXlE/A8wBqgEh9VXh6ROi
	wLqCVqznsJdjXEu84roq6l5VtbdUZvwq/KNr8xm29U7buxLGqCW/z3uAUMbGZthF
	Ubd79tAbf61JXH8MfanWNhbytw63Xbqh8kYXLpSp0wOK48L5whq2RJR+ZiPFakQ/
	LeGdo2TlImzkspWWWj9EB8U5/3pm//HCEkNvV87UVXhm83MPw8lPo318q0W3HxXO
	GNA+yg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4mt4c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 14:27:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb5359e9d3so4616296185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 06:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772634433; x=1773239233; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OsXv7ufwdMilFRb6MU6fz/d4IdGrO64/6HMvep69cvk=;
        b=g/Zt4bpdfWAbrs00gzSlUORFr1gPKLZSR/wmTRBD0UAwOkygfdSLIG71FKJfx10elN
         1iElU7rvAkSELSKcvbfevI2KGyx7sWKImshx8SkWJud1v1fzJHMzEkbUtsEeshHlxD0a
         MSkV3N4I7bBO9rfx2yPk7g+LDCeTR5zKsOkQHEm4Z7aR9KkT3S+0/ZX2c/QWfJzMJzkx
         viGH2135FhncOysqk0Jlbr7k4F6G9EytMA2y9tlitOyQLBjj9ZScazJ0kw1DZzm558TC
         7SQy6H1eYmh6cSNtDScj2P4RL+xGlmzFkUqyMSwcl+/OtEerlCN0vL1bfTbDR1QlFokp
         N/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772634433; x=1773239233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OsXv7ufwdMilFRb6MU6fz/d4IdGrO64/6HMvep69cvk=;
        b=bd8mH89s/s/XnmnJA7ta3OloN2p0AOzwcP3RMvpxxlnhLlVMSMV16+jJt2L5c2GUZO
         GDOpVaLKomxJDcmNoA5LFiBr/NH8RVUhziwvFNeNUoVcvMhxPGwAaQDGkYfbWAVn1wJ4
         IiZyohuaDMeqetva9skgtUNp4jxic77tKuyPPdFV+iGA5N6QzfMh35O83z7G1DsvOMMn
         gHq57tEPwk2P1oWK0xm6a+GxqNx8hCgJit8vwQ3aRueYVrtgtGiTB3bbvHu6POxhitEG
         wX3iblZ3TK7YdQfiPFmW5Y9cNwHsquVUIG3fjqxLnYc7xN18qku6L2ug3MFcifUlvXoX
         PUsg==
X-Forwarded-Encrypted: i=1; AJvYcCUnIwt5a16o2TlUn/dg9xztI8MRdUWFq7n6/9TZafVtaxNyAoBc0ZGgpIpjrhF1Kdfakc14/V66Ext8zlhO@vger.kernel.org
X-Gm-Message-State: AOJu0YxLNnbLANW1Q14EkitGpsqhMyVh6oYT//Np2Wh2R53CRddHlNnQ
	Da8QLwwvLKxY6tL5QHeF5xhCOahBivui7lxyufcD3ifXB3nGXBxBDGah2cRJyOhljq9dkW3PKR1
	hfhcphsexlq/ZdftzvDRt/I9i75TCwIDvng5zenI/XtSMcrHroooHP1uQ0pvPbmkScDK3
X-Gm-Gg: ATEYQzzSG2UnOkho4khva+F6HJZOMLms8UlqktASUwWvqVtDtfVQmtUexeJ1RBekDcR
	r8RREjy1di0SHIWDLoNJe4PQJDyelyPQgecsommTvODQDpuCRhsJkRYTm2nzwlRkS854dQKSuwd
	f1tP9y+KBXBpIpc/lKPx2qXflfh/urg+TEgEFf4oFHKgOivku/amWFaxckCYA29OQkCnym6sVJY
	flbfiyTYslXDF27OAdJVv2ez7smhGQhGfv47errJ99ndDiib21qLsm63m9Og9KDumLa07cSapw2
	C1dHODSWvSFuSeu7k/34z9pseJHHxv39LCOBXtclnuxwGX29V0jfCrgOpM7Ujov5uiXxFKd1k8Y
	Kc6hfg9MK+ljc2Uy890e64BjPcouEMWYoAkPEQ8mKjNRdsC88RBVkroDc0e5AIhNXrEwkJIKQka
	DEd6Rhp024sCMqvpB6Gmid889qAHIhBBOMCf4=
X-Received: by 2002:a05:620a:3949:b0:8cb:fa4:7b45 with SMTP id af79cd13be357-8cd5afb7867mr240911185a.60.1772634433340;
        Wed, 04 Mar 2026 06:27:13 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8cb:fa4:7b45 with SMTP id af79cd13be357-8cd5afb7867mr240906285a.60.1772634432831;
        Wed, 04 Mar 2026 06:27:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12ebffe52sm148372e87.49.2026.03.04.06.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:27:11 -0800 (PST)
Date: Wed, 4 Mar 2026 16:27:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 5/5] clk: qcom: dispcc[01]-sa8775p: Fix DSI byte clock
 rate setting
Message-ID: <t7udcsoimdm4lfbeh42mgvfe7raxlk7nwgoimxddwgpctwukpp@abueuftzmz4y>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
 <20260304-topic-dsi_byte_fixup-v1-5-b79b29f83176@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-5-b79b29f83176@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 67j2JDmussdUCQ1uqeiFrc6ZlO5kgX6Q
X-Proofpoint-GUID: 67j2JDmussdUCQ1uqeiFrc6ZlO5kgX6Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExNiBTYWx0ZWRfX3SgsmWhD6tzJ
 uXcsXeoaJUS1WvDsdCRz5PRrrArv7/VEuK4vBKfGepj+PcNACGAxIQDaKFry3cYfqYy1SeYEBEQ
 dvP5lYL7oNm0ci+mO1jvZY53wj3uH0MZgwsI4vtlgA/LApcaxfdrMDDO8lvqmo8GdcDhCgDZ5Yb
 UnJq+Nco3DQ6HV7qoF2lga8790BGi6RwrNMmn9gBLvxaOZyYwUBiwMGn09bfWIBvdQdj3cYz9yl
 i9rF0vIxO8g67cvQOoa2KEnILw3R1UVSJ1wC9f0QSyjYSpyUt42VMX/wF0oOUtif6V9Zdlqbd9w
 8B0Km96aoLeHpArr9W+Z9ru951AapDYbV0qNSfZKGJ6qMWkIuwJMJAfMVU/zfE8pTrPQY6IZbNB
 zcBdD3vEQzjfkfWz7SFyMPktQTZRX7vazUiLdDzp8RrNoAoCyQqF8omeK1cNNh+z0ajlaQPfWR/
 /ldHuMSm3NMi2Uts/iA==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a84142 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=P6JgDz5pW-ke-mV79CEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040116
X-Rspamd-Queue-Id: 55FDE201E6E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95345-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 02:48:31PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The clock tree for byte_clk_src is as follows:
> 
>    ┌──────byte0_clk_src─────┐
>    │                        │
> byte0_clk            byte0_div_clk_src
>                             │
>                      byte0_intf_clk
> 
> If both of its direct children have CLK_SET_RATE_PARENT with different
> requests, byte0_clk_src (and its parent) will be reconfigured. In this
> case, byte0_intf should strictly follow the rate of byte0_clk (with
> some adjustments based on PHY mode).
> 
> Remove CLK_SET_RATE_PARENT from byte0_div_clk_src to avoid this issue.
> 
> Fixes: e700bfd2f976 ("clk: qcom: Add support for Display clock Controllers on SA8775P")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc0-sa8775p.c | 2 --
>  drivers/clk/qcom/dispcc1-sa8775p.c | 2 --
>  2 files changed, 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

