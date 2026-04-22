Return-Path: <linux-arm-msm+bounces-104154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H4CNXz16Gl3SAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 18:21:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEEE4487FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 18:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 679143085DAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 16:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D6A37C912;
	Wed, 22 Apr 2026 16:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LV9AA43H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VLrq4cTs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C2237CD2E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 16:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776874486; cv=none; b=ZHtvyGT6rnv34G8YOWdJtpYPE8bvFkH20FYEcZWNtg71uMxKEoRm5rb8hvLMxCh2BIhviiU2bMmcwoLni+IaVQv5RPBPNFee59SzLKPSx0fH5TQ1hawFT+2ZRq50VWDX1OpRkDj+sQkoxZNoB+6Ds+ogsIlfGwNVTFZJTfJmlQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776874486; c=relaxed/simple;
	bh=B6PM+rc3ebo/0dAtIJcbE3ZVdBi/0OqnBbMeWPBoJwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnDUeyZIH7kb+gPyyoqWOclmKv2y0uSRJ2EkBYFXTa307ac6fDWDGWY7vr3xELEDP1CB2OVlXdDxOHOegzk10kSK8q4IHiYHomZhyevUcGExQSsc2bIIcM0qnTwtPrczOwd0nq9rM0p2pjW5aJ9QzF+eenCHq421GlvBrqhUkwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LV9AA43H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLrq4cTs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG9vev3173151
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 16:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zr/OzAZHUEuVH/4CQJOqAS3f
	r+2nHg7o7uvxIJddDDM=; b=LV9AA43HCxX+LXH7HcMvG1vWdWjb/lPHuKSelBQ8
	t+BGNlbCCd+Ib1eqoLkxIrFBmUyY7qyqWbXUXCasNfBSJC4I5NPPqBPCShewKYUb
	nmGeWOaPXirzQP7jeY7ayhUm5YRR4HVLAAY4wpISSiBa2KXy3z2jW0C8Ce19kwte
	oPQsTb+4z+Uq4/9cqO74LB9RfxwPZ6Dpn4L/DsTg0SH36Gakdh/McPWE7h4sKuKN
	VoaMpwvGwMKjXxCsAVlF7Qrnv835FPYR5n22F8njzD9bDHVlP4Ev9SmoXdfo8Fp0
	wQkxd0jTMoN5OD3rDNJtO92OZx8C92U2AoZG6rVl8iW+gw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1m300jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 16:14:43 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60580db2539so4105684137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776874483; x=1777479283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zr/OzAZHUEuVH/4CQJOqAS3fr+2nHg7o7uvxIJddDDM=;
        b=VLrq4cTsURXdCdviUoeknjRkdVwOzATev1O0iuNmjw8YVCXzPRc9THEcy1ryOBKjCu
         nMvE6xwNsuWP+x2iFKg/beSFCvQ8ZS2wtd5y2XGWWF5BDiEdZZUeddYSMx1m6DY4b3BK
         SjnT7c5lGtofE5DFLl+LfzlmjMQxVK2Dne/fqan+f4NU4l/QOHURz2M3FVPAuwwZEVLQ
         kJ20FCdjrWI3XuoaK8Ce5ycWUr8G6/8yc3LcDIebhP6f1tEepqR8IFIoUJIZvgB2Fs2S
         MUmiDdi/5/ygbt7iqJWUf9zzBXnuglcdb8vgiJeprMSq8EoDOTVkJ2uybCJzoZ3XZfql
         cT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776874483; x=1777479283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zr/OzAZHUEuVH/4CQJOqAS3fr+2nHg7o7uvxIJddDDM=;
        b=Fy/VAReIAchVb022eWTOE8TAPQlT1WMbRTvr+iqYXtXi5qJBGLp4Q5FWoPtRBnWQrv
         3u7LIIILnWB/g5mwF37MRwGzpZakaF6uzhWOIoI/aWujx2xS6rdQd12J2ZRPfIU3HbfB
         OjCcTz1k9cqwBS5eiNCIbDSrmW/8r+mJrXk0AxB/+/UBx9MDCd0UwQpcQVzryqz3AB8q
         2HjNjHoU96gG6ffVrm5rRaTu/ezp156YX1UCGrOI+p9EpbhLrZQuOPVjJ6OsBxE8jf5l
         zwHCV7+eZBrirXcnRUj+/G9NqpbOSlGnUp0Lth3QTpMpPp+bYXq2wznPRMAkkYssORu/
         e/FA==
X-Forwarded-Encrypted: i=1; AFNElJ9/X8LokC0PPgILCJbD77h2MwjA/fxhGii//h14CgN75cHQ2GTXOnOIHMg78LF1vRVn1VKEDoaSSOebdyYA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4+iKEFgu4VsGrq0ayOjuXY1ZUBeMOy1/5B1ckRx4jOQtXOylH
	0cphWerlZZ2gyfS9aYh7U6vZ6eW5weIJREsru29kPecrK6wvvlLsZ16YuqVokS+oOU5OJw56TG0
	UybMnQgxszHUqgu3dDUkvsobeBdBWcIzP2AV26OW87WViayI4YbJ8CrB3iaGIc084xEDe
