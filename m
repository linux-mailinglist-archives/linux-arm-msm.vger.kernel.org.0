Return-Path: <linux-arm-msm+bounces-93904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GL/0Bj1InWk7OQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:42:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E841827CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD4B9303EC14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 06:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D29303C87;
	Tue, 24 Feb 2026 06:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxXtQ0rR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F9arnuAZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB78288522
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771915317; cv=none; b=eRNrsTDG+qR50TZGDcrkevkO76UQJbn1qvMF77PJlZ+ilQAIYY+Iw7iat3PgW+caEOSRKk3L3/CueFGv4dBGICLo0TZ1muF/LMiDqkLgNdQ9UldniRf7XbE6r4/s+/lx4+EQNS6JtgKLaCZWDX8Kt2x1VcASuvKc5UOvs8kbbqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771915317; c=relaxed/simple;
	bh=tODBFoOzQoK1KUOioaeK1k4O5kVSmJM4fCLAR3eZxnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pevlgDaasL7rN/SqfmI8cs273ngzBULUpNZY7KgozHuwNyK2qvs3OLrNLxhSQJ7APqobxEozWcHXrdTfv4XTBIAzE4jfiw4wD6sefFlK0Uaib2mIX0ySvPycP0kpwGlAieacF1SiNwWBjX5j6Iqllm9334DGwVWslI7XAV7/Ya0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxXtQ0rR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F9arnuAZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LQb91807317
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lG/xeXk2I/MOcbaT0nf4rKBx
	XhOqmOGfGClBVPWMObA=; b=LxXtQ0rRpY2L2rxvR5nZeQmXd4kcCzKXgsZfTStB
	EFWeY7EGARo3NtmSwZRxHG3PRjcSSjrzc12yD9JCbGAmd3yHNHdMJD2k951++t9E
	la5+Mcsy71DWaCJj7VbjhYc3TjRjKRjLATk6a61i8z2+mzntnMwro2AjKthTE/kS
	K/s/gh4oO7oL3hVzdb4EnJ4zNVOmmEKUaW2q3D0C3Ewo07MJBVQjSGBjQ2cCgmcs
	+I0KJAJvWwdP+L5yxmEe92xbQyO4hUG5Cu//twy3LvH8Mcia+fuqoEBgxEaVNMNG
	yNxhIdleJY273zKHbaUbtqZVgFI08vqDtTBSMlpFpi7gWQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e38dew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:41:55 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-679c6ef1538so38509160eaf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771915313; x=1772520113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lG/xeXk2I/MOcbaT0nf4rKBxXhOqmOGfGClBVPWMObA=;
        b=F9arnuAZUkl9yRdSiHgUvOdq7t/n3wOWRTwefmJ+oGITIj01CrHd1uz811p/OfMK3Y
         29dUkT/ucJVBNBk4lzKaJww1G9GcE2GXWlEauH7eFWHJYDuIHBQBg19kGggqhF9uX+Z3
         6K7K+HDZ4yA3oILJ780pTCgbCmykOmonrAZ5Guq93rD7okLvag5lknxPokcfRQarjeiI
         xR/MMX3nrCW3WDJQ+P+Nt9NzAczka57zwFyHNiFejzJ8C7UWxZYbgpj3uvBGGSSJMOJz
         LGmtc72OrD/sezQntwE5SOtihlhdDg3qHLK0n7eUl4TR3ay+kt8WD5IdrwQmjHKHdlt1
         iUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771915313; x=1772520113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lG/xeXk2I/MOcbaT0nf4rKBxXhOqmOGfGClBVPWMObA=;
        b=ZfxKUFteyNTRZdOKA9c/tgPMx9TO7d+pPz94esTOzmPxFFjJrqV2bodDmZV+zgqqgO
         CEhN+J9zCczQO6IuL7oV1UbwNogAuNdFv3pgedtdC1xXTfQoS2oQb4XH507usRf105nI
         n8623eYEK1gg4JaJ6SakAb0uEiRFRF7aCSujH7YF6gNIbkWgtvUBKzEIM9v9CNISpCEc
         fh5a+qAnkbGJbaq83YlKxTjXO95amPTb9igIQlu3f99Auortxf9qstGXy2puPaFbELga
         IVHT3XKAKmxwK5ws0prRmlLja1J6O1EQLqLkd+cf5hcZeFpllj1np3xOv3XFjkbqxeev
         NOjg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ7GPlaUHFPbcYGmLktXgLXXk9W+I22MWET6vtsN2iMnyWtWXVtJUo9zXkJXv0a6bNPMIsMDDgT9ZxSw+I@vger.kernel.org
