Return-Path: <linux-arm-msm+bounces-99884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEXrBk7mw2lvugQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 14:42:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B387325FE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 14:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 603C132A1DC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA723D6463;
	Wed, 25 Mar 2026 12:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5ETOsTf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHkh235G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF08347512
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443452; cv=none; b=EplQvNdYZD19/rABZsh6reWFyJAX/cIKiYNHjNjQW7krki0xoXXp6F0xH4BCZTW8eHL9out7M4j5RA0/sECPRoRqVgsJ75b974xusDtLppnuCJC2evAAL7oh9odj0ubZhC6Dlh/hcFTtWjhemzSUS/EbpoId05brzwtG9la4piQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443452; c=relaxed/simple;
	bh=Ton7OXeU/OGHbpaFMxjuPdZ7xpVrD9m4vETwWgal5OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bV8vH/xTXWR6gUR54g7cI5DNeQbrRFjptGBlZg4LLCfanXOi4dqnlhADvsUwTs9z1v6AkCGbfVbECtB+RRO7709TviLwkKouOZl5RJPmr7TSWKY9un14j0Mwx1c0XUGhXzcMS94VBsdvBRIaFmcE7msi5PfIg2zA7K0djf4Fk/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5ETOsTf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHkh235G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBFws5720346
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yh8YD1fe3q6lkUTUbwyQJcm9o7uQqNCFZM2t39dKUzM=; b=p5ETOsTfWmUVZVfl
	0Uc+mxIM/uGruS00KaZoCe8YlqrhNP7if8zoffLbEnWqlFvPGCAv0vE/xc7r6bFS
	Iw0/k/O6372oS5ziqufglczIPHkJgDyci+D9+Qvgzc5aTOdW0/WNYQa/TFjKHgem
	Cq8iA+a+HS+g2wGMc3QwFtTMcDTDlv80zjtoZeNYqtToRWlT8ZUF7G/QK/7sz6cf
	91K5Rx7Qh1A9zZrlXyIlxRAa0mvd7yDCZLuW4D44wdi79T20jvwwFxU/TbKXiwz1
	4sWhPGvAzM17k7MMlw+bKzJc0IHKNi6/aayEe3TOZM5CQoqX7sNhP50FDgAuaQPi
	lTAflw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dm2rjyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:57:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c646e980bso1249840b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774443450; x=1775048250; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yh8YD1fe3q6lkUTUbwyQJcm9o7uQqNCFZM2t39dKUzM=;
        b=SHkh235GxTXEVEq5KA4W8nXUS9haK8LmkmM+yXLUyoFSkAeVRpW2k1fbuwCxJabMR2
         I3gHZeaBWhXcSH9+QieGpYlAfTdFMunB2Z34TdlVfi2h4Dhf/6w0u+sCzvyoi885VwFK
         UjtYTtgiwWANJd54MsoHxGdNS5Qbg4Dye8OZhJ8gLBGOAfPAnsV/iw88cyyNMVwaBN2R
         h1DIN4mghRaFvVMT33UU4XPNosa1oCJWjvTjjLnfhoZzhY2+b5mkmHfzBvHxnATVZsm/
         lV9W9xhvkPEoOtvobFfZ4LKkTBUBrBRahZ7lThWz+HsAqW0pXRo1TmTQ8GLU/9mzbtkS
         M6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774443450; x=1775048250;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yh8YD1fe3q6lkUTUbwyQJcm9o7uQqNCFZM2t39dKUzM=;
        b=G7qjt7xQUbYNOqhP1hWx2KEMC+Jmw9oGBoKgP1D/x1/Lk3pKFwC56v7oq2yP+yyGf5
         nWQy08pKUAhOZFGkZJAb0QcRt1CibeOcNeLXkrWDatORU93ULg2AT28mNlynMZZns8Jr
         2RiBxSwyT2qWahImSXI7qipiP6xTZ2Gnp1y+CQr77GqSZqCUQQ6OGcxqk2mzpqKA9NYe
         BzO8jL4MUlZhRwk+PnSKreY0lmaIlS63N/h3e6p411QxbvhWo0DpRYhPc3J+9RC9LJ1J
         lEaDYf6WnTc+NDCGlIB2O/UdflNpqPvS8Z+n9AuSQa2U8cv2qkYoqalH4lZKAId10GUx
         JZrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/J//2826mwsCw8ks2XqC4kMS643d89FhwCOBJAxFrFWqkxb6XTJcN/SjclFmrxp23m4NBfcmnZxANNk1e@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo/k8iH7CSItCow/OHuzhRyVS5W03wckGT1yVvxx0088mHvCzZ
	C/94pVPXdBWLgFW1999pRE7GjYxPinDIZOy/MNbSc6C9sQ3TQAG3aI3T5xpc4TISpwLyFBpItr4
	+No02G5d5rtCnTKAedbkn2D2IMLbcM5RbM4mtLb4+RSYfL4wT3QqZnCt5YdyO9APtUGZU
