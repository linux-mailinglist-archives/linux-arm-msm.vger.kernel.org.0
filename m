Return-Path: <linux-arm-msm+bounces-110128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOXAMIZJGGpSiggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:56:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2221F5F32DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:56:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C7E932C3669
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 13:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1878282F30;
	Thu, 28 May 2026 13:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQxNZqnK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F5T9FZ5n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D314239567
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976113; cv=none; b=ViLnDEM2C5UoBoYCsIM+sU5qpLPSRHXPxP4oJxeszwoUGrXKkx6FLNI7RnEjweRi6U8lIdF7aUZj8nC1gVmRFuNeNQktE2b8JYd4+HKdqSzKzDx3xuj2ddYNJgKdNqXQEQdo1PNj71z8tp3Qrxy9UEWhLdA859ZTamctVNsfVaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976113; c=relaxed/simple;
	bh=1mrQeSDY7M52xMizn3zLiOiZIdVP73XWHHsBy6AGIWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfzOKTSiyKdSGKbg0rdu/wIbxdqou6qsqDT8niN6HHkfbItm2OzDqHvQCCErWaI6BASarHDflUYsB7eCLB77tmFRd6Zr1mblI6imhWsDyqCKAqzT+GGwrCtpl1V9fKDl5Gyg/gy7Ms3LoHc8oHhSlm6R/A6UWRir4w9Y8bOzUtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQxNZqnK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F5T9FZ5n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vU4q3203258
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C6JbapJaoSx0s4QBRzJFchDoSiCIzMDHmw52CsCUV+A=; b=gQxNZqnK7BaTQudT
	WSTiuRAz1aS08ICsz/5kcvm6HVWBoh8lHaf9WKokpxhZGVOjQxi4FCQWdgLCOt7g
	1XlntH49YpsN4kgd9fZzknsBYBgK/8cqzHEoPqlGhfdiEEfgCmUHmWJ/Q98m++l0
	XVPAIQn+Uhgdvj3scTevfwr0qgcw0PP3wvN2LILAqH2JuXQ/iW7/CyRevy3xpSa4
	5LEXEn+UWQYs6QyzHDGZXMmiTllE3Z4HrNoA76rsjOjO/HnSwa87O/vldWdzDgKO
	hKNVkE7/rRJ15SjCP8HkuFXvlOITxgqfdv0f9psx1ulFNHOOKFx6WPLqk7yJuzHk
	OQqAbQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynjy5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:48:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514b673c8f1so23099131cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 06:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779976108; x=1780580908; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C6JbapJaoSx0s4QBRzJFchDoSiCIzMDHmw52CsCUV+A=;
        b=F5T9FZ5nr9aZLAAa5DWoyrrCoME3Nii0Mj5CiCAw5fcIRN6e/plS1YR59IpEhYQjFa
         AuiN42MvgF98+fJujBYIBjjgd7nnyASqYYlshrCYp7txcUsEyIto745b9SGz5tUNt4FK
         WN11Zzy2pKEVymjGHigyUSrNpHo9cNLMyZ6VeOgJF1oX9kG62KD8PN1h3KfLVTeC0tHC
         E69wzEJ/hmOwtplhv4yZuj9xIXJxKskF+QAW/2CjZ3CDiy0hrVfSd6S7RJLF2Un2wMsV
         DeRu/ZoBQJhQtOztZhhDDB0H9DkO/F/L9IdebdDooIxjJXFYHsXia06Sz5TTDZ6sqIS8
         pQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976108; x=1780580908;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C6JbapJaoSx0s4QBRzJFchDoSiCIzMDHmw52CsCUV+A=;
        b=mkfPEZZ8l3DLE20ecUVVDkVyd0pLuFO4M7lma11R9VvRAM/ffyKNmnSFX55oY6Q/mo
         CxrIv0pNVl/mt31ScNVv9lkgFaOSeClQqbdtcDv35JXulnbxEG6vmevF2PU2aUegJwbY
         yp19G1VQI9vvwf8SLWCoD1oYx2ESuL85eJwWvxLvaIfszWFbOppoN6CatNRiPU5E6up+
         ukvRlRtjVgOawXUnFoB7DwosjJtALSvVQ5D5luJrmrvTKT7BZQ7r7tnFGsYaWv/2sOw1
         LKtH36gGXchVa86hvxtxaYAnNTTgO0l5rF2RVzvm9KOV3jxlDruHdRy6YDwWob7qeLRG
         MozQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gLuY1GsFsC3xYIL3LD7eQcsod4jM5/U1xIDFCWp6tc+pX6SqtPSntLAG0vWSBDNciHkP7WF82Qs77hGtt@vger.kernel.org
X-Gm-Message-State: AOJu0YylueZIEGP0NQqreAdZ5AVONuOAcWg48LyGc8GmKKxzrLCGjb5J
	poc3f5bZoXslisWAt4+LrYxycuL+WzUzJSjO3c24wKFmGT8Y+XIxWHCM0lb6Rny/HYHUu+Dc7Fq
	y4G9pikb0r6RSIZvbJjHDOdZlpUnQsb/jF38poZLgiv0ULMMaBZlcVIbhdOs2MZ3vy1k8ehbp05
	dZ
