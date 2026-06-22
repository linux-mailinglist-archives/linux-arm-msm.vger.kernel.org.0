Return-Path: <linux-arm-msm+bounces-113971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s/xuKVMVOWonmgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 12:58:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AF34D6AEE99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 12:58:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=J9pUAUcp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Bxwk/r4/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113971-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113971-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 24245300B091
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 10:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48063909A3;
	Mon, 22 Jun 2026 10:58:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF53739B495
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 10:58:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782125883; cv=none; b=NGu8jRmtGNjF9sZJitg0yjHT8sTHgCd4xo6g761RoiEXgdzdzealJUFn40/T/eHcwS3xqWOP0r7PkXA+CMWeGujozVH6Ofb3QMJ7nbhRuNcbCV/vT4UvXw3RFAGIUFKlX65MpaXqGiB556k0OVUKksDzHclaYEfBWM1trlpNK54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782125883; c=relaxed/simple;
	bh=5gZU0yD6JX+5KE2M+P4YA4kFDlZL/1ZIP8EAVOSv1H0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgpu8RGra+vXAoCgM4EmEFdpjNmetquvMzArN6hPGTSQabQIb7CUM8xuHXpqK3CsrrrwpzYg2yH8w3h47WGMr3+reCiVEEyOCUaU6WuMBDcQ4T4bOhPxSZRN171Nm4s2PQ1MhP1m7zu937uxzcnemm9GSRS1yVbDaa3ZU9JpT+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9pUAUcp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bxwk/r4/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAofUH1043341
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 10:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=efbWLxWZ7B7PyCGYoqq6hhQj
	HYQqRuk/v+riBRM6m98=; b=J9pUAUcpnw/S3zEJw89Q3xBAExZCox28TTIpb9cv
	td/XSU+NZnn0gQTkm8oQVTKG1x7qlniP0IZe3U0b9LV30D/EhmciAmgy6LlnbPKE
	f8dXHaYyaU/XGR2lCefSFfuxzmQvJGODuMbjbGnY+5M7h7AyiQuCP8QqWPLSyRI2
	5tthfVVVs/w2ausBDji8TIEoTLPPwpwyBxIICelXAxOoHh/uYYVTNRG+ihGgK7Ja
	pAmG2BSalLfWeBl12rBwwjEbWZLFQzFSol0w5HVoj9blgey7TjoURGdRmgye9EbW
	R8FDHUDSyAO/e7WslECvw6TqDMcWBbIjtTcb7SYKUr7fJA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5p9k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 10:57:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157f453a27so673892285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 03:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782125879; x=1782730679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=efbWLxWZ7B7PyCGYoqq6hhQjHYQqRuk/v+riBRM6m98=;
        b=Bxwk/r4/p7zUk8bRbZ5rBrsiHirfLFN4Zp3NmfNfAfUaAqZxibYIUxxGgm9075rbrC
         /PS1ufgEjmuEz0dBrbG8embnQEhs4jOEZYroJ8Bdo9y5msI0hQm9cMxMaautAzql3UmI
         JVIll5VwUQkJEeiyiLAr6sybfqAzyNb4Sy1ElzE/qFpSVN0eZU35VRU6Pu/S5TBFqDjr
         M6+rPhCnZ/lh5RlNkDMFe0s4yFfTgrNHxRzMhg6QOuf0x5ciQ8o0E409sbMdiiMH56TQ
         ygtcJKLXsAInUr+31G9BYzYLJ3Kzai+sk9N/0dEcvv4M4mUScNRHR0Abz46SkXHmWCWQ
         qn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782125879; x=1782730679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efbWLxWZ7B7PyCGYoqq6hhQjHYQqRuk/v+riBRM6m98=;
        b=WMHhWxL8/bWGNWWwCanUtRJe5WXl8vx8l8NlEbbh7072bV+yXx648w/IqVDMbMgYs5
         cV1cH00bbimeXytf1dfr6rodIK0lAJ4Z+5XDuzzXr5NrFvCzzcBMsPsddCxxLcgE6CYy
         LkGcH8qgwOVj+wL5zVz0Q4Bv0/90W0R7FBML2o6FJyOx73JuF6R14pYg3pnpojZDSoeE
         nxd/C6ZohipmY8bUUdkfYNIciKNcJc5PyRIBnVk0i0K43Vri+R+tgdbpin6rzebl7O89
         Y6RiDIVAcaXMCKrTNcyz06aBK3EnyXJW2D97RPSGGRKrbzBM/uHLgurPE9hKSdR+KgoH
         FuuA==
X-Forwarded-Encrypted: i=1; AFNElJ+yvD3L45dZdrfljePdx9KXkYPYu8DKg/OtPfhAvu7Hy2ESqR6Zus1ZigtCQr0qMxcAm0VFQxveEXh6sGnW@vger.kernel.org
X-Gm-Message-State: AOJu0YxaB/7cD/6sMqRWpW3nCC2OmuwaTjR4eCTjnoGcqT9sFv1ptv/l
	/gy2z6vXcniQ/Vrmp0NjRoWupY04L1K1YLuyODly1yARiukbrZISOMam6bZrPg9F4ktl9/yfImu
	hI9Z+qHfvu706b5C3KN3AFS5yvEOw0mRQie1mJH5l/YrK3hoCCXX00W8m4qndthfRoIoB
