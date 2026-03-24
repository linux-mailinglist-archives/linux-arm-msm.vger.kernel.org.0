Return-Path: <linux-arm-msm+bounces-99752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIXACfgOw2lKnwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:23:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B955231D4D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CACEA303D3AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E57381AE3;
	Tue, 24 Mar 2026 22:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lefrrx5W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E63DiY3Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918073559D6
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774391029; cv=none; b=AVk63TYsiFuemF1HdWlD9s1SQWY6DmTpwLN+VfqFFu9jwQA+pV52bOkHaKEfOcRQv2rzKVpI6vt1mulVoom/kj3UAPDbIF31nxjcUBkT2IMWk2vEn+B7l1R6hirEl5zvm4YUCFvKkkhVHOghO6b9hN/Mxlr1Vq9XfrbfAO7zLmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774391029; c=relaxed/simple;
	bh=tTd9Bcm4dRUb/TDRIRWy9N+UwKZKAqRQMB81nWckh/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhJBBMOkEqgliz2y86f4Rs75n7S8Wk0lBn4BN1J2G423BiEjmlGI3jtX0bbNmudcJlLFFf/gkI3pbXHjfGcrAInUvDlqU1ds7ecpwlsPTWMY96OgACOqQJj1FvfoHlktk3l1/yK1vjLzrd1+PORKC2aKuND6PoV6N2/N7nHl00I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lefrrx5W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E63DiY3Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJnrj82076444
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=muukZ0ujq8zIYdW2/HKF4qMN
	qjDQqhCAwg9wK00NHdU=; b=Lefrrx5WMjyH06WHXhpGOi+s90l1cOwbEzD4RbRB
	K4dCEc4LS3/6gYoFQV+QXIYXHCNYkGWW3UzHt113JlWHOymk8tbgrWfZtmqEPC8C
	ieGFvcDbc8ZqHPjANlyBPaj494s02u8ceKBpLI8b3qKa2F/qR7PapTclQI80Advh
	1fxmRJvGZLrhgOxt6hqeDFWSShwLSFNM+l9yo4TdPlkC3zLV6jFvNOtGElXaCq0m
	/A7DWJ5runLhyNuuDzUaUYwUbBy4xHcB+qln3IKrpbnA8Zp6R2eIOZtXOpplnnOY
	siZ7fCz5XqCu2hZUIez/srIfQgeNkISsNB8huqomAYluQg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41410ds3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:23:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2cbe7223so100288751cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774391027; x=1774995827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=muukZ0ujq8zIYdW2/HKF4qMNqjDQqhCAwg9wK00NHdU=;
        b=E63DiY3ZPtH2hEuk+rzVzdDKSb6MYlo+ppXBt9jIK3A/RljBdJ6xmAMxQGCBYz12Lg
         Nj4/hUhoUOKEsavnaxxshLd916HCnGCOIFZAz5Hx5naLn6DVjEZJbz+Y+QBvl6Fw0eyf
         WCp6biFKCsSUHF9cknBQ0I2S4ByJU8h8fSea36RcEUFHH/5LydfqyzJRIjYxPUhW4rpH
         eiraG7ALz6+rvEGpLqzurRE4cVgmuauSUlEh6P8CT9mG+5SPO1hW/tSneN7YlAX6ORm2
         64sA1IsP5biOjn5M18cp7zCENftDZ9itbGxBppmEmpwX4Ln7Yj1+5GbdQ00sS8YkAz7T
         r2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774391027; x=1774995827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muukZ0ujq8zIYdW2/HKF4qMNqjDQqhCAwg9wK00NHdU=;
        b=stum8DMjSnQ60xyx9M8rX0/RPclx5DhfJ+9cGv1HB7rUcVEk5REeB/XDVeEQIutR0O
         +T2lSK+Hrb9ocr9cu3srIvlmqj0Prv+T5p+uRxVHQHuzmpYzWk0QNJIH7yZQNXmNOCA+
         2W6tGZi9HhKDAuhQRiwPWPP+hG4TFmpL0xN42vbklJv8wBDKxjFsok5WbN5LFCIjfhhc
         8ksCGOYIYSnUxyKh57IaxmYFUboieAPVA24D2EV9lQy06Jivd7Pd6S41c2b55zeawE5r
         uFYTYE5tP6S1Va0VJ7bdpSMpC7zMNanQeJ4c5rFGSSpQ5WM2JsjaLzU0enLALLx/yGUd
         t6rw==
