Return-Path: <linux-arm-msm+bounces-117598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n9R0Fmc2TmpoJAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:37:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C62C725EAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:37:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FtSBbdb0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IbJ2OkoN;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117598-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117598-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B842430344DB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 11:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850D837A486;
	Wed,  8 Jul 2026 11:35:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2063CAE99
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 11:35:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510547; cv=none; b=JV1QdKW4MbZZxewo4CBpmXjIbd8vFHeDuYGR5/1hODWOyapkjWNRJ03bb0a5bhS6ENPn5djh647nDxoWyb4ba5pJC+Azcwx6RmtwWrMmnUty0TZ2Csh3I2E5MQc0MFG0p3c5KU2waOFJGF5wWY2J0ymMdzc5xsaigT2RwXwbtyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510547; c=relaxed/simple;
	bh=sp7+wcPxRR1h5sGln/Bz23+FdtTKsplubtMIWHT4QBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pF/X8YevY9lkvZF/2UoYWhQ32Vj1+ZBWGPLWxpnC8v/QqIfOgMLpJfrQx/KOEINB0tb0degGZDp1qM0N26YjKSymWZ0pScXFskkgudV0DBHgvNBGMtUPLO+iqlWOIdiorpPc4qK5GKW4XMAb/Kl80WK7vbgANtJYWw6vk1RuVHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FtSBbdb0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IbJ2OkoN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BT9Xt2638759
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 11:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ctqeJn+E0TXXAvATaSfD1OLg
	SY1/ELoaG2BLUR5j9T0=; b=FtSBbdb0UUwiA44QxIEUf+XIz2nO3oSqdeS3M9tZ
	XlxeU7vl/qVZd3+bCwoO0r7ItKtkmf8CUb0vVt75YB3+raYdzJlJ8CdeAIlgNH5L
	rjJnkfeZgALFofKVx+TxqPUAkhimPOYeK7FZnfVaMFMY519ZwX6rzu5kmuftzdOg
	EbNEZYMaZ4E8PER1zzAHzTt+uiCN3FRnYGf/B1FX6cCnXC/zZu//9G+HlEx7T8S7
	rJ0KTxsrUThJMYqLwT7bErrmQND9GlkkPmmi3eqEf6ScfaiyDM20UFQ4RJCJ7KD3
	3ZyRDvfL2cFm6k2e1tIL1l2ZgBhhL1SzcH/4HfLtRY69bg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd47q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:35:45 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ab02fb3054so64850e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 04:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783510544; x=1784115344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ctqeJn+E0TXXAvATaSfD1OLgSY1/ELoaG2BLUR5j9T0=;
        b=IbJ2OkoNzXGjuV2o8e9RieNG1sh6dxrydT+8OV/7PtTsUqWYq4aaBV0ItpgSwI/prO
         cEDvpHsW+9w4ZwzXZme8ZT98Rgg6CEit3N7cmCwNnZr5/vqyF6VVWoeIepkpjGy1caEq
         sCQMY6VpGGUHazc5cU2/0/knmH3XsrNVMN//1ATpTKtPvBRexISZoEo8C1Sqz9wUCeKd
         R2pKmJBm+F/E2bEWdGDqOo40iEvukVh2V63L8nxew8dzpmNA5Wp1SZRPkjdTmrYb4pSr
         /sFIFDnqnTsHMg1qX/EsDsarLZ96DYCL25s0qfnGrTYs1pWNiQI+yD6cBuCHeTb4GhlO
         OqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510544; x=1784115344;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctqeJn+E0TXXAvATaSfD1OLgSY1/ELoaG2BLUR5j9T0=;
        b=M2ZjT9pon+pB/AXP3J7OQWQmBCxzL+r/bHN+1t2CH7teLKWR1cENujqzO9pYCY4z5j
         +Bs6A25BZ/ubWvhYWAHS3JtqL4TsffTjHapm5fM93y10fjO9XDPC+6Cp6hvT3I2oB58s
         AHfvG9cPxqtYk2cd4RK9TE8O+h5puzeyCsZ9cF14oHB8EjyhyffUri1JlbWgnNUiKG4z
         rGYEeH8LgS4c04oP8op8OT87AGnP3kgRZ1lGt2L5GTvmQbK7bqlvj4s/NGA/konifxV/
         o0CShqV4Tr93l/Ky7uusJYPTb8sL+MkMFsf3UHsrWY8AFbCEMAgW1G7pDVjJ2AmSwVL9
         MM3g==
