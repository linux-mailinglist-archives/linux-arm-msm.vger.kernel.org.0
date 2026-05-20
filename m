Return-Path: <linux-arm-msm+bounces-108870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mA0PHnYcDmpT6AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 22:41:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EE7599EFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 22:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C42E53746B30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46F836405A;
	Wed, 20 May 2026 17:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y+/3D0lw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4sZSKFN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372953E123F
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 17:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779298864; cv=none; b=DqR3yFX9/cdvN/roTDbJQPSTNbeBvWtXsAe+n7ifvYYQduTJgnrx0mbQWCPuGaAhIBSiWIHo38qeMiUBRvy1ZhsbEPbomto/sj2oVAdXORRenyVOdSP/fNdyz7/hFMaMbwxtvPufMWcr8jMfLVLxj3+GaTIiB184pZz+WuzfiRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779298864; c=relaxed/simple;
	bh=kLYBsaYeLVAWJR26NBIKWh96+ZeSEMHSJct10TD/A34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQo0KmauQCLeeD30W+H/qAOjYJjUtVDZNaCgNPy4RlXFfAdGKPwCpO8tGThKjHstZlJ/aBtQeZ9+TGKdMTLyENa0XkNtOp/QLmxUXb6awab71DD9Uil88Aw9j95D+tRjcKv8W5oiOTQCz8TiiSzfJk4A4djsIjATWde+8xt5758=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y+/3D0lw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4sZSKFN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KEFYPZ963697
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 17:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LkDwhjRfxWJPLR8+hbCIDbOf
	AQBV6HIAU4DHZ3gBD8k=; b=Y+/3D0lwa10eWIev1kQU0iZiOL+cZlfcwvbeJtqO
	f5IEOeMiJ8UGDO69hJxdjnNTQTWWibJleV07IvsnDHEENehSC/elCmOSoIbh+mVZ
	oQU6WHLQYx5SHbY/WQtCA9PrCNisFWiqGfShGZTHWVikPFevzmGCuGUz5gOGsYvL
	2rDjnCQfpAOyE5VnQsc/pu4WlyuzbJPbcidBaVcWAAkyx4Au+QChOOfvN1Ezmttr
	zJx+3OVYNHaUf6Oaa29uURXQ47F1nTy+raQ/RHDfLAcsRcfE9g2OU/Ct6k2KbcRT
	feQ8rGa1hqu8HCapAjydQwkpHhAGDsH6VGGuilfSEZF/sw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ejh0y9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 17:41:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5163ade1583so9834861cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779298861; x=1779903661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LkDwhjRfxWJPLR8+hbCIDbOfAQBV6HIAU4DHZ3gBD8k=;
        b=R4sZSKFN5fTP22yidlHm9Bp727yjRZ9N6WvqMCGF2N/3cf0lVNsrhuykhLgvcV54sw
         N7Ln5NUgFSmwlVhiIIfGYlbFeVFYb1XGk5MYOwbH8HH9hXduyzcUGlmx0Sv9J3sZzCj7
         na3aSsp6dIr32uL4OcXEVI4AVckWqtn8kowyh2vkNMG2PlQhlJgyvLUVb988cyDZ5xd+
         yhFPkOIPcMi+cUo9oPFICpHcKYiNlv2R0IA3hpYFZC97h39dSTYzmtduB9eZR7ATw6N+
         Imo5Hpu5pJuL6l6A0m9tuR4iqJRK1/dg6homiBerDN1U7U2rfMygvTv5W2maLXmRAZ7s
         5nPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779298861; x=1779903661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LkDwhjRfxWJPLR8+hbCIDbOfAQBV6HIAU4DHZ3gBD8k=;
        b=cieBNxgP+ABoIhG+obP5iK6ZTJFECW2HuShC6Jiio3DWhACETvNZ8OhGNYtZZdZCQk
         nbcyIluhmHA2eXg/Jbm9Z+m2rsVNIm8BDtInfCuYuu+KksXJmpoONCp87TzNAryixRK2
         NbLJ45L9EiqD6z2H2LhWqQFKmGMQyY2GkyI/Ls/1Jzk9WD3It1DHVkp5bI17ObC1zbfV
         A5SeoOzwUFDyrerQqLtSKZwNmtgtI7/LvBOxLgCLFrc+XDYUcoKX807dvTsMBOPHtb+O
         NaWjUyGRGYjXYNZg/CzSkKbgLwqH5n0awdrbuyX7YN4HQc7n2fKyZnsW0D5jZuON8fk/
         K/lw==
X-Gm-Message-State: AOJu0Yxx57QAj1CvQRInTQ+8tejSot9/+FSCPuWGo0/AHEYTy6HZInDq
	iyES1VMprAlQCxv9SznpRqpxwR3L9A6qJCUnS/wxTnDINlpuAuUmjR2GRg398mLbdRjz+AasZzB
	G5TswvGfb8srQwRJm0HHAjisUJEGIpBLtjDzBaFzvHQ58zzRhQcFlv+gJMO+hC75tgi00
