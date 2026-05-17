Return-Path: <linux-arm-msm+bounces-108060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICPyBov/CWqqvwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 19:48:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B9F562C53
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 19:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6343300851A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 17:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C41F3CB2CC;
	Sun, 17 May 2026 17:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAx3RNV9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6NIYEwz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6E63C4B8A
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779040132; cv=none; b=pJFis93tMttePqRoS8VZJUqHtaLoOTu/wCbAjlbNFwmjA5MtU+fbYBQ7EXvZLMBjKeUy30INEawJFl5EKFIOz70OMD8FEzZ1Sw/BLhZlHfuRLJSwdcncWjOw6NoUAFnghWnfqgs7s5baG4his44585egjCJii7qFLa5CgIVS9DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779040132; c=relaxed/simple;
	bh=LH31HdscTScQYadkTVUyNbrfZEMAWXcUK9ZjS2AH6/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HAsQySQOeAe0tCBD+RuuxxZrE1SU9irMgKFPnzPW8Hc0XroNjd/YeRaJwoIztNYE31A9N/IAIQBBt6pTGveaJo90uhJBl75sLucgBfUt61EQcBGGKxwaA7gNAOt+tFKIaes7E03I5CDAy/1JLroR44jezyT8qCjeGdYuj4wjVOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAx3RNV9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6NIYEwz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H7Yh5B3185826
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lpHY7oihfb3amRFxiPEd1m3a
	03YdGFnYGYRDDtzyi7M=; b=ZAx3RNV97QNDaeDPBm0eQJO93jOxwpMPGzb/TJah
	dqsXoFDz51gjgpaSU8N7Qzp+AUA2My/19D6jWfO4UdtlZMVXDiUakPU1Ou3UfRaz
	ezSxF5WpCIwrtk0hinjywm2KTy9ROpY892QaKlyHKuaSAPGfH2J36oRJZA5cC9GC
	l0MsRguIRvO7luEi7zN1PiUnz7iddvoYHEr18Nn/7+tkGp3xaLi1kBJPfVqVfX1I
	tnwFwth+FR6U4sMg7cpfckuxWhhE0ko3IlG6rAfQo0QcygceqSX/l51jCphWDY6X
	vMlkZWddo7/fLJ/oFbO23EFnxIIiULneRW5J2nvgs+UpAA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h01kamv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:48:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-913fcc4c164so116281985a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 10:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779040127; x=1779644927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lpHY7oihfb3amRFxiPEd1m3a03YdGFnYGYRDDtzyi7M=;
        b=V6NIYEwz9NvzjEcbllGkLk/HclKJdR85CukSlw2AUcSGSK8ANIOkQ1ZPl+MYzlLW/j
         5w+NQgn3eZVLc4/9bd4/bIBFz2yRUpBgu4TUUQFR5Xi2ioCbU0YdSh5pSSwyqS3o6eTS
         bsECC9znCWMPUX66+nqx7wVducKfd03lTmOxh2XhDdlwmRpWunyxMdEIHuSqLP/a6AnH
         kOTpx0+lYFSv5fHmdjJakztWB2XbdRZPFkLtC1RMmLBm2XFuO86U1V6+R0Z6bsZSeXWJ
         X5W91IxsEsZ9SetFuFxJKeGb04EMZlEqDlqcQUhe2Jx4SpSvZ5c8fTtSb8xcaTcSEDNT
         xSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779040127; x=1779644927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpHY7oihfb3amRFxiPEd1m3a03YdGFnYGYRDDtzyi7M=;
        b=W2zo6DlU10fKvtRAh2vwKS5klFvjiQxVsRbx61pMw53TG72mZzNwsVYTA3OWxZtx+e
         q3uaKjcVXG4O2shle7CQGXbRwrrnNjjO07DjPuHMbyGK4fyL+vSiZ94bV9VVZUKmufaA
         glGr+rx7LC5DRFLG1O5KF0pd2d9tutO2ZGsSci71murCK10QSrmMeZgkRvrWXKxeUDQ7
         26DHSKFOEEAWvElYlYoVEKwge48RvvPn1ak5wo0wqjGkDM+A6YJiQsDD61W5Op9C2W35
         HG0zNG9arAySK5UPxHbVX0GwQcWwMw/FhAnbVugNorNe9GO7I5OQoZTvi1wUGqUOn8WP
         X6HA==
