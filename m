Return-Path: <linux-arm-msm+bounces-94804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHBmFX5OpWkE8gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:46:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAAE1D4D84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6F0D302D526
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 08:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1E930AD15;
	Mon,  2 Mar 2026 08:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6FZQn/V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SQr73Kov"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67958377018
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 08:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441018; cv=none; b=AyGKYOSDFrCNC/Ejty0i4pMoZYtMYRRRTqbmIimoIDtD/uH4p6cpBa9nzqLwW76QxMZbRv7qPIgD6tjKxYxyy3cywHKWCbob+RxsLm+nPj8T1XdpnsTNyY6JK3hg76u9gSore+z4IsXY/Hlvz6MrZbR99VHcrdDi3K31Eo8qTKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441018; c=relaxed/simple;
	bh=/xZ2osG6NIrmnyZ+TWhCavfR/+FAn/7RvAjDCbyOXRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mm+aimugpRgf4YwACipg7bq64xjsnu/NbriOPE6BbHAbu36I5FTIxO5JeStG+gxuY7mNIpnl+9w/7QoQ8eVyxwGQSDTBCLH2TmWWeYsW6ean20CS6HJO0BPUh01qCmgU8yxPecWp/dGM7Qf5zl3UJzVbKEELfqjkSXGFHaYPzWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6FZQn/V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SQr73Kov; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62288uNw2399767
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 08:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kzhcGz9kiSv/N4brhbDMgmBjGdF9z8YyVnAXdkdzS5I=; b=E6FZQn/V+eAhBHn0
	8tH6CLUWeLzRwHKNoHRBXFhESTg8oppg4/shnlBIJSpK+UUNYJAXzfZDV/Xew3cn
	gxxUjFZDbR2tQM7WKMRb0DQ5YsZ3IetF4VzbhlOYem8u3zzwysF/7B3IB19HrAPK
	ws+FiOiFDsF3Q4K/mpYNHAUf9JkNiPHXP10RACAUFmWye2LgYHeVX3Mh9FGZbirm
	TplyKHUGAQNGq1kLz6AXSsZlDeaY4QjdkdTLnyTxJmMydlc93l7LSXqvo22pHurH
	V54k0ahuW39O9Ba6kfFlEUEaoRsTlOo7SQD+XQZAKeOlFk6xUqJo0+N5OEtXWA0p
	1mENwQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksg74q47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 08:43:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae415b68b1so17956515ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 00:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772441015; x=1773045815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kzhcGz9kiSv/N4brhbDMgmBjGdF9z8YyVnAXdkdzS5I=;
        b=SQr73KovA7fHWoQANAgttk3PDCptr59qoNUu6qCfuHZNIIyWDWAmO2dLuD4UBNUMp9
         YgCQm0YLpHjA3ThD/gv3ZF8UOfe7i0hdHaGcZ7a8GYXdhOBZY8ETI/KPpOtPXckgMQnJ
         nuxXiZcl6G1XRaRQLV2TVIEp4b6MBnVwaqnqg3efXfhYvMtiB8XfaFBx4Spfl+erxfwd
         1DqqyKjq9G8wYHsI+tgfh3b72y3HVfb4EhyJayBecaaf+l7I5FhyC+LeiVnMhgIJmT0j
         Tbv75qJ3WOw5J0YNmskK3st4keUiEVVoj7iyijsoEuqsMVSULPMftOE6Sqc2Xc+vJSKR
         QYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772441015; x=1773045815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzhcGz9kiSv/N4brhbDMgmBjGdF9z8YyVnAXdkdzS5I=;
        b=r2IQuksAaFdaGQGdfXQEWH+DEm3MaKD8z21Zn9IW5TWFXiMGiDYEHEnGKhyONc0t1+
         b9dvfXncm+hl0l/XAOboDC7SILGkNAfORapm4mVcW7qe0eQOFXh5WoehEfL4/KsVdBCK
         dLVLMnTI6V5APUHokpK8Mg8c+d0Ch52YT4ItOA01eerafmec7XTQUkRfAgaOs/AFCarA
         XEOirDbLEbRFme63jEzObolxMayvt7rjaGdDbwhophb+J0odWA82OZ56topx6XerpdqN
         yKqOXMYgbHHIqqKPEjO1lr46fabmRktQNm4RvueF+p3Z4uINAjBDH7DNhgp9gPaBZ3Ro
         dCqA==
X-Forwarded-Encrypted: i=1; AJvYcCWCp2J881b1+uRu5DFi8FPMaqRmuIKzCRg1IEdiB56nDFGHO30qFZV1t6hrmFovsl/m4I5UwyTzoNpBRiIG@vger.kernel.org
X-Gm-Message-State: AOJu0YxbzWqXSLxH1AMJXsN2elj7tsUOes/m7X2UtZmuS1NmpuEVZr1S
	KaBibgKZPK4X57WzZoV6cCtSuAXRbk86IGWkZlPVpY096hXICz0dRa3beoKYRhIqXJb5udaBifK
	84oTwiG14KX6VdoMeKjREe1KbOHdtTaTve0F3YEvfsDNyiVtUU5kuQREs54caoy9adUf+
