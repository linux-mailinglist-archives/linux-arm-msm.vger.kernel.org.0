Return-Path: <linux-arm-msm+bounces-117041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NILsNb4eTGpJggEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:31:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C1073715BAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:31:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=g9xRteVh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=brwcbMTg;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117041-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117041-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A91D302285F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 21:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5526D34F24C;
	Mon,  6 Jul 2026 21:31:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E9C389111
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 21:31:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783373499; cv=none; b=kC+o5r9bbKhX/cwd94Ko9QhgidUGWlJ3/VKfWc+71ca94GM7tgXV/Qzycltoh3H87ssw0I4dRMAAiGVeirvZd+rbeQS74BzMnuEAKXEDMP4ybLBmBypWd0iFyWUHRrwjdZUB43CKP2oiVnSAz9lO01Nr/Mpl1G8P7+dOUaUXLcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783373499; c=relaxed/simple;
	bh=+yJVUqDXTIZuke7dSFRZiIYi0J/L6lEfd/W1u6sYik0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGZAwsBUHK5MzpuveiHWIC5mjX2ackkxx0RewNq4Y4gWVDP+ffI/MbxY8s8MI7uCzgZ3DPwd2MYZSU49n9gFb0YPleePQb6g0SbBunAM8+lvjrWbpkUnC9WLQqSo1LpmHQofzvQeuPzTgYjggOyRw/FgB7p1VfJiE7q7d51VRRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g9xRteVh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brwcbMTg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEGZv1639679
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 21:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fzDGxXLJjspm8ID6JkaqhKtT
	kAtG0hD6KCQrkPkv4FQ=; b=g9xRteVhP5gefYbx3ff3+GVHkD5/NtiD8aFuBMmo
	LEvcsBjk7gLxGiEeBkNwuOxiiOUkedrQgK/jNGCTT8Qx/jKdOvE7Xb3acU3YafMq
	bJWF4WqKDd9ZtgDi9VlLEp/JtlO0xxZskJUD61UsCA/LzCawqqyrJbadehamQfhO
	ACULbQGHjRHrqnuIUhZjcPAn6C3bZZwwXQCINsSe7FIGkS92zjGhusCelovk8Yxm
	fGKCjq7+om8sGd39x9soMcEnV8RwKpjCysdN/UAlBLVv99omvKFvpQ6DkdoW8d43
	+nMvnk6KMg++WBqdAd0X+NpH4jWzhYoHiEJoJEmv/z0B4w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r2x30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:31:35 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9693cc255cfso3423374241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783373495; x=1783978295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fzDGxXLJjspm8ID6JkaqhKtTkAtG0hD6KCQrkPkv4FQ=;
        b=brwcbMTgvJimqo0Snnv4ZEmiagBgwDoCjn3KNoAOasNw/tAySTnJMc6STFhdLfo+ny
         o4XFYAai/5mdPgol9k46dmW1vcqVkdqA3HYYlwNDijTEVFr8kvbS4gzPm4EkJBwDoTps
         LfKGj+/D5TmMJI3AmHLdhTbA6wHhwMcLI/9ghODy7f718FIVy2s3JCe2FUoLGfG0E4fZ
         omU0XkjQEvpfqLhKYEiz10iM9Lc0Wu4t+VG/T4cCqTB1BSZqwGCdEe+mySYLQQUPiEoz
         DuFCL+anQKuQt73kN68fMbieyuLdIE09rquA2FGpsaX3liqnXAe3C9kz+P6mRTSYxt05
         /ZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783373495; x=1783978295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzDGxXLJjspm8ID6JkaqhKtTkAtG0hD6KCQrkPkv4FQ=;
        b=U5Rm06rc8qw7nPFHR11dlWkDJol/lm9Wqr7IY9Omv7Om6slzAltDFmOuD+9gDa4NXq
         nIZRsbUVEVAb3tu+Z5HvZ8NibU6FngzeTC0Mu2cXJZROa/SPXtaXgU0nXldyC0mz+kpw
         00CZIPmlNwZ195zA/qCljdH9kaB7klJE8I7Ix3HIZH47xj4295LZrcTkwC0JiSTf4L7j
         Xpltt7iDrhgmom+mWzZUb9+SsPfgMpky7wXTdEJKUVHcJ+q6d3lKpBahEZR1vSdDwlE2
         gu5PK3XJkykAlbv+KfrExGLaltYZOYwsiYKHSvcUTlyYTunQ05g2Dz8xOnredXDYSU+U
         YDXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7bKjmdIma306GuluNqve2RrSbisZZG1t/t4xrLXXfpkWucp0pfN54sd1bIV3Z9Mo3Ssbq/RHcqkW21xtY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu1MtEZdE95s7jTjqe+O12DGHrXT1wfkxGIN2lsvvrCd4NWrE3
	XQKtZIg2A08mV00hBbBbpS2PEKUH2PsFniLTblqFUF/9XH9t3yy/qN79hT0NlxCuADNBlwDU2Nh
	ikCAmheQjZDH5Pre6zH7CNyA3W2epDvovAlwXLdh4+I8v4fYpGD2txe6sZyFIonOhG/zn
