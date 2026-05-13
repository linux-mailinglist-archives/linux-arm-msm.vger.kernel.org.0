Return-Path: <linux-arm-msm+bounces-107230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APsHJQMXBGpLDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 08:15:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 950B852DFF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 08:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 60DFA30142B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 06:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31423D410A;
	Wed, 13 May 2026 06:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gsVQVTIJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJHiULT5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6C43D3CE7
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778652911; cv=none; b=Y/okUzVI363uNAOw2MdCe8TJ7SZTFQCvrvgZYFPBEUDPcWgsC6eX7gMwIbNKvXMSqwFXrr0N7bRNxJVjzZfSWEQ6Oj9q0WAFCmCa++BR87AzozL+6m94zu1qcmaXGpTYubXuFJUMYBzOvwWaYA8xa+OuZz0tgcVAK/DwRJbWQI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778652911; c=relaxed/simple;
	bh=XYYv/jyfCNRw0Yxt6HrCV21jlWPEDp1OnnUNZCOz+Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hh7cfDPMD+1pQ67JzWv/VKRrAYngmJp/3UjUcSwkty7C6l5btXdlUERLPylpxwFDIg/GVofGDG1kJjyP4LxKfifwa4cEwVai+xn4kqrZwVXJeqSmw8bZ+j0iOD55ABbbt4HykMh1thII4d2SWueSBtqPHvBRwe37LUiHTJrKEcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gsVQVTIJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJHiULT5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pDdw2344087
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3U7oh91k2OAdqpWQXQtlpoZT
	jr8XjIfRrTRr1I78JqQ=; b=gsVQVTIJdFHQB6KuKCXaSo7YTbQlllNHO/qAlzdn
	N2zows5AuW8v84I0VuAf+9xk47GYu0I6p5RP1UiOFSbAmlZqh1U/9mmCIav3ZzKu
	T4G/7takQExYe9/uEVlbMF6+xgx1O2tlRrf6eqjR1TxgGOZImvHyS0Vo6MVw6J4Q
	jQ7LSjQ8LS09twdq3EWmoFwbDqoIMPfAIu2x+6uOn2BM1oT/v7R+kRub5Ms0HqC1
	OCQs/RKZizjD/cyeAmhAhqf4zQCpSOnQAwhE735oBAZzBC7exs4EIkyXNv3RZbL1
	1WTnwRSXwRm3ms6+Y2xaN6G3BIMnoQOzvklPB0jYNY1zHg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43tn3jhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:15:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fbc70cfbdso154386881cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 23:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778652908; x=1779257708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3U7oh91k2OAdqpWQXQtlpoZTjr8XjIfRrTRr1I78JqQ=;
        b=fJHiULT5KrFqnVnSNWQtdpVLCwjW3MajppT88Imw7c+moDdxgC8y24FVpe8xnmk7Xh
         jvZ2igu+59NEpjbzka9+iGjnXXXkyhXAvEY0YRZ99AjvR61GwaEVoeUdzeD6UMWgPpx5
         Tt/gvoJuKujEB0LkyBK1IgwtVgPTYGuzYIB5RIXm7NoS6GTV0Hfdl6lmbz0O9cdjtPtO
         XjggDb3YO/+R0bidc3IVHJbw0g8U3/ahzrZ6jteL4fgJn7+qYUsD6XZxn7FLG/L1h8ND
         8PLeRJMIEslM0jBxprtN967rV6DqPg9G63HDatjkoAAUNmfF+EBJx82liXRZQZRN+7BU
         ulBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778652908; x=1779257708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3U7oh91k2OAdqpWQXQtlpoZTjr8XjIfRrTRr1I78JqQ=;
        b=T3LIuUQkj4YVKN8RUrbBzC48mRFxgFqHjZ99/F2pWZrwsBcVRmtO4SW4DNY+Di6gXQ
         xdA9+T8lOSzWOSwRyoadQrZS55d+Z/ctPy+rMDeDhCB24dqj3PvtXNd/2yRbJVXN7i67
         rLj6OSViRTlkxxQRAQDbUU8rdZkbOvv8W/Kfbpw73V952DFMaejxAcn2oe6tg3C/r9IW
         KFvG/xWYM9D7L/F3q0UX6vKLP+DcqWfXfqpFrD0vRwASPIrOg0rs51wigjKiq3yjPGMo
         16vrXeomXrg6yjumGXIYPjHKRTRnfPw0GRCGkRjJan7oyjinJUNOhBcGZMi1nyEW25E/
         hU9g==
X-Forwarded-Encrypted: i=1; AFNElJ9wjDtx910A0MiQmrt/ruY1mCaCYNmAeZ56laO9qnt7sv3P2kyBrVWUibCJS36bBTkRpar3dJJMGKxxsWSi@vger.kernel.org
X-Gm-Message-State: AOJu0YygyVw4llbwr5uQ0g+MYEG99KWNu7jgVBWhmWjVn5hfx++QzcTK
	UnGbP2iU+IX+8ieWoDTiFW/lqP7tIh+UJ31ar0jfl1SqHTHqRpeyaZVfp7A1uvw5B0pHn6RlzAk
	FF/2lourfl1PwZXwH3EqfarMmC/pOdtZYFUUH/cPX45WLZY/+5fuMzSQf8vnUUgTN8M2E