X-Forwarded-Encrypted: i=1; AFNElJ+2wuf7X5cMRGGU9GXGrBDM5RLPVaIGaz1KVkCeV+9XQ7LtWk1Fd8suX/LJ8mSMVkdg3prT/Wu6kbtzN7N5@vger.kernel.org
X-Gm-Message-State: AOJu0YwW72NQwJvIwQbuseIS46ZTabGfngMpyT3bJbmnKjBjWwg3HJfg
	hy32D9AiFwe2LqGts4WZdU44BHXLpDwP7Z5E+bqt0p50VPLoiTH9pcdOlGhp0xNu1ZXWYU+zKQ2
	BnNNpI1jGw9YptWFVfU5ypd5LinPjgk5+o2OgrL6jrRN3v/D5nyIR7YI7H2G9qu2pWlcc
X-Gm-Gg: Acq92OHqRLC6XQBHT8qTAVi3ihaloM0sFmK56xctTXChYdv2dx8qbMGUEXUx87/WK49
	kSwnmVpMeZ6uzaju2ELHugS9a3Wq8dfCZWzGLjmFRVkgOR+cZYHIUxTCfUyYYHzuJh3hCJ5hP6C
	0ODNjin9IEgeONaCV8UBNI5qkNsJGtcR/IZFvo6c9DS+NEsKFvbsWIgIlvfl0DaEhbcqpS8lg7Z
	OTjfc2JoHvB140Nq6cBzVKyy10OAcPWKVfMQHb5R9o4tTkQRlAr4i/WWq/56Zp3YIplrpJ2c0xG
	2bDlRlp/nEN3TW59CsQaBsjjUA5RIoDdnDG1nWY88FA3yeXGX5K7CByM3HXEXchk5D2vchZCVvM
	hTqD/vxO4KeF0gjAHIs8Pqg0On/KVzQXhhCqlmMApDrjd4QdYXap0y0RDkGNvZzoasDiyW10oD7
	HHaufw8l6CAy/pJYKw9ClJEy/kduHYsqxvfFU=
X-Received: by 2002:a05:620a:2685:b0:908:e262:52c3 with SMTP id af79cd13be357-911cef034cdmr1880919685a.46.1779040127355;
        Sun, 17 May 2026 10:48:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2685:b0:908:e262:52c3 with SMTP id af79cd13be357-911cef034cdmr1880915585a.46.1779040126788;
        Sun, 17 May 2026 10:48:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c797sm2804811e87.8.2026.05.17.10.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:48:45 -0700 (PDT)
Date: Sun, 17 May 2026 20:48:43 +0300
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
Subject: Re: [PATCH v6 09/14] media: iris: Use power domain type to look up
 pd_devs index
Message-ID: <bh6g3vne2cnknvpeus3fmwjgyqk4ngstdn5fkvju72rd23lqey@ip2gt4hoqqmd>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-9-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-9-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9UJ51EkZFclNKose5HnQMraw3dlGaUKF
X-Authority-Analysis: v=2.4 cv=XbG5Co55 c=1 sm=1 tr=0 ts=6a09ff80 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=wVukXIzjBZceI6JPWPsA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 9UJ51EkZFclNKose5HnQMraw3dlGaUKF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5MiBTYWx0ZWRfX2S+NNxOx2NMo
 KpNka22D9DWaB1WAhY3QCZlCJ7R2LXR/U9zGtuk0yGH1OHQZ40oCN8nfLpSX527ORNK+CBjHsA8
 6+PGz+RQxuPY3awZGwXV4d3IoZoQyGZYMyjUBgoMINjN6oGWqFM5zPYQJiOJYh1sb2Wg65ijOD4
 YvgJjXrVDj2SusWao4ZTd446LzaF2LVclpAyXkKb3wHu5kov+lSOXZaFara19lB+EAS6DqQvT/4
 8kMACWabEnS3+KL/ejdShgf+idVXtOhTGK3xIeWhwcuy1IWNrMkAI3pselhYy3jq2etCbDBJ8pL
 p5Lh/C3prtHQ16IZRXT9Okz6xYp5kx6Z2b3KG6UObMG3sdBFIRPI5r751gJE1nLWs7gCaiEQDXw
 IFhAKY3qkGMMfOuW7+DtyhRxXBwKNOmyGgCCdU/5XPHCdx3Rhco+4rqMJMsvUfCHwrzBWzxuLV/
 iuDa8OT2q2ubGbNGqWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170192
