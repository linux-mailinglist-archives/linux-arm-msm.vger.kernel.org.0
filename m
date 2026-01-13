Return-Path: <linux-arm-msm+bounces-88838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD29D1A65F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 17:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 284B83074A72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2FA34C9A9;
	Tue, 13 Jan 2026 16:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkpjmnt+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AtFJ2GMN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AF834B69F
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768322876; cv=none; b=InspvAHrKUOj+U9mPB1tHzSI5g/1bZq6SZ7XjfVMjdHIj315M8XDXDNchYNoa3XmIv+p71xfFm4bUt/TLKsIRcKeavUQglszwIxFUIBfJkC+G4CToF63fwAqt8sJqyxEqnxR+umYNdb5fpn/NZYbybheGCe75ZSlttBXehqHvoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768322876; c=relaxed/simple;
	bh=RJmRwTj3K/zyjI/6ibebPVP+Br+k5iGtacdim9Ql4Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cG6NPxOna3SRDKmoB04po1ydN/fc2TcNXIipJFP+dtV5NuHFZjLMXFjQw39oQ9t/3aNu/sgdmdsZU4hzK2QHwJKMXCDsqRHgz3pKk50oan5DvpU4my7yWe13H47mGFeT+3H8jZj6Fmz8NjrD+0003q7pFJaO9Qvx2/G7qT91YV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hkpjmnt+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AtFJ2GMN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DDAtSA3735206
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MTyn2KRC9wTRTEtP9zy63Czm
	v+1kN9LAqhEzCYvNoo8=; b=hkpjmnt+L3ZLGS7kOJWexB43k1nkIpfyucEh8WlM
	GnP/1NSCrQAZiYO/G7L2spmYkfGcsL9xmmsJ2gKvVrX10BS8MuVofha0Ruycqkmt
	8iQjE2ocCAVSZPRW+ZulDqKoS0VXCgG9yNNXwBfpOrRiwVgG3NMjvIF8yvoRGD+4
	lRaJdB1Pwms1dO8aZtJ17vwiWJt0LshmzfkKbv08RQJzVh97nDaYMasuM+eK0tWi
	HsJ/oxxKp85vlU/bDkhA3mfMrFwc5p54kTKTxp/OVvwJcYuYoISjetWKtY5smMAx
	4jKm9SJE+RCoCcoPvK2n/k0C4ljZBiNTj5B9Xo2ALpTvtg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng87a2fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:47:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81c5e1e3beeso4648936b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768322873; x=1768927673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MTyn2KRC9wTRTEtP9zy63Czmv+1kN9LAqhEzCYvNoo8=;
        b=AtFJ2GMNEJ/YFL6IjuOw8ONMQtxlZI/GqU+mqdxDzTQ9nKEe72MA+tiM07nmXl+bP5
         TVP5mjR5l3JYli+WYVQ9Mh1Lb08uRkLMNZciZuBvvh0bkEfOBaS3UnMd8eysemUb5eq+
         TeQz6+NBUvhfVhNJWnGvDNGfVBTjg5+8ZjiFftGuuxp0kZAmj9wFZSNA/3+aioyTM1di
         hX3SdkKLp4PjiVbyub9bJFLghtKwI+Zbh7+B22eDWyUIMf/zNPqgyumsUa4f7+1lkWfs
         4ct4q4+rmm0UEZzZTPB5WYLEmfz/+w1LyAzgjY6jAUZ2tGRfMyh8i4/Bk/wvIurU60x4
         VJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768322873; x=1768927673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTyn2KRC9wTRTEtP9zy63Czmv+1kN9LAqhEzCYvNoo8=;
        b=v9eebf3pDR3PgEXYFZY6rNa5jhW3PEQmzq2jjNxCtaqcoULsa9SNuTXkY6cYUYeGiQ
         psQRH6pKKNqNvJwYviT1I6R9EY5ahyT2fWOh2F1su03n9zWBGwuVJTG80TpJQ0id+/b/
         E4X26LR1Avfd2iPyyTTsPKgkxliPeKTscj4ZszrZ3KtMQP0ATToiD0NWFS+JsOqrr2X7
         e6M9+bOjzF+FM7rwftlwR5/U9E06AWXtb4ShxJulLvJdcaPJTHX2Qqaq+YwoLfkfkcyb
         0SbhTiDAPeTwuMA7qDrHZNK4QM7wIdVjWH6QyGR4UValBKtZIITq/3YcaMjGMMz0tD/L
         LIFA==
X-Forwarded-Encrypted: i=1; AJvYcCXMUF33yYCBR2w2S1QQgwqJ1gJSz3P0t9rChRASz+CRSanJ08/XtE1uelxM/kTZRMAceRtgZMyDOe3YW8Gc@vger.kernel.org
X-Gm-Message-State: AOJu0YwTl9UKy0GnJYOpi7vYpL+dHbJ+B6hnkZQGXZbSGn98i7f/pgVu
	/WXZatTnADANM7hbCxvFX+BwZWjYAnaUkQTMIK9+QIT4JlMESHMHWSbJpojlR6kHFqOlsrSaNXf
	ZVvNMu7vIAQ+9MzpgkSOEMazueGByXCx60iJv1U7xQkTsk4DNkDjRcdV3iW8j//ih3sgIdZo0Gu
	XF