X-Forwarded-Encrypted: i=1; AHgh+RoPRvvGdJCS1AmgKDiacMC9Co0MtdUyJUMlnH5g7AWhjQ//pPNPFo/UE1JI6rgPN/ciDHb8uvdqRlK+0OHj@vger.kernel.org
X-Gm-Message-State: AOJu0YzkLQg/tuhyO/yUDb3t59cSkUiqyBNtTKknadkxtegDsVNEMVUy
	nMmJ62KInzqP9giDHMys1gfEElClExM2yj3Fib60k4CkgdKyHrVdEZtiDZZtpX6yqo2EcYvUF8N
	bKFm71rriKyU/a6xr9Vjh5/ub6fd7URA0449lXO3BY95UF39R0qDTmvzBNPjh76tb2z0w
X-Gm-Gg: AfdE7cmlAhNTRkA8Dkl4hGMjOcbGJMFulbDIxz60l5lJxUQwoxcgvSOM5/2cYaEVbuN
	Ad0+4kVr8vaqxS4bL8j7rl4qrEUL2HZRCKZIFxMtrBU7O7LSG47LZ7tiPEpoAnhfwFbmEfnKV+x
	kt7qD03N4Y8GfQU7HNKWhBAIxCFyrKk5ffP6tjSeyjJ2PXAqiqWxEUqYn3J8ae3sNVZ8ZMo43nk
	02kOw58KSv9Ye4ObTNko8amJzoTN/K1Jdfvu3L2CWcCPRHofPdJe9wrh46dYAbLVxmSHWZM9aW5
	IFAAUyq4NphKry7D9EB4qRnXDWqj2sWqAu3OsvDjy+wuwAZGviN/JgS/VdvvTuld3Ytqk80ztbi
	gatWAVS5AElDa4DjXWSVeSoKumkpes/Uw+E1zgZD/l5E/ipXX1nOoQnzzpEPF9+bN54a40kvCB6
	J0Lp0E0mSTuZo9Iknxcb20F8bx
X-Received: by 2002:a05:6102:c47:b0:73e:c6a0:328 with SMTP id ada2fe7eead31-744e0159398mr913492137.19.1783510544336;
        Wed, 08 Jul 2026 04:35:44 -0700 (PDT)
X-Received: by 2002:a05:6102:c47:b0:73e:c6a0:328 with SMTP id ada2fe7eead31-744e0159398mr913463137.19.1783510543878;
        Wed, 08 Jul 2026 04:35:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1383a29sm4440016e87.36.2026.07.08.04.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:35:42 -0700 (PDT)
Date: Wed, 8 Jul 2026 14:35:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza-mtp: Enable touchscreen
Message-ID: <fgkyrdw6rozuwsklmnazfxoxy5rnochb7asq43hpotz4ajvsmf@nmkt24zsvz5s>
References: <20260708-dts-qcom-eliza-mtp-enable-ts-v1-1-372020a7a86b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-dts-qcom-eliza-mtp-enable-ts-v1-1-372020a7a86b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMSBTYWx0ZWRfX2+hHMHZ7pe5k
 p/LwjIEtDSVrqrUN1gZPGikfozH1ZnL/e0TO0DEBAVgjAFXQKriDtA/WYzXPTuWj6qhbkBDhnVJ
 TUuJYjkOyfq7ZEbkohU2Uyh8w/op2w4evJ0VNVMhazUCxJrSgJU6vZ3/kAMED2Yq3U1XUbgN1S5
 5e6k1O/5aaXA6tswmkFoixG8/OjOD0uMrmActtx9y/uQXaOw8S+RygNucil+8fVxTKb3gd1zutD
 ljVSayTgpLA3qmvEAB6N2yxdXtzLqf+GfScmxrwZLTtaB4Nj0wr+RJu2LSYFJI5Wfa5H2NvBoWX
 4DtO2egP28fcU2kgT4HXOvL63XzIW4O+80lNI3ZGCiz9rwCJQAZyG3jp5oM/ly/C2Pp4kmbDeVF
 5zQzflfGUw8Oiwq+IT1x0c0AJNTmGxHfhKdw8eX6p/O7dBbNJSGj6VvsKg2yuvyKV11GrrCQbdp
 stlxFBDTDUspmJgpnNA==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4e3611 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=vCPi8hDJYrjmXadnq0oA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: PKJ9J6WbBDnwiCGgxpnOkkqkfTX6Oj5M
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMSBTYWx0ZWRfX40B5X0MZigza
 cwy9s/fPLEnLcgIL3AyyGj4tZJBlOiPHuexWzQPRnoOQiUCkpT7XgRD5dMLvvkjwKiZ2ianPdxT
 ueOHlrMFvII0IaadtMk1SZwSBn6Wl3c=
X-Proofpoint-GUID: PKJ9J6WbBDnwiCGgxpnOkkqkfTX6Oj5M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117598-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:abel.vesa@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C62C725EAB

On Wed, Jul 08, 2026 at 01:18:26PM +0300, Abel Vesa wrote:
> The Eliza MTP uses a Goodix GT9916 touchscreen controller connected
> over SPI.
> 
> Describe the controller, its power supply, interrupt and reset GPIOs to
> enable touchscreen support.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 39 ++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