X-Forwarded-Encrypted: i=1; AJvYcCWlIa2gpXdB5pOXNSWBQyCp0NKS2uwQvqGvPe3b9kar7JD1FVE9g4XzJEPabW778jbmPz0FVJkVIkbHsmn6@vger.kernel.org
X-Gm-Message-State: AOJu0YwxVTRbxXT3rJwAkLmZ4KdHkFD5CUNrou7tUHGvEBdfgyS5h3St
	Puf1wdWSzOuUPI/9QZ75itPGltLfUQ0GGMay4LgQFuCUCnOgCIz0bzRzyOzhDm+5HquNHcp1pgZ
	/JDooGy7WVuZ75LOg6lv+7TX5U/8HjKriAat752zsQKKh/Scjot0accJREUGetbm8dMt0
X-Gm-Gg: ATEYQzxvj2HT/KC4+9bLjINyJgvwOpOTHyBkXLP69DxUT2kH6NZdTb4w6UBPzMh1ot5
	1T38W/f92g/AtfFammdbvDdue3axIOCMomiLl6pfOSxzYsJpaUU/dqNBQnMMv3Nz6DN7SRJdUiZ
	4M++hZDhxRtQ//WY5ZGwHOYsgT5B5NkVqSokUv7p9UrvCIuVVGsX25xsy12LfnrPs8oE4b04Lf9
	jjsnPe8sEPLVvG+GrXN4rsQ38EoXcidh0g9D3cEy5ENsniMJBMtEY4tNvw1L3qhnCvz0y+MgRmL
	MSlMNpIFEPcZWqSPvvVYss/nzLQbaGUuDId3RApyUdMdPW/14dWkBXMpqwrtkzGetP/FjQ7xzAG
	3QUwCxn/1N2p0tVfb0Vn3dc7MfZKYCizRwuSxjNEO6ACsQyihUSblRF1pVUPTIlGF7KVGUJh5Rq
	pH9/QXxt6m8FsbqdFtZ5I1Pa0Ma/RY2MwXTb4=
X-Received: by 2002:a05:622a:9db:20b0:50b:5258:28eb with SMTP id d75a77b69052e-50b80cc275cmr17336431cf.3.1774391027009;
        Tue, 24 Mar 2026 15:23:47 -0700 (PDT)
X-Received: by 2002:a05:622a:9db:20b0:50b:5258:28eb with SMTP id d75a77b69052e-50b80cc275cmr17336161cf.3.1774391026607;
        Tue, 24 Mar 2026 15:23:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c3aa03bccsm5207761fa.17.2026.03.24.15.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:23:44 -0700 (PDT)
Date: Wed, 25 Mar 2026 00:23:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v6 15/15] arm64: dts: qcom: sdm845-lg-commmon: enable dma
 controllers
Message-ID: <pkzsim6zxfobk7ccvjzc4ypvuoiq6kwm62u5onalp7gy4p2beb@ig4xws6oyjtg>
References: <20260323-judyln-dts-v6-0-d89f07897283@postmarketos.org>
 <20260323-judyln-dts-v6-15-d89f07897283@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-judyln-dts-v6-15-d89f07897283@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c30ef3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=Gbw9aFdXAAAA:8
 a=nrrofH4WB8OeSbHxBjgA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: HMRUC0wvrR_N8REOmT4yWnAqYITvc01c
X-Proofpoint-ORIG-GUID: HMRUC0wvrR_N8REOmT4yWnAqYITvc01c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3MiBTYWx0ZWRfXxBp5Bz6NZ9Yo
 5idbyE3pOoapjkvaA0o3raZow/9eL8Jx/ZML+xWLkSM1LV7ke446/z9oNiJfUXOgkLskrLtPG/G
 Tx2Kk1uvHu450TGbJ8dwGTFeLi6nlulzLI12KTNybVP8C+MRNagb4/EFbKKiUBn79nT3ezs+C7o
 Ta0tYzEu+wshBBbmn7O+55LpUGn4Y7V1bV0nsUqyLMNBTKdCZR37Ic+UtRUwoPDzKJ85Kq2XiZc
 /E3PhtNS0vBpzv0rQTliJZsW3XdVOaQBZBb15tWxoWoDCiTCxCOEKzXDSfW3MBvdYals/4sxEL0
 iE+mv58XSN5v3eBCQW9HkjpXq9cRShYOrdeZOE3hJu680sXQJv8uJLI8o7HhzP2igIEmY2/C772
 C04EjQoyUlPN1RcNvcpUpgoIycBX0um9UMoPivDkhXy+IlqY5ViACW4nPB4EXPUFGzRalanW2YE
 Mzt7Pdlh2jTKLNj4g6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240172
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99752-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,vger.kernel.org,lists.sr.ht,tuta.io,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,postmarketos.org:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B955231D4D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 07:42:49PM -0700, Paul Sajna wrote:
> The dma controllers are referenced by the geniqups in sdm845.dtsi
> but disabled by default.

THis should probably be squashed into the patch enabling QUPs.

> 
> This was causing issues with the spi touchscreen.
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

-- 
With best wishes
Dmitry

