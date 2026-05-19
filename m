Return-Path: <linux-arm-msm+bounces-108433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCg1BmkwDGpuZAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:42:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD4157B780
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2D4130242A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601C6410D3E;
	Tue, 19 May 2026 09:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l0PLcsfw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IaH1iJUA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE8F4218A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183380; cv=none; b=UC1KkbdJHYlfn8oqnxNDSWSWye+p7o6RnFUzW+qOG+yi0bzDTh85kAVjk09/lH198orjAI+0sD8RQFoPwUkSdYfgcnmR1wzvKO17Z92Ru3No5x6Pe7OyTxM/0nP25z04FqQnp4TQjqYHlU6TV9YR9aQjezgVC+edO3XuXN6RyLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183380; c=relaxed/simple;
	bh=Rn2q0WRzwAyzU9D2VsM+1aegQ1+UBWWyjT/tTWOTyyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGb1yvol33d6E7Y0N85ivX13ojsFUv4WTgkPvJDDTeOn7QLgXXYN/C1xpifaPCRovH79GYBEUJJV72O15aSs3KkVX0gt+/GtBvIEhztLQGYaNO9IguyXQLp+63mLHoK4FT6mxiWPaSl8UCGXaEatxytkORlBnLl/OW50V/9qmFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l0PLcsfw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IaH1iJUA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5WGVj4130965
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 09:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f1cFMDjahex/31p4QQ+OR6H6MTwOoWeHpCxCVgbYY6I=; b=l0PLcsfwVx91CpkA
	XjD45hf1d+eTmfDKr0jpn5Xe644iKD4BypVbr3fqUfGIhQNL1HMClNf1Uv/6Kc5/
	JVmdu8w3tR8YOGtTSjao8Vz2gIkJD6teGlYLR7OaDFE6gV7clp9iQtpIxkyeL2pW
	zGm+e7MgJtuqXWa4FPCsmtK7uSV0oDHZiKnpIrnaycahV4JpxgVPlvg3iv2YLmzQ
	bDY7IyTNVDGCFq1FUj9ny2B7SU8BU3XR8h1FJXo91g+BmEeUhZNizc9mieONF3zC
	IeMPtUKiBAm6nAlW+qu7WxJWA2AE916bqly0IlOYLkvUAacStkAi9q6qyHoMvq5t
	XIGiVg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ht1h1m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 09:36:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fd55bf6cdso2115761b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 02:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779183375; x=1779788175; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f1cFMDjahex/31p4QQ+OR6H6MTwOoWeHpCxCVgbYY6I=;
        b=IaH1iJUAcv/n+0enNiemefMpoE9sMICA+6fZWUlhtlUFksMXJ3slcW7ulW6isuOqI4
         1OLsboL7iZHFFt4lVXx5fWsZ0Pfgk6aCa0se0Ttl7zN97xgLBpI9NdrNUI65DfIDErH6
         Mcsb2sV4zhnC2TktQCnbe2OKR3TMuapXacMfLVZmQONIRdtAqfg6ih8tO72Yvz2Iv+q0
         7CdJw/EM76P2tnNG8BycNAYw1UhV9mo1mcVbeAr1BmK3mo6NziMEjk4nWODnpKaHukvE
         lJtHh6DR2hHu8CP+TIq0txhUmA7tO99sEOu6HIotvkAjePpjna+bKoQPn9Qw58WCr/SG
         P5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779183375; x=1779788175;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f1cFMDjahex/31p4QQ+OR6H6MTwOoWeHpCxCVgbYY6I=;
        b=DUpOjCBc9CARpuDkh5ZVGoUhZbpgccl9TS4EhjL2+BmWmvfVbg3fqNEL54/20Mb/xG
         Dn3Xgatlq6paPGnth7CNuK0i+x5esSAOYXRUcREWpjT+skuk2l9qkcWrDl3TluBWwYLN
         x7N+V5yUOJXTfBkQRuoJzhUxLm3fnNZLEtSDX12j+yG4I0pcGh4VE5gOPHiMUFUxie0T
         ASmQgHRHXq8YzuTx5RGtTtC+s9LaAdC91Kr5uHIw2V41dUmm+eilCBCY6I4BzXC6blXS
         fegpSzsRLU1Pla/PgQeHdy/SKOvPQvmvlXW1k0OWz9mfutg/H0UiAbSfSdhdGQ21I64T
         wyDg==
X-Forwarded-Encrypted: i=1; AFNElJ+JD8GB0u2hgtgRJ8nDbhOsyjDSs8s3uasSqB8IpTNLd8OK5Y3hT6wH1kiEUYkqEoy/sURdgOq39d5mkXrD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2XytBfupnn1BZGNy9O+WTJdO42SjYNMCxG1xwkIxBnYjd/R0F
	Iw3sqVT5SqWjxdxr3bNE2DYMtibTF/y+zrwelK9yM4QZ5+hT41vHWXZxcYoP60RpJFoc5FFQ4uf
	zqqkzeYFoz0MTDJdEMgCELuDd4r22NVL+6EyDWkRrq5WdHjlY/2JVaZlqkdOciv8xViu1
