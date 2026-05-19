Return-Path: <linux-arm-msm+bounces-108417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMz6JLAkDGoIXQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:52:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3FE57A882
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DF693012C6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FAF3EE1E5;
	Tue, 19 May 2026 08:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MoJ7bkg1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LlIo1kmV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1170F3E63BA
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180706; cv=none; b=tuzoJFvo7tnElNMuWOmQLVIjJEJqkwTHweDLk5BbtMIowE25RFAWuMQJBYM0nW+1do7kAhi8cqswtcmY6UXJaeSe/8ecGwiP4z35V4SHef7QinhIa131Km/b4RYGYxRGYPWemTEdIPx7BXxLHFkeuV80yuFJj3EwEfYsFQ/HW2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180706; c=relaxed/simple;
	bh=GA49J4exmrjJ5Cw8xW0ziAcuryiSXaGjbrMDvlc/OY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFn0Y199mrDgzUloPSKwirFImkjKzEV2vxZ+xN/dSLG8ZjOniOL2KbvePxlPjMBPjdCZ9q3WKxGwiFT9PZYTnI+nUc+aebpHbIRNt0JiVC/lmfg93s9spJDHbOiHtkrhfKuPToE3JqciRYXIdzBof7Wykk2QgBCjhNObWZKSvT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MoJ7bkg1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LlIo1kmV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J7qbBn2975394
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ezYP126K612czxcRfGpCOxRI
	cGp9OLiayoTZvHdNYZk=; b=MoJ7bkg1kn7E1kmsA5AEINaYh1G4LZuFE09oLhOe
	jMNuvBzkxPvOe3skDA5/25OV+vAruPkynyaBaKWglIkwoz/pyPUzZI9XF9Lnmpah
	4xGngbd2xF/zHNO+Cdn5A7nSGR/TSjROT0txtfbUM1Hdd2i/LRvHPXKltcZdr0/Z
	Q7Dr7FsSsLLDYFgudwtxDzkUc29FX4BfbePO0eD0QdxOfcVZsXQFp4YownLhWvYA
	RvyXfVzrAsZZj0dcTmFecjPxlhy42lo7nhW6oLAO55//+klIvLBoYm7z1YraOYp5
	7WP2XJ5WnFzy6W+K9nDpiADlZ/Qp5EQ+/Xx7xhXmPkNnsw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4bjrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:51:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-835423c69ffso1717694b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 01:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779180703; x=1779785503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ezYP126K612czxcRfGpCOxRIcGp9OLiayoTZvHdNYZk=;
        b=LlIo1kmVU+Q9/pTY5+KUZL14PHPEF4MkU0wUft7/3LN4E/Z5QraTg3luQZ2ipfNPdp
         jf4AWYoUYivL4tl5c2YCbxYlbBfGi4dahm5GgNa82s19pinvZXmoIb+mpbmoh8GF0Wd4
         HuBB+9NL3fpKQsDg33Zvwzdm0tAa8U97wFzgui1hwDcLoZzuX/PwzRkihCRsjaRsr85B
         gKjuioQ5uYI4110ijRfdrWyFiRhASKM0N8XmV358vjf6/25CBhAuTSE+7WUKAEfdDqWh
         P8pVYeiTxQuh3VGkquqoOKL+uYBRXxR6IkxJwO/WVUe7VDMn9EDOxRC1W/1BxSEhvZv5
         BKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180703; x=1779785503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezYP126K612czxcRfGpCOxRIcGp9OLiayoTZvHdNYZk=;
        b=jOSzGqjv1UxvHarQG17rKHo/yjrMgZiaAogvp/aHJ1Eq4PoItcLhngqdzMiv9VaGt0
         ZNIMfcmbZj+wpgEwi5MMoQO0I4o0wFBpZDe3R2oM4huYmH69ptqhPeZW3fQERnIIZByB
         67nMrMJLH3FBit2CoAfVb2p5s5vpEla1M5jhFL87VckqyXxCdwEwmXnTofnqFtEhhcxV
         EaP9L/RtRdYFcDSceYjH4y5sNI8J3b271Nb0Hgdaul+gLrkwCQjkl/22z8x+/MP1L9Hn
         8UCVIbeA704QyOURzzz7vCSP2ynP72AvwNAUmlP2zami0D3cSyqmsfNBdlEcHd6duuNZ
         2n3w==
