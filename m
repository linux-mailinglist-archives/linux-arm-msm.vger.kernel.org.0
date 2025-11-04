Return-Path: <linux-arm-msm+bounces-80189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57515C2EF23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 03:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F40C43B924C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 02:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F6923EA8B;
	Tue,  4 Nov 2025 02:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MPZEagKp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DKUO0lc5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A88239E88
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 02:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762222761; cv=none; b=ouNjAV6dA+KWk2c2OeTeQIh9E5/FrZIst0CPuYmgvNJMjdybndnkv8khQgUfv9mOh9sHMpoeSFbBG2vpkXRawTA9ewSppHrLAQFupEhtWRmzKpuQfpHBmWVFSkSy5JlgNZh6bNiDUyUAGhV3PDgpvEAjJr6DUgtrowVcWpXaBbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762222761; c=relaxed/simple;
	bh=KyvDk7KBdsvEJPh/jWWyguSsjyrw/3gCRgDyquZ54I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOyh2qz9mJZl6Go3tLHWP3ckSf4bwGN2NF0PqwlAXDxh0HNl4bgJEKRJ+fmC2pqCNwtIdO1QbihD5Y9n9PGxCNI1oKfp9iAMHqIcApT4n6OrNgQqXf8ooJTF7rXbcUkcGp+uLsc7etiEMnfzt99YtvJqn5Ain6qb/rakcIhNv0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MPZEagKp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKUO0lc5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3H463u3667778
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 02:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VT+uJMyweB9zpA2zQcP02IUX
	/l5CbJ76U06mX6DtMmA=; b=MPZEagKpUp/d7rDAt57KB2eVri5hhzX1kdUmxCvk
	wkH1918n6wX6IJ8QrnEPNG+wja+jwrSStenYy0/y83jK/L3eR8R9UUwGkKdDbn6Z
	2pmM73eFS4Gcn8EH+4BtZXKmmqIloaFfJ5riOEoGbBHoDmu5wbRuQZc8AI3DdChA
	26U0kR6Rv9Tg5dyjsx1h3ovdNyfzbJYs5DpZ2etzMoJRdpRLhp6PTWD5WREK9wKP
	qhowIOsXr/ndNZfmsxHpzFEGWy1Hdnk92CsTA4FG3U3hXTIdnPYgvnU60DcVCT+T
	VxWOn0uRZ2nmwN64qBZgVWW5flnBqmjMrDXHSn3uOGrmBg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70ffhax5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 02:19:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8916e8d4aso160835521cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 18:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762222758; x=1762827558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VT+uJMyweB9zpA2zQcP02IUX/l5CbJ76U06mX6DtMmA=;
        b=DKUO0lc5lENhS/A1908BCv44rl0qgd2/L83+AWIuSkN4PRM9APmpzBk5w76LiYJCOt
         K8WGFJ+ORoBB1Kp5CWcoyyuWBIoke8313/yS2gGr49nmh9Z9ny4zx/e6RU5p0T7aGnha
         cTZQnCxxdEolZTyFpDJ7WFXHgnkWtTeUcqBmNrvagFmIRysO4VcF8Nv0sBlxoZEut8XY
         eJCV98zysMn5ZahcUTbmYeu3Eo6RMQEOI+YyxQhf9wUh3EXXhpnHMH1G24zmrhXbe8Eu
         JcGm4601P9Mg3mIYlt23oAVMBEBrtOA9xBccVL/ap5svj5fXqiyuC7oygi2PCBNDqCnN
         KAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762222758; x=1762827558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VT+uJMyweB9zpA2zQcP02IUX/l5CbJ76U06mX6DtMmA=;
        b=DLJpDZColMjoo9KAkLV7LRyczchqfm1hvoO8Evia31lOLB5kSOxRChLEe+6KPWRGIi
         g6NjjmzCV59luqNPEL2AlNpRwtekySSQpHdF60PpqsT8v+q81whgHORL7apmY+84ctAx
         lXtZ/0dfwec+bK1DNaVTGouk9/JSSXBF4AORgoG+kwcN7YD2aLCuYgbCP4VuI/Gdg0/h
         w4BQrxNAUnbSgt+8TbLPZoOWoj4Wl5GNcrfx+6X/h2EmG++Yuo876vapDkY+nDzV+bwK
         +hmxSJ4uvSP7AKlYp/nlIDb4exKxayHob5ev7KJr5OeqO9q4S2gWHpPyHNqvxVxk3rVO
         XJzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtSWUCqKAAvy9gyDOVzTkwt7DMCety+xCIdT7Z/ddW2mjBoDy4/bbIFtToJkHoh3lwAVdm9bGaMhAanXAt@vger.kernel.org
X-Gm-Message-State: AOJu0YykRxg2v2Vsp5JsFjSfDLQdDVH9/isaMFHOeMQCfDxK/o7eFWPP
	QNj5J7qFj372BnKKaR0cA61zQZ2qshfm/n+qmVVdiqnr+LSOKeAwNt56a7uoLy2c4vDkZjV05et
	IEemzgPx1sCQKy9aN2v4H/38nKTARLI6utNGSnMP0+FClTeAeI75P/3d8u6EyXzqPs3ph
