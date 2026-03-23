Return-Path: <linux-arm-msm+bounces-99376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNASBXGZwWlNUAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:50:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 844352FC9FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0D303213BD9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 19:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F4235AC3C;
	Mon, 23 Mar 2026 19:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IqDukPL3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lwxg6zoI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8D335AC30
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774293807; cv=none; b=JI+n9xiwUwZ7Yua20DBCaS8wU/ZxOEMpf+WamVllv/ZoPnYEqSb7NiKWRhsp3AqDNQJnRHny2+zdCHZtDhMHsGL2Sxc/ghPfdmgYxtuM9X+rxHU/RQN0OtNtQ6qVrKu/K5w14fSESQN6BQbL6N3CdhzMdu4kT8AfHcDyw2D4dWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774293807; c=relaxed/simple;
	bh=rEnqD8tg75fgffkRgdqYPwqJo2fSWEVNK0HDQHHUxbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDDqwr3Xfw319ILbRCbBdzgDlBN/Cj23Hum/Lt1+XCJ1rf9VZihO8d4JRIiFOFUCI3eNbH0TryXJ2PvYzF85JeXsMukLXzh0LDX9izyLUOrYzHKpxYOxBvaQEdYSEryC+0OU3qE332pNHJ3c3jKliFnfuRQsUyq/6B6oP46ETRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IqDukPL3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lwxg6zoI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqpgv3934889
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F5S73yFqmXzwL38sugaiBUyN
	DkQbDbjUMiBLQeqW/iA=; b=IqDukPL3hh5OCjfomUVj+Yhgd2OmBpbep2CzCiHS
	lC69SMNkYQglemRT/M0GjQbtttfmONRAnEGdaB86d+ZJxvm94KEsu01EnicmAY1J
	lzohu3oXkBCI3MhslEvBTohORpvt1wT0uSRsRRK9NcnT6++Uj4rP+lYvm0GiNooa
	4LyXtpmgd7eQqf1X2Q4LVzmziH0+NbqGl31TyBe8o4hondhzDfeTIPbzIIhqoi/j
	hknITx6psuli2KloenBpILSw4AwVQzhkYGeCRjqQqgZ+O7Fzpix6SFDsy5SFX3YH
	IJoyq2NP/P4tPWqzRlDT5F3axQ0Y/Jw6GGaPNDBWXNm23w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0h1dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:23:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090e08dcfcso25285041cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774293803; x=1774898603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F5S73yFqmXzwL38sugaiBUyNDkQbDbjUMiBLQeqW/iA=;
        b=Lwxg6zoIP9QgFbnO07N3bKQAnWr6FMvkgt8ybhfZ9daAaos/nf+dXzjnYHZQKOfQib
         vuPsx+/cajL36rjYHO0KFk4qvUfAlIREjJ7sOF1t1HPi7aSKBzzSkYEuRqe5/XCo144E
         zfKd1NyaHRzasO8zcALhxleV+hjHQCBxn4pjlQ9xX70fRIX4WyWr19X0RgwaIh4t8Gye
         bUswZiE+JGYwoD2cbC7j1GwXEJH/riMfKApr8POGhdYI4s2rZaUI4N4NOYOR32fyWJss
         QQiVsLE4CQVkFloGJ5IoAhLAnKh6q5iUW3Hz925I9vk4dyXk2h7GOEx3a84/1YX0XRDH
         MdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774293803; x=1774898603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5S73yFqmXzwL38sugaiBUyNDkQbDbjUMiBLQeqW/iA=;
        b=QuoewyAMq7ixF5Bm0v6NsULK/IhISyfZnuTQPFgm1Jo+qd5suJ3pTDA3auqFpnCG33
         xxbqnIzMn6OWPoNxD9XrBa7mg2HaG2WXLbP8rTKZnn+n9OnqYG1ss4Oa5UlP9WjsNhDl
         la4BRlhHgIZIDvRRVK5uTWKlGr65Hw6eqoKsh33hKRQD9+p2uqcRHEwYTzW30przzhTr
         ajSPv3/VSz1DuUuYnxfvXMfwMXEtD4jr7L5Oit2HzCDyHPZS3f07j8dhT+3QsMUsNl3x
         NBZIeHN7ZRJdQ5iC2XFH2PCgQ7Iccb4TbWKFhc2/64R5RlaObnBvO1hOwCEkP1MWhZQ6
         8uSA==
X-Forwarded-Encrypted: i=1; AJvYcCUfdIcDgPxWLEPVLA7P+bHwH9eWZsAetrqPhafdSN9zNdOVwS6FHfQeF9KODaKvCXzm3NpnWC/fi4q8TzAF@vger.kernel.org
X-Gm-Message-State: AOJu0YyklD67K7QMdamsWij4wk7/ViHeSonXKp57rEWvJHTPDCcDB2TF
	sze/x4bkRO77rRbkXsz8XzGPdrXoCKW8oz4AMxlUgiSdhfcdWG7c9u3vQFEUbVmRfM7o861n/6P
	w1w0NasWrYAL1KID+0RN6vCaY+YKdfO05+bDSXZOa1F9hkiquDW4oaXoszWOblNI5yMuv
