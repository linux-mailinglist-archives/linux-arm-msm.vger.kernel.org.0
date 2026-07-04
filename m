Return-Path: <linux-arm-msm+bounces-116437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4hYNFOtPSGpkowAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:12:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A61F706369
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:12:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AB7OWI47;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aWdpcpGA;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116437-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116437-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CDBF30247F3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 00:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DE28635D;
	Sat,  4 Jul 2026 00:12:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4646639FCE
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 00:12:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783123944; cv=none; b=roiP9u55g7gKNPBMcNQLSYaWdJNnGqGBA1voFdhCQDksSy0y2s+JK4J9DrWlfuA3584RKns/6PpNVHHzN6iZDrypkqRrX37OmtiWi+PerDV+yo4dO4sTaWPA5LC5xff1rlC2P2vMbd86UNdUEQsxzfXfNUkNOaNae35twdSh8OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783123944; c=relaxed/simple;
	bh=8LgSgTWR+wqHhxaO8Efz+/b9O3dxoonnOZZUNpe3AoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rzbpamjeJ6F5mgJinNJi1/FtmfO1/FVrbxRnuUjc3v5cuPoEWOW7RusRrcUzn9fNu4UA6mHmSIMX0bEssAyM4XvsSN1l3DvMitIBe7CFy3k5OZAhuN5/8yvjUPMIgEsY4fLOnsQOqX8aixYWas4AyOeUaJFIZ98HOrxe8asC4vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AB7OWI47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWdpcpGA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPbpT1029436
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 00:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KaDSi7e3TmfTh0GZrV+FHaGBZpt/a4TRf+NVfY2hKpE=; b=AB7OWI47uZJ6uL3v
	ztr+GMKil8gTL8sISkVZA8D0tYY0Qc4gGEG5wLIvaEWDLVEVaTENmt9aArh/B38O
	TDFZvCf6ITLYImHQ5Gtwn89+swbO4Y9lE4aShIfE3+NZa9ARH6rElQk9snUytWTa
	mOzJ/gaQMywU2cl4Zf4UZcNQaTM5ec9HzS8KRK1l/QBiYVF6sLZ1UPBnINzfOfgH
	RNeb1KbXSuKQ3dhFyaKmfE6AkO36x5Lbl5vXAGc5BX4Ye64jk7WOin8g+f6KM0/M
	6997EfIPilvBFYK6huCZr+BgW8TwApoXvzfiItQnWcLH3sPf6Z1gQAsOIad8ulqU
	bzbtag==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qcm1q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 00:12:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e632390d2so176422785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 17:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783123940; x=1783728740; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KaDSi7e3TmfTh0GZrV+FHaGBZpt/a4TRf+NVfY2hKpE=;
        b=aWdpcpGAW1gfj0soLD+eCiStjKyZWd2uePQ0eT7cP3dUERgvw+OAUSm14UZz6dH4ep
         z/9DH16PdLVMerz5cYqjUCClcZd3cLLAsDHLH7uipJQf02aF/OxulVl6ifLvkOHY5HeQ
         SXk5H9aimrGskwIZ8HxYuOi/qaQ+4YWbRnWJWHOJWKEhK17MxjYQUp/x+wBkT5M91Za7
         o9/8AH9iOWe1rH+dXsOLvyuWpAI94AO2+8ulh+v05exmYSt1/NcooTV2A/694SSYp4eb
         fmFy7a+EaadQDwfK6QOy/wmQYAUbXGLpA2JrM7ugqOdoMNt4rB858rmMtqWrHYRjTbRP
         WRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783123940; x=1783728740;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KaDSi7e3TmfTh0GZrV+FHaGBZpt/a4TRf+NVfY2hKpE=;
        b=obc5fgHMH3ASRMAKj0Fph5/Q4dAXne2nDQNKOVTj9a9hGjvHUVtAgLuSsNeAITOTAm
         WWZ+o+BvG5Lsobflt4U9jFJOAH0dzHeJ8IWQculDQvynlX9bMdmW+oVU6h/bb5d6Aj8i
         z0WnG9BkO4k8EqqAzucxhh0Kdn4gkp6UdKv+JeOhCmDWeYP5ufGGGAr/bZWamIbVAyeU
         +JxSkrVHd36d+/HaJVs3Vck28ZBCjjZSjrPfwKrsJPU0HVCZHTKQ8JRGUTnuNfJ8E+eX
         vosS25HqAR8aQbqzIVYr0UJlVRFUE7iW2D2q75Lf0BU2pI8xX90qHklB1LNeuw4qeYD3
         YSaw==
