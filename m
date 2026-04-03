Return-Path: <linux-arm-msm+bounces-101714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPlWKg8E0Glm2gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 20:16:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2267E39746C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 20:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10361304F089
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 18:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6383328FC;
	Fri,  3 Apr 2026 18:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUeCRTJB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfCsXv7M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90287363096
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 18:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775240099; cv=none; b=epPRaLpBXFkW+myL2Lkd5ILn+o6NlNdUMs9jSUYKJmtc0CvchIAhtDTM/qZ9Yuti30Q+4NbkPKK1KSam205pvYNrqXxpUDFFk0uSl/V9E/MIETOiho9riGJGgRV5mf1DWMAvadJBjl1ZufPqkVqmbVQkg6s2ZbP49izPFljqzv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775240099; c=relaxed/simple;
	bh=NSDlO7P8GT2uL0RUBWckhyg8j1c54WcUGo+OSmr/9X4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFzmly58RvFOo54N99g3SLJjBb/l2wGnvNGd6YL1AyFVKIRktVkIXihHGBABJ9ApKHd+7PLfcgmE5ylAsiVqxnhu7xZfxRbwiH2AG2QDlKLglRFXq9Ikdqlvpnax7/Zi8CUdCs1UxJDa/p3g3lcY+wz4PTqliH1vrr0SIcqLtAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUeCRTJB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfCsXv7M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633GFETq3449850
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 18:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8eq4fAPdzfCHluO00XoTQB0jQyUIHHbRnBpp5SfKGF8=; b=NUeCRTJBwDqgy/ww
	RMPKFTAjW382xf2KqarMzVJkfOhcSTO/ZTAeLb5+UFvLyBvHzpZ5UnYaG7SM+kHm
	uCmbT1FBLPY+dt5/8MXEzS2E/GJl7fSHmuvMsURT9wscL1AUeR2qpinDhu7uJ7jC
	4e1Ka4gIAJrZVfW9X2G5KKZiun+qLJXa8lz6/C1hT6mv4+o0Bq2+QipIHozHM5iL
	/LOsJ+uKKNErgA9kYqoeF7j0wMVFxFxzkheiyTTbE3Kozek3sIDdPknWEdDJPWqF
	uyNMI3i+2SoOWEj9Hcpq5+UvQMCgHe0DSL6ZBXBpQvHpcN9Swd6OAq9RlzJX8T6T
	qhHAuA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da8u59v2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 18:14:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b23c909256so31245275ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 11:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775240096; x=1775844896; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8eq4fAPdzfCHluO00XoTQB0jQyUIHHbRnBpp5SfKGF8=;
        b=XfCsXv7MG8jc7IV84/ejK39WQZbNH16D9HNT4RxqF/DeJviqurB6jaKQVI+Q2yakIt
         x9yOObPLJdm8KI+69BtywbSQ33o1MHGMKqn9ZFDG1Ew5ffq3mWFNW1g71/aRnadqTEpp
         jFbWJnik0n7Ff3+HkIvH8U3gd3dGtqrrQbS/pJsf8LY7yZ6gc6Ykorqc4OBERyRWdAug
         Xdx01ycQw2A9LEPwTfIk5iICiXvxa7P+dbz3w6cSl+1babfC8vpA6xCDuhIKiKrW7s2g
         cCOnAAocXtKO4Fy1ktnrlhhIsTXJrywwCEu+QD8iPS+Io7UzXQCZu2Eh8I6C+UNzkPDy
         ZMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775240096; x=1775844896;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8eq4fAPdzfCHluO00XoTQB0jQyUIHHbRnBpp5SfKGF8=;
        b=c2erqEt3lIfBa2Lcfuf2bn69U/ilUvKygDipRfAYoL0kwIMIlKD7QiOsTkeA15B4a5
         jwLgO0Sp8qk9ogAFy8mKE/7xg788ttjR34G8CnRuYj8aTaByvLWIRNeDA/qAvXCpVb4m
         XkbLiPDNojTl+MgB5S/+KJanL9mw6P8rgDeThxvAVQ1i2tPKB0bg1gwlvwdcsJCi485+
         Rl/4Dl+ryqKQrDglrJ3lqUaOyAxPR3t7ICX/PDTzsC/ofGNXXvV7PiUIrsNwTMSyUK7p
         8UVin2zE3McbO3g2I0x7IJ50Jng9LcJxWqRKTJaOUjpMmeAWC47elva3aF85UztPmFbE
         tVBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV96WQ5KMqtB53Iy4cMAr9gUvFBT0pk555zAmBh+dZvONOTdcNM8no7fb2OjRBn8vSzfPpkBtCuqXxgsKto@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7xiHNT7M34yooxhdvlmHIReFECbUYv1UfXXF3SlrsUTlKuV2w
	UnSlYe55o4IjFxEryi1bOsZ7dmw2Ek7J81qOXV+/TC1fBoooEWr3Y2VpXGCFex3IXLsvfRrGndS
	sNQFbzRfG8QNOmow7q8ZLhgIj5aUgq92cs7mNqfYBa4YGt9UY7wF3yugJglgJ4xLYHfKJ
X-Gm-Gg: AeBDieuHphqndbdsVY6i61tOXYouRWAsAoMXWvbjJS+nxerdiqQBhFnpRg5kLzuY1RX
	P7MBGDtaiT6/moVvrGX/73KiqM0hSmujcuJNSK8WsXpfQyckEUCsUIGF14jbU40u3rxy7clXcAI
	FXfZhHLcM44CrPzNwhkIxwa3PWhQui15xIMTwfHsAlcDOvp5SFVMKd+72ZsnstjOjbHW+V2nJ0v
	ZsgHICWllbc7g36OnC9+F+FDWhJiXH0/Gn3/FH8QRMdLG4Fhm66kzfNsNkK8pw6ypjFY3H6caee
	Sax4qsXEkX5DmRdQ+u9MlGFbRErqjrzR4act33jY9j5FV80TfLO0jQAs8Ycz8DhVSX0VZotYLm7
	l0PefneN7toYl1JsZWHpQJzJQFsdWfmIYqjP6oOaTCmC7Ns619wMLTuQi9Rs=
