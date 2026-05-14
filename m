Return-Path: <linux-arm-msm+bounces-107552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAApFyyYBWp2YwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 11:38:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 087AC53FE9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 11:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CA4330D0E42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 09:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22ED3DF000;
	Thu, 14 May 2026 09:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B/5K5xkn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbqcRQuV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C978E371CEA
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 09:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778751165; cv=none; b=aksBSsgdBKpUXhBSSPXFUNvfy5qh7puffM+wFVkjGbqWB5ILtkLNSyizmPeQb4ZVP/yhJC/xX5XWmjdy/npsEIF1xfBG3EjSTsOssgwoHbPEfJkKjWlkuByp4eJz5hXoenKPAz35VPARdAZP0FVnQ20N1cNC5bQ//oC8ACzG+9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778751165; c=relaxed/simple;
	bh=vUXL+gSTGk0bjQabPzJIxoQjd2afwEJeYM5tLuE/9Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ursfw1D/S7uzjwVfU/WccFleAeDKu+SsUKQcAqdAbSoPufOwi11Qse8gCJHAfyMsQ//GQetnC6eM/4jeoX7VrbBYLFa0fmeYRBbxTjqCcAqpnCp1nIu+ZSz6qwFxdz4PLkHb0S1YuHnqcK1Fqkfs/e3gmFFOmxGHRo23fSH/Gec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B/5K5xkn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbqcRQuV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E8fRJZ1242776
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 09:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+GPeG+kh6X4YCA8qVpC5/KWg/cw4Vi+/YrqYdgXB2/8=; b=B/5K5xkn76DyLvd+
	mHNg2Mo1LVopdvtgwb14CfXwUxEvmwJjw3hJoBqQW9jg3RY2h5nnLeWMxFI+50zt
	bg5IiywvyPdO11oLj38IQoYWCGRyoWRctb4/dRGUbfR2Qt2ZFawOZcz4jacYhaBv
	m2bKuyWccpEU6r4DLBI1OWsjINc7YWVADr0j7sw1QdUcxBbDRqaS/wz/BG8AXqZV
	lkPUQNsViwVXEuiQUfzqfnasaBCGMsSEjcg2insvuR5HVcsIViYw71a0du6ef3wI
	qw7iWV+maD8pW4kNLk6LpzpkCdBJvnAkVDl/FDoLPUsGxfl04DV4t7346UiXcjv1
	4hO+xw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4tuduu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 09:32:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50da529ff48so186200141cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 02:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778751161; x=1779355961; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+GPeG+kh6X4YCA8qVpC5/KWg/cw4Vi+/YrqYdgXB2/8=;
        b=cbqcRQuVPvqjrnQ6/aOZmD5urvrILD2kx0Ex0s1DDEukJRPy6tIo71akbmRwPKwr/h
         psUs1EHfxtvhvrF/vMzm9nIFEEqUXIuJWhQBuchOGo8/xQt5qdMr5JcNFz2wvWUKeXDx
         H/7PkojrXrdiqLA9+4LfcLNj7JlTA37dk0kn9diC0I3tQ0amqFprWkT/2JiR9XOl+j2d
         ene5tqLi6wjZMYh22l5DZEvISBBLBIN5nYQui0uQBrpuejfp4BF9jZZQ+GNkNH8c6zF5
         h7MVjSrTlTmVJvSIhpxsRy/8U6TtW3bvm745VO0uDFKYAoPFzs4/nEaeJdUdM99olcgE
         vkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751161; x=1779355961;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+GPeG+kh6X4YCA8qVpC5/KWg/cw4Vi+/YrqYdgXB2/8=;
        b=cHunLV1HYNOjTxcMpAu2R6WACoCfLDLLSO9hd+uqjq2Qnh7n//LwkoKwiQ91i+Ri1a
         zgJFZgu1GNNmIZ2BfnTq7UcEleXXvmtmcDJjpSJzlAXpLQ1LPwipewW1ZJ/4BIqhgyQ8
         SqPNtPwOJ5HfApZODt+kGduT7zdafu6Iej7W8fQjdJ9fp2md5u+XWUCHD106bwIocan0
         eVgX/ZN2/gbzaFSwZxQcB4XI18xwhuWe5I4btsjHb+ktovFJ8wFoxuVaETxCeHhF692N
         RCb3JadNF9iTMbqTZf99aufNfmpVZZYszEtApy29U5CdOcYyLQlAoD3/EgzZlXB40PLu
         SuDg==
