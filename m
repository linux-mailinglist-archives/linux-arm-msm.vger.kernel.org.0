Return-Path: <linux-arm-msm+bounces-107329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBKHLtaQBGoVLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:55:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F505358AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31378327D2CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9CF28643A;
	Wed, 13 May 2026 13:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yazv6n5e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G/pGLdCI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A6B217659
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680157; cv=none; b=Y58H//rbrdKlZQ3tcY5MBdhsrSPBCTyPXfLo9PkQWE5SOZp5oX1OGxP9q6/QZZbjbFZ7PrX8H2QPzSYk87EL1mvloITJeBwi9P7gEF3v6HQvAjaeSnIVTZzORu0pJuzXsxsz2J8AJ7K3UVYBtSdzeyW+IOAEpGiCsJ1nHmL7Kak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680157; c=relaxed/simple;
	bh=jRxVsvYK08hJFPCU3r27mn2olm89N9iKJ+Bwl9hLev0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXV9ojWk2sVQDozm3SScm/RdS1SamsMgeLBv/NlwYOAlpKKqQijzO9wr37UchN8DpvEzzfkRoHtuk4p5M8NLo/ao9eskquq/qQH0KUg4ZB7/YGEruQUElcsYx1vgnVAbmwRtQ1dKOU3TDXGfnbUfs2HER+ModMx7W8MNRXEEhbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yazv6n5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G/pGLdCI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DB0NLI978165
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4HsjvmVEDvo4Axfu4dOFUhmv
	OEIgZDUu9Iaidd4gHf8=; b=Yazv6n5eUZGwUjYncwcA8wT6ufqmJbEx9zFL8ghP
	xZ4cgTkxvbiMtkyY0n3m3+yixndIF1BNlFClOEsh/bwv9pjr1BpgyVSWfzvu3EEG
	0mvl1Ali57IffdSGV764p+ZB29wc8i4dG38AjPKhBYeYnKJEKe8Z90FnN9nd56qR
	z//S2QF0AgdCb/bS+cnbMrkrpXRpIVv3nzzOgqjI6qFEKQUfmGUpV76Hxmhilin+
	qZOwXXohHK0cXOx79V1GHVWKPdmsnk6SawU32+1c0YdflDKihKTLNAitLIRYtl9x
	2giJ7vrYPb/08YCeqbwsxXSMf/1UthJtcDKiiUk1ZPymhQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9vgv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:49:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50f13da9684so56564971cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680153; x=1779284953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4HsjvmVEDvo4Axfu4dOFUhmvOEIgZDUu9Iaidd4gHf8=;
        b=G/pGLdCI6LzrYLF6sDFqjo6vBXzDoJd5DmNIalM+YaafwY7xEkNPGJoD9bB/Dk+Tou
         TUXaynsrG1F+4ZSee8S1KLquV4m83DEatc9x5van/0YhhcS3V/FHG5c6flx3n2l2Z4Mv
         1PTuPwPWCONOkoQWReEBf26hPwmJj9EA3U6WhOjSwKo3O8nFP70dx6s9GNJqoIVIhS8d
         CQv3DH7DvkitlIE6FXtUN3H4G4fikLTytrid+iPuup7geR3p3cT/gTcxgurYBesccRoI
         9GNXnI6V2HsHl/AQuxPiSKaI+TzMFPvNCY+NpvVxcXw0OhW+wcGDq/VbAW3WtGwxKqk4
         kZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680153; x=1779284953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HsjvmVEDvo4Axfu4dOFUhmvOEIgZDUu9Iaidd4gHf8=;
        b=Ez4mQBN/vkZNhfiHvcCmh8xioQyTJzzX6b4EYlTge4XKuewQYYiXV6FXmKYH9lZGvZ
         v8kD+YpAPI4cwPX29GhOxjiVfhbgu8lLDHspRmreKQh230uJ26gjzI2u8JqX5+NiDO/+
         HcnbrVgYotO/2n3mRBR3B8SGGcNEn4hJPQqUPBz26mlhOFyy3WVBQ3/ablytwECUmVRi
         yP3VvixiXL1g39JINTtl/3G+Q+y77TQRSDBd+q6b5PM9x4JMybdYZsy9eIhFVd/qj7wm
         Mtgrz1Ri+Ah/vxLBs4iHQoi5jBWIUksruyQas9IgnUbMTOq/2vnu70lpoENKTgg3BKuY
         C8Mw==
