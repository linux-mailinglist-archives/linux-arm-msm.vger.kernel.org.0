Return-Path: <linux-arm-msm+bounces-104999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAdfD9S68GmFXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:49:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAE34863C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1918A3203667
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F376423A70;
	Tue, 28 Apr 2026 13:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K+djEjs8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KRNXUNS8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73CA2D0603
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381776; cv=none; b=BeVyLScIW4AKC4K5lgIHpXHEt/Rghk1WCFrXcoHy3A6o7iEnktLWohzpFijEN/HRmHJTpDKMeg4PabPrgck90t+hNH3HLIUjzlqR5WhcNXg0Jfxm19R+p8wtb5p8Rjs7yX1OHWA7TKKd4/pG48xK51fm/GoIWoC7ssJafy3z/To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381776; c=relaxed/simple;
	bh=m772sO4CyrysG0gpG6Ls9qDZ97rEnegWhLZDBkp1D8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otpVaFQs6d+gq+epbHxIGL6mJubspqK3N1dykaymZ9Q9xhPUAGAgZNJhr2OWnQEwr0WijMQN/YHJWEIW/OC2iKZXPsYZ/r7jGDgCkCXshkzP91pPNr7MDM5hpOmnmG3LeJKYA9aTjvq6JUdSVg8UY7xkVjqQglZZy8p6RsHfElg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K+djEjs8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KRNXUNS8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9ECkT663244
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YYZ/OrtIVHKEhtlNApSiArPT
	0Xip7lxparc3a3qNDjs=; b=K+djEjs8s5s8oj4xdd8JvTFwovQ03p5dhVCK614Z
	f0DUnlqZqP63YU2dV1FQFOAtqIBgvrfrP/UHSLDKvzibPWzxQHzuaGQwl7tRoltY
	qStL/eAEfois2oH4MGB9ntoMUamX0eLsHELyro1Tk1tlvaV2M/hl8DF9whqCBM1v
	37+oD4Bpf3n2pndrJE2OsvWE5DB/zTnMyxTaYER9PFQXw/3KWtCT7arY3XUUAQcq
	a4dHXWmmD/wo97AXMCfMNbfk3+XsbNujMN3z+Ub/3YCWLWiwvabUu+w4+p4x6AZl
	l4x6CgPhfdM1XABt9bE6CV2SKvSrZ90IYxKh3qIwKSJfUg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtc5n41pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:09:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ddd8ef5343so11275333eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 06:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777381773; x=1777986573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YYZ/OrtIVHKEhtlNApSiArPT0Xip7lxparc3a3qNDjs=;
        b=KRNXUNS8yyO76qKl956jNZwp8rVpsnQb4SKIHPxX3uuSY5sCiHsImyug3Vq/PgF2xz
         HewUjP8q2CrrTrIAtpy6YlQ0J+i2NbOwN5NtUlPywE96n2kNaKH+6D2D33BneokgEO1e
         6lE4RcggY0IU2FdOU/75W5RBBtgYXuvQD1fM2Q29colD/S/FRjZiow1j1zou4TTzOBE8
         ICiQ+ZcvODB3p8aTzlHRXhKO+lvCUO0S2emWEkHsCEMX21QlkSS2mriX7sNNEwOHpBnk
         9KVlD6e34ZnGomSWxj22A/CAgJh2sefrSXPhZMgpRRFyUoFpPXg9nnssjuGFfL3Cseu3
         hiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777381773; x=1777986573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYZ/OrtIVHKEhtlNApSiArPT0Xip7lxparc3a3qNDjs=;
        b=ABl/c+k0l6/HIlSyQMh3aXBGHldjMP4xGcTxcFytYT8mVNZy4ffNy2JVz2fTqpPcMI
         gwvwgDzctCEOtiP2LmdycreWwbp1p7Z1LzvCVkB0xmTrsnnPkewJvfk0eWdgXBEMAPE8
         Z50NoAjMAC7YOzbloy37PYbIq+Ye8EWnfS/Trk5Lk4OiigiI8B0m3tO2+NLuxiB2NqBn
         TBHPRVoRRM+QcReI9JhttVCTWgJdbm9K7cEWL5/EKvcniqLt+QVWLcGaOiJEagPz0sDH
         hQJYRsmmSd5TAFuGHqd+LYWJyo0rXjiOdOLi4VGLFNSyoVHrjiNUbUb+W7LIoU8PUDO1
         g70Q==
X-Forwarded-Encrypted: i=1; AFNElJ+48vdqmII4Ov/Tsr/khXf2avZU+DajRUCfDZCAM5sKr8jqMNoHH8qhV2T1Lo0gnvfeLUUpWxbUblNReZ7P@vger.kernel.org
X-Gm-Message-State: AOJu0YwOcnQ9M+tSIvnWuTWCIbaKo+yDtg7B3z/5FJQ+mw//QjDLRvI6
	PqgiOfk4M8uXDRNld4ZQ5F8Ui3CcO6MhuIMDAyhXG87IQU47yU0lNItRZ3QMFt0gc6TxWL1tW7c
	OZ97TYCZVQEmLDuIlQgG484B41zS/kOpJFxez3MBNyX2Zx8mesoFvZKm9U1Q9a7A/KArV
