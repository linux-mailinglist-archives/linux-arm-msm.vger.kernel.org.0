Return-Path: <linux-arm-msm+bounces-99097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH+EKFTRwGkVMAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 06:36:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5602ECAFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 06:36:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65606300E277
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 05:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0DCF2BEC23;
	Mon, 23 Mar 2026 05:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnjhdgOF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GR1g1+iF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953A029DB9A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774244117; cv=none; b=TFQns7qkZC3uoqz3Q1dj2n3C5IKvkyAEwbV/iK2MFc3gLq5iAfPldeprbVlSvpnfyLAC0k/uyoL5eEu3INpKKwIEQKLfvslHmkxOHSaUjRx4vdOsyNmHhswptFj8nTlX57sNpOXMa/sGaAFUFdu/cIe4+VS4qHCLDhQR3Tiy0iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774244117; c=relaxed/simple;
	bh=pUd5WS/jGJRC5RrnfNLBW5nV8opvGIA/bXBkxA2/7Us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruovM+R7Zr0t5uZU1mOF6sZByHZJU5sIC5cH6y9xC8a+Z0+VlrPGRRIJrKSvszkCs7XVQTRcbrvIKNZ1iiuHI4HW7TiZ+016zUTQM/1m8T75uMg5QdzXPibPLL9TxKCoNIt76xaSfUgPVgRhsd6ADNesOzHQOe84PVKjrMMZXTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnjhdgOF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GR1g1+iF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MDTPaV3522918
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XOZF3t7xM81O0Basx1IyEzMH
	oAKaQM3FfWIZIUddVhg=; b=KnjhdgOFcmpqFytph7mRSF0RGWyx89QkaXSfhU2K
	YeAbojOJS/FXSn9Yt0mHS3eyyQ462KUCXpP7l0Wy6DQ8EosVVD9kZlu8sGbWRe47
	/PIKmKlWs0pSX/ZdIdoCpT5wGIPe5jCjwX23oowvqDENHKrofv59HNMW1qsBpHjT
	g3FluyfakXCOrKCSsoySJj/HN1ARoiz6iwjxftLNAx6+FYA0pKt0V4Ipu9iOIaBo
	5hRWuISRU2ynd1QWt/ur4KVmOdQYetZggD2u1gz5/SOVAKrWfRpeJwM1M4zDHoRS
	z3a4NjDG9S3hpMTSMtT5b9xRqZ++QXbvth0BMlO1vLuRww==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kj1krwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:35:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509070bda13so311867411cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 22:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774244115; x=1774848915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XOZF3t7xM81O0Basx1IyEzMHoAKaQM3FfWIZIUddVhg=;
        b=GR1g1+iFlTt14S0LhbBMP9ZGgTwhZe20R3Ql+b1wVoVvF0gJIOIJtdQ7yyAg+ZcwWF
         0DfIwukTTJDI3DuTLB6zLzfczLBfPJAmd/wXtCL8ox/6OaxzwXyK+ALMrPyesoaNyPeM
         GMBBl6Hggk5EG31rADKHEAIqSQljqNQW7SAqtKgQ6003ZV4fWYgUOC0bKPnO9a3soAEY
         SUm4YWmCM6w8bxktruOeXjbulF3QpV0bVkNYZyKKk3Zjgvxkt3/1rJOxoM0S/SdSw3gC
         FcyLVloj+UWSxqrud/2/0/AZTPZLCwj9vEGLlChtm7+IMNChXzqzweiMBntR+FI7rBkI
         mVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774244115; x=1774848915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOZF3t7xM81O0Basx1IyEzMHoAKaQM3FfWIZIUddVhg=;
        b=eBqzLmjt/Ua2Jy3moZg0fuIZpLvV8W/dnJeuOJH40NePn27SXtNrtMsXfVEOu8aJjq
         UAmjONOYoIJ+pFUHfKyx/RDMUU/kMECrdIE3pIPWNurRZZr0NqDBjkOzdphmautDenvU
         Oj6HNLrag7yUk+oa/RvM7aAhSBrTFs/Yvs9lkAOwbay7iJIMb28+g4jLQXToRPjjzeiG
         vxkOQkDzPBl174sJahNt/x5hZeFxAUSLR7y6DFGxBitq0Ry8zl3xcsyz1rhcCeBVRR75
         tqGZR+4RQ4nm72ahak1JvAvz4q0SNP+U01HADlTy1QkPT61zdlaA/G7Qn1jRxkguf06q
         M1bw==
X-Forwarded-Encrypted: i=1; AJvYcCV9wvgw9I5x34xfjgvLyc2x+29QjzI8H1laEIpxRLz6wnKWjSLpYxNtrO+ycRxz+mn0PsoTvk46DIh/TstW@vger.kernel.org
X-Gm-Message-State: AOJu0YwF0+d4+7AABqJ+sUVg47WpHyKumgtAyPVsmHSepi/Wz6syDwSe
	zHpVfcU2w8PIjsxkD4VbRaH1yxIc9glGLlOb4kX/12aHYe6Z48i5PbYPQqpaH4YC1c9Xp4E//c4
	9rrFIhmDmggz5Fkaypxchz97Nu5BlqCXNWxCKGEz6yejftPP6uXFcajPaASYItZvVbkMyarC0/B
	Ni