X-Gm-Message-State: AOJu0YwwIRNrmXILp4vwMB1Jqr2dRyJNbY7Iq0oENU5Dc/QqpJ09Pjyy
	CtNBPzg1GG55DN4qStoqqDQOrGoA58qmTMXPiQUwLw/XylNckvyX7XDdKCS6Cf4RZQebaMC+YfF
	mtdF4cwshbLTyTX9DH3YxZG2t0C3Vmkud0valXXfi4Ox3oIbd68Q5beudDQu38rpszkVu
X-Gm-Gg: AZuq6aJ5NfQ/V6Bzj2bzHfCb7xKoL8AFAtECo3wlPILB1L8vVM8Ld8opWMw/KB8gbBW
	azst3GRE2XzTzIYQjKydsOzC6xgtm6t2MnOMo5kqKc6qnzB7m+80L1O0sCkO4VluNcGMb/qNM4O
	nh3O0ChU0zqAUk9EEmx9AgKZEd7ObbCykutMRXXUshOuORlChvMegzUtRYMloeLIbEcYX7Kk33P
	WrjIvWtFy4ZADVVJUa39cf4e8iKP29VCBQW8l/UN/93IvJQz1uDexC5HdICA9bG3PHWnrX9IYfu
	EKIjdtO3Bt4ACcA3bA2YXVrgKN2Ltyu8xQW8CGKIRIBBLhhraTU8KozLOFWiLCVlrkc3qu7NjZ2
	x0YGCgRlz/CGPcif1hu4HJyicmFTadoUwikTcLDH43+sFTrfydiJagtRNYb0T6vu3wWbw
X-Received: by 2002:a05:6820:160a:b0:662:b70c:a414 with SMTP id 006d021491bc7-679c425bc9dmr6064080eaf.14.1771915313569;
        Mon, 23 Feb 2026 22:41:53 -0800 (PST)
X-Received: by 2002:a05:6820:160a:b0:662:b70c:a414 with SMTP id 006d021491bc7-679c425bc9dmr6064067eaf.14.1771915313161;
        Mon, 23 Feb 2026 22:41:53 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679c5630827sm7711238eaf.3.2026.02.23.22.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 22:41:52 -0800 (PST)
Date: Mon, 23 Feb 2026 22:41:50 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 vdda-refgen supply for Glymur
Message-ID: <aZ1ILpdtBCMDxl2R@hu-qianyu-lv.qualcomm.com>
References: <20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com>
 <20260208-refgen-v1-1-87ca84fd78b3@oss.qualcomm.com>
 <20260209-magic-conscious-seahorse-b81c8b@quoll>
 <aY1Jx5J8x/OALk5M@hu-qianyu-lv.qualcomm.com>
 <hcslao22elcihjw56ltu4yo54lotheqpikzsrq6tia33di4fs4@2ygrbwhcfx2a>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hcslao22elcihjw56ltu4yo54lotheqpikzsrq6tia33di4fs4@2ygrbwhcfx2a>