X-Gm-Gg: Acq92OE7gHbmSFE7vl2TFrMpVTi943xAmi+8/hNW5kzqLFMhkHvRodoIfBxNFgbY24n
	ZLCFI14B5yxYWmc0h0dDG18apSTHKXzSDl1Tz94ZDggJg9NnKo85XQjlSSzL+BzSNEUTuEIpzsR
	lF5u8z7Ftv22lkQjZyxRKloNG+nZe1Hz/nWbLwnkO2uxfR1fXsip2YpXBeY8ncetjRgtkFPiiI7
	uQEF2jrEbbOZWlhlSASBImc5mqD2n7ro0sXPYTv2cTR0CIp+VBNOOcj1zS4GLHte54cWwGPuE6B
	46IOx2DhRDQh+sz2KwDHG37SOfA+VmtfJ2uEnoz7bbqN/2oBdvCbK+0Z+cNAMj+tMXBUSm0OihQ
	J84v4bZWq+fyWKGFWrfosXoSzzqT0J2VTWfqZTTeZmmet32nQx2gF5Yp1eVD2djvtuxhJxGY8pe
	wUOGlGEJ1r4uOVmVdBWxu6lwZ6LtiuSqhkM2k16hSQzD5rGA==
X-Received: by 2002:a05:622a:134f:b0:50f:ad91:8912 with SMTP id d75a77b69052e-516d445981cmr388784261cf.13.1779976107830;
        Thu, 28 May 2026 06:48:27 -0700 (PDT)
X-Received: by 2002:a05:622a:134f:b0:50f:ad91:8912 with SMTP id d75a77b69052e-516d445981cmr388783831cf.13.1779976107344;
        Thu, 28 May 2026 06:48:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa463220b5sm1920287e87.52.2026.05.28.06.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:48:26 -0700 (PDT)
Date: Thu, 28 May 2026 16:48:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 5/9] phy: qcom: qmp-pcie: Refactor pipe clk
 register and parse_dt helpers
Message-ID: <ol436i3oqgdns74dliw72qns22gqfgygm6qkz7mo4g7oiywlsg@johrhdyv4rqx>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-5-269cd73cc5d1@oss.qualcomm.com>
 <ipzncrxi3x45fc6tz5xb7frxt62zmg4gwr25xmvzghlbt5miio@7eavln3cydfa>
 <fkcidw46hdsrrufxhhkk66mmitxnswmghpypyvtmax3x6vmnlp@2er6xgymxdf2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fkcidw46hdsrrufxhhkk66mmitxnswmghpypyvtmax3x6vmnlp@2er6xgymxdf2>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzOCBTYWx0ZWRfX4csYXbvlAxFa
 ZEGNOcJG8/YwmdabzBRFSqPiPF153YyT/nstdayihmymSGTnRH4hPSs+Vw9kOeQDUT+FjcIb8Uw
 Z1RBz+hx9dNzabBqEF8M2+UeBlSAFa5PEzIAGKQYxLN/ZxOR97rQFuQKnklt4+kKVtIUdjgsu/h
 nqUgI3urJZm1tDFgGvbeuH9ln/yPYlYcMmO0PxBbyE4jTA2lFW3F8v8yckovNrfZb6W+slPhUSz
 1cnYEtoADlqPPAQ9VW1H6PhU5joWuQgk3XT+nRf8K6ArKp3btlDvXJxTPcN89IMAhy7jc4FCr6O
 +8EYBA/ouC6cIVhbOT5BM7Id0zXsjExE0yCYe969dJn2qQhIyU1ROGoLwOfpHX9/brAunsXiMKK
 il3QdjikVhH+rBf4Z/s/JpJjIktqns1rW8E074YJiMxGAdR+Xb8KEtSHl1WqcFbHFZmOeF8t1Re
 O35JBinu+dOm+12VRiQ==
X-Proofpoint-ORIG-GUID: BTtUypKZL2eczFq077UhCIZhONbJhcb6
X-Proofpoint-GUID: BTtUypKZL2eczFq077UhCIZhONbJhcb6
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a1847ac cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=HkNMFyVr_tcJnp_woqUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280138
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110128-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,infradead.org:url,infradead.org:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2221F5F32DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 04:27:35PM +0530, Manivannan Sadhasivam wrote:
> On Wed, May 20, 2026 at 07:25:01PM +0300, Dmitry Baryshkov wrote:
> > On Mon, May 18, 2026 at 10:47:16PM -0700, Qiang Yu wrote:
> > > Some QMP PCIe PHY hardware blocks can be split into multiple sub-PHYs
> > > under a single DT node, each requiring its own pipe clock registration and
> > > DT resource mapping. The current helpers are tightly coupled to a single
> > > qmp_pcie instance, which prevents reuse across sub-PHY instances.
> > > 
> > > Refactor __phy_pipe_clk_register() as a generic helper and reduce
> > > phy_pipe_clk_register() to a thin wrapper around it. Similarly, extract
> > > qmp_pcie_parse_dt_common() from qmp_pcie_parse_dt() to hold the register-
> > > mapping and pipe-clock setup that will be shared between sub-PHY instances,
> > > with pipe clock names parameterised per instance.
> > > 
> > > This is a preparatory step before adding multi-PHY support. No functional
> > > change for existing platforms.
> > > 
> > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > ---
> > >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 76 ++++++++++++++++++--------------
> > >  1 file changed, 44 insertions(+), 32 deletions(-)
> > 
> > I'd suggest splitting the Glymur PHY to a separate driver. Otherwise we
> > end up having too many single-platform, single-device specifics which
> > don't apply to other platforms.
> > 
> 
> I don't think that's really needed. This shared PHY concept is going to be
> applicable to upcoming SoCs as well. And moreover, the split won't be clean
> either. We still need to reuse a lot of common logic in the 'phy-qcom-qmp-pcie'
> driver and may only end up keeping very minimal code in
> 'phy-qcom-qmp-pcie-glymur'.

Then splitting makes even more sense. Let's not clutter the existing
driver with too many conditions and options.

> 
> If you are concerned about the file size of 'phy-qcom-qmp-pcie', then we should
> move the SoC specific 'cfg' structs into a separate file as that's what
> occupying majority of the space.

No, it's really the 'shared' part.

> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

