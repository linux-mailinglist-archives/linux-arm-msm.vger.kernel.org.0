Return-Path: <linux-arm-msm+bounces-113299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QV40OH6XMGpDUwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:23:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3812E68AE88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:23:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=exV7vkjm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hUTFt9qu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113299-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113299-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF58930FB62C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E296233935;
	Tue, 16 Jun 2026 00:22:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC7923EAB7
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:22:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569342; cv=none; b=CFl38Fr1N8L7eUhLBfLzEGPi7dmKstu/R3j4cmVtLDTDoaLo0RZnKW5p4+WBYlrtPW1kkUVtWXwop0DDg4ZE/Iw1u9s5dMtPCqe8T29QnMDmpIJoPvOoKdldWqstjr5GO3KVDMkliDqADfKajf3EYFxNxEWmHn4MFQma8365Mns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569342; c=relaxed/simple;
	bh=P7MxXITSax+WF+IrLjY99CIeQHXpiEgCBwVoBlGs5SU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ii77tK5a/J9SSU7rAwNK2uuuLOe8/N+6XuFfUqGpARBUNIbAuI0tMVGMf+RyJ6571PkrZWUHPKKYtmFC7vLgbRUrkcLDcTugtX7GBO9MqRePHMijzpKZLIW9GGs1tW5R0Tfsqr+7sClSbeToxCh48nhXGOtQiLdHNHK2jL1ccF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=exV7vkjm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUTFt9qu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ2X8M1245913
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+I5JPJ28+2C5Ptq2qq3gPPxE
	l8sJtso7kvE/1GSrC98=; b=exV7vkjmYRiBrHACB1F964JIl6zOi5w5Ae7TN+Eo
	O9OsDnvYllYprf0DquCfhY0PjaFyJOxlUA8qaF4NcwghLLEP/aO2CMrilizZBr+s
	lkUGeGBQEeKQOvAD1ZvHqDH7VHfR15M+4nTzc6e+ZinGV06a63H7si0stkWmqrFT
	3oWyTSwPv8NSvretIH8b/KGkVzl37PY+TuishGsPKk9eTvBaxDsF6FVoY/W1kusK
	kYPsV5YAv0RjAEzlLR5CzouvhkDN1/GLRjZ8mbOr8+KynNv4u5dZKm2DdSpN27Q/
	SLptKqfW7BR870293tgLOP7YCR2lzfz8LJrqke8a9kYZng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetf3ptw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:22:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9158e75cbc0so595431785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569339; x=1782174139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+I5JPJ28+2C5Ptq2qq3gPPxEl8sJtso7kvE/1GSrC98=;
        b=hUTFt9quyjVl+cnn/DYb9XPT4J1lNbyLD4JUTrdbmWM/BWO09V49l+uTtej7iDe1ii
         U6Iqfb/VClEkVCceRyLSluvManpb72cG8mM+aegOUQrcPLDBhg08TKtdk6irU2T7AOSc
         7DdUc0JTnPt767m3XsFUe1NUQCP+xZhvvyckfE6zYQgnxeWpE1W0nIfdwCz7fcKY66bK
         DlbeyyIfrQHJWEVDCS8FgPU5qvPbFgR95vaLpJXiUMVeMoEIavSrVXy/52U1AOBRpiUF
         8VCozxfmbfarJ+J0PxwYjVRIJ85wHQYgeTqvrrFlEa0QUwvjFD67nWtBobtN2yK48h+x
         WKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569339; x=1782174139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+I5JPJ28+2C5Ptq2qq3gPPxEl8sJtso7kvE/1GSrC98=;
        b=bHp6Lu5dh4RD9XpUoOz79E78PNoucsc1tyfEG864Y5RqSN0kL7fXl0EqxfWkw8tf8m
         mtJ3/r1j7fJ3FNOSK0H4DBbjcnPn63Oq0Em2b2nLk/TSZQcmAae9gpfWFqXCjPfZV2mQ
         zAwNpuRJ+VpRYt9olNeHbmgdaeJI+qwsz/WWlmutmYWyIalazZgAtDTGbXEU7581nIj4
         p5oMECBiiPmrCbIHnWeHiyaMbH9ydGRCbLsjMps3+MoCLEU0PMhNB7g5Ek1A5ZQNYp+R
         7cRLKoDZMRI8rn5UNGQ1BEQw0sb7qDqezzYKmXveOBhUE6T0Dv8V6Grq3kYs92bHgOti
         PF1w==
