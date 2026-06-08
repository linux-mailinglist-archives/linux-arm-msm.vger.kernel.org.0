Return-Path: <linux-arm-msm+bounces-111793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7gA9JJuVJmp3ZAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:12:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2330F654E66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:12:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SsmReYi5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eqJVU5Dj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111793-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111793-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5774A3070573
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84CE3C379F;
	Mon,  8 Jun 2026 10:05:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529CB3C13F9
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 10:05:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913106; cv=none; b=Xn3rttQ2ReM07JrYvrCec2VQmx0BKIB5qfYi5fkZMn+sXibTA2cU1Cc0zzgeOmtwTJ4wevsetNqAszk5MmD0PdHK4KpHISjFgHl8ohrq1L0h9FYRVmOImFIJXxzrw66HVTcSrk7JhHt7UM/ATh+rLvIuIiZBDGVe+vfD14tD/Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913106; c=relaxed/simple;
	bh=hlfs03Xx9bg6vz32VheIEg4FEzOKPnzkVBiyVQe7oRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f5V8x7ZDvjszp0u0fCO6+OSMyVK1cXd3Aqh1CZNMrbQQsVqtqDcAFfUFhyd1k6ej/YPqE9kguSKlUakpgBO7yHG4gWYZfLldpzrR2i/SIwESUQDsVt/L0+/YK33aB0+MefDtBPLPIGvWD56fxBmboDz6V4VVfN+dkKusTzENO/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SsmReYi5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqJVU5Dj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OuXS2384605
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 10:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1OWXlkGlD5B8kceck4cb0Q6AFE/5sQ53veciYy8JoFI=; b=SsmReYi5meb6veN6
	ylLJP/+Ku/s3BNRwy6NZnquFzyElJi1SJJhHzb4Uge4oIcPoEC/DernDKO8NMNPH
	Uy0jDPgmlswv2tMgr6cXZW0P2RPGjt9Ypqp7/DJYLEgX5+doBE8V8W5+OaxJ0hpD
	0vWfmXI7D62WelIPtCqEW3qvnNCtYx27Yq3EB3LrCPyUMwH9dcQXxjTXE6cg7N52
	Rq1SYGZmvg8OskrsoXN+j4IoH2FiDMjidYSwFYCvAN6z79Kk86zB4Iop2LwCe/On
	iZ8g4vUIllndqQemNU8ZFY3KevC7ucZ35IwHR2VYHenw/4L9Qd7W6f1K85yOCEqp
	KslqbQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1f4wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:05:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5178ded346eso7723541cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780913103; x=1781517903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1OWXlkGlD5B8kceck4cb0Q6AFE/5sQ53veciYy8JoFI=;
        b=eqJVU5DjHAk9g4/0pORDOuKZi42fjYxksQ5O+wcyxVoQRb9/3KuA3KvEcFfOYyV5t+
         a/1EvVSHdBuz0emjJRGXKql0pK0VvqJEUYxtE2FLrJt3k4JNjFuVCAjC2VZrvh8YE3Oc
         kkvCVpEh4eUn3dixVdbFu8RxTs1arn8ktrgBOYpzzHKVlRKmD/6gPveE8xnrRi2fo9ZM
         bc363ZbLhH31Xbr3KlRBUTRxn/9e3QTxYTWH0WlMV4ysY+mJpgR+PumPgQ6g1B+RBQp0
         XN50ioGWY3mBscKiHJgqycu3k4I9PY/LxPwhG79ty19HvIUL6LBgyf/c/uGA/rdX02Y6
         g4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913103; x=1781517903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1OWXlkGlD5B8kceck4cb0Q6AFE/5sQ53veciYy8JoFI=;
        b=XgWjqZ6CN7erz3RQNCbfxPAUbBCLRBTyRlH7GQN31YzyIICr3n6mGtAjwq4Wy2VnGu
         fDObQ4AW33TghsgwBi8a41DtLCS8YbrWucBbmd1h1HU9n4OEHAaTh3AadUe01edMpIHt
         8gNN2dKt7yvKoAf9XRhYL8ii4kaKMaZiwGmwxEYcKKa9Nh0Wq9p0qpBo7ijchskqN/OM
         n/72F/CdFRVmJ3IEy3hmCgE/jny0MrjJeygow6eXrrVmxZZbfGNGqCu9no3aBHjY4n3V
         V2O3Sz3M284QqXnXgDmcWmhtFOfQGNNXsRd32rsX3ulhaumNlqDMrA+HMZZRLwQgmZCu
         PQKQ==
