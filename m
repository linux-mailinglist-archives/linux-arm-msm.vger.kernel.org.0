Return-Path: <linux-arm-msm+bounces-91864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHeaMpdThGkx2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 09:23:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 264B2EFDA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 09:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0310D300E611
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 08:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BC536212B;
	Thu,  5 Feb 2026 08:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pO7tnQtN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pvvb87aI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D282136165F
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 08:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770279821; cv=none; b=rem0A4TwpG3/639kXtaSAF67IxT6tXYOO77GLP0OKHwucaw3vD3VNNWMaak9rNJY9Keh5Vjpd1g5yiN+3XYwa3M71Uc7cYEq5k2A/MEk1woJeGnNeP4Ymny/5Yld2aCc6C05DkGlOgJanGiY+ccJ2GxJcZxT0rkS9yuN4VDl738=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770279821; c=relaxed/simple;
	bh=vX+mYv8ahihLmv+MCaTd7lnxagh78uHcoBFQDNRvRPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i5fZyH41Cyf391zhUaI7sV7dhNBh1RhUbN7xBxyfDy6cXXOnPTkoVZXiFUGHiVzpWRr/+PfF3R/3K3kqdHsGieaETIraV/keUka367os4l9YxFwwRXgBK5u6+20BotzaTuu34bTMcYMy6Ogh2vmkOIyCfQa7W8X+oG6kssTHPx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pO7tnQtN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pvvb87aI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153dmne3239125
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 08:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DCCoy/3zs2pN95IYxyQawYzQ
	f+gS06cHLSHHp9Ov5VA=; b=pO7tnQtNeyXoA0+7mAu7InpGxZOWHzmZe5cTveuN
	NUYwjbsCEmyoHdqywPKjqgGfTGLKKvIzlTE8+NCz6FP3EEmQv9bpHgd7ZDeL47KH
	MJy2tPKEqLFNT03lPQbTigkVcvD2L/tfxWfvNWls2aWw8Qt/UBlyn3meiardXJiq
	Ofqc3thlBpVb/QQyVNPIEBBlwuv3/FmpZH9c7EtOrWAy/DVNuJCuff3X1fzE9RWM
	GIelMwEUbcD1VpL+qtCIqlQlpvsmY52p7wgEdDSh8SeupKq8Cxa8KccpEIakt99+
	gmxssJRJ/WKSD4dF4HUbw9nmTIA8wG4V0bHprBpaVQvIFQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4cp51tmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 08:23:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-352c7924ebcso609118a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 00:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770279819; x=1770884619; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DCCoy/3zs2pN95IYxyQawYzQf+gS06cHLSHHp9Ov5VA=;
        b=Pvvb87aI8IG2Ub3CtZMphatLimMajt5F1SLWFY8MsHqx3e8KK9oeQ8OT5OWeGzpYDR
         JZvn5Rh5htn/lTLHPv1k268//cxJimSwQ8SnVUGO1rpv25CiMeXzCCih3gvskvk49YJL
         TOAK8iPtkToj6hywTr8+wN2vokSqxHwEGI6MZgDTEvAOp1cyu1VBGnyeRLKKKdyk/rxp
         Kuz0IbJTNykZBi93IXhRRX/YNNbg/PN69Oggw9j8RQVMnxSMqAR8Nlc4SxgTw3ebgivt
         +WHkgfRpjZPzkewEfnWcCxMjLAjXRtraKhM6y2UOyQvu6tNnhU3cNmKVIlI6w9BmUBNK
         BTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770279819; x=1770884619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCCoy/3zs2pN95IYxyQawYzQf+gS06cHLSHHp9Ov5VA=;
        b=cFhXGkmAy2R8ZA/um95b6rPd5vIqc8XARlmlrxfwd5iNlMxsXdofitLB96A0KuymTs
         1G+spx4dBbKKL5DKD/yy+/enUBXXW9ZIIHo4i/zifT4rLV1ZX3HTBcXEh+9SKD5WJ8A8
         KJVx19Fv78Kud59aAc5Z/ZuiofC0BolIRov8HVzpyJPtX5Aki+QDO5rvNa/IAcUam6Qq
         dva6d/wqeVdjp5Wc+on7hLiNkWBbKH/1nIV7aySyxIgrSHRJqQgrXnnsSKw3efm8i0TX
         RvMWIsQk/8UgszaeplpU4wu1A6+cxbd4DCpyHX78IOjP8bn0eXiO76zVjaXyvNy+FeaS
         572w==
