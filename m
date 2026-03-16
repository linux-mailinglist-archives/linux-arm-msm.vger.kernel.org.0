Return-Path: <linux-arm-msm+bounces-97822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0APnJk1wt2nnRAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:51:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1746529440A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A05E30143C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C245431E106;
	Mon, 16 Mar 2026 02:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FiH7Sw4k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FsyG61VA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D550C31D372
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773629514; cv=none; b=ACwNJ+t3/yG3BjZBESxSobuAm+wo4A0f9es2bLc4PmepE2iSkVqsrdnaKwoPDIjHlYZTLuHMXPXCkJsDpDGqlIgSgtHDDF3iFvOAkZi+u6M3hfxIH+G1zr5AcuD79eWQ7hFHbnUdgE6ILMha96Fiu7qoM4Zd8tN0VH8FhUa/pEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773629514; c=relaxed/simple;
	bh=m53D4ySnTz5FYbJMeSsr7PAvRULKWuanAzTAcMWZXAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7shADLGtuwOMmBoJOVfuIDlyCLBOhiVODa1eFVfG+OPlWu3kauwmATRGE0Y/lL+2YlPmE653wPNWCO08ZHwP/YHbjyolpZEsNTWCRaxmzKUbGoCNy+KWEM01slW7XXgfKea+BMfHPjU7/P2RMQSCX7NuHvl7x2KISowVJxUZDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FiH7Sw4k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FsyG61VA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FLYDOd3865785
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GhM0PJQ3552bhar57wRCNTWM
	/pAkVA4U6M7Z/EY7Dh0=; b=FiH7Sw4k3EL/k3PagPwnobrOxb2LcZnejYYd0vmW
	H6zW31mqzOvgWBP1cCxsR6KaXsTOFLC2w3oY4cnkJjl7OOK6Yi01UTZHIjpnSvrz
	M9BvpQl8CuBuzCCe1I+0ccShhCe+CxUF596F3RGQa+ljHZzcjh709lrL7BClTf2q
	M16s4xkPyCcRMdWVfvp01YVjvwzR/xyiHh0Cpapi/V4jl8qU1FXCVBR+KJZP97js
	K9pySHY9cHaxF5vTf29CypoK5DNXJueFy893KIoE4P/ijml8v+qSEHEUMZDe8xBj
	jh5kJPauSNTUZmpEEk1wjunHMlPfECtreYUqLprv29h6Qw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00bbyjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:51:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7ea0bb20so2492325585a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 19:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773629511; x=1774234311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GhM0PJQ3552bhar57wRCNTWM/pAkVA4U6M7Z/EY7Dh0=;
        b=FsyG61VAJ9lUkEdV1wFMavfeEOKq0/qcOUarY5tL8EXOXYNFkJnIBZEyHPABW0WSxL
         Kp4V/3q03ArAPeqYA5k2tElYjHLzu5wTDHKYCyLL+jdlHn9Ak+yBFOwVtWOGSkrEi8Z/
         gCIwQ/1vW+W1ReL3HU4KXZx+9SdR1JlIAAsufIkYq/QM2d/qxnmKdYOwSCY13hz0rOCL
         h9hgVnWYcFMUnwwFdW44NM5bmpLhtyKb0jYM80i5QHNDmFYLWxxxDODNNFxbaZuBuwso
         WH5E/bdQeEKSn65hnqMFWcyMD7+KzpG6bspvV32fSrfQBP4wPZ7YwExBsCKX9P/EZ2Xx
         6TQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773629511; x=1774234311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhM0PJQ3552bhar57wRCNTWM/pAkVA4U6M7Z/EY7Dh0=;
        b=qnGI9pcDDKwtjGJiYjH/9xErXxc6hdweUERGDpOTV30+6AOuo3U7KBK1q6N8A2hdlT
         uBW2PXBds0qvtmizijNg7wONK78i4lloAgcD0gl/ESGEeKu6/hwVYOWHyfUxD33oC3Ov
         6dz1BjTAP9y0FOkILKugg0T0MT6djwDqqxlRIrsb/V031E3QK8KDGYidxL7GukXFqAyx
         JboCwP9yXwxUDc2QVaXgMg8CiytPGj+xkpN1gdOjNpeARQFpkM+4tX+I0ItXqen7mi3X
         N5LX932AhBRjR3gsgH6s+Ym8DrQdPWbxJG0tSbEsXC/+nj3fQutrLkkwLxUqj+cFnySH
         QJrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXUSFAbV8wHGbFlGgk7clemsFCiwsE7ucwyk89bc5NAnOQQXOZZf8LYkwHk2BL0drR5ukzeclGRv+0QNwb@vger.kernel.org
