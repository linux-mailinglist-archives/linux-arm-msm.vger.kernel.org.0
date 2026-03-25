Return-Path: <linux-arm-msm+bounces-99940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IbQAAhBxGlHxwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 21:09:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B17A32BA14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 21:09:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7856130D3A6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 20:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE8335B644;
	Wed, 25 Mar 2026 20:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mo/mJRct";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bN/ZEA3E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7388359A7E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 20:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774469223; cv=none; b=ETHTYFr2cdFRp1+8VXxwjG/jWmwxDJ7RPrdrJJkJ1+xIHbG0GkkNTQ2wVKFlBjPnK83IoSkmoFF1kvptHVbmpGgdnLJIGIJUxnFKgqXH1tjXzjAVCQq8Y69dUeQF8p9W7PkjpIkG1hl93jxQtlh//kxkw9JtPG0NMZfwlzODVkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774469223; c=relaxed/simple;
	bh=5ulfi4KVHnTTJuE7UV0uwZLQ3Tq0/UAGQR4Q6zmwnKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2QLlu1nJD/HRgzjO4A7Yrr1fD3DvnOVxwtBd1JoOj00ReXUirkc2Sr5RmtZXPUafgU87NVBuAyLRiMKDoQB+TxZk4Narh1dg3NsoBjLz+qtOILw7LbRm/I/tPvkWWCCM8QbcdPGWVmyot2yOcLsSprNf0saf69qAZQ/xXUF4i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mo/mJRct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bN/ZEA3E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFRIwN1432140
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 20:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iqqLnvToFpREO2Iofc/xS+E1
	0uwwM50L3x9HSlvOeVg=; b=Mo/mJRctKTzLh5aZSmjbg+V612DJe+GOdPr0732q
	3n28lO1qqal5KCY/5/2/rubx0ueaL0cA2DEakGMMes1+51CCWFwYHfYPvFKtb6mL
	a18plIammyJFL2LpnUJjZKqHdr6FPawa7BKlYnf0bAF25i7Ys50c7FrmKwVDE/L1
	pAldsigQB+GOFgfvXgqsKEiq5aPPgfIz98bpM9Ecy+0kuZce2KHNoD6PH1659VeD
	DqfYHmf7As7/ATFCSSuQGzraXMiNe9N/rHxFA0UNARq++r3L+sjA+sgQA+16KpMT
	xEwCtJMUGCNYA09tf3BCWTD7tsLQj2voTliZWaRk90Q0nA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4jc511aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 20:07:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4031b86dso11358401cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 13:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774469220; x=1775074020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iqqLnvToFpREO2Iofc/xS+E10uwwM50L3x9HSlvOeVg=;
        b=bN/ZEA3EtgKEjdsVflvQeDbyKki5LWafiuoScpVKhXELw4Fa8hwMqCdlZlpdHjl3NV
         0HSwXsIBj9Yj0D1y/5yH4Tf6ao7T9ZHN/oPHpW4rbWQHYkZSly0i/EO6LGwpUyJf+LNi
         Iq/kjr8IsyJz0Ewi75edPx3pZ7THCcNhXtVMzYjPB07HRKOBThzBr2agmNYj6XJeYV79
         Lx30pn4HzwtAUm2/4RZ37q9YVAZfu+Osh1xJMs9ZlXFmCJqBfUPyDBLqXOw1EIDZw1AK
         a1Qm/7I3YmJtiKkpdzcg2ILk9rwZ4S1H6udTGoap7j+nuklRnZhz7kfm8d66jvM6lglp
         q9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774469220; x=1775074020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqqLnvToFpREO2Iofc/xS+E10uwwM50L3x9HSlvOeVg=;
        b=Cg1IeZ+ur2lfOYWc0+JxbM79j1vNUwtnycdsNoXhvHfCNlk6hoxpwbzUMvPN4SozFF
         4LtzyYUCi/5PqC4ah7aEHwOBB++ImJwRYsSxxkcnrrLDmVOZ/C4W53AHWF7R+d8MGivl
         /9PWoB1s4M7v9Y/lk3nspXCdm+qm/0vSco5XR0RoMxB7R/6pcwJHCBWYTaDfJb/Wfb09
         Klruu/ZpIUon1N31vLNwAEjgZ7vnAzJbr6bBZy7LkX2Tw5Crvcud7kCaHimfOT4hn09W
         BKM5FbfJw1lTVkoCkwBm+v8ZgUa4aQ6fGPkCDTbfuar+YhjZ+QluuP7oumQ7g6rbDgaS
         qVLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhdGcOZavpvyq14frc+ITuRhgmngzMCuf1uPsMG5mSYMe4p63L1KO+kyl2occOAy+OaiMIt8O4rw7pbLY9@vger.kernel.org
