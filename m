Return-Path: <linux-arm-msm+bounces-98606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPLSC6Fyu2kdkQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:50:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C84022C5B38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E043300AB10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE142D248B;
	Thu, 19 Mar 2026 03:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGa43dbp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZcAaCMc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C764D1E1C11
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773892254; cv=none; b=iFu5pVil7wHhSPHMdiuvQgkkrMnY1vvw8KoDpeB++VBPrcIgBHbt9n2ZgIxiw3Jd2tno3nxyRDOkeTt0huZt76WoL9ezk7unIFfu5ZFfaK7/IWujf1tlo+4xkhXL6VRR9wOD3rvoCuGsi6X3UBKCsrWSsLe43ms5OBRdFMLwAAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773892254; c=relaxed/simple;
	bh=DsDsfDqsKmjfAidrriqJDqb7Xtpj1BwDcEYHF925GT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pukOH9Ae49tvk90+XHs0nUymrZiqyhKa7aXO9rmSxIft1Sq53pLnnC3DVPuJqqLEtJ9a3TsT13Fzin0dIZSQuVDQDJgQe0uiwMVHNbFBx9Wl1jU6cTtw4xTEurQ53rSQhz8QaC3xJPN9sG7SxYaK06vSG/1MRC4YSe9NgzmtCjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WGa43dbp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZcAaCMc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J28aux3141140
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6uS9UfxxchGy3kpd3kAgGGIz
	GE5kZutI1DqmXHU8ATY=; b=WGa43dbpzJukQS3V/xPS1BsMZ5IsOyCdBmJykul7
	I5wvgWPwDVi1RPVZXoqnkxtn+H7MMiu25JSDuc9bcS9trOUT6MnCP5aX7HK1A7ME
	HwpJ4Dzj7w96nFC7DxDIU0hTCLwjPyYSU5UBST7FFe44F29QIXq9G0l24F8uMZkW
	RvLnsaaKeUEWw4uqIdk2eKGcqEaLZp+ggAgW1EV/zYMHfOZkYpfFL2GtVrHt6IQw
	OoNJG3yAb03USyluXfzjcEdkjP1TnuDErgdL7t8H5YpOH7MHdJXFBTo2KD4rYuXB
	sZI6OmTb8SdNeuw+4lwyk3TzZnRb46fOcFAOSVKwUTcnow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d083r88u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:50:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50939597b85so27665751cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 20:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773892252; x=1774497052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6uS9UfxxchGy3kpd3kAgGGIzGE5kZutI1DqmXHU8ATY=;
        b=JZcAaCMc2vRfsaP4CtROutZ8gXutNOBpwEqdDUVGFgzvP1V0tK3t1mGczlxcNZQGdU
         V0PbpL1KplMWaqZd/56dSPxnIWyzytkpOGndMKdlp8cA5tbbd+GVO5PsoesrB8u6NjDv
         Q5j/0qRkZBiUfvSeaJuAc1uXfSaZovUap7hSHqTa6ceMUwImPObCzfyzMnscUm1XaIiJ
         NwlbE9C7dcxxg0FXOuBCLNuW4/8b/fHGjg96CXsB3l/x2BFJ7AWrUN9yNfbtzhPby4qK
         yAYuzFg0FPjSbpw5bGf3uM+abEKwqFubt8rNbkYM7rZBXCLPYyk0HJBYZgMJQKFDpf7x
         VsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773892252; x=1774497052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uS9UfxxchGy3kpd3kAgGGIzGE5kZutI1DqmXHU8ATY=;
        b=cn4clmtjiEAKcE56HKez/KkLNPwt3noaeq8SHXEEtl7SX8uonyMH0W8GMHyPME2kta
         F669qbAdDJt364yVcvaGe6AcoDSLyEcwN0vfsWL5Ez/cO3akGVRs2q+tqHINNHv2KAuu
         4Uips8snhYofdPTspvQHBeOmaniKLFDAENLSZNwsPbMzjkX4LciSSBgJFK9V7iywH5CM
         wmucZZQ/qjHF0Q7BqOIKbm1BD8dtsNTtMsJJ2lhyzSnSbokBOMv5BQybvxjFXU4azgBm
         DVGvdmlgw6yEm5wN/0aG0QlNzI6k0ktrT6VF/BS3f0//GY0G0JxTqTxk2XZLsK+QaydA
         Urlg==
