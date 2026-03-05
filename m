Return-Path: <linux-arm-msm+bounces-95685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEDgGRXZqWl5GAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 20:27:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C2921785F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 20:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B132302D109
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 19:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FCA3793BF;
	Thu,  5 Mar 2026 19:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G5oAXuPg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jmmgb/mK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28DF39F197
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 19:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772738834; cv=none; b=nNxxJes/b1FWEpgqq4W5qakcLhIT/Gp5rBarNq7gH2qYKSBivfFuiuxd6fRa+l6NjeDz2fiShhNJVX0xajwBO4DY6uSyWKEqix1MGHekd4Y+GRKw/2P6Qf2/tqv4I692o4tsra6CFVC3EPC82vjkdbsbFq7W6UAcf7R1YSVu9I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772738834; c=relaxed/simple;
	bh=dClhvYeAZxc413Ftp49X/EDknd2hdqVFG4kmVIEjHI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1q+LoripixAcEdC3bfdHvfkPIJ3xHLLJy+ZrQ9OnueHmnr7Z2wx+uAAPHUxTIV1KDjNFAziMW5p47Qy2M/7KCSasCQ1A6z88J30880tno8n1yidH1CCPpJ5sDKSFqntL2c3MADqyiL716fpB9BIzCsywLSpzYOWmU8LnKDaSio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G5oAXuPg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jmmgb/mK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625ILsP92399297
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 19:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7GcmI8XP+y5dIBbSvMUZVV20
	6VKQWxQYIDZ2fcds9Jk=; b=G5oAXuPgtZtoZWGleGOCvOF7vbp0JsFrJf15qRjX
	s3lookP3BglqXSbrN3zMgVD5DcrnH9QkROI6b4Tsm1TY2B+0qtIX8Ow14rTj62Ca
	qoXaGeep1myugXJuHVy6fztHQ6ryrge9XqylGPddkiH6l2XTwj1ZjdxoMumlAAh5
	PIGGN42tLkCPeZbcKS0T4q0Ce4v9s2OpjC0tSNmFWYgGMptMgmQRfz1NuP4zRwhE
	sI7zOxmCMm3CY1pRXK5leWRzEHnKhzcBgqduCL7+3iyg9C42EMClU5j4TEBCty3B
	rVYsjp9WGzpaYhQ4AywVun/IvvRaL19dv+cFyq1HJoB1lQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq85dhrcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 19:27:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506bac14430so168445901cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 11:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772738830; x=1773343630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7GcmI8XP+y5dIBbSvMUZVV206VKQWxQYIDZ2fcds9Jk=;
        b=Jmmgb/mKhPl8jp39U1XFX9ALqfcE9qoqU4BF9qGmM6UfzSvyPiBxrsO2SwcKazz/vM
         GNPrd5txqFn9sYMFNiyMvO7lJSlUeLRMQPDdgFfKTVnQi3vbMPtTNoz1KiYIAJc1HLNr
         wMcvDWBvBdQyJMf/dHbhiS7O3PPPrm0aNQ1Zest5wHaGURDO7gEHvPr0rmsxtxUmATat
         dOu/PLegmSUfvQuYfZhubVary03FQsgqT6O5EHh5r41yTfNRAi5m5aq+w2Bar+sCx0fQ
         8xh/Cds0up3USfwxk4Yc7HgP8KUf3zwAVWEgXzZ93hK2WPGXupRlZ3DJd7/2oDVdorw9
         C+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772738830; x=1773343630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GcmI8XP+y5dIBbSvMUZVV206VKQWxQYIDZ2fcds9Jk=;
        b=iUPMtCm6iTRvanB3+wOoePeWLurGk9tl1ERpbLRwTgciVDc2N2a8pj1K+eouDPhHJW
         5jeWtiV6vvZ2SdRID8NNgFRCbf670edj1x5PRsx3cPYsHK6Qbu7Y+OINh/iuavJT6f+F
         A9AWeaCdFWrbSKkc0WKY1WsXTgvkWQej/lOynvLCd9nPeYKEOXVMOfVVYglOQw5GhB2r
         R4idnDspZpWRzETTUI3cNAITtK3+hvUrjn4IXEzyyNlO2DsqN+sUVOgdOhVY+2Y5wsMJ
         ctAdOK/v9aR0OoEXxODOtFOmiRvCByU5RrOZHYdiI3/BWJBDmvsBe6JFtAvveU3hwWxX
         F2iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvxz21Iff7j0YPY29QANRcWWbyVVQ4vT6h0+Ik9iL5qn72Qp8TX2e+00oRQ31zKIlSI+H8IPb76cRvgFd2@vger.kernel.org
