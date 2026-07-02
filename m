Return-Path: <linux-arm-msm+bounces-115929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZL5rNGVARmpIMwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:41:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA896F610B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:41:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="VRL7eI/+";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CXlMM+nd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115929-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115929-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC10F302E408
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD513A4F30;
	Thu,  2 Jul 2026 10:22:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DC339A05E
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 10:22:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782987729; cv=none; b=LA7ap32D+VNI0NnoyJfnWLENCQylxRGbfpvFFt7GARXAOCJd51B88c3SB1i788g3nE/mxOLatK6DHgs8MT4k7xpUm6z8jWrxkJWpyvyHYWZ0RWfuk4WhIf/sjQT1CNTUoQy5hd5FS3BF9yM+88eBhDm0cKNTR+YewvQ1Ww+kP6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782987729; c=relaxed/simple;
	bh=Py/uYToUxUncPP4JcChXBrVqCrVIe7Zlg/7+No1quqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fi+C8u/KzrojuwVa/M0S1JXH/W+YAeZZqib0QjMGsCmgC7Furf0bA2pLGxPVZdDzw+lgYZ7qAOT+yrIYOrVByVjglFGCMCv9/MAzKgyb1W/s12PnSlORfgUuObaxFKg6JlIqpivEkhFpjDaIy5I7IaSRL7sQB6kL5G1a7YjNVRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VRL7eI/+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXlMM+nd; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628OUlf3009463
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 10:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ACy0kSKaca7364zp8KlrF0zn
	ZRccG5p2iX0NhdPhNFU=; b=VRL7eI/+JKT8ubHULwlCXw+Kgx2pkbCmFBweOMB0
	dqPM3sd6x5hkJi96v6g1OaHVEbzWA9/PK2rvTARlNUBnMUzOi5f5WYWFj00oy2l3
	dQuu8nKCygWJP5gaojNOwSIXEKQD2C37Hm8e/Ohhy60hbphA+AEh1VaLXUhIW2nU
	lW76CO7p0ytdPLArkOBgKIn3vfaPMuucOGQDxS2PpNAsKoQaq6hgP53idU9ztJ4p
	4/pPm8Cui+Fe+lMf+UJ6L2D5c0P3wJhNpulnwoiFAvx/dtH7JKhkyI78J2KWnGCc
	Mq5TATDPC0vcQDVGTbBkmoo9NxeZlTNJ07ZFfccoLQowtw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f579rugbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:22:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-380a638fb5bso1790830a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782987726; x=1783592526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ACy0kSKaca7364zp8KlrF0znZRccG5p2iX0NhdPhNFU=;
        b=CXlMM+ndqoddBzBUsP8ObjefWgaDz+kyhnrUK2wXWTMbUg1HUL29/YTGY5lx7HKyLD
         WuogDEeVKJzrUM7BeQboI+bs4Bd6VJtTGFVYicllhkf63M6h7VpYnmaDMTKGn3gpBx+Z
         xdM4AiLS5cMpK0pwXnDYUQGYDdQI/cfWHQ7OawIopUbCCOurX3OH0h1VeaI1RT6vTwMS
         RIw4Lq40qo+PdG927FxRSA2K9lgD/zqnKrCIPnd5AHUJ6bnpCCTGVERs+38iUnTAyqhI
         D8mFgGEeUeW0Erbo7mxvI/s8UvBt/lwbbCsiyv5FQAJtp0izLaNmlCn0Rma6aQupuhQv
         48Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782987726; x=1783592526;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACy0kSKaca7364zp8KlrF0znZRccG5p2iX0NhdPhNFU=;
        b=lL/XgaO/Pm9Yh+24P/JOs/ofFvk1MZhGvS9qQ55xKb7o28739K+GJrLBM6cewetNOX
         k9DId/11sr96RPLdQZnuiRqBSN6BnRJaPnMN1ga4amrwMb0Mk+bFOBpvuq55TtX6rN5o
         s8BtQnQSMbyzVSHfxsUQ039nyutP6VppSCSdHs1QN7jyBxP4XUsqqsXeDAqexeJtcFRO
         t0CUWiQz5vcrsb1sK++u49d1HBE0fzIY6gsg59tQgMJOCByIGINEHn/PRDWDE2Mspyfu
         2ukeCkFdj5dswZOIWT/2M37d50/QZ8Tu0GnbimjN4ShAInRRJO31ammy7NW6kIhC/dSe
         u4yQ==
X-Forwarded-Encrypted: i=1; AHgh+RqakXEHCBIvQQ+w3bmtzEzAb5SOrvnl6ip3lw2hV5OV4B4UL9UdfWjNW14Ykye2irnLJUCl51LsQw0miQFp@vger.kernel.org
X-Gm-Message-State: AOJu0Yym+GfyKwhfrBob+JdFP/EJLZviMeLX4FldesCwcrMbCIcZohFu
	2/33Y/W1Menmg1wziIDgSOaDMaQOcNz3YmTbiDluy9/ZDbCAX8S9sVscUsLFLD0b9CfyELNR5kh
	8SW0MZIOHAqMVgKqu3wMw0me6WDD3FgNSrFcEy6Mk7EZY7SEontsai46z6yRVErcKvn1KyyEENC
	V8
