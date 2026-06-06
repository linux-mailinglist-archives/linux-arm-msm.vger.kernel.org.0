Return-Path: <linux-arm-msm+bounces-111491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ltJnE90KJGrj2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:56:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB5864D4AD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:56:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ji4Ebhor;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JyrZxoCS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111491-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111491-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17EB13013D74
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 11:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C512383C94;
	Sat,  6 Jun 2026 11:56:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B47330C63A
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 11:56:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780746967; cv=none; b=uHkrXOJlZDd0Lhzf6NEatKsjUneh9FA7TDCs82VFLqQ4jYPlIde4Hx1RDQLCA4Va3kRjFe+KyJwEl/FIHx6EzItdF4JYTErxoNnhalkhUHkddr7CYxbw9CneSYudExL35T0Jo+v92TIeVBhmjkgFLueVA4jlvKu2JxJU2Y1am7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780746967; c=relaxed/simple;
	bh=PMfov7kqtEiw+uNQCzzp7j5Ye0VhYnFA5C6bFMo86zM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5S54+utLHKD5hRvyXo13V9YoA75AjB/VxWxxzE3oFaBFWsSbJJGHC2kns+0klht+OQVxkX9CaWF6m+j6cJLlUaWCpqCb7i2oIEUa0MndnQ231ma+QQ1GmQQn1Ng8NyOdc9sohYmzeHDB6mf362jQNTHEZAH1EAyIu6sfbTrPBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ji4Ebhor; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JyrZxoCS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BDePJ1256881
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 11:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RIXHlEmiOyjtStjr6kT5IXgl
	6G96mdH3jpsHFQODkAE=; b=ji4EbhoroekwSqzmXA9EgBjdEzBGncm5MkpH68lD
	GJQeMTGcPEcp1JbbtwGUYYr93TQjCs97LCPh26LuC9fPpXwsoFfuP5vq+ciAbliU
	gvMNl/VnJGwSWEhxJUB/gLQyNLpmAaPgtx0IpZ7oeghQgAYK5JUdgNI3vqBDStgZ
	GAZcskU4EruAVFiV3Tp1cdRqnUNpkn8AxYjmQeipCiDzdrtBNoOq81SvPZIEt7hx
	S8h3YJ27Hhpww86wnj5y9r+5ljTw8FVm8IUC1y8gHbNER8bazJDELHNIx0U9DIFP
	JhEqOLm0nz9GdzDADv67J+whP87dey1eOKV9Ju6ami5Jfg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadrt70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 11:56:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cf37fe12faso1263223137.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 04:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780746964; x=1781351764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RIXHlEmiOyjtStjr6kT5IXgl6G96mdH3jpsHFQODkAE=;
        b=JyrZxoCSNB+xGoCCrUFrN02Lqh7+dFBgsnDrlrlviaroMJ+0US56GwyIHIlUTnqQUy
         p6q35Gh1X35YvRCtymwNo2U6OdQEUS01GRSMsMdOyWsyvSC+BCtvKQfoP+4kzVREhs65
         3nvRgjItl5nOVHvF3BOtgkjYxg5fklkZiYECaWVwIZX2gXLdXor8xLEvLuGTfckzkrAo
         KHnuIJTtsyIs3CL+BFQRwzhiXPCCZalKmGaqZiGzJT37wqibfSDWhmniomzaoRVmCLLG
         ONf3T9L0whAUzxUkGGice6Y/Y7YGJpURyWyXFj3l4yUM4kcIoXwCgFSwnLRLs90UWokI
         ug+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780746964; x=1781351764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIXHlEmiOyjtStjr6kT5IXgl6G96mdH3jpsHFQODkAE=;
        b=VxpALQrxKJoTNOyUdVk+WUzajssgmg0GXzgSCuEKsxcMBZQeB5mVpGv3tq1PdWJKQl
         a45/Kgne3XTpyJ/8FpWGVWFAyArjg3oVDQbotXcPCCEz/yboMlaMmt6k1HI9+a2Kl0Zm
         JE/0r26fn3mXj/9qI0M/XE5ifZL6xSD4joKZY+wlqdGEN6u1QZT8Rmarp1Nnf26TPEiS
         1pcVU5WH9k1tiYFYmGnH8l4za5jxka7EoRcmlOH4vG1uwO+9/UCwS3ZJ5BtkpVW/gtnR
         n9VZqBQ2dI8sphKlBcyHWfrVZIs3TOH8jx50Q5w6Fpm2zEhdDHfOyjpkkXcmpe7Qx/KN
         CJFw==
