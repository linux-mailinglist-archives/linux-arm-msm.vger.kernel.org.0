Return-Path: <linux-arm-msm+bounces-103294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGafOguO32l5VAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 15:09:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E618404AF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 15:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E3CF53001FB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFE738C2A3;
	Wed, 15 Apr 2026 13:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFJI0OG3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VhRoc0TV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA74321457
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776258313; cv=none; b=t5b4e+fCLI6aHjf9KdJeVqjeDY5EW1Li7p/6k1b3yj6Nj5LMLUbVKlUE/iAWHWJSep72dTCKbW9bbdInaq0wNxmruPzGqnzP3YNiDZ8lFSisY5bnOqNO5KUmM4msi+Knn9a/uoZvJFubvnbBSDujdln3ukYdIE5KMLWmATlq7dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776258313; c=relaxed/simple;
	bh=Mtcv4O+SsioZzYTwCA8bJTfBJVkqokYIJCvhBtq48UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUd9eh+oZ0RrhfrIQx+yBT6eVpFNOyo9NN8jhzQEs4Zs1ieb4fhwgjVzKAeBopzT878XMcWfhIenL4EM4ktvRb+J8/bUeUhgLTsu33Ipm3BoVlOYLFMIoKr50x9x9+PgQOqLScqVF0uz5eqbYihz59mwB/qib5C1nxkxmUrff9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFJI0OG3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VhRoc0TV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F7tSlY764264
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 13:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rJK3tyKKPOULevLlFyeKOFJs
	OKc285YnQNkfp8+aIFA=; b=FFJI0OG38YpgrJUdDdk1yuBxodWj08weax6fL3Wj
	f1vn7gUC3O9ItNaTMp0gtqQ7ZSwCS9201JNGYRGv9c/ZYcWrmVwSyMGykl1KQ02e
	nDtUOU0BwW9pHeXiLFvy9X4QI3rGii410vapi7WyetCOQO3Zu2mNgy2OQxS9dHdp
	BW/L2ThIubeaxSSxia1IOnAiLC8PE29fh43Mn2ePKGrzCTYMj6bFECx/TvNQz1MY
	CnSRlIngzreW6id4yZQQskC6Em3ns7mCEjH/pumw4SdRE9kRQ3DThunVyUIUVaeE
	c+dGaWXAEZYpNi0lVR48LrijfArsH3Ys7VvyLmJVUEws4A==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj6q7s3np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 13:05:11 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-475f6d0de69so10587023b6e.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 06:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776258311; x=1776863111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rJK3tyKKPOULevLlFyeKOFJsOKc285YnQNkfp8+aIFA=;
        b=VhRoc0TV+vO2VcrKPiaOFuWOGncE/QBeT172X81HJChw1MHQ4J8SafZz2VvqRlugj/
         2jmVt3o2a0g7JUfUvpZxqAX64jV1Nbz2Y4hlej7KQefls4Quys1ZChKzhfTJ1I5wRDdD
         U7y8qNnA6Pc0YwegNKPoCcEzvavh3uXsjE67eBeghLtaZkEHODa9wnbnjyNN5+guTSFx
         xsjvQidvGZcKRZlCtZfWWXcDu2zMPQbGViaJr4K70S2BvYk4PUuyhtqOP2EBonn2UBeK
         Et3jsRwSdeosSCVA+1X8M/0UJ0dQ9dvWkJSU8C1SKJbivy7YvK28BpJuHtKL3/jGTOva
         YkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776258311; x=1776863111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJK3tyKKPOULevLlFyeKOFJsOKc285YnQNkfp8+aIFA=;
        b=Svzdio0wg8EP1CadcC9g8MJemVFzSRPfL0tO5nazMsNMCqxw3h5oPv+R0f1xQ8E3TP
         38730atQZkMD3p+OgsQ+t5grxs5Rqnfswyprsft/uaNGhezB/MKzJ+psijkarrHcvSi5
         ZClUwDq8Y8jOyQ8ocrEWjpLhYrUnl43jZWCPlUNcGaRp9+5tugaJMrb5x/TBk4jfCSmr
         6I1KsrsOO6d+XEAJZPGaQtjy5PAZqVvO8uNu1DcdWPmgiPztcHy3+q3jSFr70XyC5Rhl
         8YYZKwI9ga7rogyOaExBfyaY7FdkZGrhYydLdGyU7L4nN1aK9cPwXr8Ntx9wU0vJn2tH
         w/yg==
X-Forwarded-Encrypted: i=1; AFNElJ/I+tPi1zGeXHr2Dql40AGgE+swIxbZvS7oh9wgpBRb/3TcvTGwO8ldxin3clPR4SXj/gxcWAfW8Bh2uLoU@vger.kernel.org
X-Gm-Message-State: AOJu0YzoveKZgVN6eAqewfly+fclUsxjDAGu2gsJy950EMtw7grvpMxi
	LIGHTV5Npr8ZaxZMl+VUpW+rkvaFg2h3lGxVOwlXgR+xQHz+rHIpvZZELcNHAj5MyHUGJbM4f3e
	cl1ESlufnAeGNMLHR/eJhkx2bgSPdInLW0v8QPuXQK2en6N508HNErdMHnDl2n47Fjqi7
