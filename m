Return-Path: <linux-arm-msm+bounces-89932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHm5CBcqcGmyWwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 02:21:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A74034F015
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 02:21:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7D82D74FBE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 01:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7FE30B539;
	Wed, 21 Jan 2026 01:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjhQVJon";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dbK1bhtI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BE530596D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 01:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768958427; cv=none; b=fvfH3JZzK0p6N6sQpGXcKgnklpjXTo2bexivAgTzSXruyOBL08jXAzDCJ7+yGrNF99BoqIDMNJHL8IFaH8sCUyiJixYasyrzXyiQmxZe/54HLinRxVbMkOiwm6l33yWHDsm5XrcDFHEJ6sw5AOj0V+IqhwQGjnEdRQdKjkURAfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768958427; c=relaxed/simple;
	bh=yyFHdN2gpeMVaZ0MZNtfhX4nPoKWXRKlkTFArxKR9Z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eO2AkJtHAbICNJ4sENG6IsgYCDD6ORozotE8KyZM/c5OAu5x85C6UoaoZVmMm8+ZfbMEdA9pbqs6qxDojwCnwkEXO4t/seLjAWZXxAb9BhoSrngmg6lTZQZcttlKcs0Ag8ddTGGTaH3TNf5pM39dCMuSuivg7TzU5neh72bwt4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjhQVJon; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dbK1bhtI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KL01Ir1530084
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 01:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31X3HJXmE+ewsNzBKQHcu2ys5oB4OdT178S5VcUsReU=; b=JjhQVJonIPs7teeB
	ksba57MU7kAC7XFnHE9s6f8gtNHJIOMBivHGAhk4VAEqtFPY3DQF4lTvGnL2e4Ec
	/14EPROD5LweJovoDRwNc+q+RxVlTV65u6bxWxoPn8ZWktwvidpfxWXlkJV8J1po
	U2A6H6lI+HTE5i41B8w1GVXXcGUFkQA5S6asXwHE4D+vmy7Gth+Hi/trxOEY4Pu3
	7UpRKznhwprap3xyWLv5zIa8q2dV8hv+YbwNS3YO2mukxrqM3WHOLoPGYyJU9j1e
	S7Je3YUF/0UegLjdXUWFUGDqfFgdXD/jh8Gnh6GI75TQ1ZkElWrG8C/aaOvCG9st
	sF86dQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bth83gre2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 01:20:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52f89b415so265338585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 17:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768958424; x=1769563224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31X3HJXmE+ewsNzBKQHcu2ys5oB4OdT178S5VcUsReU=;
        b=dbK1bhtIoD3TeSP2A+LsMadZ7az7nkjXF9uNWM5CTk4KMdRFoXLFMt5uql4rCCSaEe
         fmqhyKOlvwst+wxPPKU9a/n7BcGBBD/X/gg+zXMAP00KccGT+FmY6LRK7OQ7dhp1oWUu
         UGOLe3EEFpbqRA4nwNM/bXOoY5Wf23P47WoC07muk+Oaep/IMKECoY/AhlwmN0vBBldJ
         BcuayAbjE3NeHjet+qMyCAGMIdzdZOsgoJC+FjfAjIjA7qw0rY4OvvjHPLZnVcoym7V0
         AtCyU0vu0TesU5A7nafTYEF73SSuNuVY4x+zCIZoBVJmPNl+PfTER7GHY37JFx3ddlD+
         e+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768958424; x=1769563224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=31X3HJXmE+ewsNzBKQHcu2ys5oB4OdT178S5VcUsReU=;
        b=YDMcWIqa+xwqOWxSrkY1t999xvpqYCsQfoHwLlEb3iZx9dxT87RBCVwNQ7F8IXhsJ4
         MB/8XyIlbAdAGHbcSrpimaDSzhrhRlT8p89fejXrEQ3iLufBwG9QTcZofNVgn8ONCpR6
         LW2mKm+T36ss4ktsboem+++fMt8u2ZdUBpjEQlXjGR1BzOM8QqVDnCCFXluQ0MoggYIG
         VQtF9Br8CA64AH7LQoKtvegFNfpyJhb+UHTsORY477KALlj0JCnVOnlbqcU9ZYaQxcMm
         q/KvJfF3qfd8xlR1aIcm8JrQ1ZKOR9re5avLIHoJV1ZjlUnjUjvm/Atv8IW6h1rIsADf
         1TWw==
X-Gm-Message-State: AOJu0YwhfDIYAfCpq1ltnWT3y3czRfGjuwI+kHOx9TUcnP1m5kA8fKAr
	G42L02PBaKxQ+jR0BlYd0AYBXAuZ1Mn6vnlKD5E0uRkkwHUKKOvO/l0I8xU0zInP3z8ws4pSUsW
	uUeGTT55V/3TV1qeGCoxmQOgC5uVJz8nfOw1koN/ioKrTiFIvfGJJojI5DhivOH+VUbyf