X-Gm-Message-State: AOJu0YxapeIPjdACE4cJ+7bFnf72eb+0aENlPwfHHVQ1g6m3NzVnfzo1
	KVfCr0eCiN2ysScK87eDVXjFEJ6QsLMDrcmXt75mXrCkHj5kTF3ZVg3p8vRRJJ6Ry0xEjFW9klW
	aClMAkms2bhvprhQ4aAXE4J3NTCgllqrdmDVIhUGAMsGCaRwap19dtiyX3n3mfJ0UeWTm
X-Gm-Gg: ATEYQzx078yOKW/wbN5H6psKEICidDfhhy7wwzMIw20INGR9ol/cC8Uf8VmWnrailo8
	yQuaMXMW3WNxMefdVb9g7SbzMMu5wTmORrM7/BdgxAYjA5K84+4FWssqt6J0AoUUz/Ba+GI1no7
	I5JVrZvwoCwreVQ5Dxx6sXpVZ1PwQ/fI1kR4ppUAOphuYqMlY4zj9t808nuM/bkfYnlB2AeXQee
	s1PH2Hvbc4++a3KrDujdSRc9nWBt2e6xDaj3MJDobbHVAfiVKmO4G5FD3XraygpnSSZhzVwgNeu
	eLax2IPLN2I3aoob6TtA587E83J0pVYRDXCORyXoDOt5mXRbJSsiDkCReebbN33Q3grQp0CiTeq
	1yuVJgbk+pxyC2euEvxLAiffNl1JGl8eRPWap6tbVPHP+7VsqtGuVwHDOlz2ghqtvIX2O1CZ8rX
	m4UE6xa/v+3YHCnd0S7y/g/26GwJlbGYAz3VI=
X-Received: by 2002:a05:622a:1f06:b0:50b:6cc1:38b7 with SMTP id d75a77b69052e-50b80ebf459mr65956271cf.58.1774469220108;
        Wed, 25 Mar 2026 13:07:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1f06:b0:50b:6cc1:38b7 with SMTP id d75a77b69052e-50b80ebf459mr65955851cf.58.1774469219478;
        Wed, 25 Mar 2026 13:06:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a063eecdsm107879e87.8.2026.03.25.13.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 13:06:58 -0700 (PDT)
Date: Wed, 25 Mar 2026 22:06:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: display: panel: Add Novatek NT35532
 LCD DSI