X-Gm-Gg: ATEYQzxv3u2BMKfQKMa4UBQabFTrdl43sVJKsqoV15ze7v5GLB8uqbNndNUSV19HnfD
	IeQ+nfGUj5dYCEM9IO/NrUKlC3AqhSg1nLtl5zMMy3optRq0dNTnBpbEOmKhaVal9klBlMzRGKu
	oIORR13tY029adt9+hr+TylXLE5Jg5P0WpsvnULFNpu2WEDw6y0A3Bn4Cepa2gDSXZ3FqVtuHx9
	admiW0Rgw4ke/i4c1PY/1ymomjiEOo81xjKYG+khmsNp20/KktyhydTVOUG0uAluD9oFe6hrvvv
	ZAL0h/6eDWFsg6CxcHOoDD+BxsKP+9w24d9aVzRUg/Dp26Vdrj1P4i3bF7rqV4LSweKfmaCuppC
	jFS8lROapOGMmh1ByVRsbpj2Xod+gcq4rePZdVMxgxeeNxz3lfg==
X-Received: by 2002:a17:903:2352:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2ae4a4e1f37mr39247935ad.25.1772441015348;
        Mon, 02 Mar 2026 00:43:35 -0800 (PST)
X-Received: by 2002:a17:903:2352:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2ae4a4e1f37mr39247665ad.25.1772441014848;
        Mon, 02 Mar 2026 00:43:34 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5276097asm23725485ad.34.2026.03.02.00.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 00:43:34 -0800 (PST)
Message-ID: <9eb6d9a3-268b-4dee-9fab-ec59322e8a3b@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:13:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/18] accel/qda: Introduce Qualcomm DSP Accelerator
 driver
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <cac08f2f-73b0-4629-898a-1e24840910fd@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <cac08f2f-73b0-4629-898a-1e24840910fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1go5Fk_WaSPHT-oGydDRQtzFxuS46wbP
X-Proofpoint-GUID: 1go5Fk_WaSPHT-oGydDRQtzFxuS46wbP
X-Authority-Analysis: v=2.4 cv=FaA6BZ+6 c=1 sm=1 tr=0 ts=69a54db8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=AnEmtbbmQWdTvrL9bUcA:9 a=QEXdDO2ut3YA:10 a=0lgtpPvCYYIA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3NiBTYWx0ZWRfXzNsdGrE6Qy5g
 0qsXXRbvfHZ6H5YBRleRibE9wO1Y7Gl6VVqmWmj6AM7CJz4KYFHrHCNjCfh2c+bbtEhUTcdURD9
 gwyjL3hEAZfIS+HuSQXVDtM7PjCPxOUfWpRX2iy8yKKLkhiUx0fUVVlccYE/DbpYHPtqiG6nvq8
 LJh+hPiaSnA3rsc4vQ4ksjXBrNZTuUM69s1hP4Beq4NXbxqlgon4ov0DMR+5CcD6w5sFLLRJ/nU
 zS4hg+viSTUSFhyNk04+XeZnt/nxH+GMnVC3RjMm6vHKg8lpIhfyOg3bDzyl3kmALrIMEuaG5R2
 63kfiSYXbHGCy2ms8RVm23NPV289/JULTSOmKO9Wm0nrnHq5ctNMoqSEXxvK1r1mypHEOLf3eHQ
 4UDTmZcV6pfNNLo56ZGNCNdQYCHR0nirHh2V1Vu8McOPUBql+EoDkryZn5lZMUMsMXw4jwt5u3o
 HpjznDLK9MRL4dVcWXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94804-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EAAAE1D4D84
X-Rspamd-Action: no action



On 2/24/2026 9:09 AM, Trilok Soni wrote:
> On 2/23/2026 11:08 AM, Ekansh Gupta wrote:
>> * Userspace Interface: While the driver provides a new DRM-based UAPI,
>>   the underlying FastRPC protocol and DSP firmware interface remain
>>   compatible. This ensures that DSP firmware and libraries continue to
>>   work without modification.
>
> This is not very clear and it is not explained properly in the 1st patch
> where you document this driver. It doesn't talk about how older
> UAPI based application will still work without any change
> or recompilation. I prefer the same old binary to work w/ the new
> DRM based interface without any changes (I don't know how that will be possible)
> OR if recompilation + linking is needed then you need to provide the wrapper library.
I'll add more details for this based on the discussion for compat driver.
>
> ---Trilok Soni