X-Forwarded-Encrypted: i=1; AJvYcCUs/JfsvA58tJzJi/vihVUJXY6iLIcYNoL9kYys1mdWDmKxH1L0F1U3Ey8Rksk4g8vOh7R2qHVb85MNN6yD@vger.kernel.org
X-Gm-Message-State: AOJu0YwFfRWnISCwm4IiWQXdF++AZUlQSgosSLXaQ1Xwp2FssoBJpg36
	zmrSW/iatMa5oedP8HNKrbyeOFmXQtfZfjWmkxcDa3y6tCL2GSserB2nXli13pGKPRww3NNppJz
	TwTKgS3GFPqzfM7sWuDLn5GmKhxyA1afFKLAsgC5sd8iocMaE1mc72WfrraABnLxhybgt
X-Gm-Gg: AZuq6aISgTCrPU7c9opkmLX8ZeOPR4MAle4p+lTWXdznu3BcQ+jcqCKXDlzThBYFYOg
	n1aA3Dhiwu8IWqmTT6vm4G6t4zcoj0sKAe52zmIsnVs5pzUGAhOyu41hWEJj35but7af5vS1jb5
	eIQT0HTlPJptMBWXihjqiQA6xs+K5B4MeFwAyvX7F0GdfXmageo63Ji1l176RfoqXXLukF9SZGU
	EvwIFQTwl88VLBHfhH2VmQghd2gUCmk16dm7HPrl0BT0W41KN6145GwsMH8lFMN/+tii1cQZXzG
	DuAu+ssZmUQwj+P8cuz/fzxpNkp0X1gDc2Ybf+BTW0gm49vrovg2FFxuRHLthBp6NXGs0S8avjT
	M3CnUUcFuLtMtDGFrYr2VjZDjWbypTiaB0rfu
X-Received: by 2002:a17:90b:1d82:b0:354:a870:410e with SMTP id 98e67ed59e1d1-354a87043d1mr241359a91.37.1770279819361;
        Thu, 05 Feb 2026 00:23:39 -0800 (PST)
X-Received: by 2002:a17:90b:1d82:b0:354:a870:410e with SMTP id 98e67ed59e1d1-354a87043d1mr241338a91.37.1770279818708;
        Thu, 05 Feb 2026 00:23:38 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35488ab6b9asm3294089a91.1.2026.02.05.00.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 00:23:38 -0800 (PST)
Date: Thu, 5 Feb 2026 13:53:32 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] firmware: qcom_scm: Fix coccinelle warning
Message-ID: <20260205082332.zcz3gvhljxr5u737@hu-mojha-hyd.qualcomm.com>
References: <20260202113241.3058845-1-mukesh.ojha@oss.qualcomm.com>
 <f512db69-e187-4c6a-8080-7c02bcd46ee2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f512db69-e187-4c6a-8080-7c02bcd46ee2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Oc2VzxTY c=1 sm=1 tr=0 ts=6984538c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=3tZKg2cm2Y68ae2pYPYA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: AiKZAqOp_3D_bHJqnlzrjsJmJ2aRS-WK
X-Proofpoint-GUID: AiKZAqOp_3D_bHJqnlzrjsJmJ2aRS-WK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA1OSBTYWx0ZWRfX1ZMc1DH6Dilq
 e2oRjEIHiGvOxOgJfKYEaGI155gPh65mJRN23z8tQzuE48yVdy5fKX5SXXdBI+E5sZeFLbA4wpg
 zJb5jACc8LksZyN058v8kPWo8+Lh0P9T91C/x64kfVqVjhoLU87URif/y09t7xsFt+5fVP4K9MS
 uIEU+QFzN7/WeukGsn7ObaDKd4wrDJtAIF2NUu142gDsCHdqDya/NeDu3x23+wEqEW9+Bgmwlwj
 D5+WLY/n1hC93kxHXWOx+1pAJF0voIsTmRM11KMl1K8CdtrxsX2gqJL3L/EYSQ33kNRUznPfmf1
 5DNyS1ftecIcWUSCfQRl5tlrIRHTef95ipubJovkvWohdRKI6xzaP33x8nLjybeqVY7R3OKdvrR
 y+8BED+Cdx/6C4xpkLcHnIQ1kcjQGp5kzKo21yPLqShhDpgj+hchOVV83YIsdcL6rj39+OOX1XA
 1YeqEztnlNE0Bb61nZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050059
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91864-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,intel.com:email,hu-mojha-hyd.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 264B2EFDA0
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 12:51:31PM +0100, Konrad Dybcio wrote:
> On 2/2/26 12:32 PM, Mukesh Ojha wrote:
> > Fix coccinelle warning of allocation and memory copying to allocated
> > memory by replacing with kmemdup.
> > 
> > cocci warnings: (new ones prefixed by >>)
> >>> drivers/firmware/qcom/qcom_scm.c:916:11-18: WARNING opportunity for kmemdup
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202601142144.HvSlBSI9-lkp@intel.com/
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> 
> Preferably the subject would say something like 'don't opencode kmemdup',
> but that's minor

Thanks, Just checking if the tool name like coccinelle, smatch, sparse
who may find some issue is not preferrable to get mentioned in commit at all ?

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
-Mukesh Ojha