X-Gm-Message-State: AOJu0YxLzEaHgtzwvl1MAc5eKFw/9PVpFA9DN8ZD8lUq/WIc1g8QGWDa
	bnSTRNVBz7fdvZ+LK6twr2U/a9Rj+n44bsBFVxmO1H8pA5wCap+mUCRdk/h8jOtJEqqCZk6AJHx
	9ydWUoyJA5IwsZUUtsMNn8balaDykLLa42nQs+ElkI7O1H3eFUe4Hp4R4/I+bZyGHCUsy
X-Gm-Gg: Acq92OHxsnASJ4GdX67dZTSVOXcGrlbgMCEMVbKwccJZ/Zh1VLRyUprc+ka4whRbOV/
	/H/G5cRVgzxNrjQVqg7fNvuXYr2RnN2lNsEEKDEJ9ZlfP5FJsDCUZ1/VxxuFjkJ82sjJzd5p9SQ
	ZmWFtCYd0tw4mCPJWvbkrjyrlDHicKU7RDTxDzaIGqwV1Axhq2yRip62zIJ6qPXhS9xFOZlrAy6
	Ljtmhmvqc5Jywgy5/lLM47qaCJud/IpyKS5ZDLeGRJer8fqs/cQRAWJZGr5E1dCTQTJMZH83CA5
	Ku2DsylkZI8xyywwSFN0SYszD1fCaoytiOUpAWx/1nwaunaBliqsIbWhY2GfBpdzs9UkfFx5evL
	uiGPFUZ5vFJlEw6WQnI8NKcoX7dfcIeqiGS5XEKlMKCcJo8aXah44L2lF
X-Received: by 2002:a05:622a:d:b0:50e:487a:bfef with SMTP id d75a77b69052e-51795a481e4mr128027251cf.2.1780913102483;
        Mon, 08 Jun 2026 03:05:02 -0700 (PDT)
X-Received: by 2002:a05:622a:d:b0:50e:487a:bfef with SMTP id d75a77b69052e-51795a481e4mr128026981cf.2.1780913102054;
        Mon, 08 Jun 2026 03:05:02 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6912365bd3fsm3425407a12.5.2026.06.08.03.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:05:00 -0700 (PDT)
Message-ID: <0bd25e6e-b4d7-4133-a718-0b569405cad7@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 12:04:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Remove unused macro definitions
To: Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260529-macros_pinctrl-v1-1-3d5671efd18f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260529-macros_pinctrl-v1-1-3d5671efd18f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5NCBTYWx0ZWRfX5LIu/dsONspH
 zfQ49srdj6LWuKvG77T3mGjh0H5vy8fnEAeF6dt7XLhOebczMjah//Bjnxj3gb0sX/vAQQkvDpC
 9AMeRgUL5NZCmsV3xcHKh6P/1hO6MUswh163ZeP0yQjoKSn8ZMgkGsyr0GiWONS+VBDso0H6uT0
 AaO9EoMjlSX6ctxGuT7uVcKDqSCWDqHE2bquTRk6TnBi39Htezr4cRnATNAtJmjreOYQJLWRLJl
 L+gQQDDtk+on/Gf85G0QWf+bimPfJ0gMjDGdvbhSemzRlrV4PCbCRMr0F3vaU6gidJqoihhHII5
 ViUTxMLwvm72nkGsRDWLaaN1bPPvAGmpLR1VaCNn3fK3jEg7PAt13DxCMq4h1XgciQ5VCPpjsx+
 Qx7xXKM5LODbCe4FHMsoo32glxOlHgvAiEuYVfDJauqZKKfvXEFGEAPiGkYfiZqDGcwvlZLEuI3
 FFI2JSPkwb1RjvaQKXg==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a2693cf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QQIitYBaRXPuBUzoCRMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: WhakVLb_KixGUTcnfQqbzb5nJ6J0o9L2
X-Proofpoint-GUID: WhakVLb_KixGUTcnfQqbzb5nJ6J0o9L2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111793-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:navya.malempati@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2330F654E66

On 5/29/26 12:43 PM, Navya Malempati wrote:
> The macros QUP_I3C and UFS_RESET are defined in some platforms
> and yet not used. Remove these macros as they are unnecessary.
> 
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
> ---

Wonder if we can/should turn on -Wunused-macros for pinctrl/qcom..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

