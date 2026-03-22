Return-Path: <linux-arm-msm+bounces-99062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UxG7LigswGklEgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 18:51:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4692EA3ED
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 18:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E63B23004C06
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 17:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5EE36AB5E;
	Sun, 22 Mar 2026 17:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxCshyGI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kTYu8AOZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D3F2741C9
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 17:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774201892; cv=none; b=ccqLHXSCKzTPYb0gempYEY2X0PKvfHP8kIWSWlD2DP2FZbvsNkUb1hYMrTUGK8/ebo2/HA45NVTN2jGi1bmNDm0fdUpXBI9oV93x4gdBAr44b3YB/sh2Ew5H7uFkwrUFEuDPgTEOPDSfkt1K0pq/ON+xLBKU431aOHEBJp3chQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774201892; c=relaxed/simple;
	bh=BR6ks9C+tiIaqbWqbymHyezXUzSCeunWrVZAw4lzMaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKrXmLzKS4bJc3D8P0VUFmfXb8gm8nbkgSoHM8HO04yw1crC2rTKCHrx0Ml5s0g95ecwO4fG8diACQfjrZ6G39g8vh2bumOVcZRYu0aw6jht3VI20UTJ1bEnB/OEGweWX1xYZa8NLX5usuAK4gjklRLDXAlneKVTHOWd0q9jc58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxCshyGI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kTYu8AOZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MDkqw63558481
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 17:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gn3xvwDQZF6Nc0mtO8r4Mvv1
	J1b5vheHkTGYLDDSFG0=; b=hxCshyGIbFHwQ9WUACajdyhtH8ZOq3xfCoKcXJ70
	zLUbkfKOr9Gehqu7nq3fTdMsX2oKDWCxzCATCwhaSqao+4WdCqvnS/1gAU4Q1Suh
	KgYNYo3uUa+hEj60wP4SiuWz9/IVnfeHtgdC37MeC8cDPVhNg1Q3ht7EWIyV/e7T
	8rjQ52CFEaD1hp9rR08Azyok/S5bvtYyzYmvinOYLtkmH2i460xbXFlhSk66Pxme
	l7TbTvYp6zNMWZZODsiK59bKAr8h8paLF4vJQLVMUA4nvt9R5+2n0OVvc/oTxs6V
	Pq7F4tk/m9KGChZ+hF+b5hoRR5ZaiK8YpyxH3f51grGUqQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kj1jnvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 17:51:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b3544bc7bso30395181cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 10:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774201890; x=1774806690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gn3xvwDQZF6Nc0mtO8r4Mvv1J1b5vheHkTGYLDDSFG0=;
        b=kTYu8AOZjCBWqJNtasNqpsgR1YrKaPxl6g99nm7kHuoaGKgG+HTsWrBI4jOEaG+b7W
         wt8TonR33aX1gsstGSEKev8x9DsjOrGmxtCTY/BG3jF4fPFwzIkr2ZI3jPGgU8d9X6nm
         KJwOW6RbQsYPoHbPebyOXW/V3m6q1j4Zjln7IpBJ9/BwcVH9SKE9GV5P5A98BLSjQkdY
         u/aJKlwdEVHCLGDdlrfUJ1hKnvJDHE1HH+eC5OLENabVF3EbLVXQf6Z1EVGLP0G8Vo0r
         qVcfwRxyoTTGWqFYrN5qT10m835plL+r5QG0V9zOHY9YaWU5Qmsookc0Ygq/lnDjvDJ1
         Wv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774201890; x=1774806690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gn3xvwDQZF6Nc0mtO8r4Mvv1J1b5vheHkTGYLDDSFG0=;
        b=i40BMxfNBy4o6TcpnvQfsKcVuK3BFSA9J3ukek8aoKMko0I2hQhQ5ZyIGLY9mGJn2N
         fgGOBHMDCVpV/WPp55VzJOE62SuuF4+7qALjstloewjWFq+/F6isiKClxCSFWMK2hvaf
         uk+a3mZBKPR/9l5GS4c7erFE4Dm0s30zf8fjtw38xmgOM0BVdxjvSChMb2LviuoVYRFZ
         NpY0vYTP5CUHZO8TeL6CAacfJP8Eq9irV12UFQK8XUD+xRA19E4EVFebU6WIFGGGn+Yf
         wpNBGv3zL+zaxh5vx/iqW3m/MheNa0qEdhq097RXs4qPJQuiIvUDu7q0/Rjg/Bz+UnKB
         URJg==