X-Gm-Message-State: AOJu0YyGM6T4JsHAAey3YXkDyYEfTGMtcgJ3eexavjRLOV0Ydn0tWu+n
	KUQDtYX5sk8NhDsy++BGVSKLjIp8dq3RqMyaQuiuSnz5Wi3fiVyFyKjPTLfnK1Zv0x0rbDvKyOb
	NIMK6bHV47VDR/wc4LCx+M35M4oS/Onjvbr3uVLwrHmHYdrJ+GBxuSpjQYzXjBW1TBxKC
X-Gm-Gg: Acq92OERhfB3yhQBIai3o5nYGlNuKZm8J7PLvbA3EIAs0W4azRMWo5UqOvS+DkEB7Zv
	pWAEJxnHm98FwhBBUciaLpwpVsSqYeSup7VLrMEe44FG29tIDGYN0oZAnpKUWvOt+i/G71zDs+S
	UU/gzi9k+Hde7vK4mpkObDwyzd2hGDx4R/Pf16Ryzed/r2X5XOqAOmXK34uR2Zt/hgLhamTZ3lm
	pLJ83TSUj3wtZSCFMWq0ohXr3Lgtc/A0HN0+7yQHbzUpfA03vFiH6i5jAAMobRwfv7Vj/ZX35oq
	iPKLrbBpXBetsDo/wZ0/OTRgcO2hVpjRWDf9nOIQ8rUOawE6hzbh595IoR1FE162j0/Ym+GFyIz
	JD0PzAO1rBKeGiZ+jf3T89ctaPmHPIg7FgI8116K2kAfrWDBBRpvJgLCxoxM=
X-Received: by 2002:a05:6a00:3992:b0:82f:de7:d29 with SMTP id d2e1a72fcca58-83f33c60b33mr19177139b3a.31.1779180703268;
        Tue, 19 May 2026 01:51:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:3992:b0:82f:de7:d29 with SMTP id d2e1a72fcca58-83f33c60b33mr19177119b3a.31.1779180702650;
        Tue, 19 May 2026 01:51:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5b71fsm16021123b3a.29.2026.05.19.01.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:51:42 -0700 (PDT)
Date: Tue, 19 May 2026 14:21:36 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop unused remoteproc_adsp_glink label
Message-ID: <20260519085136.saub3m6tnnnvhxcr@hu-mojha-hyd.qualcomm.com>
References: <20260409181329.556899-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409181329.556899-1-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0c24a0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dLF_TAHiO-yvSCDL95MA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: NjOOT8vkG9Yf_aqBpZbTLA9Lh6T0eNGb
X-Proofpoint-GUID: NjOOT8vkG9Yf_aqBpZbTLA9Lh6T0eNGb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4NyBTYWx0ZWRfX3d778a8Ttzi0
 JdF0zO1DAD+g8KpHedW+3sviHUGWhpt1k/fsziFod/X/aRgaFUlosF3/0O5Ahvv4KklV/9NcyxT
 Yq2jR5htO7P/BXNoSRYR4uXQRB2TM66MUgCCK9BYoW8hU8VfdNy1z66klul3n26vKia7ohGfDL8
 Joc8e1QV1FjqsnV2hJI1VSu49reCp75+Ny+R7FtN9PSI8rUVKNHS/nbiUysSGUrp4eVCZVNUbR7
 +qMz+i5pYCZQaRn08Q7oFYfo/ZRK3zXm2JScdXYh4wJWCc7x6f6bD0xj/tYdsRvKuJ6Rw8vMquo
 CHRJhPJ6V0VG0ktSGBXLobDjwouT95Pc1S+FeH/+2K4QlgE8qc839crpbXlFBsYyWwggpvnGV4g
 GOU6KtkrfasGJVYThmFUKmemXxe/rbk/c/cWiiCo/hdBWHtCw5ps0o467sKorevRDGCiCa7M2T5
 7ZvaArBvOi4+drDimmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108417-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mojha-hyd.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC3FE57A882
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 11:43:29PM +0530, Mukesh Ojha wrote:
> The remoteproc_adsp_glink label on the ADSP glink-edge node has no
> users in the upstream tree across all affected SoCs. The only user
> of this label is qcs6490-audioreach.dtsi which references the label
> defined in its own SoC dtsi and is left untouched.
> 
> Remove the label from kaanapali, kodiak, lemans, monaco,
> sar2130p, sc8180x, sc8280xp, sm8450, sm8550, sm8650 and sm8750.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Floating this up for pick up..

-- 
-Mukesh Ojha

