Return-Path: <linux-arm-msm+bounces-99607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GTVAPdmwmmecAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:27:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8095A3066D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:27:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C2D43063B55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0973D903E;
	Tue, 24 Mar 2026 10:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h91XH7rc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i/Zy3+II"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4250F3C944D
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774347579; cv=none; b=oEBCWypls+XARvTzg62eDKE8AipNPako8IhbFUMXVBESzCRsoXTn0EEcgZfQyY6U47iNaGegq8eKUlSsgAAOOiJktCyGnd5Tsl6wpqy81ilH/yBG4isGJmgRWi3QFbopms7Aed903KmBet3JtVFhBiEjzoQ6E1/oIah39HaxwA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774347579; c=relaxed/simple;
	bh=RtRvzaOeiOdps1XzrsRqj8yW+jZ6AfFX/Qd3D1BAMIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WGeIg4PgFE4mbCrQISnoUO/5sf+yZ25rjLFvMdqGxJkWb/6Ho+0deQSqgaM/wLin8uErPZ96bCfWcq3R0App1k734YBwFOeiLKNj8SQuXQ39bnyLjTPjiniLCMNiiqGaOl2QQMYgf+wMDDY6Kga6mk8d+ABPwDMq9hVusyFNswQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h91XH7rc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i/Zy3+II; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9R0J33934869
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKixAeLWoJLGVNQVekhuVvT5gS+Oyk19qzq72tM18NE=; b=h91XH7rcJHqPCAfu
	G+pY189rLDu1muW8+dnKCceVhZDdEi07XOOGUr4aoR9W0Fc2laZ/V4qaCoSE/yOY
	2XG34b+eEbouMjFVJT2zXsQA8whL2wSzULTlbPytNdFmI57Ps4P0gZ8w2SVJc23h
	3PErbHOGsLmKk1ef58AgMoSKremKyvATuUvvDQrtGAYZusbe12JG45TeFUdYKwi8
	X+CKLOzN3EcjEGVFGPOLd+3wZ2pnTTSKJZVxCG64nUCaBE7auuiqOivJqX/TGTTr
	GDwjpd7TMnC5bMU5f6BDQG7ECg7M+6nAqbFila2H6pimyRN7IovXyBcIbtXnDlSX
	3L0/vA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0kx2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:19:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5073ed1ec6fso50489361cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774347576; x=1774952376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CKixAeLWoJLGVNQVekhuVvT5gS+Oyk19qzq72tM18NE=;
        b=i/Zy3+IIoY7VcPwiXSweZ96mGAp5VXNn6XQrwPVgMpT2afsGpsjhkyOxMGPLglWUAM
         jPzinLWGvCXY0bvvQz6Nw2M/CB5570vrNXwgBtQulbIwMpo2Gh576n1+hRF8gMo3/jz8
         phiCvAuM+ideqBG1vQrNqN0sV4xuTcx0TV3f5ao/yVTTDe4IiWcUs32rnqtr8xlIOgax
         fdIrHDDly6l0K9kGMShbPZvyBoemQ0ZUNzGZwvctuWMaN+MX+mn+Y/Y3rXojhuMTBY9Y
         jwtO4E11INWGCG2cBMuO4v0kBVYKxI3tCjdGKw/wiMhX9fKw/GpAFzjcKKrAB8di/seO
         INRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774347576; x=1774952376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKixAeLWoJLGVNQVekhuVvT5gS+Oyk19qzq72tM18NE=;
        b=Cs+rOAm+7nkHsEhKCmv/9yJ46kPiv43p8DLWTPpAkFhZ771+ceDM8nGgQeJvJVeADW
         noPXKZLizkAiq6kM6wxWeN8pn5iFThSQeViCmYQQDDHDtImImiffYrknedAz2tlBy0lf
         ZHgyv+ixt2+yGAccs5YJkbRjewqHGBhJbJU3bxWZDPdMMFgH5ZbprJDqlkp0wD3XUPK9
         p33nSXKlGhpmRVCTOIGhWis7+KURgdxB+Q7A1V4E+3WQdtx77lDZAQoAYHRfRomUrxxn
         Vntjhyp/kZxUlgKGag4G/ZnO695/imcyzH/e3AYW+M0MXn9aD7PujucjU5P0L6j3h6UX
         J/8Q==