X-Gm-Message-State: AOJu0YxnoaS2pTmjnonAa+7m95nh3UVatRIzZC2FuQO6RIA5cPx4PbTf
	dh6nMcfkJUmyRkM0GowlpvBOVXVm0fpZ0fC88l6Ueth722dsSDB3801LI17jqcAtaBmzqG/h0Ce
	fWVWakidV1SwwQflvsdyAzfSiIbbMsVEa/mm0IXMzIjcAWU4GYKwvC0doPB1jA32ldEh5
X-Gm-Gg: ATEYQzypuTm7yr1DZ5GwKWcq/Pvwsdko1ynruRsN71dn4nqD2URAxLCx4NxbT597nyn
	+KvxmXy08JK6S42fhMZf3PHyVoB7eWfSRDJNbEbrcmUnfYOazGzMqxyALzjM5i++NRx8j+1KKMj
	mScdCqeL7dVWtdAcFiZy6NcCqfVB0yBqoEt7zZzyhfvFPw1g2mgeWB34AHiRALX/COW57Qo8RCm
	aI0wr8RrT+9M31nFLGzX9XBK6YXgWBnn7G5EXHxvzyoCpDmIcswqreRvHyUwlxI3FUHoUIDFm/G
	fU9LJwsv/8QBZtLxtUhzqBRAVtgnFGBIygjzFwCXb03d2OI8/s2EFVkCqMpZ8Up/209Ysezi0ai
	MdZo8uWW4ZsXDsosBPovXrxEFaHSyWljrrGhrkzcJL3XVqtmGk6FUNAhZl0vY3WX8CNDq6nxWn2
	DyYxhzdXTtDGzalEugsqmbwqNAgrVYg9FKJrI=
X-Received: by 2002:a05:620a:199c:b0:8c7:132f:ba95 with SMTP id af79cd13be357-8cd5afcce1bmr899951585a.81.1772738830071;
        Thu, 05 Mar 2026 11:27:10 -0800 (PST)
X-Received: by 2002:a05:620a:199c:b0:8c7:132f:ba95 with SMTP id af79cd13be357-8cd5afcce1bmr899947085a.81.1772738829518;
        Thu, 05 Mar 2026 11:27:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123586c0fsm2162212e87.9.2026.03.05.11.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 11:27:08 -0800 (PST)
Date: Thu, 5 Mar 2026 21:27:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a8xx: Fix ubwc config related to swizzling
Message-ID: <5lh444wqr7uo4wdjg3ffon2jlupye3l7h32tdescicj5nnpi33@rh6colauigkt>
References: <20260305-a8xx-ubwc-fix-v1-1-d99b6da4c5a9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-a8xx-ubwc-fix-v1-1-d99b6da4c5a9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FvzTw8wlxQl5YM_gOdfz-SoXzCuyOjC0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE2MiBTYWx0ZWRfXxLqVQf7OUE2s
 XSm902dxj+jhoF5fL8tIB1jedlSKVTzrC6H2/gyKrBT4mlr6cC8tKWgW1OZP9ypLO4hPsNNjVhO
 Rgfu1bc+enDS98/36lYzcp/7p34GwGls138BNXs2C+xf8FBPc+3ujKKeNSDvCNeh4sBu3bR/PUP
 yV1bT3mX+Vqp/lbGgxci0g+MNhM6pCHve0n5lYtH1JtikLRPrROj/bLPRPZP/9cy2bicNH8YBkI
 biihYRHUUiwuOkRnIXOXWXpqMUkd3GlAKRBhazpa5xAylumwh6+4N/vUF/j+GwmOXjAWSJY6A/W
 FRgo5M9ohRb5smMAVXleqTP+Mb7UESGih0meOWbukEVW//YZ+2ml27z5vHf99ERTV6VK88MH0xQ
 E7NxAd335Z6oWL8ytlDZE0e0zwohjiJ38MNRQIS5n+kQiEpGb6B4DaLzOCfQSwySh2+sJEqJyBG
 rb9SCRXN10FO7axFRow==
X-Authority-Analysis: v=2.4 cv=aOb9aL9m c=1 sm=1 tr=0 ts=69a9d90e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=sCGn9XAE_lF3poFM8OEA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: FvzTw8wlxQl5YM_gOdfz-SoXzCuyOjC0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603050162
X-Rspamd-Queue-Id: C2C2921785F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95685-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
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
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 11:51:16PM +0530, Akhil P Oommen wrote:
> To disable l2/l3 swizzling in A8x, set the respective bits in both
> GRAS_NC_MODE_CNTL and RB_CCU_NC_MODE_CNTL registers. This is required
> for Glymur where it is recommended to keep l2/l3 swizzling disabled.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