X-Gm-Gg: ASbGncvi1AsC8+DqkXPIGZTDCr0lmpZGAFUlXGIWRsJA8rOtlNfVQ+ql8Pn3HqdbEaV
	j6lm/duXAvgXZsJlhViM2UYGx/2/x5BeQN+Siy66mSMOtBc4JDBWO8fmW0SehCnxsqY2e89+ykH
	tTueHrAWnsERiHjzmuTnCi0Xl7l/aN8Q1QbONck7dh3VqDkf4k/aPQyxOIpJSjQ3zxQ/sr5kA2u
	Hp6aPaaZzcn+cIl3VUzT9lD2YHgHCjQnTFHEUyq+c/bbfjHREnbWAOrg3iNwhrHxJe3qK0/FnRf
	26+lbLvjHZaiSv96H+RmaANB0t0k+eLZzsJ8ohjbeAZOWGZZSXFqD/Y3ZET6bmSkrH/1JfGbOYB
	eFqEOoHBaph/uyiqH8rnKu4WuJS+xzXKaGdtjq761ZOFRCaJ8rKuuboWr9F6KyE+qmfrdJbHFnb
	TxPMqlnnV7sVTh
X-Received: by 2002:a05:622a:2591:b0:4ec:f4be:6b12 with SMTP id d75a77b69052e-4ed31073e8cmr191051711cf.72.1762222758094;
        Mon, 03 Nov 2025 18:19:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0ryUoF8tqlqAR99jW1Vl1MLNpRRKFPflxwGP3hN75SmMfFz0v4Z+G11/UAlfIAEcBs3/06g==
X-Received: by 2002:a05:622a:2591:b0:4ec:f4be:6b12 with SMTP id d75a77b69052e-4ed31073e8cmr191051331cf.72.1762222757399;
        Mon, 03 Nov 2025 18:19:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59434439851sm347104e87.61.2025.11.03.18.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 18:19:16 -0800 (PST)
Date: Tue, 4 Nov 2025 04:19:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        sre@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: firmware: qcom,scm: Document reboot mode
Message-ID: <v5dbwbgic5cogxsf3lkmdwmlkpnqvo2niy3s7qu6ow3btpo7se@2altcz3nhbo2>
References: <20251103182006.1158383-1-loic.poulain@oss.qualcomm.com>
 <20251103182006.1158383-4-loic.poulain@oss.qualcomm.com>
 <aqoxdaq72prkeqwxmmohlmbpx7icuc32sej7did6vt6rzrgfib@bvmt7ppkvloc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqoxdaq72prkeqwxmmohlmbpx7icuc32sej7did6vt6rzrgfib@bvmt7ppkvloc>
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=690962a7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0l2IAsR_NwdsoEKv6PkA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: HvdZbYTbjncQpv8Nb1o_GGIBoaT65m7g
X-Proofpoint-ORIG-GUID: HvdZbYTbjncQpv8Nb1o_GGIBoaT65m7g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAxNyBTYWx0ZWRfX71YPOQhfRNe3
 +gml0C1m430/Z4BGTObMoVoQ6qMKNuBsxQOOVEy5jQF20vpk2boySZisFU5dASyFnfk+6UFZ6y+
 8W0Vpiq9jkge8gvdjnjkyS5A5hMynQdaJYg8jWYNVYgPVLt3M2TTMhg4Mbcz/gORkovj0s+sZVp
 yZepRtlNSOhd/5z/zMqOPMZGkeOwOjSQoETJF8p5GmKQxiLexC3HP9YuA9tEQp8Nlj5+hfXVihY
 M82IJ34SRaUlKJEx+dHQ7cZuvxPqzeAuXky9trTZqA7a1/52r2UUjkA9lwXvzg1EqZgYSD12Vwn
 bprxaYA1Dc7edQ2DKsQDRAGVjgkN8h308YB8sbUkn7o6R0YDTzR3I1InWgTCZPXjvfF30CqfdI6
 7DV4bZ6Uevbz6055xcMT55C0sP3pWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040017

On Mon, Nov 03, 2025 at 08:16:30PM -0600, Bjorn Andersson wrote:
> On Mon, Nov 03, 2025 at 07:20:04PM +0100, Loic Poulain wrote:
> > SCM can be used to support reboot mode such as Emergency Recovery Mode.
> 
> "such as"? Do we have any other useful bits in here?
> 
> > 
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > index b913192219e4..c8bb7dacd900 100644
> > --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > @@ -121,6 +121,10 @@ properties:
> >            - description: offset of the download mode control register
> >      description: TCSR hardware block
> >  
> > +patternProperties:
> > +  "^mode-.*$":
> 
> I'd only ever expect mode-edl = <1>. Do we have additional modes that
> warrant the generic nature of this?

fastboot / bootloader?

> 
> Regards,
> Bjorn
> 
> > +    maxItems: 1
> > +
> >  allOf:
> >    # Clocks
> >    - if:
> > -- 
> > 2.34.1
> > 

-- 
With best wishes
Dmitry

