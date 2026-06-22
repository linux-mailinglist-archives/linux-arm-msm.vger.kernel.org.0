Return-Path: <linux-arm-msm+bounces-113945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AcfxNWDqOGoqkAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 09:55:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D516AD6F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 09:55:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DTK3NrPs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OpYXtYiN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113945-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113945-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11A3530053B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D86383338;
	Mon, 22 Jun 2026 07:55:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B24335BB4
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:55:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782114908; cv=none; b=L1jUd7jvXHrVWII8OEoYYCDniwdxWO2+gqLCpu6WCfFJKxe+oHiKu9ieKU9SyLykl2llfUg1FZlCKSf1ucJQfkscrB90nPy/esq2iULEvcnjJuhPHD6mORia39xRUAWTfUEaIEtdxYZ/moBHv9WahGdjvGoTGJh2yHTXwLR1xBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782114908; c=relaxed/simple;
	bh=yRjr1OV5OKfKAH/cr8wF12EEhzDEPZf3H/BmclMEchk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijzAJFpal0b0cThY8JvIHu/j2DGoC6svQnEfs2Yyj9BEytzG+Zby38YhGuM0byuXKc+auY+zuhWksxiCys++dyWmUznNGNT6qajH2T2+8brC7m48E5bm/j0AfgPGxnpvCaVBDosHMJ+Csilx0/bXIzO6QXLQVqnY8frYlKJ4C0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DTK3NrPs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OpYXtYiN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5BTks255503
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Kzka4gFUSWQP9V9X78+Xixa7
	EVscxDMrc20o4519Zg8=; b=DTK3NrPsL/O1WJFj5C3rSQPeiRtPUNOqxt0+bGr+
	NWYWjROGhsHrCgHjAtKsUdqB1fAX06hOmcE77a8RDebKOTZGH7R+KURfuvgAmKWY
	B5tBE+HwAndgx35sHuO5Gu3nz+df6xu2njRM+zbjGP8FqgNgSQ4wGHpoU0DQU+oq
	sIQ57SJpMq75I20qbz8+c1L/pugSxydOSwLQ4UecdiuGT4kd30oxkUDNmwniZeua
	0f3QDzzuib1ZcX7NG4VAobkUE70OKNAv5Svt0OFBUeeWUv25Xg63rz3Lg67WbsYz
	ETHny6yPthz9qFGX4ZVWYE7cMCkwYjD+tZYfrqM4YHe55w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5ngeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:55:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d8719bae6so3214044a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 00:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782114905; x=1782719705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kzka4gFUSWQP9V9X78+Xixa7EVscxDMrc20o4519Zg8=;
        b=OpYXtYiN/Pz7Xf3CWQtOjJKeD3OAo0o8a20XqF+QsKsTI7Uh/ZkLdpIoJlF1Hy4FRa
         wJF+dY39P5mMvX4G+SlXlRNc5cWLDALmJyoyAuIuWHk4Ew4TT1WJ40Cc7I/KOtMus87u
         ZjPR55/XRyQAQLlU4FeOnRQymJxq8T75Qnr74i60SslTYoc+Z4KwqBHK+s814ksrc9q+
         ZEAS5wqTA7DqZQvxRa+2/Klj2/Jv+11P9pPgAbqdNUJWBVzq6x4aWREAIrMQClWPu0m0
         dyShJfbx7ThSBp2SJkgFhgz4jUwo9X8bNoMiaZSM8g0wVbSXFNe0z+Pnhmai72ZCUGuW
         hQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782114905; x=1782719705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kzka4gFUSWQP9V9X78+Xixa7EVscxDMrc20o4519Zg8=;
        b=mAV/A+/7wdXsoaeLGHwlu6+Wmt0m8W/Ms43mO5Z5GX5vToOAOwpvkgBmfffhJ1bnhB
         +ygY7PbBdLfZ22xUvVS7bCI1PT4ZAlsgCkStO/KZjmPQlRTS9r1EqG1wvO7FwsNIFqXz
         jZUxpmWIhRHZzhw5HHZPf4rfcq5ROYeoee0Ou9ULuns3P083nRJUHV+hBC/FtiU/ZKQF
         cXoW3KjbmF3mw8uaeMJ2mG9qk1oGXcbjALdEA8XnUImtD2nL1mAnOe6APrxhYy+B8N1d
         XfmmP97nPpp/jRl8cFhsrf9aXy1lIOUBavaNYqG8vWsZjP4LnCoJRpVq3+PsEKXTfLyc
         qE/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrQs0YSxAlS/oGpdNB0+vxvaN/Lva01ZyX6gphKeDpgOFbdGSjZPLWWo1NImyBysmDfI2j8JRgiWeZmamEf@vger.kernel.org
X-Gm-Message-State: AOJu0YxIm6eQs3NwuRM3d5pHIfZBJxWmm/g9tovtnW0KisHEx2NVVLvl
	5pOYIhfn2b/5bcwtP3nULy3AKL8G3u8q2aiMwPwaceLo2slvRySCqx5FL849mLK1h05mDFOMIyD
	CzhLbc8NyiIIJX+I8jBdabme1d/LT5qgJ4mRLuNDi7hALtXaseFJ1BxfD95/niVs7w6Hh
