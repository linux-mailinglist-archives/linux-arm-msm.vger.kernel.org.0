Return-Path: <linux-arm-msm+bounces-108693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBaBHKOKDWpKywUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:19:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1573A58B9F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B4893008243
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7419F3D7D97;
	Wed, 20 May 2026 10:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5A5FBU8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ku1N3QbL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68D4347FEE
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272326; cv=none; b=rG38E37sGqXPX9vKFimrmfV6pp/c1Au0ny4pYLWUrpI26pEaRr0rTR4n79OCLpuFqUyKvr5HFrsNqCL8s1bfbsRuDvGpLpE0nzzl4tuvwBU7li5P6VGOICxOiV7C4eYrSsflp5O2om45TFpJSiyketk1qIYuLPldzNl8e6MZGFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272326; c=relaxed/simple;
	bh=9GvTCEpKamo7Puzjy5EVV1bfnNMCGtFBMZiQDoyLqgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kv9wa84LifPKHm4RcHZt0uQsp9R7YJv94wTT6Lwhy2RaDItpvZwtjtnZjpynIRadNErKRqlJrp4aQUl3pbRE8FsAh319o4lLrN76NUJzvrIbG9NCuhPIhibsjz/ICuywzkAsdkvCkUg55NR6zNv8cLzSFIw9XtEPvP9LH6DFrYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5A5FBU8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ku1N3QbL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6kRXF1953973
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+k+oT4e6hBc5LIJSb/AfTwEM
	WHG0zOLB6Gqph0QfZLc=; b=T5A5FBU8B4Q49FYw6rsT+wuTQ1paFOGadPVRhIXk
	/I44B6NrnHNaxKO8yFIc2n1wxV/1tAfgq0BLZoOwssO+FBr2294U/r0rcjgCjWPH
	qSs28psZkfWx+V5KMxH1aB5icaQKhc0Wi5vTKnNk4iT+kxPFDSr5pEVt4gSvrbA1
	D7Q0F61L9IJu30hwCYZ55/wFWJZf1jtsnyjWGQInP9v2TQchtGLqPnKmmglfHmZh
	mCPIyD3lXpioILVw1HmEcyNWXBL9PDMnMhjSW2e2IT8oPvedqy5F99X8C4xYzF6T
	dG6TQYwPk+CNhK+Yuj/ExUV0fv7f3QBuDB8JIh+O7aJ4ig==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3xv91b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:18:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2efc342ef15so5997376eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 03:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779272318; x=1779877118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+k+oT4e6hBc5LIJSb/AfTwEMWHG0zOLB6Gqph0QfZLc=;
        b=ku1N3QbLSrdyrL+/Pb3++SEhkOor2R3bg8JMZl9PmDcNsSaFd4rYgc3nvESeCHY/cU
         0/vUNlv0PvB9oeRGEmnnxx2cCDocW3tifXazvFYc76fQCqCJq+2vVINAC8Mi720kaxH+
         lXILxisaj4DFseLO5Ze8CMo/08UA8GVOW/4NUvd6x4IUR1QUCZaM7DORnI/t6P0F1TYJ
         ab2H8Kv+0/LapooyV3cm8d4Ikdyu5j0tIIMVzY2VR0pfCSnztuKz19vg0MfK6mg6HcP7
         GxtBPAAyBINonjqqfKtB3598RxqvuRewPMV68OpJxYptUfigmE/WJRepOucK4CD4KqaP
         HSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779272318; x=1779877118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+k+oT4e6hBc5LIJSb/AfTwEMWHG0zOLB6Gqph0QfZLc=;
        b=Cz2ObK+UloNh4xLHtgl4SjkcO2F6HBTWeNmKkExuQKfc1sEn13pduknwvb3PuGk6r0
         ZJXZsWOH26foTTMNABD0Rbmb6TiVeL0v3nvfsRs/6NzXMs3EtmXZXWDmAZKRGmw/NC6E
         PAo9LOk3Hsj2HI4bWWMqbrc7HIkLtzYOmbYgijRNUyKQuEaQ/+Y6PwEl8yUXGM7WGD8X
         XpHW0kE6Hrn2AYY3F6dHGvbSOIiSx9xAdf6KXm+XBDzlTmQxu5qlmTZKoo5dFAvJ/oyh
         zmcsCkj9Al7RGD+ZSKXSB6yE8+DNETsk/hZtEfRo9E+3wCdeP67xrkshUC55+8I7phUw
         rddA==
X-Forwarded-Encrypted: i=1; AFNElJ/L2Ob2QhcKdCYvyGtbQCjRCXGAiMLLCUHaIAdkiqs6xlfRNvZSw6Yd/MUBtC7GBPR4ZRIUXH2DdBAVljti@vger.kernel.org
X-Gm-Message-State: AOJu0YyxLww4mvxgX5k/P2Nv5LmIQQIYBhmaqQwpJd8H7QLKc0RE5h1R
	LJwez+FNIGXbpM0fA/Hlem2rbKQ/D2oQMFz2LKLkB6usx1Cx6OjdNHkCwgU7H0eRzzVkPtMzAAd
	+CDR03uA5RByqRcq3o4mNxW61PdyDD2aDQAHa10h28boYdVrR9rdfjdl9G2eqgCgCCHdq
