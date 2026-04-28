Return-Path: <linux-arm-msm+bounces-104899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UONfEoJp8GkITAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:02:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C91B47F84E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18A60304EB89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 07:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B212DF3F2;
	Tue, 28 Apr 2026 07:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mt+rXzIv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A7GSpCUp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F88F2D739B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777362916; cv=none; b=nYGCoIb/VXPtTZUNAusq5Beth5ShVnw+sZEdmZ7xdkpdg4/1+h+eYgSsUpWxb7FeBFswtZzv1fZ4t5D0s6CixxH40yh0FOIeRjbTnZJRVOEPEw8hKS1h5HKOA0FRaf2ZCbe6+h7eHQRrKv7TbzvxQSo2jNtqD5ff+qCX5dWWaSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777362916; c=relaxed/simple;
	bh=xXic7a9m6jxIDxb3jwVc8bna0KSDt4hWDjYrxkTMziw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fi9vwXdX1RV8pHpixjcgY1q2x4t2pOUEMCGCMC+Cx+4WHwz9lkiVxL7Y/hdvrNpBRRqZiKsx10XqysMH51hPfz7zBRIcrWxaV8mLNcSL1czx8oOYBK5lkyZVW+7eMZChOIaw2QSREyzXD57iDgKHaAWwUdnuENLk8D8RDQZgxAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mt+rXzIv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A7GSpCUp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S3LXCa1237422
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S8G8K02HvttZ2MDTZAXU8QDZ
	sZ0XQjEOBIbTjYdF7BY=; b=Mt+rXzIvD0aha3xya6EF0GN1J2glocV6xXKt0yDJ
	T6aJliuJFj6wj9I4hf+GtcKozc7v7lJuU7xtoywi8XLOmjHsXwDNdvJGMcJZNP/p
	c2rdTz4v1BtSXLHKlkKQyFsr+QrkFDamiSK8hoeAXhmNa4kZSQBbfjo11P3VTgor
	3XSJtObPEDEv9uXPLM+BDtrGy5JRHPrnUkBFdBoFl/aMrK9CPnI7ZQANRS6fNmpf
	BwxuCSuGAkDztKTw9seZEmFJyXrVPf+HFlfmWZa9QyaBodiassGrKN+0ZjuGTcqA
	uewof6mykFAYoIhgDrK7Bh4WlipOnt2GThilLc2xvrPajg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt6n4m7t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:55:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faf1ecd1dso230411201cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 00:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777362913; x=1777967713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S8G8K02HvttZ2MDTZAXU8QDZsZ0XQjEOBIbTjYdF7BY=;
        b=A7GSpCUpqKO+3IRnFiE2ZOhzojYF45AWvaRlMFksrWCZwzXKFOKW2cVjSqb9NRtm7f
         IKTrc5Aca5wIHwyABOQw5OYolsuJshcRTAK0T80HZxzUW800yGmH3X3yQ38W5mN9R8CD
         zfi/NXZKcXXIgIA3HgpDQS2q4pDcfev9iEbsT+89JMCr4LVqh5Ee6TZdGckBiffc5KQb
         5dCPHhUCGMN4H/vQpNKMv2fHMVyTIG/2HwbhUjdZh74O8Y8EfK/bpsR0Np3MDBsCoAhu
         uiMK5bVV9RsURN44/Ls/xROY2OB2jgADBnJKoC/m/DelcY9JYcJ86omtKAWXDfg5TZnQ
         WCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777362913; x=1777967713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8G8K02HvttZ2MDTZAXU8QDZsZ0XQjEOBIbTjYdF7BY=;
        b=f1Sj8lOhb7fmPcaFNbRj6xLUdqJJu+l7LkdACpzaeywoJmzOU9VVUDMd593iueBEKS
         tCFaKMYpoHZ0Nh2IGpILcuApKsnDrcdjiFLwIDBAguPxvh/d9tYrK6IeSPzCFGoXtktS
         IwqeSa8QUomo2vMDs4nWOF4EL0GQqE4urY+drte/kgI7OfdrSK8hACLI9ZeNf/uaNkGQ
         b4lcYaNk5X49TfhesDkhBC4gNtYllZomOUHm+C9nI8UNHYAEUaAsyEzyz2j7vjtPS5Wr
         J1GN43R+tYT/w1ShGFa70pF//5mk0Cjp16+O7yvv7oN6dnwscigxTN3N642IBHctVitI
         TF9g==
