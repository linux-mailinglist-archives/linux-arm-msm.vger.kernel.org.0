Return-Path: <linux-arm-msm+bounces-104166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN44BVYR6WneTwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:20:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E61449AAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F7DB3080C34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 18:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FE43CCFA0;
	Wed, 22 Apr 2026 18:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NFCWpEu5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J3Lc6rKZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0F83932D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776881771; cv=none; b=Zl/ZzX6KGSUe44bwaxtYcSfubPQtyXdvzCat6Rfij0Fk+BbnXEs8+u3gt6EGTF71+tmVJxHaASFFn6ygrlLFgJotfO4ElA/bAbigEfQYAL7sKYPSw9650ZPJ8OxCQbf0FBT/CvdWe/FDv2rJ+eW14sYihq5ZI6MpFTcoJwMEIvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776881771; c=relaxed/simple;
	bh=mf/wiGIJo7w2d/nZI+wHpViVNnpSzdppqqCqUoYg03o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNTLkwDVJW/EtYnqpkRlWDo//iAnQnUmA3U5/+y/xxY6KiyJ7OufPXr0VqUEYW55aM4yIetYxuXp4eK0HHqVM/ruU8Z3yIUiPez6q56NPP0LHmBpVqe3bY7HjghmI+zL/b/cb+ZY6oxCShRPWc+rYolCUj5SgJqxXPiv2iye4Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFCWpEu5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J3Lc6rKZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MGA2123173440
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hmf2rPquk5TMbSfIW3+r6rwe
	dWNLP+19dSQv3vyH8d0=; b=NFCWpEu5Ahuf72qjLUAhRj4l6vSUmuYay65p7+iv
	ptcVKpVKo6/dhTqnDIil3vTIvVYesJBaO3FVNS3wPF376xSOwRlIMmRSFrDkPE91
	lzaKrc2wnM9kaOIUtj1ev8nazVEA+dYCk6konbnNGQXL8o1Se37ChIDR+Dx8m+0b
	ZZv5/M62/L9mQ9o0nA625voIcQMhdaMkKuF+x79tHyMUEJW2IeVac7bjcj6Dj+qZ
	yAJoY1+qRk6EJhP/+r7uG9zfGS4II0DAhS/8ftmnFfn67pPjC1Z97x4lWxn6ntLM
	x+CcYKYu4wgbgX8Q4GeaL5OzR2MgiI2hF/2yv52c4hJ4Fg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1m30e7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:16:09 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-479ef25c477so1959091b6e.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776881768; x=1777486568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hmf2rPquk5TMbSfIW3+r6rwedWNLP+19dSQv3vyH8d0=;
        b=J3Lc6rKZWkEYsOP0Ju9K6iuYShEQ5eesNP+6LXb9HAUb9lcLMjnE8AD5URfjkp4wSP
         UHkHThfiyCVz0JZOMw3bz0WeNGg0KyNs2QMlXjSBXbmsGJuugToAvCrAqTcvV+K5Imcs
         vtKB5j2ThhlrD0aTpvLJVnIKmAn2Cy2UR/jGLkZ6lRbA7Z2cghRCK6TqNPFaY9O9TcGA
         p+LzbMUrqgzrcofLj98uxtwNXwXkWrap0zXj+byXDcbNmX5HhCShz6r6gpLBJa1yuHcj
         ktPxQ2v8BMkIU85Sr/qxmc4W/ZBoB0pPSfSrsBCOiWnMbDYtQ0QQ62+XwS7K8JsP7+RM
         UfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776881768; x=1777486568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmf2rPquk5TMbSfIW3+r6rwedWNLP+19dSQv3vyH8d0=;
        b=SciJxQ1f5Jb6J0RbRWqujEajTAYGxMsp1DYm1AkxzOFNNmQdkSyL6HySB4SLPGHQus
         LEyVdJOq1A8WaP8TpC1ta1TCH9SiX9Pa18NSp+izhVRtLyVuSND7/C9w5GH9ncLQ76rV
         xkvHaXGokSfuRl8P8mUf1H3+uMpEh6Zw6yQK2JS/aG1NcXyJyLM/vTlRcYXFu0Bt3g1o
         OSVoLJ2uPq9FgYw8aeJDzZI6WxrXimT9GE5iO9L/wiOCzXUMN7Y+Xr358L48V2/jnfAQ
         YVAeG2x0tUmRSjd+qREig7AAyR0Ne7UDSA0eIeF4n5bj2iN9h500c5ROuQxlJqeDLfLx
         FACw==
