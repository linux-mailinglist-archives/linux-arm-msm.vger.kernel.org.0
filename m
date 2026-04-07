Return-Path: <linux-arm-msm+bounces-102097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JK8A1TS1GlJxwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:45:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CE63AC419
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B133D3004587
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 09:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB97A3A6F10;
	Tue,  7 Apr 2026 09:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GHXcsII5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BM2LZsnE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEF03A6EFB
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 09:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775555153; cv=none; b=PYFmfhH08M7QyV7byhx5c6ntDIzGK9vT4zdJ+F4S66ZGmelb/Sezcw2C+dRo3rtMXaYis+JfRwcWG4icfFlDL++c803H9U3d5xWQohufYKN9dERnsuQyTAAqZALLjZNNK9q6sFI26HQCB+s52au7z7a3mXRkklILPxp0+VEMYg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775555153; c=relaxed/simple;
	bh=4vu+xpeoaYPyVCYQG7c7Ux5C2i40ZI/n7vWOXcJWAa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ltzsz4hMWHCCWFF07Py5QVuzQ6AOHgfCq+yMFt/Bp8XerEZA9NVv4chrFrt7lKJZFMMrtpJBfOFVYOrlqRw/Ehpwl7R7Pztp7z9jPdL06QkICSg0dtNzJdQ6+AkuCXriwfM28Arx6QRucBqivOC1c9bWP2WSGkjKJWaPguwvLi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GHXcsII5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BM2LZsnE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376civ83402379
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 09:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cfskHRxWs4Q5ZjCixV6bAcEHRAVNhSSPy9XEfrsCxLc=; b=GHXcsII54awwJtTj
	vlbtWSyiu1jswi3cOAxhKlnjUbzxDKCh2Je2iKAxisMM/VaUTHMheBRX5hC08aLN
	/riaLY980pg/7sVXdjm+ZnSO2jjnAcCraJVzR75R5tTWV2wbR5r/86ySuj0tUr69
	o8aP0M1LNuXzcL82lAwdOS7qyO/gqrppr3Ov6ZMdGiuknSJoNyqwdw0dAe4F7YlL
	qlrpx/bNXb/JChWcTo58eyeUwDfsMqTyl5uXHc06Zko9cNaXl09JrVFU2iTD6ROu
	92YJ8Pa9qf9f8RPwyIcZLe2jS+/mr+bpQoNU0MQqfl8bl6ytsZ9Zi1PY3dswfc41
	uT9CpQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrht3tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 09:45:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89cd0f68ed4so19971886d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775555148; x=1776159948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cfskHRxWs4Q5ZjCixV6bAcEHRAVNhSSPy9XEfrsCxLc=;
        b=BM2LZsnEyhHOZj01JAIcrjBzAVoQ/5jrJ1lchLQUQZws0SjsQj6J+gj/mYPKY8JLCV
         C/bWjGMUjuq6qtQbNxLybQrEhAS+Qu8xsT4Ot5c3yqfA8fvWQkW0e+FprFP8zRnw7mKL
         ocwNAZpO1v0PM346+c4/QpWCMi7o5PillHmu04sS07sldib2evWnmD87r/cDEo2zfY9a
         oaXBaPeCDWx62Er/SlH1C8qgah/ZYm2Co46A0frTP1pmIn5OjNcARmKujrtY9F9pf48k
         TJRIFRigyRjW+qlzESuF3LO44o05+tzUVG852up0dyldpUU0O9WRBJLYyem8QRT2/NIy
         Gr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775555148; x=1776159948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cfskHRxWs4Q5ZjCixV6bAcEHRAVNhSSPy9XEfrsCxLc=;
        b=sGl9zA1ei8SxwWFq9NKZxnTm74ZV1b2VZlJ47G82RHrjngK2sBN8xZDwHbgIe8zmNv
         bZ48cJLG8zeA8ePXqBBKUIeoS2Q7l3PlaLwZ+ZxSXGJZV0OAz09KMFi90BgGov3+5swk
         9p8a+D25FgzwC2TcgecVUbFHduO382VRWslnaWieN9poGsn8ETlkIW2DjeVp8BGfzVIa
         sST5FJHGn5ckG/gOJ5cj0PCyu9Sl0HuKRIOSfi7Lg1blM1bpf4SrN6H5sfeXkspzwtQv
         92TVGGdLlnMdlG7PppOKMNRT6UdQN+rXn+FqMyuG/cY5krNrU2tGEqpPr6XwrJ6pkm1s
         VlBA==