X-Forwarded-Encrypted: i=1; AJvYcCVraQ5z7BMFL2W+IHpcQXvvjvROeoAH1x4OFwh3empQwxY9kmKJ2rZDqcJ4y8XmSPYR4MaTFA4QmOkJt2h+@vger.kernel.org
X-Gm-Message-State: AOJu0YyrarW+2oI6OPIANngZBlyzgwGJ4O3QPNCCQZTIdNesVVomiep8
	+Qezy3Y8h19P7g2DwrSsZDFsJTWv7xgYQ2MCiMtApFELNV3OuSip/FO8P0IfgL3bllHcUG2i7Lz
	06pwzb7NwVAsB/zT/wdBu3Fco3XM8/e2ntfcts/aFuauoXq2fHpQpK4g/YK7nBk/FJb8O
X-Gm-Gg: ATEYQzyhSA7lR/SP8OVZao7GG/gojr8WnjQT4HQil3jHFXg8OGTDoLSx92HIAOEoU1u
	Xh3MDewWYe0v/A62tPlCMBtqjg5lUVWOknor6AZC/sxosV/jccr41wmKMDIE8sxfCMjxQcP4VZX
	y1kcloAoOjWsFoxHAWB5sEyC6Hp0+xPoVERNdva8iS5um0zqToBBU5FY6iZeJWurSVJWk1U/5Ia
	/+Uqvg2dV0M1k0dkTZ/71NO0BIL+lZ6QsT1XsNkTMGDeqO1JNF8eZSRoKHM9/mOq6J629uIbcwm
	mcmPH1GWeUv7XoAP+f3O0lkVzqHRb8MyTUfmgKNHEO9Pp/Zf99zBc/kQ1tAauq6UxktcV+e/VRE
	ooHh/OkvLIapBVrM+bKJswOQ07PUAXz2YZJ+iuOtCxpWpAnUX1ObVSeZRshIIOM25TGZpoQWm/m
	xA9gCbKvl5eRshm7WoU4SY05u4DCIMs0PqtXY=
X-Received: by 2002:a05:622a:1894:b0:509:4d26:25df with SMTP id d75a77b69052e-50b149b3732mr73535471cf.66.1773892251947;
        Wed, 18 Mar 2026 20:50:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1894:b0:509:4d26:25df with SMTP id d75a77b69052e-50b149b3732mr73535311cf.66.1773892251430;
        Wed, 18 Mar 2026 20:50:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf051c14esm449921fa.32.2026.03.18.20.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 20:50:49 -0700 (PDT)
Date: Thu, 19 Mar 2026 05:50:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: ubwc: disable bank swizzling for Glymur
 platform
Message-ID: <2qqalrvdpznxdf7ajs6pzpp2lugzue6yshmkpedajflt42rnad@imk7hcehw7g4>
References: <20260228-fix-glymur-ubwc-v2-1-70819bd6a6b4@oss.qualcomm.com>
 <guisclar3eonn22vpjbdnzwbztwkrbbmvous7q757lihne4zbb@jtnnmune4uit>
 <abdfDoH6rfNYKmHa@baldur>
 <y3xbffh2ogdf66tvtxu5ig6ucqgpfo7vozcr7e7hftqvbxfza5@6p3ridipdmkh>
 <abtoWwqKLNgXD6Og@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abtoWwqKLNgXD6Og@baldur>
