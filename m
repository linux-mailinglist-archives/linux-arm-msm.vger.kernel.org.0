Return-Path: <linux-arm-msm+bounces-98011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COKeNaxRuGmKcAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:53:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DA829F55D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:53:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE2B93040326
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670843DFC9B;
	Mon, 16 Mar 2026 18:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUlS0TJT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O4742ow+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC373D5652
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773686828; cv=none; b=o+lUtnWCsBztNi4gOOG5vyDpPFyLMoVdV2enfxI3vXQOucDDyQ3ydpByYLLEg8+qchOMePrdLD87O+9BcrctBsi7+jI2qbXEzoN1axkR0ccfCIiX7xEcgG/YC5aB0LWi4YqzCjkuDGTmNUPXgskGrSvxBK6UBiY7m5mKh7fvAmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773686828; c=relaxed/simple;
	bh=Qzq7j0QMJnJCNuKWQBhsRPJx6ggaYy/5i3sltBnvWKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyiFBJaymiFFER87MovV1UK8BjwKVGaG2U/1e/2JGXjDSPI1FD9ZE9dbwcTdJoMvkIjNgA5MODJQU57eUGd1lnZoemvjtk1/iNWzf2OlZyjw7w3cXh/ijy3tWq8KDC4rRB0krWUXrYpCPjAadJR3ngDgp3CAsqNJTwNsTw2Ow8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUlS0TJT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O4742ow+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GDNmf1041516
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qOEgReXzTvhaS6rMXxCGq6xM9swa1SN2BOFYvDoil+Y=; b=EUlS0TJTpFzVvGmG
	/0usS7wqaBz6xhHJR/ZPeGOUdwaIRft9Ibr+G1l/El9BmgS3I7rswnJ/TWTR4+Md
	i0gUEC1c+f4Yt/Lqv7nO5BQwo3yepwHFvM19Bbof5t+JwixkNV93ZB/QvOyeNRK/
	1xHSgTUqGCt5ZrrG6VrriMFOnSIddIyzLixYPqiC0wvqokOwoHcvMvcBzdu9CMyJ
	F7JLw74aCFXQfIdeQeHuA2flg7o99yVjBSGiw4L3qghROYDmx0lfRkHVw9xmMFE5
	GVJ5oDx8Nj/JcuczUSX11sjrXzdZBeNSusDqmXyMlx02eIIq25wTjP6YUOaVe3ce
	dDCgDg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt82fe3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:47:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cdb995a1bfso3239445285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773686825; x=1774291625; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qOEgReXzTvhaS6rMXxCGq6xM9swa1SN2BOFYvDoil+Y=;
        b=O4742ow+vz5hH2G2nM3UwhG/f5sbRD5oCB+lF88PhXyOWkDAy7avPmGRpdISvsZ2nA
         CkuBqvc0b1IAC4ocdqacIXshyXazths0j7KrKbxtjpkHRWfEdgGdR/JAZrB7RM9H8zhv
         n0GCtWlKHAStSPl+TA5AVB+ud14FNXZZL4Y4BRq39loYNXo7LZD6s8nKBx15HI9dkraY
         nefoiBjcVGSU+jF7pQBDq4RQHkGOOfZ1k2zwPGJsAjFVZ4i1sGXdjf2OdWKoi+5wXjKI
         GDIjLWKsDUzei0Dfg4gXxePeh7PfbFZFIIrvTza7/ehC4xfVJ3Cl/BNIB6XdgX/bx7iD
         9wpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773686825; x=1774291625;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qOEgReXzTvhaS6rMXxCGq6xM9swa1SN2BOFYvDoil+Y=;
        b=sAKH3aUB9ngRRpeVWSFN040ftV8T170ihlrjXZZy3OXNy0Yhuf2GR41edUePwZETku
         rBQ+GVFE+RGdwMYWBgC+rG8ccZTIAF/lrvVRoqXNdJ9SfpvNREVtjWyJAiQaJf7QAlhQ
         sGw/I+CbN0tteHaPPoNJ8PQC+TinfcOt2n8B2EEnjZaNngf0cpOxs2bNIGtI0MStQpNg
         7OhH6o/VhuZ8A9Rq/heSpK8bewqfVLBbVAQPT7EG+lYktAEh3Z27IrJWV/T9ImMEUqoJ
         bP1D8ugYmk2TE2VJ5ohAXr/ZbkQrGxHtgpEK2L8VmG9LgcuuuEgtteFMinheE0nyDH1X
         wATQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcKIR1potuWl8FbHe2xxoJTXywR5GEKIAkhrYtZJx2G7e+Hn+Cb4lk2yjc/QWZ7co5IwfTh2Vdh4ivkvAj@vger.kernel.org
X-Gm-Message-State: AOJu0YwFiEiNj6gynI4MCg3JjgXcYzonjNzeIrYrh7z9V5tOTImnt43l
	I5tRfMJIjdVHIWeUDp6T3ll3lQYK850W57n4jVdMgeFuvGEVar/bI1HzJ+GXxBNfR4tCo8A+NqG
	9gssiYaS//gk4A/kSKUBJhdT5hCgs+WsdFKMUCzUxPc+fbi6B+IxIfXfVaeUjzCtnaqhs