X-Forwarded-Encrypted: i=1; AFNElJ9r9U1UtDFISmRBdzh/NEqzRK5BkEtJFv0pSUNZFghFu13xj3tq6zR6Z1F8kugnj+Oe8L8CA6hGIfXdjhq9@vger.kernel.org
X-Gm-Message-State: AOJu0YziyyL5DFLWdQr37YGGB/YbCIz2KCDdAuN3gBasImbsN42i9rMN
	RHbhGgw8A1aKwjDB79UMMmofxrZ64/Jdw1es4dGkKOlO1Ad1S9de3M6rBDD4QCv7oFCdO4dWcGP
	vvRxP7Hylct7esuhaCo6Ai9X7sCHAz9vQPvUOqmexsJtpyPazIq2v82jxwXZ+NsVus84Q
X-Gm-Gg: Acq92OHviIANPFPkfFA2NXOsRjzAm1xgWO99F2Oq1zROAJNH7aRLPLYa9xJ7A+17SV5
	n+n6n+j/26gaZMY3aUMasz9qccKgSFY32qDp/sIbL/V6Tvthg+0HIJoNyF3LeUf0MiVKDHopSCL
	5ay7WIZqqV5w7q1JeMRDnRkl52GpMZs2qYQnLb7HZsVR5V3RYz20+EnCacJb2t9UtxYnOPXNCx1
	i0Ad1DF0p+2FTvx7KvTJJDRcc1N5hZiJ4LmSHQbgY0rM1lAppuWYWBwP7OCJnCvluAfgOZEfaoQ
	fkrQ785QBf+mxINuInTqgs4xnhP8/nrDNJE56Mw74MxF207epfd0d69iaUvm18pquKaS0MzXJul
	WWY2jNK4ejPjw9jdy7tAF2xoy+m9pTxISM5cZIqdkyCJOIf19oEPj48QemjJB2WvgbkUPv5wFha
	W4Q6uE0PQ/IMOxATmkcYUUcsC5qrPeEcZVpqg=
X-Received: by 2002:a05:622a:1f0f:b0:50f:bd79:2642 with SMTP id d75a77b69052e-5162f611564mr90184161cf.48.1778751160713;
        Thu, 14 May 2026 02:32:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0f:b0:50f:bd79:2642 with SMTP id d75a77b69052e-5162f611564mr90183821cf.48.1778751160269;
        Thu, 14 May 2026 02:32:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c84dsm360258e87.10.2026.05.14.02.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:32:39 -0700 (PDT)
Date: Thu, 14 May 2026 12:32:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com
Subject: Re: [PATCH 2/2] soc: qcom: rpmpd: Add Shikra RPM Power Domains
Message-ID: <xr57rqikcxgrrlj7or42r5frwhvvateeryfnqz7q4wkhfxffzr@intm5itd3ue6>
References: <20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com>
 <20260429-add_rpmpd_shikra-v1-2-fdba28564380@oss.qualcomm.com>
 <e032c072-57b3-44b4-84a7-5aff062b9c00@oss.qualcomm.com>
 <20260514084512.q5pzh226zdkuw53f@hu-kotarake-hyd.qualcomm.com>
 <ezpigr442rjnodqcg5fqsyaik3tkp4yyw3cbu6j75ra2vidnnj@7svqkcz45sdi>
 <d2025522-ac5c-4e45-8274-1cbb49b7b348@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2025522-ac5c-4e45-8274-1cbb49b7b348@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a0596b9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=mw0au1tfmEV1MrrCrTAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA5NCBTYWx0ZWRfX+2O7VisVohgb
 /cRAKRFQHVWLeJo36e7X08og+nCQZ2TvKn0mYGC3AnXE8n1D4+lkGJNxBSDsg/OArfHbtEFSO2D
 Tee9CRZNdLt0fPIxjy2zC0UmIFJAfhZ/G3raLZZ787HtxIv0lK+P83+15gxgY+CM5tImtuClsSE
 VQY1TzRE8GYFe8U4Vs9nN2gqJSIzJik9eMfAamECAludpIpUeiz01lVaXB2dc5seow35Yt/SBmi
 MVgalbzv5ZN6gSPz+SRNV+S7Jox2ikTzdT5/d/TFhTUHNxluAgSrscVxm/l+Jdw3qiBjopszxRD
 m7Dqsc/PMgOwYY2Y4x0eGHOtCcTgSNaKDzEvM304W0tr8fHI+mmoyIqR2snuFNai0Wh3mCjqpa8
 gMf/ACbNwPHyVg7sKdhjDcF7Gm+tg4reE5wDPgGkNJ72PesuIzgrkFgOz7YbljPsJX2Ae3ilaCz
 CR6BSs9IWYMWkVKYIAQ==