X-Forwarded-Encrypted: i=1; AFNElJ9GmGXME64ANo7M+5ACVn+YoLIAOfz+mI6+jGKVPUbKYrpvP+QvwFrbXur3a5vMFZ5blH96nNh2lw+44XRL@vger.kernel.org
X-Gm-Message-State: AOJu0Yxydu2acvvhDmwCowUeqhD0LmS1QH1mCO0Vf2xV56TFlqhJly1Z
	7WxYhX7eKVbBu1j1cRIFy8NnAndH7uOd6Vk7wVyAg+y3913LIzEieVW/53EG/PkhSTFEyt0vBN7
	Puwukl98DbkufgzJ2PUUQBpcE/vmlktBQshDatEcPWEnnE3BsKpNE6r4sPdeqsv7w+lX1
X-Gm-Gg: AfdE7cm4IXcWBjCeM3yIq4V7/KRbxU8VoW1LzmKGmEWhsT6q+JfbQDPRMkyjiuJg8zu
	dWP/RgsWpEglEyMFxohLM+ropH/2trTi5CiN6AE4WQ9mZe8Fe5xIlc6VG8AEk5PtaMOzvHOBn9H
	V+z40roe1ywxXTIFk0tsh1bHO/bsKPocbhRwxuqltwLSadHlypnQvAPCdc/CCurVqHKt6Uap5YJ
	cdilPTBg/J96UAnzE63l5WpbcOAFwW9hrn/DUvh0GEnCpDgZ40eRkF98jFNUIhyBXbLs2592dIa
	cqOdirN8vK1h6FHUnJ03fE7mCzu9atrQ38KekJD5OUtuYa1Fst7wCw+0gOlJ1jSsHZi88GKFHHW
	iad1GrJda+HsG4uUeH+M3HLOrNpe/NHhLOd5hBLdas1AXM0osA4tQ21z8QCjygduSdXvoX1Ab+y
	2v+I0ESVD8oa7GdFDo98Vntnr4
X-Received: by 2002:a05:620a:4114:b0:92e:7ef3:213f with SMTP id af79cd13be357-92e9a3502bamr221690985a.23.1783123939669;
        Fri, 03 Jul 2026 17:12:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4114:b0:92e:7ef3:213f with SMTP id af79cd13be357-92e9a3502bamr221687285a.23.1783123939120;
        Fri, 03 Jul 2026 17:12:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bfd12sm845506e87.57.2026.07.03.17.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:12:16 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:12:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, amahesh@qti.qualcomm.com,
        arnd@arndb.de, Greg KH <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Subject: Re: [PATCH] fastrpc: Reduce log level for DSP info and reserved
 memory messages
Message-ID: <q6rh5lnqmulzuio3hu3773d4cfyhkoblsba2bcankfcvb2vcwq@f4clwajq5qdy>
References: <20260514062825.50172-1-jianping.li@oss.qualcomm.com>
 <cg526ebtmnboqpw5aabwrtmoc7fhnvc57dmjax5zltcjonnazv@pynuwgpx3bi5>
 <d883112c-5ea5-46e3-abb7-f7c611f52ab2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d883112c-5ea5-46e3-abb7-f7c611f52ab2@oss.qualcomm.com>