X-Forwarded-Encrypted: i=1; AFNElJ9/gECKflXJXKChqSE/XSXaQSCQaX/D5koh8xhxDKdbqagv47ZCZLgZ7a6jYeb+QYtydU6WL7A5+fdedkAw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz431SZ40BJOGcIcxVHUCRT2ORQIpsiXN3Ln8InyDYViwzm3tZd
	A8k520/WMDt7YNLGhOIOKamlomYZ5l59nMGXs+05y5zko3pnd53dVK6ZWnhUiVx0VBkZwLFOCnF
	vwXWcqiG16IJv7cICVM0ygnQJjS5iox1hJMB4qGTb+vs43nC76EiW2VdbUHuTokEpUS/J
X-Gm-Gg: Acq92OHbXIN1qCs5DyG4jArufQFo4eF6+VbI4uWls3RJH0yecUERlHjshecPUiHxoY4
	JXxHz+12hVZsVmTVY6f7xqV9vmLFZxK+dmNWO9owTUpp6KUTsIBYTPnTmM8PWHnQC6gIErDUPYw
	cKhYLiWAGKQakldfFxv9ieNL3KuMRixqX6qF34celGzqYbM2AgEM3MNgeZ9PLOxf6RM1at8jBFs
	Xad7TC33QDhUlU9P0YHACILXQvbM1TzjG30BmVgvuyodbqBviB0gWJaD12uvqsCdyiG1twbAdJ8
	e4lQ+mbCsFM2U0BwtTwlOUKB0swfeCwdPzYTxvXv6eDFm5NOg9RVks3Wq+e5qxvHU8x9BcBamg0
	oiADL1h0hcS5RRKwSQb5DvwhYG5wysVbrJSS/pFkj2BQHAfmaSSdStVWhCKKCs7HGQDilvROkR5
	A6mLMqoY5rToZwes30B8g7382WQpgr7IJbVCc=
X-Received: by 2002:a05:620a:240f:20b0:915:aad5:e961 with SMTP id af79cd13be357-9161bc2369fmr1782861585a.19.1781569339082;
        Mon, 15 Jun 2026 17:22:19 -0700 (PDT)
X-Received: by 2002:a05:620a:240f:20b0:915:aad5:e961 with SMTP id af79cd13be357-9161bc2369fmr1782857885a.19.1781569338549;
        Mon, 15 Jun 2026 17:22:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16fee3sm3056234e87.31.2026.06.15.17.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:22:15 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:22:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Message-ID: <2i6yzwu2yk5bngq723g75yeqzeg4ihvtbuydzunceltl526tjp@vnt6nmxxkfut>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
 <8518a085-b8b7-4ee6-b08c-8dde3971a6f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8518a085-b8b7-4ee6-b08c-8dde3971a6f1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=adxRWxot c=1 sm=1 tr=0 ts=6a30973b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ak52lZM5eA1PxQ1fx0cA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: LHJnyoORKR7nFSuOHXvmfvJAN3y_ekCU