X-Gm-Gg: AY/fxX7wB0iA0sXIdGsqDia+FDkhW22tf41SyY/xM7uc+N25C7hHKauNg+ZgOFVG5t+
	Xz23xN53TbeWMoCRutgnYa0AF8PfVfZs2k8YtfKlgC33t6o3antqnp9Eyqt351gF8tR/FxIes+o
	mZJk+/zRp2qdjTMyCJ2LIapuhcmQ8gWvcjLHiHhDa8QcPNcsAE/rn4Njb1kGqMD9AUobmO+qAdh
	Dr0dkfsno6MMN/BGRoMCge/bCterlZUfvdyBib5R7Qi6E2ANwjowPVl1i334OBOlXM7F8ofytmx
	R5xpaEvgAUKOckhraoUfpoUJ+6ZfiWvDCvYLXLcBplN/XQArGYjqRLwGvPDzEZdTPevg1yeE665
	76EtxIJJo2WXR8bCD8QOPCMN/vE98J+jflW4Q
X-Received: by 2002:a05:6a00:408c:b0:81f:5f49:690d with SMTP id d2e1a72fcca58-81f5f497111mr5738461b3a.18.1768322872810;
        Tue, 13 Jan 2026 08:47:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZlMg32RqQTDNGfAe87X0hkNlc6WB8E1XbLMp5bNhyiNlI3t1suoaXs4tBsUJc9iAJ0den1w==
X-Received: by 2002:a05:6a00:408c:b0:81f:5f49:690d with SMTP id d2e1a72fcca58-81f5f497111mr5738428b3a.18.1768322872128;
        Tue, 13 Jan 2026 08:47:52 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e3eb854e3sm12462968b3a.5.2026.01.13.08.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:47:51 -0800 (PST)
Date: Tue, 13 Jan 2026 22:17:44 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Alexander Koskovich <AKoskovich@pm.me>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        hrishabh.rajput@oss.qualcomm.com,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
Message-ID: <20260113164744.6lwz6oox6pdlxn7z@hu-mojha-hyd.qualcomm.com>
References: <b105810a-63a8-4d81-9ad8-b0788e2e1431@pm.me>
 <e469548a-8d74-4d3b-9617-2b06f36013e2@oss.qualcomm.com>
 <ABmlNqg6uJXJLkDZo3uaZLdrTCFIjRXOJ68Hrx1MnHHYMnPJ9_g7GW0HGRhZBKv4--_PANfXgTV7h-n7HFC51zKNW6JkmEhpB6_EhFQ27Rw=@pm.me>
 <ee448445-8a6e-40ea-9464-1c2ae52b84cd@oss.qualcomm.com>
 <pquvJnlBgedyrF5RUTrHBUoqCIR7sQMWjwvcpm-5MuqAOxcbLg7i4H2RkuI27usOGZO000h3c90TM_kr6c5UFfViPCzGXX5MNWKFHugevXE=@pm.me>
 <20260113155821.7iesxxuf74ncr7ue@hu-mojha-hyd.qualcomm.com>
 <a7RkLrctXwaW1s2WCUMkvMMk8imG2fGJBHbdsrljwgzYuSEpgRXlSRLrF4ONtCMxlT6hkHsvALfEOps7KBZWX1oIEMh-b9PHEFLqeC1CTI0=@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7RkLrctXwaW1s2WCUMkvMMk8imG2fGJBHbdsrljwgzYuSEpgRXlSRLrF4ONtCMxlT6hkHsvALfEOps7KBZWX1oIEMh-b9PHEFLqeC1CTI0=@pm.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX8SJULhRuG2H3
 CSMg2YydUZ+EeDgV5dGpMgm2rJ75jHOse4ZqCSMdT4loWFaF3HCPVd4KewlLRz5KxUTLz8DhtCr
 TdardIuzgzeS2AS89XnuC08LdvrEXWNOUaN+UUIPcm3KgQQmYijogKWybzCYlY8Y1aN+7VFOyaj
 7/p9QbndAwGdNzq5payWK5JkhdVTnb5Ng6/i1AQgB1yFFLmFPL3vwFyR+hXg4ZQBfuMfjd/NBI6
 umwarK5drSUbJzLp3AnamIsP4alh/fHuss8BKuzb6wA0fdvWa3vFzrkmsV6+8AhGuqVFjClGwG6
 6Yb6IFkxk05O8++h1if9YevIrgphnaz+DqcIMmxElI2/F0BM3dZ3azr4m1pgFYg85hM9/Q2yOMF
 RKYG0FTYriRdXduBj/P+7hdhP9l5PaUdujv2ZfKDGNltG6HM8HHDmbhK5AP9Bd0ookxGzucYVfQ
 XOBCodee23VesBRcoDw==
X-Proofpoint-ORIG-GUID: 42hvZQSO-P6a6p3eFa2iTlT3P01wtZtH
X-Authority-Analysis: v=2.4 cv=IOEPywvG c=1 sm=1 tr=0 ts=6966773a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CZwxL6zrGSaLU6OBQ7oA:9
 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 42hvZQSO-P6a6p3eFa2iTlT3P01wtZtH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130140

On Tue, Jan 13, 2026 at 04:09:13PM +0000, Alexander Koskovich wrote:
> On Tuesday, January 13th, 2026 at 10:59 AM, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> wrote:
> 
> > Are you trying to modify hyp dtb here ? how ?
> > 
> > blair is very old SoC and may not be running with Gunyah at all.
> 
> No, don't have the means to modify hyp dtb. Was just guessing at reasons why this issue occurs.
> 
> Was just using blair since it's the only secure boot off platform I had on hand so only one I could flash ABL on, but if it's using a different hypervisor than not really a relevant test then.
> 

Just to clarify you said, there is no issue if you just use dtb and not use dtbo ?
And issue happen when you start using a dtbo, even a dummy one, right ?

-Mukesh

> Alex

-- 
-Mukesh Ojha