X-Proofpoint-GUID: G1B4hTYt6iMmP8gEwmEzaYLs48_IKr4-
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a484fe4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=HobEkzpNabFFunooC3UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: G1B4hTYt6iMmP8gEwmEzaYLs48_IKr4-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDI0NCBTYWx0ZWRfX//bTtzpVCDS3
 zx0b7YBQdNqQ9GTUJOuClzDf47Ss1AgwFEkJ/i/wPHrB8gFmN/RfndH/l086e+J7XX5w3LyINWG
 w9TbpWIxgcEM0wFrOP7S+QcR4paGRB6TtichKO1yoYznj3Z6mHYY5I9XWvhYCzJmJ9HGE6ZhyMP
 cYY7DSa02a0V1OutnJdA2wlMAxmWJItjZLjCE78nhPYd0mYDac/y4yabnWkstL5+mwrUrsJC/WH
 GVWjFLUZWK2KFOs+ZOEtcO6nKvfbUK3Cs0BNZuQJroaUZ/JWF0AEgDCSUINrhnssOA2rWhdYDcj
 mEvOSENTc2eeGOF0h8SGryeHIW1w6RRaDjygBpatEqR1IYC08lodzHXQ9esOsfmGuIRTqDESThr
 QBsEiTVrbHqD+jqvh/Iecgoka0PWjW0qdfHkqGKC8nSrzTNvF6+h7kOdW8xZFWqi3l+Eeum7hZL
 kMYRRhEf4jeXL84J3Aw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDI0NCBTYWx0ZWRfXzNJAzuYC3T3T
 wNL84i2Ougth4FMoFPYTPOLic3gSLyUrvd8mPFmFSXB/ixTTvXvH+cSu9LttM5HfwFfafu6/Nmc
 4x9OWuX5eYBEWwIgkdkf+Do+y6pTxuc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030244
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116437-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:jianping.li@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A61F706369

On Fri, Jul 03, 2026 at 04:31:43PM +0800, Jianping Li wrote:
> 
> On 5/18/2026 7:08 AM, Dmitry Baryshkov wrote:
> > On Thu, May 14, 2026 at 02:28:25PM +0800, Jianping Li wrote:
> > > On some platforms (e.g. QCS615 Talos), fastrpc may temporarily fail
> > > to retrieve DSP attributes during boot, resulting in repeated
> > temporarily? What does it mean? Should there be any sync with the DSP,
> > letting the FastRPC driver know when it's safe to retrieve the
> > information?
> 
> Hi Dmitry,
> 
> Thanks for the review — "temporarily" was a poor word choice on
> my part, sorry for the confusion. There is no boot-time race
> that eventually resolves; let me walk through the code to make
> the actual scenario clearer.
> 
> The FastRPC misc device is only registered after the rpmsg
> channel to the DSP is up (fastrpc_rpmsg_probe ->
> fastrpc_device_register), so the transport-level sync between
> the driver and the DSP is already in place before userspace can
> issue any ioctl. And fastrpc_get_info_from_kernel() already
> caches the result the first time it succeeds:
> 
>     if (cctx->valid_attributes) {
>         spin_unlock_irqrestore(&cctx->lock, flags);
>         goto done;
>     }
>     ...
>     err = fastrpc_get_info_from_dsp(...);
>     if (err == DSP_UNSUPPORTED_API) {
>         dev_info(... "DSP capabilities not supported\n");
>         return -EOPNOTSUPP;
>     } else if (err) {
>         dev_err(... "dsp information is incorrect err: %d\n", err);
>         return err;
>     }
>     ...
>     cctx->valid_attributes = true;
> 
> So on platforms where the DSP firmware implements the attribute
> RPC, the message is not printed and the query happens exactly
> once for the lifetime of the channel.
> 
> On this SoC the DSP firmware returns a non-zero error that is not
> DSP_UNSUPPORTED_API,

Why? Which error is returned?

> so the else-if (err) branch is taken every
> time: valid_attributes is never set, the next open re-queries
> the DSP, and the same dev_err line is printed again. On RC
> builds with metadata flashing enabled, several such clients come
> up at boot and the console gets flooded.
> 
> I think lowering the kernel log level is the least invasive fix.
> 
> I'll respin v2 with the commit message reworded to drop
> "temporarily" and describe the above accurately. No functional
> change beyond the log-level downgrade.
> 

-- 
With best wishes
Dmitry