X-Forwarded-Encrypted: i=1; AFNElJ9aIncHuOlI2krvjExA57GWR6iNENNkOeT+OLv5xAPQKXRUxT6fpdYFagYR9xjEp/06Csh0EKDp96WbyCQD@vger.kernel.org
X-Gm-Message-State: AOJu0YwDwILb3P6SwMUD37J797GnlveXFQYimN6c4ZbPflIEijYux2Dr
	evSILDHtG8Bo3ByMBccYeWHCrlMtP7yGXNwPxCm12kggsZ+ShRYfZC6jXCsH1aF1vVqUMw2qE+d
	J9QD/TkU4TgmmqHynlKZPWufXcEuffK4x80fRnh34KZzN3Ha0YcUSmh2XvphcbrGEQxpa
X-Gm-Gg: AeBDietQGg/uPKkQG4s7/qT27hoe9qaCERoNILnfbOUgIHTfiLtFkR/N9USRp+Nhw7e
	fg4M6s0gZPiVEq7vtFFH4hhY08MBgUkLtFTGPd0wdXmN/nUWmsqqdC3LFguFy/xOmvGNoyYZ/zp
	uBlkdZ9k0HG3KV0g6+6/CiRCZ3qS5sBd6jaeFVPfLbiLmfUQSc732TeIvbymVj+64wvGjL9QboU
	+S4AbR36Lem57vsS8u4lCaz3olleRMRFpaacBOhf+pF1LqURq4aEERmxIaLUKzn/gNYJuBFzHBI
	qJyLW+BBExIcuMJXcOfwctUHo/V925xTxtS9SVgtHXSffoToVCt2wbWsis9KwrZpkH1hj1OOiXg
	iRIXO8DyaVBCfWKkGPK32JO3S5K4L8/jP+HTqUzrliKR2p0DK/7L2Zw8VhYCXlAZwcxgyxg48lc
	hNAR55XCL9wu1+CSD95e12XZPFwDDR1Xc2/AdTA8iGVIwL1w==
X-Received: by 2002:ac8:7d4e:0:b0:50e:635b:5579 with SMTP id d75a77b69052e-5100e125f1emr29274831cf.19.1777362913343;
        Tue, 28 Apr 2026 00:55:13 -0700 (PDT)
X-Received: by 2002:ac8:7d4e:0:b0:50e:635b:5579 with SMTP id d75a77b69052e-5100e125f1emr29274391cf.19.1777362912796;
        Tue, 28 Apr 2026 00:55:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7462ca9c5sm423493e87.14.2026.04.28.00.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 00:55:11 -0700 (PDT)
Date: Tue, 28 Apr 2026 10:55:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
        simona@ffwll.ch, sean@poorly.run, konradybcio@kernel.org,
        akhilpo@oss.qualcomm.com, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/a6xx: Check kzalloc return in
 a8xx_hfi_send_perf_table
Message-ID: <edqrfbce5xt2vcyvm2savf5juhehvzydugklhh2a3vzvobhltv@xhlei77na2vm>
References: <20260428073558.1234238-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428073558.1234238-1-nichen@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: x9lzxcYyl_DVJRcRUy1h77SfQWJyAG59
X-Authority-Analysis: v=2.4 cv=Xba5Co55 c=1 sm=1 tr=0 ts=69f067e2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=JpMRHLQez2RCAVy9sDQA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: x9lzxcYyl_DVJRcRUy1h77SfQWJyAG59
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA3MSBTYWx0ZWRfXxbDeIleUvxzQ
 g6fhdSIde9sNwfP3KZmJ0f4NvrPaSbdFqvjQ63FaKFSRRG2z4PMfuYk0VRTaT7TpZl5CjBFD3y0
 Z83tK9jPgjqqm76seTa+inOGfRpP9VygI9Q7t8hKSXEZD70U/Bvdu2Xl65W+SIf9xykQ580i7Cd
 Uzx7NYCLsGC5sISBIlIUJNO+CBhX6tqzXQRhBr/wuAphqHcMWPk15Is0ntYsuG054VcoydTYjLI
 OPuSrn2z3zEx7z2dyFAORs6djr6wNavZcO3dXBvz52dU4hoqjZVhwCpIpBmW89fubBeV7gf2c79
 cEWglrjHtSCs5CAH6WxhJDnCVbl1fT4zdsBivjPKP9G0UGN19HZRuE2BuxkHcJ/n2MjoosYKatg
 pbYdJxO+ca7MJxW7p0/v4hcARTA9jE6L84sKh28fQKOQh/QR52dn1kydlkukfeqQaICbiv0A6bm
 1vo6pB2/Ii7+tXCuirA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280071
X-Rspamd-Queue-Id: 0C91B47F84E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104899-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,poorly.run,linux.dev,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[dmitry.baryshkov.oss.qualcomm.com:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 03:35:58PM +0800, Chen Ni wrote:
> Check the return value of kzalloc() to prevent a NULL pointer
> dereference on allocation failure.
> 
> Fixes: 06cfbca0e1c6 ("drm/msm/a6xx: Share dependency vote table with GMU")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