X-Gm-Gg: AeBDievNNyNnv3FN1zZv11qmFFr/zFzktsKyCgBw1KQruGvgq6LVbEXifYvoNULyvei
	Ynz0OqVHJ6wvMtp06zc/0Uc/xv+t8cFF284qC/+JNkOIQbFbfEojzHp5tH08Tgtr4nRGttvqWAY
	5eQEklm4UekZukhcMzXymLRxlNEyvNDLMdxr5bYxv0LWKNwfRjHkJrQ77O/6AD+6OKVU7MNJai+
	RXf8tyg9ZH9AWYJmteGKQq+ouauoPDkjn7iKkLTKiu7kZn36DqwdfURoOeGeBq320YpDcvADzdM
	XUZCj+UtwFJtbRdhHEFMxCcpF0b6ebRnpC8M2MB0eIvpXtoOrbNK7evrto6Qa4xFVUS6EIPjRA/
	WP3ItU1W5mg5g+et11HmcjtgQ27kJ4gyKF3XuuwZmFKuDbfhWJy3rsNUcGS5HTQ3kgIWZTbfumB
	AYWsBtUkyBEqo4zL6M0jOZ70aEH+hR4gpM0Mk0gfKbnJThdQ==
X-Received: by 2002:a05:6102:4422:b0:5f5:3739:100d with SMTP id ada2fe7eead31-616f87a1362mr8339102137.0.1776874482854;
        Wed, 22 Apr 2026 09:14:42 -0700 (PDT)
X-Received: by 2002:a05:6102:4422:b0:5f5:3739:100d with SMTP id ada2fe7eead31-616f87a1362mr8339094137.0.1776874482451;
        Wed, 22 Apr 2026 09:14:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0b88sm37661441fa.27.2026.04.22.09.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:14:41 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:14:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/5] phy: qcom: edp: Add eDP/DP mode switch support
Message-ID: <2cyvdtnnmrfz4zffhikfxl2goyby73gybgm3ih52rfpyvbhnzk@37x3g26o2t33>
References: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
 <20260422-edp_phy-v4-2-c38bef2d027b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-edp_phy-v4-2-c38bef2d027b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ixCBAK9Q_u1WcN1SgVByBXvC7487JHL5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE1NiBTYWx0ZWRfX4vCcUgI2hp3/
 5Q6T+ZICrEzp6LVar57MBNBAoZIn9gOPjCsErni+YF/O8lvh5vbki8AUaMjLTQv7kWlGWOLRpqA
 F81H6lzxljpxxoH04jXJKvUg+NrF28Rp1doRs1mOee/2N15HexyYhNpdx9rkTo27jOugsbKCLMM
 iGBMbsCZaU6Qf0TFpqK+I1bL9ZJdSpIWpe05uGX8P5nzz8xCOt7/ZMwonEm2aMX58XvB5QgK9JS
 j04kG1nELxYMZTJVZDX2aOPXRt5OwL7jIIyvVnFmgjn17oI68d+OFHfKXlJ2Dr/n7yHM5/ysQHv
 6WKbcY+mi1lKWfXGTQAsjhzr9ED+gpRh9uBmzQCPDCwclMOA8+BlbedZsOjJ7oCH1aNVrJBO62v
 QnV9lcWmskWgvyiP0cFZjbtbUmGkx/KXLX3pRW52R1yDHFMS1OQCW5I/PNR16bPYco1WYAdq2C+
 pjJ0GaOVct7V4l7FUqg==
X-Authority-Analysis: v=2.4 cv=PsOjqQM3 c=1 sm=1 tr=0 ts=69e8f3f3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=cJcfiVH-KbuR3wWgFHsA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: ixCBAK9Q_u1WcN1SgVByBXvC7487JHL5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220156
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104154-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7CEEE4487FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 02:01:52PM +0800, Yongxing Mou wrote:
> The eDP PHY supports both eDP/DP modes, each requires a different table.
> The current driver doesn't support both modes and use either the eDP or
> DP table when enable the platform.

This is not quite true. The driver supports both modes, but it uses a
fixed static table for eDP programming.

Other than the commit message, LGTM.


> Add a separate set of tables for eDP
> and DP modes, and select the appropriate table based on the current mode.
> 
> Glymur's DP mode table differs from the other platforms, add a dedicated
> table for it.
> 
> Since both modes are supported, so also fixes the table mismatch for
> X1E80100(eDP) and SA8775P(DP).
> 
> Cc: stable@vger.kernel.org
> Fixes: 3f12bf16213c ("phy: qcom: edp: Add support for eDP PHY on SA8775P")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 46 +++++++++++++++++++++++++++----------
>  1 file changed, 34 insertions(+), 12 deletions(-)
> 

-- 
With best wishes
Dmitry