X-Proofpoint-ORIG-GUID: Pb9KnHCPaPaeSSpTfdGlXcpakGMx3X9i
X-Proofpoint-GUID: Pb9KnHCPaPaeSSpTfdGlXcpakGMx3X9i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140094
X-Rspamd-Queue-Id: 087AC53FE9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107552-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 11:23:39AM +0200, Konrad Dybcio wrote:
> On 5/14/26 11:16 AM, Dmitry Baryshkov wrote:
> > On Thu, May 14, 2026 at 02:15:12PM +0530, Rakesh Kota wrote:
> >> On Tue, May 12, 2026 at 02:16:07PM +0200, Konrad Dybcio wrote:
> >>> On 4/29/26 4:09 PM, Rakesh Kota wrote:
> >>>> Add RPM Power Domains support for the Shikra platform.
> >>>>
> >>>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/pmdomain/qcom/rpmpd.c | 16 ++++++++++++++++
> >>>>  1 file changed, 16 insertions(+)
> >>>>
> >>>> diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
> >>>> index 15a11ff282c3f86b1e86c6604d165e297620f6cf..6f751ee5a7833912d54d2bcfd5d85837ab7a97d3 100644
> >>>> --- a/drivers/pmdomain/qcom/rpmpd.c
> >>>> +++ b/drivers/pmdomain/qcom/rpmpd.c
> >>>> @@ -863,6 +863,21 @@ static const struct rpmpd_desc sdm660_desc = {
> >>>>  	.max_state = RPM_SMD_LEVEL_TURBO,
> >>>>  };
> >>>>  
> >>>> +static struct rpmpd *shikra_rpmpds[] = {
> >>>> +	[RPMPD_VDDCX] =		&cx_rwcx0_lvl,
> >>>> +	[RPMPD_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
> >>>> +	[RPMPD_VDDCX_VFL] =	&cx_rwcx0_vfl,
> >>>> +	[RPMPD_VDDMX] =		&mx_rwmx0_lvl,
> >>>> +	[RPMPD_VDDMX_AO] =	&mx_rwmx0_lvl_ao,
> >>>> +	[RPMPD_VDDMX_VFL] =	&mx_rwmx0_vfl,
> >>>> +};
> >>>
> >>> This is identical to sm6125_rpmpds. If you're sure the list is correct
> >>> and complete (no LPI domains etc.), you can drop this patch, and proceed
> >>> with just this change:
> >>>
> >> There is one difference — the max_state for Shikra is
> >> RPM_SMD_LEVEL_TURBO_NO_CPR, whereas sm6125 uses RPM_SMD_LEVEL_BINNING. 
> > 
> > It's handled in the DT. As such, programming model and the domain list
> > looks the same and compatible.
> 
> Yes/no, this is an upper bound
> 
> one improvement we could still make to this patch is not to define
> shikra_rpmpds[], but refer to the existing sm6125 one

SGTM

-- 
With best wishes
Dmitry