X-Gm-Gg: Acq92OE32Gwp1rqIPG9VDgG7VqTOMq2LsCy1YHlxb7RNshIutv1AsZcDIA/bLttT3SJ
	OPzrjjsUZWbVb6fqJobM2CB7LJGnc6t8ABzo9PQlfgIETLUy6UfSfFXLtSPZUK1BW+z6EE/lCJZ
	AfuKYWO6x1p1vA6HSaFVkfO/DQP4YYhRA+DbaBFAmIRSRAgyAuBv+xyXRyub9u5I536l2IOSF4j
	7p0XeXyqJYpDD83r9g0ZsLG05TqkuvEjoS8SumG9YgLNnfhsk3AZM+gdahr6yAOf8BW0a8LWCyO
	kitiCJ7BeV/1iqjkG46pY7CiSwlv6hBTzmtQUpw+Fd8VXNqDxfyFmGJ4Qi57P+xo5q3qIFnArds
	0LbZic8eyLf3IZJwwFlWgymAgsjAvRFFXpqNEdyzwpkv1sOYqmmRKzOJhNQ2r3tzb
X-Received: by 2002:a05:7300:e430:b0:2c1:558c:16e1 with SMTP id 5a478bee46e88-303982865cfmr10691288eec.4.1779272317887;
        Wed, 20 May 2026 03:18:37 -0700 (PDT)
X-Received: by 2002:a05:7300:e430:b0:2c1:558c:16e1 with SMTP id 5a478bee46e88-303982865cfmr10691266eec.4.1779272317278;
        Wed, 20 May 2026 03:18:37 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3041ab8282bsm1006139eec.31.2026.05.20.03.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 03:18:36 -0700 (PDT)
Date: Wed, 20 May 2026 18:18:29 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <ag2KdR9ljtpEsmUa@QCOM-aGQu4IUr3Y>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
 <20260520082747.7seyyua4gfv256ev@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520082747.7seyyua4gfv256ev@hu-mojha-hyd.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WaY8rUhX c=1 sm=1 tr=0 ts=6a0d8a7e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=aI_LCnMVjoIqU1kGItIA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: ZkxFbAWZ1aCDIHy-FyIRj_Qrn5HdrINX
X-Proofpoint-ORIG-GUID: ZkxFbAWZ1aCDIHy-FyIRj_Qrn5HdrINX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5OCBTYWx0ZWRfX9LUur5y9l6Vh
 am6mTZ6zqo/xIreExE6ZTqcz+vaGEDdkLvVENLfu6iXnFl3fZvMlI6eOWd04vswiYIh1OtHJOfW
 ESB13/mvoUR/eY+lptFF15gHqozS83yFymRQH0pns9xaFkaJOvC6EwL3nQ/Ft0HQHzVA8gCqikI
 7tSvk1PzFNHCfP35mQJe1+5RWZeSzi9+Oy5WF6YqiLcfSkDZ4zs54XFbr4ChjclM/0P7LQtDVJN
 BjsIcQElqJmbQu8+ZZvzhbwLp+Iff303M6hfyvEcGjcszJQGYycly3cckC1ZdyUKyGnSBiO8xP7
 JOxstEeDDYLg6fSn7RVcG0MvaqtTzg/gbUKpafb+rhrc0LCrPqsV9LMfTfEXX2KWio6S/IW3vGj
 ePLIOHATlI3RGkF9huiTReKnY6ntel+cgtNkpCEd3RbbNsa7eFI9IcmjjJfWJh38Pgj5BS7EapT
 hjT4URZ+POXC/F2YzoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200098
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108693-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1573A58B9F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 01:57:47PM +0530, Mukesh Ojha wrote:
> On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
> > Subsystems can be brought out of reset by entities such as bootloaders.
> > As the irq enablement could be later than subsystem bring up, the state
> > of subsystem should be checked by reading SMP2P bits.
> > 
> > A new qcom_pas_attach() function is introduced. if a crash state is
> > detected for the subsystem, rproc_report_crash() is called. If the ready
> > state is detected, it will be marked as "attached", otherwise it could
> > be the early boot feature is not supported by other entities. In this
> > case, the state will be marked as RPROC_OFFLINE so that the PAS driver
> > can load the firmware and start the remoteproc.
> > 
> > Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> > Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 58 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index da27d1d3c9da..ac2a00aacd2e 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -60,6 +60,7 @@ struct qcom_pas_data {
> >  	int region_assign_count;
> >  	bool region_assign_shared;
> >  	int region_assign_vmid;
> > +	bool early_boot;
> >  };
> >  
> >  struct qcom_pas {
> > @@ -510,6 +511,57 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
> >  	return qcom_q6v5_panic(&pas->q6v5);
> >  }
> >  
> > +static int qcom_pas_attach(struct rproc *rproc)
> > +{
> > +	int ret;
> > +	struct qcom_pas *pas = rproc->priv;
> > +	bool ready_state;
> > +	bool crash_state;
> > +
> > +	pas->q6v5.handover_issued = true;
> > +	enable_irq(pas->q6v5.handover_irq);
> > +
> > +	pas->q6v5.running = true;
> > +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
> > +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
> > +
> > +	if (ret)
> > +		goto disable_running;
> > +
> > +	if (crash_state) {
> > +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> > +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> 
> I am not sure if this is already discussed, but what if it is the first
> crash with recovery and coredump enabled? What would be in the dump,
> nothing? As there is no segment, is it expected since Linux did not load
> this?
> 
> This is even true if it is a crash after a successful attach.

Good point, Mukesh!

I guess we can have a check in qcom_pas_minidump() to do nothing 
in case state is RPROC_ATTACHED?

Shawn

