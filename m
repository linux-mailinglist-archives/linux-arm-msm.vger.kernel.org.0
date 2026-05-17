Return-Path: <linux-arm-msm+bounces-108062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDTeI5cFCmqNwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:14:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F52562F5A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A7BD303FFF5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 18:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551643CC306;
	Sun, 17 May 2026 18:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6kEBRRb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kjzji2zf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC373CBE97
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041426; cv=none; b=ArGuzFuvDmbcWYJsgNL9JP3ffFFBfzkR+jkfb4ley3xiW1DWdkLTt5BWNL6zQzpQE6Kh+H1p8AhcyCC/JXRBKdn7Tj/bwr3nwtB79yuN8l3W7Z0qvjafwVrdgg6fTa6grhEVvQpENqaKUEbbgkiW2Rs4CcDrFR3mg5VGZ8hGLUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041426; c=relaxed/simple;
	bh=Z7UubD0nbMVEh0Y171+jX7DCQQjHM40ZOHv5ApHrDbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6Zl4c2SYblpquESFHdHL5w+HflOg3D+c1okkl/pd19uIBcEbnfGbaTeWn4DZZOA9j7eSfmm6gEQYU1IfJtpZAlVGGVnpooNMeBrvgec2A5ttLjUi6FD2At4yAKaN78W9RRONRsynBq8Yf+azJmzqufdocidtgKCzbClJ7tY/20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6kEBRRb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kjzji2zf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HD016w3876487
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YCjoQRyXXAzAPRC76KDlYSqx
	pQjcG8I9xbZRDJMHxR0=; b=S6kEBRRbbcyzoSMMdn2bw1Cb7mf0Q4oBhlHYi3z2
	deMxPkVYhG7ZnRLT5kklgXXiRpiYqxmPIScls4eTq31fpywiCZF4vqFR3Ad/29mC
	t6CwYJWAn78p7cGWzZXAIiaWgRoE1CFQwZ9lpx5crPegy/L42lOC4Ao6Mu8NqIJv
	FFTgLpvyRhGIiSWx7A3hU3xm0kVjDrGP+azwIWbRawqi7uqzEUQyI/Ci54hg7oRZ
	OcMRB/8KlXyw1pNv+wA5w1xw3wO8rjYwopQ8sjyKsKHIXLq2OF+0KWhrOo5bS9WN
	GJ+OWddnloxEvYzxNkk+MvnRxWGUjSYKIkXogHX+JiZnQg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcj7e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:10:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb3c7b989so32589221cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 11:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779041423; x=1779646223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YCjoQRyXXAzAPRC76KDlYSqxpQjcG8I9xbZRDJMHxR0=;
        b=Kjzji2zfa1kiPI9LGdsDhA2pumABLlNiCtL+Z66AfA4Xxm+nHh0lLB5ctAHlDReNtK
         /+P2n1dPK4qs5bUpMJ+nFRKvPK+mk/rUBcKtJ7WSjoGL9atx83ajOfiKYaKW7K1Q4j5u
         7KLeW8SPkRkHRfFUP7aMx97UwHPM62lh0VNYN1kKXNBi4TdBjqbwENg3hqoBIEv4AarA
         OXJh1aGU29w6ZRqXPT4CHgliDkYvyDU02XXGp1wHZ7N5jAlzpCTbjCCIVlw+TA2G0WKK
         2Hk3hGvcTMqZq06VGx14EHnQnLJShVk0OihKXKpHyK/28HKnccgu4xMfOGsgbkMD2O4B
         py8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041423; x=1779646223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCjoQRyXXAzAPRC76KDlYSqxpQjcG8I9xbZRDJMHxR0=;
        b=qRsMuFukIRQOcynGvFA5Pr9p0vowWE/eDNXkKNP15YgfSeYRUS1abqyMx8rXmiZN4Q
         mT6TZnChoE+G5OxrqVxpAyPYCV9JtBvZ28rVj33f6c/dh4dF5hLPU07ZIpENScwQ7NkM
         BpVhO4lGsV+JRPvIHT48Nf39xqJxN6gNGng3PfOgPaPN+s2I7wFBP3JSQkw3r4S8Oo73
         JM+CreDUSe6UAQl3nMZ8PSU/FhbYsv+i8aSfeS26mDTnsDq0r28RLtIdONDY2ZoLO1Vv
         +UCFzF1R1UuRMPIy6ANDOxBoLSv/gXpjs0hvjBx/04WHNKArZEwLKVzl+D2VhLtCEf24
         NXQw==
X-Forwarded-Encrypted: i=1; AFNElJ+cHFMXMODeSx7Xu5xkKuoA0+wt1GT2AQVmmo6+Xrx/s/qh3fqUe9YhdG9np8nZrX0OthvDgi2PD9hBXBFM@vger.kernel.org
X-Gm-Message-State: AOJu0YxjUM1Gq3WRnQYNlz7Ymo1Cs79/pLSP416EdcmfDJiT4izs7qLw
	mNrDkiTnQq/gqDSNbJ6m1E4IIdUQYHhY1cjbcTDYeIUSjqH93kuU4btRrzYp3PzrpZXYBxgG7th
	0GSQJFvX5HYo04OkLly5q74TbXEKnMLqIyeSnxycZ4fjsicXHYhyzRLT9AZIysdAuPJVS
