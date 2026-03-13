Return-Path: <linux-arm-msm+bounces-97600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iK52KvtGtGk4kAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:18:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F03E287FB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A01E3301F6A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18273CBE85;
	Fri, 13 Mar 2026 17:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y+5pucW1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JmDkCA69"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA093CBE72
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422329; cv=none; b=DXCtW4qtSSOLLwtGZNcLA9hqBJldkZ6fg/LDgoP7PsOMZ0lFU6uepVUsUr0A9W766ncOydUbtgsyBd+f6F8LIOORVPuJZjUNZcWc06AOE3KxmwzhmkHsifzurCELGhnzncjDOQLy5teXtBBRR69NvmG35RV9UUMvDjdDNLQAJ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422329; c=relaxed/simple;
	bh=7bvPpOlo3Hnsd5JwuRJwuLjMVqJ7gchQWap9fGysDtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rFs6cl++5mC7feNgzj9s2dwrwGGa48Gx6Sx1vX4vdJA2zo7z1OmBL6UVgtBAMLAZGOZgq3cxSEP6gPLB5LSXgpCRc5JZ3ET2Z9VIpikryLse5hmLTMHzdXJiCqw2nnCrzbP1aZHpxAeTWQT0i2JYv90obTDz+AdNSaTg1TW7Qbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y+5pucW1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JmDkCA69; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DA84ZQ1749407
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tKYh//pluaHllMvZiLoXWUrU
	wmatDhGiwXWuaVJJBw0=; b=Y+5pucW172gtZadTDwX8j0ocOPwk8tDzb+NrgSuV
	3LuqtjXmOX7NqRc3OANwSndO1eez5JNeA0+wLyUEIfqk2buet0qA2WhKgtYNQ0P7
	tNfyyw0VVRydsyr17nIFG2g5jrlHbTn6mYURvOrIkd2UUZzpZQN6N6xkH8uc8k8p
	fdcpx8F0B1du2nC9XB41tgvtXAaigl7Jk01TAdb2TV8n66NUOysMS5wUtFg1BNcy
	jwQSUlRqntLWcIETPWG7MrPThfDfqMod9yjEglwjTLYTef7Jx9JRJeMpM1MrtvZN
	BVekx/xxVfEheadlwT/svf2vbxGWH5e7y+7Rtk4HSlT3IA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvgj6hdk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:18:47 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffaa85b95bso18633354137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773422327; x=1774027127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tKYh//pluaHllMvZiLoXWUrUwmatDhGiwXWuaVJJBw0=;
        b=JmDkCA69+gFK2QNI0x0AWMahWbvHJsyvutmdpX/8hGphX+fxfDamI69XWuNAmfq45n
         VcRhYcHNGgD80Iobv/lMtNJHxc4DDJrb+FiRKLKliNfsV0jf9jQYYz6hDIv8SDnOk+f3
         P0Cr7F7HH2hLAuGeRddszRGbTxfMNdK0yhh53tiGbsS08JTBfxaFHT5G1pyk0JwpmUw6
         av5d9682k+pt/EDCkXRfqt+9FmVrh0XU/KxhdCDMeY9K5U1xT5g3Mujl2sloxuwTR+B/
         +Q/CoYB+APAPZexbQiuTsLN98xqSB8GdaWjxEWFi0spBLIsIVLUvJaMtdnYZrP0add9l
         L/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773422327; x=1774027127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKYh//pluaHllMvZiLoXWUrUwmatDhGiwXWuaVJJBw0=;
        b=qfqUXaD0qPc7kkdV/bS2krqZGU6x3UvgCCFvbEmNzf1vXBNHdyItFnwvn1oK31HXDA
         Rm4DWb6OrcCHdWVr/vNRAJOrv/+1WozxRWwVxjpoL08tJxe2zVmQ9Btkc9Z99NB3TL3d
         ELr9/87v2lhMQCeZoFbly8zhO1gzofC783nRM9JvdBba7zb6W0Zz2r/59GIU3ef1rirv
         OF03SjNz8iyZVyEB+b6aKVsAwbWnMmjPh+OOsEOXZz9Z0gsZ7FWCjQYbsjszLnEbpVZI
         Opb75GUziRQ51BJJqoV/9EN8X7hED87F7K36dMUUZGB6G46utmaERgquIqIIrGwlJ74B
         VbcA==