X-Gm-Gg: ATEYQzx/WadUJvFzKKJIfY0lAiAUMl//0Zs6/ksa77A7SuXftM+HzY48n1gt9WjvZQz
	IWvycWzo5JIFltOl/aSqemGNyIGjZw5SnETFb0CWBkQHwVKtFu8FjfEgpXHm8RhE2jTEGuwt3Y6
	Ke3TO2FwIYdvtBW1pscoPWr9hK/l9O8ltaDppqzcdB/tNdrgTiZW8u6NONohw325BPI9DllFnU5
	ybaTuD1SrqFt2ZEwBZbXu+c18YTxnHKVPG+Im6Kkgijev1v6BTaZjcILxQtTWfrXfepbwX3gXZZ
	ZuucDqby4KH1eAiF6+MP4y/XCGw2WC7fRoQeitncyCE1Xdjs4nrEfd7skYWT1IuJEogGLAleR4Q
	mlVP0uRgcLvGq4v7JpsaAbEeLo2ikMTwSSkNv
X-Received: by 2002:aa7:88c7:0:b0:81f:3afe:281e with SMTP id d2e1a72fcca58-82c6de8c9damr3447040b3a.3.1774443449596;
        Wed, 25 Mar 2026 05:57:29 -0700 (PDT)
X-Received: by 2002:aa7:88c7:0:b0:81f:3afe:281e with SMTP id d2e1a72fcca58-82c6de8c9damr3446996b3a.3.1774443449089;
        Wed, 25 Mar 2026 05:57:29 -0700 (PDT)
Received: from work ([120.60.74.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c66487634sm4699158b3a.29.2026.03.25.05.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:57:28 -0700 (PDT)
Date: Wed, 25 Mar 2026 18:27:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: qcom: Drop the PHY power_count check
Message-ID: <vv7uzpybgyea7qmwryslxgfv445d5o5bx7wqgfjxxggechowwx@zi3g66yxgmzz>
References: <20260325120122.265973-1-manivannan.sadhasivam@oss.qualcomm.com>
 <20260325122922.wzihturkkfpr73qn@skbuf>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260325122922.wzihturkkfpr73qn@skbuf>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA5MiBTYWx0ZWRfXyg1ewnM4kwKd
 HQKtbdtDHdQgmIJBJfnljZ+ezmk7sw+m9GqFjvj0L43/1fWEet/CSDCO7dGl2coEZB2iN2cN+Lz
 9WreQIRikniaxS4rsBWgmBmQ9ondls/M4zLhHaoPMo2J0AiXuRf2EmZ3mjjGi6aTmLqK5BxVliY
 RdJN2i+CjaIY7e+tzGnV8qGB/cJnTvd3fcafWOgAR4usVaMw4DsW1kJdIOThXMI4ZYvzWEpp0Bd
 uW6HNdXRIFsWGTFxFDr66FTq9m5OGIo+M1Gdq+a09WnKTx13c88xBx7o8KbxwJNpRjbdc1RcC+h
 rqYS+vW38k3+lBkKf/grYqkfxAd/rDMqbxE0sSF3+uoDMj3QRugxcimY/UOXNiDECNzujvB/VNE
 spUsKV6HMqZVjwwW6NijeBUNzVsZcH+rBcvtGvjux8oEgFRKOmYINbS3y2lI+6zlL3cKGbqWYQ8
 EqAcfF/WIjEak99XQAw==
X-Proofpoint-GUID: cILjmarN6w8JxCz7xUlM10qw5OeStx2T
X-Authority-Analysis: v=2.4 cv=Fo0IPmrq c=1 sm=1 tr=0 ts=69c3dbba cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=DfnuZq+CPLWApegUcJV09w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=8sJpPIWwF3nvvNpkCuQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: cILjmarN6w8JxCz7xUlM10qw5OeStx2T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250092
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
	TAGGED_FROM(0.00)[bounces-99884-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B387325FE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 02:29:22PM +0200, Vladimir Oltean wrote:
> On Wed, Mar 25, 2026 at 05:31:22PM +0530, Manivannan Sadhasivam wrote:
> > phy_power_off() can safely be called even when PHY is not powered on. So
> > drop the PHY power_count check.
> 
> Sorry, do you mind writing a more elaborate explanation _why_ you think
> that phy_power_off() can safely be called even when the PHY is not
> powered on? If 0, the power_count would become negative after
> phy_power_off(), and a subsequent phy_power_on() would merely bump it
> back to 0, thereby not calling into the driver's qmp_ufs_power_on().
> If there is a regulator assigned to phy->pwr, this would see a call to
> regulator_disable() with no prior call having been made to regulator_enable().
> At the very least you'd want to explain in the commit message why that
> is something to be desired, so as to give reviewers confidence that
> conscientious thought has been given to the change.

Sorry, I just rushed through it. So far in my tests, phy_power_on() gets called
first, before phy_power_off() in ufs_qcom_power_up_sequence(), so I mistakenly
thought that the clk, regulator disable APIs will silently bail out if not
enabled earlier. But I was wrong as they will just scream out loudly with
WARN() and that's too bad.

Though I couldn't trigger that in my tests, I'm still not 100% sure about that.
So let's drop this patch and proceed with your state tracking patch instead.

Apologies for the noise!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