X-Gm-Gg: Acq92OF7Hr73TCURRwltgrCnZGONQ/EP8tPixMZ6Fw9AhX5A7ZTQhBw7aSscWq7HcNz
	Gkjoh8nAR/2Phpe492wyyhtJJ0VQw+/Mxd8/IFMo7VXKmFYO/N1dMNfDd+LE4b28ag9VyX+1WNb
	cLP+LDxGRKDxxTidFA0BaWJhIfSnyMDzDp9ggTziEEEScmZsyPf6oPiqFhMKF9A2QRKflJer3v9
	MksN10DVQ56FoAehk9jTickrFSHdvbaNjE1kFoOvZq7xbd24nrIdAupF+LOcBrJutx++59dB01M
	bk9ZpfYS4lzDoJPGH8sIAcf1JjsdV4urvY4nIFfTkIjwO3MDMROnIZXQ30w9WCH3PSVPjIvJBOK
	scR8i+UlE6ZVcpFgWG8tGCPZmp3XAFkOjsF8dk2s3HGuLOgFgV2Rtp/Jzji1Qay1eHEqV+rx+tS
	HcHZDhuiDASZ+YaBUcGslIjjR3qCxNVJWxPvI=
X-Received: by 2002:a05:622a:5910:b0:50d:819f:e7bd with SMTP id d75a77b69052e-51659ff9a0amr171584121cf.4.1779041423281;
        Sun, 17 May 2026 11:10:23 -0700 (PDT)
X-Received: by 2002:a05:622a:5910:b0:50d:819f:e7bd with SMTP id d75a77b69052e-51659ff9a0amr171583671cf.4.1779041422797;
        Sun, 17 May 2026 11:10:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cd939sm2845867e87.70.2026.05.17.11.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:10:21 -0700 (PDT)
Date: Sun, 17 May 2026 21:10:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 11/14] media: iris: Add support to select core for
 dual core platforms
Message-ID: <4g6anygi3vmqomhbjjwlasw2arfvrr4bf425v4ohlatnudz7qk@btriuufbnlil>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-11-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-11-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: mRCd4VCbfRKZ_l4s9Y1XHMonSkSdDoLd
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0a0490 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=dWoGYy8sgvYCzfpHzJwA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: mRCd4VCbfRKZ_l4s9Y1XHMonSkSdDoLd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5NiBTYWx0ZWRfX1kMmPEPaKFAC
 ZCQXKkyNBSb0diH/CQ8dbxq/JphURrLlZ+MhpXfdhMloW5lpdVA/zPY6uyNSl3tFA7/En0To8Fy
 8fu9ai+RhnWs0d7ejPN3oQp8gy95WeuQTHAguqX1mSxysj+is4yuwiShVBk2BtNweCJPlBpfBl8
 2HPG2zkMp+QV71kXCy0PCMA3QNFcih1407XUHD++8zn2z4LPYBgIKl5upvcbd6EQsz0lj3M/iav
 6yKEYr3KAQgZpVkHI9BN+sGYuqGktpEdX4q49kyf7+uCgzVdFwaVSYcQjCHRn+BrdM4HSh682Gz
 wJhxihsRROuLFBHUif0KcIO2u1PHgOyLucOS+Vux/+LVf5NN3f40zMCqxLgXWqO3B/JvoXoxPIn
 kK1c7UDO6s9ukImcEvLYzmShAnoUHkTXhYXZ3ATb6hu0eAUVfHE+0xmObfo/4I8bozLHhggg8c1
 s1jsDpL16Bh8Pjx0QEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170196
X-Rspamd-Queue-Id: E5F52562F5A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108062-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 04:51:26PM +0530, Vishnu Reddy wrote:
> On platforms with two video codec cores, select the hardware core for
> a new session based on the current Macroblocks Per Frame (MBPF) and
> Macroblocks Per Second (MBPS) load on each core. The selected core is
> communicated to the firmware via the HFI_PROP_CORE_ID property at
> stream-on time.
> 
> Since both cores share the same clock source, the required clock
> frequency is the maximum of the aggregated frequencies across both
> cores.
> 
> The total session count limit is scaled by the number of cores, since
> each core independently supports sessions up to its own limit.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_common.c     | 10 ++++
>  drivers/media/platform/qcom/iris/iris_common.h     |  1 +
>  drivers/media/platform/qcom/iris/iris_core.h       |  5 ++
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 19 +++++++
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>  drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  drivers/media/platform/qcom/iris/iris_power.c      | 20 +++++--
>  drivers/media/platform/qcom/iris/iris_utils.c      | 58 +++++++++++++-------
>  drivers/media/platform/qcom/iris/iris_utils.h      |  3 +-
>  drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  7 ++-
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 63 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |  2 +
>  15 files changed, 173 insertions(+), 24 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

