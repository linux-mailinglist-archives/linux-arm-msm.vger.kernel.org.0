Return-Path: <linux-arm-msm+bounces-109729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGq4NExCFWrJTwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 08:48:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE375D14ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 08:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7064C300F12D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 06:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2072434D385;
	Tue, 26 May 2026 06:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pesGs4Q/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y9qgznte"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D694530CD85
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779778054; cv=none; b=PQr74vvRKuC74onaW/lggXLp387PPxs3GSLjrr+QVxslnm6nFobwlBfEwoWK1DcKyA1UVrIJpPan0ts3uCKhH+0GSUd/JFgxBB5graq4EI9ltFlM/jqrXMj4G1C9Lfqd12WAkdOFnIuWZqQ0D9FFipkEnn8EoQTU0LZH8cSPJHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779778054; c=relaxed/simple;
	bh=3aibnKJNBlowyGXaHsNdOEC8Gx5ypo0RozbXDali7yI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tycx/Mo0ceODcrXg9SZ0IHzqgvPpDbsNcQutV9lnUImnwPhR9vdIZWhkwJ3p30rneApEV3zQEHLw9faFI+MbQz+hjVg8dAs3f7FZzYkj2CxlgaIoTX3snYuNYORZ0AwKlpX+OU6lo9l7uOm+L2MOHsHkaqbjni7447ylC+LW/Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pesGs4Q/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y9qgznte; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q1eptr691606
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IAuCr6EjYqf/3f5GsdumU1Po
	TrcKh+2YhnnJId8P7wY=; b=pesGs4Q/JEkWTdAyfKRZRsshkVLI2IsriKtHY8BX
	IkqCUje9pjRAh4kAq/bho+D6c9Kng1VomelIt5mCTKXjwpKWrznwbb18UqOFQZc7
	2EC/dke5ODH1LpljAxggUTN8R+fmr1wYKHjoMa/MNqZGn7NiYwT2qm4fSQotQpn/
	5nU6JYftQW8Ww4QLBzY/eshQAdW/IZqQD/X+m+pcjPSAixW870JsQIvnXArFQz+8
	OCwl5qakfgqdBK41wB+WZyel0MIhIezfQXNXtGqzuZXWN1dzf2EnsATdM3f3gBNZ
	zhqsz6iBXbCiW4OJpFTDROq8yJ8XOOUS1X8QWvZvLpINLw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpy2jqd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:47:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516458449d4so54293161cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 23:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779778051; x=1780382851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IAuCr6EjYqf/3f5GsdumU1PoTrcKh+2YhnnJId8P7wY=;
        b=Y9qgznteaiIGsClkLQpnsvdvwgcun7HjSs8hXdCbChEF87BGUfz6EtXJeVPZqLORaa
         nhmSc5ca0XsYGAvtScgPwwzeemuQbyHTtfu4dm3+s6fbTabJf4FNV3cc9lm0Da+LllHF
         xLIHUNyuZWNToByFGSWLtirGeBF8zKL1Rh/pM7ZbZQbC5I3pcMNi0wzPnHkZk8pdvfA8
         FBjTfhm4LyqnbPQliCtX5VkWdkbpCs9ifjr9abzzJElygGj5yKvSSfo5blLmPKVcA3f0
         gNjOaUW9CejM4o/JzvjNxGTRBIh0DTwS3ef7mJz/m2Ssybkh2D3G6hYcxpCtDLJSCx4G
         56wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779778051; x=1780382851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAuCr6EjYqf/3f5GsdumU1PoTrcKh+2YhnnJId8P7wY=;
        b=oOLRAmtwL41RDaqmBZyQvmeUnYA2InWyL7CsZ8Bn/9dDn+lsR0qUx/uTYlIJiEH7L4
         909h5PIyTosKC/tV+sK6KDnX7CNlCMR7XXsX5mSp09AJOde2NCnCIfMdQwNfxNPJJ8xV
         Tq56nCwa0JfO8tu0xcHdoMu82x9JDyifvw2TE+ceDTjQ9CdC/mgENVnp8HIK+nJq0C8n
         TMj399vXKo5NAIa84AIDb3gv4Xf32KFYGqsiSKlfTIkIs0V1UCDUFPyypWAXFjxTP2x3
         /amfF5k5BleK/uKxFKzvtipygMg4tJpV3tPyCRKxFaZmSveLbMYKr8zW1cvKd4guQyAJ
         I28A==
X-Forwarded-Encrypted: i=1; AFNElJ/PYT5VJ6mxPxmFM2sTMJbQhSAotf85Em4ek8rozOzFk1vDHItIOPvu0wAuc5xq2I5tDzTWTR02wbtmXosg@vger.kernel.org
X-Gm-Message-State: AOJu0YwTnYoOCfZSsyeVmyEVdtrGhXz98mFrpc1moyNX3aH3OVc1G187
	h607NUT77w6YHNDMHKiYMVzMbVbQlToktHRwZ7xehmiYZbfuF6qlh620vW6HS9ZguaD9AJw9tV2
	GXZsOGcjIrtQKOxoWe2FZQob092qButW+dJA1hCuItDv5HLjlHMYp+ryTwTdhf75Z+OOa
