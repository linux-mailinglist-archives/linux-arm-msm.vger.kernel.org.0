Return-Path: <linux-arm-msm+bounces-117168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7n76LRSxTGrtoAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 09:56:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0B8718BFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 09:56:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Ix9H5hi/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dgC7pnZZ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117168-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117168-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8E533106249
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 07:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C6D3D4129;
	Tue,  7 Jul 2026 07:38:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CB43B892D
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 07:38:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783409925; cv=none; b=Xl45vli+DjIkQSbMDwzG7dv7Qv/HKu03g8L83q9wACZrm4RiJt6citDOb+ntzDPaWvW959YcSSgrNG82v+7cscrVY+5HjceX5574+v6U88JVOxU55VfLO5i9sMl3kHCcYCexsAVkTacrQ0ZfncXzH9Rh1rZ6tAOY72ejVBT6wb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783409925; c=relaxed/simple;
	bh=/XtzSDe5f5CGsYD8iKRTqbppL5zjqjNfhNi8d7rmSq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRoMwx+9SfI7/CQnr7S6DB2AHriIYfcVxtMrg8yzOWjqCUzj9mbZ1MsnwVNg4O52FZYym22hXTB0On9ex9bz45aXk9jpq+G18Z/1y46nSio/Zv/sQmmfkLVbTKmrEPM4bY3Qf7KpdEujASK0wys2srRCx2uK1zr13VtqJFG2W4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ix9H5hi/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dgC7pnZZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748g6L2585207
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 07:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E2jWfFrNaZAaGPBLeNXR6DFnMGlEdizAPwinA4p0bmc=; b=Ix9H5hi/FvnjkhJM
	CgvTpORMh+WDDvscVJdY/s7m22myvU/XwPPelbKLA9m4tMIpAJCzXeQiiZEPUxgh
	e9Ewksvgo6vxDgGM/wEg2IZROirGyTznKQdO6XRJkCo05/N4raLV7/WvNdQiBGyH
	EX2/iMQerrQsT1yxjrOfxeVa6pvdU8H8TezaVJQqEIpA1NhU3LIH2yvKJVIYTqCQ
	LwgTh/Fa89xRdmEnPLWD1lm7+SN4Kakcyx5QER2spADbJ/NgmIt6J90hkgHHoMVi
	ESRg6rewBEddvobEMKLDCChGg2WpfmBiJZNBOE3PdloOg1skpfSU43Jblyt5ogTe
	otxCyA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t158srt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 07:38:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3811279d51aso8092477a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 00:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783409922; x=1784014722; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E2jWfFrNaZAaGPBLeNXR6DFnMGlEdizAPwinA4p0bmc=;
        b=dgC7pnZZWnaeBzpNdkgpQQMfpuzGsxn0AByvQmo5DNQEi6vjHEi4fYikYyj7jkLJW0
         L9H2yvYXCdER81yS7gqSautgUkmz0xECX2gZYWEheAinpb9gHjDMyMTxV7boIMa+vtA7
         zdyONtLKaBqtHBIB8pxb00Q5MYXyzpZT75c7hQrYkAYi9UQLDvioEW0fpa16JAix7/jY
         pXbk8eU8EaRgdsYcueFufcTNx2Ys8YuVIHNFaAqqtJKIR2VEtS91kucoIaVB/jtB8XjN
         2YamFsQDkfjXRcOnpSKB8Ihv0CigDe2pIav3DzsMak9kPmdE/9sLr1eWj2e0yFgKlq9W
         KSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783409922; x=1784014722;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E2jWfFrNaZAaGPBLeNXR6DFnMGlEdizAPwinA4p0bmc=;
        b=CyBpnT/vRpMTtDm0p7dVo4MIB4aHdjTq3VEaqxkiMEqGR6C6XmHzu2AILOBNbNfl+O
         0mZYDQUft156zFV794cRircgBrC78Pzm8qDp6aoGhAgzDV1TULwezkcbChA0Oeb3/N5l
         x9lYlnRw474bUQI+/9uz0zJTZQCyJzRAZiFyy8P/TaxvugKtrcKLhoxzjYqb9N5G4u0U
         vYaQ2DYdci7g/8kqY0spTOuCbG6ea6RsZ7yNPoD3ne/BYHd2IEW50q7WlcFxyfCabp7D
         QvsEgZJYNeGvHSsNezW3v6GLNrqwepTJ2+lsPLC71NES0e/+ADiK8o6hTPJ/fwaS1IrU
         gQVw==
X-Forwarded-Encrypted: i=1; AHgh+RprQVDbjDlTBjsujY22n+PRUCVbR3g7+gHIez7UUtANOFWE+A6pmrG8xxKUPgPHsEHj7Lx8cdqv5EcsTTwo@vger.kernel.org
X-Gm-Message-State: AOJu0YzfQUAD3yS0hwYtlmRlyjnIWmgz/Z11z9DEMkZdjoptvHk3lY7X
	B81KFGVVqnSoWCEJBIIEl9fQuRsSl+3tbWfY+ptmVb6A4PhxTLwRSkPqChdO7wrovLgwGsaOLvE
	ZswClr5jvw9rotyE7tjFGLLHwmjTnsCZxjJYX9pBOd/ZfauLTouZY5bx3Gso8YunYkIZH