X-Gm-Gg: AfdE7cnb+/tH1BV64sFKoZD25sOXPFvnX1teOm845EmsWfqTGLbEZKtTRpfqz5QhvAu
	60vijQSROJgVlYYrYvhyC7Ie8UmrXeR3LvWPcJSVjcTzdSQk6pO38iDGIy9LKDR+Ba9GoNSF+AA
	S7PfDL10JdnYo4nlkVlLruKIYlv3C3QO5T/gxtiOw+F/9gscODUip+0iv+4xSQjT7V7f69HMHVA
	l9UAzSilh+q6SieDnzx8Z7m4L88/CHnnnMEvTErlUK5Tez4cpBooGror6d7LgbuLwH8Bw/bC2sr
	AotXDewj2ifsAukaJGfzty4FLYEziLfKvFF3+WuSuS2Fwm7CrjSt4J2TuIfhNiZf+ypDtZrmV6P
	Vwmz9DdMyuy0kwZo8mkn1ZQlRelspvj35I4/n2pMwtrbhp08DCvR3P/qLuy28Aq4grbKOw/1Djy
	3GvFCVZ7SiDzFht2+z4jhjvvfb
X-Received: by 2002:a05:6102:598c:b0:744:a3fd:410a with SMTP id ada2fe7eead31-744b7d6e301mr1166759137.14.1783373495243;
        Mon, 06 Jul 2026 14:31:35 -0700 (PDT)
X-Received: by 2002:a05:6102:598c:b0:744:a3fd:410a with SMTP id ada2fe7eead31-744b7d6e301mr1166733137.14.1783373494851;
        Mon, 06 Jul 2026 14:31:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb868sm3149884e87.47.2026.07.06.14.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:31:32 -0700 (PDT)
Date: Tue, 7 Jul 2026 00:31:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/8] arm64: dts: qcom: kaanapali: Add QFPROM node
Message-ID: <w3cid5vezrofchq7nagu5pzasicagrzj432j3l4rt3ebc3slqw@gvtvxbkkplet>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-4-6ac53de56314@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-kaana-gpu-dt-v2-4-6ac53de56314@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxNyBTYWx0ZWRfX/91V407smkRo
 pDAgYvqzDYclXyz586RWesAW35jB5QQbmXPFIx9IQHElA8cUgruS7IpSFXEdi9obsvQbdeQm2o0
 UQxmut3N4rh+9XTiYeVD3s3GcEkXwQWzEyFeHYbi63OlTnWUaHM0lRyUX+Pgu06PX4IikWkA7NG
 6o+desK4uZP7KdiEwVR9DHdFm9+ewfh3fv4Co9FOBRzdgQbL/NwPyo+BRIXXAmJ5JpU48E+/LRo
 +eNmv3RJzio0Bt6NczCfdXIKeK/pdCCfV2CplD/kk36vvmAZWD0rQeqWW+l/J1tvrh+IjKcYLMR
 p/DG3MdMErolirkYK6sN64wVX/ME6NLT0dC6UY4YVbH1zPfTAjdbU6IYJYiZC8nThgOxtjx7QTl
 t8IDpWzaI1uyE3R4qs15lE4osR11M2SIN6nUul7AGbnvKUKQXm5L9HyI8i3jqi7Eqk6lsgg3n6r
 tMWWdEyP/LRubsao+Cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxNyBTYWx0ZWRfX0cT51aYDuDFx
 R3ldccrVzmBuCGszusAUMSzh235vC+xVIh+3wYVlUNDsxRt7GiJPudzQ015wopBO2DpBkVA82AX
 YQhm3n5JWmSZJQoydhtYYE0DkTKIp40=
X-Proofpoint-GUID: X8kuWpYEJBcYN-dZXA9lWZ1Iu05CBSZv
X-Proofpoint-ORIG-GUID: X8kuWpYEJBcYN-dZXA9lWZ1Iu05CBSZv
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c1eb7 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117041-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:jingyi.wang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch,poorly.run,lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gvtvxbkkplet:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1073715BAE

On Sun, Jul 05, 2026 at 01:30:08PM +0530, Akhil P Oommen wrote:
> From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> Add the QFPROM node and GPU related subnodes on Kaanapali SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