X-Forwarded-Encrypted: i=1; AFNElJ/eXuf/6BTH3S3co0+5uiU7cs3IpVD5dWCqjxZjXbmvYsDsZHwUbHdPO7iNDJll1xYyLxdYdm35Rem1zsvU@vger.kernel.org
X-Gm-Message-State: AOJu0YwByM3Hx56NP1YeI/92pmbSneq6K1CXEHSf3rHsHMAzqkxyKLYM
	7P6ChXHbO3k8Yt9ewUGpK5iFixtEg4S/70++dvjFywe4OhE8kXaBYwTE4hfuB5NqBp0/3lImKvp
	zMDubGcVBXyWcNHEVYHhJWcmYxqABmRId8blQ04Zvmd2GM+yNkNSr3sUHJ6jla+v1SFSR
X-Gm-Gg: AeBDieuF+V55TG/mKCKd9IrloTwq0o7yCh63OxLZqxCf/5oZcjzT2fA+Tnz0g/y6KVE
	ZGpUCruyrsSwQOorAntSs8VYKBumZPez/7zpTxsRrWs/Xq8kjZ5xG4awF4sOJH7pM5NRhQ/UsBI
	CDyrT9Dw+HHe/RZ0sOCqEUvjWnzWQGY7LwWM/X83P0GJRuTY28StKoRRGr3IhWsoVX/G/M3OFhe
	uucx4Qwj1FEgpb4FS6knOAtSNpI81JEflHKKL2v07FGQbJFF2p7f/NX7Gc1Ud8TtXAZmkdLu+/d
	9cOB2zDCsILdHbpwq0ZkO8b9KKuI6HpDE4dPX4zRuR5VzAH7V/jsanKzEujgtBB2yA4jh/Gqb/6
	+uW7YbPifNaB9r047/xGZrmOztvGaOtCr2/4l9dZ/rGPLLNiHvHVPUZd5q3XnQucIGp3xy8R1Lk
	+UmhRQkYfaEpEbF5KtcZlfH3AVxgwuKHHEhxwW+ErIyrJ2DQ==
X-Received: by 2002:a05:6808:6f8f:b0:44d:bcb0:1409 with SMTP id 5614622812f47-4799ca08539mr11775122b6e.22.1776881768460;
        Wed, 22 Apr 2026 11:16:08 -0700 (PDT)
X-Received: by 2002:a05:6808:6f8f:b0:44d:bcb0:1409 with SMTP id 5614622812f47-4799ca08539mr11775082b6e.22.1776881767903;
        Wed, 22 Apr 2026 11:16:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f6b20sm40071291fa.18.2026.04.22.11.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:16:06 -0700 (PDT)
Date: Wed, 22 Apr 2026 21:16:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: Re: [PATCH 10/12] Bluetooth: hci_qca: Rename 'power_ctrl_enabled' to
 'bt_en_available'
Message-ID: <cmeufrfrpongh77x4leqbxugc5mrrtryjbn7talpxnnxgjd6ho@fcif27twuizh>
References: <20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com>
 <20260422-pwrseq-m2-bt-v1-10-720d02545a64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-pwrseq-m2-bt-v1-10-720d02545a64@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -cmpsbdFo3AXXM8oGhG2rWyyTj8EJVun
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3NyBTYWx0ZWRfX5wg6nu8fckn9
 lTcDWy3rTvE4lBH1pxsPK4VgnsyGTqqEhIJMKgL2GfdX0wiUlK78mjeh/G64ZN4kNJdRQ9Csa1m
 Uloh/NI6tMnitSA9KphEZ04BTlCAXGOG7fF9gnDg0Oj6byBm7SGti5OGSIFnfRtM4HfM4zZOyww
 MXAdeR+g3f7C4vJyW/E0FqRbB2qIDl2JKvP31Q2BaJoLXF/iiIYPlOcXA2y5zJ2qbHQjCjiUmG6
 EX6xt8/u3Ed5DW1Q9DlHGlBVWfT53h1+Q4LS33qdSijdtOqOiBewxf/SeXBwQJsI+8x0oPJrBQ0
 eZayaBUTBLGwp3ZR9MXqku3vQISXwZut/rFQcCZ0NMgs4v6xAh2HyR5eGvY5bF2FVpBcc+NTVPP
 2bG3FTGna9TX2abSpaRR5c3VOhs40kqx54eq3CKcXzUb4EfBTWqxPz2a1cs+7ftGSHRkZrvAhXh
 7zQQXK7g7RZrkKS7L3A==
X-Authority-Analysis: v=2.4 cv=PsOjqQM3 c=1 sm=1 tr=0 ts=69e91069 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=yI0fE1SOOqVeyhB3FMIA:9 a=CjuIK1q_8ugA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: -cmpsbdFo3AXXM8oGhG2rWyyTj8EJVun
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220177
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104166-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,vger.kernel.org,oss.qualcomm.com,intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 51E61449AAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 04:54:51PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> 'power_ctrl_enabled' flag is used to indicate the availability of the BT_EN
> GPIO in devicetree. But the naming causes confusion with the new pwrctrl
> framework.
> 
> So rename it to 'bt_en_available' to make it clear and explicit.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