X-Gm-Gg: ATEYQzy1BwQ/J0htnRHuCylNwp7KeNjzCqJmN6xa4RtE4b9LKa9hNO6iSQhxOBb9JwN
	TwJiCugi4q3kzr1BPSHq1WYYvovSiLnALVj8rHCEa8YaDRkCiayX2AifLpCsh45C5aNaHOmA8PX
	EUFNJCm8qUWG3wcDp/GJ0kEygCYpywP1Etrk/jMRHxTDfPChzGepDfqTq83ArBR7qsDPXba1YyC
	irnKbNpz1Jv4FWaz2Mk2lvOTdpFoT8ZxCFTMELKIeLScDt/08sQQalYCjgyMrSmXub/WSu2AIny
	pDswvWr6KRPlDFXTg0QqLPbUtu0fNoGbLcZior4nlvIbTiFrqrUkeqM3bzefZwueiBpQwRGT17s
	9HCa1KJ6qCaivmy+gPWXBQYVcKj/+tVxZ0YQtgdCdGNRT47Ugi4KA3IIvT75iwo8RZc18DQ3AFD
	jqAinhIpGJeNWVdzhqA8r5Bk+Nm29W2RzDSOA=
X-Received: by 2002:a05:622a:17c8:b0:50b:526c:541c with SMTP id d75a77b69052e-50b526c5796mr110924371cf.50.1774293803135;
        Mon, 23 Mar 2026 12:23:23 -0700 (PDT)
X-Received: by 2002:a05:622a:17c8:b0:50b:526c:541c with SMTP id d75a77b69052e-50b526c5796mr110924101cf.50.1774293802659;
        Mon, 23 Mar 2026 12:23:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9753c7dsm29473121fa.13.2026.03.23.12.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:23:21 -0700 (PDT)
Date: Mon, 23 Mar 2026 21:23:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
Message-ID: <vonorgmssumelw3nkgd335lzi3eekinlslqb24k5lqwzil3tyh@epcgwiiu3xqu>
References: <20260321095029.2259489-1-mitltlatltl@gmail.com>
 <dda88cb7-090b-4baf-91f7-e6724b506134@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dda88cb7-090b-4baf-91f7-e6724b506134@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c1932c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=qC_FGOx9AAAA:8
 a=Pc8HEx6hQBhlrjk2STEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0MyBTYWx0ZWRfXzwhijIymFF7m
 JA96syyrwj1nq5QOeQWP11Lc537FtrDVBM1gRsclnRGdx21pwN6nCmjg/xbaTCdDtjGS7Uyeedb
 NeHBtpGeIe5L8juqijlMiq0XhDXw3bde2L69OIokPdnN62VHk5qKZlus5LSAiWZPOkD0kCnrWO6
 BRgUTkYPrkg/pHIVQk/ffavHhpcM8ecyQ2MbILbI7sKAbhRyV1SvKPxB8n4vlf7jDESrBArw1c9
 Vt+8WnfZVV5yb2/mB25L53YwbLW9Vt5lam8S16PdT5Zr//0bkYTyrRg/STu83si8K0z12T1232v
 CKObdZw1acbh80ElHepr8T+06jVbEpfr80V91jM1mRav7MVHBbSkm6MCxdCuypkbWRe2Dn01/X5
 qOG88vJBEd8J2t2JscO8d+ca8820HZDQUM10IEPAvC49kJLuCoXlgTxyLhwFSCZ0MsqhaMqwPFJ
 LyZeFDiLiHprOEJY5hA==
X-Proofpoint-GUID: I9mml77QAML3eAVt1oT9cCjxMV8oqX-n
X-Proofpoint-ORIG-GUID: I9mml77QAML3eAVt1oT9cCjxMV8oqX-n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230143
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-99376-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,codelinaro.org:url];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 844352FC9FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 01:54:29PM +0100, Konrad Dybcio wrote:
> On 3/21/26 10:50 AM, Pengyu Luo wrote:
> > Recently, when testing 10-bit dsi C-PHY panel, clks are different
> > from the usual. (dsi0_phy_pll_out_dsiclk's parent is dsi0_pll_bit_clk
> > now (dsiclk_sel = 0)) And we failed to set dsiclk's children.
> > 
> > dsi_link_clk_set_rate_6g: Set clk rates: pclk=172992000, byteclk=108120000
> > 
> > byteclk was set first to 108120000, so the vco rate was set to
> > 108120000 * 7 * 1 * 1 = 756840000. When we was trying to set
> > 172992000 on mdss_pixel_clk_src later.
> > 
> > Since there was no matched ratio, we failed to set it. And dsiclk
> > divider ratio was set to 15:1 (wrong cached register value 0xf and
> > didn't update), we finally got 50455997, apparently wrong.
> > 
> >   dsi0vco_clk                1       1        0        756839941
> >      dsi0_pll_out_div_clk    1       1        0        756839941
> >         dsi0_pll_post_out_div_clk 0       0        0        216239983
> >         dsi0_pll_bit_clk     2       2        0        756839941
> >            dsi0_phy_pll_out_dsiclk 2       2        0        50455997
> >               disp_cc_mdss_pclk1_clk_src 1       1        0        50455997
> >            dsi0_pll_by_2_bit_clk 0       0        0        378419970
> >            dsi0_phy_pll_out_byteclk 2       2        0        108119991
> >               disp_cc_mdss_byte1_clk_src 2       2        0        108119991
> > 
> > Downstream clk_summary shows the mdss_pixel_clk_src support the
> > ratio(35:16)
> > 
> >  dsi0_phy_pll_out_dsiclk             2       2        0        378420000
> >      disp_cc_mdss_pclk1_clk_src       1       1        0        172992000
> >  dsi0_phy_pll_out_byteclk            2       2        0        108120000
> >      disp_cc_mdss_byte1_clk_src       2       2        0        108120000
> > 
> > After checking downstream source, 15:4 also seems to be supported,
> > add them two.
> 
> I don't see that, not even in the newest releases.. Is there even a reason
> we have to list these divider pairs in the first place?

https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/f7aec4359448d25c8a8d21ad8e8733d61f6b69ab

We need those dividers to correctly program pclk RCG2 clocks.

-- 
With best wishes
Dmitry

