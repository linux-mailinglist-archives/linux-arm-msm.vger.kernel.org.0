Return-Path: <linux-arm-msm+bounces-90543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAe1BZpXd2lkeQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:01:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4B787F02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BB3E3010B97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 12:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67CA333752;
	Mon, 26 Jan 2026 12:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozYOG1NM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jy83ogfz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0B729DB65
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769428886; cv=none; b=OSDwyWIMTyw1rBuxhXqBhDZIcHtHvWhQshUCeGNnP8BdhAQZl9sXTwZExeE/Cp3oQXeEITBrROYmMz6Tppy0lsp4i2UtrZ4oy+rKq9ITXcEqbj/hGWQ/ugNxFxkHnAli3u1s2a+tqRFbnpO26XcBjbA+oPzgy/xCr+MykndorR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769428886; c=relaxed/simple;
	bh=GDToaIVDsOBsUrpRCjWh0LSgFTuWZJ02zG2o0EDDk1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8P4adkcNu505071HkReeJElXCViMaodhCdj/hOyjeJl5QS+9+2TZhsC9G7C0UdCTQs8j8q1iuJvEtzC88+ys7PrY59x+U5bFyar7JUT9o78beQv6uRhMiiac0zxZzatKotpy7NwGzXxb0r+/UM1LmnNp/odFXGOlLM/HW+PaVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozYOG1NM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jy83ogfz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q9TNmh1307847
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=puIsZe+lMzBVRjMEvnF4MP6s
	99iCDRjkRqcNuakVshY=; b=ozYOG1NMbMLRfHVRVEngDX5iR1bNwS1rr7KoZUCw
	4YYP9CF2w9vPHMDucUfhLI2q2ZkAN0pqgMQQg+kwjoJHsDdgZSbka3Y/HqYlFfuB
	jFWwk51axblZSnIroViIAbTQmnrdWqGqb27XEdFd7+8g1lTvKIJLEbbebD1HDrZs
	rZq1jCfIodWLFzyHKXsyliNLqn4dn1BnxUTYtvMLI4CYpEYjVzyzgz780gp2wR8i
	hMojvk5gWskSwwVdhTwlSMzzKgjeYPHuEhxZJ1Z/e1CKa3sTXGVH4cJsu57lwNSf
	kw+9gaq6dRJYf+OFdaXY0L8fQ2WBkKXWGl3gX8RKednDfg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3hcdns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:01:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c53919fbfcso1121745185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 04:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769428883; x=1770033683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=puIsZe+lMzBVRjMEvnF4MP6s99iCDRjkRqcNuakVshY=;
        b=jy83ogfzkKWmd3fVIehwU2UlC6u3rxzaLOwdrdc+zfpDzzRgyVJ90Mb8u2IBpnLZDi
         WMyl8JMccLln0GFeiRpBeUNCV5W7LSWe+GdZ/+QB/y9ehrSm3Xlp1MoH5PVfahnjfOJ7
         SLbbHGSair1tWMUBs4th2vRVAyCL6UoLvrnefJxhhnJay/31isooVvmaW+3XVIm0Q0EQ
         l64M9o8Y0jDUujFC/I7w8fjuprUHPEsQnURhnWwqb7KFlQ77pgO2kDGswYoKisE1DjA9
         gJ7LQWaAW7LXe1KOtW2vtauONLrsjUCtLXVM8WLDiGjA9MmDGGFhN2Bh7rWhbedyNPqW
         PK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769428883; x=1770033683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puIsZe+lMzBVRjMEvnF4MP6s99iCDRjkRqcNuakVshY=;
        b=TY9XUFwzlOuPOkei7dI8pThRhrAT4XKhxTSxm6rycaFfY3yZvHPOfpEVsw7/BNqKeX
         x28AU6jcqnKspgOvhHh1Ba3YUMgehEdmsITuEyjvXWWWcs2hSQ8rVZvnOR2ezAwiWihZ
         hQidgOSligZonR7EkceDoFPoxW/bKMcv4Ss7uK5T08UADSNmNBxWBxZHshNWNg2977e1
         ypMLB/dPvetdxbk6EK5kjXBU3yd5EBcow9+ir9BVMJFLd9+hzZymUSjJXNzsxO909XtM
         2eAWOF01rJLXzzC41cqFqTlwH0z9dw4ROvvflM8Fg13ETFWK+p7CEMoh4Um0BLj4zg6b
         tT6A==