X-Gm-Message-State: AOJu0YyLd1SyV5w5pepLzCGXe4EMDeK7ldgVlK0jr7RE/SB/18NwHt3a
	ViLVcklsU1KYsipiSHJ73UTadG/IX7nPh6J1brhdu2wT8PRSTKdWIaTs5iE0OzmS4r2e0UCQjub
	qlUSvH7vAE0rQMfpyrLza5MZ2b6ZnUaNCBfRHWTJTBViXOb/F/UCHUYUUZQtBNcuFRopA6OVuhp
	Tp
X-Gm-Gg: ATEYQzwPX/eLmJeu/mTDrWdeCjqVvF/bGVwNb2QpzFTtwyBGF31EZt3KUacxtbgfaUk
	NfziQ3ZUyUKsWCfl9o4dUFhwV141Pq5edbvOJbohgLK6ip+wNkWbd8cnAi9EQD6rEV9LPeAXd5K
	dlYOCvvqmQiBDnzoRDyGzN5950IC2K/jtp5G+LYyqeul4/DBVlWD2oqIGNC3GO+XhiMAUWlsc2R
	+UksfvXTk5JyLrNfq25nuYrUwhtPHqlZ+hdspUXNqj6xbEeD3r1ohHUrpUPHOTV6J4iUkOrYU+8
	0630dziGFIht0C1cYTVZZ3C3iaoTrGaYhRuJ6bVDG4it3QpgUqIbDCi92+qkmzbj5yHWNoVtF/2
	MUC5Yeopg1lKTgJv+xuukU4LVxtw2n1EmTWgIH0oODCZh3S+atcS2bHXW/5huSqjCkpFWA2mHFH
	D1OFTd5u9etx4t83RYvIatsQOSKWcLOAM10f8=
X-Received: by 2002:a05:620a:4495:b0:8cd:9020:f03d with SMTP id af79cd13be357-8cdb5be3a77mr1558772585a.73.1773629510987;
        Sun, 15 Mar 2026 19:51:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4495:b0:8cd:9020:f03d with SMTP id af79cd13be357-8cdb5be3a77mr1558769685a.73.1773629510466;
        Sun, 15 Mar 2026 19:51:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e2e1sm3136785e87.24.2026.03.15.19.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 19:51:48 -0700 (PDT)
Date: Mon, 16 Mar 2026 04:51:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: ubwc: disable bank swizzling for Glymur
 platform
Message-ID: <y3xbffh2ogdf66tvtxu5ig6ucqgpfo7vozcr7e7hftqvbxfza5@6p3ridipdmkh>
References: <20260228-fix-glymur-ubwc-v2-1-70819bd6a6b4@oss.qualcomm.com>
 <guisclar3eonn22vpjbdnzwbztwkrbbmvous7q757lihne4zbb@jtnnmune4uit>
 <abdfDoH6rfNYKmHa@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abdfDoH6rfNYKmHa@baldur>