X-Forwarded-Encrypted: i=1; AJvYcCWI+CE9yFuiWo0RhJSY9fEDEtXnq6r4qpEHZ7pBP3pYCLh5LPx0HAe4A7WVXrvB/hoGbHODwPW8SXvpjNa+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6//6WhSxDLl/kmfIrLxDWcDJgnueEDwoMuLeg3f0+m34BBvGz
	nrENLyOdO6v/I0h5W73ym2Wakf7qQmFV4ZDjdog4dLJCMzt9CrvqLsMXw3IMrbe2quh/76u14Xw
	GgERnGUKW0Pi4hILLfohO62n26uN4h73HzRc30SG9wzZRdp7wDKBGiXI438OT50kSK7aE
X-Gm-Gg: ATEYQzwHw/AcpomoZzJImxxhsv+9svpOuKHkgJnIms4gNn5JDMg6Bsh7PFlg9SffodY
	QEKyBxAA5sjd4qMqXhrwoSZnmRIO3YNjZPDuHtJg2ePjZGGRkGisRe8LX3PX/nA3pLm20ajjIx4
	bT4AeL8XeUQau+MGp3h3IZYh+TFmwWsE8D7ezCMb+gxa93ysva1BiTMmI2vX509xCx2eK4wimzM
	S8pVFRpJnrk+91/EgsqbFz0FuHh0BixBwxkZ4WH8UPgXi8EAbvy74nvFNsJygJZKFoT2P16rBYB
	JLH60XpDqsCbHpA1jTw2DWONdCkMDVKrmuJZjcwmYYfla0CrternEJXawiNWZQx5ZNPAm3X1Qwf
	9X2r3GP0m4JDcq58wTPpuZDwIC61+ohmQ++OIyWVqG2dHiothhwHN13hdezbG/c9l63Vh24h4Ll
	KnHsrPW89eDYO2K1Vg45k0Rq94WByaIaphzAU=
X-Received: by 2002:a05:622a:4:b0:50b:52ee:62b6 with SMTP id d75a77b69052e-50b52ee68f1mr46214061cf.38.1774201889682;
        Sun, 22 Mar 2026 10:51:29 -0700 (PDT)
X-Received: by 2002:a05:622a:4:b0:50b:52ee:62b6 with SMTP id d75a77b69052e-50b52ee68f1mr46213711cf.38.1774201889233;
        Sun, 22 Mar 2026 10:51:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530660asm1891911e87.71.2026.03.22.10.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 10:51:28 -0700 (PDT)
Date: Sun, 22 Mar 2026 19:51:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza: Add CX power domain to GCC
Message-ID: <hacarw76ftbkirg2ko4t4idpcyqouekodiqb7o2jf2ciscwfi7@egg33tcpahzp>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
X-Proofpoint-GUID: S8pad-H9ny8TRGumQwOE97GPv7Ov2uFG
X-Proofpoint-ORIG-GUID: S8pad-H9ny8TRGumQwOE97GPv7Ov2uFG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDE1NiBTYWx0ZWRfX8TJdY1tLInQQ
 b0k0FNqlZQeA0/eMGw2xsLJMn7HnGQqr+AZtDB7R8wDOP9CdST2OrJ0upoGsi8rHszPGgb2iYQo
 aliWrv4ufRV5ndBnFAca6YBM0SsmysB0Ymti3A0fhFJ61jZasIrkYjC7GbTz+ukzsEmjZNaJ6Gc
 TkUUZbEGnogzrwUiZ2gXl9yDdr8cG3FOPBnbKGy7WS3G8Y7Tq2fcEdPUAQdBmrnnDsVOJeOoZQk
 CTXtWjuXJTjDWg0VR5li0ZPLFnhfwoM8egRsb8qI52p3QaK6kHdLf5Ux2tKmn4dVSwugdILNrMJ
 zAzxXFKuwc+4TTSZcQITSOqtoNi6KtxS+DpvrR1vdHpsrxWcET39vVoPANQPJ+8TUB7m3WrAUSf
 x9Qo1+9dJXNxqcQr7zYBZnr/oyj/B7K6tzZdwisIgBDOy0yhu/3d8Xh9eT3eD3APhjckCkiMyf3
 dIxvZHRKewVm3d26xHg==
X-Authority-Analysis: v=2.4 cv=dYiNHHXe c=1 sm=1 tr=0 ts=69c02c22 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ac7HRrgMY6L2oGsqopwA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603220156
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99062-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1D4692EA3ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 06:08:20PM +0200, Abel Vesa wrote:
> Recent discussions off-list highlighted that the GCC should vote for the
> RPMh CX power domain on Qualcomm platforms. Without this, RPMh may not
> aggregate the correct load for the CX rail, potentially leading to voltage
> drops and system instability.

Should we add it on other platforms too?

> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

-- 
With best wishes
Dmitry