X-Gm-Gg: AfdE7cmrXlm8juA4RAp/ZeinZavrwMWoVu00MiVTLVI2Hcedry5Jg21zbq2jMzw2O08
	p2ekF77jkMl0ndAKsF686aZeEHAZj9DPGSCC0izyDghYo1rqHkGBSD46YbVawGDkp4914jyboCv
	On6dpNJ5Rm97ah/D4MiXl+l9ECYelEBUKFGLWcoGQMDl6/0in0MlsAXQp3EULadm6Lah26jfon9
	u38rBKv77rJOQ6U20Dd9rEuszII8HFslZsrp683FY2oCRLKLdzRg5em8Fm/HcbIe3CO9JfEUZWA
	pAsewaBWztdA+n0i1k0hr3v4Gqz5i5LmVOhQnNADdWMlp3ZA4mJREX8sPC26DHLloOkNNJPbmIV
	/7nf34pnM7gbdoN93epnxTHgWa6qKkFK1TD3ouAFzie5WbyxUmiYsLlM6YOnvDPAJ9nonMjJcxl
	qE8vGmIWMHsz82uF7r4ctgoD6W
X-Received: by 2002:a05:620a:4046:b0:920:56af:cef2 with SMTP id af79cd13be357-920d1cea613mr2052008685a.25.1782125879108;
        Mon, 22 Jun 2026 03:57:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4046:b0:920:56af:cef2 with SMTP id af79cd13be357-920d1cea613mr2052004585a.25.1782125878696;
        Mon, 22 Jun 2026 03:57:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad5c3d1776sm1614656e87.83.2026.06.22.03.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 03:57:57 -0700 (PDT)
Date: Mon, 22 Jun 2026 13:57:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH] Revert "clk: qcom: regmap-phy-mux: Rework the
 implementation"
Message-ID: <uzybtfnq5o4qtdno3hjtj62rfah2rpfkqmu2q7oj2eh4774lxs@xqn74tvlhg2l>
References: <20260622-topic-phymux_revert-v1-1-f6ec85523840@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-topic-phymux_revert-v1-1-f6ec85523840@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEwNyBTYWx0ZWRfX9KCATRH34FBy
 xwqywck2r6EaDjYVdRuon59b6oObAwXVZKuD0ENwJ0tbwe/eWNoJVFoCqJ/srgizRu8zabY85x6
 SLwPoRL7GtMHa/+xTELH40E9PRxono1OeE/smLetaPlpQd2yeG5pM2dytTbrariXUMKiGcr4zsv
 PXEROeQIrEgxD1z03y+34F37dO1yGjdRx03AfjWgX1I1QlvTDvCUJB4mg9SbA3z/oxofIASmvZT
 GW7aNK90dvZoALa/idubCsEo96N/jmqWZKhFMDTUNEHvqucXtQosbkHiwfTTW6ItYrk5htF7fpv
 j1B4Dd+pTho5xbajUpqehwf0P84QKPaIyHrm84uVX0Y5yk8EM4FfHftlRX5R89ip6K7AMRmyUQu
 t2eL+YNio1k+z4AZRO+aOk8stNEM0kViHz2wYFeGl+b8iB5uWdpqxW4alVH4+I4+CxoAmm4102D
 UGe9eMiwjgTJfPRpFng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEwNyBTYWx0ZWRfX+SkCkYyfKwWb
 dwS3klZKKtYg5gZTJC+wt8S3X239UT/O/qMvxMYi2vjfCsLiGT3Yg489ePAfpofrzlilSv6H92s
 Sm7ejAXKUhGv3M92x14cX9yOctbBcLY=
X-Proofpoint-ORIG-GUID: mLkOSmnjcTLmAydc-dDc6DtX8nu1YdIg
X-Proofpoint-GUID: mLkOSmnjcTLmAydc-dDc6DtX8nu1YdIg
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a391537 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8_PmrudlSo1IlQTg30UA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113971-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF34D6AEE99

On Mon, Jun 22, 2026 at 12:46:05PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This reverts commit e108373c54fbc844b7f541c6fd7ecb31772afd3c.
> 
> This has been reported to break PCIe on at least SM8350 and Eliza
> platforms. I had originally tested this on Hamoa (X1E) where there were
> no adverse effects. It's highly likely that this stems from a
> difference in how the bootloader configures the clocks.
> 
> Revert the offending change to fix the issue in the immediate, with the
> intent to revisit it in the upcoming cycle.
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reported-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-regmap-phy-mux.c | 58 ++++++++++++-----------------------
>  1 file changed, 20 insertions(+), 38 deletions(-)
> 

Thanks!

Fixes: e108373c54fb ("clk: qcom: regmap-phy-mux: Rework the implementation")
Closes: https://lore.kernel.org/all/c675lcfptr4xgg4hcjp66unmuozgsvgwvtymh7on6jcipjrdw7@jy4h7fkwqwjg/


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