X-Gm-Gg: AeBDievI+mruxJKjTNgWSw1AJKEwgOmHizt+d85S3pTD6kjdYcL/rAgE1BF0tAsD+V1
	nUIXfCSmTcLMr3jH0sJu00RVaUl3NXuLK94V48jalJF5gu/78wXp2D/HjnZND86ZE8NmvkjyEdz
	o9zAGWV1LPplHqijf4q+R8XTnGmKeww233JI6NpiUcGxd4zanUSuB2BGsINnLKXJ5FeJ+asU+ij
	+xMugDvt2WQXlWorPCdYcmcOaKgb+HFftWO3d/I3cgCYN47O5ppSCQrV2P1p4HF7bW2YlfsNeUF
	b1IZJK1g/4j4xd8JntAAk3vcSmDtTkYd5H8rQB8p+6ty0QBKjep4xPnBqYigbC84+zenx5pv5uB
	vmY2sUxd61zu3YJmX28BpYcW4E9AgCxdmx6dLi7C3W9ZHcVop7d5QI5P9J0IfxAStyzqUXur0vA
	8=
X-Received: by 2002:a05:7022:1286:b0:12c:8d32:9378 with SMTP id a92af1059eb24-12ddd9ee997mr1169154c88.32.1777381772637;
        Tue, 28 Apr 2026 06:09:32 -0700 (PDT)
X-Received: by 2002:a05:7022:1286:b0:12c:8d32:9378 with SMTP id a92af1059eb24-12ddd9ee997mr1169133c88.32.1777381771926;
        Tue, 28 Apr 2026 06:09:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a103542sm2910901eec.21.2026.04.28.06.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:09:31 -0700 (PDT)
Date: Tue, 28 Apr 2026 21:09:25 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Add device tree for Nord SoC series
Message-ID: <afCxhUaxLEcbosvV@QCOM-aGQu4IUr3Y>
References: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
 <20260427023455.236410-2-shengchao.guo@oss.qualcomm.com>
 <20260428-dangerous-garnet-collie-dacccf@quoll>
 <e1a84d37-04a1-4c36-b6c3-f8830df9a744@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1a84d37-04a1-4c36-b6c3-f8830df9a744@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEyMiBTYWx0ZWRfX+WgOKcVsYkL0
 1HGzFuDDSGvF8tVCjZdPTdQ2DLdjHBtpvYNc9Nqnl01ZsvYs4idXt7OoADBDhNnu/hbMCF/8l5r
 8Tzf6on8IvwbLM2fTpYYz4/GECNL5Au4I9Sf7iNvLyapFXwNvGlxdBNg1CXY6Ie4tWjW9pXbiB5
 /sBuIu8QsUQPOytZ0js5E3w88GaInIIH2iSvtZXUrVSaPd8gdHo4nj2hbH+wyYin7wsaGNo7AeZ
 aCGrfOIPNpAL1Yst9ah5cq/jwWx0OImCN0vXWrCGm+KJcPwN8IS2zaUzTMws7OClW8/oWJqxRqT
 UG/qob7o6ydnlqbrivoHnwFgL2HLNA0IAGE6evdSshmY6eiIn/gG6eMBqT/ycei5THaNTft+yM3
 ADqagPY5uOdFKHomZj2ur427z55ZTt2txofz3y4bUf/g6XwfGLH0WYI2c2AZGIO9SZqlMqS6JGx
 U0ihQ4klkTeCZZ4q3Zw==
X-Proofpoint-GUID: uxNRWa71lFuDj52yabjA1TbWiwXH4W1s
X-Proofpoint-ORIG-GUID: uxNRWa71lFuDj52yabjA1TbWiwXH4W1s
X-Authority-Analysis: v=2.4 cv=ZMfnX37b c=1 sm=1 tr=0 ts=69f0b18d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=0Mm4--zdcf-dZL3D6kIA:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280122
X-Rspamd-Queue-Id: 9EAE34863C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,0.0.0.0:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-104999-lists,linux-arm-msm=lfdr.de];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.958];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 09:28:47AM +0200, Krzysztof Kozlowski wrote:
> On 28/04/2026 09:24, Krzysztof Kozlowski wrote:
> > On Mon, Apr 27, 2026 at 10:34:52AM +0800, Shawn Guo wrote:
...
> >> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> >> new file mode 100644
> >> index 000000000000..00d189cfed8c
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> >> @@ -0,0 +1,4511 @@
> >> +// SPDX-License-Identifier: BSD-3-Clause
> >> +/*
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> + */
> >> +
> >> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +
> >> +/ {
> >> +	interrupt-parent = <&intc>;
> >> +	#address-cells = <2>;
> >> +	#size-cells = <2>;
> >> +
> >> +	cpus {
> >> +		#address-cells = <2>;
> >> +		#size-cells = <0>;
> >> +
> >> +		cpu0: cpu@0 {
> >> +			device_type = "cpu";
> >> +			compatible = "qcom,oryon-1-5";
> > 
> > I asked you to send this binding WITH the user, because they go via
> > the same tree. I see the user, but no binding for it in the patchset.
> 
> And few others like SCM are also missing. I am talking about this many
> times already, to multiple vendors, and I am still surprised why people
> on purpose give more work to the maintainer. Well, not my tree, so not
> my work, but if you ever wonder why your patches are not applied for
> longer time, that could be one of the reasons.

Yes, I should have sent all those bindings targeting Bjorn as part of
this series to make it easier for Bjorn.  But I'm not sure cpus.yaml
change is one of them, as I'm sending it to Rob.

Shawn