Message-ID: <6yrsr3fsmg43xad7oasye4deankykwxef6m33ogypaeykclfyn@ws5gj2zydyyz>
References: <20260321-rimob-new-features-v3-0-d4b8ee867de7@protonmail.com>
 <20260321-rimob-new-features-v3-1-d4b8ee867de7@protonmail.com>
 <sdcfwycey5ykhn2fghun7imx3tjtnwat3ny3mut5dwstl7wvw6@maqrzlycwdn5>
 <GF8zsK-szOM98Ck2jznCOZ4xjuJTl9g1b0uPc1N79Dzf7PNzOiVgewdqPFGjqF3YD7tOUa2tzdc7rG_e7iNH8yjHOJ9DobsihTxRLUk8EL4=@protonmail.com>
 <fh7rfswcwcrquijgjq547b6jjuq2v3wxiweh5xnnd4z5ql5n7r@gt425ujkpctu>
 <E_O40YTvp6FW2yHa_lQOmzZwB1BZ7r_uCfh82T3BeO-SLK255eefzThCZDYJ2PFi3Hlnp3JXL7JWrlIU2ymh7m68wkNMTsM7jcMa8XxuxCs=@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E_O40YTvp6FW2yHa_lQOmzZwB1BZ7r_uCfh82T3BeO-SLK255eefzThCZDYJ2PFi3Hlnp3JXL7JWrlIU2ymh7m68wkNMTsM7jcMa8XxuxCs=@protonmail.com>
X-Proofpoint-GUID: HZ7faRk9kRzDWPQaleTC9IgrNfch_Qk8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE0OCBTYWx0ZWRfX/OOyHTdyU7+r
 nAI6b7RqDHsFzDvPazojgaCdNm+bh4Y0MqnlNh7sIgoTOPJJXYApUN7mmMM9lk4eraniGEXu2RZ
 2h91N5DZJTG3aFb3I7GQzUJn/ElF6aEOE/KE6+edju+G4d6kjtEJyp4T79UAgVsVOBjmDdzTeMZ
 A0DoK3JVxlnSfFZsWY/i0mLd3qJXT1ITWlX/Byhvurse1zU51GiF0L4zaBNd8m+K1JM1+hBkUVb
 bdLCJFS+bIXl3qXAZdKobUgR4G1A5xoqaZVNne6TuGuGCfHixrJYr6jAs2+ltsYbDnvusVjBKOD
 Z+Vu9iruYdyWymXF1MOBbJL5EGC/eKRy/D2ENLaQd1WjC5Ix/AG7Lvmip5AVjV5NQclmvwANiPM
 Pp5EPcm/TNO5K7sVSuuAV3zhfIowSzcFLeC0YMLdcVgVt6p6M9ANn5B4mytf13oxWskiCS1nfyG
 Y42N351yIQewr6LfWTA==
X-Proofpoint-ORIG-GUID: HZ7faRk9kRzDWPQaleTC9IgrNfch_Qk8
X-Authority-Analysis: v=2.4 cv=KaLfcAYD c=1 sm=1 tr=0 ts=69c44064 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=fnGvSGuzkqCyUKXIORQA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250148
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99940-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B17A32BA14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 06:31:47PM +0000, cristian_ci wrote:
> On Tuesday, March 24th, 2026 at 23:20, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > On Tue, Mar 24, 2026 at 01:10:13PM +0000, cristian_ci wrote:
> > > On Saturday, March 21st, 2026 at 17:46, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > 
> > In the lack of any information, this is probably as good as anything
> > else. Please describe in your commit message that you don't know the
> > exact vendor of the panel (nor the id of the panel). 
> 
> Ok, apart adding a new compatible ("flipkart,rimob-panel-nt35532-cs") to 
> dt-bindings (patch 1/6) - leaving  "novatek,nt35532" as fallback - and 
> setting that to panel node (patch 3/6), I'll have to change (patch 2/6) 
> too, by renaming nt35532_on to rimob_panel_on and so on for nt35532_off, 
> nt35532_mode; by adding a new struct named rimob_panel_desc defining 

struct nt35532_panel_desc

> .mode, .on, .off members and moving .lanes, .format and .mode_flags from 
> nt35532_probe to this new desc specific struct and by adding .data argument 

I'd say, keep it simple. Move just let that struct have .mode and .on. I
think the rest can be generic until somebody needs those.

> to nt35532_of_match. What about the other nt35532 functions (i.e. nt35532_reset)?

You don't need to complicate the driver, keep the reset as is.

-- 
With best wishes
Dmitry