X-Gm-Gg: Acq92OH6DrEsmJ5MOdm/JrImCybZEPWbr7kZFZTlADX/YGll5THTpNr2kLVBHg2i6Q4
	bTe4VFaC79clzlkS9dnbiZM5NYe8WY1bnqYIuzt6pK8X+Ce0YffsAlnduInfm8EPJcKkf5XkZBL
	7V1eCIdxfBQGbOswGVlRT62Yyf5X0pXatrnQ7snlWLoVJfJEff0eFkDiNJdJVtfh1NcexM6Mw/O
	hipaWcj6eLubDKiIs9pygwRDLwQMz0Nf1oPK92bQKrpLCIKd5YCIazPZWW6jQ1wEjRBL5iadN7Q
	RSmSRQkTtA1bLr7gzVOzfP3G89aWXyD3/eBdoo4QMQWrENLBvoSpsLJjEjxSzaKHxnZ79ZEdl8e
	MdrqaAZntiyET9vRJLtGKOHPEMgnyK4A3WaNBEwUE7ya4qKU/08B4eZEhnX/43H4lSzGDYzC7oG
	tObpKKd9E4AQV49F1gus6oHJa9WF9Gr90j9UU=
X-Received: by 2002:ac8:5711:0:b0:516:df33:bdb9 with SMTP id d75a77b69052e-516df33c1a2mr196911231cf.47.1779778051316;
        Mon, 25 May 2026 23:47:31 -0700 (PDT)
X-Received: by 2002:ac8:5711:0:b0:516:df33:bdb9 with SMTP id d75a77b69052e-516df33c1a2mr196910961cf.47.1779778050891;
        Mon, 25 May 2026 23:47:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dca7d49bsm29651051fa.17.2026.05.25.23.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 23:47:29 -0700 (PDT)
Date: Tue, 26 May 2026 09:47:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 3/5] soc: qcom: mdt_loader: add
 qcom_mdt_pas_map/unmap_devmem_rscs()
Message-ID: <k5ytg3b2wao3d75iuz2dxbvtzidnl6kdvzuvppih4vzqdhtzm5@5yd7kyb5yqcd>
References: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
 <20260506050107.1985033-4-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506050107.1985033-4-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: y_Ukxxn1_wOzF9FIxDfhwEo20MQxIY97
X-Authority-Analysis: v=2.4 cv=ML5QXsZl c=1 sm=1 tr=0 ts=6a154204 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=lb4pW1d54vF9efD2BngA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: y_Ukxxn1_wOzF9FIxDfhwEo20MQxIY97
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA1NyBTYWx0ZWRfXyVRWmuhO3Zl+
 teufX+N5jByIp/gpJK/evcnEDiMpRm3yG1uTyG6tf01A8iUwcJ/eJqVEYC5dqx51ssdTGDLIox1
 xIWoNEPvTuacuaPqq6irKrHyD6vz5ZGofAFdqMaQUFbjhrqxvQSAmYLq6NsxvlHb3jLdr+bHHWv
 rbEHFOmrEwPBOi9yCDgyIU5vfOEH9fKUe71aFJz9Q/SU4yJBI+z367pTquRVuZMQZhqouhRmj3l
 xPe/B7WVWHTcg3oKq9hPSRScpAjFRg8Dejrh3dJQ4hF5w1IoS2nHdzZ2Bib5Yjwuug3mD8XQriZ
 4LqYDuQj1DchJcC5uDnaUuMCjmTOQf2Ylxmyc1FcOhLOHqCuBB2VNSfUmSbh0DWKuIeVw+s6CaO
 fJS0mheKbUyBc6naY9QE7C4mpCHJHI8XLTBLNmzWYQCFv+AAQu9s69Qf3zd8RNsxmwZZJR8Odd7
 X2OgzPkQahe1dEJ/9tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260057
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109729-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2AE375D14ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 06, 2026 at 10:31:05AM +0530, Mukesh Ojha wrote:
> Add qcom_mdt_pas_map_devmem_rscs() and qcom_mdt_pas_unmap_devmem_rscs()
> to IOMMU map/unmap RSC_DEVMEM resource table entries on SoCs where Linux
> runs as hypervisor at EL2 and owns the IOMMU mappings for remote
> processors.

Generic rule is 'no API without users'. Please provide a driver using
these functions.

> 
> The map function fetches the resource table via
> qcom_scm_pas_get_rsc_table() and iterates over RSC_DEVMEM entries using
> rsc_table_for_each_entry(), calling iommu_map() for each. Mapped entries
> are tracked in a per-PAS linked list stored in a hash table keyed by
> pas_id for later lookup by the unmap function.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c       | 189 ++++++++++++++++++++++++++++
>  include/linux/soc/qcom/mdt_loader.h |  22 ++++
>  2 files changed, 211 insertions(+)
> 

-- 
With best wishes
Dmitry

