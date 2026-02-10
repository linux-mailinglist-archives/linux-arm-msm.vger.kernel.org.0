Return-Path: <linux-arm-msm+bounces-92502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLCLC8Eli2mYQQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:34:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8008A11AE36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEC5A3003EA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 12:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D4235977;
	Tue, 10 Feb 2026 12:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCQF0V8o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HPxnxGGQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F81223741
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770726828; cv=none; b=N92cnBWCVlztMTSsZeMx6krEE/Tswo1QFEIbREyiehwtIhadHm6s/Te5nVYK4XsyUb0x2Ji/suDddVJoWo97Imu26/Q/XKIlo5hC3mBezT1vcbx4x2tJ6k5bqti94jU/Uq0xguBtlB0KYvCGzdkv80124Bc+yWAedOtL6eVD9Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770726828; c=relaxed/simple;
	bh=nEnMEpIy7bXiMDN2f58KVQI99EdSLQnaF7tpywgpDiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOkI5DO3Exb2KKrHngCCQehxQoGY93UJUu5nCMf38XaSflOLc2OwLZTEPJcuclQRjK0RJgof+egCiD7iey2LrqWsendReLpdLfvJk51jot0aZZHlTryAzAgw2ap6TMvDtnMegR63B7Ulq0N+Nq9REeQbNUmOQMoVEuQkD3kMZMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCQF0V8o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HPxnxGGQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7Z2702169225
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cmAMllo7XwjNifb2u09poEuqz7GlThZP3FUE15w3yQ0=; b=WCQF0V8o7Hkjf5nG
	wCQf8hSZbenhgBVts7fBvgH5GH9l/YbQ3RpmKj1/rd0L7KM6Ef4TF/2RkCmeQTig
	/pHxJOiAt+7GjSVQoIVIJ6fJkp+NPMKqllH5AeDxGjr4TiFBCpmcjHoD8mjTGgMH
	RhbcYfQ75ZmND7h7RpRY7f88DYLePN4zj/K5QHMEv8ieNzcl0pKNMC1kk2Lgy1pI
	vcUJVgV1VEFmEayS0ouiHIu9o+L4wvyuDP1bcLIhgFI5phYD8A48gaHy9eP0KrzF
	AAp0N3rY+qUjzRHCaxMDHMlk/ESzVce+4NcOqd1wEmK1oWWxLdAjsQ5L2F07lXr/
	m1HJHw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c80drrxu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:33:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52c921886so88078285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 04:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770726826; x=1771331626; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cmAMllo7XwjNifb2u09poEuqz7GlThZP3FUE15w3yQ0=;
        b=HPxnxGGQ0UhhlaziIw9QfkMrtq+x0JW+5AfS3hAylrZ5VQc4bP82K2pJa/Hl8TniEo
         EsyF/1+BKH0MR+y9HNNHxjxVq/kTL+wXrWHLBH5X3fLeby+UMD4dTLZqoIEKZ6PDheJb
         LazZtL48p1wxpB6l6Pu742p6oF8vR6DmU+IuipVjonGLavYVoRbFiT3JCSU+E1g5VuW+
         8SlYgkoAHDPp0rJeMAVYZtFpCOAq8j9juQyPcjfdO1WQ14brjGRcNqpultAg1L2mLPzw
         kIENBnx1Gg3P/hxIodmpfQ8gDbgkTQMcRHWYLTe6uq7nQkW74G2jmFeaXtT9s/eXrMvj
         2xOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770726826; x=1771331626;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cmAMllo7XwjNifb2u09poEuqz7GlThZP3FUE15w3yQ0=;
        b=QnQ9PwU6dL59UpXaglI1KJfDC9NhxF6dYFxRz/gKGKheSeUcqVMp5qjOQ3CXONWUXi
         gFtuBgFmHziAHPJeZBtWC3Y15zoD3lDpog41F5cb3IQyPI90g5IWwprUN4ZOX+ss8XZY
         aic9YExc8gDYmtGAmLCBvbsMHczC3ak65AZGXP183mc7GhPlk0+zzGlS0kkOVfdOUJu7
         UjaG+vEJ21dJrnHnfqYRREQ0/rckdCUOKlM+QWqNFR5LInlvUO1Wdrf8QeNqPAK46nd0
         CU9W2NlzO8oOR73ovVFxtdimJsBi6heShepXWGTufzKfyDd5mnNCRcuQi+WPTzsnWiqj
         Gn/w==