X-Gm-Gg: AfdE7cmN8xLozdKj7LdgrZwtk/EFmBFqqYY8hAv8s8iIsf/6jrAeFJS9YTJNWgbt6JW
	It/t894RKDH0VaKlnm7+LVnCCRVF4it0IPsg93sc88j0wQYpJknP5pBCycZkuvJE8OkdPt9REsK
	WUKU0CfdgjZr06V4mcUIzIfN7qZmjJdO2HI5uHA4Tkqo67kRaoUThpRQd7EPEZWZve10J3/2Lnw
	Oto9B8LpXKoEbf4ABdyNqthcAwuDUsv24q22z2yf3nYkDrRLFTSKWoinI+dqX3y1YzoKSVLN/X4
	wDJ8jCVqTx+vIDZqrho9I6YY8KZVvuIiJucDxbr9Aw9JEvoZXDhQfEkz3D9jJEAS6lBPYeJqLq6
	3Cn+LVfUoBSZENH4Uo6HwKQ8jTnZrVBZI7RGRghPbDc7l/Mhu
X-Received: by 2002:a17:90b:48ca:b0:37d:83d3:4ce6 with SMTP id 98e67ed59e1d1-37d83d35e9emr4822218a91.10.1782114904767;
        Mon, 22 Jun 2026 00:55:04 -0700 (PDT)
X-Received: by 2002:a17:90b:48ca:b0:37d:83d3:4ce6 with SMTP id 98e67ed59e1d1-37d83d35e9emr4822187a91.10.1782114904341;
        Mon, 22 Jun 2026 00:55:04 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15de53ffsm9489656a91.12.2026.06.22.00.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 00:55:03 -0700 (PDT)
Date: Mon, 22 Jun 2026 13:24:56 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v11 3/6] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci
 ICE init
Message-ID: <ajjqUE8TTBXhpVPN@hu-arakshit-hyd.qualcomm.com>
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-3-1cebc8b3275b@oss.qualcomm.com>
 <06999033-1c2f-4203-bdcc-d8e94ed281b7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06999033-1c2f-4203-bdcc-d8e94ed281b7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA3NiBTYWx0ZWRfX/r380/nwLF/r
 ibg/TMZ1ZAm89YCwiYPZ6RHEXVGj46Mo1unTT8U5Ljcu1sSZCWgjOMf8RkTLNh+bXFfbuHabadn
 rF1gCxjQo1tVWzHCy0VhCe3WwcNZy4jhuPAwzGlhVWG8HoehZjVIAfH5ieteDU0wRter/5YpcS4
 1U/OHqI/KRLlYkxX53/R06AH0eTfo3Qu41ucql9kLNY2FU26ULsEsTvHDF22KRcM/xyLTobm1+y
 ufo4uAZVOEgkuDV1APqeJFiUe51B7i8clDFqv4dkHQQAL/Idw+efWoJuEzz1DIKn7CDC0nhatKS
 VjqPAtn5oyxVozjDqYGqQ9DJvJNUCyBHafHB08bxZGy4Qa+/adRzXv2N6Cmfe8RxGncmV6xA0pw
 0TCFBySo7Zi9FUUKnH1xCHQkXB/fcrIIZkt+XIxIF36LRk5Z35dtbFZzpVMn+jMDXlBdbM81NRD
 qBCHZ0I4EZiUKw+6xmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA3NiBTYWx0ZWRfXxxIFZFjz5YNy
 eLdEbMzR9XGFRK6K31LKPac9IUy3e8g4fX9vLgKcH7lwBq2/ZqpFST4WP3+/8Xk6JOVI+4jDLJl
 vP2SN+TNAcVmROEkAap4jmojgQ65xKI=
X-Proofpoint-ORIG-GUID: 4bMLyns7qgQMFaaT4kGr_dS6l35zztAi
X-Proofpoint-GUID: 4bMLyns7qgQMFaaT4kGr_dS6l35zztAi
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a38ea59 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=ciROkYvXyXDSqN8Q_VUA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113945-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,hu-arakshit-hyd.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,intel.com:email];
	FORGED_SENDER(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@hansenpartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42D516AD6F1

On Thu, Jun 18, 2026 at 02:59:02PM +0200, Konrad Dybcio wrote:
> On 6/8/26 11:47 PM, Abhinaba Rakshit wrote:
> > MMC controller lacks a clock scaling mechanism, unlike the UFS
> > controller. By default, the MMC controller is set to TURBO mode
> > during probe, but the ICE clock remains at XO frequency,
> > leading to read/write performance degradation on eMMC.
> > 
> > To address this, set the ICE clock to TURBO during sdhci_msm_ice_init
> > to align it with the controller clock. This ensures consistent
> > performance and avoids mismatches between the controller
> > and ICE clock frequencies.
> > 
> > For platforms where ICE is represented as a separate device,
> > use the OPP framework to vote for TURBO mode, maintaining
> > proper voltage and power domain constraints.
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> > Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >  drivers/mmc/host/sdhci-msm.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> > index 0882ce74e0c9bdddd98341a67b97bcef74078e0c..b655bcb5b90c0677bbe3dc6140de488038fe5ee8 100644
> > --- a/drivers/mmc/host/sdhci-msm.c
> > +++ b/drivers/mmc/host/sdhci-msm.c
> > @@ -1901,6 +1901,8 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
> >  #ifdef CONFIG_MMC_CRYPTO
> >  
> >  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
> > +static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long target_freq,
> > +				   bool round_ceil); /* forward decl */
> 
> Can the definition simply be moved upwards?

Yes, we can do that.
I used a forward declaration because it appeared that sdhci_msm_ice_init()
was intentionally kept as the first ICE-related function in the file.
If that is not a requirement, I'm fine to move sdhci_msm_ice_scale_clk()
above and remove the forward declaration.

Abhinaba Rakshit 