X-Forwarded-Encrypted: i=1; AJvYcCWqS2LqtQ7ZSw/ak2ayU+2Fr22uD7mv2r/cX8E/8sz7dq8p3oTuegTLXeBlL9cDvBwI2Oz817R54OfGj85c@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6W0AbOGbdKAOBpNnsH1xXlFXGI9wj4fQBRLcxw+iO6SsRD2TC
	9NIO62UntzLiSv+mTnFGGutkAntunRNDcYvKy7/9aMJI5LWlNQFrkr25jAd0vK69hO4fv5mN5Cn
	OtXjWHvOJlL66v5gAKBOSzLRvX1aQPPeyCvmnOnnvKUkX17RpxmThVjEr8U3EsEl5EEdm
X-Gm-Gg: AZuq6aLc1LweGJOHvN2egQE6VWzlnBSP+dlvfMaByAOyV0XVlWnGOi+jODPLKfdEIGF
	RTcAOkU5PEi6XruI80Q48JJoPBYTi8saGMldaZvN/3jcPAAvs6/pS17A9RR1N1uK8mThKac5TCr
	hmose7iN2PcaVGVfafiT2Np4eLgmHAlMTmdrzBPRabmsgGFqybpl+dsWyBlKkj1+xPMPgFRpakR
	IELUz0Rufpxh5+5zliNiNns6wXKJT9GU81vOEPuVd80UqnEx08pPvKYsHHlzDYEre9XBcp7slPU
	WAnuuE682KfdyxsZsXxaN9iJhAHt4TceALcuEjwz++YQaNKWpvJl3+NfpeaJ2qqwNmjwc1WIa74
	5Oo0nr6xr/wtmp83ZVJRQqGME
X-Received: by 2002:a05:620a:17a8:b0:8c6:e223:3ee9 with SMTP id af79cd13be357-8c6f9643034mr427985385a.54.1769428882999;
        Mon, 26 Jan 2026 04:01:22 -0800 (PST)
X-Received: by 2002:a05:620a:17a8:b0:8c6:e223:3ee9 with SMTP id af79cd13be357-8c6f9643034mr427975785a.54.1769428882163;
        Mon, 26 Jan 2026 04:01:22 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470472f1sm380540675e9.7.2026.01.26.04.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 04:01:21 -0800 (PST)
Date: Mon, 26 Jan 2026 14:01:20 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, dmitry.baryshkov@oss.qualcomm.com,
        neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH v2 1/6] phy: qcom: qmp-combo: Prevent unnecessary PM
 runtime suspend at boot
Message-ID: <aw4ypn7tar5y3jhyd2lnqfvfw5v3zydabshyt3zgu4e3bl7hn4@rjsfewlzndmi>
References: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
 <20260121142827.2583-2-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121142827.2583-2-loic.poulain@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEwMiBTYWx0ZWRfX6SvXhDsnEISp
 chbBu+QsLNIYsyi1l9NpmwPOQc7bcPUxNbOYYA7iAj1udATy/+5oDLyLE1mFCSLna51qtTwHKDz
 oWjyPdrllgMm+RPYZYemjk2A1BCV6kbd2Z6+hHXgpxoxHIw/T32aexsoDZdJRGGCfbGfGXVEOT0
 /+vjEfD5ciB36zHckuokF8YdwYQjfn5d2rjpZos49lxtb51goidoNZbXtCu0ddvXRwwmSkPP3Br
 MbxQjuDIWFKIluc5gn7SaIWIHJK8ezeHsVWsBTncsAmYZf0vI5c+YwDtNapTB8xvEUbBgykYaMI
 N2P7ekk+erLf4ilnkSpL4oGz3Yt/dr82SW/W+NunvHG9Skd00PkghfEIKkrS4fXfaJsqzLLwdie
 94RvF3S9t0Y1j8tzbUVjPPw9LCoVclyoCwJIt79RZxQjJMN1ZXxC4EfKI1u8A+/k30C1CgZFzpC
 QKNFoWLQOXfMEep48Uw==
X-Proofpoint-ORIG-GUID: 5y0ya3xT0lzuaL8yzxhM_TVOSpKP0cJa
X-Proofpoint-GUID: 5y0ya3xT0lzuaL8yzxhM_TVOSpKP0cJa
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=69775793 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pxQL0frbaL4a0zJdC2sA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260102
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90543-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E4B787F02
X-Rspamd-Action: no action

On 26-01-21 15:28:22, Loic Poulain wrote:
> There is a small window where the device can suspend after
> pm_runtime_enable() and before pm_runtime_forbid(), causing an
> unnecessary suspend/resume cycle while the PHY is not yet registered.
> 
> Move pm_runtime_forbid() before pm_runtime_enable() to eliminate
> this race.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