X-Forwarded-Encrypted: i=1; AJvYcCUltxIbFA9ss1RZHoSUtdTELVwI7qbi/ITnf/VjpsYMWAX9DJJAicT1TYYiipgbm34ur1gA4V4OSMu/De/Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwFYgtxA967WCsPBGFXzabvkWIKGJbKQe3yMK8qMG1W7HBfQoyX
	dHQB9/asoDxtJdgxSofJGLK5FkiRA1xrCgvJOGD8BN4xYdbVkV+ag/8p2upAESbBo4sLPs2GJ2w
	i8C8iJogfCbkjkuLkLYuGxGBFxGjHFsHze2PZEQLawRMIvCex3wQmoltxQy6ONeSCkZi4
X-Gm-Gg: AZuq6aJsReqiPzFfb2O534ASjkohMxQwLaONTUr3JZSVLllfjoLT3zs0P5MLoIaCWC2
	cVKiAkWcOmiVuRqhHf4CkozlbJnuiRA/W1ZzGZn/rFovh24rJXL33OUZvelueitHtzATbbXEGGh
	/7U6/5L04t2Vn9pxIyuxmhSKq9rQXmh51VAK1RCLPwodT5LNxEpu5CeLJIKnfQ4PlC/89KVL8Af
	S4L0EBWpxHU86zQIypuaD8QkVKtNay2bsZLRMLOI5g5w4IBvQHdw9wQccTN9q1hVJWwRo8rmVP0
	UAyrMmG1Iy33reLjJj2s6nX3DUoa+nU9gKlA88ZdF/CAywVCZhy1llhv5XhIKTA31DcPGKWBT/t
	8RjYfvk9HN0wBj6pVgxY9RMkjhur639DrPkKZT4Cm54iDMtAsFwZEHrDKLE/tt5Sf3b2CC4dd+B
	IjazoJy9HEKfT37sWhxLPToGvKxkFbDryO7i4=
X-Received: by 2002:a05:620a:1998:b0:8c6:d309:f9c0 with SMTP id af79cd13be357-8caeeb5112cmr2077846585a.8.1770726825784;
        Tue, 10 Feb 2026 04:33:45 -0800 (PST)
X-Received: by 2002:a05:620a:1998:b0:8c6:d309:f9c0 with SMTP id af79cd13be357-8caeeb5112cmr2077842185a.8.1770726825292;
        Tue, 10 Feb 2026 04:33:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6f46sm3239140e87.10.2026.02.10.04.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:33:44 -0800 (PST)
Date: Tue, 10 Feb 2026 14:33:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] phy: qcom: edp: Correct and clean up eDP/DP combo
 PHY configuration values