X-Gm-Gg: Acq92OGGQyhJUt8rY/theeIVsmc6oAhxnUWM9yVdeML0CLnnkIBgTrZYkSOOnK/1acH
	arE4uYXTZKhWAnxOUqisbOH2SQvOnrgQvcPhHpK3ddlrzWYn151xRnqpkBXORr6whCvG7fKso26
	f/KncD1U1FW2yyf6MNnrh3SRnn1bA+7U1tRI73orfb2p22c89+TDwHTceybQCz5IsI3O6L+ISuW
	4+i/2bwAtRwff5i/ySbhfUmu9qwDuDW2nA+pdqLwhr9J9XPVErPMHS7f2P5Kcy4pzZxzw2X/avK
	7DogsBQVfptncsAv0XTmIKUUSeKAV0c6RxByKWCPYyYVTj/IwvDiOvMS/Ep3ADESxBO8hCNy3OX
	JJMeFPvD4kZ/8m+EbYOg8GkvGDnbClcGru5sH
X-Received: by 2002:ac8:57ce:0:b0:509:3c8c:23f7 with SMTP id d75a77b69052e-5162ff0791cmr21396741cf.30.1778652908374;
        Tue, 12 May 2026 23:15:08 -0700 (PDT)
X-Received: by 2002:ac8:57ce:0:b0:509:3c8c:23f7 with SMTP id d75a77b69052e-5162ff0791cmr21396321cf.30.1778652907881;
        Tue, 12 May 2026 23:15:07 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a68ebsm36420187f8f.1.2026.05.12.23.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 23:15:06 -0700 (PDT)
Date: Wed, 13 May 2026 09:15:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Add Eliza-specific PM7750BA dtsi
Message-ID: <eqypjd2my5onkmszqbdadwerhuhz4a2pgwijgquvr7cjsoojm2@bg2sfa75uiza>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
 <20260512-eliza-adsp-usb-v3-2-6420282841c2@oss.qualcomm.com>
 <q2P-fl0-Y-qp3p1j6PRmUd5xM92-IslEfMGk9rFS_n82-beFGjS3MfZ8J8frpp17AVDYuOiJ8IzInsAE7cAotKSF4JP0LwgCXC6ET4eI_dU=@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <q2P-fl0-Y-qp3p1j6PRmUd5xM92-IslEfMGk9rFS_n82-beFGjS3MfZ8J8frpp17AVDYuOiJ8IzInsAE7cAotKSF4JP0LwgCXC6ET4eI_dU=@pm.me>
X-Proofpoint-ORIG-GUID: S6qWztDNlNZ0mpYh2UT6F00Y1oVZHZEg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA2MCBTYWx0ZWRfX232Iko1k3mj/
 3lLgkHib767X9gJFkowGrH/Af501dFwrqTtva5VeyuN0KVjVOz92QBZtQZMp7jPnTduBvV2d8jE
 0liEzcBwU5RxrGLprPr4LBHDa/05vHoxHY1xrKrRaWkyQOJ4A0c14IPcPcfM795RwgOdrsw2c8s
 siqbvsvA52+vcXGAR6DM309wJPYjJttpz0bzOLV37PmxCu7/iZs5dVDHMItu7h/iW1WmoeA8IAY
 ti++R8Yb6u5sLVyes76xZk4R79dq97eNxp5c2PFgP23Iex8xcl1B2CvFWCDDYcm7UKpE4Gpym+f
 JKm2dBhQvRRz9CowrxgyppyRuXy4E7PbN9HdFKTe6zCSLMWpXGIC5TvmNU4qKveyGVXuHHgWCIN
 xmXmdd+/B21nQWWA8hZpx71VIkWMxTzcBO4IUFRW3cf6yozEmJq9mZjKE9qwNg3Tyja4WFo+fTN
 OME2uUPx6hTdKTrOHIg==
X-Proofpoint-GUID: S6qWztDNlNZ0mpYh2UT6F00Y1oVZHZEg
X-Authority-Analysis: v=2.4 cv=Ebn4hvmC c=1 sm=1 tr=0 ts=6a0416ed cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qlGBwchHFJG7FVo9ngoA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130060
X-Rspamd-Queue-Id: 950B852DFF7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107230-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.7:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-05-13 01:33:27, Alexander Koskovich wrote:
> On Tuesday, May 12th, 2026 at 8:32 AM, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> 
> > On Eliza, the SPMI arbiter supports multiple bus masters, requiring
> > explicit selection of the master for each PMIC.
> > 
> > The existing PM7750BA dtsi does not provide a way to describe this,
> > so introduce an Eliza-specific variant with the appropriate bus
> > configuration.
> > 
> > This duplication is required due to hardware differences in how the
> > SPMI bus is exposed on this platform.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> Was wondering if it might be easier to do something like this instead?
> 
> eliza-mtp.dts:
> ```
> #define PM7550BA_SPMI_BUS &spmi_bus0
> ```
> 
> pm7550ba.dtsi:
> ```
> PM7550BA_SPMI_BUS {
>     pm7550ba: pmic@7 {
> ...
>     };
> };
> ```
> 
> That way you wouldn't have to duplicate entire file, but don't know if this has
> already been discussed previously.

The suggestion for duplication came from here:

https://lore.kernel.org/all/b784387b-5744-422e-92f5-3d575a24d01c@kernel.org/