X-Forwarded-Encrypted: i=1; AJvYcCUFPGILJpxg47pMDQZPMP3VFOZ/eydenkT/r+jcPfEZCD/HqzaLY04ELglenBEGT5VSAHkkLE3kj4tNZEbU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/aNDUklIFNz8Xb3T9ou3XeXZsFar/voJZrHHDKaHli9KxSuVd
	XkDe0cWbIH8xvy+kHHReYeO85XbTQZG3Lzq3lOrzNPo7pqMUAZGe/pruUgbbT9YcWThXjZUMx20
	fGMF5SbM58XfBZL/oTA3gnKR6DJCcTrJODhfpTZ6DL2ui8v44d7WB/+OK6IVEdiDJAdSw
X-Gm-Gg: ATEYQzxoU9D4NeZTvSMhdC+cZI+cNHBohDaRCzszqTEqPnN+RW6PyQwhBn4mZB5sOdE
	z7AuggbhMUA5mHc32rCKpvBYklluxH9pxfB3akG3fXXhOTUaCWM7KqzmFcNq17sgd1WiVmUFnoI
	cl4uQ4CLjycSnBfqqUjWrOOCwR9+isCMwoiXyzVuv3KXpgWjTJwNxIIzVRSqcLrP/tVQwfmKnmy
	JCUPRLhPbJFulF8pQJbNdBRpWOF9ZF/IQ7udNAK3KXkOWtq4hLfFEeDpDkGUjD9NR7H61IVnIl2
	036v8z8UfcKmpDa7Mo1dP8W9PBpyGd8AJZ3Y4eldT36gm4djk4vXAXse0OGa8ps2BdHDIIzheO7
	9mPXdy8Y0K65UXB+fWXIxt30sQqDqoU4ZcNRmro2AWG7IynSIF9FQH7yLdM4SinrU3k+Lwm8EB8
	hieH6GlKVg1rUpTR7EnbFm2beiIxb8iEMNYcc=
X-Received: by 2002:a05:6102:5488:b0:5f5:5c2e:59ba with SMTP id ada2fe7eead31-6020e93d747mr2038735137.33.1773422326899;
        Fri, 13 Mar 2026 10:18:46 -0700 (PDT)
X-Received: by 2002:a05:6102:5488:b0:5f5:5c2e:59ba with SMTP id ada2fe7eead31-6020e93d747mr2038723137.33.1773422326483;
        Fri, 13 Mar 2026 10:18:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e67b73sm16445161fa.30.2026.03.13.10.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:18:45 -0700 (PDT)
Date: Fri, 13 Mar 2026 19:18:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: defconfig: Enable S5KJN1 camera sensor
Message-ID: <xq7p4vftr2dhu3lzgjcadond4d47ayzd2jxqnyhq6eozziymbk@walmc2hsxrl7>
References: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
 <20260313-fp5-s5kjn1-v1-3-fa4f1c727318@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-fp5-s5kjn1-v1-3-fa4f1c727318@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEzOCBTYWx0ZWRfX2TXCX3gaXOub
 Uhx+6tFDMfCA7HUiU/MpGM0eGdtpr9Kj8R8TChxIdEXMbg7ni064ElLqAEzvkzWMc53z7cpGwbV
 8UBQnx12ZujPnAsAGtGGiouqVt3ybvEet3Fgc/nkE8T1lv0mozyOmSodeDq9j93OxbqBXom1VrR
 NFVQZDlcGCnulJI1vY7aS8x5dodZ3iAy7nLSTPw9AJlVl3OS5i4ZfILJvyzQOKtVrcXKPGpPy36
 U78vqXWob6OozD7SPYMy2U/rAO0ldSURq3DnZcFrs1IF5nj86ZZJxSdq+v2JmS6UpDL37XG7ytM
 pMEANNmzzJQ/q397S+IvEZ/YBhaT7J8P2H+iDmq8ougfu8kp6thK5ZG0ydYWgfZX9kUqpB+F0KV
 8pEbD/IgTcqpJ5kigRX6VOM5le+3Pq+WfQuayg/F/IM6Yax6IpuRGllH9A25CIhZg4/B85jSped
 A99fZFhdzoceEWo7lsA==
X-Proofpoint-GUID: HjL9T_L_uzU9B9TAH6iZjEbz1GYoOBwq
X-Proofpoint-ORIG-GUID: HjL9T_L_uzU9B9TAH6iZjEbz1GYoOBwq
X-Authority-Analysis: v=2.4 cv=H+vWAuYi c=1 sm=1 tr=0 ts=69b446f7 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=qpRG9-ounqMPCAi8cIoA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130138
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97600-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,fairphone.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F03E287FB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 05:00:40PM +0100, Luca Weiss wrote:
> Enable the S5KJN1 driver which is used for the front camera on the
> Fairphone 5 smartphone.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