X-Proofpoint-ORIG-GUID: LHJnyoORKR7nFSuOHXvmfvJAN3y_ekCU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfX9JGuIRkOSBLZ
 iDG/O/Oew4/5PFtjjpzjTeIPgho1LIjCnYzgEFJwYmV8EuWT2wbQR4nNPnJXTFnUGEDi9TCfPa6
 JM0l2Rvhzu8YNXUPZkQIodsaWJdZDvs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfXw7xenQQuAPc4
 0HMPJOdf7JayjiMsBdmbJq3JQ6NhWTIb87AjldPt5mK9whkQuxT1yV8rGOTT/FWYAdzuzJRwLVF
 4CGEV2K3wIIFrSek70uxOI6wKA1Serb7zobehxOnJJ/c72DUT7bab8wnjCNoxCVVEQsqvHkHQpW
 EekZpYaJYiVLYHz1AIm0fhpNupDG3xFOT2exHwbnILJHgCUAIVUGdUWV69SFT7Nx+RcT9bFUP3J
 7rXIaO5NaklOCv/lBk13ul6Ar2JA8vpt/4MgQbGCf/i5bw8rHGF0gHc/dEB1UOi0uwOi8zWW7Mw
 XUhyyvzjyJNabZ3soDWDw8E57AcoU/AuxpVlsvsCHAIch4Jn5qvWZgAvXHfly1gIkv93WaQBCBV
 xpUcKJAbNglL2SMBlr9Ksj468Hhl2Uvrtc6T7ea+of9hGSB4LMbvLhP8wtykQIOyTwKsw8KHnYY
 xfK6M3mRNshQKwCJFlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160001
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113299-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bibek.patro@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3812E68AE88

On Mon, Jun 15, 2026 at 06:55:45PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
> > On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
> > > On some SoCs the SMMU registers require an active interconnect
> > > bandwidth vote to be accessible. While other clients typically
> > > satisfy this requirement implicitly, certain corner cases (e.g.
> > > during sleep/wakeup transitions) can leave the SMMU without a
> > > vote, causing intermittent register access failures.
> > > 
> > > Add support for an optional interconnect path to the arm-smmu
> > > driver and vote for bandwidth while the SMMU is active. The path
> > > is acquired from DT if present and ignored otherwise.
> > > 
> > > The bandwidth vote is enabled before accessing SMMU registers
> > > during probe and runtime resume, and released during runtime
> > > suspend and on error paths.
> > > 
> > > Generally, from an architectural perspective, GEM_NOC and DDR are
> > > expected to have an active vote whenever the adreno_smmu block is
> > > powered on. In most common use cases, this requirement is implicitly
> > > satisfied because other GPU-related clients (for example, the GMU
> > > device) already hold a GEM_NOC vote when adreno_smmu is enabled.
> > > 
> > > However, there are certain corner cases, such as during sleep/wakeup
> > > transitions, where the GEM_NOC vote can be removed before adreno_smmu
> > > is powered down. If adreno_smmu is then accessed while the interconnect
> > > vote is missing, it can lead to the observed failures. Because of the
> > > precise ordering involved, this scenario is difficult to reproduce
> > > consistently.
> > > (also GDSC is involved in adreno usecases can have an independent vote)
> > > 
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > ---
> > >   drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
> > >   drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
> > >   2 files changed, 57 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > @@ -53,6 +53,11 @@
> > >   #define MSI_IOVA_BASE			0x8000000
> > >   #define MSI_IOVA_LENGTH			0x100000
> > > +/* Interconnect bandwidth vote values for the SMMU register access path */
> > > +#define ARM_SMMU_ICC_AVG_BW		0
> > > +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
> > 
> > totally random numbers, which might be different for non-Qualcomm platform.
> > 
> > > +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
> > > +
> > >   static int force_stage;
> > >   module_param(force_stage, int, S_IRUGO);
> > >   MODULE_PARM_DESC(force_stage,
> > > @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
> > >   	}
> > >   }
> > > +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
> > > +{
> > > +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
> > 
> > Is there always only one bus / path in question?
> > 
> 
> <Apologies, missed to respond to this query>
> Yes for TCU, it needs to only have a vote on GEM_NOC interconnect
> while accessing the DDR in downstream path (client->TCU->DDR), which we are
> addressing here.
> Hence it's only one icc path in question here.

Again, you are describing Qualcomm platform, while the code part is
generic.


-- 
With best wishes
Dmitry