X-Received: by 2002:a17:903:360c:b0:2b0:6df2:8cd8 with SMTP id d9443c01a7336-2b2817d3f7bmr40518095ad.40.1775240096392;
        Fri, 03 Apr 2026 11:14:56 -0700 (PDT)
X-Received: by 2002:a17:903:360c:b0:2b0:6df2:8cd8 with SMTP id d9443c01a7336-2b2817d3f7bmr40517825ad.40.1775240095763;
        Fri, 03 Apr 2026 11:14:55 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d1a2sm67923515ad.7.2026.04.03.11.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 11:14:55 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:44:48 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
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
        linux-scsi@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/3] soc: qcom: ice: Set ICE clk to TURBO on probe
Message-ID: <adADmJBEzIBamX91@hu-arakshit-hyd.qualcomm.com>
References: <20260302-enable-ufs-ice-clock-scaling-v7-0-669b96ecadd8@oss.qualcomm.com>
 <20260302-enable-ufs-ice-clock-scaling-v7-3-669b96ecadd8@oss.qualcomm.com>
 <acF0ggIIJFb7mUUR@hu-arakshit-hyd.qualcomm.com>
 <90375d37-0440-48d9-a3d3-b0b442839d89@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90375d37-0440-48d9-a3d3-b0b442839d89@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE2MiBTYWx0ZWRfX0zMxkwSVBBQA
 cknSsU6kj9ElxnuMdBYKiHVFQbgXk8kxA7L4miKZn6saOt7lCk2CuG3gtuhphPzTj8//YR5IrPm
 u0OavCr9wxjLEG1PLfdOxZ4fFlqb4CIYxF6SVn5rNOTo9KBgv32KGTEUbeUdqNm+wi6CYvw16GM
 MPIJGK3h1j4z4ze1igCmMQr3CiX8F97r0sP0+bvBOTxst3bSHz7m5Ns70mE8xPujIaf1JAN9eQA
 khjHtePtsDqhqKTXmoB1WnhmoYkP0Ra8Q7v1mFxbHDUF/zYCS2FR5qxF5f8h7h7RFzhspBgW1UH
 E26fkaPkrq6JndaXVK9tw7ccgMmuP8GSOBXf/RQCt+st+jSd1PyRghJ+WfpYstp0W7wCFZtfUNx
 uHrHsotojrVBOvdRIa2z0mkhZEEQU14dpOCoZLH0x8pXCHiFzNfYqusID/eMGmGB2OmW28OSD+v
 CrHiuAnM8KJkxeECvSQ==
X-Authority-Analysis: v=2.4 cv=W5g1lBWk c=1 sm=1 tr=0 ts=69d003a1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=y-8eonv6uMWv_09NrVoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 7rn2qPoMg1KEfYyO9e-U3sghpp_QxY7Y
X-Proofpoint-GUID: 7rn2qPoMg1KEfYyO9e-U3sghpp_QxY7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030162
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101714-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,hu-arakshit-hyd.qualcomm.com:mid,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 2267E39746C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 08:14:13PM +0530, Harshal Dev wrote:
> >> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> >> index 7976a18d9a4cda1ad6b62b66ce011e244d0f6856..e8ee02a709574afa4ebb8e4395a8d899bf1d4976 100644
> >> --- a/drivers/soc/qcom/ice.c
> >> +++ b/drivers/soc/qcom/ice.c
> >> @@ -659,6 +659,13 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >>  			dev_info(dev, "ICE OPP table is not registered, please update your DT\n");
> >>  	}
> >>  
> >> +	if (engine->has_opp) {
> >> +		/* Vote for maximum clock rate for maximum performance */
> >> +		err = dev_pm_opp_set_rate(dev, INT_MAX);
> >> +		if (err)
> >> +			dev_warn(dev, "Failed boosting the ICE clk to TURBO\n");
> >> +	}
> >> +
> >>  	engine->core_clk_freq = clk_get_rate(engine->core_clk);
> >>  	if (!qcom_ice_check_supported(engine))
> >>  		return ERR_PTR(-EOPNOTSUPP);
> > 
> > Hi Konrad
> > 
> > Since you previously reviewed this change, I wanted to share an improved approach
> > that I recently realized for handling ICE clock scaling in the MMC use‑case.
> > 
> > So far, we have been voting for the maximum frequency during the ICE device probe
> > to align with MMC requirements.
> > But because the ICE probe is common across different storage clients, applying
> > the MAX vote at probe time may unintentionally impact other storage paths.
> > 
> > Now that we have a generic scaling API exposed, we can make this logic
> > MMC‑specific instead. In particular, within sdhci_msm_ice_init().
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/mmc/host/sdhci-msm.c#n1966,
> > we can invoke: qcom_ice_scale_clk(ice, INT_MAX, false);
> >
> 
> I agree, this is better instead of blindly turning the clk freq to maximum.
> 
> I was about to ask you to move this to qcom_ice_probe() as per comments in previous
> commit. However, since you have mentioned this now, I suggest adding a call in
> sdhci_msm_ice_init() to qcom_ice_clk_scale() immediately after it calls qcom_ice_create().

Sure, thanks.
Will update it in patchset v8.

Abinaba Rakshit