X-Gm-Message-State: AOJu0Yz7idEPx3IXhL5WK/6vkcY/pV4Jg23/6voznzTOhsSQktJXzRwq
	mw7UzBBBAitKVgwiuTbI7nJjjQJzAPm6IYqK3kx8/s1Jtk+uxZzFRhRq7/s/M5GWpVsQOhe22fw
	5B2dgn79g/DqRmxIzAPioAZ6NlIr2IuI5q7Wm3R/EQJgKmG8ZR5BLSnf2pwqu/+y5QSxo
X-Gm-Gg: ATEYQzzHbiMvxph/MsiXjW5JGaBCy04329y/iqc7XAtsN4/vCgm1sdoJ3jek7Me/az9
	XVXOoNLWUIFi1NUSbBnhLPysRTqclOqbiynoomBdy5v+XQTirsCoSHcaQXA7KHxFLAOXcxjJEY6
	zGE/KZpWTV9Qzret5RrCzpseTqJw/ZZr7LyvDVir0p5h3E3rqyFPPyZuwURQDGPXO9F+wr1sRf8
	wbr2veIVdsapwxwSfVy8mVYBZGaBnEe3i4bgsYoKFfiL4zDt7Lj1ncmR52q5Kbg72JM3EZVhxrX
	ZHd9X/2VAtzBcsLWZm7n8ppAv5nlD7wN7IbUIjhAYecFMVkszPzIu4xooLd/ZdKYxJtK+jfYDUZ
	phaLRHIXAwGlmLVSTS78d4iFZJSu9kPZq+olHBJzG6fGoAKXi99ybQBzNq9aSupJlWiCXrAaEFK
	CoPr0=
X-Received: by 2002:a05:6214:2b06:b0:89c:534b:735b with SMTP id 6a1803df08f44-89c859c0a39mr169030176d6.2.1774347576270;
        Tue, 24 Mar 2026 03:19:36 -0700 (PDT)
X-Received: by 2002:a05:6214:2b06:b0:89c:534b:735b with SMTP id 6a1803df08f44-89c859c0a39mr169029816d6.2.1774347575872;
        Tue, 24 Mar 2026 03:19:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8dff5sm614789466b.24.2026.03.24.03.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:19:33 -0700 (PDT)
Message-ID: <f6f63df8-8e7b-43e8-a6a7-b561cf1b95fe@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:19:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/16] drm/msm/adreno: Expose a PARAM to check AQE support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-16-fc95b8d9c017@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-16-fc95b8d9c017@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c26539 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jFzL61rkNVMoSztU-kMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4MiBTYWx0ZWRfX7WucOQ0cFlE3
 V0R8n1/kEFLPSC6umSnnrmcNNup2xAotXWQrzgTQU40Xb8+qATHwRRBPOggHFydTdR4WEqqJVTz
 GSBxuTO6nF6WkQTF1hw6n1dY6d+wcxM+Zjp2zxo1NtbO1O0Sd6NHDZYEACvB59O0vFufJm1vE0e
 lVh+C0GlRrfTgWdYf99IFNX5sua0+ZQlKx6h21cwCTSOJX7u+bXHg41xN37mBajP1a8JhDM5Ceb
 t6H6R8ft9onno9uj4IthPyBqnUI/8FiBm0+2B/hl1+9dAB9t9v77gvKwci6a+68+b4tyxlg8OfS
 sLQxujnTpDdCkygSuIIpUkquR1VYDEWyqFS5KUSd/e9gdqqH9Eci0P1l1BlUJ3IaRgikOyWHQrr
 PHM6P/XcomH7JWUWcm83FxC7RSy7lL8kkT/VSaG5hXGX0JBT0aevKg7L9ub8NmdpYPBMyKN7Mmv
 Be2S8F8HAKAAQQDoyyg==
X-Proofpoint-GUID: aDdLHbQJvATr_AkYv6xYZ2GX-0X21mSR
X-Proofpoint-ORIG-GUID: aDdLHbQJvATr_AkYv6xYZ2GX-0X21mSR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99607-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8095A3066D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 9:12 PM, Akhil P Oommen wrote:
> AQE (Applicaton Qrisc Engine) is required to support VK ray-pipeline. Two
> conditions should be met to use this HW:
>   1. AQE firmware should be loaded and programmed
>   2. Preemption support
> 
> Expose a new MSM_PARAM to allow userspace to query its support.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +	case MSM_PARAM_AQE:
> +		*value =  (adreno_gpu->funcs->aqe_is_enabled &&
> +			   adreno_gpu->funcs->aqe_is_enabled(adreno_gpu)) ? 1 : 0;

&& already makes this a boolean

Konrad