X-Gm-Gg: AfdE7ck8JCVcIIGJjLApY18buXOEo49qPTgRc/LCljggWHveQYQx4UixIRaRMHLI5Lo
	tSFMe1TPqvjejMzIxA3PaIV+aNRQOA82oUrmw2r402B0JhbLhSnXqrLg1u4xlE+RXbqapuyOWJs
	YkZO6rrPEw7ABHFXUu7ReGqs1M3NKTFjfs63tVPYDdAHXImYytOIUJSF9ggu4TydlJjlSCG3DRU
	65UOTSYgscuzSxm4LwHMZ7VqgcW0lelBwjWWnzN26SU5Z3ZMjbScz3HIUQnFqtayg24T2WrSpmc
	XmkdE7SJta7S924HzknNRboziCYv1lzDBOKanMWo6ieqHPb4XsrZVbdD8yWMtCqlSOS9IJbOVCI
	licEhEUA/A0qL9LqIwDe80PSKHtkuE2ae1vgb5g==
X-Received: by 2002:a05:6a20:db0a:b0:3bf:6edd:4dfb with SMTP id adf61e73a8af0-3c08ec76ebcmr5246928637.5.1783409921813;
        Tue, 07 Jul 2026 00:38:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:db0a:b0:3bf:6edd:4dfb with SMTP id adf61e73a8af0-3c08ec76ebcmr5246882637.5.1783409921231;
        Tue, 07 Jul 2026 00:38:41 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm7670408c88.14.2026.07.07.00.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:38:40 -0700 (PDT)
Date: Tue, 7 Jul 2026 13:08:35 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 6/6] firmware: qcom: scm: introduce keep_mdt_buf flag
 in PAS context
Message-ID: <20260707073835.ycluj4t3stxldw2i@hu-mojha-hyd.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-7-mukesh.ojha@oss.qualcomm.com>
 <yg75raxv5nlbcg4jwytba2ijqe4qsrutw3i4xtc6sxenbnaxqk@fnutisnlywf6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yg75raxv5nlbcg4jwytba2ijqe4qsrutw3i4xtc6sxenbnaxqk@fnutisnlywf6>
X-Proofpoint-GUID: jrpU_F8NLtEOQMsbm9E0JwafR4YSFQYG
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4cad02 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ZEZ9fIX7oo3zG9G1BFQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: jrpU_F8NLtEOQMsbm9E0JwafR4YSFQYG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3MiBTYWx0ZWRfX4krAxvv/0w5B
 KUgvvffKYJq65d6deO+D1T3Jk5JACzZ0LsSSLpvMAVs+Jx3DbKBHoYMWUWDt3KeTfXnv5bJzxa6
 S1Ju1ueKxuGbSzgRxZlATiuStsUkNyU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3MiBTYWx0ZWRfX4rGIYEfsjirB
 /D9+gaeGUcfwJKrH+GDbIcCM6PTeOgiMIvQtsS9ZDJ5kvn8LRI8Kg6gpqGAfrkDeQHiof1iSmN3
 GAoAo8Fyn8cZnujLb+blE14c/+/eTnyUFFiHwHQncywwOW2SWr2P7xA2Umh20khwdxNo0bLG9SC
 JF4GXclOwcSDLGPOgIC3Gbn52mE8yLi0E3rFVfg/simx3/gujW59OGQHyMPT9ODXNjrldKsihSA
 c+mFPt1pYoCtLW0MYa1tCrckAv5jF14Hpw5hlYLpiU4VLppebEJD6XGV9JrF+1EjrDmesDPEAgT
 HO4edqvmu3s8HreeuPZ7h53+Wk2dg5aemsjY6H/y7cDQzgkZHRWisGu6WE4ysFskAtFPhtB9LbH
 Iv0ImM48pzJqzgsceACEyZky0rro7XJy0C4Vgqx5iyvwllxZ8hZrI+8kbGHTWeiZTlBzdTjQuci
 akVvxIEIEQAEI9jtBNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-117168-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,hu-mojha-hyd.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C0B8718BFA

On Mon, Jul 06, 2026 at 09:13:22PM +0300, Dmitry Baryshkov wrote:
> On Fri, May 01, 2026 at 12:42:53AM +0530, Mukesh Ojha wrote:
> > The PAS image initialization path always retains the metadata buffer
> > when a valid qcom_scm_pas_context is provided, even if the caller does
> > not require it. This implicit behavior leads to unclear buffer ownership
> > and forces new users of qcom_mdt_pas_load() to manually release
> > metadata, which is error‑ prone and incorrect.
> > 
> > Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
> > retention explicit.  Metadata buffers are now freed by default and are
> > only preserved when this flag is set. qcom_q6v5_pas enables this during
> > probe for contexts that require retained metadata for subsequent PAS
> > operations, while existing callers continue to work unchanged.
> 
> Would it make sense to make new API backwards-compatible, so that we
> dont' need to touch other drivers at the same time? It probably means
> adding ->free_mdt_buf flag rather than keep_mdt_buf.

Only remoteproc peripherals need to set the flag and do the
release call later, while the rest of the clients like Iris, IPA,
etc. do not need to set the flag, which is aligned with backward
compatibility for non-rproc clients where their metadata memory
gets freed in the same call where it was allocated.

free_mdt_buf does not look suitable, at least name-wise, for the
reason that now I need to add this change to set this flag for
all non-rproc clients, while with keep_mdt_buf, just rproc
drivers need to set this flag which will make this backword
compatible .

-- 
-Mukesh Ojha