X-Gm-Gg: AeBDiesi/mF0KECjiur9Mv1YN0HY1t64fSkfb8N/HgthxBAcfm0e7kPaBtgiUEeq+mu
	rziNbo+TrEUhnEUnWMUEmLCUIAUaMwBzcRVZ6dWP2s4qXZBkWZPzbmpATtHagE4zYN/vMQm1CU3
	ufNkKBQ0H9HKpZ61n22PlJG+xFZUqyJW1iA9F2HzQzIC6PJQj31I/TwcefzyOZoiX532yNGb6a6
	zNKqQmK34nzoyynpMv9Is7sta6WI8FLSyGzvb1FXVlU5tAAsOB24vpsCCLJ4ORfdUaC6A+UYYd1
	iVtCp00y/i3fcY2Ly5VsKuaIYVcw0zH+8RcM4O4QnEFqqGz8C0+vfatHyEDyGj/dj/Jc5m6s2Eb
	yqrli6ELlK0MHXunBfLu0WQwez9jLMIUh35fsgrss9A==
X-Received: by 2002:a05:6808:3084:b0:45e:a52c:e4cd with SMTP id 5614622812f47-4789e91f174mr13198767b6e.27.1776258310659;
        Wed, 15 Apr 2026 06:05:10 -0700 (PDT)
X-Received: by 2002:a05:6808:3084:b0:45e:a52c:e4cd with SMTP id 5614622812f47-4789e91f174mr13198735b6e.27.1776258310101;
        Wed, 15 Apr 2026 06:05:10 -0700 (PDT)
Received: from oss.qualcomm.com ([5.12.73.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede1e05bsm217099215e9.6.2026.04.15.06.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:05:09 -0700 (PDT)
Date: Wed, 15 Apr 2026 16:05:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        mani@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qmp-ufs: Fix kaanapali PHY PLL lock failure
 after SM8650 G4 fix
Message-ID: <mzqcgnu3cvqvhnuhmy4fdx6rj5tjzm6dzndpg64g64ykcuug5r@scx56dj3pqju>
References: <20260415104851.2763238-1-nitin.rawat@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415104851.2763238-1-nitin.rawat@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AvHeGu9P c=1 sm=1 tr=0 ts=69df8d07 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ub0iOiB/G/eXZwGovfl9ow==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IGLtpV1Bqx4y0bnjnHsA:9 a=CjuIK1q_8ugA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: 0EUGcuWPbLpu9H0H1VETc6gPkYZwC5NS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEyMSBTYWx0ZWRfXy4+RkaDHwVVX
 F+7Np4AB6l88Tb+coZpVm+FWqYjM65n9iSzhvgwPSBsxXS2GkxjkSHs0i3prhb0uwLu3chiNQfc
 M9EJYxsVAbkDlfSn260QCe1Q1MgMqfp1X9qRhjnLhkPOLYzWgDfDBoudIRL7lvm6Dyzy+ktDr0m
 Ea618FxhseBI0HdhzNq0F5ODuNygwZ4uojIkTHui4z0cjAvGQ+sYTirYqp7sZ2ryxQSfgXps4Bp
 A7+3vajv2rZtO2CuOfK8/xDtlodLR+CfD58/cI/fCG67TOHgcVVgSUGY2VaNHsTXyI1tpGWAGSX
 0i1lDxuCNoHfJumdtfBmf0dH0cWZvqYYO1OLKoQ8aj1BPcjkw0bNYx5yPcTPSK1ueQ7aEgXv8LP
 740obF46T5/C4lOkPalUZY2lcpMUTYyTS/NJ4+8SogtQrJsqKX7kNadbna1ocpt1zWq+vSF1xLz
 TLB7XB7193dwNMYPZeQ==
X-Proofpoint-ORIG-GUID: 0EUGcuWPbLpu9H0H1VETc6gPkYZwC5NS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150121
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
	TAGGED_FROM(0.00)[bounces-103294-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E618404AF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-04-15 16:18:51, Nitin Rawat wrote:
> Commit 81af9e40e2e4 ("phy: qcom: qmp-ufs: Fix SM8650 PCS table for Gear 4")
> moved QPHY_V6_PCS_UFS_PLL_CNTL register configuration from the shared
> sm8650_ufsphy_g5_pcs table to the SM8650-specific sm8650_ufsphy_pcs base
> table to fix Gear 4 operation on SM8650.
> 
> However, this change inadvertently broke kaanapali and SM8750 SoCs
> which also rely on the shared sm8650_ufsphy_g5_pcs table for Gear 5
> configuration but use their own sm8750_ufsphy_pcs base table. After the
> change, kaanapali PHYs are left without the required PLL_CNTL = 0x33
> setting, causing the PHY PLL to remain at its hardware reset default
> value, preventing PLL lock and resulting in DME_LINKSTARTUP timeouts.
> 
> Fix this by adding the missing QPHY_V6_PCS_UFS_PLL_CNTL = 0x33 entry
> to the sm8750_ufsphy_pcs table, mirroring what the original commit
> already did for sm8650_ufsphy_pcs.
> 
> Cc: stable@vger.kernel.org # v6.19.12
> Fixes: 81af9e40e2e4 ("phy: qcom: qmp-ufs: Fix SM8650 PCS table for Gear 4")
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