X-Gm-Gg: AZuq6aIzReeZJnAOBArR7dyKpkeGQutOIJ0ker8RliYzADK8urpqGPw+U+lyTXDZDqo
	MbS2Ncvl6LMxav0NMzWQvMPqhLjbvc9HhW5bYkLF721mJvAn3goDvo8Z/y2CUED7cq1vBCy/DOg
	lMOidqwOwK/WuKLOdfYSzLAjvZp+u5DD91UNrremMigvpts8c65ZkW3h3edfLj7nmIAU0YW+OAp
	/PoMgcq0UoL2OqOsMp/q3BsNRm55BBRBXXCfy8L4YNq1xoRZXlnfGtBiSwDlo38jy/Vk+vR7MKi
	i+4sUMcYxXXDbtcArhs9VZRYF42trYDGeZnKT5Cuh/npuXppXAfJg9BlW7khBZ8cCd0v6N0xCjY
	UXkAeWkx/zs9RPrjy6dwaFud4Xz+NdG7QDNPyDuTqmjdGdF0BPllz6IvfmyEErepJtNYArJb7uK
	fIYWZkPPaHtW9VNpP4Bv/x1cs=
X-Received: by 2002:a05:620a:1a10:b0:8b2:ec00:784f with SMTP id af79cd13be357-8c6cce503bcmr456075485a.82.1768958424128;
        Tue, 20 Jan 2026 17:20:24 -0800 (PST)
X-Received: by 2002:a05:620a:1a10:b0:8b2:ec00:784f with SMTP id af79cd13be357-8c6cce503bcmr456073085a.82.1768958423695;
        Tue, 20 Jan 2026 17:20:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3543d2sm4383110e87.43.2026.01.20.17.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 17:20:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Nathan Chancellor <nathan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
        patches@lists.linux.dev, kernel test robot <lkp@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] drm/msm/dp: Avoid division by zero in msm_dp_ctrl_config_msa()
Date: Wed, 21 Jan 2026 03:20:20 +0200
Message-ID: <176895840437.3580355.3757750367730207447.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260113-drm-msm-dp_ctrl-avoid-zero-div-v2-1-f1aa67bf6e8e@kernel.org>
References: <20260113-drm-msm-dp_ctrl-avoid-zero-div-v2-1-f1aa67bf6e8e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: z08wmDbTTMWA1-am5-ds9sWeBhr2yLra
X-Authority-Analysis: v=2.4 cv=TeSbdBQh c=1 sm=1 tr=0 ts=697029d9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=OVJ8HEpvijlIqhD3_UYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDAwOSBTYWx0ZWRfX88oD1zVe+cM/
 mAKK1sdERFdHOC4Z2qGDyS5XMckzTCODqD8AcCxxSEn2gEQbVlcPmlNQ19fufYje0YxXhPC6rZ6
 tudzlzF6tBp1B3xBzDkSkSp5Q4kCQ2FwBmJWt+rv3a6ddy8+OSCOHaIJR81vSMxgGK/RQ9kMhsG
 5TyrEyWnRBjoD6ZxzhvKKtZ1LxhEHgeHsq7jrCUFdlHCl2Bah6W0Q/V0J+VVP8XMS1ZSd2/8gCA
 WDrMpeM9qpV+Zfhxwk2a26mXQgoEfrIhePhZNaZ7LWK0LTWgDwrCcSM4i6SZBokAd8vQUzfQUNd
 KXkWut44rX+08Sl/aHbQLcVVHhYG4MIX4IptfMbM670VF+WGQSDjQ6tfZ8hyiWID5sTT9+HC79h
 1ojC2e3LtoqTD6qJOU7a9p1uYqnvYRKg0vFjarMPK+buJ0VDVPjY6xupBHQXpKFMDekI7S2VbqF
 Su5VFTtPc6x4zHC4gsg==
X-Proofpoint-ORIG-GUID: z08wmDbTTMWA1-am5-ds9sWeBhr2yLra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210009
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89932-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,gitlab.freedesktop.org:url,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A74034F015
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 13 Jan 2026 17:00:31 -0700, Nathan Chancellor wrote:
> An (admittedly problematic) optimization change in LLVM 20 [1] turns
> known division by zero into the equivalent of __builtin_unreachable(),
> which invokes undefined behavior if it is encountered in a control flow
> graph, destroying code generation. When compile testing for x86_64,
> objtool flags an instance of this optimization triggering in
> msm_dp_ctrl_config_msa(), inlined into msm_dp_ctrl_on_stream():
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/dp: Avoid division by zero in msm_dp_ctrl_config_msa()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f185076da44c

Best regards,
-- 
With best wishes
Dmitry