X-Gm-Gg: ATEYQzyaSnYrk6KTeghLlB8qibPrzaE85sM3sTuj1YwLhHmWC/caTuOhJox7El37g44
	DkV2YmF+wmM+w4DOwXRDck4oanJlqT5jrULbFjPNIvJLdXqw4iGf/KFOP04t0NaLGLa8RhoEwR/
	GRW8oGRsRhe7LfYyv/jNcYmIxGzlfpzSr88kAIvxS8MG8hWT8ioT5F9oAMpDZ2YeLM5hhJXnp6f
	5AyNObJYMsK+AIqw9jrR+/CkbBIcSq5vq8JbZbiKxB/lrUegOgdcAw67G60OUIP5c8570wIhvQX
	7eDVE70p85HzO0vJO1g/Wb063QRYa4OROMIOg//tbGRmUY3Z6zWrAvaHNvEeKwCLrGT4nyw8oQ+
	A82SRXjf1mdHIbEDrTM0UmlMj0APhnBDY4YmAw2/kvma+zhK8BDtThklcAfAsm9eb0J5oFvzk/i
	vUYwdEucjY0wp3E394iSxcXo/a+skzodd06Sk=
X-Received: by 2002:ac8:5f47:0:b0:509:16fd:ac37 with SMTP id d75a77b69052e-50b24753e07mr220037601cf.29.1774244114693;
        Sun, 22 Mar 2026 22:35:14 -0700 (PDT)
X-Received: by 2002:ac8:5f47:0:b0:509:16fd:ac37 with SMTP id d75a77b69052e-50b24753e07mr220037361cf.29.1774244114256;
        Sun, 22 Mar 2026 22:35:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28519f958sm2254939e87.19.2026.03.22.22.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 22:35:13 -0700 (PDT)
Date: Mon, 23 Mar 2026 07:35:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON
Message-ID: <lb55o3uw42oxye24q7wh4iqxb7fm5xhguskxqvsmapecabaf6v@id4bvdec5tbb>
References: <20260316-hamoa-usb-qtb-clk-always-on-v1-1-a29ac94f20f5@oss.qualcomm.com>
 <gvj7tsivu6w2fzfcus6oi3pwc7jcfqdrx62uuzny674mj5ftus@dpnn4pzizbqc>
 <388c4c45-2338-4520-abf6-6a15aeb5db42@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <388c4c45-2338-4520-abf6-6a15aeb5db42@oss.qualcomm.com>
X-Proofpoint-GUID: ORB2d5NZbUKNZ_EaiaN1QFkOqzF8UqKC
X-Proofpoint-ORIG-GUID: ORB2d5NZbUKNZ_EaiaN1QFkOqzF8UqKC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA0MSBTYWx0ZWRfXxyju9U8yBu4f
 NTcFwbn7tdJKMC5LfYtdZIDX/XU8ijcjcdyVabn0XQAD8Sba+XyaglyMYWOonXBz0i9v9a1Yci0
 UgxtxBK1uCxv+TCqY+ZQHyhgs1RJY89dsk8HUtsXko8+/TrZ2ZVep+6gB7DvoVGj4i/cX4qP2ZW
 PU6mzV3gnIfqWP07sJ3wTp8CceKd0pmhYPF3mE2bd2lOJk/kUWtsRgQbKhPDc5JP7I7BHTD4Pfa
 K6sMOQUMVLY/zzEPtj4S/4i9WqIsEbjGxqs7SqioLBdOFgBfwI7pZBQRp4wqm85LMir2bhEPWmh
 pZMuP0+ywhLa8vz0mx0YV0O7ZHpCGeZ/+x9GOv5eTwvaYCX+c+NC0Nk8wo6/4xDVxrCb/owEZ44
 6fuJH0QIXjOpXZM4PY/LYxSlU3TEXizoJDoc5y2+dMerOGHjMCjVoaL6kwhLIkAOUypGMDWgs4y
 EjkzUStS7v9j+O+HU7Q==
X-Authority-Analysis: v=2.4 cv=dYiNHHXe c=1 sm=1 tr=0 ts=69c0d114 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=53OENFOcBHDR1HQKrTsA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230041
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
	TAGGED_FROM(0.00)[bounces-99097-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 3D5602ECAFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 10:26:53AM +0530, Jagadeesh Kona wrote:
> 
> 
> On 3/16/2026 6:26 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 16, 2026 at 04:38:21PM +0530, Jagadeesh Kona wrote:
> >> Keep GCC USB QTB clock always ON which is required for SMMU
> >> invalidation on X1E80100 platform.
> >>
> >> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> >> ---
> >>  drivers/clk/qcom/gcc-x1e80100.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> >> index 74afd12c158c01c121d9aecd56e65c0c302d7cd0..73a2a5112623e5190f41129af7fd76a86603557b 100644
> >> --- a/drivers/clk/qcom/gcc-x1e80100.c
> >> +++ b/drivers/clk/qcom/gcc-x1e80100.c
> >> @@ -7480,6 +7480,7 @@ static int gcc_x1e80100_probe(struct platform_device *pdev)
> >>  	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
> >>  	qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
> >>  	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
> >> +	qcom_branch_set_clk_en(regmap, 0x7d01c); /* GCC_HLOS1_VOTE_AGGRE_NOC_MMU_USB_QTB_CLK */
> > 
> > Is it used during all SMMU invalidations or only for those related to
> > the USB controller?
> > 
> 
> Yes, it is required for all SMMU invalidations.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

