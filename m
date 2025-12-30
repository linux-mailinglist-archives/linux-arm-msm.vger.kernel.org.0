Return-Path: <linux-arm-msm+bounces-86977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA9BCE9C79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 14:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A266E30021E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 13:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544302AEE4;
	Tue, 30 Dec 2025 13:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KLKZdTaj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DO98EiIL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5D922A4F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 13:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767101041; cv=none; b=M8BRJxLQ3FCm1kEKNyrX93b1TrLRIdZvWZoG4RvV+zLD8QyAtjhfDnD9DFb3TWu0L1/PQM06D5BtzfXMrLha17YgT8EQiITjQMvHXsyjvkkYX/vnCRhsDgOL5zqrQoY5FKaBFFYZ+9VxfvJs6L+xliFa6+7pgXIIvCzkVK4dfBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767101041; c=relaxed/simple;
	bh=ueRwGKc6dUuh4vjK8zitLsVaem8IUtCnVornbzI3oS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WQMBlu8zhF24SCMvGNVs1wLxKsylr4ZL/PJQMB0EqOMZ+nbaxvB2aNOYp7B3qw55xkF5JBZrThnWThMsSNJy5/ivD+InFhbj5T0mvLfbtnqIACe+qRpdJSqSNcDUw9GMEZp3tGUiPQLKpxk2AsXP6CnqMOagdiKAxvanJQ8sC8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KLKZdTaj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DO98EiIL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUDDOS03555683
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 13:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lBamiEQy3DN3DCzO+ay2wPm3yXsvknh9NRFFfscsXcE=; b=KLKZdTajAmQZd2KK
	DmQf3wD5kU2AFMCawtEBQNHaXcSnTgjeNAVIb0i6E8fOCY/JKoqrNTEnzdGZW6GF
	kckEENW9V8fhfMVrO+GrrmWv/WDV955MRsuMuSjBXPPnthD6zjveCsB9+GzCiJA3
	LXPLbQaQwcie6rNPHbUSLiwn8PB1hEpu7lH1XLBOAPBEknRZ12+OkBm9lTzgd+2C
	WA0vNWvdfnMCB9BGX4PSbViDZLi1R8suPnu+858XMvH39ucHRJy25jMH9vWkunC6
	R/5ZNtQn9PW8OryvSkotuOKZRzrTen/JWQz18E/h1G5MNqnHvaBRMpfKdk2ZIIQa
	VAfwEg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc746185t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 13:23:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f34c24e2cbso33065031cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 05:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767101038; x=1767705838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lBamiEQy3DN3DCzO+ay2wPm3yXsvknh9NRFFfscsXcE=;
        b=DO98EiILB4e6vvHte7PPCTEWD6ps8Zs/jMZ2hMqxXDsP5GhqvigjVqQX+sg0xyLGqS
         RswhSixw4gksk44s2e4ae3JJaozxbwr6/Tyq0glUhXZfW9VEsVVsaU/oC9x73OLK4jk4
         51qP3QAkc5jQ1K3m35yowXj+dG5oDoEemsOP2lYz3Ompw5ujJ6gYMsKglJFoqQrReetB
         ftylkO0y6nqiveW0SwwaB1ufVd6pX8zxXdyfwikv1GeJrdTAiXTc9gf4HPSUFAQiX6m6
         FM7/Fm5H8BSyPamYQo2pH63tWBKE7YdIxabStq9U2r+q47/plUnELCvxCwAto+RKqC0P
         ZCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767101038; x=1767705838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBamiEQy3DN3DCzO+ay2wPm3yXsvknh9NRFFfscsXcE=;
        b=aK1Bd81jUlqQTIlwoZOSxPWRsaZjZeST/9LsM5Lhx10ylbayiPRvS/b3gXsTX4jEgQ
         Ifx8mw/bqCQ3Q0nvdBctP8FUgt29yUQEkCgWIAuiml2he40iEl3Tuu1fE2o5Xtg+SbSm
         FXnHoFos8gfF6cvYQI/edhnm5MAI/f1bibwY8NKMY70zXNouHF/HhsBAP7Mvz6mpLfPz
         SMSDRHR/BSqqyB6iWQXit3TDLmH1uMTZrfAuCNsYN5v47dOzUPCIe161y9sfvJ5KMYHC
         VZXGSETck1JGtcSsRKJ316Cq5hy5oxG/g+8E2pFvJqEeOYf6avXFr48xBGxP7CbhYnNT
         HKQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeVWw+zgWw17UoyijQVc7uaAnvM8nMhPXERVFxYO0N6jBwtrPNkUZgTMbPLCdfXJ9/Lh7w4qdN7ZXu0DF/@vger.kernel.org