X-Forwarded-Encrypted: i=1; AJvYcCUIXBjJP6UgVD8H1bPAgLbu0rhYXPB7BSm4gBrUW3andWsb3dawyMLJ0vQksR/HbcnECJ1UfjvzyK3qmNUr@vger.kernel.org
X-Gm-Message-State: AOJu0YyUtYIFZLM4wzwNcbFYbAoo4ENUB7PwKtC46gBERCH5wpfhwmYp
	IPdHStheZR3kZQ5PIzdpu16dpe9gdJ9/C3EX6RUXirP7xBT+zizdyNxYNwVrnr/szYataFl1dlJ
	OyI4cSEUTllqERcxss5W2UhniyyZDKFFVfYqk/eLR/vzrQN2iU6od4Rf4bQlntGfVtLah
X-Gm-Gg: AeBDietcJlTGckqb/PDw6pUAF5LAFWt4cUh+tgUDlWtzGS0vHmFAsluL4HiQ6LGgs4A
	VNz9y5z1hlHTspUds2UW4iuHdTlE1ENui3vTaemX+cK/gWGuC8N5Y8XCfEqVQ0y2Ub/xulRrI6i
	jqPVXTJv+BENhh9x4xpHBB6WzZjKSkdfwadTPGhu+koj4negCoBzaMG/nrVYHX7PwnvyMQ2to0g
	Pa10cBjCLSrdl7UQ1UYlF8w/XlEAhvySXgEmijKPSWDG+zvyZGjkhlxAgQIapDwNiS6q/nvZe+/
	JikJx88KGVV+i2RRYDdrkKjghY35tYUbNOkADQpIwnSP/wApEAdYIahjvYLrijGa77BW5IWa6x/
	BsKeuEzLcy2CVdcEUwJu+bRiisVeIuLn4KwZwBD32Rz3hVFRYCxu11Yg5m+SMtMMbh214xAEudP
	J0IVs=
X-Received: by 2002:a05:6214:5090:b0:8a0:ee7:7abe with SMTP id 6a1803df08f44-8a7022bbbf4mr191172436d6.1.1775555148588;
        Tue, 07 Apr 2026 02:45:48 -0700 (PDT)
X-Received: by 2002:a05:6214:5090:b0:8a0:ee7:7abe with SMTP id 6a1803df08f44-8a7022bbbf4mr191172116d6.1.1775555148162;
        Tue, 07 Apr 2026 02:45:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c47sm516276866b.41.2026.04.07.02.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:45:47 -0700 (PDT)
Message-ID: <1b9891d0-39ca-4b31-a21c-32d8954aa7e0@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:45:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/6] drm/msm/adreno: rename llc_mmio to
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
References: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
 <20260402-adreno-810-v2-2-ce337ca87a9e@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402-adreno-810-v2-2-ce337ca87a9e@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4OSBTYWx0ZWRfX3PrwaildGEIw
 syJxlWnXGJHA0JFp0xqgTBinM41jDlwJDxzMojsI+0DZDN/551c9LsGLH+r1zrnQXmr1V3/0ScK
 auF/Z/QE1qzThKB/NLwwncDtTGIFyN7fcdiA2z6TDcDl+22EhzSU6Q4qC9qpagAhUGiWyvNYZ/d
 VmVrW8mdwFT5hxmNqg0pwmZlFdwkOCReiSuFM+EAS5fjfqM/tdFDW0o+wmmjc4OahvtdFFkTV1j
 9OsoAcxUT8wrzi/EdpE4rIvlOAF4yaVR1qn5CAIUqjYXmegPuC83hmmAvAfWphPVedwCKbobEnr
 x3gnlkncH8lg1MFs+HFCescByJ7thmZ1kZNpJssfgktDHFot57bZm94cPgHwri2IS9sx1FCW7N7
 7Sq8kMrHv2IB7ecCivXF0IfvaANjga1eV7odsoRNfULaAYRKT5MRRK3Upn5rsGgV4FvwDXZtaI0
 OhPoE3aV47n4FhjmtHw==
X-Proofpoint-GUID: OBXZHfYR8wVGqhVTR10M16Nit7KqWFTZ
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d4d24d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=EWmrOR-qnjryNtOcuEoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: OBXZHfYR8wVGqhVTR10M16Nit7KqWFTZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070089
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_FROM(0.00)[bounces-102097-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[pm.me,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c04:e001:36c::12fc:5321:from];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[78.88.45.245:received,205.220.180.131:received,100.90.174.1:received,209.85.219.70:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C0CE63AC419
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 1:09 AM, Alexander Koskovich wrote:
> This region is used for more than just LLCC, it also provides access to
> software fuse values (raytracing, etc).
> 
> Rename relevant symbols from _llc to _cx_misc for use in a follow up
> change that decouples this from LLCC.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

