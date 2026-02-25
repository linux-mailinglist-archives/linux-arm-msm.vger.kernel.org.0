Return-Path: <linux-arm-msm+bounces-94118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGH+LgvynmnoXwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:58:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2007E197B44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6267302E908
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9453AE718;
	Wed, 25 Feb 2026 12:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6rBZTr8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kbRyvgBI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F08330676
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 12:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772024313; cv=none; b=OeWjT0+BJwFgLEdvNNVFHxlFPYR7YQcQeknyLTZjWNL/py9suCazZHXE7mjrAjjQLj5wmtFFiva0dcrplTT8yy/PYDtLzfjsornDGFGW70MLrq2dM29q1OxmK1lrJZJawhpLeH3Q+bgYJIFkXHKyrt/G+yGrjj9nutSUwknbdiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772024313; c=relaxed/simple;
	bh=rsrJV9JSs10oZW/p2B67CK/bbFR/ySGiAGre+fdGkZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3sJdK0hiTRIYjl8KYE387brdTzOFXLwZMrEBP2alYpY7v0qTL6R9uCL0ZiTloHM5p3xPZU/dJXqOCQnuoLXc5dk9zByFU2SmupAtcimjm5qpuAM12WntZT4VZ1OIdWAQ0RytCKymdmeh4TTVDT7lypf63bHTuO6yvmU0bsVi04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6rBZTr8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kbRyvgBI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9TBJw2365343
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 12:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qwtkGTva8UpevosmA9Ul3qK787+uQN8ysaiDcYLDNr0=; b=S6rBZTr8Zjxs9Gtn
	UdNivAqShe3BsUS2ZGthhRKo6Jo51V1PnP1JCAk7d4saqZK5WlI39w9QH9rPkMo3
	W0Q4G5NPRIfZqJlLZq+p0SVhIB5sHnJ4Yo1LRLV/3cD0JFrnW/WIKuJcjumN60hN
	PZgaLgDu8eL3CTn7TyFTDb5/5ysOQGpLynTC95ytm8xUEop7ruhoR5xS3SCvMkBC
	myHqwnNMsiIVzjB/+EiXwTDcwoeSzuiBuCSelHaIP/BcDD4eoHpcayV+j9WWCmSU
	xYH5Nym8xhsX/RxK3vLkCicTc9NCplK4yZv9xCRud4osH8uMRXJVdOuyP9fS4A9w
	TEchKQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cherjbknk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 12:58:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-824b42b8a81so25060835b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 04:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772024311; x=1772629111; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qwtkGTva8UpevosmA9Ul3qK787+uQN8ysaiDcYLDNr0=;
        b=kbRyvgBIQzWEO+RDMMrPdI/NRQTeWWDTsjyUTU89zl6JCISawB2Shv3W34J7jjJeRs
         WA/biO1gJ4vFSUF44cEOsZO2WTNJc9WRwYdhw8RKIJ6w6AYns9fAAQlQhkuQ9pIWLEuw
         70fSap9EsbKTIRRtlsViVFXHDu4r/C5476btEJcRiIUJqlzxf6AiwNT7jYjM5leGn/sN
         tVXvAXdck2p1QIJhXMNIlWtuStnUPrACjXEYoERX7mi2suu2lXZKifFY2yhpTy2uJkof
         8RgnW6Afmi90QzcXVXcripyPbyFR5qejCxQRIsk5P9mtIofdFiVDIuubuacYyGb2yLYW
         HO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772024311; x=1772629111;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qwtkGTva8UpevosmA9Ul3qK787+uQN8ysaiDcYLDNr0=;
        b=hSE2/C8pyUDUhaCLJuvSJxsJQmSoP0bz3wtWKollltGq+lDGLp1jqXjRL2CnPNbAut
         zLk2omfAkV+cMtmXcHagOwAG7w2jyQ925HpCJUcUizki0Tc/FeXu1abhCRVn1PlZkooY
         CcwC05NWvf2LxpTlCmrOWRsmmwF93mkiHWBWnqGwKkrNaayH5gGkSXJOWIP2pyhIwjX8
         Iy2wUNOhSgKx9/kZlZOtdrjfwDKsy++CK8IkRkE0EAKub+wcLNfkWa/FXI955vUxWpKP
         /K0vT+BY3WGmywIzKmKgXb8zATzCPFbLtnftkhzSpKovqC9TOT6iVASyWpPJSZvki741
         JFDA==
X-Forwarded-Encrypted: i=1; AJvYcCUuCI8otl8LfC0TVY8vQ+iE1JJcbUINumk1kfa8RWx3JL6ynuPbdXxGcmX4Y8793sHYhZ+fsohjxNMOhRWB@vger.kernel.org
X-Gm-Message-State: AOJu0YxCqd9bZx5oo2VVi6mKmvymKASB86XfeFlwN/aEFdNxpJ29Im0u
	JN4nOH/jMneLxS722h0CeNeEK+bymnqC+HjAf2Mr2Ifd75i4KroBosdTlWJ13R7e/UyluS5tt/R
	1pxUDAg1b+MbrJ4nDlOCjkCYQtfyV2vWPJI+7OjbXZXVEfs0dY7FwNkwhXKX93cm1CwBg