X-Authority-Analysis: v=2.4 cv=IsATsb/g c=1 sm=1 tr=0 ts=69b77047 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Ks2lGerwZfoboV5htfcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAyMSBTYWx0ZWRfX8nGRBNDhVPm3
 TQYV1rShC/6vVt+59qzvHd9x/POmbk8M3TI4eoFIC2T/+pmzP6g8/VS2zOck/MK5byh5LSDO2cy
 JZzbSVgWoXs1d8X2UYGf6dkToXN2AS01kyPXGg+RwE0x9H5oido+cCvyTMS/odKt+tUJ19uTmMQ
 RkLfbhDPlXzfoYD2Ooc+wLQKvmTbg2Fpya/iiJ/jU3RQvPrgnOp/JDrzqYKmSkNa5sq1zLvlQAs
 pgKfVKjjKeOlJaF8Tq/nkdcGZXssyxPFQMpMruicgAmb9jk7zz5nVwalStyBkqdqB0F89ItOIhZ
 DumTcQiiPV3FWoKPd6dXCh2aGKHdlK/WE/p7vx5AK75iqG0Z+QnUmaLCeburw2UnQHb/Ll2u1EX
 eQ+J/fCoTwMVVPAf+p0/eRbn2zVw6GCmT9hBlQyBVJNgXhCRsYfri9bfBZgMqBE82M5RPSNn5QY
 xitv9YIsh7nJH2yU6sg==
X-Proofpoint-GUID: rZeCkpuyeRwTmAw7Hdh2rZDmUN16F-mc
X-Proofpoint-ORIG-GUID: rZeCkpuyeRwTmAw7Hdh2rZDmUN16F-mc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160021
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97822-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1746529440A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 08:41:02PM -0500, Bjorn Andersson wrote:
> On Fri, Mar 06, 2026 at 05:15:32PM +0200, Dmitry Baryshkov wrote:
> > On Sat, Feb 28, 2026 at 08:34:27PM +0200, Dmitry Baryshkov wrote:
> > > Due to the way the DDR controller is organized on Glymur, hardware
> > > engineers strongly recommended disabling UBWC bank swizzling on Glymur.
> > > Follow that recommendation.
> > > 
> > > Fixes: 9b21c3bd2480 ("soc: qcom: ubwc: Add configuration Glymur platform")
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > > Changes in v2:
> > > - Fix the syntax error...
> > > - Link to v1: https://lore.kernel.org/r/20260228-fix-glymur-ubwc-v1-1-d80e3fe0dcc7@oss.qualcomm.com
> > > ---
> > >  drivers/soc/qcom/ubwc_config.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> > > index 1c25aaf55e52..8304463f238a 100644
> > > --- a/drivers/soc/qcom/ubwc_config.c
> > > +++ b/drivers/soc/qcom/ubwc_config.c
> > > @@ -231,8 +231,7 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
> > >  static const struct qcom_ubwc_cfg_data glymur_data = {
> > >  	.ubwc_enc_version = UBWC_5_0,
> > >  	.ubwc_dec_version = UBWC_5_0,
> > > -	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> > > -			UBWC_SWIZZLE_ENABLE_LVL3,
> > > +	.ubwc_swizzle = 0,
> > >  	.ubwc_bank_spread = true,
> > >  	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
> > >  	.highest_bank_bit = 16,
> > 
> > Carrying over from v1 discussion.
> > 
> > Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > 
> > It depends on the fix which is currently a part of msm-fixes for the
> > device to function correctly. Raised the question on IRC regarding the
> > immutable tag or any other proper way to merge it.
> > 
> 
> Sorry, I did see your question on IRC, but didn't follow up and forgot
> to ask about it.
> 
> What do you mean with "depends on"? Why do we need an immutable tag?

Disabling LVL2 / LVL3 swizzling on the GPU side requires the patch from
msm-fixes. Otherwise the GPU driver ignores passed swizzle, making the
hardware use incorrect memory layout in case of Glymur (A8xx).

-- 
With best wishes
Dmitry