X-Rspamd-Queue-Id: 42B9F562C53
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108060-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 04:51:24PM +0530, Vishnu Reddy wrote:
> The pmdomain_tbl was a array of strings holding only the power domain
> names. Callers had to pass a pd_devs[] pointer indexed directly by the
> platform_pm_domain_type enum value to iris_enable_power_domains() and
> iris_disable_power_domains().
> 
> A future platform may need to introduce a new enum value that aliases
> an existing one (e.g. IRIS_VCODEC1_POWER_DOMAIN aliasing the
> IRIS_VPP0_HW_POWER_DOMAIN on Glymur), which would break the assumption
> that enum values map 1:1 to pd_devs[] indices.
> 
> To fix this, replace the string array with a new struct platform_pd_data
> that pairs each power domain name with its platform_pm_domain_type. Add
> a helper iris_get_pd_index_by_type() that walks this table and returns
> the correct pd_devs[] index for a given type.
> 
> Update iris_enable_power_domains() and iris_disable_power_domains()
> to accept a platform_pm_domain_type instead of a struct device pointer.
> They now call the helper internally to resolve the index, removing the
> need for callers to do the index lookup themselves.
> 
> This prepares the driver for adding new platforms where power domain enum
> values cannot be used directly as pd_devs[] indices.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  9 +++-
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 18 +++++---
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c | 24 ++++++----
>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 +-
>  drivers/media/platform/qcom/iris/iris_resources.c  | 43 +++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_resources.h  |  6 ++-
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      |  7 ++-
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 52 ++++++++--------------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 23 +++++-----
>  9 files changed, 115 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 07cc0ce25b84..1d757cb8e9e1 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -70,6 +70,12 @@ struct platform_clk_data {
>  	const char *clk_name;
>  };
>  
> +struct platform_pd_data {
> +	enum platform_pm_domain_type *pd_types;
> +	const char * const *pd_names;
> +	u32 pd_count;
> +};
> +
>  struct tz_cp_config {
>  	u32 cp_start;
>  	u32 cp_size;
> @@ -270,8 +276,7 @@ struct iris_platform_data {
>  	unsigned int icc_tbl_size;
>  	const struct bw_info *bw_tbl_dec;
>  	unsigned int bw_tbl_dec_size;
> -	const char * const *pmdomain_tbl;
> -	unsigned int pmdomain_tbl_size;
> +	const struct platform_pd_data *pmdomain_tbl;
>  	const char * const *opp_pd_tbl;
>  	unsigned int opp_pd_tbl_size;
>  	const struct platform_clk_data *clk_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index 41986af8313b..bcf873829fd3 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -62,7 +62,17 @@ static const struct icc_info iris_icc_info_vpu2[] = {
>  
>  static const char * const iris_clk_reset_table_vpu2[] = { "bus", "core" };
>  
> -static const char * const iris_pmdomain_table_vpu2[] = { "venus", "vcodec0" };
> +static const struct platform_pd_data iris_pmdomain_table_vpu2 = {
> +	.pd_types = (enum platform_pm_domain_type []) {
> +		IRIS_CTRL_POWER_DOMAIN,
> +		IRIS_VCODEC_POWER_DOMAIN,
> +	},
> +	.pd_names = (const char *[]) {
> +		"venus",
> +		"vcodec0",
> +	},
> +	.pd_count = 2,
> +};

I still don't think it is a good idea. You are using these lookup and
indirection to make _platform_ code take care about _platform_
specifics by the price of complicating the core and the core structures.

Instead it looks like it's time to push power domain handling to
platform code and then hopefully drop all IRIS_foo_POWER_DOMAIN enums.

I'm pretty sure that the clocks would also need to follow that approach.
There should be no need to bother the core code to introduce the
platform-specific clock type. It all needs to be handled in the
platform callback and platform-specific data structures.

>  
>  static const struct tz_cp_config tz_cp_config_vpu2[] = {
>  	{
> 

-- 
With best wishes
Dmitry

