Return-Path: <linux-arm-msm+bounces-102277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eB5/IdgY1mkxBAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 10:59:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E40513B9831
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 10:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B298830075DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 08:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CFF38944B;
	Wed,  8 Apr 2026 08:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1x6Kwzv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FKH5/Mnx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D33B33BBC5
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 08:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638700; cv=none; b=HzfYcWlkMISlPaNVHwzmkNhD3Xb9O06MotHcWSYk3/Of0eSjJznG+ORDEvWSsN7fS3oGuBD4mYY6LoB4Yp3u77kHnL8fluTxAT0g3AipE/AOfCkPzIDB83aZ3EBFB7XW+ACdrNPLTVsj0TUQf0yM/qAuu2E7FJyfoFqzUwX6Hfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638700; c=relaxed/simple;
	bh=695EvRGtNPvpl9lY6nEHN9U1QvZ4cE0rHKZAcM8iMK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3ZymoyD+nlAUIKGD0GJyob3eMaLaD5POlAxPEC0+akj+5sZB/TWxLQ4Y4bB79oC/DA9okuzOPFR/dxdmTuxQDSPphZomWCtSwH6Op1rdNI++3+54UOMnz+DRaq6UgzObGfHja7/504YmVoZ1SuvILvqiavWc5HDb0QxXoAYmFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1x6Kwzv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FKH5/Mnx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63877UW51619593
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 08:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qL7PDtfGlQZiLJDrztVf44XQnSa5r5vuSGqc/zpJnTQ=; b=O1x6Kwzvdbg2uw+E
	eILejdyVH8cqvM1QAiK+GMVTPTMJgESQ7kRxVRHDpvuB5G6XP0vXeNEVDxsokE8K
	RomxlH+xxn2A4Aic0mZqvOQNwquLOH3htT95lgMbWlhFM18LZ1EmEedK0F+Qx4Tr
	yHxkLlZ2q4YsaPbYXlSUJYbhgO8LE1WPOykoKwISdvh384oAOkyz4nJhT3efaQYH
	xD1xsEBHAoqyAdG1hNtRqely/oXDlWyRzJn9+fFZAjc/DI5qyVAmRAWC52bJNp8J
	fCniJp5gmIwO+ycHF/qILuPcdHgFbS/0SlHpuf06vO/IrxQRNh7d/Sf+3aZHUnV4
	IJ2Vng==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddacrhxqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 08:58:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89e9d327913so23756346d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 01:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775638697; x=1776243497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qL7PDtfGlQZiLJDrztVf44XQnSa5r5vuSGqc/zpJnTQ=;
        b=FKH5/MnxNVwiFgoZBZoEiT5+FFwOzFBdN0051rGKmLWs+0nOiEcQFozdayhjwSyZuz
         VF8PqsCmGFiW1udz6TqI4R3TyVxBdLbvqoB1W7UJ/YvkShGoeo5IDAoB2LpoFDZgm4m0
         cNh6KgCS9fyWgPE4Sz469DOtXR6hQHXLSfG3YG5fI6hK75SxTQ8CTcyBrGCiuIatEzh8
         r7z7yw73Iys1gfU05025Jdysk6rkMiPoMPgVAD/GRg5xzs2hIUY4wlLyLxw96HRh2CfO
         D5HPAak1HcZtoefE/z1EchRVLK1xcPe6su8ZNfc9Y/ksN0HcYZ3PfOj2AkfH7fltLWbO
         y9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775638697; x=1776243497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qL7PDtfGlQZiLJDrztVf44XQnSa5r5vuSGqc/zpJnTQ=;
        b=ViQjixwt7Vj6WxCVgWdzwyp3MzKK6CRr35U1Vp3MZQWQoYY64Wcp0gVpV8h+r0prrd
         R7OOrYJE5DiW2/Sl6LUsyhIc1ANTvhz+PYNAaUL+2VZNHkHNexY924IXO8FEv1enk2Q4
         UVzIWbOhobEN2+vtBcZvkavmL/iFFJhBO3Z5T6V164KYK9w5Jn8yEFEQl5uq2OY5uWPF
         pI91bD0p4CB3/RyEQDyXB1GrXXxampkbsu67yU67hBxLNAwLs5X6GGzZDa3UNKVnYZCR
         oOewMAtJ3mIaUqYHhEOg/jGjxIFv3Hp2BC/apGl23ePbCtgELHMKLo3cZyDzrm0wML5A
         bO3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXujRRa0M1Ri0+F5MWxdk7pzthbdMSw2BN9xn6cto1R+nTpv+XyQsNSuEQ4CXtSpgXjQQnyVaxenlPPcgLM@vger.kernel.org