X-Authority-Analysis: v=2.4 cv=UtFu9uwB c=1 sm=1 tr=0 ts=699d4833 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Mqtz4aph0Rek3LVAYukA:9 a=CjuIK1q_8ugA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-GUID: ZUSVDGJv28mwRBNOKdf4W0O_EokU7hc2
X-Proofpoint-ORIG-GUID: ZUSVDGJv28mwRBNOKdf4W0O_EokU7hc2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA1NiBTYWx0ZWRfXz+QyAc5qULzw
 Vdv2QwBccplSsjpwKWTspuvEetopyZh6EE7sgP09eEyo4PGU6VPUiIYcvH8V6s/15DqaL2dU6m8
 zpWFp4uxYdzsWbSeqmvOkdGGXef+ZZLJp8Hwta9UvyO8umAyRb9FNxMvRMIrLQzlMIXY9OqZyq0
 CVA4HF+DQuUrZGgxdNwJJyOaYkm93B/LPnBAwS7JI4BKDCikomXCyfby/xL0ZpzK1nP1M0fRM4O
 yuIKl4xBSuvDYSgL/A9C4gKMtdt4kheS8luU3HxpeJi0Vn/adbHC1N+HaRO4RJlBpxebA1uOSKz
 XeMg9v5/RcQXWiVsPWJX/i9xYvt7Ryzh8iCutSKlDw1THaipUuaaIkyVKhdbOS3xulTLxvp63sh
 iNtmdW5xNMgEkhgR+jXsXI8xJ9d7gkJWK8WsoKEJHOdNCvmEFcUE8weETfo9V88ig2Ykei7GU4v
 TIF57nXNsZWr3uuCVAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240056
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
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93904-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B7E841827CC
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 07:47:36PM +0200, Dmitry Baryshkov wrote:
> On Wed, Feb 11, 2026 at 07:32:23PM -0800, Qiang Yu wrote:
> > On Mon, Feb 09, 2026 at 09:06:23AM +0100, Krzysztof Kozlowski wrote:
> > > On Sun, Feb 08, 2026 at 08:49:39PM -0800, Qiang Yu wrote:
> > > > The PCIe QMP PHYs on Glymur require stable reference voltage provided by
> > > > refgen. The refgen itself requires two separate power supplies:
> > > > vdda-refgen0p9 and vdda-refgen1p2.
> > > > 
> > > > Since there is no dedicated driver for REFGEN, add vdda-refgen0p9-supply
> > > 
> > > How does the driver matter for the bindings? If I add dedicated driver
> > > for refgen, then I change the bindings?
> > 
> > Yeah, I know that dt-bindings should describe hardware, not software. But
> > what I meant to say is that the refgen is different from qref which is
> > controlled via TCSR registers and its LDOs are requested to vote in
> > tcsrcc driver. The refgen doesn't required register setting and it doesn't
> > have dedicated driver, so we vote its LDOs in phy driver. I will avoid
> > this statement in next version.
> 
> I must admit, I could not find references to the refgen in any of Glymur
> PCIe-related HPGs.

We can find it on ipcatalog. On Glymur, there are 6 refgen instances:
u_cm_phy_refgen_0_west supplies to pcie3/4/6.
u_cm_phy_refgen_3_east supplies to pcie5.
This two refgen also supply to other modules like usb and qref which
is required by PCIe phy for stable reference clk.

In previous targets, refgen was often ignored because it shares LDOs with
phy or qref. We typically only vote for vdda-phy, vdda-pll, and vdda-qref
supplies. However, on Glymur, there are more instances and less LDO
sharing between phy/qref/refgen.

> 
> > 
> > > 
> > > There is qcom,sc8280xp-refgen-regulator so why there cannot be
> > > qcom,x1e-refgen-regulator?
> > 
> > I think we can and it seems better because the refgen for pcie phy also
> > supplies reference voltage to other modules like usb. But I checked the
> > qcom-refgen-regulator.c, it contains some register settings and there is
> > no LDOs voting. I'm not sure what does those register do, maybe Konrad
> > can provide some backgroud.
> 
> Those regs provide voting for refgen, because on those platforms DSI
> block doesn't have a hardware vote for refgen.
> 

Okay, for PCIe PHY, we don't need register settings for refgen.

- Qiang Yu
> > But on Glymur, we only need to vote LDOs. So
> > what if we use a fixed regulator in the device tree to represent refgen?
> > We could set refgen0p9 and refgen1p2 as its input supplies, then the PCIe
> > PHY would just need one refgen supply reference.
> > 
> > - Qiang Yu
> > > 
> > > 
> > > > and vdda-refgen1p2-supply properties to the PCIe PHY dt-bindings. Use
> > > > conditional schema to restrict these properties to only Glymur PCIe QMP
> > > > PHYs.
> > > 
> > > Best regards,
> > > Krzysztof
> > > 
> 
> -- 
> With best wishes
> Dmitry