X-Gm-Gg: Acq92OENlEGiYu6DJhMtHlqBMRf+dkciBHSmuPrSEtPu4nykTzqkPLByRzKa/akSrvV
	UL/rQQjN2HNgrIHeQLBz+nSCLmM8O6HZqy9jJwDzttL9n08X7AQpJAA25isLBuKnf7SbVEmITsn
	i/SuJYJPa1EaIh/CXnx5qE9S9mgErvcNiNe+DABZWYAuYue6dLreTaPGb4HGoPhe0i1HrFz1gIm
	fjuHYTeAVEmRM4u9QAnDRmMepBaHLZNAm/IZMQ4YNEnNPkWA+thhlwTmHHHmqgv/TFNTJrT/Un+
	T/i9JwtQcbGFjQn/rC46SI1+/Y1aGhgoj9cOQ6UV1eJe15bVdgYmOZ77trJ+Ifn+gEP5cYUsYAx
	c5H+sqcopMFFTYFzIUmb+4v/23sBhBvAdmPQmjyzzzJ4DTRtf
X-Received: by 2002:a05:6a00:4489:b0:83d:6c12:a634 with SMTP id d2e1a72fcca58-83f33f38ffamr17680153b3a.48.1779183374919;
        Tue, 19 May 2026 02:36:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:4489:b0:83d:6c12:a634 with SMTP id d2e1a72fcca58-83f33f38ffamr17680097b3a.48.1779183374212;
        Tue, 19 May 2026 02:36:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19778c87sm16455794b3a.19.2026.05.19.02.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:36:13 -0700 (PDT)
Date: Tue, 19 May 2026 15:06:07 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] dt-bindings: firmware: qcom,scm: Add minidump SRAM
 property
Message-ID: <20260519093607.gezs4zq65qjebkzc@hu-mojha-hyd.qualcomm.com>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com>
 <CAL_JsqJJ9ma2wTwyrV6AmkGULJk7YMU6qm3Guj+jC0t_-hfV+g@mail.gmail.com>
 <20260519084227.pfkasblfliqyxqxx@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519084227.pfkasblfliqyxqxx@hu-mojha-hyd.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JKULdcKb c=1 sm=1 tr=0 ts=6a0c2f0f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rnkpo5U1iQQg37PeS5sA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: DMdmlDvVubtu-utuHBv2duO98Agbsv1T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA5NCBTYWx0ZWRfXxc0RlD/O6m2v
 UFmn0jchYzQbY6hefDXIBrrGwqLA2kHQ91woV0diIsE8t5QnRrWl+Gto5B/3b++HcsjAw13Zacg
 jo3LaTViID2+yYxkgPoj2h/dJxZPaRBWVxTqSFnmPGejAONaow/opPx/xGj+pVjlIBhRNQeAFmK
 c29IZLI9kV9nUImobH9wmL7em80Arwh4n18HVnwOQe51jr9NRae04kTcQJ2qx9RLhlOkzFyUiqm
 Yv+H/Q5EwlO+6vyxVP84LOHgEtLcO71YLdIOBtHQyi97XNat3DAN1YCF21HLjzoChAWXoRld3F6
 ukwjDNda9d6t+eJJRCG/Nkabx4wtvZvmW1qGBS4snxSs4KIA/aNy+75udWbo1b4EqO8aIcDLKXu
 gI1xu4SkEXjuHMHzhZFOd5F7edtzq7PRuPWtSKwJqeMNY1uTH5p5JWF5Ca4GqXVa81PkLxLlGk5
 MM3MuLiX0o98WyqGcnw==
X-Proofpoint-ORIG-GUID: DMdmlDvVubtu-utuHBv2duO98Agbsv1T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190094
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mojha-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108433-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7AD4157B780
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 02:12:27PM +0530, Mukesh Ojha wrote:
> On Fri, May 08, 2026 at 07:07:14AM -0500, Rob Herring wrote:
> > On Thu, May 7, 2026 at 3:07 AM Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> wrote:
> > >
> > > On most Qualcomm SoCs where minidump is supported, a word in always-on
> > > SRAM is shared between the kernel and boot firmware. Before DDR is
> > > initialised on the warm reset following a crash, firmware reads this
> > > word to decide if minidump is enabled and collect a minidump and where
> > >  to deliver it (USB upload to a host, or save to local storage).
> > >
> > > Add 'sram' and 'sram-names' properties to the SCM binding to describe
> > > a region in always-on SRAM where the minidump download destination
> > > value could be written. Boot firmware reads it before DDR is initialised
> > > on a warm reset to decide where to store the minidump either to host
> > > PC or to on device storage.
> > >
> > > Most of the Qualcomm SoC supporting minidump supports this, added the
> > > kaanapali SoC for now.
> > >
> > > Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > ---
> > >  .../bindings/firmware/qcom,scm.yaml           | 57 +++++++++++++++++++
> > >  1 file changed, 57 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > > index 7918d31f58b4..6813081fd74a 100644
> > > --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > > +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > > @@ -127,6 +127,22 @@ properties:
> > >            - description: offset of the download mode control register
> > >      description: TCSR hardware block
> > >
> > > +  sram:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > 
> > Drop. This is a common property though we need to create a common definition.
> 
> Did you mean to just drop ref for now? And common definition could be followed later or
> create one as part of the series.

Ah !! I see your change
https://lore.kernel.org/all/20260511165942.2774868-1-robh@kernel.org/
merged., so no need for a new definition.

-- 
-Mukesh Ojha