X-Proofpoint-GUID: MSD-WcH-gYXbhW1761uDQF5uqQMTZtSr
X-Proofpoint-ORIG-GUID: MSD-WcH-gYXbhW1761uDQF5uqQMTZtSr
X-Authority-Analysis: v=2.4 cv=ApTjHe9P c=1 sm=1 tr=0 ts=69bb729d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=hhkVIXG-aYixBZziti0A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAyNyBTYWx0ZWRfXz60uObXDMJwK
 Hz47dxJE42zlxB0YOAftVDDEJBJyA+Y+7f7fsUBPtaGzP6kRPozwqOP0gS3CV8RYRsk4CM31bSq
 r82XVeJGicbg5uXwBO33ttwByYUsAvyBRLG8LTAvjW7NWD2GIk76F+GV5tw5Ud2/EN8xVqZt0gK
 PyKNgCglKXZA8NbBTlbxOkGBfoI5cwWvJ113hM3LudeVUUmpFR7T3zDjk1WDAMIMCdjC4i7IYDI
 qkcj55P5hpTBIj7g4Kwg7xfYEZ3d4eE245evmjrrLgmFybFzwAD84pGPKnE4JiAwX8jWUk+hVbc
 tzpdLp8F1tlP7cwHVEA91MygG8aXP0Cq7hdJZnZ02J6gAS+i3/B/GA0H6Sys9TUMw2YnmC5VKO4
 DJsu732nJmyBLw71dd3DHIk8CGzv0sGWG62xpVucvpBz/8gzSy2tkHUVYfk3awnzpCVi2B6lmL8
 +c0ANAMjpElB1Nm6T3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190027
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98606-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C84022C5B38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 10:23:15PM -0500, Bjorn Andersson wrote:
> On Mon, Mar 16, 2026 at 04:51:46AM +0200, Dmitry Baryshkov wrote:
> > On Sun, Mar 15, 2026 at 08:41:02PM -0500, Bjorn Andersson wrote:
> > > On Fri, Mar 06, 2026 at 05:15:32PM +0200, Dmitry Baryshkov wrote:
> > > > On Sat, Feb 28, 2026 at 08:34:27PM +0200, Dmitry Baryshkov wrote:
> > > > > Due to the way the DDR controller is organized on Glymur, hardware
> > > > > engineers strongly recommended disabling UBWC bank swizzling on Glymur.
> > > > > Follow that recommendation.
> > > > > 
> > > > > Fixes: 9b21c3bd2480 ("soc: qcom: ubwc: Add configuration Glymur platform")
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > ---
> > > > > Changes in v2:
> > > > > - Fix the syntax error...
> > > > > - Link to v1: https://lore.kernel.org/r/20260228-fix-glymur-ubwc-v1-1-d80e3fe0dcc7@oss.qualcomm.com
> > > > > ---
> > > > >  drivers/soc/qcom/ubwc_config.c | 3 +--
> > > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> > > > > index 1c25aaf55e52..8304463f238a 100644
> > > > > --- a/drivers/soc/qcom/ubwc_config.c
> > > > > +++ b/drivers/soc/qcom/ubwc_config.c
> > > > > @@ -231,8 +231,7 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
> > > > >  static const struct qcom_ubwc_cfg_data glymur_data = {
> > > > >  	.ubwc_enc_version = UBWC_5_0,
> > > > >  	.ubwc_dec_version = UBWC_5_0,
> > > > > -	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> > > > > -			UBWC_SWIZZLE_ENABLE_LVL3,
> > > > > +	.ubwc_swizzle = 0,
> > > > >  	.ubwc_bank_spread = true,
> > > > >  	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
> > > > >  	.highest_bank_bit = 16,
> > > > 
> > > > Carrying over from v1 discussion.
> > > > 
> > > > Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > > > 
> > > > It depends on the fix which is currently a part of msm-fixes for the
> > > > device to function correctly. Raised the question on IRC regarding the
> > > > immutable tag or any other proper way to merge it.
> > > > 
> > > 
> > > Sorry, I did see your question on IRC, but didn't follow up and forgot
> > > to ask about it.
> > > 
> > > What do you mean with "depends on"? Why do we need an immutable tag?
> > 
> > Disabling LVL2 / LVL3 swizzling on the GPU side requires the patch from
> > msm-fixes. Otherwise the GPU driver ignores passed swizzle, making the
> > hardware use incorrect memory layout in case of Glymur (A8xx).
> > 
> 
> So this patch must appear after the change in msm-fixes?
> 
> If you have already gotten the msm-fixes merged upstream, in which case
> ordering is already achieved, without the immutable branch... 

Yes, it is merged. However I'm not sure, which branch you are basing
upon.

> If you haven't, the immutable branch is not going to help, as it doesn't
> guarantee that the immutable changes arrives in torvalds/master only
> after the msm-fixes.
> 
> That said, this seems somewhat theoretical, as there's no GPU enabled in
> the upstream DTSI afaict.

Ack.

-- 
With best wishes
Dmitry