X-Forwarded-Encrypted: i=1; AFNElJ+2pQjnI30b8HmvSPT5CxOZRZXmMSUB18xMnIeNZWzZHTLPuPSyoP2IVq/FvyT7uJ3q51/du1d4wmDGr/fu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk3sRVbjFmdId4ohx1tR0Fm484wsRTqo9hyXqJbs3B69Rdv42h
	HtvuAicUFZqv1KbGGrtD9MQmu0vQ9EdAoqGYMSgfeK7POiyPYyPCqAAJqCuNg/SoEH7MRZfQRfW
	ZqI/tOsctAxTgCZ28VEPEEE7o2lsUCfh941fhWoJOBilpgrm3c0p+kbzr3ghPDdGceHgS
X-Gm-Gg: Acq92OF7/ARM3lJHJFT0nO7f1K/RUV9WbwcR6AMEvSKAolUNhJ/jnvylrRnbERW3hC0
	dCa/PVbrHZ6XqiTzrVkywA/A/kT1DFdaZPgmbC0JmwtxL+mcvTF9ee10YkqPR6ZphG4KaYei76J
	KsJnQPEii+7zhi9Jno0WczDdYIxpar4oyylWXDneWD1r1kWhZTtoYhonvXEIqbbSuyB5tuYX9kb
	FP3K0S5C1X3x0gIX+FYcrTJPBfE3m2C7bN3SFyfY0rl4zo8DSfHGHFrrHuctHn8ANl8D9+fRW8+
	kMcCkB5ZXApT9tpP9N1LoXhw1E5XtimPJ2OFphty0OFbmxc/5DoBT+Qg5Fmgn/QkUXzf7L385Pd
	SYAR9/xWfw/E7lVUVTfw6AsclWBZdW6hQRjUdudx5eVulO4e8exkWtzQ6ODEgXNbpt+mumfngmD
	fxX2tDWjl/wYUx4OnaxTPhYSPPWO0kNgzr0AI=
X-Received: by 2002:ac8:7f83:0:b0:50e:6139:492b with SMTP id d75a77b69052e-5162feba35dmr42576431cf.23.1778680152963;
        Wed, 13 May 2026 06:49:12 -0700 (PDT)
X-Received: by 2002:ac8:7f83:0:b0:50e:6139:492b with SMTP id d75a77b69052e-5162feba35dmr42575781cf.23.1778680152434;
        Wed, 13 May 2026 06:49:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f625bd3bsm41952051fa.34.2026.05.13.06.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:49:11 -0700 (PDT)
Date: Wed, 13 May 2026 16:49:08 +0300
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
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 10/14] media: iris: Add power sequence for Glymur
Message-ID: <h2clkcgpr4uki3fq3kbdutsqc2h64hwf2ibtbrnjipilsnhk4u@w7645stdorq7>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-10-7fbb340c5dbd@oss.qualcomm.com>
 <jqe3ilzqzajuf67hvp7nw6mak36qyqu6dz2oiwtkf6zwiyclln@ydtyd7vkudm4>
 <67157e35-8c39-b06b-eb93-602930168f4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67157e35-8c39-b06b-eb93-602930168f4b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MiBTYWx0ZWRfXyol7ANhPyuTw
 nOTh9oJQe/mNcHe9FajRRAFjndW0Jp+YKZXWGxUHRdJeye/wWaKwHey2PWMt8vyS7261JV1xbW/
 nNG4urjpxfybVy6+JW0MEJX/ECb1Or/W/YtC6F3dKQFdcSCQV4/+tbpKGpMC5PzTJ9JpyCJ/A58
 yvgqXmDt6lvQl8VwIL4bcE68RsBuYhhgLl0xrcG018gQzSZzqesYKN+1UHbbxV8H5EIiiZoFQNr
 ULWHKgFZcWy9XIpLfoLFt0pBS8a1UCEKEu9zUfuI59RFA+Y+CnRkieRYJXPOar7uZpx8S3zGQxU
 C2b1YwGOkwPIRyy83D/n9lCjgymZBezlbkp1Y287dM5sOxaZlUHocBxywvyE3zgDypGcNH5rxXG
 1UyO6/dFyPrTgEN/w7AEhrw1bUvFTKqPcctYHNq8CACmlgtdsgGxum4qKrmL2u6W3S2pMP4weOx
 ET1FinDQ6ml9I9+j52Q==