X-Forwarded-Encrypted: i=1; AFNElJ+1oifqu93+sX22ddHMUK/lbXiF+JoCF89eWY95zdQ8voAXjb6J19GejyyEtlwzwI3WwnOmUi/oZsbDeaRv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1mLIiTE3XvEqRJVQ0b0R+gGP510XcDarpgpMyLcudFkzNtJjV
	8dm3jUQDtiHcQdUh27rXw6ZDw5MMLkNOZiNIlPmSQblcjBcVCtQHrLBAY5XFfvGVummE0WZDe18
	Pi5XwN8rC1mHGr6tzEBU+Kv/65qM5VkOLIJ4YHtJRjOAfu/lxA/VYpSlYjaDD6aA+HeKF
X-Gm-Gg: Acq92OHCb4pFd0z7zNeCyykMznPpuXlGnFo+ra6xjoLaO2UF/1Wr8IYEA+8ZTBhEkgb
	93jeQGPdIyZ2vRf69IauXUlYGXGHaqq9snjteZy/L6z3ZlIA3uAzlBjih6jj2Ch4MEK6R8DOpLj
	6hl5RdT0YUBRGI6RE/eIqCt5XesFB7NY3b+eZa4Nv9QP7b4OYWPR7CxNRQJ7PGo2Y7qzTFZpNlL
	TLhDsZKVR4qoLcDUGTJ07O2O9ssjJJtisYv3/VW5+9bVg94A+xGb3F0pROYO/PfbDFeo7+1WK8q
	kqrkxVCmPyaZ2JJ3pu5aiyQucdhYpGeSsTImW2MKzG/1kfGys5LAn31PjuWhJaLfmhPd0hlzm1i
	NMpJaCHnBkYh4CgaAatPOK2f0QWjVksD5d7CvmbJgtc2GY/VOd1WFXC2bkgRgcIdVHO8dcTJotr
	/3aiBo35/qy4E1wIrmkeqDP5gbUcOUuHXe5YewDuC9L/RBmQ==
X-Received: by 2002:a05:6102:548c:b0:612:7ddc:52ee with SMTP id ada2fe7eead31-6ff02387138mr3889284137.15.1780746963964;
        Sat, 06 Jun 2026 04:56:03 -0700 (PDT)
X-Received: by 2002:a05:6102:548c:b0:612:7ddc:52ee with SMTP id ada2fe7eead31-6ff02387138mr3889275137.15.1780746963545;
        Sat, 06 Jun 2026 04:56:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5a98sm31019061fa.35.2026.06.06.04.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:56:02 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:56:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: iris: store formats in the instance
Message-ID: <w5ocjxxetkov653yj7prtsfc6dwrcuglbkyspo7adhkxv7xyuh@jf4hg4zsb6r7>
References: <20260606114703.5-1-ruoyuw560@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606114703.5-1-ruoyuw560@gmail.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a240ad5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=OJ9zoyAEhnhrvmOkX0UA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: oRsHlKY-knN0ZuzP6TBmOnliWtXDpeps
X-Proofpoint-ORIG-GUID: oRsHlKY-knN0ZuzP6TBmOnliWtXDpeps
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExOCBTYWx0ZWRfX+juoERHol1ta
 +E1QszVtzYY6ytEGgOr/HvGlR7upcQLq6T5aYqTemjGvMXGUWKNv3pfdgh23Mgoh8lucs/nGBWD
 6JYJLbvAlCg+jNx6ZLXn7oBGYhuKgR7rNuObPV9eb7++pXeIRLsqcFNdNBXIoNP1WJ58050Cj39
 WZOel+dfa98oz1/W+Oif3ih+lYurxlRsk+JCvB915Z3W1ZQYygGPSsfOJoUuKX86KchofI3dkq9
 w5At61tri/acwmOIsiZ3VwQ4isVksifO0EPe7pB3Bm4w2hKGwxYyoLbsRrlJX2Dw6NTxqOaCT/C
 3V93ngPbMhKhY0bxKhoqBdSFBpJJb0c82vTEXBI+8qNPUDYciW7TUuVufybQZrIKI1gB5kJJLIU
 NPkzJaE2+aiiCDp7UFg859PzdvBZtJtk4ZT0UeRk01J2+22EqTu4NAZr0M58fSU7PxdVBVnLpSE
 q2oKWt2fDtZaoyrduQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111491-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jf4hg4zsb6r7:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ruoyuw560@gmail.com,m:quic_vgarodia@quicinc.com,m:quic_dikshita@quicinc.com,m:abhinav.kumar@linux.dev,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8CB5864D4AD

On Sat, Jun 06, 2026 at 07:47:03PM +0800, Ruoyu Wang wrote:
> The source and destination v4l2_format objects are per-instance state
> with the same lifetime as struct iris_inst, but iris allocates them
> separately during decoder and encoder instance initialization.
> 
> Keeping the formats as separate allocations adds failure paths before
> all users can safely dereference them. It also requires every later
> initialization failure to remember to free both objects before the
> instance is released.
> 
> Store the formats directly in struct iris_inst and update users to take
> the address of the embedded objects where a pointer is needed. This
> removes the allocation failure path and the matching close-time frees.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

