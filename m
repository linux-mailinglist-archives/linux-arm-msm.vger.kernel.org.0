Return-Path: <linux-arm-msm+bounces-90614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sa5hMTntd2kVmgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 23:39:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BABA8DFBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 23:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAED83018767
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 22:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A683016E0;
	Mon, 26 Jan 2026 22:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UV1nWz2K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AlVHJHrw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0095E2857CC
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 22:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769467191; cv=none; b=hx4bVmKLHHXZrCvmxjyRzCt+u44oC6hLxWt9JmBQJ4ZT8LZKZyhZD7iwVUw8VBxUZhPtnMbblFrhxJ5VmhaZfaREa1xX6eP4dwRFGieJq2OzEhwBpblYlyemDwEk4ObcQyj4+S6oPLyil/SvTpid06AWHAg7ugP3l3aensJyyTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769467191; c=relaxed/simple;
	bh=1CCpl/FguMqumi7zRxf48d8V0/qPwB7xQXq5yu5h6LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaxayCxfB/t6J3/VEyy6x5r1jqSj+Zr97Mvy1uaBncScUhFhKqh1K5/15KAcSKxXEbiXiS70+8Hec71rYjnONmqsD2eS9qrcS7GlVW94lVkiAP4l402EQe0B6eB9dlucTko2rJolR5dFBnZ1Z+UXySfWeY6eXzg6Kkrkm0ScEeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UV1nWz2K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlVHJHrw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgsOf3481823
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 22:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BJw1pKWD+0SPxOFs+hgSTtgs
	qq17jNCU4R5tqp1NYsk=; b=UV1nWz2KyUcZWvBfeF2yJOLVa6E66dOUMDqGzki1
	0J79beU421bKKmtfK2jGLF72tS/dUUwHTDhDKIDzE/2ZEml0Z0w5JFWXrdh7CGxL
	7EgFjFqrFNXIywOabPaAO/iJqNDDHb1NWCKUtOJQu6i2sBy8Da+pHAJNLGOqGR6D
	2SfiC17FZ/mqyHY7r1U3umy/+pUE7AGNVO4Sg0enprFKkGNZ5eDynfQhqTq8znrc
	P2HRaPkCFT4lgZO9MHsv0eqDQLKQGlqtIGoD3iNecFvYFfKMD8r2EFiMfWTPUw6k
	OTeXEHs521L0Uj9eJr/sH8JRdatUXgD5aPm1WO1SYp444A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx0v32uqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 22:39:49 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5f54c51ec03so4251357137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 14:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769467188; x=1770071988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BJw1pKWD+0SPxOFs+hgSTtgsqq17jNCU4R5tqp1NYsk=;
        b=AlVHJHrwf22kbYA+aD0hFWP62COO2SUTSMRDUsnJzivopV+v2Z65OwPU4NOO1kn8ty
         Ck9E9gmQyNvzXd5lphQ7aQN8PbB7SlvtTWNgUG7W4H2jN0V3H+Exho3/MarjqdTcn8KG
         aKnYGEtPHvL+pkHuPvjHA1XT5ItiVtCvGDoe5ORylzOgSEVrxhCNPxDFHsgQ21pq/Alp
         Q10YUaCLDdEnpuj88QQxPXN//CBeAoh4BuoJ3Tt2TvdEUmOuqc21n0rtSwSh0sEt1H5f
         eqxA+aLONB0DnbKd4fuwz0B1OZU/Wf+7psw7Pzss4CZy3SjbY0+nGmANZQ7eh+MSRwFG
         7H5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769467188; x=1770071988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJw1pKWD+0SPxOFs+hgSTtgsqq17jNCU4R5tqp1NYsk=;
        b=WdIxueJ++LOZ7TWQm+qVJDb/no5bZcE04OnJkvcKYsN4Y6Zi3Qpub2oM3x1kbqWuaq
         m0Qmdi0j5ieU86pWUmx/DHoMfRthpZhsY24Cd0VqqYTTtuC+/LOaUEDYqPlC1QtCgD8i
         zr/E5BtHbwPY0e/TLDpsn2YJk5XJ7b+YzHizRUKbZjbxkSjzmSRERYjMZZ7FbZO9UXIs
         9udZCk3+QRilH/MXykmnOOcJFRrlghShPapJ5q0KJjQXsuXEQG1XDUlF2F4TGws/AP/Z
         lnz/R5AJjerRb/MkzHBWjf8OcRDLPAIrBE6M3MCCxBT2//PZBpviSo3pVUcTffH9A+bp
         NhAw==
X-Forwarded-Encrypted: i=1; AJvYcCXwsI+Fh5vkrzXAK24U7+ZgH7b8xoIV5E7CIdg9BM5S9XSL66U4cnVqF0BzXVi8SKT7XdEww1iJj23CV3zy@vger.kernel.org
X-Gm-Message-State: AOJu0YyibqJMLY8GmEcIulp4KP5nFSwc/rpVI99zFT3ktjJUhVLkkhS1
	9qqb46zIkTxXVX3UtPRoAiKKaIua1TFuWy8QqHyEY9lA9fHFflqK/zvlloq1o1uc6cS5A1ErBag
	UHnIx0QSDRCRJ+CbJH9+nus76xpnstHGt/mG3Eq9CQtpQY7ckAf3cRHmMiP992T9syEPE