X-Gm-Gg: AfdE7clvCBT9flJZA7L4AwFRB7hdAc0p092GhfyC5N5iaEq0IyvpDzxKasgS4Iz0Brc
	VHqKuRKRIDaDINmTq6oW8hMyyLPu/uRJA/B7cso+gp/LQCsEMBFjdAE/tH2G2BkQPnpcdoO1MVw
	TH8qa6slqlHKousoEUAloPfvjkNkcfWR/5hKx41BuilxhW0aX+XtRAYwSFrCg1PXOUJW9kDSgFC
	xufYA3bJ/9HUNqdv/xcn5bQd9Q1vH9+P+2hsesBTMCezq5xshjr0j22gJZz4k+LhX4eshq43ugX
	uZqeCcT0bCGWP6zhXLvatQwcwUIKWsuV1NVJKy6dhaqCqaWnuf4mSXeIA1tFXLu5ZJo3ma7nKPx
	T3SEd/Q4Hxx8BmvT0Ecuh0EQs5xhMxVtN4ccLvA==
X-Received: by 2002:a17:90a:e7cd:b0:37f:464d:ea38 with SMTP id 98e67ed59e1d1-380ba70e00cmr4392106a91.0.1782987726073;
        Thu, 02 Jul 2026 03:22:06 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cd:b0:37f:464d:ea38 with SMTP id 98e67ed59e1d1-380ba70e00cmr4392074a91.0.1782987725532;
        Thu, 02 Jul 2026 03:22:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc38e5fsm7587377eec.29.2026.07.02.03.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:22:05 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:51:59 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/4] firmware: qcom: tzmem: guard against IS_ERR() in the
 cleanup handler
Message-ID: <20260702102159.jqz6gnxnek72bv2u@hu-mojha-hyd.qualcomm.com>
References: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
 <20260701-qcom-scm-code-shrink-v1-1-02f5ce02c95a@oss.qualcomm.com>
 <20260702081026.c7rzopcn7vypggjq@hu-mojha-hyd.qualcomm.com>
 <82b28f9d-029a-4b5c-852c-7ae74b1ff83f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82b28f9d-029a-4b5c-852c-7ae74b1ff83f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwNiBTYWx0ZWRfX8pbPgHSDQjAU
 g1/1CIFgHwbMKRFsHG2JFCJ7I12Vcp7ohjIX1KatUDMtOhMXmlXDAFI7UX6M19tMpWaHTkHds1g
 SYGOqpwKBL46Dmf+JkEFZRRtdBJxNJFcro2vg3FDYkx70/qMYnvwgKkaNbpLegM26w9vw9hjFzq
 fEDZCKmLKHML+A4H5RB9SQWipWkA+8VDH9JCtj7JM6neokDIBz+CFyiwwjbtNtIsrIlD4j+Qhbe
 zPqFjPWXAIp84v7F7izDGv9v91ngQMNjf1EvusxsFWds4XC0z4g+mXk5J4p5d5XrWteCu5YdM+M
 xMS5T7IulrP+c1ILADLh/tG065cV42jT4LX5YN6yGGHYy50zlSzo8AIgrgNr6AdYwuTl+039HeQ
 9plLclGpNGHMOfWKiqFn+h4I4lnFRUBix+Kr2wsLJ6hemR8MrdZXXwqzQh9pr7g857RbG+TDwcW
 lkeH/rHOqoR5xMPoN5g==
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a463bcf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=AOs_sf2AXurU0_BywKcA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: DEIP8mib3OmEn_3X2xXBhSGtTlus6oWE
X-Proofpoint-ORIG-GUID: DEIP8mib3OmEn_3X2xXBhSGtTlus6oWE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwNiBTYWx0ZWRfX6KenP7Bo3x8R
 XBvdfTsaiAB0c+hpXeBkoqPrtoHXNOEKj9l72Bfq1doJ+NOHBAbTrXhPcFo2xHPPJu4rtymVbqn
 otG83q4vZFkPzTCbzL64Xu38I4YRBbg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115929-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DA896F610B

On Thu, Jul 02, 2026 at 12:04:13PM +0200, Konrad Dybcio wrote:
> On 7/2/26 10:10 AM, Mukesh Ojha wrote:
> > On Wed, Jul 01, 2026 at 03:38:55PM +0200, Bartosz Golaszewski wrote:
> >> We currently only silently skip NULL-pointers in the cleanup handler for
> >> tzmem. It's possible that we get passed a pointer holding an ERR_PTR()
> >> value so skip it too.
> >>
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >> ---
> >>  include/linux/firmware/qcom/qcom_tzmem.h | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/include/linux/firmware/qcom/qcom_tzmem.h b/include/linux/firmware/qcom/qcom_tzmem.h
> >> index 23173e0c3dddd154dd56dc3dcb56bd20ada0520a..b5520178bf6f53b86b530571a3be9f302225f022 100644
> >> --- a/include/linux/firmware/qcom/qcom_tzmem.h
> >> +++ b/include/linux/firmware/qcom/qcom_tzmem.h
> >> @@ -58,7 +58,7 @@ devm_qcom_tzmem_pool_new(struct device *dev,
> >>  void *qcom_tzmem_alloc(struct qcom_tzmem_pool *pool, size_t size, gfp_t gfp);
> >>  void qcom_tzmem_free(void *ptr);
> >>  
> >> -DEFINE_FREE(qcom_tzmem, void *, if (_T) qcom_tzmem_free(_T))
> >> +DEFINE_FREE(qcom_tzmem, void *, if (!IS_ERR_OR_NULL(_T)) qcom_tzmem_free(_T))
> > 
> > Is this really required? Are we trying to address an issue which
> > does not exist today?
> 
> It doesn't, I was scratching my head too, but in patch 2 there's:
> 
> void *output_rt_tzm __free(qcom_tzmem) =
> 		__qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt_tzm,
> 					     input_rt_size, &size);
> 
> and __qcom_scm_pas_get_rsc_table() does throw ERR_PTRs

I see, Thanks.

> 
> Konrad

-- 
-Mukesh Ojha