X-Proofpoint-GUID: RvJWJCwTTsabCc0v-tfKvm1JrRPAswQH
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a048159 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=7I-VUM3uW_oGyASaGJ0A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: RvJWJCwTTsabCc0v-tfKvm1JrRPAswQH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130142
X-Rspamd-Queue-Id: 62F505358AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107329-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 09:42:01PM +0530, Vishnu Reddy wrote:
> 
> On 5/9/2026 2:24 AM, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 12:29:59AM +0530, Vishnu Reddy wrote:
> >> Glymur has a secondary video codec core (vcodec1), equivalent to the
> >> primary core (vcodec0), but with independent power domains, clocks,
> >> and reset lines. Reuse the existing code wherever possible and add
> >> power sequence for vcodec1.
> >>
> >> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >> ---
> >>  .../platform/qcom/iris/iris_platform_common.h      |   4 +
> >>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 141 ++++++++++++++++++++-
> >>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
> >>  .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
> >>  4 files changed, 154 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> index 7d59e6364e9d..8995136ad29e 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> @@ -61,6 +61,9 @@ enum platform_clk_type {
> >>  	IRIS_VPP0_HW_CLK,
> >>  	IRIS_VPP1_HW_CLK,
> >>  	IRIS_APV_HW_CLK,
> >> +	IRIS_AXI_VCODEC1_CLK,
> >> +	IRIS_VCODEC1_CLK,
> >> +	IRIS_VCODEC1_FREERUN_CLK,
> > I think I have asked the same question while reviewing some other code.
> > When seeing such enums my expectation would be that the set of clocks is
> > more or less generic, while the platform specifics should be
> > encapsulated in platform-specific code. Instead these lists keep on
> > growing to accomodate platform details.
> >
> > Can we stop that tradition? Adding a peculiarity of the platform should
> > not require touching of the generic code.
> >
> >>  };
> >>  
> >>  struct platform_clk_data {
> >> @@ -210,6 +213,7 @@ enum platform_pm_domain_type {
> >>  	IRIS_VPP0_HW_POWER_DOMAIN,
> >>  	IRIS_VPP1_HW_POWER_DOMAIN,
> >>  	IRIS_APV_HW_POWER_DOMAIN,
> >> +	IRIS_VCODEC1_POWER_DOMAIN,
> >>  };
> >>  
> >>  struct platform_pd_data {
> >> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> >> index 13fbb21c2182..ff90c375e805 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> >> @@ -22,9 +22,19 @@ static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
> >>  	u32 value, pwr_status;
> >>  
> >>  	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> >> -	pwr_status = value & BIT(1);
> >> +	pwr_status = value & VCODEC0_POWER_STATUS;
> >>  
> >> -	return pwr_status ? false : true;
> >> +	return !pwr_status;
> >> +}
> >> +
> >> +static bool iris_vpu36_hw1_power_collapsed(struct iris_core *core)
> >> +{
> >> +	u32 value, pwr_status;
> >> +
> >> +	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> >> +	pwr_status = value & VCODEC1_POWER_STATUS;
> >> +
> >> +	return !pwr_status;
> > Add core as an argument to the function instead of c&p'ing it.
> 
> Ack, will pass the vcodecx_power_status bit to this function.

u32 core, please.

> 
> >>  }
> >>  
> >>  static void iris_vpu3_power_off_hardware(struct iris_core *core)
> >> @@ -254,6 +264,124 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
> >>  	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
> >>  }
> >>  
> >> +static int iris_vpu36_power_on_hw1(struct iris_core *core)
> > Hmmm... And if 3.7 gets 4 cores, will we have 4 copies of the function?
> 
> As of now, none of the near upcoming targets introduce a significantly higher
> number of cores. If that changes in the future, we can revisit and optimize it
> then.

Okay....

-- 
With best wishes
Dmitry