X-Gm-Gg: AZuq6aJKGUB2Dje9GT4ermOogfjdNnJvq+sSUpH+Cyr6eydhaEKQjEI46WeeYgMSnuG
	em33pSnjUqR+W9Qx5hj2Oikn0+bkK4ecQ0BDepL50lKTOB5jLeCXE5Q6nzZNLnTuCyQ8sgdLNpU
	uZP+61Ak+QnWRh/rAiKfaFclnPsmKwNk+rJysJrZGMg43fWF7N/HnHTaKAhjsGN6ylKKyv682Rn
	jk7UzbngpfTu4JUAxoblUQKHkm8nIw7+upJ1UlBd0qNAcfGnTxftld48p657OO5rY2CYGdrkKow
	rFUtjXP1n5mGmqu8nrRXiBz0WpDA+Rx5tHAEp/O2mhm8XR0pU0gcj/c+kUL3K3GNAgkwm++Z9Zv
	uUz0ObD63aEyKwm8x79iAU6QnT4pnKEBcgY5Y30goDAzibe8H+5Xt+74uKxk24x0I6AXM7OCjOO
	bCs6rGoL2/HkmDgpRhf7sWqkE=
X-Received: by 2002:a05:6102:3a11:b0:5f5:40e5:24c7 with SMTP id ada2fe7eead31-5f7235e41acmr180308137.7.1769467188244;
        Mon, 26 Jan 2026 14:39:48 -0800 (PST)
X-Received: by 2002:a05:6102:3a11:b0:5f5:40e5:24c7 with SMTP id ada2fe7eead31-5f7235e41acmr180300137.7.1769467187848;
        Mon, 26 Jan 2026 14:39:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de45b28cbsm3016634e87.0.2026.01.26.14.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 14:39:47 -0800 (PST)
Date: Tue, 27 Jan 2026 00:39:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: talos: Add missing clock-names to GCC
Message-ID: <hhfovqv7rsvhfomvbejv6kt5es43teicsooxwu7j73tva6ts2f@sgjttfe5offu>
References: <20260126-topic-talos_dt_warn-v1-1-c452afc647ad@oss.qualcomm.com>
 <tw2lcfppz6lrmnpcfm5yh5j6iln5amedo2fxbyapx5ralclhjl@tyiretqzszcm>
 <5227ff03-3008-48d4-a22b-f9a9b1d9bec4@oss.qualcomm.com>
 <pjambgdh3fh2ypbun5qnmcpwrz2ajbiulcz64g7epegjy2j4eh@a2zkzepj5ro3>
 <ispsq6ntw47gf5befoe3kpomhnsszolnxbzqpwzu36dr4jbbow@zepv7cxdbsez>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ispsq6ntw47gf5befoe3kpomhnsszolnxbzqpwzu36dr4jbbow@zepv7cxdbsez>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE5NCBTYWx0ZWRfX5iuw9KSNDGah
 ED/AgP+FeBwno0jHfYidE+WeZ+rYtx85ppwnUgxlgGRUzsLNUEu3GAuKh5AmagTArfLBQqrLsIl
 YY4ODg1Ti4ETJNVEgVIggrfhjPW3itYRr+ZXUuT+G8XaFE4IapiDj7pFyTOQUT4ewVQ7vOznO4/
 qHio9IDCbINQL1YgWtHKGgLrnxy6ydqbcyDYt2JisDxMY5e2GDdqhc/LuKuYz4AwdvzJwxTND5n
 cGutgFuWSo1JVWp4aDEzOkz50dQsnWt0+l/EjIeQ9LjtgLPWy8bTubDuIvWGq+0M3HWLY4NEdkJ
 lV/JPCH/k5QyNICIgNWZInDqjnIWvmbf7nP4pA71afzIaPbNlip16++xuD2iahFASgMz3SAS9qj
 dBJ4DQgFLb0Dk/H/PatWXCh6m1efgfb6R/u9TtCLNCGryyY8iQf0+gC4GvQV67RC+B42y4Z3gRF
 3WWDJkTKm3CifNOENzA==
X-Proofpoint-GUID: CNpdqpwNr79P3Szw2_mWWbZtxExI79CP
X-Proofpoint-ORIG-GUID: CNpdqpwNr79P3Szw2_mWWbZtxExI79CP
X-Authority-Analysis: v=2.4 cv=JYyxbEKV c=1 sm=1 tr=0 ts=6977ed35 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LKecUyDuG6RTbdPUQNEA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260194
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90614-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1BABA8DFBF
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 02:42:12PM -0600, Bjorn Andersson wrote:
> On Mon, Jan 26, 2026 at 07:53:44PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Jan 26, 2026 at 02:46:20PM +0100, Konrad Dybcio wrote:
> > > On 1/26/26 2:33 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Jan 26, 2026 at 10:45:03AM +0100, Konrad Dybcio wrote:
> > > >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > >>
> > > >> The binding for this clock controller requires that clock-names are
> > > >> present. They're not really used by the kernel driver, but they're
> > > >> marked as required, so someone might have assumed it's done on purpose
> > > >> (where in reality we try to stay away from that since index-based
> > > >> references are faster, take up less space and are already widely used)
> > > >> and referenced it in drivers for another OS.
> > > >>
> > > >> Hence, do the least painful thing and add the missing entries.
> > > > 
> > > > One (me included) would assume that the presense of clock-names imples
> > > > that the clocks are fetched according to those names and become very
> > > > surprised if they are not. As such I'd suggest fixing the bindings instead.
> > > 
> > > The reason why I chose otherwise is in the commit message
> > 
> > Should we then change the driver to also start using clock-names?
> > 
> 
> That's not necessary.
> 
> The binding does define that the DeviceTree must contain clock-names,
> but it doesn't mandate any implementation to actually consider this
> information.

Ack.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> Given that the order of the entries in the "clocks" property is defined
> by the binding an implementation can choose to rely on that and ignore
> the clock-names.
> 
> Regards,
> Bjorn
> 
> > > Let's try to review bindings better next time
> > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