Message-ID: <tqbrm5riryojhpdvu7kq5kcjftu6ndkmxr4bn3suiq5l62hacy@s34uamejwvkp>
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-1-231882bbf3f1@oss.qualcomm.com>
 <57bwrceuqejzliljhrzj5wfumtr2q3dslgmjj3vd7masafi4k2@dskfnosor553>
 <23930db0-730e-4f99-a661-262b15f1a8ac@oss.qualcomm.com>
 <w3vmcgeh5bw7lfuyv7ziiw3oxpxtjyqmojddamjo5alz4nv7ld@ytgjwdhecfua>
 <23e007dc-4145-4260-8810-1e98e533b1b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23e007dc-4145-4260-8810-1e98e533b1b5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEwNSBTYWx0ZWRfXyu3lgbWgCW/O
 5vLiwQs6jkWLjha45ZIhCD/DClH7yJg9w7Bg97XeVOwxz/n9h4FvkKyudf6EvNyIAidUr+NVyTB
 3m/K2m6FamUivH+X1fDbVwvCqy6k5BglWEcpBom6MvAQKkO/Ax9vNP9mVHNmiW8+VbcGbvVSKjG
 QKaHijmU7iTDxpNl6oRKu8lMiPuQMV9jeTwtW8GeGU+YCnvw28gy2902pFF08PQpylojby/Oc+c
 daFf2FWR8bwhzLyCosYaZv+kKvYj/Rob+BT6+Z1C1GL1XshKOerpamVJk+/4Gum01Ia9oTeMkMy
 pLge1Epb+ORn7ZJD7eCoLNbdANONMti24KVrfnyG53aHwsEPQ6PXlqT9UqXZf3lAg7Ur2xsdj24
 Ktd0x1M+kP5fz+DDu81R1L/uDokjTeFo468k+p3mF4hMgPDn0PUXV0PPqmZ95ksHfSgEw3q//mb
 WTdLSS215ZnbXIwO6oQ==
X-Authority-Analysis: v=2.4 cv=fd+gCkQF c=1 sm=1 tr=0 ts=698b25aa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=2j0BlZbzurhpY0H5GaQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Ri-fHR71mwBExqZq3BY7XtPGPg5vO_JE
X-Proofpoint-GUID: Ri-fHR71mwBExqZq3BY7XtPGPg5vO_JE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92502-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8008A11AE36
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 06:17:07PM +0800, Yongxing Mou wrote:
> 
> 
> On 2/9/2026 8:47 PM, Dmitry Baryshkov wrote:
> > On Mon, Feb 09, 2026 at 05:52:22PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 2/7/2026 6:22 PM, Dmitry Baryshkov wrote:
> > > > On Thu, Feb 05, 2026 at 05:20:53PM +0800, Yongxing Mou wrote:
> > > > > According to the current HPG settings, most eDP/DP combo PHYs can reuse the
> > > > > same configuration values.
> > > > > DP mode：
> > > > > 	-sa8775p/sc7280/sc8280xp/x1e80100
> > > > > 	-glymur
> > > > > eDP mode(low vdiff):
> > > > > 	-glymur/sa8775p/sc8280xp/x1e80100
> > > > > 	-sc7280
> > > > > The current driver still keeps multiple versions of these tables and
> > > > > doesn't fully support every combo PHY mode. This patch removes the
> > > > 
> > > > See Documentation/process/submitting-patches.rst, "This patch".
> > > > 
> > > Sure. got it thanks, will remove "This patch".
> > > > > redundant configs and keeps only the sets we actually use, matching the
> > > > > platforms listed above.
> > > > 
> > > > Should it be combined with the 3rd patch? There you sort out all the
> > > > tables, it makes more sense to review all programming together.
> > > > 
> > > Hi, if this would help with your review work, I’m very happy to do it.
> > > My original intention was to do some cleanup in this patch—correct the table
> > > values so that more platforms can reuse the same table.
> > 
> > Fixed should come before cleanups (so that they can be backported to
> > stable kernels).
> > 
> Hi, do you mean the second LDO patch should come before the first patch？In

More like 3rd patch should be combined with the first and come before /
with LDO fixes.

> fact, maybe three patches should go into the stable branch. The LDO patch
> cannot be used on its own. On both sa8775p and hamoa, their eDP/DP modes do
> not match the tables they are currently using (hamoa should use the eDP
> table, while sa8775p should use the DP table). If only the LDO patch is
> applied, it may cause link training to fail.
> > >  From Konard’s comments, it seems that the HPG table may not be the most
> > > appropriate one either.
> > > Maybe shoud first determine what the correct table values should be.
> > 
> > Please follow the tables for each SKU separately (that's the 'fix'
> > part).
> > 
> Sure.
> 

-- 
With best wishes
Dmitry