X-Gm-Message-State: AOJu0YzUaq7DPiKQplwOtIfdUbWzSUyNbqQGxjW9lmpVgAPZzRAAdKhi
	UZCmo0CZsuG8P5gFpZn2L+sPKbL66mtIxV8HOjagMTSfdvHqJsWp0xpiGw9BhmXkc8Qk5HMgy0d
	eH3MwA2bYiZUK9hmCimXItu/s3ihDkyUZG6woQ/5LUg3trPOkZhx3C9HFtJ2lbMzKOGfj
X-Gm-Gg: AeBDieuPjUeN7gtlQC7k5/HVGLktlFIpCNX77zodO3B11xD9jB9MX8vyilirivqZGym
	4WVh6u+4VKNkvvc0qUMHEw/qiYRGKCHEpoFf4x/R2KgrrZOjWrLac1+ztDs8DGH4VtBDJzOjNt1
	KlGUfo1QdIp1BhWK/lL5Y3De6a29CM5Pi84SW78fl6zFhUwicmMXjPTsz3fNGBYb2LiUjJQkXLQ
	J8BDaXLOEkDetq6C/892rv8APOLoKB/imF+Gv8LBkmhE0t1VVbLYqcaIZEu6ELkpFo7ccyQyINh
	x5RQzty8ErJkwN4MFvObEYn733xt8K29JVMFudbQemzPlcNceVqgOc3uwhmY075meTrt9xvqR3u
	JFpc7dM55jA4t5RRhU1yS4idqqaraOnn3cyckFIpPn89iLHlHScPWkNNWhg4hv703eOzP71jI8x
	RmePY=
X-Received: by 2002:a05:622a:7292:b0:50d:8667:6829 with SMTP id d75a77b69052e-50d866769d0mr92898401cf.2.1775638697508;
        Wed, 08 Apr 2026 01:58:17 -0700 (PDT)
X-Received: by 2002:a05:622a:7292:b0:50d:8667:6829 with SMTP id d75a77b69052e-50d866769d0mr92898201cf.2.1775638697114;
        Wed, 08 Apr 2026 01:58:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c9721b6sm612375166b.10.2026.04.08.01.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 01:58:16 -0700 (PDT)
Message-ID: <cb21fcd3-b924-4cb4-971a-9e56319fc18c@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 10:58:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 3/7] drm/msm/adreno: rename llc_mmio to
 cx_misc_mmio
To: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260407-adreno-810-v3-0-30cb7f196ed4@pm.me>
 <20260407-adreno-810-v3-3-30cb7f196ed4@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-adreno-810-v3-3-30cb7f196ed4@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jwa-aq0IKLjmE973QHYfuoJVEzsumQxi
X-Proofpoint-GUID: jwa-aq0IKLjmE973QHYfuoJVEzsumQxi
X-Authority-Analysis: v=2.4 cv=WZs8rUhX c=1 sm=1 tr=0 ts=69d618aa cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=EWmrOR-qnjryNtOcuEoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MCBTYWx0ZWRfX1wk0AdAV0f5l
 0/K3ZCZkqlO1aLawlA8ZI3T2RzxSqbATLGz+bmxVI5V/PXLC3sf6A5d2HbeHXaPqudSjLUkFreB
 h5JNqoKDOsupZa1oU8ZukfsGVcjGthyfRv8fldx6V4V6zspbwHmZ30frtHrsEqNOyjUdeJ/MMNT
 p/rNyijPiFWOFdyCn6ySQEp/540F9H3JY6uihf+woEcYHUQWF8A+a7YmzClnATgT1KU3s3QQjht
 pBahzqLHbfdumguBznzYkww2eL4uDgCt9rzP9Zex2dMarQ5DnO6Q4kl9u5Bfxcx9F1r+wQkSWSW
 4Br/SbmsBr2LQS5PFV47bzWljImHErkOYiDHQdAVuCEIatkycHSVNFOwesYVPVmvfycs9tbHIOy
 0VlDTQtEkcfsV4xdBXv8+AYloig8xZPqa/ltYYHcQwoJur5uOz9RqLKHxfn3uTpCFRzVjVhK0F6
 iTtoe0Dk4Psie+gWYZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080080
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102277-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[pm.me,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E40513B9831
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/8/26 3:45 AM, Alexander Koskovich wrote:
> This region is used for more than just LLCC, it also provides access to
> software fuse values (raytracing, etc).
> 
> Rename relevant symbols from _llc to _cx_misc for use in a follow up
> change that decouples this from LLCC.
> 
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Seems you lost my tag

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