X-Gm-Message-State: AOJu0YzzPiVrTt+uwBRqejT9hjp7wwBHuMdr9CZHk5xFMnurKogZ9pa+
	Ks0aGZhOPI+AWRfUpTC4BN+4Begkbr5rRHQ2PqIn3yPcr65KI8kkNH7ArKalDhZJd8gkinQzs9t
	5QUyMR07VWCjYGNeRpT+wUEMbK/64HBIDrV6XESd5XMZpdPXY34o8Lxc5F+/6pp4HdyVi
X-Gm-Gg: AY/fxX77klp0kXAVaxky8p28CjxxIoVHiOnoZpm4LbuDPPDp0bgdVE1a6HH4g++KKO3
	Qtkn6sc/VNxOoMi6GOKkGmWL6/lALQZifuRJNFK9NW/JzpTqDZsSq6RG7q7As9j3jU1x1yAPdW2
	iSHc4J/ox0wvF5ruY7edG8o8nhtk9Lb3qb+Vmz5FgTW6JkGgo6JukK7jexi0N/OFRf4EhgW71gl
	BtUN1Wc0LlPDg9yyrgG2LRA1AZ/ZKnwQwKy4OpnR471EadWhUBhjcnTgw76kvu31/WRjE9nxPCO
	cu685wlNaz1zDnlxLrEpt23WzKhbyBVlhd0LQM1DhgMDyX8r8XScF4zNEoeJdo8H1OBToQTZONw
	o974xpGJTE95IqVHHy4GEe0bi8XFtlP0pY6ULEQI/XS7jvdvmZbJInRPj8TVofPrk9w==
X-Received: by 2002:ac8:5e4f:0:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4f4abdc5c87mr381306321cf.9.1767101038028;
        Tue, 30 Dec 2025 05:23:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGL3EgR/boC+rDExbmIrfZeSeIUUjNzzXVRssTn+sUtVRW2phBtE0fgvFV4J8KeAfmDw7S9NQ==
X-Received: by 2002:ac8:5e4f:0:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4f4abdc5c87mr381306081cf.9.1767101037616;
        Tue, 30 Dec 2025 05:23:57 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a62973sm3702301866b.6.2025.12.30.05.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 05:23:57 -0800 (PST)
Message-ID: <a8c6b4d9-83b6-45b5-9432-134023e2eadd@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 14:23:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] misc: fastrpc: Sanitize address logging and remove
 tabs
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
        linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, stable@kernel.org
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
 <20251230110225.3655707-2-ekansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251230110225.3655707-2-ekansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Do9bOW/+ c=1 sm=1 tr=0 ts=6953d26e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=97OCAh6v3L_eXYMdJ_MA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ZDn8niNsjAFDRtHWwMCd_NmQH2X5KQnr
X-Proofpoint-ORIG-GUID: ZDn8niNsjAFDRtHWwMCd_NmQH2X5KQnr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyMCBTYWx0ZWRfX4LRAZTEuBYak
 22ekcLhy0q3RiftnEZ17Vi0mHyBhCNBFXh3IYyceTwWQ3sCFD63d/VvY/cP+726ZDjTp42Lnfwf
 xeFSMmYlDzn0yLVyDNsA1oAvpsjSYa+y4yXqbwYg7z9mZ0oOp4HAoGs/p9TNeieb9Y7RkNA7UM4
 t6qY361zilAzPREPVBhPWc3A329vvVBq7sysVDVr8WQjo7aw2x069mjxEtForT5eyfEDMWtQ9gy
 mtOid8irDs0oPpDE+2EYqKaicSpVWOF6cE7xLDAZvs/TCl9hz0cu1f8t16hDGb9LmF4SAbn4o2a
 4aLiw9i2AEM0mFgUc56kZLGOx+UgcbNMIjHBjqC2bxlI76RLtghbZBvlp/j8Y2aluX8PJCR9yV2
 Iz5GyxbiQNGbXlFaW1kuMRAay/n6bHqTAre4aM1BeY6KWvhOvmxPkVHMdtaAOEhQyoWJXF45oPC
 ng0+r3Y88Hbcc7PuzLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300120

On 12/30/25 12:02 PM, Ekansh Gupta wrote:
> Avoid printing raw addresses in driver logs by using %p for remote
> buffer addresses. This reduces the risk of information leaks and
> conforms to kernel logging guidelines. Remove tabs in dev_*
> messages.
> 
> Fixes: 2419e55e532d ("misc: fastrpc: add mmap/unmap support")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index ee652ef01534..408fe47e9db7 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1830,13 +1830,13 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
>  				      &args[0]);
>  	if (!err) {
> -		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
> +		dev_dbg(dev, "unmap OK: raddr=%p\n", (void *)(unsigned long)buf->raddr);

Would it be easier if we did away with the uintptr_t, since the protocol
seems to assume all addresses are u64s anyway?

Konrad