X-Gm-Gg: ATEYQzzFBnad159RnpjzfMuxmTLHd2X2FxmRSPVre6DtegyWZL7vw37yao8h510bf3x
	lFMV83V5J0rFmZRUn+r5R+5fzu9/wYRxOJL+4R6GLWfmR8adNnO4CV2PtuouN5djxa40xCZQ9K0
	r7BjqEoGKLK3O1sDHCK4CtkSqte0T8Ls2m402O4d1wjKnSwY0zz7eNoOhwX/ot7jZhOlYNILmWC
	nLaXakZ6gFubYeZeW/TyCZhGJcjsvi2RPgjo9ZIz6ey1qG2cyxJe9rIUIEdQwPmhKV7g+Nt979H
	MQDM8gSdWo6277VglJPGg66XffSqJlT/Ij2EIeW2dqot2zx+TBSCBHF8cy3K1Aa9cAN0gOQQ1Yk
	yMpouVqxZOtuLQLCb/tID/K3Ua63VeVWs6I5XhpOxJO/MuzxAfqrHp2jpudY=
X-Received: by 2002:a05:6a00:4b11:b0:81e:8e66:38d9 with SMTP id d2e1a72fcca58-826da8ee310mr14805871b3a.17.1772024310901;
        Wed, 25 Feb 2026 04:58:30 -0800 (PST)
X-Received: by 2002:a05:6a00:4b11:b0:81e:8e66:38d9 with SMTP id d2e1a72fcca58-826da8ee310mr14805844b3a.17.1772024310447;
        Wed, 25 Feb 2026 04:58:30 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8a55d7sm13750737b3a.46.2026.02.25.04.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 04:58:30 -0800 (PST)
Date: Wed, 25 Feb 2026 18:28:22 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH v6 3/4] ufs: host: Add ICE clock scaling during UFS clock
 changes
Message-ID: <aZ7x7gG0OZEQSKVy@hu-arakshit-hyd.qualcomm.com>
References: <20260219-enable-ufs-ice-clock-scaling-v6-0-0c5245117d45@oss.qualcomm.com>
 <20260219-enable-ufs-ice-clock-scaling-v6-3-0c5245117d45@oss.qualcomm.com>
 <f984c9a0-9ce2-49f9-927b-e69c26f69176@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f984c9a0-9ce2-49f9-927b-e69c26f69176@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEyNSBTYWx0ZWRfXzusEdtpUJvS/
 3l5Ira4fHadS9+FSc/oEm1OMdkTHtSutd2vwOqFKVkieXhyGHSBcW6r4+tQFsLB3sV3/BM3mcLL
 uy7RIMI7r2Kq6jAYLKzu5ojF14jVNm2dlYVkkfNLiTXgK0GTDIObCNjSe7aE2Q0IvEkeM+V+XZE
 wh521o2hvtWc/AOD2JJBcOHkk+GmGRv7n8Re5Kog5DiEZdnCRfbUAaXJ6SrD8Oo0kPrm2sC1Obe
 pJiRJSLAW8vRrcXlGeELPQoPQFeNxvm4v0rmUbm3gWC1G+vAp/tgq6BvpVs5BGpAW4dt/STcRH6
 1FqCD03wnZGghllJLtN8VFSGh/8emJQa9nqs1jG11al7JX+3RdeYnjzTl33gTvm4VXkRzViAdtp
 zwovmpMi722q9UUBsXOXFgSFkfOtpeSqU/1Jo9awihoo5vXUsy6IWPps69p7Qs5H7RZ9SuFCK31
 5gcXcCvLWtTgaNLeNJw==
X-Proofpoint-GUID: B5gotvba1oipNhDllxfF4dvbWMd3czXO
X-Proofpoint-ORIG-GUID: B5gotvba1oipNhDllxfF4dvbWMd3czXO
X-Authority-Analysis: v=2.4 cv=NeDrFmD4 c=1 sm=1 tr=0 ts=699ef1f7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p40s0NTFcljArWS5TpEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94118-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-arakshit-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2007E197B44
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 10:00:12AM +0100, Krzysztof Kozlowski wrote:
> On 19/02/2026 10:39, Abhinaba Rakshit wrote:
> > Implement ICE (Inline Crypto Engine) clock scaling in sync with
> > UFS controller clock scaling. This ensures that the ICE operates at
> > an appropriate frequency when the UFS clocks are scaled up or down,
> > improving performance and maintaining stability for crypto operations.
> > 
> > Incase of OPP scaling is not supported by ICE, ensure to not prevent
> > devfreq for UFS, as ICE OPP-table is optional.
> > 
> > Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >  drivers/ufs/host/ufs-qcom.c | 21 ++++++++++++++++++++-
> 
> 
> SCSI/UFS is not respecting subsystem boundaries, thus you must not
> combine multiple subsystem when targeting UFS.
> 
> Please split your patches.

Sorry, if I fail to understand the context here.
This patch-series is already split into 4 patches based on the subsystem.

If the concern is the UFS patch mixing subsystem explanations,
I can refine the commit message.

Otherwise, if you expect the UFS patch to be sent as a separate patch-series,
please let me know — though I feel these patches are more appropriate to
land together as they are quite related.

Abhinaba Rakshit