X-Gm-Gg: ATEYQzyUlldcxViJIrlUgVCJ4tWsZiRHSnA51b5oOD5NdA/UZ0D9YTDe0g9iC+lxxVY
	/x1U/mPYQ3m0TC1WnWGcgYmMPzlvkLoayMdyqGOYBbZtv/EDFB2oGPvQcp1cNHUnIq3rVnK0x3a
	1vStYHIq/Ws/s2Z5fOHHyTERgD20VuzNVYldSOpTOLV+c+mxVY/6nR8jeF/pUr0HW2nvqGKYgPS
	7XkwTebXCJkqzKxh5AgnIDDJdtxhpNHJIZUjYQf6EhwkrQcX0CbrN4PWbs1s7HjAPKjXDYNEqRA
	mPXB63sBhVDyHKDgca7+6LVx8eADFDbAq+004EkYJD/+PNEqBVAcA3uzZbMEo4r6eqQJ+ou3nIE
	+7s+FXTB+FqJwK+HhCObYm9g6QuOcbyoR1oynU0pRqfRO+RO5uZ0ruqRwuv6j78snH9H2T/TdEy
	w1y6T4ozAhYjrfPnHYi1UXbE+r9inlMWzq5pY=
X-Received: by 2002:a05:620a:2549:b0:8cd:7cea:aea1 with SMTP id af79cd13be357-8cdb5a17bc4mr1785678785a.15.1773686825342;
        Mon, 16 Mar 2026 11:47:05 -0700 (PDT)
X-Received: by 2002:a05:620a:2549:b0:8cd:7cea:aea1 with SMTP id af79cd13be357-8cdb5a17bc4mr1785674185a.15.1773686824757;
        Mon, 16 Mar 2026 11:47:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d83f9dsm38000141fa.10.2026.03.16.11.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 11:47:03 -0700 (PDT)
Date: Mon, 16 Mar 2026 20:47:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] media: iris: add new rate control type MBR for
 encoder
Message-ID: <r23uskjcu2ui4hgviei5pyv2jlnz5bhuqdjavz2ipoenwbya4y@gijmbfreckzl>
References: <20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com>
 <20260213-b4-add_sc7280_mbr-v1-2-e8d95b4e4809@oss.qualcomm.com>
 <84895cad-9f1a-4e51-8e43-faf30b4bdabb@oss.qualcomm.com>
 <7f165169-427b-4f5b-9bee-bb227be23d82@oss.qualcomm.com>
 <69fea3d9214405996d2ecc50419e539e84f22a3a.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69fea3d9214405996d2ecc50419e539e84f22a3a.camel@ndufresne.ca>
X-Proofpoint-GUID: AAuKdcyHKsCwrvkkirOnUj7OBE_33eEV
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b8502a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=ZikaNk_W1E2w7MebnN0A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: AAuKdcyHKsCwrvkkirOnUj7OBE_33eEV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE0OSBTYWx0ZWRfX+kxM99gpMD+3
 nIuI5yzj6Zcl11lBb5MSxgJ/2CmUMgDdlFqW6X8dtzHoYvFyWFd74f4V0G+G9cVRREXznasw+0V
 +l9GKFHd/tHcBJ/X2ESeRz/nivJcvY45ZI/Db3NiqLGqMXYh8GCilDpstqXGMLYD3s7bDfZkXNx
 hR/Gsbe8ICUS1SkrFwZ+ZIvY4n1bvmxKo3fRM7p9/pl9+zao9N8yDtI0egZlhCV705Hk7bv1GfU
 jHRRAi9QE1WVSl9Fwi19zkcPw0Z2y/qjFp+s+MBDUnEvfp/OfJC0AYlLouMLGa1fTs1hB0Ystov
 LRnEk5ES1dhyu/aWcUgRdZvkqnoYArlTqjwh15KwyJNAKdohrW2X+Meeti896nQkWWxHW7gVrPx
 aVKLTNavRh1gzPUW0LM/GXzI0Di28JVUKknLG9hD4O3DLfH6gYxD1xbY9W3CpN8Ftjdhs8SaiTh
 +vzRvBic7YQUUsoSPzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160149
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
	TAGGED_FROM(0.00)[bounces-98011-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 56DA829F55D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 01:37:21PM -0400, Nicolas Dufresne wrote:
> Le lundi 16 mars 2026 à 11:52 +0530, Sachin Kumar Garg a écrit :
> > 
> > 
> > On 2/13/2026 3:24 PM, Konrad Dybcio wrote:
> > > On 2/13/26 7:04 AM, Sachin Kumar Garg wrote:
> > > > Introduce V4L2_MPEG_VIDEO_BITRATE_MODE_MBR rate control to Encoder.
> > > > Encoder will choose appropriate quantization parameter and
> > > > do the smart bit allocation to set the frame maximum bitrate
> > > > level as per the Bitrate value configured.
> > > > ---
> > > >   drivers/media/platform/qcom/iris/iris_ctrls.c      |   2 +
> > > >   .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
> > > >   .../media/platform/qcom/iris/iris_platform_gen1.c  |   9 +-
> > > >   .../platform/qcom/iris/iris_platform_sc7280.h      | 202
> > > > +++++++++++++++++++++
> > > 
> > > Is this really only available on 7280?
> > > 
> > > Konrad
> > 
> > Yes Konrad, in this series we enable V4L2_MPEG_VIDEO_BITRATE_MODE_MBR 
> > only for SC7280 because currently, we have added the support only for 
> > low tier chipset. MBR rate control aims to improve the compression 
> > efficiency of encoder for static and low motion scenes for extremely low 
> > bitrate use-case.
> 
> Without a spec definition, which constrained the implementations toward
> interoperability, this needs to be made vendor specific. That being said, even
> as vendor specific control, I think it deserves more documentation for your
> users.

What kind of documentation would be a better fit for keeping this in the
generic namespace? Frankly speaking, I think that the current
documentation is too vendor-specific, it describe the particular
algorithm, while the control seems to be more generic. However, I also
feel that defining it as "Maximum Bitrate" might not be specific enough
(nor would it show a difference from the CBR mode).


-- 
With best wishes
Dmitry