X-Gm-Gg: Acq92OHfBSA/OMRuIMNZfQKG8BLVj37qIvsxArqLtbBDV5sr9gbdErLrOBR94yz51tf
	7jL89fihOkes98dDwi/mhMjKJTenFFF4fRwwEKdphtDdxuDF3pwOL7VI6DHyuX5kDzhNXnLnlPB
	FAnKnYyK7R1ToNqYLENuvGA8rKpHEw/n2RwTx/jj+k17DnlLGogOCj5lPE+8WXJk3/dNcPV8Upk
	YaqIOOIlNdt0h2lEW7QUprCP0v5VTU0srojRX38gNwOXYOHBIuOh315W9Lg3UjAZIR5TdZb11JW
	0y1QFpembwjLPVwzX8raArFkyDI6ByDTR6bVhwo0dzgd8XCNKCtu3UIsr7H71+3himlBrWvPW87
	8jeNVUV3L+L70NRQgR+HI12lY52ehBSc4lHy1Xyx4hMTYSeIZohLUNrEoAu/2VxLTeXPIhOV7m1
	0acKhFzQPsbVvQW17mF5W8gDx+D7S3fiPwR1Q=
X-Received: by 2002:a05:622a:2606:b0:50d:e1c8:5ed with SMTP id d75a77b69052e-5165a23c962mr336465911cf.52.1779298861476;
        Wed, 20 May 2026 10:41:01 -0700 (PDT)
X-Received: by 2002:a05:622a:2606:b0:50d:e1c8:5ed with SMTP id d75a77b69052e-5165a23c962mr336465221cf.52.1779298860965;
        Wed, 20 May 2026 10:41:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc3fcsm5152568e87.48.2026.05.20.10.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 10:40:59 -0700 (PDT)
Date: Wed, 20 May 2026 20:40:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jun Nie <jun.nie@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI
 case
Message-ID: <a2gwkgdnbwp2wfunhmdhm5mwqolzm6fgb4ex6khkzy2jh356tp@dcauzez4445x>
References: <20260415-msm-next-quad-pipe-split-v20-1-bc1fdf140b81@linaro.org>
 <177928444226.2567181.13284983255649878415.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177928444226.2567181.13284983255649878415.b4-ty@b4>
X-Authority-Analysis: v=2.4 cv=QptuG1yd c=1 sm=1 tr=0 ts=6a0df22e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8
 a=3dF5T0QglEsbpJvugt0A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE3MSBTYWx0ZWRfXwI2n2dSNAji/
 aRuEMdFeWbdT2ENKF4YriktASROHS9qif6Rey8PT7o5r8I3QjEC0/wmqhBiAycYTOG/DwWPbiu2
 /hMd/XjjRuqA0iBwXXeGXhlj5pTud8scS4ovo0fEaL5G+38Z1XW0hHGSdfy5h2yLrNXq+0Xtwuw
 Cco+kYt7uL0q3gzxqViMD6pM/xEbddFi6fLJF9NlZDa44SsFrwyOrK6+ORrAhoEm1sru+6+DIKZ
 dKO3eJkZ6h7C+xadyjxqo9C20CFCvi1iwkd2vd3XBEn24b1gl8BfmV8ZiJevBC68OpemZFmydGm
 Br4CPhBfCJA+GUgt8hlPf6jXY4XRwO9u3KewVJTj2iK9Xg01/oMNt8UdWgkb0u2PFvZn0/i3cRb
 rklLGcphBFeUJjrewvpxkrEQQxS1JDBfVJTvVHNdpOSX5Z4nC6HalQUtN8VB9tPhuYaJ9gGA0xp
 TyP/vaTSUu2DuvX/7kg==
X-Proofpoint-GUID: NiN3eUvtGLHsQcb-CBd_NWIM-l0rfawz
X-Proofpoint-ORIG-GUID: NiN3eUvtGLHsQcb-CBd_NWIM-l0rfawz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200171
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-108870-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,gitlab.freedesktop.org:url];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C6EE7599EFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 04:41:29PM +0300, Dmitry Baryshkov wrote:
> On Wed, 15 Apr 2026 11:15:11 +0800, Jun Nie wrote:
> > To support high-resolution cases that exceed the width constrain
> > or scenarios that surpass the maximum MDP clock rate, additional
> > pipes are necessary to enable parallel data processing within
> > the width constraints and MDP clock rate.
> > 
> > Expand pipe array size to 4. Request 4 mixers and 4 DSCs for
> > high-resolution cases where dual interfaces are enabled for virtual
> > plane case. More use cases can be incorporated later if quad-pipe
> > capabilities are required.
> > 
> > [...]
> 
> Applied to msm-next, thanks!
> 
> [1/1] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case
>       https://gitlab.freedesktop.org/lumag/msm/-/commit/218eb06a72bf

And I'm going to drop it again.

I tested on the SDM845, it tried enabling QUAD_PIPE for the follwing
mode, which then broke the display.

        mode: "3840x2160": 30 297000 3840 4016 4104 4400 2160 2168 2178 2250 0x40 0x5

-- 
With best wishes
Dmitry

